Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2996DED1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791225.1201064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEi5-0000LL-8Q; Thu, 05 Sep 2024 15:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791225.1201064; Thu, 05 Sep 2024 15:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEi5-0000Ih-4V; Thu, 05 Sep 2024 15:47:49 +0000
Received: by outflank-mailman (input) for mailman id 791225;
 Thu, 05 Sep 2024 15:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smEi3-0000IZ-NM
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:47:47 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3260bab8-6b9e-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 17:47:46 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-374c1963cb6so573758f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:47:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc54fd03sm1363753a12.37.2024.09.05.08.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:47:45 -0700 (PDT)
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
X-Inumbo-ID: 3260bab8-6b9e-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725551266; x=1726156066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MIYE/K3rDwmfQHEoQ9LJGep4K7mHu8HFsgWZweYl20c=;
        b=eD0BDHBBvuO7lDU3d5j+xmXfLsTxof+lpPeVVaAcRFrzqo3QJfliH2BLrOTlNbhrU8
         UQmSLMYCYVZ/coSYgTxHN/Q5S4s3oJpScrMKf7SHc+HGVnN84DJ08H7sKElCE+3rW8GW
         Qgw0KhQKx2e/duqjZi0QjrzaopAiwj3c85NpgZ+TqjDZSoHX3G2yNDYcUqD+d8gjfLvy
         e1/GGGVjgolrAf2XN1m0WVK5HP2b7VfXz9HCXOyFY7N2M0AEjEz+m4+R5cH/KfJIs9pF
         G6OHx60QAd0S2GnAsaFJzfk8q/g/gUcnzp35rUItVsmMaoNzQvAFeg0U7FrS7tbmoyF4
         vfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551266; x=1726156066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIYE/K3rDwmfQHEoQ9LJGep4K7mHu8HFsgWZweYl20c=;
        b=D8L+9WIUCtBlf/t5f9AyeBxHD1SZhBVDUdzrrj3MxvO6hOaye4OK86C+qFlkfen3Sd
         TPsqf+FVSlfroERtnITfeaj0z/5fn2CoXdXgn4nJnzv1POSYqwZ70oGxO5jWQ3/9MJNs
         r8wcGfLGDAWr+xTq0Srgsw9dacVdx+q9TqYkyAHqLVB8L6ukzWsbH3jLNha0wJ63O2ae
         UAuoBQM8SuZZSuxmXsvU9YOI/BeivbcVXV+TzccQNxdLlmAcm8ZISpUGgk8kNLmSCClH
         uD+SnV379QV0X9ZUabJkmwUo5oz9YbnwDFdKcV8ViNHccoPs8jS26DxoIwIU++vH8lZj
         Vlbw==
X-Forwarded-Encrypted: i=1; AJvYcCULtAl/wWzi1ja2DQGOsFAlmWmyZixH5QwBMyxyEtpc2zeqAu4tRO3JuHSQM2t4eK9aJYOzZGxFXo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzn6cuC8ALFqLOXtN/avMw7cJoS5dGmFuTaqtCLfmjFwPkBnJHM
	CNkVpndPuJTbrxoEQUkNpbFsyS+5W1BSry4ETF+eCPVHVEnVRINSyeH/4GihDg==
X-Google-Smtp-Source: AGHT+IE7ITcW5f7SMDK5BZo7JDP4xtrJW4ynpcjwa7aAnwUWZsjMOL3yieMLfe3rfbWX9RdxyEpx1w==
X-Received: by 2002:adf:eace:0:b0:374:c324:eab5 with SMTP id ffacd0b85a97d-374c324eb64mr10306599f8f.41.1725551266048;
        Thu, 05 Sep 2024 08:47:46 -0700 (PDT)
Message-ID: <04182388-2453-459c-8888-1593b2562c6e@suse.com>
Date: Thu, 5 Sep 2024 17:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/trampoline: Move the trampoline declarations out
 of <asm/config.h>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-3-andrew.cooper3@citrix.com>
 <e54436a9-10a9-4a43-a9aa-72e5e5ceb17e@suse.com>
 <d19f6581-98b0-4c24-bb87-33ef8c6cf804@citrix.com>
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
In-Reply-To: <d19f6581-98b0-4c24-bb87-33ef8c6cf804@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 17:45, Andrew Cooper wrote:
> On 05/09/2024 4:35 pm, Jan Beulich wrote:
>> On 05.09.2024 15:06, Andrew Cooper wrote:
>>> asm/config.h is included in every translation unit (via xen/config.h), while
>>> only a handful of functions actually interact with the trampoline.
>>>
>>> Move the infrastructure into its own header, and take the opportunity to
>>> document everything.
>>>
>>> Also change trampoline_realmode_entry() and wakeup_start() to be nocall
>>> functions, rather than char arrays.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>>
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/trampoline.h
>>> @@ -0,0 +1,98 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +#ifndef XEN_ASM_TRAMPOLINE_H
>>> +#define XEN_ASM_TRAMPOLINE_H
>> Not exactly usual a guard name, but once the new naming scheme is finalized
>> most will need renaming anyway.
> 
> What would you prefer?

X86_ASM_TRAMPOLINE_H would likely be closer to what we use elsewhere.

Jan

