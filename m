Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8FE9864AF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804384.1215349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUjz-0005X8-FT; Wed, 25 Sep 2024 16:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804384.1215349; Wed, 25 Sep 2024 16:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUjz-0005Up-Ci; Wed, 25 Sep 2024 16:19:47 +0000
Received: by outflank-mailman (input) for mailman id 804384;
 Wed, 25 Sep 2024 16:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stUjx-0005Uh-Sd
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:19:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8faab2c-7b59-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 18:19:43 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d0d82e76aso2885766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 09:19:43 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f78a1sm223697866b.161.2024.09.25.09.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 09:19:42 -0700 (PDT)
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
X-Inumbo-ID: f8faab2c-7b59-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727281183; x=1727885983; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L10pjNtOTGB1AbMCAXmQMqcO768MO1PVnuUs9U7cYmY=;
        b=Jl/Yi7ETl2FS1nrnJO+dilBEap1+aT2R0/eEPEqvME4M86XvKp+wl8Q1Ld6hk7Dq4u
         tcQcoW07U9j2E0IHsqmwSEVkzPEaFrgF3wfwy/UCKiGmaD58pmHfO3Nj/oUpJv5OzZbm
         wl2TMzSL/bs2WbLrm5doxGuqal78q+lT4MMjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727281183; x=1727885983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L10pjNtOTGB1AbMCAXmQMqcO768MO1PVnuUs9U7cYmY=;
        b=fWq9qBHz/EZqobJ/+ylArm+V4SwRvPJgewW8AfZuZsP2e8R9bXmIczEIbDB5dbN0o7
         UadI/yCgbkRhdJOVXpcmK4oKK4LCtWS66nJvOngueRFRp6JTWy85VUNBlQ6vxvMSl0js
         UC1JOKEq3YRCQyd6Qzi2fWDDmCURFhNTR7aguDY+1sDxB1UPRfYM9BucM0gohuhmdDog
         xU+0prLv2aC/oq4LUw0EzgCiuhUYb7sA/gcdBfhTSuvQ16drTTZzviKX36dyTAs8Mw6z
         cYjwn+bEzLOp/hY3WDVQ+VyPLyoWCkd5QRpkgy4NCW313ebkZeZD/WoKAd1xzl1T0daz
         HoQw==
X-Gm-Message-State: AOJu0YwLKBksI4GJOjzz/h4xUk62TTArLsExpxqOtY7/hdUL02T/qZR5
	DL2b3NJ31ifOMrLLANB3G+m26BIZY16ScOGRe5JcnlXXmZyG7gk8Ue0HATVB7YA=
X-Google-Smtp-Source: AGHT+IFFnV0ZU5MiTAPMxPoN1AeuB1yKQRWrHPXVM8BU6PpdoSWGJZFed+P67CDSy91OSpxUlgAfMw==
X-Received: by 2002:a17:907:9718:b0:a86:8285:24a0 with SMTP id a640c23a62f3a-a93a037ed7emr316053966b.23.1727281182591;
        Wed, 25 Sep 2024 09:19:42 -0700 (PDT)
Date: Wed, 25 Sep 2024 18:19:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/22] x86/hvm: use a per-pCPU monitor table in HAP mode
Message-ID: <ZvQ4HfbsVKmJrl-7@macbook.local>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-14-roger.pau@citrix.com>
 <D3HJ80ZGO0MR.2JCGJIV5JPYQP@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D3HJ80ZGO0MR.2JCGJIV5JPYQP@cloud.com>

On Fri, Aug 16, 2024 at 07:02:54PM +0100, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
> > Instead of allocating a monitor table for each vCPU when running in HVM HAP
> > mode, use a per-pCPU monitor table, which gets the per-domain slot updated on
> > guest context switch.
> >
> > This limits the amount of memory used for HVM HAP monitor tables to the amount
> > of active pCPUs, rather than to the number of vCPUs.  It also simplifies vCPU
> > allocation and teardown, since the monitor table handling is removed from
> > there.
> >
> > Note the switch to using a per-CPU monitor table is done regardless of whether
> 
> s/per-CPU/per-pCPU/

