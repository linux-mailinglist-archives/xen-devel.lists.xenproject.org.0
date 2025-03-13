Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C1A5FB7C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912798.1319005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslMY-0002wc-Po; Thu, 13 Mar 2025 16:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912798.1319005; Thu, 13 Mar 2025 16:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslMY-0002uY-MR; Thu, 13 Mar 2025 16:24:50 +0000
Received: by outflank-mailman (input) for mailman id 912798;
 Thu, 13 Mar 2025 16:24:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tslMX-0002fi-Bq
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:24:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aed48b86-0027-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:24:48 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-390f5f48eafso703420f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:24:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df3512sm2785422f8f.12.2025.03.13.09.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:24:47 -0700 (PDT)
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
X-Inumbo-ID: aed48b86-0027-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741883088; x=1742487888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VQbiv3o1VPbSnvalhMR0Zn3EZ/anYo1JUUx5b6M7Dfk=;
        b=Ow1JCbZ8DvD2Qutg6CDgEF3z0shXrCFQ9Xv59SRYrqvvhqkgq+mX7PRyfcM0WMyvUR
         dFKRN16PZeYhYlZ6mmR55DYR7/9Xd36Hy8ZBkBH3DCTvEkISKnqAi8LIFZ/lzrJhVZtc
         c9OJTBtwo1bWIkqp3NiJcUuUzd/81Tn5yTiClRg6Q9nph5O9xSktWox8sIVSS+6Rb3JR
         Jh+YxzxLq8HWFFht1Y4swPBgE+aBjTgG5LCQG3Qdgla19jKaIEpYwilqHr6iJHtVujxT
         YWupI1oPAv7xPu+p7sWAQbXTOwPHZdK9c8Y/jG6TYUCTafnMHdwnr3jIwko4LZBQdBDE
         pVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883088; x=1742487888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQbiv3o1VPbSnvalhMR0Zn3EZ/anYo1JUUx5b6M7Dfk=;
        b=CZa/X4tDz5RCc3ucF4l4f19cdTsZQrCyvysU31DHasIDthW23xEzxFW0DAACJJD3vk
         8k2yZ1aOIIsZbvYt1UCKEYLj8ldUBECc/Pq4RYuYHpsJSJ5IfQGI4Jghj3z71xMwXVSZ
         ciJdQ25d1jOaO2DWLqT/FZhHbkwkx+uo31meVEjF89SHjJoqgPa4AYb67KOrEdCsZ7zS
         WkZZmI90rzZnt6KlGFDCVotmamFCfm9XMo2BsiDnlI09qy7QabMvR9ilno1/hURCYqJQ
         NP341V6gNGqoWj2MVOjwZsDb2+c6jSx1QQg25JHTO5uBgqFycosLTvSFd+ip0i1HVgtW
         fyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo9LB5INJGXg2HEtHf01jRezPCyzythYFDHLImhb3ZbPmwn+5OlGl709i1t1kCe01Qml96OcpxMhI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlWDZM8o9K1U8nJNMsEI7CMOSsvfQYJKJ8BDiAE5n0A2j/64hV
	bX0S1lvvFuPGTEhLyuG3GB5sxhFyGUS8qporvwO0hYwGGhP2MgGcOqCZS+KjMg==
X-Gm-Gg: ASbGncuWTXJvGWOPjJK9GNo9fBNC7LNv2cnOnZ7eu1Y99qonDNvv4GRbFVKQeb5MxVA
	0vtSZnH9SKWA2B968gJexztpzu9TvOpDwXFOtCYXh9/fd8qAStNH+gCJ82Vwr4tMjrorQECq2M/
	82Twj3Yf8cCL/oO4G3pdKnLsTEIPm7XOD9RnDGV2KysVbcQs7J+h+roNgg5exZX/8bTbazNvqWV
	tADE9TAkUBTw4dkb2+4IQeoQ95MgUgnbeoUlHyHinHBl7izklkI0gKDruqrknFGEgfRF9GUcVGC
	D08CgETWLZGxX5JBn/rJZxxCpRr/3eB+3NXTr+UQqO+6Z+k/aEyGSbsGAVCDs9t2pz86SkuACG3
	il7QJwMzbhKgwpZskBwgVzkhGY2BcVA==
X-Google-Smtp-Source: AGHT+IHJlqhn1O3RsaVoZ2CgtdifjjGMxQDvuFWt0AN1INolHRo1Y1heB602uamAsQ+v7bEOugSLpg==
X-Received: by 2002:a05:6000:1844:b0:390:e889:d1cf with SMTP id ffacd0b85a97d-396c336681fmr191543f8f.37.1741883088085;
        Thu, 13 Mar 2025 09:24:48 -0700 (PDT)
Message-ID: <1f394187-ffb6-4ddf-a6b4-e1f2384b5244@suse.com>
Date: Thu, 13 Mar 2025 17:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-2-Penny.Zheng@amd.com>
 <D8F334YWF1QL.1489MNJCLHXQ2@cloud.com>
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
In-Reply-To: <D8F334YWF1QL.1489MNJCLHXQ2@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 11:58, Alejandro Vallejo wrote:
> Hi,
> 
> On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
> 
> Commit message?
> 
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> ---
>>  xen/common/Kconfig | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 6166327f4d..72e1d7ea97 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -519,6 +519,15 @@ config TRACEBUFFER
>>  	  to be collected at run time for debugging or performance analysis.
>>  	  Memory and execution overhead when not active is minimal.
>>  
>> +menu "Supported hypercall interfaces"
>> +	visible if EXPERT
> 
> Any particular reason for placing it in the middle of the common menu and not
> at the end?
> 
>> +
>> +config SYSCTL
>> +	bool "Enable sysctl hypercall"
> 
> meganit: Arguably "sysctl" is a hypercall group rather than a hypercall, so
> "Enable sysctl hypercalls" sounds (subjectively) more appropriate.

I disagree. I view it as one hypercall with many sub-ops.

>> +	depends on !PV_SHIM_EXCLUSIVE
>> +	default y
> 
> Do we want a "help" statement stating the scope of the hypercall and the
> consequences of disabling it? Nothing major, but at least something that might
> convince someone on menuconfig/nconfig that this is indeed nothing to be
> touched for a "regular" build of Xen.

Yeah, so help text is certainly wanted.

>> +endmenu

There also wants to be a blank line ahead of this.

Jan

