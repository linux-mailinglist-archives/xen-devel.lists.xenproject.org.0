Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF5BC7AD1
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 09:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140307.1475234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ky6-0005TZ-H5; Thu, 09 Oct 2025 07:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140307.1475234; Thu, 09 Oct 2025 07:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ky6-0005S3-DU; Thu, 09 Oct 2025 07:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1140307;
 Thu, 09 Oct 2025 07:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6ky4-0005Gd-CU
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 07:21:40 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95e9cee2-a4e0-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 09:21:34 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-634b774f135so912823a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 00:21:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639f3d03662sm1704899a12.29.2025.10.09.00.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 00:21:33 -0700 (PDT)
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
X-Inumbo-ID: 95e9cee2-a4e0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759994494; x=1760599294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6plADGUh2WROebleK/tkWwO3jXZhRsEWIgYlQ6am2vY=;
        b=Ch+K7H+5n8vCbQV9zVYzC4zq32GyhWEzyh9/XRxPy0nr423Hl56sWbET/bCyZb22DE
         tGbdwurYYMjxT4YfgKWzykfqKS9Q+qQDg9uA/T5dmpsphj1va/YoNJZqgGN+xLIGcXuL
         ynDYM1ryOofiGUAn8i1cCb//74u+rOtw110NoikeqmzJIK8yK56lO21LpFdVn2ZuySst
         UkrZAdkBXRyT0pHCepXw4ineKSYp2m/VLSjEr4Ff+hUqP8jO3MNjkcA9LOJXe8P18cix
         fYhSUWEV8lfi34QNncJOIcMVqORow/nwfA0O5UzJh8/G/Bi+EqvxpePjzynLcX0hlOMP
         tFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994494; x=1760599294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6plADGUh2WROebleK/tkWwO3jXZhRsEWIgYlQ6am2vY=;
        b=PisTXJz7PwDkI2FfX3FfEuJASuKgoSJE38O8bwkNRNducDHaN3XUQ5IXc4mwRh5o5o
         CRFpM7TOfGCyF0Qq01KrZ/CuoCbyJaIa+5jtFAHnTckM+HzUc50JAA9NbYHvLbTT1od+
         IHon8uI7Ttt2KqvT9QtjmMoE5C17NUjsbU1Yt7gEV+Lep9FY/vWIddfTn3eMX7Rimw6U
         ixVVx+j8/32abI5CmAgQAK6KyXrwvMvBZ/sHscE9v7T99SKos+zkIGu7XrHcCCnKErwo
         MsU8q8nmnGlWPihV8eOLe+BveYiAsWL1alSVBBilSzbAiSst6uiwEW3gCULA5b+T/tRy
         h20w==
X-Gm-Message-State: AOJu0YxfR0glLAj0JqiNiVzVYSpuVIpaTRIXujc7fUkF0pHiApuckHxt
	SUjKmUSA/fcMOZvrVGHsbNYzAbt3mDZUt16UUJvf0QIdlU8UD8Tpcrw9ruhyczE4bw==
X-Gm-Gg: ASbGncuA2pWGTRUxogs438XARlE2Y/a/qEVv4Bnc1HT8YHR5UDh4bXQRXNMyRPNAkKZ
	e/QJyUjesOA8iYb4QK+JQNr1mv8QFWRcHFwrCS0VgaYuU+E9MrDnVeXXlXYPJum1K2g1+7rcmNv
	+0yUxGeHVq3e2TjmnYuq2Rs7BRjICF/VLta76kz0v1y7WrM7Mj2SPNoYsg+/NoyLCc+h4MsgJQN
	CgcIcaJU5+RcVJoRtUNbB/CD+NDyU9PFryzDmL2hqM44GPgKNIKRB5O5PB6p8URzcc3NWt6FYkQ
	ycagzUFdUVBU07tq4lS/AZVfEPZhTYY6yntH3QhDYkMqP3IvrJu9wFv+jhjFhJUn8xRTNVq+NLW
	ZEP1s2V86eQkWwEvrI1gs8RbZfa6m3CZU9zVVkh89ruZyZtNIaGyezWtj+tTSrpXZLDbbt9pGjY
	/b4ozf14xAKNGSOumjQbHAYlt05bNAQdQ=
X-Google-Smtp-Source: AGHT+IE+wlzApnrMXErS2R0UELMoLhpzFfnDfRGCXzCzN0CRfoKyPRWjQ8DPtZajrb//KKYWfbOH0g==
X-Received: by 2002:aa7:df92:0:b0:637:d2d6:dddd with SMTP id 4fb4d7f45d1cf-639d5c6f393mr4125454a12.36.1759994493866;
        Thu, 09 Oct 2025 00:21:33 -0700 (PDT)
Message-ID: <4523206c-7e0f-4197-acaf-4a1a08dad929@suse.com>
Date: Thu, 9 Oct 2025 09:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 2/3] x86/vLAPIC: drop VLAPIC_VERSION
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Andrew Cooper <amc96@srcf.net>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <feb47fa6-27a0-4cf7-8fc6-bf5f29f467c1@suse.com> <aOaP54CZw8lgLLUv@Mac.lan>
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
In-Reply-To: <aOaP54CZw8lgLLUv@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2025 18:23, Roger Pau Monné wrote:
> On Wed, Oct 08, 2025 at 02:08:48PM +0200, Jan Beulich wrote:
>> @@ -1439,7 +1438,7 @@ static void vlapic_do_init(struct vlapic
>>      if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
>>          return;
>>  
>> -    vlapic_set_reg(vlapic, APIC_LVR, VLAPIC_VERSION);
>> +    vlapic_set_reg(vlapic, APIC_LVR, 0x00050014);
> 
> (Maybe I'm getting ahead of patch 3, as I haven't looked yet)
> 
> Don't we want to use some kind of macros to build this in a more
> friendly way?
> 
> We could have a pair of SET_APIC_{VERSION,MAXLVT}()?

With what patch 3 does to apicdef.h, I was rather wondering whether to simply
use two MASK_INSR() here (patch 3 already uses one right now).

Jan

