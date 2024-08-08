Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B64C94B72D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 09:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773735.1184173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbxJ6-0001JW-4o; Thu, 08 Aug 2024 07:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773735.1184173; Thu, 08 Aug 2024 07:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbxJ6-0001HA-1j; Thu, 08 Aug 2024 07:11:32 +0000
Received: by outflank-mailman (input) for mailman id 773735;
 Thu, 08 Aug 2024 07:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbxJ4-0001H4-Fz
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 07:11:30 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e799b77-5555-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 09:11:28 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so774524a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 00:11:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2e5ed4asm343835a12.83.2024.08.08.00.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 00:11:27 -0700 (PDT)
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
X-Inumbo-ID: 6e799b77-5555-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723101088; x=1723705888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OIbBZ7rPq/lWNPoeKV3SIykU/mWcxqiwdGJ9AXQk8T4=;
        b=WKGqvA0emJxI0x1nqGXInFgppw3RXbsyJYAhE7a3zqlG+9BU2h4KmGSExqBAD+PimN
         TPx5qMXDLgZAKgS76VF45MYo3MiYIbneLCTFp04zA2+m1kHu7Mvoc3PApWzDo+LwjZjQ
         8hSO+yfQK7cnE884MGpXNT8qSh+d/okY8964Uv4HjWdOCb4TUYb66dH5ZkCsvNIoZn/w
         jlshzGrfDPrY3CpwIEXGGfY1PCAFpZbni4FdkEERQEKHNS4rvKPMkdZv4OqNL1UpRNG6
         kImOYLnnGjyQy1AD8JhE8N1iEwpsJuTgPn3IGzpdoyXxai9ilKofYyRDQSvz2Uy+2hKx
         7hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723101088; x=1723705888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIbBZ7rPq/lWNPoeKV3SIykU/mWcxqiwdGJ9AXQk8T4=;
        b=Fu5+T4uNu8hCd4r7F21tqRuMOn92l7RkcACfmor3OV3hvWp86BgH2Q+vesGuMgR46y
         VOhOTI79MsEq0AGLMVPFiC5lRMolxfVkiXXGtzOqe1/Cu1y58GkIIysyHmET7H3Gm+Gy
         6lxN6UzR+TxYvFVuvUWcsV39IbXrtAl26iVHhF8PfP8KtWccYQxftFOaiIxxXxs0+SZD
         KttiZcH/yns3G1vR0z0zkpMU934WMrZIQj8gDSG2cuqolc/0bp0CPyWRouZfFADM63FB
         uPC43jg1v3r22p5GIY2kdtxWc2qdJl2kw3eJ0hUNpEXk5YvNhH+30+v3Q5/slLZnP2qn
         rg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUooAUf9g8jTbTGbm+n5opxTeULufrjVO6l/hSB2dkQglxVk+oJMUT6nHplQsPfCW/GQwsnLzNhtG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy98rKVYNG2eXHXgQsde9EHS7rCtDasqylzGt2NKDpRNisVmAUV
	BKQAQ7+Eir04iIpmY4bAyB6tNkcl9/0c9TWrE2JQv1W8afvT21DJtXxY0eJ1RQ==
X-Google-Smtp-Source: AGHT+IEer2cc+CiMlWUWJFGP/fJ+qH/zZ6AS8HK4X+1hetHPA74wA1gweLE/fKB8gJxYahOQyn530A==
X-Received: by 2002:a05:6402:5206:b0:587:86d8:8b54 with SMTP id 4fb4d7f45d1cf-5bbb2182b28mr820282a12.4.1723101087951;
        Thu, 08 Aug 2024 00:11:27 -0700 (PDT)
Message-ID: <5e081ae3-25b1-48cd-8878-8efd47b57032@suse.com>
Date: Thu, 8 Aug 2024 09:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/intel: optional build of PSR support
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240801084453.1163506-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240801084453.1163506-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2024 10:44, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1162,6 +1162,7 @@ long arch_do_domctl(
>      }
>  
>      case XEN_DOMCTL_psr_cmt_op:
> +#ifdef CONFIG_INTEL
>          if ( !psr_cmt_enabled() )
>          {
>              ret = -ENODEV;
> @@ -1190,11 +1191,16 @@ long arch_do_domctl(
>              ret = -ENOSYS;

This pre-existing use of -ENOSYS is imo wrong; should be -EINVAL or -EOPNOTSUPP.

>              break;
>          }
> +
> +#else /* CONFIG_INTEL */
> +        ret = -ENOSYS;

This use therefore is imo wrong, too. However, can't we avoid #ifdef-ary here
altogether by supplying a stub psr_cmt_enabled() (plus keeping the decls
visible for psr_{alloc,free}_rmid())? Similarly for the respective code in
sysctl.c then.

> +#endif
>          break;
>  
>      case XEN_DOMCTL_psr_alloc:
>          switch ( domctl->u.psr_alloc.cmd )
>          {
> +#ifdef CONFIG_INTEL
>          case XEN_DOMCTL_PSR_SET_L3_CBM:
>              ret = psr_set_val(d, domctl->u.psr_alloc.target,
>                                domctl->u.psr_alloc.data,
> @@ -1257,6 +1263,8 @@ long arch_do_domctl(
>  
>  #undef domctl_psr_get_val
>  
> +#endif /* CONFIG_INTEL */
> +
>          default:
>              ret = -EOPNOTSUPP;
>              break;

Here (and again for the respective sysctl code) otoh I'm okay with the #ifdef.

> @@ -225,10 +233,11 @@ long arch_do_sysctl(
>  
>      case XEN_SYSCTL_psr_alloc:
>      {
> -        uint32_t data[PSR_INFO_ARRAY_SIZE] = { };
> +        uint32_t __maybe_unused data[PSR_INFO_ARRAY_SIZE] = { };

Remark to Andrew: Leaving aside the fact that the initializer here stands in
the way of doing so, the need for this (imo ugly) attribute is one of the
reasons why generally I'd prefer such declarations to live ...

>          switch ( sysctl->u.psr_alloc.cmd )
>          {
> +#ifdef CONFIG_INTEL

... immediately inside the switch() accessing them.

Jan

