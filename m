Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF9A6D814
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925240.1328116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twek6-0000qQ-G5; Mon, 24 Mar 2025 10:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925240.1328116; Mon, 24 Mar 2025 10:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twek6-0000o9-D4; Mon, 24 Mar 2025 10:09:14 +0000
Received: by outflank-mailman (input) for mailman id 925240;
 Mon, 24 Mar 2025 10:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twek4-0000o3-RB
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:09:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 079a089c-0898-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 11:09:10 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so27209195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:09:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd185c5sm115255595e9.15.2025.03.24.03.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 03:09:09 -0700 (PDT)
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
X-Inumbo-ID: 079a089c-0898-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742810950; x=1743415750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qFhwhbFs9CDBJnLyvZgac6JqmwAWzOgx6WyBqtexvrI=;
        b=NFZ6IKxoIWckrk9jozjzBTweZceKWYnYcff5QZGX61navhR4Cwm61FKlMqNrGq6JJJ
         hezU6hg0LiOS0C0JSnDcHWRUAfGg/uMQOdqqej3e91zU/9zAjI6EXVGJmW0e4Z8evEKD
         PVE11lAWS1FmtjtzleUoc056pmLEK9NjJUqZdziVJ4hPXlhKmzdDopIG4XgtHVvgsXkd
         OHrS1+CLRG1JkQlpjIyhLAD2VPrPgly+tZ1RTgy+W+XBvqONunrZlxRoEhDNxX5cAwIE
         oJIxVTv7G2YO0mQZG3tIzITuS2EqsmyVjETAG7Vyzrv9psPDrCAF41T6eWApWrBzTYtp
         Z17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810950; x=1743415750;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFhwhbFs9CDBJnLyvZgac6JqmwAWzOgx6WyBqtexvrI=;
        b=ZhVkHPjVNs/00QS1WX1CKLNwbW34b9SO1fVgvbee9cKQFLmqnB4h3IoGZZdH0WxhSU
         2xGM3zE4aLVOkOPAmuMT7yOpukEK/CwQlQVaSxqqFkNxAbDgW+vZ77AoggjMrJr83OO+
         4UUHwbVAMcSRR3cCQpbzoz6jWuA17Jl2vw7m3JwdwXVlg96B1ELkFGWhb37PTTpSUzqt
         fXlX9c2UFv1Ie8zwEPjaowLEtaZeAzAo7oEaSJq+xqKZU2uUTkvPsHLgV5BlF8JBRlOj
         2ohdHWMNkPUIjoRm+e0lyLgclzzHWoBuUa0qZN8VjrWCpchfZmiNaxPuGGOU1/scdmdi
         rYZw==
X-Forwarded-Encrypted: i=1; AJvYcCXVsTMWDwKQU+ay7+x7eG0UiFN1mf4zoKjqlU5ljran+8a25IpMjV9OGKVgQbHyr1SLPVgPSYG9C9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqdK+yOZsNnmtfxHhTVNYakLDPcn+iy0PB99JfJTRUepXZ/br3
	GCFfPD8Wp3fKIjwC325yuvMoC8+6hcn3noF+uHZ+7/RHlgIMNhXF3dBZEOtDVQ==
X-Gm-Gg: ASbGncsc4+3Uz2SzPP0iuDj3CWg0lI8NhSdHeAn1nJzV22GO10+bk9H9KNXruCX3D04
	p5dJz7TXxclz23uJVOVo86t0qDHdbv155+iZLAjS1bqY0RS812m3Bz20G5Uj7WJ2Ap5zUafdDE4
	GHpo6Ip1jUKH7NzhjGZ8KJdbA7/JmfUHQzRE0nPjkAwj4Q95HVrdbKkYG/SwiKL+JLpODfnjvev
	S+nJpu+JFlHd2eVK/h8KU6lLT++6FSASb1p5+JaMyy0zQcnvTui4qjvWI0/1vJdNbATfZ3Cmx6t
	BbrA/Ad5/zCoovbxIeWVSoBPW4Fb/24U4IhL8eDtZhOLPaulbziJs53q3cPrTNYzmiT9zVLRQjQ
	ke4jjxqjTFb2VK6+CyYZVd0h3tQTycQ==
X-Google-Smtp-Source: AGHT+IEwlgf8DEHlttVIXqZ22fCFAoy+t33rn1bYpV7zO19zWg4PuY95kLGjGDidmD7vdhBkvmyqZg==
X-Received: by 2002:a05:600c:4512:b0:43b:c878:144c with SMTP id 5b1f17b1804b1-43d509ee50amr115318895e9.12.1742810949833;
        Mon, 24 Mar 2025 03:09:09 -0700 (PDT)
Message-ID: <119cc90b-16fa-43f8-913f-8edf7371bbc5@suse.com>
Date: Mon, 24 Mar 2025 11:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-19-Penny.Zheng@amd.com>
 <18983fc2-08e7-40eb-b5d7-738e36a2a271@suse.com>
 <DM4PR12MB8451A85D3C1E9CAE59DE5924E1A42@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451A85D3C1E9CAE59DE5924E1A42@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.03.2025 08:59, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, March 14, 2025 12:33 AM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
