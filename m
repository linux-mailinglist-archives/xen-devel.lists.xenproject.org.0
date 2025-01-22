Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4CA18DB4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 09:44:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875815.1286234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taWL8-000286-JX; Wed, 22 Jan 2025 08:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875815.1286234; Wed, 22 Jan 2025 08:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taWL8-00025Y-FN; Wed, 22 Jan 2025 08:43:58 +0000
Received: by outflank-mailman (input) for mailman id 875815;
 Wed, 22 Jan 2025 08:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taWL6-00025R-Vx
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 08:43:56 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03203572-d89d-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 09:43:54 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38637614567so3205783f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 00:43:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31c7cc6sm15516675e9.36.2025.01.22.00.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 00:43:53 -0800 (PST)
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
X-Inumbo-ID: 03203572-d89d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737535434; x=1738140234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RofGx1wSF73veAp4SZBgNWzAxn8WO51MSbDP+YrbTZA=;
        b=YkYCaiNMTjMZ4F7SMOHjsF6kdvZBwsJOF2rk3v+lxWU1Xt2yIXVBmAYqwsHj3uF6oW
         Ye4QtlbU12eQgPMP3b1V4WQeYwCVsnXc+MiwCq+Kzc/iiyTXoCoCMw62vPcrra5UCDf9
         Zxrge006YNWueD+EO81ftBc1oaimMzr+Y/CYEtIi5fb2Xo21MB2lvYrvEmqynawuaoMZ
         afXZWvrcFgQuI7E8UOBSMvFXzmEvt99MaZzi39NdDNyVWKtOoD54jSvtXaFxYMSNBTGS
         I/Mn1xihamRExm/T7uV6Ikamma+11LJvNLTuA9zMYW3IIPzl4JIKWOfUTyMK6fwlCLf9
         hxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737535434; x=1738140234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RofGx1wSF73veAp4SZBgNWzAxn8WO51MSbDP+YrbTZA=;
        b=Czp2sWDBxl5uRbUOV0HpafSuOGnoUAEAIdbyGpP5CLc/5j8OQtyPOotTConP3jRWkl
         Ark6DIAf32i1s+RFgA/AXoRdUxYpFvSJv3/kGCO6VRs5wMtiOlNCFETkfzLuWaeGZcrU
         dfmeZ8ZWlQfAkcXcbuHLexOTONiYGgKVEZ0zXDuPDSzrBxWjr6zS7IXTNwJDHFdKCsLl
         5SMrX/2/dVrG1DzRgmpVMBhaL9oUPpo9kYGes1kJhyKDPDY1+aadDcl0l0/aJU5d7ZXu
         YDgyhJCpMIRK/WSwsvt/1CugDQw2dW69y20RTsCn0+8g+uBfXsIS3pfj6HJjsn9w8ZfE
         2YJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvxSJrDVAV+xq1aTwt563MIlk2VYR13AAjNV+UuBTW0+OelQqnont7143gUp8RXVNLsxXibe2ihqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytnzz7pJaYO+yU4SrpTPH7K+wRz5U/0tT5zM2MtcE98EL59ICd
	MqfsReN1xUxt+tOJrJQP58UIHB1HgAL5eol/b2441ubHQiRje1WYY/NJba/soA==
X-Gm-Gg: ASbGncsl1VobYDagnJCzmI1e60A90tD898PWZG+7zXtQYMoNGs1rcN5UseWcGvLq4Tm
	VfijGpF2zcbBFgcj0gUFgaXjVCsDclWsSmcEJD1TM9fHii3ZoRJ3afbaTGGYolJ3Pm+NWqePXoW
	qILUAZ5l5FqLHIRsC3kQhLshBDMNjxtYojnur65K/nNX7JTNB9VxVtI20sDT/CSNS23wYM/UcmS
	dI5sv80rWeTrhnFHZ2mQt5bb75VIKKcxIViCAIilAeuLnLKNODeIPiitLuJQraelZBrqVYzIywe
	EacmSIzHRq3UXrrky8mKJoIZT3lBI7ra1tjrU843vipiV6Fw0sBzo+8=
X-Google-Smtp-Source: AGHT+IHGnaZTw785Vb6QFvE3iyWGjlAJYJ/gKF1CsjH1bvCky/LP/fGm0k6S5xmxybvXMkyyuTEXHw==
X-Received: by 2002:a05:6000:1863:b0:385:e17a:ce61 with SMTP id ffacd0b85a97d-38bf57c9b17mr18673063f8f.53.1737535434135;
        Wed, 22 Jan 2025 00:43:54 -0800 (PST)
Message-ID: <c897005a-2e8e-4031-a828-acb8128f7c0c@suse.com>
Date: Wed, 22 Jan 2025 09:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, sergiy_kibrik@epam.com
References: <Z4oxZSUQ6VARiR0H@macbook.local>
 <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
 <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
 <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop>
 <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com>
 <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
 <alpine.DEB.2.22.394.2501201527090.11086@ubuntu-linux-20-04-desktop>
 <bae48627-fa5b-48b6-b74e-267285175eff@suse.com>
 <Z49gQBkxCbXIO84D@macbook.local>
 <41859184-bd9c-420f-96c1-65abe379b81e@suse.com>
 <Z4_hOmi01AkiYH_k@macbook.local>
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
In-Reply-To: <Z4_hOmi01AkiYH_k@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.01.2025 19:02, Roger Pau Monné wrote:
> On Tue, Jan 21, 2025 at 11:35:42AM +0100, Jan Beulich wrote:
>> On 21.01.2025 09:52, Roger Pau Monné wrote:
>>> On Tue, Jan 21, 2025 at 09:13:38AM +0100, Jan Beulich wrote:
>>>> On 21.01.2025 00:27, Stefano Stabellini wrote:
>>>>> If I understood it right, I like Andrew's suggestion. He is suggesting
>>>>> to do the following:
>>>>>
>>>>> - turning PV_SHIM_EXCLUSIVE into something that does nothing
>>>>
>>>> FTAOD - you mean Kconfig-wise? Andrew clearly didn't say "nothing", but
>>>> "nothing other than making the boolean be a compile time constant".
>>>
>>> Won't making the boolean a compile time constant would also result in
>>> DCO kicking in and removing a fair amount of code?  So even if you
>>> have enabled everything in Kconfig, the resulting hypervisor would
>>> only be suitable to be used as a shim?
>>
>> Of course.
> 
> Then what's the point of this approach?  Options will be enabled in
> Kconfig, but the resulting hypervisor build when using allyesconfig
> would have a lot of them short-circuited, making it even worse than
> currently?  As options will get effectively build-time disabled due
> to DCO while enabled in Kconfig.

Well, I have to direct this question to Andrew. It is specifically
what I'm trying to address with UNCONSTRAINED.

> Overall I think PV_SHIM_EXCLUSIVE should be excluded from
> allyesconfig, even with Andrew's proposed change.  Otherwise the
> purpose of allyesconfig is defeated if enabling PV_SHIM_EXCLUSIVE
> makes the resulting hypervisor build PV shim only.  IIRC we can
> provide a default alllyes.config with CONFIG_PV_SHIM_EXCLUSIVE=n.

Hmm, I wasn't aware of the option of using allyes.config. That might be
the route to go, albeit it looks like people using the allyesconfig
target then need to remember to set KCONFIG_ALLCONFIG in the environment
(to <empty> or 1), or to explicitly specify a file name that way. (This
of course ought to be easy enough to arrange for in our automation.)

Jan

