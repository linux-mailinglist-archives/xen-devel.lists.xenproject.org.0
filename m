Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKGiKQzxjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:38:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE5713490B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230396.1535875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpcV-00089I-2B; Fri, 13 Feb 2026 09:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230396.1535875; Fri, 13 Feb 2026 09:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpcU-00086B-Uq; Fri, 13 Feb 2026 09:37:50 +0000
Received: by outflank-mailman (input) for mailman id 1230396;
 Fri, 13 Feb 2026 09:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vqpcT-000865-7i
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:37:49 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6bd27c4-08bf-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 10:37:46 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id C51A9EC00DE;
 Fri, 13 Feb 2026 04:37:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 13 Feb 2026 04:37:44 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 04:37:43 -0500 (EST)
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
X-Inumbo-ID: a6bd27c4-08bf-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770975464;
	 x=1771061864; bh=7NgCr3Vz4k3SKBMCpArHXzwCENqUo1XEp0EAVsWbol0=; b=
	RqtFHokpa58ejqB3+UW1PlNYXtYpEwts8KxKFmLkSOnbvAlbFPEPahix8rJ+CEK2
	7HNjEiwPMbuJUGI/bqet2w/Mool7ff2kToR3JA9qXpI7kHGJzwpy1hIByJDRanFt
	8DZ4M+s0P5y4PJkEiNzjRH9IJTmw5zsu8mcd5T9++cBVEHr9CkvxnGNpAGxm5Teo
	rv1pQtRDFzXUpgSIH2STntRQxaBYkf9Nf0BuneyiovjkirTT43FdB8/2F+9S31jo
	UrtcW1dOWY2g4vbaz8DvY2h1Z6CLra3NNpRUEcLa6BQa5ymnfckfbTbX8UDMDEwf
	awjDycRQtG7sOvU81xJ9hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770975464; x=1771061864; bh=7NgCr3Vz4k3SKBMCpArHXzwCENqUo1XEp0E
	AVsWbol0=; b=s0XFL0mbouXn0ypeIzCKSNfCBGc0P1UMAG+gIQvPRqIJbCZMp3J
	mXuaP8MY+EXfh0gQPMe+Ff1tBqU0q+FyTNsUAU63vC59UyNe2+emWWy267oPU3kE
	M/kIBJpylSsRoAvR99SKYkS9DyDU9QPbcQ3DIOrHNElBABhFAS1TXgrMqs38MXeF
	h+/bSmsZe7DQ+T8bdYau/rdDO09TSa6/oRzBCdBFMSr5TQ86eyAAfEARdSIVf5WW
	7tqqEj/RuSXK0RYfgl/EIab5jtj8RroNy00f5ze/oFNM9J3EvVcicDc++t+CnuS+
	mEv13nkjTwYXUIDoAf0DjPSXCSxR8fkifHg==
X-ME-Sender: <xms:6PCOaZsauoibEcGyN8toPA_F7q2Wd0C7R-UQ2BZYNtwkUatEoqVm1A>
    <xme:6PCOaZdWN7-sxAjhts3HMzBbuUNz-EuCqAk_SIXwWyoT1dP8_flSGue-Ps8QoObox
    cuU183iSKNQ-Tb_cZ69STurV5CTtcS3fuKS8whB_XP8dS_4kw>
X-ME-Received: <xmr:6PCOaRyWeVVpzOKc3ROQ7I-fuQExobg183RMXRWWebvh0JuRRo89Ej5u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdejleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgt
    phhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:6PCOafEfkiQ_zvEg_BT9jOkv4wCN8G3iR-6su-uiuJLBuruELohdlg>
    <xmx:6PCOaVxVV_hPQP8HIAMBg1mR1nCcqnHm0X30rS7faGv8l47xgXI58A>
    <xmx:6PCOaQtORvv2SfaCGWRB44AqeEC61r4q8UUJNjzUTUps_e5SDE7w-g>
    <xmx:6PCOaS0wHCt46Ig_YL_4nYmz5dnMnzC4eg70-1YcF0qUH7jyNY3W7Q>
    <xmx:6PCOaT-ozI3Z0HpatRA3Tm1eIHaMPaso_hzvamc5t_RTzJutdMsu-pv3>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Feb 2026 10:37:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: fix off-by-one when handling extra RMRR ranges
