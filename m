Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E5651784
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466400.725294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9J-0004tS-Vt; Tue, 20 Dec 2022 01:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466400.725294; Tue, 20 Dec 2022 01:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9J-0004mD-RX; Tue, 20 Dec 2022 01:10:29 +0000
Received: by outflank-mailman (input) for mailman id 466400;
 Tue, 20 Dec 2022 01:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9I-0004iO-Gf
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:28 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14dc3411-8003-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 02:10:26 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id EF040320095A;
 Mon, 19 Dec 2022 20:10:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 19 Dec 2022 20:10:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:21 -0500 (EST)
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
X-Inumbo-ID: 14dc3411-8003-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1671498622; x=1671585022; bh=T3JB3kL6ns
	TUfVOdUZ48s4PCkZspjbxgDHHV7LQWbjM=; b=JD/+FaE7fJs6j5TeETViAu3l81
	nb/iVzkvbBw0JleHTMfCG/YLM80D1AmU1YJeD3carbL/kH7aseLVbQBQSBgfytJk
	MH9oC7tlPpZA1hRnokeNjaMD3oCH6XX/K6VrMKG+pyJumqPWbcyYfeCVfYreFJ/E
	3PkF0UVWNxKNMV3fgG//baOeH3pJHxHoexIuyMi+keOOaNFFaFH/Jd3GZlgscLZv
	QUpg7AZrGOgC30+KZglKCJKLBureW64uvRTCpUkl2vzw0ueDV2/njcLu57+mEZQP
	htp7kwGLM2ClRZmSpisZOE5jdFFSPfvztgzqVF9jijQYMgw269C1ixHe/vRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671498622; x=
	1671585022; bh=T3JB3kL6nsTUfVOdUZ48s4PCkZspjbxgDHHV7LQWbjM=; b=C
	LlC9TzLfpW5gg2BzEXfKcpiTjcURzlgOwpX09d8th9nQ6agEIVNeDnY9bselE0AW
	fwOitWW0OFnrgSY8mDxAxBqMIR2PtIfsC3pvaz6hcbarcYZfUeWeGSjR8D0ZRGNw
	kSb18jBiA3UmAySSD1Q9980NM/PpeVC7iaB68EdIAlx4zdmaB1vjdg9FQRnk1VS3
	s6MoytsYclb2MvFplmoMmWIAciUH0S6hUX7eaH2hTnEMTGxGSLfxmKAymnk0cO8J
	fI2UqQViTeCQLMJNV4kPw1HU98Im3dn7ZGfDpnIF2Xzo0GbdnkqbWovd1fmlwa7Y
	jPZ5EQSwXALUoQbGhbTrg==
X-ME-Sender: <xms:fguhY6bjNaCrj6kT0bjBjDpGxCWb5LpgLWf5VD2XO8RR04KdrBcYBg>
    <xme:fguhY9Ytd7q2XKvJr_3n7mrMJAKSs5YX5QTIak1DL9kdimJzTX-Ik4KbXmhPpewTx
    ugATf1tg0hyW5s>
X-ME-Received: <xmr:fguhY08glURL14DqPkbMN6kaHaB4_9LZGmz9IvLQzeiUxfOjGyCJlGepYJxXzR3yr1eruENcsOl3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepledukeelleejkeevkeefgefhffeg
    vdeigeelieegjefffeeiveeivdejgeevteeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:fguhY8onPb6L32HsLJ5ONdGIEZQ0P-1r0fmZW1kaQhDIRybZdlSjOA>
    <xmx:fguhY1oxRQi3UtznlsvEXwyc9G1X__Q8EE3PZ1-8veMbwgEmmWy5Ew>
    <xmx:fguhY6R7q7ubggbxev8q2AL_b1qujm7_EqduOxPt6ilEKe7KeVshQQ>
    <xmx:fguhY5e6mA9AJCNXghw0ZObU8n3TRhX-NeLJpHikd3STvnJmQYrQcA>
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
Subject: [PATCH v5 01/10] x86: Add memory type constants
Date: Mon, 19 Dec 2022 20:07:03 -0500
Message-Id: <704c1437341e70e0cd1d652e7681a2947a5c8969.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are not currently used, so there is no functional change.  Future
patches will use these constants.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v4:
- Add Jan Beulich’s Acked-by

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

