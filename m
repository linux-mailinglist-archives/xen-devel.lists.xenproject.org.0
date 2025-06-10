Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9015AD3A00
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010984.1389252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzRI-000584-W6; Tue, 10 Jun 2025 13:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010984.1389252; Tue, 10 Jun 2025 13:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzRI-00055N-St; Tue, 10 Jun 2025 13:54:56 +0000
Received: by outflank-mailman (input) for mailman id 1010984;
 Tue, 10 Jun 2025 13:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOzRH-00055B-2o
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:54:55 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c6616ec-4602-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:54:54 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so4488068f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:54:54 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45209ce132csm142404935e9.12.2025.06.10.06.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:54:53 -0700 (PDT)
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
X-Inumbo-ID: 7c6616ec-4602-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749563693; x=1750168493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CfmlorMBGCI3e9/1WMR5uy55JP9PDKEUOiWoLIBq5yI=;
        b=SSSTkDBhm5OhPV1JYGLVWkMiNRr/BTzUzr2vyEVSimgJWcTLRmpSrnaISlA5D5FUWy
         K6+5Bx1qAnyZ7e9OKVZq9ioQzTWgjAuE+3QX0ByhoiRYbrbThBu4hNAl9rCz/aEW+Yk+
         eTLcCf8kkAJ8uNRGUxIeOV2AOJgUeKyvf4tc8MtFCx2UXBhgM5c4vGnBfMLCjbNduiaY
         TyXNt9NXhpEeW0Vka05jE4Yz2Zx0ZxuNQC7Hoqi3yYHUJOwCAK4P/+3rbcutlWogOw1q
         QOxIFACiXFP/6vA/9n3sekrrxRrNJubhEdTlWRaXGP/6YCG4PuWHG57uID13yNV5dern
         5MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563693; x=1750168493;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfmlorMBGCI3e9/1WMR5uy55JP9PDKEUOiWoLIBq5yI=;
        b=kqZkzk8PW+kBViNRNOaD5tiOiVsUa4tljfN2Nk0rupfH0CF779Nj6m9MJO5E6JGoyA
         3Jjgp4eZbl5j6hm1fhM9sYa8M0AdxZkSZCkU2R9iNqAf2W7OoztQndv+7y9Y8AiD9QBo
         Nx9ys4LmNAgjCkVi3L8G7UAGPxGzKPnBbYxQuvNLg2myfFMjaRIrrJtZyP2dOeh9RN9q
         Pr+EZ5x6gQuYNOCz5pOL3Tj6HDFCOaLMJjaYQUpqQowCgtCuiToxZnt2bjqZJ43vMVLz
         8BY0anVF0HP1rZt83DHNGc6BHQXFtHXoVi1VRCf98Xj2mDg4svRZ1l4JkQePXNy0xQ4N
         Iepg==
X-Forwarded-Encrypted: i=1; AJvYcCVWmuJ0o8MC84Oz8ag4faWKroaPR7Fs0WilM2zioENsdbY0npCEkcqWg9DGo8oIJY3SPV5g+IEcOmE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8MxmNYwmKJz3AWrltNllBmRf+JeymLHxERU9eg//0F1ukBFdg
	KxO8XUzVa/ABBl5rA6KtxuO5tOgilDg1wlcTlYlOqzObYNfZNAub916sigNisCJRRQ==
X-Gm-Gg: ASbGncuIykX3Tl0kMcowmn1ikiPibV7Ec25qwrX/2Tfb/HvtHvQ477KKBCON2sY6o9U
	d5ia1nYQDBIbqLAros+TS9iIIu1ofIl/tz2yr9JPqgoYIsnGPk6UDejQjIDj1Fpu2OqBbktcYdb
	+4GpYNr5wDEtXNqSZ6XoIKvELN1E3AJTjOCtMrVRQ5mv4jmoikZsfYIuod8DGLKmbzVxw2j6LEf
	vFjX1nKxnwptkGnDgbARMD5yxBO0PTYIGP4UCBRQPRypW/MwuhDOrnlgZowWjFY/Nb9fdoWRLsF
	m1ce4C0Qyu7/XCCUdTudREp3GHKT1MC2YsWN5QIR/ltlk/pzlSMHv8ttLt5GzMsUupdzDp0UR2o
	09/zhTo6JT8JFP0LHhKo4cgWqss8QVPjXaHkDC4hmnggggB1zsAFYVppJAuLOlhN9g4i1a+XyyN
	13GcjeUWTL0WGU/JLnnB5x
X-Google-Smtp-Source: AGHT+IGHQt+qzOX56YLMk6PTTA0XAfzGB5UWur8jH+qxDJUtniJ41QbtDmBEOs6jvwZI8NSLMAVkjg==
X-Received: by 2002:a05:6000:2913:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3a5513e84acmr3344834f8f.12.1749563693434;
        Tue, 10 Jun 2025 06:54:53 -0700 (PDT)
Message-ID: <b3fa4396-269a-4986-b460-00af0bd6d5ad@suse.com>
Date: Tue, 10 Jun 2025 15:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/20] xen: introduce CONFIG_SYSCTL
From: Jan Beulich <jbeulich@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-5-Penny.Zheng@amd.com>
 <51fde0e2-abca-43c8-9cfa-734219431970@suse.com>
Content-Language: en-US
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
In-Reply-To: <51fde0e2-abca-43c8-9cfa-734219431970@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Jan Beulich wrote:
> On 28.05.2025 11:16, Penny Zheng wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -579,4 +579,15 @@ config BUDDY_ALLOCATOR_SIZE
>>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>>  	  working alongside the colored one.
>>  
>> +menu "Supported hypercall interfaces"
>> +	visible if EXPERT
>> +
>> +config SYSCTL
>> +	bool "Enable sysctl hypercall"
>> +	def_bool y
> 
> Why def_bool when you already have bool on the earlier line?

It took me until the last patch to properly figure what's wrong here.
Whether "def_bool" or "default", neither makes the prompt invisible.
So you want to keep that line but remove the earlier one, for that to
be added in the final patch.

Jan

