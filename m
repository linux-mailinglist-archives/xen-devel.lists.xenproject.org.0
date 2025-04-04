Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D33A7B838
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937810.1338691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bPo-00015o-Hb; Fri, 04 Apr 2025 07:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937810.1338691; Fri, 04 Apr 2025 07:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bPo-00014M-Ec; Fri, 04 Apr 2025 07:24:36 +0000
Received: by outflank-mailman (input) for mailman id 937810;
 Fri, 04 Apr 2025 07:24:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0bPm-00014G-N6
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:24:34 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db14ce15-1125-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 09:24:33 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so1512108f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:24:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec342827fsm38816255e9.6.2025.04.04.00.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:24:32 -0700 (PDT)
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
X-Inumbo-ID: db14ce15-1125-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743751473; x=1744356273; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=auaLW4yTsvLHaj2Z9Q+BT39O3gn1EqNmt23dPTPni8I=;
        b=aXK6mYaAXrO3BfPfjIAo5pS0Ey/UK8z12x3/06Kad+SCzHGIhIXPiaNaQy3kggouR/
         86QHnAiA7y/O0kgKEZTJk0omxsHtD0oICKPk7DQuwt4HO6YW9ynfrv7HaPjlQ+YXxkGh
         Of3YZaxkuhwMvl728whO4NJsK7F2DFcXTgj4o4/M7vBq0KKKsVTc5Z06Z+qlPR9kYvXh
         YWhuOfkmNT0bpdPxlPwVVA32ilWu+ZQffwEksVUQYDfZTdEuspfWSPvHa/bYGmxtAiNT
         a7XG3YYF8oPk9GHBuqvhfmR8c71BTu80rvU6ycKmki66El0mg0DZuPultCpZWuwF1y/9
         i+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743751473; x=1744356273;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auaLW4yTsvLHaj2Z9Q+BT39O3gn1EqNmt23dPTPni8I=;
        b=eX8Pp8Q4awwfLuRNBq3eru0re5tYLtHdcPkKgJF+PRn+5W4Owy+6j+yfp3p7GRASU/
         Qc97lV/HJ1Ct7cL1T6e8DcmKe3bZt6mHrfWyeSt7YjzBBwSgAsThmHOG8nOTzSyzP6Ni
         toteu+rfP3mlP3KHc9iBN3p/lcv8JN8KZZ0RSnsOymcGCRjM0nYU7H1zXSyW84AjVCNf
         rZVv7o6zowMBP2t7Xd2BRczaj0ZnnaVYimNAxCNzhMT/k+KfOzExF6gXzVmnlITZL537
         VdVq+U8JSRC1qcae8UjCiDPnOjxaWTkmzBiYWvMVKyjUUYdWrWYTXUmZ7yVN7rhvb0ba
         b1TA==
X-Forwarded-Encrypted: i=1; AJvYcCW3dmVPfmtcBpGT8MIFCdYdY3vIqYujVgel8PXOPizYOPBXzbJnyX6ftGXdmjVjHBhUIXNdBHRXjls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysiR/RHZr1ro7b4YvK6l1ZQz5ESIUSTzBSzUK9/+vhr2lnwx/m
	TPCRsDKGddCsldlX1+u9di/FGIdx6ks3X9qSx2/5dBMbN58qsg012GFqVaDzkA==
X-Gm-Gg: ASbGncvkwLsz9Nf4CrsAG3IuprLV/K3vtNGO0iSVo0Ximxb49aGloulggIBKIlZb6FN
	Uq+4nfXFQXhhvyel01QBSVpzE1sWZ72+l4YSO2cDt6yqrCiny79bqHPtlN5bB8LVg1kCCcteaKP
	x04ypZzbHtQ0ylV3QUrYYvPTlAI6N+mLOL2EzH3VuoayaEo1gkidPM2RoK7A04WXA3AkRqe8ANP
	lA2eoG5aAA39GUNABaSfboCwUeUj7L7aYS3KF4/GGo4AMvJ65S/UHClltRS63drNWp3/NZXXwIy
	qQBEa9POUo3yp2JvV3wt5i3rBqQoQgE0K1H+zKYBSHwf5by1eXLQNVROvEIinf6KEwx88stZe46
	hDROCGlRIqWnPVMBpzyFcLtihzoKaDA==
