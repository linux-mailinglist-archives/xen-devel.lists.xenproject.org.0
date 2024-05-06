Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798898BCA72
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717361.1119484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uWy-00084v-Do; Mon, 06 May 2024 09:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717361.1119484; Mon, 06 May 2024 09:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uWy-000838-AT; Mon, 06 May 2024 09:21:08 +0000
Received: by outflank-mailman (input) for mailman id 717361;
 Mon, 06 May 2024 09:21:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3uWx-000832-Ca
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:21:07 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f76a09ef-0b89-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:21:06 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34f0e55787aso718604f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:21:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n15-20020adff08f000000b00343eac2acc4sm10226254wro.111.2024.05.06.02.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:21:05 -0700 (PDT)
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
X-Inumbo-ID: f76a09ef-0b89-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714987265; x=1715592065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/zSWmaKj8EIn/E2UAkfYgHX661SSODSWokmoxNghQs=;
        b=KKTnET+IzaNie73vOApLkc6pKvjuUQ80jrW4tUAKWNut1f2aTDIaa5tNGERNrPiaO2
         7nPlqmz7neOXe+aso71f2y8QpTceSvdgq1f7DOAHV6SULOVyBYHWEQuzdshA5P8gYbzK
         IXppxpUR2t92kY/MvDA3dCgNvuuZOeuXDRIyuC9nl8IxaE0UiwXtNz4VJhiFhLUG/RT/
         uJcBwrSaA4WRCA4NqAn+jpBWviM9oDpxX4Fp8oJIW1peumHJLnWFdurNdnkKqUhihX3j
         fYpvFbWu+9nhG09IVXrcbZ34feEuBFYjA1PIYPNSlB/nu9INPKVYh7R4Ii8s2KOAxs1Y
         U/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714987265; x=1715592065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/zSWmaKj8EIn/E2UAkfYgHX661SSODSWokmoxNghQs=;
        b=LQmsVV/rsUPXmF1ElmmNZ+SGotI2fph1bNKNDYIjrUoKXmR0eGju/jJIPzzt61whFS
         6Lyw3t8kHXU3xJojfSsrBlFg5Zz6mPDgD1HCaj3FQshViMf1QgJl3lY0cQM5pDlYKZNM
         +afEQxPstu+Uoc2E4TxQT7OvgRtcP8/0aXPL+xwWrOG7aYvMg2HbgZL6jNQMABb5jjot
         +Dw0H7f0tvm44wuX+g9ynn3LXMlDor8cs239cTs9rFl1wfmUfjLdPJ32kI00PMHHiQEs
         JCGRzl/wT9KPE+jekqYVeEFklp9CKAI/qbEFU1Z3rKjUelsUgyD/8e4vsjpxN5xg5ZSz
         5x6Q==
X-Gm-Message-State: AOJu0YxE1nwNzwiI05iz07ajYt3Vyt6GMxh9jtvdCbWkltTcXMud703T
	WNNfFuaXC/64hDTck3TTTbShXd/8k4YvnX1k1BJhu0vai49kc5Ygf1F2j0LgUw==
X-Google-Smtp-Source: AGHT+IE0exLuM3sVoNVOz2FWZa24HP9L83VkmE6/B+LMKjt/zP8WH5DEG+WDOAmUICJu2FydEZ7AnA==
X-Received: by 2002:a5d:410e:0:b0:34d:bbcf:11fe with SMTP id l14-20020a5d410e000000b0034dbbcf11femr6159230wrp.62.1714987265641;
        Mon, 06 May 2024 02:21:05 -0700 (PDT)
Message-ID: <77e6c510-b5bd-4cb5-a29c-44bf0cf7a521@suse.com>
Date: Mon, 6 May 2024 11:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] VT-d: tidy error handling of RMRR parsing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <97577ebf-3871-47be-97c5-8164701be756@suse.com> <ZjifDsIeRseZD27n@macbook>
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
In-Reply-To: <ZjifDsIeRseZD27n@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 11:12, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 11:14:02AM +0100, Jan Beulich wrote:
>> It's acpi_parse_one_rmrr() where the allocation is coming from (by way
>> of invoking acpi_parse_dev_scope()), or in add_one_user_rmrr()'s case
>> allocation is even open-coded there, so freeing would better also happen
>> there. Care needs to be taken to preserve acpi_parse_one_rmrr()'s
>> ultimate return value.
>>
>> While fiddling with callers also move scope_devices_free() to .init and
>> have it use XFREE() instead of open-coding it.
>>
>> In register_one_rmrr() also have the "ignore" path take the main
>> function return path.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/drivers/passthrough/vtd/dmar.c
>> +++ b/xen/drivers/passthrough/vtd/dmar.c
>> @@ -82,14 +82,13 @@ static int __init acpi_register_rmrr_uni
>>      return 0;
>>  }
>>  
>> -static void scope_devices_free(struct dmar_scope *scope)
>> +static void __init scope_devices_free(struct dmar_scope *scope)
>>  {
>>      if ( !scope )
>>          return;
>>  
>>      scope->devices_cnt = 0;
>> -    xfree(scope->devices);
>> -    scope->devices = NULL;
>> +    XFREE(scope->devices);
>>  }
>>  
>>  static void __init disable_all_dmar_units(void)
>> @@ -595,17 +594,13 @@ static int register_one_rmrr(struct acpi
> 
> register_one_rmrr() could also be made __init AFAICT? (even before
> this patch)

Indeed, all the more when it calls acpi_register_rmrr_unit(), which is
__init. With scope_devices_free() becoming __init here, it would seem
quite logical to fold that adjustment right into here. I'll do so,
unless you'd indicate that this would then invalidate your R-b.

Jan

