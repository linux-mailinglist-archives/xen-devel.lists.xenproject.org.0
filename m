Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF47A6AAE3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 17:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922931.1326709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIbS-0006qw-Jy; Thu, 20 Mar 2025 16:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922931.1326709; Thu, 20 Mar 2025 16:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIbS-0006pH-H3; Thu, 20 Mar 2025 16:18:42 +0000
Received: by outflank-mailman (input) for mailman id 922931;
 Thu, 20 Mar 2025 16:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvIbQ-0006p4-SA
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 16:18:40 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fadc53a2-05a6-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 17:18:38 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3997205e43eso801951f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 09:18:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f36sm32277f8f.32.2025.03.20.09.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 09:18:37 -0700 (PDT)
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
X-Inumbo-ID: fadc53a2-05a6-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742487517; x=1743092317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gzPFHCwU+WMBi+vS2g8ubfgMCX6A8con4HCTE1mq3L4=;
        b=AwLSbctvttvDQur7CxHTDiG3tNufAGISMhaxqc6A1EoAPJU+Dx6nJMH3fLWdCq3JzZ
         rLufGhNkbrEEGxmzbjOcWFNl+ydnv+wwaok4PwQHishqoWoePGEZZKbAzVAOYWrkblTk
         qmNWWXbVSPU3mY+IIEO9IrZdInBgP1G6QgKCQks3e+Z47Hg6nrxCVvLULvDUQVyHNI0F
         C95FBk9SoBpb+iTArNjmAExznh6pcqfFZEwQv3WWXuFZ4sQ2abooQKt+xbEn3zPaLexJ
         4zK89fdF9bxrw8z7CRYX6kZaDajHgZcUgxlNtMWGDxC7DSkzuVKi8Xly/KK+FNeFFhvL
         dC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742487517; x=1743092317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzPFHCwU+WMBi+vS2g8ubfgMCX6A8con4HCTE1mq3L4=;
        b=VHOD7fDQ6UoAO00yuP9ER01eXDeGUVhOcfJwORV1wW9KO8AbEiF8bB2vPUrZiGLDmw
         4OjaXD7ViQ0Zwz6UtECiZe+anJPDcsfsFU0Uk63SW6ceAhCK0FOkozAhp46d5NiDEZWM
         lJauPuzMG0imOXPOaTHvJeGleOJwGSSfz5EKQJ9p0Qvo9oGBPPATVZisS7z2MP9WdQEW
         tZvvW1dZKBdFbPl0J6scuQ1tDSdR1ACVHycviGZhe9aIXLIIvPiuCyil0PbwfMtL2d/o
         tw2U88qQeUmoHuSTfJSKxrFbnc14BZHP/SvhAeg0xvj9Dcjf3aN3RiimEubammJ5Gfre
         OrWw==
X-Forwarded-Encrypted: i=1; AJvYcCWThk22VFqyWxaJuvMj/q1CQzkAc3tmSlhkx6kekpBkakZQuksmKf7KD0u7bwvb3HGmYkqu9XYlEPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuFueO6jvOvvxWT/hzDtRsaPaZN+mRqsWQyN/BYLPUPM/SGj+e
	AZAzXzALtir87N3ZUywi33/P1ol/fTozSPxtt/g8+wzdoyh8Exu23QFl45/g7Q==
X-Gm-Gg: ASbGncvJVpCAEzjAqwgI5GDNii5RPAdzczeXFACFDzo5a3oVAOQSGaKXvMgkRVJOhDg
	TziU5nN/8HQgTLD1mPcSknIu/bCoPtTLrzSfBoX3q3jT5guu9JWuUq7NxqZT9sYupukzwddL4ju
	giJNED4UB5YND1//LeEH9tF4kzIGYaomb3iJ53SHhnuettKi1ne77R0fdzqXzfQSEe7E+ax1nau
	06aZ+LAMzg5utdCO3SCNK2RX5bzkud94yrygzlx2PRVk6y8zNy3eg4/9rUwV0q+9Sgpq3FQ7YND
	s5n1AUmllPQHLrgF/a5zDtiscxBoH5QW0irMzfrjKOihnrlXce5emrb8dVpspMa6bfeKsFKcIWQ
	GiToQapNvT6soU7QD45YuY7ElunC0ZA==
X-Google-Smtp-Source: AGHT+IH9mVtExZQYnyUP8IK9bX1gc+p4eRr97U7rQUAlWe0z3sOd0LcwjwmWQy0B8fPKYW/I+6rXWA==
X-Received: by 2002:a05:6000:18af:b0:391:888:f534 with SMTP id ffacd0b85a97d-3997f902e48mr203839f8f.20.1742487517557;
        Thu, 20 Mar 2025 09:18:37 -0700 (PDT)
Message-ID: <ea5234ba-d01e-441c-b56c-126e2a9dd33e@suse.com>
Date: Thu, 20 Mar 2025 17:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/vga: fix mapping of the VGA text buffer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250320151109.88228-1-roger.pau@citrix.com>
 <92a378b3-c041-4573-8abd-4ab07a4338ae@suse.com>
 <Z9w_N6nGurDGbuWe@macbook.local>
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
In-Reply-To: <Z9w_N6nGurDGbuWe@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 17:15, Roger Pau Monné wrote:
> On Thu, Mar 20, 2025 at 04:25:25PM +0100, Jan Beulich wrote:
>> On 20.03.2025 16:11, Roger Pau Monne wrote:
>>> --- a/xen/drivers/video/vga.c
>>> +++ b/xen/drivers/video/vga.c
>>> @@ -71,7 +71,7 @@ void __init video_init(void)
>>>      {
>>>      case XEN_VGATYPE_TEXT_MODE_3:
>>>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
>>> -             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
>>> +             ((video = __va(0xB8000)) == NULL) )
>>
>> Without having a good suggestion, find such dependencies upon the low
>> 1Mb always being mapped (in case we wanted to revisit this, for example)
>> is going to be moderately hard. It might be good to somehow mark them.
> 
> Hm, if we where to change this, we should likely go over all the
> usages of ioremap() and __va() to find them?

Going over the ioremap()s ought to be fine. There may be many __va() though,
plus that one has further aliases iirc (e.g. maddr_to_virt()).

> I assume you are fine with this going in as-is.

Yes, as said - short of having any good suggestion.

Jan

