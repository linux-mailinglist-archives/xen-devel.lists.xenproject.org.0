Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB90B8B6A37
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 08:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714521.1115797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1giT-0002YA-0a; Tue, 30 Apr 2024 06:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714521.1115797; Tue, 30 Apr 2024 06:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1giS-0002VA-U0; Tue, 30 Apr 2024 06:11:48 +0000
Received: by outflank-mailman (input) for mailman id 714521;
 Tue, 30 Apr 2024 06:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1giR-0002V4-Fq
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 06:11:47 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 840516a8-06b8-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 08:11:43 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3499f1bed15so3705837f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 23:11:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z6-20020adff1c6000000b00343ad4bca7dsm31136020wro.85.2024.04.29.23.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 23:11:42 -0700 (PDT)
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
X-Inumbo-ID: 840516a8-06b8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714457502; x=1715062302; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZeQ+gUIfJDVZslBNSDkzh3mxG8Ga/S0myGM8IdEKHw=;
        b=fu5L+ykjLqlKzmbk78WIB7GnAWyAt0LlSDRAKTJV0EavOrXL5EQnZaKqmpzWAlm8dE
         XUkzaV/ypSAffKtVX76GdXI+toSbaBr3/WctRP2icQPM7v2DfXf3nar0/37vkw02xBAs
         eTz5txNjECPrYHNCCf56bDZBX4qE6y//dxKCElcapRKhrrHi2wcfDHLugFf3SzOlWk/p
         B+PsVktBbsg08poZTjXwdxoUgJ/ntMYZ6KSrkHQJKaNPxeJQ5Qo9aFZ9ICF3qtkeK/Qq
         B3NdF0N3p98w/F+bC6jGNCspqi9CW2ZU50cEyUseOPM18h73NvevKUh7VBDLqFHVU+eo
         iZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457502; x=1715062302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZeQ+gUIfJDVZslBNSDkzh3mxG8Ga/S0myGM8IdEKHw=;
        b=CXOpKo0PHFlXXAbZtpO4Lyx0GxRizbKxyXNyHSaXkDUhx3N1LoY0zD5aGOsHeL0V+t
         oLA75vp55x8CXFr11doYqwdFevFbRHqLFd8IST4023JL22DiIGzsssDNAN3K7XgjBVIY
         0aCfz0wXrR/2fHH8SnzwLqUi8eL1mshB+DFHevLBet+w/qUH4QDGAiuqPsqrb0iG8T2g
         WbyrFPweA7D7gVcJ/++ViVMJdf0/eWlYa9ghKe7RuJBH+lVdO1M+UHQvooHGv/38Kv3f
         RB9rBfjffxMhufLkMR/iaKJzf7Gd4pc6cql/dp5P9XoTz6bshG5Q0DAFjZ1GgUtaGFPf
         bUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf0YdSU4N4XfBw/gnYKaiTEyIXnbzv4/A/ZNA+PUh7+FVWOe8ftrLV+qVXVgO21CvuTTZDLXdWxg/VEUViGUzg+NTmr9jMqeKwVyarG7o=
X-Gm-Message-State: AOJu0YyuBCyEZxeaJY3J1LmGRdw9YrJZfxf0alCELXdy1OSzWicH5Enc
	s8cITDsfHNA4NRW2OKqJO+el8gj6Mg6P/HHX2180cgvSsKXQvxVXZXYjJBwgnA==
X-Google-Smtp-Source: AGHT+IFG4y2/bS+M0iRXtLer/JeG4/pslKNldjRgxWzIhY5BTULzdi+XVA4Fn9vs1uBbJs5HNZ/i+A==
X-Received: by 2002:a5d:4b92:0:b0:33e:6ef3:b68e with SMTP id b18-20020a5d4b92000000b0033e6ef3b68emr1395717wrt.34.1714457502544;
        Mon, 29 Apr 2024 23:11:42 -0700 (PDT)
Message-ID: <027510f6-5512-4d1e-8382-6507abf9a0c4@suse.com>
Date: Tue, 30 Apr 2024 08:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
Content-Language: en-US
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
In-Reply-To: <8f543eac-a686-4298-a677-c984fe5230bd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 04:51, Henry Wang wrote:
> On 4/30/2024 8:31 AM, Daniel P. Smith wrote:
>> On 4/26/24 02:21, Jan Beulich wrote:
>>> On 26.04.2024 05:14, Henry Wang wrote:
>>>> --- a/xen/include/public/hvm/params.h
>>>> +++ b/xen/include/public/hvm/params.h
>>>> @@ -76,6 +76,7 @@
>>>>    */
>>>>   #define HVM_PARAM_STORE_PFN    1
>>>>   #define HVM_PARAM_STORE_EVTCHN 2
>>>> +#define HVM_PARAM_MAGIC_BASE_PFN    3
>>>>     #define HVM_PARAM_IOREQ_PFN    5
>>>
>>> Considering all adjacent values are used, it is overwhelmingly likely 
>>> that
>>> 3 was once used, too. Such re-use needs to be done carefully. Since you
>>> need this for Arm only, that's likely okay, but doesn't go without (a)
>>> saying and (b) considering the possible future case of dom0less becoming
>>> arch-agnostic, or hyperlaunch wanting to extend the scope. Plus (c) imo
>>> this also needs at least a comment, maybe even an #ifdef, seeing how 
>>> x86-
>>> focused most of the rest of this header is.
>>
>> I would recommend having two new params,
> 
> Sounds good. I can do the suggestion in v2.
> 
>>
>> #define HVM_PARAM_HV_RSRV_BASE_PVH 3
>> #define HVM_PARAM_HV_RSRV_SIZE 4
> 
> I think 4 is currently in use, so I think I will find another couple of 
> numbers in the end for both of them. Instead of reusing 3 and 4.

Right. There are ample gaps, but any use of values within a gap will need
appropriate care. FTAOD using such a gap looks indeed preferable, to avoid
further growing the (sparse) array. Alternatively, if we're firm on this
never going to be used on x86, some clearly x86-specific indexes (e.g. 36
and 37) could be given non-x86 purpose.

Jan

