Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA98654892
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 23:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468693.727876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6e-0003PG-MK; Thu, 22 Dec 2022 22:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468693.727876; Thu, 22 Dec 2022 22:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6e-0003MJ-HE; Thu, 22 Dec 2022 22:32:04 +0000
Received: by outflank-mailman (input) for mailman id 468693;
 Thu, 22 Dec 2022 22:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8U6d-00036m-7u
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 22:32:03 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 743f9127-8248-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 23:32:02 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AAC75C0058;
 Thu, 22 Dec 2022 17:32:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 22 Dec 2022 17:32:01 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 17:32:00 -0500 (EST)
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
X-Inumbo-ID: 743f9127-8248-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671748321; x=1671834721; bh=stsAj8efjAH+7X41vqsLyccjvQ6YH6z+WS4
	jsBqOFS8=; b=FAZy1rGfenZ3yjipjxRdTMMozI2Y+P98wYbKYQVl0OOvfrtK8I5
	rJd0t8dwEbS8Yf3ai4T0l/oAMnDyK9MX95eQO2gTAD7Og9IvnZfs2pXRoVVWrGCb
	Wb48x0dQjzFfhRpo1RDzBb9AxeJEmUib4tF7ZaV2Pef9r+CG9mfVVlqVh2waz2y1
	IBp/b6Ml19zoc8JC0xnadBazGuEukGnU1A9xfmrW1HX+i3zl0g9jYfagNm5roOo8
	wFE9pxhQLbtfzhEoJa5wTxqsckv59CK6NlmulTq5H8nERMB2T2Ns5Z43HgjFYQZX
	JDhgpaLuUF5wWSMZyZ/fT4vcmG7B1NFoVmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671748321; x=1671834721; bh=stsAj8efjAH+7
	X41vqsLyccjvQ6YH6z+WS4jsBqOFS8=; b=lxGN5nUtk0sn4ectbnYe9qMTWO+m2
	Pnu4yq0ATH/pUnTZ0ouolgvQygPiFymPO4BQn3xpaCxeRoYUr+79gu0CpZZuYCST
	00HD0WhTYusb9x2LJvHtMqtf3VfQKs17BXJh4fRaASllXpstfnve7kvb1SCyxASZ
	3w4YtfLeFQa8g5rl7fQF78L3Lno1wMIaNzvaSnREizgtEQ6kowhW/2sMwAO3WkDV
	9HpJb9WdpxYQzm5I1eM04U5GSvD6N//dEzW/Ec+seY5L9t8RILNhtzlPGcW69IVi
	1wTpD3qn62HdbnSXl3zA1Q9+BXDMOkz3Yw4ORx3TwCheWGWvASyIJ7vvA==
X-ME-Sender: <xms:4dqkY4Hpjr_qIy7QDodaaHDiDxp3Uw80EnjSvYPXOdtZWfbNZTJzaw>
    <xme:4dqkYxVuhV53JQWQPBW1DfU8N_-1EJ_JMCKrDOKC5PxOpYMa2zF4r-4DhImCcDMPV
    Uc1dp5su5S-3-0>
X-ME-Received: <xmr:4dqkYyIVc8go0GCANOxNWlerpH8u-tqZSMSzsUi3QAWnbB8oF2ShITs2uBlrnWnXw_9TSA3Bfz48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrheduucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhiucforghr
    ihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfehgffhhfff
    jeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:4dqkY6H3N_qcZHyOobxR5PyxYvHGs7gzYxtPsYDMPxGy8cpkV1Lu3g>
    <xmx:4dqkY-XZ_vRUU8tZIDCvxsORKAMCPaz3l1GV17p-l65cgbZMNu09ew>
    <xmx:4dqkY9MgST7wJwbnStmH1ej2aA8nnI-27Lw0GVFH5lhrZDYz1EdeBg>
    <xmx:4dqkYwKx_ZrL6uAEjU7LCr1HujsC6Xk1yVABw3OCdHm7Na-tY-48iw>
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
Subject: [PATCH v6 1/5] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Date: Thu, 22 Dec 2022 17:31:46 -0500
Message-Id: <42da0d18476a3fbb01199f1d84ec0ebd845920ed.1671744225.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671744225.git.demi@invisiblethingslab.com>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v5:
- Make comment in get_page_from_l1e() future-proof.
- Explicitly state how known-uncacheable and potentially-cacheable types
  are handled.

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
index 1bda1ba697b434b6c884f17e599aa9b6d3b3dd76..3558ca215b02a517d55d75329d645ae5905424e4 100644
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
+            /* not cacheable, allow */
             break;
-        case _PAGE_PWT: /* WT */
-        case _PAGE_PWT | _PAGE_PAT: /* WP */
-            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
+        default:
+            /* potentially cacheable, force to UC */
+            flip |= ((l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC);
             break;
         }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

