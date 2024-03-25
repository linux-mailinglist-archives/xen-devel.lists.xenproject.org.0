Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC60889467
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 08:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697590.1088469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofBX-00052X-QO; Mon, 25 Mar 2024 07:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697590.1088469; Mon, 25 Mar 2024 07:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofBX-000510-N5; Mon, 25 Mar 2024 07:55:59 +0000
Received: by outflank-mailman (input) for mailman id 697590;
 Mon, 25 Mar 2024 07:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rofBW-00050u-4m
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 07:55:58 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c06950e-ea7d-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 08:55:55 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so524286566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 00:55:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l13-20020a1709061c4d00b00a473780b012sm2747544ejg.156.2024.03.25.00.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 00:55:55 -0700 (PDT)
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
X-Inumbo-ID: 1c06950e-ea7d-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711353355; x=1711958155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZvfPwCaeoSaUbow16/njPd6dB4EK4YynekTWLX4jqs=;
        b=A90efINCpCmT5DcRGqKL10rtXMoDBGFOJ2LvL2eX8Ca9APIYgC1VNUJcLTmadZ0/PM
         xSuOpfwujRYItgqlTORAkEZv35F/GnyZQYAeu2R0S90dGurweS0JRuldmV/kj1y6Goxg
         wynTXA2BoNq0h3WtE26hvJvat84ABbeTh87CBOZOMkSbLtcJ6Ql7UYn760bzlsjmgUvg
         YKBdASNFYWEgKsLZAArv3KwjzPpdQ7vxtMKg3/4WBjVu+vGpA+G1KercF5LayxdKbS3Z
         u+ukqCw+4FAt993qMz5MSBpXSTiUQIl201/N4+p1vpxiF5GylUkEqDg2fTqTvYQ7K1Hy
         +xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711353355; x=1711958155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZvfPwCaeoSaUbow16/njPd6dB4EK4YynekTWLX4jqs=;
        b=EMA/4ZLeTfErV6pMW/6+HMaa7INK3biPFkU9KeyxY9VZnB/oZKAG9h+t515SGDNQz3
         wz4z97h0eGYp8Gv2mAFSXPKVsYWAAN0LVxYIj1uHpDrGYHwzXI39p5mHBkJIeBusnCO/
         FwfRNlGndZP1cW1W8MBFwxQwMPfp35Q0NIft7BHw8D1utjnIzJhxEUy8cExAYOqxuQHs
         cMfqF9Hgea/yYZ3R8n40X3f5g1bl7P7UFvqc8pEXwITIp/IS/lOvI/jqfqhnwYQ3Gctk
         NEQb8SsEskF2bjbor/FdIad16fI/YAyChj0g2RhpftC4QaTGrPKXGJQ0R9zN9cQmAhO8
         wk2Q==
X-Gm-Message-State: AOJu0YxmugjTsu0AU/5S03FEhs3A1zaBgefi/3Zx/nQpeRF0/K6U/P3p
	/zbHfZwHGdMcHmm0+kRJ1vBNI3ud0v7QWvGmfDn2GxB8xNGp64StrP+1g+ZJXQ==
X-Google-Smtp-Source: AGHT+IFEa7hx+xCjIU6B5shUkk9swU937qkHsPDzRvGy/rCbNFgQ38Fg6xmkXbIapZRoNKl75xBALg==
X-Received: by 2002:a17:906:f9d8:b0:a47:499b:d735 with SMTP id lj24-20020a170906f9d800b00a47499bd735mr3197856ejb.14.1711353355246;
        Mon, 25 Mar 2024 00:55:55 -0700 (PDT)
Message-ID: <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
Date: Mon, 25 Mar 2024 08:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Serious AMD-Vi(?) issue
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <ZcqoVBnsgUJw8G0l@mattapan.m5p.com> <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
 <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
 <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
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
In-Reply-To: <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 20:22, Elliott Mitchell wrote:
> On Fri, Mar 22, 2024 at 04:41:45PM +0000, Kelly Choi wrote:
>>
>> I can see you've recently engaged with our community with some issues you'd
>> like help with.
>> We love the fact you are participating in our project, however, our
>> developers aren't able to help if you do not provide the specific details.
> 
> Please point to specific details which have been omitted.  Fairly little
> data has been provided as fairly little data is available.  The primary
> observation is large numbers of:
> 
> (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I
> 
> Lines in Xen's ring buffer.

Yet this is (part of) the problem: By providing only the messages that appear
relevant to you, you imply that you know that no other message is in any way
relevant. That's judgement you'd better leave to people actually trying to
investigate. Unless of course you were proposing an actual code change, with
suitable justification.

In fact when running into trouble, the usual course of action would be to
increase verbosity in both hypervisor and kernel, just to make sure no
potentially relevant message is missed.

>  I recall spotting 3 messages from Linux's
> SATA driver (which weren't saved due to other causes being suspected),
> which would likely be associated with hundreds or thousands of the above
> log messages.  I never observed any messages from the NVMe subsystem
> during that phase.
> 
> The most overt sign was telling the Linux kernel to scan for
> inconsistencies and the kernel finding some.  The domain didn't otherwise
> appear to notice trouble.
> 
> This is from memory, it would take some time to discover whether any
> messages were missed.  Present mitigation action is inhibiting the
> messages, but the trouble is certainly still lurking.

Iirc you were considering whether any of this might be a timing issue. Yet
beyond voicing that suspicion, you didn't provide any technical details as
to why you think so. Such technical details would include taking into
account how IOMMU mappings and associated IOMMU TLB flushing are carried
out. Right now, to me at least, your speculation in this regard fails
basic sanity checking. Therefore the scenario that you're thinking of
would need better describing, imo.

Jan

