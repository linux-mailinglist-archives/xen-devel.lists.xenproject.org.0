Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDD78B3EB6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712999.1113978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnF-0006B7-Pg; Fri, 26 Apr 2024 17:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712999.1113978; Fri, 26 Apr 2024 17:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnF-00068O-Kd; Fri, 26 Apr 2024 17:55:29 +0000
Received: by outflank-mailman (input) for mailman id 712999;
 Fri, 26 Apr 2024 17:55:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0PnE-0004Xj-9U
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:55:28 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 299045d3-03f6-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 19:55:27 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id 8A1CF1C00190;
 Fri, 26 Apr 2024 13:55:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 26 Apr 2024 13:55:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 13:55:23 -0400 (EDT)
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
X-Inumbo-ID: 299045d3-03f6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1714154125; x=1714240525; bh=EAaNxhwX2Xjwv3rkR/3PC
	xXHxt3VIaaNGAHnw+G6qes=; b=u7zuGf4H1tJzhYdMhUw6j5WAbOg2Ni53HgYI8
	IcVc2L4Y43Tyh40CbESmYe3iVCk5IrXwFT0xECjRu+3NRITqtQF+BHwIYxcCwom1
	VxLI07gOkiooqYeyLMC3ZL/O4On9/hnRuJH+MYnD49fg0EwkbN3XHtcUJebsdVMZ
	FriQoMfhFpfrLbEQQnz092NKczmUPChRwbinLJcLB/YrlZhkvDe+I8ZyL91/VxKm
	rlSaA1GwcH2A7IWJabmX5MhtW0UdrMExdmU4oXgiJ5L4t/9qkWIXlQuefjtSSup/
	9PLktvptnmfBy72MmHTHy+HcgW4nCSJaEqosF5hx7sxTtdxqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714154125; x=
	1714240525; bh=EAaNxhwX2Xjwv3rkR/3PCxXHxt3VIaaNGAHnw+G6qes=; b=k
	jtQkBKPw+dOGankWwaF8Qc8G4yGVzqZxw3GSdMNjtE/OtnuLMHogjfVhXpu78UgA
	DRLcqCAi4jvViUIFvZU/k2brSZauAayZT1w8h9Gf4iBw/BC57+To16g7GJGE196H
	PbJJvTYLhLIhpeBDggjVSk1OSfkDXD08RXutdCuXg366/AD7Lkp3TrzlNwfToO94
	Q6GCSikOJXIXXkF7dcPmCVn1o28UsOkpNh/gnXx7vw2PoRXIk9vW6ZsMEsx8K4nj
	RuUn/WNLY2bpVGtyxjCc7QuabGEXzyPheJhrFGhziGnFv3OkaeTwFRMsK5dz2WXC
	P95CpZYLqXkLdrttEXhHA==
X-ME-Sender: <xms:jOorZkBTWq9_9PwbXinbhpMDG0p8uHKvvNS7Y8gz1Z0jqIw0XOBmeA>
    <xme:jOorZmgON1fAfEi0lmkg9sHOEMc3dlgNL0xJi-2oraOPw7vD2NHnre96GzrQvK0EM
    om5ko_r43gYYw>
X-ME-Received: <xmr:jOorZnnqoggaqIw9ZSFzYUVBIlfVhFsCSK8x1b4W7Ji6F0XTkoWJF4uwRfbGPRFTelxN_s_CLt2-fKUsaY79iFVcncSfWRj_3yb_gipbz1xcGnVdiNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeg
    tedtieeghfekhfefgedvueeivddtffekledtiedvgfetleeuuefhteelveeugeenucffoh
    hmrghinhepgigvnhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:jOorZqz3dWapRAmtMg2_FDmTSytNRzkRpUPnfdmH5yoFVjstnLSDZA>
    <xmx:jOorZpTAklOJ6hX2ht93VZX6s7v5sMPL0C2J8MVdHW5qXHvacQpjaA>
    <xmx:jOorZlaT188txH9XVkt2ctotrWPrlBOYL4YCWXDQ3tO_-OefhuJWKg>
    <xmx:jOorZiSRDgdem6yJ2ybvVQD4p9zNAomKf40idzgJYR-QzPl9E6d_AA>
    <xmx:jeorZoEIA5-7jzYjdQEHtjLCGyo7C9aeHRm_SJ1kEaCsPw6qMQaZULqF>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 6/7] [DO NOT APPLY] switch to qemu fork
Date: Fri, 26 Apr 2024 19:54:03 +0200
Message-ID: <3138d1e229408b64dedd5ac3aa069b897117e549.1714154036.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
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

