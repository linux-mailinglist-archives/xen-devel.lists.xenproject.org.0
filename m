Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D091D674205
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 20:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481277.746063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaDB-0002j5-IV; Thu, 19 Jan 2023 19:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481277.746063; Thu, 19 Jan 2023 19:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaDB-0002dP-Af; Thu, 19 Jan 2023 19:04:33 +0000
Received: by outflank-mailman (input) for mailman id 481277;
 Thu, 19 Jan 2023 19:04:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tmj6=5Q=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pIaDA-0002Ev-9A
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 19:04:32 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19ea16b0-982c-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 20:04:30 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id AEF315C011B;
 Thu, 19 Jan 2023 14:04:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 19 Jan 2023 14:04:29 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 14:04:28 -0500 (EST)
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
X-Inumbo-ID: 19ea16b0-982c-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674155069; x=1674241469; bh=xD2qxTwi/N
	WHKFJGn9LwYuXdkJ4R6DAu/R1nUg2IBG0=; b=ecpOATQXTQt1OzoFqAbAKuwXQ0
	P3/N3pE/0VHkO79vVJS3N2J/Rd4OQ2EYsI/8JxXuur6kDGkZ6YVocJ3ySEUWk9sC
	K3u1L8gMGZBo+8OxBCdShJo0RDA5nrICMOoSEOaa0IxOduZBwf0q3IapL+OfngmB
	qq68kfN1SIuWl2sPQqLNmvwmLM5M8tKqLAQw1dPgLuhAXER+We9ER2vT/0rFHt6v
	VPvkPbqobs1C0lFmmpD5kzpb7eKPmgN/VbMHV3WrKL6sYlN6EnWMOoKCcGUnJf3D
	xIgcJQBzGbgxqP2O6HsGOPlUUUUy8A4uRmxNbK/CJUhgFUalagYHzy6T171A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674155069; x=
	1674241469; bh=xD2qxTwi/NWHKFJGn9LwYuXdkJ4R6DAu/R1nUg2IBG0=; b=o
	68ZJd58KoLnxfMYqNc6GW6TyohkNX2AMV+/mm2cYVWNaKKPdY9GDHZ0q/dF/ON7Q
	zpIs0v6T4J5JkJ5uH1uv5oqEaQw+leGy9yKPN/xZH2zFKj3Aq/l/+rgq3oi6pZDE
	sFI3UGAEbys/g6nPMWkE85PsnD0EzDp0coYn/p4D98AyZjySp4PfbCtxDvdHLEQF
	47dfxn+ZiV9fqBKYXfpZz/bD310keEUiL0R8An8YPF8pw6MzxLwJQmXx5lQw4TGK
	PcLN/eD1pFZ6aO724/Kn+u1OjpY+U+8t+ZWykaElOSiHzxTywZuxdSjQzRwrwMvH
	HAeU5i7XO/EgLLO+/x6aA==
X-ME-Sender: <xms:PZTJYywVRv9e_jPD1JlUeYUEogg99S1ZlWfrcCHtckcBlCRT1Qapcw>
    <xme:PZTJY-SnYpx5gtA7aZaJVmkSuuvP9a2WIwuNhoIqKDkhSUKmytjl5hi9ctSh1TdHW
    1k8aYXGFGEmtOs>
X-ME-Received: <xmr:PZTJY0WsaK4q1u3vPbOZwE7_m_7s213-yq67z4tJYWD6dtAxXe3j1jNDM2Jngv0LbAOjybKeNoPy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgv
    mhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepledukeelleejkeevkeefgefh
    ffegvdeigeelieegjefffeeiveeivdejgeevteeinecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:PZTJY4jD1jeiU98W-4CXzhlO7tUA2SEQitukbTA72xPHi3FJXH-l6Q>
    <xmx:PZTJY0A1wSfRmLo0RYo23Hb7239yMW_5XQNIVfSBrcsjr2ADN5C9HA>
    <xmx:PZTJY5LIAZuI10qYrPS-w7Cmn8v-_uqg30qoUOAumWQFPHMsjWsuGQ>
    <xmx:PZTJY20dUyD8JdS0XJ9HZ7AvUxJF4-HZfkwMQqw848OERA03DOX8Bg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 5/5] efi: Warn if trying to reserve memory under Xen
Date: Thu, 19 Jan 2023 14:04:00 -0500
Message-Id: <e51d5abde5c5dfd122cb96f71d0dd8acc0cd358d.1669264419.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
References: <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Doing so cannot work and should never happen.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/firmware/efi/efi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index b49fcde06ca0ff5347047666f38b9309bd9cfe26..902f323499d8acc4f2b846a78993eb201448acad 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -519,6 +519,10 @@ void __init __weak efi_arch_mem_reserve(phys_addr_t addr, u64 size) {}
  */
 void __init efi_mem_reserve(phys_addr_t addr, u64 size)
 {
+	/* efi_mem_reserve() does not work under Xen */
+	if (WARN_ON_ONCE(efi_enabled(EFI_PARAVIRT)))
+		return;
+
 	if (!memblock_is_region_reserved(addr, size))
 		memblock_reserve(addr, size);
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

