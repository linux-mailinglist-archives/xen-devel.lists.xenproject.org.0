Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B7808828
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 13:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649838.1014817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDjx-0002na-8F; Thu, 07 Dec 2023 12:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649838.1014817; Thu, 07 Dec 2023 12:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDjx-0002kr-5a; Thu, 07 Dec 2023 12:44:29 +0000
Received: by outflank-mailman (input) for mailman id 649838;
 Thu, 07 Dec 2023 12:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBDjv-0002kl-UB
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 12:44:27 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b416732-94fe-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 13:44:27 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33334480eb4so1066358f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 04:44:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d14-20020adffbce000000b0033343804ec9sm1344971wrs.85.2023.12.07.04.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 04:44:26 -0800 (PST)
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
X-Inumbo-ID: 5b416732-94fe-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701953066; x=1702557866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+KULE3SJq9wVZj+AHnf437YsLgbdBevy8Vk9oYZW3Y=;
        b=eZkj/4WxBsQyRQRMkgRx+Fxn/UnTY6FMYB3Dh1nwcdky3tbofrN02FSFFpC3kJz8u6
         2Z34DiC9wwEZQDzynv0uqaukkRFeRNw2V3T4TNG4O7Of8WgECt5kS4d/s6HiPlhOBDZ/
         FaHlJWMqUFpWbGjyf0D+bE3VNeVAupEuQFLRFPbIjMMRVkqMdP3yTIJP6tqnD/uly8yK
         y/t7qofC1GcwRxoG1yUuuJsbWk4QxfljXXpSFs/xZiEe0ion2O8ExC3Y4FvKtWj76dy3
         jip7t6o7jsaODbEPvY5yxS7V4cw9J8V2izcUTHEYsDPKuA604HDdgiPNgyY3YiUzjTjC
         kSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953066; x=1702557866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+KULE3SJq9wVZj+AHnf437YsLgbdBevy8Vk9oYZW3Y=;
        b=jwBsgnYm38jW9TAal7psLdqamOhI2UK4blqhTdV+QON5/Qf2g66m05ziokzIa8OnnH
         wDGz687vS61NNc9VpbGK7b3X9xOB//+ycLeu/11p5itpCW3aKVKbirwqBFHt+etfynTk
         jnpKaMZm0WiUaG95tm6gwIRIpRLl4EI5+1a1u2CcDKGRcCBm2EvydwN4pUZaZLdM3H9M
         UD55oc8PdIxvqJbF5by05gNhkvn9eIMFzk5m2t+k24RjpHSBfTL4G1O2yKqnkm0SLwSL
         8SkcDWFXaJA3F0afYLHqdLVegAq+GqAcSoyyiw8qF/tgxna8oKl5eIu76hC6sCzjnILG
         pjyw==
X-Gm-Message-State: AOJu0Yy295WEetfCw2t97CG9GBf0jBcUGYJKQ/Im1F/+0Nro6grc9zB+
	djjtUkGHy3Efxx1SxsngQPZr
X-Google-Smtp-Source: AGHT+IGURI5I7y/rPzEDT8f1RcrUBYx1xaJSTpi87LiNacpty703esF1ucZyRd90ETMSKHYLCQMgkQ==
X-Received: by 2002:a5d:590b:0:b0:333:59ce:4e6c with SMTP id v11-20020a5d590b000000b0033359ce4e6cmr1655273wrd.40.1701953066540;
        Thu, 07 Dec 2023 04:44:26 -0800 (PST)
Message-ID: <65b668a5-7518-4e96-8357-c3fc680e8760@suse.com>
Date: Thu, 7 Dec 2023 13:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARM: MISRA C:2012 Rule 5.6
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
References: <5a732dc4-70c7-4c03-b6fa-02d5074441bc@bugseng.com>
 <924a50ac-7200-45c7-b486-763b01b44a57@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <924a50ac-7200-45c7-b486-763b01b44a57@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 12:48, Federico Serafini wrote:
> On 07/12/23 12:43, Federico Serafini wrote:
>> Hello everyone,
>>
>> Rule 5.6 states that a typedef name shall be a unique identifier.
>> This is to avoid developer confusion.
>>
>> For ARM, the violations left [1] are generated by two definitions
>> of the type phys_addr_t within two different files.
>> I would like to ask if this is intentional or not:
>> if it is intentional and it is not causing any confusion between XEN
>> developers, then I think violations involving phys_addr_t can be
>> deviated.
>>
>> [1]
>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/ARM64-2023/429/PROJECT.ecd;/by_service/MC3R1.R5.6.html
> 
> Adding XEN mailing list in CC.

Thanks.

These are files ported from Linux, where I assume the typedef-s were added
to limit the changes which would need making elsewhere. Still I think that's
exactly what we (now) have xen/linux-compat.h for. IOW - just move the
typedef-s there?

Jan

