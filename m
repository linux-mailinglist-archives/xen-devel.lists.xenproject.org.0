Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8764D31D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462756.720963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axw-00071Q-Tl; Wed, 14 Dec 2022 23:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462756.720963; Wed, 14 Dec 2022 23:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axw-0006xj-Q5; Wed, 14 Dec 2022 23:15:08 +0000
Received: by outflank-mailman (input) for mailman id 462756;
 Wed, 14 Dec 2022 23:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5aw0-0000n2-UH
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:13:09 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbf4a208-7c04-11ed-8fd2-01056ac49cbb;
 Thu, 15 Dec 2022 00:13:04 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D503432005C1;
 Wed, 14 Dec 2022 18:13:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Dec 2022 18:13:02 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:13:00 -0500 (EST)
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
X-Inumbo-ID: dbf4a208-7c04-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059581; x=1671145981; bh=87eKmhvdtfrb1isW/t1MA2+ANFEQ1h0ZL33
	QPdjF+bA=; b=FA52gg/ldVP8/mDHjIl3wzYIM24bt2ZmmNGxVOELfKtAeM0mJL5
	HE8FIsSQ8VhSnyx6kX6EWHJArPPVvnWb1x2aSaWbL+Gxx4O5Qh8easV6iuwhUYGo
	BwDM+xq0hpQ3+V0/8ItjYBP6gqyYNkljpIq4XFRveh3CwSte30m2LG1MSPZyb6b9
	qyX9uAUkiEQzIP5H/F9fyURzlyYU4aXSPUltwqcDLiaRj/ROMVCi1Ks2ui6RTKsm
	7VXUt2MKamY2DVf6sdsl7pIfCNReHGNG+Ch3OpNIQrHeeSjfdcVXdOW1z5ug3MIU
	FgWrmsq3C+qt8YGgO7aBj9lLdQdDBQF6hFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059581; x=1671145981; bh=87eKmhvdtfrb1
	isW/t1MA2+ANFEQ1h0ZL33QPdjF+bA=; b=s4bUEdXREhud28zLogUKCzxjWGPc/
	6gY0A0KdVABLIrvLofBIrvh5e1GA0LmIMvoCzvIhtI0eexZCWEej2TFut4I4Kw9h
	BTRyKA2i7CSalUdptKwMT6wY9KYDHXY57ue2LhBP29nyHwK5qyCBt8bOGDiZMpPY
	MLF2CHRKMVpTnNGjsjv4Sv88UF+3wKlLsoeWKN6v/bw3d7Rl+1+mXex34kB50vLj
	1tKXLK4J6JdG5I3+r7lZCTZvpFmdTF/CVe+2sxsHTyRybmx0ECue2NgsYMGeuIMl
	Vnke+nGbovUPVXHrm3fcXbEbzWo7BndZign6S9nSiksmIAZAYa3g5zLzA==
X-ME-Sender: <xms:fViaY4E_owDu2I-8xUmvrWpVAq9wA6PgH_SBmCKKwI5GE3-1Pl2sZw>
    <xme:fViaYxUMcqHatRRPZ0vkY_79xndrJ7dxXFvC_nx_niIHXrJpouPwqN096xzROF4Q4
    O4YTv19nSZXGkw>
X-ME-Received: <xmr:fViaYyJbJoVpZgvWv-J_rnZ6gLsO1vK1DIhInPR6qgNtnRW7BwrcC6C9yY7xcdC4ARJoGpnp_sBP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:fViaY6HFcOusLHEintFQfvliru_IXDpQOD9M7NP-jC-XTb_D-ENgVA>
    <xmx:fViaY-WPQpuJIhrVUxFXaWS6pg_CUD6zmbiJe39OuqEABzoWTxBwCA>
    <xmx:fViaY9OeoaY9Ca4mL-OaWLCfwPSL6foeRQY-vyQ6PSf-gHA19_6zBg>
    <xmx:fViaYypQil7AcoP8uzLaLA1aeLuCYQxXC6BfLGZjmqMQPVemAl-3xg>
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
Subject: [PATCH v3 09/12] x86: Derive XEN_MSR_PAT from its individual entries
Date: Wed, 14 Dec 2022 18:11:59 -0500
Message-Id: <06d61ac0d94ac66476cb7207b00ab1f4eda36464.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids it being a magic constant that is difficult for humans to
decode.  Use BUILD_BUG_ON to check that the old and new values are
identical.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/processor.h | 10 +++++++++-
 xen/arch/x86/mm.c                    |  6 ++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8e2816fae9b97bd4e153a30cc3802971fe0355af..9535b1f7f49d75e6853365e6109a33359c740f4f 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -96,7 +96,15 @@
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
  * MSR_PAT value, and is an ABI with PV guests.
  */
-#define XEN_MSR_PAT _AC(0x050100070406, ULL)
+#define XEN_MSR_PAT (X86_MT_WB  << 0x00 | \
+                     X86_MT_WT  << 0x08 | \
+                     X86_MT_UCM << 0x10 | \
+                     X86_MT_UC  << 0x18 | \
+                     X86_MT_WC  << 0x20 | \
+                     X86_MT_WP  << 0x28 | \
+                     X86_MT_UC  << 0x30 | \
+                     X86_MT_UC  << 0x38 | \
+                     0)
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b73cb29327ba49703673886d09d79f2f8928a6c0..a8def47aa3bf9770576c62a190032d45d63dd86e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6355,6 +6355,12 @@ unsigned long get_upper_mfn_bound(void)
     return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
 }
 
+static void __init __maybe_unused build_assertions(void)
+{
+    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL &&
+                 "wrong XEN_MSR_PAT breaks PV guests");
+}
+
 /*
  * Local variables:
  * mode: C
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


