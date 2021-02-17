Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086EF31D7A9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 11:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86204.161622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKLp-0000JH-Of; Wed, 17 Feb 2021 10:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86204.161622; Wed, 17 Feb 2021 10:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKLp-0000Il-KE; Wed, 17 Feb 2021 10:46:33 +0000
Received: by outflank-mailman (input) for mailman id 86204;
 Wed, 17 Feb 2021 10:46:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCKLn-0000Ie-UB
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 10:46:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d84df09-bc85-4edf-a52d-801e5272fe32;
 Wed, 17 Feb 2021 10:46:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45E22B1AB;
 Wed, 17 Feb 2021 10:46:30 +0000 (UTC)
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
X-Inumbo-ID: 9d84df09-bc85-4edf-a52d-801e5272fe32
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613558790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VudHzvHkbrWxXAQT3YkDMWmcJ5pINo+1wlM1FgK45WU=;
	b=XFf2PzRUoaBtA3RmlfcRvSi0PQbmgi3lL7ZdHaV/xzen1zkf8LJh+ir+L4pcwjyNfisEBj
	hy+zaBbbBt+ZIxBst9hdcFFbRZgFnxiKYJ5Zu0eBueBlFGNY8jd0j6/+OdRAz++VBMi42u
	JjRzZKA+e8B4zFzVjp6hcenZyWZ+rkk=
Subject: [PATCH 2/3] gnttab: bypass IOMMU (un)mapping when a domain is
 (un)mapping its own grant
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
Message-ID: <5bb4fba7-a10b-90c4-82f7-8cde6e8cacfb@suse.com>
Date: Wed, 17 Feb 2021 11:46:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Mappings for a domain's own pages should already be present in the
IOMMU. While installing the same mapping again is merely redundant (and
inefficient), removing the mapping when the grant mapping gets removed
is outright wrong in this case: The mapping was there before the map, so
should remain in place after unmapping.

This affects
- Arm Dom0 in the direct mapped case,
- x86 PV Dom0 in the "iommu=dom0-strict" / "dom0-iommu=strict" cases,
- all x86 PV DomU-s, including driver domains.

Reported-by: Rahul Singh <Rahul.Singh@arm.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1243,7 +1243,7 @@ map_grant_ref(
         goto undo_out;
     }
 
-    need_iommu = gnttab_need_iommu_mapping(ld);
+    need_iommu = ld != rd && gnttab_need_iommu_mapping(ld);
     if ( need_iommu )
     {
         unsigned int kind;
@@ -1493,7 +1493,7 @@ unmap_common(
     if ( put_handle )
         put_maptrack_handle(lgt, op->handle);
 
-    if ( rc == GNTST_okay && gnttab_need_iommu_mapping(ld) )
+    if ( rc == GNTST_okay && ld != rd && gnttab_need_iommu_mapping(ld) )
     {
         unsigned int kind;
         int err = 0;


