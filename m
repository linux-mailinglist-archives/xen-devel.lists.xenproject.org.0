Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019323DA10
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 13:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3eKI-0007WN-7e; Thu, 06 Aug 2020 11:44:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=775r=BQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k3eKG-0007WH-VD
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 11:44:49 +0000
X-Inumbo-ID: 28d2d612-df76-4d1a-9f34-5c38c085f630
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28d2d612-df76-4d1a-9f34-5c38c085f630;
 Thu, 06 Aug 2020 11:44:46 +0000 (UTC)
Date: Thu, 06 Aug 2020 11:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1596714285;
 bh=KNAMclvymDk/FZJ4GGKyc5K4JCgXd7BWu3UZZXVnjNY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=cAGhqfJRP7NQx7ae+o6KImXDmDJ/pI+WQjOH4Mv1q3Vw7NPe7xhapLtCwcEKRoxBF
 kSE/m1RaFHs/zUd0Ovt5fDA0kq/IH8kLISgBsRytHtG1FrH8WFqT84nNHrAOzcovqG
 ZRlFVaL8XIiPZOc1//vYsxR1N+To1RHxhXALRyxQ=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
Message-ID: <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
In-Reply-To: <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thursday, August 6, 2020 9:57 AM, Jan Beulich <jbeulich@suse.com> wrote:
> On 05.08.2020 19:20, Trammell Hudson wrote:
> > This preliminary patch adds support for bundling the Xen hypervisor, xe=
n.cfg,
> > the Linux kernel, initrd and XSM into a single "unified" EFI executable=
 that
> > can be signed by sbsigntool for verification by UEFI Secure Boot. [...]
>
> Looks reasonable for a PoC, thanks, but needs cleaning up I think.

Thanks for the comments.  It is very much a WIP and hopefully we can clean
it up for merging.

> A couple of specific remarks / questions:
>
> [...]
> > -   /* PE32+ Subsystem type */
> > -   if (pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_X64
> > -   && pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_ARM64
> > -   && pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_I386)
> > -          return NULL;
>
> I don't think i386 should be recognized here, and of the two other
> ones only the one matching the current target architecture should
> be.

That's a good point.  There isn't much point in proceeding if Xen
can't boot the executable anyway...


> > -   if ( pe->FileHeader.NumberOfSections > 96 )
> > -          return NULL;
>
> What's this 96 about?

Not sure, to be honest.  The PE parsing code is directly copied
from systemd-boot (including the bit about ARM and i386):

https://github.com/systemd/systemd/blob/07d5ed536ec0a76b08229c7a80b910cb9ac=
af6b1/src/boot/efi/pe.c#L83

> Overall I think it might help if this PE parsing code (if UEFI
> doesn't offer a protocol to do it for us) was put into its own
> source file.

I tried to putting it into a separate file and ran into link issues,
seems that it needs to be mentioned in both arch/x86/Makefile and
arch/x86/pe/Makefile, so this was a "just make it work" for the PoC.
Now that it is working, I'll go back to see if I can figure out the
makefile magic.

> I also wonder if it wouldn't better be optional
> (i.e. depend on a Kconfig option).

My preference would be to have it always on so that any Xen
executable can be unified and signed by the end user, rather than
requiring the user to do a separate build from source. For instance,
the Qubes install DVD has a normal xen.efi, but I can generate my own
signed version for my system by unifying it with the kernel and
initrd.

> > -   if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, N=
ULL, &size, buf) !=3D EFI_SUCCESS )
> > -          return false;
> > -   return buf[0] !=3D 0;
>
> I.e. "SecureBoot=3DN" still means "enabled"?

Maybe? UEFI 2.8, section 3.3 "Global Variables" says for SecureBoot:

"Whether the platform firmware is operating in Secure boot mode (1) or not =
(0). All other values
are reserved. Should be treated as read-only."

> [...]
> "secure" depending merely on an env var, how is this logic compatible
> with the shim model? You need to keep the other approach working.

Oops. Yes, I broke the shim model when booting in non-unified way with
SecureBoot enabled.

> Also, considering kernel and initrd are embedded, is there really a
> strict need for a config file? It would seem to me that you could
> boot the system fine without.

