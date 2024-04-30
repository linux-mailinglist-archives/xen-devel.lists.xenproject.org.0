Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C28B6D55
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 10:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714626.1115896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jCq-000212-31; Tue, 30 Apr 2024 08:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714626.1115896; Tue, 30 Apr 2024 08:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jCq-0001zQ-0G; Tue, 30 Apr 2024 08:51:20 +0000
Received: by outflank-mailman (input) for mailman id 714626;
 Tue, 30 Apr 2024 08:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1jCp-0001zK-5Z
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 08:51:19 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce74ee38-06ce-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 10:51:17 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e9so29438935e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 01:51:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b0041ba0439a78sm15032283wmb.45.2024.04.30.01.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 01:51:15 -0700 (PDT)
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
X-Inumbo-ID: ce74ee38-06ce-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714467076; x=1715071876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Br+7oQNumutMREB6hCjRSxn/CQrVDIvRl5aZlPdFIkQ=;
        b=HC65y0FNQxuNG5dGWdCP3jjKBrLbhW2iWHdRC3W8m5J4BETxvU6RXqC0HZF0bQnSZ/
         HlEWum1WVWMXbCvBaXmokaxDNVRr+k4MH2iInRqP7enUd1v37PUcnJN4crFdp0dzh9qn
         jfGeQrnRZiALBrU0Hp8SkefjinhD9n0QkjIDgZS6bEIbYUleObLO0kEyOFMxIOE5+kOL
         2o48rzgdNq7NtiC9FvG7RAvOmh8Y+O1GQ4n6qDolsABn5VO5qzGcmCil3kQHYx8ee6K5
         OCMFHgbOBje3Thjay41t2Z0cFoGTJHcCJkWKpgRuCHLkSl5m5VCpFcvWkTnMU19hsr5Q
         kObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714467076; x=1715071876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br+7oQNumutMREB6hCjRSxn/CQrVDIvRl5aZlPdFIkQ=;
        b=dJFzXw7saIU8zk0S274bx3tK/J1JUKXU/wUtBMyGF2X0PSnsnOpBtF6SONZ5qgV6Io
         TQWg9+9/DnUOnH2S7WmpaDOSe7Jgz1tljRsIaUpOp7+IXoVbWbQoK0M4evTcQB3d2MAX
         yn1XyX77oE44gpiPbt8BaYRQZAld1BegdealE+9dUbYjK8GHWNIZPyJw0wLNrrJKXE8A
         51DMBrlcp+gs9llc0VuMZR/gfbWdhPwVvmkIEJW85FwIitT6/GWpTD10oq4Vq1Kc5Kgs
         /7rPW3oqGd12/bk59R0HEjAUIMaNK5med0W9qIXGNbeHiwXPdrt3eS96Bl9PdGQZ+1BL
         oDIA==
X-Forwarded-Encrypted: i=1; AJvYcCUjR5AfVdZOzcrZ89i+f8StOSFCPYMn5G9YjPIWooPXrWbtWKpPAIN32FkC2zig8kyMqRhxICiDCgHEaH7VN+Dn8dDcO2oq4bVX7RgTWT0=
X-Gm-Message-State: AOJu0Yyl/UN9Rt+yQVGDsY9wnJw9QqX3dktlHcFZvYcFWt6JV0PsXmJN
	gnib/mcKQRKEBK1NJJCzHzHD5pv06a18bwjCDRkjrRzAmRYiz75cY1915/dcyQ==
X-Google-Smtp-Source: AGHT+IHav5JsvahebG/1mD3M4gWyDNWGzfeP4PrDOZFUs+jJ7HfzXhUn5Vs4rT7eCvQ/AwfBeMoI6g==
X-Received: by 2002:a7b:cd97:0:b0:418:df5a:3fba with SMTP id y23-20020a7bcd97000000b00418df5a3fbamr1465950wmj.32.1714467076349;
        Tue, 30 Apr 2024 01:51:16 -0700 (PDT)
Message-ID: <7f424247-5988-414b-a1ea-0bb8019b7ec3@suse.com>
Date: Tue, 30 Apr 2024 10:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-3-xin.wang2@amd.com>
 <3af4f1c7-9059-436b-9449-94bd7aad9eed@suse.com>
 <ce942d72-f214-4043-bf61-9d124c0bca64@apertussolutions.com>
 <8f543eac-a686-4298-a677-c984fe5230bd@amd.com>
 <027510f6-5512-4d1e-8382-6507abf9a0c4@suse.com>
 <d7369537-f7c5-49fb-bf13-a129868a06ae@amd.com>
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
In-Reply-To: <d7369537-f7c5-49fb-bf13-a129868a06ae@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 10:12, Henry Wang wrote:
> Hi Jan,
> 
> On 4/30/2024 2:11 PM, Jan Beulich wrote:
>> On 30.04.2024 04:51, Henry Wang wrote:
>>> On 4/30/2024 8:31 AM, Daniel P. Smith wrote:
>>>> On 4/26/24 02:21, Jan Beulich wrote:
>>>>> On 26.04.2024 05:14, Henry Wang wrote:
>>>>>> --- a/xen/include/public/hvm/params.h
>>>>>> +++ b/xen/include/public/hvm/params.h
>>>>>> @@ -76,6 +76,7 @@
>>>>>>     */
>>>>>>    #define HVM_PARAM_STORE_PFN    1
>>>>>>    #define HVM_PARAM_STORE_EVTCHN 2
>>>>>> +#define HVM_PARAM_MAGIC_BASE_PFN    3
>>>>>>      #define HVM_PARAM_IOREQ_PFN    5
>>>>> Considering all adjacent values are used, it is overwhelmingly likely
>>>>> that
>>>>> 3 was once used, too. Such re-use needs to be done carefully. Since you
>>>>> need this for Arm only, that's likely okay, but doesn't go without (a)
>>>>> saying and (b) considering the possible future case of dom0less becoming
>>>>> arch-agnostic, or hyperlaunch wanting to extend the scope. Plus (c) imo
>>>>> this also needs at least a comment, maybe even an #ifdef, seeing how
>>>>> x86-
>>>>> focused most of the rest of this header is.
>>>> I would recommend having two new params,
>>> Sounds good. I can do the suggestion in v2.
>>>
>>>> #define HVM_PARAM_HV_RSRV_BASE_PVH 3
>>>> #define HVM_PARAM_HV_RSRV_SIZE 4
>>> I think 4 is currently in use, so I think I will find another couple of
>>> numbers in the end for both of them. Instead of reusing 3 and 4.
>> Right. There are ample gaps, but any use of values within a gap will need
>> appropriate care. FTAOD using such a gap looks indeed preferable, to avoid
>> further growing the (sparse) array. Alternatively, if we're firm on this
>> never going to be used on x86, some clearly x86-specific indexes (e.g. 36
>> and 37) could be given non-x86 purpose.
> 
> Sorry, I am a bit confused. I take Daniel's comment as to add two new 
> params, which is currently only used for Arm, but eventually will be 
> used for hyperlaunch on x86 (as the name indicated). So I think I will 
> use the name that he suggested, but the number changed to 39 and 40.

Well, yes, if re-use for x86 is intended, then unused slots need taking.
Question then still is whether the array bounds indeed need moving up,
or whether instead one of the gaps can be (re)used.

Jan

