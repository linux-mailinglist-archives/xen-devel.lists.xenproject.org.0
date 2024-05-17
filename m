Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5708C82E6
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 11:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723942.1129105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tVa-0002pe-Fp; Fri, 17 May 2024 09:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723942.1129105; Fri, 17 May 2024 09:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tVa-0002nV-DE; Fri, 17 May 2024 09:04:10 +0000
Received: by outflank-mailman (input) for mailman id 723942;
 Fri, 17 May 2024 09:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7tVY-0002nP-Vl
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 09:04:08 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ada59e5-142c-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 11:04:07 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59b49162aeso402418366b.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 02:04:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a5ecd37a3sm713726366b.79.2024.05.17.02.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 02:04:06 -0700 (PDT)
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
X-Inumbo-ID: 6ada59e5-142c-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715936647; x=1716541447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlHm4NYfhjgJBXbsD4SzErBSiDqj334BvJJYbaiMYhc=;
        b=WiAxpDiR+S59l4vtfSZCznjdPqysfAuUxPu1Q0tmVmnbCfmnSO22ahug4p0nR4q+mv
         XeNl5C8rSmZC705uNm/q7s83XFhD9/DuUttb3Nq/uM64xjrPz8xNQWrbAGwZt0S/1/cj
         yb8lqMq/xMiKha7LRG1Fm07i1krf/EmScvaTDnVld5chpEt20Bv9ugcLzQAWCfJkU5wq
         FrW2aTiQHp3yYAUp7pZludtO3dNrwsKxcLuJVKb9FDhY0tBqE1KUV9mXGLaiD4HsLoWz
         V/L1GyfdjlE2tgZ8dQiZuUVSGe1a6V1fiIdvn2rabPTsCNGUhl1NTV3AknjhSRnR17Xw
         lzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715936647; x=1716541447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlHm4NYfhjgJBXbsD4SzErBSiDqj334BvJJYbaiMYhc=;
        b=CNTVjZquR2HlpM6CcF3BKo+9EvqyRyb/aDV53qxjYPTMLazojoA/3m8Fg9JfYfjQt6
         jJOZreBu5wutDfoM0PnOBqyddjQqnx7HXfbKydJjj7CKaZB6KUjHxr8dyRfsXeZtjNC7
         44wcY6fWaLu7dzlc13mNi9/Dg3++dFA2i00R1/b68+ENZJwUVoRvJP6ZYg8+ZU+m2NiC
         ls+jsno6J9fFehN0tluOp7TMzQk6yb9wfFaWrkNAKbKpQWdA0tcPOWMIK6beSKNtUUab
         yZB11nC8rC3OFaSod1rpn0XDBUXXXkMwYvB+zOlULmpYlJNokZfnrn0fLokZqLdBSSfv
         ZxAw==
X-Forwarded-Encrypted: i=1; AJvYcCVx6XQL+mhClhFt+ySmXRLrDqOWo0daundFR/ZRh/ixT0/TXfbDo7dujAW6b6lD8IXHk2N+woys4HDK5VQXxke3tainTsyC3Hx3i3pjv0M=
X-Gm-Message-State: AOJu0YyG9J6/IdyZ4YKCjsKt87l77LRxbJ4u96YpCZsG2bEnSRm++HkR
	2/G+3k3+EkeGudvMNo1QY2j9m+wnWjBRck2xeaOhYjJV9/3Pp8l+qieIWm57Cg==
X-Google-Smtp-Source: AGHT+IHc1AXfC2VvM63SODeaxhatqxfvtbGzFupNQ95M5xLb92uFNMP8YaLgCm7MO3Rc2Bkv30QbzQ==
X-Received: by 2002:a17:906:a190:b0:a59:a221:e2d4 with SMTP id a640c23a62f3a-a5a2d536d97mr1352690566b.8.1715936647091;
        Fri, 17 May 2024 02:04:07 -0700 (PDT)
Message-ID: <98ae62ad-a569-4db3-9914-b3b91f4a4370@suse.com>
Date: Fri, 17 May 2024 11:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-4-Jiqian.Chen@amd.com>
 <34f6ac6d-0bad-478a-86c1-a124df5504c8@suse.com>
 <BL1PR12MB5849A45EC6E19E53B074A3C0E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849A45EC6E19E53B074A3C0E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 11:00, Chen, Jiqian wrote:
> On 2024/5/16 21:49, Jan Beulich wrote:
>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -76,6 +76,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      case PHYSDEVOP_unmap_pirq:
>>>          break;
>>>  
>>> +    case PHYSDEVOP_setup_gsi:
>>> +        if ( !is_hardware_domain(currd) )
>>> +            return -EOPNOTSUPP;
>>> +        break;
>>> +
>>>      case PHYSDEVOP_eoi:
>>>      case PHYSDEVOP_irq_status_query:
>>>      case PHYSDEVOP_get_free_pirq:
>>
>> Below here we have a hardware-domain-only block already. Any reason not
>> to add to there? Yes, that uses -ENOSYS. Imo that wants changing anyway,
>> but even without that to me it would seem more consistent overall to have
>> the new case simply added there.
> Ah yes, I remembered you suggest me to use EOPNOTSUPP in v4, if change to ENOSYS is also fine, I will move to below in next version.
> 
>>
>> Just to double check: Is there a respective Linux patch already (if so,
>> cross-linking the patches may be helpful)?
> Yes, my corresponding kernel patch:
> https://lore.kernel.org/lkml/20240515065011.13797-1-Jiqian.Chen@amd.com/T/#mc56b111562d7c67886da905e306f12b3ef8076b4 
> Do you mean I need to add this link into the commit message once the kernel patch is accepted?

Not necessarily the commit message itself, but below the --- marker.
If the kernel patch was accepted earlier than the Xen one (which imo it
better shouldn't be), you'd likely want to move to pointing at the
resulting commit.

Jan

