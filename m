Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8F651788
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466399.725287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9J-0004m9-KA; Tue, 20 Dec 2022 01:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466399.725287; Tue, 20 Dec 2022 01:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9J-0004ig-Gq; Tue, 20 Dec 2022 01:10:29 +0000
Received: by outflank-mailman (input) for mailman id 466399;
 Tue, 20 Dec 2022 01:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9I-0004T7-7x
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:28 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 162de5f6-8003-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 02:10:27 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 327673200920;
 Mon, 19 Dec 2022 20:10:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Dec 2022 20:10:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:24 -0500 (EST)
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
X-Inumbo-ID: 162de5f6-8003-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671498624; x=1671585024; bh=lFzZnM+/36X+U2Bz3srDM/CbhK+VJ5H9+Eg
	QROq3rOc=; b=iA9XJxccY2qqzS10W2SYmjCC3UMj5C2JQwLrsXD96iUGXFY4Mds
	FPRuqztrlcGpNw/5+bhkI46ixbHLkcsgurVus+XepkPpEmrolttmR/Te/OF4nnX3
	0cWYKJVa/0gT2c7Hf2MEWTnQ8PL/OnMW6nucA85uvEjHeLh/AMy+5GybxN8Jl9MF
	j4L8Z0vuoa9KnWaoZ1mg/xem00QXBVYEAt/mhBQ0XGMnFsWIIuExrDZpRCJlhEUg
	+RUj6SAVrOgLvK/UjKcZZraUKy7V2PRlxopMS6zLaSbwtXlqmxp7QVaEukjWnxFZ
	1zHiSEKB8V+rm80QK/G+kanGEbrmMxtxWFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671498624; x=1671585024; bh=lFzZnM+/36X+U
	2Bz3srDM/CbhK+VJ5H9+EgQROq3rOc=; b=aKsXSSeAszrVsf8DcxvcP8u1V4yC3
	dZVvfL9G7nCXU9oyNTBaTjby+uiDwTzjQRA0j3e6igozQ2RL1PeeJM8yzcP08mLP
	TIahCl6NC2Fn00BhryORgWbY9y6PFcBO3a8FFaNZByI1ljaIIN/RvfouB8QTF9Xb
	LShnAYADb6jRP6yFcOk6i6JD0EoNF2c6EK4Rgcpg8Rl+SIQ6Fzy+VUuLKCrl3McV
	RHlPVJ/5YprxQdD7y4rS2NZqnrk3R/jBW2L1jT1lzMd6NOH8iAre3qO1pP/tX0FX
	iQObTREmD7KQOLRSm5RrFQLoqMV7Sai0iIoSycp1kO+TbjdtSiueCz4Hw==
X-ME-Sender: <xms:gAuhY-lS272vngEAZMxAUpdl7a1iGXG4kO9C5xMjy-qTnyNZmpb_bQ>
    <xme:gAuhY12_oaeP2AkMTW0VF-xZYLQTvpQK-mdqPDch_4zUeBHV2eJXjm78njDNcQ_04
    3wyfa8d4XFRz1o>
X-ME-Received: <xmr:gAuhY8pg6LgKHm_DjBCjgYy_kdKbNjpr2me6ahrQ2GlGW0c-43eAu-zp88st9DElq9FgNwyBgtQK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:gAuhYykeAi1hiKr5oZ8hm3KLHiu_aDAFlPgsLHb8XGLMgi0_w_CfzA>
    <xmx:gAuhY81xD6kjk5EbFX88NNlHdDPmNWkwA4b34n3avkfnvAIg0OHQYQ>
    <xmx:gAuhY5s-tAvCk0vRpacwD6BlxsAfMAxf31cjUUJGinLKfWkpiBLV4g>
    <xmx:gAuhY9IP-ZYYEmRbn1npO9idc9qAZJC6sS6bXCQMKMnYl4kAupINoA>
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
Subject: [PATCH v5 02/10] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Date: Mon, 19 Dec 2022 20:07:04 -0500
Message-Id: <0026e56a0c91cb0dde9fe19200f473d720a9a950.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
the face of future PAT changes.  Instead, compute the actual cacheability
used by the CPU and switch on that, as this will work no matter what PAT
Xen uses.

No functional change intended.  This code is itself questionable and may
be removed in the future, but removing it would be an observable
behavior change and so is out of scope for this patch series.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v4:
- Do not add new pte_flags_to_cacheability() helper, as this code may be
  removed in the near future and so adding a new helper for it is a bad
  idea.
- Do not BUG() in the event of an unexpected cacheability.  This cannot
  happen, but it is simpler to force such types to UC than to prove that
  the BUG() is not reachable.

Changes since v3:
- Compute and use the actual cacheability as seen by the processor.

Changes since v2:
- Improve commit message.
---
 xen/arch/x86/mm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..dba6c77ef2f7ed7fcb7f7e526583ccadd35e62cc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -959,14 +959,16 @@ get_page_from_l1e(
             flip = _PAGE_RW;
         }
 
-        switch ( l1f & PAGE_CACHE_ATTRS )
+        switch ( 0xFF & (XEN_MSR_PAT >> (8 * pte_flags_to_cacheattr(l1f))) )
         {
-        case 0: /* WB */
-            flip |= _PAGE_PWT | _PAGE_PCD;
+        case X86_MT_UC:
+        case X86_MT_UCM:
+        case X86_MT_WC:
+            /* not cacheable */
             break;
-        case _PAGE_PWT: /* WT */
-        case _PAGE_PWT | _PAGE_PAT: /* WP */
-            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
+        default:
+            /* cacheable */
+            flip |= ((l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC);
             break;
         }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

