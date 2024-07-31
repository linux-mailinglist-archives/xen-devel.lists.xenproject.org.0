Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBFA942880
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 09:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768294.1179068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4EC-0000Ps-WA; Wed, 31 Jul 2024 07:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768294.1179068; Wed, 31 Jul 2024 07:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4EC-0000Mw-Sm; Wed, 31 Jul 2024 07:58:32 +0000
Received: by outflank-mailman (input) for mailman id 768294;
 Wed, 31 Jul 2024 07:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ4EB-0000G2-RN
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 07:58:31 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad73adc4-4f12-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 09:58:31 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7abf92f57bso699372366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 00:58:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb80c3sm736491466b.197.2024.07.31.00.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 00:58:29 -0700 (PDT)
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
X-Inumbo-ID: ad73adc4-4f12-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722412710; x=1723017510; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mU1CcASOro9RK3Zq/mQFtcDdPcZIsk5HQAQqSy6H0EY=;
        b=belRqHHXj6NMdYf8BjIO5bDflftm8kda3PUhu473Q6GngPfNWJU192g3u49j+AC/aP
         bM0cgbxg2JMWAf6YXDG5ZtM4QizfjU41cxJ8r2KD383i9wCvb8+38PK83Zxb2p+AKuG7
         x76w+OaEJZyPnSKnC74Weuvh8KfPgTDkBMopZGZ6FHvwZNOQaGLFI8THGrR2CJiY8pLJ
         ECmfcdMxKR0TdLWjF58jc8DdN3p2vLbSBy0QvFPZgalueyW8+rprcsIMVZPg1pAPwEVt
         Q/HSZkg0jfobLBzsn1QSqtPc1gYEirJUWTMjiT6AN/JPUngwb0yDKpL1wFi9jLVoHQlV
         5vJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412710; x=1723017510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mU1CcASOro9RK3Zq/mQFtcDdPcZIsk5HQAQqSy6H0EY=;
        b=htlxPGhe0arirEAuC2gv+a9a8zV5MFj+p/53SK2OxsfAtXgMHibLpymLhwjRTLG+I/
         SCaUyoNeYMf1I6bWWftshYHLZSJmbQTVtkGUdINqrkRukfY4lJAz7dTpC8pxkM50sH1R
         PEmkifAq4MQF9HUJvT062h5AT8B1ofxxvLMhug3WyVAuReHxj89sjs49QV4mhUvtV8l1
         0WAfFrj6pFCBbHC7QX1SXQl4NyhdH40CCqdSRPMqRijqxf91M/jCbNrhQ1OEL9JK0ZCu
         Dxz988DC1Il8gIAdqAOazvAk42VDtWgtpS+Lym98CT6p5a87gzk4HhxdcjAv9CNi7CNt
         JKMg==
X-Gm-Message-State: AOJu0Yw4x4tdsV4jf6n/sL9lnY/zjQ7SDv8g1GQR6sUXYC77VgFU+Ahy
	+1ea2H38fbnP+t+JoU75R3tupLMm/E+D/Jg/Vypo8lUNIZfO45bn7N/5wVv5cg==
X-Google-Smtp-Source: AGHT+IF6kzjzEWRb0xWV+Cjmj+vUT0L4EfCXNRTGCAKVACpx6KQful5ZHF2lqOQRbIRQhwZbNEW7qw==
X-Received: by 2002:a17:907:72ce:b0:a75:1069:5b94 with SMTP id a640c23a62f3a-a7d3ffa3052mr1023665366b.21.1722412710369;
        Wed, 31 Jul 2024 00:58:30 -0700 (PDT)
Message-ID: <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com>
Date: Wed, 31 Jul 2024 09:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com> <Zqnswi7ihOhMxPsi@macbook>
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
In-Reply-To: <Zqnswi7ihOhMxPsi@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 09:50, Roger Pau Monné wrote:
> On Mon, Jul 08, 2024 at 07:41:19PM +0800, Jiqian Chen wrote:
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -323,7 +323,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>          if ( !d )
>>              break;
>>  
>> -        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
>> +        /* Only mapping when the subject domain has a notion of PIRQ */
>> +        if ( !is_hvm_domain(d) || has_pirq(d) )
> 
> I'm afraid this is not true.  It's fine to map interrupts to HVM
> domains that don't have XENFEAT_hvm_pirqs enabled.  has_pirq() simply
> allow HVM domains to route interrupts from devices (either emulated or
> passed through) over event channels.
> 
> It might have worked in the past (when using a version of Xen < 4.19)
> because XENFEAT_hvm_pirqs was enabled by default for HVM guests.
> 
> physdev_map_pirq() will work fine when used against domains that don't
> have XENFEAT_hvm_pirqs enabled, and it needs to be kept this way.
> 
> I think you want to allow PHYSDEVOP_{,un}map_pirq for HVM domains, but
> keep the code in do_physdev_op() as-is.  You will have to check
> whether the current paths in do_physdev_op() are not making
> assumptions about XENFEAT_hvm_pirqs being enabled when the calling
> domain is of HVM type.  I don't think that's the case, but better
> check.

Yet the goal is to disallow mapping into PVH domains. The use of
has_pirq() was aiming at that. If that predicate can't be used (anymore)
for this purpose, which one is appropriate now?

Jan

