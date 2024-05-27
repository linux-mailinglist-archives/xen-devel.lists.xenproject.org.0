Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084198D01D0
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 15:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730762.1135953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBaYs-0005Fh-Da; Mon, 27 May 2024 13:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730762.1135953; Mon, 27 May 2024 13:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBaYs-0005DL-AU; Mon, 27 May 2024 13:38:50 +0000
Received: by outflank-mailman (input) for mailman id 730762;
 Mon, 27 May 2024 13:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBaYr-0005DF-Jz
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 13:38:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 725cd2ec-1c2e-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 15:38:48 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5a89787ea4so1364184466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 06:38:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a631e324816sm27876466b.15.2024.05.27.06.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 06:38:47 -0700 (PDT)
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
X-Inumbo-ID: 725cd2ec-1c2e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716817128; x=1717421928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeNLZwyQvcwTIaVv1Yo57KS7N37BKKunue1q8dV1ijs=;
        b=WhEDnCBH4j4ahmz62FUJCLQeeoqljO81z21xOK3P7j404D7gTG0NrHWXLpXdH5JNDn
         GGF0luxVP6WBlD5xlplnw7qmU+9xh/IDKbD+VS2hPfvUOvoBCcmmX/JkCLIHZbWSJVxs
         BkPIA3ENYPuoCSLWWMgvpQDTulZVveTPkf+1Wa9FVnw4w9YPRXQScFyxkBkv4Nhd9Qon
         N4GYbYLFMj+AJh7VfXOyCFPE+i0esXiet08WTKZWzAELslubLceDechlHoHJQVMkZkHr
         IJXEMezo9kHlmd307XsKio3w1dFGTxSoB8mpQNIPKcJwtSEMiT/QqxagcfCjegBy+PXi
         YT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817128; x=1717421928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeNLZwyQvcwTIaVv1Yo57KS7N37BKKunue1q8dV1ijs=;
        b=KkArJBZPJhmxjDsO3oqWkcxkoE+OYzvKk0eCKOXKswc1owgIaafnfEVCHB7q4UfS2n
         E+oGnTIUmVKElpwobsHsaH6tgHG9tV7N1c7ly4DzBdjJni0GDR8NEIjRK+Cpvm2nOULQ
         mthuMbUM2ZMT6izANpnzmjE8nUsaVUWMLjdmqNbno3sU3M7pilr64eFxqrjNXOu0jAwC
         dShaKsxd5z1OMNeWicw7NTAwO0lDuVdyQm2QOnrKGxU8pTlE3Cui+BYIUEC8ri/r70dr
         802Ve54LVBI2hjucgvLCfXBi9W36HW0oVE6OwREzIlbVqoRVzCqiQl7fgm/Uhvm5ScD6
         rYEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKvR19cWbrCJy4QRyHy7z5XQBfX8uBOcycn58fRtsFIEKRvfqAYd4a/f6cTR4xAbVjIOiyiKU4I5GRZDSH+ZZcNyRHFuOpd896uEvHDtk=
X-Gm-Message-State: AOJu0YzKqv9JSN4P3j4H/jHYd9W5N0v0rbPeZYLnPsff4ie/0JYX9CPv
	OXTDIxSOyIG8ySCadfA0cL3ESNOKd0eEeNPu5AfEmy/V9DH6K+KzJPiUozMvVA==
X-Google-Smtp-Source: AGHT+IEwuuLl3W6kAbIY9pznGBgrGWXnNs0bEvw3yM4tN88TVO8dSE2qpL5jwgkOaNOrw0/++pgLkQ==
X-Received: by 2002:a17:906:390d:b0:a62:2ba5:7bc2 with SMTP id a640c23a62f3a-a62635aee1cmr545760066b.0.1716817127931;
        Mon, 27 May 2024 06:38:47 -0700 (PDT)
Message-ID: <930e108d-3637-4835-b4c9-e92da7f6d654@suse.com>
Date: Mon, 27 May 2024 15:38:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] xen/bitops: Implement fls()/flsl() in common
 logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-12-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> This is most easily done together because of how arm32 is currently
> structured, but it does just mirror the existing ffs()/ffsl() work.
> 
> Introduce compile and boot time testing.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with small adjustments possibly to be done on the earlier similar patches
also done here.

Jan