X-Google-Smtp-Source: AGHT+IHCw7F2XYeanlCsOs3S2P/DpGIpfoRjdAL2xzj1ger/vwpFJy1ALPYxKTYYrhwcZexPZyZ70g==
X-Received: by 2002:a05:6000:40ce:b0:391:39bd:a381 with SMTP id ffacd0b85a97d-39cb35ac94fmr1616530f8f.30.1743751473173;
        Fri, 04 Apr 2025 00:24:33 -0700 (PDT)
Message-ID: <2b8e33f7-7e51-4ab5-ba1e-9d30d14be3bb@suse.com>
Date: Fri, 4 Apr 2025 09:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/null: avoid another crash after failed domU
 creation
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20250403214829.128294-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250403214829.128294-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 23:48, Stewart Hildebrand wrote:
> The following sequence of events may lead a debug build of Xen to crash
> when using the null scheduler:
> 
> 1. domain creation (e.g. d1) failed due to bad configuration
> 2. complete_domain_destroy() was deferred
> 3. domain creation (e.g. d2) succeeds
> 
> At this point, d2 is running, while the zombie d1 is not fully cleaned
> up:
> 
> (XEN) Online Cpus: 0-3
> (XEN) Cpupool 0:
> (XEN) Cpus: 0-3
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Scheduler: null Scheduler (null)
> (XEN)   cpus_free = 3
> (XEN) Domain info:
> (XEN)   Domain: 0
> (XEN)     1: [0.0] pcpu=0
> (XEN)     2: [0.1] pcpu=1
> (XEN)   Domain: 1
> (XEN)     3: [1.0] pcpu=2
> (XEN)   Domain: 2
> (XEN)     4: [2.0] pcpu=2
> 
> 4. complete_domain_destroy() gets called for d1 and triggers the
> following:
> 
> (XEN) Xen call trace:
> (XEN)    [<00000a0000322ed4>] null.c#unit_deassign+0x2d8/0xb70 (PC)
> (XEN)    [<00000a000032457c>] null.c#null_unit_remove+0x670/0xba8 (LR)
> (XEN)    [<00000a000032457c>] null.c#null_unit_remove+0x670/0xba8
> (XEN)    [<00000a0000336404>] sched_destroy_vcpu+0x354/0x8fc
> (XEN)    [<00000a0000227324>] domain.c#complete_domain_destroy+0x11c/0x49c
> (XEN)    [<00000a000029fbd0>] rcupdate.c#rcu_do_batch+0x94/0x3d0
> (XEN)    [<00000a00002a10c0>] rcupdate.c#__rcu_process_callbacks+0x160/0x5f4
> (XEN)    [<00000a00002a1e60>] rcupdate.c#rcu_process_callbacks+0xcc/0x1b0
> (XEN)    [<00000a00002a3460>] softirq.c#__do_softirq+0x1f4/0x3d8
> (XEN)    [<00000a00002a37c4>] do_softirq+0x14/0x1c
> (XEN)    [<00000a0000465260>] traps.c#check_for_pcpu_work+0x30/0xb8
> (XEN)    [<00000a000046bb08>] leave_hypervisor_to_guest+0x28/0x198
> (XEN)    [<00000a0000409c84>] entry.o#guest_sync_slowpath+0xac/0xd8
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:383
> (XEN) ****************************************
> 
> Fix by skipping unit_deassign() when the unit to be removed does not
> match the pcpu's currently assigned unit.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Just one remark here: This almost certainly wants a Fixes: tag.

Jan

