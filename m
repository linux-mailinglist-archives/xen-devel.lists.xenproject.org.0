Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5732170F086
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538843.839129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jjR-0000oh-8x; Wed, 24 May 2023 08:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538843.839129; Wed, 24 May 2023 08:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jjR-0000mV-66; Wed, 24 May 2023 08:20:29 +0000
Received: by outflank-mailman (input) for mailman id 538843;
 Wed, 24 May 2023 08:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LsG=BN=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1q1jjO-0000mN-Uk
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:20:27 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3c507cb-fa0b-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:20:23 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C7A45C02B8;
 Wed, 24 May 2023 04:20:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 24 May 2023 04:20:22 -0400
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 35350B60089; Wed, 24 May 2023 04:20:21 -0400 (EDT)
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
X-Inumbo-ID: d3c507cb-fa0b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684916422; x=1685002822; bh=tY
	Zdd2ag8G3DyUn++y9TtCSdP5cAJ0TR5Ul9fhN2ndw=; b=DQIgslMqP/BQhUqd+t
	TJ5lyK533g0PXZguW7fgbQbaEZL0TJ6DFtc0ztFW9/a/IPbtrzNHzYuUd8JR+mla
	1YAiG8vP20QJnfs3dqAcyoqHPHe4rpqA16INAETgsmF1hmMduNo7rEsBQmWC/gQN
	o2ok4bed7fLvnqjtX3/8jvusNErESnd6JgLIdbOlYWhjuFOfEQears9rNIm/33fh
	8zYdThXmJRmr/e/u5YEVPR2ESWnKuwRMl3JCGYLrCsZMSC4CV7aGDRix3N2a9qGZ
	DHIHYDNcVwMnW7+oV1XF4xesNa2Fbx451/JOPtk7/sAoKI1hmZn5ssmo8UYZjm1i
	8HMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684916422; x=1685002822; bh=tYZdd2ag8G3Dy
	Un++y9TtCSdP5cAJ0TR5Ul9fhN2ndw=; b=MVYQVZPlyWk4dXzXs3bMzLh61TsRG
	0zqO/4LPg+/xnt/ZYmpc4dpLa+b0Rq5DF3bNJjro5mF1G9a6wg6mrSPBZuoCgDgC
	YPgT6qjjKtlzUX0DtvDfH3MG0Sgdg63WknBag7Apfq3JQT4yY/SMIPR6D0db70Wi
	KElTSVJojg0qSn0Qpf5A6Zn+qLZe2INR41OtsyVaPUEhhfs5nvrNE55czpGpHwJg
	4ba/loCsxOaisZ1HO7/FXyriNne2K0HZZz7Lvmqg0jx/B0hqRDCIwVt9GBepRLll
	EEKemLuCquy0JFi9lp+L4/bTgEWNUXUVap2mR0oUNE2OikbW4zcOga/tQ==
X-ME-Sender: <xms:xchtZC4uV5DpyVK-Y1ve2PHxVwZK5FqvfB9KyrTi1rl70yMp0296fw>
    <xme:xchtZL4Z-oYtWPtLhM9V_2fCBwvZHZODmM98sUhaj7v2fab_ZUXkM1Z5Ji3cCGhWY
    H-rHl90c5gmxL_r7zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejhedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xchtZBcCJqJMxxQj_FTXrvf1_W7sXVZde4u4EM_a5Oe7LLqnbFKM2g>
    <xmx:xchtZPL5JlSqUbnaGEU96WI21q22YjU0HaG9bz1xYM4YklW54kRyGw>
    <xmx:xchtZGKcg1w0jhVvjpkleUOUf-s1ieu0yAf746uBYjJeIsk7rqNfCQ>
    <xmx:xshtZMzrWSifih0NK25uDia6pz1px0kn2OqTySsDlKFjbznfo5uLfg>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <9dd597c5-1abc-4a25-a1cd-d7488d9d5b33@app.fastmail.com>
In-Reply-To: <2e5e627e-9f7e-ae63-05a3-d2b55e0703ba@oracle.com>
References: <20230519092905.3828633-1-arnd@kernel.org>
 <35c82bbd-4c33-05da-1252-6eeec946ea22@oracle.com>
 <418f75d5-5acb-4eba-96a5-5f9ec7f963a6@app.fastmail.com>
 <2e5e627e-9f7e-ae63-05a3-d2b55e0703ba@oracle.com>
Date: Wed, 24 May 2023 10:20:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Juergen Gross" <jgross@suse.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Stefano Stabellini" <sstabellini@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Peter Zijlstra" <peterz@infradead.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] x86: xen: add missing prototypes
Content-Type: text/plain

On Wed, May 24, 2023, at 01:09, Boris Ostrovsky wrote:
> On 5/23/23 4:37 PM, Arnd Bergmann wrote:
>> On Sat, May 20, 2023, at 00:24, Boris Ostrovsky wrote:
>>> On 5/19/23 5:28 AM, Arnd Bergmann wrote:
>>
>> Not sure if there is much point for the second one, since
>> it's only called from assembler, so the #else path is
>> never seen, but I can do that for consistency if you
>> like.
>> 
>> I generally prefer to avoid the extra #if checks
>> when there is no strict need for an empty stub.
>
> Do we need the empty stubs? Neither of these should be referenced if 
> !SMP (or more precisely if !CONFIG_XEN_PV_SMP)

We don't need the prototypes at all for building, they
are only there to avoid the missing-prototype warning!

I added the stubs in v3 because you asked for an #ifdef,
and having an #ifdef without an else clause seemed even
weirder: that would only add complexity for something that
is already unused while making it harder to maintain or
use if an actual user comes up.

I'll let someone else figure out what you actually want
here.

     Arnd

