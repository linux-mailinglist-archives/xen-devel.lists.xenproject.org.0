Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279AA87AA4A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692562.1079871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLt-0007Eq-2E; Wed, 13 Mar 2024 15:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692562.1079871; Wed, 13 Mar 2024 15:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLs-0007C2-TR; Wed, 13 Mar 2024 15:17:08 +0000
Received: by outflank-mailman (input) for mailman id 692562;
 Wed, 13 Mar 2024 15:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIWB=KT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkQLr-0005e0-1h
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:17:07 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bff73287-e14c-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:17:05 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id C60E311400DD;
 Wed, 13 Mar 2024 11:17:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 13 Mar 2024 11:17:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 11:17:02 -0400 (EDT)
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
X-Inumbo-ID: bff73287-e14c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1710343024; x=1710429424; bh=EAaNxhwX2Xjwv3rkR/3PC
	xXHxt3VIaaNGAHnw+G6qes=; b=acADtP9QRyyn8PJwbdwhm88aXtQqPHU12Fbbj
	N8frPzd8tdm/OhDuIgUQtsKehufgu9wixeyCya6oEkPL3txyGY2dTMU3uot46Xbk
	0Hg/MJEjfZB6L49seBY9knk9daX33ysIdzcI/0LaG/c9jeShzZrsj6j4jsTccEpX
	LwEt39OltxmF3Sve1UcSsdpD1SA2LdtfE2iLlmk3NP8DYolmugiG37ssjGL4VSDA
	Z/J/SgEQOZKU93htoIs8yXLHDLD4zD39lRskI2hHsHCXf6ZsUMszSeE9JlBmCIEm
	Ox05/eyqS+sbhkAZ1MMmddWzWjq+0fzQ9mvBCKkOEdA27nZaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710343024; x=
	1710429424; bh=EAaNxhwX2Xjwv3rkR/3PCxXHxt3VIaaNGAHnw+G6qes=; b=U
	S59gh9E6ezjwJybiFwfZyFajpPZ+WRq5lP68XP4idnLSc5mCKqg0A5VVAuR2BK79
	SuCqxi6ZDC4MkaYYbP6eUFbZw32J/BTHJszVgaf+72cck0NZGMps3qi1peD7Txkc
	Ka6CU+55Kkv4wrTntfFTcJykXqXNfg9A5qRwMrazk0vG6pPPLiDQsTHIKmkdL4Cz
	cXt0TAO4tFLGaP2K/Lm06TDcs9Gy7NbK0pzkveauX0sqkdU9OJMMSRiP2YRf88lp
	nkHmVBlIQIrk58s9aeskEA3EvtqYdPNH74Ku9DUg+FVYcI0UvpLrJ0TwLbWss+0Y
	JxIhyMC/FopTPrAL6noIg==
X-ME-Sender: <xms:cMPxZZ1OUAIFzkfb-HYj4sr3wbynpo86pQ7GkL3aSbQG3vh-0ehkgg>
    <xme:cMPxZQGjhAnfHynWvroC2p9jabOU0GlTFmBxYpIpkWdTlzPq9yg949-50pNQLQBJC
    NU5wA4Ha8cRnA>
X-ME-Received: <xmr:cMPxZZ6lOFL8PeT4XI_MudJHvii9rVaYGZLZXqGrRKm5mJ2LsJiLBDj1aNkTiUfdow1HqTDJgNawy8nrIpF4kFymNAYbKpv2-7rtVhD6wB8kHO377hM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegtedt
    ieeghfekhfefgedvueeivddtffekledtiedvgfetleeuuefhteelveeugeenucffohhmrg
    hinhepgigvnhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:cMPxZW3kdd0rWvKWnVIY4QMnorqfgR2K-PbR_Zk9Xw7OUnnoF6krag>
    <xmx:cMPxZcH0K427WH9f0wZqUi7Y_CYb_MNQrcJbCsPTiIcsSvWfkEq4Gg>
    <xmx:cMPxZX84bxqndIf-9TSEQtTGsfozpKBRGoI8Wh2_ll0oHW5hctFu0w>
    <xmx:cMPxZZm5ztc013F6egFH1GKUbklrbgHIEuDKi5pZexYL00T0nEU3sw>
    <xmx:cMPxZaYx9NSXI47CsdS6YuKIDKTXh4mukTmtZjWDwtiXb-iy7UvLcQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 6/7] [DO NOT APPLY] switch to qemu fork
Date: Wed, 13 Mar 2024 16:16:11 +0100
Message-ID: <ef8fb98fd1fe72035408a060b437021d352e936e.1710342968.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes tests to use patched QEMU, to actually test the new behavior.
---
 Config.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index a962f095ca16..5e220a1284e4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -220,8 +220,8 @@ endif
 OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
-QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_URL ?= https://github.com/marmarek/qemu
+QEMU_UPSTREAM_REVISION ?= origin/msix
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= b6a5b4d72b88e5c4faed01f5a44505de022860fc
-- 
git-series 0.9.1

