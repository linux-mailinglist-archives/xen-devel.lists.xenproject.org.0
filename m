Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92354CB2526
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 08:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182596.1505454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEvJ-0003Hm-QV; Wed, 10 Dec 2025 07:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182596.1505454; Wed, 10 Dec 2025 07:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEvJ-0003FY-Ne; Wed, 10 Dec 2025 07:47:45 +0000
Received: by outflank-mailman (input) for mailman id 1182596;
 Wed, 10 Dec 2025 07:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTEvI-0003FR-Jv
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 07:47:44 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 829166f6-d59c-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 08:47:43 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so65630075e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 23:47:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d26f5asm29189765e9.5.2025.12.09.23.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 23:47:42 -0800 (PST)
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
X-Inumbo-ID: 829166f6-d59c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765352862; x=1765957662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eprrhfRj3nLrnvsgngCIE6OvGdb1CaqJ1OF6INC752M=;
        b=K3vXWaFgUkugeTrSNQ9RDQ9WNgJL9s1la2jlwgjDp4G3vZeyhFsBJ9KlXAxplDwfKF
         MnxE1Ra5bw4mb2UMPDP0EJ1pFeubosPxTj8QS2vniPbyLxjepMIdeND6EiZyTVt37sZr
         gpxTSxSMYk4JZKorQtA6Vc9sclr190y31x7qorRCzm4+HcEt9NtX3SwEYZogN5YGdaMF
         ASUTAPOFWTOfnX3K0fnN9SNaDCQopaBFJHsbNMxGh7ieGxcRfaILxnolWIF4bM8a7wyZ
         6LVZ5Dzyuk3VLEztB+uTDqSL59w8/QYA7dIIRLWnJYsCtPQVOe1MKAyrcMd61KFiKigj
         qyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765352862; x=1765957662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eprrhfRj3nLrnvsgngCIE6OvGdb1CaqJ1OF6INC752M=;
        b=qX8alrCv/SnjRR47qqXU8SLeuDcwM6PszAJ7UZ1PylGAIn5S2czrJ4InK5H9vyrlxy
         toKrBqOZEsR0v3RhzyjhVXVIeL/81nF2nFS3Hni2V8i8FMKl5naFs/5lejHUTtSqs+uD
         ulW2AS0/225DLPP4GuV1aBlZin8xnMOBOQVgC7F66xYiNmt07DsTFai/KnHeF5k+ptVf
         5dSge3iyuomCTpEChsUvczYZ1eQin6vzmv+hch3vIbvRICPQ8M0eEcaBmVUJfcke7dqf
         XZ1yNWLOAqX8e5xjLxbVfdnK65aT63LJ9pbfCXoXmiH6tc6cQGdcakQuVeiNe5ivT8FW
         urCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEJyTiywB0J/aSsdXD1wRdSRetO1Xxv8CVZTY8kK7y61rf5KyEqEFZHRAdYFfeZ0xD7L5ZY0d/QYE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5OPjn2IEzbXNEKZpo0OH7F3Rw8on7nAKTHGGb/lplBetuAGPe
	gvKEVx5+SoHbgymBpHZL2BeArUNaa8VdvUmqAoUmirEati94VfPXAeQp/6Y1BFpkLQ==
X-Gm-Gg: ASbGncsj1mN1N//wNQ5IpQq45UEv6+Il7De5ism2EizVGuqUyAhCQyjt+rKq2WL0WoC
	T9uXfSOXMMygkDV/QPTwuK2+RMzhoU6+GmV23nDMFMHXxpUotwp7y6h21WlnfYiTzsw8gCHtYL2
	e7CBxEajpDzo8pTC9PAQNGmWfAQHjfcCApb6oX8hpb3R8CdG0CLUIUQhrrASUJRCm2V/XjujY9z
	BgppatgD4j3kCnQtYnIEGVgZDg0hfssWjmrePY3WaMat27V2CtCpxHtFcY62ob58oDqYZvDG0JW
	Dgrbm9NGzkme5rfllKKDloI+qOGA4GOZqoijrwNUkWdo1TjYvIDco63cO/5v7w14oyeXJEfLhki
	lu/tdJyfK+nNOf9VmgAwN5FgwpqAYviOJTMkUcXMc+UQPnn+KszgOQIw1QK1DdE9cXKTtQ6oWCm
	xTzjR/JR9HMygsQwXcIsLmBYEjDQ1xTy9SDiwMlMm+c6aM4JUqheo5R0YvToOOwNyuZNx9R8Slu
	a9UPwxMxg4a0w==
X-Google-Smtp-Source: AGHT+IFUKuR0uj/RqHsIPIjzyahs1mbfNZxgsCWOJUTI6ZFwVjk5O86SOfrXpmCCkVcRqpSqTlRsmg==
X-Received: by 2002:a05:600c:8709:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-47a837fe50amr14964405e9.4.1765352862605;
        Tue, 09 Dec 2025 23:47:42 -0800 (PST)
Message-ID: <4880e134-2b5d-47af-8cd9-16706f2285fb@suse.com>
Date: Wed, 10 Dec 2025 08:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Move hv_compat_vstart into pv_domain
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251209182639.2171895-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251209182639.2171895-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 19:26, Andrew Cooper wrote:
> The hv_compat_vstart variable is hidden behind CONFIG_PV32 but lives in
> arch_domain.  Moving it into pv_domain is an obvious improvement.
> 
> The value however is less obvious, and a mess.
> 
> In !PV32 builds, it's uniformly 0, but in PV32 builds it's ~0U (HVM guests),
> __HYPERVISOR_COMPAT_VIRT_START (PV guests), or custom (PV32 dom0).  This seems
> to work because uses are guarded behind is_pv32_{domain,vcpu}().
> 
> Simplify things by leaving it as 0 in PV32 builds for most domains,
> initialising it in only in switch_compat() when a domain becomes 32bit PV.
> dom0_construct() adjusts the value after calling switch_compat().
> 
> Suggested-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


