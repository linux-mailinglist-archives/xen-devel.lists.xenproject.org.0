Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45AAAB7FD7
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 10:09:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984893.1370828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFTf0-0004w2-6g; Thu, 15 May 2025 08:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984893.1370828; Thu, 15 May 2025 08:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFTf0-0004tV-3G; Thu, 15 May 2025 08:09:46 +0000
Received: by outflank-mailman (input) for mailman id 984893;
 Thu, 15 May 2025 08:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFTey-0004tN-RI
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 08:09:44 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f59d4a13-3163-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 10:09:44 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5fd1f7f8b25so1356386a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 01:09:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad23fc53241sm820639266b.51.2025.05.15.01.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 01:09:43 -0700 (PDT)
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
X-Inumbo-ID: f59d4a13-3163-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747296584; x=1747901384; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pi8iuPk0+2M6t7OVDj8Jh6pIaO7j0K24pod54S5dZBc=;
        b=UmwStStIdufp9cyR9U6Ygbc3MLXlyYTh8VyGtUoEIjWD75xlVSPRNkQTyvnhqWCjal
         Y/hZkeNEKyHFEQpTy65ke+aSiSP8/PljQnPFIdPxhzZGKwMIUp6gnyJmOrQHPLYOLWEC
         PbCohDUo2otSf8BAnskuQs69S1wL9+SiDN/aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296584; x=1747901384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pi8iuPk0+2M6t7OVDj8Jh6pIaO7j0K24pod54S5dZBc=;
        b=pV09L1G8thBBVGSQB1TZB/jO7z3btlCLYl6ADgfFqHR9229QPL6BJDE1P+/Fq/xtNb
         goGkxc6dd+LvfqqaoqruK74o6HA9eQRAUxOdR9oPheFtOM+kA9w8QMz0kJrK0EWaGeyM
         7S1NZPO15VZCg7TKFO0yB68NdI9guqSVAyXBfBrvDq0JTuVaLnu2Bhd0Wm3vzH0sKaZA
         Tvz2kJx0LXkB60HpDCyLzisy9CgX5YG9pVisi3Lb9S14itklmO0mLiLKcs4qvJ2x0eo1
         lNWwzRIpl+U+XWZ8YJX0sWQyWaCOdVBPB5BWYJl/q6qewfI+8EzDwoeNA5uspqC1zmtX
         s1/w==
X-Gm-Message-State: AOJu0Yyl/5/IiRjuDrinMwSwCVmuGBX3LXYLnDSVlX/FSkMoLahC8BP/
	tFN/45s3+yN3Qyx9XFXzH05Cf5xWWVJGewZv9Y8/rA1mwwRtp6/cX2jzyyKD9qU=
X-Gm-Gg: ASbGncv14+qZ9r/G1SbmX/shDStQ0HOFkDyaDOvxG8CRsFV5uXr2BEBchxdmpltwL49
	OzYwXwg+mey0npjMpaUBM3cd5RUvQKZroprducncpuBnJHTQFBetpUGxy5XnTkBaCf+5HaEGerx
	RfflNfImupVpeWqiZWtHsVYjFKxBIj7/qFoN0ZQFJq65QQwfZO2hOwFH79Mu2lzQoGsdkkElIYj
	k5PzL/1Odb/BQhWcd0mgQyM8bji+IYsOxva4GcxqvfMRMti1YamffuDHawEhliePsUALP6iWRpV
	nkucu4HXiXwSEcUZa3A7isqOQA9r6Gr0hhV+zIHIJTZIZFCH1oiMkFlf
X-Google-Smtp-Source: AGHT+IG1G1UhibaXX0EiV6SuXL1lD3hLTofnCUYsFVepUmEzbYXaVBxMwU+OuvIGZmeBrARfepO5hg==
X-Received: by 2002:a17:907:da9:b0:ad2:4787:f1f4 with SMTP id a640c23a62f3a-ad515dc8325mr127918066b.15.1747296583579;
        Thu, 15 May 2025 01:09:43 -0700 (PDT)
Date: Thu, 15 May 2025 10:09:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 6/6] x86/HVM: limit cache writeback overhead
Message-ID: <aCWhRt4_WGp9tQDe@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <9274fbb1-c1be-9570-ecfc-8f0ac9a1f42b@suse.com>
 <aCST30l2N9X6AOgr@macbook.lan>
 <be7e2d91-69f5-4168-9d2c-57d3f6dac26f@suse.com>
 <aCSy1sSjZ6MiHOIT@macbook.lan>
 <c6dda7b1-1c99-4fb9-9f0b-54cfcffccb30@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6dda7b1-1c99-4fb9-9f0b-54cfcffccb30@suse.com>

On Thu, May 15, 2025 at 08:47:46AM +0200, Jan Beulich wrote:
> On 14.05.2025 17:12, Roger Pau Monné wrote:
> > On Wed, May 14, 2025 at 03:20:56PM +0200, Jan Beulich wrote:
> >> On 14.05.2025 15:00, Roger Pau Monné wrote:
> >>> On Wed, May 03, 2023 at 11:47:18AM +0200, Jan Beulich wrote:
> >>>> There's no need to write back caches on all CPUs upon seeing a WBINVD
> >>>> exit; ones that a vCPU hasn't run on since the last writeback (or since
> >>>> it was started) can't hold data which may need writing back.
> >>>
> >>> Couldn't you do the same with PV mode, and hence put the cpumask in
> >>> arch_vcpu rather than hvm_vcpu?
> >>
> >> We could in principle, but there's no use of flush_all() there right now
> >> (i.e. nothing to "win").
> > 
> > Yes, that will get "fixed" if we take patch 2 from my series.  That
> > fixes the lack of broadcasting of wb{,no}invd when emulating it for
> > PV domains.
> > 
> > I think this patch would be better after my fix to cache_op(),
> 
> Right, this matches what I said ...
> 
> > and
> > then the uncertainty around patch 2 makes it unclear whether we want
> > this.
> > 
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> With us not running AMD IOMMUs in non-coherent ways, I wonder whether
> >>>> svm_wbinvd_intercept() really needs to do anything (or whether it
> >>>> couldn't check iommu_snoop just like VMX does, knowing that as of
> >>>> c609108b2190 ["x86/shadow: make iommu_snoop usage consistent with
> >>>> HAP's"] that's always set; this would largely serve as grep fodder then,
> >>>> to make sure this code is updated once / when we do away with this
> >>>> global variable, and it would be the penultimate step to being able to
> >>>> fold SVM's and VT-x'es functions).
> >>>
> >>> On my series I expand cache_flush_permitted() to also account for
> >>> iommu_snoop, I think it's easier to have a single check that signals
> >>> whether cache control is allowed for a domain, rather that having to
> >>> check multiple different conditions.
> >>
> >> Right, adjustments here would want making (in whichever series goes in
> >> later).
> >>
> >> For both of the responses: I think with patch 1 of this series having
> >> gone in and with in particular Andrew's concern over patch 2 (which
> >> may extend to patch 3), it may make sense for your series to go next.
> >> I shall then re-base, while considering what to do with patches 2 and 3
> >> (they may need dropping in the end).
> 
> ... here.

By the time I saw your paragraph, I had already written mine, so I
just left it, we reached the same conclusion which is good IMO :).

Thanks, Roger.

