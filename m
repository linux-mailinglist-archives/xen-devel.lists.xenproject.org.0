Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C8283C2A8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 13:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671494.1044854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSyzJ-0001v8-1D; Thu, 25 Jan 2024 12:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671494.1044854; Thu, 25 Jan 2024 12:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSyzI-0001sj-UF; Thu, 25 Jan 2024 12:37:44 +0000
Received: by outflank-mailman (input) for mailman id 671494;
 Thu, 25 Jan 2024 12:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSyzH-0001sd-IX
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 12:37:43 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e43c91-bb7e-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 13:37:41 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso72974185e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 04:37:41 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b0040eaebc4e8fsm2511170wmo.1.2024.01.25.04.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 04:37:40 -0800 (PST)
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
X-Inumbo-ID: 87e43c91-bb7e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706186261; x=1706791061; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=luCEpTxw4XQv55unlWcwjxK8MY6VPEoYnYmGzG9GLF0=;
        b=FXfCsPos0/dijwXzth9gKUi0nIUWOv3Vnwla18gzLqMT0mfNVfZqsfI6QCDSA1r25v
         VzP53Or/XtJyraa1B5OwmClHceprB94xvh4XvGeqPOdmYHdY/ytSFhFCZnhtSnEvzjSC
         9va5LaczKoZYJrViPol8n/mI6GOSVTjmoq4Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706186261; x=1706791061;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luCEpTxw4XQv55unlWcwjxK8MY6VPEoYnYmGzG9GLF0=;
        b=sd0R2kL/b+k4KBokTbiLhTFZBJ+n+SW+PSbUx7yDqh8pBqMjlSp5smC54fN/AEz5Nm
         Af2yjPvUegQ5Xw+95x4c5d9P7pQxg0zFwU5nWxcDEC4ML44i+E8e7VqFTJYOQTja0mvW
         6Uw/svJeTn8ZgrNmsCE5ZpbYiuWG7yP61oJkPgaDI1kZmnK0GfRFnUWdF5Q103SKdV6W
         3SNap22ovDW3XiFvo/wGvBobYC4r6GL8f2q3Whjb2xG+1iHl3VBsumekgypFulJ+Bi8p
         KQWbPxWa6Sw9SD88bEg1KAQB9ploIHvVjoegoYfT2uYf+LBUS8bnLvcv3mzcnzEbECUv
         20VQ==
X-Gm-Message-State: AOJu0YwGrP7C/hYcrHwfVqweRI2o51tU/1AkYjU341aqYuwEHTPiaXqR
	i1fYGNZmA5FKHx1sFOx0Shz0DThycOs3lV5PcLubnn6o2wrvoPNZmXkAvZuNpdc=
X-Google-Smtp-Source: AGHT+IHR9kr7BpN1LT7qZinY6LGjXvtKIW2EQOGa6pFcVpg09zC9v4b1K9/owk/0BCwPwfLFaLDZ/A==
X-Received: by 2002:a7b:c389:0:b0:40e:52ca:3043 with SMTP id s9-20020a7bc389000000b0040e52ca3043mr318709wmj.131.1706186261047;
        Thu, 25 Jan 2024 04:37:41 -0800 (PST)
Date: Thu, 25 Jan 2024 13:37:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/3] x86/iommu: remove regions not to be mapped
Message-ID: <ZbJWE2HhCo_IHBpF@macbook>
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-2-roger.pau@citrix.com>
 <ad178469-15c3-4ae5-8538-e927f1116a42@suse.com>
 <ZbIgE8exXDVicN8D@macbook>
 <ed221b62-0151-45ce-a88d-d7e2a9946136@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed221b62-0151-45ce-a88d-d7e2a9946136@suse.com>

On Thu, Jan 25, 2024 at 12:13:01PM +0100, Jan Beulich wrote:
> On 25.01.2024 09:47, Roger Pau Monné wrote:
> > On Thu, Jan 25, 2024 at 09:34:40AM +0100, Jan Beulich wrote:
> >> On 24.01.2024 18:29, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/hvm/io.c
> >>> +++ b/xen/arch/x86/hvm/io.c
> >>> @@ -369,6 +369,22 @@ bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
> >>>      return vpci_mmcfg_find(d, addr);
> >>>  }
> >>>  
> >>> +int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
> >>> +{
> >>> +    const struct hvm_mmcfg *mmcfg;
> >>> +
> >>> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
> >>> +    {
> >>> +        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
> >>> +                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
> >>
> >> Along the lines of this, ...
> >>
> >>> --- a/xen/arch/x86/setup.c
> >>> +++ b/xen/arch/x86/setup.c
> >>> @@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
> >>>      return 0;
> >>>  }
> >>>  
> >>> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
> >>> +{
> >>> +    paddr_t start, end;
> >>> +    int rc;
> >>> +
> >>> +    /* S3 resume code (and other real mode trampoline code) */
> >>> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
> >>> +                               PFN_DOWN(bootsym_phys(trampoline_end)) - 1);
> >>
> >> ... did you perhaps mean
> >>
> >>                                PFN_DOWN(bootsym_phys(trampoline_end) - 1));
> >>
> >> here (and then similarly below, except there the difference is benign I
> >> think, for the labels being page-aligned)?
> > 
> > They are all page aligned, so I didn't care much,  but now that you
> > point it might be safer to do the subtraction from the address instead
> > of the frame number, just in case.
> 
> Hmm, no, for me neither trampoline_end nor trampoline_start are page
> aligned. While bootsym_phys(trampoline_start) is, I don't think
> bootsym_phys(trampoline_end) normally would be (it might only be by
> coincidence).

Oh, so it had been a coincidence of the build I was using I guess then.

Thanks, Roger.

