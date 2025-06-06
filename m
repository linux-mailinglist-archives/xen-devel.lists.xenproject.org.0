Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24106ACFD1D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007920.1387092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQv7-0006vi-1U; Fri, 06 Jun 2025 06:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007920.1387092; Fri, 06 Jun 2025 06:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQv6-0006t4-V8; Fri, 06 Jun 2025 06:51:16 +0000
Received: by outflank-mailman (input) for mailman id 1007920;
 Fri, 06 Jun 2025 06:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNQv5-0006sx-4t
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:51:15 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2c2ff6f-42a2-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 08:51:13 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so1029123f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 23:51:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236030780f4sm6166245ad.51.2025.06.05.23.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:51:12 -0700 (PDT)
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
X-Inumbo-ID: a2c2ff6f-42a2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749192673; x=1749797473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lM+ixva8RNUICoRA6RVAaDbs6O4yD/Fhumlo8hSYTfA=;
        b=Oiy3sOmNL7WNxxxqKOjE/ZBbASqI+sEldnlrKjXIgvm7PMrOP2k+YAzCfB6ONQXX5g
         jhDzQXKlyAodpUsnKdauDMZtfuuBc5mQgHDvN8yMz4w8U/DH6faVb1sPHIhcDOHpWL3b
         nSw8ZofmdIDVOttsFAeeWvYbbF0PRrOS2QPvbfrY05U2hlgQNw1CVkacmPLfqb+bqjr4
         uWvvFPpcBzIUEb7wSfI9IafVf7Gi6kk0kLiFDWm7nNWUJtWodLJwF2CFCx1BgBV3zzNV
         61c3MUTrd9OuJ/Z+/s457Wa+eJ/3CV4AHEbPyicygv3ayVkQ1icYvxkA6u5lfgM9uhMA
         DhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749192673; x=1749797473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM+ixva8RNUICoRA6RVAaDbs6O4yD/Fhumlo8hSYTfA=;
        b=sNto3eHaJ4aCePP3eD+GuySdgq73onQz05uAzsXeBqUpCEfT9DraFxoNJ/epGiLbOW
         vsIK3YqR5CSjUPkUkngQpBO+yen8W8ddztguG43w/1nAptfW4AvGapMrJC3m/fz+H4ul
         V4UPOo4H4kXHq2DkGzZA7KLWCM83mv4G5UG/xfNHZ1gWta+IfddIFyo5TZiI+3rxzX4O
         9UIManP3N70O6ozhysugxWc7dGzx90h6hLNNTRHFiISW3QBiAoPqRM3O4siumZ2H6Xr0
         58L4HoAeeQjxGEu3QPIusXr0RhxnUZODe8SffEBHQ6oUmiI3JA3YHEDQoVDVfprhUYtH
         R4rw==
X-Forwarded-Encrypted: i=1; AJvYcCX5Jiy1/CKM6sfBBYflzEUBos5Z2hKDy77qfFUlDXB3a5NZ9U4xs0eps4k/ulZTYc+10mePAbmnEhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxpMSm/T0G2jUQD84PWJmpoN8iCehjd1j3oh38tpLdGXW2y2l9
	anQBJRyRqFAKn2WBTg9AKU9nHhgd6b57HlW2VtsGyh6pMaI/VkMHmNP3G3MDnKrkvg==
X-Gm-Gg: ASbGncvlTenPlNA5n8uIsuVAS9rKBkbeMeomzyETXuKodTowtLUDutaZbTuX7d8nNrg
	sCqMn4v8qAH4GSho42DCrkj8DiGX5L+Xl0bL12KvBeManAk/XxNaDzjXylEz0BXjbKRhl7pKtiQ
	Gq/WT2iARb5s/i8zdEQku9tOT6tVMe4fyO/Y9Q2TYXdmmHTRrILhGIWf73sc1bXVwhHiJn9cOMi
	TQBqQeeQrq3p1rt+2x4in9x0krCO8VQM6U+e3iR0RVrbd37KfVY8jEfuNXpyT2CgDEouskbkYeJ
	IEI+Hunudo8inZbWZFJaHs2BnpfUcjHH2q69xzo2DLCwYMAsG9ct1NmRcS9KQLCF9DMsHxEMIWB
	Kw5ChrVAXzzQ3gcOwcHVDpxWs6lNJzESNncHbEAE8DGsiHtQ=
X-Google-Smtp-Source: AGHT+IGUFBFFUWfOiRsXf7z52Y74JvrWfpNC2dyqAAnm0XW6dEMcEmFSYcaByG9rKsZQPNP5CqsFzA==
X-Received: by 2002:a5d:4dcd:0:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a5319a7a59mr1533197f8f.40.1749192672737;
        Thu, 05 Jun 2025 23:51:12 -0700 (PDT)
Message-ID: <38104467-fb7e-4aa3-9c78-0f9bf23183eb@suse.com>
Date: Fri, 6 Jun 2025 08:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] xen: Clean up asm-generic/device.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-2-agarciav@amd.com>
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
In-Reply-To: <20250605194810.2782031-2-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 21:47, Alejandro Vallejo wrote:
> --- a/xen/include/asm-generic/device.h
> +++ b/xen/include/asm-generic/device.h
> @@ -1,14 +1,20 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * This header helps DTB-based architectures abstract away where a particular
> + * device came from, be it the DTB itself or enumerated on a PCI bus.
> + */
>  #ifndef __ASM_GENERIC_DEVICE_H__
>  #define __ASM_GENERIC_DEVICE_H__
>  
> +#ifndef CONFIG_HAS_DEVICE_TREE
> +#error "Header for exclusive use of DTB-based architectures"
> +#endif
> +
>  #include <xen/stdbool.h>
>  
>  enum device_type
>  {
> -#ifdef CONFIG_HAS_DEVICE_TREE
>      DEV_DT,
> -#endif
>      DEV_PCI
>  };

My objection to these changes remains; as a generic header it ought to be what
that attribute says - generic.

Jan

