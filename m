Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C397AD37FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010781.1388972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfW-0004Vc-VO; Tue, 10 Jun 2025 13:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010781.1388972; Tue, 10 Jun 2025 13:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfW-0004Ss-Rx; Tue, 10 Jun 2025 13:05:34 +0000
Received: by outflank-mailman (input) for mailman id 1010781;
 Tue, 10 Jun 2025 13:05:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOyfV-0004Sm-84
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 966250f1-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:05:31 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so42325475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:31 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d96fsm12189776f8f.7.2025.06.10.06.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:05:30 -0700 (PDT)
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
X-Inumbo-ID: 966250f1-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749560731; x=1750165531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gi3pPyHFEG8zx8avEDB1D0KqiD+y6jBLgk8k2E2GV7Q=;
        b=P7YeoU/q6PpmfCpu7+/mE1IQpoM5qmIJemFKGTbjpqv0Vum7OnxrvaLKos7lQ5kGpL
         6/sy2q5YNeAxSDIXZl7274nNvH5xIdXQe5NlTnI5BIzN+2lKyKEE8sr1YAbukw/60vzf
         iX6gTbu3Y9xyiafaKVuwnIJEv1IqcjMmNqHaI2YvmwijsUlvtz1g6342Qks3MRSHHo8j
         GdNBfvT7wvn1W/OVklzTBMWjTroRkoEmJT6AtQV9L4sukrQQPRI1UDTE72mkhqPNsz2b
         A01gS/VO83BTDGiW97z1NxMeoJb5UNecl4+eFA2L8A4gpetjMGKIJkMgUZU7jyjXm9fa
         2Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560731; x=1750165531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi3pPyHFEG8zx8avEDB1D0KqiD+y6jBLgk8k2E2GV7Q=;
        b=oPttckV6uhBA61IoJS8VDomNzfwqIwHrlsIllniMh1InvSE3T5LUA9HBc36t3RoZdH
         7FHKVY/4qhzUSn8QbqePigFnHnF3FC+uyMRQjvE81iN3O1myjJrDHUiXjXw9zf3V4WXK
         QYpwgf6274vH1ZycyoJyrvXDbGpdBue0SoVDL5R3nRRNuseqqMiJMCkPJcovgprYe3Hi
         FQItecgn9eX6Fec4VRgFDtyByyWgbPMPnCgZurTrJLGuII10tX4F3k5FC6/+bG3oC2Yj
         UhPNl5UsuWLtXWu050PqMdfG/I4oNhK8kSTt19uaECAgBbPrslxnbLJJGwCTJV2p9yUL
         Guhg==
X-Forwarded-Encrypted: i=1; AJvYcCX69L3uHhsOzxM7uTKhxhXyWnE+E1h2C8iVINPiOLlnfDGav/a2YwWPbOaEg4DLUyiKPGEDTHezI5Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNCr5FlZ72qESIgh3zwa15wxbbBieBsMSkcPvt0vgC2ozNlfRX
	8hGMTck21g6rLYnfu5GY14DiqPU8tnM51BI22TmnTB8isu1Z8HQaBXtgsL+5kp0Tiw==
X-Gm-Gg: ASbGnctsxDJm/0py4c8uNIOLp6AKZzDzkxok37JpsdCkJpsVKvDfTOfpSnfvZMlJJvA
	nbe/WTuDkIYpmddtm+3HNx+E9w+tZ5qiFxs1HAffR0iAqg0x88itc5XcWszFw3tADA3gBXiG3eK
	zn8fmWeQMbteC8uhu3Z+vBaqRI5yni5UO7DDmYxduQUtaHSPX3NdobI/RyAsRUlCsQYijxsIVJl
	II2SG30A46mQ42T37kXIHgpVdLsCU5FSl5IuBb8xh/FRgav3UZkLtTRP9y1kmhw/uy4c1s3ajT6
	VPl2rVTyLR8tCgVJAdrJsSgSM//bMNCD94An61Lbh+n1pfgfEiCMblmIVmy8MIdVKJkqwAX+utN
	Ti+TSgAG+EF2QbC2QXC5D9YTd2do6CZ/O2jiCmzZaN/4brihezC/m8usYAYhawKt6W19qYKVcls
	+XNCWOetMWyn33eg6ob55g
X-Google-Smtp-Source: AGHT+IGNGLafTRG/1OMOmz6DRYRAG40oF+vfbfglcbloBexFgE/l4sIwcaq+7D75ybgUcHMkGwdDCw==
X-Received: by 2002:a05:600c:3f09:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-4531cfe2d25mr29619965e9.9.1749560730561;
        Tue, 10 Jun 2025 06:05:30 -0700 (PDT)
Message-ID: <51fde0e2-abca-43c8-9cfa-734219431970@suse.com>
Date: Tue, 10 Jun 2025 15:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/20] xen: introduce CONFIG_SYSCTL
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
In-Reply-To: <20250528091708.390767-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:16, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> We introduce a new Kconfig CONFIG_SYSCTL, which shall only be disabled
> on some dom0less systems or PV shim on x86, to reduce Xen footprint.
> 
> Making SYSCTL without prompt is transient and it will be fixed in the final

Nit: s/fixed/adjusted/ ? It's not a bug, after all.

> patch. Also, we will also state unsetting SYSCTL in pvshim_defconfig to
> explicitly make it unavailable for PV shim in the final patch.

Even without the double "also" this reads odd. But it's also unclear what
it has to do here, nor whether what is being said is actually correct.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -579,4 +579,15 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +menu "Supported hypercall interfaces"
> +	visible if EXPERT
> +
> +config SYSCTL
> +	bool "Enable sysctl hypercall"
> +	def_bool y

Why def_bool when you already have bool on the earlier line?

> +	help
> +	  This option shall only be disabled on some dom0less systems,
> +	  to reduce Xen footprint.

This isn't overly useful (but possibly misleading) as long as the prompt
isn#t going to be visible, yet.

> +endmenu

Blank line please ahead of this one.

Jan

