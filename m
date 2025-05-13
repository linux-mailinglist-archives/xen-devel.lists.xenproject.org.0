Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800EAB565C
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982857.1369211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEptp-0003SC-S9; Tue, 13 May 2025 13:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982857.1369211; Tue, 13 May 2025 13:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEptp-0003Ql-PN; Tue, 13 May 2025 13:42:25 +0000
Received: by outflank-mailman (input) for mailman id 982857;
 Tue, 13 May 2025 13:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEpto-0003Pl-LQ
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:42:24 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19a92d64-3000-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 15:42:23 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5fbfdf7d353so7500607a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 06:42:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad24085b44fsm527217966b.149.2025.05.13.06.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 06:42:23 -0700 (PDT)
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
X-Inumbo-ID: 19a92d64-3000-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747143743; x=1747748543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aciBqxnTTvo/SB1YxAjPCv3iLRqLC874q9dEnKOOInM=;
        b=TEngX1MHJQvcCl3Bv8OGMWI4lrPrlo/oaQAxT7jS4+wZci2rkWZNjI1I20ot9U+lQq
         uJ8wen5Y+NVD0efTY31irhKUEeIsNrIn9XYEh2yqseXLgr713AnByfdX3FAJaQ8LvxoK
         piFt4pRQg/kFUWLZef2g9CmRPVu8rAjh7LMJO4QslOHi54Al7V3p4potvFz5lMt8Eyj1
         1zPsS11piD2pC1Ai1RwxLYpWD8f1PZb9eaViM5ndfdmkJLlMQpfh5n0d0Jz7aXLP+I2a
         ey51yOM8NCY/j/I5uC8J9Jj7QeVnWe/BlmwgkhO3GMcyAS9C3CEc29rT97vJ6kMjqQTf
         gWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143743; x=1747748543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aciBqxnTTvo/SB1YxAjPCv3iLRqLC874q9dEnKOOInM=;
        b=Dk3RGvUxS0qYYBhqrB2X4P1/NVSu0PwD8jij3nhk0tZFIYn0JwWUhuJQYLN+bedGGp
         +Hq+QX6Asking0VlVfGn/1VbmN4ULFw8ad8ANeVkbEzhn3EKwZtogtOUVpStrHw5qvED
         jYbzorTCDGQ7Evmj6numZkpgGKkcPqusrSlGbUS/BzKZKSogvP0l5C3w20Fkx2tnyQjr
         7lRCzVvmji4eC/+SW8PvrMZQ4/F/biBlzoo8Y7pWIl31KN2o8ChzbRQtfbzmI+GYpfB5
         M2jl+JPFvFUFTaVNDJhAMGnPc0beObW2A8oCuOkCjKtFuq2zG/J4c1Di5XLaJC/mmpdY
         tk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmLYdVHtrwrHNmIX8e02EE47KLmUCoGNR3lrQUTq8dVjznv9vTJny/akLn8J3poKxsdkWpwn2sFeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/OCJB3AOqtLsNqDYXa2fFLfsGEt92f2uQRLJP3wcD3v2RKyLm
	PuQ3AfhAeKVjvMz3a1+hM1V5AYcMbUY5QtXNFLWW9os6FyvGpvBuRK0A6cD0Pg==
X-Gm-Gg: ASbGnctMzJPqPNNNHUCeaJ4HWNdDw6NZ69Gywzdo94y6sh0sheFmRNljVKGBZEhaheF
	88szYvuzzPAEte7GRB4NsuKfXyabZXIK3V8xNxqKBFAfBDsT8oTULMICFIp3D9z9+2hogCal0Wm
	/PzO/yeBZ0VhgomnEBMx1UxvPd4H5c2FC1/9tIk6wWtXmFgfUJZWxirP5CVGZBICOjP+YpAFRoF
	S+GIUPOWDFOctDLAIYt47DzAR4W1P8j09/O9xx3uuEQsGefoh9KVYHVCtFYMiY8PbJBuBI77LP/
	nOe+aqjgPQZ9amx+yCZHvBvq/2VKvBX8OYuejMu0V97y8CJjI/pz66how/SqsKvsPQKF97c9XtF
	sRF5aqHFy7skCvzcYprYrBj/wnZYD4LTewbLZ
X-Google-Smtp-Source: AGHT+IEYkZBlK8bz7t3DUVkQWcoRsd5JnCEV/Ck02NLHAPBnNAPb0Z8rb+4VGb5n26Y+moBfPczEJg==
X-Received: by 2002:a17:907:944f:b0:ad2:42f3:86e0 with SMTP id a640c23a62f3a-ad242f389f9mr1093437566b.27.1747143743224;
        Tue, 13 May 2025 06:42:23 -0700 (PDT)
Message-ID: <39eb1f57-fb2f-4c55-ac79-a6e81a1c5b40@suse.com>
Date: Tue, 13 May 2025 15:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/spec-ctrl: Support Intel's new PB-OPT
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250513124814.3500710-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250513124814.3500710-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 14:48, Andrew Cooper wrote:
> In IPU 2025.2 (May 2025), Intel have released an alternative mitigation for a
> prior security issue (SA-00982) on Sappire and Emerald Rapids CPUs.
> 
> Intel suggest that certain workloads will benefit from using the alternative
> mode.  This can be selected by booting with `spec-ctrl=ibpb-alt`.
> 
> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/cpuid-enumeration-and-architectural-msrs.html
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two nits: For one, s/Sappire/Sapphire/ throughout. And  then ...

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -85,6 +85,8 @@ static int8_t __initdata opt_gds_mit = -1;
>  static int8_t __initdata opt_div_scrub = -1;
>  bool __ro_after_init opt_bp_spec_reduce = true;
>  
> +static __initdata bool opt_ibpb_alt;

... type and attribute would preferably be swapped here, just like it's
in context above as well as for the statics you add to cpu/intel.c.

Jan

