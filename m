Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB89E88C98A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 17:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698166.1089575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9qI-0005Ol-3Q; Tue, 26 Mar 2024 16:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698166.1089575; Tue, 26 Mar 2024 16:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9qI-0005Lb-0J; Tue, 26 Mar 2024 16:40:06 +0000
Received: by outflank-mailman (input) for mailman id 698166;
 Tue, 26 Mar 2024 16:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i3in=LA=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rp9qG-00052j-9C
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 16:40:04 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7db71ffd-eb8f-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 17:40:01 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a46f0da1b4fso736151266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 09:40:01 -0700 (PDT)
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
X-Inumbo-ID: 7db71ffd-eb8f-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711471201; x=1712076001; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4kscqhA4wQKYFZQg5F9AixatVOaZ6VNf6lMqab+PpE=;
        b=XGQAu8UNUgIxuKJUJ15+PdZmNMh3e96qD7yMuVNnfxs2lydSHwKjgUs57zhX3FEeUB
         RA6WpuN8vMPzgbR0YW+8Dy4eqQMHsh4hTCbw/gM6cf6f2y4i3eD/+kBVp71eSi0wU9KY
         DHUT4wHGWENhcaG4PHyyKi4YvHxntTZqAheauJXvQzf53Y4PzIg4C1xhTK7ORd/rMQ05
         py+QvL0eLuKKN7bL0EPqZ1A/ZXLAZC9aCLdfgKFetoc7PeRlBIeIzfjvB5kcuLtRrYhy
         vZUrBu+qOHKrEZsvtE+ozg4n6oLnHMc0pv8cdODVvGPSfPP/PSo9yoxydk6lq+neAOSC
         TEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711471201; x=1712076001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4kscqhA4wQKYFZQg5F9AixatVOaZ6VNf6lMqab+PpE=;
        b=IfkUM2ZDQzchJfxjSVNywsWFeVfCE1K3a+jtGAPNNsrHH9AEjYvSt/JtguQZnEjjLy
         hNpUQpNsnib59g1LbCXgTkz1KGjRDj9F3OFny2ZjnY8u87ZKFa43Lz99UfEpeDGaYvC9
         l674B5WpCXhCEL/xQG8dXfG9J94BL5iFWAtgsDnlpTVL1trwCM2CdSXEOhK/LAskvOH1
         3n7xoMwwV87R/B+2j2aw4k0jx9HBq9HqPQm7bwI4oUx8Jhvgp2y1QShTfLCfPsYcEscn
         5a3hNoIGvsJ1/1dCs/3NNEQ6u8frL7PhX0VUVhqA69RKVirGfQvu3Cfrjhxk+uGmmouL
         A2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXFhcf2f4X5OkAYVsvI0htUuMmi0dTZmz9dPqVPeS8igi1nIz38fSoiA7b8MB0NRMeOEWjurKSlhRGOLmeOfWgvF9z6vY4jdN1XIbVGNhs=
X-Gm-Message-State: AOJu0YyhlMIkAjT2ky9niMUpIqtz5/lnzbRonR6uOcziBtkwJBL73Kyy
	kgPeo6Hh6pBrHQxxiSgKHhWrgsYn1e9lt+0WCLxs6p7z6duxj4ZBNex/da/id6hZ9EYVM3Fn7Mn
	YJ3lF23VY+qVG5Fqohr/Iu/JD64ajHSowq65kFw==
X-Google-Smtp-Source: AGHT+IE+i4dau6E3P4Z73Nw5NUKQuQvu5GIL5e48qmm1rp4J038UU7kPvXwfAxXnIwH18UcIB8ch5fYRuT/Axvybk5k=
X-Received: by 2002:a17:906:1d59:b0:a46:be3d:1ed8 with SMTP id
 o25-20020a1709061d5900b00a46be3d1ed8mr160337ejh.54.1711471201307; Tue, 26 Mar
 2024 09:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech> <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
 <9e0f7ff3-5457-41e4-a1e4-bf75804fb900@xen.org> <255be735-f9fe-4e39-a24e-2f6aff91acc5@suse.com>
 <CAG+AhRWMh2quv3SNPJQ61au=e6gtdXUO7j-XVYV6chDmktqkvA@mail.gmail.com> <3427132d-9458-4447-b667-d2ef3c1f0569@suse.com>
