Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B811EA01223
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865182.1276472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvDk-0003dG-Jk; Sat, 04 Jan 2025 03:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865182.1276472; Sat, 04 Jan 2025 03:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvDk-0003bn-Go; Sat, 04 Jan 2025 03:53:04 +0000
Received: by outflank-mailman (input) for mailman id 865182;
 Sat, 04 Jan 2025 03:53:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvDj-0003bh-K9
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:53:03 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64df3f91-ca4f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:53:01 +0100 (CET)
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
X-Inumbo-ID: 64df3f91-ca4f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735962780; x=1736221980;
	bh=B2gwmZyTNt9tyjaUiAL4BHtCtvcyHNUIsJnOypJw97A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FmIT5gPIbhTzSBybpMwbGoC7B5xNy/8pi09pBBhyl3134iEg8c9Z7PUkq3WFCwHTE
	 1rRR6bNYPVV3z11oNeMKAG3sKIeMTcAaaAsgNJRzBqevaLRx8CykVJ6uiNC7uEKmU0
	 zA90gfHSKeYY6Z1GDkWd3WbC/T/oaXJ7f3FQJkzvGkOe64RMPGHNHcHO8ZsxevVY6s
	 Z+PFOtYUmf3i8hH54MgBdrtzMa8brpi91/hyjF1axPLyrGN9eQqRakpr95mBf6P3Z8
	 PN45ysHrOEQag/FTHBa+JsV2t3sPUjTRcvi+TPFdcnYg8cO4DP3hxotYFmo28iQt7W
	 LWGeXjORpPlaw==
Date: Sat, 04 Jan 2025 03:52:56 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 26/35] xen/console: make console buffer size configurable
Message-ID: <JLKNDjLF5s0cdPbzZ2z-sJuRrVgd0dxSpuJ5hL3lk29_wW0afRZIhQuGeV10w3dlLhoKk8GwLcUBpkuyVbH779_PjZsLoMEu8Ev4I2SCK-M=@proton.me>
In-Reply-To: <Z1rbUfLQolFdMoi6@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-26-e9aa923127eb@ford.com> <Z1rbUfLQolFdMoi6@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8545cfebbef9543a4b28c35d67b61325da6591dd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 4:47 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:56PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Add new CONRING_LOG_SHIFT Kconfig parameter to specify the boot console=
 buffer
> > size as a power of 2.
> >
> > Bump default size to 32 KiB.
> >
> > Link: https://gitlab.com/xen-project/xen/-/issues/185
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>
>
> Thanks for taking care of this.
>
> > ---
> > xen/drivers/char/Kconfig | 23 +++++++++++++++++++++++
> > xen/drivers/char/console.c | 4 ++--
> > 2 files changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> > index e6e12bb4139717f9319031f51f5d20155d2caee2..3bc892fc38d8cdeb3c76ea4=
4d747f712a8d0d372 100644
> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -96,6 +96,29 @@ config SERIAL_TX_BUFSIZE
> >
> > Default value is 32768 (32KiB).
> >
> > +config CONRING_LOG_SHIFT
> > + int "Console buffer size"
> > + range 14 25
> > + default 15
> > + help
> > + Select the boot console buffer size as a power of 2.
> > + Run-time console buffer size is the same as the boot console size,
> > + unless enforced via 'conring_size=3D' boot parameter.
> > +
> > + Examples:
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
>
>
> It might be better to do something similar to what we do in
> SERIAL_TX_BUFSIZE, that the user provides a value in KiB which is
> rounded down to the nearest power of 2?

TBH, I do not think there should be a way for the user to allow reserving h=
uge
amounts of RAM for the console ring. Plus, using logarithmic scale may avoi=
d
confusion, w/o it user-defined CONFIG_CONRING_SIZE will not necessarily
match the real _CONRING_SIZE value.

But I see your point: Kconfig should match existing conring_size=3D spec wh=
ich
defines number of bytes.

>
> > +
> > config XHCI
> > bool "XHCI DbC UART driver"
> > depends on X86
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index d22fb4a253af26f9b51d91bd408e1dbf4bb5a7c1..581ee22b85302a54db5b9d5=
d28e8b2d689d31403 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -104,11 +104,11 @@ static int cf_check parse_console_timestamps(cons=
t char *s);
> > custom_runtime_param("console_timestamps", parse_console_timestamps,
> > con_timestamp_mode_upd);
> >
> > -/* conring_size: allows a large console ring than default (16kB). /
> > +/ conring_size: allows a large console ring than default (32 KiB). */
> > static uint32_t __initdata opt_conring_size;
> > size_param("conring_size", opt_conring_size);
>
>
> You also need to update xen-command-line.pandoc to mention the default
> size is now set in Kconfig. And here I would mention
> CONFIG_CONRING_SIZE rather than explicit 32 KiB, because that's just
> the default in Kconfig, but might not be the default in the build
> itself.

Done.

>
> FWIW, you could define:
>
> #define _CONRING_SIZE (CONFIG_CONRING_SIZE & (CONFIG_CONRING_SIZE - 1))

Done.

>
> Thanks, Roger.



