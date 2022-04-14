Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495050177D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 18:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304913.519657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf1sm-0000g3-Lm; Thu, 14 Apr 2022 15:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304913.519657; Thu, 14 Apr 2022 15:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf1sm-0000d7-IQ; Thu, 14 Apr 2022 15:59:44 +0000
Received: by outflank-mailman (input) for mailman id 304913;
 Thu, 14 Apr 2022 15:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rzxh=UY=cardoe.com=cardoe@srs-se1.protection.inumbo.net>)
 id 1nf1sk-0000d1-BD
 for xen-devel@lists.xen.org; Thu, 14 Apr 2022 15:59:42 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e389b338-bc0b-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 17:59:40 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A85F5C02EF;
 Thu, 14 Apr 2022 11:59:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 14 Apr 2022 11:59:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Apr 2022 11:59:38 -0400 (EDT)
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
X-Inumbo-ID: e389b338-bc0b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1649951978; x=
	1650038378; bh=l9hTAWgSLgGRmvELaQYMDJ5lKCpvQ2aDdF6RNvdGaC8=; b=F
	5i6InfhDlS9dRcfvwaFqFcK02ZXR/W3Za9exws4xZ7ELr24fjfEXafqfgraKGe8U
	RxKT98zTLPhoaur4V5VhxdsICcJvlr0maQevTIChYzROG/97Oe7SHjMpt9RHe2uR
	xRt2AudSu0BSnz66POgpcoGovg77zrYdhZyaQ9JafIs4CSUSfmz//TiSuUyfl7zC
	UWn+QlePzQmgOIAmB1OpsjRXe1GAo7jvBN4ungTCHTXUhO8YN+tVrAPcuk9aoh+2
	KN4aA6K2WCSV8kiPoLoBr+6YEcpErgvLuAaXU/0ljDzvkRx4rnagyRmqDAVF3KwE
	hY+SQvuIkwqEwix2qGFgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1649951978; x=1650038378; bh=l9hTAWgSLgGRm
	vELaQYMDJ5lKCpvQ2aDdF6RNvdGaC8=; b=EVcdmwTlaaDbmFp4SMiK/cmJyWO82
	mutx7KRTkP2oxnxb8AdHGpe3wu+3Ps4VFItLCZd7PiIXR0orahqYv5I6SdEaNRsD
	u3NI+jbFWxs3CI5Lf+ky3GB0MVXazQXs3NghjTRQBuzlQU6sUmC24fmzDNXKJ7eV
	gz+UI/ZX/Vp2Mwr4yc130UNLm8Ic8odPRozYKc68BzAbcMgQPtKs5dN37s4uGGFL
	4ua1LO/onkFpl5zjfGTiZvYF0VAeSWsn9ofYHRRK4EbG6N5W4i+aW4jyWOkW/1Ph
	JhFbyBVywJ2izyG/GvZxJFRksHmt4T47nqJsbKR7ayR96ZGZCI0USiZkA==
X-ME-Sender: <xms:6kRYYlwYxqMfDY-2ZaR0kfY7q3jjjD0n0c4p4a33FR1I-hVJ5iUnog>
    <xme:6kRYYlQjATp6WcK-0caRrvZgCsLF9_jbr2qUgkootJSNBwTdxoVkt5OM4_hf6Td39
    cy5xgv_6EAQmJ4M7zw>
X-ME-Received: <xmr:6kRYYvXaCRlLe3w6XE3f-ZMrSCJMsZuZsvW02fMzBaZQE9iGVG9jsgDaH8mUSL1UjZsNfbjNM-ALiTMnbdED7vjusIZXpRL68VXhgNwessPe1JR_i3QeBjhNiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelfedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptgfghfggufffkfhfjgfvofesthhqmhdthhdtjeenucfhrhhomhepffhouhhg
    ucfiohhlughsthgvihhnuceotggrrhguohgvsegtrghrughovgdrtghomheqnecuggftrf
    grthhtvghrnhepveffteegudefheeukeekhefgteduieffheelheeuueehhedtgfevtdef
    gffgfeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrggsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptggrrhgu
    ohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:6kRYYnjEqRjKc9ekzxltFOXfx4nH5f_rSXgqoWC9U-k4H1WI5YXmig>
    <xmx:6kRYYnA7sHF_kivAr6QeotAOqUb1R2TKt9c8vvg134zGiGjkmM477A>
    <xmx:6kRYYgKLlinRBiRrubITiPZhhV9jMhwcuBaVVOiB31RA8fGWBR-wMA>
    <xmx:6kRYYjvzGLrfFIlfTg9gXcvQG9cqsB-6MuXAiESgRtoxNXqvQd08AA>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Doug Goldstein <cardoe@cardoe.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Virtio on Xen with Rust
Date: Thu, 14 Apr 2022 10:59:37 -0500
Message-Id: <D1358A28-BCD5-497F-A329-28DBC25AD792@cardoe.com>
References: <20220414141041.ogeaaplnb7mfufsb@liuwe-devbox-debian-v2>
Cc: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, stratos-dev@op-lists.linaro.org,
 xen-devel@lists.xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Mathieu Poirier <mathieu.poirier@linaro.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20220414141041.ogeaaplnb7mfufsb@liuwe-devbox-debian-v2>