Sorry, I might not has been as consistent as I wanted with using pCPU
everywhere.

> > Address Space Isolation is enabled or not.  Partly for the memory usage
> > reduction, and also because it allows to simplify the VM tear down path by not
> > having to cleanup the per-vCPU monitor tables.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Note the monitor table is not made static because uses outside of the file
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
> >  static bool __initdata opt_altp2m_enabled;
> >  boolean_param("altp2m", opt_altp2m_enabled);
> >  
> > +DEFINE_PER_CPU(root_pgentry_t *, monitor_pgt);
> > +
> > +static int allocate_cpu_monitor_table(unsigned int cpu)
> 
> To avoid ambiguity, could we call these *_pcpu_*() instead?

As replied by Jan, plain 'cpu' is physical CPU on hypervisor code
function names usually.  '_pcpu_' here would IMO imply per-CPU, which
it also is, but likely doesn't need spelling in the function name.

> > +{
> > +    root_pgentry_t *pgt = alloc_xenheap_page();
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
> > +    per_cpu(monitor_pgt, cpu) = pgt;
> > +
> > +    return 0;
> > +}
> > +
> > +static void free_cpu_monitor_table(unsigned int cpu)
> > +{
> > +    root_pgentry_t *pgt = per_cpu(monitor_pgt, cpu);
> > +
> > +    if ( !pgt )
> > +        return;
> > +
> > +    per_cpu(monitor_pgt, cpu) = NULL;
> > +    free_xenheap_page(pgt);
> > +}
> > +
> > +void hvm_set_cpu_monitor_table(struct vcpu *v)
> > +{
> > +    root_pgentry_t *pgt = this_cpu(monitor_pgt);
> > +
> > +    ASSERT(pgt);
> > +
> > +    setup_perdomain_slot(v, pgt);
> 
> Why not modify them as part of write_ptbase() instead? As it stands, it appears
> to be modifying the PTEs of what may very well be our current PT, which makes
> the perdomain slot be in a $DEITY-knows-what state until the next flush
> (presumably the write to cr3 in write_ptbase()?; assuming no PCIDs).
> 
> Setting the slot up right before the cr3 change should reduce the potential for
> misuse.

The reasoning for doing it here it that the per-domain slot only needs
setting on context switch.  In the PV case write_ptbase() will be
called each time the guest switches %cr3, but setting the per-domain
slot is not required for each call if the vCPU hasn't changed.

Let me see if I can arrange for the current contents of
setup_perdomain_slot() to be merged into write_ptbase(). Note
setup_perdomain_slot() started as a wrapper to extract XPTI specific
code from paravirt_ctxt_switch_to().

> > +
> > +    make_cr3(v, _mfn(virt_to_mfn(pgt)));
> > +}
> > +
> > +void hvm_clear_cpu_monitor_table(struct vcpu *v)
> > +{
> > +    /* Poison %cr3, it will be updated when the vCPU is scheduled. */
> > +    make_cr3(v, INVALID_MFN);
> 
> I think this would benefit from more exposition in the comment. If I'm getting
> this right, after descheduling this vCPU we can't assume it'll be rescheduled
> on the same pCPU, and if it's not it'll end up using a different monitor table.
> This poison value is meant to highlight forgetting to set cr3 in the
> "ctxt_switch_to()" path. 

Indeed, we would like to avoid running on a different pCPU while still
using the monitor page-tables from whatever pCPU the vCPU previously
had been running.

> All of that can be deduced from what you wrote and sufficient headscratching
> but seeing how this is invoked from the context switch path it's not incredibly
> clear wether you meant the perdomain slot would be updated by the next vCPU or
> what I stated in the previous paragraph.

No, it's just about not leaving stale values in the vcpu struct.

> Assuming it is as I mentioned, maybe hvm_forget_cpu_monitor_table() would
> convey what it does better? i.e: the vCPU forgets/unbinds the monitor table
> from its internal state.

Right, I assumed that 'clear' already conveyed the concept of
unbinding from a pCPU.  If I use unbind, then I guess I should also
use 'bind' for what I currently call 'set'.

Thanks, Roger.

