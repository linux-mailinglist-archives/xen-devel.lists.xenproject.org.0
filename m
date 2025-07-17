Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D696FB084DA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:25:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046167.1416407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucI3X-0002tH-QG; Thu, 17 Jul 2025 06:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046167.1416407; Thu, 17 Jul 2025 06:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucI3X-0002rM-NV; Thu, 17 Jul 2025 06:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1046167;
 Thu, 17 Jul 2025 06:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucI3V-0002Mf-VY
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:25:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0b99bb6-62d6-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 08:25:21 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45611a6a706so2799525e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:25:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e05a2bsm15305377b3a.39.2025.07.16.23.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:25:20 -0700 (PDT)
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
X-Inumbo-ID: d0b99bb6-62d6-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752733521; x=1753338321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mOAmZARIPS815sSG/Wp1GE8YDWxGuZ4K+1XfgF76fe0=;
        b=WKM7VwC74/3XbxfnyrO99gF8T38hTOZZJ0L5coifZgz290mfYi0Kv4fcRavfCzMNWQ
         32AAU9TpYUxp/2uAgoKJPnCr5KGh5WqRD1Ia8kBJVhThZbGbEf6oeuMByyCTLdwQRjcQ
         PLgk8RXf5lEZXquz2dHzOkIy9rAid/C7snjpnEZi6hmeMC4wtyVQi1fKo9mkmvGUMGXg
         oexdKkpxAjbK9A44MM3iWiyIPrrek23M+UuQFvD7vnruDMeTkrDqpCKvnlUW2B542ccC
         7ji2FyQiKfsgi03D+loAJFfc3zorCuQ5EBOlDt2lwMq/asnhSpNh5oCyOKWtgf/Iscuy
         rcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752733521; x=1753338321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOAmZARIPS815sSG/Wp1GE8YDWxGuZ4K+1XfgF76fe0=;
        b=VoMkM8E8sxauYOadZNMMaj07PHeoSaQCou65p5bCWILOvOvRuwz8/s/p/OZw/x+VuM
         1pewMtcEB5fkfMiqcYGT31rSA2b+8sw4Ck6hv7OqOeEWv+0uLGAxi23c2lYCTBeAKQX/
         I28LJxQAEAMZH7EkJvAWrDoWxi2rqONJOTzdJyxl1OoUlRWLLbWr47CtECCEV5Ml2e/8
         e9T1MjPbkLNiXqYKIDBIh5wPiB7eX6zmfGPDnCRpw1UumTXGZObCzi/yshWqAnYXnyiD
         FrCBCknKr+i7j2KueMapvZJqo3TEBDSSViv6zq5FR5yC2YbSaXVEGmkeMalKu27ulD9w
         PJNw==
X-Forwarded-Encrypted: i=1; AJvYcCVYM+OU7SekQUVOTQKMd7Nv+vqYNuct8WAhMvb3KwoCC/mIYm+WvcqPPXk/cqnfSsg4FUrXPCfPy1Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSgOo0d/s+/fNtC2K0ATA3axwrVxL0PaaLnm/yA9vdCCgPW2Pe
	Tp0xsJjjlrlRm2jLIjucjtLA4RsToHgSNzn1+/YD5gkYSSu8Jv50A1ejgnUde6l2QQ==
X-Gm-Gg: ASbGncuDmMetOyCsT50DxA0PkdWsMIwB4FAw9tQ0fcA8ho8VxEBxMXOi/m+ZmFmIzYv
	ZZG7bPV1exLfEAu9RyAwCDyW6IjzZ+tNr4amT52wc4LTeSwNHHrLrEI41BDmlxi5uwTFdesMtV1
	bt/6T86MH4t5Svs89pyRgKgMer410DwX7vfHchaiqbRQl87mBLnI9D/CiCkp87mWzj6Zrb3ilX/
	B0CZnioJg0yVmy4gSqHV5SQhl9Zlah/+QCSNYAKqCFQ3Spsh1nEoi9V+5QSeVDoudxz7HXeZOPo
	WaNaNLkQm8A5nP6PX/K34GrazTouqYP6y2W28JUe8HOyzhew+BllRmRwObAqqXXcDLzb+jplCeZ
	o6RbgEeg1LW+XS9rdRORTanSIJBnpvJCYuNNZ3wrjdcnNngu7apzzVn/zTHI6uJA0AGWxKx76KI
	UvPnFuw18=
X-Google-Smtp-Source: AGHT+IE/Mw3lRRNWR5KtHKu49pxq99mijXqiZC6ZzGcG16wC1oEZogAjuySwtCl13vjy5dz2evj3JA==
X-Received: by 2002:a05:6000:250f:b0:3a5:2b75:56cc with SMTP id ffacd0b85a97d-3b60e4d4c15mr4081849f8f.23.1752733520701;
        Wed, 16 Jul 2025 23:25:20 -0700 (PDT)
Message-ID: <b408a253-d483-4a72-9691-b7ef724eaab6@suse.com>
Date: Thu, 17 Jul 2025 08:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] xen/dom0less: store xenstore event channel in
 page
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-10-jason.andryuk@amd.com>
 <eca10872-aafe-4990-a86a-1582e87a6af2@suse.com>
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
In-Reply-To: <eca10872-aafe-4990-a86a-1582e87a6af2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 08:19, Juergen Gross wrote:
> On 16.07.25 23:14, Jason Andryuk wrote:
>> Write the associated event channel into the xenstore page so xenstored
>> can read it.  xenstored can map the grant by the reserved grant table
>> entry, and then read out the event channel and bind it.  This eliminates
>> the need for an additional mechanism to discover the event channel.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   xen/common/device-tree/dom0less-build.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index a2789e3bdf..284139bf14 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -26,6 +26,7 @@
>>   #include <public/io/xs_wire.h>
>>   
>>   #include <asm/dom0less-build.h>
>> +#include <asm/guest_access.h>
>>   #include <asm/setup.h>
>>   
>>   #include <xen/static-memory.h>
>> @@ -126,8 +127,14 @@ static void __init initialize_domU_xenstore(void)
>>   
>>           if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
>>           {
>> +            evtchn_port_t port = d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN];
>> +            paddr_t evtchn_gaddr = gfn_to_gaddr(_gfn(gfn)) +
>> +                offsetof(struct xenstore_domain_interface, evtchn_port);
>> +
>>               ASSERT(gfn < UINT32_MAX);
>>               gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
>> +            access_guest_memory_by_gpa(d, evtchn_gaddr, &port, sizeof(port),
>> +                                       true /* is_write */);
> 
> I couldn't find access_guest_memory_by_gpa() for x86. I think you either need to
> introduce it for all archs, or you need to handle this differently.

This code isn't buildable (yet) for x86, is it? There's a series of Alejandro's
moving in that direction, but that didn't go in yet. And even then aiui this
file would still be excluded.

Jan

