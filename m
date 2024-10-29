Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F99B464C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827194.1241732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5j17-0001Gr-Gz; Tue, 29 Oct 2024 10:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827194.1241732; Tue, 29 Oct 2024 10:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5j17-0001Cd-EJ; Tue, 29 Oct 2024 10:00:01 +0000
Received: by outflank-mailman (input) for mailman id 827194;
 Tue, 29 Oct 2024 10:00:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzX=RZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5j16-000166-Nj
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:00:00 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e721426-95dc-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 10:59:58 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a26a5d6bfso807761766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 02:59:58 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dec8100sm456069366b.6.2024.10.29.02.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 02:59:58 -0700 (PDT)
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
X-Inumbo-ID: 8e721426-95dc-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730195998; x=1730800798; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mCpd6bfy0g+oKX+yAkpACTUF9tFkdar8E5inKftuhLM=;
        b=KeR+L1tecUj6lAgun633BHYu1K6MB8Q0WK4jtV0bO325IfjamfeMROsKpP1ZWmJCqO
         IuKpmJnU00eStyr6O+wZHCenTaSCi8W738I1NKGf1CmoqmzvdgOrFnvo+4rQJUToLbvz
         a2LMLM592W+gSGWshjAuAKrYqmJAOCBVjpOR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730195998; x=1730800798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCpd6bfy0g+oKX+yAkpACTUF9tFkdar8E5inKftuhLM=;
        b=r0hmd+JROVeD+KhiaU4KxuQByCqlHJb2QB3tFIAlHGBUTRkMI5/O73R40DAEvSdqH3
         yZpHAMhJQPuVMKbzCcokW46g1yIWR471wXGYeBT5Dl+ZbsmZJMolStQz0+kA3z/wEuSU
         zuj4nuEZNGobxWEpOGgGfax/ZWbrmazXS8pXlfvHcfDQ/t0sYozSGxRdsCZFG4YR7mA3
         uTMrzJ1td5pMlx/adDoT+GVdd3HqpR+4WQ3XuQZs537lSegbEOpe9XMFOorNLbbPpHuU
         A/r6dl2Gsybg6Ju/ii0FBZrlu6af6hX7cuHFb3c5q/a1r93pORh+AAD6w2aa9NV5mbO8
         tnSQ==
X-Gm-Message-State: AOJu0Yw34V5QJPZrtHb6TiIty0ws/LVmlGZ8q4Kb8rgJOcrqEoNVeM8L
	UFX26SInwZzbQ13H9o9qQBN5e4Y0W+Xv8iaD7H6C5MwJt16vmoBc9nyobAC3nnQ=
X-Google-Smtp-Source: AGHT+IE3Tnh0/ujj/wnKDmHVO5e0Bhy/fxylP+GpA+w1XjCsV84NYoCqa7Ispi6M2fcDanHL59ZW9w==
X-Received: by 2002:a17:907:6d09:b0:a99:f887:ec09 with SMTP id a640c23a62f3a-a9de5ecade8mr1033413866b.35.1730195998294;
        Tue, 29 Oct 2024 02:59:58 -0700 (PDT)
Date: Tue, 29 Oct 2024 10:59:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/pv: gate setting per-domain slot to XPTI being
 active for the domain
Message-ID: <ZyCyHetxVah1KxZ4@macbook>
References: <20241029094254.38659-1-roger.pau@citrix.com>
 <36f09f1a-4a0d-4dbf-a529-c4923349628f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36f09f1a-4a0d-4dbf-a529-c4923349628f@citrix.com>

On Tue, Oct 29, 2024 at 09:48:26AM +0000, Andrew Cooper wrote:
> On 29/10/2024 9:42 am, Roger Pau Monne wrote:
> > It's possible to have XPTI not active for all PV domains (active for domUs,
> > inactive for dom0), hence don't gate setting the per-domain slot on the
> > presence of the per-pCPU shadow root page-table.  Instead set the slot based on
> > whether XPTI is active for the domain.  This avoid pointlessly setting the
> > per-domain slot if the shadow root page-table won't be used by the domain.
> >
> > Fixes: 0d3e7f0b6bf0 ('xen/x86: support per-domain flag for xpti')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/domain.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 78a13e6812c9..fd6bb3663027 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -1902,12 +1902,11 @@ void cf_check paravirt_ctxt_switch_from(struct vcpu *v)
> >  
> >  void cf_check paravirt_ctxt_switch_to(struct vcpu *v)
> >  {
> > -    root_pgentry_t *root_pgt = this_cpu(root_pgt);
> > +    const struct domain *d = v->domain;
> >  
> > -    if ( root_pgt )
> > -        root_pgt[root_table_offset(PERDOMAIN_VIRT_START)] =
> > -            l4e_from_page(v->domain->arch.perdomain_l3_pg,
> > -                          __PAGE_HYPERVISOR_RW);
> > +    if ( d->arch.pv.xpti )
> > +        this_cpu(root_pgt)[root_table_offset(PERDOMAIN_VIRT_START)] =
> > +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
> 
> I'm not sure this is a wise change.
> 
> You're only optimising away a single PTE calculation/write, at the cost
> of retaining a mapping to the wrong domain's perdom area; whichever the
> last domain to schedule on this pCPU was.

If XPTI is not used by the next vCPU there will be plenty of stale
mappings in the shadow root_pgt, as it won't be updated on return to
guest context because it's not used.  All guest controlled slots will
be outdated.

Note that currently if the next vCPU is HVM the slot won't get updated
either, as context switching to an HVM vCPU won't call
paravirt_ctxt_switch_to().

I don't think updating the per-domain slot makes any sense if the
root_pgt won't be used by the vCPU.

Thanks, Roger.

