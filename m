Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232BC2508C
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 13:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154254.1484338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEoLO-0007z0-Ru; Fri, 31 Oct 2025 12:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154254.1484338; Fri, 31 Oct 2025 12:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEoLO-0007wL-Nn; Fri, 31 Oct 2025 12:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1154254;
 Fri, 31 Oct 2025 12:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEoLN-0007wF-GI
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 12:35:01 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0347caec-b656-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 13:34:59 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-429bb95a238so1231601f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Oct 2025 05:34:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c54498dfsm90787f8f.34.2025.10.31.05.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 05:34:57 -0700 (PDT)
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
X-Inumbo-ID: 0347caec-b656-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761914098; x=1762518898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eyemXuU6ZIfw7spBQDLJYpamE92G2Rx+bQBAE9RAYBE=;
        b=aERacKV2K4uIPu1OELydoPVy+nYdwBlfyD2JTEWtWpNgOgcHDBueqPAqILBmFNSSfg
         Dzqa1VMT6evq6yG7pn5HbmJCr1A/Sk3BYpsw+LwJLD28QJbrwrOtuc5EsRdgzZEu7G+I
         9v1703q4Kd259abNPaQAiPautpJfnHZqMZ4nteehOKF44Lnc8Y5Cw/U0WQS1LVbcMaFh
         VnKLMGDW30kYeLi03NNf2dU/UwHU6cOpTGSAHOpSArxInJY3X/Gp0xyg+OxqtC+t8/Er
         KR+cqqLLBK5PEFJD5N6lMH9QtEDcIhuVAcGBWF6oHfgKr7g6KVswDoT6emtZDpe19z+6
         4ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914098; x=1762518898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyemXuU6ZIfw7spBQDLJYpamE92G2Rx+bQBAE9RAYBE=;
        b=mhLLa/7sx0Zg2ctgCdAvjYXiRpcUsZ7n5ONAc2bdGuQSLG/nuPmcCVFK6o1w6ybZXS
         P+Ld10FvA5l1QXYVILhKJ6tlvyKUv3pzYDsKH0R7zGJJP8nQHIJhXgC0D3Y2crplEAWk
         o2PLqcRa6DGl97hG/kMtmIVfzDVuQ3wDxSHQl7SEMHjHzVj1sllDWTiRy5tvpKOtUHyg
         dKnetR1bJCEfSztM7L0t88yOYIF/6ZW5/RTARCQxvO1jEakbFas+IVfpJqkPPZL4VEFR
         GyrwMt2TTtqFSpkoGGsZIT8f53W1Y8daYgArT9wxXo/3LjdfElSHUxMJY4Pm3SBvif9n
         3S6w==
X-Gm-Message-State: AOJu0YzXF8deUf4mjUhprUfEr4ol8k+N32EpDIN7SJoG4aV6agm+Oj/p
	JopnE/p34efSdr14cnxz++9IILvO7R23ZhlJfH364TU8C8pO6Sv8/p796HqpCJ+V1A==
X-Gm-Gg: ASbGncvxcX/B9/XOUDUCM2iHNF8uyoh3WFH+sh5pVcaLCwU+HvX5npXolWhUi9uLSJM
	5CoyF2YYG3PIquFuWyjk0i5yHM6WSTKTDxvQVB8nlG/ZIuYfpKzdU7UDeaP5hLS7VbMSUK2SCmM
	vqxf0XYpGkoWlTTQrqE7qSGg9H+O9/RCNUaidmj3Sg3mJvXJAZ1xqt/Xr+ABogTSyIltiqbGFcy
	5mJ0QjnLoHhlGWjZ4Za1HXDX6hfY4C1GNuOtWHHx2fU5a8oUKYOVIk99ZgmDUvWkO5/iMPxtTGv
	i6Oa14Jysjh4CmJ13u9zAaAXdoNrRp4q5jS8lAvHWnlu1BvNHRiQaud3GBnaDRYyHl7ORM2yG1p
	yXm7et7+PeM3KAlz9Ego+tXemofh7PEy6GDCQW/0GrhYtozDhmJ0nYRxbxGVPGy7ISttn6f2wHY
	IKl+WNeQjposxQzu3OCgfcfhMPe1s8kTEMSXedECJsDKIyRLNc3BfL8XA35MWF
X-Google-Smtp-Source: AGHT+IHWAmMiNAufNhU5DA+tiuwLGGIQOfUk1P2RpVTu/cQXv1BUPrvNuO+TcfZ+xv99zB+o/BKorg==
X-Received: by 2002:a05:6000:2203:b0:428:3ea7:4473 with SMTP id ffacd0b85a97d-429bd6a48f4mr2945446f8f.39.1761914098242;
        Fri, 31 Oct 2025 05:34:58 -0700 (PDT)
Message-ID: <8c7881d9-5959-41b5-865d-d61199ac7a44@suse.com>
Date: Fri, 31 Oct 2025 13:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <aQSN3MKxAa_cltld@Mac.lan> <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
 <aQSVTjh5xiib-u5D@Mac.lan> <b7293f69-d9f8-4669-a1fd-eaa468445d68@suse.com>
 <aQSoE8ugCKdNWy9C@Mac.lan>
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
In-Reply-To: <aQSoE8ugCKdNWy9C@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2025 13:14, Roger Pau Monné wrote:
> On Fri, Oct 31, 2025 at 12:47:51PM +0100, Jan Beulich wrote:
>> On 31.10.2025 11:54, Roger Pau Monné wrote:
>>> On Fri, Oct 31, 2025 at 11:29:44AM +0100, Jan Beulich wrote:
>>>> On 31.10.2025 11:22, Roger Pau Monné wrote:
>>>>> On Tue, Oct 28, 2025 at 04:32:17PM +0100, Jan Beulich wrote:
>>>>>> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
>>>>>> place.
>>>>>>
>>>>>> 1: disable RDSEED on Fam17 model 47 stepping 0
>>>>>> 2: disable RDSEED on most of Zen5
>>>>>
>>>>> For both patches: don't we need to set the feature in the max policy
>>>>> to allow for incoming migrations of guests that have already seen the
>>>>> feature?
>>>>
>>>> No, such guests should not run on affected hosts (unless overrides are in place),
>>>> or else they'd face sudden malfunction of RDSEED. If an override was in place on
>>>> the source host, an override will also need to be put in place on the destination
>>>> one.
>>>
>>> But they may be malfunctioning before already, if started on a
>>> vulnerable hosts without this fix and having seen RDSEED?
>>
>> Yes. But there could also be ones coming from good hosts. Imo ...
>>
>>> IMO after this fix is applied you should do pool leveling, at which
>>> point RDSEED shouldn't be advertised anymore.  Having the feature in
>>> the max policy allows to evacuate running guests while updating the
>>> pool.  Otherwise those existing guests would be stuck to run on
>>> non-updated hosts.
>>
>> ... we need to err on the side of caution.
> 
> While I understand your concerns, this would cause failures in the
> upgrade and migration model used by both XCP-ng and XenServer at
> least, as it could prevent eviction of running VMs to updated hosts.
> 
> At a minimum we would need an option to allow the feature to be set on
> the max policy.

That's where the 3rd patch comes into play. "cpuid=rdseed" is the respective
override. Just that it doesn't work correctly without that further patch.

>  Overall I think safety of migration (in this specific
> regard) should be enforced by the toolstack (or orchestration layer),
> rather than the hypervisor itself.  The hypervisor can reject
> incompatible policies, but should leave the rest of the decisions to
> higher layers as it doesn't have enough knowledge.

But without rendering guests vulnerable behind the admin's back.

Jan

