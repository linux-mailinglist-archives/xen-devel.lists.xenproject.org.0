Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C614A09A04
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 19:44:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869967.1281409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWJyy-0008ER-5N; Fri, 10 Jan 2025 18:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869967.1281409; Fri, 10 Jan 2025 18:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWJyy-0008CD-2V; Fri, 10 Jan 2025 18:43:44 +0000
Received: by outflank-mailman (input) for mailman id 869967;
 Fri, 10 Jan 2025 18:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWJyw-0008C5-QQ
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 18:43:42 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf610183-cf82-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 19:43:40 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3863703258fso2255835f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 10:43:40 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38f176sm5297229f8f.63.2025.01.10.10.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 10:43:39 -0800 (PST)
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
X-Inumbo-ID: cf610183-cf82-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736534620; x=1737139420; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9RUcgbbd9A2Ysu4ejuh6/L2x2LitZdWVx8FGvddnSeM=;
        b=mOSVgEmcwSYdpL6R6wnoou8KDuwxkDG1PEPhWl6P4lH3aZyURBdCnpLdE4Olrs+lwd
         KD5jp/6Ls2dNTR/vdAKpxgdp2PXbeoEjv5CT/4h6Y5ZP2vCfr+xTolI3QrpUR6CdmMsq
         izjOjCe1ofxYVIlZUdItLl45SolQeSSVoV3aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534620; x=1737139420;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RUcgbbd9A2Ysu4ejuh6/L2x2LitZdWVx8FGvddnSeM=;
        b=I2idBxoioF56MMkRI+IenIrv/uzE/eFkVXDiHCK7EGFMFyX/VkCqJoIORO+h6T/sYq
         1M7os+X0KTCkJiyFKLiUUYL0tZHeKATgYnXtVHa9BscH21TEcbxjbunwyaE9k8h21bn+
         v0KsanpEtmJltBJ0YiGLayU2tMCCtwFV/7mqphFOaleQS+z0d9OQeCVBrNkqTu4CcTG3
         0RPkrNKOHWistK168bUAGlFOK6Y25LI9ufdXz/9ToaSZhzKSLupvP/MhPF06xq+KcRYY
         ot8L3mxF6qAA3jyzO141Tmn22warSZQoiqt+oVgb6AzzTk0/60Q7fa2dUjKKmTHxJJRs
         8tdA==
X-Gm-Message-State: AOJu0YwBPkBDv/NxGgPM9g+INVC04c4/VKxmdrMWeO1aLac67dwrrC9K
	7J/V5xcO1dLttbLUf3sM/kMS9Vex9a7nKeUI9DNwaKNWjoP/EShQaB03YXZWYUU=
X-Gm-Gg: ASbGnctZtT3Ai9MP8nb1P5Uv0sCOWUtr7T26p/EI04OoebbDBlCv1TDa4BAo1kNpEg6
	v+wNGE9NbdVtgTvfVLyFUz/ApIsz6rYsGfoDnt7zL8NNcC1zPkj0jLwG4DOMZL7WCH91keuuXrL
	0QYAhL8cTeY1XJTMg8AzFEQZb9I+Yf2CBSaneVaXaFkE2OhBm/Lnsn7v6dL6Fp9RMNzdOYeZNJO
	siXZ4di1UyUfyGf6oKfOGMvnPkNwEpwP74LyY9pr9+PLkmQsISph3Y/8ao5yA==
X-Google-Smtp-Source: AGHT+IEwPl0S6flCmA6fL+G1MDh2bDhmoJoQTpFxFsc/Kn+K5PV6eReabADsaqtnHYdghASmsasA2w==
X-Received: by 2002:adf:b606:0:b0:38a:8d32:2707 with SMTP id ffacd0b85a97d-38a8d32287cmr5746735f8f.26.1736534620137;
        Fri, 10 Jan 2025 10:43:40 -0800 (PST)
Date: Fri, 10 Jan 2025 19:43:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 15/18] x86/mm: introduce a per-vCPU mapcache when
 using ASI
Message-ID: <Z4FqWkjdmemiJ8Du@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-16-roger.pau@citrix.com>
 <D6XMXUBHE5UI.16YI6AVTYXNUM@cloud.com>
 <Z4E2nhxxIKO8sWoz@macbook.local>
 <D6YJ2L9AFQOQ.2ZZ5H8O4SK9J4@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D6YJ2L9AFQOQ.2ZZ5H8O4SK9J4@cloud.com>

