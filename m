Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518EBAA5E77
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 14:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974121.1362065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAT9p-0001ez-Fc; Thu, 01 May 2025 12:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974121.1362065; Thu, 01 May 2025 12:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAT9p-0001dP-D0; Thu, 01 May 2025 12:36:53 +0000
Received: by outflank-mailman (input) for mailman id 974121;
 Thu, 01 May 2025 12:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Eah=XR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uAT9n-0001dJ-Hf
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 12:36:51 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3faf523-2688-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 14:36:50 +0200 (CEST)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-4032f863d20so271870b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 05:36:50 -0700 (PDT)
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
X-Inumbo-ID: f3faf523-2688-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746103009; x=1746707809; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az6DuxwS+cbj2aShXS/BiWxsPfOevyrOe04Mv86jzsk=;
        b=QUevDI10i8dzeoAJJLPE45nWya2y4O6WNIdD47L29LWaBlyqDG4GiZoUo2R1Bpm6Li
         bcOcQfMIlvuYZsJEMsc5o+s0G46wuM7GcfwWtfjlBUJXApNi1E89I3mTHjExONpRvGa3
         moRsf28CYQiP5MX2RI7XFL/aXlX5VvLYW84s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103009; x=1746707809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az6DuxwS+cbj2aShXS/BiWxsPfOevyrOe04Mv86jzsk=;
        b=Mxm5EB+PhkAD9EP8NromphBA7ylUd4DCHlumH/8ICzW94fmXTBVBpHOesR7QARdS8v
         26XeJ+6XEPHSbAUWj2OA4NtWVAUTa/dYYmS6pY0iS9ddDPuMkc0XWwGfV/IyQJr5CXN/
         S0MLxKkNar3vrbl018qKmUHbszp+nqfrmnKok3IfZMiz4FKVLTIuVlStL646B6YV14DQ
         YT7g+hzAx+XIGFDfS0zUwIHmMrinIhwMLn6IU75ZfatTQC1qgBA6zlMlkJHKAxh+oWs6
         RvV9rZQvXAQL8nRk12GjT+lUvh/pWwDbo2LN2qTsVlCAvfSWHldjMcxJQiEHzacvKQRu
         kZTA==
X-Forwarded-Encrypted: i=1; AJvYcCUPiIpxAjCoIxXBf+NH5VrB3hSNLTy62NsTHJm9N+KG9QUPzuYmX3Apv82bWC1LtPhcT6EVAWtGtHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHifjm6D69vP/i1outhsA4cm9yXzDZqoDQRnM99dbFMqlpvCRg
	xt58DyrGMeshhQdicVjcwEdnF9zI5LHmUJG5uLdM/fIsdybSm7O4mGyb2cYGw26//RNb5h0aDDr
	28TwJ7aLhlgA725IvPiMgaB/dLgsXUTf2ZrNufg==
X-Gm-Gg: ASbGncvCebduy+e9N+gvoUaUypDYAypOldxWyu5atCjhmT+apw64uKs1g6GdVxDyk9Y
	VI3H6dT7waSQiNVaZGrhEgGd0vv1An9uYAfGnj5e299H/p4AFsYiexawhkrqbOIXWiaha0yZGG+
	bPupE+8wAAsIBverv1EQgiWg==
X-Google-Smtp-Source: AGHT+IFiuTYGMm+Zm0WGD2RaB3xbHZ5k2yiaN1eU+R5Y2ogO31PPRkAaa8iM8PIjZc5F1Jc79YH6ulblB4dOrNUM0oA=
X-Received: by 2002:a05:6808:164a:b0:400:a250:9819 with SMTP id
 5614622812f47-403343c9da9mr1819994b6e.12.1746103009353; Thu, 01 May 2025
 05:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250501104925.228351-1-gerald.elder-vass@cloud.com> <a8c18c85-54c6-4aa7-8eef-bb383f3cdfd5@citrix.com>
