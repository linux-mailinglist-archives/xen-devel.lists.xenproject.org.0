Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A8F64E035
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 19:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463706.721944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5sdu-000230-KA; Thu, 15 Dec 2022 18:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463706.721944; Thu, 15 Dec 2022 18:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5sdu-000209-Gk; Thu, 15 Dec 2022 18:07:38 +0000
Received: by outflank-mailman (input) for mailman id 463706;
 Thu, 15 Dec 2022 18:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5sdt-000203-H9
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 18:07:37 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 598051f6-7ca3-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 19:07:36 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 33E5F3200805;
 Thu, 15 Dec 2022 13:07:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 15 Dec 2022 13:07:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 13:07:30 -0500 (EST)
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
X-Inumbo-ID: 598051f6-7ca3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671127651; x=
	1671214051; bh=LA/fNO6DAe0xpRYS22ZbCx6lmWmSQiO8cjrfvUTZtPs=; b=v
	rgXf/PMhDj0D8NTlU6aLihcBABX4cVm9g/EuiLcnwzXY5LjQNWQoxR8fc5PuzHQv
	CGXozw/KX4IFdhvWEyF5RzOKa4bX2wEImDfAX9dA2v2xBgaQwgkfrex038k5yj11
	n92CMGj54EvfOUyF0DqP5+HUprS0dV6cZ4cRslZX/V/Uu+cUF0z5oi9AcAIGtuqm
	kTIbVK5w+TDacyunGdxyHO4YzRv+jPRi2rw9YMITxAmOYsvYUYzhxamIxx61aIXb
	1quNQptyxf6gtGucWjKwoPbElQcmQDn62BT8C00acGdVKs9Tm2/Yg7xrB8PmIkKV
	vXpyAIiHXtGGk2iN2z64w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671127651; x=1671214051; bh=LA/fNO6DAe0xpRYS22ZbCx6lmWmS
	QiO8cjrfvUTZtPs=; b=qPsRY2ncQA1xgq8skhMH8/dF/twCExIbwg8nE7oyPLxb
	XyHYsx5aP7r87JuQjNOabJ1IHbK3LzIJ1kIS2zbW/cQrWG3d0POGklhXCmh3C67B
	zvrHMhJoGDakKDtv9vpBDx/jJwAxqPQ/3UCZ908JubhG8FgziLpm+DGSrwiD8fU6
	ZNhDlWMQXqyUxbWFnpRN6ERVv67bTCR5nEHGVJyTT9RFEUv3z8JWcwg2Mv0EalwK
	xQG8zi8BQkXcZvtn8RXh/LWpqVa3ok394U8IIkxLXJrTYNmh5pXErbsmC3KeXdma
	GxVFdDl1fKsp7q0eJgsQVt7ZNjo58k/W/CtC7O0Kqw==
X-ME-Sender: <xms:Y2KbY7IgSfOqd8_wAtJPhrzl7In-H731IEDPGYcG7QVDpURP-XGUSg>
    <xme:Y2KbY_LzkBGIcnXyxaSeA2WaOHQoTKHMQZcH0q2Mo_8zgAamORbPCHgxbNo4Z99zn
    M0zOgSdBr9FZbo>
X-ME-Received: <xmr:Y2KbYzuiW2zWWyDzywOmMVHKjc3WtD_QSM-vDjXpSkLJKbIKqfTNppHChPA->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
    jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:Y2KbY0aBDHS7_vRLBAH6DPoca3fAMXI5pO1lq-wByMjjBOt_8TyNVw>
    <xmx:Y2KbYyazQ8KOjRu0oNAqK_6iemue4_R9aykgjRLaZJhDiVAszxIeVA>
    <xmx:Y2KbY4AHtiX4R8TLdkOVYK3iCzjJ-7K_x5HUDMStqoFxeXDYoQk-hw>
    <xmx:Y2KbY65ex9M5423n2UViyUFmPWT7fvtkxlnQCBufIVlQntb-agAiGw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 15 Dec 2022 13:07:26 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 04/12] x86: Add memory type constants
