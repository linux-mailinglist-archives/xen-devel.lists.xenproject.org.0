Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AA2AD38F9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010920.1389171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyxj-0002Z2-1B; Tue, 10 Jun 2025 13:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010920.1389171; Tue, 10 Jun 2025 13:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyxi-0002WP-Ub; Tue, 10 Jun 2025 13:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1010920;
 Tue, 10 Jun 2025 13:24:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnHp=YZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uOyxg-0002WD-NH
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:24:20 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3700cc6c-45fe-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:24:19 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450cf214200so50672385e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:24:19 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a53244f07dsm12490714f8f.79.2025.06.10.06.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:24:18 -0700 (PDT)
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
X-Inumbo-ID: 3700cc6c-45fe-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749561859; x=1750166659; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EgP7TvOVxTD2h/sls15DC30PgtzRWFjQ5PWHsWNoWUw=;
        b=lxLdnIrtpN1huw3n2Cyj0y9NLGoWWfQNPtzkB9cMBX64akmHjkgd9z6p1U1LdRX7R6
         yTNODcL+h4vHDrSTM3NzLsv9tuoEKBlwiOrXSENdnskgcMiaz1H8mr38dkfdEOqdPPRQ
         K5y+k5hH4TfTf68RFoIyVKPd/Wrf4CVIDD+b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561859; x=1750166659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgP7TvOVxTD2h/sls15DC30PgtzRWFjQ5PWHsWNoWUw=;
        b=nCgJS/v828wpB4/z4dPsT/5bAJpYpFucGcoX2mwOdQiUvN9o5J5QgcFuFcV+T68oPx
         7abWTwfMrTHPiDQm9jw3ZgUm34YZlCeuxMWejSyR9EzAmTqQUvk+DaPx0TnIh7N8B7mk
         lt0AlMEDbTakjPcp7Th6p3eD7l9rOInhR/4ce4R60rOB21HNj6vHZqjWEq/NZ4euRIv/
         xVsoSAf30pPWwgcShEh4cZ/ooNj60N9iPUt6ebN18WOtGYCOdioiNzNGaXSpJQtwEXcJ
         81XteRuDT4uGvfl15DdB4ngm59AX4IvW3GWYtN94+4MEfaBzxASsA/hyYcZyd6rL+M/p
         usdA==
X-Gm-Message-State: AOJu0YzAkGTIyihiJLlT7CXhL0NszNgZKEut67IYG7CJvMod8Ys7oIAa
	QohdUK3Mhf3nWo+hy4LLtKRBuJMSiMYqXVGyinuwJpTvD6vFaFPMxhmz/zDFXGUuj2/1vb6g4n0
	v2hfG
X-Gm-Gg: ASbGncsSNTZrmsAWgYppNYIvLPfGenTJ3x3D3RLEUMGlJwyQSlufwz8uLvluniU19Gx
	0BwUAXXll5zYGPJevSlDuW9FITR7tqalkdhSp/FlJtl4CbF7HxOEq7hwcg7gYebosI23XaiHFja
	BNtf0sOdNKfvLb1Z6lWAeSOIB/VNwg7qE8/Y5qJgwm5ZUBt4A+wIKzGiboUdCBkkva/dvTlvuYY
	KXSHW46ApO7W9i/MTwTgHaTl0zVHrSmUbR6mov6jgp0+9pCyDeibSRmINnQs803NRkMIjds6Dcw
	yjwGa459f/B9JVaj0Wz1OqKGrdzCgv5OVQm6m9BdJwPK2rLl78IJN4CzxYsMwmgBSLtPbdAfQbP
	Jt9DRrr0FH4smsDL5tvHEis23wJWFpQ==
X-Google-Smtp-Source: AGHT+IGpqvy7dm5XAcw5ASv7YmrVms1L6JEiggGXKssJeqAktc0oJJj6VLjIdE3guhX+/hopIQGd4w==
X-Received: by 2002:a05:6000:24c8:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3a531ab73f7mr15401271f8f.46.1749561858865;
        Tue, 10 Jun 2025 06:24:18 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:24:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
Message-ID: <aEgyAaHxC-Um1pNj@macbook.local>
References: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
 <aEa5J_TlSAdS9-m_@macbook.local>
 <6e9e84eb-f98b-4c06-8952-03aecc82c0ea@suse.com>
 <aEgMe1i4Rpmnz8M9@macbook.local>
 <5f8d694f-e712-4869-879f-80b2c4907a45@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f8d694f-e712-4869-879f-80b2c4907a45@suse.com>

