Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FBA8C85E3
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 13:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724098.1129285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7w6J-0002JJ-1d; Fri, 17 May 2024 11:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724098.1129285; Fri, 17 May 2024 11:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7w6I-0002GI-V6; Fri, 17 May 2024 11:50:14 +0000
Received: by outflank-mailman (input) for mailman id 724098;
 Fri, 17 May 2024 11:50:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7w6H-0002Dg-Ma
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 11:50:13 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e777f7a-1443-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 13:50:12 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5727dc6d3edso4833443a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 04:50:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfc2fsm11921323a12.39.2024.05.17.04.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 04:50:11 -0700 (PDT)
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
X-Inumbo-ID: 9e777f7a-1443-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715946612; x=1716551412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyMP6548kp/KKX7EzB6pG8oTFh39aQ5ntVpckr2G3v0=;
        b=PJl7UYEdZ5OJnfx+fnwWyzUdG4R8ny4LPflcEH9OHa9x+Goovb+9xNRnM+xD2li2hH
         cX6t0LtrW8LSD/RMQd/sQJuZ7Na5NUc3i0+d9QTnkHqFQC59qiT3bQsoQ64BmI2mmh9N
         Ba9CZHfRyZcwAwNVdEjT8KrZ4fQuoRTrKVqm+eP5EFjDJ9Zd2gPzQt2oWvykuuotJe6+
         PW19+RLE1V0hGfCK0pxrR9XIk+cW8PlFmt4twfVZKdfqgtvxUKkCsrhAwGEHaCZRCTeu
         srven03VMZxsw/bcbbLTj9E+PcuibAe6lCnqkg+IVnH2Pc0sDCXhR40ObekNG/oCeIUQ
         DXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715946612; x=1716551412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyMP6548kp/KKX7EzB6pG8oTFh39aQ5ntVpckr2G3v0=;
        b=mtFzHWcjZOWB2ioRCOxK4zoRHXkeihuh7cZfk4USkY4gokTiNkqc62bGO4figGcGja
         5Firpk1U34oSAiZr000DwfWG+dp5GVzFWOBp80Uhfofq3Wb0PNDdiZhCYiYfyhQ69SWJ
         JSIBscYvzrfB3DLKLkeMeKMqhwDZb2PMI88CsVeliw2s7+6LkftOK7kkiTRnJMOE5T+H
         nEIS46fyHc2CZrzyPBI1Yt0E+t0rD74gVgcme9UNBM5R/8vKEDprh4Wl1vH4yzbwIuwc
         jWaG41q3csvWks66erv6XtNepZIJT+HXYAccUu6aBScJa1ib/sz0IfB9rn79JVipRDGS
         0bjw==
X-Forwarded-Encrypted: i=1; AJvYcCVPX3lkmnQ2LSM5A/yOvVeUNJjaXAb8YRkjQt3pYG7CCYCW1eXFqCgJtei1dQcect+gs7h7+OyKg1XUoimroQzYYwTpF3Sw8NWb4hePtNc=
X-Gm-Message-State: AOJu0YzeblqnxNoVh2ir1GMV7P6BoWtnqTfJ+a7xZ8gqRoFEw0z7mCwz
	78gtJxuzxPFbrqRAbN9GSxRfEr3inPB+dLdbp2PQMqd+OJm+YBR6GfFvikySnA==
X-Google-Smtp-Source: AGHT+IGNA10RwLs/G/b4L042DFQgtEzoBVguDiaE5VpPciMK5mUSj+SEel/KPDeF9MHMevRIxfBfcA==
X-Received: by 2002:a05:6402:3449:b0:574:d0ae:568b with SMTP id 4fb4d7f45d1cf-574d0ae5745mr8897722a12.38.1715946612162;
        Fri, 17 May 2024 04:50:12 -0700 (PDT)
Message-ID: <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
Date: Fri, 17 May 2024 13:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 13:14, Chen, Jiqian wrote:
> On 2024/5/17 18:51, Jan Beulich wrote:
>> On 17.05.2024 12:45, Chen, Jiqian wrote:
>>> On 2024/5/16 22:01, Jan Beulich wrote:
>>>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>>>> +        if ( gsi >= nr_irqs_gsi )
>>>>> +        {
>>>>> +            ret = -EINVAL;
>>>>> +            break;
>>>>> +        }
>>>>> +
>>>>> +        if ( !irq_access_permitted(current->domain, gsi) ||
>>>>
>>>> I.e. assuming IRQ == GSI? Is that a valid assumption when any number of
>>>> source overrides may be surfaced by ACPI?
>>> All irqs smaller than nr_irqs_gsi are gsi, aren't they?
>>
>> They are, but there's not necessarily a 1:1 mapping.
> Oh, so do I need to add a new gsi_caps to store granted gsi?

Probably not. You ought to be able to translate between GSI and IRQ,
and then continue to record in / check against IRQ permissions.

Jan

