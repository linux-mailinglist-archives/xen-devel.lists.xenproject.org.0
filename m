Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BBAD3995
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010947.1389202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzDs-000793-0j; Tue, 10 Jun 2025 13:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010947.1389202; Tue, 10 Jun 2025 13:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzDr-000773-To; Tue, 10 Jun 2025 13:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1010947;
 Tue, 10 Jun 2025 13:41:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOzDq-00074Y-AI
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:41:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bd43c4b-4600-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:41:01 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450dd065828so37236615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:41:01 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532056486dsm9682605e9.1.2025.06.10.06.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:41:00 -0700 (PDT)
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
X-Inumbo-ID: 8bd43c4b-4600-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749562860; x=1750167660; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MqFVYAcS2M41HQy6xFO9URHQlES9SLIDFSW476QpFTg=;
        b=K46xTP5mvyZsUCkPQx8fjJEpXcst9IuFpxyHsyiDvMM/xrcIAm+IswzgZHzJRsLiHO
         8//2B3UY+S0ixyJjPkliVilo4SyDiDtfXMq1ofZ9DabfpfjJvwseVLiTVSvd11V2OCWA
         iTs/Mf/gkzvSsEErAF/BpeDgaIy7zWP5Ape9+hw26Eq1M6BQENEDQFnBQJIdE+MyBPIQ
         bhtUCcKt2fU0LSBPcFba/Y6ge9SM+Z6vs7rmpF1NhbNKp2uohY1ciAx1ineHyIEwzODZ
         yo0zfE0mSkX8DoBqeAea1y8SN2FgnD3usQJeivv1rLIdMdwqOsmG5nkfFPo0l6u1Ed7c
         n5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562860; x=1750167660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqFVYAcS2M41HQy6xFO9URHQlES9SLIDFSW476QpFTg=;
        b=M/HFtGfmDzcgqnonIn+uyXSwDFAnVQFWG5pfFL4Z/35nTXTBdePF4Vwnw2NEVpOFy1
         B5lnyZ+Wj9g5zbsh/SF9ZDKOALfp8j0qRLasaf6nXmn7cHULxk1xPl1QWn+Tsh1gvnj6
         46I8y95vxAYYIUeOSXBXiLFVvTU2dnL7pSOgUgHHn35wDz095KgkLomh28rDOsNn0S1q
         JOiuqID1uv/QKL+zEVrvBRpo7vRwkZmAimSJdsH5a4cOraaoEhdF6JMBG5/4QdzU4vc2
         Rq3TY5Fgu3+Kd2qWCqYXtxbOeW/YpToVosXKRGS7tanygShipwlxBz7E5RNx47+LdNC0
         lZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCVXJUtIlh0lWfMOzzdgqYPvnf/YzFoHLskhD0xDTgyIwUiFOCJiquh182XCpRAmXOMSj/xxLB1TDb4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNrvG1G/YL/n7WJAfsVj5NNUuI/M2bNFrN1ENZNLbhCX69nkE/
	vKOl9EYufunwhQ4rs2KHGrXfXU8eEL8CclOSNrTN494lg2v//ZQR0oxShEDfaFnYiA==
X-Gm-Gg: ASbGncuFcPL6G/O5Tmv9ML9lqlsf+BujDRcaUm65zeY+cd7FcvO0ka8XSQBWeZsPnS4
	T6bV5UiLctYMDtatK3urVylr0hwy00ulJMSvQazicctNG6PX0/u20V8lj2DS87JwN6wA9OPadIQ
	KYEQU+Iv4BA0nORAhbY9y5xFn/lqGOpH2eBsSMCIjYa1pkCi/uBoxlGiw44a/KwS6QqlMzq/fkk
	NasC8HQTTDLxuh9U1TABk6r2ONpW7JXyl6fiqcUK0rL/gasMPxSJDPTcJYv50UPmWPpnq1Ul+bn
	ZbtYyyagwlXw9N5XVLEgbClAREelVWxzRG1uHmFmR1wNADh+EMm1VK7WJEGEzKcbu8ap94fpzo5
	ZtFKMIzPJ1m3UcWVfRU/33N27tad9MgAtLiiRw/SSM63xVxv0pbwBIiaqQwQAZTvixfIjKZ5yHC
	pACk7buIxpsVU5UGt74QiI
X-Google-Smtp-Source: AGHT+IHgxmAsnk5KJYrw2CprFMwqJIpMudpEzpie9yOj31Y9bGJb6edNrDez+n5mSnP98W2jUB9qbQ==
X-Received: by 2002:a05:600c:1c99:b0:44a:b793:9e4f with SMTP id 5b1f17b1804b1-4520143724fmr132064875e9.19.1749562860404;
        Tue, 10 Jun 2025 06:41:00 -0700 (PDT)
Message-ID: <1a660f83-5d9a-402b-af28-ea82311b37ce@suse.com>
Date: Tue, 10 Jun 2025 15:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/20] xen/pmstat: introduce CONFIG_PM_OP
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250528091708.390767-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:16, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -591,4 +591,11 @@ config SYSCTL
>  	  to reduce Xen footprint.
>  endmenu
>  
> +config PM_OP
> +	bool "Enable Performance Management Operation"
> +	depends on ACPI && HAS_CPUFREQ && SYSCTL
> +	default y
> +	help
> +	  This option shall enable userspace performance management control
> +	  to do power/performance analyzing and tuning.
>  endmenu

Why is this being added outside of the "Supported hypercall interfaces"
menu? (No matter where it's added, please make sure there's a separating
blank line ahdead of the subsequent "endmenu".)

Jan

