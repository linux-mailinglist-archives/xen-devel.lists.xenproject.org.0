Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45DB01971
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 12:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040720.1412061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaAjp-0002EI-1A; Fri, 11 Jul 2025 10:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040720.1412061; Fri, 11 Jul 2025 10:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaAjo-0002CS-U3; Fri, 11 Jul 2025 10:12:16 +0000
Received: by outflank-mailman (input) for mailman id 1040720;
 Fri, 11 Jul 2025 10:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uaAjm-0002CM-RW
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 10:12:14 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 831d6909-5e3f-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 12:12:12 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so1560734f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 03:12:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435f262sm42517875ad.236.2025.07.11.03.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 03:12:11 -0700 (PDT)
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
X-Inumbo-ID: 831d6909-5e3f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752228732; x=1752833532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QKHTQt6ljPDnphpweZNI0xrxWBCJ7Ma7i+12e468wG4=;
        b=Vq/Te23L0NvBNO9EWlGH99ucD8VIEUT2IuSCUTJmaDtQ1IsmT9S2SVGZg8EY/vesqs
         lbRGNSF24AiVMKTNz4uK35RS2xoFEKbzYCNgIjIGCS9o8T4dk1QDjd1jbX9FEQ4G0PfS
         B0CHqHwKgSkUiU/eMqMr37VoK6WCdJG/++y+GnodWijsUlp+n8d1m68nf+UEc3iogb30
         AOMqGyeSF7v+OSwEV9pG61t2KuX6bk5SbAhLyK16g5PwAjxbDjbiub9uTnPyz92+cJ09
         9uP2DUgXwdgnLqptBBki/UoVFqN0vwu5sF7vGaoELcewan+YiEPVBQw26tiE72Zq9uvm
         tTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228732; x=1752833532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKHTQt6ljPDnphpweZNI0xrxWBCJ7Ma7i+12e468wG4=;
        b=JNXNDFaSgaKl/0XQN466hEyAXhZeDKnALgqUbFaVy5b5P+2gAYFlyPIqtFsL0a4lZi
         GXrrTFN35LhUkM/TF5eBTuofI6n3jmL8deNCR0WGT5tsmpLvSC2kXrhIYX1M+yC5yGys
         c5Gq73DDkuWJgWwF7DD5q9nGr9MP/LORy54jhg5kTQ1NcPyRgNL4uk3UTFR2/0ZpY415
         /zIqwZ/yCV5KWiz++8f5ijUUunFsGID+Ur6av9kpoF0fBXbFnQVGiVNwXghg14C7FOtU
         Aj9a4RUPDChtYpxX5qz+L3VBdfkdt5esP0mg27c+KNF/ODgCqdUB3oTks5bwbVGT1UZu
         30Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVvfAq65/ixKthpcfw9+w0FR4W7LBaz+yywL1N+PsnfQfjZ67ZCxTAB/KbdjIbfmPuQ2oN9W/vl50A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxVGkk1twaq5nzxmLAsCvF2iNDs7aUveksOajHPWboDQ4WsIMY
	abMkEyb19H9wt4BN059WYkEM+r4ji7lQLto8U9g6Znhf+ltesh8JlPu5cb8w+wcHPw==
X-Gm-Gg: ASbGncsCZYODU/SERbfhmd2jmCdxvRhBFSnONPzdLzDq+rpCd0GzCmZHML1qgO7gIgF
	vC28EWEPzSGjKtvjXzF7y8ARjlXOBPy2BT00fsdGrtaGKvo3uTnrY/6nUc15JDvtkA+LcZq0cgT
	Rulz5tyckkE3Gk/e3SyxxbUnCC7KPA/PHCH5B+66AK1HSe5KXeTIcBRJayF6uTe+vvhwqVcf2i2
	qLPw4MWUviGwSo/yolrmwLWi/z37xU4Kmo7bfiAVmzXEPFQux2ai7h2lZwruUGyYDcjCPyxXKph
	AKVv3B7ckmXfKBjOw6B1RHS2d6I0fi0is1NshtnEp+WHC6Q2WjW8gkWdak8TjoA9OsLnj+6Kbx1
	GM6kviXmNG4fDGjce+Et1bfP4kgfDa4ChLMqnDhK5M2RLIkIlOjeLgEwCuvNawPH7flezyZJn3N
	B4Fvh2K7I=
X-Google-Smtp-Source: AGHT+IGYFIwHqcao0DUapZNp/sh7NkKM/YVz4iH7fnOZ+5WM/LuYffK1dHj8QYfWP8WoM3L3r158jQ==
X-Received: by 2002:a5d:64e8:0:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3b5f185655fmr2713360f8f.8.1752228731844;
        Fri, 11 Jul 2025 03:12:11 -0700 (PDT)
Message-ID: <5d45dee0-6e40-4d91-a2cc-0ac8f6b12282@suse.com>
Date: Fri, 11 Jul 2025 12:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xen/console: introduce domain_console struct
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250710013421.2321353-1-dmukhin@ford.com>
 <6e3600ad-f53c-4e9a-9713-4301b5bd0a6a@suse.com> <aHBj4IZdD50LWSgF@kraken>
 <f0d82045-4492-4d13-b0b1-97f95ad81727@suse.com> <aHC8ZBcRAId5wYoZ@kraken>
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
In-Reply-To: <aHC8ZBcRAId5wYoZ@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 09:25, dmkhn@proton.me wrote:
> On Fri, Jul 11, 2025 at 07:59:27AM +0200, Jan Beulich wrote:
>> On 11.07.2025 03:07, dmkhn@proton.me wrote:
>>> On Thu, Jul 10, 2025 at 01:16:24PM +0200, Jan Beulich wrote:
>>>> On 10.07.2025 03:35, dmkhn@proton.me wrote:
>>>>> @@ -877,6 +873,16 @@ struct domain *domain_create(domid_t domid,
>>>>>
>>>>>      /* All error paths can depend on the above setup. */
>>>>>
>>>>> +    BUILD_BUG_ON(DOMAIN_CONSOLE_BUF_SIZE <= 0);
>>>>
>>>> While the "equals 0" case can in principle happen, the "less than" part
>>>> is dead code (and hence this needs checking differently): The type of
>>>> DOMAIN_CONSOLE_BUF_SIZE is an unsigned one, so wrapping through 0 will
>>>> yield huge positive values.
>>>>
>>>>> +    err = -ENOMEM;
>>>>> +    d->console = xzalloc_bytes(DOMAIN_CONSOLE_SIZE);
>>>>
>>>> As previously indicated, new code ought to use the xv*alloc family of
>>>> functions, which deliberately doesn't include any ..._bytes() forms.
>>>> Note how instead there is xvzalloc_flex_struct() for situations like
>>>> the one here.
>>>
>>> Looks like xvzalloc_flex_struct() is not used anywhere in the code base...
>>
>> And what do you mean to tell me by that? xvmalloc_flex_struct() is used,
>> and x[mz]alloc_flex_struct() uses are still in need of conversion (which
>> is going to be a slow-going process).
> 
> Just an observation; I was not aware of these APIs and I was not aware that
> there's some slow-going process of switching to preferred use of
> xvzalloc_flex_struct().

The ongoing conversion is (more generally) from x[mz]alloc family of functions
to the xv[mz]alloc one, as is made explicit by the comment near the top of
xvmalloc.h.

Jan

