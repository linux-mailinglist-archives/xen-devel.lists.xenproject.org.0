Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CAC64D311
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462664.720865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avh-0001V6-Gp; Wed, 14 Dec 2022 23:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462664.720865; Wed, 14 Dec 2022 23:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avh-0001RR-Cy; Wed, 14 Dec 2022 23:12:49 +0000
Received: by outflank-mailman (input) for mailman id 462664;
 Wed, 14 Dec 2022 23:12:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5avf-0000n2-J2
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:12:47 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1a3e994-7c04-11ed-8fd2-01056ac49cbb;
 Thu, 15 Dec 2022 00:12:46 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8AF87320016F;
 Wed, 14 Dec 2022 18:12:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 14 Dec 2022 18:12:45 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:12:43 -0500 (EST)
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
X-Inumbo-ID: d1a3e994-7c04-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059564; x=1671145964; bh=rHhpvg5/TvxIAxNHtWjWIfzcFCIVP/+4spF
	hIykyYZQ=; b=RqdpcyThi7n3ZHDb+UJwVtBqsTgZSTGoAA0oNsfLGH19ODEAR3T
	wFnZZeWr7LlW2XJapNs1vXYTIreVB2gBofY3qMMdybN3nbVm5DQFnekXBexydnSp
	nCah+E8yRqo5EWgmfq1DK1LkMRH2XdRhNUCMGhxDLksbYySfSGI0mv2facP+qUci
	naSrBknTUqSokNL5y2+wazL5MWas8pcSvXMWS0bLVQTijRZucFDiUcx5XdQi1tDa
	woUUx7lQN5A74LfDhn9e92uXWVnw7l1xAeowFpvyPhozftjsIuxPRAnMIKhmOTzF
	bHBBiux51dL030svplGAvh1/3g4AlcEsQxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059564; x=1671145964; bh=rHhpvg5/TvxIA
	xNHtWjWIfzcFCIVP/+4spFhIykyYZQ=; b=ZnVThbHC0WQePt8kJhCaoVilG1hpf
	gL2UH2pxn9OOr46JQvDvOAGjZ7PdNF+3yzR5xCCkNrM/mjcvYh1QDyZAohXk5eFM
	pqFZ76alROvk6kpWoDGwK5GC4ZoT1Zn9VGWvqHB9mkDWjkcZPxTNlg/7qcu1RKpX
	GhCJG7sV6W+GeCHxRXOHKDaxQQ2DFjcTN7jU9fQSDhJQBWD3fecYmo4rOdgJLgm7
	UB+kaJ6yN2ARL3ewKg/bc16RWwEJswG+DLyg/rUcSZWfMeQrjT7WAUf3hE5gmqQI
	CbnzdmxgQocwXpRFi/hGmdx1nnVVt/Qme4mrfbee+I3PVtADAdAccAGug==
X-ME-Sender: <xms:bFiaY4Ng7RRe73pNewe0M5k7Tzg2GcSe3NzJzKb57QuS-gb5Ve_HbQ>
    <xme:bFiaY-_lgQgcQ5ZFc9fhvjSurNxgBTi9vgq2mQYQF-wgzmQl8KU0Na-g8SQIwQ3oD
    MK8xtYiImLueA4>
X-ME-Received: <xmr:bFiaY_T4l4V8q5q-DkohE1hwKdl_6iS8UyH8BCOatAvEDdDMaLKTo3N0y9HQPsQjn1rnAmkg9a-b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:bFiaYwukM8lh4yUShnb7X4-Ta3y6cUQKPunelWMX02mZM47NpEKJUw>
    <xmx:bFiaYwd_xhBurj_2BZt9IBXq_SZnLKz7zvpMpRJKWCJAD_SW7CCnig>
    <xmx:bFiaY038_idYwJKDx_bzWjoB84onzyt_qoP6kaqeOyu0M68GTrLA5A>
    <xmx:bFiaY3wGx6FD-4Wf7SKJt0bejcNtbK7KT5W0u_DOrVrfL5Md60xTOg>
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
Subject: [PATCH v3 04/12] x86: Add memory type constants
Date: Wed, 14 Dec 2022 18:11:54 -0500
Message-Id: <5e0dee8a2cc5076b677e813c9ee61fa08e8e4c1b.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are not currently used, so there is no functional change.  Future
patches will use these constants.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v2:

- Avoid using _AC where not required.
- Define reserved memory types inline
---
 xen/arch/x86/include/asm/x86-defns.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 28628807cb9897cf6fa8e266f71f5f220813984d..6380b8197c3b16a5d95286097d237579d3d55bd2 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -153,4 +153,15 @@
      (1u << X86_EXC_AC) | (1u << X86_EXC_CP) |                      \
      (1u << X86_EXC_VC) | (1u << X86_EXC_SX))
 
+/* Memory types */
+#define X86_MT_UC         0x00 /* uncachable */
+#define X86_MT_WC         0x01 /* write-combined */
+#define X86_MT_RESERVED_1 0x02 /* reserved */
+#define X86_MT_RESERVED_2 0x03 /* reserved */
+#define X86_MT_WT         0x04 /* write-through */
+#define X86_MT_WP         0x05 /* write-protect */
+#define X86_MT_WB         0x06 /* write-back */
+#define X86_MT_UCM        0x07 /* UC- */
+#define X86_NUM_MT        0x08
+
 #endif	/* __XEN_X86_DEFNS_H__ */
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


