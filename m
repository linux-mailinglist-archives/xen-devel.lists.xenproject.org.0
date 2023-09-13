Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604DF79F387
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 23:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601653.937738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgXAV-000682-4D; Wed, 13 Sep 2023 21:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601653.937738; Wed, 13 Sep 2023 21:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgXAV-00065m-1W; Wed, 13 Sep 2023 21:13:03 +0000
Received: by outflank-mailman (input) for mailman id 601653;
 Wed, 13 Sep 2023 21:13:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ICW1=E5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qgXAT-00065g-L5
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 21:13:01 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fcd90a8-527a-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 23:12:58 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E92D55C0088;
 Wed, 13 Sep 2023 17:12:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 13 Sep 2023 17:12:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Sep 2023 17:12:55 -0400 (EDT)
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
X-Inumbo-ID: 4fcd90a8-527a-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694639576; x=1694725976; bh=sHuBAL23D3vD7KE/AFx7Nx49GPFuNzKaUIh
	ZfoJomu4=; b=2L5RpwlhcTGE2SzZac6gleEGPnAa31/pT2C1FDIoex2k1oD9WTh
	Z2Pb0UgOaIDr3Y88Gtq2y5CtxO+bkapjhpQTJKebWaG47wIKOEj19PtX2qhb7WbT
	6CzbzH1LrT5+9gFD/Nua3FR0ZVSzF93a7jbyiTmJ0HpuILekA5RjepoKPuvzoTPj
	KzOHSxHkhrtdX8TWw3yE+1ikbh1sVkQ34Ha/r6LxvXwN/+q1o3SW0ri+A/mAx+Qc
	Dw7QyxtW07uKtIQVOIm1F+G+omHgJQm2DJwvjSU5LAPvNdCLldSemZqjHKuOR0Uo
	W1ZxGSLz5vh2edq4ezNWj6aYfMqzaT3E5fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694639576; x=1694725976; bh=sHuBAL23D3vD7
	KE/AFx7Nx49GPFuNzKaUIhZfoJomu4=; b=l+rKFGofmM/9Fe1jyD6M5v2vLhPDk
	XJboiJrWlaWIjb5e38tWfYRHSCOyHBhSVu6jtptaQT+b2A+vZ0sbnv23JyAnHncE
	cISxfd39bhdcDhW9840H68K0cDuE19IUIWLm5immG0xJEcxGPpuRsyX3RF1/uu9s
	77MEGbkXTAW77E2kzj/8hnUODUwRkboqXz2AtH8xByHjAQOwLdUxB0dOwfSQ2P+4
	cZ3RMPoykzb5UD0wXzBqba9WnCKxobnrRsvdPHiMegioj2Tsk2bO+U4LKHu5Bk1/
	2MVrA+Uj0PwIWn6WmUhcoFvzQEqFek6kCP9OGpVtGI/43EjFR2xXCn2KA==
X-ME-Sender: <xms:2CUCZeV_Peyek2hId3MyT7fWE2A3pgCS2LPYEdjeD5elYt_vFUe4og>
    <xme:2CUCZalOKZwL-nY_iwEDfIXWnri-c7KRIcXCDVkH2b48bxhMCNDv2uO85BTRD3mCx
    Fv-RR2pFno6Ww>
X-ME-Received: <xmr:2CUCZSasbqMHIXWUBWC2tdXVElMRWPCOeFvcUGlxTMHuMn4Faa91T3JN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeikedgudehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:2CUCZVXctPBL-t9UVbprNjLvtmbVfUgdzno7nGGy0IXH-mQkwANytg>
    <xmx:2CUCZYnylQtCDzTR6rUsALtqp_oVbiEf0PzZtMPrPDc6zhrHCM4aug>
    <xmx:2CUCZaf28YvO7YdA6mkwMolZBENITLHLQIZw6qhf8ZZOcsghvYfWdQ>
    <xmx:2CUCZdxnj4ELj4gOnZx8JvQAv_6b1INYVf_A59HTaLiFta0md0pcow>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 13 Sep 2023 23:12:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 8/8] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Message-ID: <ZQIl1CoxGxIW5r7F@mail-itl>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-9-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V0/yz57NvCux/epS"
Content-Disposition: inline
In-Reply-To: <20230913202758.508225-9-andrew.cooper3@citrix.com>


--V0/yz57NvCux/epS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Sep 2023 23:12:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 8/8] x86/spec-ctrl: Mitigate the Zen1 DIV leakge

On Wed, Sep 13, 2023 at 09:27:58PM +0100, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/includ=
e/asm/cpufeatures.h
> index da0593de8542..724de2e11db4 100644
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -35,7 +35,7 @@ XEN_CPUFEATURE(SC_RSB_HVM,        X86_SYNTH(19)) /* RSB=
 overwrite needed for HVM
>  XEN_CPUFEATURE(XEN_SELFSNOOP,     X86_SYNTH(20)) /* SELFSNOOP gets used =
by Xen itself */
>  XEN_CPUFEATURE(SC_MSR_IDLE,       X86_SYNTH(21)) /* Clear MSR_SPEC_CTRL =
on idle */
>  XEN_CPUFEATURE(XEN_LBR,           X86_SYNTH(22)) /* Xen uses MSR_DEBUGCT=
L.LBR */
> -/* Bits 23 unused. */
> +XEN_CPUFEATURE(SC_DIV,            X86_SYNTH(25)) /* DIV scrub needed */

s/25/23/

>  XEN_CPUFEATURE(SC_RSB_IDLE,       X86_SYNTH(24)) /* RSB overwrite needed=
 for idle. */
>  XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for=
 idle */
>  XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow =
Stacks */

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--V0/yz57NvCux/epS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmUCJdQACgkQ24/THMrX
1yx0pQf9EZxiK+VPjgO2r5vzwyQpEd1aA43vrd8ku1osTBxHMbKDpSZsllt5UrH9
iVtecAvqPiRoHaEmgy95u7rr93zurlTvK2L0kwEK4ZnknSnFYwI+0qq5HTWLtAnA
ewvEhnaQL1xrW9Uo2GyyWQ9s7R9ANow6xFiuI+rfXhhr8yUKdSK7kA59C30ezXEA
W26yUJA2GAyYSq8n5ge2aEhDC0uJxJ2eJkMzYCkAGtaiBmex9x5y+qF4l8NiCH+8
lTuz6e2RUjzjR8KAEfKNxBKwQS+5+TYcRJb8QFL8SQYEphRJINX7St06cWl6AFDk
aGIBX/Ev0IYMh5G9VeL1pkkRVN9Twg==
=cx9a
-----END PGP SIGNATURE-----

--V0/yz57NvCux/epS--

