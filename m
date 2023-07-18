Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86E758601
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 22:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565451.883558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLr94-0004OR-1c; Tue, 18 Jul 2023 20:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565451.883558; Tue, 18 Jul 2023 20:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLr93-0004Md-Ud; Tue, 18 Jul 2023 20:18:05 +0000
Received: by outflank-mailman (input) for mailman id 565451;
 Tue, 18 Jul 2023 20:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLr92-0004MX-Lc
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 20:18:04 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f5ffa72-25a8-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 22:18:02 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 64CDF5C0116;
 Tue, 18 Jul 2023 16:17:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 18 Jul 2023 16:17:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 16:17:53 -0400 (EDT)
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
X-Inumbo-ID: 2f5ffa72-25a8-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689711477; x=1689797877; bh=5yZUpR+6ZPpUWjcU9SUTuExBXt7D47JD44m
	vzL64O9w=; b=aWt7rrWj1HvCYDVWdaxeFCR3BB9kgv2xtvQwpRfVDx3yldCxeBN
	zacMeG+fkVc5XySPNix7NzxKU97/x1HSU4GbrQQ0Qr+w1IHj3l3sSRZ66QE2qdde
	EPyd7Lp6/BJxFsGLyPjrPq2kZd0N21leGo46udrqsZC/c7hT28MA9jiQ8cXY48yP
	EGZvsLeN1oygSRm5ETSBH8Qmf99oQwmnUH3tkoO4Q9KYkYK+WLYTO86V2C6i+8IO
	bbMTWpbtxWakZ9G6zWJdhSbEASySfbODlI9MLcR0JL1Xvzb9J8tBj6Xoarhtb5Wj
	47yo3AUfL8tEQcBpHd2b6dLrpJ4js9PbWnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689711477; x=1689797877; bh=5yZUpR+6ZPpUW
	jcU9SUTuExBXt7D47JD44mvzL64O9w=; b=Kuhj0/Zej1waNv+LlUq2rdfi+bahF
	2mD71tarfYTcrK6jzm2lf39il4aOyIqJz/WP67Jq2+pqcxKPeDUW9THRDkK6rHPz
	omsOiP1y49/7PT2AxLM6uM/qGeHsw2L3LUfeTnQ8T21TYT69gg9O8eMz8GxD8Jb/
	lhiy9NNH82SlRm4c9kAD8TCGj1uVMfzdTPQZVfBK4nVaa26KxsY56RKJc/TKfcgW
	BNWTEy0A04iX2aDDV5Z9ylIpS9gsdx8d7VsqVDEdJqU2d28F4iKCFhikX0wbqYtX
	AI+6PVjNiu37PbUi7nKX2UuLXwdx7GM1+iWGvoPlrHvUe1viDCPsgsEYQ==
X-ME-Sender: <xms:dfO2ZLFFNyr-2BZPvaKArX6nW1HLMal5Xi78fOdnumlIf7frVZTgiQ>
    <xme:dfO2ZIXOR6cgH8H6CDvFhhWoi0PzqnBTq2Gbii_fXyRrQ6O_F5eA4RmCQLOa5JrgA
    xT4LYur_EhWN0c>
X-ME-Received: <xmr:dfO2ZNLEGm3YKVwv6Me4cS-vPs481bT7AH1jc0LSOKcK0M0ZyCm7naVvKNf3qxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffggfuvfevfhfhjggtsehgtderredttdejnecuhfhrohhmpefuihhmohhn
    ucfirghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homheqnecuggftrfgrthhtvghrnhepudfhfeejveevteehvddtueffuedtteevleelfeek
    tdfhveehvedtieejteetueeinecuffhomhgrihhnpehinhhtvghlrdgtohhmpdhkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:dfO2ZJHltVPpYGxT2X_2c-FbjWJ-qV8dU7pxjd2Y1hEtavH-jPEWNg>
    <xmx:dfO2ZBXJoqwNn-1LR_9F3szqM45eycys4FF2tOZ_UoNLbzk8REm2LA>
    <xmx:dfO2ZEMYO9guUjyeLfygZYdXKG1m-peKhW1aYJLy2h4aOUDx5DnDmQ>
    <xmx:dfO2ZEQjB5hfdmoQnONqBAkfMLhbm6w2rxodHe2t3o_MApMtzr6yPQ>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <683e73d8-037a-5e38-745d-ae1c0e18fc79@invisiblethingslab.com>
Date: Tue, 18 Jul 2023 22:17:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
 <aa23a090-1883-008b-e395-2a3bca709258@suse.com>
 <2be631d2-95f3-0d7f-ad84-eb9e16d1a39a@invisiblethingslab.com>
 <b6365b9d-47a1-8ab4-37eb-0b821257dbd2@suse.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <b6365b9d-47a1-8ab4-37eb-0b821257dbd2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XkXusRDb9wd301gW0E277UxX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XkXusRDb9wd301gW0E277UxX
Content-Type: multipart/mixed; boundary="------------9AOgAcx0N0K2Er0tVWGl9fk3";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <683e73d8-037a-5e38-745d-ae1c0e18fc79@invisiblethingslab.com>
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
 <aa23a090-1883-008b-e395-2a3bca709258@suse.com>
 <2be631d2-95f3-0d7f-ad84-eb9e16d1a39a@invisiblethingslab.com>
 <b6365b9d-47a1-8ab4-37eb-0b821257dbd2@suse.com>
In-Reply-To: <b6365b9d-47a1-8ab4-37eb-0b821257dbd2@suse.com>

