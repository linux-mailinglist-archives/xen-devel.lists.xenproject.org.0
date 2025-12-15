Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082FCBE4F6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187108.1508527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9gM-0000Oo-Lr; Mon, 15 Dec 2025 14:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187108.1508527; Mon, 15 Dec 2025 14:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9gM-0000NH-Hv; Mon, 15 Dec 2025 14:36:14 +0000
Received: by outflank-mailman (input) for mailman id 1187108;
 Mon, 15 Dec 2025 14:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV9gL-0000Mt-1Z
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:36:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 620d0544-d9c3-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 15:36:03 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso30964065e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 06:36:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f8d9d63sm193080465e9.9.2025.12.15.06.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 06:36:02 -0800 (PST)
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
X-Inumbo-ID: 620d0544-d9c3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765809363; x=1766414163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8HNE3KsT10Gu8iGQa33UkZvAqiC6P+LoVYYfSwcllDE=;
        b=AkHwR3avq1j8XKLgRg/i7sENjgSvIAb0brrogoeUcbXzn6HfipcFopz+E7wVWCuTIz
         SmKbljJtkutAgiPyAg2X62sZD7y7VhLQHCJTGUqhUcoKZV2gFmteBJ1AJ4t2cJ0U8Tuv
         FH++6ncdTw3wxrKn2MUOL3/gzZu5AiYWI7UGuN5xvkjNI5FzqF3heL3X/6BDl7t3aG0n
         LE6+V2fnGGZP8zjAsEexG9y6/2jyDtL3E8fwX6/f9N7sjhB+rZCSWmc/CNLeEBYLrlo3
         RixV8d9VpMGWUIv7uXWQoLFJdQAVnO6aMVjt485EDCP2/3NaZa9zwwtmMTvYjo9KNYe2
         E6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809363; x=1766414163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HNE3KsT10Gu8iGQa33UkZvAqiC6P+LoVYYfSwcllDE=;
        b=ie97i582m7U2HowtSurNIGXkBuZ0DANPZWJpvWFUSKFM0BlFw5fStnrq1N1oEWR2DI
         LK5KEkW7g7uyRVpspsCQ75XJp5x1B3WYNPqSfMJCW2Em0d1YId+dMQM3eCEQOkfcr83J
         w8FPlO/CWJLffKhctblEjFdkhhK77GHYAj/oGajURlt6L43LxvNOYsk60AZfAgbXBjox
         eiciNzVOigX5As8Ms0f4FikCyYfC0pYGFLgUaD94dWyPcnRb1pIl5+M8/mPZGAj5mECx
         //ASwSanHFBD1Z2icIzqjEv+4kIOB7RMgBIVX6T3lPnevA8X61OL1vTFyTCo9cnw2Kwu
         CCrA==
X-Forwarded-Encrypted: i=1; AJvYcCVUdY59GbIpmzcPQVJN9rwe9mhXlxFSjF4Yc0bre3ChPEVkEhPaAnbKp8zl6h0raDj+9A6c4mSUU7A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRlKg6dSMh0MUgAHazdL5a89iujS5Hz/MMlihXY1UU7h8HPYZw
	PhcjsSFov5EklnOWKZBJ0go6qteuBlAF3e91WkPjgW3imhtRzAgsCwV45U5SFwi0DQ==
X-Gm-Gg: AY/fxX4F6iMT+v7QTAmFUSHIUzu1a1l98XCH7D3LcR0UxGPVyTGNcHIQdrL61yVDMRF
	dFyca96pSYQtrhPVa5lTSoVs/owjJcFjde1az2cvjgx4kLL044SddSVTwuzZpP+gkWTF52bG6SC
	itMaLG8a7Y5/MiTys9BYC6EK1RM+jUySIkqzYnl9GrQ8k1QnzgaQ3FoHB4bqGI8mKmA/rtBswhc
	NTcTB0ibe88ulDhIp6cZdvKgLwSziv7UGA5x3G9sqp4dmw3rOfHzfdAHK5Es3o4x3PR9tK1pz79
	B2ClNmKXsZ05JzDKBpJOvc5sFD9ZEjwD4whXjsbE/BwZIIS09c5Yy2r/GI/M3W4tbrkAkUSnf75
	QHcH3VBZFwOoMe2LaEG1ewoVVEQxNRx8OjWnFlGaGut9k936NWFjBB7j/pBSJi1U4lvoNLTp+V0
	VjjwdFG8xDoFOtQ7I0n8XzvOGP09R86gShjW9stiKHNZGMJKcQCBXBLE9CaXLF/+gNBPiyf8yKZ
	PA=
X-Google-Smtp-Source: AGHT+IHPJYeHA6Wt1nPml8ZSR5yFRkW9b9B83xaqda6JWPzwd7/5FpwFoz/k2hvX0pIWW/6hLbQkJg==
X-Received: by 2002:a05:600c:828f:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-47a8f90cf2dmr100589275e9.32.1765809363093;
        Mon, 15 Dec 2025 06:36:03 -0800 (PST)
Message-ID: <bdeda156-8492-44de-8092-1bb4e585445e@suse.com>
Date: Mon, 15 Dec 2025 15:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/24] xen: decouple PV_SHIM_EXCLUSIVE and
 MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-25-Penny.Zheng@amd.com>
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
In-Reply-To: <20251212040209.1970553-25-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 05:02, Penny Zheng wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -216,7 +216,7 @@ long arch_do_domctl(
>      {
>  
>      case XEN_DOMCTL_shadow_op:
> -#ifdef CONFIG_PAGING
> +#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>          ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
>          if ( ret == -ERESTART )
>              return hypercall_create_continuation(

This, in the end, is open-coded PG_log_dirty afaict. Question then is why
not use PG_log_dirty here. If there is a good reason not to, it may want
spelling out in at least the description, maybe even a code comment here.

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>  obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> +obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
>  obj-y += domid.o
>  obj-y += event_2l.o
>  obj-y += event_channel.o
> @@ -70,9 +71,6 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
>  
>  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
>  
> -ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> -obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
> -endif
>  
>  obj-$(CONFIG_COVERAGE) += coverage/
>  obj-y += sched/

Nit: One of the two blank lines then wants to also go away.

Jan

