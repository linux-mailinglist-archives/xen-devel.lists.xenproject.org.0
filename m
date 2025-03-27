Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC07FA72B6A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928632.1331313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiYS-0001b9-DJ; Thu, 27 Mar 2025 08:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928632.1331313; Thu, 27 Mar 2025 08:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiYS-0001Ze-8U; Thu, 27 Mar 2025 08:25:36 +0000
Received: by outflank-mailman (input) for mailman id 928632;
 Thu, 27 Mar 2025 08:25:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txiYR-0001ZY-6z
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:25:35 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0da09761-0ae5-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 09:25:34 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso7156065e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 01:25:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d830f5ea4sm29659475e9.25.2025.03.27.01.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 01:25:33 -0700 (PDT)
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
X-Inumbo-ID: 0da09761-0ae5-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743063934; x=1743668734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kgWJsUpsJ1d6AFfG/+Kk1PeQiomMW6naSI0FS91nmkM=;
        b=M3AXdQDvm1xtB7624aPZpY5X1zscNfocV89ntEKPJQX4wpoCWsUsgWFt54ucaCEnl2
         nDvkNXSzCKo0fc47dl8vX+OGymkiM3HtmZJJkKfu0tR1O268PvU5UrFmtBOL6tIh3DKU
         odG9Was6Mjx5+dl+n6TwxICUsrIW4BjMz3xjGgTo9ddgesodGEy7cssM75Y9GADVWVwx
         0WhSJczATlSYTKNKRsPdEGNZcPDvyhBWmbswtLJcpfsRuzngr2ER6zNk+cgMqgf1eE4m
         tReDawff5YeNjISbKRfFgCO5CBRj0Jto+HqCqxKDtqRtmKyvaInY47k6XVvxdLDOFN5l
         0q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063934; x=1743668734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgWJsUpsJ1d6AFfG/+Kk1PeQiomMW6naSI0FS91nmkM=;
        b=s5uhLTPz+TKKrcAnQnDzagiuD7ONncIKO/FoRDPYTgjNmYUn20Rx5nw/BgZiNAEq4K
         a89tqhT5lkg0bB8+v7+Zxnjw9EvSSBTUAxywisVunQyINcX6p4fW2doRm9Dm3n9muOOB
         /kKcafjtkf0BfEFl0BcS4UA5SXdElenkLQRcl+x9oIDbB8QsClN+Wk0b3TfYdhM7DBsD
         rhl7ILE4iwXF4imPxBMpJTiIlKD9mrsX46zkJkmzRAXSV6O1+MbfrhZW3snBOw3Aq8Lv
         EcD9EaTJi1lA6/9Qa3ipqifLG/svLwFDYRIMyZKQTtzYQQBp4gOJ7llt7HnCvI9qIFyY
         cm9w==
X-Forwarded-Encrypted: i=1; AJvYcCU7+tDQPyD/XoqTxSlGvBgAAGMScTPhAHXuUIgI5exOGa7HXZ2P9s00dwVMrBfypUZTQHpXrmgeUOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0BbuyZCJd2weBDBHw3Xqogb2fyczse6zw/eqtlAQ9UvF/gQqA
	mcr0xiZQ004c0sLG3W7fUlhcNFWMz40FZz8b2uYxhos/cjOgmxcyUDO5Kolgyg==
X-Gm-Gg: ASbGncuoDsOP+y++ZaVfS6iYg3Lx6eRJVnQjAsN3+NUS/nsYyzqMUycnjs5o3VtLGWz
	8gHL018TU9fvh5ZuLwxSKmshrwA0bwGhuDVp8FKKvMHQGczZZGVaJUorkHZE+F4ODmZAos6gXbm
	8PadXJ5iJygcDfWeFpdAwlQHDJ3vut98eG0u9LottrqZNqgPCKim85kXqScvRkBgS+3kNA5IPOc
	S1l2HkdhDMV1mbw6lQCEnk0E1N2+IYyOz4Uy5ekXl13gP+Mq+9iYjngf34w5lE5HeJOP9mSCChS
	ite4Xi6xWXXyfv6wM7cccgc6J7E6DCuSaRJibwMX8FMf8oZtDnby89J1WFMfXKXw7xjuFbmdxHI
	PFQt84fVPAEALsB3RHHSYpBxjG0EqwA==
X-Google-Smtp-Source: AGHT+IGP8V3gMW01tL2/xRKuecjfQrOD6TqxgqvAvGrHYEpKUyQY6ILDvK54GLs79yVQNfCiqMsfBg==
X-Received: by 2002:a5d:598d:0:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39ad1741b23mr1964550f8f.18.1743063933594;
        Thu, 27 Mar 2025 01:25:33 -0700 (PDT)
Message-ID: <689e103f-8130-4b38-ba63-607493737af7@suse.com>
Date: Thu, 27 Mar 2025 09:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/percpu: don't initialize percpu on resume
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <20250327052241.202167-1-xakep.amatop@gmail.com>
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
In-Reply-To: <20250327052241.202167-1-xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 06:22, Mykola Kvach wrote:
> --- a/xen/common/percpu.c
> +++ b/xen/common/percpu.c
> @@ -30,7 +30,12 @@ static int init_percpu_area(unsigned int cpu)
>      char *p;
>  
>      if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
> -        return park_offline_cpus ? 0 : -EBUSY;
> +    {
> +        if ( system_state == SYS_STATE_resume )
> +            return 0;
> +        else
> +            return park_offline_cpus ? 0 : -EBUSY;
> +    }

Hmm, why not the much simpler

        return park_offline_cpus || system_state == SYS_STATE_resume
               ? 0
               : -EBUSY;

Even if not for whatever reason, I'd really like to ask to omit such an
unnecessary "else".

Preferably with the adjustment (which I'd be happy to make while
committing) and with the (iirc) previously suggested Fixes: tag:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

