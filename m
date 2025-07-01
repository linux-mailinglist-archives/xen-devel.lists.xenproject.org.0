Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5EBAEEFBB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 09:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029407.1403150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWVNz-00071V-Ir; Tue, 01 Jul 2025 07:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029407.1403150; Tue, 01 Jul 2025 07:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWVNz-0006zK-G7; Tue, 01 Jul 2025 07:26:35 +0000
Received: by outflank-mailman (input) for mailman id 1029407;
 Tue, 01 Jul 2025 07:26:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R3O3=ZO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uWVNy-0006zC-3i
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 07:26:34 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b07073-564c-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 09:26:31 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so1705156f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 00:26:31 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a892e62144sm12579814f8f.92.2025.07.01.00.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 00:26:30 -0700 (PDT)
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
X-Inumbo-ID: b5b07073-564c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751354791; x=1751959591; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uidka5Hi/hCQNlfvHrK8J5qGSjF1rAzQF8hxuLDUMYs=;
        b=UMiuG70IyDNDqtv1NzvSR64ZvMD5Y4G1Ujd+2G8WMdIskeqNpNx1gHE0dG9ZaCNYMz
         Wf1Mdw7NzV7zfks11+rg1EfNw2iXq6k3TGv8io2mJ5aShsFZYsSbWyxRVgUKM0WMbgME
         NqprHWVcDlBLR4Kn+Lrqke+wEMXHhtFyPS8DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751354791; x=1751959591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uidka5Hi/hCQNlfvHrK8J5qGSjF1rAzQF8hxuLDUMYs=;
        b=do2Tq7VX3nkAtxAC2OR/2aAQygXvRrH0AGM4HmAIKHMI1JN9NjtugvwI42e6Ak5LO5
         jKSOvU2MABhGICxAefRZWCSPsxA2t818OYlRrPmT+hcG0a+D2+bPf4ijid/0Cy/+e5NT
         IoHt5HpZqPanFjfbX1whvnVCoCa3VrutqRZIT9M/UPXa3TxMUucUi+u/lkcyI2VF0j4i
         w++PtLLoh9NLijupOW22j/ygxf9lriaRRc7Ek/mSW8/nJQLxiCcL7/ZzvH6LegMcWB5Z
         p8Q1/0jb8l/ZgBj8T9P1KmJJs85zSDiX5OlCe94WBv0nHxXUAWGxbGGryPP31D/ZvT1K
         T0yg==
X-Forwarded-Encrypted: i=1; AJvYcCXE+cMt8KRSrA4OVozAjD79v2+suTKPvgZ7qtjI5EH9XNJV44gQtDu3f2YI8Mt6LLMtp9og0PqrVGU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbkEbrLGUdMn6JzshaD0HAPcKN/o+PWCPOpZP6xN80y0bwdZDl
	Ul7BF5IrReGUGfZ7TplaDjkkI9FFrJhJ/EgO1Jmq7dytFsQTziZe6658IWmo6WY3HDzrbQFKoSZ
	6+JwH
X-Gm-Gg: ASbGncsVIAG8Z8KsB++QFoS9HK52gvLjvkVfDSAToIWMqsy46l1SKkwEiSWcxr+RHS1
	DWASyk3qA5lwxnResv9yshd0bP8f5uiY/x9aAv4L9TyCWO0Jfp6gsope48m982LxQW2rJI/49bJ
	4/JcPjSIzq6q0ZYTTu8k51acx6zE2M8MU6h8uRo7cDjqPecRiCR6eyBXWiURbjVmourzOTAeem/
	UNzRzcIVNHhtRZkEq0yOiIWf8B1PbMy47XzejuGtz/YmIAgwI7oJXQ119pAvCYWtqYXVg+qETG1
	W4FpZVedFPdytFujg2/VTMSaT27zujqaZ6N15cd+DJDyUlTtpnLsXrbsILhO9x0nywnfHpjQUMB
	8OgtXKKQWmkdfvZsSOoUR7B9hYeDwR1DDHwo=
