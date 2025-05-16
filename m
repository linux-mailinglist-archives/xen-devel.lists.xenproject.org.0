Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2FAAB97A3
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986531.1372080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqQ6-0003MH-NN; Fri, 16 May 2025 08:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986531.1372080; Fri, 16 May 2025 08:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqQ6-0003Jx-Jo; Fri, 16 May 2025 08:27:54 +0000
Received: by outflank-mailman (input) for mailman id 986531;
 Fri, 16 May 2025 08:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFqQ4-0003Jo-Vp
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:27:53 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4eab432-322f-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 10:27:47 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22e70a9c6bdso26140475ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:27:47 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-231d4b04a52sm9698075ad.91.2025.05.16.01.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 01:27:44 -0700 (PDT)
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
X-Inumbo-ID: a4eab432-322f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747384065; x=1747988865; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=No2J97VVo34lpGPj1OLahXjfVgF6G6x9vrV27z9sLa8=;
        b=OejU0vJTztMLn3Tm4qFS2CofNH87gDL9+mHz11wqV6pUFYkMeWS+fnbFTUtqzDxypA
         QwSP8AvhWBsb3Im4k0P6ClFAxvXnRJ1i0wqvjJsUplgQhDpu91XBCulPK86nuva8Pa+Z
         A7bcakSmNAnpEzTQlwfCzrPO2aqygAMoCDsww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747384065; x=1747988865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=No2J97VVo34lpGPj1OLahXjfVgF6G6x9vrV27z9sLa8=;
        b=E/kFqXdEcyww9+8O+zOJjYYJzinXTDQsq08wb6Kme78XQUUBWykTHqH7EAlBl5axDu
         W3zmTmE91LF98HnrRaPmlljCX2Hd0zf1nxZNEAaO8EcNUggPHARpRvz8NfKsTjZLkfMW
         +BaEeFYJdj4blFzJcWcm2/6tTLnJE7wRzcv9LaMjR2rQhCYq5u/zxMgXbxif9ZtZ9x93
         lm5Yjd3yzmzvIOOuDsygXu8lcAa6lr8SLuITslLiKm3bHpGozD31KCm/s67U3h+ThOnD
         shbnCJJmoJxcHX0YT1GjpWyTee7xQPCuKfZl3Lcgfe0iLSOSRPkxCYgJGHdlVjYtT7Fv
         zD/A==
X-Forwarded-Encrypted: i=1; AJvYcCVMCft55HfooEo3xdHJecQ8HerU5pc3m8y2xXCH+kp0KZ6D1A2MHu0HzEidMzCs0mV5nLft4X9+TMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOxAQOLv+T/ev4ekpcFghWIvRAT6KeVaOEkyEruhVDvCo7+sFm
	VtfRqedzQq1BwMoKz7j3ITiElRa94b6C1bVHXDvGP4eMlT7nWbObarVyhf3SksW46W4=
X-Gm-Gg: ASbGncuMpcrDvrQ8vBuQKGmZUYqxoRhJ+hGxQltEkYT33HQcVzqUZXHc6zzD1GnK8uW
	wqVMuRJkRZyw/dbJCfqqwCPEqKWjhE9P1z8xYf6AyRqbHOpxzG4jqCr1YzUqSUNXF2GoOrc/Sit
	PV1daaesJ3YFdFxTvRUkH90BKrXPJA7rtIz1NovSWFJB7vneMGwW3yVp4GpnDvHbfSAah3MHvI0
	rGe8pxNqn+B8a4dTZWiJsQl3K6XR/OrYEa/JV0rjBd6z1eRwjNsnW+PfLaJahjeIrgBt1MVEEI8
	QN5AxA/FkVUZsr0t1xIGwZTSUrp4zwm+5St1ExC6tndCuRrtoXl/ZwoCRgX8SxYTAgHdlRJx4wn
	KpMiHsWye87qel3wy6CA=
