Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6DACEB5B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 09:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006366.1385549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN5TE-0007yd-R8; Thu, 05 Jun 2025 07:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006366.1385549; Thu, 05 Jun 2025 07:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN5TE-0007wW-OV; Thu, 05 Jun 2025 07:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1006366;
 Thu, 05 Jun 2025 07:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN5TD-0007wQ-Bs
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 07:57:03 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2dfd5a2-41e2-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 09:56:50 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-450cf214200so5449975e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 00:56:50 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451f991967csm15336285e9.32.2025.06.05.00.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 00:56:49 -0700 (PDT)
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
X-Inumbo-ID: a2dfd5a2-41e2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749110209; x=1749715009; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QLxzcz9unMcmiV01ec0f5lpEN+wRH56fPF4Yt2WK1x0=;
        b=F4EAP2Kzcvhf+MGY6ZjHSMI3q88slKmhlfukv7rcNwcc22pHHjFbvDW+Vl/EbKvrQD
         F9DGwdn0h3KblBq5nYIKZGtxMwA3AuUQgZQcDpu4p1BxVh6o8kmTPw0skC0dFXq4bOvj
         8yUG+D2bRsAz3OoOmr0mRH5Roedj41OS2sctc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749110209; x=1749715009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLxzcz9unMcmiV01ec0f5lpEN+wRH56fPF4Yt2WK1x0=;
        b=XkHUCYq/GrpHkcvWYL9PL6Axom4Z0FhdzBc3rOczZTEgC1mjRg2h0du4ho9gTFDP+S
         umFYDo0Z6oLw3gNPh1wMowjSUa+Er18M4IEqNu/z4jAeL2YxPKGFKxOBRm+6VwODyhyY
         JU/Dd3T3evf63zShjOPaUs4+NZlRdnkMadxZSbPhfWkm0rzfUZPlxYijh2a6GyRyjmXE
         PeKKY5gOFFUIB8r0BLwApJXRbO7LSigNN9xGN873kqZNSY5H1OMroDRl+EfqZ8/ke5Rq
         pQo44jIZlxuCMiP4tEpi7ve7TLEv4HYyN88xggTERCUDSgXBB5iunczexzJb1D8Bluzz
         4efw==
X-Gm-Message-State: AOJu0YwotlyM0yR71/fXlbSUp9Kzyjs1Sg3LLQuto5bu3fZ0eQQtWaXC
	SXwaeTln4YSmHKM8hv2LfEFPuIkbmWobFWBqCw9n44wV3ChLDeuYmd5yAp2PleD7HU0=
X-Gm-Gg: ASbGncsidE3zXfu5kWJbKdfwEgmteuLlgMvAqQTvolxAobNMCeO00FZ4boHfoLJCB5k
	WwZnme2UDO4VOoWaiMu96ZtgvWeOEifu3LSxarbTDLQE7IzIGRo/Zcct2nw8qvJm9I0pyofIMJS
	l6WQmxYNUYizrrdpiftb9yF6UHNJldd5qDpayBkG2j7Xfai85+X9Xbi8qdt1jIAJ57XzT5HWmYb
	wG2RNzdjd2wIxWUgMBZn9hz7KUVRDqggoeq7YYYOBogZboU2l1tq13EPHJ46iZHSLGdS0lhY+mB
	ibrPzsDYwgv5wLSS9wIaN+hmOSjB9QSVshLz7dMODaQZbSspKU+99CHaqAEw3KNowJw43aMyhrX
	AlgkyhI+wQyMshSzhdk3kMI/I
X-Google-Smtp-Source: AGHT+IHPb3M7IYxYN2oTaUlXE+ZzgdOxbnam66IPKbm1sUmSzWMKu/4dicCefCemPwIznQPcgct79Q==
X-Received: by 2002:a05:600c:8312:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-451f0aa72fdmr53382165e9.15.1749110209455;
        Thu, 05 Jun 2025 00:56:49 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:56:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v2] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aEFNvwXcgor29lrc@macbook.local>
References: <20250603111806.86555-1-roger.pau@citrix.com>
 <2c26fe05-ef42-48a0-9d9d-ad86100eaf01@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c26fe05-ef42-48a0-9d9d-ad86100eaf01@suse.com>

On Wed, Jun 04, 2025 at 12:33:55PM +0200, Jürgen Groß wrote:
> On 03.06.25 13:18, Roger Pau Monne wrote:
> > The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
> > diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> > index cc67b18c0361..97933b44a82b 100644
> > --- a/tools/firmware/hvmloader/pci.c
> > +++ b/tools/firmware/hvmloader/pci.c
> > @@ -30,7 +30,7 @@
> >   #include <xen/hvm/e820.h>
> >   uint32_t pci_mem_start = HVM_BELOW_4G_MMIO_START;
> > -const uint32_t pci_mem_end = RESERVED_MEMBASE;
> > +uint32_t pci_mem_end = RESERVED_MEMBASE;
> >   uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
> >   /*
> > @@ -116,6 +116,8 @@ void pci_setup(void)
> >        * experience the memory relocation bug described below.
> >        */
> >       bool allow_memory_relocate = 1;
> > +    /* Set the MTRR type of the xenpci device BAR as UC. */
> > +    bool xenpci_bar_uc = false;
> 
> Hmm, shouldn't this be "true"? Or should the comment be changed?

The intention of the comment was to signal that this variable is used
to set the BAR cache attributes to UC possibly, but I can see how
that's confusing.  What about using:

    /* Select the MTRR cache attributes of the xenpci device BAR. */
    bool xenpci_bar_uc = false;

Thanks, Roger.

