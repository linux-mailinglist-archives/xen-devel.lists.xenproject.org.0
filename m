Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90080B2568B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 00:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080351.1440802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umJq2-00069a-6P; Wed, 13 Aug 2025 22:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080351.1440802; Wed, 13 Aug 2025 22:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umJq2-000687-2K; Wed, 13 Aug 2025 22:20:54 +0000
Received: by outflank-mailman (input) for mailman id 1080351;
 Wed, 13 Aug 2025 22:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hsTS=2Z=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1umJq0-000681-Fy
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 22:20:52 +0000
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [2607:f8b0:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c488c502-7893-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 00:20:51 +0200 (CEST)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3e56ff95838so285005ab.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 15:20:50 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb91:1183:972:ee53:76c5:e875:9619])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e56d695345sm5639535ab.11.2025.08.13.15.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 15:20:48 -0700 (PDT)
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
X-Inumbo-ID: c488c502-7893-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755123649; x=1755728449; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5z0Tb+aZT/ng9Ug8YxUxSm9cjcs2SBq1MbPlZAze1w=;
        b=cexue6B+5c859QNBVrg9dArBRZ/emy2Gaa0xcJH060YXdVuxIm21dhHs7hcfSgge3P
         NqnK9jhmnckrONpuGGYucRdn5CYx8eUT8Bjo0n+8IdrgXzrcGoqVlpzrnpfnp9USUHe0
         6/V9LzjrmDohitvNFuW4xiCfv17w0wve+vZGCHbmguxbuQr2X/fdOvCEg7pSnhz4UAzx
         hHL2FpQpC/xW5EBfi9Fb7SpxOIDgmLj9pzTtaGeCPhEr3s3IIVScfYa9QO0LyBeMMV1A
         dmcqp26cE+x70vi3iDBJqWfjR9tGk3KNsbucva3Vh60VXVzOFWHQnbw9Ff9B6wmT5RdL
         xFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755123649; x=1755728449;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5z0Tb+aZT/ng9Ug8YxUxSm9cjcs2SBq1MbPlZAze1w=;
        b=I/+2Tm9ZqlkpBHmD5U2zzpXdu+xwA7R1tYGn5k+F9esW/UPhmw2fJ+WO5mNs9349s7
         UtrwS4qeUfnIi/jfm9w59IC+5oJpVnqv30xX6lYtX7HMSL/gJ+UBAhlr/Iu8uddJSyba
         94LZUdfkHvg6d1cYvgVVnWCPLjY7QpbZwvqERckvSB/4QAy80k0Kn0RM3AN17WqQ+A+i
         6nbE/HZug6q/hw3SbiXMDRdrxas6S3bUyMwP9AgvHKr3DOlutYues3I37TeCm1lzeTsA
         lTiJwdlN0rp0UXBLORi+RDg4hdgC/amxS4H+4oS1jOf54HC3/5ZKWe/qcMlX38kf8Twe
         3gNA==
X-Forwarded-Encrypted: i=1; AJvYcCX8QyntPjaAAJVcccMp6ThJ7OEbaL2FVsI3qshFESdV6h+Lgrs2kcD176EJZqMUyRroxSqGnUrqO84=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyP8NtszNsis/ZiNCGuIzg9fggOE8cIAtKsLoAlrwAZcrMLlez5
	S64h5Ue/dmezuHvSgXDoRASWxkThf1hy5kco0PZFqYmo0qhiRdK4fzSJ
X-Gm-Gg: ASbGncsf8X3zW318ajWNUuQNxQuHX/Fe2dBho+SYBKXnRmjFr0AAz+L+ahslSk0+NMS
	ZyMiuu/7S52QFdwPlKSeyZohZnm9vPezgTb+JDuyKBn1cohZG/x9a8I2KUfs9icqi1r9HLQ1Cwc
	mKm7NZH28rM1hZUtA8UTns0bwxZTO6lTA4PFc6K6yYAanKUt5aQaRlNdii4qUVndFIvI1RU37Cp
	ppFQ3cm316/nhjsWXbE0wq+kD7VJFKtnD8OcCyjaBlf7W3X2KFCui34Ct94w0DEbMl1ugRkRTmA
	Ro/H5M/+ymBpoKw82GPSm5KUjmvzlOEZxBFcCrbXI21ddvBESZOVuYpcAdS63RSPW2w2dV9iPkT
	NRk+MkzAgL1gtMqTxCinjipQJrEYRQw==
