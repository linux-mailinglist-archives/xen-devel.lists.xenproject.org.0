Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C728DF28
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 12:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6527.17430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeFH-0004AE-BT; Wed, 14 Oct 2020 10:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6527.17430; Wed, 14 Oct 2020 10:42:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeFH-00049n-83; Wed, 14 Oct 2020 10:42:59 +0000
Received: by outflank-mailman (input) for mailman id 6527;
 Wed, 14 Oct 2020 10:42:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSeFF-00048h-IK
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:42:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f6a0da1-2f6b-4cdf-87e6-5ab004594f8c;
 Wed, 14 Oct 2020 10:42:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E6C2ACDB;
 Wed, 14 Oct 2020 10:42:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSeFF-00048h-IK
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:42:57 +0000
X-Inumbo-ID: 9f6a0da1-2f6b-4cdf-87e6-5ab004594f8c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9f6a0da1-2f6b-4cdf-87e6-5ab004594f8c;
	Wed, 14 Oct 2020 10:42:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602672176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GKitqh2GXUK2H77YhdL4MLcrHgQv70vW5uQkhiCEro=;
	b=mDwuiKBum9y3/EzdWK472TyufrXaCbvtJg4bp73d2uny/EjE9UEFZ0CxxXWu7FhUI8HlBV
	fI+JM8hs8OF1Crb2RSwL/9CEQ1NM3MsSts5oZjZWAo8Cvg+/sBy9s3phdZeB91pR9/3hHw
	mM81Bvdr2n3Zlr42Xx2gmrNTW0sAocQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1E6C2ACDB;
	Wed, 14 Oct 2020 10:42:56 +0000 (UTC)
Subject: [PATCH 2/2] EFI: further "need_to_free" adjustments
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Trammell Hudson <hudson@trmm.net>
References: <dd26ba44-66e4-8870-3359-efe93ab28f64@suse.com>
Message-ID: <a0e76e78-1f66-9825-b35b-86caed7da961@suse.com>
Date: Wed, 14 Oct 2020 12:42:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <dd26ba44-66e4-8870-3359-efe93ab28f64@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When processing "chain" directives, the previously loaded config file
gets freed. This needs to be recorded accordingly such that no error
path would try to free the same block of memory a 2nd time.

Furthermore, neither .addr nor .size being zero has any meaning towards
the need to free an allocated chunk anymore. Drop (from read_file()) and
replace (in Arm's efi_arch_use_config_file(), to sensibly retain the
comment) respective assignments.

Fixes: 04be2c3a0678 ("efi/boot.c: add file.need_to_free")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -591,7 +591,7 @@ static bool __init efi_arch_use_config_f
 
     fdt = lookup_fdt_config_table(SystemTable);
     dtbfile.ptr = fdt;
-    dtbfile.size = 0;  /* Config table memory can't be freed, so set size to 0 */
+    dtbfile.need_to_free = false; /* Config table memory can't be freed. */
     if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") < 0 )
     {
         /*
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -601,10 +601,7 @@ static bool __init read_file(EFI_FILE_HA
                                     PFN_UP(size), &file->addr);
     }
     if ( EFI_ERROR(ret) )
-    {
-        file->addr = 0;
         what = what ?: L"Allocation";
-    }
     else
     {
         file->need_to_free = true;
@@ -1271,8 +1268,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
             name.s = get_value(&cfg, "global", "chain");
             if ( !name.s )
                 break;
-            efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-            cfg.addr = 0;
+            if ( cfg.need_to_free )
+            {
+                efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
+                cfg.need_to_free = false;
+            }
             if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
             {
                 PrintStr(L"Chained configuration file '");