Message-ID: <aY7w5DSo1ds3ZqTj@mail-itl>
References: <20260213031801.1744145-1-marmarek@invisiblethingslab.com>
 <aY7d8ohWykrmOmf5@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XXKrUVNUniWo3GsC"
Content-Disposition: inline
In-Reply-To: <aY7d8ohWykrmOmf5@Mac.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,invisiblethingslab.com:email,invisiblethingslab.com:dkim,messagingengine.com:dkim];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: DAE5713490B
X-Rspamd-Action: no action


--XXKrUVNUniWo3GsC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Feb 2026 10:37:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: fix off-by-one when handling extra RMRR ranges

On Fri, Feb 13, 2026 at 09:16:50AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 13, 2026 at 04:17:48AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > add_one_user_rmrr() operates on inclusive [start,end] range, which means
> > the end page needs to be calculated as (start + page_count - 1).
> > This off-by-one error resulted in one extra pages being mapped in IOMMU
> > context, but not marked as reserved in the memory map. This in turns
> > confused PVH dom0 code, resulting in the following crash:
> >=20
> >     (XEN) [    3.934848] d0: GFN 0x5475c (0x5475c,5,3) -> (0x46a0f4,0,7=
) not permitted (0x20)
> >     (XEN) [    3.969657] domain_crash called from arch/x86/mm/p2m.c:695
> >     (XEN) [    3.972568] Domain 0 reported crashed by domain 32767 on c=
pu#0:
> >     (XEN) [    3.975527] Hardware Dom0 crashed: rebooting machine in 5 =
seconds.
> >     (XEN) [    8.986353] Resetting with ACPI MEMORY or I/O RESET_REG.
> >=20
> > I checked other parts of this API and it was the only error like this.
> > Other places:
> >  - iommu_get_extra_reserved_device_memory() -> reserve_e820_ram() - this
> >    function expects exclusive range, so the code is correct
> >  - add_one_extra_ivmd() - this operates on start address and memory
> >    length
> >=20
>=20
> You possibly want:
>=20
> Fixes: 2d9b3699136d ("IOMMU/VT-d: wire common device reserved memory API")

Yes, indeed.

> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> > ---
> >  xen/drivers/passthrough/vtd/dmar.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrou=
gh/vtd/dmar.c
> > index 91c22b833043..3da0854e6d91 100644
> > --- a/xen/drivers/passthrough/vtd/dmar.c
> > +++ b/xen/drivers/passthrough/vtd/dmar.c
> > @@ -1065,7 +1065,7 @@ static int __init add_user_rmrr(void)
> >  static int __init cf_check add_one_extra_rmrr(xen_pfn_t start, xen_ulo=
ng_t nr, u32 id, void *ctxt)
> >  {
> >      u32 sbdf_array[] =3D { id };
> > -    return add_one_user_rmrr(start, start+nr, 1, sbdf_array);
> > +    return add_one_user_rmrr(start, start + nr - 1, 1, sbdf_array);
>=20
> While here, would you mind if we add a newline between the sbdf_array
> definition and the return?

Yes, while at it makes sense to fix that too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XXKrUVNUniWo3GsC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmO8OQACgkQ24/THMrX
1ywCxgf/bGKYMGlcdlyqDYa5ob12UgsT44Rv6U90lG+SGmN/zimsfxN51MGt1f0B
JfP4EWlYSFbJcrWSZw2khZuFAnxUwIBdRjIlPmL9tIcmGHJwZnDwY1ZPesMmxtL9
4CnmWbfaw/XI1Op2Fy2bkT1eJ8QkT1Pwpnvf52Jz1cNVbXRE8zGH3fdVJwv1v35L
L92pEQLDHINNaYwsYmyecZdOWTkLdSvIIX02WHGaOxdINr7STlUduTHEawY12rYz
xXHZes0vfiCHCY7TusODEcBCHCXdCE8KysgyHagrdMp8jcxpsLns53xN5USeGzvZ
FJtBU24jw3GyH7b3MZjuKagTlE71gg==
=Kncn
-----END PGP SIGNATURE-----

--XXKrUVNUniWo3GsC--

