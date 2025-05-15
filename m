Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F27AB83D3
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985194.1371152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVpj-0004Mj-Rm; Thu, 15 May 2025 10:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985194.1371152; Thu, 15 May 2025 10:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVpj-0004K5-PB; Thu, 15 May 2025 10:28:59 +0000
Received: by outflank-mailman (input) for mailman id 985194;
 Thu, 15 May 2025 10:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFVpj-0004Jz-7d
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 10:28:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68d84737-3177-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 12:28:58 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-441c99459e9so4966525e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 03:28:58 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442eb8c92d9sm50550685e9.2.2025.05.15.03.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:28:57 -0700 (PDT)
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
X-Inumbo-ID: 68d84737-3177-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747304937; x=1747909737; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83ukkjGSozxeq111dikbc9RWgGdmH0Nw4voTK63QNPQ=;
        b=u4GKMQ1eAwtadiked7u/bKpRYyY/bcDNHoSPabYQ6S27//odwZjFUyiZ7s4spE1FzT
         F89pHrEsOJTmkDoQpAZzlWCP1uJnIfVLjrHzzZd45UIqA4h+xRB/7kyDa/y3kh77anHh
         rAzZ9XRxhHm4c+CDbbYEkF3W6V3X0HsaldKII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304937; x=1747909737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83ukkjGSozxeq111dikbc9RWgGdmH0Nw4voTK63QNPQ=;
        b=gPVquYF7p5NzbaDZAhm7DdMwjyBN6L24zN60ksrNrs7B2nb6ryHSSdndf/2K+mtUe6
         kUTjiXTegPF6rNxy/w1etUkTxQBUD5C6SJLwVslFdwMvvOfhbKPxLhMvuZjgLLvsXKQ0
         /kbdCJxZUb12i5kV5dAH5DfbFU+fT5byWeD2XclwVtF71S8DL8sMXKCtdR+d0wscbEbx
         S3FXZQaOFywskBgdURRAvc7ccT8dOT6MJtx0X5CALd9hp0crpUAMcrJx53q17jFWsL+2
         zSYVY22U/srL40VsWN2hV02wkW+FAGvEOva09wZ4vUNYza+XGyD4u1Og3RBKz2s7z14b
         sEfw==
X-Forwarded-Encrypted: i=1; AJvYcCUGZamTjd5m39qZzyvzPdX3vqPEEspYsoYilOE8+Uw/BiyYgaI+dXs9hRJONeP327Rouxbq1tmeSzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzveJZQkOHcL2GeN69aU086dNv2Gn+7r0+Nd+Sj+GrGkkLR1Pu5
	ajBr4BxPZ+JhTmJTBIcxE1pj9RCzGLva0i8tHGAB+u53Mil/gY3ECSfrGKDLKJM=
X-Gm-Gg: ASbGncvpXX0H0s31W5oOr7rdIAFe7QXz2IrtgUW87UpFNf5X7UDUnrZs+VNrNfqarPg
	k/F8/Zkf7Na0Q09VVnC8vhRFIAJFFwQ3WCtq1vb04Olk0dQI/BdXDUeghhcGyEgbyP9nZml3x84
	x4Hyx6mF7p6RzX3yovPiT2JHjeo5ry8hiWI9i2qh7+3OLGTwmBpDGmf57k8ZzU6KPQ1tGhzp4ZB
	fTpkPbnlczO6/hLsKW0T/EhfSr1qza6y5egemUmKOpc4BiIahny0wvzl/xbR2fR/A6+KztWrX35
	9wB0VjLNRFycpWu1+Wj3EIQOXKyMZLQ4TONNSYfS+62F95AT7D4Pe9YM
X-Google-Smtp-Source: AGHT+IFcMuAcvk+FEj1nEvjWsPn5WPwC/MaGL8i4T+JbdBBPHtz995ExrU5heh5ti0YNBzpP8XwMCg==
X-Received: by 2002:a05:600c:3f08:b0:442:e0f9:394d with SMTP id 5b1f17b1804b1-442f216961dmr71380645e9.24.1747304937351;
        Thu, 15 May 2025 03:28:57 -0700 (PDT)
Date: Thu, 15 May 2025 12:28:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
Message-ID: <aCXB5zpqGfBrPTZy@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-8-roger.pau@citrix.com>
 <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>

On Mon, May 12, 2025 at 05:16:02PM +0200, Jan Beulich wrote:
> On 06.05.2025 10:31, Roger Pau Monne wrote:
> > To better describe the underlying implementation.  Define
> > cache_flush_permitted() as an alias of has_arch_io_resources(), so that
> > current users of cache_flush_permitted() are not effectively modified.
> > 
> > With the introduction of the new handler, change some of the call sites of
> > cache_flush_permitted() to instead use has_arch_io_resources() as such
> > callers are not after whether cache flush is enabled, but rather whether
> > the domain has any IO resources assigned.
> > 
> > Take the opportunity to adjust l1_disallow_mask() to use the newly
> > introduced has_arch_io_resources() macro.
> 
> While I'm happy with everything else here, to me it's at least on the
> edge whether cache_flush_permitted() wouldn't be the better predicate
> to use there, for this being about ...
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
> >  
> >  #define l1_disallow_mask(d)                                     \
> >      (((d) != dom_io) &&                                         \
> > -     (rangeset_is_empty((d)->iomem_caps) &&                     \
> > -      rangeset_is_empty((d)->arch.ioport_caps) &&               \
> > +     (!has_arch_io_resources(d) &&                              \
> >        !has_arch_pdevs(d) &&                                     \
> >        is_pv_domain(d)) ?                                        \
> >       L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
> 
> ... cachability, which goes hand in hand with the ability to also
> flush cache contents.

Hm, I was on the edge here, in fact I've previously coded this using
cache_flush_permitted(), just to the change back to
has_arch_io_resources().  If you think cache_flush_permitted() is
better I'm fine with that.

> Tangentially - is it plausible for has_arch_io_resources() to return
> false when has_arch_pdevs() returns true? Perhaps there are exotic
> PCI devices (but non-bridges) which work with no BARs at all ...

I guess it's technically possible, albeit very unlikely?  How would
the OS interact with such device then, exclusively with PCI config
space accesses?

I'm happy to just use cache_flush_permitted() which is likely more
correct given the context here.

Thanks, Roger.

