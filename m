Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IxAKN0DxWmM5gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:01:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE6332C77
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263615.1555495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hVs-0007j4-HB; Thu, 26 Mar 2026 10:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263615.1555495; Thu, 26 Mar 2026 10:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hVs-0007gC-E3; Thu, 26 Mar 2026 10:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1263615;
 Thu, 26 Mar 2026 10:00:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w5hVq-0007fz-BP
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 10:00:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5hVp-00HXcd-N5
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:00:25 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c503b5-5cb7-0a2a0a5109dd-0a2a4509e056-22
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:00:25 +0100
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c503b8-e484-0a2a45090019-67a8ac90df93-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:00:25 +0100
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 3C58CEC021F;
 Thu, 26 Mar 2026 06:00:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 26 Mar 2026 06:00:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 06:00:22 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774519224;
	 x=1774605624; bh=G+BqfjFs7RUwpGnKgULXJ4doTq7FLor4WHwBKTxbRiM=; b=
	dVsQm/ZmE047HeCY2PFAJ2HggCm+e1upz0C+OvwIuQosrqmhAenx/caKbzsyOSrH
	/iLEuzsrx/szXmHkpl7gRTMt7zOHM3qjmdcul5jbs5eNoFLITlCucJAHqFx25YPT
	AzHffUOaaC9hEUlXAkA+9PZ8eAePZRNdEJm28u2+DOONlvX+zHg5I+RcGp9sskYK
	X21P64MXZX1uwyaXZieSuFiu5wS+gQpmQ5wAjEtBDs8NFwtZ9kCr1Ag1fEUjtBF/
	VtnxbnaXYpSnNqaXawK/1SWyvvCDij41aYJL5EK1ESqkjrru422mMl1UlXI2NQu3
	5uLMVyoRc/U7bBsoy8EdxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774519224; x=1774605624; bh=G+BqfjFs7RUwpGnKgULXJ4doTq7FLor4WHw
	BKTxbRiM=; b=uI8MHRU3+8oWU4E+AUKsfxbhOEEQwdZJP05Yo+e0IOF5vIr3ogv
	978yCaYMnpQzcaHR27qEzJbKYo99Mvox0k+GZPorefeagW2mtAi6i7OJrVC/Viu8
	k79BvJ4mUYOxXI4+mMxNRdK+eEyduDRCZCEatBnB+d822PXH2tmjr3X+PUhSvLP4
	2IlQIcpf1UY/Ne0LxoDgGvYgkzE+TeZIDk/r0V3CFCtijVCQrbKNRNt+he+qlqYO
	3n3/hjmbJMPyMbl0zEfzINp//xq1fM7aqL0cFjMGbQo9Z27LglgyX6KOxxYnAw56
	zu6PtsJRY1Je0roEdjXWjXI8X+0X2Vbt/uQ==
X-ME-Sender: <xms:twPFaRNjx_006EU-3tRw51XGLRaCpW48VoYuyL0hiZ3HuDIIZEmFVQ>
    <xme:twPFaWNFOv-MtwgNVDjT1enOYHfPudYaJXAPcUmeEnH8QN2YjO4HoyvysqXn-Iv-E
    r4KuPc5bWMZirSttCpbwZgv_znncTBHnysIoU1ugLHA_EWQEbw>
X-ME-Received: <xmr:twPFaShZrsJbyAeSHTFfjYHppgd7gDvf2TPCPuEh0rMP4jc8030R3WlJp_tjP88uZiyVsjW0X_11BwpdbSxC1yGL5U4m2CKgY9c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejtdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehsohhumhihrghjhihothhishgrrhhkrghrvdefsehgmhgrihhlrd
    gtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtgho
    mhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtg
    homhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphht
    thhopehsrghrkhgrrhhsohhumhihrghjhihothhivdefsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:uAPFaTtU5fdu9u01yrV6M0NzGK_rSZNmkaaF9nSEzxT2KSxbLAM0hw>
    <xmx:uAPFaYSzaq7qvyuTWu12lzK2Abn61f0mztCbZeFcWA4WkBVrRR249Q>
    <xmx:uAPFaf1mtGhFrcNA0tSfOPeZjRsas69nTq_7Z2CCneBlkziNIdNsqw>
    <xmx:uAPFaVuDbXSdDQ1s9pYw3CNSpambmlmEDf4oDZ8URqcGcifFFqDUYA>
    <xmx:uAPFafdL7qm7vj99_KZSfiKhZK1zeVc4Av80N90McKRG0etvrizo983K>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Mar 2026 11:00:21 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	sarkarsoumyajyoti23@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting
Message-ID: <acUDtSXbv0-YLQ7g@mail-itl>
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-3-soumyajyotisarkar23@gmail.com>
 <751e1d3e-d95a-4129-8baa-450a53d15efa@suse.com>
 <acQADhcNzkVBm3C3@mail-itl>
 <5e121a98-fcd1-4d20-aa6c-a02af7f7eef4@suse.com>
 <acQF5Kd4kZzo3BN6@mail-itl>
 <11c0a822-afc7-4e3d-b6f5-ef8e32bd2f0f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dx68d3efQTV8AtnN"