>> <bertrand.marquis@arm.com>; Orzel, Michal <Michal.Orzel@amd.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Roger Pau Monné <roger.pau@citrix.com>; Alistair Francis
>> <alistair.francis@wdc.com>; Bob Eshleman <bobbyeshleman@gmail.com>;
>> Connor Davis <connojdavis@gmail.com>; Oleksii Kurochko
>> <oleksii.kurochko@gmail.com>; Stabellini, Stefano <stefano.stabellini@amd.com>;
>> Sergiy Kibrik <Sergiy_Kibrik@epam.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v1 18/19] xen/sysctl: wrap around arch-specific
>> arch_do_sysctl
>>
>> On 12.03.2025 05:06, Penny Zheng wrote:
>>> --- a/xen/arch/x86/psr.c
>>> +++ b/xen/arch/x86/psr.c
>>> @@ -133,9 +133,11 @@ static const struct feat_props {
>>>       */
>>>      enum psr_type alt_type;
>>>
>>> +#ifdef CONFIG_SYSCTL
>>>      /* get_feat_info is used to return feature HW info through sysctl. */
>>>      bool (*get_feat_info)(const struct feat_node *feat,
>>>                            uint32_t data[], unsigned int array_len);
>>> +#endif
>>>
>>>      /* write_msr is used to write out feature MSR register. */
>>>      void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type
>>> type); @@ -418,6 +420,7 @@ static bool mba_init_feature(const struct
>> cpuid_leaf *regs,
>>>      return true;
>>>  }
>>>
>>> +#ifdef CONFIG_SYSCTL
>>>  static bool cf_check cat_get_feat_info(
>>>      const struct feat_node *feat, uint32_t data[], unsigned int
>>> array_len)  { @@ -430,6 +433,7 @@ static bool cf_check
>>> cat_get_feat_info(
>>>
>>>      return true;
>>>  }
>>> +#endif
>>>
>>>  /* L3 CAT props */
>>>  static void cf_check l3_cat_write_msr( @@ -442,11 +446,14 @@ static
>>> const struct feat_props l3_cat_props = {
>>>      .cos_num = 1,
>>>      .type[0] = PSR_TYPE_L3_CBM,
>>>      .alt_type = PSR_TYPE_UNKNOWN,
>>> +#ifdef CONFIG_SYSCTL
>>>      .get_feat_info = cat_get_feat_info,
>>> +#endif
>>>      .write_msr = l3_cat_write_msr,
>>>      .sanitize = cat_check_cbm,
>>>  };
>>>
>>> +#ifdef CONFIG_SYSCTL
>>>  /* L3 CDP props */
>>>  static bool cf_check l3_cdp_get_feat_info(
>>>      const struct feat_node *feat, uint32_t data[], uint32_t
>>> array_len) @@ -458,6 +465,7 @@ static bool cf_check
>>> l3_cdp_get_feat_info(
>>>
>>>      return true;
>>>  }
>>> +#endif
>>>
>>>  static void cf_check l3_cdp_write_msr(
>>>      unsigned int cos, uint32_t val, enum psr_type type) @@ -473,7
>>> +481,9 @@ static const struct feat_props l3_cdp_props = {
>>>      .type[0] = PSR_TYPE_L3_DATA,
>>>      .type[1] = PSR_TYPE_L3_CODE,
>>>      .alt_type = PSR_TYPE_L3_CBM,
>>> +#ifdef CONFIG_SYSCTL
>>>      .get_feat_info = l3_cdp_get_feat_info,
>>> +#endif
>>>      .write_msr = l3_cdp_write_msr,
>>>      .sanitize = cat_check_cbm,
>>>  };
>>> @@ -489,11 +499,14 @@ static const struct feat_props l2_cat_props = {
>>>      .cos_num = 1,
>>>      .type[0] = PSR_TYPE_L2_CBM,
>>>      .alt_type = PSR_TYPE_UNKNOWN,
>>> +#ifdef CONFIG_SYSCTL
>>>      .get_feat_info = cat_get_feat_info,
>>> +#endif
>>>      .write_msr = l2_cat_write_msr,
>>>      .sanitize = cat_check_cbm,
>>>  };
>>>
>>> +#ifdef CONFIG_SYSCTL
>>>  /* MBA props */
>>>  static bool cf_check mba_get_feat_info(
>>>      const struct feat_node *feat, uint32_t data[], unsigned int
>>> array_len) @@ -508,6 +521,7 @@ static bool cf_check mba_get_feat_info(
>>>
>>>      return true;
>>>  }
>>> +#endif
>>>
>>>  static void cf_check mba_write_msr(
>>>      unsigned int cos, uint32_t val, enum psr_type type) @@ -545,7
>>> +559,9 @@ static const struct feat_props mba_props = {
>>>      .cos_num = 1,
>>>      .type[0] = PSR_TYPE_MBA_THRTL,
>>>      .alt_type = PSR_TYPE_UNKNOWN,
>>> +#ifdef CONFIG_SYSCTL
>>>      .get_feat_info = mba_get_feat_info,
>>> +#endif
>>>      .write_msr = mba_write_msr,
>>>      .sanitize = mba_sanitize_thrtl,
>>>  };
>>> @@ -808,6 +824,7 @@ static struct psr_socket_info *get_socket_info(unsigned
>> int socket)
>>>      return socket_info + socket;
>>>  }
>>>
>>> +#ifdef CONFIG_SYSCTL
>>>  int psr_get_info(unsigned int socket, enum psr_type type,
>>>                   uint32_t data[], unsigned int array_len)  { @@
>>> -839,6 +856,7 @@ int psr_get_info(unsigned int socket, enum psr_type
>>> type,
>>>
>>>      return -EINVAL;
>>>  }
>>> +#endif /* CONFIG_SYSCTL */
>>>
>>>  int psr_get_val(struct domain *d, unsigned int socket,
>>>                  uint32_t *val, enum psr_type type)
>>
>> That's quite a lot of #ifdef-ary here. I wonder if we can't do any better.
>>
> 
> xl-psr half relies on sysctl op, and half relies on domctl. So I'm not sure for
> CONFIG_X86_PSR, whether we shall make it dependent on CONFIG_SYSCTL

And indeed I don't think you can. That also wasn't what I had in mind (or else I
would have said so explicitly); I kept my reply vague because I didn't have any
concrete suggestion (yet).

Jan

