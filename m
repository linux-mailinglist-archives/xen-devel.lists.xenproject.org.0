Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE498056DF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647922.1011682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAW8m-0006P4-4C; Tue, 05 Dec 2023 14:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647922.1011682; Tue, 05 Dec 2023 14:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAW8m-0006Mt-1N; Tue, 05 Dec 2023 14:11:12 +0000
Received: by outflank-mailman (input) for mailman id 647922;
 Tue, 05 Dec 2023 14:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UsGn=HQ=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1rAW8k-0006Mk-Fd
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:11:10 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ff440e2-9378-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:11:05 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F3435C0221;
 Tue,  5 Dec 2023 09:11:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Dec 2023 09:11:03 -0500
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F1107B60089; Tue,  5 Dec 2023 09:11:02 -0500 (EST)
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
X-Inumbo-ID: 1ff440e2-9378-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1701785463; x=1701871863; bh=j3N0QWRlwKTdKTX4J89FkfNpMXL+zjMjp+z
	yBpPFcGk=; b=XBFPNxabboiuMjgl4yR3FMQJuxLZtkJrLU9g2lTEuyDx9KQq3Fe
	2ormUyzLAVKspwVUse7XFOS3BnbN16Gib50hyGOgSNgxqUvq+1FMfpGqYeD5TFxv
	qy48WUMeE+UCiA2QTOPuNjmsDWPugKxJ6uGd6nqWIswJqiCTv2kTXcax3tBrMqcI
	O1Zla64CYmVC35W/aNT7EF7hzUvbWkebaykgVXTY0m30lIzNEnx8VsMW+BCz4NzB
	mjpoxkIRpv/zJWfyl2P5hnymkHmJcrClpuJFKh9oEH2CLejezCLJBvzSX332ZcJq
	VIZE6dF8maj56gw7EOq/IDNYE8tVNGbl2+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1701785463; x=1701871863; bh=j3N0QWRlwKTdKTX4J89FkfNpMXL+zjMjp+z
	yBpPFcGk=; b=v+tT197yi+LisCzzXZe+r48uIpomQDrCkwohu8Xbn4M3zeHjQAE
	v9PXfo0hnG3RHOnrpvznsRS4Co/meNkyvGNWomGNRasnXQuD0i9L1ik58JezE9dv
	7j1vdh/Jotlqwb2S4sWM+mvqkqO772mr71OHMs5jvLApKS/DJh/YD2CL4/wRoFD4
	jrt46vr63sNXcugPLv+v7VwDt3K5N/SQa9UuxXiMXEWkEkHdMZhyiRNwGcNp87YE
	FR+M/fzL4eh8jJ8y7iP1lkU0zZ3hmP061TqgLCAvXmI6EdGGN8mxdN9DIvKCilOz
	2Qammbg5GQJljILYcFLw0K66qyCkZJtQnGw==
X-ME-Sender: <xms:dy9vZYPi6yzzebzLGV8vIAifCfOL_TkhLhY13f4kGqVDjGesafDr_A>
    <xme:dy9vZe8_q8AjGIOB3iGseJb7qO9gnHNQnvJQQtDuUJBOl4vcsbWEEwfJwW_hROk0E
    5h2dgyL_gFkzQs5NIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegtdduhffgueekhffgteetheehjeeiteeifeffteetgffgtdfhteeuheev
    veetueenucffohhmrghinhepghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:dy9vZfRKDw7lcLOXfwJwwJl4weQ1m2DJ4gaRQu7l6EOaKrJ0XG5eCA>
    <xmx:dy9vZQuOra8ddNNMlIojupBygovyCEthp78bSLdAD_ydTPLpW5avHw>
    <xmx:dy9vZQch63Iolopp8XWa0-lb-wJkhVWMZKDHAEGiUHP7C9fpZPpurQ>
    <xmx:dy9vZVGRoBeQ2egxGpJnTdkscj5qr0issiXke4aD1RZi-4DwmKWw4Q>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <5a05e194-28d1-409d-9f45-ca4de0fc78c8@app.fastmail.com>
In-Reply-To: <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
 <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
 <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
Date: Tue, 05 Dec 2023 15:10:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julien Grall" <julien@xen.org>, "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "George Dunlap" <george.dunlap@citrix.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>,
 "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all architectures
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023, at 15:01, Julien Grall wrote:
> On 05/12/2023 13:59, Jan Beulich wrote:
>> On 05.12.2023 14:46, Julien Grall wrote:
>>> On 05/12/2023 13:41, Juergen Gross wrote:
>>>> On 05.12.23 14:31, Julien Grall wrote:
>>>>> Anyway, given you don't seem to have a use-case yet, I would simpl=
y to
>>>>> consider to surround the declaration with an a config which can be
>>>>> selected if unaligned access is supported.
>>>>
>>>> Like in xen/common/lzo.c et al?
>>>
>>> Just to clarify, I am suggesting to add in unaligned.h:
>>>
>>> #ifdef CONFIG_HAS_UNALIGNED_ACCESS
>>>
>>> your definitions
>>>
>>> #endif
>>=20
>> But that would be wrong: HAS_UNALIGNED_ACCESS would be there to indic=
ate
>> one does _not_ need any special accessors.
>
> I am guessing you are disagreeing on the name rather than the concept?=20
> If so, what about CONFIG_UNALIGNED_ACCESS_ALLOWED?

This would repeat the mistake that we had in Linux in the
past (and still do in some drivers): Simply dereferencing
a misaligned pointer is always a bug, even on architectures
that have efficient unaligned load/store instructions,
because C makes this undefined behavior and gcc has
optimizations that assume e.g. 'int *' to never have
the lower two bits set [1].

The helpers that J=C3=BCrgen copied from Linux is what we
use to abstract accesses to objects that we know may
be misaligned. If the underlying ISA allows a direct
access (e.g. on arm64 and x86), this is as efficient
as a normal pointer access but prevents the dangerous
optimizations in gcc. On architectures without these
instructions, the access will be turned into safe
bytewise access.

This is similar to a __packed annotation on a
data structure, but also works in cases where such
an annotation wouldn't work for other reasons.

     Arnd

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100363

