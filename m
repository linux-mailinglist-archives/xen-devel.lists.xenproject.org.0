Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F180DAB36AD
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 14:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981367.1367760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERwe-0002oj-0l; Mon, 12 May 2025 12:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981367.1367760; Mon, 12 May 2025 12:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERwd-0002nG-TO; Mon, 12 May 2025 12:07:43 +0000
Received: by outflank-mailman (input) for mailman id 981367;
 Mon, 12 May 2025 12:07:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uERwc-0002nA-Ov
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 12:07:42 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b336aa4a-2f29-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 14:07:39 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fc7edf00b2so5985832a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 05:07:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2193495bdsm610340666b.70.2025.05.12.05.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:07:38 -0700 (PDT)
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
X-Inumbo-ID: b336aa4a-2f29-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747051659; x=1747656459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzxqJRUchxduD2qliZWGJ4qreGyMGn/+ORIcwAXW37k=;
        b=RW0J5Kqv1gdZReoN+SpYawhu8fBAlvsG4Fc5ceZLz3uWE94bOXy+ITKfUzs0UaxMd8
         ToTLEYHB9hBMrB7q8c2j7merec4JFpC7/F+1T8YY+cnbZj7Vbb1mG4PdgZG1wLn14DZg
         pcokUsK/l2FmWGdAiamGyi0IKafiVa7oGfUb1/KiNTsGS7TrIUPcdyw0Iqx2/R2kZSsA
         ldB9POp0IW0FE5Nl4NbbhNC/6gIh+6i1v5PlsOxs7DLYYWZLN6VmE+EvNN03sMwcIhQi
         KZyYr5vBnrrs7V5edWMzT0rIY2fxB7VNNISXs13IBIWpVBzwlfEntBj8x9k/z2j/oXBJ
         8FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051659; x=1747656459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzxqJRUchxduD2qliZWGJ4qreGyMGn/+ORIcwAXW37k=;
        b=S1KgUI9I9UcBl8sZ2WspRMk2LPA5bOR9cdOpNBY6GvMXB5DclGHpVWRAvhEGoLA4S5
         RGkq5TAci7nq4IPBKLV1bft7d7a12wo8k9idhx12rJeXJ/KYhEerphaHsMHFDV6sdJbS
         iLthtJaXiCWZKcemdyoukRXz8/uHKZQ6ng93qeW5dIte3hditcKui/Mr5DwFlqTnPx5Q
         Ap7j05JmN+5ZA8M9s/RruWMC7XIAzAHOvXvM/Lmi+CicOsTEd/6SJaDRRSXmzgHqZTrm
         pD5SVeK7SoOdSsDP6/KOrtOnHXlnygLjbkp9w/1X8VdU2oQjfnyGYrBdaRaIK2jzfT7s
         vsLA==
X-Forwarded-Encrypted: i=1; AJvYcCVa+a17hDKw7fg+2KyS25ugrSUm3pp2ljXqulQ0tZ397P/1jkzESZDG8OT2fC/YN0S/cVG5/NVcK58=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0P7SwOsSDntJg3G8xwE7LrfwoO4Ar/6DoDiy8otnjdVAucU47
	cg4DNlcAsVlBQRoM1LtFICWj/HSnALs/Txf4P4+s/JBSieJEMNw+QNL9b26jAw==
X-Gm-Gg: ASbGncvXL9rv7QBdQ3OjFYW7tvUrmM03uE0azXQdBIerfr1rr+zVxMhYK1IoSRqlN1M
	NMLRpknwheqeljp8nhTgA9H9LHpQ+PV8bHn3YUACPXTul+3wHBnuxX7m9wJK2qOdOl5g5CDG1lq
	bLfycvc7uoGKRSnC0LoKUjErdRJ1zCRfBD2Ax4gPC5GI85ocSsDp87W/idWMxrQ9Qd9/Ut/iPJ2
	oeajYHITVpjqp7G20eC0IlgC8NzQrlFuCMn8CzirPSmJ5KEgTErPMRrZ6vQKw9LjEOuNJYa0Vsy
	qkIXaFEpPOuAEbXLVeU/hO8xEHarSN+Hn+c5nKuw7OJPH7tmSgRTSXsgO3uliyCZrCLFHlUSwUo
	w8sBkVGBu611IFDXqF3wQuXh2b8wvuUGexNlh
X-Google-Smtp-Source: AGHT+IFxXlGCW60sYk5MF6pA2kX62MOZYW8hlTyUK2tD7Plgkrcv9aMt/whiWuScc4EcepSOVvOpFw==
X-Received: by 2002:a17:907:72c9:b0:ad2:3637:805e with SMTP id a640c23a62f3a-ad236378505mr768201266b.35.1747051659080;
        Mon, 12 May 2025 05:07:39 -0700 (PDT)
Message-ID: <ebf314d2-2242-4eea-8cc7-708bca58555d@suse.com>
Date: Mon, 12 May 2025 14:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/page_alloc: address violation of Rule 14.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Victor Lira <victorm.lira@amd.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2505091625390.3879245@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2505091625390.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.05.2025 01:28, Stefano Stabellini wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> MISRA C Rule 14.3 states that "Controlling expressions shall not be
> invariant".
> 
> Change the #define to static inline to resolve the violation.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index bd4538c28d..9ee1506703 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2005,7 +2005,10 @@ static unsigned long __initdata buddy_alloc_size =
>      MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
>  size_param("buddy-alloc-size", buddy_alloc_size);
>  #else
> -#define domain_num_llc_colors(d) 0
> +static inline unsigned int domain_num_llc_colors(const struct domain *d)
> +{
> +    return 0;
> +}

Isn't this merely pleasing Eclair without actually addressing the violation?
The spec's last example is, I think, a good demonstration (sadly the PDF
doesn't allow copy-out). The violation described there, with a loop
calculating a value ahead of the actual if(), is even less obviously one
than the inline function here.

Jan

