Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1ED31F5AB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 09:10:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86795.163193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD0rG-0005ce-46; Fri, 19 Feb 2021 08:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86795.163193; Fri, 19 Feb 2021 08:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD0rG-0005cF-0S; Fri, 19 Feb 2021 08:09:50 +0000
Received: by outflank-mailman (input) for mailman id 86795;
 Fri, 19 Feb 2021 08:09:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD0rF-0005br-96
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 08:09:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c365cdf-9d6c-4e2d-a2ad-dfde9c35b33d;
 Fri, 19 Feb 2021 08:09:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AEACAC69;
 Fri, 19 Feb 2021 08:09:47 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2c365cdf-9d6c-4e2d-a2ad-dfde9c35b33d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613722187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Mj267HPvJ4mQpGRW6TYWARtkHTN06xccO011IR9F90=;
	b=HeQ2c+LNm5BbukyHw5AP3xGAfsdLZ4hXalf38/rYH8QK+Aly1KUufg1xbkSCCxwqHDVJTl
	fPIW+k86eDCVQ7fe41/1qF/axBJcOz8ixxQQ6rQra8qEMBX1MUv1esdtINF+UKWWF9lX4O
	L/JL+uFNr6HQWOSBjf3PFaeiVJ5gSr4=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EFI: suppress GNU ld 2.36'es creation of base relocs
Message-ID: <6ce5b1a7-d7c2-c30c-ad78-233379ea130b@suse.com>
Date: Fri, 19 Feb 2021 09:09:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All of the sudden ld creates base relocations itself, for PE
executables - as a result we now have two of them for every entity to
be relocated. While we will likely want to use this down the road, it
doesn't work quite right yet in corner cases, so rather than suppressing
our own way of creating the relocations we need to tell ld to avoid
doing so.

Probe whether --disable-reloc-section (which was introduced by the same
commit making relocation generation the default) is recognized by ld's PE
emulation, and use the option if so. (To limit redundancy, move the first
part of setting EFI_LDFLAGS earlier, and use it already while probing.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -123,8 +123,13 @@ ifneq ($(efi-y),)
 # Check if the compiler supports the MS ABI.
 export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 # Check if the linker supports PE.
-XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -S -o efi/check.efi efi/check.o 2>/dev/null && echo y))
+EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10 --strip-debug
+XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) $(EFI_LDFLAGS) -o efi/check.efi efi/check.o 2>/dev/null && echo y))
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
+# Check if the linker produces fixups in PE by default (we need to disable it doing so for now).
+XEN_NO_PE_FIXUPS := $(if $(XEN_BUILD_EFI), \
+                         $(shell $(LD) $(EFI_LDFLAGS) --disable-reloc-section -o efi/check.efi efi/check.o 2>/dev/null && \
+                                 echo --disable-reloc-section))
 endif
 
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
@@ -177,8 +182,7 @@ note.o: $(TARGET)-syms
 		--rename-section=.data=.note.gnu.build-id -S $@.bin $@
 	rm -f $@.bin
 
-EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
-EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0 --strip-debug
+EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0 $(XEN_NO_PE_FIXUPS)
 EFI_LDFLAGS += --section-alignment=0x200000 --file-alignment=0x20
 EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
 EFI_LDFLAGS += --minor-image-version=$(XEN_SUBVERSION)

