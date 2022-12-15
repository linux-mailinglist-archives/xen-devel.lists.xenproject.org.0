Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C204B64E4E1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463951.722324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7M-0003K7-Vz; Thu, 15 Dec 2022 23:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463951.722324; Thu, 15 Dec 2022 23:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7M-0003Hw-Q4; Thu, 15 Dec 2022 23:58:24 +0000
Received: by outflank-mailman (input) for mailman id 463951;
 Thu, 15 Dec 2022 23:58:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y7K-0001Aq-Qw
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:22 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a6010d0-7cd4-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 00:58:22 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id B06A9320090D;
 Thu, 15 Dec 2022 18:58:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 15 Dec 2022 18:58:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:18 -0500 (EST)
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
X-Inumbo-ID: 5a6010d0-7cd4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671148699; x=1671235099; bh=yqRlGUBA8627Pg2d0cE4nb/6aUtrRUpvVX5
	2JKIQ1P8=; b=TAQpiv9oOYJyht0OIGpKZL+VCQG2hPFXvJuT+Oh/YiASQKximOY
	oqty2/omdQ2yMJlBy9A2HTjJl9C1L0EH1t5xmWDo8AUXIgynCVbuZ1x8+Mfa9+t5
	KDoms/af+Z0KIA0YG7J/VfEG/Mbu4NJR/F4icVU7KAAPy0hpX1po4YKLcZWmv3iT
	PRj4cn4tfxNzX4Hto+hZpUISmXBbneu7CTQ6OZpgBFHuB9oUSHyspsI9rheoohnm
	27edWLvBYRbc/YMAr0Rps882g67Nulcf1UjNxGwzMb8IuKlvRHgfXN8bRcAOUQdq
	G+jBuIWruTQwoavxlL5G/hCrN5QcAxJyFUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671148699; x=1671235099; bh=yqRlGUBA8627P
	g2d0cE4nb/6aUtrRUpvVX52JKIQ1P8=; b=xP7t8sq9ZJ+ItJvilk1ofkmiULvLg
	0hrBeQH/m7WwckdgmARnlaXkXlytbLk1w3Ph4jp8CXh7E39dBOda0MvrjqRJwOn2
	GtYT9KFs+/ewBpy7dz+KQvpe7UZsutUfbQUw8VQ0tQJ76Q+UIwiUuK6Ldnmt6cQV
	Tym8fUlHz4WSZ4D5WAoylcXIplnNtpvmjxQNL0RVAC7NUw+xIHdB1qz0cuD1w8dc
	HemSmnlU75G5KS0Eclgsfs9CAH1pgBdlZoXUF4CMewQ5OHNNieb7X4ZFZhjH1rVP
	7VkgzCWYYplC5VEgTtMgG0Hh/+xgSqlud8LNqXPMUeqNRNg/IrG5Zfr1Q==
X-ME-Sender: <xms:m7SbY4Jgq3TM4sy62u-FcrHYn9XG0uwWP_8lTFMBwlb8RhaeGPWXnA>
    <xme:m7SbY4L_eqHF1NebVFvQSTtCkXmR9l9_sopvIuISVHsm20RhpK1Dsw6ps_rbvMmf-
    0Sr9nxyllPPHco>
X-ME-Received: <xmr:m7SbY4vuJYK0fpNhOHFQ6BqamwSq-QLFMgW9qWVwkf8XZaJAkv-5LGyxTsNml3uQ9AEaZRpIoL_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:m7SbY1bffjWeNUCn14HTe_gddaPsq_Jk-LRCtZ3IopP0DdpuTlSvvw>
    <xmx:m7SbY_YfOHeDwQTP36QmNpDrkSTsp2sLRw-7UMDDDbWRjtfB2aud7g>
    <xmx:m7SbYxA8S3tuyVmFo1VoBozV191LAr1V--jn7w2KnPHLS4Z0HaCC0g>
    <xmx:m7SbY9OPKcaxMIqCzg9xo3P9cCDbtm8BsdOJZWDQOsQzO1YhWVPysQ>
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
Subject: [PATCH v4 07/10] x86: Derive XEN_MSR_PAT from its individual entries
Date: Thu, 15 Dec 2022 18:57:49 -0500
Message-Id: <2d6b2f875f023e9f57a93e31e82f8eb908a36d36.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671139149.git.demi@invisiblethingslab.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids it being a magic constant that is difficult for humans to
decode.  Use BUILD_BUG_ON to check that the old and new values are
identical.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/processor.h | 9 ++++++++-
 xen/arch/x86/mm.c                    | 9 +++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index c3205ed9e10c1a57d23c5ecead66bebd82d87d06..ed71c9c975d56687eb126ec4ca7b271788e5f1d8 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -96,7 +96,14 @@
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
  * MSR_PAT value, and is an ABI with PV guests.
  */
-#define XEN_MSR_PAT _AC(0x050100070406, ULL)
+#define XEN_MSR_PAT ((_AC(X86_MT_WB,  ULL) << 0x00) | \
+                     (_AC(X86_MT_WT,  ULL) << 0x08) | \
+                     (_AC(X86_MT_UCM, ULL) << 0x10) | \
+                     (_AC(X86_MT_UC,  ULL) << 0x18) | \
+                     (_AC(X86_MT_WC,  ULL) << 0x20) | \
+                     (_AC(X86_MT_WP,  ULL) << 0x28) | \
+                     (_AC(X86_MT_UC,  ULL) << 0x30) | \
+                     (_AC(X86_MT_UC,  ULL) << 0x38))
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 802073a01c5cf4dc3cf1d58d28ea4d4e9e8149c7..eeaa9760d2aa38b5efa2cbf9d99290e7c432ddfe 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6357,6 +6357,15 @@ unsigned long get_upper_mfn_bound(void)
     return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
 }
 
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * If this trips, live migration of PV guests to and from this Xen is
+     * broken.
+     */
+    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


