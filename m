Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13DBB1AF8D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 09:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070065.1433718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCM2-0002aj-St; Tue, 05 Aug 2025 07:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070065.1433718; Tue, 05 Aug 2025 07:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCM2-0002YQ-QH; Tue, 05 Aug 2025 07:45:02 +0000
Received: by outflank-mailman (input) for mailman id 1070065;
 Tue, 05 Aug 2025 07:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujCM2-0002YK-2e
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 07:45:02 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f83352-71d0-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 09:45:00 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-af925cbd73aso854217366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 00:45:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm839545966b.101.2025.08.05.00.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 00:44:59 -0700 (PDT)
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
X-Inumbo-ID: 16f83352-71d0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754379900; x=1754984700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FdZMzSXsDrV1mmOF3MncbZQOc2gkAbeQ2HEqgqfCNY8=;
        b=Gs4AEGFrOhxi5i+aKTaV1Qjv9Ojss93JqtGMHKvBCiR952c8w+3ivvtbTz3HaDKcyB
         15NJbFsrFgeFYcV2fG4Wx5NwO+OaW3+P6IuXSfgDqjHoM95YiV0YTGNW1WSIwKw3DCNG
         3uMMMHbxV2H34vCx3PzRL7kHN/csGLOHHw+ohTwYBKfWtEJzCHNFuCskEJevBXtPx77r
         mQIWCyi/gxGYYMTykoaJ3DtYprPojhhNYrjgc8JNEqndi/lI/dajDxzSFzypklirkusN
         7ZIejrKZFEMyr26FGCOIBiauT+WOSqd4vAAsqtI9IQtUgPBPZGz6pBwZjRutm2wZ2oOH
         L1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754379900; x=1754984700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdZMzSXsDrV1mmOF3MncbZQOc2gkAbeQ2HEqgqfCNY8=;
        b=RcLvzANBUSyXKDKLXm5/gt0wsurg+TgxhrsG+9FSI+DoY2HGsLaPOCsjFFN+Tbx93L
         tgCYintuDKhcjFdJnANbKbu2Oyb3dayWnUY4J0cD4WGuVsbMqT0LLfXPftJxi3MWH4nj
         BI1H/ReTZHhzN84pIUKUjAE2QcCw57vDgY947zGfQ8iyk0nerd+hV2+jNggmGaucmLkF
         pxseBOH7wG6hUI8u11XvJT+ZJ7MgYUGS4k/Nr4xrBoQRY/PDezx/TsJcUfk3FfOUMBTo
         YO7cg6JN65ICU211Ijx8PL0p4h+on1GuwKfvUjPKkOOfTdVdxVzMQH2bsXMFMK3uVoOi
         VlEA==
X-Forwarded-Encrypted: i=1; AJvYcCW3RW+ZzNqoZdeMIGzjk3NmRmFVG/QW70HZ679GVDjI1XdMobZl05rLx5c0J9GozHZ5tASpcvj4sbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywzYQXA/lfMZbmahVxcXOHnTrTTHaTP9WTllQ6pP6yoHmeUDOg
	1g79SDdmYOdHNmvSIpZnKMue9tIVOnKwcPeqa/c+TrD2/33Eh1kO4a1OpnyOYLd5aA==
X-Gm-Gg: ASbGnctp06NIZeX54goizEgoNVqhkY0mQMg5KkxxbDGGovUvxR4YHI7ZiXqtNc+eYY4
	/TasQl4Fc04p2TCMYG0i4Ojr3lS6vRt7TZ7UauDMmx4YFO0+mSiNCuEpkJpjRHAqcgC56RoinMx
	9EJMWT+n66F+l/F3aIHoM0XgcW2jk0Us4V9JGM9ksXY+5NdZ0ozSj9zfQ53GXlFQEuoiJt+SRDC
	5sEw8n1Tmfng+/9wggF+NRlXUpKSycFk+0jeZdyR20QrspSajixOAPuYaipgd9vPI1DBHkg0lVI
	r9dLDa68SPkpDsC6yA7zHTe+WtdGtnEHjhnjID0vXvM+AM+LW5yuCiKzfmc9tP1kNDVt6FA9Von
	l1m8uyFKaYd6GS0uFmSfX8ijIs2e7fXMEmSzLX0pGNYdZ6PLYeMnHTm0nWgrXeJlX86sXW3YmAR
	xMUZWE/8I=
X-Google-Smtp-Source: AGHT+IE5sKR3s7ctCaKCKmdUFPhuToLKINfbs1HiftNwg5UrRzSeZX4l30NA6Yaqmu5OOu+MSsxX8w==
X-Received: by 2002:a17:907:9706:b0:ae0:e065:ddfb with SMTP id a640c23a62f3a-af940006feemr1408513966b.18.1754379899651;
        Tue, 05 Aug 2025 00:44:59 -0700 (PDT)
Message-ID: <795cf4c1-07be-47a5-b807-074b165650c4@suse.com>
Date: Tue, 5 Aug 2025 09:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
 <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
 <e7344494-8ac1-42a6-94a8-52a46f7f691a@amd.com>
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
In-Reply-To: <e7344494-8ac1-42a6-94a8-52a46f7f691a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.08.2025 18:57, Stewart Hildebrand wrote:
> On 8/4/25 03:57, Jan Beulich wrote:
>> On 01.08.2025 22:24, Stewart Hildebrand wrote:
>>> @@ -839,6 +839,9 @@ void sched_destroy_vcpu(struct vcpu *v)
>>>  {
>>>      struct sched_unit *unit = v->sched_unit;
>>>  
>>> +    if ( !unit )
>>> +        return;
>>> +
>>>      kill_timer(&v->periodic_timer);
>>>      kill_timer(&v->singleshot_timer);
>>>      kill_timer(&v->poll_timer);
>>
>> What if it's the 2nd error path in sched_init_vcpu() that is taken? Then we
>> might take this path (just out of context here)
>>
>>     if ( unit->vcpu_list == v )
>>     {
>>         rcu_read_lock(&sched_res_rculock);
>>
>>         sched_remove_unit(vcpu_scheduler(v), unit);
>>         sched_free_udata(vcpu_scheduler(v), unit->priv);
>>
>> and at least Credit1's hook doesn't look to be safe against being passed NULL.
>> (Not to speak of the risk of unit->priv being used elsewhere while cleaning
>> up.)
> 
> 
> Are you referring to this error path in sched_init_vcpu?

No, given the context I thought it was clear that I was referring to

static void cf_check
csched_free_udata(const struct scheduler *ops, void *priv)
{
    struct csched_unit *svc = priv;

    BUG_ON( !list_empty(&svc->runq_elem) );

(i.e. particularly this BUG_ON()).

Jan

