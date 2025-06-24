Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB9AE5F61
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023356.1399327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz4a-0001nl-2d; Tue, 24 Jun 2025 08:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023356.1399327; Tue, 24 Jun 2025 08:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz4Z-0001kk-WC; Tue, 24 Jun 2025 08:32:08 +0000
Received: by outflank-mailman (input) for mailman id 1023356;
 Tue, 24 Jun 2025 08:32:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTz4Y-0001ke-Hl
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:32:06 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b517bc50-50d5-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 10:32:04 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so4294880f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:32:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f126a7bbsm9808321a12.69.2025.06.24.01.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 01:32:03 -0700 (PDT)
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
X-Inumbo-ID: b517bc50-50d5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750753924; x=1751358724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NVkI+qGtPevFR8TEjO/y3VZRgYAtodU0AtpHvWzJE2o=;
        b=Ob3Px9hRj/ZOsxs0kT/MeyxFNO7p1TkTsQ5kQxUV9+XvTVknj+hEqWsBw1tV6XElCb
         CZfo0415ZFiBNVdCHaeWegqPq6aTMC0DTTKq5+9V/6Ma/FYsEw9R8exua4iFUz3Llf7N
         OsSnTgLVaW2RhNDkmndeDOniFoPVib77IorvnrlQZT54mQD3UAu9Nw/34RUaKIdHEJYa
         gwlDl2lp+HiK2X834tRIkXoP02yyTQx13W2wKLghyEWkpSnbAdLqIP2yQ3t73zC+d2Xo
         ezEPPQHQJDBDSWUpjjVhcn8nJHH4aE11r+yvtrVQJR7aP6Fvh9etCKcb+N0Zuiw1oZLj
         LRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753924; x=1751358724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVkI+qGtPevFR8TEjO/y3VZRgYAtodU0AtpHvWzJE2o=;
        b=LzMZBK6YvYmv4mbqL6dmOS4S366uQuNpgEOhNwrpidReXmKOgbVodsPBdXuhqcU9lo
         n2ERDt2P2XGxyDGToK44go3g0JHpTGMIQ3F9IMJnVSBz3Kbp41AbsDjn88IZVZFdKHBL
         BV+TvB3SgfPRaYrXmPv7rQTSQEV86wDbPgymmG3ff0NrNpoyh+tTQp3I39YLkIknJSEy
         SIpsewM3bctC19y9SZ/b622nyQds0LtP8PcNq7uBu5z6hlisLZjoDtCP8KMUmKiZ18bE
         hJpXx5bZ1cRbGu1OK9VFVOpIiuHB1q+6gXoTmFhr8+9JFi0CDUR6glXWusY5/3lO0bt5
         9xUg==
X-Forwarded-Encrypted: i=1; AJvYcCWO4wKzRyku7AshoVirhpy+C6AMfts+FnbeJA1+OGXPldQfSIJMbLWpmdjCBLS0h9+azZUgfF6ZdWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEkzYBfyo+Q6jDJPf5/4GVIyrt9kIHczEkxte/SOLwZAE+Uif+
	f526nORPuB2O7QlaGDJnynmoKd3u8gc9w+L4ETjjLWYNe7iJH9XwDPj9xngUUYO3HA==
X-Gm-Gg: ASbGnctatBkftD18im+hpPrRL/pddpvS25mdsX9KJg9wRikzfr2SPdZfPqys3PyqmLY
	W3CaChNj+0OPYmd4yFMIaNkilz2xzQJUfb88xfmh5NgQf5hkD54TcQ0uze74CwEXw/1cbI2jiYw
	p01ydyKL9amQebfqicXL0H/laT4lDmP3sRCxYiaclCZiApamR+lAKmNyYPiG0Ce1Jgm6AtYIRPA
	/o6ndIV/YozP/jcwTvT/AFdZNc4N1JIys0Vb9E8mrp0RMeX+IAepArx2Xexrf1V5yUhBwVi26SR
	fVH8dr64pGIMn07MzLGvshMLAQJBsxs0gRVa1n8xhkndBnJthJ8g6pkuH3vTmtVMda+LsMB1hov
	QbJPEapnFSyd+T21kQ1zw/ZZxAqIr62ABIP+Bt/RdRGFKIMLpJxxTaBfN7A==
X-Google-Smtp-Source: AGHT+IFHq3+eJRO4DHgaIXY5buDt1YLVcu5M42KzqKUGFzatuKc/0koVVNBv9H9qj1OZYo1ekXtTDw==
X-Received: by 2002:a5d:5846:0:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a6d131708fmr13665824f8f.28.1750753924075;
        Tue, 24 Jun 2025 01:32:04 -0700 (PDT)
Message-ID: <ea37a8cb-7d65-4c74-8c28-39579b5121cb@suse.com>
Date: Tue, 24 Jun 2025 10:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
 <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com>
 <CAGeoDV98LJup77GQ4YrbeqSBeoojaNe+46NX37dHoiFDDHUGtw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV98LJup77GQ4YrbeqSBeoojaNe+46NX37dHoiFDDHUGtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2025 10:29, Mykola Kvach wrote:
> On Tue, Jun 24, 2025 at 10:53 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.06.2025 09:18, Mykola Kvach wrote:
>>> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_driver = {
>>>      .start_tx     = scif_uart_start_tx,
>>>      .stop_tx      = scif_uart_stop_tx,
>>>      .vuart_info   = scif_vuart_info,
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    .suspend      = scif_uart_suspend,
>>> +    .resume       = scif_uart_resume,
>>> +#endif
>>>  };
>>
>> As this being put inside #ifdef was to be expected, imo a prereq change is to
>> also make the struct fields conditional in xen/console.h. I think I did even
>> comment to this effect back at the time.
> 
> Would you prefer that I include this change in the current patch
> series, or is it acceptable to address it in a separate patch?

Either way is fine with me. I expect the header fine change to be able to go
in right away (once submitted), whereas the patch here may take some time for
people to review.

Jan

