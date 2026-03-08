Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBywHlTBrWnq6wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 08 Mar 2026 19:35:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2206231B1F
	for <lists+xen-devel@lfdr.de>; Sun, 08 Mar 2026 19:34:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1248970.1546532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzIxm-0003qr-Av; Sun, 08 Mar 2026 18:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248970.1546532; Sun, 08 Mar 2026 18:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzIxm-0003ob-88; Sun, 08 Mar 2026 18:34:50 +0000
Received: by outflank-mailman (input) for mailman id 1248970;
 Sun, 08 Mar 2026 18:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdMp=BI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vzIxk-0003oV-T4
 for xen-devel@lists.xenproject.org; Sun, 08 Mar 2026 18:34:48 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b02c3aa-1b1d-11f1-9ccf-f158ae23cfc8;
 Sun, 08 Mar 2026 19:34:46 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 885951400127;
 Sun,  8 Mar 2026 14:34:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Sun, 08 Mar 2026 14:34:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Mar 2026 14:34:44 -0400 (EDT)
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
X-Inumbo-ID: 7b02c3aa-1b1d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1772994885;
	 x=1773081285; bh=moVg4hDlKB7TLH7MW3WxwibTX6FvIIhzqiS1wz5mVQE=; b=
	CV+PHU3Easa5TKt/O0Qm6FJIL9hwDuEnYodhZmh/q+59dzo45dvXD+oIlj9RJM5W
	PPze8tqmWRV5ZCBTc44jJzMpVix36PFgOh21suz5XGe5riL30uleaj6TA51CZqbx
	roZsh5dRfpKcJnAJus9F3mQYP3UDcmpHRdY4Fdhk9llZlvvGd4/m3/k2AZyWErny
	c1fTz1Dy4Xld54/b5+tBoK+T3tI8AiexpCoGXup245ZDi4sEFHo+nDKAcJdQa1FZ
	7WiqKIdrB+UVdDigVo+uWZiYkYs/ukWpk0hZFTzCJ3caAxN5qKjwN2SfimE+ewGr
	zuCbK3OacL+nN8myt4wnxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772994885; x=1773081285; bh=moVg4hDlKB7TLH7MW3WxwibTX6FvIIhzqiS
	1wz5mVQE=; b=WC8A6CIQT/R8UQyCoMBXHGy/LqoVbatnjSlH9EQ4CBHaU0Q/uaK
	zg5wXLMPby2C3AS5ADfZj6gdtfKDyogwzLGWfIqgM81r2YnuaLsj2hLb/bIPF7tk
	EKqMSzYNCjaWU6tEaEbFsgcqtcQVvWlLYxUb3KvKpYlqq2HvrlTXYDKj4MjsW8HX
	Ob5xSjGL8EhbdOL0wqrEjUssn+SsB4NMGzC1HtCSoYzrIOu6dmKKU1HWHdU+Zvch
	76H3qbDCdMo/1FNYEWW5i2SNvmCAfaH9uRer6QQQEpfLkDE3u19ZdrQa0E6Hewp1
	/os9qqvZfDkwPkSvooMrxMLZkUqwOYO+diw==
X-ME-Sender: <xms:RcGtabt2Ha8slGPp8hEscub2-salJgLsPcmfDykii9t89tK7v908oQ>
    <xme:RcGtaeuTaaU0xPzrCCugNc0Gc4tclV5NkG4UnM-StsOzt9-yHJ0RVjKmTZ34ul9c4
    VOqRkfAzlu-Tm8EC-EUynnU-e8WDErg9Qjgf2I5YZF84cqPTw>
X-ME-Received: <xmr:RcGtaRD5wFoAq_5uyERK9ym5sHRUsA31mHEbVnBnZGN6nbc8BwEDYRQ_fbZeOQegxt20-dCcV_3l8RQ8tpKpEvLQ_uJke623QUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeehledvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:RcGtaQPaXQ1OyB1OtRD3IwVw5KVXGJ4z82s2ahs9XL_xVAn2opvvvQ>
    <xmx:RcGtaaxZTd-zFrbjZnEDjezt8CX1rN6bDH5dpkRlGyJG74vIzMgIFQ>
    <xmx:RcGtaQUWXbfdfTxLWZSDVRfS63bLOt___3ACmsurFzBn8cG-In1lRA>
    <xmx:RcGtacM54cqzZqYbdfsbJP0YxMida5o0VehXqnjEhhWM8HudVTAz7g>
    <xmx:RcGtad4aP2G00beaCLuYTmHcObHmr7sA0yqr-OflupPIqLkYPWZF7ynl>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 8 Mar 2026 19:34:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/efi: Add opt-out mechanism for BGRT preservation
