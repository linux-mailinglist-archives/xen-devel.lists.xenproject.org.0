Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91E0AF8A38
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032961.1406388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbGs-0003a6-IS; Fri, 04 Jul 2025 07:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032961.1406388; Fri, 04 Jul 2025 07:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbGs-0003XF-Ey; Fri, 04 Jul 2025 07:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1032961;
 Fri, 04 Jul 2025 07:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9FN=ZR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXbGq-0003X1-HE
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:55:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4949cf2d-58ac-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:55:43 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso566652f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 00:55:43 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b47030b501sm1818369f8f.14.2025.07.04.00.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 00:55:42 -0700 (PDT)
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
X-Inumbo-ID: 4949cf2d-58ac-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751615743; x=1752220543; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VP43BeLJ6bMRLHqgqDyirassUZZu+fk2lUQIlCUsXnY=;
        b=XjEM/0UDTfXcB7hWfJtDJ4FzTwDLSlITlLxIVHmAHvlfVV9gCeK7E38LhpzUR8M8ex
         Z4lk7IGQd7UmMQ48v8iyW8hF7oUyZIiaMApvvHaUS4LZhXcMV+T5gbODGzyOw2htjRDV
         MWYEqidkQSYBkc1eIv7QyZ7ZvtBHVKXY/cP/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615743; x=1752220543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VP43BeLJ6bMRLHqgqDyirassUZZu+fk2lUQIlCUsXnY=;
        b=pHZk41Rp3gn6ol8eM4JQ1YgkVvgi3IAmbEF/eegNSk6Qkbv9ypaTXm1A4JFqtJQmxO
         VSH3i+st+HqhdS4jM1UzlpRj75MYvtki4iZudi8q9dlUMX1cwH+9t3xIX4JxSS5zYnsd
         /jWaPjm3BXq678JKkExxb7ZZTAZbVwKwCG/6rNIipHOMVrMuZOWindQa8etDIpAVMlNE
         cyrMmlHhRHDhpEqOZeFAELvYi0KDEzLEjvnnS0eGlXI9YXiqv3/Uk5IRVvlOnWuYYm06
         R/sXygqQwNK7K1qDGfYOk5m9mHZ01XHb+Sexn8SsJ2zG3S0Fd/km/LVi1jdLTioTzBul
         Qfcg==
X-Forwarded-Encrypted: i=1; AJvYcCWzvdaa2XCQadDFtkdy/iLwWs/EeylqXtLkoQLZtgLrt4iZWbWiK4tmRzOzcnhsZGo9s/tAwFqI8K0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAJt+5jRVS29Pw7Z/yUtc2gX8cbF+/oCMVK3tmFxonC1qJuHxT
	75BJvSeWZP9UihefBHmYjhT3hA6dlECq7Fp6czfNOTXU8q3pQCoZEDbbBFblpqY17yM=
X-Gm-Gg: ASbGncuZ4l+6MjdVJfdF2AT8BCwpeD023fn1zMRCVleEAU1QJMv2g0MjujfrhXqQ/Ps
	MTQX7VAAithHbNCnt8TcDiODiVVjhfDX80lorZzU2nKo5QN8fk0gUKa0OtpKdu+BAWTfCPjrs4F
	zAaIvILJfBtRXz/olwT8WFcNSsfDtOMYjNPJ3rTYbc6xMrArdA28X26oX71uN6wtGds3RVtEV+c
	GdpPZBiMdlNFPQ18sG9mDKR/K3ke7PmfGiHFCkVWiuDRmy9hs0crecbMbYEAKanNkM2ES9JNpyc
	WIzDesGoUqIMNVRh+fbrbHAb6SwOzghsCnyvb1Z3klI1X9vcl7JHmakVYpnq+SyAJOdgMTQKtFf
	xl/pxOZTCSqy65Qb0RcueEjqsOQ5paexykyTJ9DYz
X-Google-Smtp-Source: AGHT+IFbjPnjYA18kBn2xyxF/vekvyE5P/ajFYNjhUeyb65CQpLaprq6LzvxRThoi0UVP0VxRnS7bQ==
X-Received: by 2002:a05:6000:250b:b0:3b3:c4b1:a212 with SMTP id ffacd0b85a97d-3b496fef777mr734050f8f.7.1751615743184;
        Fri, 04 Jul 2025 00:55:43 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:55:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/6] xen/softirq: Rework arch_skip_send_event_check()
 into arch_pend_softirq()
Message-ID: <aGeI_k1H3oju26hf@macbook.local>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-4-andrew.cooper3@citrix.com>
 <aGat-VxBF5jOErzy@macbook.local>
 <86dde581-40ad-405e-8d98-0b4485529581@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86dde581-40ad-405e-8d98-0b4485529581@suse.com>

On Fri, Jul 04, 2025 at 09:23:29AM +0200, Jan Beulich wrote:
> On 03.07.2025 18:21, Roger Pau Monné wrote:
> > On Wed, Jul 02, 2025 at 03:41:18PM +0100, Andrew Cooper wrote:
> >> --- a/xen/include/xen/softirq.h
> >> +++ b/xen/include/xen/softirq.h
> >> @@ -23,6 +23,22 @@ enum {
> >>  
> >>  #define NR_SOFTIRQS (NR_COMMON_SOFTIRQS + NR_ARCH_SOFTIRQS)
> >>  
> >> +/*
> >> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
> >> + * skipped, false if the IPI cannot be skipped.
> >> + */
> >> +#ifndef arch_pend_softirq
> >> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
> > 
> > Nit: I would maybe it arch_set_softirq(), I find `pend` not that clear
> > (I would rather fully spell `pending` instead).
> 
> I, too, did wonder about the naming here. But using "pending" as you suggest
> has the effect of giving the function a name we would normally associate with
> a predicate ("Is it pending?"), whereas here the function is used to _mark_ a
> softirq as pending. Hence in the end I didn't comment at all; I'd be fine
> with "set", but I'm also okay with "pend".

It's a set and check kind of function, so I don't care much.  Just
found the pend a bit too short, I don't think we usually abbreviate
pending to pend.  In fact we use pend in more than one variable name
to store the end of a physical memory region.

Thanks, Roger.

