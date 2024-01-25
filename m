Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D92083C815
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671650.1045113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2eD-0003eJ-7J; Thu, 25 Jan 2024 16:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671650.1045113; Thu, 25 Jan 2024 16:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2eD-0003bz-4g; Thu, 25 Jan 2024 16:32:13 +0000
Received: by outflank-mailman (input) for mailman id 671650;
 Thu, 25 Jan 2024 16:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT2eB-0003bp-Tm
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:32:11 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4937366e-bb9f-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 17:32:09 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cf2adac1ccso21960551fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:32:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dh7-20020a056e021f0700b0035ff0206ae6sm9706806ilb.17.2024.01.25.08.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:32:08 -0800 (PST)
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
X-Inumbo-ID: 4937366e-bb9f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706200329; x=1706805129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dS5ri2IXt5mJgfqboW/ZEsC4RkztN2S/qXwuMfz7Cyg=;
        b=BlzEE1W8rJmXR5aVPN3dSTlTTvGj5JeGckF2uMteMoN6cyF3mxZHpyJEIKGrTO4Nhr
         RkE61YybTuSs28ZUs96Y4zU2FGao3tOneKMABwE+R7zF77iWYgGu2ZCdK3wwUzcKDwLM
         BSBCZ9JjNLz/0GE48xuADCs4bOsfKQm2dFCjpjEeHogJnEdOIxNtB1mhTmgongrcQXqm
         xs72p/C79/52PJf2SVOtYOUDOE70zLbIq3NIFqgr3k8jy0/8hc++EmMCXwioY2pUZith
         01dTnc9D20NfKFDdAVG3HoY5Z32qHXes0nZ9KDqr0e1oct8q1RQ9z2LlQBkCsVV9Xc+J
         TIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200329; x=1706805129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dS5ri2IXt5mJgfqboW/ZEsC4RkztN2S/qXwuMfz7Cyg=;
        b=bvGL/VV2Ggtz4hYYlrvd4Hs9k3gjcoPk5mZET9OsoQ7fbzDTpbJQfsOLK048kvRxWf
         90f+DNhMLXp5Wmvrzo7XY0kZxk4cHCmMalJPKzTftm8h8g8jGfajCaLZU95ZqUwAbnKj
         C8I1bYD76t8IcFjnAi6gZEwC8pWHK191suEyvFIJ7igzgnVg1WOl0AYBXrMUAjfQiUIJ
         KtQ1x3iLvAHkqAH30oOwM/9PZHNYbkj0wj/GvLxTsjlYzxV0WlTdRz2Y3L0ARHXWsATt
         3wapSvCB7W+BANmPSTADmQAKimCRg9CSYS3fORyFjuEl6mtHPZFTj3X5/Ik++TTDc04w
         ftAA==
X-Gm-Message-State: AOJu0YwgWaZfAvEh1t/qBNSxEznpojVHFEgoHe7MowvvPjUjUPHZd68E
	aULxyzNH8nSOEWZR4vx4RFLo7296+Q30HtFlLCdptNjxn0B0mQ3gxx4hBWKLuQ==
X-Google-Smtp-Source: AGHT+IFElkGtgsOnB79U9FLaV0MobHUc8cuojmtwV6plhGvP8Jgeiai/dLcI0LUfXgIqeKIpzcCKxw==
X-Received: by 2002:a2e:b5dc:0:b0:2ce:540:f693 with SMTP id g28-20020a2eb5dc000000b002ce0540f693mr669136ljn.25.1706200329245;
        Thu, 25 Jan 2024 08:32:09 -0800 (PST)
Message-ID: <171af4f2-1725-4280-9440-b3bedf6ccf45@suse.com>
Date: Thu, 25 Jan 2024 17:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 06/27] x86/srat: vmap the pages for acpi_slit
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-7-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-7-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> This avoids the assumption that boot pages are in the direct map.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



