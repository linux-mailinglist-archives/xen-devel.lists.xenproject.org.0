Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624AA2169F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 04:05:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878858.1289057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcyO1-0000mV-Uh; Wed, 29 Jan 2025 03:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878858.1289057; Wed, 29 Jan 2025 03:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcyO1-0000kO-S5; Wed, 29 Jan 2025 03:05:05 +0000
Received: by outflank-mailman (input) for mailman id 878858;
 Wed, 29 Jan 2025 03:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wz9u=UV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tcyNz-0000kG-AQ
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 03:05:04 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d414c793-dded-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 04:05:01 +0100 (CET)
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
X-Inumbo-ID: d414c793-dded-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738119899; x=1738379099;
	bh=PyFNH2W17lpXsSxCoKNfmr4ag+ROC15HYWFDAc6sbcA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=THwOldtQxsh0qQl/YF+sO8qcqVLJE36v+ygoPGSar7cJwPOYowgHSeY+nqlgvuoU7
	 IQoLC2nf7OrZL/K3H5fcvwxWUhUZakLgvEQR+1/ifC0vHKGWVtDzhHPSwELgdFEDbN
	 /Al7XpLflWRxHUwVnt8UXEIzDre9Or4wVrN6Ibi/clpvgaNzyW4N0I+IApZDst3QKd
	 xkuv78WD+1jd1ju+cz3h+BHxfwNtYk0zefWfFqISruTnYtxH0yRTzRkKI5BKk1PCJU
	 zuxc6OEaoXec7RcDtSIkWaIqUjzSAx7bKdY1pMRO2U8hKALqoQiB3pYiKh9VqqJ6v1
	 v8zq5k9l8huYg==
Date: Wed, 29 Jan 2025 03:04:53 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, Denis Mukhin <dmkhn@proton.me>
Subject: Re: [PATCH v3 15/24] xen/console: make console buffer size configurable
Message-ID: <RKwzueYurWHDxryD0KUwTcZHRfprlyr4H0fIq4w-yV2i5uK4XfDGrWsUBgt8FnW4R-28hIjbclYcGVP62eLjfFAIwNjXzP0Qj2sajURd-8s=@proton.me>
In-Reply-To: <d471f3b0-5638-47b3-927e-318b0575eaa3@suse.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-15-c5d36b31d66c@ford.com> <d471f3b0-5638-47b3-927e-318b0575eaa3@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2c63239978f09058f3816328b8ccca303c9a2959
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 28th, 2025 at 8:32 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

>=20
>=20
> On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > Add new CONRING_SIZE Kconfig parameter to specify the boot console buff=
er size
> > in bytes. The value is rounded to the nearest power of 2 to match exist=
ing
> > conring_size=3D behavior.
> >=20
> > The supported range is [16KiB..128MiB].
> >=20
> > Bump default size to 32 KiB.
> >=20
> > Link: https://gitlab.com/xen-project/xen/-/issues/185
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
>=20
> As asked elsewhere already: How's this related to the goal of the series?

I mentioned in the cover letter that there are two group of patches - conso=
le
driver cleanups/fixes and the follow on UART emulator (and up until v3 it w=
as OK
to have this patch bundled into the series).

Yes, I acknowledge that the first group of patches for console driver grew =
big
and probably should have been posted in its own thread.

I can move "console" part to its own series if it makes sense now.

What do you think?

>=20
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -423,12 +423,15 @@ The following are examples of correct specificati=
ons:
> > com1=3Dbaud=3D115200,parity=3Dn,stop-bits=3D1,io-base=3D0x3f8,reg-width=
=3D4
> >=20
> > ### conring_size
> > -> `=3D <size>`
> > +> `=3D <size-in-bytes>`
>=20
>=20
> May I direct you to the explanations near the top of the file? <size>
>=20
> is a uniform term throughout this document, and wants to stay like this.
>=20
> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -96,6 +96,17 @@ config SERIAL_TX_BUFSIZE
> >=20
> > Default value is 32768 (32KiB).
> >=20
> > +config CONRING_SIZE
> > + int "Console buffer size"
> > + default 32768
> > + help
> > + Select the boot console buffer size (in bytes).
> > + Note, the value provided will be rounded down to the nearest power of=
 2.
> > + Run-time console buffer size is the same as the boot console size,
> > + unless enforced via 'conring_size=3D' boot parameter.
>=20
>=20
> Maybe s/enforced/overridden/ ?
>=20
> > + Default value is 32768 (32KiB). The supported range is [16KiB..128MiB=
].
>=20
>=20
> Yet then there's no "range" directive.
>=20
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -100,12 +100,15 @@ static int cf_check parse_console_timestamps(cons=
t char *s);
> > custom_runtime_param("console_timestamps", parse_console_timestamps,
> > con_timestamp_mode_upd);
> >=20
> > -/* conring_size: allows a large console ring than default (16kB). /
> > +/ conring_size: allows a large console ring than default (32 KiB). */
>=20
>=20
> As you touch this, also s/large/larger/ ?
>=20
> > static uint32_t __initdata opt_conring_size;
> > size_param("conring_size", opt_conring_size);
> >=20
> > -#define _CONRING_SIZE 16384
> > -#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> > +#define _CONRING_SIZE (1UL << (31 - __builtin_clz(CONFIG_CONRING_SIZE)=
))
> > +_Static_assert(_CONRING_SIZE >=3D 4096 && _CONRING_SIZE <=3D MB(128),
> > + "CONFIG_CONRING_SIZE must be in [4K..128M] range");
>=20
>=20
> Hmm, 4k here as the lower bound, when in description and Kconfig it's
> said to be 16k?
>=20
> Also I fear _Static_assert() can't be used here, for not being supported
> by all gcc versions we continue to permit being used on x86. That'll be
> unnecessary anyway once you put in place the missing range directive in
> Kconfig. (If something like this needed keeping, it would be
> BUILD_BUG_ON() that you want to use instead. Which, yes, can only be
> used inside a function. Hence why we have a number of build_assertions()
> functions throughout the codebase.)
>=20
> > +#define CONRING_IDX_MASK(i) ( (i) & (conring_size - 1) )
>=20
>=20
> Once again - no blanks immediately inside parentheses, except as
> written in ./CODING_STYLE (i.e. in control flow statements).
>=20
> Jan

