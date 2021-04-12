Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFA635C568
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109017.208081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVusn-0005V6-OS; Mon, 12 Apr 2021 11:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109017.208081; Mon, 12 Apr 2021 11:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVusn-0005Uh-LL; Mon, 12 Apr 2021 11:37:33 +0000
Received: by outflank-mailman (input) for mailman id 109017;
 Mon, 12 Apr 2021 11:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVusm-0005Uc-Ng
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:37:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e42b1e4-8b5a-45c0-8f56-7b21072b6ecd;
 Mon, 12 Apr 2021 11:37:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72995AF2F;
 Mon, 12 Apr 2021 11:37:31 +0000 (UTC)
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
X-Inumbo-ID: 0e42b1e4-8b5a-45c0-8f56-7b21072b6ecd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618227451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IX6RRP5b/qgSJINcUgTWUholGX3YmFpWNVds1OMgT9c=;
	b=mEVmucfydTbhc75Bg5XqwJqQ1SFwEy1DY3Bm5/dveJBxszxo/vJXf+cCJIkHupvzDr9eRc
	jPF+/geBzXJ93VIatT+aH66Wsg2sWWWqNKkXPGVCoStJzyNcoGZsJEkOc4HYkyiRvkYWwX
	khl+r/j2cALOmIcvpcwkrudcO3L6j/0=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: move is_s3_suspended field
Message-ID: <abc3c680-314d-85fb-8744-930fa5f7f95e@suse.com>
Date: Mon, 12 Apr 2021 13:37:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Put it next to another boolean, so they will "share" the subsequent
padding hole.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -113,15 +113,15 @@ struct hvm_domain {
      * mtrr/pat between vcpus is not the same, set is_in_uc_mode
      */
     spinlock_t             uc_lock;
-    bool_t                 is_in_uc_mode;
+    bool                   is_in_uc_mode;
+
+    bool                   is_s3_suspended;
 
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
     struct viridian_domain *viridian;
 
-    bool_t                 is_s3_suspended;
-
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
      * Used during initialization and save/restore.