On Fri, Jan 10, 2025 at 04:19:03PM +0000, Alejandro Vallejo wrote:
> On Fri Jan 10, 2025 at 3:02 PM GMT, Roger Pau Monné wrote:
> > On Thu, Jan 09, 2025 at 03:08:15PM +0000, Alejandro Vallejo wrote:
> > > On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > > > When using a unique per-vCPU root page table the per-domain region becomes
> > > > per-vCPU, and hence the mapcache is no longer shared between all vCPUs of a
> > > > domain.  Introduce per-vCPU mapcache structures, and modify map_domain_page()
> > > > to create per-vCPU mappings when possible.  Note the lock is also not needed
> > > > with using per-vCPU map caches, as the structure is no longer shared.
> > > >
> > > > This introduces some duplication in the domain and vcpu structures, as both
> > > > contain a mapcache field to support running with and without per-vCPU
> > > > page-tables.
> > > >
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > >  xen/arch/x86/domain_page.c        | 90 ++++++++++++++++++++-----------
> > > >  xen/arch/x86/include/asm/domain.h | 20 ++++---
> > > >  2 files changed, 71 insertions(+), 39 deletions(-)
> > > >
> > > > diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> > > > index 1372be20224e..65900d6218f8 100644
> > > > --- a/xen/arch/x86/domain_page.c
> > > > +++ b/xen/arch/x86/domain_page.c
> > > > @@ -74,7 +74,9 @@ void *map_domain_page(mfn_t mfn)
> > > >      struct vcpu *v;
> > > >      struct mapcache_domain *dcache;
> > > >      struct mapcache_vcpu *vcache;
> > > > +    struct mapcache *cache;
> > > >      struct vcpu_maphash_entry *hashent;
> > > > +    struct domain *d;
> > > >  
> > > >  #ifdef NDEBUG
> > > >      if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> > > > @@ -85,9 +87,12 @@ void *map_domain_page(mfn_t mfn)
> > > >      if ( !v || !is_pv_vcpu(v) )
> > > >          return mfn_to_virt(mfn_x(mfn));
> > > >  
> > > > -    dcache = &v->domain->arch.pv.mapcache;
> > > > +    d = v->domain;
> > > > +    dcache = &d->arch.pv.mapcache;
> > > >      vcache = &v->arch.pv.mapcache;
> > > > -    if ( !dcache->inuse )
> > > > +    cache = d->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
> > > > +                            : &d->arch.pv.mapcache.cache;
> > > > +    if ( !cache->inuse )
> > > >          return mfn_to_virt(mfn_x(mfn));
> > > >  
> > > >      perfc_incr(map_domain_page_count);
> > > > @@ -98,17 +103,18 @@ void *map_domain_page(mfn_t mfn)
> > > >      if ( hashent->mfn == mfn_x(mfn) )
> > > >      {
> > > >          idx = hashent->idx;
> > > > -        ASSERT(idx < dcache->entries);
> > > > +        ASSERT(idx < cache->entries);
> > > >          hashent->refcnt++;
> > > >          ASSERT(hashent->refcnt);
> > > >          ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
> > > >          goto out;
> > > >      }
> > > >  
> > > > -    spin_lock(&dcache->lock);
> > > > +    if ( !d->arch.vcpu_pt )
> > > > +        spin_lock(&dcache->lock);
> > > 
> > > Hmmm. I wonder whether we might not want a nospec here...
> >
> > Not sure TBH, we have other instances of conditional locking that
> > doesn't use nospec().  That said I'm not claiming those are correct.
> > Shouldn't people that care about this kind of speculation into
> > critical regions just use CONFIG_SPECULATIVE_HARDEN_LOCK?
> >
> > Thanks, Roger.
> 
> Actually, to avoid the double lfence, I think this would work too while
> avoiding the lfence unconditionally when CONFIG_SPECULATIVE_HARDEN_LOCK is not
> set.
> 
>     if ( !d->arch.vcpu_pt )
>         spin_lock(&dcache->lock);
>     else
>         block_lock_speculation();

We have a spin_lock_if() helper to do that.  I will use it here.

Thanks, Roger.

