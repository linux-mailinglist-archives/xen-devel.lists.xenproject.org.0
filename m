Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7874886F70
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 16:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696926.1088160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rngUm-0006RG-J2; Fri, 22 Mar 2024 15:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696926.1088160; Fri, 22 Mar 2024 15:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rngUm-0006Od-GE; Fri, 22 Mar 2024 15:07:48 +0000
Received: by outflank-mailman (input) for mailman id 696926;
 Fri, 22 Mar 2024 15:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jjfM=K4=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rngUk-0006OX-S6
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 15:07:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eec3f16e-e85d-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 16:07:43 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a47062136c0so281106566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 08:07:43 -0700 (PDT)
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
X-Inumbo-ID: eec3f16e-e85d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711120062; x=1711724862; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GPIzfg3Tdo4oOPyNmPnGuswh61zm6kAYYK5uEDnjsU=;
        b=YaAh0aCaz/g5zkXQRXoR7vJyf7ruUc92QwNRwLPJX8GKblHlHFGt47l53rPjyX/4ht
         lNTTyUGZjC3guYtD3VLrV8YBNh30RkIct/va66C5Vae7GhcnTIbfDujSpuIOuJGzcTRn
         nBMgdJe6UCG7X34Mnx+oMxu4XaveY0AqffTKSBBnV7poE6zAhVH02hR5TYYWs3bzkEQs
         7hyf8wPUcfxq6TOcnLbTxpeRhDjFooIOCwHfmwYIs6gF4UAls1TuX8Y/vqoVaemeVC7G
         JT/D4GVZDL6vL1BH9rBr2HghlyLsl1zucEJKzXrjZOPKM/HZ1kIRC120VZ769L8dHE1C
         xccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711120062; x=1711724862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GPIzfg3Tdo4oOPyNmPnGuswh61zm6kAYYK5uEDnjsU=;
        b=xEpE6vT/R1P3hyp+Qlb5v78r/0uB/f4TyB66705sMUhxn9hJNbJpcEi9RTrWlFNfna
         N1gEauBnvADHlBrYMTG0JvvDNXX/4ffinzmcwug4CxpTeDhCqe4ZEuVML0oUEhuVurrj
         f0btdY9RhxfFyT+tbO9QiNbLlcfzSNsmu0vaOcTvWiEoAdjqiu4tCCmcXvxwlYBWsIXB
         +uJ3DpHC+mS1cg6BPd3qx0/7rVRMbx+y8K1EGNirFyS1iXWIZQKg6u1BYUI5aB/0Mq51
         pRtRppDxhSyBeTdA3+VVxxTnfxQupQlm3HrLHL41WUZMztCZc04GRZJt1ISrfU2qQ/7Z
         WJSA==
X-Forwarded-Encrypted: i=1; AJvYcCXnmzEWhn7OXy43IGgDddfiIBCF0IpUsiaysFRyaQXS96bcrP00TbjoM7wMUatcZTnllW1y1MedNW+vvZKu/HzNLWltV0fDenmuAKgA9Es=
X-Gm-Message-State: AOJu0Yx2dU0fQ/2jhxhPnLzJ8XnDO4Y5UWRqdJWhh5pjfSbtDJgJS00s
	hw4vzSOi8g6Fdm2u4sSsvPS0qV5eoLhT8mBHxdz/qtXFqw5M6eDvvh20bklAhulL/1p4ln8Sj/h
	clSDDaPgcOkNkB8Jr3cyBJ6/shUdsUf4xLBd9xw==
X-Google-Smtp-Source: AGHT+IGYJt56ZWt40So5HCR5pVTvACYWOQi8ATGGrtWIgkLAnWWST3fiFbb94xQaVQLIOGRuMFwZNH8jCvTYpUD4HAc=
X-Received: by 2002:a17:906:b808:b0:a47:347f:f0fd with SMTP id
 dv8-20020a170906b80800b00a47347ff0fdmr1162234ejb.53.1711120062621; Fri, 22
 Mar 2024 08:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech> <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
 <9e0f7ff3-5457-41e4-a1e4-bf75804fb900@xen.org> <255be735-f9fe-4e39-a24e-2f6aff91acc5@suse.com>
In-Reply-To: <255be735-f9fe-4e39-a24e-2f6aff91acc5@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 22 Mar 2024 16:07:31 +0100
Message-ID: <CAG+AhRWMh2quv3SNPJQ61au=e6gtdXUO7j-XVYV6chDmktqkvA@mail.gmail.com>
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags macro
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi guys,

