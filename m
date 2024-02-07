Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6758984CCDF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677707.1054486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXj0f-0000ho-9B; Wed, 07 Feb 2024 14:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677707.1054486; Wed, 07 Feb 2024 14:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXj0f-0000fr-5n; Wed, 07 Feb 2024 14:34:45 +0000
Received: by outflank-mailman (input) for mailman id 677707;
 Wed, 07 Feb 2024 14:34:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXj0e-0000fl-09
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:34:44 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07b046fa-c5c6-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 15:34:42 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so10645205e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:34:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e10-20020a5d500a000000b0033b518f73e1sm719251wrt.71.2024.02.07.06.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:34:41 -0800 (PST)
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
X-Inumbo-ID: 07b046fa-c5c6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707316481; x=1707921281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5rBWMcq2hTmpd869bkHfCkopsDt45VP/hnDbkBCaLo=;
        b=EpDHiOzp+EGe1ZA3imu4BHlmijmb9cDZhx+mtspQY1tUJXLz0ui437/eCEBJXzle8P
         PxFb5DN3ws9jMmyqe9cdlmbtfu1fh8MwOIS8BuE7a3Y3yuCpdy+q5ie4DTvP55zwRbFx
         RncJZT/WjYn85xwEk7DfOkbdxJ5PMXVABMx91IBi1qFcvOxxF8pqP8MojS0InC9Qzwkp
         2d9nHhMk+YZl1wEL2D+Bv+FdLSxHar399/oIo7k9zdp3aTJSZVOiL5YzAOE0YeI/9PyH
         aHA5IC6Ee9XcpnSTwhuYVQkzKoZPPgrOA1+wyMNt74EkDvKkevGcu2GI64N/v/DhV9f3
         9tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707316481; x=1707921281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5rBWMcq2hTmpd869bkHfCkopsDt45VP/hnDbkBCaLo=;
        b=l4PF9V6lCTYnwokp1CuYkfzVQArmW9HbmL8cZPQM/k3mQ09Wtlj5kdLGJDjdqM33AM
         OMMTBIwuMDXQiiPWFgdjHe3RvZuPMvNvz7ssT9yFYQHmvVyCK18DxVwejBoDMxWWCNVU
         xMGqvOC3aOBnz1kAmo6+L4mCZ8celEKKq55ll0FoF8PeK9zWrLEE9uRtZZ3X2mJg88Zo
         umBRx2J+GQt4bG3kjmhv3NDfN0rR1qR2XsT+Br6eyUI0+/jVHgSVaWLcnZmwUeZGBZff
         8vS+2rra0QNkzYQ9DNLDSnPzhayLhdUO0TzsOWUdXyb5Fc1+F1026bnPOwzILkTOPBJx
         vluA==
X-Gm-Message-State: AOJu0YxJm9/m8FO2aDcGjLe8NGZoTFAhipG5TO9SsaHkz6qWcr4ggTtm
	vZuM4Rmh0PI4C6JjCQQLXmv6q2GxfaTzw+0E6FGHQTrsOphU3azpwOd4QCQbQw==
X-Google-Smtp-Source: AGHT+IFXY2otHOBvYt/xZnPjvK4DetTRv8P227sxQNWJUH+Wu2wHjcamg7GZduQIKMtD3FKk6cHETw==
X-Received: by 2002:a05:6000:69c:b0:33b:4e6b:e8fa with SMTP id bo28-20020a056000069c00b0033b4e6be8famr2474448wrb.29.1707316481389;
        Wed, 07 Feb 2024 06:34:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXW/IjbcFjN9rqJu7vaTXCHwP1y7CNO33jbqQdLnZVyElhYk8o/28zlJim08ank+hpGcd9lnqxIocKaeC3bQA7JnFbXJVGZXNxA0vCgS1fqRg2kAEcrFoFpG28wCZhcW9ypcWM4
Message-ID: <ec2eb8b8-e407-49d5-ae1e-8d8ad19e3eb4@suse.com>
Date: Wed, 7 Feb 2024 15:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: suppress GNU ld 2.39 warning about RWX load
 segments
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90070a25-445f-4b82-be19-d87b25fc9b8c@suse.com>
 <59b77f3b-53d8-481b-925c-b7f0dc64e2c3@citrix.com>
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
In-Reply-To: <59b77f3b-53d8-481b-925c-b7f0dc64e2c3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 15:31, Andrew Cooper wrote:
> On 07/02/2024 2:03 pm, Jan Beulich wrote:
>> This aspect is simply meaningless for this component.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> In principle Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but
> 
>>
>> --- a/tools/firmware/hvmloader/Makefile
>> +++ b/tools/firmware/hvmloader/Makefile
>> @@ -20,6 +20,8 @@
>>  XEN_ROOT = $(CURDIR)/../../..
>>  include $(XEN_ROOT)/tools/firmware/Rules.mk
>>  
>> +ld-option = $(shell if $(LD) -v $(1) >/dev/null 2>&1; then echo y; else echo n; fi)
> 
> The root config.mk has cc-option, and one opencoded ld-option for
> handling build-id's.
> 
> This ought to live there, and ideally clean up the opencoded use while
> at at.

Well, that's what I first meant to do. But: xen/scripts/Kconfig.include
has a different ld-option, and I didn't want to get into the business
of having two fight each other.

Jan

