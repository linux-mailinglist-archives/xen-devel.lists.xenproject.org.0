Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZU1OILUTLGriKwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:12:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF4967A140
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:12:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=quWf7yju;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=g5i6YJky;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1336722.1598515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2bg-0003Tj-TR; Fri, 12 Jun 2026 14:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336722.1598515; Fri, 12 Jun 2026 14:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2bg-0003Qz-Qc; Fri, 12 Jun 2026 14:11:36 +0000
Received: by outflank-mailman (input) for mailman id 1336722;
 Fri, 12 Jun 2026 14:11:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wY2be-0003Qn-Vj
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 14:11:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY2be-00AaIS-8b
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:11:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a2c137d-e002-0a2a0a5209dd-0a2a4504a456-36
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:11:34 +0200
Received: from [202.12.124.145] (helo=fout-b2-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a2c1394-1dec-0a2a45040019-ca0c7c91a9d1-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:11:33 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 573D31D0007C;
 Fri, 12 Jun 2026 10:11:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Fri, 12 Jun 2026 10:11:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 10:11:30 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781273492;
	 x=1781359892; bh=l6jzSGl+s4AtdvzahfnOVQLQnnhqkbCrmUN9XCZVM5Y=; b=
	quWf7yjulaepvf1MPW3YgW0c+FHBPzh/oJ13N7SJVX0z2ZYXtWNFv/hwKXVU3MAN
	oXSjBe5ai0hG8/MashcHw92IIO9oSg2iv8SSOOf5nlZ0TgTe9jtpITxBlh+Erk4z
	/rhEXnboaKjTTepWOTbeQE7aRR0eOmosGnYGcwUZ/9fjPQwG5GJANgCfI6W48394
	azFpb7PaBCLbU21eWgUecw+kSrD2ZU7khpKW2vJVBSpjhN0a3nDeatuL4FyTyqxL
	Bdzb0AgmMpfnvWs8ce4PH6qdbMzNPuFU36PD7cyPM2hPqrbrNf+DakznaArdR07Y
	RuLmNoFb807jqm2JxBbyUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781273492; x=1781359892; bh=l6jzSGl+s4AtdvzahfnOVQLQnnhqkbCrmUN
	9XCZVM5Y=; b=g5i6YJkyW7wz4uP3EOdhb33HBUsyaZMX52vXV5q3rBe9wOYbzLF
	CZuoe3iqs5vW27NDg4GAfnu3hYNWYGqg+2MYYCu9ZpiYtARTAIyF7pN+ura/s4Is
	21cSWbesX9PF8wcaOlkzxHBJ8yRTPxtOk+FEbRx7sfznTBu7wNh3D8lHwAeC2boB
	W5MEi97YkYkeC1L1RMzOkqwJChgh/3uQX+a19wez+N2mOL4DCx7S0D6EIG6Sl8vl
	8a3c/0ONtUcsmRtmP/Z3kSkqCSJsDoQhEE8ri2sdqiVzwoIW00XOnfxzOlxml240
	AI3TdTX3BdAZ41jAHPpxY3V1piB+XmA4XIg==
X-ME-Sender: <xms:kxMsanNVJOy7_Y4zrcjfMpc8f4eHlPTBiYehbyUQy2XSkgnJBOJ9cA>
    <xme:kxMsakO4D6_OJHKUSJ-ltWWiB_yR9N8FtZueLmLddzZsiL7TEOKZG_5dF4Th_S5z-
    U7l62f5SYAaASCBDpplpEbwi2KUKvXqYritEt-g2jMQwF4TWQ>
X-ME-Received: <xmr:kxMsaoiCRYySAQLXpg3mSMYR4bwynYgXXYL2k4JRQuDvt4MG0ZMhmDcyBFu0oQ_HmYI8dyTkg_POE8VEoW8cbAQzDuFvo-HJliA>
X-ME-Proxy-Cause: dmFkZTFigTBUpaLR2tcSzHKlAOkvckFZwQByWYg9y9csNkUGwtJW1wAxyEJjzQUQM8hcK1
    zbrIT6QesyYqKH9AAJaEluP1d9+04zH24W1gISezB+ejf7A3EV2HZCS5qW6okBL6i4LNfw
    +EUDCUiv42xC2B1C+lnWdmMFVWNRLX6AC0p6pfp/94CecTq6odKwDg9q9ss4FwLVsNI4it
    GUSUr7/Rs4jR8WGKbf7heb7PrzL7fbnj0FhJ6AXfWvCOazpciqwkwI1kvjaWqzJhirl8pF
    6bI75Enp/qYyed13gfroGxMDWSLlyDQcyBKMOcQYRZL+BJCQhi+Kw2l1cy/Sj/N+XZ01Wp
    OZF8sutPh5Jjyee91Y7ljcDviEXTN2IrUW7n2zMPb1l5c6/nxAT7bJ0CUXZAF374dgIgeY
    HEPMCoJD6H+vhd7rRjx3be6OXCt9tIDNHy0EnQtWJ2x/GchX/Eo8OE3CB1JfvfuaOFwxCV
    pyMlAy+35JJd2X0C4DmSjvTNipWX1ckKw649vhFvd1ukAmyPJXcjo0++pqjWth6uAHjN8m
    lHj5ZY6KJn7oE4RPYSOuk65Ss149UKgqcf5qDuOx5hF5m1OjLAJq0e8Dy6EbnQ4qZ2Gr/+
    AcbXL/qjsFTSHM8zojEUMoVpLNIJqL8HDvueHmzGHphMAUzG02DRblrGQFVA
X-ME-Proxy: <xmx:kxMsahsy7gBZahdWjlLsYZpSFUCBcRtDEOTMfOIV-V9nXlK7Bbz_3Q>
    <xmx:kxMsauRrCEkAPiKPZyveePFBWIrHuUKzz3EmcDWGGRz2psf5O0TsZA>
    <xmx:kxMsat0nAipLrHgEeGmMG1zS1tLq_FFnuFhGSHm8MslURc7KnnFCrA>
    <xmx:kxMsarviUawThyUZ54Ept-MbUeL8wPuw6gS328mrRDrguJ4acaoRKA>
    <xmx:lBMsamnMXR4-D9W1FnTAbjPbqKGJlBWa4OJy_7HpPFJoHnu_kswx_peb>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 Jun 2026 16:11:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
Message-ID: <aiwTkDUP6rDPbV6R@mail-itl>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qUR8gW28j25bAxkM"
Content-Disposition: inline
In-Reply-To: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
X-purgate-ID: tlsNG-ebf023/1781273494-28F753FF-6DCADA5A/0/0
X-purgate-type: clean
X-purgate-size: 2907
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,mail-itl:mid,vates.tech:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EF4967A140


--qUR8gW28j25bAxkM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:11:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI

On Fri, Jun 12, 2026 at 03:53:49PM +0200, Anthony PERARD wrote:
> Hi,
>=20
> Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boot
> a machine and get assertion '!is_idle_vcpu(v)' failed instead. It's
> netbooted and EFI.
>=20
> Xen call trace:
>    [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
>    [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
>    [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
>    [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
>    [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
>    [<ffff82d0402043e7>] F __high_start+0xb7/0xc0
>=20
> Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>=20
> A few more lines from Xen:
>     CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (raw 0=
0050663)
>     Bootloader: GRUB 2.06
>     [...]
>     Enabling APIC mode.  Using 2 I/O APICs
>     ENABLING IO-APIC IRQs
>      -> Using old ACK method
>      ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
>     TSC deadline timer enabled
>     Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>=20
> Commit this Xen is built from: 50936ea05660.

Interesting, the efi_get_time() way is nowadays a fallback if cmos one
isn't advertised. Can you try adding `cmos-rtc-probe`?

Anyway, surely it shouldn't crash... The commit you mentioned has "No
functional change intended", but well...

> full logs at:
>     https://paste.vates.tech/?bd8a9a0955798a97#A1DU2efwUt7bbHQUxdo9UXGcsJ=
2XPNJNZHPz87LqLtcF

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qUR8gW28j25bAxkM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmosE5AACgkQ24/THMrX
1ywrVgf/fv+h2l6T2FsC3xZhUccitKvcZcuGLKL9NW20PeahUhmzoBvwZ9dj5CSU
k/mYZsWQaw/MTcpphuGpdf4IagVmz8rE8cyb9OBIu/65hxAh9oUH3/e8QqsGIFdc
Te4ZLruD3K9S4N8KfB1ZFGsK5I1aXQCDt/8DKro7+cpQIcJ3AhwtU7ZB5q0R0DFN
tgGvA3Xe05YVREv48lZh9U3becL7Oq0vC14sAqJkeJFyb5RYO4LDEEJFttSNO4NJ
h+4mdPvyxcVjEwSxWcQbV0hFh7qQgoNmrrqw0oJHJkE/ggDErZ+2MVWxVEXKakHP
0fjJKS/6Yw1KH22SOGsM1q3KUv2Rog==
=Xoe4
-----END PGP SIGNATURE-----

--qUR8gW28j25bAxkM--

