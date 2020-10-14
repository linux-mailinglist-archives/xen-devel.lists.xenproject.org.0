Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACAD28DF26
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 12:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6526.17418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeF1-000430-32; Wed, 14 Oct 2020 10:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6526.17418; Wed, 14 Oct 2020 10:42:43 +0000
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
	id 1kSeF0-00042c-Vt; Wed, 14 Oct 2020 10:42:42 +0000
Received: by outflank-mailman (input) for mailman id 6526;
 Wed, 14 Oct 2020 10:42:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSeEz-00042L-7A
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:42:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c2bc5c7-2e50-43ec-befb-61b9dfb05aff;
 Wed, 14 Oct 2020 10:42:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99CA9ACDB;
 Wed, 14 Oct 2020 10:42:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSeEz-00042L-7A
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:42:41 +0000
X-Inumbo-ID: 5c2bc5c7-2e50-43ec-befb-61b9dfb05aff
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c2bc5c7-2e50-43ec-befb-61b9dfb05aff;
	Wed, 14 Oct 2020 10:42:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602672159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRFa41oy/MRRj2d9XP66ZGeYSOCcmqsShFbW/d6kw5E=;
	b=T2Zl1OL0dUnVlGcZDrduV1LWkqSqOSDqUwT8bX0CZ306OOTdhESZ9rguLj05wHd2IHEYSw
	livzStP6TC4GvuH/kLpkC3YLEYjv0JspPVENPg+BA/l7X2uFn7crD/Bw1BlmOTSdBkfidb
	rdGqK80jWks1u3y7WoJg9CfuPHxaPOo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 99CA9ACDB;
	Wed, 14 Oct 2020 10:42:39 +0000 (UTC)
Subject: [PATCH 1/2] EFI/Arm64: don't clobber DTB pointer
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Trammell Hudson <hudson@trmm.net>
References: <dd26ba44-66e4-8870-3359-efe93ab28f64@suse.com>
Message-ID: <825ded00-3971-4e56-7bef-324ee5531f70@suse.com>
Date: Wed, 14 Oct 2020 12:42:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <dd26ba44-66e4-8870-3359-efe93ab28f64@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

read_section() needs to be more careful: efi_arch_use_config_file()
may have found a DTB file (but without modules), and there may be no DTB
specified in the EFI config file. In this case the pointer to the blob
must not be overwritten with NULL when no ".dtb" section is present
either.

Fixes: 8a71d50ed40b ("efi: Enable booting unified hypervisor/kernel/initrd images")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -637,11 +637,14 @@ static bool __init read_section(const EF
                                 const CHAR16 *name, struct file *file,
                                 const char *options)
 {
-    file->ptr = pe_find_section(image->ImageBase, image->ImageSize,
-                                name, &file->size);
-    if ( !file->ptr )
+    const void *ptr = pe_find_section(image->ImageBase, image->ImageSize,
+                                      name, &file->size);
+
+    if ( !ptr )
         return false;
 
+    file->ptr = ptr;
+
     handle_file_info(name, file, options);
 
     return true;


