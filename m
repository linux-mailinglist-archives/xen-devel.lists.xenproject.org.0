Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850C782EB36
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 10:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667671.1039164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPfJQ-0004LF-HR; Tue, 16 Jan 2024 09:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667671.1039164; Tue, 16 Jan 2024 09:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPfJQ-0004Je-En; Tue, 16 Jan 2024 09:00:48 +0000
Received: by outflank-mailman (input) for mailman id 667671;
 Tue, 16 Jan 2024 09:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lstz=I2=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rPfJP-0004JY-4Y
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 09:00:47 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb8401ca-b44d-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 10:00:45 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a28b0207c1dso777136766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 01:00:45 -0800 (PST)
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
X-Inumbo-ID: bb8401ca-b44d-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705395644; x=1706000444; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyjnL1za0r89dP1OokXK0TAUeUj/Xlsyon8HZwa1NpE=;
        b=NOVuwAdU5LHxxT5veIsCb0HJPtegPJsvzXzqOPgXXR9oZTxpDQfXN6WRa35a0pVfYB
         +5w6sK/CDJVJB7q2O3nb6+2A3TSb8llRkrfvrZKOV9cTtkwFGHlOiLHe7675SKbFo2Jv
         q6Ys5zRxPB8s+jhQth1Xw7foBJONyVt8QAH6y/kGfEhA4V/nOzwGxCiYNElUz6zHfuXp
         M+3leMOwydoTjKmgHRYAyowm1ZPen7uns2kvJCX2op2pHWBap7/13c9pCXIRklgjT6cZ
         btSb19llpjz4ex8eFB5S1DVuxFeS4n3HMz9jtMxBlUGVZXUhx2mrTyBShXl2iVCFzCpw
         dbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705395644; x=1706000444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyjnL1za0r89dP1OokXK0TAUeUj/Xlsyon8HZwa1NpE=;
        b=PmUeLdpSiL4B2ddrzxvYJTZYxppxkRS6CM3LwFfJAjw+UnhZ5lh1WGr9lCHMjY+ikj
         6iL0IOD5eEQL6Xh9rg/c0UVjzWlTttU7DOl46CK/wMg4PZFqAwbCJBSTAb7rbfZJgWca
         W/hXTaYYrX+hZo8Piy8QJ+oMScrCIW+QrfIAAkoUGGEVQd6FE4uue0uzM7Fel8zQL29C
         UknEbwxWGtv3Mdqmy1Le2GtiDUTszbIlWKnmc+Ehy7AHl1i6CSJk1wjjiE1In0lrE1Gk
         UaRLx9//OOCRbIjMFdvOVFXrVf+P5WebVlAU2ojXvLXhKkJF9Ow/ZmZ7M2sbZAe6ZQRu
         gZTg==
X-Gm-Message-State: AOJu0Yw+CBCvlPQG3456QuhtGNkc15/SuLUFf+P5VmPLqUDmNF2i0Qko
	NJzzOz+SWm5OiIIggEfONKCLapYyFdlev2jWIVMDjmTE+X4pkg==
X-Google-Smtp-Source: AGHT+IGSRCo6awZJOe/2+XG77RbwKBrTsP+KXpLrzgQHJhia8XT5R9OEG2H6wWp3dWjbpWTgrGSC2YS7PKMY74zsuWA=
X-Received: by 2002:a17:907:c26:b0:a28:aee4:cbd1 with SMTP id
 ga38-20020a1709070c2600b00a28aee4cbd1mr4148782ejc.7.1705395644282; Tue, 16
 Jan 2024 01:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-14-carlo.nonato@minervasys.tech> <4553cc26-deb5-42ed-87b9-6cba2a5099eb@xen.org>
 <CAG+AhRXHfGJksqUrPXoHqNze+D654jJV0kVYBZaPLYwccdEz5Q@mail.gmail.com>
 <aa064f8f-d30e-4ac1-9239-daba5a806794@xen.org> <CAG+AhRXUPvKGu-y9qbVmhc0_ThCdxFvG=BYwCQMBH=mjo45qHw@mail.gmail.com>
 <985e1a2a-45eb-496c-8043-5f0c3c9f7766@xen.org> <CAG+AhRVKbM-n8ieg-CMbRG-4RgUXMSZL=ZER8EAWvGJgpEzUwA@mail.gmail.com>
 <ca2a64f8-ac0d-4b61-8f48-34478371bcbc@xen.org>
