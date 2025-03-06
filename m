Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46036A5442A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903050.1310970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6Ft-0000Nf-7R; Thu, 06 Mar 2025 08:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903050.1310970; Thu, 06 Mar 2025 08:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6Ft-0000LY-3o; Thu, 06 Mar 2025 08:06:57 +0000
Received: by outflank-mailman (input) for mailman id 903050;
 Thu, 06 Mar 2025 08:06:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z0IF=VZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tq6Fs-0000LL-08
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:06:56 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7d8be80-fa61-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:06:55 +0100 (CET)
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
X-Inumbo-ID: f7d8be80-fa61-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741248413; x=1741507613;
	bh=S9+aKkGwI1xE6fWUB0TfKb0GAIynm5ainy5nk8WfcGE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fPDVIcNhAqE8gYMT7PqInji6SDO1VNyJ+ufMMlS+Fzol61AUfbLk8UrpW+foZgTIE
	 6YFTub0kT7HPVTCFP9wABCT5HsNbLHX556a8X0I65kTGb1F9XQg/IKiv7a1PJZ4a4M
	 6zBfqv2FJ5R/GNyTQB1V8/prFJt1f7iPC1TDmXtI9IxVd5WcnuK2Wpm34m5gB6dYeZ
	 3Z/xgiB6M9Q+gWBDHUDukL4V6nNXFxXr2JDlVtJZcTaIyoj3JtoEjqvDiILtD0+1FP
	 Xzp+PRqMCbwozfW1lyNsrMXWsgUMvulCRee2qPjaMUtfGpV+EcNA2a6blSQzSW4M+B
	 ruLY9ORoKvc/w==
Date: Thu, 06 Mar 2025 08:06:49 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/console: make console buffer size configurable
Message-ID: <JKLR-0vYyJ4aUTK0prfWZpfVoWk2BF1j1mJ7yO5dc0xQHNimlel_uxrvJoNGtZWyfgA02tedQp8RCfBMOrgfSmyVzj1XS1eD5zaqMr_fdos=@proton.me>
In-Reply-To: <acb0fd5d-0315-4a5a-9974-14556e497a03@suse.com>
References: <20250305011127.4079670-1-dmukhin@ford.com> <acb0fd5d-0315-4a5a-9974-14556e497a03@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d0586870d91b2310fbbf85f3aa8e49de68e8c84d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 5th, 2025 at 8:42 AM, Jan Beulich <jbeulich@suse.com> w=
rote:

>=20
>=20
> On 05.03.2025 02:12, dmkhn@proton.me wrote:
>=20
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -425,10 +425,13 @@ The following are examples of correct specificati=
ons:
> > ### conring_size
> >=20
> > > `=3D <size>`
> >=20
> > -> Default: `conring_size=3D16k`
> > +> Default: `conring_size=3D32k`
> >=20
> > Specify the size of the console ring buffer.
> >=20
> > +The console ring buffer size can be selected at build time via
> > +CONFIG_CONRING_SHIFT.
>=20
>=20
> And hence, if a value other than 32 is used there, the default above is
> going to be wrong. IOW it is only the compile time default which is 32k.
> The run-time default (which is what matters in Default: above) is itself
> configurable, and hence wants documenting that way.
>=20
> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -96,6 +96,33 @@ config SERIAL_TX_BUFSIZE
> >=20
> > Default value is 32768 (32KiB).
> >=20
> > +config CONRING_SHIFT
> > + int "Console buffer size (power of 2)"
>=20
>=20
> Would you mind adding the word "ring" here?
>=20
> > + range 14 27
> > + default 15
> > + help
> > + Select the boot console buffer size as a power of 2.
> > + Run-time console buffer size is the same as the boot console size,
> > + unless overridden via 'conring_size=3D' boot parameter.
> > +
> > + Default value is 15 (32KiB).
> > +
> > + Examples:
> > + 27 =3D> 128 MiB
> > + 26 =3D> 64 MiB
> > + 25 =3D> 32 MiB
> > + 24 =3D> 16 MiB
> > + 23 =3D> 8 MiB
> > + 22 =3D> 4 MiB
> > + 21 =3D> 2 MiB
> > + 20 =3D> 1 MiB
> > + 19 =3D> 512 KiB
> > + 18 =3D> 256 KiB
> > + 17 =3D> 128 KiB
> > + 16 =3D> 64 KiB
> > + 15 =3D> 32 KiB
> > + 14 =3D> 16 KiB
>=20
>=20
> I don't think an exhaustive list is necessary here. This way it's not rea=
lly
> a set of examples, but an enumeration of all possible values.

I decided to keep the exhaustive list so it is a bit easier to do setting
selection.

>=20
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -101,12 +101,12 @@ static int cf_check parse_console_timestamps(cons=
t char *s);
> > custom_runtime_param("console_timestamps", parse_console_timestamps,
> > con_timestamp_mode_upd);
> >=20
> > -/* conring_size: allows a large console ring than default (16kB). /
> > +/ conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
> > static uint32_t __initdata opt_conring_size;
> > size_param("conring_size", opt_conring_size);
> >=20
> > -#define _CONRING_SIZE 16384
> > -#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> > +#define _CONRING_SIZE (1UL << CONFIG_CONRING_SHIFT)
>=20
>=20
> Imo this ought to be 1U only, seeing ...
>=20
> > +#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
> > static char __initdata _conring[_CONRING_SIZE];
> > static char *__read_mostly conring =3D _conring;
> > static uint32_t __read_mostly conring_size =3D _CONRING_SIZE;
>=20
>=20
> ... this use of the constant.
>=20
> Jan

