Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ECCBE7EAD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 11:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145124.1478283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9hDJ-0001Ww-K0; Fri, 17 Oct 2025 09:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145124.1478283; Fri, 17 Oct 2025 09:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9hDJ-0001UW-HT; Fri, 17 Oct 2025 09:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1145124;
 Fri, 17 Oct 2025 09:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9hDI-0001UQ-BN
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 09:57:32 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1dac620-ab3f-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 11:57:30 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e6a6a5e42so9373835e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Oct 2025 02:57:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e0e70sm39144336f8f.40.2025.10.17.02.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 02:57:29 -0700 (PDT)
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
X-Inumbo-ID: b1dac620-ab3f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760695050; x=1761299850; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uciGwzylLXqr2s5c7/Np6ydAW9D5/eCyG1V+jI7NS5s=;
        b=Z29i860hH/eDgsDodObp5BtPK5PyDqx/VwnodnQViDY2hE9xBCFx+y9NFhdkhz/bDt
         iGcLjdNjkVur3jXVqX5ejAHyz/hliRPL3/3ijIP+qXloRyVzDeSLkh4vBrUVCJTkgcK+
         7RbVfuYxs88oFm0qvZJ+KoMHfAuaZe/1pxmqb52UtP0zaH1gspX4qGbYZumHt/62GgNi
         1LCiIQ4tAd76nvl48g4Ept5uOnglIwhWJ08TUiJSvYZOT5qUTn2zXh2ezpRsAxqVH5eA
         B3z6gSk7Iu7VfV01bKFqYih3fhYkYvsm7OFMTG+zQ1YDyP79Y7YUtiVrhya9F3XyN/N1
         QBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760695050; x=1761299850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uciGwzylLXqr2s5c7/Np6ydAW9D5/eCyG1V+jI7NS5s=;
        b=gP986sPUsDvxWLakLyU/gX2XLuNdXgShuJsSvFV4NWsnLrPieH55B/81aeUTq7+Q1P
         XZRaKItj5JLOO1wo2Pay9tGnIcEUTmWUu1tG58FmL3yEBOfH+q2ahlcKnf0gXF8gJByi
         x6N1gj47+WLJDJoNgJPU+w+rKtaa+UXYmqEFYmPu7I4cpm2iW+/a8On8oSYabxGzOW8C
         AFg6wRATBTIgr2UGUgZWPMGDoRXRMWFvcA4fKDskz1pfy1jaXNBozyNRy6+e40Cd2W7W
         Gs1Cnbs4wMf1kZvk47ZLfroCoJgYIoCp88o3cWjuZOz/0aptI0UVnt2B5rIJEIOi0x8y
         g54A==
X-Gm-Message-State: AOJu0YzXtyWV6L5UOwsx/qrEZkNbVluXdf7YIYSjpEi6FGhH6hLM86Oa
	um/A2WJTQJ1YwWfWAVBlcp4T7L9hEaQuu+jryP3S/DOa6k1zBCrTyowhZOt0fpNH2A==
X-Gm-Gg: ASbGncumPTF6VQSKRGOqHs6QWUMQdSnfmOV7S+aoRdFqLXHJAok3bjloe4K67koSGE0
	FUoDeYyS56OnuZUXDn+EBBUrVutfIW+HNl1zWYt74n5dx+qICByUAmw5yha0zlDpeV/HLyjZysR
	M5rLNiJklZ2/cxQrdYeMDtheKMZ+8asGdZwzf6Zb+pD4LAJY78wlCY/KzzWMV4Ce7YK+2MUoCGU
	kUGqFTqEkWCNKPdEtJiOuOlLfnpzm3GF0MERazbNwDEAErUlIxGNfwXPovxy+C/TNiHprtRhXEe
	fjuWt+qNjxMVg3SHn2S4pL7KPNawh3vFplXMG2VCaL5Q1uV3kEu7db7yS3OG2KTixCYLmlk+i16
	gWYxGmHRI+xkMFnDE3BMDQb/x9aykCF3OtP/URoKZ9SjGwoPIym1Aaq8Zy6QseIOX79CusLIok4
	PSPcfM4ZgEgFgnxrEDtw6Y+YC5VZL/+TNxP8vYYGKhUL49ChkqDaJQrOiPC/d4
X-Google-Smtp-Source: AGHT+IEz3x7Tqk0JdcbyBUtRz0BYmBI/gLfLzPqCQeQz400O5xKcTKSVBoI2B89buzhb9op9Ipb0PA==
X-Received: by 2002:a05:6000:1849:b0:427:809:f00b with SMTP id ffacd0b85a97d-4270809f2a0mr800627f8f.50.1760695049623;
        Fri, 17 Oct 2025 02:57:29 -0700 (PDT)
Message-ID: <ace51087-38f3-4cec-bc41-9fe0813ed947@suse.com>
Date: Fri, 17 Oct 2025 11:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 04/10] x86/HPET: ignore "stale" IRQs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <e16e2b62-9c2b-4534-8279-daf986cf438b@suse.com> <aPIKJw6I8pUFngC1@Mac.lan>
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
In-Reply-To: <aPIKJw6I8pUFngC1@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.10.2025 11:19, Roger Pau Monné wrote:
> On Thu, Oct 16, 2025 at 09:32:29AM +0200, Jan Beulich wrote:
>> Following hpet_detach_channel(), IRQs may still occur: Ones may already
>> be in flight (both from before and after the last IRQ migration, i.e. on
>> possibly two distinct vectors targeting two different CPUs), and new ones
>> may still be raised as long as the channel is enabled.
> 
> Description would need to be adjusted if nothing else, as it speaks
> about two distinct vectors which is no longer possible after patch 3.

Oh, right - dropping the parenthesized part.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> With the above adjusted:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, but as per the RFC remark: Do you then think this is actually
worthwhile despite what patch 3 does?

Jan

