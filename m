Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE0FA7EBDE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941011.1340597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rk3-0004E4-7N; Mon, 07 Apr 2025 19:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941011.1340597; Mon, 07 Apr 2025 19:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rk3-0004Bk-3v; Mon, 07 Apr 2025 19:02:43 +0000
Received: by outflank-mailman (input) for mailman id 941011;
 Mon, 07 Apr 2025 19:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wFJZ=WZ=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1u1rk1-0004Be-L0
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:02:41 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df93462c-13e2-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 21:02:39 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id DB938138134B;
 Mon,  7 Apr 2025 15:02:37 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-12.internal (MEProxy); Mon, 07 Apr 2025 15:02:37 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 2F08D2220073; Mon,  7 Apr 2025 15:02:37 -0400 (EDT)
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
X-Inumbo-ID: df93462c-13e2-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744052557;
	 x=1744138957; bh=bCo1qyJ6rZTiBfA+a51RdFo714rHFIPWspJfKngp7mU=; b=
	IpoS32TM2GnPNE8jNWp6Yxp5PoAZZ1OMYqFmOP/lmXEjsxbNamh0lZ6yrpD2dVKA
	WWCQweWeVuhzc2Pg+9QRByz5/uvT/HZFFnnbBmTXTbLIQICIPl1CSxG+3fkV4CKB
	8LRFcmpLsPg2E8Gpz24O/EEnrNGZMU2MAOsutpv+5xWiaDbNXmr62KdUIaQixDeQ
	tjuey6T7gZuL6Bo10i6c2EZyVYK1+2NKjiDOqEfrQRRg3wN61TeisjQ6oWMmkHey
	eN93pUPLtd0cDZUzYNzDSKXBIV16Oq/S1kZAR1NHg4bzgLTxdz3mi5p/l4vayKCF
	Urjo5NqY4U6twx007ihGuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744052557; x=
	1744138957; bh=bCo1qyJ6rZTiBfA+a51RdFo714rHFIPWspJfKngp7mU=; b=D
	Lkd2VJ7beZ5HHqDsQ69haYdUKdbhUW+vTzPtKMLui8vsiN6c4aYYQRsPeB8wTqVH
	la+9NpAwsbslNrHrISasLf4EfN2/VTZCQhMolxHV2e4gMQKdSgfI7bdryGkZLEUv
	kfRdnQ7rmk18ZCRjTPWOic/G71fPAEkHrJqzsiRtwfHudOcV9pqG1t209zuQmE2t
	ZJRJcdIF8huxbtRBGvh4KTY+YBqTwz7MSS3il8zgo0G55eXGe5YL5HOe9xvmJUpW
	YzUddTCmWDZCUP2S2+1Bm44irlAGBOBKuzdc3xhiNmlgwqJ6uzumj/4bv7TIlE71
	Oqs9ed3kNfsARPKR8F40g==
X-ME-Sender: <xms:TSH0Z3QKE0m2joPGDvtjPwxtKcFqHlhBx5FzewDaUBacNWue_5v7pA>
    <xme:TSH0Z4zHZbuNI-fk5frE4xc_deIbcX55RkINwLJnm1PCdJGFN9PXamLCgUY8hQJho
    64Lq_GHYAYdHo3WHz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvrdhprhiihiifrg
    hrrgesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhr
    ghdruhhkpdhrtghpthhtoheprhhosggvrhhtrdhjrghriihmihhksehfrhgvvgdrfhhrpd
    hrtghpthhtoheprghltghhrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhrgho
    jhhirghnrdiihhhurghnghesghhmrghilhdrtghomhdprhgtphhtthhopehkrhiikheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrd
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishht
    shdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:TSH0Z80WDpD9n7QYR6u06DYm7i-oCpVlSUDHOOTFSl2Doc_16VEgNw>
    <xmx:TSH0Z3BPWw4u6xEYbpDDusC3mTnWnkIL6Q2Ui596DKGEn1dWCpl7sQ>
    <xmx:TSH0Zwg3w70j6V51hHBnHO1aAGRspv6bll-Ld8ZdSy2exAP4xSLCIg>
    <xmx:TSH0Z7o61lvIp-0iMWrlAHHPrn-sjT0O_REA_Kzy-5lQGQOLO8DfFQ>
    <xmx:TSH0ZwtbPXSiP36-fUYJ42TP6UKSmhyfmOU7arb2HfwqrRW6bUUo3x5T>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T689809fba064b46a
Date: Mon, 07 Apr 2025 21:02:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Davis" <afd@ti.com>, "Andre Przywara" <andre.przywara@arm.com>,
 "Russell King" <linux@armlinux.org.uk>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Alexey Charkov" <alchark@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-Id: <d4a4f00f-ef52-4635-bd81-659e8dcf9fde@app.fastmail.com>
In-Reply-To: <20250407185650.411887-1-afd@ti.com>
References: <20250407185650.411887-1-afd@ti.com>
Subject: Re: [PATCH v5 0/5] Switch more ARM plats to sys-off handler API
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 7, 2025, at 20:56, Andrew Davis wrote:
> Hello all,
>
> Continuing the quest to remove the legacy pm_power_off() global
> function handler. Remove uses from arch/arm/ using the helper
> register_platform_power_off().
>
> These have been sent for several cycles without feedback, not
> sure if there are anymore active platform maintainers who
> can take these individually, maybe these remaining could
> go in directly though the arm-soc tree?

Sure, can you send them to soc@lists.linux.dev in a few
days, with any final Acks you may get? That way it ends up
in patchwork and I can trivially pick them up.

Since it's only a few one-line changes that all do the
same thing, you can also combine them into a single patch.

     Arnd