To: Wei Liu <wl@xen.org>
X-Mailer: iPhone Mail (19E258)


> On Apr 14, 2022, at 9:10 AM, Wei Liu <wl@xen.org> wrote:
>=20
> =EF=BB=BFOn Thu, Apr 14, 2022 at 02:36:12PM +0100, Alex Benn=C3=A9e wrote:=

>>=20
>> Wei Liu <wl@xen.org> writes:
>>=20
>>> On Thu, Apr 14, 2022 at 12:07:10PM +0000, Andrew Cooper wrote:
>>>> On 14/04/2022 12:45, Wei Liu wrote:
>>>>> Hi Viresh
>>>>>=20
>>>>> This is very cool.
>>>>>=20
>>>>> On Thu, Apr 14, 2022 at 02:53:58PM +0530, Viresh Kumar wrote:
>>>>>> +xen-devel
>>>>>>=20
>>>>>>> On 14-04-22, 14:45, Viresh Kumar wrote:
>>>>>>>> Hello,
>>>>>>>>=20
>>>>>>>> We verified our hypervisor-agnostic Rust based vhost-user backends w=
ith Qemu
>>>>>>>> based setup earlier, and there was growing concern if they were tru=
ly
>>>>>>>> hypervisor-agnostic.
>>>>>>>>=20
>>>>>>>> In order to prove that, we decided to give it a try with Xen, a typ=
e-1
>>>>>>>> bare-metal hypervisor.
>>>>>>>>=20
>>>>>>>> We are happy to announce that we were able to make progress on that=
 front and
>>>>>>>> have a working setup where we can test our existing Rust based back=
ends, like
>>>>>>>> I2C, GPIO, RNG (though only I2C is tested as of now) over Xen.
>>>>>>>>=20
>>>>>>>> Key components:
>>>>>>>> --------------
>>>>>>>>=20
>>>>>>>> - Xen: https://github.com/vireshk/xen
>>>>>>>>=20
>>>>>>>>  Xen requires MMIO and device specific support in order to populate=
 the
>>>>>>>>  required devices at the guest. This tree contains four patches on t=
he top of
>>>>>>>>  mainline Xen, two from Oleksandr (mmio/disk) and two from me (I2C)=
.
>>>>>>>>=20
>>>>>>>> - libxen-sys: https://github.com/vireshk/libxen-sys
>>>>>>>>=20
>>>>>>>>  We currently depend on the userspace tools/libraries provided by X=
en, like
>>>>>>>>  xendevicemodel, xenevtchn, xenforeignmemory, etc. This crates prov=
ides Rust
>>>>>>>>  wrappers over those calls, generated automatically with help of bi=
ndgen
>>>>>>>>  utility in Rust, that allow us to use the installed Xen libraries.=
 Though we
>>>>>>>>  plan to replace this with Rust based "oxerun" (find below) in long=
er run.
>>>>>>>>=20
>>>>>>>> - oxerun (WIP): https://gitlab.com/mathieupoirier/oxerun/-/tree/xen=
-ioctls
>>>>>>>>=20
>>>>>>>>  This is Rust based implementations for Ioctl and hypercalls to Xen=
. This is WIP
>>>>>>>>  and should eventually replace "libxen-sys" crate entirely (which a=
re C based
>>>>>>>>  implementation of the same).
>>>>>>>>=20
>>>>>> I'm curious to learn why there is a need to replace libxen-sys with t=
he
>>>>>> pure Rust implementation. Those libraries (xendevicemodel, xenevtchn,=

>>>>>> xenforeignmemory) are very stable and battle tested. Their interfaces=

>>>>>> are stable.
>>>>>=20
>>>>> Very easy.  The library APIs are mess even if they are technically
>>>>> stable, and violate various commonly-agreed rules of being a libary su=
ch
>>>>> as not messing with stdout/stderr behind the applications back, and
>>>>> everything gets more simple when you remove an unnecessary level of C
>>>>> indirection.
>>>=20
>>> You don't have to use the stdio logger FWIW. I don't disagree things can=

>>> be simpler though.
>>=20
>> Not directly related to this use case but the Rust API can also be
>> built to make direct HYP calls which will be useful for building Rust
>> based unikernels that need to interact with Xen. For example for a
>> dom0less system running a very minimal heartbeat/healthcheck monitor
>> written in pure rust.
>>=20
>=20
> I think this is a strong reason for not using existing C libraries. It
> would be nice if the APIs can work with no_std.

This was the goal I had with the way I structured the xen-sys crate.
>=20
>> We would also like to explore unikernel virtio backends but I suspect
>> currently the rest of the rust-vmm virtio bits assume a degree of POSIX
>> like userspace to set things up.
>=20
Same area I had an interest in. As well. I played with a xenstore implementa=
tion in a unikernel as well. Some of the code was published but unfortunatel=
y the actual functional bits were not.

=E2=80=94
Doug=


