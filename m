Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A609B1AAFE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 00:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069844.1433538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj3ok-0004vS-Hn; Mon, 04 Aug 2025 22:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069844.1433538; Mon, 04 Aug 2025 22:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj3ok-0004tz-Eo; Mon, 04 Aug 2025 22:38:06 +0000
Received: by outflank-mailman (input) for mailman id 1069844;
 Mon, 04 Aug 2025 22:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AKUP=2Q=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1uj3oi-0004tt-M9
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 22:38:04 +0000
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adfeacd1-7183-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 00:38:03 +0200 (CEST)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3e3ead8bb17so2660315ab.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 15:38:02 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb90:bf84:45ad:2f41:d127:adbe:c0d6])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e40297c3d3sm46271305ab.6.2025.08.04.15.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 15:38:00 -0700 (PDT)
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
X-Inumbo-ID: adfeacd1-7183-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754347081; x=1754951881; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpzPXroFL9XWSTFAcpUp9VyIAZZY85T9RoTILyaLKv4=;
        b=YT3EZGRvudCi39wiszQHFdetACX2n/GkxVgN1paJPg09Vy6md/LMjYIHM9lBmtgqtB
         yq9BBlHbOCzrtQf/d84VRyeuts1iDe4LaCmU13ahdm6qfItDDBVeqdDXrrNyH4oOgJ+a
         MFFc19VyQ8pTsccOqd1LluFZvozYrJdjJ857ZBjyrRsw74JZExjZyH3Yd7pmjmxKq+se
         MYljPvC5dXT9zLicvewrOnc0L1J0dkIEW8E8paNnoet4pM0hYZcjj48ZLcLelxsT/RnZ
         WHPBcOK4/IFNydwL6d/YGXXNyO6FgpkUNlw5VcI/r0XTN2eohTv0idgYOqV0IfoHHZwP
         n+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754347081; x=1754951881;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpzPXroFL9XWSTFAcpUp9VyIAZZY85T9RoTILyaLKv4=;
        b=YaqG/thyW4lmikQo/cK6WaPSGQZU1YgNN65fw7S+dz2LdkkJsmxXUUqeYTPqZcN9Wp
         UMX8rdTLcENPFjAK3LrCf/1RjrX/Xspb+HnForO3mawok0aVI/ncr1R+YNFo+UMhQwqm
         mU+pFvx3LBkZtbQPxxkeIDPvhCjmo9+sFFICq4fHJ7SzR66glMoxvD8kgLbGCUHtSJWr
         WVBXJHLQrLLf6HKX5rShSvW66lPZFTx6XXJ+FNUkmikYo4SD/PZCjJIz3R3ZnfoTTEjK
         qt1WcSLO01yGqwrVCEU1uItS6oTtaPvcn5ETLdrkHgcJU3950rYO3hweri7ZZqbkPqnZ
         D5WQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0eMpaAJgVA8xlPjSTPgxoxMewhAB3+iY7hMz0ZD2H+tbJVeVBZdIy9UmPWgMr4R21PBWyB1YGE1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQu/Z5nkrnBh5MaVbXLLuHtjbjeb7bHN1MgOdYGZl2YNgr0Pwl
	qXO7VoQIkn3irbVBM+6IWT1/DqpHlYs9GPCDwgB90vH6kZ5RaV49RJBL
X-Gm-Gg: ASbGncvs9XNggKvyDtubKfa53G0ICCpDAvKENDJ9npiUJRFRDyVY5pZn0DZlS0wySCE
	BWkZRq1YiQwPGT2gP8zCROTtb/nVbxTHnW0flqiD5QXuI6E4FMaaDokBrxFnDph86+c/jM8wFLZ
	pjWjOPKnIh14o6v4dwKzcr346cic3qGMMb3pvKpwSu/LRd4vc+gkQi3hsKyKlsFb+4NYrNelCjE
	N4HoG2mA2qflOXiDifaHbW4uFEiOLoRRwW0F+bsQgh2sSgKnev8s6aaxYLMhCjglY6cLXmbHtvA
	NR0c/kn+5f8qfCNmNJ+EapLB9QkdkvJ4WwiZlndcqn+1nAkdUc1gflvXpnv4l9sUiquqXGuOUre
	JeLT6rol/rZYpqdk6khlZqj1ALrgFKuc=
X-Google-Smtp-Source: AGHT+IGIRt+/55zfXDnTiuTwxerfvRDhwzXt4iVLfmNlFKTk4GeFn1ForaQGC155ZFHb1WmdoFCMRw==
X-Received: by 2002:a05:6e02:1b07:b0:3e3:ef43:294 with SMTP id e9e14a558f8ab-3e4161d7a6dmr60297825ab.7.1754347080973;
        Mon, 04 Aug 2025 15:38:00 -0700 (PDT)