--------------9AOgAcx0N0K2Er0tVWGl9fk3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 18.07.2023 15:46, Simon Gaiser wrote:
>> Jan Beulich:
>>> On 18.07.2023 15:23, Simon Gaiser wrote:
>>>> ---
>>>>  xen/arch/x86/acpi/cpu_idle.c | 9 ++++++---
>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> This lacks both S-o-b and a proper description. The latter in
>>> particular because you ...
>>
>> Yeah, I also noticed in the meantime, sorry. Will be fixed in v2.
>>
>>>> --- a/xen/arch/x86/acpi/cpu_idle.c
>>>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>>>> @@ -155,6 +155,12 @@ static void cf_check do_get_hw_residencies(void=
 *arg)
>>>> =20
>>>>      switch ( c->x86_model )
>>>>      {
>>>> +    /* Tiger Lake */
>>>> +    case 0x8C:
>>>> +    case 0x8D:
>>>> +    /* Alder Lake */
>>>> +    case 0x97:
>>>> +    case 0x9A:
>>>>      /* 4th generation Intel Core (Haswell) */
>>>>      case 0x45:
>>>>          GET_PC8_RES(hw_res->pc8);
>>>> @@ -185,9 +191,6 @@ static void cf_check do_get_hw_residencies(void =
*arg)
>>>>      case 0x6C:
>>>>      case 0x7D:
>>>>      case 0x7E:
>>>> -    /* Tiger Lake */
>>>> -    case 0x8C:
>>>> -    case 0x8D:
>>>>      /* Kaby Lake */
>>>>      case 0x8E:
>>>>      case 0x9E:
>>>
>>> ... don't just add new case labels, but you actually move two. It
>>> wants explaining whether this was outright wrong, or what else
>>> causes the movement.
>>
>> Yes, as the commit message says it get those PC{8..10} counters for
>> Tiger and Alder Lake.
>=20
> But that's the problem - there was no commit message.

I'm used to that in git "commit message" refers to the whole thing,
including the "title" (everything till the first blank line. Usually
only a single line. Put into the Subject header by format-patch). And
there it says exactly this, which I considered enough when drafting it.
Will send a v2 with a more verbose description.

>> The former already had a label, therefore the
>> move. I assume that when Tiger Lake was added it was an oversight to n=
ot
>> also read those package C-state counters.
>=20
> Or the SDM wasn't clear, and we needed to err on the safe side.

The SDM [1] seems to be indeed a mess regarding
MSR_PKG_C{8..10}_RESIDENCY. If I didn't missed something in that huge
document it lists PC8 and PC9 only for Intel Core 4th gen with CPUID
06_45H (table 2-31). For PC10 it additionally list Atoms starting with
Goldmont (table 2-12 and references to it).

But it already contradicts itself by listing on page 5002/5003 06_4Fh
(some Xeons) as another model that supports those MSRs. It refers to
table 2-38 there, but that table doesn't contain those MSRs.

Linux' pmc_core [2] and turbostat [3] both use those MSRs on Tiger and
Alder Lake. And on my Tiger Lake test system I get useful data from
there.

Is the code in Linux a good enough reference?

Simon

[1]:
I looked at what's currently linked on Intel's website. "325462-080US"
from "June 2023"
https://cdrdv2.intel.com/v1/dl/getContent/671200

[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/platform/x86/intel/pmc/core.c?h=3Dv6.4#n44
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/platform/x86/intel/pmc/tgl.c?h=3Dv6.4#n188
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/platform/x86/intel/pmc/adl.c?h=3Dv6.4#n291

[3]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/power/x86/turbostat/turbostat.c?h=3Dv6.4#n5763
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/power/x86/turbostat/turbostat.c?h=3Dv6.4#n5074
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/power/x86/turbostat/turbostat.c?h=3Dv6.4#n5409

--------------9AOgAcx0N0K2Er0tVWGl9fk3--

--------------XkXusRDb9wd301gW0E277UxX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmS282sACgkQkO9xfO/x
ly+3gg/9H4hqwS8YzxXHb9FVzumNrOxhk8FyM3LjfhcsySt0DX+Hk/iCXy7IvOdD
32SWT8Es9jtoWETE7m/1nqrYMX1HEILub+MccLJGYK6M60bs14jwLta2u+kiCilw
KAjRTdcN0oWAkbqSG/iG3CL7eZ6v+47TTr5B6+fdk6HWeQhNW6x4+L6klz6cpCl5
ZySGLmKPJMpUdBl8RJ6hy2TXIFambX/1FggYeGJZBlo3PvgGEFMQmC4yydOqqblL
1BzIiqV8lnRtQ2jdHZsRCZjr7/uwGPtMlrPfQMVL+HqWr+rX9gB4YjYgW74kcZOn
0zXzofp52c57sRiUEqQ1LDAObusXEcuQ6fIzkI4sovdc01rRMJNUo8rcs6GVTCDv
SwIKmf0SSCvlRzLyBKzQnk+N7DJY1pMfIxfTuKBQdNfjgikkMIoxAmSlPzM3DQb5
RRGGMnBOf2DRpYbc2HYESkhvWJuo/dcInAQiAuMf2/kbh4/mNFSxyK2aKa0CW3hY
1wSEUdM6DA0fzFOK5yyY0Z0aA6iIswO9VeOFmCIrxyJ2wIfyeAf69cyuCMa8UYZC
wEvMMA655w0YJ3YPFNaaXTI0u7MTLPB4erkc4/MuvrkMuOjsCAUdzvH2pxKnHIEJ
uwTjW4xlSqo/BUHPnE9nnri1qGSeIZl7yJcsD/uvW1/3lpS0Uf8=
=QJ0B
-----END PGP SIGNATURE-----

--------------XkXusRDb9wd301gW0E277UxX--

