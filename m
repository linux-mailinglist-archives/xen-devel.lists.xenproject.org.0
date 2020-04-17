Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91631ADA75
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNfc-0000LT-LL; Fri, 17 Apr 2020 09:52:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lM+k=6B=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jPNfb-0000LM-40
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:52:23 +0000
X-Inumbo-ID: 226fb0b0-8091-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 226fb0b0-8091-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7I49opomVxvB6V8PzhNVtuuo+Ifnpql27GLDjPB32Kw=; b=U/vQRxFirIgOsjhpUeE1YKAn/1
 ioly0B4M83S0EK0PELN1eGIbRSPaod2Z1wJwZzJvz4kK+YGbQGqQ/dmAUfaydE8dBlSU3HiS2UW7S
 nBlomGh2Ejn/9aVTANwypSQcq2bKlplr6hG/Vl6S8f1o7Wo/wazxJ0ri8nM7jf2wDYz4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfa-0002fp-2R; Fri, 17 Apr 2020 09:52:22 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfZ-000304-Os; Fri, 17 Apr 2020 09:52:22 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/6] x86_64/mm: map and unmap page tables in subarch_memory_op
Date: Fri, 17 Apr 2020 10:52:05 +0100
Message-Id: <1c88c785eb9537983a1692cc379604233ff13025.1587116799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587116799.git.hongyxia@amazon.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587116799.git.hongyxia@amazon.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/x86_64/mm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 5714e5ba62..6d52183559 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -932,13 +932,13 @@ long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
               (v < (unsigned long)(machine_to_phys_mapping + max_page));
               i++, v += 1UL << L2_PAGETABLE_SHIFT )
         {
-            l3e = l4e_to_l3e(idle_pg_table[l4_table_offset(v)])[
-                l3_table_offset(v)];
+            l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(v)],
+                               l3_table_offset(v));
             if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) )
                 mfn = last_mfn;
             else if ( !(l3e_get_flags(l3e) & _PAGE_PSE) )
             {
-                l2e = l3e_to_l2e(l3e)[l2_table_offset(v)];
+                l2e = l2e_from_l3e(l3e, l2_table_offset(v));
                 if ( l2e_get_flags(l2e) & _PAGE_PRESENT )
                     mfn = l2e_get_pfn(l2e);
                 else
-- 
2.24.1.AMZN