The config file is still necessary for Xen options (console, etc) as
well as the kernel command line.

> [...]
> Once you know whether you're dealing with a "unified" image, you
> shouldn't have a need to make logic dependent upon read_section()
> finding a particular section: Either you find all of them (and
> don't even try to interpret respective config file settings), or
> you read everything from disk.

Another option that might be better would be to have a "special"
file name -- if the config file has a leading "." then read_file()
could do the PE section search instead of going to the disk.
That way the config file could have some things on disk, and
some things unified.

For instance, microcode doesn't (always) need to be signed, since
it is already signed and encrypted by Intel.  Many OEM's leave
the ucode regions of flash unprotected by bootguard, which allows
the end user to update the microcode without requiring an OEM
signature.  This does potentially leave open some rollback
attacks, so I'm not 100% positive it is a good idea (although the
firmware volume should still be measured into the TPM and things
like SGX include the microcode version in the attestation).


> > --- /dev/null
> > +++ b/xen/scripts/unify-xen
> > @@ -0,0 +1,68 @@
> > +#!/bin/bash
> > +# Merge a Linux kernel, initrd and commandline into xen.efi to produce=
 a single signed
> > +# EFI executable.
> > +#
> > +# turn off "expressions don't expand in single quotes"
> > +# and "can't follow non-constant sources"
> > +# shellcheck disable=3DSC2016 disable=3DSC1090
>
> What are these three lines about?

Those are hold-overs from the safeboot script that I borrowed this from.
When linting the script with shellcheck, it complains about sourcing
files based on environment variables, and some code that has '$' in
single quotes.

This script is definitely NOT ready for inclusion and is just an example
of how to use objcopy to build the unified image.  A more full-featured
unify script could take the xen.cfg file and use it to locate the kernel,
initrd, xsm, ucode, etc instead of hard coded command line arguments.

I'm surprised that systemd-boot doesn't have a proper script; their
tutorials show how to run a raw objcopy command, which is about as
user unfriendly as possible...

> [...]
> > +# Xen goes up to a pad at 00400000
>
> "pad at 00400000"?

$ objdump -h xen.efi

xen.efi:     file format pei-x86-64

Sections:
Idx Name          Size      VMA               LMA               File off  A=
lgn
[...]
  8 .pad          00400000  ffff82d040c00000  ffff82d040c00000  00000000  2=
**2
                  ALLOC

There is this pad at the end of the image; I wasn't sure if it was importan=
t,
so I had the script deposit the extra sections after it.  Hopefully there i=
s
someway to automatically figure out the correct address for the additional
segments.

> > +XEN=3D"$1"
> > +CONFIG=3D"$2"
> > +KERNEL=3D"$3"
> > +RAMDISK=3D"$4"
>
> What about ucode and xsm policy?

Yeah... Did I mention this is a total hack?

It looks like microcode is handled in efi_arch_cfg_file_late(),
so it will need to be updated.  If the read_file() change is made,
then it would automatically do the right thing.

>
> > +objcopy \
> > -   --add-section .kernel=3D"$KERNEL" \
> > -   --add-section .ramdisk=3D"$RAMDISK" \
> > -   --add-section .config=3D"$CONFIG" \
> > -   --change-section-vma .config=3D0xffff82d041000000 \
> > -   --change-section-vma .kernel=3D0xffff82d041010000 \
> > -   --change-section-vma .ramdisk=3D0xffff82d042000000 \
>
> Of course these hard coded numbers will be eliminated in the
> long run?

Ideally.  We could try to parse out the address based on the objdump output=
,
although oddly systemd-boot has hardcoded ones as well.

[...]
> > -   warn "$OUTDIR/linux.efi: signature failed! Try $try."
> >     +done
>
> Why the retries? (Also leftover "linux.efi" in the warning?)

The sbsign could be moved into a separate script or example.

The retries in the safeboot script are because this happens after
the dm-verity hashes have been computed, which takes a while,
so it is a better user experience to give them another chance if
they mis-type their signing key password (or haven't yet plugged in
the yubikey).

Thanks again for the comments!  I'm really hopeful that we can have
Xen interoperating with UEFI SecureBoot sometime soon!

--
Trammell

