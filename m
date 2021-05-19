Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491663892FA
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 17:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130217.244057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOS9-0001se-DY; Wed, 19 May 2021 15:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130217.244057; Wed, 19 May 2021 15:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOS9-0001ql-9v; Wed, 19 May 2021 15:49:45 +0000
Received: by outflank-mailman (input) for mailman id 130217;
 Wed, 19 May 2021 15:49:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljOS7-0001qY-9w
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 15:49:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0d02537-fffe-4c21-8b53-a65bf72ca2ff;
 Wed, 19 May 2021 15:49:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76C3FABB1;
 Wed, 19 May 2021 15:49:41 +0000 (UTC)
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
X-Inumbo-ID: d0d02537-fffe-4c21-8b53-a65bf72ca2ff
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621439381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=81zFPIuhUnEJqIsltZDYP1MSh2QxuDgB2YkRgK/qc6s=;
	b=b9yEdtU65m4bFJl0T0djMMSByCq+XrdYdzFRffdM6xo5QVCAZ/HP6WY/+sRK8nFHlJVlMx
	BwcRJV8IX8BFQld17X+41lwpMS/Bnb2P97FmMEb/fdtrSbWmTh90s9v3faLQzy0IhOREoG
	d6Brn74wXNg7nuroVS/FaHYv+QFCJDA=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/tboot: adjust UUID check
Message-ID: <422e39c9-0cba-0944-b813-dfe2578ad719@suse.com>
Date: Wed, 19 May 2021 17:49:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Replace a bogus cast, move the static variable into the only function
using it, and add __initconst. While there, also remove a pointless NULL
check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -27,8 +27,6 @@ static vmac_t domain_mac;     /* MAC for
 static vmac_t xenheap_mac;    /* MAC for xen heap during S3 */
 static vmac_t frametable_mac; /* MAC for frame table during S3 */
 
-static const uuid_t tboot_shared_uuid = TBOOT_SHARED_UUID;
-
 /* used by tboot_protect_mem_regions() and/or tboot_parse_dmar_table() */
 static uint64_t __initdata txt_heap_base, __initdata txt_heap_size;
 static uint64_t __initdata sinit_base, __initdata sinit_size;
@@ -93,6 +91,7 @@ static void __init tboot_copy_memory(uns
 void __init tboot_probe(void)
 {
     tboot_shared_t *tboot_shared;
+    static const uuid_t __initconst tboot_shared_uuid = TBOOT_SHARED_UUID;
 
     /* Look for valid page-aligned address for shared page. */
     if ( !opt_tboot_pa || (opt_tboot_pa & ~PAGE_MASK) )
@@ -101,9 +100,7 @@ void __init tboot_probe(void)
     /* Map and check for tboot UUID. */
     set_fixmap(FIX_TBOOT_SHARED_BASE, opt_tboot_pa);
     tboot_shared = fix_to_virt(FIX_TBOOT_SHARED_BASE);
-    if ( tboot_shared == NULL )
-        return;
-    if ( memcmp(&tboot_shared_uuid, (uuid_t *)tboot_shared, sizeof(uuid_t)) )
+    if ( memcmp(&tboot_shared_uuid, &tboot_shared->uuid, sizeof(uuid_t)) )
         return;
 
     /* new tboot_shared (w/ GAS support, integrity, etc.) is not backwards

