Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF6AB96BB
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986396.1371959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpjR-0007cU-Rw; Fri, 16 May 2025 07:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986396.1371959; Fri, 16 May 2025 07:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpjR-0007bG-PC; Fri, 16 May 2025 07:43:49 +0000
Received: by outflank-mailman (input) for mailman id 986396;
 Fri, 16 May 2025 07:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFpjQ-0007bA-4G
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:43:48 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f936475-3229-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 09:43:46 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad4ffb005d8so313380766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:43:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d047ce3sm109933266b.21.2025.05.16.00.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 00:43:45 -0700 (PDT)
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
X-Inumbo-ID: 7f936475-3229-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747381426; x=1747986226; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nKiRQVOiepaLYQVLtxO6y++Y57bVO8/3pPjrMeojVmo=;
        b=l4fGWy00aze374BSMlI0LmHdJWEXcl/y2G8sjRAzV9k5tF89e3XxiBD8aY6AWrYvro
         5gTIGbiE3UnzLEvSky9z1FFkIiV7SO2SpncVsQjuWELOTkzp0QurBuqEWE02aqBldm6Q
         hrolh1D+TFYwnfAp5T/FhMInjhl216aG4ks6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747381426; x=1747986226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKiRQVOiepaLYQVLtxO6y++Y57bVO8/3pPjrMeojVmo=;
        b=QA2qaxeJWgMJm/wTLzMaucdCDVBZs8v6nchQ97wp0AWFRlJuHUNRP8I6vZ+DZxHUtN
         LYKxFCJZ99GrUmM2oTaUka20Ho4X9GcxDcRTqa8vCRKa9Oyg9LomDgAQTJKXLW9WQ4cr
         k2fDyWei//2DCIwE0PkjKh9leCvE7VrPSMgLr35APF0CIT6qDrhOxE4eZXBdPdZY4Pnz
         4emVyeGVCzkJRPdf6yHaLF3YDeXL2PLiv11SnOLVqhm+4OXbDLXup7uvlUXrxH0hnME9
         SzlAm/L/hqjTRONYj6z2+9bHitTLgUIshsbA4PYX74SE+9INXAJeFcnT8d+PaEe6mkSz
         cL5A==
X-Gm-Message-State: AOJu0Yx5+sKUa2AaPe3gq0e06Tu+kIqtUIk5Pcc++XZrmLVmFGBaTvdG
	PcWMufJuiHbOn0LBuu6dC6zgFnKjapM59Xzl3Hl6GJSIF2mKd9C61CFqwXJomH6/HLk=
X-Gm-Gg: ASbGncuyN93Q9zstoUsYqtKgLpvikVeQAaSZ9riz/q224YgG0eF/mVYwN9Q3DQiSKJL
	hxVuo1gGCL1EU9YGIi7ka6zg7rGsIAPLq9XysCFaPYHw6eZO3kiNXD6uHJXMXX0YDdMCHNWKsEp
	0PCKXMLZG4PtQdRErwCBqi+NqEkAjXUcPxMzf7JTjzhCHXUF9/h56lgSLLu9Im3JggUKrzfJHpH
	0jl0dotdzuAbyHIwPM3Zgc5f9MngZmbzrBCIfAnvBCRcecmfWyVlDQro8pqk9efsA45x+recO4W
	wAs/Mc+RrNxqIEZo6NXtwpBaa5jyksTXnrhEEOjM1y6PylWLVoi/Zb22VKGfOGRCiI2HBcLsHlv
	ZUZ3GQlin8Ah2JX44nsE=
X-Google-Smtp-Source: AGHT+IGRZqVoHjqEq9YP2czMe1XofMygBJHtliztJN2Ff/urvb11NPaY7BwWWT38tBYNg3brXN8+gw==
X-Received: by 2002:a17:907:1b08:b0:ad2:43b6:dd75 with SMTP id a640c23a62f3a-ad52d441ffemr238026566b.10.1747381425844;
        Fri, 16 May 2025 00:43:45 -0700 (PDT)
Date: Fri, 16 May 2025 09:43:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/HVM: restrict use of pinned cache attributes as well
 as associated flushing
Message-ID: <aCbssIXqIBDI5C9a@macbook.lan>
References: <42d40da1-bc38-82fb-154a-e1fc876b0c24@suse.com>
 <aCW8RKZZCkvCuw5W@macbook.lan>
 <2032431f-fa8b-47ec-8879-29baadd266bd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2032431f-fa8b-47ec-8879-29baadd266bd@suse.com>

