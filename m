Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8BC39D6D
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 10:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156622.1485655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwPs-0003tT-NB; Thu, 06 Nov 2025 09:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156622.1485655; Thu, 06 Nov 2025 09:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwPs-0003rh-KX; Thu, 06 Nov 2025 09:36:28 +0000
Received: by outflank-mailman (input) for mailman id 1156622;
 Thu, 06 Nov 2025 09:36:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGwPq-0003ra-R7
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 09:36:26 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10619ef7-baf4-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 10:36:26 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa959so1273498a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 01:36:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f6780b7sm1428693a12.0.2025.11.06.01.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 01:36:25 -0800 (PST)
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
X-Inumbo-ID: 10619ef7-baf4-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762421785; x=1763026585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xni9+huuYImQhwEnC3UrxQEww0dsqUYZYj9u2IGywmU=;
        b=A94AefD5i7P0qG4umCMK6dQdxkvrP0rYTSuSceIrzx5QQI54fLaWml9S2AP/eGHNDb
         xVs6WG/FyXzHtgQv8Vsop+xzctGOFv0GS/TRJe943iONXaNI4zC27d/swIPJ2tfFUrgl
         pmOoKeLZDgLH9O9uHaMFg80S4WpjN5F5RU1beKuBm5imySHSy/bDWMreCgVPqOjEUszM
         NZdrGNrWfjbe0K94kiGEGope9QWmO03zuxo4qWh/hMYo98+8Nf36oDhbIY1X904rxoVN
         bpIlp3JKSTyjZ/4jpZijuc7CdBxnxaxpPq3+K6FkQdg4pYY0BG/B+uCFwq5Jmt9uYgi1
         si0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762421785; x=1763026585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xni9+huuYImQhwEnC3UrxQEww0dsqUYZYj9u2IGywmU=;
        b=H91Tv53UDy0Ky/oe5loLWvor8JrJJ7xOY0Cjf9gW2RkBhlrid3QQrlcsFXlhF5nfm7
         VZkJKD0jN8mEuIQO7jXcM16WiHO/gyROe4M6H4zBClLdaVfxT45NwTHqbuWtXgoFTJiG
         6vTu/7XhfUaCZF06rNbQBsUhtYwZw8SJpzywDKK9rwAcYmn87TAH7pGVnp8GRUohORbN
         1TYMukBmIEqdD7QuARBjgsGoWdFltCk3ACyA6cgVkDp5yHa21eFacqhYj7R7u6N1hAVm
         vsbon8vGneOfWpibh/oDaP2Zm2YAoWdGJ8DzqrnTacOD4qc/7p5adyyW2Zd7KqEKmMqy
         mkzg==
X-Forwarded-Encrypted: i=1; AJvYcCVUQma3hmnXgHBGIjCLWtjt/xil9H+7ysvEKA3vjDqutbEXB2iS4fuV1Gsud4c7UKq0lS/1schHbHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyAtYEr7ftJ9W/Jl1bvsKFFO80hvpdhWj/QhUKo3i0KvTezeOd
	dXp2fT5ogtXfex23gaq3kE5+F1Zwhg6LXr6PAMmwztaIUDfKfTqHnD6lXRuy2+ZwOw==
X-Gm-Gg: ASbGnctS9EPNbt29PZjOmxKKkOcWoWubUdkP8uGkSfiIunOGVmYe6JUMhp2TtbPJcQK
	GKT9lqzUUxuwmatHGmlPQV86WfE4rd/wnI7h58iaIcXzHRVtBLyz2vChbXzCOayqVRUpC8J/uMZ
	p20dmNOhjvbViIU9d0et7ZMAEngF7NN70Pi9dmDqdLyw8w/ZzdEflHO0Sxkxxg0rjW5GcjL1SIO
	Ds1kDzun4/inuJ3F1jT+8/u/wCX0MWJhR9WTukNAz/Wzt0XNNC0ZvlBwDv2SzO/I2JGI11UkBT4
	0XumxlCRVe9txCT61ejl5tMT6u288uSA6UxVwuYT2udYKSX0iWV5f58f5n4DCo2oMr9HQXX66Hx
	XWfIk9zmBRidPpkjnOL7OwsmMfhH8N7RNoQGHKqyi/IcJuo+Ahp1xIUjepH9OjBryBYlAd+BN7w
	ttm1aaExkGNMwz97zY8GjOxscVuGspbi6586CL1MzXqWl6YiR1BmCz7mB+i/yx
X-Google-Smtp-Source: AGHT+IEzysGdCZzy4ppx01Y2ZNU0oBGvl91fEKsCkK1XIRn+90HgGAedJgYftgc5P0MuMvZWwzmExQ==
X-Received: by 2002:a05:6402:1442:b0:640:bb20:41c7 with SMTP id 4fb4d7f45d1cf-6410588c61amr5680021a12.7.1762421785304;
        Thu, 06 Nov 2025 01:36:25 -0800 (PST)
Message-ID: <fc1ca849-0f66-4fdb-a70d-147cd30ba7de@suse.com>
Date: Thu, 6 Nov 2025 10:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: address Rule 11.3 in spin_unlock_common()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <812bf5574cb44727c561e0ebc3a54848823ed490.1762163173.git.dmytro_prokopchuk1@epam.com>
 <7fb6ca46-3806-4aa5-a642-28384d6b944c@citrix.com>
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
In-Reply-To: <7fb6ca46-3806-4aa5-a642-28384d6b944c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.11.2025 12:26, Andrew Cooper wrote:
> On 03/11/2025 10:11 am, Dmytro Prokopchuk1 wrote:
>> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
>> index 0389293b09..d9dc9998e6 100644
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -367,7 +367,8 @@ static void always_inline spin_unlock_common(spinlock_tickets_t *t,
>>      LOCK_PROFILE_REL;
>>      rel_lock(debug);
>>      arch_lock_release_barrier();
>> -    add_sized(&t->head, 1);
>> +    BUILD_BUG_ON(sizeof(t->head) != sizeof(uint16_t));
>> +    add_u16_sized(&t->head, 1);
> 
> This is an example where MISRA's opinions actively making the logic less
> safe.
> 
> It's not possible for add_sized() to use the wrong type (as it
> calculates it internally), whereas it's quite possible to update the
> BUILD_BUG_ON() and fail to adjust the add.
> 
> Specifically, you've made it more complicated to reason about, and
> created an opportunity to make an unsafe change where that opportunity
> does not exist in the code as-is.
> 
> Furthermore, read and write atomic have exactly the same internal
> pattern as add_sized(), so how does this not just kick the can down the
> road?

+1 (fwiw)

Jan