X-Google-Smtp-Source: AGHT+IF9k9eYvlatFMJyw5kjCvOKBEZ3ZMiV/65/eNBcn23g/m3iQVS3b+FmJgMr8E9KzOazTtuYoA==
X-Received: by 2002:a17:903:94e:b0:224:910:23f0 with SMTP id d9443c01a7336-231d45bcdffmr32424475ad.49.1747384065191;
        Fri, 16 May 2025 01:27:45 -0700 (PDT)
Date: Fri, 16 May 2025 10:27:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
Message-ID: <aCb2-6hIlYQ8V0NG@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-8-roger.pau@citrix.com>
 <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>
 <aCXB5zpqGfBrPTZy@macbook.lan>
 <205a65d3-92bd-4281-8605-758ca03fcac5@suse.com>
 <aCbxMF9Uj4eBPMAf@macbook.lan>
 <9db4a2ce-ba06-42a1-b6e6-7d0c2b59c0c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9db4a2ce-ba06-42a1-b6e6-7d0c2b59c0c3@suse.com>

On Fri, May 16, 2025 at 10:08:35AM +0200, Jan Beulich wrote:
> On 16.05.2025 10:02, Roger Pau Monné wrote:
> > On Fri, May 16, 2025 at 09:07:43AM +0200, Jan Beulich wrote:
> >> On 15.05.2025 12:28, Roger Pau Monné wrote:
> >>> On Mon, May 12, 2025 at 05:16:02PM +0200, Jan Beulich wrote:
> >>>> On 06.05.2025 10:31, Roger Pau Monne wrote:
> >>>>> To better describe the underlying implementation.  Define
> >>>>> cache_flush_permitted() as an alias of has_arch_io_resources(), so that
> >>>>> current users of cache_flush_permitted() are not effectively modified.
> >>>>>
> >>>>> With the introduction of the new handler, change some of the call sites of
> >>>>> cache_flush_permitted() to instead use has_arch_io_resources() as such
> >>>>> callers are not after whether cache flush is enabled, but rather whether
> >>>>> the domain has any IO resources assigned.
> >>>>>
> >>>>> Take the opportunity to adjust l1_disallow_mask() to use the newly
> >>>>> introduced has_arch_io_resources() macro.
> >>>>
> >>>> While I'm happy with everything else here, to me it's at least on the
> >>>> edge whether cache_flush_permitted() wouldn't be the better predicate
> >>>> to use there, for this being about ...
> >>>>
> >>>>> --- a/xen/arch/x86/mm.c
> >>>>> +++ b/xen/arch/x86/mm.c
> >>>>> @@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
> >>>>>  
> >>>>>  #define l1_disallow_mask(d)                                     \
> >>>>>      (((d) != dom_io) &&                                         \
> >>>>> -     (rangeset_is_empty((d)->iomem_caps) &&                     \
> >>>>> -      rangeset_is_empty((d)->arch.ioport_caps) &&               \
> >>>>> +     (!has_arch_io_resources(d) &&                              \
> >>>>>        !has_arch_pdevs(d) &&                                     \
> >>>>>        is_pv_domain(d)) ?                                        \
> >>>>>       L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
> >>>>
> >>>> ... cachability, which goes hand in hand with the ability to also
> >>>> flush cache contents.
> >>>
> >>> Hm, I was on the edge here, in fact I've previously coded this using
> >>> cache_flush_permitted(), just to the change back to
> >>> has_arch_io_resources().  If you think cache_flush_permitted() is
> >>> better I'm fine with that.
> >>
> >> I think that would be better here, yet as you say - it's not entirely
> >> clear cut either way.
> > 
> > I've reverted this chunk of the change and left the code as-is for the
> > time being.
> 
> Didn't we agree to use cache_flush_permitted() here instead?

I think it would be a bit weird, if we want this to be a
non-functional change we would need to keep the has_arch_pdevs()
condition because cache_flush_permitted() doesn't take that into
account.  Or we need to adjust cache_flush_permitted() to also take
has_arch_pdevs() into consideration.

Thanks, Roger.

