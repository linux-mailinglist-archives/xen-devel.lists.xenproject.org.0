Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF30AB38760
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 18:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096475.1451170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIh6-0007Vl-QX; Wed, 27 Aug 2025 16:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096475.1451170; Wed, 27 Aug 2025 16:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIh6-0007TL-Nm; Wed, 27 Aug 2025 16:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1096475;
 Wed, 27 Aug 2025 16:08:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urIh5-0007T5-BY
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 16:08:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08faa168-8360-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 18:08:14 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb731ca8eso1114915266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 09:08:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe4937a15asm1030536766b.115.2025.08.27.09.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 09:08:13 -0700 (PDT)
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
X-Inumbo-ID: 08faa168-8360-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756310893; x=1756915693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LxQ3Ssrs/UfwpKo/uQBWRpaavXzwUx9k2rlSk7x3sm8=;
        b=XwSnRRorVLkAl3N/1v+9nu763hMYXVlFcAlPaz7stjLZLNd1cIjIwTI3JLvIM1qxf8
         Pg7x2QuzGpH4GIl5sosuwG74iE+lGxUsm8oxfwpQXjvaigNBqXevC1mjUEKpUN49jZ5j
         pobKIV2SXVq57qcUiPydw0rz5G+H886AunrglBwqBXfbZGNg4h8bmskHytCShR4cZTr/
         tWmFa3wFYGJDoVLN6ncxStt5rzzHF6HZB+NR/tMBGswB9OXNKvitiGI9Gvhc4h5x9Ft3
         mihAWESNIJ8KvRtJ6k3svQYvnKKotL+XrGJG0DTA//lB72wALTmkuH8ARNJvTUOG99Vc
         6ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756310893; x=1756915693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxQ3Ssrs/UfwpKo/uQBWRpaavXzwUx9k2rlSk7x3sm8=;
        b=BCgZVGYzb4AJdj+h0IOr0I9+5ClIp3LBhbKemjATEtdO/r/57CAlvl7NFGoGYgBrnT
         5NfMoGcQdcaOg37iyO0LztIStFqsEonfCGNCkxfo99UHNxY11Y+wmD616+ut0MdGgOaB
         B8y2LjH70UzPW7t2sgmnnbd39CX5MnOm5IVDH02ir01sQjQ4y9rp7Y1QtOCq4k5OCBI7
         +6R/VcxFKLdOH2XWHhMEEXKehQjnrPtmQy5j9+sJJmN5iWTO3jkKPkgVRa/LGC37gAbj
         DBq1Kts9ns0ftE9A/kzfFJPs15TQT74qEAytHQmUoNVw+BZLb/Y5/CVH9pO5IArEo441
         3lTQ==
X-Gm-Message-State: AOJu0YzlIwmK/hyqKrCniklHRi8ETkdXBtcBMNFs5TKf0zt9bBCu1HI7
	AJ00CbmWJwWa1Cp+//PCidYlS0Enn/N/+yxSsl4TjI20tPeDoWP4Bm4TR+RjKam99g==
X-Gm-Gg: ASbGnctfVyTpr8lu/IOzb4tq5/LT3QGKC9PqCD8OzYDtBryRkHbBEO+92aX660XHfH4
	QYdJsj1d4Sz/usjuEcejdWNFU7WKq3FpSSjBH91CkSzjJSij+GmkR+TeEBD9bXM2bHmbyHBDSPt
	RcpXLX05DX2acZlYFVeSemdHuKbHufI4JPg3+JtIyTlx0ILNLX0QBb0xBj780PbLrIzTPMPuUFw
	DNPbGRqAxD5mjJ2L5BO5ojEE1EXNMtQkWBsixhZF+fBjSMayEBKAa/EkQtzW30hl/Hg2QSIJXGK
	m5bXx/Bi03TGq++KmrHIN/bKD/1OPfwg3XxbucXTHy6jlbt2U+UXv7HrMCqOGXJacOYQ6AfxUuh
	VaFO52U8lDyhM+ctQ3NqeqafLlEI0oQJq1pfzjGBCt8dNia8tO2qcYqJYbnWPRK9x2l19Y1/gwM
	OjIf0zWK0=
X-Google-Smtp-Source: AGHT+IFGl/JSC5eTtebcxyiXtl2zIhYG2bL2U3Ba3LoDAv7Ko7eGtN6Mx1bPIxL3zXk5keFH6L9xIg==
X-Received: by 2002:a17:907:d8d:b0:afe:a121:c466 with SMTP id a640c23a62f3a-afea121c81dmr699514566b.18.1756310893412;
        Wed, 27 Aug 2025 09:08:13 -0700 (PDT)
Message-ID: <427b81a1-9220-43da-bbcb-ff0cc7a38b73@suse.com>
Date: Wed, 27 Aug 2025 18:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-14-Penny.Zheng@amd.com> <aK8rC7CLd_7Z9sC8@l14>
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
In-Reply-To: <aK8rC7CLd_7Z9sC8@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2025 17:58, Anthony PERARD wrote:
> On Fri, Aug 22, 2025 at 06:52:18PM +0800, Penny Zheng wrote:
>> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
>> index 02981c4583..eedb745a46 100644
>> --- a/tools/misc/xenpm.c
>> +++ b/tools/misc/xenpm.c
>> @@ -38,6 +38,13 @@
>>  static xc_interface *xc_handle;
>>  static unsigned int max_cpu_nr;
>>  
>> +static const char cpufreq_policy_str[][12] = {
> 
> Is it necessary to hard-code an hand calculated size of the literal
> strings? Can't we let the compiler do that for us? With this as type:
> 
>     static const char *cpufreq_policy_str[] = {

I think it was me to request this. Your approach has an extra level of
indirection (perhaps not a big problem here), and requires runtime
relocations when building as PIE (maybe also not a big problem here).
The 2nd const that's wanted is also, as can be seen, frequently
omitted. Overall I'm generally striving towards using more efficient
code also where efficiency isn't of primary concern, simply because
code is being copied, often without looking very closely.

What we may want to do is bump to 12 to 16, adding some leeway and
making calculations a little easier.

Jan