In-Reply-To: <3427132d-9458-4447-b667-d2ef3c1f0569@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 26 Mar 2024 17:39:50 +0100
Message-ID: <CAG+AhRXE7cMNnDNxZeF=o7wBXKUtwvMj6Y5oRy-UrpDyAfM5Cw@mail.gmail.com>
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags macro
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Mar 25, 2024 at 8:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.03.2024 16:07, Carlo Nonato wrote:
> > Hi guys,
> >
> > On Thu, Mar 21, 2024 at 5:23=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 21.03.2024 17:10, Julien Grall wrote:
> >>> On 21/03/2024 16:07, Julien Grall wrote:
> >>>> On 15/03/2024 10:58, Carlo Nonato wrote:
> >>>>> PGC_static and PGC_extra needs to be preserved when assigning a pag=
e.
> >>>>> Define a new macro that groups those flags and use it instead of or=
'ing
> >>>>> every time.
> >>>>>
> >>>>> To make preserved flags even more meaningful, they are kept also wh=
en
> >>>>> switching state in mark_page_free().
> >>>>>
> >>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>>>
> >>>> This patch is introducing a regression in OSStest (and possibly gitl=
ab?):
> >>>>
> >>>> Mar 21 12:00:29.533676 (XEN) pg[0] MFN 2211c5 c=3D0x2c00000000000000=
 o=3D0
