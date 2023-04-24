Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60386ED666
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 22:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525617.816900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3FW-0004el-7L; Mon, 24 Apr 2023 20:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525617.816900; Mon, 24 Apr 2023 20:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3FW-0004cR-4N; Mon, 24 Apr 2023 20:57:26 +0000
Received: by outflank-mailman (input) for mailman id 525617;
 Mon, 24 Apr 2023 20:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr3FU-0004NP-In
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 20:57:24 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aaee8e7-e2e2-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 22:57:21 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B52193200957;
 Mon, 24 Apr 2023 16:57:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 24 Apr 2023 16:57:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 16:57:18 -0400 (EDT)
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
X-Inumbo-ID: 9aaee8e7-e2e2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682369839; x=1682456239; bh=Pz
	68EwyEOJjTpPRR8jDPy/O6zbrph/i2QW9YHpC90nc=; b=FGnOBNyXU/o2d6B1w0
	VCDvVAGlMKlA0uMcYFrZOJMYT3gDRk0wyr9jcvVrrgbY2ozHv6lMQCyOYiU9pf8O
	QKYa71eWE3MESH2nK7XnWKzsK8kp0tqeylU/WGvs0+r2wqyXD5WGkhBticZXt+03
	bTVsMHoKdVKGKDaaIX9onYD2+ralt8lhKZGmq53WYyXnhTIfG+/DnSKHbPeqyiFm
	/b3l8x6yjpYc2CQ3CJ/5TQepPrC2jyFRzG8oV8rXDk+nlXFh8lNXg1DNbMzcrtQB
	M4sOqIdplY9NBIHpDOUitMpnt3N+YQnS5ku3LzM47hMCYl04fNDXPUMlxflEaakn
	bPIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682369839; x=1682456239; bh=Pz68EwyEOJjTpPRR8jDPy/O6zbrph/i2QW9
	YHpC90nc=; b=CghUsxwCqzmvsSHQ6x3zMznX0oveaK+7q21nf2/vzdcqy2S5g2y
	+ICCJ+bUQUX5ijK6T6CfMNN9Is6jve2cLFcRRHrDiI/TXgpgiMWjgMVeN5KgHjDn
	ame7DfeOGoelLhgnkbNWCNRXohZCfCIyzxXmJ+11pz12Fme4vzrA+l+tHGTBvAp2
	yN4k7fgsCZHqgXeT9RR3k29CQHqNK0hN40UXGSnKhL4tNuOfOw2GY50Pv5ktEbSc
	mAJqMKIuNkPFiToHzzUCYnDAONYAvlT0Nl9xAqx/hB5zqPs0UyH2QchMfuaGnZSx
	9nmlM1ZxuINTGTpACSg3CFzMHMakWskM/nA==
X-ME-Sender: <xms:L-1GZKyVUohbFF2zXS31eTgMpVrFjUe8rZ34yfV9kygNaNzoxHI4Pw>
    <xme:L-1GZGReKKiZOy771bKs8zzjqS-p7kScQqPHgPtfqK1iD9DSFa2hCWtIpfqsrso6I
    PwTxotbTO-4uw>
X-ME-Received: <xmr:L-1GZMVgjpHWuKonX7NEe8fHyBCQTxkmxkvyHHgntk9FFZbCJwLkIZ5h5ClyeAyqmD7GfoH31FQh9cjNxumkHV_Z50KPG_ahvWPMCmRILAsfgGdzKdJN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:L-1GZAieDzXVB4Jtg0j_2VkHL5bshEpuzzU32pGQw90hNE6w5A5ZYg>
    <xmx:L-1GZMA9RXsrMfsyQsf-wZYoDexcph_RJKZXD7ZaHYidesfmX7X3oA>
    <xmx:L-1GZBJn3J8-YE0xrF-aYF4ubTSO8jTpGsaJqsmsNnh2W1jxWf26Bw>
    <xmx:L-1GZF5iqXTACnz4nOmf-gUCmvpElYUt_a100sWy0Wkkd9lUeczWvA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 1/6] automation: specify explicit dom0 mem size for ADL tests
Date: Mon, 24 Apr 2023 22:56:56 +0200
Message-Id: <acf4e8fbb74715335a08bf2a5a1008a117fec65f.1682369736.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Avoid memory fragmentation that leads to:
(XEN) common/memory.c:277:d0v10 Could not allocate order=9 extent: id=1 memflags=0xc0 (0 of 4)

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 2d4cf2e2268c..916dbaae59c3 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -123,7 +123,7 @@ TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
 echo '
-multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all
+multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
 module2 (http)/gitlab-ci/initrd-dom0
 ' > $TFTP/grub.cfg
-- 
git-series 0.9.1

