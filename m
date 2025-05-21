Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17CABF809
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991991.1375769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHke6-0001ht-U8; Wed, 21 May 2025 14:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991991.1375769; Wed, 21 May 2025 14:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHke6-0001gS-RK; Wed, 21 May 2025 14:42:14 +0000
Received: by outflank-mailman (input) for mailman id 991991;
 Wed, 21 May 2025 14:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHke5-0001g2-CX
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:42:13 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c77eead0-3651-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 16:42:11 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad53a96baf9so800476566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:42:11 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04b073sm898590966b.27.2025.05.21.07.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 07:42:10 -0700 (PDT)
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
X-Inumbo-ID: c77eead0-3651-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747838531; x=1748443331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fm8dZemQlRt96oetnrEy09QGZuP7WE9DX8CaQgTbvYg=;
        b=WMASRhtirkZqKtdavi6N3/py3VmGXw3h5giUYdfEOYJFHxLlXsR3XUUHPpkX9JYboE
         SdsijY1r7/4VE4tAdqfwZSGTd6ZVya1axAAUebq3/jwUfulupb8c9RJrQZTYqzsNpXgg
         IsKpTin+kcXelPBBz9r02b/tbO6+gBhEr1kkYyoM/JRbOdPqVOUOEbV4tHOsL+xHiR02
         uUK3xmRfGqqUd2Bs/WcGH9HAcvZka5mnAWJhAnlshDV7VjJRwyrEIKJDWSgUP2HljAgp
         Dm8nlMowwB5DifS/Tlc/HKIUbpnEJfObknHwBcQndwyoF5GRyKoEVZk09TJNIx2U2NRz
         WYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838531; x=1748443331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm8dZemQlRt96oetnrEy09QGZuP7WE9DX8CaQgTbvYg=;
        b=NdPl28smt0R4PnKuJ5I7shg8vXNUAqeG0YUi9AjZ6ZShNRA94zBAvinpRrNM8ioj2k
         spVSdv23YYORgKkQix0fBEt0uWiP6JKtjrv4+ua2fhUM9UbU+HcRhj6QK3v0YB9p5fXH
         i6NbbUwHOJOH+UHjXx28KnURIXUH5XnR1Y8CH+osV4zME+/QsjRmzntda/EThA20TajE
         Ak/x10qSgSkjt1bwzgozXlTLwcegF8AXAC7TDPpr/PHF62tJIHdaNzB9Mv4cI/Zc78O3
         nKIwFt1cRRGNLKgH44aNa9icZY5MBUUic4dyrqCa9Gx3OIfSpoJJL7fLxA3YOcrcfVE4
         ztIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBHPvxci1eWAcng59Zbdoq3k2AOJWOp5KeaesE4C2nIyBpeb8tmHm88vIX50YZQLPGKpkfiaPfTlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRrAQaXUMr1DX9YvPM2gN90ittYbGnqODClTTFZ/W/bRc2QwVM
	MEtgIYFKoHtY8I2dpFt5S/G4Gy61Mip9dvyUq0eeCpY+k5zeaE3XKHdPl4mNcGFCsQ==
X-Gm-Gg: ASbGncva/K3AcFw4onvlj5igxB6ya2+4faZNNoaC+m1muwpEzKXRkgfpKlXrf2lqrTW
	ZAqi+bP/UqYtxD1zc1RUrNs5uuKVrzdDUTyeBk0WY5P8e39Cjomj63RngkLdin5c1L7rb4kHMxK
	tzBDLqoOYMnIV0ZrKzrQ0Ca6tnpwgu01/71JafM7Fc4AlLvCZmM0KlauLClBzoeretXkBntPOSz
	7fsOXClyXAB41G9syaikNow2z1qDWEoYZ5ctLw45OV9ZT/2g0Nj1mfHArKRUzxMRijCQVBE3yh4
	iFUV0bLMLmBWZlonJiNobRkU22NP5rdJaOgfH0zOBTZbYoeLYMfYUH3bgCOA3u0lg4NN770t
X-Google-Smtp-Source: AGHT+IHPmqnesP22p+YCh5P/RuB9mzR9mwqMKDdeYQ3Weh8TRyY+4IrNpFLqOf8zUtKR+VQtjmJ76g==
X-Received: by 2002:a17:906:f5a0:b0:aca:b72b:4576 with SMTP id a640c23a62f3a-ad52d509d1dmr1846497966b.33.1747838531096;
        Wed, 21 May 2025 07:42:11 -0700 (PDT)
Message-ID: <f601a1c1-c907-4e2d-878f-dc57507eb295@suse.com>
Date: Wed, 21 May 2025 16:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hyperlaunch/dom0less code sharing
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Michal Orzel <michal.orzel@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 16:35, Alejandro Vallejo wrote:
> I think we should aim to share binding code wherever possible, using common
> datastructures (kernel_info and bootmodule) as dumping ground for the results
> of the binding parsing functions. I seek agreement on the following 3 points
> for the end goal of DTB multidomain boots on x86 before I start slicing
> my hacks into reasonable chunks.
> 
>   1. We want common data structures, with arch-specific fields to hold
>      information from xen,domain DT nodes
>   2. We want to have a single collection of DTB parsers in the code.
>   3. We want to operate on the unflattened DTB for the majority of parsing.
>     (plus a minimal version on the FDT in order to bootstrap, also common)

+1 on all three, with the caveat that I'm far from being an expert on DT.

Jan

> (2) and (3) are tightly related. There's many reasons for wanting to use the
> unflattened blobs as much as possible. They range from quirks in specific "dtc"
> versions, to complexities parsing phandles, to corner cases involving duplicate
> properties (i.e: due to .dtsi files), etc. Unflattening an FDT brings a
> lots of "maybe-ok-after-sanitising" FDTs back into canonically correct DTs.
> 
> I'll share the PoC code as soon as as it's in a presentable state.
> Hopefully by the end of the week. But I'm sending this ahead of time to
> start collecting thoughts right away.
> 
> So. Thoughts?
> 
> Cheers,
> Alejandro


