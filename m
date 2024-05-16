Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE28C74E1
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723119.1127670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YmE-0006vv-ST; Thu, 16 May 2024 10:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723119.1127670; Thu, 16 May 2024 10:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YmE-0006uP-Ol; Thu, 16 May 2024 10:55:58 +0000
Received: by outflank-mailman (input) for mailman id 723119;
 Thu, 16 May 2024 10:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7YmD-0006uF-No
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:55:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df6a27eb-1372-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:55:56 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5731ffcc905so3565441a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:55:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea6a36sm10340940a12.12.2024.05.16.03.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 03:55:56 -0700 (PDT)
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
X-Inumbo-ID: df6a27eb-1372-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715856956; x=1716461756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjkVqo8bkow5ECw80PpyS/0vdZeMISSEkzAn1+y5NbQ=;
        b=M8hCb510E6Cxpclyg5SPpdkTx5iR78QE30orklmlZGT7KQyW86rcT4ImT+XG68JuSd
         AG4wWk7o1byBP/a8PEzo+eIP+rkCsAWeenz5r+g4tnKEsdfisvdVMWCrHfEXM9yQksej
         SNmmovp+mUev9wh9fzYCChg2GBagZQXIcVr9hjDxIiXrMnBE1z9BywDS3tvN8Z7yg2jP
         TU/PuSNT0BMgQKb9fkyIozWPjEajrJ9IzyNtE73+Dc+RZywUVs5FM1PEsxWuLeDpbTje
         q0UAH/PVGmjsR5CIMAygdFjtIyBONBrhnguWGIrg7xnMFBmuZ3p4hZRjO64PDNB6vn1i
         W+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715856956; x=1716461756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjkVqo8bkow5ECw80PpyS/0vdZeMISSEkzAn1+y5NbQ=;
        b=u1oV+nZtp54C8kSLr1H8Nif3i0G8/mwoB4XPF0ewD3A+5iCBJg7gWMA1Bzwsah47SK
         AyIaGjqyKdsaIsebiiBq+8oMN+RTTOtIqwjzdsAUxA3V7soRnHW4+OEZFkpC+89bJk1o
         Tll6YpwEY0KXZq9zTjiCVqOKHUR5k4AxfufHzvKK5ktTDHBlUwSJ/cVFVm6nAZgIGwGW
         QLziJnomWelQH7WLQB1bIwOqgdSo9XpJLaV37XelJgglu3oEcPOsuqakjFx/R4+2cywZ
         lSVm063cAT4mblDyoToHpn+RiXfhK+NDd+JTjjK2m1FiZph6Y9zK3FXj18aQziO2ZW+J
         4hVQ==
X-Gm-Message-State: AOJu0Yws67fDqdL91Dt6YJSsHWca+HRA4rmklt52pW/5Dd1tUk719obd
	HZSdTcHDfIW8FHOtEZUPWWWvNvCHo12ovQ7ACenYWhUFnNBcJm6xfA0o/cQLGQ==
X-Google-Smtp-Source: AGHT+IEefVfFJDysmrhcHJ8HB66T2COninvqwSkIkf2/UkJi4HAZkb44yPdMot7+iRlE8y32CkKhJg==
X-Received: by 2002:a05:6402:1a4d:b0:573:50d8:3fc0 with SMTP id 4fb4d7f45d1cf-57350d84107mr11904843a12.11.1715856956394;
        Thu, 16 May 2024 03:55:56 -0700 (PDT)
Message-ID: <04633485-24cc-4834-a64f-57193facd482@suse.com>
Date: Thu, 16 May 2024 12:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 06/15] x86/p2m: guard altp2m code with
 CONFIG_ALTP2M option
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <7a6980b1c67dedb306985f73afb23db359771e8f.1715761386.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2405151737150.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151737150.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 02:38, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/include/asm/p2m.h
>> +++ b/xen/arch/x86/include/asm/p2m.h
>> @@ -581,9 +581,9 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>>          return _gfn(mfn_x(mfn));
>>  }
>>  
>> -#ifdef CONFIG_HVM
>>  #define AP2MGET_prepopulate true
>>  #define AP2MGET_query false
>> +#ifdef CONFIG_ALTP2M
> 
> Is it necessary? Can't we just replace CONFIG_HVM with CONFIG_ALTP2M on
> the same line

No, because of where those constants are used.

Sergiy, you want to move the new #ifdef down by a line though, such that
the #define-s are separated from it by the blank line that presently (with
your change applied) follows the #ifdef line.

Jan

