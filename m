Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD448A10CD5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 17:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871589.1282572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkDt-0008R1-Ey; Tue, 14 Jan 2025 16:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871589.1282572; Tue, 14 Jan 2025 16:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkDt-0008OH-Bw; Tue, 14 Jan 2025 16:57:01 +0000
Received: by outflank-mailman (input) for mailman id 871589;
 Tue, 14 Jan 2025 16:56:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXkDr-0008OB-Cn
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 16:56:59 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90e9c336-d298-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 17:56:58 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso54894955e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 08:56:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1daasm15679433f8f.93.2025.01.14.08.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:56:57 -0800 (PST)
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
X-Inumbo-ID: 90e9c336-d298-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736873817; x=1737478617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fsYkyPf0OJ11AWgZ7jqNzBkpW0COvJea9qX0Bwx3hLE=;
        b=RqXTicFbCj18E/vp8AU43JGFnkRRe8FD9SgTNee9SMZ5NZjvjwG1Of+gupbbU2iOQX
         Tjrw7EGQjRyR5V0WpHuGfjMSb4ycInR5CKvAufozoxbZZq8h9RqfWohu4bo27pIpIweJ
         yfvBANnkmX952bqciX4qSnuf5WXmlbh6uj0y8Y4Sp/3cJWN6eVYE3UNTyRN5BDZnjaJd
         +SPQOYXJfa3nBBlrBdoyGJyYz+9izFYq0dvh5AgI+JFwO3tsuDTgWMfb1zNWQTxI3n/9
         ataKxdynAMaUOvGrm4DtrgPG2hrrJD6EEkoLXSg362xwpawGzO2EKQtYMeyJkBbgGXM4
         QFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873817; x=1737478617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsYkyPf0OJ11AWgZ7jqNzBkpW0COvJea9qX0Bwx3hLE=;
        b=f+feyfJTy55v1QJBEHG/HcHh6t4+irH7El17/f0ABScywszcPNYCPexISBitce7e5O
         RDIcysR6tX3IRtfhchyYFDD+KEyrRbwywQoqLMwZkBq1wlSpYrdXFQO9NBrJg/8mr6xu
         NmBm3HEM61AgkGhtrNnsI802wO6CkXZXfu2Na2K4L5Jvk9XRV1grYO8AZuydToyQn+w+
         rRaxGWYiBjl7pz2MH3ttDwvVABi+ys4vcbtmYzCAGtT/CC2Iwoziw/E9z5Z1TQvDo8Pu
         hmUt5HKPyCKS/BK0FTuj7JreFZE7pD1vxm/h11i5IG0tTeXKUmkCG3LJJk9Hzw/Jf7VI
         Oq+A==
X-Forwarded-Encrypted: i=1; AJvYcCUDOHRCjfQBn0Q1AcCm4vw2RQPSSNhiUNEf6C5uj9nNirjKeKEE5etDslVXBZBwzGgD789nQ70aQhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy526ZIjiP3rUyiBil6mc5sDsnamHM+M2d9KgS6hbWRpJTDokWs
	X5PxXcbf+EbyWuUFaQYlvoa+tCTPbL7vbRS7XZTpk6r2HVxss5HB0cmSRvXu6g==
X-Gm-Gg: ASbGncurwjb1GO2uK92gROCG5DRWUBajL5MQXaVl5rCmgD1dPZFemf54i11OEIyhS8F
	rE+vqdcS3r5FrSKnknAovd16uk54ZH1CfFjXtg2MKSYrrtCmCwoTd/I0CB7xC8uK2YviVmR7rHQ
	sJCBvyVUjTboWSMa47ZBejWmTH4/4ybBHpvf1rY/2Zwc2GcEYkYTtpZBbk2EihRy0NcOMkhVYdd
	0ETMFxEzaGX5VBJ8KVbR984N76bt71jYubrwQ6xTh1QxrZHnmltBkONhKlfivyV7/6j89HobWT6
	Jz2l/+nDuqgmWhjOK26DJ5mDEjeLTUkldcA1H1I5+A==
X-Google-Smtp-Source: AGHT+IEYG1PkfV8jXB0AFC3HZkRpTziO2r6hZAiCX0quFY7kwBl5cNLw61gnz+EuVXqPBjbnR8XK0g==
X-Received: by 2002:a05:600c:1d9e:b0:436:8a6f:b6db with SMTP id 5b1f17b1804b1-436e2707c41mr204119145e9.22.1736873817626;
        Tue, 14 Jan 2025 08:56:57 -0800 (PST)
Message-ID: <f375f3c0-5b73-4eaf-afc6-9d394fc4346f@suse.com>
Date: Tue, 14 Jan 2025 17:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/10] x86: Keep a copy of XSAVE area size
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-6-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-6-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>

This needs a non-empty description to clarify why this would be needed.

Jan

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -638,6 +638,7 @@ struct arch_vcpu
>       * #NM handler, we XRSTOR the states we XSAVE-ed;
>       */
>      struct xsave_struct *xsave_area;
> +    unsigned int xsave_area_size;
>      uint64_t xcr0;
>      /* Accumulated eXtended features mask for using XSAVE/XRESTORE by Xen
>       * itself, as we can never know whether guest OS depends on content
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index af9e345a7a..baae8e1a13 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -550,6 +550,7 @@ int xstate_alloc_save_area(struct vcpu *v)
>      save_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
>  
>      v->arch.xsave_area = save_area;
> +    v->arch.xsave_area_size = size;
>      v->arch.xcr0 = 0;
>      v->arch.xcr0_accum = 0;
>  


