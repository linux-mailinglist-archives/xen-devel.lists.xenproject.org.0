Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB9B1B63D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 16:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070524.1434133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIX0-0007Vz-GU; Tue, 05 Aug 2025 14:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070524.1434133; Tue, 05 Aug 2025 14:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIX0-0007TW-DV; Tue, 05 Aug 2025 14:20:46 +0000
Received: by outflank-mailman (input) for mailman id 1070524;
 Tue, 05 Aug 2025 14:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujIWz-0007TQ-1z
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 14:20:45 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eb701ed-7207-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 16:20:43 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso3490071f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 07:20:42 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c453d6esm19471201f8f.37.2025.08.05.07.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:20:41 -0700 (PDT)
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
X-Inumbo-ID: 5eb701ed-7207-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754403642; x=1755008442; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmvY2Yjn46MqEGSngmcxBtaO1gIdPtGHYr0IlJjOiHE=;
        b=uP+rfifgZ7QgrNpZ4JSrJPVSPwWr04zIuwuyiGzgz7d3L/QCOrsWf1fLr0AlK+IZ6j
         CT/BaHANhopuy4rhTwDKhhCRUPvBUqV+1+DLdPnySRGOfiTIm0IBH6BKpSd0yvAg9gYA
         UDTJwMUmxfkl6q5UnCMxWvpjFU+twwO8gfPEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403642; x=1755008442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmvY2Yjn46MqEGSngmcxBtaO1gIdPtGHYr0IlJjOiHE=;
        b=bnILhhXm+/f8zG1Mh5MGgaAnqEmZR47P86DMs0fJVXykJPQaXazNhXYHfGzaWA9+Jx
         2yZtL9gbDXwW3nLHi5Z3ooxZNpqyw1aqBWWvrpNHSNRa0mskzPyXFMVSYDAdYFrIkWnF
         pYfMSmCqMd9cc+yczmUNfsDnV5py3bMVDvkdBhv9KqW+QRQojYDUtGA85ymq7IyS8F4T
         y1oYQjv8TOLYYJl7nDgTzUgOPTYNYiuGnhWHe5zk9p4dIJUa7d0FgFLLiGn55o6CXQ/p
         XTGe+x9Kls04TspcJkQ6h4eRUaBVU351G9EQTmiNuidfrIbAGavNuhA1oA/xERNRCzKX
         E8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTo+WSv2+gttGmcBBfFz3kH9JG1AupphNxkcQYbyYndcoiiGJQz57Vt59m2+KFp3JMcTjo5zsQ46E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8XbI5mf9vaarNgWKSx9WUeTcsZVvoBWVPNh7fc/0lv5AePgJE
	P+ScT6ngybOy3xcK/dwH96tq2vT/R7CWb0GNtevkiX/EqJLeo/94+gCYro5bf79UsNc=
X-Gm-Gg: ASbGncs+hO7H59nt8ZT73p19/KJOmTqY/FvwPh1vP0dtzsusByVrob3rW/3O9CM5R3D
	SC5iteD3fIOTP2GIqYTuHpZTSdd3FSpXvIAmpbOCIuaartZMQcWl5bC/fQVxRisg5lIXuTHqeSK
	41ftpdnY4EqX6tGiQyrdfqr6btwX8YF6XvcKVD7kbX4Dvvp5P7UBwbX+K85Tp3jRRIZposgeYIO
	WGQ2ggC2PXC+JpqyQ/S9nWln6SogOtllLg7fU/642CwMfD3U6xW2ScDfTU0zld0wq8tKAOGLHYs
	pWCZ4d8ESuRNYfLbrZqdSd+y8Nn66Zzg9myS0+oloklcHVGVDR/bZAYO3MvponRlsv0MRBDLzTo
	zlxFHIllXSTbB01sMzoDSx4Y7oWyRxAg42iR4eQx4BBeoMa8n8hq09P5Uh+G05eikpA==
X-Google-Smtp-Source: AGHT+IF/+nWj4MOEfH0t1Kz/F6xOca3J29M36WGxLrYcLW4eMALGLRT9Z8R+1m9He+wyNMQ3ujcOCQ==
X-Received: by 2002:a05:6000:2508:b0:3b8:d4ad:6af0 with SMTP id ffacd0b85a97d-3b8d94c3c8dmr9844089f8f.40.1754403642148;
        Tue, 05 Aug 2025 07:20:42 -0700 (PDT)
Date: Tue, 5 Aug 2025 16:20:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 4/8] pdx: allow per-arch optimization of PDX
 conversion helpers
Message-ID: <aJITOc6LSUULdxYQ@macbook.local>
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-5-roger.pau@citrix.com>
 <c077b195-171f-458e-b8df-644b37d50dfb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c077b195-171f-458e-b8df-644b37d50dfb@suse.com>

On Tue, Aug 05, 2025 at 02:11:22PM +0200, Jan Beulich wrote:
> On 05.08.2025 11:52, Roger Pau Monne wrote:
> > There are four performance critical PDX conversion helpers that do the PFN
> > to/from PDX and the physical addresses to/from directmap offsets
> > translations.
> > 
> > In the absence of an active PDX compression, those functions would still do
> > the calculations needed, just to return the same input value as no
> > translation is in place and hence PFN and PDX spaces are identity mapped.
> > 
> > To reduce the overhead of having to do the pointless calculations allow
> > architectures to implement the translation helpers in a per-arch header.
> > Rename the existing conversion functions to add a trailing _xlate suffix,
> > so that the per-arch headers can define the non suffixed versions.
> > 
> > Currently only x86 implements meaningful custom handlers to short circuit
> > the translation when not active, using asm goto.  Other architectures use
> > generic macros that map the non-xlate to the xlate variants to keep the
> > previous behavior.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Once again:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, I didn't carry your RB due to the changes requested by Andrew,
that was a bit too much to carry a RB after those.

Roger.

