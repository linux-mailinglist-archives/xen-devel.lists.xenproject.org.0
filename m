Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E4313FC7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 21:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83049.153786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Cik-0001jO-SE; Mon, 08 Feb 2021 20:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83049.153786; Mon, 08 Feb 2021 20:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Cik-0001iz-P9; Mon, 08 Feb 2021 20:01:18 +0000
Received: by outflank-mailman (input) for mailman id 83049;
 Mon, 08 Feb 2021 20:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/EF1=HK=amazon.de=prvs=666814ed0=nmanthey@srs-us1.protection.inumbo.net>)
 id 1l9Cii-0001iu-Uf
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 20:01:16 +0000
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 628e4e96-ccc8-440d-8332-a90fae3f0d76;
 Mon, 08 Feb 2021 20:01:14 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 08 Feb 2021 20:01:08 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0DD36A2311; Mon,  8 Feb 2021 20:01:07 +0000 (UTC)
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 8 Feb 2021 20:01:04 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.95.82.139) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 8 Feb 2021 20:01:02 +0000
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
X-Inumbo-ID: 628e4e96-ccc8-440d-8332-a90fae3f0d76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1612814475; x=1644350475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/rpGf2bOgCDHM0uHQqYN9yEMExmcpf9437BH+44nals=;
  b=HS4y8o9gBjcByBgm4Ko2183u0trgW133LUSI1WPaWOOqN0jkumoi+g1+
   aW2gordvk9ElnXLdKbEfvaujbqgsbkykMXp8EKj2dI+aHTcaT7ZyN8hdH
   qBxJaAhiq0LU5jqP8C8lh0dRAXyFObtXUcKcFp5N5jGJ63q7Nwcb7Lfik
   M=;
X-IronPort-AV: E=Sophos;i="5.81,163,1610409600"; 
   d="scan'208";a="116838210"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Norbert Manthey
	<nmanthey@amazon.de>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH HVM v3 1/1] hvm: refactor set param
Date: Mon, 8 Feb 2021 21:00:49 +0100
Message-ID: <20210208200049.28571-1-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
References: <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

To prevent leaking HVM params via L1TF and similar issues on a
hyperthread pair, let's load values of domains after performing all
relevant checks, and blocking speculative execution.

Furthermore, speculative barriers are re-arranged to make sure we do not
allow guests running on co-located VCPUs to leak hvm parameter values of
other domains.

This is part of the speculative hardening effort.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reported-by: Hongyan Xia <hongyxia@amazon.co.uk>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

---
v3: * rephrased commit message to better explain code relocation
    * added release-acked


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