On Thu, Mar 21, 2024 at 5:23=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.03.2024 17:10, Julien Grall wrote:
> > On 21/03/2024 16:07, Julien Grall wrote:
> >> On 15/03/2024 10:58, Carlo Nonato wrote:
> >>> PGC_static and PGC_extra needs to be preserved when assigning a page.
> >>> Define a new macro that groups those flags and use it instead of or'i=
ng
> >>> every time.
> >>>
> >>> To make preserved flags even more meaningful, they are kept also when
> >>> switching state in mark_page_free().
> >>>
> >>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>
> >> This patch is introducing a regression in OSStest (and possibly gitlab=
?):
> >>
> >> Mar 21 12:00:29.533676 (XEN) pg[0] MFN 2211c5 c=3D0x2c00000000000000 o=
=3D0
> >> v=3D0xe40000010007ffff t=3D0x24
> >> Mar 21 12:00:42.829785 (XEN) Xen BUG at common/page_alloc.c:1033
> >> Mar 21 12:00:42.829829 (XEN) ----[ Xen-4.19-unstable  x86_64  debug=3D=
y
> >> Not tainted ]----
> >> Mar 21 12:00:42.829857 (XEN) CPU:    12
> >> Mar 21 12:00:42.841571 (XEN) RIP:    e008:[<ffff82d04022fe1f>]
> >> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
> >> Mar 21 12:00:42.841609 (XEN) RFLAGS: 0000000000010282   CONTEXT:
> >> hypervisor (d0v8)
> >> Mar 21 12:00:42.853654 (XEN) rax: ffff83023e3ed06c   rbx:
> >> 000000000007ffff   rcx: 0000000000000028
> >> Mar 21 12:00:42.853689 (XEN) rdx: ffff83047bec7fff   rsi:
> >> ffff83023e3ea3e8   rdi: ffff83023e3ea3e0
> >> Mar 21 12:00:42.865657 (XEN) rbp: ffff83047bec7c10   rsp:
> >> ffff83047bec7b98   r8:  0000000000000000
> >> Mar 21 12:00:42.877647 (XEN) r9:  0000000000000001   r10:
> >> 000000000000000c   r11: 0000000000000010
> >> Mar 21 12:00:42.877682 (XEN) r12: 0000000000000001   r13:
> >> 0000000000000000   r14: ffff82e0044238a0
> >> Mar 21 12:00:42.889652 (XEN) r15: 0000000000000000   cr0:
> >> 0000000080050033   cr4: 0000000000372660
> >> Mar 21 12:00:42.901651 (XEN) cr3: 000000046fe34000   cr2: 00007fb72757=
610b
> >> Mar 21 12:00:42.901685 (XEN) fsb: 00007fb726def380   gsb:
> >> ffff88801f200000   gss: 0000000000000000
> >> Mar 21 12:00:42.913646 (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000
> >> ss: e010   cs: e008
> >> Mar 21 12:00:42.913680 (XEN) Xen code around <ffff82d04022fe1f>
> >> (common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2):
> >> Mar 21 12:00:42.925645 (XEN)  d1 1c 00 e8 ad dd 02 00 <0f> 0b 48 85 c9
> >> 79 36 0f 0b 41 89 cd 48 c7 47 f0
> >> Mar 21 12:00:42.937649 (XEN) Xen stack trace from rsp=3Dffff83047bec7b=
98:
> >> Mar 21 12:00:42.937683 (XEN)    0000000000000024 000000007bec7c20
> >> 0000000000000001 ffff83046ccda000
> >> Mar 21 12:00:42.949653 (XEN)    ffff82e000000021 0000000000000016
> >> 0000000000000000 0000000000000000
> >> Mar 21 12:00:42.949687 (XEN)    0000000000000000 0000000000000000
> >> 0000000000000028 0000000000000021
> >> Mar 21 12:00:42.961652 (XEN)    ffff83046ccda000 0000000000000000
> >> 00007d2000000000 ffff83047bec7c48
> >> Mar 21 12:00:42.961687 (XEN)    ffff82d0402302ff ffff83046ccda000
> >> 0000000000000100 0000000000000000
> >> Mar 21 12:00:42.973655 (XEN)    ffff82d0405f0080 00007d2000000000
> >> ffff83047bec7c80 ffff82d0402f626c
> >> Mar 21 12:00:42.985656 (XEN)    ffff83046ccda000 ffff83046ccda640
> >> 0000000000000000 0000000000000000
> >> Mar 21 12:00:42.985690 (XEN)    ffff83046ccda220 ffff83047bec7cb0
> >> ffff82d0402f65a0 ffff83046ccda000
> >> Mar 21 12:00:42.997662 (XEN)    0000000000000000 0000000000000000
> >> 0000000000000000 ffff83047bec7cc0
> >> Mar 21 12:00:43.009660 (XEN)    ffff82d040311f8a ffff83047bec7ce0
> >> ffff82d0402bd543 ffff83046ccda000
> >> Mar 21 12:00:43.009695 (XEN)    ffff83047bec7dc8 ffff83047bec7d08
> >> ffff82d04032c524 ffff83046ccda000
> >> Mar 21 12:00:43.021653 (XEN)    ffff83047bec7dc8 0000000000000002
> >> ffff83047bec7d58 ffff82d040206750
> >> Mar 21 12:00:43.033642 (XEN)    0000000000000000 ffff82d040233fe5
> >> ffff83047bec7d48 0000000000000000
> >> Mar 21 12:00:43.033678 (XEN)    0000000000000002 00007fb72767f010
> >> ffff82d0405e9120 0000000000000001
> >> Mar 21 12:00:43.045654 (XEN)    ffff83047bec7e70 ffff82d040240728
> >> 0000000000000007 ffff83023e3b3000
> >> Mar 21 12:00:43.045690 (XEN)    0000000000000246 ffff83023e2efa90
> >> ffff83023e38e000 ffff83023e2efb40
> >> Mar 21 12:00:43.057609 (XEN)    0000000000000007 ffff83023e3afb80
> >> 0000000000000206 ffff83047bec7dc0
> >> Mar 21 12:00:43.069662 (XEN)    0000001600000001 000000000000ffff
> >> e75aaa8d0000000c ac0d6d864e487f62
> >> Mar 21 12:00:43.069697 (XEN)    000000037fa48d76 0000000200000000
> >> ffffffff000003ff 00000002ffffffff
> >> Mar 21 12:00:43.081647 (XEN)    0000000000000000 00000000000001ff
> >> 0000000000000000 0000000000000000
> >> Mar 21 12:00:43.093646 (XEN) Xen call trace:
> >> Mar 21 12:00:43.093677 (XEN)    [<ffff82d04022fe1f>] R
> >> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
> >> Mar 21 12:00:43.093705 (XEN)    [<ffff82d0402302ff>] F
> >> alloc_domheap_pages+0x17d/0x1e4
> >> Mar 21 12:00:43.105652 (XEN)    [<ffff82d0402f626c>] F
> >> hap_set_allocation+0x73/0x23c
> >> Mar 21 12:00:43.105685 (XEN)    [<ffff82d0402f65a0>] F
> >> hap_enable+0x138/0x33c
> >> Mar 21 12:00:43.117646 (XEN)    [<ffff82d040311f8a>] F
> >> paging_enable+0x2d/0x45
> >> Mar 21 12:00:43.117679 (XEN)    [<ffff82d0402bd543>] F
> >> hvm_domain_initialise+0x185/0x428
> >> Mar 21 12:00:43.129652 (XEN)    [<ffff82d04032c524>] F
> >> arch_domain_create+0x3e7/0x4c1
> >> Mar 21 12:00:43.129687 (XEN)    [<ffff82d040206750>] F
> >> domain_create+0x4cc/0x7e2
> >> Mar 21 12:00:43.141665 (XEN)    [<ffff82d040240728>] F
> >> do_domctl+0x1850/0x192d
> >> Mar 21 12:00:43.141699 (XEN)    [<ffff82d04031a96a>] F
> >> pv_hypercall+0x617/0x6b5
> >> Mar 21 12:00:43.153656 (XEN)    [<ffff82d0402012ca>] F
> >> lstar_enter+0x13a/0x140
> >> Mar 21 12:00:43.153689 (XEN)
> >> Mar 21 12:00:43.153711 (XEN)
> >> Mar 21 12:00:43.153731 (XEN) ****************************************
> >> Mar 21 12:00:43.165647 (XEN) Panic on CPU 12:
> >> Mar 21 12:00:43.165678 (XEN) Xen BUG at common/page_alloc.c:1033
> >> Mar 21 12:00:43.165703 (XEN) ****************************************
> >> Mar 21 12:00:43.177633 (XEN)
> >> Mar 21 12:00:43.177662 (XEN) Manual reset required ('noreboot' specifi=
ed)
> >>
> >> The code around the BUG is:
> >>
> >>          /* Reference count must continuously be zero for free pages. =
*/
> >>          if ( (pg[i].count_info & ~PGC_need_scrub) !=3D PGC_state_free=
 )
> >>          {
> >>              printk(XENLOG_ERR
> >>                     "pg[%u] MFN %"PRI_mfn" c=3D%#lx o=3D%u v=3D%#lx t=
=3D%#x\n",
> >>                     i, mfn_x(page_to_mfn(pg + i)),
> >>                     pg[i].count_info, pg[i].v.free.order,
> >>                     pg[i].u.free.val, pg[i].tlbflush_timestamp);
> >>              BUG();
> >>          }
> >>
> >> Now that you are preserving some flags, you also want to modify the
> >> condition. I haven't checked the rest of the code, so there might be
> >> some adjustments necessary.
> >
> > Actually maybe the condition should not be adjusted. I think it would b=
e
> > wrong if a free pages has the flag PGC_extra set. Any thoughts?
>
> I agree, yet I'm inclined to say PGC_extra should have been cleared
> before trying to free the page.

So what to do now? Should I drop this commit?

Thanks.

