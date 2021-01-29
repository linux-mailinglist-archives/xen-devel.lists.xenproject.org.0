Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C6030896B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 15:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78162.142068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5UKH-0007cH-Vn; Fri, 29 Jan 2021 14:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78162.142068; Fri, 29 Jan 2021 14:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5UKH-0007bs-SQ; Fri, 29 Jan 2021 14:00:41 +0000
Received: by outflank-mailman (input) for mailman id 78162;
 Fri, 29 Jan 2021 14:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WIj=HA=amazon.de=prvs=65673c61e=nmanthey@srs-us1.protection.inumbo.net>)
 id 1l5UKG-0007bn-Ra
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:00:40 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91e6b562-0f2e-4492-a8f6-caf0ecb4acb9;
 Fri, 29 Jan 2021 14:00:40 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 29 Jan 2021 14:00:33 +0000
Received: from EX13D02EUC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id ECCACC0829; Fri, 29 Jan 2021 14:00:31 +0000 (UTC)
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D02EUC001.ant.amazon.com (10.43.164.92) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 29 Jan 2021 14:00:30 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.213.24) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 29 Jan 2021 14:00:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 91e6b562-0f2e-4492-a8f6-caf0ecb4acb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1611928840; x=1643464840;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=zGmG7rG65qh/syOK6SrNKiWQCyTboe4a0KLQqkTJ4Gs=;
  b=XzwlJvSvoSvlUcHc27rNhsUCoWf4UPCQw5dJCae7WM9z43ze5GnJYcQ7
   r3YL2jSYxn/dbGC70jSPELhaN77VWdZTOseyleGf+vJYUjKxg2IVR07/Q
   Nku8ISeQguN94x+xYth2L9dlOGmNAsGeHXb+75gdqMXPdapirxQxMQnAy
   Y=;
X-IronPort-AV: E=Sophos;i="5.79,385,1602547200"; 
   d="scan'208";a="78266441"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Norbert Manthey
	<nmanthey@amazon.de>
Subject: [PATCH HVM v1 1/1] hvm: refactor set param
Date: Fri, 29 Jan 2021 14:59:50 +0100
Message-ID: <20210129135950.32095-1-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

To prevent leaking HVM params via L1TF and similar issues on a
hyperthread pair, let's load values of domains as late as possible.

Furthermore, speculative barriers are re-arranged to make sure we do not
allow guests running on co-located VCPUs to leak hvm parameter values of
other domains.

This is part of the speculative hardening effort.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reported-by: Hongyan Xia <hongyxia@amazon.co.uk>

---
 xen/arch/x86/hvm/hvm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4060,7 +4060,7 @@ static int hvm_allow_set_param(struct domain *d,
                                uint32_t index,
                                uint64_t new_value)
 {
-    uint64_t value = d->arch.hvm.params[index];
+    uint64_t value;
     int rc;
 
     rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_set_param);
@@ -4108,6 +4108,13 @@ static int hvm_allow_set_param(struct domain *d,
     if ( rc )
         return rc;
 
+    if ( index >= HVM_NR_PARAMS )
+        return -EINVAL;
+
+    /* Make sure we evaluate permissions before loading data of domains. */
+    block_speculation();
+
+    value = d->arch.hvm_domain.params[index];
     switch ( index )
     {
     /* The following parameters should only be changed once. */
@@ -4388,6 +4395,10 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
     if ( rc )
         return rc;
 
+    /* Make sure the index bound check in hvm_get_param is respected, as well as
+       the above domain permissions. */
+    block_speculation();
+
     switch ( index )
     {
     case HVM_PARAM_ACPI_S_STATE:
@@ -4428,9 +4439,6 @@ static int hvmop_get_param(
     if ( a.index >= HVM_NR_PARAMS )
         return -EINVAL;
 
-    /* Make sure the above bound check is not bypassed during speculation. */
-    block_speculation();
-
     d = rcu_lock_domain_by_any_id(a.domid);
     if ( d == NULL )
         return -ESRCH;
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




