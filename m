Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D766F995386
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 17:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813255.1226109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCL1-0003Du-Ja; Tue, 08 Oct 2024 15:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813255.1226109; Tue, 08 Oct 2024 15:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCL1-0003Bs-Gw; Tue, 08 Oct 2024 15:41:27 +0000
Received: by outflank-mailman (input) for mailman id 813255;
 Tue, 08 Oct 2024 15:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syCL0-0003Bm-EE
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 15:41:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6615779-858b-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 17:41:25 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a993302fa02so418563866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 08:41:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993ab8e75esm467927066b.222.2024.10.08.08.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 08:41:23 -0700 (PDT)
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
X-Inumbo-ID: c6615779-858b-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728402084; x=1729006884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9MnXq9VGUzWcgrfmo5odjgxM/AYFL8uVN88pkaI9Ej8=;
        b=C2cOzH0Luct200T944ypXc5zgMcgBYIDzi1XkJ8aNhpg/r9LWBVXUnIeHHZZfOqaTw
         S6dShf/rNaFrp3IrTMOazzsQeLAOv8hZK3OTvi/d+rizRWWie/BrSngQx+RCg0d0WJEa
         s6IhaQIXZZKvD0+4/g4R8cfhLgre4n6OHITjW00DPbaJFE1vrqKC23BYAB2uX8u5M2DP
         lgo3Va6ythfBv9JM/6WF0qw4BARJrH8/kQz6xkb0SJ1wSfSNWYBfZDfybo+Y2QgOe9Qx
         +mNq3pIeC8CiWXqrBLLoDW3+56gv1OJUPZX+iat+xewRTRuBy36gOWxewGqTP8rgg/3N
         J73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728402084; x=1729006884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MnXq9VGUzWcgrfmo5odjgxM/AYFL8uVN88pkaI9Ej8=;
        b=jUQiqGlEwK6CUytBpP9b0GbKOHtTtiD/Z42GkJcfYenZ+92PNYOYiE2g/dr4MzP95L
         RznqPW3r28q2Dzgm1FcVHuyhNa9ER29caFKsjzPJ+p7X+dE9KHODAEKVHM+CSQM/d98B
         2Oh0TC4RMLcD593SRVk9K+r+Uo3k7ZfNNoTq3hrVjcJuTDOTFxQUrbKVZXI3FUIL0Q7v
         1KWQ+eiza6+nhMocrh5i0lDVg+XTWs46wazSpWYOoEMKMmstGjvdsk9+xRW5XEvaIz6O
         z1C9i10hG8vKYOGjssRmrqYBC4S/mf8vGYZwCmgENchDS4JL51IOP7fCs1vzw8EfJ0+7
         L6ow==
X-Forwarded-Encrypted: i=1; AJvYcCUmrfwx++YsOAAlJlOlV5udn+y5Ya3mkzNwp64zFjaeLx99DCTuqQRbE39h5BvcTYqaZZwkIqw/01M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6gzP938anJf5hbXoKHj7uH0jGSoXiIeZrE43hbjHhADMkmE8a
	Q4itEHZzprifwTa7zbGfW/UtfLuldxap9+M/7WnznI1qXPcO9RZ2cwdPLcKtQA==
X-Google-Smtp-Source: AGHT+IEaSkaMhY/wPAEcvQ0kCzpZeXfDMB4c8m9F/LMXZCzWJRum7blijYRGzUDZkLxTPwREp74bpA==
X-Received: by 2002:a17:907:9627:b0:a99:4615:f58c with SMTP id a640c23a62f3a-a994615f65amr979285566b.2.1728402084250;
        Tue, 08 Oct 2024 08:41:24 -0700 (PDT)
Message-ID: <40034a00-6f1d-4a39-9f00-2daa671a13d1@suse.com>
Date: Tue, 8 Oct 2024 17:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] x86/vlapic: Move lapic migration checks to the
 check hooks
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241001123807.605-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.10.2024 14:37, Alejandro Vallejo wrote:
> While doing this, factor out checks common to architectural and hidden
> state.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> --
> Last reviewed in the topology series v3. Fell under the cracks.
> 
>   https://lore.kernel.org/xen-devel/ZlhP11Vvk6c1Ix36@macbook/

It's not the 1st patch in the series, and I can't spot anywhere that it is
made clear that this one can go in ahead of patch 1. I may have overlooked
something in the long-ish cover letter.

Jan

