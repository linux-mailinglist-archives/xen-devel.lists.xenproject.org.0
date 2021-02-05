Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599CC3112A7
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 21:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81933.151524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l87t3-0007gN-Ci; Fri, 05 Feb 2021 20:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81933.151524; Fri, 05 Feb 2021 20:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l87t3-0007fy-9L; Fri, 05 Feb 2021 20:39:29 +0000
Received: by outflank-mailman (input) for mailman id 81933;
 Fri, 05 Feb 2021 20:39:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ARPF=HH=amazon.de=prvs=663df6f7c=nmanthey@srs-us1.protection.inumbo.net>)
 id 1l87t2-0007ft-2r
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 20:39:28 +0000
Received: from smtp-fw-9103.amazon.com (unknown [207.171.188.200])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99b05317-1d8e-43d3-a5e4-ba2e0c5463b2;
 Fri, 05 Feb 2021 20:39:26 +0000 (UTC)
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP;
 05 Feb 2021 20:39:18 +0000
Received: from EX13D02EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id F12C6C0843; Fri,  5 Feb 2021 20:39:16 +0000 (UTC)
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D02EUC004.ant.amazon.com (10.43.164.117) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 5 Feb 2021 20:39:15 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.32) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 5 Feb 2021 20:39:12 +0000
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
X-Inumbo-ID: 99b05317-1d8e-43d3-a5e4-ba2e0c5463b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1612557566; x=1644093566;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=VRWb4eKyRdPK6Oy3AAebSqsCZ19CyjABZhutg30XesA=;
  b=PPOZ9XW8gD51Do9wlU/nlQWF9m0pmlrv5v/+3LJLq3jBSoGbyLqIwZw2
   zboyB19yYSZNDkpIRcjMSlpfxUjzPy4D7w81A3MNNpvAkMVxXqVuNL1Xp
   MMMJRMarBJU1rnEDtMpP4AheHFA1d+ObXxtpvlw7vzJMFuaipIqpxL2Dl
   c=;
X-IronPort-AV: E=Sophos;i="5.81,156,1610409600"; 
   d="scan'208";a="915977907"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Norbert Manthey
	<nmanthey@amazon.de>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH HVM v2 1/1] hvm: refactor set param
Date: Fri, 5 Feb 2021 21:39:05 +0100
Message-ID: <20210205203905.8824-1-nmanthey@amazon.de>
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
v2: Add another speculative blocker, which protects the return code check
    of the function hvm_allow_set_param.


 xen/arch/x86/hvm/hvm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

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
+    value = d->arch.hvm.params[index];
     switch ( index )
     {
     /* The following parameters should only be changed once. */
@@ -4141,6 +4148,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
     if ( rc )
         return rc;
 
+    /* Make sure we evaluate permissions before loading data of domains. */
+    block_speculation();
+
     switch ( index )
     {
     case HVM_PARAM_CALLBACK_IRQ:
@@ -4388,6 +4398,10 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
     if ( rc )
         return rc;
 
+    /* Make sure the index bound check in hvm_get_param is respected, as well as
+       the above domain permissions. */
+    block_speculation();
+
     switch ( index )
     {
     case HVM_PARAM_ACPI_S_STATE:
@@ -4428,9 +4442,6 @@ static int hvmop_get_param(
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




