Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7731EB36
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 16:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86672.162871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCkp2-0004Ba-QN; Thu, 18 Feb 2021 15:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86672.162871; Thu, 18 Feb 2021 15:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCkp2-0004BA-Mo; Thu, 18 Feb 2021 15:02:28 +0000
Received: by outflank-mailman (input) for mailman id 86672;
 Thu, 18 Feb 2021 15:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lY7L=HU=amazon.de=prvs=6763206ab=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lCkp2-0004Ax-0m
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 15:02:28 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08f468dd-fcad-4044-ae56-2603f61b7e48;
 Thu, 18 Feb 2021 15:02:27 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 18 Feb 2021 15:02:18 +0000
Received: from EX13D02EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2E8B9A177C; Thu, 18 Feb 2021 15:02:15 +0000 (UTC)
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D02EUB003.ant.amazon.com (10.43.166.172) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 18 Feb 2021 15:02:14 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.213.30) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 18 Feb 2021 15:02:11 +0000
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
X-Inumbo-ID: 08f468dd-fcad-4044-ae56-2603f61b7e48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1613660547; x=1645196547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=j78hOZFqSeIc4Quq5tg7IMbvyJPUwGTss72xF+BItXg=;
  b=X5oh+4Cuz9641nhe77cvk1i9DfVPZHi9876BFdjYe+GfCIaOdDL+VR9P
   q/GBtzmDVZAOgm0nkK0dSOg2NsDGegnWGavVbFHE1R9nBhElDVxO9eEiT
   ij6goSDSS0uv7iyLRzGm1pCidwr+9dOOyvqLlhmEb6uuh5DvgTmG98YA4
   g=;
X-IronPort-AV: E=Sophos;i="5.81,187,1610409600"; 
   d="scan'208";a="89076133"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Norbert Manthey
	<nmanthey@amazon.de>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH HVM v4 1/1] hvm: refactor set param
Date: Thu, 18 Feb 2021 16:01:58 +0100
Message-ID: <20210218150158.28265-1-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2633df5f-df68-4a16-bc5c-522b2a589b00@amazon.de>
References: <2633df5f-df68-4a16-bc5c-522b2a589b00@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

To prevent leaking HVM params via L1TF and similar issues on a
hyperthread pair, let's load values of domains only after performing all
relevant checks, and blocking speculative execution.

For both get and set, the value of the index is already checked in the
outer calling function. The block_speculation calls in hvmop_get_param
and hvmop_set_param are removed, because is_hvm_domain already blocks
speculation.

Furthermore, speculative barriers are re-arranged to make sure we do not
allow guests running on co-located VCPUs to leak hvm parameter values of
other domains.

To improve symmetry between the get and set operations, function
hvmop_set_param is made static.

This is part of the speculative hardening effort.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reported-by: Hongyan Xia <hongyxia@amazon.co.uk>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

---
v4: * add 'static' attribute to hvmop_set_param
    * drop introduced bound checks, e.g. in hvm_allow_set_param
    * drop existing bound check from hvm_set_param
    * do not introduce block_speculation in hvmop_set_param,
      as is_hvm_domain already blocks speculation
    * fix comments

 xen/arch/x86/hvm/hvm.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

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
@@ -4108,6 +4108,10 @@ static int hvm_allow_set_param(struct domain *d,
     if ( rc )
         return rc;
 
+    /* Make sure we evaluate permissions before loading data of domains. */
+    block_speculation();
+
+    value = d->arch.hvm.params[index];
     switch ( index )
     {
     /* The following parameters should only be changed once. */
@@ -4134,13 +4138,13 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
     struct vcpu *v;
     int rc;
 
-    if ( index >= HVM_NR_PARAMS )
-        return -EINVAL;
-
     rc = hvm_allow_set_param(d, index, value);
     if ( rc )
         return rc;
 
+    /* Make sure we evaluate permissions before loading data of domains. */
+    block_speculation();
+
     switch ( index )
     {
     case HVM_PARAM_CALLBACK_IRQ:
@@ -4305,7 +4309,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
     return rc;
 }
 
-int hvmop_set_param(
+static int hvmop_set_param(
     XEN_GUEST_HANDLE_PARAM(xen_hvm_param_t) arg)
 {
     struct xen_hvm_param a;
@@ -4318,9 +4322,6 @@ int hvmop_set_param(
     if ( a.index >= HVM_NR_PARAMS )
         return -EINVAL;
 
-    /* Make sure the above bound check is not bypassed during speculation. */
-    block_speculation();
-
     d = rcu_lock_domain_by_any_id(a.domid);
     if ( d == NULL )
         return -ESRCH;
@@ -4388,6 +4389,9 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
     if ( rc )
         return rc;
 
+    /* Make sure the above domain permissions check is respected. */
+    block_speculation();
+
     switch ( index )
     {
     case HVM_PARAM_ACPI_S_STATE:
@@ -4428,9 +4432,6 @@ static int hvmop_get_param(
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




