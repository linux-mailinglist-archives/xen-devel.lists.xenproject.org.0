Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB18D2D51
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 08:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731464.1136960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCCqt-0002lH-7B; Wed, 29 May 2024 06:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731464.1136960; Wed, 29 May 2024 06:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCCqt-0002iW-40; Wed, 29 May 2024 06:31:59 +0000
Received: by outflank-mailman (input) for mailman id 731464;
 Wed, 29 May 2024 06:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCCqr-0002iQ-98
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 06:31:57 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ff23fc-1d85-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 08:31:56 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6269ad9a6fso195478466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 23:31:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda8481sm680873466b.213.2024.05.28.23.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 23:31:55 -0700 (PDT)
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
X-Inumbo-ID: 24ff23fc-1d85-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716964315; x=1717569115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uRFnEJZv5mdZ6dvigi45RN52WydUBZXB2fLglmEZNLk=;
        b=OLXmgvFFMfN5RZgq6Vg6LsJ/3Mfz1mnhNDsB6UIBJr/7CjH0CxCo4YqGYFJYVnJaA4
         yw1Ix0UnUoBgb56l+Yr9iVH4isYr27zRx7fK0gPz2zJV6iZ7ipPIqyE8UCMiPlG9KiAe
         EwIJ7VTBL1YKJD12p/bZmZyOAWD/Qwqv8AdZoyKK6OW5lTGplz00wvCJhj5UCtXil5WC
         7ZBzKbrloourAWooEV53qbTjvnFK0yJhlGiBdHYbjr6KizHQDgscqsSLHdXRYA6ifbYl
         mEZZfReyELdFQiaNrWA0WlszAvjPt/zZEYqOZA+QVa2vZXWJsyVoj0Kn8/uFOrAUr3hh
         1pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716964315; x=1717569115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRFnEJZv5mdZ6dvigi45RN52WydUBZXB2fLglmEZNLk=;
        b=i09slR0GReaamwTrYsI26QDTJF+0jG50a57ae13vYyFQb7URURlzLbq2t7maOJzk+m
         m7geTh26jN+H1V9QrcLtvY3FZTxlnZnxga5ki7p4TrT8YRooIRUlVqg+gytz0GHPIxBW
         W86MuAHrMxoO8/3V5s+rw5d0n8qSgIGNXGBpt+CJ6ug+6ObYPxQWeqRJp0bzZwYC3OY3
         Kdw4eXoY9C9Z8Yr3whdVfKC0IUCJj+h8OUKOUeY/fBzzdhVn96y2iARxWlitxWuEUaJA
         8mSTXeWQUqSawFphA/D6cyKdJQWniENepJL8znJz4UvykL2EUZZwU0gFRMpIEYbKgOnN
         Xt2g==
X-Forwarded-Encrypted: i=1; AJvYcCVdNiZPh9FvFaazp2TkNMN97o9KEo6IpoWRig32+jzSc3eSFuADwS6MHHPDPiXXOzKIeMt4L/fYzBBL9RgdTt/zZMiv8M9VLKAQNhYN8rY=
X-Gm-Message-State: AOJu0YwWOIow51p+iiCrCzdgMKv+xw0qQ74443MeIMI84ZlaGGSGWyZU
	q/DvHfdJc0PTWPGxTD22lJRmNMB9Rm3kio0Cj7O6l47vV3OUVd3Bpgey46vwbQ==
X-Google-Smtp-Source: AGHT+IEkVbHxiY/FoIu6Z0751qf9xqd6m5i84U0ULG3E8oTMZFoQSaJGZRHecglut0QUTTomUCHZkg==
X-Received: by 2002:a17:906:2484:b0:a59:af4c:c7de with SMTP id a640c23a62f3a-a6264f15de7mr952006666b.58.1716964315578;
        Tue, 28 May 2024 23:31:55 -0700 (PDT)
Message-ID: <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
Date: Wed, 29 May 2024 08:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
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
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 04:41, Chen, Jiqian wrote:
> Hi,
> On 2024/5/17 19:50, Jan Beulich wrote:
>> On 17.05.2024 13:14, Chen, Jiqian wrote:
>>> On 2024/5/17 18:51, Jan Beulich wrote:
>>>> On 17.05.2024 12:45, Chen, Jiqian wrote:
>>>>> On 2024/5/16 22:01, Jan Beulich wrote:
>>>>>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>>>>>> +        if ( gsi >= nr_irqs_gsi )
>>>>>>> +        {
>>>>>>> +            ret = -EINVAL;
>>>>>>> +            break;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        if ( !irq_access_permitted(current->domain, gsi) ||
>>>>>>
>>>>>> I.e. assuming IRQ == GSI? Is that a valid assumption when any number of
>>>>>> source overrides may be surfaced by ACPI?
>>>>> All irqs smaller than nr_irqs_gsi are gsi, aren't they?
>>>>
>>>> They are, but there's not necessarily a 1:1 mapping.
>>> Oh, so do I need to add a new gsi_caps to store granted gsi?
>>
>> Probably not. You ought to be able to translate between GSI and IRQ,
>> and then continue to record in / check against IRQ permissions.
> But I found in function init_irq_data:
>     for ( irq = 0; irq < nr_irqs_gsi; irq++ )
>     {
>         int rc;
> 
>         desc = irq_to_desc(irq);
>         desc->irq = irq;
> 
>         rc = init_one_irq_desc(desc);
>         if ( rc )
>             return rc;
>     }
> Does it mean that when irq < nr_irqs_gsi, the gsi and irq is a 1:1 mapping?

No, as explained before. I also don't see how you would derive that from
the code above. "nr_irqs_gsi" describes what its name says: The number of
IRQs mapping to a (_some_) GSI. That's to tell them from the non-GSI (i.e.
mainly MSI) ones. There's no implication whatsoever on the IRQ <-> GSI
mapping.

> What's more, when using PHYSDEVOP_setup_gsi, it calls mp_register_gsi,
> and in mp_register_gsi, it uses " desc = irq_to_desc(gsi); " to get irq_desc directly.

Which may be wrong, while that wrong-ness may not have hit anyone in
practice (for reasons that would need working out).

> Combining above, can we consider "gsi == irq" when irq < nr_irqs_gsi ?

Again - no.

Jan

