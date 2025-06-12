Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA66AD731E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 16:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013119.1391670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPiX8-000754-Jb; Thu, 12 Jun 2025 14:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013119.1391670; Thu, 12 Jun 2025 14:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPiX8-000736-H1; Thu, 12 Jun 2025 14:03:58 +0000
Received: by outflank-mailman (input) for mailman id 1013119;
 Thu, 12 Jun 2025 14:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPiX7-000730-3n
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 14:03:57 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 111e141b-4796-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 16:03:50 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so7564675e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 07:03:50 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532dea1cc5sm22582545e9.16.2025.06.12.07.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 07:03:47 -0700 (PDT)
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
X-Inumbo-ID: 111e141b-4796-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749737030; x=1750341830; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCVDXFdGDko2BotlFIEfY7jNVsR9BhRUMi+viB5wR3I=;
        b=eKlchSa7UFLwcFd9GO82X02yb4CDcuq/9xOxuis6lA7NkF7cyF1eRFmVlgNU8toS4O
         uGZY4iv+drcGmTd5YovrSRuVTQFGVXKN52hu6uiRVE7rGPSQxNOBj3S3ofix9/gjJQjG
         UKja6N6vgIX/nxB9tokHU95RZjYA57Etj1Rek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737030; x=1750341830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCVDXFdGDko2BotlFIEfY7jNVsR9BhRUMi+viB5wR3I=;
        b=mftOw3lMXSDDiNaL23LxdF3nNAgd4xL/WbIiOC7hgEgM4s8mYoCKngNjrxnAEo+ZdB
         6TmT3S8/HtqKBTGHIwJnQwKZ2E+x+5iLngv0Ydthu1j9YdsjWOVnJQt5qnmymjiOEUGu
         zmRaxAmBMd9kmH3cc7A4brGA5rOfW2rF9pG5TvOiJc5n9Ja9BnSfkeYhN+lbvYiBvQEm
         8Hs9SPcm3I4JE0GKHAPd377KyRn0h/AAldNs2fZhD376IHffMReHAoLT6VgskxGHfpA6
         X4v4sf4lCeeI08Ct7mqkEPwypCVDYHdZIiDA7VKbR0OZ3tcraJzlUBwh6MVeM/ze8dgY
         rUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIUHrtzpUHVi8n2w0dGBfdTOYFWVeE3OEdNEApM4/ne9X9Nvu4/Bmtjk1KtwPl0nFxWYPFbFDOGUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw83prb/bEEudDsMF0kDwl2D59P2If0sB0q7TfgYh+Ak5k+/PaG
	sZk3AMt0VX0UPz5W3aiUUAqiFLmTvNrYIaRXQO8ujRHCMhmhCrNjW77z6yjh/KmQ+L4=
X-Gm-Gg: ASbGncuEjFSC9BWeXly6yklcEBrjLuBPFRJJfY9LyZDtVmmq9oK4cIru7U+4pLyBJKi
	H7PfVJgVYoPImNKp8PzHtUOJmZKB1K2SaYQrBf2A1i1RVzDhmWq4EpOs3QKF18KD/9nlV4AgEuD
	NUUBaDaNcXcnHavVNY92F61onDWlt8WXrg+hBtXlTvb0dFj1ddjN+HIGA1MbizvfABrcir/wX5e
	2rVvMq4u/lGk7SHqmXBeRWGTeXy20nITV5R2wph/Ex4xQHr1LuvB0G2jKaFGGy1U6XeqN3Gd9Y9
	ITdgwv1khJV1i5YODfnlFqpremc4V4H0kggaWoZQ8cB5DO5vpxjG0h0sMn476058qAXZwNo4KNh
	1sIhNn3QdRgUAKJ1wAF8gacQtFSEmOFz2mwdhhh4zfYvi2Q==
X-Google-Smtp-Source: AGHT+IGHhI+JyytbDaqgc2ZvvPAo9DqkYI+Y0QFnBPZA3TEsAOXt8ICiZS+X4yo3W2JNNAgJGgIKRA==
X-Received: by 2002:a05:600c:314b:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-453247d6b1dmr81629585e9.0.1749737028408;
        Thu, 12 Jun 2025 07:03:48 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:03:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 6/8] pdx: introduce a new compression algorithm based on
 offsets between regions
