Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00CB65488F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 23:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468696.727899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6k-0003x6-Q6; Thu, 22 Dec 2022 22:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468696.727899; Thu, 22 Dec 2022 22:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6k-0003po-Jl; Thu, 22 Dec 2022 22:32:10 +0000
Received: by outflank-mailman (input) for mailman id 468696;
 Thu, 22 Dec 2022 22:32:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8U6j-0003ch-1g
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 22:32:09 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75c10f6f-8248-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 23:32:04 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E8C25C00B4;
 Thu, 22 Dec 2022 17:32:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Dec 2022 17:32:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 17:32:03 -0500 (EST)
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
X-Inumbo-ID: 75c10f6f-8248-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1671748324; x=1671834724; bh=fT0Z3+eeo9
	6n0/JAYUaHTtOcrsYp5CyVIPq9wgQhDIc=; b=ETfPuXBXhPoqGmpfPCKjDF037W
	/36r9T54OE7tKKn3PVsyzVvE7OVNR9zfBT2kFMbK6Z6+XJeg2KmkiV99JeZLGdL0
	32w5MhyX5Ap1WdRYCEegsd5hHSE6DKk4B4eUC7JQu8hC0RWTL2qd27Jwug4RW4lb
	ZjYMXyWKIAEs0WIVrBcDB+8fkf9cOVlH+XM3D24wNTGdRw5dMas5+PQA6GPANh8I
	lDEGNK+V7pTusg2Fwy+pCCOFkgOIoKN+/WTz3W77D1qXhDibeCfS5gq6j7qVlZy3
	315GijRh5ieUQM/hhmEBQ5qpgSrE+i1k6QESiovLl7YNXEvWnDNNl/cwZKzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671748324; x=
	1671834724; bh=fT0Z3+eeo96n0/JAYUaHTtOcrsYp5CyVIPq9wgQhDIc=; b=X
	9lZy4FShFs0Uya4r95r1XzycYPqHXWxof8BIHQZlCGaGZ4mRBIZFsEkka+7p93HO
	zy7hocws79htKhJUE5OGCOq3cnWuEQZ34dJD6frXqhhC/jPP1KNuL/rLfW3vWUYn
	oOw0e2Zd9l6SNTaD/s8uHYs6yCfs6+Tc79b9cadIRXJ3hvV0LbVuzNUIt55hgd6q
	GG8nn8/25WF1cIS2zvitifny//zKZcEzl2fT2Afd9oMgRzTRyELJ6vv8Ywcej/BU
	7eEG9APo0AkARsUrOJjGOEsh43mjTnF2808NXhRXmA4OwfOgnsIJNu1C3Q7V234P
	OWVj6H84sY3o/gq7Pea3g==
X-ME-Sender: <xms:49qkYxdm-n8liaAzYZMjw0jMQgYdZxDzhuZPAoFeUovhXhE-hcVaSQ>
    <xme:49qkY_M9gMxh7MuUhpGp59ORbrMEGCTHexx64jvwvF32h96-TJwy4rCtT91gQWPHo
    mRqeeMfYm8_fYc>
X-ME-Received: <xmr:49qkY6gKpxfNK0IXsAIvMTtl4ncNBOSOBntn0_xZs5GFrOfjrSK3eLA3scYpB4Y-X6dnEuuITrxc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgdduieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeludekleeljeekveekfeeghfff
    gedvieegleeigeejffefieeviedvjeegveetieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:5NqkY6_lde0no-KA0rH9j3iQTH5y_J6eRjiaqs0vrmYqPNrU8x_p0A>
    <xmx:5NqkY9vJJcNpVeo7LzATcD2PgYaloFgUXDnYyFSjFz4IDiHqVKpqmg>
    <xmx:5NqkY5FQPIus0HSpGO-GRsm3UAkJW80SbkKe-zTrC2fVCa6x-AFgsQ>
    <xmx:5NqkYxh_OQFDv48zhuICc4IXY2_aqL-hj7Vezd7ODQDBJMS1IxoiBg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Tim Deegan <tim@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests by default
Date: Thu, 22 Dec 2022 17:31:49 -0500
Message-Id: <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671744225.git.demi@invisiblethingslab.com>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting cacheability flags that are not ones specified by Xen is a bug
in the guest.  By default, return -EINVAL if a guests attempts to do
this.  The invalid-cacheability= Xen command-line flag allows the
administrator to allow such attempts or to produce

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v5:
- Make parameters static and __ro_after_init.
- Replace boolean parameter allow_invalid_cacheability with string
  parameter invalid-cacheability.
