Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F1CB16352
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 17:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064121.1429862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8OU-0005dL-4W; Wed, 30 Jul 2025 15:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064121.1429862; Wed, 30 Jul 2025 15:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8OU-0005ak-0t; Wed, 30 Jul 2025 15:07:02 +0000
Received: by outflank-mailman (input) for mailman id 1064121;
 Wed, 30 Jul 2025 15:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh8OT-0005ae-Gn
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 15:07:01 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7c20890-6d56-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 17:07:00 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so2696872f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 08:07:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011bd1d5esm79048565ad.91.2025.07.30.08.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 08:06:59 -0700 (PDT)
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
X-Inumbo-ID: d7c20890-6d56-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753888020; x=1754492820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=djm1FzR+7nq49ntkNZWosF1T8zqfRbqvANeJLehYyMM=;
        b=faq8AG6Mr2oBzfryKkqpNiioVYFM/VNaEeYIgA5DXWXN8eWGJrI9qqCEBE4jZd8L74
         my7Dd3khE3qUZdyXecS4Bg8DkGkFfglNhVcbQIx3mbYQuJxH0yN+c7N7o0n0lAdUYyxb
         wKLsFVBKhE3RWulZR1jxr7d9ZLeKdFicvkFPHZ49Co9j+GeAkuNvKPfU/05BVqLiNdEy
         PjXzvScfnBF/7bM4RDLPkVIkox9PMQzcj6q4zOZTzung5nPGdpV3tc7hOO3iun/kpPh6
         TYgL7GIaVFFRPg9lH5P7TZSVbxv0lyOFPOS26/kOMs58igUuqqBdQ0zgoLqBC324nj48
         eRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888020; x=1754492820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djm1FzR+7nq49ntkNZWosF1T8zqfRbqvANeJLehYyMM=;
        b=R4yBWI0DyYeYl1D43sont9mMeCnFcT+2cTHKwGkIQG8trYP/iqe6to50gEM78Zq1B1
         jkgkxmq6ik/EOy7M4mKxpGpc2EpZ0+JJvnKpBiG2RNHxsejgKexsaeEffgajtSZ4YMjm
         SShRpgKWY6pBhk0AFtg/NMorihmGCjQGb+NH5UZIumVfOrZJOjQ8Z1zP4qOWDuTkTx6G
         W15x0qfHF+936Sqo9kWImfCYpoHHuLY1uaZQ5yTSu3g+ZoEXgCM5k3ZAv82samXcCxMm
         xylwe/bgDrGCNyB4V0x6fJPdYdqp+7NeWcvdKtnWAgZHQHITSv202maBptCT88M2qRzN
         YzJw==
X-Forwarded-Encrypted: i=1; AJvYcCVyclV94zK37+Aax1NkBS1yPanCM7B9rKCK+QeTI9b3Sw8jHbtEVNxukihkyPs5CGWvq/LTQeyeT3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+GE/TZr2ZCBQwL1FgzDPVLFgucuE6G1J8mGVt4Ku2FExybGkp
	opzHeWoSw7gaNS46vZVs7/BV12n2nw8YK9nhAE5gJwFF5Was4Lomqm7jFyZ45DM2lg==
X-Gm-Gg: ASbGnctqSxR7iNKj1Xp8SYHXdQ8l3wF+bacwPfXocBJreFP7DKvpQfSsrvMf8KO9/rR
	SGlskvRaCtKS/ipyCPazKBs9IlTKTvRAvS2L+NcZIajnAyXzc22mvHzc6aDkcv12Ruf+NuYuPR9
	+mkzyw7eOSWIyKWds4VW0IX6sv4Vz1Xh5lkddG3LqwqBWVvsN1WcDDQCVwmW2qP7vnaHjERJpIF
	2PD1bnwskFO0huLX94K+G9lRqp/qUmzbXOdaIy2BVzxiOQ5E26VUyEBptTrMmJjkACklaFhnXUK
	iKbucm+50iMLJtv+i95EmPe5pnnxA9PI4zm+JmboYs8tpEkBBBr//UEldiCRQG4X0+Mz5U/SpCQ
	XHjhAhgT1IoqjMyEDFf3esGW/u17x49F80AVa5B6yY9vko/Aqqaf/mk7XrMm/0874cpZAxxigSB
	aDnwBla7EDKu3Z//h5tw==
X-Google-Smtp-Source: AGHT+IEciqStmrCgXuEp72wT+tnKxOuUJjgXujE2RE90M/zsHkAUuTCk3JY2xHeoVOIaoPlC2zzk5A==
X-Received: by 2002:a05:6000:2586:b0:3b7:907d:41c with SMTP id ffacd0b85a97d-3b794ff155amr3059528f8f.35.1753888019792;
        Wed, 30 Jul 2025 08:06:59 -0700 (PDT)
Message-ID: <222ea3ed-8ce3-4622-90d4-763bc0fd1217@suse.com>
Date: Wed, 30 Jul 2025 17:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen: Introduce
 XEN_DOMCTL_CDF_not_hypercall_target
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-5-jason.andryuk@amd.com>
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
In-Reply-To: <20250716211504.291104-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 23:14, Jason Andryuk wrote:
> Add a new create domain flag  to indicate if a domain can be the target
> of hypercalls.  By default all domains can be targetted - subject to any
> other permission checks.

I think terminology needs clarifying here: What exactly does "targeted"
mean? Is that e.g. also intended to cover
XENMEM_{current,maximum}_reservation, which "target" a particular domain,
when at the same time they don't interfere with the targeted domain in
any way?

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -91,12 +91,16 @@ static always_inline int xsm_default_action(
>              return 0;
>          fallthrough;
>      case XSM_DM_PRIV:
> +        if ( target && !is_hypercall_target(target) )
> +            return -EPERM;
>          if ( is_dm_domain(src) )
>              return 0;
>          if ( target && evaluate_nospec(src->target == target) )
>              return 0;
>          fallthrough;
>      case XSM_PRIV:
> +        if ( target && !is_hypercall_target(target) )
> +            return -EPERM;

Hmm, for TARGET, XS_PRIV, and DM_PRIV we're now doing the same check
twice.

Jan

>          if ( is_control_domain(src) )
>              return 0;
>          return -EPERM;