X-Google-Smtp-Source: AGHT+IG/H5qN9Cn8qpDY0j6Y8fUfAmhF7/4r0ghMAcmAcEtrOiwgFesH/1fchfVGgJ9aEx0VWjE09A==
X-Received: by 2002:adf:9c81:0:b0:3a8:6262:e78 with SMTP id ffacd0b85a97d-3a8fe5b1dd8mr8972354f8f.37.1751354790904;
        Tue, 01 Jul 2025 00:26:30 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:26:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
Message-ID: <aGONpe_v9_r7USAf@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
 <e0339b2b-86cd-45ad-9b6f-a5e8ddbc623c@suse.com>
 <aFwish8zET1W6-CC@macbook.local>
 <475fb02b-0b00-4aab-b73c-9604fe050074@suse.com>
 <aF6wAh2VaMc9mYV-@macbook.local>
 <48882150-ed23-4810-b773-74748b9b3cae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48882150-ed23-4810-b773-74748b9b3cae@suse.com>

On Sun, Jun 29, 2025 at 04:36:25PM +0200, Jan Beulich wrote:
> On 27.06.2025 16:51, Roger Pau Monné wrote:
> > On Thu, Jun 26, 2025 at 09:35:04AM +0200, Jan Beulich wrote:
> >> On 25.06.2025 18:24, Roger Pau Monné wrote:
> >>> On Tue, Jun 24, 2025 at 06:16:15PM +0200, Jan Beulich wrote:
> >>>> On 20.06.2025 13:11, Roger Pau Monne wrote:
> >>>>> +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
> >>>>> +{
> >>>>> +    unsigned long pfn = PFN_DOWN(base);
> >>>>> +
> >>>>> +    return pdx_to_pfn(pfn_to_pdx(pfn) + npages - 1) == (pfn + npages - 1);
> >>>>
> >>>> Aiui for this to be correct, there need to be gaps between the ranges
> >>>> covered by individual lookup table slots. In the setup logic you have a
> >>>> check commented "Avoid compression if there's no gain", but that doesn't
> >>>> look to guarantee gaps everywhere (nor would pfn_offset_sanitize_ranges()
> >>>> appear to)?
> >>>
> >>> But if there are no gaps, the full region is covered correctly, and
> >>> hence it's compressible?
> >>
> >> If there's a guarantee that such ranges would be folded into a single one,
> >> all would be fine.
> >>
> >>> Maybe I'm missing something, could you maybe provide an example that
> >>> would exhibit this issue?
> >>
> >> My understanding is that when there's no gap between regions, and when
> >> [base, base + npages) crosses as region boundary, then the expression
> >> above will yield true when, because of crossing a region boundary, it
> >> ought to be false. Or did I simply misunderstand the purpose of the
> >> pdx_is_region_compressible() invocations?
> > 
> > If there's no gap between the regions it's IMO intended for
> > pdx_is_region_compressible() to return true, as the whole region is
> > continuous in both the PFN and PDX spaces, and hence compressible
> > (even if it spans multiple regions).
> 
> My problem is that I can't make the connection between that function
> returning true and regions getting concatenated. When the function is
> invoked, concatenation (or not) has happened already, aiui.

According to my understanding, a region is compressible if there's a
contiguous PDX translation that covers the whole region.  And I agree,
concatenation or not doesn't really matter here.

> > But maybe I'm not understanding your point correctly, could you maybe
> > provide an example if you disagree with my reply above?  Sorry if I'm
> > being dull, with this compression stuff it's sometimes hard for me to
> > visualize the case you are trying to make without a concrete
> > example.
> 
> What I think I didn't take into consideration is that from two pages
> being contiguous in MFN space, it ought to follow they're also
> contiguous in PDX space. Hence [base, base + npages) crossing a region
> boundary (if, contrary to what you say, this was possible in the first
> place) would still not be encountering a discontinuity. So overall not
> an issue, irrespective of what pdx_is_region_compressible() means
> towards (non-)contiguity.

OK, so I think we are in agreement that region crossing in
pdx_is_region_compressible() is not an issue, as long as regions are
contiguous.

Thanks, Roger.

