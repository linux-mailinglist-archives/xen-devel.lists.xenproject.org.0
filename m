Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFFCAD8345
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 08:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013802.1392017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPy0r-0001fR-RA; Fri, 13 Jun 2025 06:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013802.1392017; Fri, 13 Jun 2025 06:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPy0r-0001dg-OV; Fri, 13 Jun 2025 06:35:41 +0000
Received: by outflank-mailman (input) for mailman id 1013802;
 Fri, 13 Jun 2025 06:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPy0q-0001d7-BL
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 06:35:40 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eec0830-4820-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 08:35:39 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a53ee6fcd5so1077326f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 23:35:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1639eb8sm765934a12.10.2025.06.12.23.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 23:35:38 -0700 (PDT)
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
X-Inumbo-ID: 9eec0830-4820-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749796539; x=1750401339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dPaGl0o6GFxHjlt3ivrAUOcIHgHk3c4C9Wvx1GOpAac=;
        b=fIy4VE9bUEugQQp97Sm1idZgyiwqLjspjIdaWCT3p0Hp+HNioiejeo7b2u1uTsCyj/
         MAnlRUsj+UCwDCZs/z8h3OabiC6hOGzGleoZeUA1zzaTuOM0NC0wJOCApp1B8z6V2MV5
         u1eqqd/ebU8IZvELbyS5YYvfG+b1rYDOM04WXN5t7CUPr5EbnFKhH7fOrURa2alINCKr
         YhdlNLmbPglPrG2Zwli07bhuWBTvobw8OdN1oA+Nzvp3yr0sv29e05MULbvhmA5pgybr
         FtQbBJ8mLc23gnc7eDyFHzOw92Sk2AKkjAeq7QfL1A3AI+Hrs/Aj3n8FdGr60jGMGNJ6
         o+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749796539; x=1750401339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPaGl0o6GFxHjlt3ivrAUOcIHgHk3c4C9Wvx1GOpAac=;
        b=mOUzxQ8knie9o6cZe5La4aIXAhf+9lIPEfhLc2Mwd5IjpVPTuBbLaGpWyVYlDa01cr
         0lr/ANeA2WeUiwOCFY602Pig2UpRNsGkNN+oWxlwMF33UbviJlFm2rUKUAUS1bMQvpf5
         O+RDLC2RBKC2c2po7CXWvRmNiHY0y7pgFD/auWxNyKHam3tuj42R7Txv7BGy2Yv4H2Iv
         +0j7K8TYXdajx0OCrrXwmPjKP3wqrMPH6jP0DhN8+o6IE8SP5jiolaSnb7Cr76UqqXNR
         2Ge5ZF4h90K7Pyz/Oo9QtSB2d88IO4tntI2AbwTAqvg6uwnqCfw9k28qtVLA5FT849j3
         lCRw==
X-Gm-Message-State: AOJu0YzZCDVaCpQZVkbRwXUwSAjsljOlBzkYc6fq9BjT+hFy0M87ewMD
	Ha5L+nf9AzUm8s2HH6cUUP/9++nZFeFvyElHAbDbY3/UxByEaFqXl5zEH/ENwDwDqA==
X-Gm-Gg: ASbGnctW5Ttsuxb5DjZIsr1xygMMaahQ5wrq6P+huDn93sd2agBsMLYKRwkgTA1UrqI
	sLhlZ28ZBd335wV4B7ijOQD9CAJkVjVZlnF15TkeLXhJWv5JsJFR6FeSdlD00cZXSi8l0P8aWHf
	qFwIx+hp/OVdW3AikaUiO9+DJslewhqPZ18ZfeUQ518aYrgZ+t3JPHSMmCJEBf/+sJErWVkx2Re
	yzR7Cy5F2SZAlXDx/U2rOW/OlaZXKJzc7H1B8XI/CTSKW1PTsxjLUVCznANE3Jumkuy9iJuJZe1
	wXB2svePIhmL8TaXHcATEzIWpR1gqU1nAa7dIvulw4yD9Y07pZGdkl9ZYo5d2xEODzkhjBt17BL
	EXR6RvTeJCLZlnzeTOPtuchdeU0ttXjLZ3W0WBZC8AUtvsyA=
X-Google-Smtp-Source: AGHT+IFyAXzz5ZatrtlxoApbJHHSnRXU9LxEowrLSY75TbXu9vg/y8NWQJPwPLEW74FHNmEcs4O4rw==
X-Received: by 2002:a05:6000:4021:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a5686f1438mr1640661f8f.31.1749796539023;
        Thu, 12 Jun 2025 23:35:39 -0700 (PDT)
Message-ID: <608cf9c5-f057-4d3b-8833-8ef040064fec@suse.com>
Date: Fri, 13 Jun 2025 08:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Trammell Hudson <hudson@trmm.net>,
 Ross Lagerwall <ross.lagerwall@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2506121426520.8480@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506121426520.8480@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 23:32, Stefano Stabellini wrote:
> On Thu, 12 Jun 2025, Andrew Cooper wrote:
>> +Support in Xen
>> +--------------
>> +
>> +There are multiple ways to achieve this security goal, with differing
>> +tradeoffs for the eventual system.
>> +
>> +On one end of the spectrum is the Unified Kernel Image.  e.g. Xen is bundled
>> +with the dom0 kernel and init-ramdisk, with an embedded command line, and with
>> +livepatching and kexec compiled out, and suitably signed.  The signature is
>> +checked by the bootloader and, as this covers all the privileged code, Xen
>> +doesn't need to perform further checks itself.
>> +
>> +On the other end of the spectrum is maintaining the features of existing
>> +deployments.  e.g. Xen needs signature checking capabilities for the dom0
>> +kernel, livepatches and kexec kernels, and needs to allow the use of safe
>> +command line options while disallowing unsafe ones.
> 
> I just wanted to mention that there is one more option which I used in
> the past: the firmware/bootloader loads Xen, the Dom0 kernel, and other
> binaries, check their signatures, then boot Xen.
> 
> This is similar to the "Unified Kernel Image" approach in the sense that
> Xen doesn't need to do any signature checking for the dom0 kernel, but
> it doesn't require all the binaries to be glued together.
> 
> Assuming that the firmware/bootloader is capable of loading multiple
> binaries and checking the signature of multiple binaries before booting
> the next element, it works fine.

How would an initrd, a ucode blob, or an XSM policy blob be signed?

Jan