> >>>> v=3D0xe40000010007ffff t=3D0x24
> >>>> Mar 21 12:00:42.829785 (XEN) Xen BUG at common/page_alloc.c:1033
> >>>> Mar 21 12:00:42.829829 (XEN) ----[ Xen-4.19-unstable  x86_64  debug=
=3Dy
> >>>> Not tainted ]----
> >>>> Mar 21 12:00:42.829857 (XEN) CPU:    12
> >>>> Mar 21 12:00:42.841571 (XEN) RIP:    e008:[<ffff82d04022fe1f>]
> >>>> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
> >>>> Mar 21 12:00:42.841609 (XEN) RFLAGS: 0000000000010282   CONTEXT:
> >>>> hypervisor (d0v8)
> >>>> Mar 21 12:00:42.853654 (XEN) rax: ffff83023e3ed06c   rbx:
> >>>> 000000000007ffff   rcx: 0000000000000028
> >>>> Mar 21 12:00:42.853689 (XEN) rdx: ffff83047bec7fff   rsi:
> >>>> ffff83023e3ea3e8   rdi: ffff83023e3ea3e0
> >>>> Mar 21 12:00:42.865657 (XEN) rbp: ffff83047bec7c10   rsp:
> >>>> ffff83047bec7b98   r8:  0000000000000000
> >>>> Mar 21 12:00:42.877647 (XEN) r9:  0000000000000001   r10:
> >>>> 000000000000000c   r11: 0000000000000010
> >>>> Mar 21 12:00:42.877682 (XEN) r12: 0000000000000001   r13:
> >>>> 0000000000000000   r14: ffff82e0044238a0
> >>>> Mar 21 12:00:42.889652 (XEN) r15: 0000000000000000   cr0:
> >>>> 0000000080050033   cr4: 0000000000372660
> >>>> Mar 21 12:00:42.901651 (XEN) cr3: 000000046fe34000   cr2: 00007fb727=
57610b
> >>>> Mar 21 12:00:42.901685 (XEN) fsb: 00007fb726def380   gsb:
> >>>> ffff88801f200000   gss: 0000000000000000
> >>>> Mar 21 12:00:42.913646 (XEN) ds: 0000   es: 0000   fs: 0000   gs: 00=
00
> >>>> ss: e010   cs: e008
> >>>> Mar 21 12:00:42.913680 (XEN) Xen code around <ffff82d04022fe1f>
> >>>> (common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2):
> >>>> Mar 21 12:00:42.925645 (XEN)  d1 1c 00 e8 ad dd 02 00 <0f> 0b 48 85 =
c9
> >>>> 79 36 0f 0b 41 89 cd 48 c7 47 f0
> >>>> Mar 21 12:00:42.937649 (XEN) Xen stack trace from rsp=3Dffff83047bec=
7b98:
> >>>> Mar 21 12:00:42.937683 (XEN)    0000000000000024 000000007bec7c20
> >>>> 0000000000000001 ffff83046ccda000
> >>>> Mar 21 12:00:42.949653 (XEN)    ffff82e000000021 0000000000000016
> >>>> 0000000000000000 0000000000000000
> >>>> Mar 21 12:00:42.949687 (XEN)    0000000000000000 0000000000000000
> >>>> 0000000000000028 0000000000000021
> >>>> Mar 21 12:00:42.961652 (XEN)    ffff83046ccda000 0000000000000000
> >>>> 00007d2000000000 ffff83047bec7c48
> >>>> Mar 21 12:00:42.961687 (XEN)    ffff82d0402302ff ffff83046ccda000
> >>>> 0000000000000100 0000000000000000
> >>>> Mar 21 12:00:42.973655 (XEN)    ffff82d0405f0080 00007d2000000000
> >>>> ffff83047bec7c80 ffff82d0402f626c
> >>>> Mar 21 12:00:42.985656 (XEN)    ffff83046ccda000 ffff83046ccda640
> >>>> 0000000000000000 0000000000000000
> >>>> Mar 21 12:00:42.985690 (XEN)    ffff83046ccda220 ffff83047bec7cb0
> >>>> ffff82d0402f65a0 ffff83046ccda000
> >>>> Mar 21 12:00:42.997662 (XEN)    0000000000000000 0000000000000000
> >>>> 0000000000000000 ffff83047bec7cc0
> >>>> Mar 21 12:00:43.009660 (XEN)    ffff82d040311f8a ffff83047bec7ce0
> >>>> ffff82d0402bd543 ffff83046ccda000
> >>>> Mar 21 12:00:43.009695 (XEN)    ffff83047bec7dc8 ffff83047bec7d08
> >>>> ffff82d04032c524 ffff83046ccda000
> >>>> Mar 21 12:00:43.021653 (XEN)    ffff83047bec7dc8 0000000000000002
> >>>> ffff83047bec7d58 ffff82d040206750
> >>>> Mar 21 12:00:43.033642 (XEN)    0000000000000000 ffff82d040233fe5
> >>>> ffff83047bec7d48 0000000000000000
> >>>> Mar 21 12:00:43.033678 (XEN)    0000000000000002 00007fb72767f010
> >>>> ffff82d0405e9120 0000000000000001
> >>>> Mar 21 12:00:43.045654 (XEN)    ffff83047bec7e70 ffff82d040240728
> >>>> 0000000000000007 ffff83023e3b3000
> >>>> Mar 21 12:00:43.045690 (XEN)    0000000000000246 ffff83023e2efa90
> >>>> ffff83023e38e000 ffff83023e2efb40
> >>>> Mar 21 12:00:43.057609 (XEN)    0000000000000007 ffff83023e3afb80
> >>>> 0000000000000206 ffff83047bec7dc0
> >>>> Mar 21 12:00:43.069662 (XEN)    0000001600000001 000000000000ffff
> >>>> e75aaa8d0000000c ac0d6d864e487f62
> >>>> Mar 21 12:00:43.069697 (XEN)    000000037fa48d76 0000000200000000
> >>>> ffffffff000003ff 00000002ffffffff
> >>>> Mar 21 12:00:43.081647 (XEN)    0000000000000000 00000000000001ff
> >>>> 0000000000000000 0000000000000000
> >>>> Mar 21 12:00:43.093646 (XEN) Xen call trace:
> >>>> Mar 21 12:00:43.093677 (XEN)    [<ffff82d04022fe1f>] R
> >>>> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
> >>>> Mar 21 12:00:43.093705 (XEN)    [<ffff82d0402302ff>] F
> >>>> alloc_domheap_pages+0x17d/0x1e4
> >>>> Mar 21 12:00:43.105652 (XEN)    [<ffff82d0402f626c>] F
> >>>> hap_set_allocation+0x73/0x23c
> >>>> Mar 21 12:00:43.105685 (XEN)    [<ffff82d0402f65a0>] F
> >>>> hap_enable+0x138/0x33c
> >>>> Mar 21 12:00:43.117646 (XEN)    [<ffff82d040311f8a>] F
> >>>> paging_enable+0x2d/0x45
> >>>> Mar 21 12:00:43.117679 (XEN)    [<ffff82d0402bd543>] F
> >>>> hvm_domain_initialise+0x185/0x428
> >>>> Mar 21 12:00:43.129652 (XEN)    [<ffff82d04032c524>] F
> >>>> arch_domain_create+0x3e7/0x4c1
> >>>> Mar 21 12:00:43.129687 (XEN)    [<ffff82d040206750>] F
> >>>> domain_create+0x4cc/0x7e2
> >>>> Mar 21 12:00:43.141665 (XEN)    [<ffff82d040240728>] F
> >>>> do_domctl+0x1850/0x192d
> >>>> Mar 21 12:00:43.141699 (XEN)    [<ffff82d04031a96a>] F
> >>>> pv_hypercall+0x617/0x6b5
> >>>> Mar 21 12:00:43.153656 (XEN)    [<ffff82d0402012ca>] F
> >>>> lstar_enter+0x13a/0x140
> >>>> Mar 21 12:00:43.153689 (XEN)
> >>>> Mar 21 12:00:43.153711 (XEN)
> >>>> Mar 21 12:00:43.153731 (XEN) ***************************************=
*
> >>>> Mar 21 12:00:43.165647 (XEN) Panic on CPU 12:
> >>>> Mar 21 12:00:43.165678 (XEN) Xen BUG at common/page_alloc.c:1033
> >>>> Mar 21 12:00:43.165703 (XEN) ***************************************=
*
> >>>> Mar 21 12:00:43.177633 (XEN)
> >>>> Mar 21 12:00:43.177662 (XEN) Manual reset required ('noreboot' speci=
fied)
> >>>>
> >>>> The code around the BUG is:
> >>>>
> >>>>          /* Reference count must continuously be zero for free pages=
. */
> >>>>          if ( (pg[i].count_info & ~PGC_need_scrub) !=3D PGC_state_fr=
ee )
> >>>>          {
> >>>>              printk(XENLOG_ERR
> >>>>                     "pg[%u] MFN %"PRI_mfn" c=3D%#lx o=3D%u v=3D%#lx =
t=3D%#x\n",
> >>>>                     i, mfn_x(page_to_mfn(pg + i)),
> >>>>                     pg[i].count_info, pg[i].v.free.order,
> >>>>                     pg[i].u.free.val, pg[i].tlbflush_timestamp);
> >>>>              BUG();
> >>>>          }
> >>>>
> >>>> Now that you are preserving some flags, you also want to modify the
> >>>> condition. I haven't checked the rest of the code, so there might be
> >>>> some adjustments necessary.
> >>>
> >>> Actually maybe the condition should not be adjusted. I think it would=
 be
> >>> wrong if a free pages has the flag PGC_extra set. Any thoughts?
> >>
> >> I agree, yet I'm inclined to say PGC_extra should have been cleared
> >> before trying to free the page.
> >
> > So what to do now? Should I drop this commit?
>
> No, we need to get to the root of the issue. Since osstest has hit it qui=
te
> easily as it seems, I'm somewhat surprised you didn't hit it in your test=
ing.
> In any event, as per my earlier reply, my present guess is that your chan=
ge
> has merely uncovered a previously latent issue elsewhere.

Ok, what about removing PGC_extra in free_heap_pages() before the
mark_page_free() call?

Thanks.

> Jan

