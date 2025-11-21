Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A0C77C31
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168374.1494410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLwq-00016N-Lg; Fri, 21 Nov 2025 07:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168374.1494410; Fri, 21 Nov 2025 07:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLwq-00013G-I7; Fri, 21 Nov 2025 07:52:52 +0000
Received: by outflank-mailman (input) for mailman id 1168374;
 Fri, 21 Nov 2025 07:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8OZ7=55=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vMLwo-00013A-SP
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:52:50 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12bf1e15-c6af-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 08:52:48 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640bd9039fbso2872541a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 23:52:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453642d3e1sm3839441a12.18.2025.11.20.23.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 23:52:47 -0800 (PST)
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
X-Inumbo-ID: 12bf1e15-c6af-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763711568; x=1764316368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=axrZqBV3mKXmnVWG7OkKDfFPGKjg63rVz6AGDybPm5M=;
        b=Ki+Y7AIA5FbV8MN+LuSoN1EqbtVES4aXwaE/8vhrZzX/7ce9oh+6OJdpDYAaeSd8fr
         62Y/VeGhBD25JDTFQK+9tu5l9mVBwfIdaX24YAn8TDIXoqYnAvWFSIRQKVyFA7+jymzv
         7/esreJC2nmqefC4LTPZCsLbzzZDufxGNUkQdt/BVaHRqmZQpBxdZ18Yb44vQ1ew34E8
         E8Ph1PjrcZEpZBCxD3FkIaFBIJySi85qulKPPjmfUXjKY410qL0/VDJ/oss8LeewCVJF
         QHPjewE5F4hZTUbMc7JEd4sPJ66uSla0TP/7Gc6f5qNGvTvFN5hntXmx8/4aWYQNK+Qg
         lHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763711568; x=1764316368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axrZqBV3mKXmnVWG7OkKDfFPGKjg63rVz6AGDybPm5M=;
        b=NATx0jZqlgFFOXPUKU1qBB0s+vW8lA2xS7pGz5H1tTpvQNYeFdsYX2nRRtUsCQ52kl
         a2nt644qOoN99tplcNBQLUiH/DyQQItFX5QcxBStOwnx4l2cU1taXp5SCsdCkaNNJX7b
         giP+7minAIqLdO5n6B2sZGfmqqahk5fdV4iWgY7ZIFWNmWvT8IGyX3EBNFBxPqfsMvQW
         IiMsSfhhb6Zk/L9r3KCFdekJqns3P+kD885P2meZbTuus32Zv9NCgRmAwsPNEPJj5k/l
         vi901EoFa9M7WwEAlpMj0U9T9/Qbz0g8x4i/3Y0zHM9g/s5ZHGwQc9Tbv1e67+nkfJCx
         w0mg==
X-Forwarded-Encrypted: i=1; AJvYcCXsORYGkQzLW/hjOtJaP1V3bvOknL26qirV5TZd4DXUUoiPaTSQQx9k/YLfF3hg4y1Me/nihG4aXRk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZtX15zz0ZuT63Riot1cw8nU37KDEvecb7HZiWiIGsG1ROzMIp
	gBDfla0BIfJQsvFge0H/8HB5hLDbsVX+iDAWL8ifyGpYSMS6uoGk4GyxOlA1QHf45Q==
X-Gm-Gg: ASbGncu3e7KLPR0mfN/dIznOX7DzmEYPtRLeCs+0Zqccr1kvQ9DxFEgmN81T8cGAr0T
	tvpPKR326BKYKh4YWJm2tDgzuA/esv2hGeNcLYHkYXMg9+uKLGyBYt/jwgmm8bkDnw4MaPUj+2a
	5i3vtxYI7TNpcSO0eQhgcIpfriHvLGQ6PPxYox5hKHroVFqDwxEBf5lT87hMK2q5Y7BhcvXpxMX
	2PDmZ8RsE7MPWswmY2Mm6MPwA6ArwgAh9qZYfu5t54wYNHJeZlFy2axrTvXrcimAPt9XJkRGFlF
	rKocruNAhpYoQszmzSYmFfZzK8fThEvWvnU4941upFQBh4ztW+fftQML6ZVScxVweCCPZtVP60h
	FxX9yMRZPA6gB06P5wBA9A0l12i3Rp2XZc5MovUrkAg3e204H0Rrno/xnf46wEFKt1UkTd8Hx8T
	7OH6MgOvt5OC52scskzUTFrCYaqVQt8BPIA/D9Jx4DjBwis4661FtzlCK89mi39+qpMAm/gYvnD
	mM=
X-Google-Smtp-Source: AGHT+IEUazq+4UEnov9tO0s3PKNVbCmPEaIkIr/XM//dIafxPiubfB8Yq/bLH76W5CTSPPRNi+bl5g==
X-Received: by 2002:a05:6402:254d:b0:643:1659:758a with SMTP id 4fb4d7f45d1cf-64554677268mr1279770a12.28.1763711567999;
        Thu, 20 Nov 2025 23:52:47 -0800 (PST)
Message-ID: <04570040-beee-4150-907a-20ffacfda689@suse.com>
Date: Fri, 21 Nov 2025 08:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121074803.312568-1-Penny.Zheng@amd.com>
 <20251121074803.312568-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121074803.312568-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 08:47, Penny Zheng wrote:
> Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
> it shall be wrapped with it, otherwiae it will become unreachable when
> VM_EVENT=n and hence violating Misra rule 2.1.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v1 -> v2:
> - new commit

In which case - where's the R-b coming from?

Jan