On Tue, Jun 10, 2025 at 01:59:52PM +0200, Jan Beulich wrote:
> On 10.06.2025 12:44, Roger Pau Monné wrote:
> > On Tue, Jun 10, 2025 at 09:40:38AM +0200, Jan Beulich wrote:
> >> On 09.06.2025 12:36, Roger Pau Monné wrote:
> >>> On Wed, Jun 04, 2025 at 11:48:00AM +0200, Jan Beulich wrote:
> >>>> @@ -605,31 +606,35 @@ int hvm_set_mem_pinned_cacheattr(struct
> >>>>  
> >>>>                  type = range->type;
> >>>>                  call_rcu(&range->rcu, free_pinned_cacheattr_entry);
> >>>> -                p2m_memory_type_changed(d);
> >>>>                  switch ( type )
> >>>>                  {
> >>>> -                case X86_MT_UCM:
> >>>> +                case X86_MT_WB:
> >>>> +                case X86_MT_WP:
> >>>> +                case X86_MT_WT:
> >>>>                      /*
> >>>> -                     * For EPT we can also avoid the flush in this case;
> >>>> -                     * see epte_get_entry_emt().
> >>>> +                     * Flush since we don't know what the cachability is going
> >>>> +                     * to be.
> >>>>                       */
> >>>> -                    if ( hap_enabled(d) && cpu_has_vmx )
> >>>> -                case X86_MT_UC:
> >>>> -                        break;
> >>>> -                    /* fall through */
> >>>> -                default:
> >>>> -                    flush_all(FLUSH_CACHE);
> >>>> +                    if ( is_iommu_enabled(d) || cache_flush_permitted(d) )
> >>>> +                        flush = true;
> >>>
> >>> Is the check here required?  memory_type_changed() will already check
> >>> for is_iommu_enabled() and cache_flush_permitted(), and hence you
> >>> could just set flush to true unconditionally here IMO.
> >>
> >> The behavioral difference is when both predicates are false: The way I have
> >> it now, p2m_memory_type_changed() will then still be called (conditionally),
> >> better matching prior behavior.
> > 
> > I see.  Yes, p2m_memory_type_changed() needs to be called.

This is complicated.  Looking at memory_type_changed() it's true that
p2m_memory_type_changed() will only be called when
cache_flush_permitted() == true, however by cache_flush_permitted()
returning false we could also imply that there are no p2m_mmio_direct
entries in the p2m, and hence effectively nothing to flush?

> >>
> >>>>                      break;
> >>>>                  }
> >>>> -                return 0;
> >>>> +                rc = 0;
> >>>> +                goto finish;
> >>>>              }
> >>>>          domain_unlock(d);
> >>>>          return -ENOENT;
> >>>>  
> >>>>      case X86_MT_UCM:
> >>>>      case X86_MT_UC:
> >>>> -    case X86_MT_WB:
> >>>>      case X86_MT_WC:
> >>>> +        /* Flush since we don't know what the cachability was. */
> >>>> +        if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> >>>> +            return -EPERM;
> > 
> > When assigning IO resources without an IOMMU enabled we likely need
> > to allow the pinned cache attributes to be set, but there's no need to
> > propagate the changes to the p2m, as the EMT calculation won't take
> > into account the pinned attributes.
> 
> Why would it not do so? Am I overlooking a conditional there that would
> cause hvm_get_mem_pinned_cacheattr() to not be called? The only related
> one I see is
> 
>     if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
>          !cache_flush_permitted(d) )

Sorry, what I wrote is nonsense.  I wanted to note that it should be
possible to set cache attributes ahead of assigning IO resources, and
so returning -EPERM might alter existing users of the interface.

However setting cache attributes ahead of having actually assigned IO
resources would seem like an out of order operation logic, and hence
there's no point in supporting it.

> covering the without-IOMMU case just the same as the "with" one. (The
> "without" case looks dubious to me, as I don't think we arrange for
> any identity mapping, but that's a separate topic.)
> 
> > IOW: I don't think we can safely short-circuit and return -EPERM here
> > without agreeing that it's a behavioral difference form the previous
> > implementation.
> 
> There's no question there is a behavioral change here. Without I/O
> resources (and without IOMMU) we simply don't accept cache attributes
> other then WB elsewhere; the change is to avoid doing so here as well,
> to get things to be consistent. Hence the -EPERM return.
> 
> >>>> @@ -682,9 +687,11 @@ int hvm_set_mem_pinned_cacheattr(struct
> >>>>  
> >>>>      xfree(newr);
> >>>>  
> >>>> -    p2m_memory_type_changed(d);
> >>>> -    if ( type != X86_MT_WB )
> >>>> -        flush_all(FLUSH_CACHE);
> >>>> + finish:
> >>>> +    if ( flush )
> >>>> +        memory_type_changed(d);
> >>>> +    else if ( d->vcpu && d->vcpu[0] )
> >>>> +        p2m_memory_type_changed(d);
> >>>
> >>> FWIW, I would just call memory_type_changed() unconditionally
> >>> regardless of the change.
> >>
> >> In which case the need for the "flush" local var would go away, if I
> >> understand your suggestion correctly. Like above, there'll then be
> >> more of a behavioral change than intended. In particular ...
> > 
> > There will be a behavioral change, but not one that the guest would
> > notice IMO.
> > 
> >>>  We suspect the hypercall is only used at
> >>> domain creation time (where memory_type_changed() won't do a cache
> >>> flush anyway).
> >>
> >> ... "suspect" is not enough for my taste. The only alternative there
> >> that I see (as mentioned in a post-commit-message remark) is to
> >> refuse such "late" changes altogether. Yet for that we need to be
> >> sure, which it looks like no-one of us is.
> > 
> > Why do you say only alternative?
> 
> Oh, sorry, I meant "only" just in regard to options keeping the main
> code structure of the change. I agree ...
> 
> > Calling memory_type_changed() unconditionally (without taking into
> > account the previous or new cache attributes) would also be an
> > acceptable solution, that might wide the cache flushing a bit, but
> > would still be correct and much simpler IMO.
> 
> ... that this, too, is a possibility. It would, however, go against the
> stated purpose of the change (in the subject "... as well as associated
> flushing"), which - after all - was the main goal here, seeing the
> series this was originally part of.

Given the recently added logic in memory_type_changed() to limit the
flushing, I'm not sure it would go against the patch subject.  Just
using memory_type_changed() as-is will already prevent flushing when
the guest is not yet started, and would also limit the flushing to the
cases where snooping accesses cannot be forced from the IOMMU.
It will mostly likely result in a reduction of the flushing, even if
the attribute type checking was removed.

IMO the added complexity here is not worth the performance
improvement, not without a clear justification that it's needed.

Thanks, Roger.