Message-ID: <aEreQgl_0Ma6S3_a@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-7-roger.pau@citrix.com>
 <f7c9bb4a-4006-4be6-955a-cc3b2c4934a1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7c9bb4a-4006-4be6-955a-cc3b2c4934a1@suse.com>

On Thu, Jun 12, 2025 at 10:27:03AM +0200, Jan Beulich wrote:
> On 11.06.2025 19:16, Roger Pau Monne wrote:
> > With the appearance of Intel Sierra Forest and Granite Rapids it's not
> > possible to get a production x86 host wit the following memory map:
> > 
> > SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> > SRAT: Node 0 PXM 0 [0000000100000000, 000000407fffffff]
> > SRAT: Node 1 PXM 1 [0000061e80000000, 0000065e7fffffff]
> > SRAT: Node 2 PXM 2 [00000c3e80000000, 00000c7e7fffffff]
> > SRAT: Node 3 PXM 3 [0000125e80000000, 0000129e7fffffff]
> > 
> > This is from a four socket system, with each node having 256GB of memory.
> > The total amount of RAM on the system is 1TB, but without enabling
> > CONFIG_BIGMEM the last range is not accessible, as it's above the 16TB
> > boundary covered by the frame table.
> > 
> > Note that while the memory map is very sparse, it won't be compressible
> > using the current algorithm that relies on all ranges having a shared
> > zeroed region of bits that can be removed.
> > 
> > The memory map presented above has the property of all regions being
> > similarly spaced between each other, and all having also a similar size.
> > This allows to compress them using the following formula:
> > 
> >  pdx = (pfn % offset) + ((pfn / offset) * size)
> > 
> > Where offset and size are two static coefficients calculated at
> > initialization.
> 
> What I would find useful here in addition would be offset and size values
> resulting from the example memory map above. In particular, without looking
> at the code in detail, it doesn't become quite clear how the two ranges on
> node 0 are being dealt with. For what follows I'll assume they'd be folded
> into a single range covering all of node 0.

Indeed, they are folded into a single range, that's why the function
to register ranges takes an ID, so that for this algorithm ranges with
the same ID are folded together.

For the above example the offset (pfn based) is 0x63e80000 and the
size 0x8300000.  You can see those (and for all the other examples) on
the test-pdx-offset.c file.

> Along the lines of Andrew's concern regarding the division (and modulo)
> involved, I wonder whether there might be an alternative with a lookup
> array, holding bias values (e.g.) for each node. Main question there would
> be how to quickly determine the array index to use, both from an incoming
> MFN and an incoming PDX. If such an array wouldn't have too many entries,
> such a lookup may end up being faster (on average) than a division.
> 
> Taking the example above, such an array could be:
> 
> [0x00] = 0,
> [0x06] = 0x061e80000 - 1 * 0x5000000,
> [0x0c] = 0x0c3e80000 - 2 * 0x5000000,
> [0x12] = 0x125e80000 - 3 * 0x5000000,
> 
> indexed by the top-so-many bits of the MFN. For the reverse array some
> gap would need to be left between ranges (i.e. the 0x5000000 above would
> perhaps need doubling; maybe a little less than that would suffice), such
> that the array slot to use could be determined easily there as well.

I've assumed that any kind of lookups like this would end up being
slower than arithmetic transformations.  I had the (maybe wrong)
impression that having to fetch the adjustment from an array based on
a calculated index would result in slower code that using constant
coefficients.

I was also worried about the extra memory consumption of this
approach, but overall we can use a full page for the lookup table,
which would allow up to 512 entries and that should be more than
enough.

I can try to code this suggestion.  However it's hard to benchmark
those algorithms, as the cost of rdtsc shadows the cost of the
operation.  Then running the translation in a tight loop and averaging
the result also doesn't seem very realistic, as the cache is hot in
that case.

Thanks, Roger.