In-Reply-To: <a8c18c85-54c6-4aa7-8eef-bb383f3cdfd5@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 1 May 2025 13:36:38 +0100
X-Gm-Features: ATxdqUHto0FEUA41Nk5XwDfqqyKXwcsd_cmH4msV8t2a6N8Mi6ISMIhKgZ6BMYQ
Message-ID: <CACHz=ZjdRT42TRP_gyYPR_Djq2F8DNEYh8-C-z7PTy8yoKgW+Q@mail.gmail.com>
Subject: Re: [XEN PATCH] sbat: Add SBAT section to the xen binary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>, xen-devel@lists.xenproject.org, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 12:34=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 01/05/2025 11:49 am, Gerald Elder-Vass wrote:
> > The SBAT section provides a way for the binary to declare a generation
> > id for its upstream source and any vendor changes applied. A compatible
> > loader can then revoke vulnerable binaries by generation, using the
> > binary's declared generation id(s) to determine if it is safe to load.
> >
> > More information about SBAT is available here:
> > https://github.com/rhboot/shim/blob/main/SBAT.md
> >
> > Vendors should append a custom line onto sbat.csv(.in) with their vendo=
r
> > specific sbat data.
> >
> > Populate the SBAT section in the Xen binary by using the information
> > in xen/arch/x86/sbat.csv.in
> >
> > Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > Tested-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>
> Thankyou for starting to post these patches.
>
> The commit message needs that SBAT is a revocation scheme for UEFI
> SecureBoot, and mandatory now if you want to get signed by Microsoft.
> This wants to be the first sentence, IMO.
>
> That in turn also explains why it's in the EFI binary only, and
> discarded from the ELF binary.
>
> > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > index d902fb7accd9..6db7475c2c23 100644
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -74,6 +74,7 @@ obj-$(CONFIG_TBOOT) +=3D tboot.o
> >  obj-y +=3D hpet.o
> >  obj-y +=3D vm_event.o
> >  obj-y +=3D xstate.o
> > +obj-y +=3D sbat_data.o
>
> These should be sorted by file name (although hpet.o is clearly out of
> order here).
>
> Where possible, please use dash rather than underscore in filenames,
> although in this case I'd shorten it to just sbat.o and bypass that probl=
em.
>
> >
> >  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> >  obj-y +=3D domctl.o
> > @@ -277,6 +278,12 @@ $(obj)/efi.lds: AFLAGS-y +=3D -DEFI
> >  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
> >       $(call if_changed_dep,cpp_lds_S)
> >
> > +$(obj)/sbat.csv: $(src)/sbat.csv.in
> > +     sed "s/@@VERSION@@/${XEN_FULLVERSION}/" $< > $@
> > +
> > +$(obj)/sbat_data.o: $(obj)/sbat.csv
> > +     $(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=3D.sb=
at,readonly,data,contents $< $@
> > +
> >  clean-files :=3D \
> >      include/asm/asm-macros.* \
> >      $(objtree)/.xen-syms.[0-9]* \
> > diff --git a/xen/arch/x86/sbat.csv.in b/xen/arch/x86/sbat.csv.in
> > new file mode 100644
> > index 000000000000..7cdc33dbd998
> > --- /dev/null
> > +++ b/xen/arch/x86/sbat.csv.in
> > @@ -0,0 +1,2 @@
> > +sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SB=
AT.md
> > +xen,1,Linux Foundation,xen,@@VERSION@@,https://xenproject.org/
>
> I know this is what the SBAT spec says to do, but it's unworkable.
>
> Upstream Xen cannot state or maintain a global generation ID on behalf
> of it's downstreams.  This is true in general, not just for Xen.
>
> For us (XenServer), this needs to be a line starting xen.xenserver,
> because we (and only we) know how our Xen is built and configured.
> Every other downstream will need to do the same.
>
> So, either we want just the SBAT line an nothing else, or we want some
> kind of "to be filled in by the OSV" info, to make it clear that people
> need to alter it.
>

At this point why not make the inclusion of this section conditional?
If the binary is not going to be signed this section won't be used.
For instance I would define a dummy variable at the beginning of
xen/Makefile like XEN_SBAT_NAME.
If it's not provided (people can use external xen-version file) do not
include that section.

> When UEFI SecureBoot becomes security supported, the security team
> probably wants to note in XSAs whether the issue constitutes a breach of
> UEFI-SB, and remind downstreams to bump their generation IDs.
>
> ~Andrew

Frediano

