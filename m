Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ACDAD69C6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012489.1390949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcqY-00029L-Oz; Thu, 12 Jun 2025 07:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012489.1390949; Thu, 12 Jun 2025 07:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcqY-00027u-LU; Thu, 12 Jun 2025 07:59:38 +0000
Received: by outflank-mailman (input) for mailman id 1012489;
 Thu, 12 Jun 2025 07:59:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPcqX-00027o-8K
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:59:37 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e066cbb-4763-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:59:34 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4533027c0ceso1354835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:59:34 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e259108sm12050725e9.32.2025.06.12.00.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 00:59:33 -0700 (PDT)
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
X-Inumbo-ID: 2e066cbb-4763-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749715174; x=1750319974; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jqvGP8rNd88wpvPsifGD3kzZ7I5KmxLD3eJ7N11OFpU=;
        b=dqmhTDY0DBDZJXeDg27YOCDqHKs4bhQffseTGNnv68SmK8QLgVGqDRUHIkfedaSqG7
         ShsKYRww3nLMjyZ1C8zlzrthfOdMCnF4q/QdW0yGY0ZzgB5Udf1XT1DixiSQnR4zwFXD
         k3/+2gAIqmltj7XUSjWpQo6ZGln2WNc2At1bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715174; x=1750319974;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqvGP8rNd88wpvPsifGD3kzZ7I5KmxLD3eJ7N11OFpU=;
        b=B1ITKfL0NIEpSQCR3EhBA06K3j5vj6tzlrnQdSdG3V8l8wRfx5RO03O283gOCAGcqm
         nmpCsoMSZkQp4g2DTv8GEHfOOicYWv7E6GNcVLOByQ7a+yum2qC2HVYrT6B7wYs/l/g0
         8oiZz9BscMMtj0/IhjIuJNhYnyiaK56SeTAtaWCwWP+VjPQpqMwAFrXIzKPa6FJytlBC
         +uHO/NQvokGXHYK3eRyYmMrTOGy1FfD4aBBDrPqGOsaBuGXt/qDWPtJIoOjDYG2ibpPZ
         fOCXbHKzm4zB30IHe92iCa6xX9uVFoRizF21azylqobAhEZ4pLM697Mc2c4ufttfg30F
         wDdw==
X-Gm-Message-State: AOJu0Yyua97hlpL7qRe0QmU13ggsTjKq/7Zwig9SPekH5oJXFwMG6RaA
	EvxMcUptMkLxjCswbZyLWEYVdUXk6asXBBYzQTAXtLga49w/v3QTWcOvIXy2HqGLlj4=
X-Gm-Gg: ASbGnctBv/oc0oFI9mESeN5PMSPvZfNkuedRoGmzfv4l7zbDunwl/csvk+2WLr5A+IX
	2AChHmkd4Q+JIt2e0BDa564txJq9AjHcdsWCnvMlwREdq7LSchS/jGxtuNvdMkLVIvIBvOfQ90U
	LnRHJgbzXItNC8lpJktOAs5eppXSQjmubh7lXPPW8Otf/12dDjp00KzVIDCvYkFl7jwRsq8yOSr
	xi4XSWHvmpfxI64RMldjnYcbM5tx3k2Wu1ydDrm9vHCKkE/IT5+LpApU0JFBMzwyQt8a0KQ1zof
	jmU97yOM3Lcie/nG460obn3XobG7Dj8KzQbYxBZ7kdKvu0ZATsMUsDH1dmREaHUw92Ly3R0KCTl
	bno0Uk9X8YTiKFPUgrMxMPT7Lq5gFrA==
X-Google-Smtp-Source: AGHT+IEz/TEyCY9kR2iaMcP0xS59EssyzTn/amKVRTSONqmA/O11pcAPf/mXChYgLD5Cspi4XUoo8g==
X-Received: by 2002:a05:600c:1d0a:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-4532b8c65e2mr28703185e9.13.1749715174267;
        Thu, 12 Jun 2025 00:59:34 -0700 (PDT)
Date: Thu, 12 Jun 2025 09:59:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 6/8] pdx: introduce a new compression algorithm based on
 offsets between regions
Message-ID: <aEqI5NF27rIC1QKT@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-7-roger.pau@citrix.com>
 <8e34ac22-d05b-4ef3-9e31-6e5663cc1dc5@citrix.com>
 <aEqBIdImfwmSOIRS@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEqBIdImfwmSOIRS@macbook.local>

On Thu, Jun 12, 2025 at 09:26:25AM +0200, Roger Pau Monné wrote:
> On Wed, Jun 11, 2025 at 08:33:55PM +0100, Andrew Cooper wrote:
> > On 11/06/2025 6:16 pm, Roger Pau Monne wrote:
> > > We can discuss whether we want both the fast and the slow variants.  The
> > > slow (brute force) was added as a result of me playing with weird region
> > > layouts where the fast one didn't manage to compress, or the resulting
> > > coefficients had a poor compression ratio.  However at this point the
> > > slow variant has only proven helpful in synthetic cases, I haven't (yet?)
> > > seen a real host memory layout that would benefit from it.
> > 
> > I'm going to hold off on opinions until I've read the rest of the series.
> > 
> > One question through.  Can we round offset up to the next power of two,
> > so we can replace the divide with a shift?
> 
> I've tried to round up both offset and size, but that resulted in no
> compression in some cases.  I can try to maybe round just one of
> those?
> 
> Note that the divide is done once with offset and once with size,
> depending on the direction of the translation.  I can explore this a
> bit.

So for the 4s GNR example, rounding the offset to the nearest (lower)
power of two will result in:

PFN fast compression result diverge, expected:
 offset 0000063e80000 size 0000008300000 (91%)
got:
 offset 0000040000000 size 0000033e80000 (18%)
Ranges:
 0000000000000-0000008080000
 0000063e80000-000006be80000
 00000c7e80000-00000cfe80000
 000012be80000-0000133e80000

And that's just rounding the offset, if we then also round the size
there's no compression possible, as size would become 0x40000000 and
thus offset == size.

Thanks, Roger.

