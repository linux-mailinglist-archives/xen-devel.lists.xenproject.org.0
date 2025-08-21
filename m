Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA86B2EFEB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 09:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087891.1445693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozw6-0003SS-3M; Thu, 21 Aug 2025 07:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087891.1445693; Thu, 21 Aug 2025 07:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozw6-0003PU-0a; Thu, 21 Aug 2025 07:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1087891;
 Thu, 21 Aug 2025 07:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uozw4-0003PO-ES
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 07:42:12 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57bb8e76-7e62-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 09:42:09 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-618aea78f23so1078308a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 00:42:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a7560a0f8sm4726847a12.24.2025.08.21.00.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 00:42:08 -0700 (PDT)
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
X-Inumbo-ID: 57bb8e76-7e62-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755762129; x=1756366929; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BCNbnjLP9T8ruRaSS77dcvfOpkR4qihrkU9R2gfcIas=;
        b=Xc3pihcYCKP9/VaogUQGT6Rm7/1OPSBOrIX5bfbnvIzVJ9V4HBroKadGwtCNnUjwtB
         jhrITfB2M4pXRlSqcKbSnw705DxgfEZO2e2UIjMw2WTDb87+AO12hlXyFGk8BnxMYwmS
         onuk1ZmBIRBliQK7zuc1mK+ATVMHYtbj/m5Pi15b4qmeSmUZRLBBwvlovRPhjOWYXbsx
         3O7mCTFa9RF/udcpaeZKQyipg46U9ipHYFskPOYZyy4ntLAEg0uHu+pzkdUUR7eNQ8w8
         UgTZeEEv7wfkmh1QBemURAMJOs5LXgJXDJG0tuC8B1Xh687CZcxxaQ1qgJAkTQ56bdMO
         Dyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755762129; x=1756366929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCNbnjLP9T8ruRaSS77dcvfOpkR4qihrkU9R2gfcIas=;
        b=p7gMdu4zMUkYMfp/ANy29/4tM8kfDSwsLjgmxvAx6Lg5O8L+JeTgOmmyMJmR/yI9Zs
         64miCmEkOTVVgOF5lPdv6L0Rb0RFQNzU6tWdkDelmRwgdEz68oFv3TTlldz8IXitFeoB
         2UdRq9vOy537AF03kqBDaRyVkeD4WUTmTqafBoSEbdGgJbz/zoWG6V5rYoTq2QvrI4lq
         PYcM3E3WXQc13v8uvF6YwsU8AlWdwuJVv8U73FMc33BzhEzUHNCc8p77hbZ1h66TCk5B
         lR9MOUt1bGTYyL0Sm+FANZlChu6yGrrfnF2QjxFzcejusOmw5+T33V1Hghj5JNT8lltM
         VTkA==
X-Forwarded-Encrypted: i=1; AJvYcCW3S9yYrXvobx1a4Si2ZOP8vCaFTJZET0I2sZGCXI6CFjMxp1s7VSrfWiLhO0MeNBBFVD6X3kZtSlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6/Wy+tcpDpvwzJaV2lwpBfHyPQEtXXVoZZASB5ypL7dhET9mf
	adG2xy+Mq3xe2tiCkh0fQ0ArtdvWtW4zMnppPeMK69Ka3atQu8eGZrQXzzuFW4XeOg==
X-Gm-Gg: ASbGnct+ZSojrHEr2zzk310DwalmKibEebPtSjgADYaw0KpDAZ5pynDr2owGXddqo9A
	vzZV+evkq9LC7KsmDJTbz/oZrjr+RrQtPfS/CNl888Z5yWJWKoePlBSyg9CbHoG5It1NSOGvEnm
	e7qyHUJpHnfWrL5E7yDtrtN9SI6fVw8P/pQlnGuxv9L63IqPKpeu5t9XD8FKdt3I9lP07iPkV96
	3DOemUwX035Ke/J6Cmiik/Us3PApyIOaCr3TXDjJTZDnVQagpbuHcfPjmQo4I0uTsflgvJNshpr
	seWELAiN6iwWt8U/Q9NZ2hF8OdTo9HB65XQkqOCn/kzq0lKMhaURuJcaxhW19X3vxLMH81ynNRF
	8Vv48la2HMALqFKF4+jD7z+1vhglPxFx37i3zMXyCbPgOHgTTK/IKyIjmUGA65GhKvIN9YW8QP7
	DpBrKg3Sk=
X-Google-Smtp-Source: AGHT+IFq8ZhaHA8NJxJTsixuMg05YlJAQA/HRQYqyLhg2tPaPkSwtfsYR+jQjcDeUFE7no55R4LZRw==
X-Received: by 2002:a05:6402:21d0:b0:618:20c1:7e61 with SMTP id 4fb4d7f45d1cf-61bf873472amr1338979a12.27.1755762128906;
        Thu, 21 Aug 2025 00:42:08 -0700 (PDT)
Message-ID: <07b2dae6-c380-4f30-a5d4-1ae67979d872@suse.com>
Date: Thu, 21 Aug 2025 09:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH v12 0/6] x86: Make MAX_ALTP2M configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Juergen Gross
 <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1753953832.git.w1benny@gmail.com>
 <CAKBKdXiKpsmmcGR6A3jEfHSPBE4eG=9uyBzZTW21seGUuzzi0A@mail.gmail.com>
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
In-Reply-To: <CAKBKdXiKpsmmcGR6A3jEfHSPBE4eG=9uyBzZTW21seGUuzzi0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2025 12:47, Petr Beneš wrote:
> On Thu, Jul 31, 2025 at 11:28 AM Petr Beneš <w1benny@gmail.com> wrote:
>>
>> From: Petr Beneš <w1benny@gmail.com>
>>
>> This series introduces the ability to configure the maximum number of altp2m
>> tables during domain creation. Previously, the limits were hardcoded to a
>> maximum of 10. This change allows for greater flexibility in environments that
>> require more or fewer altp2m views.
>>
>> This enhancement is particularly relevant for users leveraging Xen's features
>> for virtual machine introspection.

One remark: Besides having added the Ping: prefix in the subject, there's no
new content here. You also sent the email To: the list. It thus remains
unclear what your pinging for, as you have collected some tag(s) already. It
generally helps if you make clear whom you're addressing with what expectation.
(Things may be different if for a patch / series you didn't have any response
at all.)

Jan

