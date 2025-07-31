Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B95B16EBA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065210.1430578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPet-0005zY-4V; Thu, 31 Jul 2025 09:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065210.1430578; Thu, 31 Jul 2025 09:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPet-0005wR-0f; Thu, 31 Jul 2025 09:33:07 +0000
Received: by outflank-mailman (input) for mailman id 1065210;
 Thu, 31 Jul 2025 09:33:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhPes-0005wD-40
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:33:06 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c194226-6df1-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:33:05 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b7961cf660so543460f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:33:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce89125sm1134457b3a.33.2025.07.31.02.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:33:04 -0700 (PDT)
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
X-Inumbo-ID: 5c194226-6df1-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753954384; x=1754559184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou91VXz/LPG4fYTuui91suVnklvBA2TvDdpND1j9ypI=;
        b=btFgDVgkHT7o0PGNhLE9lWBrdfWzrZXqhsfCzx5uYDzZbn4rNHtJ2HIugxf59f3zC8
         9TzHHb1eNWgzG9NMzz01ivX7pWG1fQ1S0rz/KSvCCwjBVE4EcPMmHCqHlAQInTW2kAgd
         NSEpxr0X8jCBuvaTx5lyDyw5jbn/wj9Aw9dxYbrpcSYAKXmRMMCzlM5wJQWUVIQHXSZ6
         fUYSylRwKwFqa/zZJep80OQtMAXP/fpf2Y60t1kVS6Q1YCebd8upAhCE9h4SOaxKnweo
         qcWv3jqk6OYekYIixbbfQQYOey6w+XTspZwpQvXRHmegZn79LjvpaNqC3ZoPaXUT/lVj
         Htig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954384; x=1754559184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou91VXz/LPG4fYTuui91suVnklvBA2TvDdpND1j9ypI=;
        b=XhyvL5Un2sXaFOLqPGpR2aBWz6veP2k9X/vaQXCeIo4pyD57QUcoTaARtkNekw/zc6
         m/zzEEvUDKXSljL6xp26BbYGm/bvJTyAEgDLVKOk8Pci2M6GrEniK8VYQa5gHKUNOYyA
         +ksDccBmpBF7zwnmJP4hVKfMS7/k8AnB9BmVmrTgC3tOn0XFPg4ZuHgfGCKJ5UrbYuao
         poqHVFLwSHSPemyWStlytpFfxXXCrddJH/vCEMGbEdz0cKeZj2bYjoMIP5/I1Wrae1+R
         jrDXLAfMNgu28St00Rp+G4m3RNF6rS92dDEtPsVOjsPsr7HfGYHmUb9Pclr86wIPom+X
         31/A==
X-Forwarded-Encrypted: i=1; AJvYcCW4FKCKGpqDdSGp0XujVj+3VwWxj9YwEMiukuhThPi+dbNBkgyM+LtXqf1UdBS+UOiMSRcEvUdlQZk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1s2FQm4hvMB0rvCviU9zUOPehtfFaPMdtAlKjKBb+b7b5LR95
	bEuhdpDjCmX99b+qvXqchG5kmz8POJCt3d1oIhKJQ+VBcjlR+pYjT5v1MfUTUi+Y5A==
X-Gm-Gg: ASbGncvT82JMQ1GGdYwR+hDAqQhA7MPuV+/6+7iVBroi3aDY8omRpiUi7lhnWRFhFrz
	Sk7F1B5HpzpuMQlVuvNDuidyzR2AaA3FxegFz6d/iXxjyWMxQCvaCs5Ge1wdBvBQE+rBmwTujdG
	8xIeAWrmADXaSBn0OztxmY/+bXOThVDrmc1sBf3hTuSDZKCOJwlkoGm7IARgvzeLVkvC4gcwWN4
	vAfyIY6JKf9BwMHEMlVWtZe8gBsoulr5B76fwGD/5pLBfwMSY6CkVfB3Uj4i/TI+G3UFcr5ja3z
	7cqurWMorWrgoHUA8FTaDQDASG+TwnlXggBi4Df/KX3SuXdvlgCvu0gtbQUfk2gTFfV8yWsohts
	p6vusz9chpOcP8SQQxNg5JU2UxATM5baLN0BvYJAdA+XtVp49bNqn42cDc923xFb6T0gv9NQirD
	MA/Logete9I+bOXeTyDg==
X-Google-Smtp-Source: AGHT+IGBSJ6FYRWbf3bj5R/X2VPZhuuaWZLv5cpfGOCF+7uuQ6/zcSp1ZBp48wvnG6eH9C0dnYVc6Q==
X-Received: by 2002:a05:6000:381:b0:3b4:9721:2b19 with SMTP id ffacd0b85a97d-3b794fc1944mr5532425f8f.11.1753954384594;
        Thu, 31 Jul 2025 02:33:04 -0700 (PDT)
Message-ID: <dcbd4381-50e0-4d20-b627-7719bf31fe20@suse.com>
Date: Thu, 31 Jul 2025 11:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] x86/altp2m: Wrap altp2m-specific code in #ifdef
 CONFIG_ALTP2M
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1753953832.git.w1benny@gmail.com>
 <2fc138bf8f1100b6347b965e16691b9d6e3272fe.1753953832.git.w1benny@gmail.com>
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
In-Reply-To: <2fc138bf8f1100b6347b965e16691b9d6e3272fe.1753953832.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 11:27, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> This change consistently guards all altp2m-related functionality
> behind #ifdef CONFIG_ALTP2M, so that code and data structures related
> to alternate p2m views are only included when the feature is enabled.
> 
> Apart from that:
> - hvmemul_vmfunc() returns X86EMUL_UNHANDLEABLE when altp2m is disabled.
> - do_altp2m_op() returns EOPNOTSUPP when altp2m is disabled.
> - struct hvm_vcpu, arch_domain, and hvm_function_table only define altp2m
>   fields when the feature is enabled.
> - Moved several declarations under #ifdef CONFIG_ALTP2M in p2m.h to avoid
>   polluting builds that don't require the feature.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


