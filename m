Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72244C6327D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 10:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163520.1490615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvV2-0007IQ-IT; Mon, 17 Nov 2025 09:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163520.1490615; Mon, 17 Nov 2025 09:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvV2-0007GF-Ec; Mon, 17 Nov 2025 09:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1163520;
 Mon, 17 Nov 2025 09:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKvV0-0007G9-JS
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 09:26:14 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73b1cbb5-c397-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 10:26:09 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so6971604a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 01:26:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b2155sm9674600a12.29.2025.11.17.01.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:26:08 -0800 (PST)
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
X-Inumbo-ID: 73b1cbb5-c397-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763371569; x=1763976369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BKjDAi0ec2USBXlFJ3bdHpd9TNQRFpY7FQr6YKiiTu0=;
        b=b6caoej9ahd+SKWHIbpobWonWFr/EpTJMmUbfXC2+6DGIddWGsuK76bOXgVxe10IAY
         5l37nZmx9xGXtIS5OkMEKaDtBeeYQKMvpe8o3Z6v6WKfEYDnory5gH+AqVC/Sw5xbUbh
         ra7Bt54iScSVSNAYqyxogjd1EROrtzxDPcoLBgJeIMdJJDOzT71+o3LG8sW2Py6JBHBM
         sgAJg5IgGtsHNb1aQcj22bTWrWPGN0aP0mgM1OrSzmtXiVy6IGsnIYKaiP4lUhVt3Csf
         cZpCYAhYP207f31GHyEqbuUV5AT26iG0TqEv0RcVP5jgjQ1BxmdbAzq9Hh5p6fw8KMKu
         mW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371569; x=1763976369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKjDAi0ec2USBXlFJ3bdHpd9TNQRFpY7FQr6YKiiTu0=;
        b=m7oOOq/2P7N0UDzDUgy95aLnqrQLJFLBdNXCHcLPl3Ohh+ztpMtJrKY2nP9Y401FxU
         pfAyUPmiQKuiZMXMAfbwi44TGL6rfUqo8nAvazOY4gSqqv2/MMKmVAh05xMcp1EiJjF+
         Qs0a89L8PKVr8fN/CeDE4Q1gs+CQ7wrsWWi7iZWauyBKxNjGeJvJ9ohLT/yHsha5z2B/
         O1jjd9GJu6g5ssJ2vB5Y1qcmdFPQ/OM89IqV13dCWFYIG25UJM7zhO6R/mLMj5PB5sXL
         oqPctP7cKT5/eC2Xve85QlZWdKNDcZsulmKZgpRjamPg7GzMcf+GAKfQU4erVsPiOZal
         M0zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSOMsc6fdolKeDEqUhhlJLy5WGqLP91nYYdK6Wuf3fFh5mVygMPFN7fiAre3ZffgC8t93ET80hRoc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybY9ZP2cUUKbCJfFvpQfxkMLKNyH1AmT6PDvodx5q1sceNr5TZ
	5YKtOGCoNCLOxhSfb5RT1MnoMTD71UtdRqcLMWQw5VrA3AES9Vxx+ssML2OTmX3Dug==
X-Gm-Gg: ASbGncv+3q4tgUB24xNBt53bVdCPs/GFQ7UqpbBTmADytKHMpZv9gNt32pnAduDjVLq
	QgzEJ8rZf2gKvTQaISacQwBggQ3fshbY2tWGa1/yYjiTCjoHYPx5W6DA7cKVJaVFqrIH61s1c46
	fbIGM4xV/0DPF8fDePQ0U1ARTJmp8KVoSx1cX512evWY9RKbu6NkNWmiL00J3Fr+GPRPKYvrixf
	+syanSnx5k91Tx5jKEj0dHLxIENLNhDd+h8s8DfeCTHjAV0jrDqu548a4krU4+5ZW4xNRzeRrNG
	WKcbdgPyukWDwt6ZWONkzNPOBUlE+HNdI+JsNIzNFEXF8DxzzO5pAzbUSZfM/B28DE/qmiIT7mx
	rGgNKbIU0YHUXsQ1+9BKsqTV6VCv1BTBFfcOfR6PjKjzcOpWyVbe78Y89+pSQKym+HO7phwCQph
	ugsZvjzhQHVjrxIUiHMC9UGUpdTm0lAqM+lZjigBFtOtYSS0C/4JugUbrYWxUnjy56ysaKlyQRJ
	Tw=
X-Google-Smtp-Source: AGHT+IGSJ5zWrw1JjwXGiwCDLQxjhXxBpw9cYhBuWJdCX0vhBR/Sw8Z0QxksWmuif8Z0z6j7VjGiJg==
X-Received: by 2002:a05:6402:27c8:b0:640:ebca:e682 with SMTP id 4fb4d7f45d1cf-64350e8a783mr10393485a12.21.1763371569274;
        Mon, 17 Nov 2025 01:26:09 -0800 (PST)
Message-ID: <fadc4456-17d1-4ba5-9623-db928238f3b8@suse.com>
Date: Mon, 17 Nov 2025 10:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ioreq: Check for out of bounds vCPU ID
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <f6cc34ce96693545ba9b8db6fe668c37c80f16c5.1763137553.git.teddy.astie@vates.tech>
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
In-Reply-To: <f6cc34ce96693545ba9b8db6fe668c37c80f16c5.1763137553.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2025 17:32, Teddy Astie wrote:
> A 4K page appears to be able to hold 128 ioreq entries, which luckly
> matches the current vCPU limit. However, if we decide to increase the
> vCPU limit, that doesn't hold anymore and this function would now
> silently fetch a out of bounds pointer.
> 
> All architectures have no more than 128 as vCPU limit on HVM guests,
> and have pages that are at most 4 KB, so this case doesn't occurs in
> with the current limits.

DYM "at least 4 KB"? If there was an arch with 2k pages but 128 vCPU limit,
it would be affected, wouldn't it?

> Make sure that out of bounds attempts are reported and adjust the around
> logic to at worst crash the offending domain instead.

Wouldn't we better prevent creation of such guests? And point out the need
to adjust code by a build-time check?

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -100,7 +100,14 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
>      ASSERT((v == current) || !vcpu_runnable(v));
>      ASSERT(p != NULL);
>  
> -    return &p->vcpu_ioreq[v->vcpu_id];
> +    if ( likely(v->vcpu_id < (PAGE_SIZE / sizeof(struct ioreq))) )
> +        return &p->vcpu_ioreq[v->vcpu_id];

Imo you then also need to use array_access_nospec() here.

> +    else
> +    {
> +        gprintk(XENLOG_ERR, "Out of bounds vCPU %pv in ioreq server\n", v);
> +        WARN();
> +        return NULL;
> +    }
>  }

While I'm generally arguing against such needless uses of "else", this one
is imo a particularly bad example. The brace-enclosed scope give the strong
(but misleading) impression that the function is lacking a trailing "return".

Jan

