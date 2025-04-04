Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58748A7B820
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937771.1338661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bDQ-0005Mr-0P; Fri, 04 Apr 2025 07:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937771.1338661; Fri, 04 Apr 2025 07:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bDP-0005Kl-Ss; Fri, 04 Apr 2025 07:11:47 +0000
Received: by outflank-mailman (input) for mailman id 937771;
 Fri, 04 Apr 2025 07:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0bDO-0005Kf-IV
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:11:46 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1088a8af-1124-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 09:11:44 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so13085985e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:11:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm41348975e9.21.2025.04.04.00.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:11:43 -0700 (PDT)
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
X-Inumbo-ID: 1088a8af-1124-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743750704; x=1744355504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gKfb0YXiZ+F4WZnW8J7fJxrVl657tqA94N9IAZy6bRg=;
        b=b1YsGs57bfnNvvxi11hsQ9kyPU7sf/8BkWZxZq5f3ub/yBOQM6q0SoQYOWeyMjxNmD
         lfZsD4yXNQEpG7qZgae+sBMu4dNJ3kcvASEf+V56zjH6iixZzaG1mPZBLZBaRzEDxxx+
         IKRaUY4cLcl7na3Ng27Fj75XvUuWJnYCNJq4taBpcDXFfUUpa8g3W/tUJHDDJN+DLJsM
         wMD8vjIwNnw+o1mZuxvMtdV8duZU+TbwMMSuInAcRNKmArmAZtuwTMWO0NdksH5uzj7F
         DAX6s06v9rquUy5vnWP8DxsdKeRNdh+MRnxyA2RLdfrHITbO81hIUrOSTZjZS2t474Hj
         F27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743750704; x=1744355504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKfb0YXiZ+F4WZnW8J7fJxrVl657tqA94N9IAZy6bRg=;
        b=QpTtENEPOkhLTNj5WIzqq3Dmhw5sZAN1zxMaE/gUEQ/QGdLEcCh3Z7PFyLygifVlkE
         iZzSw3W3ZWqLpkhX0t7yjdMLv+Kp7nQRZc4rcPsERZ1MHeanreINO33W/eTOig4nmkqM
         QYxtnwkRD45ZLZA2RPxqqdfD8V8lZwKbGXYC0GAo+CzJxRWMuNTgHYd+f6krKtE7926n
         JrMZOS+X1hCWUvXjJ/XAIpNpB3ZyDhLK0I8SCyaoJ98HpxxAxRdfXCO7J4yE+eBwsIFv
         m6UBAb+SATtcq8JqQh9a9V5asIh3IXl/44WboW4JW1CSvKz1sBadQT3IoW07htduO1oW
         HwIw==
X-Forwarded-Encrypted: i=1; AJvYcCVQnQks+STj/6R0xYTXfuLbXVp9QsexTe1aGEJiDH1bT3YWS+Do3CoJrvYOw2RxtE2G7fLGt6isNkg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw15WOOuwEptub9ogzR51N1Qy7+xI/Zd4SrebQTW3W3Hqs34mTe
	bXzPtjLdWCdfpUM3J0/rn6NOTh66JGnjwmypY0FbEcwbkvscO5DE5ydsv9xoIw==
X-Gm-Gg: ASbGncvmuDul7S34/8As68iaq8PWv6Vot+6sw+kI/vjvbB/hMwIhDgvFdxp5Or9TexH
	kQJfGv97EbyZXZPJ7cPU2PTfRrk3EJrqbJZcLN0Vq8PXrjWf+2YlDroQ2mhx0D7UqRQYFmDFDHq
	z/ie+hQ49NITAUUGS8mPZkpz6Ezx624cpwtXMruXBf7fW5IQlR8eFarwhzTaXspYRg8esa9MRDi
	DsMOkCchwmN6JdrK1b3/ASUysu0QUj+yaPu23Qmr/c/FFsaK7XSRLpJE0I/Fbi2UN9bIV/GTxd+
	s/HrByHFKnnL3DNbJ0B/rnrAwNjNxKRGQrkAZDzlPReYTfqFRfr3J1SfO3oY1AjJ7Dzdkwv8Bgk
	DFkj5icezXJZcDH7VVURFdJJX51h9gQ==
X-Google-Smtp-Source: AGHT+IHlo8OKIE92JKyXXJp0cSRoM0TBs5BNF0W+RWg0HBtg4tCj28v2WUZkQkuGqJ4sfD7LNZ3j7g==
X-Received: by 2002:a05:600c:1e13:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43ed0da49e6mr18224555e9.30.1743750703788;
        Fri, 04 Apr 2025 00:11:43 -0700 (PDT)
Message-ID: <733e19a7-189c-4f98-af1d-e2f880d999be@suse.com>
Date: Fri, 4 Apr 2025 09:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/emulate: remove HAVE_AS_RDRAND and
 HAVE_AS_RDSEED
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 dmkhn@proton.me, xen-devel@lists.xenproject.org
References: <20250403182250.3329498-1-dmukhin@ford.com>
 <20250403182250.3329498-6-dmukhin@ford.com>
 <de2ef26a-f999-4962-abbc-3ffcc684e7f7@citrix.com>
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
In-Reply-To: <de2ef26a-f999-4962-abbc-3ffcc684e7f7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2025 21:21, Andrew Cooper wrote:
> On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> The new toolchain baseline knows the rdrand/rdseed instructions,
>> no need to carry the workaround in the code.
>>
>> Resolves: https://gitlab.com/xen-project/xen/-/work_items/208
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>>  xen/arch/x86/arch.mk            |  2 --
>>  xen/arch/x86/x86_emulate/0fc7.c | 15 +++++----------
> 
> Huh...
> 
> I was expecting a hunk in xen/arch/x86/include/asm/random.h but lookin
> at it, I see that didn't even get the HAVE_AS_RDRAND treatment in the
> first place.  Also, the + constraint, rather than =, looks suspicious.

Might that have been for a similar reason as the one you recently added
a XOR ahead of POPCNT for? IOW us wanting the clearing of the output to
happen irrespective of whether the if() condition is true?

Jan