On Fri, May 16, 2025 at 08:54:52AM +0200, Jan Beulich wrote:
> On 15.05.2025 12:04, Roger Pau Monné wrote:
> > On Wed, Mar 22, 2023 at 07:50:09AM +0100, Jan Beulich wrote:
> >> We don't permit use of uncachable memory types elsewhere unless a domain
> >> meets certain criteria. Enforce this also during registration of pinned
> >> cache attribute ranges.
> >>
> >> Furthermore restrict cache flushing to just uncachable range registration.
> >> While there, also
> >> - take CPU self-snoop as well as IOMMU snoop into account (albeit the
> >>   latter still is a global property rather than a per-domain one),
> >> - avoid flushes when the domain isn't running yet (which ought to be the
> >>   common case).
> >>
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> At the expense of yet larger a diff it would be possible to get away
> >> without any "goto", by moving the whole "new entry" handling into the
> >> switch(). Personally I'd prefer that, but the larger diff may be
> >> unwelcome.
> >>
> >> I have to admit that I can't spot what part of epte_get_entry_emt() the
> >> comment refers to that is being deleted. The function does use
> >> hvm_get_mem_pinned_cacheattr(), yes, but there's nothing there that talks
> >> about cache flushes (and their avoiding) in any way.
> >>
> >> Is it really sensible to add/remove ranges once the guest is already
> >> running? (If it is, limiting the scope of the flush would be nice, but
> >> would require knowing dirtyness for the domain wrt the caches, which
> >> currently we don't track.)
> >>
> >> This is kind of amending XSA-428.
> >>
> >> --- a/xen/arch/x86/hvm/mtrr.c
> >> +++ b/xen/arch/x86/hvm/mtrr.c
> >> @@ -589,6 +589,7 @@ int hvm_set_mem_pinned_cacheattr(struct
> >>  {
> >>      struct hvm_mem_pinned_cacheattr_range *range, *newr;
> >>      unsigned int nr = 0;
> >> +    bool flush = false;
> >>      int rc = 1;
> >>  
> >>      if ( !is_hvm_domain(d) )
> >> @@ -612,31 +613,35 @@ int hvm_set_mem_pinned_cacheattr(struct
> >>  
> >>                  type = range->type;
> >>                  call_rcu(&range->rcu, free_pinned_cacheattr_entry);
> >> -                p2m_memory_type_changed(d);
> >>                  switch ( type )
> >>                  {
> >> -                case X86_MT_UCM:
> >> +                case X86_MT_WB:
> >> +                case X86_MT_WP:
> >> +                case X86_MT_WT:
> >>                      /*
> >> -                     * For EPT we can also avoid the flush in this case;
> >> -                     * see epte_get_entry_emt().
> >> +                     * Flush since we don't know what the cachability is going
> >> +                     * to be.
> >>                       */
> >> -                    if ( hap_enabled(d) && cpu_has_vmx )
> >> -                case X86_MT_UC:
> >> -                        break;
> >> -                    /* fall through */
> >> -                default:
> >> -                    flush_all(FLUSH_CACHE);
> >> +                    if ( is_iommu_enabled(d) || cache_flush_permitted(d) )
> >> +                        flush = true;
> >>                      break;
> >>                  }
> >> -                return 0;
> >> +                rc = 0;
> >> +                goto finish;
> >>              }
> >>          domain_unlock(d);
> >>          return -ENOENT;
> >>  
> >>      case X86_MT_UCM:
> >>      case X86_MT_UC:
> >> -    case X86_MT_WB:
> >>      case X86_MT_WC:
> >> +        /* Flush since we don't know what the cachability was. */
> >> +        if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> >> +            return -EPERM;
> >> +        flush = true;
> >> +        break;
> >> +
> >> +    case X86_MT_WB:
> >>      case X86_MT_WP:
> >>      case X86_MT_WT:
> >>          break;
> >> @@ -689,8 +694,12 @@ int hvm_set_mem_pinned_cacheattr(struct
> >>  
> >>      xfree(newr);
> >>  
> >> + finish:
> >>      p2m_memory_type_changed(d);
> >> -    if ( type != X86_MT_WB )
> >> +
> >> +    if ( flush && d->creation_finished &&
> >> +         (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
> >> +          (is_iommu_enabled(d) && !iommu_snoop)) )
> >>          flush_all(FLUSH_CACHE);
> > 
> > I think it would be better if we could add those checks to
> > memory_type_changed() rather than open-coding them here, and just call
> > memory_type_changed() then, which would also avoid the goto AFAICT.
> 
> Hmm, with this last remark, what does "those checks" cover then?

I have a patches I was going to send today (done some overnight
testing) that do:

    if ( cache_flush_permitted(d) &&
         d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) &&
         /*
          * Do the p2m type-change, but skip the cache flush if the domain is
          * not yet running.  The check for creation_finished must strictly be
          * done after the call to p2m_memory_type_changed().
          */
         d->creation_finished &&
         /*
          * The cache flush should be done if either: CPU doesn't have
          * self-snoop in which case there could be aliases left in the cache,
          * or IOMMUs cannot force all DMA device accesses to be snooped.
          */
         (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
          (is_iommu_enabled(d) && !iommu_snoop)) )
    {
        flush_all(FLUSH_CACHE);
    }

As to attempt to limit the cache flushing done in
memory_type_changed().

> I first
> read it as meaning the conditions in just this if(), but the "goto" is
> needed for a different reason.

Maybe I'm missing something, but couldn't
hvm_set_mem_pinned_cacheattr() just call memory_type_changed() (with
the proposed checks above added) if and return then, instead of doing
a goto?

Thanks, Roger.