Message-ID: <aa3BQryZJYHyKJ3j@mail-itl>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-4-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2nGy8xoL0y3DCac7"
Content-Disposition: inline
In-Reply-To: <20260305191810.31033-4-soumyajyotisarkar23@gmail.com>
X-Rspamd-Queue-Id: E2206231B1F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
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


--2nGy8xoL0y3DCac7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 8 Mar 2026 19:34:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/efi: Add opt-out mechanism for BGRT preservation

On Fri, Mar 06, 2026 at 12:48:10AM +0530, Soumyajyotii Ssarkar wrote:
> As described in the task, BGRT preservation is now enabled by default to =
fix ACPI corruption
> for desktop/workstation systems (similar to ESRT).
>=20
> Add an opt-out parameter 'efi=3Dno-bgrt' to allow disabling BGRT
> preservation on systems where the ~1MB memory overhead is not
> desired.
>=20
> The parameter is parsed during normal Xen boot (not during EFI
> phase), so it only affects diagnostic logging. The opt-out flag
> is checked at the start of efi_preserve_bgrt_img().
>=20
> Usage:
>   Default: BGRT preserved automatically
>   Opt-out: Add 'efi=3Dno-bgrt' in Xen command line
>=20
> Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
> ---
>  xen/common/efi/boot.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 1e3489e902..b735eac6b2 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -167,6 +167,7 @@ static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdEr=
r;
>=20
>  static UINT32 __initdata mdesc_ver;
>  static bool __initdata map_bs;
> +static bool __initdata opt_bgrt_disabled =3D false;
>=20
>  static struct file __initdata cfg;
>  static struct file __initdata kernel;
> @@ -868,6 +869,9 @@ static void __init efi_preserve_bgrt_img(EFI_SYSTEM_T=
ABLE *SystemTable)
>      bgrt_debug_info.preserved =3D false;
>      bgrt_debug_info.failure_reason =3D NULL;
>=20
> +    if ( opt_bgrt_disabled )
> +        return;
> +
>      bgrt =3D find_bgrt_table(SystemTable);
>      if ( !bgrt )
>      {
> @@ -1873,6 +1877,10 @@ static int __init cf_check parse_efi_param(const c=
har *s)
>              else
>                  __clear_bit(EFI_RS, &efi_flags);
>          }
> +        else if ( (ss - s) =3D=3D 7 && !memcmp(s, "no-bgrt", 7) )
> +        {
> +            opt_bgrt_disabled =3D true;
> +        }

This is too late - standard param parsing happens after efi_exit_boot()
already. See early cmdline parsing in efi_multiboot2() and also in
efi_start() (but note the latter is about options to xen.efi, which
isn't exactly the same as standard xen cmdline...)

>          else if ( (ss - s) > 5 && !memcmp(s, "attr=3D", 5) )
>          {
>              if ( !cmdline_strcmp(s + 5, "uc") )
> @@ -1968,7 +1976,11 @@ void __init efi_init_memory(void)
>      if ( !efi_enabled(EFI_BOOT) )
>          return;
>=20
> -    if ( bgrt_debug_info.preserved )
> +    if ( opt_bgrt_disabled )
> +    {
> +        printk(XENLOG_INFO "EFI: BGRT preservation disabled\n");
> +    }
> +    else if ( bgrt_debug_info.preserved )
>      {
>          printk(XENLOG_INFO "EFI: BGRT image preserved: %u KB\n",
>                 bgrt_debug_info.size / 1024);
> --
> 2.53.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2nGy8xoL0y3DCac7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmtwUIACgkQ24/THMrX
1yynqAgAj36JkBL1ZYj9BVbQgsX9pyS5O8a828DLAzSyY8y0t5+zNPVaUcFnz8zE
6bIvbCCJeRVWyrBpEApRHIoJe6q9VL1ur5GHtMPWsSRTupBKWcdwGhZpmSmP2qYN
xVSs3KuudYQiKVa66h2AGIba8QfWDPmSrYl5KeEVV6HKGeNRELGmFGz7BOxOtmVu
dbG9xHD1cuX8xufzNnEEkgs7OBiA+NcyIh0mXj2zRxUwIErj32OkAq3m47W4NYgC
uya9v+9lnhVaPMFEhsBd0P5NWjiutsWJLgSCj0gYHvr2AucxkfClGL9Cb4qK9ora
2sOLTGYIBW0uzjsU8jiaKha7unX/HA==
=+07o
-----END PGP SIGNATURE-----

--2nGy8xoL0y3DCac7--

