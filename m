Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A86A22DA9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879556.1289764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUWv-0007su-GL; Thu, 30 Jan 2025 13:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879556.1289764; Thu, 30 Jan 2025 13:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUWv-0007qJ-CM; Thu, 30 Jan 2025 13:24:25 +0000
Received: by outflank-mailman (input) for mailman id 879556;
 Thu, 30 Jan 2025 13:24:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUWu-0007qD-3X
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:24:24 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84526289-df0d-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 14:24:22 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so1241448a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:24:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723d0c1csm1071079a12.8.2025.01.30.05.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:24:21 -0800 (PST)
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
X-Inumbo-ID: 84526289-df0d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738243461; x=1738848261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf5QowOgE0E3B/jKk8i3RWRVtqetY2O6THo3Hensm0I=;
        b=LYinb8F0022EV7maD7qhLqfKy84bqis6Hir44ebsuUk6BXYzvhCmmpLy1TN6AE9KkB
         Pyt0BmAuV0QJFi25rSdabSOkkJPS/+IYxSxXZ4kle17rLaDc+sv7QwQajyesugEJfsME
         w2LeJHZK6W243Ga8nqY8hI2z993jQRj77ZoAwYtWsPQ/ApjxODCnvLasuNrVu6Z85tGj
         Q7husEZ/CS0BV+GfyQpYZaEOSTcNqZ191Ehwt0vFTrgYlyqge2w+HlZNYXk0K8xcx0nG
         WRwRVWv5jGhL7LvUTJrL4OJMjNVQGlhgoiCZ//p/sAY/9eylpu3us24XpxJCdIwUu42n
         uFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243461; x=1738848261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vf5QowOgE0E3B/jKk8i3RWRVtqetY2O6THo3Hensm0I=;
        b=EcHzrGhIFB0WZf74fKQdFxpYw8FL1Z6LPRydOts0eVeZ6mA21HaFodniKpprlAtPsK
         d8UkaY2H+gGfoE2J+PC9zVxvLgfxw5DQSpCyCa6d1XyzqW/5lmb/icol2ERiHlSi0DbV
         ebU+WeXrsGFLPg3f2ufqkUgXExhrvZ2YW7PGdoRg/fRGqneFynoXWrhtkUoTGFboggQa
         pHcJwiZXTNULIJGFl4ZrjP4uW4N4N2XMHx8wnI+baWCUPO+u/S9giZ1PAjMsID7nHvbk
         M8VP0D+rnLPjZZ4iI2sQH0lJaMIiUqVCRmz3awlySqGda2qoAOZFQC7VpyJpQxpzZ761
         zIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBcxwFzOpBwjDrG0bSCeoekbB+5CVvya1KYzI1Q2lYMCZScuDNAJLaqemE57cikE/ce7cUyv3hEx4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIqMG4YNt1L007PV9y/I+oMdnBKwzPKxSX0GiFAH8uPb4XMEfu
	I/B2+8FVoIkq+/smrssPm8Tvf1Mf+BX1RqxDOAKshgjELktVkzhfmW+EWHQeVA==
X-Gm-Gg: ASbGnctl2S6R3YV0aBU3+9qZcItWnw4RKnPfFaBl+tD+wBJ6PXaYH+FIxetlL1jowDE
	SVcCkgNGHXDDijx2tOlShwurBpfobZT19su37KWAz8k4qVA8BwwWhIOpCSE73q/cqf+C86SGKTb
	s9XhBpjQi/jrf6AoGPtZ2omX+ZTiWUI5a+rKLhjpHpGhTvc75Gy+rXUuWRYeeZFla6mXbmQlVg3
	gqzJqQkvg3OWSLvB4fx5y5w1WezB7gyzUkG5IKOxYUh9BlsgOURJEDj0eudcf1B3U0bPzkIF2bq
	avQHJvZIjS9vxOepEO2VB9zD/Cqj5zNDxt445KNByNPsshgd7icLD0jVk6B9g0WIxSp3Y1yljog
	t
X-Google-Smtp-Source: AGHT+IFHavudSc7NX3QVay8UspMjCts8HZ3DrR5/IWfa3s284RXeHWhRn3rt+NmJy++jlBHEJxfopA==
X-Received: by 2002:a05:6402:42cc:b0:5dc:1273:63fd with SMTP id 4fb4d7f45d1cf-5dc5efec154mr6507887a12.20.1738243461437;
        Thu, 30 Jan 2025 05:24:21 -0800 (PST)
Message-ID: <c74d334e-6e33-4a58-bf94-936249244cb0@suse.com>
Date: Thu, 30 Jan 2025 14:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2025 11:19, Sergiy Kibrik wrote:
> Use more generic CONFIG_VM_EVENT name throughout Xen code instead of
> CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher level
> feature, with mem_access & monitor depending on it.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

I don't think this is applicable; my suggestion went in a different direction.

> Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Before considering to ack this, I'd like you, Tamas, to confirm this is really
what you had thought of. In particular ...

> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -37,7 +37,7 @@ obj-y += irq.o
>  obj-y += kernel.init.o
>  obj-$(CONFIG_LIVEPATCH) += livepatch.o
>  obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
> -obj-$(CONFIG_MEM_ACCESS) += mem_access.o
> +obj-$(CONFIG_VM_EVENT) += mem_access.o

... changes like this one look somewhat odd to me.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -92,7 +92,7 @@ config HAS_VMAP
>  config MEM_ACCESS_ALWAYS_ON
>  	bool
>  
> -config MEM_ACCESS
> +config VM_EVENT
>  	def_bool MEM_ACCESS_ALWAYS_ON
>  	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
>  	depends on HVM

What about MEM_ACCESS_ALWAYS_ON (visible in patch context)? Shouldn't that
become VM_EVENT_ALWAYS_ON then, too?

Further, what about MEM_PAGING and MEM_SHARING? Shouldn't those, at least
documentation purposes, then also gain a dependency on VM_EVENT?

Jan

