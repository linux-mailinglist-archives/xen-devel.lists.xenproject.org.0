Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22DF87AA48
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692560.1079853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLq-0006gz-Bn; Wed, 13 Mar 2024 15:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692560.1079853; Wed, 13 Mar 2024 15:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLq-0006e2-5Q; Wed, 13 Mar 2024 15:17:06 +0000
Received: by outflank-mailman (input) for mailman id 692560;
 Wed, 13 Mar 2024 15:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIWB=KT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkQLn-0005e0-QN
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:17:03 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdc0fcfa-e14c-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:17:02 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 103E411400FA;
 Wed, 13 Mar 2024 11:17:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 13 Mar 2024 11:17:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 11:16:59 -0400 (EDT)
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
X-Inumbo-ID: bdc0fcfa-e14c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710343021; x=1710429421; bh=hZ6VYL08E0
	Yxr0n/W2twXlHVhmqK+fKxAH0QY/uH+Wo=; b=DtCO9B0Weh6roG52LY1gbplx+E
	pOHVHU3cIwZxGbAk67lMYRoZqPOKa5HpnoX0+DOkBBOXXqAuj1JEYNtJ8nAwkrGf
	MtQbKFbsA5vG4n4uczfKmbqco5URvdWXnnlrHB7dGUEbN1+gc34kmkD+6eVztq9l
	jqf5F27Q6V/8gwk1ciC6r+idj4LKELarJnGrBC7hKS9cOngLl1XtHVbjKdk25IoD
	HIgdk5tdVq6FHiN0eLYQTGH2qSwXjKq7t1usUiKK1X9Z80L0mEGW6T8svBfFkfcB
	GB5+Z84X/xZ08dcq+sDj+o7bSRz5PEdEeBX/70n+AgGzJz9mAK8PRQpkwxNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710343021; x=
	1710429421; bh=hZ6VYL08E0Yxr0n/W2twXlHVhmqK+fKxAH0QY/uH+Wo=; b=X
	ip+AMW2NM5y535jgAklSMHFg8JKlfSPzv51c0gaL6qnf/pxO/4p7D9LcvBP/pF8m
	V6DbccH1hLj01GXmdELnpv5CjZ5vGH2oyRLqrRM5phBW/S6QJLQo1XrUTURxQTfA
	m/dNjfvOjdyViLq/6Z75zkvKgtgfBnq198JfWBLhAeKYEBOD1JIA9KRzUI7+S6Mn
	J+c353aAXSAolhZH0Q62h/oK3bX0SuI3s7GtT1Zh4IzSVXtVKMHHlsGKP9kAKRPl
	g9r9+FrWca1amYbE4afeQlgjlVYPA2VslWHQREK/ZFmgpZoIaQnkmELXJGaGRhmF
	BFxQ7ZTE6SrTclzRFwswg==
X-ME-Sender: <xms:bMPxZfbHObqkVlji-2J5Rc1_1cdo5jGacDSeO15rv46CH8u-G9MJxg>
    <xme:bMPxZeZD_yYIdCZiUQmjlvExazXgiXtzqBk44y0EHbHJqSE5Iw0IyChlJBBCOlsO1
    UWxlhVvO84QvQ>
X-ME-Received: <xmr:bMPxZR_lGPV7Watmah9N85-Lyln0KuVyIZqnFforHDg_adyC564gE3mWS1LXjrvy6y7qFaEfK73ML4Vz7j5eZ8Kgp12t7lCWnX40WoDPynwZhV4oMDk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:bMPxZVrU6hiT28-plZwa1NCFHiJyaAmS4KVLJhQYT2eZUuns5fkl6Q>
    <xmx:bMPxZaoKAaLUfeVsigl3fLR9uPkKL_uD1h3WoP9UMTTiLGRcDOhZRw>
    <xmx:bMPxZbTipKt2qe6A0Njshp5Q6-KrwlmHNsesWfd_0i_xcbFh-2Wc2A>
    <xmx:bMPxZSrQb8FIupUHLETUTZid_VIXv4Iae91tX8308RdBdsu4t1eNog>
    <xmx:bcPxZTl6t-IIxfOmky6idWgMZMpM0WgoL9SWL-R17aSrvwoHfaWEAA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v5 4/7] automation: prevent QEMU access to /dev/mem in PCI passthrough tests
Date: Wed, 13 Mar 2024 16:16:09 +0100
Message-ID: <2ba54ff3f9021d5790a3bfccb27468c18fadc6bf.1710342968.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
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

