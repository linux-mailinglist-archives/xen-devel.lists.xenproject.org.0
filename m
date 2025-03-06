Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC83A551AF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 17:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903908.1311847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqELi-0000sf-RK; Thu, 06 Mar 2025 16:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903908.1311847; Thu, 06 Mar 2025 16:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqELi-0000pn-OG; Thu, 06 Mar 2025 16:45:30 +0000
Received: by outflank-mailman (input) for mailman id 903908;
 Thu, 06 Mar 2025 16:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqELh-0000ph-Rp
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 16:45:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69341445-faaa-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 17:45:29 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43bc30adad5so6035695e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 08:45:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd93cb9bsm25040185e9.31.2025.03.06.08.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 08:45:27 -0800 (PST)
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
X-Inumbo-ID: 69341445-faaa-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741279528; x=1741884328; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hZM1NDtjNJH2k4fo/83kMUnlk1UDEcVAqpzEEEY50sQ=;
        b=I4SwzQc+n4WN5qZTrPHVeJF+EQvwp7BXxYnjY73yFTJIVDKrNtUL6AmKmb64bhTMst
         +RYuhsYmuTVq0kNsnQo+/krVtvqe29aXnUlMxt5U+upL2BWgpLgm8HuHaHA4v5bPaT4y
         ymxHDVE/rNXBqZ2vhsylvnDYIhFLqI5zairO3qoGFx1PGTy4vgUxYVb3I4u03XCmN8E2
         AUvkzpmNC27KXTygtv2JFtMw2C3pQhTZXj6NM9y4a6K+4J660eksF926poxODG2CdbeO
         n2FNHFO5FxcfsQTv+JtKdUmqlXcznhxweI4mPI3t4tK4rcTZBYmWamhq0XBGlc7rS9Cj
         zEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741279528; x=1741884328;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZM1NDtjNJH2k4fo/83kMUnlk1UDEcVAqpzEEEY50sQ=;
        b=wvq228apcl4OBBUzbNmb0aT0CjUAOOIm015ZQrntVtdtNH2CSpIoLCTParVDC3ysmG
         wHV8b0yTQyya92TN3PwcHgXm1PSoMyqpq9DVOIwkco/UOjL/OplLDDUwb8RD+7T1hLN+
         vyR+oareaX6xZXHfWsOiHsH7daI7aO/ZzRxwHEhdCCnO93pTkt5w2O8/tVWjZIIExVON
         qDZgVOWYM/e9cm0seEpEeNcK1N6Ryr/4TNqwaMD3vw0gd1lnt3eTb7AcJLGfMZQwdSiu
         nH5+vXvpmYXyuRbTl2uOC2n9Tyk1qn4kdNhqhD1rAKsuODMRH5sZ759r3wKYtkSP7QCK
         DMYg==
X-Forwarded-Encrypted: i=1; AJvYcCUi0bhNWwNjKyyfWFF6C28BIHSEmo9GSdVU0dpk3+vDgBRqOn3q9a7f7kvHP/ZDgXLXPt+IUya1iBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvEslLPxwi5dFF75eA0LK9vkhPg+arOpL5CVqP2yXGa0HOHMWi
	KVppSpRi57VMfj1dEa8HF2dXzmoCrrsJdUWZeRSsBvH8l4ue7PZx37FgnZCkVw==
X-Gm-Gg: ASbGncshMvy4AYIeY5tIczy8otoCmPBOuTDZO5jftQSAc7pW9sGeSFDE8RChgHHxKIM
	qO8sM6M+S4zc6j1A0hU0yMWf4nZxNHC2mmh8tj7tMqDMaRIdql/zx8nZzuByZrHVCwY+1u5ioih
	SoQqUvHFlytFYwxv8Fam6oJOVk59uXCmSXVrykVt7ol6Xj3/fORHSCVPuohWOJ5i64Xt3Ma4X25
	OYKmaB8iov2VYfp2qlRrfWQyQOB+/pIeEMDHXK2Ahm+O12LF3+PJ6yXrk6Q9vdIlFmB8oMSP+OY
	V3+1yWWWWfhOVvm/7OFhftY39CUYUBCn2xykR92t1oBLo1Co2UVZ5dhkrPp5ZhY5a9+6pWQa8gB
	to0vdE7PbIcJIXGOm99M6Yx4MPmW9sw==
