Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E1CA48AF
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177996.1502001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLU-0000Zy-Qg; Thu, 04 Dec 2025 16:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177996.1502001; Thu, 04 Dec 2025 16:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLU-0000YC-Nh; Thu, 04 Dec 2025 16:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1177996;
 Thu, 04 Dec 2025 16:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCLT-0008JO-3W
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:38:19 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2881e1a-d12f-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 17:38:17 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id B04D9EC0596;
 Thu,  4 Dec 2025 11:38:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 04 Dec 2025 11:38:16 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:38:15 -0500 (EST)
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
X-Inumbo-ID: a2881e1a-d12f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866296; x=1764952696; bh=rd3USSJTOQ
	GgPaA3MkEgLhgVn41dCK5xgFAB+vXgTXw=; b=Peq+bqWHCMq9aG2AqoOL+6F5C2
	TLQ46F/Fs6n0BbvGyBeC4myPHQ7SaYTPvzUtZ/y/yv/Pq9Y2WCf07hC+g+5+s4P0
	SBzXhjIGOJXh7v23R0s+JuSOe8yYrsFD7dSDIsV/ygdsihGUCCeuPFmCDs4nv8+K
	3T36bJjWFjXK8sj+BYqlZ3mcKEvKMjr63k5esjKEV5N1oq/8ez/22RSgJMN3WXoh
	3WpYLBWhQ0nkgsJ/+JVRUBr9gBC7YiA5gVLoKINHUDQTP42lneFidE2o56x9zXhq
	k1nGIqicoq5vug7xkG1MCPuGyoGTRQOtMg0DYiEY2Yt+w/PdiT0loYMRaiXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866296; x=
	1764952696; bh=rd3USSJTOQGgPaA3MkEgLhgVn41dCK5xgFAB+vXgTXw=; b=p
	Dbvirod2TR1EamXiyegaUDs/ngXrpL9N7gcQpsiXaoUdU9QcaXshzj4sBXJURGpt
	+EIJtOjUas7neXuKywQCmqpRoxUSTmq7TtlncH8prN0lxa4xY/xVb1O+S3zt12/J
	9dJ+wtjVeUuAtmvcCLBi05Nf3VP8gRG+JUG9ewpGYT0YvXETD89RCsGDZrtZSfIW
	occr+2rDZP0XagwKhlM+ygww8kRmxQlCEyu5JTM/fHuSnZ4FbknmLIh2ONp4XZVI
	I1KvrjhuMPwFb5no198WMavQhSdIMng3wNdYXjfO4+G7uNLqZKL7xVNMRt+twn7/
	rWJN4fT9EWPUfGgkT/KiA==
X-ME-Sender: <xms:-Lgxadsg447WqXleSLdf1K9M2UspYnC7tWIOK8QEjuTmlIjoKL_7WQ>
    <xme:-LgxadWlSjVOjsEeG0cETxaBY076Db-KdltEPe2V6fQUZkWOwJShg724Ey4cnSOTz
    bei29vH3pMBHzDtWfrkGbo07LtLzOKcuAZCoSR8K9vMPeNhWM0>
X-ME-Received: <xmr:-LgxaZGMNPtB5irG84hBp25L1MEm-071Tpc1DRnkwGTVUnKbdBdoJchSTH3J1GS1PICU7BK3iAJ88zQrSOsQKac4vfR1dtibGm-W5RzpYfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffiedtgeev
    ffetledvgefhhfevgffhfeekleehueejjeegvddvgfffjeeutddvleenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtg
    hpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphht
    thhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehroh
    hgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:-Lgxaf1J9wRtfN4xfooq0S8GC-eh1DVMJODDXY31CHsNb328VKyhYQ>
    <xmx:-LgxabOLFRoE-gBAm-7-HYdiZXewH4wPewmbLxojrSDK9QK7vNloaA>
    <xmx:-Lgxae6mr32e6uzVmdSiPLBv0ZvpwH07w-35LAzydF7RZqADKxZ-hA>
    <xmx:-LgxaV0vZfFl0BJGRd37g4mm38OTGLMJJTKiKd9bjphxdoYLDAS1Yw>
    <xmx:-LgxaXEqOoCKJ71-vq6qze310K3U9s0fOOsow2b_XS3aN0iztMRbfTfo>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 05/12] Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
Date: Thu,  4 Dec 2025 17:37:26 +0100
Message-ID: <9489737256953defce752f60d5d9bc413e75a35a.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It uses this USB network interface.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This was posted before at https://lore.kernel.org/xen-devel/20250411203336.585215-1-marmarek@invisiblethingslab.com/
---
 scripts/build-linux.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 441b872..cf0e744 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -32,6 +32,7 @@ case $UNAME in
             | grep 'XEN' \
             | grep '=m' \
             | sed 's/=m/=y/g' >> .config
+        ./scripts/config --enable USB_RTL8152
         ;;
 
     aarch64)
-- 
git-series 0.9.1

