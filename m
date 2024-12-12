Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398919EE538
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855836.1268639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhVw-0000sk-7y; Thu, 12 Dec 2024 11:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855836.1268639; Thu, 12 Dec 2024 11:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhVw-0000q5-4U; Thu, 12 Dec 2024 11:37:52 +0000
Received: by outflank-mailman (input) for mailman id 855836;
 Thu, 12 Dec 2024 11:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLhVu-0000px-Is
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:37:50 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 804fb4f8-b87d-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 12:37:43 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso90611166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:37:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa699487854sm470679466b.13.2024.12.12.03.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:37:47 -0800 (PST)
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
X-Inumbo-ID: 804fb4f8-b87d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734003468; x=1734608268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5wlTV87l7FP4yewa1JCyk6duJgpPz6St59BNw6WbqCg=;
        b=UB4fFUCfSAGlU10GhlhXlGOihBbVZvyCx58uXSJaj2iZHleGk+z0Wb13j19ToNSGeV
         PG6X/4qu7AA0W9LG5Ms5+i+/1DF8qypPafxgBK3lQs8e28wJg8iHmzhU0MAo6casbx9N
         UQ4doK4E9RQfRBb57fFCMHkW4pDTtdRED6ygCufEjGezFlVhWgz6NN98Ok/OryvbhEIR
         gkoZ5u2SMLagKCSiiwRMQjpSNIB2Gikm9mhQGgCA/dzcTFfKUo8sTon2n1JJe1OFLQf3
         gFEvBmVTVTYdGIQERR/VEBDsrtGUD1EF1fz0Qnw8B/EuOBNK27VauFJQZ2iQ38aAtRnx
         UztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734003468; x=1734608268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wlTV87l7FP4yewa1JCyk6duJgpPz6St59BNw6WbqCg=;
        b=GGh59z4CF6JyLoJ8Hj0cu3efLutrynEKJp5hy9+15Kf+Iwpcx6cejn8g2fPTKkGcds
         ajLlibKKbzKbWG4L1fXqbVrhSM/GHswem0kvXLhjBPBMTnBEylM9fCxYSNGt9Hyn5Mg0
         MTV/wcNeFSa6Ce0RBeXe1pO/vMyelvLbmDf9+nsfMsLU4RXEN5MxsuA0/Z2sS1dBpHzg
         /Ccs2t/Fdoz/u2gR9UnoUNwYXyDMqNcOcsJzOXhKJPyPHZtTs7sLGj049sYbiDZJ1ofQ
         +0+xsXtKd96t5/zdEbDEgVpsJSiW6+H2vERW+EKGToa6e7XNd3RT0WlDETWAB1NIOhib
         566A==
X-Forwarded-Encrypted: i=1; AJvYcCU4o6uKffseD4Vjsila1/1TtBSlrMt14h2tflxqmY/6kg6NIlq2fHZaJTAEkFvvELSKT91lmO89f/Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbFH0ox1JYh95jxaLD5v1oogH+RWLj0SUqbhvas4ohTC2O67Kd
	BoUvT2/yGuxzKJsHB/lc4o7m9n+2AsWBAxf4WcZC05OkyGGwcKO0SrfmGM5wUw==
X-Gm-Gg: ASbGnctQHPPSUNEmp7mmgDWGy5bSrKwlMk0GoMFxdoQXNNC5jZcFzYdtrfmJgmAUI9n
	QVHTaHLPiMpvfp4kBO9MqjXbhe5P0mPZ5tq3NYX8pgFNDlgnRfQ1XUoKqFWeffeVlQwI5VN7N6D
	tE2nKUpkXiX8R7elBxmpjKMiYffEL1JhvYSk3M7+pCyrjksF9Us8A2PBv9OBRLb5sizmvGivib5
	8KH7+wfxTOis1Fdu4RgdT04rQenMeqR2LZnhXwiITf1sHC71tBZF1mdkNfaxjkdsYC+k95kPkf0
	AjwA3iHWHc/YTQUDWhPtGGMaKTZiysEadO2kVIrrqw==
X-Google-Smtp-Source: AGHT+IHd5YVgP2ONYGOFgmLHsKXVFTMeYgFuA4WKs4J4yQ/0Fu6OwKJZudKOOGn3H2DSSWo38Ns1Zw==
X-Received: by 2002:a17:907:1ca7:b0:aa6:77e6:ea3d with SMTP id a640c23a62f3a-aa6b1378bfamr742891966b.45.1734003467939;
        Thu, 12 Dec 2024 03:37:47 -0800 (PST)
Message-ID: <18fd3e13-2e36-4d64-b56f-1227049bfb30@suse.com>
Date: Thu, 12 Dec 2024 12:37:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-15-dpsmith@apertussolutions.com>
 <88126e8c-96f8-4cb2-a899-eec2b800cf66@suse.com>
 <18da1057-9874-44b0-a25c-f1ce733611f8@apertussolutions.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <18da1057-9874-44b0-a25c-f1ce733611f8@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 20:49, Daniel P. Smith wrote:
> On 12/2/24 07:19, Jan Beulich wrote:
>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>> --- a/xen/arch/x86/dom0_build.c
>>> +++ b/xen/arch/x86/dom0_build.c
>>> @@ -617,6 +617,9 @@ int __init construct_dom0(struct boot_domain *bd)
>>>       if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>>>           dom0_size.nr_pages = bd->max_pages;
>>>   
>>> +    if ( opt_dom0_max_vcpus_max == UINT_MAX && bd->max_vcpus )
>>> +        opt_dom0_max_vcpus_max = bd->max_vcpus;
>>
>> Isn't this kind of backwards? I.e. aren't you meaning to move us towards
>> boot-domains?
> 
> Prior to domain builder, available construction parameters for dom0 were 
> exposed as command line parameters. This allowed for boot-time 
> adjustments to the parameters. With domain builder, there are now two 
> sources for dom0 construction parameters. Those coming from the device 
> tree and those coming from the command line. For most x86 platforms, the 
> device tree parameters can only be constructed prior to booting Xen. 
> Whereas the command line parameters allow boot-time adjustments, at 
> least for dom0. That is the thinking at least. Now if there is interest 
> in being able to retire the command line options, that would definitely 
> simplify things.

No, retiring command line options is out of question imo. Yet that also
wasn't my point. Instead I was wondering why we wouldn't make bd->* the
ultimate source of truth. However, ...

>> Also, what about the counterpart opt_dom0_max_vcpus_min? That wants to be
>> controllable from DT too, I would think?
> 
> Yes, in theory we will eventually be able to do requested/min/max as 
> well as cpu pinning/affinity. For now it was requested we focus on 
> implementing only requested vcpus.

... that's pretty much only a reasonable option if these were converted
at the same time, to avoid becoming inconsistent for perhaps an extended
period of time.

Jan