X-Google-Smtp-Source: AGHT+IHK3x3ol8xs2q2xahv7EoH1YSMBTsfEootAile7JwEwjAYfC0JGj1Y04EXkCB2MsV+sE5wTxw==
X-Received: by 2002:a05:6000:1788:b0:38f:43c8:f765 with SMTP id ffacd0b85a97d-3911f756783mr6732928f8f.26.1741279528366;
        Thu, 06 Mar 2025 08:45:28 -0800 (PST)
Message-ID: <697601b2-5592-4552-b6e0-4366a55467e8@suse.com>
Date: Thu, 6 Mar 2025 17:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/msi: don't use cached address and data fields
 in msi_desc for dump_msi()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250306145733.99927-1-roger.pau@citrix.com>
 <20250306145733.99927-3-roger.pau@citrix.com>
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
In-Reply-To: <20250306145733.99927-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 15:57, Roger Pau Monne wrote:
> Instead compose a dummy MSI message just for the purpose of getting the
> delivery attributes, which are the same for all messages.  Note that the
> previous usage of the cached MSI message wasn't fetching the hardware MSI
> fields either.

This feels not future proof. There's no guarantee special IRQs (HPET, IOMMU)
would necessarily use msi_compose_msg() (or any open-coded subset thereof).

> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -1454,6 +1454,16 @@ void __init early_msi_init(void)
>  static void cf_check dump_msi(unsigned char key)
>  {
>      unsigned int irq;
> +    struct msi_msg msg = {};
> +    uint32_t addr, data;
> +
> +    /*
> +     * Compose a dummy msg message for the purpose of getting the delivery
> +     * attributes.
> +     */
> +    msi_compose_msg(FIRST_DYNAMIC_VECTOR, NULL, &msg);
> +    addr = msg.address_lo;
> +    data = msg.data;
>  
>      printk("MSI information:\n");
>  
> @@ -1461,7 +1471,7 @@ static void cf_check dump_msi(unsigned char key)
>      {
>          struct irq_desc *desc = irq_to_desc(irq);
>          const struct msi_desc *entry;
> -        u32 addr, data, dest32;
> +        uint32_t dest32;
>          signed char mask;
>          struct msi_attrib attr;
>          unsigned long flags;
> @@ -1495,8 +1505,6 @@ static void cf_check dump_msi(unsigned char key)
>              break;
>          }
>  
> -        data = entry->msg.data;
> -        addr = entry->msg.address_lo;
>          dest32 = entry->msg.dest32;
>          attr = entry->msi_attrib;
>          if ( entry->msi_attrib.type )
> @@ -1512,8 +1520,7 @@ static void cf_check dump_msi(unsigned char key)
>              mask = '?';
>          printk(" %-6s%4u vec=%02x%7s%6s%3sassert%5s%7s"
>                 " dest=%08x mask=%d/%c%c/%c\n",
> -               type, irq,
> -               (data & MSI_DATA_VECTOR_MASK) >> MSI_DATA_VECTOR_SHIFT,
> +               type, irq, desc->arch.vector,

We've already dropped desc's lock, so shouldn't be de-referencing desc anymore.

>                 data & MSI_DATA_DELIVERY_LOWPRI ? "lowest" : "fixed",
>                 data & MSI_DATA_TRIGGER_LEVEL ? "level" : "edge",
>                 data & MSI_DATA_LEVEL_ASSERT ? "" : "de",

To add to the comment at the top, plus taking patch 1 into account: If we
uniformly used the output of the dummy msi_compose_msg() invocation, why would
we even bother to log information conditionally upon what is in data/addr?

Jan

