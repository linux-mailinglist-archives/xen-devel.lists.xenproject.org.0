Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B8972CED
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795150.1204323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwr9-0006zO-KC; Tue, 10 Sep 2024 09:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795150.1204323; Tue, 10 Sep 2024 09:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwr9-0006xp-HZ; Tue, 10 Sep 2024 09:08:15 +0000
Received: by outflank-mailman (input) for mailman id 795150;
 Tue, 10 Sep 2024 09:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snwr8-0006eH-PG
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:08:14 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 350a5099-6f54-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 11:08:13 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so406948566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:08:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d547b9sm452764966b.202.2024.09.10.02.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:08:12 -0700 (PDT)
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
X-Inumbo-ID: 350a5099-6f54-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725959292; x=1726564092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XHO2ML397hPmeXJXVF4+KwXjpJ3j7Dl0Rq98GlAqZFU=;
        b=HLVCoJSYAldmdsj5QnrMoSCPxoUS6vRAr95C3iLK6w1amPMuQqUZ4SB4xWfafg5ZaV
         1FTaGgs2nw6I9YA9WzDYy/XEDY9GlWyTgxDH0qVRtxXhtjJ+WgTZ5ionc68P9EZV67Nu
         CCBwikiz2fHpxCzQ9LMICKErcOLnRZU+lwuDg4sh8uVqwgWf/qdpD7kuH0oq8cmC8vEK
         N2nfE5ZjAodtgrb4opriGXIh60U5iCPqbVPp8Sri1wv8feDxCfFby33eg+2qAW932CZ7
         ePcFtWdqNFj9XLJ37U+uXtNvhhN5pTskH0+0DUOTO6CZk7Ldj/bFgb6+Kzq82HXWSoLN
         a0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725959292; x=1726564092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHO2ML397hPmeXJXVF4+KwXjpJ3j7Dl0Rq98GlAqZFU=;
        b=PAVQpgTyUkBTTbgSyLhCDVWxw2iZ5saKHf0eu4zWpmQ1a5aFX8zBguR77U0g90UdD7
         5189G1b6pnbaOawTFykOxs0Z7zCRwZ7p/K6a8ToH/KFBXaJcWIOOMj6H5VJt3E0axsUb
         G4vP+ctG9Cwcc8DcBG/v64JAGzkqqJ8oHff7yV+I/JJZmZenUgpnvPh6K8N8zjEpYWwj
         eH2Ikv+a/j73k7epBx2i/nKA9QAuFZ/d487VIibqvO7IViv1m3gQJCx/p9BkHMtH0sbd
         bgVQIVEKWZ+ncZUjC4royjgalGp/yJH65gp2iw4QCw8p4zJUxRTfa3bc14x7Vcu3vNQ1
         Owug==
X-Forwarded-Encrypted: i=1; AJvYcCU2cL3qHRFwQD6w0D+k53ywnPeEDq7tg27Lu2SU8X4XwzmrVQfBG3HfwSay9i1YX+coPdSkWTo7lbc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7qZlAiqcON4g7/Ys7Xi5QISBpzjtMxhK5Tkf4zAdcbG8BSrsm
	TRjGB33Ss+SoebJQTwZG7B3dTDEEm6lne8YTMP/c+zTyJxds7uTSvj81p9NQJA==
X-Google-Smtp-Source: AGHT+IG+otIapnqlmes6pzhhXvG9lOLmdYfQTtt3rJDS1GVWB3PlEv3CNHVQC1KxxwnRILbWoYMc3Q==
X-Received: by 2002:a17:907:3f16:b0:a8a:572c:709f with SMTP id a640c23a62f3a-a8ffaaad0d2mr8528766b.5.1725959292392;
        Tue, 10 Sep 2024 02:08:12 -0700 (PDT)
Message-ID: <4e54f8e0-43ce-4dd6-b1b4-cf72b59d96be@suse.com>
Date: Tue, 10 Sep 2024 11:08:12 +0200
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
In-Reply-To: <25b6a974b7c9aaec32b11930168148a5@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 10:56, Nicola Vetrini wrote:
> On 2024-07-01 10:36, Jan Beulich wrote:
>> On 28.06.2024 08:30, Nicola Vetrini wrote:
>> This being about unreachable code, why are the domain_crash() not the
>> crucial points of "unreachability"? And even if they weren't there, why
>> wouldn't it be the goto or ...
>>
>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>> @@ -1040,6 +1040,7 @@ out_unmap:
>>>       * Something went wrong, probably crashing the domain.  Unmap
>>>       * everything and return.
>>>       */
>>> +    /* SAF-8-safe Rule 2.1: defensive programming */
>>>      for ( i = 0; i < count; i++ )
>>>          if ( map[i] )
>>>              unmap_domain_page(map[i]);
>>
>> ... the label (just out of context) where the comment needs to go?
> 
> Because of the way this rule's configuration work, deviations are placed 
> on the construct that ends up being the target of the unreachability, 

What's "target" here? What if this loop was removed from the function?
Then both the label and the domain_crash() invocations would still be
unreachable in debug builds. Are you telling me that this then wouldn't
be diagnosed by Eclair? Or that it would then consider the closing
figure brace of the function "the target of the unreachability"?

> rather than (one of) the causes of such unreachability. Putting the 
> comment on the label works for ECLAIR by offsetting its target 
> statement, but not for other tools afaik.

I don't recall whether I ever saw a Coverity report to this effect,
and hence I wouldn't be able to tell how that would want silencing if
so desired.

Jan

