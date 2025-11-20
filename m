Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F250EC7492D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167501.1493802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5iA-0001Mb-0Z; Thu, 20 Nov 2025 14:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167501.1493802; Thu, 20 Nov 2025 14:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5i9-0001Ja-TK; Thu, 20 Nov 2025 14:32:37 +0000
Received: by outflank-mailman (input) for mailman id 1167501;
 Thu, 20 Nov 2025 14:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eeu9=54=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vM5i8-0001JR-1u
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:32:36 +0000
Received: from mail-yx1-xb12e.google.com (mail-yx1-xb12e.google.com
 [2607:f8b0:4864:20::b12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03eeebd-c61d-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 15:32:33 +0100 (CET)
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-640d790d444so830577d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 06:32:33 -0800 (PST)
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
X-Inumbo-ID: c03eeebd-c61d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763649152; x=1764253952; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUeOVCMymier3ZfzWBM6RwQI21C5g6DmEkb2f2fRjCI=;
        b=OK0VelfzzNSqvg5WJwvMwM2Jc6/CtI3OkCPAkoqgXRaZV1BaxnaJ3fbYBRoqkBF8KY
         S13HRyeHrm1WfbiD5AfwYkzX/4+6Pa4dCgls8w/nnz5lU3KKmFKwk4+e4FwluUkS2IIp
         ESBpqIJ0nFovs5EtSCj0QavzgNYDveAmK7r3v6v0CDGNhSvojjczI9CnNATVQdb9veDW
         99zNs4ACJyoAOypbfdaSLJRhBZ+hgCClOwT300frLKQk2ZvNr427POJoY6AzJi77zr3r
         86CXxAL+4WvCU/eobqZI2OrqLgrV1lRLf9W636ls7MCyOr839+/3g91Vmxs280JO6y2T
         eb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649152; x=1764253952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iUeOVCMymier3ZfzWBM6RwQI21C5g6DmEkb2f2fRjCI=;
        b=iB4OtP69zfvI3gIUW0mXjbqTc0GoAbXVSRPHcNh8AYhgmJXTrw7xgrH9HXe+ospZEZ
         6yP2oUjswX+kLiRf6/jZuZusTK6pJReITtUQVCUIxUNYQymjDVhLZHCLy9H3SJAXRiXF
         DKuOozA7nG09nnQhGt/ik5JJNukK/tZyDH1YrQ3j9ogTDLb23vSXFMauWGmoN+Uhnqf2
         11+8E4k/ZiSMq0mvoEkMseP1dpFW7Lvt6IS+2cqCb4pxgHSeZndPxVvw8faRNfUpKCA5
         cF83SbK5ycDlZ21VSDcNmcaddVm7CyME3fYK1bxQu9IkZTyhb6czXs86FE4G4qjBFKi5
         /OnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX0+0iquA/F9cifcMesCfKALxaK/6qh85KJGGan7AhlNXX6cacgJLMNGsfMGebc/d2q6b7FaVR8zM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1AkNBpaf6Kmdj98GoqqWCxOuvWlMZr0+tViGK3P3bO2V6lZNi
	LLrUwWhmFHZV/tTuZRYL8aP1sspln317z11o9QD7QrzRPMEZEd8FnP2V6AXCViTUbOzZdiEWGHr
	3ZSFHZ0dMl+ywI+L8Eh7Ws4At9YLEbx4=
X-Gm-Gg: ASbGncuuAV9Jew10W5AWwed+DeSKJ1QDC7xXmfxeFCSjCyY9QmZPTm7rGJ/gskizJrz
	pzAKGrpDqiOdSAIuifjsmrc5xBTMe9i0V3PHkW34ktO5yhlRGKa2xmEVdBIqUFLqSfEZFRBSPi2
	7QgGRcPHxz/NUVFAvFWdDaZkyabOjAyWtp8vgH2qLWh8xEmx4+St/j9KXEFV/uUSmRyefzNhgwX
	kcBMnI/tYUO7Sx1PNwcA4BIqgvfFGiEdtv/nt7aTH7LS5rWuvnCeVbgESEm7zgzL9HrEkQ=
X-Google-Smtp-Source: AGHT+IFjzAWGOiKPMoTSO4ZLWdXYMNsmpo3BfIq+eBUy5zf89QeFh0QTH6eAVfvfPZ5ByUF/mrVKghncTp7ksJ8qJlU=
X-Received: by 2002:a05:690e:120b:b0:63e:b41:cebc with SMTP id
 956f58d0204a3-642f7d3468bmr2192445d50.17.1763649152328; Thu, 20 Nov 2025
 06:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com> <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
 <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
 <CAHt6W4einkyNX9sV3Ns87fLRaAN+N1b9CM=KVo5kvb1Qk7y=qg@mail.gmail.com> <aR8gDojcDEgrTSMa@mail-itl>
In-Reply-To: <aR8gDojcDEgrTSMa@mail-itl>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 20 Nov 2025 14:32:20 +0000
X-Gm-Features: AWmQ_bliXPaXE-1320HlHeOyKCIw4Gz7d6ycZ1IapwIDG9Sjghy0qk5m7JMXE6o
Message-ID: <CAHt6W4dB_FXVJbT1NkD6-Sf2+u+k2W=v1Au2AWOg-OxrmkN1gg@mail.gmail.com>
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Frediano Ziglio <frediano.ziglio@citrix.com>, 
	xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Nov 2025 at 14:05, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Thu, Nov 20, 2025 at 01:59:24PM +0000, Frediano Ziglio wrote:
> > On Sat, 15 Nov 2025 at 06:23, Frediano Ziglio <freddy77@gmail.com> wrot=
e:
> > >
> > > On Fri, 14 Nov 2025 at 19:18, Andrew Cooper <andrew.cooper3@citrix.co=
m> wrote:
> > > >
> > > > On 14/11/2025 3:40 pm, Oleksii Kurochko wrote:
> > > > >
> > > > >
> > > > > On 11/13/25 4:43 PM, Frediano Ziglio wrote:
> > > > >> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > > >>
> > > > >> For xen.gz file we strip all symbols and have an additional
> > > > >> xen-syms.efi file version with all symbols.
> > > > >> Make xen.efi more coherent stripping all symbols too.
> > > > >> xen-syms.efi can be used for debugging.
> > > > >>
> > > > >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > > > Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > >
> > > > > Thanks.
> > > >
> > > > Thanks.  Unfortunately CI says no.
> > > >
> > > > Ubuntu's 20.04, 18.04 and 16.04 all fail:
> > > > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/215=
9622869
> > > >
> > > > From 16.04:
> > > >
> > > > 2025-11-14T18:01:51.192964Z 01O strip xen-syms.efi -o xen.efi
> > > > 2025-11-14T18:01:51.198151Z 01O strip:xen-syms.efi[.init]: relocati=
on count is negative: File truncated
> > > > 2025-11-14T18:01:51.198166Z 01O strip: xen.efi: Failed to read debu=
g data section
> > > > 2025-11-14T18:01:51.198169Z 01O strip:xen.efi: error copying privat=
e BFD data: File truncated
> > > > 2025-11-14T18:01:51.198932Z 01O arch/x86/Makefile:207: recipe for t=
arget 'xen.efi' failed
> > > > 2025-11-14T18:01:51.198937Z 01O make[3]: *** [xen.efi] Error 1
> > > > 2025-11-14T18:01:51.199616Z 01O build.mk:90: recipe for target 'xen=
' failed
> > > > 2025-11-14T18:01:51.199619Z 01O make[2]: *** [xen] Error 2
> > > > 2025-11-14T18:01:51.200402Z 01O Makefile:600: recipe for target 'xe=
n' failed
> > > > 2025-11-14T18:01:51.200409Z 01O make[1]: *** [xen] Error 2
> > > >
> > > >
> > > > I find it hard to believe that the relocation count is really negat=
ive,
> > > > and given that newer binuitls works, I expect this is a binutils bu=
g.
> > > >
> > >
> > > Unless the message is just misleading I find it hard to have a
> > > negative number of items in a container.
> > >
> > > > Nevertheless, we need some workaround.  Given that the previous
> > > > behaviour was not to strip, I think we can reuse that for broken to=
olchains?
> > > >
> > >
> > > Something like that ?
> > >
> > > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > > index a154ffe6b2..c465eb12e2 100644
> > > --- a/xen/arch/x86/Makefile
> > > +++ b/xen/arch/x86/Makefile
> > > @@ -236,7 +236,9 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
> > >         $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCO=
PY) \
> > >                 -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
> > >  endif
> > > -       $(STRIP) $(TARGET)-syms.efi -o $@
> > > +       $(STRIP) $(TARGET)-syms.efi -o $@ || { \
> > > +               LANG=3DC strip $(TARGET)-syms.efi -o $@ 2>&1 | grep -=
q \
> > > +               "relocation count is negative" && mv -f $(TARGET)-sym=
s.efi $@; }
> > >  ifneq ($(CONFIG_DEBUG_INFO),y)
> > >         rm -f $(TARGET)-syms.efi
> > >  endif
> > >
> > > It will fall back to not stripping in case that bug is detected. I
> > > don't know how to test it.
> > > (the LANG=3DC is to always force the English message).
> > >
> >
> > It looks like this change works better and CI is happy.
> > It duplicates the linking with -s option if the strip fails.
> > Yes, it's a hack and almost duplicates the one command above.
> > What about it?
>
> Is it guaranteed to match xen-syms.efi?
>
> There is an alternative option: based on observation that Ubuntu 16.04
> runs out of support in April 2026 - which is before Xen 4.22 release,
> maybe we can drop that test from CI already?
>

That would work too.

Looking a bit more at the logs from
https://gitlab.com/xen-project/people/fziglio/xen/-/jobs/12158955130/viewer
there's something that worries me about.
I added "ls -l" and "objdump -x" of the output file and objdump is
complaining about relocations more or less the same strip was
complaining about:

    RELOCATION RECORDS FOR [.init]:
    objdump: failed to read relocs in: xen-syms.efi
    objdump: error message was: File truncated

not counting some weird relocations:

    reloc 2060 offset    0 [a4b8a4b0] UNKNOWN

    reloc 2294 offset    0 [a4b8a4b0] HIGHADJ (  80)

    reloc 2348 offset    0 [a4b8a4b0] SECTION

    reloc 2372 offset    0 [a4b8a4b0] RESERVED1

    reloc 2730 offset    0 [a4b8a4b0] MIPS_JMPADDR

Maybe the CI now is happy but there's not much point if the produced
files are not working.

> > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > index a154ffe6b2..5f5162841e 100644
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -236,7 +236,10 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
> >         $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY=
) \
> >                 -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
> >  endif
> > -       $(STRIP) $(TARGET)-syms.efi -o $@
> > +       $(STRIP) $(TARGET)-syms.efi -o $@ || \
> > +       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> > +             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y=
) \
> > +             $(note_file_option) -s -o $@
> >  ifneq ($(CONFIG_DEBUG_INFO),y)
> >         rm -f $(TARGET)-syms.efi
> >  endif
> >

