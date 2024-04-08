Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958089B7FD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 08:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701740.1096141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtitN-0001MH-QM; Mon, 08 Apr 2024 06:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701740.1096141; Mon, 08 Apr 2024 06:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtitN-0001J4-NL; Mon, 08 Apr 2024 06:54:09 +0000
Received: by outflank-mailman (input) for mailman id 701740;
 Mon, 08 Apr 2024 06:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtitM-0001Iy-EH
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 06:54:08 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca8b7af3-f574-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 08:54:06 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so2727065f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 23:54:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k7-20020a5d5187000000b003434c764f01sm8190967wrv.107.2024.04.07.23.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 23:54:05 -0700 (PDT)
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
X-Inumbo-ID: ca8b7af3-f574-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712559246; x=1713164046; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4/Nhr8Da58GALenomFFyRjbuSRo/pAapiqGIkzHCDY=;
        b=KBrAKe+q5R2HxKHeJzwhBOqhfEYHHUAJALpiWs4VO8/dJC5sh8Q8rfpH9VXL+gUiIe
         f71kD8K1rTnbLDn/S4gg+d/wIOq3QqxcN+q6v29yIJUkPcZgo+exnJtcQWlcmQ4q5+Sv
         OEeTAzZVpR8pDZ3FO2cr8J5vEwPwHJfWOqSAyoPABmLzxAtYfLg1y5TeIPldHl0OzFuy
         m7YUbm44uXJ94RznCoyVFRFW5nmUt0HG36Y6vPKa2IHp3W060CyenIlVwC+bTC6YdJhn
         onepFBQK8fE8V4jt7Ds242iBW6O7QsABZkLxX4KoqsmD4CSz99VDNms186dG9FMVtIr/
         tqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559246; x=1713164046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4/Nhr8Da58GALenomFFyRjbuSRo/pAapiqGIkzHCDY=;
        b=ir55f6Rdzhmw/iQJrAwHInY0C4gafrVDDKKIfoawwL3MVq2XXBryUgnGqYblWf0oIO
         OkxHTHbRgStr3D2l2/7wb8sE+N7k1pAqE83SHMQEkwWWM4Nwk9CTuyH57WnR89421ddN
         /qLuQbE030WiwkOleL7sEV6JueFOOb6gIhN6yAlIhURY8WG2CjBxQsi/itwP9yrREIpK
         oxTKVxzMqrRksqeRx7y88keDUcWHNIk9lWcfPm3/ISuKTtZ27LSBlC0j14JV+joxx+K+
         3D/5JJRoTQvoYlj9Vqw55kdDpzo8d9v/8wHf7dBUkcIpnsri+VBIOKM3vhn+OnRiyPfG
         9TsA==
X-Forwarded-Encrypted: i=1; AJvYcCVkcYzmOP0QpucvRtmpK7QPKjIJP7tGGgsVwa11jfF2XxRvsQdy5alWZ6Ts0eS2ibTcypawEnO3mZP9U9ojVuGQWN8x5chX+IqUB2vvQKI=
X-Gm-Message-State: AOJu0YzJsLGBKJvAcZZJLQqHlX7LkkPHhIrOWabU1oTQVjxHYTXQoQxG
	4Ps3fxRwJnlrGwGEAeyS/stepFbS/kuT1ACW7lBstk887Ew8ceUsUcHj/4QCGA==
X-Google-Smtp-Source: AGHT+IEv1Bv6/6p6hHS0JJG8ximGvYyO/1oj1zrJErJWHfgJOwsFzsFAbeNwhIZ85bSzHco7gDQplg==
X-Received: by 2002:a5d:43cf:0:b0:343:b9e4:7f9a with SMTP id v15-20020a5d43cf000000b00343b9e47f9amr5420096wrr.33.1712559245786;
        Sun, 07 Apr 2024 23:54:05 -0700 (PDT)
Message-ID: <7ab4053f-f8b3-4b6a-bd29-5d0fa228fca5@suse.com>
Date: Mon, 8 Apr 2024 08:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/acpi: Allow xen/acpi.h to be included on non-ACPI
 archs
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20240405182031.396528-1-sanastasio@raptorengineering.com>
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
In-Reply-To: <20240405182031.396528-1-sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 20:20, Shawn Anastasio wrote:
> Conditionalize xen/acpi.h's inclusion of acpi/acpi.h and asm/acpi.h on
> CONFIG_ACPI and import ARM's !CONFIG_ACPI stub for acpi_disabled() so
> that the header can be included on architectures without ACPI support,
> like ppc.
> 
> This change revealed some missing #includes across the ARM tree, so fix
> those as well.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with ...

> @@ -118,6 +121,7 @@ extern u32 pci_mmcfg_base_addr;
>  #else	/*!CONFIG_ACPI*/
>  
>  #define acpi_mp_config	0
> +#define acpi_disabled (true)

... the unnecessary parentheses avoided here.

Jan

