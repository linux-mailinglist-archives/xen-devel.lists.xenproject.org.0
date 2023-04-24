Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F7B6ED668
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 22:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525620.816930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3Fc-0005RT-2x; Mon, 24 Apr 2023 20:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525620.816930; Mon, 24 Apr 2023 20:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3Fb-0005PR-Ua; Mon, 24 Apr 2023 20:57:31 +0000
Received: by outflank-mailman (input) for mailman id 525620;
 Mon, 24 Apr 2023 20:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr3Fa-00058D-99
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 20:57:30 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d2a711b-e2e2-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 22:57:27 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D94FF3200961;
 Mon, 24 Apr 2023 16:57:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 24 Apr 2023 16:57:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 16:57:22 -0400 (EDT)
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
X-Inumbo-ID: 9d2a711b-e2e2-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682369843; x=1682456243; bh=3v
	PSyWu0EY5YaauMa+bUaYbaLxnNRQBKTv6Gsjap6kI=; b=BLeF3GwjHE+CvCeiRi
	eFA308uh/jcX075it3+jUIrP6osEBdnHmoK9zFpIPklPWFrVwFNRk0Mh7UiufNlW
	jsSFZp5F3+YBliyjyS8FnhOzEVKzGsBavDsya7u5GEh7bp3dw91dUL38thqoOaOG
	ccQSmis5B0UML0Afn07mC4rOQI8VoQ144CiALOfjOUsOOk+CYaTm5xxT2wVwygFt
	nUfBKa+6vmfa8rLCvGyF5qWXT5dqpeVt9MPG4Rr938ULAbK04tg/OHNag6qzDBJc
	kYhrXk0CKx9G83TKWQzyiqZfQUS+tIUiFles7yEchc0RzBPit29ot+urCzF0ztKS
	p2Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682369843; x=1682456243; bh=3vPSyWu0EY5YaauMa+bUaYbaLxnNRQBKTv6
	Gsjap6kI=; b=AWvo9igIpldZuBJrpP6V5m3r80bMqAdR3BvS2g6Hts+EWfNLZCB
	8bkdYJytCkLjfqjFJ6LdzUJEC/v78OlOek3zvNNDfK7JvAy2PR0jT4ipQX4oeOSZ
	kaqLPPiRNz0NNHPGIUOcM7x4wWgBz99rte1vsb5yJAzYw2z23PHS2rHvSt+6XeVa
	E3wQloBv+hR9oWdNGAWS6arZj9jSVdGKl8Z0CDHG6tS4ZfO9OlKeDJ0dfUreNnKC
	VUrdyBzTT8rp5/rekHcII0cNjrx+h2ic0AIDUUPHEQe42dxK92lendLk8tQb5sqr
	3klhsRw1p91vQS1+eLv9SfnT1qZ3rCmvcTw==
X-ME-Sender: <xms:M-1GZMz0c63FvHxCD7Xnf7XXMfKTzu1QgDQIhWmMcPgJV4fb6Q5Juw>
    <xme:M-1GZASfVOQpTMpiK3pyftXAfzP13N2-Hhzrsa7mKGgnSdjqJF_S-7wJwvbVpAkjS
    qcOeth49bZQpQ>
X-ME-Received: <xmr:M-1GZOWk9UVKC0wCb5CdqHHBTd96SNSvtAHLil4AG7qvqRTOOip3QjpKFIZFLXFA6GUfVYE4cPXw62z1YdK7UszGwY-bi7MBX4ax_jEDPCjlg7lgehCv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:M-1GZKhfvFn6nCB6uktTUMOa5aeCZhvMaIG2fZp3I62gUU3SqbJjCw>
    <xmx:M-1GZOBuSY7S9ou1YM7I4T88i3Ph9xhB_LVu_WR6dKJBQNbqt2EdJw>
    <xmx:M-1GZLIRSIZJSCHG9TrgMQETBcZVwCvi49XwHJz0xY3LRqOfObNciw>
    <xmx:M-1GZP63UNfX41VKmwc27zEPKwny4JZ-iIuLg6b9eoNablUajcNpUA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 3/6] automation: re-enable building SeaBIOS in Alpine container
Date: Mon, 24 Apr 2023 22:56:58 +0200
Message-Id: <f28aa73c1db56ccfce23c408283af28195b5eac2.1682369736.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems to build just fine with Alpine 3.12, and SeaBIOS is necessary
for a HVM test (that use the Alpine build).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 7d1b19c4250d..d830cff7b7c7 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -77,8 +77,6 @@ else
     if ldd /bin/ls | grep -q musl; then
         # disable --disable-werror for QEMUU when building with MUSL
         cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
-        # SeaBIOS doesn't build on MUSL systems
-        cfgargs+=("--with-system-seabios=/bin/false")
     fi
 
     # Qemu requires Python 3.5 or later, and ninja
-- 
git-series 0.9.1

