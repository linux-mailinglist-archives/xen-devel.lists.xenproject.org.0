Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A5E582AB8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 18:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376343.609046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjon-0004zV-4O; Wed, 27 Jul 2022 16:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376343.609046; Wed, 27 Jul 2022 16:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjon-0004xZ-1L; Wed, 27 Jul 2022 16:23:29 +0000
Received: by outflank-mailman (input) for mailman id 376343;
 Wed, 27 Jul 2022 16:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGjok-0004xT-Us
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 16:23:26 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70c07bc8-0dc8-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 18:23:25 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id oy13so32415723ejb.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 09:23:25 -0700 (PDT)
Received: from [192.168.1.93] (adsl-141.176.58.136.tellas.gr. [176.58.136.141])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a50fc85000000b0043bc4b28464sm10378953edq.34.2022.07.27.09.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 09:23:24 -0700 (PDT)
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
X-Inumbo-ID: 70c07bc8-0dc8-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G08N5bSFGkYSDwBXKJmOXPlcD7JJ7qUNPKUzzL2YRMo=;
        b=jH/aUNJhGEN2yDr7xmJg50wJhLtoOLP2Lnee96Joo+252KIel/gEr4r1l63NOgZNRT
         kh37tl8nRA6lXA74eWWdGzlOqbmC9xo4ZhyK1+o/eZ9qQje2wTV+3UVXLOg30bfexRiF
         jSCK4bT6M0h5aoRchm1InB6Msp8oqPcnHZqaD4+Cd4Y9MFzprMJ4Y1kTw7badxnmtGMJ
         Dahjj8FumR6YUuvh69/02emuhRUFVg81gdiJcqcmt7p+y/Qrr3G5wBTQSp1amcnbQi7E
         OeM9svmfqZrmbZ6KRLXFh+K4PbofkchkpFyuc0BI1yeRpBERiCdHSe7QLODliFrgq0bZ
         4apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G08N5bSFGkYSDwBXKJmOXPlcD7JJ7qUNPKUzzL2YRMo=;
        b=3wfhZLgVAOFpZrKsIHUjwxM/MZ5ECK1zPSSNugqMyvKMrn9cPxx62HI+RccPCOHsUr
         M58pBDuNlVFTTEES7pN20iizMEshhfybywjQndppelPGo7vr+rSUqM1rBUGGpiMQZdAs
         LO+YfTJNKGOwpgk/qcKmKVAbv1wBv1U1wmru5QUfi+co/r4hid+bxn9W+m2fNdhiE+7g
         7U8dHJ2pLbUM3+FXTWXBHswWNNFf7O4xyTGZZf93AlBuUYQrR0gTJyQsf4zpSzFMB6iE
         S7vfYKYoICpruaq3fZpuzKE+tEERjeB3W3HFZOVOgqIB0lCuvrW5JqZ3NDVy6fzPmGcm
         Iw4w==
X-Gm-Message-State: AJIora8rdCEtX/mW+33SkOu6wtiI2t39JZtQX5ScG8J15f2PKpfkCKcy
	M2shtc6oWstSqB+/U5ZE3EU=
X-Google-Smtp-Source: AGRyM1usJOxVG0oiNbvsRebl/ycuSg1W+h4IJ+Si5kFTp0R4ehTdG+LMcSPXJWGJXa59MyUo4INXaQ==
X-Received: by 2002:a17:906:7482:b0:722:edf9:e72f with SMTP id e2-20020a170906748200b00722edf9e72fmr17865294ejl.92.1658939005123;
        Wed, 27 Jul 2022 09:23:25 -0700 (PDT)
Message-ID: <f438445d-cab5-4024-43d3-eb272144e3db@gmail.com>
Date: Wed, 27 Jul 2022 19:23:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
 <20220727153254.1143503-3-burzalodowa@gmail.com>
 <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

On 7/27/22 18:46, Julien Grall wrote:
> Hi Xenia,
> 
> On 27/07/2022 16:32, Xenia Ragiadakou wrote:
>> Remove unused macro atomic_xchg().
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>   xen/arch/arm/include/asm/atomic.h | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/atomic.h 
>> b/xen/arch/arm/include/asm/atomic.h
>> index f5ef744b4b..a2dc125291 100644
>> --- a/xen/arch/arm/include/asm/atomic.h
>> +++ b/xen/arch/arm/include/asm/atomic.h
>> @@ -223,8 +223,6 @@ static inline int atomic_add_unless(atomic_t *v, 
>> int a, int u)
>>       return __atomic_add_unless(v, a, u);
>>   }
>> -#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
>> -
> 
> While I agree this is unused today, the wrapper is quite trivial and 
> part of the generic API (x86 also provides one). So I am not in favor of 
> removing it just to please MISRA.

That's fine, the rule 2.5 is advisory. I sent the patch because I 
noticed that the macro was unused, just in case ...

> 
> That said, if Bertrand and Stefano agrees with removing it then you 
> should also remove the x86 version to avoid inconsistency.
> 
> Cheers,
> 

-- 
Xenia

