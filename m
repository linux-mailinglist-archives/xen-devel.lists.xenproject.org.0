Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B943EAD33E1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 12:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010686.1388858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOwSm-0007Qw-LT; Tue, 10 Jun 2025 10:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010686.1388858; Tue, 10 Jun 2025 10:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOwSm-0007Ok-Hi; Tue, 10 Jun 2025 10:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1010686;
 Tue, 10 Jun 2025 10:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnHp=YZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uOwSk-0007Oe-Ot
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 10:44:14 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9780688-45e7-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 12:44:13 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so3552554f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 03:44:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4521375b5e1sm139079185e9.37.2025.06.10.03.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 03:44:12 -0700 (PDT)
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
X-Inumbo-ID: d9780688-45e7-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749552253; x=1750157053; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XHlXqnj3di+1NstG3GDVx/HOeqSCRdzBnhKtBH49vU0=;
        b=brK8MMEl6OH9WJF0kF/ygJu70U3XcPnNPNPxtWeve5eRVjtCJzBOFWEc/HFpMtBf1l
         V+80dpKJJopB4VRRptOFBOBo2twqeEGY9djTtRHKkRSyJCUScbYp3RaIFwDDUgwvzKFc
         D4ufLcU13l+NPYo9J/PInrwu7bhUWocvtFSgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552253; x=1750157053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHlXqnj3di+1NstG3GDVx/HOeqSCRdzBnhKtBH49vU0=;
        b=odlUWw4JGyn560jJEHllcnIC+RwZpau50svMA+DkdqzWnkesyiLCeOX8XgcWS9QRG4
         iND5dzwUwa4NT13idkU54ieLge3u4YEJiCkN3OjZMIti3KkjlXc7PhBRMtLhU+7O6Cr0
         +PnbSqYkPPcxNr8hXtYHLZd2rclh5j3Pv9bsLIFAbxV7YCP+CPoJDDJ1jaMeQhrhnmE4
         hDhaox7rCgJc8+sDGlJKTxZeZhZfkue4hHleOE91j8gY4ipQ4WXOj8+3TShnaVEc+RQ+
         lG1DwJcRBJoCPM28bliFtkbi5XyWxbTXs33zXuX2OJhBiFiKeNSkj5qUrMbv0mKzJiEp
         yFkw==
X-Gm-Message-State: AOJu0YwCMns7d5P8VxjnQ/KB1kPJfRFlQmSK0YHgnakOM9BS2pjVXckZ
	CVPCfl2cCdCtE5b0j07NMx7r8HoEStPchAab0smgOhN4gPX7O9C8tHDod7qsrqML6aI=
X-Gm-Gg: ASbGnctr+qZ5aGbJcSX7nXuypEaDKqaSTeJ98V3qDr219fCThKDJooXbz2lhyVb+3vG
	+aMsK1rldpUlxwINmdVkmGzHFmfqqGWhLLcIoNiYOWeNMrRVB56vpmA2vM375rziZZh5oK4P1nq
	fZC2PSqJrxjb2DqYX/HDjI0Tx1NjeNiUA9R4w/kCqOjSgYnLHLn2amP0KnYhP11Tk2BcOD+hzV6
	Oir7a/NslKHwrfquCiLQYVSDQICmlO1Uy23/Pc7ZMmVUgx8BjR1hY0BvSYbCbhmjXiQVlvHApE+
	Ck1LFhAGHm1sHSSSTZ3EWlJzj1m3iEVWvOWHdEJq7LIklgcxtnVDVV0IvuGNBxSfCnLxbFQ+ryw
	qIbe+EDrsayaHCO2aOff1+VIpEQL5Z8uvRGk=
X-Google-Smtp-Source: AGHT+IEbQ7b51Fk8Szk9nvVfHxMETQT7gRi1ktDmQmxnlznR4WhNe8rnJ+Wbkftsda3ZbRP93ugg6g==
X-Received: by 2002:a5d:588a:0:b0:3a5:2e9c:edc with SMTP id ffacd0b85a97d-3a531886a28mr13142012f8f.34.1749552253130;
        Tue, 10 Jun 2025 03:44:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:44:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
Message-ID: <aEgMe1i4Rpmnz8M9@macbook.local>
References: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
 <aEa5J_TlSAdS9-m_@macbook.local>
 <6e9e84eb-f98b-4c06-8952-03aecc82c0ea@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e9e84eb-f98b-4c06-8952-03aecc82c0ea@suse.com>

On Tue, Jun 10, 2025 at 09:40:38AM +0200, Jan Beulich wrote:
> On 09.06.2025 12:36, Roger Pau Monné wrote:
> > On Wed, Jun 04, 2025 at 11:48:00AM +0200, Jan Beulich wrote:
> >> @@ -605,31 +606,35 @@ int hvm_set_mem_pinned_cacheattr(struct
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
> > 
> > Is the check here required?  memory_type_changed() will already check
> > for is_iommu_enabled() and cache_flush_permitted(), and hence you
> > could just set flush to true unconditionally here IMO.
> 
> The behavioral difference is when both predicates are false: The way I have
> it now, p2m_memory_type_changed() will then still be called (conditionally),
> better matching prior behavior.

I see.  Yes, p2m_memory_type_changed() needs to be called.

> 
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

When assigning IO resources without an IOMMU enabled we likely need
to allow the pinned cache attributes to be set, but there's no need to
propagate the changes to the p2m, as the EMT calculation won't take
into account the pinned attributes.

IOW: I don't think we can safely short-circuit and return -EPERM here
without agreeing that it's a behavioral difference form the previous
implementation.

> >> +        flush = true;
> >> +        break;
> >> +
> >> +    case X86_MT_WB:
> >>      case X86_MT_WP:
> >>      case X86_MT_WT:
> >>          break;
> >> @@ -682,9 +687,11 @@ int hvm_set_mem_pinned_cacheattr(struct
> >>  
> >>      xfree(newr);
> >>  
> >> -    p2m_memory_type_changed(d);
> >> -    if ( type != X86_MT_WB )
> >> -        flush_all(FLUSH_CACHE);
> >> + finish:
> >> +    if ( flush )
> >> +        memory_type_changed(d);
> >> +    else if ( d->vcpu && d->vcpu[0] )
> >> +        p2m_memory_type_changed(d);
> > 
> > FWIW, I would just call memory_type_changed() unconditionally
> > regardless of the change.
> 
> In which case the need for the "flush" local var would go away, if I
> understand your suggestion correctly. Like above, there'll then be
> more of a behavioral change than intended. In particular ...

There will be a behavioral change, but not one that the guest would
notice IMO.

> >  We suspect the hypercall is only used at
> > domain creation time (where memory_type_changed() won't do a cache
> > flush anyway).
> 
> ... "suspect" is not enough for my taste. The only alternative there
> that I see (as mentioned in a post-commit-message remark) is to
> refuse such "late" changes altogether. Yet for that we need to be
> sure, which it looks like no-one of us is.

Why do you say only alternative?

Calling memory_type_changed() unconditionally (without taking into
account the previous or new cache attributes) would also be an
acceptable solution, that might wide the cache flushing a bit, but
would still be correct and much simpler IMO.

Thanks, Roger.

