Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A4A35FAA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 14:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888836.1298118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiwBu-0004N3-TE; Fri, 14 Feb 2025 13:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888836.1298118; Fri, 14 Feb 2025 13:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiwBu-0004Lb-QX; Fri, 14 Feb 2025 13:57:14 +0000
Received: by outflank-mailman (input) for mailman id 888836;
 Fri, 14 Feb 2025 13:57:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zro/=VF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tiwBt-0004LC-8T
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 13:57:13 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96402c87-eadb-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 14:57:11 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so350617866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 05:57:11 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53231fcasm346282866b.25.2025.02.14.05.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:57:10 -0800 (PST)
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
X-Inumbo-ID: 96402c87-eadb-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739541431; x=1740146231; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJHAQoV9/WjhoEy/v9FKjV2EbOykafK/7ZZBeml9kuM=;
        b=r8xiMLdFUvLlJO5RHrE7DNMjEAE0bK/BzkXX62Ou794SOjp9osDZtGq65Qc5mG307z
         X5CnduegziRmk22Q+2r+VKpV2H5EFlg/oKo41Pl5q6FItJDAXT41gDFpXfieNqjuEb5m
         8PJMZ1wMMzVHgG1sazrTVAmfz7UNROdAMEu08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739541431; x=1740146231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJHAQoV9/WjhoEy/v9FKjV2EbOykafK/7ZZBeml9kuM=;
        b=kdYifEk3orSWcOncQ2bgtWC/wNIxJ7IwttPH6UZHkwPAFiQh6dspZKgytY+msjAQdm
         DOouyVegu9tF7MNjUXZeEjtn0sN56moSo14lW3GmS5st1L17hDvHGBUSeuPZuRFwTKXe
         PJT9sEnKfke5XPDlx1Hctll2cjJeFwc4rN69SpZevzffGCzn+EHtqFwByA7vI1cyPlnJ
         sPAc8qYPHWppx9pxV8Wmahzn4/ovI+l3rd/bfAXF1xXrlwHKs2VfqOndtwoURoFBm+hh
         Pziey5slU+jaDfV58DYSjA7qIaxK+dJR97jxsZccCA1CyvZJNQmyIQwcFtA1cQzDTe/t
         Yj1A==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3jEqCIN52Uu59DvD4vVBur/hHNKU/u5FNf031DpZfhgUzArpX1+KO/CKcfhUSangkrUAv2xd+7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzriCVNO/umUbwXdvhBTFTN1ZcalvWiR2MKnYKT2dsxK+HiVHBG
	Bvz9dkmSb89A6oLcnW95ewkCauREv9XnLDlJU0Aaf6IS46z/kqkayPrBNykB2pM=
X-Gm-Gg: ASbGncukev1Fvlx+vNmArwznE4DWInJRhpSXo53YZT6TDx/difm5Og+RKG4TzRdiM6T
	a8oI5NPgp6a232jRZXHzKKc19c+vZ1pMb8/tg3Azlf56cswUGRyNXcKqxJrR5W8s+1yigPJNW6R
	D9mAChLtHbEpc0osz839gGo7uviDWw/Go1gTE4/VttwlHRzO+TfSO8dCVVkKRMZ4KBdRf7QskHa
	kql1KhgKVJWSPlyG8tT2Xn3RmKuY4//g0cvHLyB5W9CDBGxq91ImSUoPN8aX/GxOjLTAM1ec6ma
	ZWXmMZcpptloAb2T+vU5
X-Google-Smtp-Source: AGHT+IFNIAciNCBiO7KDdHYHC2gGLwCCJfGllXZn9Xz5W6BAm/oLtpG3st0bKl0Z6kBSPrOmQW1nSw==
X-Received: by 2002:a17:907:7f27:b0:ab6:efc5:5d73 with SMTP id a640c23a62f3a-ab7f33bd292mr948139366b.24.1739541430602;
        Fri, 14 Feb 2025 05:57:10 -0800 (PST)
Date: Fri, 14 Feb 2025 14:57:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.20?] x86/dom0: be less restrictive with the
 Interrupt Address Range
Message-ID: <Z69Ltd5cvwMuoYVa@macbook.local>
References: <20250212153800.5159-1-roger.pau@citrix.com>
 <5bd90a77-eb82-438f-8f78-bfcf98507d58@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5bd90a77-eb82-438f-8f78-bfcf98507d58@suse.com>

On Fri, Feb 14, 2025 at 02:01:09PM +0100, Jan Beulich wrote:
> On 12.02.2025 16:38, Roger Pau Monne wrote:
> > There's also the following restriction noted in Intel VT-d:
> > 
> >> Software must not program paging-structure entries to remap any address to
> >> the interrupt address range. Untranslated requests and translation requests
> >> that result in an address in the interrupt range will be blocked with
> >> condition code LGN.4 or SGN.8. Translated requests with an address in the
> >> interrupt address range are treated as Unsupported Request (UR).
> > 
> > However this restriction doesn't apply to the identity mappings possibly
> > created for dom0, since the interrupt address range is never subject to DMA
> > remapping.
> 
> Coming back to this also with your on-demand-p2m-populating patch in mind:
> I'm having some trouble following your comment on this quotation. The doc
> text is quite clear that page table entries must not point at the interrupt
> address range. They don't make an exception for identity mappings. And we
> don't know how the IOMMUs internally work, e.g. what sanity checks they do
> (and what failure thereof would result in).

My understanding is that address translation will never happen for the
interrupt address range, so whatever gets mapped on that range will
never be translated by the IOMMU.  Hence for the specific case here,
there will never be untranslated request that result in an address in
the interrupt address range, because translation is not done for input
addresses in the interrupt address range.

Sorry, hope the above makes sense, I'm having a hard time trying to
write down what I understand happens when the IOMMU handles accesses
to the interrupt address range.

Maybe a diagram would be easier.  This is my understanding of how
translation works in the IOMMU:

 input address -> translation -> output address

However input addresses that are in the interrupt address range are
not subject to translation, and hence there's no output address that
can be subject to the quoted VT-d paragraph.

> Instead I'm now wondering whether we don't need to
> - prevent ept_set_entry() from propagating to the IOMMU mappings targeting
>   the interrupt range,
> - demand non-shared page tables if any such mapping is to be established
>   in the CPU page tables.
> 
> Then again I won't assert that my interpretation of that quoted text makes
> sense at all.

See above, *I think* the quoted paragraph only applies to output
addresses, and in the case of mappings created on the interrupt
address range there's simply no output address.

Thanks, Roger.

