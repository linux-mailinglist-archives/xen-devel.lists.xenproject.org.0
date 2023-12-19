Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBCB8188F0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656835.1025309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaV4-0006J2-H5; Tue, 19 Dec 2023 13:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656835.1025309; Tue, 19 Dec 2023 13:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaV4-0006Fx-Dt; Tue, 19 Dec 2023 13:51:10 +0000
Received: by outflank-mailman (input) for mailman id 656835;
 Tue, 19 Dec 2023 13:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFaV2-0006Fn-7A
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:51:08 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8952cef-9e75-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 14:51:07 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c3f68b69aso43512045e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 05:51:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b0040d1774b4e4sm2928502wmq.42.2023.12.19.05.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 05:51:06 -0800 (PST)
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
X-Inumbo-ID: a8952cef-9e75-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702993867; x=1703598667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TOHHMwlJZXQmOowtGx0LvnLVKv8QMMGltuDx0qqkC3A=;
        b=I7b4eyeB82+lWXrqP0tbAepTCdiiAmcRlotNh3Aexn/5V7ifwgrvP6f0LL3cRGQyvV
         +K6z2lBDhIdVV5DkrrtNsJQybsBp4365U/Er7HpJavB6iuS8Oci3tNQZ/137OuCx3OVA
         JnElXxe5h+JsbFjyU2x49z2k44xpGNPzXdYV0ua0vko4lidWaAnlyCDdVz/awqwoWbPA
         Zo0UT0KYtm++a1+tleBzEEDtSmuumk1/q/motbcpHm6G3uUdGnZC1ydhwYnZoDm2H7xH
         aDHbZk6Te1bFEpKGOBPo8MrPvFe1Q+K/FmncZ0RuGe39A+Fx9s/WDW7QS9IeegQLr/NM
         2uNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993867; x=1703598667;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOHHMwlJZXQmOowtGx0LvnLVKv8QMMGltuDx0qqkC3A=;
        b=IhAyXo5Uyz/lsvayuyxJ/LskJibdcxwqPEV0j1VOT44Yxq1fLJgQVh88P9JgSzoX1U
         sUmvJBG3z9SJ1P2xx+ND7wcmw+jh5mWaPm822uOi07SGgx83MMvV4X+uhALyCzAKbArZ
         H2TJ77c74ZfDwHsUD/OTi2GWoqU3PvMG8Y9XQGTdSkAHXirQkdUJkVUqxXRWHkAJobji
         wO+MbZ0jrUlTnzYqXCVt2//0epLtdKQ/GD2Ablsi59vAFg2mJ5ystEoLUDZrExO29Hmo
         45LZt2F13McHcign/YfarlC9KfAT24XLlkKrJx0yElAvr1sz8Pg0ZsNRgNeZdTWvXd0s
         HqDA==
X-Gm-Message-State: AOJu0YzEnn5OZf2N6wndupg9SAS0sAql4qC8DfbEJcEW456EmnAv9tVu
	tx21c0H+BFXeclQuOzohxx+eP5SdTIObayzo58Vk
X-Google-Smtp-Source: AGHT+IGKIOKxhwi6NUGfRbRZUPV7hGiS16dNcWE/8tlA9n9bMH+buHlGUq5FWCWxIIpd1df58edY6Q==
X-Received: by 2002:a05:600c:4f81:b0:40c:3e43:418c with SMTP id n1-20020a05600c4f8100b0040c3e43418cmr10168619wmq.33.1702993866789;
        Tue, 19 Dec 2023 05:51:06 -0800 (PST)
Message-ID: <1b99cbab-0598-4277-87ca-0d1712d5471e@suse.com>
Date: Tue, 19 Dec 2023 14:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IO-APIC: correct RET polarity comment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <072a4e90-78dd-47ff-9890-ba377e0a2b66@suse.com>
Content-Language: en-US
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
In-Reply-To: <072a4e90-78dd-47ff-9890-ba377e0a2b66@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 14:49, Jan Beulich wrote:
> The comment there was the wrong way round, documentation clearly states
> that 0 is high and 1 is low.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

And of course in the title s/RET/RTE/.

Jan

> --- a/xen/arch/x86/include/asm/io_apic.h
> +++ b/xen/arch/x86/include/asm/io_apic.h
> @@ -101,7 +101,7 @@ struct IO_APIC_route_entry {
>                                             */
>              unsigned int dest_mode:1;     /* 0: physical, 1: logical */
>              unsigned int delivery_status:1;
> -            unsigned int polarity:1;      /* 0: low, 1: high */
> +            unsigned int polarity:1;      /* 0: high, 1: low */
>              unsigned int irr:1;
>              unsigned int trigger:1;       /* 0: edge, 1: level */
>              unsigned int mask:1;          /* 0: enabled, 1: disabled */


