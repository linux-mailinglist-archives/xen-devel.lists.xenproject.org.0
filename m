Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFvLKYQJsGlregIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 13:07:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B89724C6BD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 13:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250070.1547515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzvrt-0003vs-2B; Tue, 10 Mar 2026 12:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250070.1547515; Tue, 10 Mar 2026 12:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzvrs-0003tC-VS; Tue, 10 Mar 2026 12:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1250070;
 Tue, 10 Mar 2026 12:07:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDxx=BK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vzvrr-0003sl-KI
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 12:07:19 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae4fbfdf-1c79-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 13:07:17 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 21B4B7A0208;
 Tue, 10 Mar 2026 08:07:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 10 Mar 2026 08:07:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Mar 2026 08:07:14 -0400 (EDT)
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
X-Inumbo-ID: ae4fbfdf-1c79-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773144435;
	 x=1773230835; bh=rJNy2V1r18eUkt+FDuWvUZnnrRhtKNBTvcoO1cA8wGY=; b=
	DtprdXdK47iH0UKWxVfFYMLu0GnDVyAk6B55KQGr8VtNreseOebu8GzwWedR1Apj
	PrS4ZyM3w5RUWBu8S6SHnCfJeTdq7Qilrgnojks4O4kAkkFbOEcRdNrBWguXZZez
	ROMsI4M7bHKfe3Uu/t1v+0cGtgX5VgvVmCZb9+vCtXXWNpQBcefEeouXotAS5uW/
	FPejGNmjiGIV+g5X68jH+1fkTs2WhNtPXHBFebZ0PSCAm6IaiuOevTedLaZ8Pw2y
	lgAFJr8C+0vfr4Ang5fp1kwnDcmZFs2gz40XyuHMnMZTEhNpklFEOv/9oyYcc+ea
	XOg9HXMefb3xDGPFmJLDdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773144435; x=1773230835; bh=rJNy2V1r18eUkt+FDuWvUZnnrRhtKNBTvco
	O1cA8wGY=; b=jdSxJPL1JWV9W5hoG/3GRukqxd8+feRmcjh6UEb+NeOBTV46HlX
	5TxsAf0cPhaU8JhXiYeVrRHHIocsxRcjx3f8zrfX+WhB1IH2jpAefXy224aqnbMN
	CwItqe7OTYL2oFKTVj2z41/2XVcB9OpPcpq5yXuy4e4LSjueTU1OcFr63g9qSijs
	VgwGPE1JMjqiYy3ovkuSFN/hAyEQvk63sGHKDbwlJOh5QKTEpgncRi6jKqTvPYlq
	AbprotWDbzfY9/7mWBskPCQAm7kcsqfWEw/zWyftNhVrKN85whZvIrjpR3zFh1k+
	TP7UDikRbjyLaOTnF28aUBPyGb5J22CarQQ==
X-ME-Sender: <xms:cwmwaQ2ZHBV73Wc_g-fyAdIFX2vl14ccqwAn7A0SJ5WuvRx_ev4gmw>
    <xme:cwmwadXceAuOdDA4JETu95CfRyr1z7Pj0k9VFKvUkvbsSoXvhC9NGzNY6Gtt7Tpzd
    fmv2LGd-0e4vsuGYYrLATeIrTBqHPvvhBWtVDkuP88oFv-wdw>
