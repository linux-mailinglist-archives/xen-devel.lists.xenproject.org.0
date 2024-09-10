Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCF49730BF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795225.1204440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxiv-0005fE-0q; Tue, 10 Sep 2024 10:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795225.1204440; Tue, 10 Sep 2024 10:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxiu-0005dX-UJ; Tue, 10 Sep 2024 10:03:48 +0000
Received: by outflank-mailman (input) for mailman id 795225;
 Tue, 10 Sep 2024 10:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snxiu-0005dR-Bz
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:03:48 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f885ab71-6f5b-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:03:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so547690866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 03:03:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cea3e1sm454795366b.167.2024.09.10.03.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 03:03:46 -0700 (PDT)
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
X-Inumbo-ID: f885ab71-6f5b-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725962627; x=1726567427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jXYE2qRnBEE9CEirNRTA9pFtenGNxJ440WeSw3MxcS8=;
        b=LfUGTtSi5hc4w6r5NhzXK50JI2tl6q87E9dLmANO8vmo236iSdmD+ygSuGB7QuKkgR
         Ozm+P2aXY7CXPQxWW1OzMObD+fUsGa0wCrfnvfps3dGMnTsxxmsuMRkAIJHQGOjH81zM
         dWHPNEZxSWELpxNGhRsMJrAQL2WE9nTpZgYTYxEZRp9hgaOge2af189DNdU74tDa6VXw
         5V9Y43q3uorwMMPwoZZXtc1ClDd7zcYaT/H+l+8CBq46E50728HPk6IoDeYVY3LmuBCK
         0BxW452yrR2IA/ApFxnkCvLvP4GWimVjv/ISopXpYUqjyco9+DS/qe50gYrobixH6Fis
         ECvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725962627; x=1726567427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXYE2qRnBEE9CEirNRTA9pFtenGNxJ440WeSw3MxcS8=;
        b=aA0uR1S/rV0O3cZdnDwMjx5dqCAZAKAWW6n4q4rHxbgXVqNmlNwtpS5I4ZVIgALyvl
         gScy2F/Xauuxpl6lK+IRGsxA7vK5R1OXIfCN2Ik7+mPFcGVWu0Pgf1i6JnzF86ZWsmRU
         JQr35XBdfZTHehqtmssWfHTGRvxO7/8RSpqpunCCFx2TwLL6G638dBrR26xUJAP9tLtF
         hEYTg1fdfVNiDf1LLmVeIIt78ebaVm3AcMOFw2cXh7obKDE9HoiYfFqpGXa1Bz2jhItO
         KoOl1odperExUv7cZ3LhAHlFZrVCqUyi+3ClRpZZpIX72HHvWkvFfy1mcNOv2ioEOqHT
         tUmA==
X-Forwarded-Encrypted: i=1; AJvYcCWLpjDIrs0QdTS+TgC3MiwUPsqJLjI3YJUCgCcYPdSpHu1OV4M9/WqIeOluniMVDM2a6ybywGnLTSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBaSz1XDnRiP9HLug3IP/0YClyiFqNuQWg4KsScABGXeTsaEUa
	oqpkpDSXvOTKQ3mvNUjgAUQPvKmUn/dVbcgxTJmAx/yPUHFbIzK17amEUPzIsQ==
X-Google-Smtp-Source: AGHT+IE1Y1YZPrrMqTxXLc+ABNL+zhuju7hHvfBlgB1HumbfUmpZa7xmgaPjzITf5dxGu9VbQlQgpw==
X-Received: by 2002:a17:907:9619:b0:a8d:29a2:47cf with SMTP id a640c23a62f3a-a8ffad9815emr20125566b.40.1725962626633;
        Tue, 10 Sep 2024 03:03:46 -0700 (PDT)
Message-ID: <38c34b50-56a5-498a-8ed6-d57a8f02a964@suse.com>
Date: Tue, 10 Sep 2024 12:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86: p2m-pod: address violation of MISRA C Rule
 2.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <43b3a42f9d323cc3f9747c56e8f59f9dffa69321.1719556140.git.nicola.vetrini@bugseng.com>
 <38b57a6f-187c-440a-b3b4-9e7e124e1802@suse.com>
 <25b6a974b7c9aaec32b11930168148a5@bugseng.com>
 <4e54f8e0-43ce-4dd6-b1b4-cf72b59d96be@suse.com>
 <1a139b44effdeefab6b3e0ee7ae0c43d@bugseng.com>
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
In-Reply-To: <1a139b44effdeefab6b3e0ee7ae0c43d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 11:53, Nicola Vetrini wrote:
> On 2024-09-10 11:08, Jan Beulich wrote:
>> On 10.09.2024 10:56, Nicola Vetrini wrote:
>>> On 2024-07-01 10:36, Jan Beulich wrote:
>>>> On 28.06.2024 08:30, Nicola Vetrini wrote:
>>>> This being about unreachable code, why are the domain_crash() not the
>>>> crucial points of "unreachability"? And even if they weren't there, 
>>>> why
>>>> wouldn't it be the goto or ...
>>>>
>>>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>>>> @@ -1040,6 +1040,7 @@ out_unmap:
>>>>>       * Something went wrong, probably crashing the domain.  Unmap
>>>>>       * everything and return.
>>>>>       */
>>>>> +    /* SAF-8-safe Rule 2.1: defensive programming */
>>>>>      for ( i = 0; i < count; i++ )
>>>>>          if ( map[i] )
>>>>>              unmap_domain_page(map[i]);
>>>>
>>>> ... the label (just out of context) where the comment needs to go?
>>>
>>> Because of the way this rule's configuration work, deviations are 
>>> placed
>>> on the construct that ends up being the target of the unreachability,
>>
>> What's "target" here? What if this loop was removed from the function?
>> Then both the label and the domain_crash() invocations would still be
>> unreachable in debug builds. Are you telling me that this then wouldn't
>> be diagnosed by Eclair? Or that it would then consider the closing
>> figure brace of the function "the target of the unreachability"?
> 
> Exactly, the end brace is a target to which the "function end" construct 
> is associated.
> It would be kind of strange, though: why not just doing "domain_crash(); 
> return;" in that case?

Sure, the question was theoretical. Now if "return" was used directly
there, what would then be the "target"? IOW - the more abstract question
of my earlier reply still wasn't answered.

Jan

