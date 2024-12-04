Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C80E9E3757
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 11:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848467.1263337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tImSJ-00046R-9R; Wed, 04 Dec 2024 10:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848467.1263337; Wed, 04 Dec 2024 10:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tImSJ-00043s-6H; Wed, 04 Dec 2024 10:18:03 +0000
Received: by outflank-mailman (input) for mailman id 848467;
 Wed, 04 Dec 2024 10:18:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMCc=S5=bounce.vates.tech=bounce-md_30504962.67502c55.v1-cca75ed5ee8e488da2ef79e4b108d98f@srs-se1.protection.inumbo.net>)
 id 1tImSH-00043m-EM
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 10:18:01 +0000
Received: from mail136-20.atl41.mandrillapp.com
 (mail136-20.atl41.mandrillapp.com [198.2.136.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08d6b659-b229-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 11:17:59 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-20.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Y3D4512tqzCf9NCZ
 for <xen-devel@lists.xenproject.org>; Wed,  4 Dec 2024 10:17:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cca75ed5ee8e488da2ef79e4b108d98f; Wed, 04 Dec 2024 10:17:57 +0000
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
X-Inumbo-ID: 08d6b659-b229-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733307477; x=1733567977;
	bh=PM4sxTw1TF2yB7+p5Yf7VPbis4BsQWw5t0Ce8WOdBEs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=1e1y7qqsHsKq30EqyZM7dowpMhgXsW6O9coWflq0mm5FPwkWBd88f/XGvWdOThuc7
	 vF9CTwY5lQ+xL7cwsYfC06p0r4CWhogJfkYgnXjznJ8/veFYknC2IGgksK4xw3lwUk
	 eqH3FHmLy09DW5lLVInDaY4fWPf1S1IhSo1b0gucLsXpeH2jdnK27/Uoelun5LbxFN
	 yXDPQGCpq7BGQhUrUwvcBSQ9urFcBIGjqr3oIB2KPycwBdE+xGSToZJXxdrtEN3F1V
	 8GxyvhRqek0kXrrO+DIuP6agW9LKUyXNr0kMKrLGy6ELy7h3cXOn0h3xgT1zwgOTZz
	 f31zWDMMd2Plg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733307477; x=1733567977; i=teddy.astie@vates.tech;
	bh=PM4sxTw1TF2yB7+p5Yf7VPbis4BsQWw5t0Ce8WOdBEs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=r+JjyNvdRG5X50p5yS95vjH2pjQRtdERPsZ4K8zz75bzsGii8ZHoVIRNkfEo8GXHq
	 tlmYNW3cDnrtH2GE6IIUpoEaAqswj0nvNGiSvpRb3kBzI29Ot7Mj4/N/22Vl9AU729
	 /OvbJguTCpP40yFDVohaRqjeu5rDqBn5rFg2H05gSyREwEhUe2b87u3FyS+pKf3tk6
	 WWUa8ZabhhpltDaXTYmrp8LA/i8tFy8NGQmZKT8+r91sdkIhbxyllVwarXWubxbiqX
	 nMwHCpAS6xRKfTJWinC7MWvhVLh7h7MSF1bRSTG+era3jtzVnNKVvgxGIbHRvWg2Vq
	 Hx8XQoCnX/6+g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20XSM/domctl:=20Only=20pass=20properly=20initialized=20ssidref=20to=20xsm=5Fdomctl?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733307475753
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-Id: <fbe81175084a2f302a726d3fb8ba3144c6af8e6b.1733307202.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cca75ed5ee8e488da2ef79e4b108d98f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241204:md
Date: Wed, 04 Dec 2024 10:17:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On XEN_DOMCTL_create_domain, we need to pass the ssidref parameter to xsm_domctl,
currently, it is always passed regardless of what command we actually do (meaning
that we are likely to pass garbage in !XEN_DOMCTL_create_domain).

Pass ssidref from u.createdomain only for create_domain command, 0 otherwise.
No functionnal change as ssidref parameter is ignored for non-XEN_DOMCTL_create_domain
commands.

Fixes: ee32b9b29af449d38aad0a1b3a81aaae586f5ea7 ("XSM/domctl: Fix permission checks on XEN_DOMCTL_createdomain")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/common/domctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index ea16b75910..313022fe01 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -281,6 +281,7 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
 long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     long ret = 0;
+    uint32_t ssidref = 0; /* SSIDRef only applicable for cmd == createdomain */
     bool copyback = false;
     struct xen_domctl curop, *op = &curop;
     struct domain *d;
@@ -295,6 +296,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     {
     case XEN_DOMCTL_createdomain:
         d = NULL;
+        ssidref = op->u.createdomain.ssidref;
         break;
 
     case XEN_DOMCTL_assign_device:
@@ -322,9 +324,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
     }
 
-    ret = xsm_domctl(XSM_OTHER, d, op->cmd,
-                     /* SSIDRef only applicable for cmd == createdomain */
-                     op->u.createdomain.ssidref);
+    ret = xsm_domctl(XSM_OTHER, d, op->cmd, ssidref);
     if ( ret )
         goto domctl_out_unlock_domonly;
 
-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