- Move parameter definitions to near where they are used.
- Add documentation.

Changes since v4:
- Remove pointless BUILD_BUG_ON().
- Add comment explaining why an exception is being injected.

Changes since v3:
- Add Andrew Cooper’s Suggested-by
---
 docs/misc/xen-command-line.pandoc | 11 ++++++
 xen/arch/x86/mm.c                 | 60 ++++++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 424b12cfb27d6ade2ec63eacb8afe5df82465451..0230a7bc17cbd4362a42ea64cea695f31f5e0f86 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1417,6 +1417,17 @@ detection of systems known to misbehave upon accesses to that port.
 ### idle_latency_factor (x86)
 > `= <integer>`
 
+### invalid-cacheability (x86)
+> `= allow | deny | trap`
+
+> Default: `deny` in release builds, otherwise `trap`
+
+Specify what happens when a PV guest tries to use one of the reserved entries in
+the PAT.  `deny` causes the attempt to be rejected with -EINVAL, `allow` allows
+the attempt, and `trap` causes a general protection fault to be raised.
+Currently, the reserved entries are marked as uncacheable in Xen's PAT, but this
+will change if new memory types are added, so guests must not rely on it.
+
 ### ioapic_ack (x86)
 > `= old | new`
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 65ba0f58ed8c26ac0343528303851739981c03bd..bacfb776d688f68dcbf79d83723fff329b75fd18 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1324,6 +1324,37 @@ static int put_page_from_l4e(l4_pgentry_t l4e, mfn_t l4mfn, unsigned int flags)
     return put_pt_page(l4e_get_page(l4e), mfn_to_page(l4mfn), flags);
 }
 
+enum {
+    INVALID_CACHEABILITY_ALLOW,
+    INVALID_CACHEABILITY_DENY,
+    INVALID_CACHEABILITY_TRAP,
+};
+
+#ifdef NDEBUG
+#define INVALID_CACHEABILITY_DEFAULT INVALID_CACHEABILITY_DENY
+#else
+#define INVALID_CACHEABILITY_DEFAULT INVALID_CACHEABILITY_TRAP
+#endif
+
+static __ro_after_init uint8_t invalid_cacheability =
+    INVALID_CACHEABILITY_DEFAULT;
+
+static int __init cf_check set_invalid_cacheability(const char *str)
+{
+    if (strcmp("allow", str) == 0)
+        invalid_cacheability = INVALID_CACHEABILITY_ALLOW;
+    else if (strcmp("deny", str) == 0)
+        invalid_cacheability = INVALID_CACHEABILITY_DENY;
+    else if (strcmp("trap", str) == 0)
+        invalid_cacheability = INVALID_CACHEABILITY_TRAP;
+    else
+        return -EINVAL;
+
+    return 0;
+}
+
+custom_param("invalid-cacheability", set_invalid_cacheability);
+
 static int promote_l1_table(struct page_info *page)
 {
     struct domain *d = page_get_owner(page);
@@ -1343,7 +1374,34 @@ static int promote_l1_table(struct page_info *page)
         }
         else
         {
-            switch ( ret = get_page_from_l1e(pl1e[i], d, d) )
+            l1_pgentry_t l1e = pl1e[i];
+
+            if ( invalid_cacheability != INVALID_CACHEABILITY_ALLOW )
+            {
+                switch ( l1e.l1 & PAGE_CACHE_ATTRS )
+                {
+                case _PAGE_WB:
+                case _PAGE_UC:
+                case _PAGE_UCM:
+                case _PAGE_WC:
+                case _PAGE_WT:
+                case _PAGE_WP:
+                    break;
+                default:
+                    /*
+                     * If we get here, a PV guest tried to use one of the
+                     * reserved values in Xen's PAT.  This indicates a bug
+                     * in the guest.  If requested by the user, inject #GP
+                     * to cause the guest to log a stack trace.
+                     */
+                    if ( invalid_cacheability == INVALID_CACHEABILITY_TRAP )
+                        pv_inject_hw_exception(TRAP_gp_fault, 0);
+                    ret = -EINVAL;
+                    goto fail;
+                }
+            }
+
+            switch ( ret = get_page_from_l1e(l1e, d, d) )
             {
             default:
                 goto fail;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

