Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1D8AA873
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 08:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708751.1107845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhlV-0007dO-6X; Fri, 19 Apr 2024 06:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708751.1107845; Fri, 19 Apr 2024 06:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhlV-0007bg-3W; Fri, 19 Apr 2024 06:30:29 +0000
Received: by outflank-mailman (input) for mailman id 708751;
 Fri, 19 Apr 2024 06:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxhlS-0007aq-U7
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 06:30:26 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d973627-fe16-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 08:30:25 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-415515178ceso12133945e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 23:30:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d6d46000000b003434f526cb5sm3557367wri.95.2024.04.18.23.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 23:30:23 -0700 (PDT)
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
X-Inumbo-ID: 4d973627-fe16-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713508223; x=1714113023; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ylV5XZL5HAdUksFhAG05h7WrSekdu5do/DMWE9mnS2Q=;
        b=AhLmmqGbJoIeb/D1+J6m/BvlpDL1747mJHVKHv/yAQk6eksZnVzvt2r/68MNLROEbs
         Hur53npdaWCKyZe6olN1cwv33nP3NxAVQW1pujeejYxmAHDbPbStpodMWTHgmXVy/cGT
         4aB+eDAob3aCp2ctRjqJ0E2rv66EzOQnab53dK1KD1reQ5gSrO2wYppcaH9A5ryRT5TY
         Hxq7DM7IBfrRoyvDnBYoK87SfGu8s247xcWfbPzWPjfiNPB9161PYhGecMHS8LByfSC6
         9ckNAcizsIKyCbRJNRSs7oIS4N7dSpo9PRGCGJogJwT8aUNw/cH0cAEZB/XqpnJPpaxS
         o1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713508223; x=1714113023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylV5XZL5HAdUksFhAG05h7WrSekdu5do/DMWE9mnS2Q=;
        b=NSD6X5eQ9l9EvqOcxLsWJwBWyBnAmSSEjVjCVzPUghFFq0xcMzmGm7kl0tW/pnbpSX
         vrVYDRrlZn/WQrcfSbsVYSZnPzwpBlWpSrazMIORgejPZ96no8MdpKaUQbl/Neoi3az5
         ueO1e4m29SE0w69QpDm9f2W8qwklfrx5s+6KM0Cghh59qkepwPGHeu/mWbV+S6ktxIwM
         Oi3B7WJnyGWa3eRSM3jrC2vTgMlZc72IdDdpl4k1ehlTM5Mie3tnC2499r3KGxlvDYXM
         gJ6mdVD3xu9yyQimmCsW7PdeilChwxGbQ8kJzuAizzzesSKBbhMDH6rmuMkHh8yLTHlm
         oQFw==
X-Forwarded-Encrypted: i=1; AJvYcCW2W2cDrR/bZE4UhpKSzR/sFRl6hr9XC16/5H56t5LSdNlPaKHDKR4K8kjKG0dSrKFmG1tzfnjrHBnoz5GSxvuogJ2x/po/CO+oK7uUJdA=
X-Gm-Message-State: AOJu0Yzy+QzeOid6VT0Y183YX272PzlDBbvm/RU5igRJVfsREIfP5oZq
	3y16AfnBczjMtiSp98GKDXBKS6GNs6YcobiTFAKxGf4mVuPUfJ/EW6IxakmwbA/w3PNGJOaQlnE
	=
X-Google-Smtp-Source: AGHT+IEC7B7S7qhyFkwDHJSxq7pg/UmldUz0RA7zryEWRyb/rC9YnKx8WsTsqCs2fS+9Z8MEfqaQ/Q==
X-Received: by 2002:a5d:64ef:0:b0:34a:5d59:5529 with SMTP id g15-20020a5d64ef000000b0034a5d595529mr563895wri.5.1713508223485;
        Thu, 18 Apr 2024 23:30:23 -0700 (PDT)
Message-ID: <957300e9-67dc-4590-9633-4c9b5318828d@suse.com>
Date: Fri, 19 Apr 2024 08:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/misra: mark the gzip folder as adopted code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Federico Serafini <federico.serafini@bugseng.com>
References: <2970c1010e227ca1460c5656d13fb87a05d87f29.1713174475.git.federico.serafini@bugseng.com>
 <d62f622b-65b4-4e37-87db-3cc88c89da67@citrix.com>
 <eb82270c-52f2-49f9-9aaa-72906e5b9b97@suse.com>
 <e25ae134-a510-432a-a9a3-b6ebac8c31c6@citrix.com>
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
In-Reply-To: <e25ae134-a510-432a-a9a3-b6ebac8c31c6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2024 20:33, Andrew Cooper wrote:
> On 18/04/2024 8:39 am, Jan Beulich wrote:
>> On 15.04.2024 17:44, Andrew Cooper wrote:
>>> On 15/04/2024 10:56 am, Federico Serafini wrote:
>>>> Mark the whole gzip folder as adopted code and remove the redundant
>>>> deviation of file inflate.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> I hadn't realised that we had a special case like this.  Definitely
>>> better to get rid of it.
>>>
>>> I've pulled this into my `for-next` branch, and will get it committed
>>> properly when OSSTest (our non-gitlab CI) is in a happier state.
>> Hmm. Considering Daniel's work (which I'll comment on separately), is this
>> really going to remain "adopted"? We're about to diverge to a degree where
>> simply taking patches from the original source isn't going to work anymore.
>> IOW I think we want either Daniel's work (and perhaps follow-on adjustments)
>> or marking of that code as adopted.
> 
> inflate.c is was from Linux in 2010.  There's only one build fix and one
> comment change in Linux since 2010, whereas Xen's copy has seen several
> bugfixes and cleanups.
> 
> gunzip.c has floated around rather more (it was originally some glue
> code in bZImage.c) but it was entirely rewritten first, to support other
> types of decompression (we did this differently in Xen), and second to
> support KASLR.
> 
> In both cases, there's not an upstream to usefully track, and we
> probably take ownership.

I'm confused by the combination of your reply (seemingly agreeing with my
perspective) vs you having committed the patch. Can you clarify whether I
misunderstood your reply? Imo gzip code should no longer be excluded from
any scans when we take ownership. Hence why I would have expected a v2 of
the patch also dropping (rather than adjusting) the exclude-list.json
entry.

Jan

