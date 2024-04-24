Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C950B8B088E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 13:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711343.1111244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzb3N-00022d-7a; Wed, 24 Apr 2024 11:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711343.1111244; Wed, 24 Apr 2024 11:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzb3N-00020Q-3l; Wed, 24 Apr 2024 11:44:45 +0000
Received: by outflank-mailman (input) for mailman id 711343;
 Wed, 24 Apr 2024 11:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzb3L-00020G-Ia
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 11:44:43 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0985c20d-0230-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 13:44:41 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so5949266f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 04:44:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n2-20020adfe342000000b00343eac2acc4sm16906527wrj.111.2024.04.24.04.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 04:44:40 -0700 (PDT)
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
X-Inumbo-ID: 0985c20d-0230-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713959081; x=1714563881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zTGkN2qP04dPEtnLqWKlC3X2JGpHT5+c9WESnQBrOmU=;
        b=PlnHr/2oL5iqknQy3HI6jdl1wkTZxcecZkuDlLwbHhG4XwrL8b4XkbYX3Gh02N8BHd
         GsP4WTzKF4/KfsbhPVPWnozuwvsrXZkC5CCqSSLyb8ty6Kn1vvwgMyhcGgXPz3GfQcXL
         gOnT0b0OrBwXKsHan+DFD8/5SrR/s8XLuFcxdI/JFBvS1Nnr59c0YEjE4giHv6XOMN2Z
         Hf8utBE2KMmiKDfmzOyLAq51zFG4QXQ3HT+sppoS9gKoxBlI5CQ35pgPU4J0UFAgBCju
         OGZO1lnIJGMkVYkxpa9IAJvHp1dNeny5THiQe5okBBcXX+LWENzyqjaLGSkJ1E7GXH8j
         pLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713959081; x=1714563881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTGkN2qP04dPEtnLqWKlC3X2JGpHT5+c9WESnQBrOmU=;
        b=Yg7TNVbS9IWD7U/zQ5RbHMdbPvO3rBWuniZii60m3Qtp2VmvVi9l/mVpS7Hyp7eD7f
         CpE3BjTjX7vOomZkMXLVPxxw0t1dJF6FamF31qtqXCsDtbYgLZx7BKeATBVgrvpZvrWH
         T+sYIkfBFeHwJWoR4HER7IRR0DNrpVXJ0RyUTYFin/dfm2cxzODPQDzzYUFf3WFCVihO
         DcYssAls8UubcpZaL25kY7Jtaw4N8Vha/jl2UhG8rJoZH7hBE2lArhvl66cmXw/iex6P
         k8N1eAJ7eaWkSKvZSheqDdNdQ0FAMK/VGf2pl9bfx/+u17SdNLe2qKFlY7hc2fTvL+um
         c+mA==
X-Gm-Message-State: AOJu0YzYJ3WNwjJQkiGbMlIGIkJZHgHMYqcc377lxO2yU9tomD2M28yO
	2hiVuew1e9d92KHmT99jTzYZ7oSzIgMVL4Fu0lGwL4djamfEpNv1uMt4uV7g6WWyoiSaFMPlr14
	=
X-Google-Smtp-Source: AGHT+IEIQFheWOCOPc5oN5rXPESlSHTFQxundruWQ38lm6xMIVbaSJI+rbTSUmw0AXHB2FuYJA4pPQ==
X-Received: by 2002:adf:b34a:0:b0:343:772d:9349 with SMTP id k10-20020adfb34a000000b00343772d9349mr1260704wrd.50.1713959080990;
        Wed, 24 Apr 2024 04:44:40 -0700 (PDT)
Message-ID: <9b2d08c1-2bb0-4142-9722-0d2045041f2c@suse.com>
Date: Wed, 24 Apr 2024 13:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/shadow: correct shadow_vcpu_init()'s comment
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <fea51839-4405-4330-8493-c544b9edf035@suse.com> <ZijZldtvQ_e1h6ys@macbook>
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
In-Reply-To: <ZijZldtvQ_e1h6ys@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 12:06, Roger Pau Monné wrote:
> On Tue, Apr 23, 2024 at 04:33:09PM +0200, Jan Beulich wrote:
>> As of the commit referenced below the update_paging_modes() hook is per-
>> domain and hence also set (already) during domain construction.
>>
>> Fixes: d0816a9085b5 ("x86/paging: move update_paging_modes() hook")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm/shadow/common.c
>> +++ b/xen/arch/x86/mm/shadow/common.c
>> @@ -99,11 +99,12 @@ int shadow_domain_init(struct domain *d)
>>      return 0;
>>  }
>>  
>> -/* Setup the shadow-specfic parts of a vcpu struct. Note: The most important
>> - * job is to initialize the update_paging_modes() function pointer, which is
>> - * used to initialized the rest of resources. Therefore, it really does not
>> - * matter to have v->arch.paging.mode pointing to any mode, as long as it can
>> - * be compiled.
>> +/*
>> + * Setup the shadow-specific parts of a vcpu struct. Note: The
>> + * update_paging_modes() function pointer, which is used to initialize other
>> + * resources, was already set during domain creation. Therefore it really does
>> + * not matter to have v->arch.paging.mode pointing to any (legitimate) mode,
>> + * as long as it can be compiled.
> 
> Do you need to keep the last sentence?  If update_paging_modes is
> already set at domain create, the 'Therefore it really does...'
> doesn't seem to make much sense anymore, as it's no longer
> shadow_vcpu_init() that sets it.

I thought about dropping, but the "any mode does" seemed to me to be still
relevant to mention. I thought about re-wording, too, without coming to any
good alternative. Hence, despite agreeing with you that 'Therefore ...' does
not quite fit (anymore), I left that as is.

> Possibly with that dropped:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

