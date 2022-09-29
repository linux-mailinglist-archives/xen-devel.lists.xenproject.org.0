Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F75EF6AD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 15:34:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413797.657717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtfR-0006dr-86; Thu, 29 Sep 2022 13:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413797.657717; Thu, 29 Sep 2022 13:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtfR-0006aU-40; Thu, 29 Sep 2022 13:33:33 +0000
Received: by outflank-mailman (input) for mailman id 413797;
 Thu, 29 Sep 2022 13:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OnIM=2A=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1odtfP-0005tj-U0
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 13:33:32 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bb8058c-3ffb-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 15:33:29 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8033C5C0178;
 Thu, 29 Sep 2022 09:33:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 29 Sep 2022 09:33:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 09:33:23 -0400 (EDT)
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
X-Inumbo-ID: 4bb8058c-3ffb-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1664458405; x=1664544805; bh=lGhOS0ndxVwarjq2rY27WoL7WTl8n59n9cj
	/5HY9Z1o=; b=QQSD+yp65nFxY3MUHhLBrv3wiXopCJ8BhD5soRg8zQgethPmNSA
	HWwBKMB5IfBZGM9V3ccC7hcVxgiYZ2uEOmUz3DsMifMbzhNptqbHqTH4d5JeyzXM
	a0wBND0Kv7tORNIHiYpi3LMSYo+P5u82Pgrk3W0AVFJp0eVCtQMDZdUMg3NywHqz
	BPQwF+GYagPQ9zWZ14ti7gCPo20nXcsAg08lknxZnGZO4RB7rAO/GFs7cwj4xvQx
	SdmrVRQt0oRpl8rvHtjAf8PGMumZs/gRdoafVEzTDuu8qW48cM2+mByQp/RihHSh
	pTlrKZ7ttYVBIS5y4M/Hpi5ttkkvBLfO37w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1664458405; x=1664544805; bh=lGhOS0ndxVwar
	jq2rY27WoL7WTl8n59n9cj/5HY9Z1o=; b=mEsBP4usaqa1WAEHl5TDfMOXkzQb3
	JEs8nByKn3UnGv2xpVSqFJ+pio15MOyitAiFYLWTe+AMLkelrtiH2wJndOC6mhrh
	v0rZkIbb//eJBIz1BgyVekN5M3aHhNaRUs4ea+WY+wmDZNrFjISu1LyW8J3rsVQI
	hU4MCavcpvsQi/gtVffraEe7ubN0hQX5HQ+fb8yF0imZnVpR7dhumqPSfQxk+Ork
	p+4c2XNighWN810rJ72QNpqRKCEyn2g4dxGDg9ArkJUn21EID3viWRsOxPYuCn5S
	/sLZA8GZuKwVU6sdIxtZWUazupXQ5KZC6fCLY0Uk9Cuf95PGPYVPppC5w==
X-ME-Sender: <xms:pZ41Y00ESIGKrYdFub8sFxe_KKtXEVo43un-aLeD0JrxsUntgHRB1Q>
    <xme:pZ41Y_EeecRIpjlU_9JcWZGfjFR5mFVvu5hojoY2VF1TRH-MLeGXoDck7okxa-Tp2
    chdlh6T07AyPw>
X-ME-Received: <xmr:pZ41Y84K6_Stw9smIeaBzdnyUtkAqmV5KVDdyPhTjsFSpvfIA14P943Vl8kLAJ7TrzcKIlF8M4QWi6bY3qF_JQMy9P8XQyq11pLu4AOI5kPig7RlF1RDog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:pZ41Y90ZlFJRD_w9Gh_hdD9KNFR0hmVNOXX5o1yypJLvKVhAKFZALg>
    <xmx:pZ41Y3FVS_JuTe5UwjCEUrKDe79V8CbZIJ7TRj4akah6y5vFJXJr2Q>
    <xmx:pZ41Y2-D6RsYKWA0Q6DNBezKdz3RCls5gZ8FVwZ9bLbbtCQs_eIizQ>
    <xmx:pZ41Y-BrB9Uuw0Mhyc5zs7ZiGQrgS0JHgKIlOzGQ4gOcGuohI_GQNQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 0/2] Add Xue - console over USB 3 Debug Capability
Date: Thu, 29 Sep 2022 15:33:11 +0200
Message-Id: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is integration of https://github.com/connojd/xue into mainline Xen.
This patch series includes several patches that I made in the process, some are
very loosely related.

The driver developed by Connor supports console via USB3 debug capability. The
capability is designed to operate mostly independently of normal XHCI driver,
so this patch series allows dom0 to drive standard USB3 controller part, while
Xen uses DbC for console output.

Changes since RFC:
 - move the driver to xue.c, remove non-Xen parts, remove now unneeded abstraction
 - adjust for Xen code style
 - build for x86 only
 - drop patch hidding the device from dom0
Changes since v1:
 - drop ehci patch - already applied
 - adjust for review comments from Jan (see changelogs in individual patches)
Changes since v2:
 - add runtime option to share (or not) the controller with dom0 or other domains
 - add RX support
 - several smaller changes according to review comments
Changes since v3:
 - put controller sharing behind experimental kconfig option
 - several other changes according to review comments
Changes since v4:
 - drop first 4 patches - already applied to staging
 - split dbgp=xhci into dbc=xhci
Changes since v5:
 - roll dbc=xhci back into dbgp=xhci, but make it work together with dbgp=ehci
Changes since v6:
 - reorder patches - put acked ones early (I've put acked IOMMU ones early too,
   even without VT-d, because they do make it work on AMD, and it's kind
   of required to get the console work with IOMMU enabled)
 - drop barriers patch (at least for now)
 - new patches for suspend support and console=ehci alias
Changes since v7:
 - drop commited already patches
 - drop "onsole: support multiple serial console simultaneously" as there is no interest in including it
 - adjust VT-d patch according to Kevin's request

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Connor Davis <connojdavis@gmail.com>

Marek Marczykowski-Górecki (2):
  IOMMU/VT-d: wire common device reserved memory API
  drivers/char: suspend handling in XHCI console driver

 xen/drivers/char/xhci-dbc.c        |  55 +++++++-
 xen/drivers/passthrough/vtd/dmar.c | 196 +++++++++++++++++-------------
 2 files changed, 163 insertions(+), 88 deletions(-)

base-commit: b726541d94bd0a80b5864d17a2cd2e6d73a3fe0a
-- 
git-series 0.9.1

