Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE623B23EA3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 04:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079410.1440293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um1co-0006ah-63; Wed, 13 Aug 2025 02:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079410.1440293; Wed, 13 Aug 2025 02:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um1co-0006ZW-3A; Wed, 13 Aug 2025 02:54:02 +0000
Received: by outflank-mailman (input) for mailman id 1079410;
 Wed, 13 Aug 2025 02:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r6QG=2Z=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1um1cn-0006ZN-3R
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 02:54:01 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c20949b1-77f0-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 04:53:59 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 78A77140006B;
 Tue, 12 Aug 2025 22:53:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Tue, 12 Aug 2025 22:53:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Aug 2025 22:53:55 -0400 (EDT)
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
X-Inumbo-ID: c20949b1-77f0-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1755053637; x=1755140037; bh=QBnbVTFL3n
	fUzNOXdzrtImD+g3549vWUp6DMYthA7x0=; b=a0APMlKZhNhr5H7+fE9yyq64GZ
	k+ArKOct7ZYosKlUHpzx4YRek93izmKoQcuhsUqyLfbDQN18VpsgKopAta3TXco6
	2o+hZlkgigSjuJhDA8Ju0r4kjcWGMdYQwR9gQPbgWtihBMldRS4TjxArkj3NTgqj
	EptddwKlegP1o50PtebN0ZCGFSmjPiwq06e175ukCpvlPU1kEQd4yk7PiOzmlvqp
	aD3iVTG3E2Bm/GWjtYnhtbs1OaCDkuhyg0Cq5PiPSpBfK9x85yxld6mJHRZ7jAPH
	wVVGE7BXlZ8xMQBot9Vp8TG1dGTn1CSIDfq7yEi5yXejKwRgY5Z8spcw15aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755053637; x=
	1755140037; bh=QBnbVTFL3nfUzNOXdzrtImD+g3549vWUp6DMYthA7x0=; b=M
	eRVv9Wv0Xy4WWzV8UZN+dXn0krAwZ/Iqh/THEzXMsKbnNB7nnlws+LmXwGMejU3T
	lXf8Jvs/FtAcZuT41PwhsU8/vcqwt3EMs0CxPfhj+xRlFUJvtVvt3C4yeqGyPOg8
	yWd+zN5rveGGr+3QEEfwLY4C/94yLqaD65IRid7fxT33+WE8azbL3sU388CasGX5
	QvCOs/QikLEumyB1qHar+5uqtpXF1C9g7Uc9bM7wUulb3gn7owoRrYY7e1ydp7G3
	6aZr/7bFShIlzEvB2cVe8OTDi5aSDzMjQFH1Gye573umhJ04UjycWPzMm6rmKpX0
	ARKP+L4VfEPXxWtq0NdEA==
X-ME-Sender: <xms:Rf6baKLhpKmjx9BViRx8G7IJdyMk-HC-0DdvVPQXUE20T3DX7be2OA>
    <xme:Rf6baFamwQ8L0A2Mh7Iq91Ed67kMDzBiApBKyNFs_cQ4yiKeKWYJ8cpS64bi2avU5
    M8BucSxhNNrIA>
X-ME-Received: <xmr:Rf6baEKa94SUi9dxwYhavn0xfSoLONNZ2YStyro6coVvFNXil57unra4shvl_WvElp9pFSanoB0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgfjghfkfggtgfgsehtqhhmtddtreejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehfedv
    hedvudffffekgfduveeliefgvdetfeefueevtdffgffghefgtefgieehgeenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtth
    hopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgv
    lheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:Rf6baLB1Pe2daM1CB4odcHhooDwV6NpWGYQxhU42kxhRRI8C0vETxA>
    <xmx:Rf6baBq9uGMLwyVyq83HplI5M3T5aTKKLa90cr3vuBBzxOtez0s08w>
    <xmx:Rf6baOjpWL0s-ehtCsUTyVnicgR-FR53U-7Q9q5rP1X9eVLvwBT2Pw>
    <xmx:Rf6baGDIELaZ3fR5RHo9CmkSGc2DyuYGtXCZw-OfS6irKrerFlXIjg>
    <xmx:Rf6baCjKBNoA8H_kAgUqoRF3w2yyKhJNrkli5Ot-h2MXKZZhVobTUvED>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 13 Aug 2025 04:53:53 +0200
From: =?ISO-8859-1?Q?Marek_Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 regression related to XSA-471 patches
User-Agent: K-9 Mail for Android
In-Reply-To: <4fb544d7-fede-46b8-950e-f9c4af1cb04f@citrix.com>
References: <aJMtPLNqQFbGg5cs@mail-itl> <f971f8a8-487e-4b9f-8c75-80ebfe70c3b6@suse.com> <aJMyjYfeTL5uPRtk@mail-itl> <aJTilUXpchmRq2Ng@mail-itl> <4fb544d7-fede-46b8-950e-f9c4af1cb04f@citrix.com>
Message-ID: <B667172D-84FA-488D-98F9-0D7D34402EF7@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On August 11, 2025 3:16:46 PM GMT+02:00, Andrew Cooper <andrew=2Ecooper3@c=
itrix=2Ecom> wrote:
>On 07/08/2025 6:29 pm, Marek Marczykowski-G=C3=B3recki wrote:
>> On Wed, Aug 06, 2025 at 12:46:36PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
>>> On Wed, Aug 06, 2025 at 12:36:56PM +0200, Jan Beulich wrote:
>>>> On 06=2E08=2E2025 12:23, Marek Marczykowski-G=C3=B3recki wrote:
>>>>> We've got several reports that S3 reliability recently regressed=2E =
We
>>>>> identified it's definitely related to XSA-471 patches, and bisection
>>>>> points at "x86/idle: Remove broken MWAIT implementation"=2E I don't =
have
>>>>> reliable reproduction steps, so I'm not 100% sure if it's really thi=
s
>>>>> patch, or maybe an earlier one - but it's definitely already broken =
at
>>>>> this point in the series=2E Most reports are about Xen 4=2E17 (as th=
at's
>>>>> what stable Qubes OS version currently use), but I think I've seen
>>>>> somebody reporting the issue on 4=2E19 too (but I don't have clear
>>>>> evidence, especially if it's the same issue)=2E
>>>> At the time we've been discussing the explicit raising of TIMER_SOFTI=
RQ
>>>> in mwait_idle_with_hints() a lot=2E If it was now truly missing, that=
 imo
>>>> shouldn't cause problems only after resume, but then it may have cove=
red
>>>> for some omission during resume=2E As a far-fetched experiment, could=
 you
>>>> try putting that back (including the calculation of the "expires" loc=
al
>>>> variable)?
>>> Sure, I'll try=2E
>> It appears this fixes the issue, at least in ~10 attempts so far
>> (usually I could reproduce the issue after 2-3 attempts)=2E
>>
>
>Can you show the exact code which seems to have made this stable?

This patch: https://github=2Ecom/marmarek/qubes-vmm-xen/blob/7c9e9e312948c=
772d9a68090109964121c1d16fe/0001-DEBUG-S3=2Epatch

>
>We discussed this in the x86 maintainers meeting, and our best guess is
>a timer that's not torn down or recreated properly on S3, but this is
>largely speculation=2E
>
>~Andrew

