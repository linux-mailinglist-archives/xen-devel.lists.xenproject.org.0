Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCF8220A2D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:37:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvenI-0000yY-GY; Wed, 15 Jul 2020 10:37:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvenH-0000yS-Oc
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:37:43 +0000
X-Inumbo-ID: 369e6d10-c687-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 369e6d10-c687-11ea-8496-bc764e2007e4;
 Wed, 15 Jul 2020 10:37:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98506B1F7;
 Wed, 15 Jul 2020 10:37:45 +0000 (UTC)
Subject: [PATCH 2/8] x86: don't build with EFI support in shim-exclusive mode
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Message-ID: <3354347f-b931-2a33-48b8-51eabf654ca2@suse.com>
Date: Wed, 15 Jul 2020 12:37:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There's no need for xen.efi at all, and there's also no need for EFI
support in xen.gz since the shim runs in PVH mode, i.e. without any
firmware (and hence by implication also without EFI one).

The slightly odd looking use of $(space) is to ensure the new ifneq()
evaluates consistently between "build" and "install" invocations of
make.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There are further anomalies associated with the need to use $(space)
here:
- xen.efi rebuilding gets suppressed when installing (typically as
  root) from a non-root-owned tree. I think we should similarly suppress
  re-building of xen.gz as well in this case, as tool chains available
  may vary (and hence a partial or full re-build may mistakenly occur).
- xen.lds (re-)generation has a dependency issue: The value of
  XEN_BUILD_EFI changing between builds (like would happen on a pre-
  built tree with a shim-exclusive config, on which then this patch
  would be applied) does not cause it to be re-built. Anthony's
  switching to Linux'es build system will address this afaict, so I
  didn't see a need to supply a separate patch.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -80,7 +80,9 @@ x86_emulate.o: x86_emulate/x86_emulate.c
 
 efi-y := $(shell if [ ! -r $(BASEDIR)/include/xen/compile.h -o \
                       -O $(BASEDIR)/include/xen/compile.h ]; then \
-                         echo '$(TARGET).efi'; fi)
+                         echo '$(TARGET).efi'; fi) \
+         $(space)
+efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
 
 ifneq ($(build_id_linker),)
 notes_phdrs = --notes
@@ -113,11 +115,13 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/
 		{ echo "No Multiboot2 header found" >&2; false; }
 	mv $(TMP) $(TARGET)
 
+ifneq ($(efi-y),)
 # Check if the compiler supports the MS ABI.
 export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 # Check if the linker supports PE.
 XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o 2>/dev/null && echo y))
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
+endif
 
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
 EFI_OBJS-$(XEN_BUILD_EFI) := efi/relocs-dummy.o


