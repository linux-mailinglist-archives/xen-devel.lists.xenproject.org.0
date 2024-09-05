Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5396DCF6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791156.1200948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smDyZ-0002zh-HE; Thu, 05 Sep 2024 15:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791156.1200948; Thu, 05 Sep 2024 15:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smDyZ-0002yC-EO; Thu, 05 Sep 2024 15:00:47 +0000
Received: by outflank-mailman (input) for mailman id 791156;
 Thu, 05 Sep 2024 15:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smDyY-0002xd-OH
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:00:46 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a13b613e-6b97-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 17:00:46 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a429so1006057a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:00:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a620490b9sm147804266b.87.2024.09.05.08.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:00:45 -0700 (PDT)
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
X-Inumbo-ID: a13b613e-6b97-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725548446; x=1726153246; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dqpZ78s2Kc5b/iO3tIcK0YI5DrkjSfMah3GO+gJfsK4=;
        b=YG0s4bNvVe/hFHr9uMPDAj+edr2rgqoHes7ZwhAJSidXd3cSQM/kWFcOOVyWv9W27o
         TF4rO/VN30R6LFEHFqjtl8cyMB3mDQbVCT91zXSLjq0FY6eCEFf38zDpjXhQQJ067RQR
         Nso9s3N3sZ6exLGacv8c2PDuMPGLHNyKn7p5shdbnKjnNSR1uOWx4VLAgQvS7xQrGQAB
         LgPuYfx0g4cPr9XDTfjnr6NxhkVInUnN0VnVVfBFKe8ETBuX8tZCKQJ5i7V0Xn92DhX5
         qt4qK14AyZ6p2mHQ5iZ111nX6A88ZqIrQ2fvyNS3NXZ8A7AliND28Ry4NurYXa7eHBB5
         XtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725548446; x=1726153246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqpZ78s2Kc5b/iO3tIcK0YI5DrkjSfMah3GO+gJfsK4=;
        b=SImsyFFZ6slimCWtFyYRaaD38xa262V2823iOp7o9qgR9x3gYBxBr0yzogVp7r2T24
         kzVr3Bxajc+Mqsh5e+Mjzr2iw8EbVu4T0Fp3KC9qy+zDh4ufXROMQALuXMGIu9mYhdFZ
         2ZxeUrLzM1xcOIZ5+iu+jzaJ0PXnN46s2mL3Wa3KTL1bVonlYzkDVEtjtmD+6lLAgH+/
         3iDxVm2NQFt2N5bWUjYxf31Zz6sqIIXa8Aos97CeTTY4SBql8R9yAyucpixDWYLYcI4o
         z948OBdjc7LKEUqaqstGPxdkixq2gJkX0Q4B6CEXqXDFlsE6jYNJ7ZzWXJrgyrvUO/K9
         bfew==
X-Forwarded-Encrypted: i=1; AJvYcCUyEjMvcP8MIe0D2MdnLEUlLTL/YSjYv+HLTEWAo8G+c+CYLEm5MY+E7w1UoO8JywEo9KaoMlbWF0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYpiLfk8m8TnppHrs5ICIrqzdkHsqcLI9QgML5bTm9sRwNcc3X
	nYz3J5SdE+jepvr5/AYUESIh78mj9su6uEPR9brbaBlIJ73E/a+tTLWqOcHqeA==
X-Google-Smtp-Source: AGHT+IHlPX9OlerIBdn9/P15IHWlye9aK8DNEiZJgvhcuq5iNTC+ie0XbyLN8D872XCyDJey/uAGJg==
X-Received: by 2002:a17:907:d14:b0:a8a:7501:de1c with SMTP id a640c23a62f3a-a8a7501e0cfmr122264266b.27.1725548445323;
        Thu, 05 Sep 2024 08:00:45 -0700 (PDT)
Message-ID: <8ecc2b56-1a40-4c23-b896-d0d5938b95ac@suse.com>
Date: Thu, 5 Sep 2024 17:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/acpi: Drop acpi_video_flags and use
 bootsym(video_flags) directly
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240905130657.4075906-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 15:06, Andrew Cooper wrote:
> This removes a level of indirection, as well as removing a somewhat misleading
> name; the variable is really "S3 video quirks".
> 
> More importantly however it makes it very clear that, right now, parsing the
> cmdline and quirks depends on having already placed the trampoline; a
> dependency which is going to be gnarly to untangle.
> 
> That said, fixing the quirk is easy.  The Toshiba Satellite 4030CDT has an
> Intel Celeron 300Mhz CPU (Pentium 2 era) from 1998 when MMX was the headline
> feature, sporting 64M of RAM.  Being a 32-bit processor, it hasn't been able
> to run Xen for about a decade now, so drop the quirk entirely.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



