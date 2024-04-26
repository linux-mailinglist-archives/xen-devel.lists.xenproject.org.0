Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2BF8B3EB2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712996.1113947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnA-0005KB-MO; Fri, 26 Apr 2024 17:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712996.1113947; Fri, 26 Apr 2024 17:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnA-0005IY-JJ; Fri, 26 Apr 2024 17:55:24 +0000
Received: by outflank-mailman (input) for mailman id 712996;
 Fri, 26 Apr 2024 17:55:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0Pn9-0004Xj-Dy
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:55:23 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 260618b3-03f6-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 19:55:22 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.west.internal (Postfix) with ESMTP id D8156180016D;
 Fri, 26 Apr 2024 13:55:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 26 Apr 2024 13:55:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 13:55:17 -0400 (EDT)
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
X-Inumbo-ID: 260618b3-03f6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714154119; x=1714240519; bh=hZ6VYL08E0
	Yxr0n/W2twXlHVhmqK+fKxAH0QY/uH+Wo=; b=xs2zvhxGLs3oExmgpv9rsb/sDO
	MNOPuuCPOY2Ta2x5Z/mvPPwS02lH9YsCaD7UNpDRD/FyzvHGvhZfkBI5rxVxDTU0
	akH6DG36JROcTa2NEGC5a5zmyUUU91k+orj2fwdQhhLFO4CG6Vd1PlfRLj9e7hx4
	QAVrFZJhiwFhRK80w036RxErue025jJTkgsPDanOeaoC3jC4QTESIHsycq4VaygZ
	QQMVsB6KDQvdpJ2Wtpivn21fzm1wCxazpVeXNKjQgh/QD/8K6uxTEGCG2GSurMo3
	Eo79piZ1IRaoII3YUk5+SRi7J7SSI69FVLM61npKAtL1ozPr/ZSKQ/7640tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714154119; x=
	1714240519; bh=hZ6VYL08E0Yxr0n/W2twXlHVhmqK+fKxAH0QY/uH+Wo=; b=A
	pUpM5z6KUgj66KnRXZpz/IpOmOcn/BXo6LMrC1GxKHpRPBjgLhLi2bneJDBhdfD5
	f3luR4uOt+gHPzUynEZG9z8aLsqh74RHjfkKPXO73c3oR/in7vncFRKgtYtBGHKb
	h28tsrtAW2QdPa+Hx53Wtx+jPSSHL3Eh/3gskU64pThRzwLoJ9pvxTelsuhUDIdW
	4WU01dWajjdIQDMqXu8aczuPEZnNOvifHXjz6/dbVUY50dmi5ZxeO3sPpx7Y6Z7N
	Q5fJrTYEMgjQVgYm0TyIR6BokXM9DtriaUI3pV72GDgrCWUTWjzfR5CCvlC3b+Tn
	yq432rmWlYmbAVSi0B0iA==
X-ME-Sender: <xms:huorZnrlW6c5FdwzboFue8Rizo7HxP7UAMUOwQzipH4_LxrgkofYUw>
    <xme:huorZhptunK0sq9TSwDOX7Y9al4lRRJ1MWdnbCYvOVot__oek6-41Z7Dm1_xRItvy
    yMS90fqNRbMVw>
X-ME-Received: <xmr:huorZkMovm5rhXdz_W930EAtWHmR_w6bKdyD93d0Bq0oDvLuZXFJEYn7JYimUq8_UEHnp0GrHaRoqm7Az17JRrvqRfNlsdVtcbXjccgBZfaX4QRJJug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:huorZq7CyntHE4AL1R0510ysZq4UPFtNtL81zQGpU8m2yvzF3-hyAQ>
    <xmx:huorZm786HiNKvhacCZ7oEWW2vFSVgKPXiyzt_L_1ged3HKUMXgYzA>
    <xmx:huorZijrTGjxCgLJagqD88goxnPGmyKqRVxv56qRbW8hKfYGqTpL1g>
    <xmx:huorZo6hg2_4_nXNvFCRXbmVdKfia2t6xiHmFDT1rB2vbkOEEE5MNQ>
    <xmx:h-orZsmNaPLUD5Za-QX5C1__0WRkEpLTyabfwcMl4T6V5yCBVIBKg6Rk>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v6 4/7] automation: prevent QEMU access to /dev/mem in PCI passthrough tests
Date: Fri, 26 Apr 2024 19:54:01 +0200
Message-ID: <32e761446e5c20c81543e530e157ee2a0d67f131.1714154036.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

/dev/mem access doesn't work in dom0 in lockdown and in stubdomain.
Simulate this environment with removing /dev/mem device node. Full test
for lockdown and stubdomain will come later, when all requirements will
be in place.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
This can be applied only after QEMU change is committed. Otherwise the
test will fail.
---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index d81ed7b931cf..7eabc1bd6ad4 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -163,6 +163,8 @@ ifconfig eth0 up
 ifconfig xenbr0 up
 ifconfig xenbr0 192.168.0.1
 
+# ensure QEMU wont have access /dev/mem
+rm -f /dev/mem
 # get domU console content into test log
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
 xl create /etc/xen/domU.cfg
-- 
git-series 0.9.1

