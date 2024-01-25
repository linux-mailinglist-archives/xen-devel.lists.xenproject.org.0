Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD883C4E6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 15:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671581.1044994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0rD-0006fy-Mn; Thu, 25 Jan 2024 14:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671581.1044994; Thu, 25 Jan 2024 14:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0rD-0006eR-Ja; Thu, 25 Jan 2024 14:37:31 +0000
Received: by outflank-mailman (input) for mailman id 671581;
 Thu, 25 Jan 2024 14:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rT0rB-0006aU-W6
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 14:37:30 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43cd7c20-bb8f-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 15:37:28 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso74469845e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 06:37:28 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4b10000000b00337d4eed87asm18015011wrq.115.2024.01.25.06.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 06:37:28 -0800 (PST)
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
X-Inumbo-ID: 43cd7c20-bb8f-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706193448; x=1706798248; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7bFLGc7BhJ4cTj8Pb0JctkaL5XiuuEOipLP9umyOTpA=;
        b=mud5y/sJJiy9b447cm7ck2seJQXCfCPhbA0tF56PlunE/D24YJFzFtZTg7q6EdFI7E
         GhaXHlT5xe2bgyR/+XTHbcP6HzLTAS6xGr9Fg5+5YCPd+OJPOA7mRkbbPicJfdNfG0c5
         zC4+JegVprMSikYNiKRqStPt5WchugOTQQNyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193448; x=1706798248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bFLGc7BhJ4cTj8Pb0JctkaL5XiuuEOipLP9umyOTpA=;
        b=swLbU8CW77rkvR8+V0SwtN62S9xPC+CgctS1kU2T4mUlqM3YIEQSG7skG+8pAPzN0a
         jlzjcJYS8l47QI0p4jzDhfAMnPUZc58ti8GvD9YZy5TXUl6YKKwGBHnkBgkKi+cmA7BH
         AseRiOkYbMPKW0l3o9KCrc65dBzaDI7fm3mIgef656ahTIhLp5fmPKPdWIjRsfkrgXMa
         K7TBgVBQQTaT8Olj4bJF9kVzFJN3RzupHhPvSkxLEoIOidQWlJw8boK8bb0T3ykFSG+S
         1XWqVT36j8tMT7ToJnlRswHNjWQmqxmBt71yUQ6gsUhucqohI1hw0JC9IGQayZ2ko+dj
         OS8Q==
X-Gm-Message-State: AOJu0YxwWCiJP46grvL9JoSTOZ9z9sC5ARV8zXR6EFRqS5yDVtvhPoJB
	c3lnN8my3AwqMUMMbJr0QhnnOMAT2IzF4bHOF96MNpcgb2uPgqo0i/G/4K/te1o=
X-Google-Smtp-Source: AGHT+IH/M26Qc7QMX4m+SSjXx8oYoELdzsHw8Yq08Z9VpAzWRKMjH5/QOWI405eXNrWJXb+pmIA3uA==
X-Received: by 2002:a05:600c:474b:b0:40e:b284:c333 with SMTP id w11-20020a05600c474b00b0040eb284c333mr444168wmo.1.1706193448269;
        Thu, 25 Jan 2024 06:37:28 -0800 (PST)
Date: Thu, 25 Jan 2024 15:37:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/3] x86/iommu: remove regions not to be mapped
Message-ID: <ZbJyJywf34uFxl0I@macbook>
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-2-roger.pau@citrix.com>
 <ad178469-15c3-4ae5-8538-e927f1116a42@suse.com>
 <ZbIgE8exXDVicN8D@macbook>
 <ed221b62-0151-45ce-a88d-d7e2a9946136@suse.com>
 <ZbJWE2HhCo_IHBpF@macbook>
 <be2ccc2e-f311-4368-86b3-bdf5edd0c2b6@citrix.com>
 <4b8f5b3e-456d-4bc5-94a4-d7a0c77563a2@suse.com>
 <d39c739b-fe27-4471-94a9-b56734985a30@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d39c739b-fe27-4471-94a9-b56734985a30@citrix.com>

On Thu, Jan 25, 2024 at 01:22:15PM +0000, Andrew Cooper wrote:
> On 25/01/2024 1:13 pm, Jan Beulich wrote:
> > On 25.01.2024 13:55, Andrew Cooper wrote:
> >> On 25/01/2024 12:37 pm, Roger Pau Monné wrote:
> >>> On Thu, Jan 25, 2024 at 12:13:01PM +0100, Jan Beulich wrote:
> >>>> On 25.01.2024 09:47, Roger Pau Monné wrote:
> >>>>> On Thu, Jan 25, 2024 at 09:34:40AM +0100, Jan Beulich wrote:
> >>>>>> On 24.01.2024 18:29, Roger Pau Monne wrote:
> >>>>>>> --- a/xen/arch/x86/hvm/io.c
> >>>>>>> +++ b/xen/arch/x86/hvm/io.c
> >>>>>>> @@ -369,6 +369,22 @@ bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
> >>>>>>>      return vpci_mmcfg_find(d, addr);
> >>>>>>>  }
> >>>>>>>  
> >>>>>>> +int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
> >>>>>>> +{
> >>>>>>> +    const struct hvm_mmcfg *mmcfg;
> >>>>>>> +
> >>>>>>> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
> >>>>>>> +    {
> >>>>>>> +        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
> >>>>>>> +                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
> >>>>>> Along the lines of this, ...
> >>>>>>
> >>>>>>> --- a/xen/arch/x86/setup.c
> >>>>>>> +++ b/xen/arch/x86/setup.c
> >>>>>>> @@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
> >>>>>>>      return 0;
> >>>>>>>  }
> >>>>>>>  
> >>>>>>> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
> >>>>>>> +{
> >>>>>>> +    paddr_t start, end;
> >>>>>>> +    int rc;
> >>>>>>> +
> >>>>>>> +    /* S3 resume code (and other real mode trampoline code) */
> >>>>>>> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
> >>>>>>> +                               PFN_DOWN(bootsym_phys(trampoline_end)) - 1);
> >>>>>> ... did you perhaps mean
> >>>>>>
> >>>>>>                                PFN_DOWN(bootsym_phys(trampoline_end) - 1));
> >>>>>>
> >>>>>> here (and then similarly below, except there the difference is benign I
> >>>>>> think, for the labels being page-aligned)?
> >>>>> They are all page aligned, so I didn't care much,  but now that you
> >>>>> point it might be safer to do the subtraction from the address instead
> >>>>> of the frame number, just in case.
> >>>> Hmm, no, for me neither trampoline_end nor trampoline_start are page
> >>>> aligned. While bootsym_phys(trampoline_start) is, I don't think
> >>>> bootsym_phys(trampoline_end) normally would be (it might only be by
> >>>> coincidence).
> >>> Oh, so it had been a coincidence of the build I was using I guess then.
> >> trampoline_start has to be page aligned because of constraints from SIPI
> >> and S3 (cant remember which one is the 4k constraint, but it's in the
> >> comments).
> > What you're talking about is the copy of the trampoline code/data in
> > low memory. trampoline_{start,end} themselves point into the Xen image.
> 
> True, but we're operating on bootsym_phys(trampoline_start) which had
> better be aligned.
> 
> We hard-code (by virtue of only filling in 1 single 4k PTE in the
> pagetables) that the AP trampoline is 4k.
> 
> The range here should be 4k only too, or we're (falsely) marking lowmem
> adjacent to the AP trampoline as a Xen range when it's not.

Hm, looking at zap_low_mappings() we do seem to possibly map more than
one page, in fact on my current build trampoline_end -
trampoline_start is 6528.

Thanks, Roger.

