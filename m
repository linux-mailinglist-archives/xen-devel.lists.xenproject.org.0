Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E95A88680
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950622.1346890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LRc-0008Db-9b; Mon, 14 Apr 2025 15:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950622.1346890; Mon, 14 Apr 2025 15:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LRc-0008BE-6T; Mon, 14 Apr 2025 15:09:56 +0000
Received: by outflank-mailman (input) for mailman id 950622;
 Mon, 14 Apr 2025 15:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4LRb-0008B6-7L
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:09:55 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85083865-1942-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:09:54 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so41898925e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:09:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eadda64ecsm11388782f8f.0.2025.04.14.08.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 08:09:53 -0700 (PDT)
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
X-Inumbo-ID: 85083865-1942-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744643393; x=1745248193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NJtt1jxB48D/JO2bQTwBbcO1KJf2k5h3pE8VfmVChIA=;
        b=PyyHDYHgUlfj+QknK9VQBYOscU4ZcAJORTkHbj4+2mHOL9SRhm8mJw/hY6k0ASYZ7C
         aqkR7iHlOTeV/5GrLWwawG3KDL3CL8vtwPWWeheIbs/Z1t7XGnXBqGSVUaWphI1YXOC3
         MqL41W0wmBgjQ+zyiJDHxYofH7VgalR67LnURpMk7JKwmLoKv3jL+2jhK4KSSDZ+QHSa
         REAhQ5hGasuZPZJPfBTo6mp7g2qnZH5+rSd5GfzvCnp+i3Y+nqzZBBOSIY/1n5vIPUYZ
         3g2ivurNH8YiZ0Cvuq3R5jsJ0ZGdLVvB9R5pbF+AG81LRm+f0T8pnL0CZT88NL5hggJw
         3R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643393; x=1745248193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJtt1jxB48D/JO2bQTwBbcO1KJf2k5h3pE8VfmVChIA=;
        b=II9OnhtRy+2U604cKF+c0CLczPo0MPpeSCIsu7Me6umbjKyQrnenJx0rrPJJ1iJqs/
         rWUer1WBttMM5fqL8wBlCy0fJ6arsAwDUykU6SRma1CdtBpws0Dn2QSRtkk6YA0lp0pJ
         r/OT7srcLkKjN8vnJPG1jmnipJZgz0Vl4/S3pRwrHhW56PQPfzQMcK20RXG5rCmsPH8H
         F7iOAQ5zVFaVS61dPRWd8MS83Ba/LdAexH3n8MjzFo7c+3TcMqgACIh2gG1C9B97svrh
         23MOOC1CuVsCOZvzYuaucdkJuZQK0xPAzIRsih3VZEt/jMnSJwlgNQmqQ9vk6VafWRB8
         UPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/2UONWjurEmPc809klcMluJ9xYXR3gdXNowAOGhaiF0FYDmGZ+vQhztM9LIkOH8LxqQ3WjZJgBGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0b673vye1izcMy2M6Z69/k96ZW9nZrWj+VgL+pp+W+5jQlGB/
	c3w2NCdY2WhEhszkePKDGwkfbuhSPBExpOLEk5YoEO0nqkPAsJTdPqbrTg4hYg==
X-Gm-Gg: ASbGncvppauo4/Yjcd1taJTfCyz8WLaJTK5cy5KyfLmcjq6q+MURZ3AmmcKXCt/Wbij
	i/aEabY0zZdpwOglTXeMvvAewQosxTeW52WkjnCobo7dOwqGhy+Xb1z5J0DWPtynJeaX4ET1g6f
	9HkQvhnSqT4R7fpV7p0G1hE59j5k6Vs6QvKgyCeXrkM/aPVIGNfbs7HATbLYLi/uPKDwaeSuT7e
	aet5Vkp+vSK1MQCybWYlJL/OIl3ovYsEAcA3WzTPVBBYS1s77a4QAQf1eIb6nMACVYaLml06CMK
	nAS8GEf/E1XBC2TOQ2XwDe+PqYLDqHWmmouHQ24ha/nE6my0Mv1Kgwuyeb3AlLxueVXL1vtoiIi
	DVxElznzxQK6Gp7nx+WIgHJtrpA==
X-Google-Smtp-Source: AGHT+IEFUvmjKVpQRz3M5/DfYwQnw/EAR1WcdoHHdmIAPpgNROhaI+jqbhpE1r4kjQ4ej4ARLegljQ==
X-Received: by 2002:a5d:588a:0:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39ea634bf9amr8889132f8f.29.1744643393401;
        Mon, 14 Apr 2025 08:09:53 -0700 (PDT)
Message-ID: <b4a41f93-18f8-4e36-a4b5-b17b31aff2a5@suse.com>
Date: Mon, 14 Apr 2025 17:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/16] x86/hyperlaunch: obtain cmdline from device tree
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-11-agarciav@amd.com>
 <dccb3dd3-eac8-40b4-8ffb-a0ccb688ac0e@suse.com>
 <D96FH9LMHYXJ.2BDEIEANJSYVD@amd.com>
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
In-Reply-To: <D96FH9LMHYXJ.2BDEIEANJSYVD@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 16:23, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 12:12 PM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/domain-builder/fdt.c
>>> +++ b/xen/arch/x86/domain-builder/fdt.c
>>> @@ -189,6 +189,12 @@ static int __init process_domain_node(
>>>              printk("  kernel: boot module %d\n", idx);
>>>              bi->mods[idx].type = BOOTMOD_KERNEL;
>>>              bd->kernel = &bi->mods[idx];
>>> +
>>> +            /* If bootloader didn't set cmdline, see if FDT provides one. */
>>> +            if ( bd->kernel->cmdline_pa &&
>>> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>> +                bd->kernel->fdt_cmdline = fdt_get_prop_offset(
>>> +                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>>
>> Somewhat orthogonal question: Should there perhaps be a way for the boot loader
>> provided cmdline to go at the tail of the DT provided one?
> 
> That would preclude the bootloader fully overriding what's on the DT.
> One can always just copy the cmdline in the DT to the bootloader and
> adjust whatever is necessary there for testing. Adding append behaviour
> sounds more like a hindrance rather than helpful. To me at least.

Well. This is why I have been pushing for all options to also have a
"negative" form. This way you can override whatever specifically you
need to override, without re-typing the entire (perhaps long) cmdline
from DT.

Also, I didn't mean that to necessarily be the one-and-only behavior.

Jan

