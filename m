Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B5D95731B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 20:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779923.1189577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg71f-0000hq-HB; Mon, 19 Aug 2024 18:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779923.1189577; Mon, 19 Aug 2024 18:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg71f-0000fk-Dg; Mon, 19 Aug 2024 18:22:43 +0000
Received: by outflank-mailman (input) for mailman id 779923;
 Mon, 19 Aug 2024 18:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/QpF=PS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sg71e-0000fe-Pl
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 18:22:42 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0560d981-5e58-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 20:22:41 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3719f0758c6so1666521f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 11:22:41 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898aada4sm11046823f8f.94.2024.08.19.11.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 11:22:40 -0700 (PDT)
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
X-Inumbo-ID: 0560d981-5e58-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724091761; x=1724696561; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuWbQs0LWXXYw+q6Xew4tYaIWLoo1MsbjHSmYsztmx0=;
        b=eMYISJDLpa+sQrUTmbd9kuPhK37RQx2p1z5C26aL6xV+4pi+px9bwvs8YE4uP6VDAF
         yQa6qyW6ACCrO54s/1pZy1Eo5dTlD+GKptWh3NjmgfRaNkQwmlYN3S46++GmcDV0naXs
         heou0H0h1h7aUEDfrB+OCXBdGIgvurYJlCank=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724091761; x=1724696561;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fuWbQs0LWXXYw+q6Xew4tYaIWLoo1MsbjHSmYsztmx0=;
        b=gVB39OE0+VWpNaDjvaUCfy4FbliilOuNn0PQN+PdtZMdVtsFYQP845SaOFLXMi0W1R
         YvT1mW5wASuH6UJikx1M1McGFSlUHvJdeAxB3lGXA6S//o7ybVSwfpiCmLSYllQQgu0M
         7KXZAb1vt+cbCxqnLYQJOXN9LhyuMsezaQ2uGixpIbMBCGV9saaaAyjfnGxLfXEVuIEA
         AGp8HMBzAJ05wBQ0l9Xf7tSar6edVZ1sOA3P4hrlLF50xJr5Iai8uAXomyIqZ/XS8RNw
         ywl+//sRvPHZSqgzQ7I5A81hvWziHIujn63OiYOo+l85UlCQ/2jYNz4Js19ZemVs+2Ea
         AbZw==
X-Forwarded-Encrypted: i=1; AJvYcCVFCdBc/zil9z/sD3IIrdGiqEu0Gj95XedBXnRSuAyWtjli5p/6KSXJ03jelyzkfDcwM2tNafo2/JvOpQUNFxn581J0hCIu58vaLrZjt/E=
X-Gm-Message-State: AOJu0Ywtgi0nUCN2V/f98sAuOf6hjUgSnpH4TmdnmMjYep3Z1K16Lm8S
	ikpgztsx+NC6htQM5T0lOs+ovQnDvIZe9/dxI209LJVoD/bulszUjCWRki0t1m4=
X-Google-Smtp-Source: AGHT+IHXN4mVBCAXFMVNyjbhtsp6Fa/ZS8zu5efVG+fm6TnCCBE/UaJdwtewTf036w7860CtCUOMQg==
X-Received: by 2002:a5d:6607:0:b0:36d:2941:d531 with SMTP id ffacd0b85a97d-371a746c4a3mr4904733f8f.44.1724091760569;
        Mon, 19 Aug 2024 11:22:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Aug 2024 19:22:36 +0100
Message-Id: <D3K3IQW8N3T4.3SCE11SFGY0ZA@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/22] x86/hvm: use a per-pCPU monitor table in HAP mode
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Roger Pau Monne"
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-14-roger.pau@citrix.com>
 <D3HJ80ZGO0MR.2JCGJIV5JPYQP@cloud.com>
In-Reply-To: <D3HJ80ZGO0MR.2JCGJIV5JPYQP@cloud.com>

On Fri Aug 16, 2024 at 7:02 PM BST, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
> > Instead of allocating a monitor table for each vCPU when running in HVM=
 HAP
> > mode, use a per-pCPU monitor table, which gets the per-domain slot upda=
ted on
> > guest context switch.
> >
> > This limits the amount of memory used for HVM HAP monitor tables to the=
 amount
> > of active pCPUs, rather than to the number of vCPUs.  It also simplifie=
s vCPU
> > allocation and teardown, since the monitor table handling is removed fr=
om
> > there.
> >
> > Note the switch to using a per-CPU monitor table is done regardless of =
whether
>
> s/per-CPU/per-pCPU/
>
> > Address Space Isolation is enabled or not.  Partly for the memory usage
> > reduction, and also because it allows to simplify the VM tear down path=
 by not
