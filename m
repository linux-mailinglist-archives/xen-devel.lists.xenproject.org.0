Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B964D31A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462735.720931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axp-0005rg-Tm; Wed, 14 Dec 2022 23:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462735.720931; Wed, 14 Dec 2022 23:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axp-0005oa-NV; Wed, 14 Dec 2022 23:15:01 +0000
Received: by outflank-mailman (input) for mailman id 462735;
 Wed, 14 Dec 2022 23:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5aw6-0000n2-0V
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:13:14 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddf7078b-7c04-11ed-8fd2-01056ac49cbb;
 Thu, 15 Dec 2022 00:13:07 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3D35D3200925;
 Wed, 14 Dec 2022 18:13:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 14 Dec 2022 18:13:06 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:13:04 -0500 (EST)
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
X-Inumbo-ID: ddf7078b-7c04-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059584; x=1671145984; bh=SYVIhlygQCbQDxRM0Jvhm4RPjrLE8QTHJIb
	nQIRdaN4=; b=rGUhhSIBBzfZ4mJE4GIp1CMwMIfyJq2ySpBOxSnGF6IwLH5VTIk
	3W5kSGgXnFQjPme+lnJmF/JfDr1rz4Ad3yz9Q63ASNj4qBf7RABHGocZhBsRnLJV
	dlagGvhxv09Gd3e5ostodBAdzgG6OltJN/WtGj9WTHbzeDiXLheJCk+rlC96w0ci
	BcApvwgXHLntVVC1tBZKnRnaiD08yg4ctkWTGqYD1VJGFT9BapW6Zf46dqkO+bsC
	UqtvC+YzRnuhP8wPWo5/CLLfiSUHGMS/Atc/aQvjRWVxK48Ad30MK1S6oMMzSFAt
	+w//qMGrxc2UuGg0S0lne6ajl8pFsg5bfkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059584; x=1671145984; bh=SYVIhlygQCbQD
	xRM0Jvhm4RPjrLE8QTHJIbnQIRdaN4=; b=mjDag8x4C10R186djGkVxAAmHqoBs
	CoXYgFCVk80XV8pcLXc3Ys11inuiJqpeEkMiu4NAZgIcyJB9QCFxWDXFKLihm/Gy
	MYzbWxCDxO0GzLqqAVCrvexV5kM9FBKl1T4/9F0OofzVG7O7DTDPGzo7/145/T+P
	hNgb/G8TE2aErrY4K51M177EDrbxppYd4sSpqSfg98s9uM3J2p9n5eId3dDP53cm
	nBCHdfV14I1Bo/nmoPBK+fxVus8cewItWbQpO9Bb2Bod1TKO+ThNFNNrB2STnnT/
	JSu+Rfccf+3PfSylrMBT+t/bAVG8JiFbZvNr1iR5ZLs8u0fiDcvsPKAzw==
X-ME-Sender: <xms:gFiaY_fjv8xAhra50idli-uy26by-UOmuBIIRPEcqE4Sl5g0vhI5Og>
    <xme:gFiaY1MWLjYFL2hJRb02RQR3co78qXKEgaDs3eM7neXuTUsdKjJ4G_5MF455MB6Yo
    YVEmuB7gtri-HQ>
X-ME-Received: <xmr:gFiaY4hrkv_qecdc4aeypk6eHkwUnGqOXQLD7AOj8mfbvTGcl7kv7WiYZuxLHMMBg1XIuFBf32fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:gFiaYw9lN7QOnFd5ELvQOF1lU0pJfgqasKYbTYR9BrNvpP0opNurNQ>
    <xmx:gFiaY7tFeejxXJBZZHCt4pXosdUhI3sqB2JV_VxllShijo9fX8EhfQ>
    <xmx:gFiaY_FOk-PU76YhFxq856s4bFHKvsrHjwGVY1qtHS4ioj3STV0nRQ>
    <xmx:gFiaYxBGU_oUfbeVHwIpGjvV2XbNbaMoPFE_9GC4vi35Sbx1vuzZMQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v3 10/12] x86/mm: make code robust to future PAT changes
Date: Wed, 14 Dec 2022 18:12:00 -0500
Message-Id: <667b8ff33b4b0c25001a232a267b68574983d9e6.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It may be desirable to change Xen's PAT for various reasons.  This
requires changes to several _PAGE_* macros as well.  Add static
assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
macros, and that _PAGE_WB is 0 as required by Linux.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a8def47aa3bf9770576c62a190032d45d63dd86e..7fb1a0f91910952640378f316a68096a08895b37 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6357,8 +6357,44 @@ unsigned long get_upper_mfn_bound(void)
 
 static void __init __maybe_unused build_assertions(void)
 {
+    /* A bunch of static assertions to check that the XEN_MSR_PAT is valid
+     * and consistent with the _PAGE_* macros */
     BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL &&
                  "wrong XEN_MSR_PAT breaks PV guests");
+    BUILD_BUG_ON(_PAGE_WB && "Linux requires _PAGE_WB to be 0");
+#define PAT_VALUE(v) (0xFF & (XEN_MSR_PAT >> (8 * (v))))
+#define BAD_VALUE(v) ((v) < 0 || (v) > 7 ||                                    \
+                      (v) == X86_MT_RESERVED_1 || (v) == X86_MT_RESERVED_2)
+#define BAD_PAT_VALUE(v) BUILD_BUG_ON(BAD_VALUE(PAT_VALUE(v)))
+    BAD_PAT_VALUE(0);
+    BAD_PAT_VALUE(1);
+    BAD_PAT_VALUE(2);
+    BAD_PAT_VALUE(3);
+    BAD_PAT_VALUE(4);
+    BAD_PAT_VALUE(5);
+    BAD_PAT_VALUE(6);
+    BAD_PAT_VALUE(7);
+#undef BAD_PAT_VALUE
+#undef BAD_VALUE
+#define PAT_SHIFT(page_value) (((page_value) & _PAGE_PAT) >> 5 |               \
+                               ((page_value) & (_PAGE_PCD | _PAGE_PWT)) >> 3)
+#define CHECK_PAGE_VALUE(page_value) do {                                      \
+    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
+    BUILD_BUG_ON(((_PAGE_##page_value) & PAGE_CACHE_ATTRS) !=                  \
+                  (_PAGE_##page_value));                                       \
+    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */               \
+    BUILD_BUG_ON(PAT_VALUE(PAT_SHIFT(_PAGE_##page_value)) !=                   \
+                 (X86_MT_##page_value));                                       \
+} while (0)
+    CHECK_PAGE_VALUE(WT);
+    CHECK_PAGE_VALUE(WB);
+    CHECK_PAGE_VALUE(WC);
+    CHECK_PAGE_VALUE(UC);
+    CHECK_PAGE_VALUE(UCM);
+    CHECK_PAGE_VALUE(WP);
+#undef CHECK_PAGE_VALUE
+#undef PAT_SHIFT
+#undef PAT_VALUE
 }
 
 /*
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


