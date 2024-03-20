Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D875880D25
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695793.1085882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrPn-0006FN-H6; Wed, 20 Mar 2024 08:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695793.1085882; Wed, 20 Mar 2024 08:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrPn-0006DT-DY; Wed, 20 Mar 2024 08:35:15 +0000
Received: by outflank-mailman (input) for mailman id 695793;
 Wed, 20 Mar 2024 08:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmrPm-0006DN-H1
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:35:14 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4a3cf45-e694-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 09:35:12 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso328806566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 01:35:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 af3-20020a170906998300b00a469604c464sm5509111ejc.160.2024.03.20.01.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 01:35:11 -0700 (PDT)
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
X-Inumbo-ID: c4a3cf45-e694-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710923712; x=1711528512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRSwBN3CTZjgtb3bsgfd3Ea4pmuLB28ZnZXAqYxZBL0=;
        b=fcFTyAihtrqR3oIib21FlrBjxrlM3UByKnWyCAOboCusegitSGLtifmmwGBrk7X8m5
         C1F3/O05IqiSyV44gKvNuG5kRk3+86T3V7zAiBCjWid+h5q2lNOMCkR/YVP/7MX7FxDh
         c8F/Uq5hJCExhpYkY0ZI1VKZtM7GtBqzOdqRmP30lEqzHAv9Fietw86e12APSswbNpc8
         6qnLmwNB/7x94H6Y51IQ39KBL9DDPmiq96UCFbYyvMWDbfKPS2f4T13PkXJ/DQUWZxCe
         MjHIaS1seiNKHQNdVJxy4/sN3VEzcsuFHKKtA5psY3z17vozg9+djVHPEXieZ+lyg1CJ
         BMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710923712; x=1711528512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRSwBN3CTZjgtb3bsgfd3Ea4pmuLB28ZnZXAqYxZBL0=;
        b=dn0K9szrNbrvcI9u3Dd67wgpWYqcThBCwWldZb4l5rBMMsH+JASS2jbZCOWhTZYquJ
         XM9W+47Oiup8iJOV6TIrtxNpE8UmwuVLcMAoMrRgyuErC1f9fE8/ezZZPcGGwbhiyPna
         ceN+9vq+OALmgjr5isCYUANYigawiflBRcXzkw6/Y54XP0MnFSMnyKCPlu89enEFTfxm
         444R0LaPwEfxHRw0bZyausFLZx25o+kxoGKhZhd7oXiFGbU7+TqZEyYlbxexh4YeTiM9
         O873Wpbv1Y7RHBISYBIT5iuSLwM4y/xIz8vI6znqPUEme5cGdOLgq+yqnxLscSSTi1Ku
         kL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/xk9R84eDn8fKbPjYXCwtmvzyK4l6uxj6kJ1jbsbkl09uah6L2Rrq52IZAgxHCiNNG0WLzLC5Y+2097R6O/BxwTsyCuC8OP8sQ2W9T+0=
X-Gm-Message-State: AOJu0YyQyeES3F/Eqyj0v7Ox5tYcvwO+3zHvtXKgyqQDwSiZPGb+H2xn
	8XUBoV9saSK+j5GaFIsluFrESbeBpyGCbnmAw94/dNPQRxTg5/o5Ytxm4LpkaA==
X-Google-Smtp-Source: AGHT+IEZo0bMa98428ndj0OJjRszhkyFPKuC+GjDZmx/gxXoa8nzgmKBO2Xh3w9zIf/NqfmRiGFLMw==
X-Received: by 2002:a17:906:9a1:b0:a46:ede0:2370 with SMTP id q1-20020a17090609a100b00a46ede02370mr808918eje.57.1710923712057;
        Wed, 20 Mar 2024 01:35:12 -0700 (PDT)
Message-ID: <2107eac4-3d59-497a-a682-ae38933ac6ae@suse.com>
Date: Wed, 20 Mar 2024 09:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/1] tools: init scripts: Add missing
 XENCONSOLED_ARGS variable to xencommons
Content-Language: en-US
To: =?UTF-8?Q?Rafa=C3=ABl_Kooi?= <rafael_andreas@hotmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <DU0P192MB1700AD4C3E33FF8F5D6E90F0E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <fafea1a7-c5f0-4e9f-bf49-3d0e6ad26ffc@suse.com>
 <DU0P192MB1700C9098AD44A62F123A5C5E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
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
In-Reply-To: <DU0P192MB1700C9098AD44A62F123A5C5E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 08:59, Rafaël Kooi wrote:
> On 20/03/2024 08:55, Jan Beulich wrote:
>> On 20.03.2024 08:48, Rafaël Kooi wrote:
>>> V2: Now without test emails ending up on the mailing list. And with the
>>> correct title prefix.
>>>
>>> I noticed that the systemd services referenced the XENCONSOLED_ARGS
>>> variable, but it was missing from xencommons.
>>> I actually ran into this when experimenting with a Qubes patch where I
>>> thought I needed to modify this variable. It turned out to not be the
>>> case, but I figure it's good to include this for sake of completeness.
>>>
>>> Rafaël Kooi (1):
>>>    tools: init scripts: Add missing XENCONSOLED_ARGS variable
>>>
>>>   tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>
>> Two further remarks: Patch series want to have the patches sent "in reply to"
>> the cover letter, such that the whole thing appears as a single mail thread.
>> For singular patches, generally no cover letter is required (thus avoiding
>> the question of threading).
> 
> I don't understand why it's not present on the mailing list, the
> "In-Reply-To" header is present in the patch file. Maybe outlook is
> stripping it, I'll have to look into it.

If you send using Outlook, why don't you simply send the patch(es) as
replies to the cover letter? That's what I'm doing using Thunderbird
(i.e. like you I'm not using "git send-email").

Jan

