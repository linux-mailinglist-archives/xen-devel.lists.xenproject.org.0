Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF2A5FA84
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912684.1318906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskw0-0005b6-HN; Thu, 13 Mar 2025 15:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912684.1318906; Thu, 13 Mar 2025 15:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskw0-0005Xy-ER; Thu, 13 Mar 2025 15:57:24 +0000
Received: by outflank-mailman (input) for mailman id 912684;
 Thu, 13 Mar 2025 15:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tskvz-0005Xs-RQ
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:57:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9e3c486-0023-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:57:22 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so10976775e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:57:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a5f48a8sm58708505e9.0.2025.03.13.08.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:57:22 -0700 (PDT)
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
X-Inumbo-ID: d9e3c486-0023-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741881442; x=1742486242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b0U5O4W0os+6r5aw1BEhRROqA2AGLe7bJIr9ViJkUrc=;
        b=TyDuC72JHyq6dDVX9oqmIHjUffuMVYOBljArxIm5BaEibcyE1GHVoH7GhGckfGxMgS
         VK//fCQEMaD0SdzW2+RfwSFnhpFP1tDvAZUpPt07ROBk2GpEq7avRb0tPQSRT0d8Kbej
         mE2I9WyFWJ6sIn9mPq2Kj0x3ArSlnweQQfmRcw5oe5neGmMeUCRGCuSUea8QvaO5RFvU
         KBLn0L03dBO2En4nGG0nMSStwkUSTU+XZEBQlSeipkjgdIwZmwQRF+2t2af1R223qyV3
         wa7wslFqmsyKBHZF7uIUDQ2PK7+kzh6Gi67vEuGBXJsMevhZ/ZKgKV52jW1tnxZdG/SN
         vAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881442; x=1742486242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0U5O4W0os+6r5aw1BEhRROqA2AGLe7bJIr9ViJkUrc=;
        b=fNHU4p+AErptbeK+1yPwLxs8rvxc8XwAGpM96GnHzAQ1hh4Us7hkpypJbp0gdeshxN
         /g5XFfb9wMvz1XtvttkLsMqUyEAixd5Ckp2k2nunAadvh/6U2SBeI9FNqXEsZdfpDRb7
         GFIsJp8c70t6FcuGx8uB2JUwRUDsgDHAmCzpAA06kAUU54c3mWRe5CtO2DBhFVTDC/tn
         aAzUWRdDbKOxCkVqswQhKuya4uIU1d/swlDOYvkbzbHdgTfTejHvlMRxFvRzosWA5ez3
         JtJ7r0izhqAICcm0BZ0d3hr2qFnTdheMVXwF7GiRdL7NTgCmc7zqMYiUmjdVdXiPZ6/Z
         wkow==
X-Forwarded-Encrypted: i=1; AJvYcCXLUrjlu2rsCHIaqL8IAuoE+ykZuq6pJS5jc5PkAjyhAQQzzfF67YjSUkn5B2uuFqhk1YilU6djsaU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5XpKQba5mCprafxvXOMEM+fRW+fcS3zSzgmC3MaxGHU2utDTq
	H0OV8bIh1xSlkPRqa1VY3Ldh4+JusFHDXWjKEjq6PNvg68+KPVqxf48aFeruzQ==
X-Gm-Gg: ASbGncv2bvpZ4n9XfMAWweOTuDU02evD37zLoVKjg745Mf9FB48yA2Ee9DlxLM2kbfQ
	TpSPCRMfkVQcQMAt/HXupY3FxXRGo/8TDF/Upv/3Vw3WUDb9pnHOlcAIjW0ZobMpd1HEDgoyWQc
	eV+4oNCMP2c3jVXqmFDTYPT+NIo6pMgRQg9ee30GKnoYjG71kLVrnihOuzWepUa4HlBCoEsrYTA
	NzWWhdBjJTi//QkXi9lWWmliOuy8mOEsU5hAajiLEqhPO6LApsRZou8RreRx2+kVbWEDwCUrxj6
	OxWHUeM3ihGaVB/3xj7hLPlptji1i/X95PQvYvSppS9EMlJmOhMuYdTJWGA0AylwKt7Q8HGhzR9
	GCmq4PHgZ8mBOo3LzOW+K1FFyEBY43fCzZXV1DVkk
X-Google-Smtp-Source: AGHT+IGYES8q7jhCjppQf3xkqW9ekn4wHFLWmI0qwk5/zpjAlTt7sElK1IpfN7ITAmGdP1hEGNDoGQ==
X-Received: by 2002:a05:600c:1c26:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43d1d8ebd84mr1217415e9.28.1741881442389;
        Thu, 13 Mar 2025 08:57:22 -0700 (PDT)
Message-ID: <107c6532-c923-4364-b56a-4ccbbd9af425@suse.com>
Date: Thu, 13 Mar 2025 16:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] xen/percpu: don't initialize percpu on resume
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <e44b56f18fe5e1c7f1d6cd9d33ba84cf0e26b440.1741164138.git.xakep.amatop@gmail.com>
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
In-Reply-To: <e44b56f18fe5e1c7f1d6cd9d33ba84cf0e26b440.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 10:11, Mykola Kvach wrote:
> --- a/xen/common/percpu.c
> +++ b/xen/common/percpu.c
> @@ -74,7 +74,8 @@ static int cf_check cpu_percpu_callback(
>      switch ( action )
>      {
>      case CPU_UP_PREPARE:
> -        rc = init_percpu_area(cpu);
> +        if ( system_state != SYS_STATE_resume )
> +            rc = init_percpu_area(cpu);
>          break;
>  
>      case CPU_UP_CANCELED:

Right now I can't see why we wouldn't need such an adjustment also for S3 on
AMD x86 hardware. However, please let's not further split how things are
being checked for. I.e. can we please keep the park_offline_cpus and the
system_state checks together, either here or in init_percpu_area()? Just
like CPU_DEAD etc handling has it.

Jan

