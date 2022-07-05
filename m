Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BADD567A91
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 01:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361669.591317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8rfy-0002pe-Dw; Tue, 05 Jul 2022 23:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361669.591317; Tue, 05 Jul 2022 23:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8rfy-0002nr-A4; Tue, 05 Jul 2022 23:09:50 +0000
Received: by outflank-mailman (input) for mailman id 361669;
 Tue, 05 Jul 2022 23:09:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8rfw-0002nf-K2
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 23:09:48 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 906172b2-fcb7-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 01:09:47 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so8054643wmb.5
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 16:09:47 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a05600c348800b00397623ff335sm25002774wmq.10.2022.07.05.16.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 16:09:46 -0700 (PDT)
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
X-Inumbo-ID: 906172b2-fcb7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UxRgUYtveA0g1BrCmtLoff5ZhQg/fLd1u/kCMbjIj/M=;
        b=pAy5R8GEp73PJsCCXRojI0wXP8wu2bWFuUU1ImpLrwP7/2vh599Z+4pWRRXXVMgaan
         iuhM0u0Kd8dPN3X6FwWeS3vpaZY061jg3bpFQahP9arQWcJCBOFfBIfopqQO585K0bKZ
         HfN/BWopCbvT84VKqq6Mekk5jEISbHZBAx7yLCEh++eW+bEvokxz3tuRHc9t7Q5iXdQx
         939f0D1Zf+6C6CA7bw2PSHrMcEFXN2tMkQ+I726lVK+E2PdjZn7TX5wlOgwqcHIDkW41
         /iN2wvpG5y67TYELj3FJj5zztBOS24aQVJ90KkgA97UBrtgr19dKBi26MAq8Y4sYeRWN
         AERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UxRgUYtveA0g1BrCmtLoff5ZhQg/fLd1u/kCMbjIj/M=;
        b=Obm/pXVYOacm6Mwbx74jKoTwQBy9mkMkeVClk2iWqh4yUb9nGA4e3ESgjyi2mhPvZ8
         TRGakbN+b7tFVIdL4S0gctHccmckjV+F7RlJNZvgLXEvnmHXDcf5fI29NTymWHhWUmUQ
         1p0eClsBifTTIqcI7RW5RoZnHNmQY3rtWES3TQNxUQYTeOEE8M+gLoPs8npQzai2cv5A
         laMZxRM3uh+yozodh2wpeLciozGyNdi/PUWe79ddxyjodsCYfmDoKFrV2WKAPkAam/BZ
         ii9gNrGxeeQ1uX8OzMJspLO/bGcoZJIQoN6m6gBqhY2j12G5m6Ji9lwHuNyoO1/Ga0QZ
         Ar9w==
X-Gm-Message-State: AJIora8kvns/U+NQBlZ9BmODu9x9QnSNxhyqBFJzv3KAr03gm+jJ0BKK
	3mmzlC2j1Tdoq2bsYFhvnPs9dESH/fs=
X-Google-Smtp-Source: AGRyM1vDfweH3KJ1ce8tBNXCFJd2lQRRyJqFTKuB4Dg/dZK9yp1y5pweSWXiV9u6Fo2Hqn/BdyNhuQ==
X-Received: by 2002:a05:600c:3b13:b0:3a1:8ad9:9d2 with SMTP id m19-20020a05600c3b1300b003a18ad909d2mr27161215wms.129.1657062586997;
        Tue, 05 Jul 2022 16:09:46 -0700 (PDT)
Message-ID: <863ac06a-665b-fac6-9812-fbb0e558ca20@gmail.com>
Date: Wed, 6 Jul 2022 02:09:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/4] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violations
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-2-burzalodowa@gmail.com>
 <f0f36355-29c5-7355-f784-4d844ebc5566@xen.org>
 <0accbe13-2155-185f-5d77-a590e1855af3@gmail.com>
 <0afd7250-b157-7fb2-1fdb-78955d2bf262@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <0afd7250-b157-7fb2-1fdb-78955d2bf262@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien,

On 7/6/22 00:56, Julien Grall wrote:
> On 05/07/2022 22:49, Xenia Ragiadakou wrote:
>> On 7/6/22 00:28, Julien Grall wrote:
>>> Hi Xenia,
>>>
>>> On 05/07/2022 22:02, Xenia Ragiadakou wrote:
>>>> Add the function prototypes of the functions below in 
>>>> <asm/processor.h> header
>>>> file so that they are visible before the function definitions in 
>>>> traps.c.
>>>> enter_hypervisor_from_guest_preirq()
>>>> enter_hypervisor_from_guest()
>>>> do_trap_hyp_sync()
>>>> do_trap_guest_sync()
>>>> do_trap_irq()
>>>> do_trap_fiq()
>>>> leave_hypervisor_to_guest()
>>>
>>> I have actually came across those missing prototypes in the past and 
>>> I have refrained to add them because they are not meant to be called 
>>> from C.
>>>
>>> While I agree this is a violation of Misra C, I am still not 
>>> convinced they should be added (there is no need to verify the 
>>> prototype).
>>
>> Yes, there is no need. Here, I decided to follow the example of 
>> do_trap_hyp_serror() and do_trap_guest_serror() for consistency.
> 
> do_trap_guest_serror() is called from C code (see arch/arm32/traps.c).

You are right, my mistake.

> 
> do_trap_hyp_serror() is called only from assembly. I would argue that if 
> you want consistency, then you should drop the prototype rather than 
> modifying 90% of the other examples.
> 
> Otherwise, this is not really consistency but more a design choice (you 
> want to be fully compliant with MISRA).

I agree with you that there is no need to declare the variables and 
functions that are called only from assembly, prior to their 
definitions. So, this kind of violations could be grouped together and 
provide a formal deviation. This seems to me reasonable.

-- 
Xenia