X-ME-Received: <xmr:cwmwabJAfa4c5uN5z9iofnV4z9cZeqHt8X5oEsBdgPDz1p6OQvUHK65IHh0A-nH19KxyzxJUp6MASklmyPWx-Ota5NkmH2lDXGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkedtleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepshhouhhmhigrjhihohhtihhsrghrkhgr
    rhdvfeesghhmrghilhdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsth
    hsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsrghrkhgrrhhsohhumhih
    rghjhihothhivdefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhse
    hsuhhsvgdrtghomhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhu
    thhiohhnshdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:cwmwaf3lO2IHyR6WImAtQ7sYQXQFAwYG14eXB0daILCjjAurmTl6oA>
    <xmx:cwmwaR4PE1c9m_-264nZQxO4TpugIzYOpoJZ1jEW8ncaA0TbU-SpkA>
    <xmx:cwmwaY_Dp3gswLCuCZ-usK4CeeKe4W1pVv8YgHxMoFLMmvOK5hViMQ>
    <xmx:cwmwaYUZz9Z1wTX4vebj48NxasfomSjAh3wHmrwJ-FZATUPjn2Uf5g>
    <xmx:cwmwaYiMx3GP9JvN3qZLw7EnkNHwSk0MF4oFR-X5LFxFrRxWQbVRBB76>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 10 Mar 2026 13:07:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] x86/efi: Add BGRT image preservation during boot
Message-ID: <abAJcNkwwJt4lGAt@mail-itl>
References: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
 <20260306132935.13727-2-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p0lgbi4TdJfZJK01"
Content-Disposition: inline
In-Reply-To: <20260306132935.13727-2-soumyajyotisarkar23@gmail.com>
X-Rspamd-Queue-Id: 1B89724C6BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,suse.com,apertussolutions.com,citrix.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


--p0lgbi4TdJfZJK01
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Mar 2026 13:07:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] x86/efi: Add BGRT image preservation during boot

On Fri, Mar 06, 2026 at 06:59:33PM +0530, Soumyajyotii Ssarkar wrote:
> The ACPI BGRT (Boot Graphics Resource Table) contains a pointer to a
> boot logo image stored in BootServicesData memory. When Xen reclaims
> this memory during boot, the image is lost and the BGRT table becomes
> invalid, causing Linux dom0 to report ACPI checksum errors.
>=20
> Add preservation logic similar to ESRT table handling:
> - Locate BGRT table via XSDT during EFI boot services phase
> - Validate BMP image signature and size (max 16 MB)
> - Copy image to EfiACPIReclaimMemory (safe from reclamation)
> - Update BGRT table with new image address
> - Recalculate ACPI table checksum
>=20
> The preservation runs automatically during efi_exit_boot() before
> Boot Services are terminated. This ensures the image remains
> accessible to dom0.
>=20
> Open-coded ACPI parsing is used because Xen's ACPI subsystem is not
> available during the EFI boot phase. The RSDP is obtained from the
> EFI System Table, and the XSDT is walked manually to find BGRT.
>=20
> Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
> ---
>  xen/arch/x86/efi/efi-boot.h |   2 +
>  xen/common/efi/boot.c       | 187 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 189 insertions(+)
>=20
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 42a2c46b5e..27792a56ff 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -910,6 +910,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,
>=20
>      efi_relocate_esrt(SystemTable);
>=20
> +    efi_preserve_bgrt_img(SystemTable);
> +

See my remark on v1 - efi_start() wants this change too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--p0lgbi4TdJfZJK01
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmwCXAACgkQ24/THMrX
1yxuFQf9F1Sk9gsZiIayNgHTQJ41+Gdxf+DCn91KFOV3PKS0xjWCP162pvYMgU1o
RCTk+Zp1ycBVH2YgJSSKyq3//Iq8kH4drkso2aVGIdnoFHxwnUnvhPazwd+pQ0yT
tRGTsfJB2pbOxQUzxaqQYHjBf9D9yjxLpnhD0pXwL0fEZl6cS1x2r6OrxHuZ9EQ8
34u2ZK4gQ4iT34ll1xC3hJXevXLsjwvceGLOCB7Gf9MuoBvMs+cJmVps4SuYqti9
lfsIFyoOVcA30WjKLI1k5rBtgup/6EJi0m6NkhGYuEgaDd/nOuVAH0o+soR1aamU
pEMOT0EzcOqAb68z5+x8mwSTPtXtoA==
=MFMh
-----END PGP SIGNATURE-----

--p0lgbi4TdJfZJK01--