Content-Disposition: inline
In-Reply-To: <11c0a822-afc7-4e3d-b6f5-ef8e32bd2f0f@suse.com>
X-purgate-ID: tlsNG-bad1c0/1774519225-5BEA2A73-C5489B02/0/0
X-purgate-type: clean
X-purgate-size: 5411
X-Spamd-Result: default: False [-2.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:soumyajyotisarkar23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,apertussolutions.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CCEE6332C77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--dx68d3efQTV8AtnN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 11:00:21 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	sarkarsoumyajyoti23@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting

On Thu, Mar 26, 2026 at 09:45:43AM +0100, Jan Beulich wrote:
> On 25.03.2026 16:57, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Mar 25, 2026 at 04:44:15PM +0100, Jan Beulich wrote:
> >> On 25.03.2026 16:32, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Wed, Mar 25, 2026 at 04:16:25PM +0100, Jan Beulich wrote:
> >>>> On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
> >>>>> @@ -327,6 +328,11 @@ static int __init cf_check acpi_parse_hpet(str=
uct acpi_table_header *table)
> >>>>>  	return 0;
> >>>>>  }
> >>>>>
> >>>>> +/*
> >>>>> + * Invalidate BGRT if image is in conventional RAM (preservation f=
ailed).
> >>>>> + * If preservation succeeded, image is in EfiACPIReclaimMemory, wh=
ich
> >>>>> + * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
> >>>>> + */
> >>>>>  static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_=
header *table)
> >>>>>  {
> >>>>>  	struct acpi_table_bgrt *bgrt_tbl =3D
> >>>>> @@ -754,5 +760,7 @@ int __init acpi_boot_init(void)
> >>>>>
> >>>>>  	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);
> >>>>>
> >>>>> +	efi_bgrt_status_info();
> >>>>> +
> >>>>>  	return 0;
> >>>>>  }
> >>>>
> >>>> Does this really need doing from here? If you called it ...
> >>>>
> >>>>> --- a/xen/common/efi/boot.c
> >>>>> +++ b/xen/common/efi/boot.c
> >>>>> @@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(u=
nsigned long smfn, unsigned long emf
> >>>>>      return true;
> >>>>>  }
> >>>>>
> >>>>> +void __init efi_bgrt_status_info(void)
> >>>>> +{
> >>>>> +    if ( !efi_enabled(EFI_BOOT) )
> >>>>> +        return;
> >>>>> +
> >>>>> +    if ( bgrt_info.preserved )
> >>>>> +    {
> >>>>> +        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
> >>>>> +               bgrt_info.size / 1024);
> >>>>> +        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
> >>>>> +               bgrt_info.old_addr, bgrt_info.new_addr);
> >>>>> +    }
> >>>>> +    else if ( bgrt_info.failure_reason[0] )
> >>>>> +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n=
",
> >>>>> +               bgrt_info.failure_reason);
> >>>>> +}
> >>>>>
> >>>>>  void __init efi_init_memory(void)
> >>>>>  {
> >>>>
> >>>> ... out of this function, it could be static and no stub (misplaced =
in
> >>>> the earlier patch) would be needed either.
> >>>
> >>> It was here before, and I complained about it, because it printed the
> >>> invalidation reason way later than the actual invalidation.
> >>
> >> Sadly now I complain about this call out of acpi_boot_init(). What's w=
rong
> >> with logging the BGRT stuff together with the memory map?
> >=20
> > If you try to diagnose what went wrong with BGRT, that's not very
> > intuitive to find - for example on my system it's 32 messages later.
>=20
> Simply grep the log for BGRT?
>=20
> > It's even worse if system happens to crash between those two points.
>=20
> Hmm, perhaps.
>=20
> > IMO it makes sense to log reason for BGRT invalidation together with
> > the actual invalidation (message). I would be okay with moving it before
> > the actual invalidation, but I don't think there is a place like this in
> > xen/common/efi/boot.c (at a point where normal printk can be used alrea=
dy).
>=20
> I guess what you really mean is printk() output actually going out (i.e.
> not just to the ring buffer).
>=20
> While still requiring the function to be extern (and there to be a stub),
> how about adding the call much earlier in __start_xen, in here:
>=20
>     else if ( efi_enabled(EFI_BOOT) )
>         memmap_type =3D "EFI";
>=20
> ? Or alternatively anywhere between setting system_state to SYS_STATE_boot
> and the call to acpi_boot_init()? Or re-using the other EFI_BOOT check th=
at
> we have in __start_xen()?

Yes, either of those would be okay for me. I just want to avoid
potentially loosing important piece of information that Xen already has
at the point of invalidating BGRT.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dx68d3efQTV8AtnN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnFA7UACgkQ24/THMrX
1yy/dAf/UKsDeaJ0wWwIYWflDcH97jvCoWbPaEgUsDgMdxN3xVMR1DUR57JJlllV
TcOG9Av9DBpmgVaZTifd7opmRBQOwdw4hCaD0INkeyTgVZmh/VJa0IKBtoqc9ksO
zp3BEdumZ1Ux2zuiPLeQZvWhWdRYD9YAV3BfZZl2yCFp3RpU8iJTuDPR8m3SAF29
T+qlyQmc2VnSpuwOYE/i2dCgIsyy4E146Vgz9+CLpw/SPLbLfceBI/aKYQMUs9v9
DQI/IdjkhdPozEplvdF4hUd91ijqgZuH3eai/5QBT6yfqzJ1oD/iCmmb75Aypcuj
5jLj28139jDzV5LvM6R1RfCHVg/WrQ==
=s2dV
-----END PGP SIGNATURE-----

--dx68d3efQTV8AtnN--

