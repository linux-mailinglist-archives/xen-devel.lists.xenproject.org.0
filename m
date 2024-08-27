Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E306960B4C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783988.1193339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivuj-0004Sh-9G; Tue, 27 Aug 2024 13:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783988.1193339; Tue, 27 Aug 2024 13:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivuj-0004QD-5k; Tue, 27 Aug 2024 13:07:13 +0000
Received: by outflank-mailman (input) for mailman id 783988;
 Tue, 27 Aug 2024 13:07:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sivui-0004Q7-4v
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:07:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44d56ef5-6475-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:07:10 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso888131366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:07:10 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e587843fsm107611966b.153.2024.08.27.06.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 06:07:08 -0700 (PDT)
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
X-Inumbo-ID: 44d56ef5-6475-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724764030; x=1725368830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EliJMsrrSKcenuCp0uAOrekseEJQ3lX7hHDsWNwYTl0=;
        b=Sy2v7UNvCIDu58T+XDQoeOeaCoZCD8k18nhsUtwnp9PHegd9qdCIZl1/AN/CtOiYbf
         NUCmvlj7lWaNf7kwhGMbwhf+3+WONF5XoUWpX6nszSxyeXAV/zxT2wB92LzHq5mRAfwG
         1K7Bj2u6/UAttXEE6ndZYatw/6v5IIrBSGgAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764030; x=1725368830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EliJMsrrSKcenuCp0uAOrekseEJQ3lX7hHDsWNwYTl0=;
        b=IXC5LmfQTUpjCPCJ/VENWIhafMRbI3FEcM6wVDxpEIr38jr/FEMHFL52xyxXLW2QY1
         pYHri54bSAN537Dy/Bp8pJ5ACxHn1xxTRRefV8pvk//jveuzVlEHry9xyg8wyVcxlCj8
         EEJ+7/4/qkOMIjtvFxoz5nyn3AKaDiV54KctyMfmJmW/QXtRp2sIrhHPLFmnBNQynyeb
         RukFdDvpEZH77V+xBQAfWYV4hoBMSUoSgWEPTpSr5AkubvGS0uOXVV3WdN9n1tph8jgc
         IQ9eKTYmG5p2hDbwFtPmEsW7o48ylldPZHgDcQ8YSuxZMF9kJFr0uTiY5hfrkA3/Hd9/
         5nSA==
X-Forwarded-Encrypted: i=1; AJvYcCWX8s7wdr136XtCI0MQ53A2tvH4Q9XhIEb3BcPnvc8epcwvWeey5HTtav8BDUxxT5ftK03pjk7Bxb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0eXRCIngsayMgXXCOW3iYWhRUAdl6VewNL9lOcDeLCD7Su34y
	WxOuSLtUEiLzh9Ygckbxk1aB60bynECmr221mZpjz2ffBCCAh3TaOtAW9yPRhSU=
X-Google-Smtp-Source: AGHT+IHrs6X6OXJt6wGY9nO/i1ilZG0YEz4wZRNvikNONncS7DWZ94oRwCcyLtnqNQmCaehC/uKbkg==
X-Received: by 2002:a17:906:6a0a:b0:a72:4207:479b with SMTP id a640c23a62f3a-a86e28951a0mr323797066b.5.1724764029158;
        Tue, 27 Aug 2024 06:07:09 -0700 (PDT)
Message-ID: <4822571d-efe9-4cab-a016-70ee5f21c256@citrix.com>
Date: Tue, 27 Aug 2024 14:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240827123949.24400-1-roger.pau@citrix.com>
 <734d41c3-709c-4286-8353-f5483b0987cb@citrix.com>
 <d939dffc-e8e3-40cf-8494-c03ae6978c90@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d939dffc-e8e3-40cf-8494-c03ae6978c90@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 2:04 pm, Jan Beulich wrote:
> On 27.08.2024 14:59, Andrew Cooper wrote:
>> On 27/08/2024 1:39 pm, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/dom0_build.c
>>> +++ b/xen/arch/x86/dom0_build.c
>>> @@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
>>>      if ( is_hvm_domain(d) )
>>>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
>>>      else if ( is_pv_domain(d) )
>>> +    {
>>> +        /*
>>> +         * Temporarily clear SMAP in CR4 to allow user-accesses in
>>> +         * construct_dom0().  This saves a large number of corner cases
>>> +         * interactions with copy_from_user().
>>> +         */
>>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>>> +        {
>>> +            cr4_pv32_mask &= ~X86_CR4_SMAP;
>>> +            write_cr4(read_cr4() & ~X86_CR4_SMAP);
>>> +        }
>>>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
>>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>>> +        {
>>> +            write_cr4(read_cr4() | X86_CR4_SMAP);
>>> +            cr4_pv32_mask |= X86_CR4_SMAP;
>>> +        }
>>> +    }
>> I hate to drag this on further still, but can this logic be move it into
>> dom0_construct_pv() itself, rather than here?
> Just to mention it: I'm fine with this in principle, as long as this won't
> mean a pile of new goto-s in dom0_construct_pv(). If a new wrapper was
> introduced (with the present function becoming static), I'd be okay.

I'd be happy with that too.

In fact, static helpers are probably best, seeing as we'll eventually
need real #ifdefary around the cr4_pv32_mask accesses.

~Andrew

