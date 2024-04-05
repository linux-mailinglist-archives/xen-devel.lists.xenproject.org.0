Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B178994DD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701085.1095170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rscc0-00037j-Eo; Fri, 05 Apr 2024 05:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701085.1095170; Fri, 05 Apr 2024 05:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rscc0-000359-Bz; Fri, 05 Apr 2024 05:59:40 +0000
Received: by outflank-mailman (input) for mailman id 701085;
 Fri, 05 Apr 2024 05:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rscby-000353-VR
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 05:59:39 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae98f18e-f311-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 07:59:36 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-343c891bca5so811404f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 22:59:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d56c5000000b00341ce80ea66sm1111715wrw.82.2024.04.04.22.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 22:59:35 -0700 (PDT)
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
X-Inumbo-ID: ae98f18e-f311-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712296776; x=1712901576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXgOSVybI5H20xim7JEr4vUuVCujmBlaQTcO605vE2I=;
        b=SGAOhV1/RBfQquaPEQALnzXHwzf0J2yWJq581DS08ACsGOblmF6G7UGOUsZDDf6L5R
         hiT1CG+MUwINlF6fG3oj3SWFKhxa+dXVY6QGyXBwYQVPd23DfVcbX3ej2oGoKouDsOro
         m98CblNZLfIVb0ZmUy+/rc1YFTnu/Lk/7ba2S4bAZtAKFNTWUTOACxx27TVs1QbiXaGq
         VvjUl8u5hwaaj8t+5Yl0lXyabUHkK8TyDqI6Kd1pPWEXcB3AffE+w9eZb/WaFxxFvPUq
         GT9qLmG4MEIHCUE18FdriSiiRMShxq3Sdp6Q2yVsPHfPgfl0ac/loVOjg7wDZ0Ndt4NU
         lkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712296776; x=1712901576;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXgOSVybI5H20xim7JEr4vUuVCujmBlaQTcO605vE2I=;
        b=YAf1tEZKSRt3exwT9lSHCFklJ3QdBoI2DZL95haXN9czyX8JIE0mfXMn6qd0PXhhlN
         tM3TfSvcrA2ukbP0AwrVe6CbRP7nfHsCiJ4sKZE5CXkP3sbNOdUjhWqI+5CRNkKdxcov
         keVpX9azBK7CRyADl5vQs7NnMFISsAQI7eptaqSBEbDdGut497fVCPPz/+vIFzT4on6R
         EWy1Epv4W7Q6qOzSO7SM8s7kCwkyEbNJvzwLpE0FGTtqW1dKQUZ1bgxlWmWWRR7GI5+2
         UZJDx9uxYbME9RCQ4tHcW+BaO6NgzkisS/I096ffpTiKxfTd+a4oyxHmKoVPLzrJjf7a
         G6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVKetQYRB1tMP0+oGoRmHATj/IYjrfglHOD9KyH96Mcc+INAh1f9CbtAnt2UOIF1jQCeA4TlZy+OT2Voi9QsLddRzTJV1f9HMMg5nQ1r0I=
X-Gm-Message-State: AOJu0YxxIINo/WEffqj3qSWnZOd2vijjJMIGpG22pluiOqN9zkeydmkQ
	2bqmuWD0vUAHcoXB4IN+UMcUumdfT+mrjqk0JS6KGkp49GCisdFheUr06fKHCA==
X-Google-Smtp-Source: AGHT+IGNfAtJOBm3u8B1HeFEmLo0CfzE4F9wnvyBnd7yrW24aNH0LgbYnfS9Qibs4zE2w1OZHOUmLA==
X-Received: by 2002:adf:fa8f:0:b0:343:b5f1:2da with SMTP id h15-20020adffa8f000000b00343b5f102damr460965wrr.11.1712296776127;
        Thu, 04 Apr 2024 22:59:36 -0700 (PDT)
Message-ID: <3419b5d6-ac57-4de4-a87d-c82577584fa8@suse.com>
Date: Fri, 5 Apr 2024 07:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <2df1e3ef-32c5-45c3-af1b-e9473a4e9120@apertussolutions.com>
 <d86e7a86-cd2a-4b0c-b269-6b4e9b2edff3@suse.com>
 <61945064-38ec-4ea5-9084-a82d3c252b2d@apertussolutions.com>
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
In-Reply-To: <61945064-38ec-4ea5-9084-a82d3c252b2d@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 15:27, Daniel P. Smith wrote:
> On 4/3/24 08:05, Jan Beulich wrote:
>> On 03.04.2024 13:10, Daniel P. Smith wrote:
>>> On 4/3/24 02:16, Jan Beulich wrote:
>>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>>>    It is also quite
>>>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>>>>
>>>> Why would that be "obvious"? What business would a stubdom have to look at
>>>> Xen's side of an evtchn?
>>>
>>> Again, you have not expressed why it shouldn't be able to do so.
>>
>> See above - not its resource, nor its guest's.
> 
> It is a resource provided to a domain that the domain can send/raise an 
> event to and a backing domain that can bind to it, ie. the two 
> parameters that must be passed to the allocation call.

Before writing this particular part of your reply, did you look as
evtchn_send()? Sending on such ports is similarly denied without
involving XSM. For a good reason, stated in the accompanying comment.
It is therefore simply inconsistent to allow any kind of other
operation on such ports. Hence the patch that Andrew now deems needs
reverting.

In fact I view these ports living in the guest's event channel space
as similarly inappropriate as the ioreq pages - until a few years
back - living in the guest's GFN space.

Jan

