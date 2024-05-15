Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CCD8C67A9
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722370.1126241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EwD-0005DS-Ai; Wed, 15 May 2024 13:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722370.1126241; Wed, 15 May 2024 13:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EwD-0005B1-7n; Wed, 15 May 2024 13:44:57 +0000
Received: by outflank-mailman (input) for mailman id 722370;
 Wed, 15 May 2024 13:44:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7EwB-0005Ae-N8
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:44:55 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f882467-12c1-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 15:44:54 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so130911666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:44:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1789247csm855446966b.82.2024.05.15.06.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 06:44:53 -0700 (PDT)
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
X-Inumbo-ID: 4f882467-12c1-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715780694; x=1716385494; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rsvZ4ZNwSL4ar7njQK2oEdaNIK9eyRQLP3Whn7rPoVA=;
        b=GjuHo9TD4DYAOaqTOYmxsAwnnwt91mD0cIA3U84P+6cdYfs1SJnKBgaaxqsnpLvSw6
         GweIAkpTn0c436CIlQEE/PxeOiZuzNaSif3SMyznapvNxUabc6UR1+kLlGPHklVxN6IV
         2BiRKcSFd7/+EuPn3l5ywDkya9d3Og14yWUOfWiNsYqhsp5xwbU8NJ+Eb+ASlMqlNxpI
         0ef3gAPXrLQV4OcDAL+DGqVq+myqIgbLRcVe+aD6+8w6F5PMe0419wKYzhH0gV1Gj+gQ
         m3cZCELfzWX5BjbfM9EM4grXJc5pXY6hWMjA3QZnAbIBr4SgVjmyjf/RKg528klhJLc7
         2P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780694; x=1716385494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsvZ4ZNwSL4ar7njQK2oEdaNIK9eyRQLP3Whn7rPoVA=;
        b=TNzuymiU8dlp0lcUzduV2eeD6d+lqLipA6+1sO1310ZkvDyavPsDzWELgqlZCBsxJl
         VRmZmhaxUVVZjSST7CtjCmIpuv2uUcvsWdyZk57GBsVXSuz1wD9t6WrU9NqN3qZ0FLS0
         ss/bZ/MDPS5NhlNWTHtaFEgAxvNIZjHw2ygYf06XlLhCXhm3lELZz6YjgMaiq0F/9UWY
         cx0rqoEQgwwTGz6aa5TzkDhtGoKbIAr1T91HDZHd3Z7Kg18Ujf796SaVYOaYP9mqL6ef
         sjJQ+OPqkMU0RBGaz8LXbJzAXWZ4TiyH521lWM3FL4DETxIwWxVqOZQsek2x4f/wHGcN
         jG6A==
X-Gm-Message-State: AOJu0Yz+5OrCoOL8AxOVucvNyfV30XTsW5gB7AyGDMgMsy8oC+RUXBWk
	el0g0Y1QWr2sN3TiSXChxUZHquu2T5rPwlNLA6KkqQSluGWptoA5gvFA68aneNhODZzej7D6j7g
	=
X-Google-Smtp-Source: AGHT+IFPl22Nm+eYub6HG43ApKZBKwINqmG8s00dYMo4fh8VMSLGuEUKyhUJpc2j2l3MpwplUmthEw==
X-Received: by 2002:a17:906:3512:b0:a59:a282:5dbd with SMTP id a640c23a62f3a-a5a2d676474mr1548369966b.66.1715780694006;
        Wed, 15 May 2024 06:44:54 -0700 (PDT)
Message-ID: <f58e140d-4f47-48c0-a1de-8aeeac436393@suse.com>
Date: Wed, 15 May 2024 15:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 05/19] x86/mapcache: Initialise the mapcache
 for the idle domain
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Wang <wawei@amazon.de>,
 Julien Grall <jgrall@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-6-eliasely@amazon.com> <ZkMkBrf2G5dQllHc@macbook>
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
In-Reply-To: <ZkMkBrf2G5dQllHc@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 10:42, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 01:40:32PM +0000, Elias El Yandouzi wrote:
>> @@ -771,6 +778,9 @@ int arch_domain_create(struct domain *d,
>>  
>>          d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
>>  
>> +        idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
>> +            l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
> 
> Albeit I think you could just use d->arch.perdomain_l3_pg directly
> here and avoid the local pg variable?
> 
> Would you mind adding:
> 
> /* Slot 260: Per-domain mappings. */
> 
> I wonder if it won't be better to just use init_xen_l4_slots() and
> special case the idle domain in there, instead of open-coding the L4
> population for the idle domain like this.

That would require changes to init_xen_l4_slots(), afaics, which I'm
not sure we actually want (for, perhaps, being more intrusive than adding
the two lines here).

However, with this I'd like to get back to my earlier remark regarding
the (further) moving of the mapcache_domain_init() invocation: You need
to touch this idle domain specific path anyway. With that I view your
earlier argument as yet more weak, even leaving aside the previously
indicated fallout that this further movement causes.

Jan