X-Google-Smtp-Source: AGHT+IHoLOCTOidURwavCe41qv1HE92902Cd49ItWyaW512wtcsMFdx1sqvVLMd5H1n7YpGuOFwxpg==
X-Received: by 2002:a92:cdaf:0:b0:3e5:4844:4261 with SMTP id e9e14a558f8ab-3e570986f2emr4939025ab.6.1755123649157;
        Wed, 13 Aug 2025 15:20:49 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:20:40 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: Daniel Kiper <dkiper@net-space.pl>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/2] kern/xen: Add Xen command line parsing
Message-ID: <20250813172040.0cfa448c@kf-m2g5>
In-Reply-To: <20250813142711.l4jxlgjk426ansab@tomti.i.net-space.pl>
References: <20250804234816.3d14f53f@kf-m2g5>
	<20250804234911.3cc3997c@kf-m2g5>
	<20250804235009.30e39bd9@kf-m2g5>
	<20250812170211.q7ezlveygfsdkz34@tomti.i.net-space.pl>
	<20250812185515.436a33da@kf-m2g5>
	<20250813142711.l4jxlgjk426ansab@tomti.i.net-space.pl>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xQ7TOZpPkPghI2PHTM1mjdI";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/xQ7TOZpPkPghI2PHTM1mjdI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Aug 2025 16:27:11 +0200
Daniel Kiper <dkiper@net-space.pl> wrote:

> On Tue, Aug 12, 2025 at 06:55:15PM -0500, Aaron Rainbolt wrote:
> > On Tue, 12 Aug 2025 19:02:11 +0200 Daniel Kiper
> > <dkiper@net-space.pl> wrote: =20
> > > On Mon, Aug 04, 2025 at 11:50:09PM -0500, Aaron Rainbolt wrote: =20
> > > > Xen traditionally allows customizing guest behavior by passing
> > > > arguments to the VM kernel via the kernel command line. This is
> > > > no longer possible when using GRUB with Xen, as the kernel
> > > > command line is decided by the GRUB configuration file within
> > > > the guest, not data passed to the guest by Xen.
> > > >
> > > > To work around this limitation, enable GRUB to parse a command
> > > > line passed to it by Xen, and expose data from the command line
> > > > to the GRUB configuration as environment variables. These
> > > > variables can be used in the GRUB configuration for any desired
> > > > purpose, such as extending the kernel command line passed to
> > > > the guest. The command line format is inspired by the Linux
> > > > kernel's command line format.
> > > >
> > > > To reduce the risk of misuse, abuse, or accidents in
> > > > production, the command line will only be parsed if it consists
> > > > entirely of 7-bit ASCII characters, only alphabetical
> > > > characters and underscores are permitted in variable names, and
> > > > all variable names must start with the string "xen_grub_env_".
> > > > This also allows room for expanding the command line arguments
> > > > accepted by GRUB in the future, should other arguments end up
> > > > becoming desirable in the future.
> > > >
> > > > Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com> =20
>=20
> [...]
>=20
> > > > diff --git a/grub-core/kern/i386/xen/pvh.c
> > > > b/grub-core/kern/i386/xen/pvh.c index 91fbca8..a8988d2 100644
> > > > --- a/grub-core/kern/i386/xen/pvh.c +++
> > > > b/grub-core/kern/i386/xen/pvh.c @@ -321,6 +321,8 @@ void
> > > >  grub_xen_setup_pvh (void)
> > > >  {
> > > >    grub_addr_t par;
> > > > +  const char *xen_cmdline;
> > > > +  int i;
> > > >
> > > >    grub_xen_cpuid_base ();
> > > >    grub_xen_setup_hypercall_page ();
> > > > @@ -352,6 +354,27 @@ grub_xen_setup_pvh (void)
> > > >    grub_xen_mm_init_regions ();
> > > >
> > > >    grub_rsdp_addr =3D pvh_start_info->rsdp_paddr;
> > > > +
> > > > +  xen_cmdline =3D (const char *) pvh_start_info->cmdline_paddr;
> > > > +  for (i =3D 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
> > > > +    {
> > > > +      if (xen_cmdline[i] =3D=3D '\0') =20
> > >
> > > This code still does not make a lot of sense for me. You have NUL
> > > check in grub_parse_xen_cmdline(). So, you duplicate the check
> > > here...
> > >
> > > I would just fire grub_strncpy() here and forget... =20
> >
> > I guess it depends on how you view
> > grub_xen_start_page_addr->cmd_line's semantics. In my mind,
> > cmd_line is a NUL-terminated string, always. If you boot in PV
> > mode, Xen ensures it's a NUL-terminated string, so it's reasonable
> > for code in GRUB to assume it will be one. If you boot in PVH mode,
> > it starts out initialized to all zeros which is technically a
> > NUL-terminated string, and the code that exists here ensures that
> > if we copy the kernel command line to cmd_line, it will still be a
> > NUL-terminated string. If we use a "bare" grub_strncpy() here, then
> > if someone passes a kernel command line larger than
> > GRUB_XEN_MAX_GUEST_CMDLINE - 1, cmd_line will end up not being
> > NUL-terminated anymore, and any code added to GRUB in the future
> > that assumes it is a NUL-terminated string may buffer overflow.
> >
> > One could argue "let's keep the NUL check here and remove it from
> > grub_parse_xen_cmdline()", but that doesn't work either because we
> > only get to control the contents of cmd_line if we boot in PVH
> > mode. If instead we boot in PV mode, cmd_line is initialized by Xen
> > itself. GRUB receives a pre-populated and ready-to-use start_info
> > struct directly from the hypervisor in this scenario. Xen is
> > supposed to ensure that start_info is always NUL-terminated, but if
> > there's ever a bug in Xen that breaks that assumption, that could
> > result in bad things happening, the same as if we didn't do the NUL
> > check in grub_xen_setup_pvh(). Now of course there's nothing we can
> > do about Xen possibly being buggy (if it gives us a
> > GRUB_XEN_MAX_GUEST_CMDLINE-long buffer with no NUL terminator, too
> > bad), but we can at least make sure that we're ready for that
> > eventuality. That's why I like having both NUL checks - we're ready
> > for if Xen does things wrong, and any future code that isn't ready
> > for that eventuality will still work if things go wrong, at least
> > in PVH mode. =20
>=20
> OK, it looks like this explanation, in shortened form, should land
> around this code... Or not... Please look below...
>=20
> > (Arguably any new code that depends on cmd_line *should* check it
> > for a NUL terminator. But I don't want to assume that all new code
> > *will* do so.)
> > =20
> > > > +        {
> > > > +          grub_strncpy ((char *)
> > > > grub_xen_start_page_addr->cmd_line,
> > > > +			(char *) pvh_start_info->cmdline_paddr,
> > > > +			GRUB_XEN_MAX_GUEST_CMDLINE);
> > > > +
> > > > +          if
> > > > (grub_xen_start_page_addr->cmd_line[GRUB_XEN_MAX_GUEST_CMDLINE
> > > > - 1] !=3D '\0') =20
> > >
> > > If you convince me this code is still needed then I am afraid that
> > > this is not what you meant here... =20
> >
> > grub_strncpy doesn't just NUL-terminate the command line, it also
> > fills the entire remainder of the buffer with NUL characters.
> > Therefore if =20
>=20
> I am afraid we are looking at different grub_strncpy() functions...

Crud. I was going off the semantics of `strncpy` documented in `man
3 stpncpy`. I see now that GRUB's implementation doesn't have the NUL
padding behavior. I'll take a closer look at all uses of grub_strncpy()
and make sure I'm not relying on that behavior anywhere else.

> > grub_strncpy NUL-terminated the copied string, the last character of
> > the buffer will always be NUL. This is a redundant check since the
> > code above goes to great lengths to avoid ever putting anything
> > non-NUL-terminated into the buffer, but I was under the impression
> > you wanted the check added just in case. I'm happy to remove it if
> > it's not desirable. =20
>=20
> I think we misunderstood each other. This code is redundant now...

Alright, will remove.

> [...]
>=20
> > > > +is_key_safe (char *key, grub_size_t len)
> > > > +{
> > > > +  grub_size_t i;
> > > > +
> > > > +  for (i =3D 0; i < len; i++)
> > > > +    {
> > > > +      if (! (grub_isalpha (key[i]) || key[i] =3D=3D '_')) =20
> > >
> > > Please drop space after "!"... =20
> >
> > Will change.
> > =20
> > > > +        return false;
> > > > +    } =20
> > >
> > > You can drop curly braces from here... =20
> >
> > Will change.
> >
> > (I initially kept this written the way it was though because the GNU
> > coding standards seemed to indicate I should keep the braces. "When
> > you have an if-else statement nested in another if statement, always
> > put braces around the if-else." [1] This isn't a nested if, but
> > it's an if within a for which is very similar.)
> >
> > Is there any recommended coding style documentation I should be
> > looking at other than the GNU coding standards and the GRUB coding
> > style guidelines? It seems I'm making an awful lot of style
> > mistakes and would like to avoid that going forward. =20
>=20
> Yes, it is but sadly it is not fully/properly/.. documented [1]...
>=20
> [...]
>=20
> > > > +  for (i =3D 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
> > > > +    {
> > > > +      if (cmdline[i] =3D=3D '\0')
> > > > +        {
> > > > +          cmdline_valid =3D true;
> > > > +          break;
> > > > +        }
> > > > +    }
> > > > +
> > > > +  if (cmdline_valid =3D=3D false)
> > > > +    {
> > > > +      grub_error (GRUB_ERR_BAD_ARGUMENT,
> > > > +		  "command line from Xen is not
> > > > NUL-terminated");
> > > > +      grub_print_error (); =20
> > >
> > > grub_fatal()? =20
> >
> > That would probably be a bad idea here. We use (or, at least, will
> > use) grub_fatal() in grub_xen_setup_pvh() because if grub_strncpy()
> > doesn't NUL-terminate the string it copies, it indicates a bug in
> > GRUB (either in grub_strncpy, or more likely in the nearby
> > NUL-checking code). On the other hand, cmdline_valid may equal
> > false if we boot in PV mode and Xen incorrectly hands us a
> > non-NUL-terminated string. That's bad and prevents us from parsing
> > the command line safely, but I'd argue it shouldn't entirely block
> > boot. (Then again, maybe if it does block boot, that will make this
> > kind of theoretical Xen bug be much more noticeable and help it get
> > fixed quicker. If you'd prefer that we bail out entirely here, I'm
> > happy to change it.) =20
>=20
> As I said earlier, I would simply call grub_strncpy() in
> grub_xen_setup_pvh() without additional NUL-check there and fail if
> non-NUL-terminated string is detected here...

OK, I'll do that then. It will be of critical importance that if any
new code is introduced in GRUB in the future, that it does not assume
cmd_line is NUL-terminated. I'll add a comment to the appropriate
header so that future developers are aware of the danger.

> > > > +      goto cleanup_main;
> > > > +    }
> > > > +
> > > > +  cmdline_len =3D grub_strlen (cmdline);
> > > > +  for (i =3D 0; i < cmdline_len; i++)
> > > > +    {
> > > > +      current_char =3D cmdline[i];
> > > > +
> > > > +      /*
> > > > +       * If the previous character was a backslash, append the
> > > > current
> > > > +       * character to the word verbatim
> > > > +       */
> > > > +      if (splitter_state & SPLITTER_HIT_BACKSLASH)
> > > > +        {
> > > > +          splitter_state &=3D ~SPLITTER_HIT_BACKSLASH;
> > > > +          if (append_char_to_word (s, current_char, false) =3D=3D
> > > > false)
> > > > +            goto cleanup_main;
> > > > +          continue;
> > > > +        }
> > > > +
> > > > +      switch (current_char)
> > > > +        {
> > > > +        case '\\':
> > > > +          /* Backslashes escape arbitrary characters. */
> > > > +          splitter_state |=3D SPLITTER_HIT_BACKSLASH;
> > > > +          continue;
> > > > +
> > > > +        case '\'':
> > > > +          /*
> > > > +           * Single quotes suppress word splitting and double
> > > > quoting until
> > > > +           * the next single quote is encountered.
> > > > +           */
> > > > +          if (splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
> > > > +            {
> > > > +              if (append_char_to_word (s, current_char, false)
> > > > =3D=3D false)
> > > > +                goto cleanup_main;
> > > > +              continue;
> > > > +            }
> > > > +
> > > > +          splitter_state ^=3D SPLITTER_IN_SINGLE_QUOTES;
> > > > +          continue;
> > > > +
> > > > +        case '"':
> > > > +          /*
> > > > +           * Double quotes suppress word splitting and single
> > > > quoting until
> > > > +           * the next double quote is encountered.
> > > > +           */
> > > > +          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES)
> > > > +            {
> > > > +              if (append_char_to_word (s, current_char, false)
> > > > =3D=3D false)
> > > > +                goto cleanup_main;
> > > > +              continue;
> > > > +            }
> > > > +
> > > > +          splitter_state ^=3D SPLITTER_IN_DOUBLE_QUOTES;
> > > > +          continue;
> > > > +
> > > > +        case ' ':
> > > > +          /* Spaces separate words in the command line from
> > > > each other. */
> > > > +          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES ||
> > > > +              splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
> > > > +            {
> > > > +              if (append_char_to_word (s, current_char, false)
> > > > =3D=3D false)
> > > > +                goto cleanup_main;
> > > > +              continue;
> > > > +            }
> > > > +
> > > > +          if (append_word_to_list (s) =3D=3D false)
> > > > +            goto cleanup_main; =20
> > >
> > > I think this is not fully correct. You should not run
> > > append_word_to_list() until the closing quote. So, here you should
> > > have "else" for the first "if", i.e., "if (splitter_state & ..."
> > > and call append_word_to_list() for closing \" and \' above. =20
> >
> > What closing quote? If we're in quotes, the `if (splitter_state
> > &...` block will run. That block runs `continue`, restarting the
> > loop before we get to the `append_word_to_list (s)` call. If we hit
> > a closing quote, either the `case '\''` or the `case '"'` block
> > will be triggered, changing the splitter's state so that it knows
> > it's no longer within a quote block, and then the next space (or
> > the end of the string) will cause `append_word_to_list()` to be
> > called, adding the quoted word to the list. Even if this `continue`
> > changes to a `break` like suggested below, the logic and control
> > flow will remain the same.
> >
> > Calling `append_word_to_list()` for closing quotes would break the
> > splitter. I'm trying to implement splitting behavior similar to
> > Bash or GRUB's configuration language, both of which parse
> > `xen_grub_env_var=3D"abc def"ghi` into the variable `xen_grub_env_var`
> > with the value `abc defghi`. If we split on closing quotes too, the
> > input above will be parsed into two words, `xen_grub_env_var=3Dabc
> > def` and an extra word `ghi`, resulting in the environment variable
> > `xen_grub_env_var` being set to `abc def` and the `ghi` being lost
> > entirely. One could argue that this is reasonable behavior, but it
> > isn't consistent with the other splitting behavior in GRUB. =20
>=20
> OK, makes sense for me... Maybe you should mention somewhere in the
> code current splitter behavior...

Technically the behavior is documented in the comment immediately
before the splitter code, but the rationale isn't entirely explained,
so I'll add some extra info to the comment so it's more clear.

--
Aaron

> Daniel
>=20
> [1]
> https://www.gnu.org/software/grub/manual/grub-dev/grub-dev.html#Coding-st=
yle


--Sig_/xQ7TOZpPkPghI2PHTM1mjdI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmidD7gACgkQpwkWDXPH
kQnyhBAAwvsXTxsfKHiQBQYHOR4julB41R04DIBjTdF/dsVLVdoGbnu7RLX16PGc
mVGCoTv5pLLGXSS/fW2ubho7e+YqmnBsQJvMzw1pwLlC4SSky6qr6SMymmxAVbCU
WXH/olavwmsUPScSKibA7fvPhI3VI39VCCQLibidW9JJwLQIOjbsdDrkhdHin/3+
uRf0nDuML/EreHTl+o8s3Ze2H4hte7ecOrti3i9GDq9s9RifOoMAAvUNIFH8zLAI
BdtNlgqbqWtWruYFH6kAMM5ofmJhKfeQapeeB/vMZn7kP9GE4kpIe+EdLK7M52j2
32hUNtNZkjO6uYL7h7xTn7HTfr6d95075T6aIm+we1OwT70CWabGIMB4ZuJR12CB
F3lOEKD918I6R0luIMS7Gp9D5zpU0izNtu4jUb6toYeWIatR84Xu+mo0jn+IDnzS
997h4zcUUslFM/DopYAlpdBb+g9aiaMlXkg75PJE42Z+QlXUA/g3ZYxjWpX7rYgG
zuL0AEDOwH2TWyAHgH11IGr2tvftzAPbawDcP2R5JsjmKFevzoXQlYrNMmMBtUO5
K+yh2aRjM/Mm9JIZ4W9Ld1A0xEBXBQvEK5cZh+i7seXgBc1DUnJyc9i20mxtzGW/
5Mr3L1LroLd19blJiroHmeLJxndGA88ZNBa0nGbUjOvPxAX3w7E=
=jaIa
-----END PGP SIGNATURE-----

--Sig_/xQ7TOZpPkPghI2PHTM1mjdI--

