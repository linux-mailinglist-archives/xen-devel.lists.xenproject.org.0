Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52254818994
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656870.1025378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaud-0006dR-9U; Tue, 19 Dec 2023 14:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656870.1025378; Tue, 19 Dec 2023 14:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaud-0006bN-6g; Tue, 19 Dec 2023 14:17:35 +0000
Received: by outflank-mailman (input) for mailman id 656870;
 Tue, 19 Dec 2023 14:17:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFaub-0006bH-O0
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:17:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5991a6b7-9e79-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 15:17:32 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so43606385e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 06:17:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hg24-20020a05600c539800b0040d18ffbeeasm2970538wmb.31.2023.12.19.06.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 06:17:31 -0800 (PST)
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
X-Inumbo-ID: 5991a6b7-9e79-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702995452; x=1703600252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8sdKo8Jeddbx74WvIuEJKUkyf/fLSmUc0SMpiKulnM=;
        b=XnlqvLOy4rBMuE+5/iEOFNoExhMumlDBcc6TAcjWZ6WqJKssOlgRLcqyVofu3PrnE/
         kp9w1Ga1JplLUEA6z/f9TUjQTSI81YVbTR0RZ8o2XBRJ9SyNBn0LsqvDuQAkAdYUV6zL
         9rzLM+5tWMnPm5K1rvztHjwQutjvm381bzb5bb9Ci32PX1hveWLE0uo7ttF8RKc+e3PX
         y5QRWuPEzrVNGOFGuZFODvPXHSnvexqjNeIY0OU8hF8vDItKVzFErYe1ZV5wlYSOyTmH
         q7TLBE/YkEC0+HNRIKtybYiH5luGv38aHoaggI20hyvTfTPGaZ8LnFDIkKaveTePzf0V
         OcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702995452; x=1703600252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8sdKo8Jeddbx74WvIuEJKUkyf/fLSmUc0SMpiKulnM=;
        b=W8J8tsreVvLyc8CrKf6yqSrCsxESd5BSqJh3RNkXJJJOKmJSKcRxLOmPja9r1xMhY6
         LUc5bIkstfI4X8Eedfv7o2ipE5byQeptRjXttoF3wCdbleumasbc6ZZUiYLoWpJGmYYs
         s+UK7W1vKCmvMHcxzShnX2u/7N8YNaWys3UL5c7Oy/OMJqrP45BnCGj+JBEU1dSWf5JF
         np7B+G10By+vs9MwkR8ZywHmfSBNnBcMxkHEmqjX0KhI2LLTd7vCsJUzNm3L1/26ssPb
         QSYnVGtaZpTeHvSrMSsqvNpEVkQ6rzI6/UbJ1RXM7mS0Zz2KT1Hfgc4zdW99OTrYjysj
         H7xQ==
X-Gm-Message-State: AOJu0Yw2+NDVrIYajgGuXksy38rYTYg/eBmODpppvixoOqKBYhXoSrYG
	9qRFSls7b+8RltZxnJ7vCY3i
X-Google-Smtp-Source: AGHT+IHMx8Mj7OsY8rnRgpFBdiRvIWO3qvdY9znjy5K9bO2NAJCnlS0TzLzTN6HoeYvewUlp+WHCVQ==
X-Received: by 2002:a05:600c:3411:b0:404:4b6f:d70d with SMTP id y17-20020a05600c341100b004044b6fd70dmr10757597wmp.17.1702995452214;
        Tue, 19 Dec 2023 06:17:32 -0800 (PST)
Message-ID: <0172d743-643b-45da-b69b-7bcabc256d60@suse.com>
Date: Tue, 19 Dec 2023 15:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
 <7a149ad7-0363-4f4a-9de5-76be382e774c@suse.com>
 <ea17d6e0-9980-4bcc-9d3a-60273d6386a9@xen.org>
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
In-Reply-To: <ea17d6e0-9980-4bcc-9d3a-60273d6386a9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 15:12, Julien Grall wrote:
> On 19/12/2023 13:57, Jan Beulich wrote:
>> On 19.12.2023 14:48, Mykyta Poturai wrote:
>>> This patch adds the ability for the device emulator to inject MSI
>>> interrupts into guests. This is done by adding a new DM op to the device
>>> model library.
>>>
>>> It is not possible to reuse already existing inject_msi DM op, because
>>> it does not have a devid parameter, which is required for translation of
>>> MSIs to interrupt numbers on ARM.
>>
>> Yet then ...
>>
>>> @@ -112,6 +113,20 @@ int dm_op(const struct dmop_args *op_args)
>>>           break;
>>>       }
>>>   
>>> +    case XEN_DMOP_arm_inject_msi:
>>> +    {
>>> +        const struct xen_dm_op_arm_inject_msi *data =
>>> +            &op.u.arm_inject_msi;
>>> +
>>> +        if ( d->arch.vgic.its == NULL )
>>> +        {
>>> +            rc = -EINVAL;
>>> +            break;
>>> +        }
>>> +        vgic_its_trigger_msi(d, d->arch.vgic.its, data->devid, data->data);
>>> +        break;
>>> +
>>> +    }
>>
>> ... you're not using the addr field at all, which therefore could likely
>> hold the devid data (encoded to really represent some form of address,
>> or stored directly - much depends on what purpose the address serves on
>> Arm for MSI).
> 
> For real HW, the address would point to an ITS doorbell. All access will 
> be tagged by the HW with the DeviceID. This is then used with the data 
> (an event ID) to look up the associated interrupt.

So no properties of the destination are encoded in the address (besides
it being an ITS specific address of course)?

> I think for Xen on Arm, we want 'addr' to be the SBDF. This could then 
> be used to find the associated vITS and device ID.

FTAOD, the vSBDF you mean then?

Jan

