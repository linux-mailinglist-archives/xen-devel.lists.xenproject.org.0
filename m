Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13612696ABB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 18:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495414.765788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyiK-0001dO-Jc; Tue, 14 Feb 2023 17:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495414.765788; Tue, 14 Feb 2023 17:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyiK-0001aW-Fx; Tue, 14 Feb 2023 17:03:32 +0000
Received: by outflank-mailman (input) for mailman id 495414;
 Tue, 14 Feb 2023 17:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsmO=6K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRyiI-0001aI-8P
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 17:03:30 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 805f7510-ac89-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 18:03:28 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id lf10so9846598ejc.5
 for <xen-devel@lists.xenproject.org>; Tue, 14 Feb 2023 09:03:28 -0800 (PST)
Received: from [192.168.67.143] ([62.74.15.167])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a170906038c00b0088f464ac276sm8391847eja.30.2023.02.14.09.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 09:03:27 -0800 (PST)
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
X-Inumbo-ID: 805f7510-ac89-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwTDOu/UKpaDwzmG/FhiUx684yLoVKwSEQAiFT8j9v0=;
        b=Ej5llmrtwEGFkGBi3L3juHBYTdt8ZXFP0Ic1lp4yUIjCtM8+V8jZV6AbZczjphshC/
         /tq/yy1unpoAX7ilmxRMnZQF6EQJcKOuEMqDH/O2/KTR40Lmkl+3rPAiGCdrmejoESrg
         av1Ht7fdEeHBcp+lT+HIy2ZEpAgz4WWWTuFa2ZVm0AFHdbW4aZkGFcwMwlfHFObC0ewr
         u3rrXVHbUPC5XxOT0hC2ItqWbVQKkXgpAb9tDoK9mm5MSVil3Wv+L9UbNSd9m2oplELf
         AmjIKA1VEORsWtb3kh8B8p1CF2KKHj+dBB2h9WQ00oNe4PAVCA3gIooIcxmp+4grZiCi
         DfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwTDOu/UKpaDwzmG/FhiUx684yLoVKwSEQAiFT8j9v0=;
        b=xHRJlTLZxVgNlVbko4kPQ2MUruXxUsrAKefsGK0wM1t0JoBUtdeWWI8gt23A/KnZj4
         0vn6QubBKLGGV6uuw6jlYHZVCFHOwxjzF0SCuzSVHQ8CsiI/Nm3ltXvdFQXIZhlxfBqI
         JE5D6mj7o21sweDNsZczJIUaP1mUeXYAfPjB9Bh49f5d9s0ZIavfR/hOdSZpCeqw4x6V
         32W5g8L9gskrxodMUmqx4JV0YEk4jd6Kj2yNVM4AA0Rlo5X6ZDNsQU/p4Tjwd8669xsU
         2RQheNCUfSxD/ed9uHjfjtLyLWfd0+Vl0KfxizoTHQcYlCNQC9n+fhvEnG/30uxvjq40
         liNQ==
X-Gm-Message-State: AO0yUKX6QIoXFxE+7efhwEusJQuM6L6/o30usatJdCSpb34SC1aIItgq
	UAyBPFgr47Xyjbm7gRb1SV8AXpBL44I=
X-Google-Smtp-Source: AK7set+TFg7/zQUrqm7WjAqPmoOyo/Gd75PVWxhHJLeE6xZHxOm1+dMPjiux/A5EluDfDu4jCW+qgg==
X-Received: by 2002:a17:906:b35a:b0:8af:2ab2:1f99 with SMTP id cd26-20020a170906b35a00b008af2ab21f99mr4418139ejb.26.1676394207804;
        Tue, 14 Feb 2023 09:03:27 -0800 (PST)
Message-ID: <6f938c45-d712-1683-6f32-a59c137031d6@gmail.com>
Date: Tue, 14 Feb 2023 19:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 06/10] x86/domain: guard svm specific functions with AMD_SVM
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-7-burzalodowa@gmail.com>
 <3f8ef895-48ec-ca39-f197-a83b9cd46469@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <3f8ef895-48ec-ca39-f197-a83b9cd46469@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/14/23 18:24, Jan Beulich wrote:
> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>> The functions svm_load_segs() and svm_load_segs_prefetch() are AMD-V specific
>> so guard their calls in common code with AMD_SVM.
>>
>> Since AMD_SVM depends on HVM, it can be used alone.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> With whatever the final name of the Kconfig control is going to be
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thinking about it, both here an in the earlier patch it may be worth
> considering to switch to use of IS_ENABLED() while making these
> adjustments.

Ok will do. Thanks.

> 
> Jan

-- 
Xenia

