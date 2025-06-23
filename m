Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F4AE357A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 08:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022018.1397713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTaQG-0006Bm-Aw; Mon, 23 Jun 2025 06:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022018.1397713; Mon, 23 Jun 2025 06:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTaQG-0006AO-8C; Mon, 23 Jun 2025 06:12:52 +0000
Received: by outflank-mailman (input) for mailman id 1022018;
 Mon, 23 Jun 2025 06:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTaQF-0006AI-4D
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 06:12:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16ea9c2e-4ff9-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 08:12:50 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so168677f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jun 2025 23:12:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a46b4b8sm7439971b3a.35.2025.06.22.23.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jun 2025 23:12:48 -0700 (PDT)
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
X-Inumbo-ID: 16ea9c2e-4ff9-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750659169; x=1751263969; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W+e7PbS0xL0ZkoMd+hTJob2mF7PjjnL2U3ZAld/qhOk=;
        b=YJza+IipvuA8CLvc9A50m9PhjjHn35BY5ckwjRnqz0ZB3VqNEtNIkInCwFu9HDovtB
         oiFTwjI984l+9cstBLAnrYoNIiT7OWpJ8WaOfSdbp3PyfEaIszdNTnnT5Aog7z55zoo4
         zFkcj5BSdIRI+B56J/3ewYWI+UJzDl6mY6fG9EPy0wcP0RYZYoB+Z7ouklCG5ISY0Xbh
         AVk+qnQMSfhG5wNHSwWCvXfb45mf2hzViXDo8XN9frKumTIdhqKpqjiLW0ym5130wBUv
         ezId3r2p5D9jv1X3dbY5eD0ipXgC22qsldHgqzg230RSYBWxMhMykC0+mmQQUk+D4rVq
         aVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750659169; x=1751263969;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+e7PbS0xL0ZkoMd+hTJob2mF7PjjnL2U3ZAld/qhOk=;
        b=OKje670ssBhtRPS1FTlD6oj6MI5y2uaxKJ21ZRKOMXnfJqkbfSMoCDpz+Pa6+M1X0u
         HkyJaDF97ilsBc5gmVs6LcEXbxoJFsZe/GtX/NUDnHPPWZuZ2TmlhFbTrv5a82jmjwFa
         Sw4KkO+gWxLl6Y4/BXHUMmRqCyfrMxDYU3vIhMjAMtBnOCdAkqHenz+U+kLLITo1Eepb
         AeBIbWr8oH+d+J7YsnI5MkQJM1Hb9EvA3OFZ3V1JHU3zhCA7Sv2Ct+jNbUwqZvAzzqA+
         0Se6oksnBa3Lr0MI/87FIJzKW54uHuWNdDMiGEXq1nrx6zn8FW5D9n3Hb6rY5mR6bzRK
         NPTg==
X-Forwarded-Encrypted: i=1; AJvYcCUblxTBcRRMguSz7/F2zAe8l0GWuGJVILP+UlTlBghJ/EyHhIqEr43b2nKRaULlaif3JsGU2uzMC6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyWDvWBZugv91VFY9m2qvP/tEpexFP15wbCLFiQHrbGq6Ry285
	SY6WxYYX4oY7kI2/gDc2gyODwDR5sajzO1Sf6ByGfiw7/IwaNlutYXMrnrg/d5TSDw==
X-Gm-Gg: ASbGnctcQyI5MUclh67U9gWy61JI6JYR2N8UWpbY4I4IXvuuKMeeGIdIALELBVJX+k1
	qq7gfZcHTmSwwegadZIyhgZKA77mdplrDj9RNNxzy44IapNiiEDG5ZpgEWbCMN3wpCpG0fWpjG5
	yGICdCOXn45I6ZcdPJy/1AAMKpJP3bOI3iYh2ODTVirkGQoIsxJxtzVFlCaevLAjKAxL0SJU/BH
	5s2anAacOHvUm2XAS05oq0p9hrfAWEkbGBBoSI7QgfMy5NBHaHo11PDd1gsXxztzRO9qm4pZW+Y
	6GMRHRldOunappR2SxbHwIKhL8XIh0UamKq9sOEbmmwRjrqxo88sImTYwGnIB8K+IHOJ75gqapC
	Vh0xC+z38v4Lu5rVzeggmLw/D7UfB6kGqIkZvrf6ZbAVxN7c=
X-Google-Smtp-Source: AGHT+IEfzzlKrEThxIDoeqQJTSjexInT8XU+p5eecG1+jrsJFPE0yo88kjVmh/EkyZaQ6oY7CPoLUA==
X-Received: by 2002:a05:6000:144d:b0:3a5:26fd:d46f with SMTP id ffacd0b85a97d-3a6d12da03fmr8087747f8f.32.1750659169364;
        Sun, 22 Jun 2025 23:12:49 -0700 (PDT)
Message-ID: <c997177e-46b5-4f15-aeec-4a4b8d2dae2f@suse.com>
Date: Mon, 23 Jun 2025 08:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] automation/eclair: update configuration of D4.10
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com,
 federico.serafini@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506061403280.2495561@ubuntu-linux-20-04-desktop>
 <fbcd83f4-8638-4da3-8555-36294a42c7d8@suse.com>
 <alpine.DEB.2.22.394.2506201859290.2978375@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506201859290.2978375@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2025 04:19, Stefano Stabellini wrote:
> On Tue, 10 Jun 2025, Jan Beulich wrote:
>> On 06.06.2025 23:04, Stefano Stabellini wrote:
>>> --- a/xen/arch/x86/include/asm/cpufeatures.h
>>> +++ b/xen/arch/x86/include/asm/cpufeatures.h
>>> @@ -1,6 +1,6 @@
>>> -/*
>>> - * Explicitly intended for multiple inclusion.
>>> - */
>>> +/* This file is intended to be included multiple times. */
>>
>> While I can see that this may indeed be needed, ...
>>
>>> +/*#ifndef X86_CPUFEATURES_H */
>>> +/*#define X86_CPUFEATURES_H */
>>
>> ... I wonder what this is about. Sorry, I didn't spot this as a change
>> in v3. If it's needed, these comments want to be well formed (have a
>> space between * and #).
> 
> Without it, ECLAIR throws other violations. But I can fix the lack of a
> space.

So the original comment that was there didn't serve its purpose?

>> Beyond this - why is this header ending up different from e.g.
>> public/errno.h, where a SAF-8 comment is used?
> 
> Because SAF-8 is meant to be used on top of an #ifndef and there is no
> #ifndef here

How can that be? SAF-8 is specifically to cover for the lack of a guard,
i.e. typically the lack of any (respective) #ifndef. SAF-8's description
also says nothing along these lines. And then it looks to be possible to
add some #ifndef here, e.g. checking NCAPINTS. Just that the #endif would
need to come early, and another #ifndef would then be wanted at about 2/3
of the file.

Jan

