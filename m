Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D515264D30D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462662.720843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avZ-0000qE-Tw; Wed, 14 Dec 2022 23:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462662.720843; Wed, 14 Dec 2022 23:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avZ-0000nn-R5; Wed, 14 Dec 2022 23:12:41 +0000
Received: by outflank-mailman (input) for mailman id 462662;
 Wed, 14 Dec 2022 23:12:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5avZ-0000n2-3X
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:12:41 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd9a8f65-7c04-11ed-8fd2-01056ac49cbb;
 Thu, 15 Dec 2022 00:12:40 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C3A6C320055E;
 Wed, 14 Dec 2022 18:12:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 14 Dec 2022 18:12:38 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:12:36 -0500 (EST)
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
X-Inumbo-ID: cd9a8f65-7c04-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059557; x=1671145957; bh=aWoaeexOsevKUuSJawe3x9dsZCT9K2E19kY
	rYrNtZzk=; b=uirJ4be71n0cNmo3nf4DqD6DhXpfqt9e8iGSpEwVkR5n7IwslH/
	gnj2kh1WJ96xnxoS23EPiY7YI1FiH7s5aAYJi7E/ZyWwJ3/155Qzp9bP3JbS2n9t
	8o3jxT0PVtJ1GSsSg05k3hV5gPgSRvJjUv4BtUwpz46GW76adiXD0rVZcuLyBHAo
	tyYMF5WLP5N0j08OeRUndRtCwY/PQUyuVMYZZJF85YsDwks0IAXVd9ixlZw7xQQn
	2cl74/xKhiZaqPunxUHeohMsHzASenilOQpPF0pp7GtIIjgzZQFlSWfCgFWMJ8P0
	XieyeNgRndkr5qHUkusWIbyzit54XsRfV5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059557; x=1671145957; bh=aWoaeexOsevKU
	uSJawe3x9dsZCT9K2E19kYrYrNtZzk=; b=t8I9R8hXAuobHi7naP00EAXF8aN0I
	HieOgzalkA5o43720V1XXwhcuHb7b01jio0o5zmrxLsBCwC2Ly9/tYgF/Jn1rsEA
	qGT7XSL0ocPoGvgk/S7Ry60Ieputf7OakrMiZMqHy1/YDxU/kHtEEWe2XJKDcmXu
	EgRzCCWS3D00hQYsd5dNorlQW2N9Jeba6AmPTLfErQWGz2cjPV8AbKOq9Pge4ahO
	2cAXHjKLrieHO6nIHAMVakv5eiIWSitnaKY3dQLUnMdybTT9+gxKRlbd8+5OoTRY
	fclzMWXBCoM35LWhiya8LxnSpOBmD3P4uTd19A350CFuBz+xeugQHLtow==
X-ME-Sender: <xms:ZViaY26NjmL69YHvyT-3LkqM4h8pB7lEuGgsGSohCWlqa7QIdrf0wg>
    <xme:ZViaY_4nIRem5gAmhvhlQBTYy2eztYvK86pPEoBDfCZaHjiCugF-tdNKPtdGkJ8Gv
    GFJcQuqcCKawM8>
X-ME-Received: <xmr:ZViaY1eTlLzZPvGAHqyZgWcSsEIgddv6gQt1Sa-47Nq8x-k39aYkKyEB_fzJ72qx52I-SD_pQL7R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:ZViaYzJSulKjk919-pqitv8Uhdmov-_6IwOP2bFHYrK1ge-ZuXdKjQ>
    <xmx:ZViaY6Kvif2AUf0nn-nSMNbgdw_EB4sGLXB_nQ258DPbOTMDg8odAA>
    <xmx:ZViaY0zwqY30BQd4gDji6E4qYq1jwiBJ04cJbvbXnfmvHz4gZnJsHg>
    <xmx:ZViaY5__-qX4xGHDK0WJqFDNC4k4HOghBre7a23Px8_sCIPwx3J3fA>
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
Subject: [PATCH v3 02/12] p2m-pt: Avoid hard-coding Xen's PAT
Date: Wed, 14 Dec 2022 18:11:52 -0500
Message-Id: <a9d9fff6a4fe41b16ef7ce0794a85d8754524c3c.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code much easier to understand.  No functional change
intended.  As per Andrew Cooper, the existing logic is questionable, but
this does not make it any worse.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm/p2m-pt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index eaba2b0fb4e6830f52b7d112fba8175dfe6d2770..cd1af33b6772ab1016e8d4c3284a6bc5d282869d 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -99,13 +99,13 @@ static unsigned long p2m_type_to_flags(const struct p2m_domain *p2m,
         return flags | P2M_BASE_FLAGS | _PAGE_RW | _PAGE_NX_BIT;
     case p2m_mmio_direct:
         if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
-            flags |= _PAGE_RW;
+            flags |= _PAGE_RW | _PAGE_UCM;
         else
         {
-            flags |= _PAGE_PWT;
+            flags |= _PAGE_UC;
             ASSERT(!level);
         }
-        return flags | P2M_BASE_FLAGS | _PAGE_PCD;
+        return flags | P2M_BASE_FLAGS;
     }
 }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