Message-ID: <Y5tiYRrCd+c940+K@itl-email>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
 <5e0dee8a2cc5076b677e813c9ee61fa08e8e4c1b.1671057808.git.demi@invisiblethingslab.com>
 <4a5e1508-b7fe-0bf3-6253-a7e546226ccb@suse.com>
 <7f04c4bb-102b-510b-fffb-b486abe41e4e@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7KcXmngL53MKwLWd"
Content-Disposition: inline
In-Reply-To: <7f04c4bb-102b-510b-fffb-b486abe41e4e@citrix.com>


--7KcXmngL53MKwLWd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Dec 2022 13:07:26 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 04/12] x86: Add memory type constants

On Thu, Dec 15, 2022 at 05:17:30PM +0000, Andrew Cooper wrote:
> On 15/12/2022 8:49 am, Jan Beulich wrote:
> > On 15.12.2022 00:11, Demi Marie Obenour wrote:
> >> --- a/xen/arch/x86/include/asm/x86-defns.h
> >> +++ b/xen/arch/x86/include/asm/x86-defns.h
> >> @@ -153,4 +153,15 @@
> >>       (1u << X86_EXC_AC) | (1u << X86_EXC_CP) |                      \
> >>       (1u << X86_EXC_VC) | (1u << X86_EXC_SX))
> >> =20
> >> +/* Memory types */
> >> +#define X86_MT_UC         0x00 /* uncachable */
> >> +#define X86_MT_WC         0x01 /* write-combined */
> >> +#define X86_MT_RESERVED_1 0x02 /* reserved */
> >> +#define X86_MT_RESERVED_2 0x03 /* reserved */
> > As said, unless there's a good reason to use 1 and 2 (and not e.g.
> > 0 and 1), I'd prefer these to be numbered 2 and 3 to match the
> > values they expand to (and the numbering then not being as arbitrary).
>=20
> TBH, I'd prefer not having them in the first place (I'll see if there's
> a way to simplify the build assertions which are the only users I can
> spot), but if we are going to have them then do use 2 and 3, and its
> fine to abbreviate to RSVD.

They will be needed when the NPT code starts to use these constants, as
EPT_EMT_RSV0 and EPT_EMT_RSV1 are used.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--7KcXmngL53MKwLWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmObYmEACgkQsoi1X/+c
IsFujg//fK+k1gROpsrWnrotZ2l1T465qE17gM7NsNX9Xc0OQEkTvoJWyCUO8et+
q6mwaQq7PBAvVSlhJvLH4adHiA+tf/PSV951K+af4YqyV0cimXD1bnKGGSUUU4pL
FgTXg4Vtbsws2Wxa8H7SSSwN9st+u/OBjdnsWhoaWMjK0iwvXHTjjiaBiB4ig5JT
5gOHy3ycS7Ko37nV52TLTf0dzUUZLNiEhyxkTQycFT6tZKY3/4XJp4jbzHn70wbG
KP5lKNzA/xuiLnNj1EFRi35sO6RIkiTnC1hnDENwKOgVolB2Hhra4oz3C8L2Omm4
802DktyvyNV1HHH8Ly5R+sA21IDe8smulN3LcDxoVwyN2xi3JG2TxwD+Tdb4QzhJ
T/o41td7sDXgDJLgSE/6PnRUVHT34rTK0LhVvBjVLZMC0klY3cBZD5wrfH7Fgjji
D7pmbnK+feKWfDHRnDOZJgDoaKM3hWcAQu/tCTh2cAJkPlQaLZGFvZ5woYawM1rm
eQ76fLLLFBjpplI0oMLz99WNr17VF2YZiTDKOQnPKSXK9jnoNMHlYZy+JOeHAu27
aEq2vUaTF0TRxGFoqmzfuWVKslKaZocGWCbFuJRAk5bOZeiHHvH6zSDUM1i/5KRY
10jVPVybejQ5be2+ybP6+fgyBRvbsh20OUlPiIo3DVaNyx4ZHxA=
=iG8/
-----END PGP SIGNATURE-----

--7KcXmngL53MKwLWd--