In-Reply-To: <ca2a64f8-ac0d-4b61-8f48-34478371bcbc@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 16 Jan 2024 10:00:32 +0100
Message-ID: <CAG+AhRVxBt=L-ioAcy9HH_kZq6jN84hLSK7UrkykO9LJVFGraA@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] xen/arm: add cache coloring support for Xen
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Mon, Jan 15, 2024 at 5:16=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
> On 15/01/2024 15:43, Carlo Nonato wrote:
> > Hi Julien,
>
> Hi Carlo,
>
> > On Mon, Jan 15, 2024 at 12:18=E2=80=AFPM Julien Grall <julien@xen.org> =
wrote:
> >> On 15/01/2024 10:11, Carlo Nonato wrote:
> >>> I understand what you're talking about, and it seems reasonable to ge=
t rid of
> >>> xen_colored_temp[] and create_llc_coloring_mappings() since in the en=
d they
> >>> serve the purpose of mapping the physically colored space that is alr=
eady
> >>> mapped using xen_xenmap[] pagetables.
> >>> What I don't understand is then how to copy/relocate Xen since I don'=
t have a
> >>> destination virtual space anymore to use in relocate_xen().
> >>
> >> You will need to link xen_xenmap[] in boot_second[...] as well. With
> >> that, you will be able to access the new Xen through the temporary are=
a.
> >
> > Wouldn't it result in overwriting the current virtual space mapping?
> > boot_second is the live page table and if I link xen_xenmap[] then
> > XEN_VIRT_START would point to the new colored space which is still empt=
y at
> > this stage...
>
> If you link at XEN_VIRT_START then yes. But you could link at
> BOOT_RELOC_VIRT_START like you already do today.

Ok I think I got it.

> >
> >> [...]
> >>
> >>>> Note that this means the init_ttbr cannot be written directly. But y=
ou
> >>>> can solve this problem by re-mapping the address.
> >>>
> >>> How to remap a single address?
> >>
> >> You should be able to use map_domain_page() to map the page where
> >> init_ttbr is.
> >>
> >>> And if moving init_ttbr in the identity-mapped area means that it's n=
o longer
> >>> writable, so that I need to remap it, why moving it in that area in t=
he first
> >>> place. Again I think I'm missing something.
> >>
> >> The goal is to have everything used (code, data) before the MMU is
> >> turned on residing in a single page. So secondary CPUs can directly ju=
mp
> >> to the colored Xen without any trouble.
> >
> > This is what confuses me. Why having everything on a single page makes
> > secondary cpus able to jump directly to colored Xen? (also see below)
>
> Because the code running with the MMU off can access easily access
> everything.

This was what I got wrong. Now it's clear.

