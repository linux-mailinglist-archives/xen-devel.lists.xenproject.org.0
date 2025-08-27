Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27CDB37B56
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 09:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095608.1450546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urALd-0002RZ-B2; Wed, 27 Aug 2025 07:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095608.1450546; Wed, 27 Aug 2025 07:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urALd-0002Q7-8F; Wed, 27 Aug 2025 07:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1095608;
 Wed, 27 Aug 2025 07:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urALb-0002Px-U0
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 07:13:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5386ae93-8315-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 09:13:26 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61caa266828so1707911a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 00:13:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61caae5fc3fsm1430564a12.51.2025.08.27.00.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 00:13:25 -0700 (PDT)
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
X-Inumbo-ID: 5386ae93-8315-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756278806; x=1756883606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QZpPlf/fPJ7e1qsMCEmJzLy5X0G0I179INc0LnfULro=;
        b=a494KSUT0ahTZ06aEVP47XmyC/rkYoTgr8CDV4Fea9Vq3xugX6nZZ5BvrTbvWetW7x
         OXP28JAVGJBjPTkErdmpOPWQ8gcQlK/ReTN+ivG956ZNLJOVug4OoEQ/qpzo6q6QOK8P
         xlJLsigeL4K/UOAVFJUrGZtuFZZOoSXXZkLL26fsGMOumS/SJmyrtf4V3AujVPYNxCuB
         xLR07pgLPWXFKLGXAuRyHCWfrZyEbRmKE0rfVdMPSaOkhDiAS52d1FvA/yW0KQ59Bzwj
         KMaIssrodXRoL6FttBUGF4D+GNHvzxXiBRGEfU5/97wO96NvV0IgYk9P9EBlEYjxfTkA
         NpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756278806; x=1756883606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZpPlf/fPJ7e1qsMCEmJzLy5X0G0I179INc0LnfULro=;
        b=nZsnaQEhHixwkAV7qq/znDA4P7pKvCha0+iMwq36c2UVT7ju/sQvV1CoK9zal2fm2B
         tEjLH3xU55Z8/sjZH7OqiqjyN3wmlEY/mwMbH73ZTwX71SawykQISm24U09AQH7uxKKj
         bXcM0P7Y+aqc1G80XeU6Y7VVAr/bCK9kW7EQZXU5ed7hkitaeRDOBfZWYEYhuuAIuuT3
         GY3ZVmZfEaXFG+wpsVb2eUQNnPefReMg0ByQcMI027M8/It1M4mXHsH+k9a1Ml31X8Hv
         OBtfWIGJm1A5j1gJrX1UQjX6iV5KdLA1Qu43cMrZCPWm01f8sl+ANLn5X+HEMbwanBDS
         fDcA==
X-Forwarded-Encrypted: i=1; AJvYcCVCg3Kah5sVM4YxglmeEhzeYZtZBCezooogvYMvHxmzD9bL31Da+r4esJ3yt2wzqxI+0O+ERl3T7fg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDYg/UDbXP50Tbkxdq73uP5nqZ3eFy/qmHUuv81aOabjVTW+BZ
	MUOIgtdKmG8yI5CS49l83cfTmGmzAUu9g9anKSmTdTfJFJxgXogJ0YqJUBOYnIDjpw==
X-Gm-Gg: ASbGncshcpzRjpJFWIdm6nkXxKKxT5DoYyKvRV2AmWx2h+8VLmnDMjHjutsA1Iw/olF
	1OeeyHL933nCXGp6HDB/ZVtmh7DoQm3nZ3N5S/ydaVKO4ikhdztTSCuEL+VnGOhMR2FeCJnIEGN
	s4dWcvJpUqVKzXKilO1B4r0BgU6dEm6cNNHWQynJawPnsFFYxwOw/3D8F0hZdP4pUPH6jxTE/2p
	mP7tmdEHwR/jEHF5cOfhU2I8bOh+EjagL4NQxjjLRmW8LuyutmlVBbGnjJQNA/kPdg7a3/kqmZJ
	wU7PwCBaEBlBcyYOPo+E6gjQifcx7/rJ7a9hbklrVtUAIbQiE0q9kbwk0327WV0edHX2NBNRomS
	kIDN3VGPRsCAiUzFqvZFzrnSli9pA/W6VgFp3RMjsaPheLn4mml2ORJ9BUq9MM1bw3FWRYuN8p6
	nn8Y+p09w=
X-Google-Smtp-Source: AGHT+IEs7QQQpQ+QHms7VvccdWHZkwsnmSezPFz0aWxK3R2PkC8Cqfo+oQCrK81SjJGHKmtq16OSBg==
X-Received: by 2002:a05:6402:2790:b0:61c:96a1:da11 with SMTP id 4fb4d7f45d1cf-61c96a1e080mr4005235a12.27.1756278806249;
        Wed, 27 Aug 2025 00:13:26 -0700 (PDT)
Message-ID: <cc8724b6-bb31-4482-a459-156366b7b433@suse.com>
Date: Wed, 27 Aug 2025 09:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
 <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
 <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com>
 <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com>
 <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com>
 <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2025 02:33, Stefano Stabellini wrote:
> So I ran a test and the appended change, which is based on [1] and
> renaming CONFIG_DOMCTL to CONFIG_SYSCTL, is sufficient to resolve the
> build issue.
> 
> For 4.21, I suggest we go with two patches:
> 1) global rename of CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
> 2) stub domctl_lock_acquire/release based on CONFIG_MGMT_HYPERCALLS
> 
> Jan, are you OK with this?

Naming if the option aside, no, I fear I dislike the stubbing. What's
worse though, ...

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -148,8 +148,17 @@ void arch_dump_domain_info(struct domain *d);
>  
>  int arch_vcpu_reset(struct vcpu *v);
>  
> +#ifdef CONFIG_SYSCTL
>  bool domctl_lock_acquire(void);
>  void domctl_lock_release(void);
> +#else
> +static inline bool domctl_lock_acquire(void)
> +{
> +    return false;

... this will break x86'es HVM_PARAM_IDENT_PT handling. That is, in
principle I would agree that returning false here is appropriate. But
for the specific case there it's wrong.

As said on the call yesterday, until what you call MGMT_HYPERCALLS is
completely done, the option needs to be prompt-less, always-on. Adding
a prompt was necessary to be the last thing on the SYSCTL series, and
it'll need to be last on the follow-on one masking out further
hypercalls. IOW my take is that 34317c508294 and 568f806cba4c will
need reverting (the latter being what caused the regression, and the
former depending on the latter), to allow to cleanly continue that
work after the rename. If we don't do the reverts now (and take either
Penny's patch or what you propose), imo we'll need to do them later.
Else we're risking to introduce new randconfig breakages while the
further conversion work is ongoing.

Jan

