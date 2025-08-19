Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27BB2BEED
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 12:29:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086422.1444616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJbC-0008VC-H6; Tue, 19 Aug 2025 10:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086422.1444616; Tue, 19 Aug 2025 10:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJbC-0008Tf-E2; Tue, 19 Aug 2025 10:29:50 +0000
Received: by outflank-mailman (input) for mailman id 1086422;
 Tue, 19 Aug 2025 10:29:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoJbB-0007xz-4n
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 10:29:49 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eabee4e-7ce7-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 12:29:48 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6188b70abdfso7197395a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 03:29:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a757745absm1519443a12.28.2025.08.19.03.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 03:29:47 -0700 (PDT)
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
X-Inumbo-ID: 6eabee4e-7ce7-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755599388; x=1756204188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bqULm49BqcM7ErAH695syjDAahqZMiqsytplOm1F+u0=;
        b=WsHaXc8UISHc25tO5MyPkimzLmF+QWvs7AgUtWKHw0S/z54OpzKPV4+5xDh9K3eHhT
         3MZp7PcaMbWjjGipv6C/0Ds9ADEYy4kmyoyK2N5aRJqTiPcwOrf0EZmzYeoweCW0Zht8
         EcYofIPXjsFCmrMG/fuK3yyHSxDYDpxgeFfhhY79sUVq+4DHK8H2Fe1CyiCskC9hk1Ue
         ++GHKMdwZi83Ysb890zGnnWhZ1DClCcrOAZTnnbsA+KKGMIsiYdN6gbG0JS7EgjPP1q4
         UpiB1EMnIesDeiwCOdqt3al7CaeT6WwrSSF7yvlQfUI76Adq76NMFZIEjIxFKOb1CMCz
         VjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599388; x=1756204188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqULm49BqcM7ErAH695syjDAahqZMiqsytplOm1F+u0=;
        b=h9o2pmIbz/q9Qjzq9YdQBEVZbHHE8RhIJyq+P+4/54RW5DDF5EAdegnBG1aZMhGzuH
         1G1YJCai81YThhiDidNIMg/2mHh+CpbnpNMl+BWxX64WHlS+OOnlC/XOh1dQ5ndb/Uht
         v/P5UbsvSwNmmnsp6aiJi8D3MNDVmIgkQYTAyxb3sQ8a1pxyoWgpnfPRaTMFuEgnajmW
         QdO3jrYAR4qSr/lfgn4NELfmkDRH3Jh+xkSCqkaa3XD+mhDoJ+XHYsTTtthIWdKgjUqG
         LT0+qP0+FImsBhNE3TopXbxAthEksXlTZb549m+R/DrgsM9kGoUOuW8iUTqM9lRoRAij
         iCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX13KvbopJSzKpo2FQUWTqFAGiQ8rK84qybGfr3IuOazjrs74+Qdtygu+eDVRCWLSM1+idDOdc1dZs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzns58BxzOAOIT3XcUq/AWSiu/WEVRAmx61ukJg35eyFEQ/wJ3h
	s0w11lg05cU08aCmPeL5bKr9afpN4ZxBPDscKkBgQCprhYULKyOc7HS+RobZGpaxVg==
X-Gm-Gg: ASbGncu/4KYVZDKZHVcVVUdOyUoyld5ME6WEH+SWz1vrv2KNOqh1Hq7Dtje9XHXQGjw
	A0VXQ5pcAAmRZKIcxEF+Lvkg25smh/nUzWD3T5v3XAR5LQz2kjLuvBY9WoNI5NE/g/8j8HlVQn+
	wmEz+27nnNUJ7kU6Om3wUYfLIQZmR5JiyZVCE2dGnzo5vPwYOYRT7bXd+VkXLn59wXLljD8ai+v
	YfL/NWu1IHodtNl8KCZkJOShwG29pAmpptoLK9zcBBM+bItB9uaAKX6XAhG/7jiTPlA+N/sG271
	mXKL4nZ8Z592RBKketSEDyyVLmxupMgbhnQdT4tBC4Fo+jObqO8SzPpuqN8LvGr06kd2AEEv9Gi
	+RsynOkH/WPvhkgNreqFwtu6poK4W/HdhM9PvolY6+GVo0kBXgewdnY1kBybcSec5BCMmOXN7FU
	GSdePEY4r6EmAbEYdU2w==
X-Google-Smtp-Source: AGHT+IFEEV4b+D1DdYnAkY9mnkxWIRbNJ1K3J+QG4jVAvQ7r/MrDzcV+CFnd7BSy4NfWzC+sCjq7vA==
X-Received: by 2002:a05:6402:4306:b0:615:546a:932f with SMTP id 4fb4d7f45d1cf-61a7e72b6a1mr1547421a12.18.1755599387998;
        Tue, 19 Aug 2025 03:29:47 -0700 (PDT)
Message-ID: <af5a8671-4bec-48e3-8430-28d668e72c05@suse.com>
Date: Tue, 19 Aug 2025 12:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] x86/msr: Move msr_{split,fold}() into
 asm/cpu-user-regs.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> Now there is a local header, asm/cpu-user-regs.h is a far better place for
> these to live.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


