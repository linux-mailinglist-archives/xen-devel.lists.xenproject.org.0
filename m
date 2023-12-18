Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2EB816BFF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655866.1023721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBZF-0008ON-0L; Mon, 18 Dec 2023 11:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655866.1023721; Mon, 18 Dec 2023 11:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBZE-0008M4-Td; Mon, 18 Dec 2023 11:13:48 +0000
Received: by outflank-mailman (input) for mailman id 655866;
 Mon, 18 Dec 2023 11:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5ff=H5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFBZD-0008Km-Cq
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:13:47 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 821e8e98-9d96-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 12:13:45 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3365424df34so1824041f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:13:45 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 z1-20020a056000110100b0033668b27f8fsm2203962wrw.4.2023.12.18.03.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:13:43 -0800 (PST)
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
X-Inumbo-ID: 821e8e98-9d96-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702898024; x=1703502824; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MthIdiXZ78060HMU1lbzNbAvd7gnrX08aSlRwyFs5eU=;
        b=DXHomInmZcII6EN164c5gHMH6axxrnMB3wZ5o0WGRaR7EvR4xyPNhnj45sUrXeTG3a
         DfkVCI7FT3HtjH7h9IeeiGwLULuGeui8CIzaetsDsYH4OwnG1vM38fsMBcwuG4K5dij6
         iEbISsiCSJMWK2d6/yD5l8BajTO9cgpQVSiRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702898024; x=1703502824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MthIdiXZ78060HMU1lbzNbAvd7gnrX08aSlRwyFs5eU=;
        b=snGDJ1jIG0pVT9PQb/KLBRzFHZleCvZGpW6zOBShhkJBB32aiFcokv165JJCnFb6iO
         Z2VV1iLAki0W3BrxwMjqjEad8k9Y8oIhKRVmL66I1UnWBCFvVF+CzT8hPj280cEVGmTM
         7ZGTvA4v/MubGuQ2+V0Dk/XQgmcxZKSp3PIuu2KY5yLxgw0N4rLqRgweDG5PmwZTQ/RX
         E76IEFPh2ArEwdZk8F/aICPLMfUxAIXPeZEsD6VF7G4MRRpKbUvpimxG5DNz/VuZxvi4
         evUBBOu77nWEIaX/v3PnyoIvE/3onXrbK1A5s70YXIgwd2lt/JYsb8E+Ix47zkJDvpri
         48Fw==
X-Gm-Message-State: AOJu0Yy+f7ApqBlAMm7cqu9a/e6Ce4ZybE4fQjE05h5rqXo4JiwjhMsc
	T7VOn398uaG0KmQKpwIwyJiUuQ==
X-Google-Smtp-Source: AGHT+IELDQwAsH7VQY5YgqXQfjhKWISS+NuJrt5NgA5SOi8+NEVY3hsGeGZlTzfKgyGxWhX0bLANCg==
X-Received: by 2002:a5d:4e8c:0:b0:336:66e4:fd77 with SMTP id e12-20020a5d4e8c000000b0033666e4fd77mr1018210wru.131.1702898024463;
        Mon, 18 Dec 2023 03:13:44 -0800 (PST)
Date: Mon, 18 Dec 2023 12:13:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: allow non-BIGMEM configs to boot on >= 16Tb systems
Message-ID: <ZYApZTMGKOKlUdiA@macbook>
References: <4b282f2f-bce8-4c98-897c-2866ec1b6dd0@suse.com>
 <ZXxovHNdNK_OfHUs@macbook>
 <3a41ab3a-c1e6-4371-bd71-26cd97baffd6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a41ab3a-c1e6-4371-bd71-26cd97baffd6@suse.com>

On Mon, Dec 18, 2023 at 09:26:24AM +0100, Jan Beulich wrote:
> On 15.12.2023 15:54, Roger Pau Monné wrote:
> > On Wed, Jun 07, 2023 at 08:17:30AM +0200, Jan Beulich wrote:
> >> While frame table setup, directmap init, and boot allocator population
> >> respect all intended bounds, the logic passing memory to the heap
> >> allocator which wasn't passed to the boot allocator fails to respect
> >> max_{pdx,pfn}. This then typically triggers the BUG() in
> >> free_heap_pages() after checking page state, because of hitting a struct
> >> page_info instance which was set to all ~0.
> >>
> >> Of course all the memory above the 16Tb boundary is still going to
> >> remain unused; using it requires BIGMEM=y. And of course this fix
> >> similarly ought to help BIGMEM=y configurations on >= 123Tb systems
> >> (where all the memory beyond that boundary continues to be unused).
> >>
> >> Fixes: bac2000063ba ("x86-64: reduce range spanned by 1:1 mapping and frame table indexes")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -1722,15 +1722,16 @@ void __init noreturn __start_xen(unsigne
> >>  
> >>      if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
> >>      {
> >> -        unsigned long limit = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
> >> +        unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
> >> +        unsigned long hi = pdx_to_pfn(max_pdx - 1) + 1;
> > 
> > Maybe use max_page to avoid the pdx_to_pfn() call?  (And is also more
> > in context with the condition on the outside if).
> 
> You mean
> 
>         unsigned long hi = min(pdx_to_pfn(max_pdx - 1) + 1, max_page);
> 
> ? I could switch to that, yes. I wouldn't feel well switching to using
> just max_page, especially with me having nowhere to (reasonably) test.

Isn't max_page derived from max_pdx (see setup_max_pdx()), and
hence we could avoid the pdx_to_pfn() conversion by just using it?

max_page = pdx_to_pfn(max_pdx - 1) + 1;

So hi == max_page in your proposed code.

Maybe there are further restrictions applied to max_pdx that are not
propagated into max_page, the meaning of all those variables is very
opaque, and hard to follow in the source code.

Thanks, Roger.

