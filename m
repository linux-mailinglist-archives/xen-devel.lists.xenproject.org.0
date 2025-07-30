Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60EDB15B89
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063605.1429315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh37N-00087V-4H; Wed, 30 Jul 2025 09:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063605.1429315; Wed, 30 Jul 2025 09:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh37N-000853-1I; Wed, 30 Jul 2025 09:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1063605;
 Wed, 30 Jul 2025 09:29:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh37M-00084x-1U
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:29:00 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f1e0a80-6d27-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 11:28:59 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78d13bf10so1666185f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:28:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f58eed6sm8878068a12.25.2025.07.30.02.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 02:28:57 -0700 (PDT)
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
X-Inumbo-ID: 9f1e0a80-6d27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753867738; x=1754472538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rD0lkwnlOr+XJUKGYszyUGN45gQ606euA4RDakTzyXI=;
        b=BNFXPg7t6vSKVVInl9Xq6QlRv7QtD0lSO2Gy65kMp6MAwE9++6QFytfzX1kqvOAI6/
         wSowgZ6NRMQsw9wTqbz/qN3hyJPR94R0IF3DmD/yjEHB5RHAwRFxJ6XEeDY9/K9ZLJkb
         qfV0yDgHVqLYCYuqJLaBgqxDcYL3gkii95G+oQ5ssouHgDBVBSiWwRD4Dr+8odZMx7mM
         mTKiQYY22w/6yLeekA1cyavQXL35WFePTv/uujKdpx2s22XvS8izfb5zLgiylg3ILq7G
         V64rWSTbhCb6s1RrdRCd5oupTbBnv5QubOrW77paWll+vBorSQoJ7sLt5ugb4jmZU+Me
         fYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867738; x=1754472538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD0lkwnlOr+XJUKGYszyUGN45gQ606euA4RDakTzyXI=;
        b=YKmXRvv1Qb1job1wNts9U/i5RDGUwOD5j4k0gCqLaoj9v60tSiYI2mkA6KtlXvDLcG
         PqHxN/lma2Rm2lfyiu6wR11LgIBhuiwbZn2pA85Om4L8AbIaAbNMmp0SuF9oUNP9xqmF
         RBYzz0JBMFdhBKiZ0HuTuDF1gz6itcd+oC6s0iQuiq+JyOFMiRMbyWQh6Ao/Vz3aZJyv
         MxklLXN8iFmb6K6AKchUthAD5C4HxkCc1qC/PSnppkR3Wz9NC1tDRUsTZRucJe6oUL19
         UckZPdKh5uzPmxtaE1Fl4F0V+gqQJFxMghzNN+vA8T9CyCRkfm10i5iWaBxRBOmC4btI
         rD6g==
X-Forwarded-Encrypted: i=1; AJvYcCW+8WAsixV/Iuxi3WabrJcgxWnXAB2AvDePJcxjKvxQPg0B3uGcSI6ozrrWtuCN9vrtTeK8j9dWUEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJvE4XNUDRQNj0hb5Vxu/3AbR8Z2u09XtdQA6SOH6IAayCwJJJ
	aeYuquj9aM3z04W2e1QdHPnnA58KMHJYgs9f7TBJJVFzuCLh2Uv8MTZNy351nOHDOQ==
X-Gm-Gg: ASbGncvomMtE4X5asy611wEtJYqID9BZfz71bU/Bv2laRSZ/oJ9bEinp2v55rHBQBAY
	pZ5rgKAyIYaO5+NPS1HxccQ9ubaKG/LZHx1igkkDp/L6W2jOn7CEEiaMZPr2FBbOqmlPIiVPOZQ
	FOKeROVgMG4Dh6P+UhWPLXySL7whVP0TPFMDZ6aKsKuKj7CifiJyhaMQCLO9s8+qcCV7U+E1DC/
	Xa2a1fl/vXvHzgLz1zjv5T+sQFdRoMKmFhAbkGpaDF7+QIemFPiPQAbfYcQM9StWeT+hiNzlWVg
	Pwbxm5jTJNkP4a4uNPlZcXdqPQ2JW0GYvi0JspoHr1VnsgaHm+WpsnVcZ15KZw3WkSC+paEejOu
	KY4rqSan6oHXK9el9GHBn2FJQI2uVCHnW0/cZ3XISC8h7bVlVMCOoBoB/9J9Mle4HghyD6EvKkQ
	rKaPfMpYwEB5a9bQq6wg==
X-Google-Smtp-Source: AGHT+IFxG/UTZF6sUktMfdwL6iWtMPAUONSf1XkzJI8xRnJb2lPGge6AqYDqtdEnjBakaNRu851apw==
X-Received: by 2002:a05:6000:400c:b0:3a5:2f23:3789 with SMTP id ffacd0b85a97d-3b794fed896mr1958075f8f.15.1753867738410;
        Wed, 30 Jul 2025 02:28:58 -0700 (PDT)
Message-ID: <348b7780-d1ad-4765-9eb6-5ad66e5ce2e6@suse.com>
Date: Wed, 30 Jul 2025 11:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] xen/xsm: Add XSM_HW_PRIV
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250716211504.291104-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 23:14, Jason Andryuk wrote:
> Xen includes disctinct concepts of a control domain (privileged) and a
> hardware domain, but there is only a single XSM_PRIV check.  For dom0
> this is not an issue as they are one and the same.
> 
> With hyperlaunch and its build capabilities, a non-privileged hwdom and a
> privileged control domain should be possible.  Today the hwdom fails the
> XSM_PRIV checks for hardware-related hooks which it should be allowed
> access to.
> 
> Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
> platform_op.  The hwdom is allowed access for XSM_HW_PRIV.
> 
> Make XSM_HW_PRIV a new privilege level that is exclusive to the hardware
> domain
> 
> A traditional dom0 will be both privileged and hardware domain, so it
> continues to have all accesses.
> 
> Why not XSM:Flask?  XSM:Flask is fine grain, and this aims to allow
> coarse grain.  domUs are still domUs.  If capabilities are meant to be a
> first class citizen, they should be usable by the default XSM policy.

Despite this added paragraph, my prior concern remains of this adding
finer granularity than what may be desirable in a coarse-grained world.

> @@ -275,7 +279,7 @@ static XSM_INLINE int cf_check xsm_console_io(
>      if ( cmd == CONSOLEIO_write )
>          return xsm_default_action(XSM_HOOK, d, NULL);
>  #endif
> -    return xsm_default_action(XSM_PRIV, d, NULL);
> +    return xsm_default_action(XSM_HW_PRIV, d, NULL);
>  }

This change I'm uncertain about: Why would the control domain not be
permitted to interact with the console? It may, in the end, be more
important for it to have access than for hwdom.

And yes, there is the ->is_console check earlier on. But for the
consideration here its presence ought to not matter. Or else the
change itself is meaningless (e.g. if we assumed that both would have
the flag set).

Jan