> >
> >>>>>
> >>>>> 3) To access the identity mapping area I would need some accessor t=
hat takes
> >>>>> an address and returns it + phys_offset, or is there a better way t=
o do it?
> >>>>
> >>>> I am not sure I understand what you mean. Can you clarify?
> >>>
> >>> In my idea, I would use the identity mapping to access the "old" vari=
ables,
> >>> where "old" means non physically colored. init_ttbr is an example. Wh=
en
> >>> Xen it's copied on the new physical space, init_ttbr is copied with i=
t and
> >>> if the boot cpu modifies this variable, it's actually touching the co=
lored
> >>> one and not the old one. This means that secondary CPUs that still ha=
ven't
> >>> jumped to the new space, won't be able to see the new value and will =
never
> >>> go online.
> >>> So to access this "old" init_ttbr variable I need it's identity addre=
ss,
> >>> which is its current virtual address + some physical offset. I was as=
king
> >>> you if this is the right approach to use the identity mapping.
> >>
> >> Secondary CPUs would directly start on the colored Xen. So they will b=
e
> >> able to access the "new" init_ttbr & co.
> >
> > How can this be true? I mean, in call_psci_cpu_on() I can start those C=
PUs in
> > the colored space, but they still use the boot_* pagetables
>
> Are you looking at the 64-bit or 32-bit code? For 64-bit, staging is not
> using boot_* pagetable anymore for secondary CPUs. Instead, they
> directly jump to the runtime page-tables.

Again, my fault. Got it.

> > and there I can't
> > easily link the new colored space, or, at least, I'm not succeding in d=
oing
> > that. What I tried at the moment is to link xen_xenmap in boot_second a=
fter
> > switch_ttbr because of the problem I described above. But then secondar=
y
> > CPUs never go online...
>
> It would be helpful if you share some code.

Given the newfound knowledge, I'll think I can get further.

Thanks.

> >
> >> [...]
> >>
> >>>> ... as I wrote ealier your current approach seems to have a flaw. As=
 you
> >>>> overwrite xen_bootmodule->{start, size}. setup_mm() will end up to a=
dd
> >>>> the old Xen region to the boot allocator. This is before any seconda=
ry
> >>>> CPUs are booted up.
> >>>>
> >>>> IOW, the allocator may provide some memory from the old Xen and noth=
ing
> >>>> good will happen from that.
> >>>>
> >>>> The only way to solve it is to add another module. So the memory is
> >>>> skipped by setup_mm(). However see below.
> >>>>
> >>>>>
> >>>>> Yes that should be memory that in the end would not be needed so it=
 must
> >>>>> return to the boot-allocator (if that's what you mean). But how to =
do
> >>>>> that?
> >>>>
> >>>> You can't really discard the old temporary Xen. This may work today
> >>>> because we don't support CPU hotplug or suspend/resume. But there wa=
s
> >>>> some series on the ML to enable it and I don't see any reason why
> >>>> someone would not want to use the features with cache coloring.
> >>>>
> >>>> So the old temporary Xen would have to be kept around forever. This =
is
> >>>> up to 8MB of memory wasted.
> >>>>
> >>>> The right approach is to have the secondary CPU boot code (including=
 the
> >>>> variables it is using) fitting in the same page (or possibly multipl=
e so
> >>>> long this is small and physically contiguous). With that it doesn't
> >>>> matter where is the trampoline, it could stay at the old place, but =
we
> >>>> would only waste a few pages rather than up 8MB as it is today.
> >>>
> >>> So what are you suggesting is to create a new section in the linker s=
cript
> >>> for the trampoline code and data,
> >>
> >> We already have a section for that in place (see .idmap.*) which happe=
ns
> >> to be at the beginning of Xen. Right now, the section is in text. Whic=
h
> >> is why it is read-only executable.
> >>
> >>> then in setup_mm() we would skip this
> >>> memory?
> >>
> >> We should not need this. Secondary boot CPUs should boot direclty on t=
he
> >> colored Xen.
> >>
> >>> Am I following you correctly? Sorry those topics are a little out
> >>> of my preparation as you probably already guessed.
> >>
> >> No worries. I am happy to go in as much details as necessary. I can al=
so
> >> attempt to write a patch if that helps. (unless someone else in the Ar=
m
> >> maintainers want to give a try).
> >
> > Yes this would help. Thanks.
>
> I will try to have a look this evening. If I can't, it may have to wait
> a couple of weeks unless someone has time before hand.
>
> Cheers,
>
> --
> Julien Grall

