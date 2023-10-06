Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBB7BB030
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 04:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613208.953610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDp-0007GB-8n; Fri, 06 Oct 2023 02:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613208.953610; Fri, 06 Oct 2023 02:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDp-0007D3-4H; Fri, 06 Oct 2023 02:05:45 +0000
Received: by outflank-mailman (input) for mailman id 613208;
 Fri, 06 Oct 2023 02:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zii=FU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qoaDn-0006iG-8M
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 02:05:43 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7845d08-63ec-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 04:05:38 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 44F655C0308;
 Thu,  5 Oct 2023 22:05:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 05 Oct 2023 22:05:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Oct 2023 22:05:35 -0400 (EDT)
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
X-Inumbo-ID: d7845d08-63ec-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696557937; x=1696644337; bh=/0
	k9WHwXNqvWmO3gj4B3oauirCAI88+YlsPrCwqgrk4=; b=LeRY9LYMU2+CimbFn/
	biABePlO+sO2lLVhYYLXg29MT0pTbVBUog8wyRDkmHBWfA+YaRVP02Wv1XNcmDFR
	vqV72HZhQmCSAOmFJQB831K9RLyUS/BekINe4Pphy694R0w8xT3+RDiimR6vxdAL
	492ZrZdPv6DsmtLmWLqdA1UI2x2QdsQD2xtnLFsPFx9GPxPm+3hsh9qqyESzLBVB
	alGVlDfKcZkjozjye/yFFYOky7r6AybGG8hf+dvnOAS4hyDR0wn+Zzy4Lxc0RxT5
	FdIfQJ9bVzhlLM0IRY0zSrqYuV/7zicmmHX4TBehnXVNjcUINBbePE6xk/kH01XM
	39fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696557937; x=1696644337; bh=/0k9WHwXNqvWmO3gj4B3oauirCAI88+YlsP
	rCwqgrk4=; b=Xs0G7DOjMWEqyvZDLUEXYCFMTXQtXo5AePfTJoy6K/FaGIFulxq
	3K9IUdiQQfCf66N1al3sSNfKucLSo4BYYZULJH4nfbgmu/JvqeCjUdYSI0o1jAn0
	BpmY8ufTr0CloRit+EC4CLi9oGu0g8H1Uen4P5Npiw1poML+e4yxxEBt0fI1/dgq
	7limGskMroHaaxoQc/dP/mE+9OAqlJkZwRinJJOPJcT05MNn5+uartxa/uPuGW1c
	33SofTZzYGSorP60VZETH6eebwR8QmMeebLQO4qpny4YkxH1mg/LCUzIhloz79Yk
	CH2ZiF3L0G7Y0tHJcn+MeK9FSdyLgDOHwiQ==
X-ME-Sender: <xms:cWsfZRKKHjyf7dx33y3qApKpp4AGF7YfEJsnPK0GPuuS6-VhZu9hrA>
    <xme:cWsfZdIRmzWLcDphyw566esNlJn5ErQzqSb3siI9QHtF_CIS4Lbi3l9wHBjy_DHmq
    sDyXRSjvFW2Zg>
X-ME-Received: <xmr:cWsfZZuaAabWzA12AMbdNWo4sXqkEwEjzguXy4SxFCGtU_Hh9uAnDJuL68C78aBdK6CwIc9AEOc2J9gCnOXRxHxrMZicnhP-JUmXX0xfmJhuLmtVxOx5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:cWsfZSaCXVV-cjudgCaqQ9VG50SPCcYliAAjp6R6S5OeQRHf_gogkQ>
    <xmx:cWsfZYZSCofz_pUsnvRF1skXPSNtzYSOmgV45CEAi0ElwAkie2yinA>
    <xmx:cWsfZWAj-I0_umtOGZ5w9k6Us-LnPLIfG__MyTGRkjug37PC7x_b7Q>
    <xmx:cWsfZXnqvrUqqlgYkSMGPAqd8cz0GO_PTJx6rLkVHTrLXf1_GHXSng>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] automation: hide timeout countdown in log
Date: Fri,  6 Oct 2023 04:05:16 +0200
Message-ID: <126f25fd791aa1f3e32463e600c59967504e19b6.1696557834.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

grep+sleep message every 1s makes job log unnecessary hard to read.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I know I can download serial log file, but that's 3 more clicks...
---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 1e84e40a4afc..5464d10fc343 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -222,10 +222,12 @@ if [ -n "$wait_and_wakeup" ]; then
     ssh $CONTROLLER wake
 fi
 
+set +x
 until grep "^Welcome to Alpine Linux" smoke.serial || [ $timeout -le 0 ]; do
     sleep 1;
     : $((--timeout))
 done
+set -x
 
 tail -n 100 smoke.serial
 
-- 
git-series 0.9.1

