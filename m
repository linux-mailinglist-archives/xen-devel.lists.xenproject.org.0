Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07B3512A4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104237.199137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRttr-0004qa-Nm; Thu, 01 Apr 2021 09:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104237.199137; Thu, 01 Apr 2021 09:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRttr-0004qA-Kc; Thu, 01 Apr 2021 09:46:03 +0000
Received: by outflank-mailman (input) for mailman id 104237;
 Thu, 01 Apr 2021 09:46:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRttq-0004pv-8H
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:46:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07af8a97-5e05-44aa-8f35-8a8b086b82e3;
 Thu, 01 Apr 2021 09:46:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBB9FAEB6;
 Thu,  1 Apr 2021 09:46:00 +0000 (UTC)
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
X-Inumbo-ID: 07af8a97-5e05-44aa-8f35-8a8b086b82e3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw1kb41OPZcRbU+DKLj0F67252xeEtyBQIm85C/nQy0=;
	b=G9I0SyuKAvHYvcionj9PHoTEsg5cT12638o2mJHraetOulmhy92uf9M3s2SS6EGY1EOu3/
	JgN00BRJrlCtxgFlWgatXv5m4KFUTSniFS151jC/nnIHGPXhlOx+aXJJcDCKvlhfemE9nY
	LY1tGzynz+Rv5PCBEZUAzhusjvm5mRY=
Subject: [PATCH 5/8] x86: drop use of prelink-efi.o
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Message-ID: <ea4fd135-fe9a-ecea-c03f-0b518b800d4b@suse.com>
Date: Thu, 1 Apr 2021 11:46:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Now that its contents matches prelink.o, use that one uniformly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -142,18 +142,12 @@ prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
 # Link it with all the binary objects
 prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
 	$(call if_changed,ld)
-
-prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
-	$(call if_changed,ld)
 else
 prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
 	$(call if_changed,ld)
-
-prelink-efi.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
-	$(call if_changed,ld)
 endif
 
-targets += prelink.o prelink-efi.o
+targets += prelink.o
 
 $(TARGET)-syms: prelink.o xen.lds
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
@@ -214,7 +208,7 @@ endif
 note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
-$(TARGET).efi: prelink-efi.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
+$(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< efi/relocs-dummy.o \
 	                $(BASEDIR)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :


