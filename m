Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4FB23CBB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 01:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079363.1440285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulyq7-0001hU-8I; Tue, 12 Aug 2025 23:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079363.1440285; Tue, 12 Aug 2025 23:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulyq7-0001eT-4p; Tue, 12 Aug 2025 23:55:35 +0000
Received: by outflank-mailman (input) for mailman id 1079363;
 Tue, 12 Aug 2025 23:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+QV=2Y=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1ulyq5-0001eL-ND
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 23:55:33 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d19b433c-77d7-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 01:55:27 +0200 (CEST)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3e53cc0c840so1643685ab.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 16:55:27 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb91:1183:972:c716:b21c:e9a1:44a4])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50ae9bcf596sm3523959173.60.2025.08.12.16.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 16:55:24 -0700 (PDT)
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
X-Inumbo-ID: d19b433c-77d7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755042926; x=1755647726; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXURDCpMiOO+jor7T/WeBisWPvciEyiRAMek2W20Uw8=;
        b=Br+XettoxSKWGJNrZAWQ3HNC/9jy03EB3a7I9GeLdb+Z8ScBZGjKkHnmsVHDtbTFNc
         A/Qb6wfhstsJQSiX1QEfjTp81qyJph11TDe9oCqPPxmCFD0BqNpmDH6HlbDHp8hK5tVt
         vypJJGbN6QBeQchJGC/ikUnXmiF6oX7wkvQRoipAwepTtCW2kxFnuZHvlJIQwAUITBhC
         WuqjAmprDtzZgMLCoMg2QjfbqSCG1ymyVyXmjv6u1Hwp+xUGxHoCwj+fIPSk3PmE1kov
         FcWiLH8eKk2jIDiIYOfee0KXkOc33OMkbperD899PI8Ja9Ec5VcV1yE7tanr78S7GkW+
         6wFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755042926; x=1755647726;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXURDCpMiOO+jor7T/WeBisWPvciEyiRAMek2W20Uw8=;
        b=KTjOunQUJjkoff7eKLSrKmiBYI12jEpER1qT+WSml6LdGLSgJWBsP/Mrvrza6PvItF
         lZxB9rrhZXGv96mLSSq/RnCsxVzvcmBZHzjxSPwnb+QbVbdvx6Ad2z0q7JjjfdlvtQa5
         /sbdhPH7qh+i+Un4v/39P64wMaag3uCHK/yAWjQbNvvgVkmVhZmcMq/tk0xq14mSBpvx
         68X5LdZjS4LKBU1M0rYF5fU4HRT6GepP+rb/7fzHzdZwn3iOIgqDlZkFfKUMk/DHNXh8
         XwHCG9GLTD/oExscQ5Q+hdNlNNLDz7y/hPBOjPEcqmnKF1kgbH/H1kUpZDMXI2P8vlaj
         T3vw==
X-Forwarded-Encrypted: i=1; AJvYcCV06+dhIP3FPybVOjNxITAiV1Ph4ZSGFKxQpo2gxvm80GbL+pNK9qhdZm0lyNPT01DjrETP3JHXTqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf+Fl6rqXlv/F3zUpQhOBc7bY+0otb+O2e7RnaXOLvWzXgFuWt
	3zebp+eBODy6JrN6HeWlEBzwRI/G1taNU2dESbSTQt+CqRUB939GfwhX
X-Gm-Gg: ASbGnctvc6JOH8U0GJTCRyFa2yYGxmMlmHWh/ujjSyqhun4XV8nu+HmRUZpRO3RJWpK
	ULM+cnBPzipqvzzwnCG0D33agGBGjlUM2WCQxCnSLisQILOtuHteoQszwACPT3Ek8AuZXP/Njgb
	AmhKK01kkiKnNTKlOu5fXn1OZmoEIQUDniBPNN2oSAEXsHJIhgp1N+63draVCaQ32kdEgOPvxIJ
	zaIKdD80s4nPpkEMgDcc05HFFmBwNjwn2zZ07mxMv0+a2eDdRUG0TrPfKHgfHHW3ogFYD65knvl
	DSMiXjLVnpEaZnuw4OXC2uzMId1Y9j7h3uBpEEbLWttbJ41dvjo2tcJfFE8D/bdbQRpDR4YIzDm
	ado858LOpO7DsrAO7pU3wXH4j+TvkAg==
X-Google-Smtp-Source: AGHT+IFTY7zloIvcrQ/Kthe+snTYunJfEuq7LJtQLmEy/vTgkn9X3Qq3t7rfcdzhTjrQrs0z+pSCfQ==
X-Received: by 2002:a05:6e02:3a04:b0:3dd:ce1c:f1bc with SMTP id e9e14a558f8ab-3e5674d6cefmr5492885ab.7.1755042925408;
        Tue, 12 Aug 2025 16:55:25 -0700 (PDT)
Date: Tue, 12 Aug 2025 18:55:15 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: Daniel Kiper <dkiper@net-space.pl>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/2] kern/xen: Add Xen command line parsing
Message-ID: <20250812185515.436a33da@kf-m2g5>
In-Reply-To: <20250812170211.q7ezlveygfsdkz34@tomti.i.net-space.pl>
References: <20250804234816.3d14f53f@kf-m2g5>
	<20250804234911.3cc3997c@kf-m2g5>
	<20250804235009.30e39bd9@kf-m2g5>
	<20250812170211.q7ezlveygfsdkz34@tomti.i.net-space.pl>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O1TCkgKcxfVydyGr9aCjczS";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/O1TCkgKcxfVydyGr9aCjczS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Aug 2025 19:02:11 +0200
Daniel Kiper <dkiper@net-space.pl> wrote:

> On Mon, Aug 04, 2025 at 11:50:09PM -0500, Aaron Rainbolt wrote:
> > Xen traditionally allows customizing guest behavior by passing
> > arguments to the VM kernel via the kernel command line. This is no
> > longer possible when using GRUB with Xen, as the kernel command
> > line is decided by the GRUB configuration file within the guest,
> > not data passed to the guest by Xen.
> >
> > To work around this limitation, enable GRUB to parse a command line
> > passed to it by Xen, and expose data from the command line to the
> > GRUB configuration as environment variables. These variables can be
> > used in the GRUB configuration for any desired purpose, such as
> > extending the kernel command line passed to the guest. The command
> > line format is inspired by the Linux kernel's command line format.
> >
> > To reduce the risk of misuse, abuse, or accidents in production, the
> > command line will only be parsed if it consists entirely of 7-bit
> > ASCII characters, only alphabetical characters and underscores are
> > permitted in variable names, and all variable names must start with
> > the string "xen_grub_env_". This also allows room for expanding the
> > command line arguments accepted by GRUB in the future, should other
> > arguments end up becoming desirable in the future.
> >
> > Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>
> > ---
> >  docs/grub.texi                |  51 +++++
> >  grub-core/Makefile.core.def   |   2 +
> >  grub-core/kern/i386/xen/pvh.c |  23 +++
> >  grub-core/kern/xen/cmdline.c  | 376
> > ++++++++++++++++++++++++++++++++++ grub-core/kern/xen/init.c     |
> >  2 + include/grub/xen.h            |   2 +
> >  6 files changed, 456 insertions(+)
> >  create mode 100644 grub-core/kern/xen/cmdline.c
> >
> > diff --git a/docs/grub.texi b/docs/grub.texi
> > index 34b3484..b58cf98 100644
> > --- a/docs/grub.texi
> > +++ b/docs/grub.texi
> > @@ -3271,6 +3271,7 @@ GRUB.  Others may be used freely in GRUB
> > configuration files. @menu
> >  * Special environment variables::
> >  * Environment block::
> > +* Passing environment variables through Xen::
> >  @end menu
> >
> >
> > @@ -3871,6 +3872,56 @@ using BIOS or EFI functions (no ATA, USB or
> > IEEE1275). @command{grub-mkconfig} uses this facility to implement
> >  @samp{GRUB_SAVEDEFAULT} (@pxref{Simple configuration}).
> >
> > +@node Passing environment variables through Xen
> > +@section Passing environment variables through Xen
> > +
> > +If you are using a GRUB image as the kernel for a PV or PVH Xen
> > virtual +machine, you can pass environment variables from Xen's
> > dom0 to the VM through +the Xen-provided kernel command line. When
> > combined with a properly configured +guest, this can be used to
> > customize the guest's behavior on bootup via the +VM's Xen
> > configuration file. +
> > +GRUB will parse the kernel command line passed to it by Xen during
> > bootup. +The command line will be split into space-delimited words.
> > Single and +double quotes may be used to quote words or portions of
> > words that contain +spaces. Single quotes will be considered part
> > of a word if inside double +quotes, and vice versa. Arbitrary
> > characters may be backslash-escaped to make +them a literal
> > component of a word rather than being parsed as quotes or word
> > +separators. The command line must consist entirely of printable
> > 7-bit ASCII +characters and spaces. If a non-printing ASCII
> > character is found anywhere in +the command line, the entire
> > command line will be ignored by GRUB. + +Each word should be a
> > variable assignment in the format ``variable'' or
> > +``variable=3Dvalue''. Variable names must contain only the
> > characters A-Z, a-z, +and underscore (``_''). Variable names must
> > begin with the string +``xen_grub_env_''. Variable values can
> > contain arbitrary printable 7-bit +ASCII characters and space. If
> > any variable contains an illegal name, that +variable will be
> > ignored. + +If a variable name and value are both specified, the
> > variable will be set to +the specified value. If only a variable
> > name is specified, the variable's +value will be set to ``1''.
> > +
> > +The following is a simple example of how to use this functionality
> > to append +arbitrary variables to a guest's kernel command line:
> > +
> > +@example
> > +# In the Xen configuration file for the guest
> > +name =3D "linux_vm"
> > +type =3D "pvh"
> > +kernel =3D "/path/to/grub-i386-xen_pvh.bin"
> > +extra =3D "xen_grub_env_linux_append=3D'loglevel=3D3'"
> > +memory =3D 1024
> > +disk =3D [ "file:/srv/vms/linux_vm.img,sda,w" ]
> > +
> > +# In the guest's GRUB configuration file
> > +menuentry "Linux VM with dom0-specified kernel parameters" @{
> > +    search --set=3Droot --label linux_vm --hint hd0,msdos1
> > +    linux /boot/vmlinuz root=3DLABEL=3Dlinux_vm
> > $@{xen_grub_env_linux_append@}
> > +    initrd /boot/initrd.img
> > +@}
> > +@end example
> > +
> >  @node Modules
> >  @chapter Modules
> >
> > diff --git a/grub-core/Makefile.core.def
> > b/grub-core/Makefile.core.def index b3f7119..df0f266 100644
> > --- a/grub-core/Makefile.core.def
> > +++ b/grub-core/Makefile.core.def
> > @@ -248,6 +248,7 @@ kernel =3D {
> >    xen =3D term/xen/console.c;
> >    xen =3D disk/xen/xendisk.c;
> >    xen =3D commands/boot.c;
> > +  xen =3D kern/xen/cmdline.c;
> >
> >    i386_xen_pvh =3D commands/boot.c;
> >    i386_xen_pvh =3D disk/xen/xendisk.c;
> > @@ -255,6 +256,7 @@ kernel =3D {
> >    i386_xen_pvh =3D kern/i386/xen/tsc.c;
> >    i386_xen_pvh =3D kern/i386/xen/pvh.c;
> >    i386_xen_pvh =3D kern/xen/init.c;
> > +  i386_xen_pvh =3D kern/xen/cmdline.c;
> >    i386_xen_pvh =3D term/xen/console.c;
> >
> >    ia64_efi =3D kern/ia64/efi/startup.S;
> > diff --git a/grub-core/kern/i386/xen/pvh.c
> > b/grub-core/kern/i386/xen/pvh.c index 91fbca8..a8988d2 100644
> > --- a/grub-core/kern/i386/xen/pvh.c
> > +++ b/grub-core/kern/i386/xen/pvh.c
> > @@ -321,6 +321,8 @@ void
> >  grub_xen_setup_pvh (void)
> >  {
> >    grub_addr_t par;
> > +  const char *xen_cmdline;
> > +  int i;
> >
> >    grub_xen_cpuid_base ();
> >    grub_xen_setup_hypercall_page ();
> > @@ -352,6 +354,27 @@ grub_xen_setup_pvh (void)
> >    grub_xen_mm_init_regions ();
> >
> >    grub_rsdp_addr =3D pvh_start_info->rsdp_paddr;
> > +
> > +  xen_cmdline =3D (const char *) pvh_start_info->cmdline_paddr;
> > +  for (i =3D 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
> > +    {
> > +      if (xen_cmdline[i] =3D=3D '\0') =20
>=20
> This code still does not make a lot of sense for me. You have NUL
> check in grub_parse_xen_cmdline(). So, you duplicate the check here...
>=20
> I would just fire grub_strncpy() here and forget...

I guess it depends on how you view grub_xen_start_page_addr->cmd_line's
semantics. In my mind, cmd_line is a NUL-terminated string, always. If
you boot in PV mode, Xen ensures it's a NUL-terminated string, so it's
reasonable for code in GRUB to assume it will be one. If you boot in
PVH mode, it starts out initialized to all zeros which is technically a
NUL-terminated string, and the code that exists here ensures that if we
copy the kernel command line to cmd_line, it will still be a
NUL-terminated string. If we use a "bare" grub_strncpy() here, then if
someone passes a kernel command line larger than
GRUB_XEN_MAX_GUEST_CMDLINE - 1, cmd_line will end up not being
NUL-terminated anymore, and any code added to GRUB in the future that
assumes it is a NUL-terminated string may buffer overflow.

One could argue "let's keep the NUL check here and remove it from
grub_parse_xen_cmdline()", but that doesn't work either because we only
get to control the contents of cmd_line if we boot in PVH mode. If
instead we boot in PV mode, cmd_line is initialized by Xen itself. GRUB
receives a pre-populated and ready-to-use start_info struct directly
from the hypervisor in this scenario. Xen is supposed to ensure that
start_info is always NUL-terminated, but if there's ever a bug in Xen
that breaks that assumption, that could result in bad things happening,
the same as if we didn't do the NUL check in grub_xen_setup_pvh(). Now
of course there's nothing we can do about Xen possibly being buggy (if
it gives us a GRUB_XEN_MAX_GUEST_CMDLINE-long buffer with no NUL
terminator, too bad), but we can at least make sure that we're ready
for that eventuality. That's why I like having both NUL checks - we're
ready for if Xen does things wrong, and any future code that isn't
ready for that eventuality will still work if things go wrong, at least
in PVH mode.

(Arguably any new code that depends on cmd_line *should* check it for a
NUL terminator. But I don't want to assume that all new code *will* do
so.)

> > +        {
> > +          grub_strncpy ((char *)
> > grub_xen_start_page_addr->cmd_line,
> > +			(char *) pvh_start_info->cmdline_paddr,
> > +			GRUB_XEN_MAX_GUEST_CMDLINE);
> > +
> > +          if
> > (grub_xen_start_page_addr->cmd_line[GRUB_XEN_MAX_GUEST_CMDLINE - 1]
> > !=3D '\0') =20
>=20
> If you convince me this code is still needed then I am afraid that
> this is not what you meant here...

grub_strncpy doesn't just NUL-terminate the command line, it also fills
the entire remainder of the buffer with NUL characters. Therefore if
grub_strncpy NUL-terminated the copied string, the last character of
the buffer will always be NUL. This is a redundant check since the code
above goes to great lengths to avoid ever putting anything
non-NUL-terminated into the buffer, but I was under the impression you
wanted the check added just in case. I'm happy to remove it if it's not
desirable.

> > +            {
> > +              grub_error (GRUB_ERR_BUG,
> > +			  "Xen command line is not
> > NUL-terminated");
> > +              grub_print_error ();
> > +              grub_exit (); =20
>=20
> grub_fatal() and you are done...

Will change.

> > +            }
> > +
> > +          break;
> > +        }
> > +    }
> >  }
> >
> >  grub_err_t
> > diff --git a/grub-core/kern/xen/cmdline.c
> > b/grub-core/kern/xen/cmdline.c new file mode 100644
> > index 0000000..46a9998
> > --- /dev/null
> > +++ b/grub-core/kern/xen/cmdline.c
> > @@ -0,0 +1,376 @@
> > +/*
> > + *  GRUB  --  GRand Unified Bootloader
> > + *  Copyright (C) 2025  Free Software Foundation, Inc.
> > + *
> > + *  GRUB is free software: you can redistribute it and/or modify
> > + *  it under the terms of the GNU General Public License as
> > published by
> > + *  the Free Software Foundation, either version 3 of the License,
> > or
> > + *  (at your option) any later version.
> > + *
> > + *  GRUB is distributed in the hope that it will be useful,
> > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *  GNU General Public License for more details.
> > + *
> > + *  You should have received a copy of the GNU General Public
> > License
> > + *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include <grub/env.h>
> > +#include <grub/misc.h>
> > +#include <grub/mm.h>
> > +#include <grub/xen.h>
> > +
> > +enum splitter_state
> > +{
> > +  SPLITTER_HIT_BACKSLASH =3D 0x1,
> > +  SPLITTER_IN_SINGLE_QUOTES =3D 0x2,
> > +  SPLITTER_IN_DOUBLE_QUOTES =3D 0x4,
> > +};
> > +typedef enum splitter_state splitter_state_t;
> > +
> > +/*
> > + * The initial size of the current_word buffer. The buffer may be
> > resized as
> > + * needed.
> > + */
> > +#define PARSER_BASE_WORD_SIZE 32
> > +
> > +struct parser_state
> > +{
> > +  grub_size_t word_list_len; =20
>=20
> s/word_list_len/words_count/
>=20
> And I would put it behind word_list...

Will change.

> > +  char **word_list; =20
>=20
> s/word_list/words/

Will change.

> > +  grub_size_t current_word_len;
> > +  grub_size_t current_word_pos;
> > +  char *current_word;
> > +};
> > +typedef struct parser_state parser_state_t;
> > +
> > +static bool =20
>=20
> s/bool/grub_err_t/

Will change.

> > +append_char_to_word (parser_state_t *s, char c, bool allow_null)
> > +{
> > +  /*
> > +   * We ban any chars that are not in the ASCII printable range. If
> > +   * allow_null =3D=3D true, we make an exception for NUL. (This is
> > needed so that
> > +   * append_word_to_list can add a NUL terminator to the word).
> > +   */
> > +  if (grub_isprint (c) =3D=3D false && allow_null =3D=3D false) =20
>=20
> grub_isprint() et consortes return int instead of bool. So, it should
> be "!grub_isprint(c)" here...

Argh, right, because I can't assume that false =3D=3D 0 and true =3D=3D
non-zero. Will fix.

> > +    return false;
> > +  else if (allow_null =3D=3D true && c !=3D '\0')
> > +    return false;
> > +
> > +  if (s->current_word_pos =3D=3D s->current_word_len)
> > +    {
> > +      s->current_word =3D grub_realloc (s->current_word,
> > s->current_word_len *=3D 2);
> > +      if (s->current_word =3D=3D NULL)
> > +        {
> > +          s->current_word_len /=3D 2;
> > +          return false;
> > +        }
> > +    }
> > +
> > +  s->current_word[s->current_word_pos++] =3D c;
> > +  return true;
> > +}
> > +
> > +static bool =20
>=20
> s/bool/grub_err_t/

Will change.

> > +append_word_to_list (parser_state_t *s)
> > +{
> > +  /* No-op on empty words. */
> > +  if (s->current_word_pos =3D=3D 0)
> > +    return true;
> > +
> > +  if (append_char_to_word (s, '\0', true) =3D=3D false)
> > +    {
> > +      grub_error (GRUB_ERR_BUG,
> > +		  "couldn't append NUL terminator to word during
> > Xen cmdline parsing");
> > +      grub_print_error ();
> > +      grub_exit (); =20
>=20
> grub_fatal()

Will change.

> > +    }
> > +
> > +  s->current_word_len =3D grub_strlen (s->current_word) + 1;
> > +  s->current_word =3D grub_realloc (s->current_word,
> > s->current_word_len);
> > +  if (s->current_word =3D=3D NULL)
> > +    return false; =20
>=20
> return grub_errno;

Will change.

> > +  s->word_list =3D grub_realloc (s->word_list, ++s->word_list_len *
> > sizeof (char *));
> > +  if (s->word_list =3D=3D NULL)
> > +    return false; =20
>=20
> return grub_errno;
>=20
> ...
>=20
> I think many (related) functions in this code returning bool should
> really return grub_err_t...

That makes sense to me, will change where appropriate.

> > +  s->word_list[s->word_list_len - 1] =3D s->current_word;
> > +
> > +  s->current_word_len =3D PARSER_BASE_WORD_SIZE;
> > +  s->current_word_pos =3D 0;
> > +  s->current_word =3D grub_malloc (s->current_word_len);
> > +  if (s->current_word =3D=3D NULL)
> > +    return false;
> > +
> > +  return true;
> > +}
> > +
> > +static bool =20
>=20
> But this bool makes sense...

OK.

> > +is_key_safe (char *key, grub_size_t len)
> > +{
> > +  grub_size_t i;
> > +
> > +  for (i =3D 0; i < len; i++)
> > +    {
> > +      if (! (grub_isalpha (key[i]) || key[i] =3D=3D '_')) =20
>=20
> Please drop space after "!"...

Will change.

> > +        return false;
> > +    } =20
>=20
> You can drop curly braces from here...

Will change.

(I initially kept this written the way it was though because the GNU
coding standards seemed to indicate I should keep the braces. "When
you have an if-else statement nested in another if statement, always
put braces around the if-else." [1] This isn't a nested if, but it's an
if within a for which is very similar.)

Is there any recommended coding style documentation I should be looking
at other than the GNU coding standards and the GRUB coding style
guidelines? It seems I'm making an awful lot of style mistakes and
would like to avoid that going forward.

> > +
> > +  return true;
> > +}
> > +
> > +void
> > +grub_parse_xen_cmdline (void)
> > +{
> > +  parser_state_t *s =3D NULL; =20
>=20
> parser_state_t ps =3D {0};
>=20
> ... and you do not need grub_malloc(s) and stuff any longer below...
>=20
> And I would put it next to splitter_state...

Will change.

> > +  const char *cmdline =3D (const char *)
> > grub_xen_start_page_addr->cmd_line;
> > +  grub_size_t cmdline_len;
> > +  bool cmdline_valid =3D false;
> > +  char **param_keys =3D NULL;
> > +  char **param_vals =3D NULL;
> > +  grub_size_t param_dict_len =3D 0;
> > +  grub_size_t param_dict_pos =3D 0;
> > +  splitter_state_t splitter_state =3D 0; =20
>=20
> You nicely define an enum and then assign plain number. Sigh...
> I think you should define SPLITTER_NORMAL or something similar
> as well...
>
> And s/splitter_state/ss/...

Will implement both changes.

> > +  char current_char =3D '\0';
> > +  grub_size_t i =3D 0;
> > +
> > +  s =3D grub_malloc (sizeof (parser_state_t));
> > +  if (s =3D=3D NULL)
> > +    goto cleanup_final;
> > +
> > +  /*
> > +   * The following algorithm is used to parse the Xen command line:
> > +   *
> > +   * - The command line is split into space-separated words.
> > +   *   - Single and double quotes may be used to suppress the
> > splitting
> > +   *     behavior of spaces.
> > +   *   - Double quotes are appended to the current word verbatim
> > if they
> > +   *     appear within a single-quoted string portion, and vice
> > versa.
> > +   *   - Backslashes may be used to cause the next character to be
> > +   *     appended to the current word verbatim. This is only
> > useful when
> > +   *     used to escape quotes, spaces, and backslashes, but for
> > simplicity
> > +   *     we allow backslash-escaping anything.
> > +   * - After splitting the command line into words, each word is
> > checked to
> > +   *   see if it contains an equals sign.
> > +   *   - If it does, it is split on the equals sign into a
> > key-value pair. The
> > +   *     key is then treated as an variable name, and the value is
> > treated as
> > +   *     the variable's value.
> > +   *   - If it does not, the entire word is treated as a variable
> > name. The
> > +   *     variable's value is implicitly considered to be `1`.
> > +   * - All variables detected on the command line are checked to
> > see if their
> > +   *   names begin with the string `xen_grub_env_`. Variables that
> > do not pass
> > +   *   this check are discarded, variables that do pass this check
> > are
> > +   *   exported so they are available to the GRUB configuration.
> > +   */
> > +
> > +  s->current_word_len =3D PARSER_BASE_WORD_SIZE;
> > +  s->current_word =3D grub_malloc (s->current_word_len);
> > +  if (s->current_word =3D=3D NULL)
> > +    goto cleanup_main;
> > +
> > +  for (i =3D 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
> > +    {
> > +      if (cmdline[i] =3D=3D '\0')
> > +        {
> > +          cmdline_valid =3D true;
> > +          break;
> > +        }
> > +    }
> > +
> > +  if (cmdline_valid =3D=3D false)
> > +    {
> > +      grub_error (GRUB_ERR_BAD_ARGUMENT,
> > +		  "command line from Xen is not NUL-terminated");
> > +      grub_print_error (); =20
>=20
> grub_fatal()?

That would probably be a bad idea here. We use (or, at least, will use)
grub_fatal() in grub_xen_setup_pvh() because if grub_strncpy() doesn't
NUL-terminate the string it copies, it indicates a bug in GRUB (either
in grub_strncpy, or more likely in the nearby NUL-checking code). On
the other hand, cmdline_valid may equal false if we boot in PV mode and
Xen incorrectly hands us a non-NUL-terminated string. That's bad and
prevents us from parsing the command line safely, but I'd argue it
shouldn't entirely block boot. (Then again, maybe if it does block
boot, that will make this kind of theoretical Xen bug be much more
noticeable and help it get fixed quicker. If you'd prefer that we bail
out entirely here, I'm happy to change it.)

> > +      goto cleanup_main;
> > +    }
> > +
> > +  cmdline_len =3D grub_strlen (cmdline);
> > +  for (i =3D 0; i < cmdline_len; i++)
> > +    {
> > +      current_char =3D cmdline[i];
> > +
> > +      /*
> > +       * If the previous character was a backslash, append the
> > current
> > +       * character to the word verbatim
> > +       */
> > +      if (splitter_state & SPLITTER_HIT_BACKSLASH)
> > +        {
> > +          splitter_state &=3D ~SPLITTER_HIT_BACKSLASH;
> > +          if (append_char_to_word (s, current_char, false) =3D=3D
> > false)
> > +            goto cleanup_main;
> > +          continue;
> > +        }
> > +
> > +      switch (current_char)
> > +        {
> > +        case '\\':
> > +          /* Backslashes escape arbitrary characters. */
> > +          splitter_state |=3D SPLITTER_HIT_BACKSLASH;
> > +          continue;
> > +
> > +        case '\'':
> > +          /*
> > +           * Single quotes suppress word splitting and double
> > quoting until
> > +           * the next single quote is encountered.
> > +           */
> > +          if (splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
> > +            {
> > +              if (append_char_to_word (s, current_char, false) =3D=3D
> > false)
> > +                goto cleanup_main;
> > +              continue;
> > +            }
> > +
> > +          splitter_state ^=3D SPLITTER_IN_SINGLE_QUOTES;
> > +          continue;
> > +
> > +        case '"':
> > +          /*
> > +           * Double quotes suppress word splitting and single
> > quoting until
> > +           * the next double quote is encountered.
> > +           */
> > +          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES)
> > +            {
> > +              if (append_char_to_word (s, current_char, false) =3D=3D
> > false)
> > +                goto cleanup_main;
> > +              continue;
> > +            }
> > +
> > +          splitter_state ^=3D SPLITTER_IN_DOUBLE_QUOTES;
> > +          continue;
> > +
> > +        case ' ':
> > +          /* Spaces separate words in the command line from each
> > other. */
> > +          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES ||
> > +              splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
> > +            {
> > +              if (append_char_to_word (s, current_char, false) =3D=3D
> > false)
> > +                goto cleanup_main;
> > +              continue;
> > +            }
> > +
> > +          if (append_word_to_list (s) =3D=3D false)
> > +            goto cleanup_main; =20
>=20
> I think this is not fully correct. You should not run
> append_word_to_list() until the closing quote. So, here you should
> have "else" for the first "if", i.e., "if (splitter_state & ..." and
> call append_word_to_list() for closing \" and \' above.

What closing quote? If we're in quotes, the `if (splitter_state &...`
block will run. That block runs `continue`, restarting the loop before
we get to the `append_word_to_list (s)` call. If we hit a closing
quote, either the `case '\''` or the `case '"'` block will be
triggered, changing the splitter's state so that it knows it's no
longer within a quote block, and then the next space (or the end of the
string) will cause `append_word_to_list()` to be called, adding the
quoted word to the list. Even if this `continue` changes to a `break`
like suggested below, the logic and control flow will remain the same.

Calling `append_word_to_list()` for closing quotes would break the
splitter. I'm trying to implement splitting behavior similar to Bash or
GRUB's configuration language, both of which parse
`xen_grub_env_var=3D"abc def"ghi` into the variable `xen_grub_env_var`
with the value `abc defghi`. If we split on closing quotes too, the
input above will be parsed into two words, `xen_grub_env_var=3Dabc def`
and an extra word `ghi`, resulting in the environment variable
`xen_grub_env_var` being set to `abc def` and the `ghi` being lost
entirely. One could argue that this is reasonable behavior, but it
isn't consistent with the other splitting behavior in GRUB.

> > +          continue;
> > +        }
> > +
> > +      if (append_char_to_word (s, current_char, false) =3D=3D false)
> > +        goto cleanup_main; =20
>=20
> This should be part of "default:" for the switch above... Even if it
> works now...
>=20
> Then many "continue" should be converted to more natural "break"...

Good point, will change.

> > +    }
> > +
> > +  if (append_word_to_list (s) =3D=3D false)
> > +    goto cleanup_main;
> > +
> > +  param_keys =3D grub_malloc (s->word_list_len * sizeof (char *));
> > +  if (param_keys =3D=3D NULL)
> > +    goto cleanup_main;
> > +  param_vals =3D grub_malloc (s->word_list_len * sizeof (char *));
> > +  if (param_vals =3D=3D NULL)
> > +    goto cleanup_main;
> > +
> > +  for (i =3D 0; i < s->word_list_len; i++)
> > +    {
> > +      char *current_word_eq_ptr; =20
>=20
> s/current_word_eq_ptr/eq_pos/

Will change.

> > +      s->current_word =3D s->word_list[i];
> > +      s->current_word_len =3D grub_strlen (s->current_word) + 1;
> > +      current_word_eq_ptr =3D grub_strchr (s->current_word, '=3D');
> > +
> > +      if (current_word_eq_ptr !=3D NULL)
> > +        {
> > +          /*
> > +           * Both pre_eq_len and post_eq_len represent substring
> > lengths
> > +           * without a NUL terminator.
> > +           */
> > +          grub_size_t pre_eq_len =3D (grub_size_t)
> > (current_word_eq_ptr - s->current_word);
> > +          /*
> > +           * s->current_word_len includes the NUL terminator, so
> > we subtract
> > +           * one to get rid of the terminator, and one more to get
> > rid of the
> > +           * equals sign.
> > +           */
> > +          grub_size_t post_eq_len =3D (s->current_word_len - 2) -
> > pre_eq_len; +
> > +          if (is_key_safe (s->current_word, pre_eq_len) =3D=3D true)
> > +            {
> > +              param_dict_pos =3D param_dict_len++;
> > +              param_keys[param_dict_pos] =3D grub_malloc (pre_eq_len
> > + 1);
> > +              if (param_keys =3D=3D NULL)
> > +                goto cleanup_main;
> > +              param_vals[param_dict_pos] =3D grub_malloc
> > (post_eq_len + 1);
> > +              if (param_vals =3D=3D NULL)
> > +                goto cleanup_main;
> > +
> > +              grub_strncpy (param_keys[param_dict_pos],
> > s->current_word, pre_eq_len);
> > +              grub_strncpy (param_vals[param_dict_pos],
> > +			    s->current_word + pre_eq_len + 1,
> > post_eq_len);
> > +              param_keys[param_dict_pos][pre_eq_len] =3D '\0';
> > +              param_vals[param_dict_pos][post_eq_len] =3D '\0';
> > +            }
> > +        }
> > +      else =20
>=20
> else if (is_key_safe (s->current_word, s->current_word_len - 1) =3D=3D
> true)
>=20
> ... and you can drop an extra indention...

Will change.

> > +        {
> > +          if (is_key_safe (s->current_word, s->current_word_len -
> > 1) =3D=3D true)
> > +            {
> > +              param_dict_pos =3D param_dict_len++;
> > +              param_keys[param_dict_pos] =3D grub_malloc
> > (s->current_word_len);
> > +              if (param_keys =3D=3D NULL)
> > +                goto cleanup_main;
> > +              param_vals[param_dict_pos] =3D grub_malloc (2);
> > +              if (param_vals =3D=3D NULL)
> > +                goto cleanup_main;
> > +
> > +              grub_strncpy (param_keys[param_dict_pos],
> > s->current_word,
> > +			    s->current_word_len);
> > +              if (param_keys[param_dict_pos][s->current_word_len -
> > 1] !=3D '\0' )
> > +                {
> > +                  grub_error (GRUB_ERR_BUG,
> > +			      "NUL terminator missing from key
> > during Xen cmdline parsing");
> > +                  grub_print_error ();
> > +                  grub_exit (); =20
>=20
> grub_fatal()

Will change.

> > +                }
> > +              grub_strcpy (param_vals[param_dict_pos], "1");
> > +            }
> > +        }
> > +    } =20
>=20
> Daniel


--Sig_/O1TCkgKcxfVydyGr9aCjczS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmib1GMACgkQpwkWDXPH
kQm29g//S7vy2qb4XH01+ToWOK32ryRz1AKBbNtS3e3s5ONZ9XaGApCv1MrN1Z8h
xW2VBZmWqzcKa9aHnR6rWdUtmVFU07dY4EtnOjXMr6ndO4qKidmJkqKTDLGII3t3
vFv9nP+aJD6o9GPlnWgiPCs/CwoTj76ERGRE2x2R3+YfB/gvCXOgcmZgKQBHWcuU
c0zOpPifGTXXeqAtGLVzMxsnIURspSPJAqCakQjYu6pANL7+u2xjM3winUnCdo8O
HtxGD+D9fEAf8yWBVAxaeqjGupKScaBcz1KGUCLZ4XSCXuQnYEYF3kjPAFqB0usX
IoGxq+r+LbXOpOr+8Hw/w3n+boEejr9CDUxwNEMW/JdukmP6cdjJ2cmOjsdGRNNQ
HKe138GDTRVBZMlAytSZNQrBJdIPSc8eKlrl9vYKCl5FZRwiLtcpM9swz6dBe+JO
cH0pOBB0qxZZjjyruC3PcXlVxJ+bY7vrsCMq+is18Ll0ODbknIXFrAlIM3mvgB9C
amwqLneFn2080Sh9H+0jPKfwxRz/ZR5+7fq8v4R9uwZGa/x8oYenM8rPpB7pFHwh
80TWpKgU/6HFpmrmZTziDaNZPhwGA6tpRHR4BWTX59XM/YNF6Lx+BI8CMDwRfqny
py3wkRUDryQ4wwDHNgn69x6JCEzWY1SmhJtaUSVWykmx4OeIQgk=
=YLr2
-----END PGP SIGNATURE-----

--Sig_/O1TCkgKcxfVydyGr9aCjczS--