> > having to cleanup the per-vCPU monitor tables.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > ---
> > Note the monitor table is not made static because uses outside of the f=
ile
> > where it's defined will be added by further patches.
> > ---
> >  xen/arch/x86/hvm/hvm.c             | 60 ++++++++++++++++++++++++
> >  xen/arch/x86/hvm/svm/svm.c         |  5 ++
> >  xen/arch/x86/hvm/vmx/vmcs.c        |  1 +
> >  xen/arch/x86/hvm/vmx/vmx.c         |  4 ++
> >  xen/arch/x86/include/asm/hap.h     |  1 -
> >  xen/arch/x86/include/asm/hvm/hvm.h |  8 ++++
> >  xen/arch/x86/mm.c                  |  8 ++++
> >  xen/arch/x86/mm/hap/hap.c          | 75 ------------------------------
> >  xen/arch/x86/mm/paging.c           |  4 +-
> >  9 files changed, 87 insertions(+), 79 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 7f4b627b1f5f..3f771bc65677 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -104,6 +104,54 @@ static const char __initconst warning_hvm_fep[] =
=3D
> >  static bool __initdata opt_altp2m_enabled;
> >  boolean_param("altp2m", opt_altp2m_enabled);
> > =20
> > +DEFINE_PER_CPU(root_pgentry_t *, monitor_pgt);
> > +
> > +static int allocate_cpu_monitor_table(unsigned int cpu)
>
> To avoid ambiguity, could we call these *_pcpu_*() instead?
>
> > +{
> > +    root_pgentry_t *pgt =3D alloc_xenheap_page();
> > +
> > +    if ( !pgt )
> > +        return -ENOMEM;
> > +
> > +    clear_page(pgt);
> > +
> > +    init_xen_l4_slots(pgt, _mfn(virt_to_mfn(pgt)), INVALID_MFN, NULL,
> > +                      false, true, false);
> > +
> > +    ASSERT(!per_cpu(monitor_pgt, cpu));
> > +    per_cpu(monitor_pgt, cpu) =3D pgt;
> > +
> > +    return 0;
> > +}
> > +
> > +static void free_cpu_monitor_table(unsigned int cpu)
> > +{
> > +    root_pgentry_t *pgt =3D per_cpu(monitor_pgt, cpu);
> > +
> > +    if ( !pgt )
> > +        return;
> > +
> > +    per_cpu(monitor_pgt, cpu) =3D NULL;
> > +    free_xenheap_page(pgt);
> > +}
> > +
> > +void hvm_set_cpu_monitor_table(struct vcpu *v)
> > +{
> > +    root_pgentry_t *pgt =3D this_cpu(monitor_pgt);
> > +
> > +    ASSERT(pgt);
> > +
> > +    setup_perdomain_slot(v, pgt);
>
> Why not modify them as part of write_ptbase() instead? As it stands, it a=
ppears
> to be modifying the PTEs of what may very well be our current PT, which m=
akes
> the perdomain slot be in a $DEITY-knows-what state until the next flush
> (presumably the write to cr3 in write_ptbase()?; assuming no PCIDs).
>
> Setting the slot up right before the cr3 change should reduce the potenti=
al for
> misuse.
>
> > +
> > +    make_cr3(v, _mfn(virt_to_mfn(pgt)));
> > +}
> > +
> > +void hvm_clear_cpu_monitor_table(struct vcpu *v)
> > +{
> > +    /* Poison %cr3, it will be updated when the vCPU is scheduled. */
> > +    make_cr3(v, INVALID_MFN);
>
> I think this would benefit from more exposition in the comment. If I'm ge=
tting
> this right, after descheduling this vCPU we can't assume it'll be resched=
uled
> on the same pCPU, and if it's not it'll end up using a different monitor =
table.
> This poison value is meant to highlight forgetting to set cr3 in the
> "ctxt_switch_to()" path.=20
>
> All of that can be deduced from what you wrote and sufficient headscratch=
ing
> but seeing how this is invoked from the context switch path it's not incr=
edibly
> clear wether you meant the perdomain slot would be updated by the next vC=
PU or
> what I stated in the previous paragraph.
>
> Assuming it is as I mentioned, maybe hvm_forget_cpu_monitor_table() would
> convey what it does better? i.e: the vCPU forgets/unbinds the monitor tab=
le
> from its internal state.
>
> Cheers,
> Alejandro

After playing with the code for a while I'm becoming increasingly convinced
that we don't want to tie hvm_clear_cpu_monitor_table() to the ctx_switch_t=
o
handlers at all. In __context_switch() we would ideally like to delay resto=
ring
the state until after said state is available in the page tables (i.e: afte=
r
write_ptbase()).

With that division we can do saves and restores with far less headaches as =
we
can assume that the pcpu fixmap always contains the relevant data.

Cheers,
Alejandro



