Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE0ACAA1F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002862.1382261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzzH-0001lV-Ge; Mon, 02 Jun 2025 07:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002862.1382261; Mon, 02 Jun 2025 07:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzzH-0001ju-Dp; Mon, 02 Jun 2025 07:53:39 +0000
Received: by outflank-mailman (input) for mailman id 1002862;
 Mon, 02 Jun 2025 07:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uLzzG-0001jo-P8
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:53:38 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b076f8a5-3f86-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 09:53:36 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-450cfb6a794so23244155e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 00:53:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bd8a88sm65111015ad.57.2025.06.02.00.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 00:53:35 -0700 (PDT)
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
X-Inumbo-ID: b076f8a5-3f86-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748850816; x=1749455616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G5t/BcSsovNKFXGoVpGtnl0Ugn4JwQoFP8yJ/1UIBg8=;
        b=av3aKA9UkJivY9WZsn0Fdice/nywjvTl0droCfiT/1qaHHBVBzuR3XkzB5C3rkkVXe
         MtNa7FF2PdXo9tIRjtQM70hTU3bY7Defk3qaxvdzTblQlQTulBOxTATL/gtOLWD6yzd/
         wnYOuauVAlEaR+sDUA2ks6N2zDfq5qZhf+rIJws5J5+ijRGS8YdoTgtOXXKAOvce7R/A
         mbdwnnc1jxjketDG0aMAs80BHjxXMeK+9z5vlMn4Ekug5tt7KzRrd8a0o+CRs+cT7hol
         CScvb46l/myRlylhsH15CQ4fs1ma49ESpOIgAvygKoPIW4eU6B0DZw7s+TzO7JZABmnZ
         6Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748850816; x=1749455616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5t/BcSsovNKFXGoVpGtnl0Ugn4JwQoFP8yJ/1UIBg8=;
        b=ulP63tzLCPLjyF6+KbSax49DDLbQQFdW7/NfFsBkyrp5weI3cNuWqpsLxvnikhb70R
         pBdUNzisOwmGkuHVZeYsJdab1J37IVZnrULYHw5VGfhF5vzTg30Ft/Djqk1IL+cPnh0M
         +BfG6BcgVD440hbx/4Nh8pwD2bPsXz/oijSUX8xyKN3r237IAbb/C+vFXwqjt/Affd4v
         BVvPmCmmfpACr9qAnfjCQKTDMzzXq2RAlduaMoZP6x+yE4XBPhoU6lIaZq1gsJ6fy0wq
         oP7yBoA+LS0ZzMIKb2cyat6Z2/jPukoZLn8XFRht1hnEZ1KcL2Z9NFauN6lPx3bbvX5H
         IS8A==
X-Forwarded-Encrypted: i=1; AJvYcCWETrUA+TQOm3oTh8t90u++1EQx5tb6CE1LeHy/qeIoKfmXfaBWx2flB1tqvKnxXzK6u4CnEiQOI1A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHwWoHcimrVOEASmvcMc5wDyNkxofPzbrNm2upeWeQMJzXeZEB
	0byCkskbkOw4cD0xbLZtxcAmQ4LelpL8AmydMDbyn0zCjN7bdx2L8+Cd5xCI/b/82Q==
X-Gm-Gg: ASbGncuyoSRIelhgSpiWw0Is2isi4uwXXTIvPWT5hB9oK80KTJonLqi04o2wderX4Tf
	M02pPip9Y1hFRaEeQZUmFB8R/QQdIVOqVICIcg3L8YeLUmMYrxdJYskaYqQoFJEUBt97boGM0uw
	JqKwoncWeBuF5lh5PU8/C3/+22KtiSGxK0vjgFHO2O8WkZ9GY+pwSGqxr3whsYr6kwQpFHSP5RB
	rAt1TxfsuzE1JXSKYxh0J9R+cRP4UA42iGIKR4WjvL425I3ho9zdOiLftSL4N1f8WvEXxPOZDGj
	E3ZqycLponi4yuH5oMXvy5LzoImI7iy4E+5QbAeQzDodr1DmrwtLudjvNHkowVfRK/TxLeMuu2E
	Gq27TPwCEGoiLGZrnEotsYi6lj+HyTq3mSsbI
X-Google-Smtp-Source: AGHT+IFWpQ6hHHQF5W905oHr74vystJJa0QS0nc+GjF36GSpbFY8vzPNRMZqL1vFTwFZOOAEvH4kOw==
X-Received: by 2002:a05:6000:40cf:b0:3a4:e6e4:6ee7 with SMTP id ffacd0b85a97d-3a4f7a9d580mr8482953f8f.45.1748850816223;
        Mon, 02 Jun 2025 00:53:36 -0700 (PDT)
Message-ID: <5f3de127-70cd-422f-a368-6c23d83c6cf9@suse.com>
Date: Mon, 2 Jun 2025 09:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-8-agarciav@amd.com>
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
In-Reply-To: <20250530120242.39398-8-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 14:02, Alejandro Vallejo wrote:> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -27,7 +27,7 @@
>  #include <xen/rwlock.h>
>  #include <public/grant_table.h>
>  
> -#ifdef CONFIG_GRANT_TABLE
> +#if __has_include("asm/grant_table.h")
>  #include <asm/grant_table.h>
>  #endif

This change looks wrong (or otherwise is lacking justification): With GRANT_TABLE=n
the arch header isn't supposed to be included.

Jan

