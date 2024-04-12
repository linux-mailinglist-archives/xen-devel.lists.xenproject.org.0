Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D348A2E1C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 14:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704607.1101078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFrL-0004Qf-FL; Fri, 12 Apr 2024 12:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704607.1101078; Fri, 12 Apr 2024 12:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFrL-0004P8-CT; Fri, 12 Apr 2024 12:18:23 +0000
Received: by outflank-mailman (input) for mailman id 704607;
 Fri, 12 Apr 2024 12:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOJy=LR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rvFrK-0004Kq-2H
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 12:18:22 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf59ee2b-f8c6-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 14:18:20 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-22ec61aaf01so480701fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 05:18:20 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d19-20020ac86693000000b00434f6c1458bsm2164554qtp.17.2024.04.12.05.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 05:18:18 -0700 (PDT)
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
X-Inumbo-ID: bf59ee2b-f8c6-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712924299; x=1713529099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BYb+uZBFcOwIPCj0/S2b2A4kiFleioUL45N5LB8aevc=;
        b=uEOT32+/RylwPU4esg6knIiJ4mM6PZGmMFjkFhvLSy+fWokDqP6aXWSYZw+2kxnEcn
         TUEWppf4Pu4ZNUHSU8lq9VtYEM9IqBOfnGYe2eDTYtCw595mTLc9u9mzl06rgTie+Yxw
         FOgJpzNv7RxDMHzNV/ve04sLpcQIJSDfT0eEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924299; x=1713529099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYb+uZBFcOwIPCj0/S2b2A4kiFleioUL45N5LB8aevc=;
        b=keTLihQ+E1McNFlmHh2P2M+LTGiGwcTOdtwP4zZEQp/57sCQBNBExl7UsfjZNSfvBH
         b5MwCWUaorL2DAjqnXlsRInEeGPpBIhFjALYpDei26zC9ghQjqOorZ/vbg4lNIyaAeWT
         J5Fh9Pn/QvNiHPGDKhoSTDjksEQ7pZM4dN+314cJgUuh6KS0Q5Mf4CeIJesgD7yQvMVH
         HAHz7lyOGeEjvjmxMqn2rGmHE3+9+3utEojYRPNPT/xjl4FUyizgXJIu/G/p6exUNmgW
         kcPw4niUnS+rZ5rjJfyWsZkKZupdhFmr+OMrCH3CKWCJvbAdrIPEbIVCvvVfPhvLcsnK
         0RWA==
X-Forwarded-Encrypted: i=1; AJvYcCXR3JAR/UKL0Vi92PrbkIaI/T06miMJwAZAw+vW5AdS6+bewmX/cYYFZcFXgZRS47QCPm66/Qty3DIZ8tQldCLovRQjKwKmgDFS+yYYJXg=
X-Gm-Message-State: AOJu0Yzm2rSw6xjHHKdtZQiQiRjQVHr80OAda1gAXwHCOqn23UMJCpM0
	2t50ZGAI9N/c+DMB8gYZ99LacGTsN379Q86x05rP0hOGnqicTIeUXqY0hV9wTiU=
X-Google-Smtp-Source: AGHT+IGDps1sjxgpmEbeV327ZQk9bjsEOruMC/anw26enDnAqLEnHfi2ELWd/Y7k4dHhcvun+Levkw==
X-Received: by 2002:a05:6870:b015:b0:229:7d01:7e03 with SMTP id y21-20020a056870b01500b002297d017e03mr2393146oae.43.1712924298732;
        Fri, 12 Apr 2024 05:18:18 -0700 (PDT)
Message-ID: <5e63a5b7-d62f-443c-9755-66dbc70fee98@citrix.com>
Date: Fri, 12 Apr 2024 13:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gzip: refactor state tracking
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-4-dpsmith@apertussolutions.com>
 <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
 <c03b4f1e-f2c9-4f92-a369-b8afad56bc0b@apertussolutions.com>
 <9a5112a3-26fe-49a8-93ed-cd8c9610576c@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9a5112a3-26fe-49a8-93ed-cd8c9610576c@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/04/2024 12:41 pm, Daniel P. Smith wrote:
> On 4/12/24 07:34, Daniel P. Smith wrote:
>> On 4/11/24 15:24, Andrew Cooper wrote:
>>> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>>>> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
>>>> index 1bcb007395ba..9b4891731b8b 100644
>>>> --- a/xen/common/gzip/gunzip.c
>>>> +++ b/xen/common/gzip/gunzip.c
>>>> @@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned
>>>> long image_len)
>>>>   __init int perform_gunzip(char *output, char *image, unsigned
>>>> long image_len)
>>>>   {
>>>> +    struct gzip_data gd;
>>>>       int rc;
>>>
>>> By the end of this series,
>>>
>>> Reading symbols from xen-syms...
>>> (gdb) p sizeof(struct gzip_data)
>>> $1 = 2120
>>>
>>> x86 has an 8k stack and this takes 1/4 of it.  Other bits of state are
>>> dynamically allocated, even in inflate.c, so I'd highly recommend doing
>>> the same for this.
>>
>> I take it you are mainly talking about crc_32_tab? Yes, I can switch
>> that to being dynamically allocated.
>
> Never mind, reading your comment on patch4 made me realize you wanted
> the instance of struct dynamically allocated. Though the answer is
> still, yes, we can dynamically allocate it.

I wrote this before realising that crc_32_tag could be shrunk.

If it's only1k on the stack, then that's a whole lot less bad, and is
perhaps ok.  I guess it depends on the stack size of the other
architectures.

Still - I expect dynamically allocating would be a safer course of
action.  Internal blocks are dynamically allocated already, so this is
"just" one more.

~Andrew