Date: Mon, 4 Aug 2025 17:37:52 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: Daniel Kiper <dkiper@net-space.pl>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [RESEND PATCH v3 1/1] kern/xen: Add Xen command line parsing
Message-ID: <20250804173752.18611fec@kf-m2g5>
In-Reply-To: <20250804151743.cjngftaseqesmht3@tomti.i.net-space.pl>
References: <20250725153012.1dd46644@kf-m2g5>
	<20250725153112.4ea25243@kf-m2g5>
	<20250801125536.mc2sjrdyikljzea6@tomti.i.net-space.pl>
	<20250803105703.5c83d4b2@kf-m2g5>
	<20250804151743.cjngftaseqesmht3@tomti.i.net-space.pl>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c21vzwXoh5w2G7dTvpTKCZK";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/c21vzwXoh5w2G7dTvpTKCZK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Aug 2025 17:17:43 +0200
Daniel Kiper <dkiper@net-space.pl> wrote:

> On Sun, Aug 03, 2025 at 10:57:03AM -0500, Aaron Rainbolt wrote:
> > On Fri, 1 Aug 2025 14:55:36 +0200 Daniel Kiper
> > <dkiper@net-space.pl> wrote: =20
> > > On Fri, Jul 25, 2025 at 03:31:12PM -0500, Aaron Rainbolt wrote: =20
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
> > > > Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>
> > > > ---
> > > >  docs/grub.texi                |  50 +++++
> > > >  grub-core/Makefile.core.def   |   2 +
> > > >  grub-core/kern/i386/xen/pvh.c |  14 ++
> > > >  grub-core/kern/main.c         |  12 ++
> > > >  grub-core/kern/xen/cmdline.c  | 343
> > > > ++++++++++++++++++++++++++++++++++ include/grub/xen.h
> > > >  | 2 + 6 files changed, 423 insertions(+)
> > > >  create mode 100644 grub-core/kern/xen/cmdline.c
> > > >
> > > > diff --git a/docs/grub.texi b/docs/grub.texi
> > > > index 34b3484..ce82483 100644
> > > > --- a/docs/grub.texi
> > > > +++ b/docs/grub.texi
> > > > @@ -3271,6 +3271,7 @@ GRUB.  Others may be used freely in GRUB
> > > > configuration files. @menu
> > > >  * Special environment variables::
> > > >  * Environment block::
> > > > +* Passing environment variables through Xen::
> > > >  @end menu
> > > >
> > > >
> > > > @@ -3871,6 +3872,55 @@ using BIOS or EFI functions (no ATA, USB
> > > > or IEEE1275). @command{grub-mkconfig} uses this facility to
> > > > implement @samp{GRUB_SAVEDEFAULT} (@pxref{Simple
> > > > configuration}).
> > > >
> > > > +@node Passing environment variables through Xen
> > > > +@section Passing environment variables through Xen
> > > > +
> > > > +If you are using a GRUB image as the kernel for a PV or PVH Xen
> > > > virtual +machine, you can pass environment variables from Xen's
> > > > dom0 to the VM through +the Xen-provided kernel command line.
> > > > When combined with a properly configured +guest, this can be
> > > > used to customize the guest's behavior on bootup via the +VM's
> > > > Xen configuration file. +
> > > > +GRUB will parse the kernel command line passed to it by Xen
> > > > during bootup. +The command line will be split into
> > > > space-delimited words. Single and +double quotes may be used to
> > > > quote words or portions of words that contain +spaces.
> > > > Arbitrary characters may be backslash-escaped to make them a
> > > > literal +component of a word rather than being parsed as quotes
> > > > or word separators. The +command line must consist entirely of
> > > > printable 7-bit ASCII characters and +spaces. If a non-printing
> > > > ASCII character is found anywhere in the command +line, the
> > > > entire command line will be ignored by GRUB. + +Each word
> > > > should be a variable assignment in the format ``variable'' or
> > > > +``variable=3Dvalue''. Variable names must contain only the
> > > > characters A-Z, a-z, +and underscore (``_''). Variable names
> > > > must begin with the string +``xen_grub_env_''. Variable values
> > > > can contain arbitrary printable 7-bit +ASCII characters and
> > > > space. If any variable contains an illegal name, that +variable
> > > > will be ignored. + +If a variable name and value are both
> > > > specified, the variable will be set to +the specified value. If
> > > > only a variable name is specified, the variable's +value will
> > > > be set to ``1''. +
> > > > +The following is a simple example of how to use this
> > > > functionality to append +arbitrary variables to a guest's
> > > > kernel command line: +
> > > > +@example
> > > > +# In the Xen configuration file for the guest
> > > > +name =3D "linux_vm"
> > > > +type =3D "pvh"
> > > > +kernel =3D "/path/to/grub-i386-xen_pvh.bin"
> > > > +extra =3D "xen_grub_env_kernelappend=3D'loglevel=3D3'" =20
> > >
> > > s/kernelappend/kernel_append/
> > >
> > > or maybe even
> > >
> > > s/kernelappend/linux_append/
> > >
> > > to make it clear it is appended to the "linux" command line... =20
> >
> > Will do.
> > =20
> > > > +memory =3D 1024
> > > > +disk =3D [ "file:/srv/vms/linux_vm.img,sda,w" ]
> > > > +
> > > > +# In the guest's GRUB configuration file
> > > > +menuentry "Linux VM with dom0-specified kernel parameters" @{
> > > > +    search --set=3Droot --label linux_vm --hint hd0,msdos1
> > > > +    linux /boot/vmlinuz root=3DLABEL=3Dlinux_vm
> > > > $@{xen_grub_env_kernelappend@} =20
> > >
> > > Ditto... =20
> >
> > Will do.
> > =20
> > > > +    initrd /boot/initrd.img
> > > > +@}
> > > > +@end example
> > > > +
> > > >  @node Modules
> > > >  @chapter Modules
> > > >
> > > > diff --git a/grub-core/Makefile.core.def
> > > > b/grub-core/Makefile.core.def index b3f7119..df0f266 100644
> > > > --- a/grub-core/Makefile.core.def
> > > > +++ b/grub-core/Makefile.core.def
> > > > @@ -248,6 +248,7 @@ kernel =3D {
> > > >    xen =3D term/xen/console.c;
> > > >    xen =3D disk/xen/xendisk.c;
> > > >    xen =3D commands/boot.c;
> > > > +  xen =3D kern/xen/cmdline.c;
> > > >
> > > >    i386_xen_pvh =3D commands/boot.c;
> > > >    i386_xen_pvh =3D disk/xen/xendisk.c;
> > > > @@ -255,6 +256,7 @@ kernel =3D {
> > > >    i386_xen_pvh =3D kern/i386/xen/tsc.c;
> > > >    i386_xen_pvh =3D kern/i386/xen/pvh.c;
> > > >    i386_xen_pvh =3D kern/xen/init.c;
> > > > +  i386_xen_pvh =3D kern/xen/cmdline.c;
> > > >    i386_xen_pvh =3D term/xen/console.c;
> > > >
> > > >    ia64_efi =3D kern/ia64/efi/startup.S;
> > > > diff --git a/grub-core/kern/i386/xen/pvh.c
> > > > b/grub-core/kern/i386/xen/pvh.c index 91fbca8..12df2d8 100644
> > > > --- a/grub-core/kern/i386/xen/pvh.c
> > > > +++ b/grub-core/kern/i386/xen/pvh.c
> > > > @@ -321,6 +321,8 @@ void
> > > >  grub_xen_setup_pvh (void)
> > > >  {
> > > >    grub_addr_t par;
> > > > +  const char *xen_cmdline;
> > > > +  int i;
> > > >
> > > >    grub_xen_cpuid_base ();
> > > >    grub_xen_setup_hypercall_page ();
> > > > @@ -352,6 +354,18 @@ grub_xen_setup_pvh (void)
> > > >    grub_xen_mm_init_regions ();
> > > >
> > > >    grub_rsdp_addr =3D pvh_start_info->rsdp_paddr;
> > > > +
> > > > +  xen_cmdline =3D (const char *) pvh_start_info->cmdline_paddr;
> > > > +  for (i =3D 0; i < MAX_GUEST_CMDLINE; i++) =20
> > >
> > > Oh, MAX_GUEST_CMDLINE is a too generic. May I ask you to rename
> > > it to GRUB_XEN_MAX_GUEST_CMDLINE? This should be done in separate
> > > patch preceding this one. =20
> >
> > Sure.
> > =20
> > > > +    {
> > > > +      if (xen_cmdline[i] =3D=3D '\0') =20
> > >
> > > I cannot see much sense in this check. Please look below...
> > > =20
> > > > +        {
> > > > +          grub_strncpy ((char *)
> > > > grub_xen_start_page_addr->cmd_line,
> > > > +			(char *)
> > > > pvh_start_info->cmdline_paddr, =20
> > >
> > > s/char */const char */
> > >
> > > Is it always guaranteed that pvh_start_info->cmdline_paddr have
> > > MAX_GUEST_CMDLINE size? If yes then... =20
> >
> > It is not guaranteed. I tested this under Qubes OS, and it is
> > unfortunately very possible to pass a guest command line longer than
> > MAX_GUEST_CMDLINE via pvh_start_info->cmdline_paddr. I do not know
> > of any documentation specifying what the "real" maximum length is
> > in this instance (if any), but in any event the string ultimately
> > has to be crammed into an array that is only MAX_GUEST_CMDLINE
> > long. Originally I wrote this to truncate the command line in this
> > situation, but later decided that discarding the command line would
> > be safer than truncation. =20
>=20
> I think you are confusing source, grub_xen_start_page_addr->cmd_line,
> and destination, pvh_start_info->cmdline_paddr. I am asking about the
> destination...

The destination is grub_xen_start_page_addr->cmd_line.
pvh_start_info->cmdline_paddr is the *source*, not the destination.
grub_xen_start_page_addr->cmd_line is a MAX_GUEST_CMDLINE-long int8_t
array, so yes, the destination is guaranteed to always have
MAX_GUEST_CMDLINE size.

> > (When booting a VM in PV mode, Xen does guarantee the command line
> > will not be longer than MAX_GUEST_CMDLINE and will simply return a
> > truncated command line. There is no way to detect this condition to
> > my awareness, so in PV mode, we simply live with the truncation
> > since we aren't given another option.) =20
>=20
> OK...
>=20
> > > grub_memset ((void *) pvh_start_info->cmdline_paddr, 0,
> > > MAX_GUEST_CMDLINE); grub_strncpy ((char *)
> > > grub_xen_start_page_addr->cmd_line, (const char *)
> > > pvh_start_info->cmdline_paddr, MAX_GUEST_CMDLINE - 1);
> > >
> > > ... and you are done... =20
> >
> > This would truncate the command line rather than discarding it. If
> > the goal is consistency with Xen's PV mode, then I can switch to
> > this, but I don't like the idea of booting a guest with corrupted
> > data inserted randomly into the grub.cfg file. (Like mentioned
> > above, there isn't any other option when using PV mode, but just
> > because PV mode does things dangerously doesn't mean we have to
> > when running in PVH mode.) =20
>=20
> OK, but please remember you have to ensure the string is
> NUL-terminated after grub_strncpy(). Potentially you could also use
> grub_strlen() to make a check and add NUL in proper place...

The code does ensure the string is NUL-terminated I believe, unless
grub_strncpy doesn't behave like POSIX strncpy. If a '\0' is found
anywhere in pvh_start_info->cmdline_paddr (the source), then we
grub_strncpy the string to grub_xen_start_page_addr->cmd_line,
specifying the size of the destination buffer as MAX_GUEST_CMDLINE.
strncpy pads the rest of the buffer with NUL bytes. In the worst case
scenario, the source is exactly MAX_GUEST_CMDLINE-1 bytes long plus a
NUL at the end, in which case strncpy will copy MAX_GUEST_CMDLINE-1
bytes and then add one byte of NUL padding. If the sources consists of
MAX_GUEST_CMDLINE non-NUL bytes, the copy won't happen at all because a
NUL will never be found in the first MAX_GUEST_CMDLINE bytes of the
source.

Using grub_strlen as a sanity check sounds good. If after the copy,
`grub_strlen((char *) grub_xen_start_page_addr->cmd_line) !=3D (i - 1)`,
then we know something is wrong and can halt the system.

> > > > +			MAX_GUEST_CMDLINE);
> > > > +          break;
> > > > +        }
> > > > +    }
> > > >  }
> > > >
> > > >  grub_err_t
> > > > diff --git a/grub-core/kern/main.c b/grub-core/kern/main.c
> > > > index 143a232..b4377d3 100644
> > > > --- a/grub-core/kern/main.c
> > > > +++ b/grub-core/kern/main.c
> > > > @@ -37,6 +37,10 @@
> > > >  #include <grub/machine/memory.h>
> > > >  #endif
> > > >
> > > > +#if defined (GRUB_MACHINE_XEN) || defined
> > > > (GRUB_MACHINE_XEN_PVH) +#include <grub/xen.h>
> > > > +#endif
> > > > +
> > > >  static bool cli_disabled =3D false;
> > > >  static bool cli_need_auth =3D false;
> > > >
> > > > @@ -351,6 +355,14 @@ grub_main (void)
> > > >    grub_env_export ("root");
> > > >    grub_env_export ("prefix");
> > > >
> > > > +  /*
> > > > +   * Parse command line parameters from Xen and export them as
> > > > environment
> > > > +   * variables
> > > > +   */
> > > > +#if defined (GRUB_MACHINE_XEN) || defined
> > > > (GRUB_MACHINE_XEN_PVH)
> > > > +  grub_parse_xen_cmdline (); =20
> > >
> > > Please move this call to the
> > > grub-core/kern/xen/init.c:grub_machine_init(). =20
> >
> > Will do.
> > =20
> > > > +#endif
> > > > +
> > > >    /* Reclaim space used for modules.  */
> > > >    reclaim_module_space ();
> > > >
> > > > diff --git a/grub-core/kern/xen/cmdline.c
> > > > b/grub-core/kern/xen/cmdline.c new file mode 100644
> > > > index 0000000..03dd88f
> > > > --- /dev/null
> > > > +++ b/grub-core/kern/xen/cmdline.c
> > > > @@ -0,0 +1,343 @@
> > > > +/*
> > > > + *  GRUB  --  GRand Unified Bootloader
> > > > + *  Copyright (C) 2025  Free Software Foundation, Inc.
> > > > + *
> > > > + *  GRUB is free software: you can redistribute it and/or
> > > > modify
> > > > + *  it under the terms of the GNU General Public License as
> > > > published by
> > > > + *  the Free Software Foundation, either version 3 of the
> > > > License, or
> > > > + *  (at your option) any later version.
> > > > + *
> > > > + *  GRUB is distributed in the hope that it will be useful,
> > > > + *  but WITHOUT ANY WARRANTY; without even the implied
> > > > warranty of
> > > > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> > > > the
> > > > + *  GNU General Public License for more details.
> > > > + *
> > > > + *  You should have received a copy of the GNU General Public
> > > > License
> > > > + *  along with GRUB.  If not, see
> > > > <http://www.gnu.org/licenses/>.
> > > > + */
> > > > +
> > > > +#include <grub/env.h>
> > > > +#include <grub/misc.h>
> > > > +#include <grub/mm.h>
> > > > +#include <grub/xen.h>
> > > > +
> > > > +enum parse_flags
> > > > +{
> > > > +  PARSER_HIT_BACKSLASH =3D 0x1,
> > > > +  PARSER_IN_SINGLE_QUOTES =3D 0x2,
> > > > +  PARSER_IN_DOUBLE_QUOTES =3D 0x4,
> > > > +}; =20
> > > typedef parse_flags parse_flags_t;
> > >
> > > ... and use parse_flags_t instead below... =20
> >
> > Will do.
> > =20
> > > And probably this should be a local variable... =20
> >
> > See below for comments on globals in the parser.
> > =20
> > > > +
> > > > +#define PARSER_BASE_WORD_LEN 16 =20
> > >
> > > This constant begs for a few words of comment... =20
> >
> > Will add. This is just the initial length of the dynamically
> > allocated buffer for storing each "word" of the command line, but
> > it is confusing as written. Perhaps it should be renamed to
> > PARSER_WORD_BUF_START_LEN or similar, to make it clear this isn't a
> > string length, but a buffer length? =20
>=20
> s/length/size/ then... However, then why 16 not, e.g., 32?

My original iteration of the patch didn't require `xen_grub_env_` at
the beginning of every variable name, so 16 was a reasonable estimate
of how long most "words" would end up, and I wanted to use the smallest
reasonable value here. That being said, `xen_grub_env_` is required
now, which is already 13 bytes long, so maybe 32 is a more reasonable
value. (Or, depending on where GRUB's allocator aligns things, maybe
this should be a large number like MAX_GUEST_CMDLINE, so that we don't
ever have to reallocate?)

> > > > +static grub_size_t word_list_len;
> > > > +static char **word_list;
> > > > +static grub_size_t current_word_len;
> > > > +static grub_size_t current_word_pos;
> > > > +static char *current_word;
> > > > +static char current_char; =20
> > >
> > > I have a feeling that most if not all of this variables should be
> > > local in a given function... =20
> >
> > I made them globals because making them local would have required an
> > awful lot of parameter "shuttling" that I believed made the code
> > less readable. For instance, the `append_word_to_list` function
> > right now has no parameters and can be called very simply by the
> > parser whenever it is needed. If all variables used were local, the
> > function would have to have a signature akin to:
> >
> >   static bool append_word_to_list(grub_size_t *current_word_pos_ref,
> >     grub_size_t *current_word_len_ref, char *current_word,
> >     grub_size_t *word_list_len_ref, char **word_list)
> >
> > IMO this is difficult to read and frustrating to call (possibly even
> > error-prone). Ultimately the variables are "local" to the parser,
> > and the functions are just there to split up the parser's algorithm
> > to avoid repetition. They all ultimately operate on the same state,
> > so having the state variables static but global within the file
> > fits the current parser design well. =20
>=20
> First of all, think about the design. If you are sure it is optimal
> then please use struct and a pointer to pass as many argument as you
> need...

Will do.

> > > > +static bool
> > > > +append_char_to_word (bool allow_null)
> > > > +{
> > > > +  /*
> > > > +   * Fail if the current char is outside of the range 0x20 to
> > > > 0x7E. If
> > > > +   * allow_null is true, make an exception for 0x00. This is a
> > > > safeguard =20
> > >
> > > Could you elaborate here when allow_null =3D=3D true is useful? =20
> >
> > Usually when appending characters to a word, you aren't going to be
> > appending null characters, thus `append_char_to_word` usually
> > rejects =20
>=20
> s/null/NUL/...

Will switch terminology from now on.

> > those so as to make it harder to mess things up. However, the string
> > does need to be null-terminated, and thus once a command line word
> > is =20
>=20
> Ditto... In general, even it is correct, I prefer to use NUL instead
> of null/NULL to avoid confusion...
>=20
> > fully loaded into current_word, it is necessary to add the null
> > terminator on the end. In this instance the parser sets
> > `current_char` to '\0' and then calls the `append_char_to_word`
> > function with `allow_null` set to true, so that the function knows
> > that the addition of a null is intentional here.
> >
> > (In retrospect, if allow_null is set to true, the only thing
> > `append_char_to_word` should append is a null character, it should
> > reject anything else in that instance. Otherwise someone could
> > accidentally append something other than a null when they meant to
> > append a null.) =20
>=20
> Is not it simpler to open code this instead of complicating this
> function?

Due to the possibility of having to reallocate the buffer, I don't
think so. If however we switch to using a buffer than doesn't need
reallocation, then it would be simpler to do that. I'll experiment with
it before sending the next patch version.

> > > > +   * against likely-invalid data.
> > > > +   */
> > > > +  if ( (!(current_char >=3D 0x20) || !(current_char <=3D 0x7E) ) =
=20
> > >
> > > grub_isprint()? =20
> >
> > That would work, I wasn't aware that existed. Maybe a mention of
> > some valuable GRUB internal API functions that are likely to remain
> > stable could be added to the GRUB development manual? (Or just a
> > reference to header files where useful things like this are
> > defined.) =20
>=20
> Certainly it is a good idea. In general you can assume the GRUB has a
> lot of POSIX compatible functions which names are prefixed with
> "grub_".

Nice, good to know.

> > > > +      && (current_char !=3D '\0' || allow_null =3D=3D false)) =20
> > >
> > > I would drop redundant spaces between "(" and ")" and move "&&"
> > > to the end of first line of "if". =20
> >
> > Will do, though I'm likely to rewrite this conditional anyway so
> > that anything other than '\0' will be rejected when `allow_null =3D=3D
> > true`.=20
> > > > +    return false;
> > > > +
> > > > +  if (current_word_pos =3D=3D current_word_len)
> > > > +    {
> > > > +      current_word_len *=3D 2; =20
> > >
> > > You can do this in the argument of the function below... =20
> >
> > I mean, yes, technically I can, but that's a lot less readable to
> > me. I can't find anywhere else in GRUB that uses that style (using
> > `grep -ri '\*=3D'` to search), and can find a few spots that use a
> > style similar to the one I've used here:
> >
> > * `util/grub-install.c` in function `device_map_check_duplicates`
> > * `grub-core/osdep/windows/platform.c` in function
> > `get_efi_variable`
> > * `grub-core/osdep/unix/platform.c` in function `get_ofpathname`
> > =20
> > > > +      current_word =3D grub_realloc (current_word,
> > > > current_word_len);
> > > > +      if (current_word =3D=3D NULL)
> > > > +        {
> > > > +          current_word_len /=3D 2;
> > > > +          return false;
> > > > +        }
> > > > +    }
> > > > +
> > > > +  current_word[current_word_pos] =3D current_char;
> > > > +  current_word_pos++; =20
> > >
> > > Again, you can do this operation in the "[]" above... =20
> >
> > Will do. (This does seem to be a much more common way to write
> > things in GRUB than what I've done.)
> > =20
> > > > +  return true;
> > > > +}
> > > > +
> > > > +static bool
> > > > +append_word_to_list (void)
> > > > +{
> > > > +  /* No-op on empty words. */
> > > > +  if (current_word_pos =3D=3D 0) =20
> > >
> > > This should be probably an argument for the function... =20
> >
> > See above for parser state and global variables rationale.
> > =20
> > > > +    return true;
> > > > +
> > > > +  current_char =3D '\0';
> > > > +  if (append_char_to_word (true) =3D=3D false)
> > > > +    {
> > > > +      grub_error (GRUB_ERR_BUG,
> > > > +		  "couldn't append null terminator to word
> > > > during Xen cmdline parsing");
> > > > +      grub_print_error ();
> > > > +      grub_exit ();
> > > > +    }
> > > > +
> > > > +  current_word_len =3D grub_strlen (current_word) + 1;
> > > > +  current_word =3D grub_realloc (current_word, current_word_len);
> > > > +  if (current_word =3D=3D NULL)
> > > > +    return false;
> > > > +  word_list_len++; =20
> > >
> > > Again this, OK ++word_list_len to be precise, can be done in a
> > > function argument below... =20
> >
> > `grep -ri 'alloc.*++'` doesn't show me any instance of this style
> > anywhere else in the GRUB codebase, and I find it much more
> > difficult to read since now I have to think about incrementing
> > `word_list_len`'s value and returning it and multiplying the
> > returned value all at the same time.
> > `grub-core/osdep/unix/platform.c` uses the style I've used here.
> > =20
> > > > +  word_list =3D grub_realloc (word_list, word_list_len * sizeof
> > > > (char *)); =20
>=20
> word_list =3D grub_realloc (word_list, ++word_list_len * sizeof (char
> *a));
>=20
> Is it really difficult to read? I do not think so...

I find it harder to read personally, but I'm fine with switching to it
if you'd prefer.

> [...]
>=20
> > > > +void
> > > > +grub_parse_xen_cmdline (void)
> > > > +{
> > > > +  const char *cmdline =3D (const char *)
> > > > grub_xen_start_page_addr->cmd_line;
> > > > +  grub_size_t cmdline_len;
> > > > +  bool cmdline_valid =3D false;
> > > > +  char **param_keys =3D NULL;
> > > > +  char **param_vals =3D NULL;
> > > > +  grub_size_t param_dict_len =3D 0;
> > > > +  grub_size_t param_dict_pos =3D 0;
> > > > +  enum parse_flags parse_flags =3D 0;
> > > > +  grub_size_t i =3D 0;
> > > > +
> > > > +  /*
> > > > +   * The following algorithm is used to parse the Xen command
> > > > line:
> > > > +   *
> > > > +   * - The command line is split into space-separated words.
> > > > +   *   - Single and double quotes may be used to suppress the
> > > > splitting
> > > > +   *     behavior of spaces.
> > > > +   *   - Double quotes are appended to the current word
> > > > verbatim if they
> > > > +   *     appear within a single-quoted string portion, and vice
> > > > versa.
> > > > +   *   - Backslashes may be used to cause the next character
> > > > to be
> > > > +   *     appended to the current word verbatim. This is only
> > > > useful when
> > > > +   *     used to escape quotes, spaces, and backslashes, but
> > > > for simplicity
> > > > +   *     we allow backslash-escaping anything.
> > > > +   * - After splitting the command line into words, each word
> > > > is checked to
> > > > +   *   see if it contains an equals sign.
> > > > +   *   - If it does, it is split on the equals sign into a
> > > > key-value pair. The
> > > > +   *     key is then treated as an variable name, and the
> > > > value is treated as
> > > > +   *     the variable's value.
> > > > +   *   - If it does not, the entire word is treated as a
> > > > variable name. The
> > > > +   *     variable's value is implicitly considered to be `1`.
> > > > +   * - All variables detected on the command line are checked
> > > > to see if their
> > > > +   *   names begin with the string `xen_grub_env_`. Variables
> > > > that do not pass
> > > > +   *   this check are discarded, variables that do pass this
> > > > check are
> > > > +   *   exported so they are available to the GRUB
> > > > configuration. =20
> > >
> > > I think not all from this valuable comment landed in the
> > > documentation. Please fix it... =20
> >
> > Comparing the two side-by-side:
> >
> > +----------------------------------+----------------------------------+
> > | Documentation                    | Comment
> >   |
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > | The command line will be split   | The command line is split into
> >   | | into space-delimited words.      | space-separated words.
> > Single    | | Single and double quotes may be  | and double quotes
> > may be used to | | used to quote words or portions  | suppress the
> > splitting behavior  | | of words that contain spaces.    | of
> > spaces.                       |
> > +----------------------------------+----------------------------------+
> > | (Self-evident, any other         | Double quotes are appended to
> >   | | behavior involving quotes would  | the current word verbatim
> > if     | | be extremely unexpected.)        | they appear within a
> > single-     | |                                  | quoted string,
> > and vice versa.   |
> > +----------------------------------+----------------------------------+
> > | Arbitrary characters may be      | Backslashes may be used to
> > cause | | backslash-escaped to make them a | the next character to
> > be         | | literal component of a word      | appended to the
> > current word     | | rather than being parsed as      | verbatim.
> > This is only useful    | | quotes or word separators.       | when
> > used to escape quotes,      | |                                  |
> > spaces, and backslashes, but for | |
> >   | simplicity we allow backslash-   | |
> >       | escaping anything.               |
> > +----------------------------------+----------------------------------+
> > | Each word should be a variable   | After splitting the command
> > line | | assignment in the format         | into words, each word
> > is checked | | ``variable'' or                  | to see if it
> > contains an equals  | | ``variable=3Dvalue''.              | sign.
> >                         |
> > +----------------------------------+----------------------------------+
> > | If a variable name and value are | If it does, it is split on the
> >   | | both specified, the variable     | equals sign into a
> > key-value     | | will be set to the specified     | pair. The key
> > is then treated as | | value.                           | a
> > variable name, and the value   | |
> > | treated as the variable's value. |
> > +----------------------------------+----------------------------------+
> > | If only a variable name is       | If it does not, the entire
> > word  | | specified, the variable's value  | is treated as a
> > variable name.   | | will be set to ``1''.            | The
> > variable's value is          | |                                  |
> > implicitly considered to be '1'. |
> > +----------------------------------+----------------------------------+
> > | Variable names must begin with   | All variables detected on the
> >   | | the string ``xen_grub_env_''...  | command line are checked
> > to see  | | If any variable contains an      | if their names begin
> > with the    | | illegal name, that variable will | string
> > `xen_grub_env_`.          | | be ignored.                      |
> > Variables that do not pass this  | |
> >   | check are discarded,             |
> > +----------------------------------+----------------------------------+
> > | ...you can pass environment      | variables that do pass this
> >   | | variables from Xen's dom0 to the | check are exported so they
> > are   | | VM through the Xen-provided      | available to the GRUB
> >           | | kernel command line.             | configuration.
> >               |
> > +----------------------------------+----------------------------------+
> >
> > The only missing detail I see is that single quotes are legal in
> > double-quoted strings and vice versa, though I guess I can make it
> > more explicit that the variables passed on the command line are
> > exported before getting to the example that shows this. Is there
> > anything else you see that's missing? =20
>=20
> Exactly, I was thing about single/double quotes here. If other stuff
> is in the documentation then OK...

Will add.

--
Aaron

> > > > +   */
> > > > +
> > > > +  current_word_len =3D PARSER_BASE_WORD_LEN;
> > > > +  current_word =3D grub_malloc (current_word_len);
> > > > +  if (current_word =3D=3D NULL)
> > > > +    goto cleanup;
> > > > +
> > > > +  for (i =3D 0; i < MAX_GUEST_CMDLINE; i++)
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
> > > > +		  "Command line from Xen is not
> > > > NUL-terminated"); =20
> > >
> > > GRUB errors usually start with lowercase... =20
> >
> > Will fix.
> > =20
> > > > +      grub_print_error ();
> > > > +      goto cleanup;
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
> > > > +      if (parse_flags & PARSER_HIT_BACKSLASH) =20
> > >
> > > s/parse_flags/parser_state/ =20
> >
> > Hmm, I don't like 'parser_state' as a name because the parser's
> > "state" is the global variables in `grub-core/kern/xen/cmdline.`.
> > Maybe 'splitter_state' instead, since this is just the bit of state
> > that the word splitter is concerned with? =20
>=20
> I am OK with both...
>
> Daniel


--Sig_/c21vzwXoh5w2G7dTvpTKCZK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmiRNkAACgkQpwkWDXPH
kQkPSQ/9Frq2XLp0/YQsiM2+4usjCt0ms5BtnSXFaEMAk2CDAcyjgJ0Ui3IFZqPe
3kVCrb1tabXNC7BWRpV/bFwPk+mEHF3Uh0o79UqGrp7SY8x7X1tiD51fesAOjCVA
gy3USyqR4mxIeJA3qWuAODlzwl6rnNFACC81mxeYpFGP4XFP67Av+UKL6XeVF6vN
oWwVZx3rQ6jG6Bz6LbLnBTFsKclEeelVIzy5xLSAzdFY71ETr3bCCNNE4SFVvikp
8TA6ve21suqiIW/geyUAPoNwgvhJgJwHVRSRptxl+mUCeSwclWy6y1we2Z9J//5A
7g++IBadn9ZWFs6qpjKM/JNcyLECceWzhxFLutTupnjnHfR9BqjjpkRZKcbqDY1J
VqC4K1vMR9K8K4unKvL6iv8nc5jP3DM1waVqAq06zqrOq/KIjmbqOsSQK+fdLH+X
UrdQ8Ayy47nNH4FfeS+7FkTIw9ljI6l+EPfpGrlCLxgVpOHc+QNVRF2Vw08/GfOf
pMyC/rXCn51AkmLNwtjSOKNCIim6a1F9MhYzmabWJIYusjWCHHgCowBBm3ncy7gH
EO/H1avLBCRcnsQ77OpEohT721UdbzdKLFqXAW2TvTucSsS0mOGSd/qCcADqcBIw
MJjIZAlde5Lcs4reuwE+RsH44N1wWI8TrsFLM6WaMA0pRZn2Z90=
=2Iiy
-----END PGP SIGNATURE-----

--Sig_/c21vzwXoh5w2G7dTvpTKCZK--

