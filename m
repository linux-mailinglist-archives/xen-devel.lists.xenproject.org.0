Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A516611F7
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jan 2023 23:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473025.733500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLZ-00087v-8T; Sat, 07 Jan 2023 22:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473025.733500; Sat, 07 Jan 2023 22:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLZ-00085D-5d; Sat, 07 Jan 2023 22:07:25 +0000
Received: by outflank-mailman (input) for mailman id 473025;
 Sat, 07 Jan 2023 22:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TYdO=5E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pEHLX-0007Zv-DB
 for xen-devel@lists.xenproject.org; Sat, 07 Jan 2023 22:07:23 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a705382b-8ed7-11ed-91b6-6bf2151ebd3b;
 Sat, 07 Jan 2023 23:07:19 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C14895C0076;
 Sat,  7 Jan 2023 17:07:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 07 Jan 2023 17:07:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jan 2023 17:07:17 -0500 (EST)
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
X-Inumbo-ID: a705382b-8ed7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673129238; x=1673215638; bh=1qVsCevJ6z
	1i8YffwrKngj5a2580Okyv9pEFojRJYNA=; b=pVheUbXFIxxTOWkRi7gSa6D9oG
	s8EdUmbeNUSwXHeyblgFwLhp93vkZ4MSeHaRLW2ouiCFkW5Ott+ptNZBplxltd93
	3HLUZUblxDPPfgpUZgeVpF8ac6mYyuB4cfGSW2r9p3Vk9Sn1/FvsFGDvH+DEvYZa
	gqmP9eSxKOR3JpXmcxOzeVseTSBtx6cDWY/swLcC1iyRsyq1gm/RsgqiWQLb/Cvv
	6T3m403W86Rf5zFc7NpjL5IweVUEuNFF6Nn5WKe/Si6dwZCmxmepHelVSTdDzI1f
	mjNzaue389LsJE6YY1rKcLo3tumGk132gj7RwitjpOpxKYOoxOm18dG90t1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1673129238; x=
	1673215638; bh=1qVsCevJ6z1i8YffwrKngj5a2580Okyv9pEFojRJYNA=; b=a
	bjm0RBaapBEXH0sQAmfiCSgHquGTUojGtDfX5R/19gmlFZ2A88xVRMegVn2zpQLo
	bLHOnntsNHe3ZFCW29NC8rlYUN1coPLxS9COC6ApFXfmR9igrTIh3Av/nqBZ6LbB
	r2tkIuHszo9Ul0omCXAjKgOfGzaeFSMZqUfu0niYZQKFinv/tMOe6IoRYZZFDH90
	FrG/4l+92wha6ZKMlV9Ql4s95F39gkhPPp5UBOsNP/zmSqwe4l6BkffxWL9AmLIL
	RsUdBm52ZXTfVAl/B674s4jJMfsEwoWtsgDHP+g3eEz20O9ZoDol26dNxhWgWv/W
	JnoVS4A7PhBSYwEiphlbQ==
X-ME-Sender: <xms:Fu25Y9patg4kSgmPQo9TzWGLOThvS-GrB6Sazi0KqRZudT0jtykErw>
    <xme:Fu25Y_qmMi6yZeW655VfJkaE4QMNF4_UOU-QubyE4zeMvISHQTzb2NAbl8dYaVVXw
    yqmMQ9uRYysvjg>
X-ME-Received: <xmr:Fu25Y6MMbt9cbFAIGn1HQihdbqa4aHCAjydv5DdObi2hx8IzG94tNQ8UtUgk0XBBDbjlnj8uMJWJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedvgdduheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeludekleeljeekveekfeeghfff
    gedvieegleeigeejffefieeviedvjeegveetieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:Fu25Y44_XUawRcw4IvU0zLPeYDgHWOIpnWkD8Udj5earHMTfZg7mDw>
    <xmx:Fu25Y85n-bPKixdS8_trUgU29JcBLUttkKpn9QBYYyRGVxm6X-cwbA>
    <xmx:Fu25YwjjQotbFm4kevyz97ITbHcSS3spZawko8jT9NUey94YpDUsmA>
    <xmx:Fu25Y-tjlagSpifP1t5XTgFOYeRRUpcrejMVhTG4blcLuOqm_0-goQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v7 2/4] x86/mm: Reject invalid cacheability in PV guests by default
