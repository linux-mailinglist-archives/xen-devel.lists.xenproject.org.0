Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C94804C17
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 09:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647457.1010602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQc9-0002nm-Us; Tue, 05 Dec 2023 08:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647457.1010602; Tue, 05 Dec 2023 08:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQc9-0002lC-SA; Tue, 05 Dec 2023 08:17:09 +0000
Received: by outflank-mailman (input) for mailman id 647457;
 Tue, 05 Dec 2023 08:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAQc7-0002l4-TO
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 08:17:07 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad218b12-9346-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 09:17:05 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33334480eb4so3601930f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 00:17:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d5641000000b0033349de2622sm4871429wrw.94.2023.12.05.00.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 00:17:04 -0800 (PST)
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
X-Inumbo-ID: ad218b12-9346-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701764225; x=1702369025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1bRMg95vdDsMh1U8nyGb9KTb/zRJKHM19tW5tRmZQnI=;
        b=VjIGchonZBkSYQKsk2sObv74NgcueHz05aStdVd+Wvix2/rHL18ODfV//MeV9aUqNf
         7+Hl1rhsNbxFGk/oShce8wM2GKS/6EN/F4PE3bGyLaO6fggBslyryJXxoJdiprEhNtB/
         9laj332/4N7SpuIb1iQpDDcDDxrXI2QoDffCEL0Ll2vLxhfPpKCMZ0hZT9qfPCo9BtPZ
         AnkDLaycoo0tWXxwXXqQ9yvMm61IQZe2b/O0rffRI6gL+ZLiaRn8iQeLuFuNV4tZj1x3
         U9jYa2P5FPdV4md55qZM3j9W+BaOd5vmLMSjpqIYILUK0nlYRwm2MQLEfznTKRT5pkna
         GpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701764225; x=1702369025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bRMg95vdDsMh1U8nyGb9KTb/zRJKHM19tW5tRmZQnI=;
        b=RMbiNYaKrmwzk+snNgUSIOA5oX+1JsaRl7drQA7OWw7+WjbDJtxr4kGbvJA3zZrnEC
         Gs+241BmTa3JcHKxMeHPK9+k6Z+wK1I6Ovt7bNHpyRGIuVhtAZrvYVl9iGx56ZpUO0Zx
         V99J7Lw3qMWLmmjuPTZvQnDiRHwK1fYWmud5j8FhNpgTGlHxL8ZXv99718h68AFqdXrB
         ec1ZY9ght11Uztre0r+3mb34FOT42JlDaWkhfRJn6EHi0T6wyH1a+up4HWS2ygDAEdMT
         9XzmuMFB/FYUFh9V4JB2Ns45szMbO02izfhPuF+uqZ2I262einafLYRDE3KgEBr/pUL5
         e0pg==
X-Gm-Message-State: AOJu0YxhNttA+w45Muc+a6zNwngv8ius4MfKHhcnoKeoporMUfC+H2GP
	Nm4IDwDRwreTtVdnKg3UUHte
X-Google-Smtp-Source: AGHT+IFEJA7TGMSLfB3W7s5f3vMFo768HvsVmaZeDDTPr1FeqWcabImyo0iQBFLDttaJ2zf/1anEYw==
X-Received: by 2002:adf:f043:0:b0:32f:7734:a0fa with SMTP id t3-20020adff043000000b0032f7734a0famr4009515wro.2.1701764225313;
        Tue, 05 Dec 2023 00:17:05 -0800 (PST)
Message-ID: <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com>
Date: Tue, 5 Dec 2023 09:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com>
 <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.12.2023 20:17, Sébastien Chaumat wrote:
> Le lun. 4 déc. 2023 à 10:06, Jan Beulich <jbeulich@suse.com> a écrit :
> 
>> On 03.12.2023 10:56, Sébastien Chaumat wrote:
>>> Hello,
>>>
>>>  Trying to get the Framework Laptop 13 AMD to work with QubesOS I hit the
>>> following Xen issue :
>>>
>>> Xen version : 4.17.2
>>
> + tested with 4.18.0
> 
> 
>>> Kernel : 6.5.12-300.fc39.x86_64
>>> CPU  model name : AMD Ryzen 7 7840U w/ Radeon  780M Graphics
>>
> 
> 
>>> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
>>
>> Possibly releated to this. You'll want to obtain a full-verbosity
>> hypervisor
>> log with a debug hypervisor, as there may be hypervisor debug messages
>> telling us what Xen may not like.
>>
> 
> xl dmesg with some traces attached.

Nothing that looks relevant here. The anomalies are related to you also
having enabled lock debugging and ubsan.

I'm afraid this needs looking into from the kernel side first, to understand
what's going wrong there. Once that's known, it'll hopefully be more clear
whether this is a Xen or a kernel issue.

Jan

