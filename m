Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012FDA72E66
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:03:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929013.1331643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txl1N-0000J1-3B; Thu, 27 Mar 2025 11:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929013.1331643; Thu, 27 Mar 2025 11:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txl1N-0000GT-06; Thu, 27 Mar 2025 11:03:37 +0000
Received: by outflank-mailman (input) for mailman id 929013;
 Thu, 27 Mar 2025 11:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txl1L-0008TF-FE
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:03:35 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2082574c-0afb-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 12:03:34 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso7762665e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:03:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efeb1csm33472965e9.19.2025.03.27.04.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 04:03:33 -0700 (PDT)
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
X-Inumbo-ID: 2082574c-0afb-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743073414; x=1743678214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oyTrbySb3cRWImFm+3G9EoD69KCPWBRkTSV4xxMHgTI=;
        b=XVSMRuECDSXsrCBG5emMJ3dxOANVWysLtPMuVDt7gj0GElt7JAwAuw6Y1vVup9UtCu
         sVfk8fg3cJMI1YlWaMZ5dWDwwYl5epyR3335kICvslIoOu0Xz7iF9+nrRCDGFaj3FctX
         gwSLZhkSS0Hxzm5sWUjwFcKjcidZqkMw8Ex8fY5mLAEyRqKDEGSuSKJy8+LXRGLcdY56
         s0T93M39vJJO2NJ3FSMdslYhLNoBEPSXcgbYx2KKC2zwUm5EF0mKAWX5Ir80qqsZGIe4
         9R6euY4DzLZHCx79JTN1wj8B/SYr/iFnPZIADuc6S4oGL4GnB0MUOAarTZL5D+r0cU/5
         jJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743073414; x=1743678214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyTrbySb3cRWImFm+3G9EoD69KCPWBRkTSV4xxMHgTI=;
        b=qUsjTTynjxS+d13ys/oXaSEA3wmqjiXvZY7J1fgjOeDxYSsh0S0hOHYK4vTS6jI8fM
         jpm8/Uv3eC0zd9wFknw6IqZXxeQijBAfK1pr+yUlKfrWG0XW4IyFMIZBOK57N9VDAZMI
         7x87vMWUmx5pHLxjBqYflZTL5DJeAgzPklRvPhdvcviXs7Muk1YZI+e4OB7hdO3ckE9W
         XGsXcDK1dRc0r5ZLXmn54Ohd6kW5MIdSZ4pliFJcmGiEJW/j1dcoFIc0TCpBQQPbiLjV
         +kNX1TwNNVcOquLOniJhkGoNCEBTS76e/8m/NxNqIb8LaEzPWPL6cCOmEb6E+EsxwRmW
         XsHQ==
X-Gm-Message-State: AOJu0Ywj9OyLaVYEzoLEgAL1Upk10yTMV5Kj/yU/fajCQYkDtePamWYm
	H7O7yLYe27z5C1EDsRRBVvgNPS8lzY35494PB28LzUljoyfaVJi053uz0eaqLg==
X-Gm-Gg: ASbGncv8p3xk5562Z1R6vtAZ6AeSgRaG6p3Qjf+jmZWqbftzEWwhTkOoqQLt6IZsoBG
	OnVxN4PDgd9lWOxo1JONCK3zmk6tJvTiqQVuLG+tivC94fM1LdnhVT8s8RrhofJKM1AxMbpPcKF
	zG/EfFoZuoqJNx002jMn+6iUCSye2KgkU094D8O1xbu+D3D08KSqWniN6gY3UVkiihDELvP8k3M
	voFxCnU/QQBUq7MarbuiSCw2HvxbcCR8ivOkL3KuYf80cSVKnDsfk8SQY8iyAB4ElO9apNbVeBQ
	stvgfhdxnJEV3AX43dPVW4RbEtTgtnNQdey9KsGaqppiNuAp/1xTWhzkP20L36f7w9jOQlm18Cl
	BfNs1Br94di1/aHvglzAfbbtn8cFvlw==
X-Google-Smtp-Source: AGHT+IGe1DZAf/ZCzewFfV+07XaPnv6ZDVZXO0JRg71WLOHCXFpA+G7LmjkxheX4LAXg+DucOgbonQ==
X-Received: by 2002:a05:600c:4453:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-43d850966a0mr29477895e9.29.1743073414199;
        Thu, 27 Mar 2025 04:03:34 -0700 (PDT)
Message-ID: <47e6ad0b-ca4e-499e-8824-6f2dd525c354@suse.com>
Date: Thu, 27 Mar 2025 12:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: constrain AP sync and BSP restore
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <56fbfae0-aac7-4841-ab3c-a7e00dda3744@suse.com>
 <Z-UuG2QW56iSfeFj@macbook.local>
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
In-Reply-To: <Z-UuG2QW56iSfeFj@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 11:53, Roger Pau Monné wrote:
> On Thu, Mar 27, 2025 at 10:54:23AM +0100, Jan Beulich wrote:
>> mtrr_set_all() has quite a bit of overhead, which is entirely useless
>> when set_mtrr_state() really does nothing. Furthermore, with
>> mtrr_state.def_type never initialized from hardware, post_set()'s
>> unconditional writing of the MSR means would leave us running in UC
>> mode after the sync.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/cpu/mtrr/main.c
>> +++ b/xen/arch/x86/cpu/mtrr/main.c
>> @@ -605,13 +605,15 @@ void mtrr_aps_sync_begin(void)
>>  
>>  void mtrr_aps_sync_end(void)
>>  {
>> -	set_mtrr(~0U, 0, 0, 0);
>> +	if (mtrr_if)
>> +		set_mtrr(~0U, 0, 0, 0);
>>  	hold_mtrr_updates_on_aps = 0;
>>  }
>>  
>>  void mtrr_bp_restore(void)
> 
> Maybe I'm blind, but I cannot find any caller to mtrr_bp_restore()?
> Am I missing something obvious?

You don't. It was lost in 4304ff420e51 ("x86/S3: Drop
{save,restore}_rest_processor_state() completely"), with there being no
indication in the description that this was actually intentional. Looks like
another S3 regression we need to fix. Unless you, Andrew, have an explanation
for this.

Jan

