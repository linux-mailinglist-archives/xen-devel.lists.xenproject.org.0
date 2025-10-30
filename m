Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE6C20309
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 14:14:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153676.1483964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESTV-0003vX-6y; Thu, 30 Oct 2025 13:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153676.1483964; Thu, 30 Oct 2025 13:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESTV-0003tP-4K; Thu, 30 Oct 2025 13:13:57 +0000
Received: by outflank-mailman (input) for mailman id 1153676;
 Thu, 30 Oct 2025 13:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vESTT-0003rm-9F
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 13:13:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 471355b4-b592-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 14:13:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4710022571cso12230565e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 06:13:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289a5932sm43886405e9.6.2025.10.30.06.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:13:47 -0700 (PDT)
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
X-Inumbo-ID: 471355b4-b592-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761830031; x=1762434831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cyptttPPSMP6UxQjnAYqpaBlRK+FGaaZeYMXPM5iTEY=;
        b=bPY1QRgsIGy8slJf2tyzO2Vj2KBIgBQNQ1P1mHnYIqm7bkl5ChV1suXUwcWYUvNWlF
         SQcDsVNAccdT9yF//EZUcVGhU/VIeWDoHjdy52AW8xxaRAKB7Z6fmuL/EOU4tYsElGAL
         HewO0QKGCWhlwh67WD0bjTMl7Lgyi9jlBIRp131FHvUXevhSFovGmUbGqq+F21Fwv6bC
         86CSOFz3KIWUjWefDrFZ1TvwchSAgrZiW3dQP3CtvWG2ak+fG0zLAD0F9A+uaIFTyRmm
         uluWIBVPrhOhGfoEtmF/q1KLh29yKycudp8jj1ISNycMDrm3IQvksZkfG5tWk8Wtc4pS
         SmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761830031; x=1762434831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyptttPPSMP6UxQjnAYqpaBlRK+FGaaZeYMXPM5iTEY=;
        b=k5+ZapxZqQ+RGbCmw6SDtmHcDxKWgJku7DBRAGh2MglyPuGjLPftTFQ1/KAscQmT+J
         YBs/vigTk/orK9pAMqJ9ssgidToNxteKG2/zLg12NjxM+2BQgnOfLb2Q+fWjrlfYMqap
         dWIMHnRwAyr7nLheXkZT0mT60sE2tvsPsZsPa4HZICHXEmtjm+2RrlJYPwodAqjCCgMO
         FooRRhxLmwaGEdP2ZB1xNTqejILoogWGNnu+ak0+gOU0TtH/Dm/62UFqCifw2+g0TUXM
         F1C1KumkP3MbngT7IF8s6/usyqyhC8sm+8U3v7aTMfQLRKFa2UwSCXmghDFwqR4on5PQ
         /4pg==
X-Forwarded-Encrypted: i=1; AJvYcCVWV5teM0SiKtqiG8yX3erY7pByeC6grZdE/P0X18a3RuUCD1ajORemvA8qFRRIdE4MldsS1jAVRlU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcFBVmsS49i4znJwYcYquKr6q4rynP6YhQe9MExgZTRfvdrmAH
	eMZZj9+aHFHU1eV4SEcnuZuuOqg8nhkvPN5q+cS13HYes1tdSwTtWNWXjPRraODELg==
X-Gm-Gg: ASbGnctiQpgoY6K4vSydTcQAjVn/S9OBoRsM4hDqA/nU7IdqYoC919SOpns5y2/yimN
	/e+k0gLY4IF45wM/TmRLfWPEoR9isKbfm3f8G0Cl+TDrIkx+QQ1Jn1SpNe/WLMcb/0nTf1wvTkN
	Ap4XLXHUsFAEM5GRpigRa9X5RqGsByUUghKm7DySGVWQNxFBCf+3z1mCiNj4ksdi0GTfZOlgA19
	INU9dAlxAKHSqXhdaTBzBwL7wAi/ape18GDh94BUDtkdF7WQ4iD1eNL3UiAyBx8M5rpUmS0/ttu
	RtxpH04czokht53DCLzrhvgzEvwtzBnTfs3QirAIIAJ6qufiHXQR32giuJG7JRLNDZ3x2ZN+6hr
	oH4Sq4K7puIVCkx97jGXmAn2sUomm5jyCGUqY63mvP63is+KVsn/ejiQGFZaIgx3RB+pyZpFD1V
	y/RhWOpaeAfth37V9+YLOoRwDjo1LIkR4j3iDMSxafQLMZhqhEa7ZRJIvWqmLU
X-Google-Smtp-Source: AGHT+IF3ZmQJQL0c1lPfVC5s+TCfQtEp5oyMFsvNi5bkF09KLhXXcdKgOgqyMdY+pGpScVrEAu0lvQ==
X-Received: by 2002:a05:600c:154f:b0:46e:7e22:ff6a with SMTP id 5b1f17b1804b1-47726728bd7mr27600195e9.15.1761830027888;
        Thu, 30 Oct 2025 06:13:47 -0700 (PDT)
Message-ID: <eb367a04-f6f7-40c6-9e30-659b17ab997c@suse.com>
Date: Thu, 30 Oct 2025 14:13:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/28] xen/domctl: avoid unreachable codes when both
 MGMT_HYPERCALLS and MEM_SHARING unset
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-26-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-26-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> The following functions have been referenced in places which is either guarded
> with CONFIG_MGMT_HYPERCALLS or CONFIG_MEM_SHARING:
> - arch_hvm_save
> - arch_hvm_check
> - arch_hvm_load
> - hvm_save_size
> - hvm_save
> - hvm_load
> - hvm_vmtrace_reset
> So they shall be wrapped under OR relationship, otherwise they will become
> unreachable codes when MGMT_HYPERCALLS=n && MEM_SHARING=n, and hence violating
> Misra rule 2.1.
> We move arch_hvm_save(), arch_hvm_check(), arch_hvm_load() and hvm_save_size()
> nearer to the left functions, to avoid scattered #ifdef-wrapping.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

See my earlier remarks towards MEM_SHARING possibly becoming dependent upon
MGMT_HYPERCALLS, at which point things may want doing and/or describing a little
differently.

Jan

