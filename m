Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DEFA85604
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 10:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946774.1344552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39KN-00059O-M7; Fri, 11 Apr 2025 08:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946774.1344552; Fri, 11 Apr 2025 08:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39KN-000571-J5; Fri, 11 Apr 2025 08:01:31 +0000
Received: by outflank-mailman (input) for mailman id 946774;
 Fri, 11 Apr 2025 08:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u39KM-00056v-LL
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 08:01:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cc01b29-16ab-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 10:01:29 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso17487255e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 01:01:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f235a5d82sm75805575e9.37.2025.04.11.01.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 01:01:28 -0700 (PDT)
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
X-Inumbo-ID: 2cc01b29-16ab-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744358489; x=1744963289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lu64Erf+648NVzju654VTmfDRq6mfsJwRG7nC3WwIHA=;
        b=MqQmAGE+O9uPepD8EieFUHua0hQM3X61Ej5ewRCD+fsmdmvuKUlxepH2LT/JM69Ezo
         Fhe9mSVfDxQb0WCfJnvFJ2IcS2SVBDMxTz1h/5ikwUnvhhKgMH/2s8yT4MwaCksgeSXj
         dtv6X6x3cj1ifOfYJHlHYRE6iKbdf6MxCVyPUTefabF7g8jpEQG2EtkaiZ/d5ws3P0Em
         0ygSGebZUHmp49iTU/lQ+6IZ3Oj56KDB/RVosXtSLt6TaPoNsFfImoq3ulyEm3V2trFK
         ogLKmIOSQUc3VuMGHVtnDwqvomNCmniy2BjT5RuqQQeDqa72Qlh1mtVMqoYd2up/0xE1
         UAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358489; x=1744963289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu64Erf+648NVzju654VTmfDRq6mfsJwRG7nC3WwIHA=;
        b=d0o80N8vAXQdmm3KQsM80SXzcqkvC8a6hLwbyDFIbHKjLLHYHf92HcyNMooE0YOZ8R
         EE3KwMRLN7hJX2xdnYtuZ7MhGGasw+8S6DGiAg2maagljLfa/AhV/xset08LOBvvfGBv
         FtzixdvNhFKdB9BGFEqMl7p3kwEmBL5/Mnoywj7ray28n+C7mFD7AzYrwrvLpSFuKDiw
         DsYx5T6bhht87IeIYPLdJSzjNjQnXOLSsXNHM7Kmgswh7L6xsQA5rHyqDF7Umby+cKbu
         HdKT//Dz8MWpBi2mVBWb221aC2E4wH8ouOVlNaOmgfjVPRJ0lCXwtYAXFvfR0ExBDtg2
         KK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxibzDt0qHHfB/iYmkTcOv+9HhQ2aKbYtcfx8v6jSHBA6v22l/+XtqRVNxzY4Xppxt1xMt/50DiFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybWewsXRhHQAqbvuGmj+94I0g1ueXDgLGfNFELmmSoYlX7PnyT
	wu8oESNByIksvT5Tm83PdEFnoy5OjmJ8D7BBEDyR5RdaVwcppFunNC6K/8cJ9Q==
X-Gm-Gg: ASbGnctEZwl7cTgh45++jZ2Z7Zpn9e4OM7GaPxbmWKsszxi1+rsc7Gp5jtXUyEG8skB
	CZ8b5PwKR8wqgcBull1y3HL2fWDuAiUfeZZ3z9dYYgir+2Sry1PpuaPuHvBUFuLO2ts6VM28bu/
	ol067fnxUe2BSCjHnxxYrjHKq62le7EPLQDVA08GSGrrGMLuQODTrcKf0cAXZLPCWLQWpSwdemn
	vsRjYRrQ3NxcMz50OheWRSeygnyxKlXKhqjMYq/dwUADUnt4vo/jBgg4ZPN83p1FWlNtO6WpsC+
	9ZYmxXrrsjYR2viLm+vOTh6re3CiY0UPPaB6zTeco+8tD9Y3mb5mLnovfTNnTWxygZ+g+LcAdJf
	h8+vwYVuZBMsgQa2mt+U23QbYmg==
X-Google-Smtp-Source: AGHT+IG9gUIl6VKUba5pNGxfPHqNp1F2Hpe/YULC2czINjPcNl/17tUJTT8veXG+GJticH+HX3qvbA==
X-Received: by 2002:a05:600c:1546:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43f3a9336e6mr12763145e9.1.1744358489047;
        Fri, 11 Apr 2025 01:01:29 -0700 (PDT)
Message-ID: <7d6e0b95-e6f3-4ac2-9a1f-adda3f301116@suse.com>
Date: Fri, 11 Apr 2025 10:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com>
 <7e89babb-ea6f-4434-a90b-19c2d12cc58d@suse.com>
 <BL1PR12MB58497FCC952CDEE7BAEF0688E7B62@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58497FCC952CDEE7BAEF0688E7B62@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2025 04:54, Chen, Jiqian wrote:
> On 2025/4/10 20:40, Jan Beulich wrote:
>> On 09.04.2025 08:45, Jiqian Chen wrote:
>>> Current logic of init_header() only emulates legacy capability list
>>> for guest, expand it to emulate for host too. So that it will be
>>> easy to hide a capability whose initialization fails and no need
>>> to distinguish host or guest.
>>
>> Before I (maybe) look at the patch as a hole: When you say "guest" you
>> mean "DomU" (which is a common pair of synonyms we use), whereas when
>> you say "host" you mean "Dom0"? The latter is not a common pair of
>> synonyms; "host" generally covers the entire system, including Xen and
>> all domains. See e.g. wording that we use in XSAs.
> Yes, guest means domU, host means dom0(or hardware domain?),

We're less strict about that latter distinction - in most contexts
dom0 == hwdom is assumed.

> I will change my word in next version

Thanks.

Jan

