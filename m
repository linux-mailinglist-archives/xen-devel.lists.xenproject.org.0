Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6C64E4DC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463942.722247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7A-0001Dp-Ck; Thu, 15 Dec 2022 23:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463942.722247; Thu, 15 Dec 2022 23:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7A-0001B7-9N; Thu, 15 Dec 2022 23:58:12 +0000
Received: by outflank-mailman (input) for mailman id 463942;
 Thu, 15 Dec 2022 23:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y78-0001Aq-3U
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:10 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51fa24a7-7cd4-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 00:58:08 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 98039320092E;
 Thu, 15 Dec 2022 18:58:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 15 Dec 2022 18:58:06 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:04 -0500 (EST)
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
X-Inumbo-ID: 51fa24a7-7cd4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671148685; x=1671235085; bh=OqxRQgedI1lUNXYrN3Idtsly6m9/XwYk1xQ
	JUvCAU3w=; b=qtCDg/XAZjbK1qyQ45A8qy4GEhWpquznmr08pS1Cp2enFSg4RKO
	SFAeHMP64vRn2xENZCOQo7jLdZMNL0EC2FHtCLemMaRe6z5mEaXywVuQjMqVgj2e
	rafRwrjRGaYuelAZHVVDZtGv3oDcJNO5P7CHL1DrpGATBcEhSRy9NQ0M0K9ViALi
	4bHakB2twrGGLuPssKEslfB0cKMfMtzE6gvH3sergE+tADSlmJJNqlsheJTAURwp
	ccstUAPOVJ5ctLcFwqKxv49PAw9i54K6CYTp2d3tpLZpxUXw/CmOAg+CXVI+gGD8
	Al3BxQQk9savKMfU9tQ419NfDE7JyYuQoXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671148685; x=1671235085; bh=OqxRQgedI1lUN
	XYrN3Idtsly6m9/XwYk1xQJUvCAU3w=; b=FxdYMSDdrz22AIMURH9AdJQMJsHs0
	Q7QzNQmnJ34+EV2xp9xjQR38Y6HA/LES7lm4lripvfY4qbuF/lvYRuwmJM8UcJlz
	BuM5dZvjGg4ILMx+aEixZ0UIqgEPZJl6A+ebUzEQS7ijNFSClQj8whA2PWTxJsEj
	bokSNO2yedp1Bx2L6/LI/GQYl2UCfzjYMLQ9SqflI9ChUnTKLSQp06q2GMoJFTnI
	5eiiHepeHrqv/EtRhv2e+BkXYAQPWS1Ng9AQrvXd4e/pmf2YU9m6b3gQczaRsOI6
	7yM3gqQPNByYvtZnkNq11XocMCB6JMKkHTovnwkhPaSo6w9gsE/EXmx9g==
X-ME-Sender: <xms:jbSbYxDLElVX7DBFrfZvk1kXzj5jm7bbYeKBO5OMWpbNmtYTh9xlOg>
    <xme:jbSbY_jxJnYSmQkyK3_vzC0-PiVMWVmFv5loF2MihE9FD0MxCWt08KJd0vgqkJ1uw
    pgIW8MefxSF39Y>
X-ME-Received: <xmr:jbSbY8ku-mMFseuVfazoarWKnGpDGka8nJNbXVPldHc2OUdlgXrznDYU8aI20EbimhAFc8SVB41J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:jbSbY7ztvQsr0M3rhuXN4SGV8FO_q-CWkYY_NUgKlX7xVaTfWn93WQ>
    <xmx:jbSbY2TlCBFGr97pvrDeZFwfOeMeQ5Y-5sJKpy9P9CMOSm4k6kf_4g>
    <xmx:jbSbY-Yf-O_U07zhzO3-pOAwSzE0XjbtaGzmS-upq3NvF5BOnhEdDA>
    <xmx:jbSbY5FbpiHytMAMSyp5xJThCmo2FwDZUUGB_QZ3fl4v6AptSG7WEA>
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
Subject: [PATCH v4 01/10] x86: Add memory type constants
Date: Thu, 15 Dec 2022 18:57:43 -0500
Message-Id: <6d1135e58cbc12f47d144252d6e80c3a6f76a5f7.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671139149.git.demi@invisiblethingslab.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are not currently used, so there is no functional change.  Future
patches will use these constants.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v3:
- Name the reserved values X86_MT_RSVD_2 and X86_MT_RSVD_3, to
  match the architectural values of 0x02 and 0x03.

Changes since v2:

- Avoid using _AC where not required.
- Define reserved memory types inline
---
 xen/arch/x86/include/asm/x86-defns.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 28628807cb9897cf6fa8e266f71f5f220813984d..42b5f382d438d21ac97b6438e8c810c7b964cf6d 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -153,4 +153,15 @@
      (1u << X86_EXC_AC) | (1u << X86_EXC_CP) |                      \
      (1u << X86_EXC_VC) | (1u << X86_EXC_SX))
 
+/* Memory types */
+#define X86_MT_UC     0x00 /* uncachable */
+#define X86_MT_WC     0x01 /* write-combined */
+#define X86_MT_RSVD_2 0x02 /* reserved */
+#define X86_MT_RSVD_3 0x03 /* reserved */
+#define X86_MT_WT     0x04 /* write-through */
+#define X86_MT_WP     0x05 /* write-protect */
+#define X86_MT_WB     0x06 /* write-back */
+#define X86_MT_UCM    0x07 /* UC- */
+#define X86_NUM_MT    0x08
+
 #endif	/* __XEN_X86_DEFNS_H__ */
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

