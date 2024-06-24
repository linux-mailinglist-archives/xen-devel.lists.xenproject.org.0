Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D4915293
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746782.1153970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlim-0003bw-5l; Mon, 24 Jun 2024 15:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746782.1153970; Mon, 24 Jun 2024 15:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlim-0003ZV-2e; Mon, 24 Jun 2024 15:35:08 +0000
Received: by outflank-mailman (input) for mailman id 746782;
 Mon, 24 Jun 2024 15:35:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLlik-0003ZP-Ee
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:35:06 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53dc2a04-323f-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 17:35:04 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ec50d4e47bso29839271fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:35:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3d43f6sm63965685ad.182.2024.06.24.08.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:35:03 -0700 (PDT)
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
X-Inumbo-ID: 53dc2a04-323f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719243304; x=1719848104; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CS78ovLEa/SQa7ohVLpg6mTzt6qv6WI1dDrhccmUU64=;
        b=DDhguBWMUwOBICcj2cJKHUCkekZsrA5aGxEzUpi0UNykuv5jnRmknrMMILkt0v/5mq
         jxk5ZwRhO82rhpwQbjV0oYusAousbelKiiub0pFlnuWXAGICCrgH7QcaGxh6iNYrHTmz
         F36EkhJQ5WtKj00xccwyxDvU7Gc64RYuGZCJkfglWkjC4BC068AHevbT/Mrn357XlBRu
         /sJsa3OSSYcj1a++CCizmWHRaCY9eEmGzjbCpZxkEc3Ca8aKDiMq8AwehFuJJixVvgza
         yANcVqA99oysATkV1Lu+7d0ox4ibBx+w8+dqwgyXg3x456Ek/kHI3m1yji5H3ujkXVu0
         +a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243304; x=1719848104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS78ovLEa/SQa7ohVLpg6mTzt6qv6WI1dDrhccmUU64=;
        b=AarZIKyKhM7XvGXgXQrGmUcrc1fjvHAzAdWLUmCFeD7W3vpvR0s5jy/Bfe2lQnmDqd
         MgLVc1165uQM/v3+/dmW1MasQI8/J2VUvW7ZBdHc1utArchkMv3M4Bryuzv9hqTBdMqd
         dxj/Qej9eerZv6blKtNShJb4mKOBd8Ij9cYJME9c9Z+6Czs9kCvRcHsVQRvEmDdbZySc
         0OHec0XBiP+o207joL7ieC8nPGMEv2bflMXqW5nrdZbvQhBHuXhfd9cvBobD9AhIgm0o
         yVaQFbZ5OV4V1IoQD/jEqhgnsswQS3rVBUwb4XOG6Re5k6QIKgDnwHoVlf8Xpwrqo90q
         8cgA==
X-Forwarded-Encrypted: i=1; AJvYcCW5OW+DjBfeWA8+qRMOWOJ13RUcsOg7+hPnagC9copzlsEVU7tz9RcwzdtSJLv4jzAWP0C6eJnybyNPXbamihpHUXBq05yPGODmheIPWOU=
X-Gm-Message-State: AOJu0YwKBKV/WZJRG1P7eN47UN5MZaBTT/V93X3Zore1i3W1CG0VTWvy
	t6K4HLTHneM/Vpa2aWFa0qXbYqZso979jXahPN026sjcq2zuyUyjF5HnHCYIPQ==
X-Google-Smtp-Source: AGHT+IEzP+3tnQBOhW40jmkZ5vtfr25/aTIjkj3g7+sjZX59uKj8O/D4nKz4PrRMjxZv87l3UKpLfw==
X-Received: by 2002:a2e:b1ca:0:b0:2ec:5258:e890 with SMTP id 38308e7fff4ca-2ec5b2e90b3mr27955921fa.44.1719243303878;
        Mon, 24 Jun 2024 08:35:03 -0700 (PDT)
Message-ID: <52ae2abd-2517-4d73-97c9-7c156c981edc@suse.com>
Date: Mon, 24 Jun 2024 17:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 08/13] x86/vpt: address a violation of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <e26de71af72b51abd425f2e75f30d794e0ba46a2.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <e26de71af72b51abd425f2e75f30d794e0ba46a2.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> --- a/xen/arch/x86/hvm/vpt.c
> +++ b/xen/arch/x86/hvm/vpt.c
> @@ -121,6 +121,8 @@ static int pt_irq_masked(struct periodic_time *pt)
>      }
>  
>      /* Fallthrough to check if the interrupt is masked on the IO APIC. */
> +    fallthrough;
> +
>      case PTSRC_ioapic:
>      {
>          int mask = vioapic_get_mask(v->domain, gsi);

I'm afraid this is one more case where the (pseudo)keyword wants indenting
by one more level, to match others relative to the case labels. Sure, this
will be a little odd with the preceding figure brace, but what do you do?

Jan

