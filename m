Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925D90AEF3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:19:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742272.1149031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCG2-0000cR-K1; Mon, 17 Jun 2024 13:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742272.1149031; Mon, 17 Jun 2024 13:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCG2-0000ar-GO; Mon, 17 Jun 2024 13:18:50 +0000
Received: by outflank-mailman (input) for mailman id 742272;
 Mon, 17 Jun 2024 13:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJCG0-0000al-Gl
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 13:18:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fa33631-2cac-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 15:18:45 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57c7681ccf3so5059607a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 06:18:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm6378848a12.22.2024.06.17.06.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:18:44 -0700 (PDT)
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
X-Inumbo-ID: 1fa33631-2cac-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718630324; x=1719235124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ty2WRfswxNJCcX/10HNUqpmpOI5m+4BDAmERYC3WGCU=;
        b=CEQS1FlF/u0z3N66zq5YL6OCJ5pKA6hkFqP/9uYBgSRl5ryR/zEqLaT0LeQkIdOETV
         1Y+fbUFHg9iWVlAVTTzx6GuhoRJbEXVMguUy+HesPE7pOUwJoDOkjQBAVJPRRSXKcru/
         NERBdIwF4qTUu6rnFPdD6Le6aaocDAIe7i2MOVMAaqpj+OSi4Ugeuv2iyI0Sasx759Sk
         Txg1CdEooIpj6ZtFqrE2GcKJ1FeGj2CVO5FhGB8YuJQbxS18OFgCB77muPiOQUG8R+We
         Gbs758eKaFs2ODwienDJhl6DYUNEt8waaSfcZWfAQs7U3zxYBH4nH45QISMQGbOveLZZ
         4QvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718630324; x=1719235124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ty2WRfswxNJCcX/10HNUqpmpOI5m+4BDAmERYC3WGCU=;
        b=bJQI1/fvlcYHLUYCq1R2Y1+gmF4h9gIKgZPvsKag1xW2tbfZ+6pAMN8KOXmDi6vO9M
         lA5ond5piPsvvNJ0gtUfGh0PtsE9J8wxfmnlMXJsbON02vgCsRKtc73gRYdx7MJqLZm4
         tSkv0weEQigyiKFDe+Jvmtikaz42UXKsBUepdJcE+hcQqNhj1WJNGJcYwbaN/NAh1UtW
         lhL6TUMxGp4UV5zS1dcOxGSkP24kzcXB1hnhK/SYA/8+yQFVx6LZQVO+eNgXd6LpRh8W
         aOvg44hiZQIX8BrdAPaxzhuyXlR2jFvOGuCCpLzj+8jBJl1lCgMVtFFITGiY7BlCspvT
         SFdA==
X-Forwarded-Encrypted: i=1; AJvYcCUHk58529zAJei/oXocRl/oI8T0I6eReMSZUu17t6jdWrW/y3hSgwoHQA1coi528uxB7shCC/jW71IUGaxk6RRndaAz+ynadPLavJEpXOE=
X-Gm-Message-State: AOJu0YzOya9G1opM5ahwIyggAZrdZ9LxDodslmHhieVVQhGGnl+rhgUn
	m9o+02PIT7xE+mtfowFEvVNmynCgjn0kR7eVlnt1QoRupqDuJdio8bT6xfG07w==
X-Google-Smtp-Source: AGHT+IF30vTGhiqW3bTL2c40ag/cE69HhbA370NHPjO2R6HRjbdIPGak5cF7P/8SiPIk2z/Y0MLo/Q==
X-Received: by 2002:a50:9348:0:b0:57c:73a7:da08 with SMTP id 4fb4d7f45d1cf-57cbd67e4ebmr6648911a12.21.1718630324406;
        Mon, 17 Jun 2024 06:18:44 -0700 (PDT)
Message-ID: <f92fc38b-aba9-4f8f-b95c-4723049523d0@suse.com>
Date: Mon, 17 Jun 2024 15:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.19 1/3] x86/irq: deal with old_cpu_mask for
 interrupts in movement in fixup_irqs()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-2-roger.pau@citrix.com>
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
In-Reply-To: <20240613165617.42538-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2024 18:56, Roger Pau Monne wrote:
> Given the current logic it's possible for ->arch.old_cpu_mask to get out of
> sync: if a CPU set in old_cpu_mask is offlined and then onlined
> again without old_cpu_mask having been updated the data in the mask will no
> longer be accurate, as when brought back online the CPU will no longer have
> old_vector configured to handle the old interrupt source.
> 
> If there's an interrupt movement in progress, and the to be offlined CPU (which
> is the call context) is in the old_cpu_mask clear it and update the mask, so it
> doesn't contain stale data.

Perhaps a comma before "clear" might further help reading. Happy to
add while committing.

> Note that when the system is going down fixup_irqs() will be called by
> smp_send_stop() from CPU 0 with a mask with only CPU 0 on it, effectively
> asking to move all interrupts to the current caller (CPU 0) which is the only
> CPU to remain online.  In that case we don't care to migrate interrupts that
> are in the process of being moved, as it's likely we won't be able to move all
> interrupts to CPU 0 due to vector shortage anyway.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



