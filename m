Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EFA3DA69
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 13:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893835.1302680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl604-0007Ky-EV; Thu, 20 Feb 2025 12:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893835.1302680; Thu, 20 Feb 2025 12:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl604-0007JW-Am; Thu, 20 Feb 2025 12:49:56 +0000
Received: by outflank-mailman (input) for mailman id 893835;
 Thu, 20 Feb 2025 12:49:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl602-0007JQ-PP
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 12:49:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c55c44d-ef89-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 13:49:50 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e05780509dso1249838a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 04:49:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e0a2e25589sm1104943a12.42.2025.02.20.04.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 04:49:49 -0800 (PST)
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
X-Inumbo-ID: 2c55c44d-ef89-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740055790; x=1740660590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xGQzctoPMra7CZnRhDd+GBJ+EQglU2BTH7uN9pFV+og=;
        b=KP2dQ3LCBiTaFPqQGp1qplfN9BoKEQwQboAMbhoKbimaPlj17ZMi3FELl+hwkHZPK6
         e5mzFEiMd8OOZlhvqeuUeH83gv274nwGbs0xaNXZmwTz4NtvpXdUfuIw0B+dt7LCI55b
         DDeGYjDEb1iJK/CFh1gQ8/qdP9/D6Uxd0vj5qt6IqfBV5d8sN0eK3FtX4ncNkYFtNTeR
         U2s2VpuLTHoAkxOibzTH/1kiNcZOQeHK1kdLvDjxwE6ISQ4zd57rKcoKjP9OduCUhOwc
         r9ijkiDshIzN8J/yd1aG/B9w5byYs/y9KXisQrSyt22lpj/p0LBsgy1wQdOkaliHqyrl
         X8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740055790; x=1740660590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGQzctoPMra7CZnRhDd+GBJ+EQglU2BTH7uN9pFV+og=;
        b=QQmw+gq3Xs1GmYl39XSoRa4yxjjVqnLcuGwoxl7+w+hSdEudctShAykbeaTK5siTyK
         feMEl2LnXwCqqoww+UkyQ0E5+TPsEAmDg02VkYY0dmwJlNX4OeyOw0nhlv2BdKCITE1U
         fv4tEoUeoi7lDIhMhsIg0eT07kD3JWp5b5KziIQPfrY+tUfAJGydXqR5zwmO0fWrrI4X
         jLZZPqzc2fwGZ0QAf0glV4+dDHT/MsZUaiXe5Vh6MFO4hT6N0QkpbQW2pd4xUkhEbQhC
         J5zi20SHonF/JVH8OW7+c7Ji3O5FI1UH6QFiDrJqeFlZTV+8WaIq/eHHzcrjwSDsDsHg
         8+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWRjg5zsvlFsZ0xAfp3p1gg3M74OnHozs4t2JS02a+z/pq5BTEb/r+T/PvzyOq32JSEVrXK5ATnvEM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5njuy2v71zG95h524GX2bW3+A5bP1fWVS0Se2ms5eWnHTaiH0
	dYO4H+KBo1CANS7JUCxes+i1fGHfb9r3iey/aMZWBC2VOU1S4VpLB6lJAe/U8w==
X-Gm-Gg: ASbGnctAg6IImj8nDOd57qH1D9MIMUo5RxcvwhhqNvwNNqZOW0s70xevNL6u8LiDK0s
	zYZHklgh7U0xx78Foy4C3Q3MGg+xyKbnaT+UtlMX0YVz/T26OTEbYTCV/nuQi153cLDGy6qSl/v
	JT+nOfjo5NsWjdy0wXrIy8eZqhiS2WxdqTBMbJU1FCdxTAmVsKirK11opGXgHnIEusbukESJEHJ
	22AilhI8BJKK4dCN0d8d9t+gXDvSlkS+mKh0q0y2kfecKf0Rqc8VpUkjXoJMKZYysTR9aWKXjAw
	TpxB3Fgc15hF9iCIdpNj8zmIjFcIpoGBFLQNLwcAFYRxXtlKAMw2UdCK3nzgKciEhXy7L3sYt9g
	4
X-Google-Smtp-Source: AGHT+IHlLWXg238i354UXyM+/sG1T/vHX/9pFMMeispTebp/DzjNRPskaF9RVE7K12kzkT1Bp4tVZQ==
X-Received: by 2002:a05:6402:27d3:b0:5de:dd6b:a7bf with SMTP id 4fb4d7f45d1cf-5e0360be100mr23188790a12.17.1740055790063;
        Thu, 20 Feb 2025 04:49:50 -0800 (PST)
Message-ID: <8b448d38-30fb-4fbc-8a1b-778355bf673b@suse.com>
Date: Thu, 20 Feb 2025 13:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/hvm: make stdvga support optional
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250220095349.1823593-1-Jiqian.Chen@amd.com>
 <BL1PR12MB584900A8FB87513FC9D98388E7C42@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584900A8FB87513FC9D98388E7C42@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2025 11:12, Chen, Jiqian wrote:
> On 2025/2/20 17:53, Jiqian Chen wrote:
>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>
>> Introduce config option X86_STDVGA so that stdvga driver can be
>> disabled on systems that don't need it.
>>
>> What's more, in function emulation_flags_ok, to check if toolstack
>> pass any emulation flag that disabled in building time.
>>
> I am sorry.
> After sending my series, I just found out that there are v3 for this work.
> https://lore.kernel.org/xen-devel/7a0ee883-8542-4e17-adeb-9c1d83f58657@suse.com/
> And it seems that the v3 has no other implementation-related comment, just waiting for x86 Maintainers' opinion.

I certainly voiced my take, in reply to the v3 cover letter.

Jan

