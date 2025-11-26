Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E515C88FEC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 10:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172450.1497518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBzm-0003sN-49; Wed, 26 Nov 2025 09:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172450.1497518; Wed, 26 Nov 2025 09:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBzm-0003qo-1L; Wed, 26 Nov 2025 09:39:30 +0000
Received: by outflank-mailman (input) for mailman id 1172450;
 Wed, 26 Nov 2025 09:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOBzj-0003qJ-Pe
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 09:39:27 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9e6ee75-caab-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 10:39:22 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso5317075e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 01:39:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adfd181sm33762625e9.14.2025.11.26.01.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 01:39:21 -0800 (PST)
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
X-Inumbo-ID: c9e6ee75-caab-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764149962; x=1764754762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mZg2WKFZMeQJ68a8Xwt8SeNBnveQS5XpWXNYLo8xRjA=;
        b=CLTQVOzNcujGBt2/ZZG5ab/t7ocCtuU5UqeHy8SynEMkvsM8VfFVI49rRBi0a5Px1W
         a/Wdx7mxy3dUUoLn02n4Tn/YGJExNxF5ICpJTX411R+ho8FVjtyPbxyfGRhhBTG8Bm3a
         v28YlkCWtzqW5fQz6Q42KS6/wFkzjoTW7FyquMDbNdrgNYXZzUj0FhcTBo1rlXtPyLCB
         0/NOzmD7DI52cGi3lD0cFA4e/Ksb/yn4852pEb42IUeV4tZqrIqXWZ0Hm+d836TeWY+S
         JqCx8q4mLzuVVTDyDDn+YeLowK6vvQFij/0a85lqKveZna8OVGLs9mkXNU+zCmFqQ2/k
         z7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764149962; x=1764754762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZg2WKFZMeQJ68a8Xwt8SeNBnveQS5XpWXNYLo8xRjA=;
        b=HxhtghrbgVaqpQ37Uiw+ZqfPXToXxD4RJbrU4ptxjPEecF2LNountDVz7zTpxpJr2z
         a2IsNRGmF/LDZrWzoVkuBxYE3PVJTlhAAyyEXohJsO9ecGo5J4yk5kpYV9Fp9YM63iYR
         0AMsCX9SF6yNtX8IOt0N7uUl3piCe4ZpuXB11qhd4jI74o/JfHKe7lvO17S5CIkaWQwV
         dI3rUhj61ZRMYo3OWjXTD0QcRtGiexfaYb+6AY2vH7TAwb7U/Fe55u3A92xqfttfPPfS
         wjh0GflsZxEvUbQKCnt6L3E8B/wfk+lGOeXTYybShXbWd2aRckihJgin9wAaEWql1saI
         o/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqD7g8A+7U32w+Q98280I727ZQfnhDJniHJRBdRnKBif910tTDVA4D4YORrGEXsk5hPeXA9Zjp+Yw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxsNswNO1STfbtgQW2kk6D+k/jArPZ+DlSI1rrDmwZ1r28cTzG
	craNWxD2I9s6xrwuThcZ6CDGS3i9rli47o3b/DMEAFByO8WcEpsLmP5cT953i41wAQ==
X-Gm-Gg: ASbGncu0YzsAUQD2cJDpv6jvTVbx2ZuX5wtWr1qom/Kkla4JMLBq1bIUFMRYBVV+yX8
	1LkeuCXbnzyoO8Hffg7lrIjqDkHU2gbQ53lcAO1PmEfkK+T6U130bk7ZR3ZHtlJrur9Qx05MrY5
	A1/1yEwnCX3GxHK7MM3lWTlNGzmsfD4Jpk81jppvTOvfniDGN7/qXercmdDc24SouMHcRs4InZf
	d+isajvjtXOQmxw6f+W/Hm7G4GKpK0F4tA10CQ0IeO7E2Cqi1N1nnoqgDsDF61wu2DvD6eT9HHS
	nM+Mx6Xzx6Aa6/tEaHhSCITumDUlx4scsAo6ashuUU3t3Na9sFo7ZvJ5IOwb2mOeQtNIHb8cwiz
	cOvR28LMg/2a3WaAkd+Xwk/pQAhmAGWsY79NQybfbZwOD7jltGn9OhPdlth8Vu45UPCcOY3zcJ+
	tfiIHX/BeSJIeeIhmxa9VBX7pYVtOJosAvZIG1xwX1BcN2hSYfAlq4w8wb3LZYkw6ufmvVINsm8
	UI=
X-Google-Smtp-Source: AGHT+IEdp6yqMZWMdi+cpCl30yCtPYrgsL6OiTePhSWlKn3QGrEpVRnpeYhNxuEqCpe5TyxTZa+TdA==
X-Received: by 2002:a05:600c:1d14:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-477c026ed62mr181868245e9.0.1764149961927;
        Wed, 26 Nov 2025 01:39:21 -0800 (PST)
Message-ID: <e90d4db1-919a-42bd-872c-b6a23b16412e@suse.com>
Date: Wed, 26 Nov 2025 10:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/24] xen/domctl: consolidate domain.c with
 MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> The following functions, scattered in common/domain.c, and are only referenced
> and responsible for domctl-op:
> - domain_pause_by_systemcontroller
> - domain_resume
> - domain_set_node_affinity
> So they shall be wrapped with CONFIG_MGMT_HYPERCALLS. Otherwise it will
> become unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra
> rule 2.1.
> Move them together to avoid scattering #ifdef.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

One further small request here:

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1115,35 +1115,6 @@ void __init setup_system_domains(void)
>  #endif
>  }
>  
> -int domain_set_node_affinity(struct domain *d, const nodemask_t *affinity)
> -{
> -    /* Being disjoint with the system is just wrong. */
> -    if ( !nodes_intersects(*affinity, node_online_map) )
> -        return -EINVAL;
> -
> -    spin_lock(&d->node_affinity_lock);
> -
> -    /*
> -     * Being/becoming explicitly affine to all nodes is not particularly
> -     * useful. Let's take it as the `reset node affinity` command.
> -     */
> -    if ( nodes_full(*affinity) )
> -    {
> -        d->auto_node_affinity = 1;
> -        goto out;
> -    }
> -
> -    d->auto_node_affinity = 0;
> -    d->node_affinity = *affinity;
> -
> -out:

I realize you only move this, but ...

> @@ -1616,10 +1560,68 @@ static int _domain_pause_by_systemcontroller(struct domain *d, bool sync)
>      return 0;
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
> +int domain_set_node_affinity(struct domain *d, const nodemask_t *affinity)
> +{
> +    /* Being disjoint with the system is just wrong. */
> +    if ( !nodes_intersects(*affinity, node_online_map) )
> +        return -EINVAL;
> +
> +    spin_lock(&d->node_affinity_lock);
> +
> +    /*
> +     * Being/becoming explicitly affine to all nodes is not particularly
> +     * useful. Let's take it as the `reset node affinity` command.
> +     */
> +    if ( nodes_full(*affinity) )
> +    {
> +        d->auto_node_affinity = 1;
> +        goto out;
> +    }
> +
> +    d->auto_node_affinity = 0;
> +    d->node_affinity = *affinity;
> +
> +out:

... can you please add a leading blank here, to conform to ./CODING_STYLE?

Jan

