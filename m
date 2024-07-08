Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB95929CAD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 09:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755036.1163310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQiO0-0006A5-8S; Mon, 08 Jul 2024 07:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755036.1163310; Mon, 08 Jul 2024 07:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQiO0-00066x-5R; Mon, 08 Jul 2024 07:02:08 +0000
Received: by outflank-mailman (input) for mailman id 755036;
 Mon, 08 Jul 2024 07:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQiNx-00066r-SW
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 07:02:05 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb75774e-3cf7-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 09:02:04 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso42330371fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 00:02:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb4574ad80sm54991905ad.66.2024.07.08.00.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 00:02:03 -0700 (PDT)
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
X-Inumbo-ID: fb75774e-3cf7-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720422124; x=1721026924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fF013QJJ0j4nkMMKCuAVmP9b9onoLZQl2FBEXGhqX10=;
        b=LE91a7NkFWl5htVohbvnA7bAz4dX0MWdCpAfGsj83IMtMLE32+ZFfLlra0rO60lnpW
         NFXZoKmuFmmOPS89Iu1PG/pydfQ6zXwmRKgG6ZAmOUbBEaTKKrMAWD23do5l9Lj3B9ah
         OIUAV0udOpPtbC/jaPFJY/JmXXWuH36AF/YQJ6mfXXJcSPoTuODU/eSsLAshyLVdq+u/
         WTRXQotPmYa0rNSpNQOwn1+RttkDu9dKT5zlcvqv6PNJEYdKsOzExjHxa70IfMKGQRwz
         cQh19ueED7iaB9BO9AojXsR84FsYveroLmsQnixS/6eYfmqfBYyWSBAKU2TUjeR+qmaE
         9T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422124; x=1721026924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF013QJJ0j4nkMMKCuAVmP9b9onoLZQl2FBEXGhqX10=;
        b=KaeJlvBU0QbaTtEsoEerCYfFVk5zoSXukW5g1y1q/dFD3dz1ow2hRe9qUHFAY/oRBs
         2rvFK26g8BSJcbi3OffsIXbWcTbftopHzuSFYKr04jNGnAc/io045xByhxi7enRnU9wp
         p3qlfPDeXSRf0pLmwaBjmrGXvkKXSw3SM+I8jIfcDgNaAho52awKPCeLpmFwmW3cC7SJ
         VALETJ1MvtRpKd4nm250ptSdnalcvH/cHUDcaojbBElbdY/mrmR75asUqcdDlBsBlWmk
         j/zPilrAYPPKLeXS9cnXdUBW8bbuhBpi76YyYYQ5R9v4fZt+Lp8MeSgO5HjKuj8IKkJV
         JJXw==
X-Forwarded-Encrypted: i=1; AJvYcCUN6SmpK9Y6cD/VbZy8qx0Q1r7wZCTXeB6e84shRfYI3bLp0WFhSuIAaTA/jcCz7Jh6VzhXfjqrjuMxBGfPKxjYKUP+h1sP19NGdqHYUDg=
X-Gm-Message-State: AOJu0YxH/nxb1acGDbjiWrnFkafSBe9jur1TJwixJiMtFkURP0nfK2Qe
	LrAM4JYk9vcoYmv4sTpYrQYXAaihTi0snVQE5KAk4Z4IQOMC2BX//O0fgSdBbA==
X-Google-Smtp-Source: AGHT+IFRMplqelFK0g5NBhhso6AsIwe9Se0OkdfW33D78ZXdXH9YcqPNlG5U+se+5wpG/jhRjqItng==
X-Received: by 2002:a05:651c:990:b0:2ec:5172:dbc4 with SMTP id 38308e7fff4ca-2ee8ed8b7efmr83835061fa.12.1720422124084;
        Mon, 08 Jul 2024 00:02:04 -0700 (PDT)
Message-ID: <f927775b-fb9d-4a6d-8d12-6a9048c8bda1@suse.com>
Date: Mon, 8 Jul 2024 09:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 5/8] x86/domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-6-Jiqian.Chen@amd.com>
 <a02cea93-b04b-484c-b3e0-dd5f6823196e@suse.com>
 <BL1PR12MB5849DC624AE25635C4BFC417E7DA2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849DC624AE25635C4BFC417E7DA2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 04:28, Chen, Jiqian wrote:
> On 2024/7/4 21:33, Jan Beulich wrote:
>> On 30.06.2024 14:33, Jiqian Chen wrote:
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -464,6 +464,12 @@ struct xen_domctl_irq_permission {
>>>      uint8_t pad[3];
>>>  };
>>>  
>>> +/* XEN_DOMCTL_gsi_permission */
>>> +struct xen_domctl_gsi_permission {
>>> +    uint32_t gsi;
>>> +    uint8_t allow_access;    /* flag to specify enable/disable of x86 gsi access */
>>
>> See above. It's not the field that serves as a flag for the purpose you
>> state, but just the low bit. You want to rename the field (flags?) and
>> #define a suitable constant.
> 
> You mean?
> 
> struct xen_domctl_gsi_permission {
>     uint32_t gsi;
> #define GSI_PERMISSION_MASK    1
> #define GSI_PERMISSION_DISABLE 0
> #define GSI_PERMISSION_ENABLE  1
>     uint8_t access_flag;    /* flag to specify enable/disable of x86 gsi access */
>     uint8_t pad[3];
> };

Something along these lines, yes. How far to go is a matter of taste; personally
I'd add just a single #define for now. One aspect is important though: The names
you chose are inappropriate. At the very least a XEN_ prefix is wanted, to
reduce the risk of possible name space collisions. Whether to actually use
XEN_DOMCTL_ is perhaps again a matter of taste - the header isn't consistent at
all in this regard.

Jan

