Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E07ADAC64
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 11:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017110.1394082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR6V5-0002P6-Gn; Mon, 16 Jun 2025 09:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017110.1394082; Mon, 16 Jun 2025 09:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR6V5-0002Me-DP; Mon, 16 Jun 2025 09:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1017110;
 Mon, 16 Jun 2025 09:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR6V3-0002MY-LL
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 09:51:33 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aeeb459-4a97-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 11:51:31 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso5106809a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 02:51:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4a5b6a5sm6018466a12.40.2025.06.16.02.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 02:51:30 -0700 (PDT)
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
X-Inumbo-ID: 7aeeb459-4a97-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750067491; x=1750672291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2prvmEzDSdVFicN8cGuHMukB6VrVtIiT2hWxH4ORT+c=;
        b=CWA7iSv4I3/aoW7deqakm/Lq7BFMZJL0vOUZYs7vErI0+VWy1w7d0iCnmQkMKS4IPz
         qeLLacNZNzq2pIgucGrE8t8b05Mu0oXvVMDWDfBWffD+k5YlbjqaEDr2xQ+dEbKJEgw7
         us9vRCMuZsb6UtiaG0G5y9Yv7lrKSdZXAD+jTJ+70DHAdERGOyLy5NQF6iPATQh0NkMl
         q1uTiDz0SSA0dx3O6p7Q1Vw1b82kIVz08Kn0OqZ5PAotoi55AIrnF3JXEGePXz8mpTm0
         E0Q0Uj2m5S3vc8dXMI6GnatTppUnlKnynxDjRQCmc0TWgzfUr62Tf1an6KYKq7C1njOY
         56og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067491; x=1750672291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2prvmEzDSdVFicN8cGuHMukB6VrVtIiT2hWxH4ORT+c=;
        b=etrFUfgWv3L44LfYd0+7HBOQPsvjJN+JlGPl3oomMs3ZVQwYFaJxHFUyfrDD1+Um1W
         FLwhMJKG6+PvHf60H19yU+27kw/zv+grlQBY2iHwncHRgxqT5M+L7mBOizCkHJP+u1VK
         YK9XZhRcHViQdkcAN/OKWUM3v8HmiF+4f2seyBeZo+IG5+5ImkYdBq4X/3DUX7C7KmE/
         6RcO45oImp5zTUszYLLXaghxtFfJlysX1MnjBXitXtKNmVgNXTt1gZkBifNwIhS0UmjL
         fCVz1qheibzLA7f8egyEZJNtLZs0sJyWR9zizT6/0tizpC2asW1SM0xd8glMLElu2XqP
         D0DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNR3AcbJCGF14TaaU0kKFD0bMOZs4kuDD1FibMMvk/Dm1fUkw+ympVTfP8nuWLfC0Z4YkSTQ7dFPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGea9jRTq6TunpFeAjjBvVGRYgAaMi8FyNP3auH7cGgRVyc0hh
	3UT/upYlYh40MBtbsNEDxOiHGBxn6bCZJSCRFjOMHbyaXdkoVt3YeeEFmxl0JJiZLw==
X-Gm-Gg: ASbGnctRNy3HFi8xDAvGJWYomqZnLpK10D4/rYJisJHXuHIdvDxsgF0ClRd2rDTGom6
	a+jf48f7m1KhSyaglQGYR9GHrDe8/rdMykqY2a3k+ogM9wpf9CRbrluwegufmN+M2Sd+2OWSP8X
	pVPi8nogxXQqWD9PnjqnzfLlsilq4RDHvHY254HuQLoPtXcxqQH5oDZ9x67wc9llK4QGGHGazQU
	B3P637uisgawGkhefKzy5+I0wgJ9mT/Ww/qMeXrpS9BsMprACc6lBCTrgo7PuGk+T0YOvdzWlmc
	E9BL3Dx7JopISGaN0OZAtzHijIzIYftmCxXhaVSx0hihw5dsqVecDrN327m5XhRbB2UOCEcYtC7
	/QhN0CWKhBQ4IUAJPTqGshaORUrdEKKiGt51vTFxKnM15+yY=
X-Google-Smtp-Source: AGHT+IE2Xf7vLQ6JMPRRw1icKwx35PSfmZIhM4IKXcJOjXspdYFdEOxXVnGNKIXrUZYHwRoGSuaLgQ==
X-Received: by 2002:a05:6402:d0b:b0:607:3344:6ef1 with SMTP id 4fb4d7f45d1cf-608d0979c1emr6483732a12.29.1750067490598;
        Mon, 16 Jun 2025 02:51:30 -0700 (PDT)
Message-ID: <824a8aa5-c603-47e8-8688-a324152329a9@suse.com>
Date: Mon, 16 Jun 2025 11:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-4-Penny.Zheng@amd.com>
 <005a0e3a-dc8f-480f-8bb9-fd8eb164eb02@suse.com>
 <DM4PR12MB84516E8BD6E4C48D48273C93E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84516E8BD6E4C48D48273C93E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 11:43, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, June 11, 2025 11:34 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
>> xen_processor_performance"
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> @@ -545,14 +597,9 @@ int set_px_pminfo(uint32_t acpi_id, struct
>>> xen_processor_performance *perf)
>>>
>>>      if ( perf->flags & XEN_PX_PSD )
>>>      {
>>> -        /* check domain coordination */
>>> -        if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
>>> -             perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
>>> -             perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
>>> -        {
>>> -            ret = -EINVAL;
>>> +        ret = check_psd_pminfo(perf->shared_type);
>>> +        if ( ret )
>>>              goto out;
>>> -        }
>>>
>>>          pxpt->shared_type = perf->shared_type;
>>>          memcpy(&pxpt->domain_info, &perf->domain_info,
>>
>> ... the need for this change. And even if there is a need, a follow-on question would
>> be how this relates to the subject of this patch.
> 
> I extracted this snippet out for sharing the same checking logic both in Px and later CPPC. They both need _PSD info

Right, and that (iirc) becomes visible later in the series. But it needs saying
here. As it stands the description talks of only get_psd_info() right now. And
the change above is also unrelated to the "extract" mentioned in the title.

> I could change title to "xen/cpufreq: make _PSD info common" and also add description in commit message for
> introducing check_psd_pminfo()

The title was probably fine; it's the description which was lacking. In fact
I'd deem "make ... common" misleading when there's no 2nd user (yet).

Jan

