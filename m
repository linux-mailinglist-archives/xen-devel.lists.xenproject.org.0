Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347CF9083E5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 08:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740414.1147504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0ch-0004UU-CM; Fri, 14 Jun 2024 06:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740414.1147504; Fri, 14 Jun 2024 06:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0ch-0004RK-9H; Fri, 14 Jun 2024 06:41:19 +0000
Received: by outflank-mailman (input) for mailman id 740414;
 Fri, 14 Jun 2024 06:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sI0cf-0004RE-LT
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 06:41:17 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 197588c3-2a19-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 08:41:16 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6f176c5c10so216804566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 23:41:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9982asm148447766b.202.2024.06.13.23.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 23:41:15 -0700 (PDT)
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
X-Inumbo-ID: 197588c3-2a19-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718347276; x=1718952076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MwZ/lLOCD2cBUb21EwgNs8l6zW8XPvoE717Wle2NtRw=;
        b=E39CjanTa62udH/SH7uQbEalV38/aNhZhu/3yzoJZ3hMPkEcYBd/JIJ9tZ+WE5dj+T
         EM7M+275dgi3CcsAeAbcC2OLA+5Hqakt4RI6zAOJHQ/SWEB3RSRTJblpDTaPK3yQuhZ9
         Vg3X6zo+jUev70VlmybqIGNq+j09hP/8pHJ4I2Awm2MdTPTjHKjsUre6RZPo1VwXWiXY
         hApHDOKGTQ0/7JS3kapFTfSln5OSQNrK2ukzjOCuRnt34n7XUVkeHYwR8voyRsUmHy5w
         d0vl3bFksjVKEMQWTaCFweUvbPuuwFncAS6C5gLfgIWOyMzT6d6prMSAPFZ/l4nwISz2
         0+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718347276; x=1718952076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwZ/lLOCD2cBUb21EwgNs8l6zW8XPvoE717Wle2NtRw=;
        b=pR0B7mYHeXmBhSUVPDQMWWK1tN1IoWXxsvyV2Mxp2xlM1xLX6dsgDwPnUwMdR2fzgf
         4n3jUUj8byOZ+TeKysYe5R5xz7YlNxb67gIW0DK3cJlMSkjZPO8WBO9PON5eFlpJRI+m
         C6x1PSWzK/NGU7qWxzuWdllGNTeqUUjKxWTescJ64zaPQGFrz8jlTi4DhtmV9xcx3Hcu
         u3vEcQpz9a4mrw+EpsjDuXxHZbHSlCz39kN3VKm0JBq8bPC9enlQQuJB8r3Z4OpOLyFh
         Va9NLD6VpF9wor4fwegKMAOsZbdBBsfeEoSJ6kngMTzOH863v3QkHYKLJCQ90jfkqb39
         6n4A==
X-Forwarded-Encrypted: i=1; AJvYcCXum6VdKAPcPyQIykB8nz/J/DCaHuLvxJrdgqxeTCSm5hKGuuxxfyA6Awb7tiFzM7WRwg9lUQcqkZ01ko4O8tnU2N/1dQdWpUWvjoF+Wyg=
X-Gm-Message-State: AOJu0YwTeO6oYqCTzJZHybiIGUHCubBZ5jZldEpWcrLMf3DvFBtbQX10
	wI6hniEIlRsjKLscCt0OWst58QY4EaxVgLL9D2bjUeqrnmfHSqcQ8rIap3qoHA==
X-Google-Smtp-Source: AGHT+IHxw9dymhwNcdPDIW8z5Ady2yM7Yig0iXHZIjxpnNeDR/cutci+Fp8LeIyC97A+zyRYvo320A==
X-Received: by 2002:a17:906:3e97:b0:a6f:1590:ab06 with SMTP id a640c23a62f3a-a6f60d298c6mr114262566b.31.1718347276040;
        Thu, 13 Jun 2024 23:41:16 -0700 (PDT)
Message-ID: <3fde1817-72a6-484f-9777-567b062c1913@suse.com>
Date: Fri, 14 Jun 2024 08:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-6-Jiqian.Chen@amd.com>
 <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
 <BL1PR12MB5849FF595AEED1112622A98DE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c2a5b9cd-2a85-4e01-8b8b-31b85726dbd4@suse.com>
 <BL1PR12MB5849652CE3039C8D17CD7FA6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZmrrNvv2sVaOIS5h@l14>
 <BL1PR12MB584926B7F6153287479E4CB4E7C22@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584926B7F6153287479E4CB4E7C22@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.06.2024 05:11, Chen, Jiqian wrote:
> On 2024/6/13 20:51, Anthony PERARD wrote:
>> On Wed, Jun 12, 2024 at 10:55:14AM +0000, Chen, Jiqian wrote:
>>> On 2024/6/12 18:34, Jan Beulich wrote:
>>>> On 12.06.2024 12:12, Chen, Jiqian wrote:
>>>>> On 2024/6/11 22:39, Jan Beulich wrote:
>>>>>> On 07.06.2024 10:11, Jiqian Chen wrote:
>>>>>>> +    r = xc_domain_gsi_permission(ctx->xch, domid, gsi, map);
>>>>>>
>>>>>> Looking at the hypervisor side, this will fail for PV Dom0. In which case imo
>>>>>> you better would avoid making the call in the first place.
>>>>> Yes, for PV dom0, the errno is EOPNOTSUPP, then it will do below xc_domain_irq_permission.
>>>>
>>>> Hence why call xc_domain_gsi_permission() at all on a PV Dom0?
>>> Is there a function to distinguish that current dom0 is PV or PVH dom0 in tools/libs?
>>
>> That might have never been needed before, so probably not. There's
>> libxl__domain_type() but if that works with dom0 it might return "HVM"
>> for PVH dom0. So if xc_domain_getinfo_single() works and give the right
>> info about dom0, libxl__domain_type() could be extended to deal with
>> dom0 I guess. I don't know if there's a good way to find out which
>> flavor of dom0 is running.
> Thanks Anthony!
> I think here we really need to check is that whether current domain has PIRQ flag(X86_EMU_USE_PIRQ) or not.
> And it seems xc_domain_gsi_permission already return the information.

By way of failing, if I'm not mistaken? As indicated before, I don't
think you should invoke the function when it's clear it's going to fail.

Jan

> If current domain has no PIRQs, then I should use xc_domain_gsi_permission to grant permission, otherwise I should
> keep the original function xc_domain_irq_permission.
> 
>>
>> Cheers,
>>
> 


