Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49AB262AF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 12:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081423.1441526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVCM-0007Tw-RM; Thu, 14 Aug 2025 10:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081423.1441526; Thu, 14 Aug 2025 10:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVCM-0007Qr-Nz; Thu, 14 Aug 2025 10:28:42 +0000
Received: by outflank-mailman (input) for mailman id 1081423;
 Thu, 14 Aug 2025 10:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umVCL-0007Ql-Cf
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 10:28:41 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f8ed65b-78f9-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 12:28:36 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b9e418ba08so336925f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 03:28:36 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c469582sm49339926f8f.52.2025.08.14.03.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 03:28:35 -0700 (PDT)
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
X-Inumbo-ID: 6f8ed65b-78f9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755167316; x=1755772116; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vWzPGO85ZtVeB8/uxBQnr8mR5+rY9tgbix+VtBxEu4E=;
        b=eg8F+zE5Un9BmJX/GsLXGi818kvA4r3lpFRk+4vD40zNnOEUP9iJppgaPMXTeGbT21
         IbV5FnJPcixYBWeRpdJu/ud+TfEuLoDyf0C7yajiTcHEQGTEOnAZmv+O1U38oVQamf68
         j6ihzzI8l0ivMNxvQ0YVI/2vtgmsZqZbnCwi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755167316; x=1755772116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWzPGO85ZtVeB8/uxBQnr8mR5+rY9tgbix+VtBxEu4E=;
        b=By4m5M9msPMV+ZE8WSd9dNrlHc04G1NFKHU79tL4da8Mvggby2XIEBcLE6y9oqMq89
         LbJfI7rm95FVFJxLa79VfZl5cNQHnWwR4tux39MPX585AfPTbSDg7EZ3FqDGFNL1xgj9
         YGogQWxB0JeG3TX1Mnc+DH9OT83Sspalbz9PGj+zIND2U7eIvYwZRwELReQUIyiNKX2i
         pvFChncRN/0wvcBCR7g4ea/mL4yGII4LBiJODSD6vre1PmWqSTmzlVlQ9FLlktQkraN2
         VBHqXcVtaDeXY8NaJZXhLJTJ6FeYKIMvY612xJQIocuv091lGzWpouaBcER1YuHRQ3Y6
         vLbg==
X-Forwarded-Encrypted: i=1; AJvYcCU21pbJVsKlrFK+WLlNLNUz8c7+VVL0Kr1xrJq8PDklGrgmxZgKAnkHyyQ5du15SUTs38FQZq8Kbbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0D233MlhXiG2DcTu5Q6NpcGtPazhfEcVeiGK6z1AqPy4ZQSP1
	OIoNA9cKKZmmn81+7Dki82bmeeM5J4t+G+TG5PdfcIMRxqvI8dxwZhydDJ/bt2I6yX0=
X-Gm-Gg: ASbGncsRiMFAUby1Q9mOIfzO5vlAHrYRuDy+mSm3cGg0S7xxbzhGd9aiDuFBZwAvQ4b
	400YMDcgKP42OPkscqmUUoZ87bFUPwUuzN5ODDjnpkeO/wBK6Td0HYj46Cx098fFt2qPwNyPhKc
	wzP2yiuI58WX8NB8wGQUiZdmU/4i3REsTQmfyNSOij2rqkj1+6CAdsT5pm/NmqKc1yg0+96ZYxX
	TJ/VyQdHELyuI/IM+rSkn9+Da0AE2/gPyahGsc82Yu+ja5/MXQPXx95e/kSYGcjc5jB78KcBwh4
	z755Xlbf5GAPk616o6MWccBhguZpzDpen7+lUYXyUcfdWwIpq5TYyPyrWNsCmGhX0j/ui93RuR1
	oLbei5GR9VPEjyGidmqss96cg8EKF7asHlynMaJHTDFHnN4xtC7Kr+i9RlAd117rJHg==
X-Google-Smtp-Source: AGHT+IGt8oZPK26PL0yVLV0qycRvcIQKA/54UQlbiC2VAl7ASl/DJdAgv0Ry48W49uEC02sjbsw3vg==
X-Received: by 2002:a05:6000:2012:b0:3b8:d15e:ed35 with SMTP id ffacd0b85a97d-3b9edf1d068mr2097317f8f.23.1755167315776;
        Thu, 14 Aug 2025 03:28:35 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:28:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
Message-ID: <aJ26UmemwxyyTioE@macbook.local>
References: <20250813125538.78174-1-roger.pau@citrix.com>
 <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>

On Thu, Aug 14, 2025 at 09:18:45AM +0200, Jan Beulich wrote:
> On 13.08.2025 14:55, Roger Pau Monne wrote:
> > --- a/xen/common/pdx.c
> > +++ b/xen/common/pdx.c
> > @@ -288,7 +288,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
> >  
> >      pfn_pdx_hole_shift  = hole_shift;
> >      pfn_pdx_bottom_mask = (1UL << bottom_shift) - 1;
> > -    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
> > +    ma_va_bottom_mask   = ((paddr_t)PAGE_SIZE << bottom_shift) - 1;
> 
> Given
> 
> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> 
> this shouldn't be needed, except maybe for Arm32. There, however, ...
> 
> >      pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
> 
> ... this and the shift immediately ahead would also be a problem afaict,
> which makes me conclude this isn't what Coverity has looked at. I expect
> the problem is with the toolstack side definition of PAGE_SIZE, which imo
> would rather be addressed there. (And yes, I'm pretty averse to arbitrary
> casts like this being introduced.)

As I've realized while looking at this, wouldn't ma_va_bottom_mask
also better be of type paddr_t, since it's not operating on pfns, but
physical addresses.  I didn't adjust the type of ma_va_bottom_mask,
but I would be happy to do it if you agree.

Thanks, roger.