Date: Sat,  7 Jan 2023 17:07:04 -0500
Message-Id: <eb9aff037aa9afe1a4a37661847e44d2316ad094.1673123823.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673123823.git.demi@invisiblethingslab.com>
References: <cover.1673123823.git.demi@invisiblethingslab.com>
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
Changes since v6:
- Make invalid-cacheability= a subflag of pv=.
- Move check for invalid cacheability to get_page_from_l1e().

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
 docs/misc/xen-command-line.pandoc    | 11 ++++++
 xen/arch/x86/include/asm/pv/domain.h |  7 ++++
 xen/arch/x86/mm.c                    | 53 +++++++++++++++++++++++++++-
 xen/arch/x86/pv/domain.c             | 18 ++++++++--
 4 files changed, 85 insertions(+), 4 deletions(-)

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
 
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index 924508bbb4f0c199b3cd2306d9d8f0bd0ef399f9..1c9ce259ab4ee23ea5d057f5dfa964effb169032 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -71,6 +71,13 @@ void pv_vcpu_destroy(struct vcpu *v);
 int pv_vcpu_initialise(struct vcpu *v);
 void pv_domain_destroy(struct domain *d);
 int pv_domain_initialise(struct domain *d);
+extern __ro_after_init uint8_t invalid_cacheability;
+
+enum {
+    INVALID_CACHEABILITY_ALLOW,
+    INVALID_CACHEABILITY_DENY,
+    INVALID_CACHEABILITY_TRAP,
+};
 
 /*
  * Bits which a PV guest can toggle in its view of cr4.  Some are loaded into
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 3558ca215b02a517d55d75329d645ae5905424e4..a8f137925cba1846b97aee9321df6427f4dd1a94 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -879,6 +879,30 @@ get_page_from_l1e(
         return -EINVAL;
     }
 
+    if ( invalid_cacheability != INVALID_CACHEABILITY_ALLOW )
+    {
+        switch ( l1e.l1 & PAGE_CACHE_ATTRS )
+        {
+        case _PAGE_WB:
+        case _PAGE_UC:
+        case _PAGE_UCM:
+        case _PAGE_WC:
+        case _PAGE_WT:
+        case _PAGE_WP:
+            break;
+        default:
+            /*
+             * If we get here, a PV guest tried to use one of the
+             * reserved values in Xen's PAT.  This indicates a bug
+             * in the guest.  If requested by the user, inject #GP
+             * to cause the guest to log a stack trace.
+             */
+            if ( invalid_cacheability == INVALID_CACHEABILITY_TRAP )
+                pv_inject_hw_exception(TRAP_gp_fault, 0);
+            return -EINVAL;
+        }
+    }
+
     valid = mfn_valid(_mfn(mfn));
 
     if ( !valid ||
@@ -1324,6 +1348,31 @@ static int put_page_from_l4e(l4_pgentry_t l4e, mfn_t l4mfn, unsigned int flags)
     return put_pt_page(l4e_get_page(l4e), mfn_to_page(l4mfn), flags);
 }
 
+#ifdef NDEBUG
+#define INVALID_CACHEABILITY_DEFAULT INVALID_CACHEABILITY_DENY
+#else
+#define INVALID_CACHEABILITY_DEFAULT INVALID_CACHEABILITY_TRAP
+#endif
+
+__ro_after_init uint8_t invalid_cacheability =
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
@@ -1343,7 +1392,9 @@ static int promote_l1_table(struct page_info *page)
         }
         else
         {
-            switch ( ret = get_page_from_l1e(pl1e[i], d, d) )
+            l1_pgentry_t l1e = pl1e[i];
+
+            switch ( ret = get_page_from_l1e(l1e, d, d) )
             {
             default:
                 goto fail;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index f94f28c8e271549acb449ef2e129b928751f765d..40b424351fd99fe1fb0a5faa5b20bf4070bb1d4a 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -28,9 +28,21 @@ static int __init cf_check parse_pv(const char *s)
     do {
         ss = strchr(s, ',');
         if ( !ss )
-            ss = strchr(s, '\0');
-
-        if ( (val = parse_boolean("32", s, ss)) >= 0 )
+            ss += strlen(s);
+        if ( !strncmp("invalid-cacheability=", s,
+                      sizeof("invalid-cacheability=") - 1) )
+        {
+            const char *p = s + (sizeof("invalid-cacheability=") - 1);
+            if (ss - p == 5 && !memcmp(p, "allow", 5))
+                invalid_cacheability = INVALID_CACHEABILITY_ALLOW;
+            else if (ss - p == 4 && !memcmp(p, "deny", 4))
+                invalid_cacheability = INVALID_CACHEABILITY_DENY;
+            else if (ss - p == 4 && !memcmp(p, "trap", 4))
+                invalid_cacheability = INVALID_CACHEABILITY_TRAP;
+            else
+                rc = -EINVAL;
+        }
+        else if ( (val = parse_boolean("32", s, ss)) >= 0 )
         {
 #ifdef CONFIG_PV32
             opt_pv32 = val;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


