Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ECCD23AA5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204579.1519212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJtZ-0006A6-Jm; Thu, 15 Jan 2026 09:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204579.1519212; Thu, 15 Jan 2026 09:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJtZ-00067W-Gy; Thu, 15 Jan 2026 09:44:01 +0000
Received: by outflank-mailman (input) for mailman id 1204579;
 Thu, 15 Jan 2026 09:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgJtX-00067Q-Vv
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:43:59 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b218b89b-f1f6-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:43:50 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fbc305552so600082f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 01:43:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6fc8dcsm4810165f8f.40.2026.01.15.01.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:43:49 -0800 (PST)
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
X-Inumbo-ID: b218b89b-f1f6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768470229; x=1769075029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ym6iT70Yab7br6NcL95LFB2EK7PsN+GafLw66limSd0=;
        b=WeulC2/yOGP1S7c5z1TsxzfwaPmYrV0DADFR//m5ZKq6efPTKkJsgW8R8UTm2D3ZvI
         JfCwdcUddpWhUHl+sn2jvoeTIjXj0RbI376wKzwK5K7fCXkitoa4CT6dsVDPvdp/NEYC
         hH5l+nD/jW2MdoaXTUeZ8c7heT0AmgLa9MlXtdrrM7+28meZwd0nymZHX5U7ct3EOo/K
         tr/vcgCr/dMw7Yb7V2SxhkOyPPyhgiX8g3aEmtaxD9+uFmoIW/Xy9NL70vYBt5Nb9ynu
         Ycxi10b6+KUtD2ZXEzhFlnqZu+Bz3MHgj4ga/KEMFW+eqIVPM6RkKoR14FMkJUFlanBy
         U5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470230; x=1769075030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym6iT70Yab7br6NcL95LFB2EK7PsN+GafLw66limSd0=;
        b=ke6a3QphFyvnGNNLI059S6hzCD9QV54Nr64dyABNzvqQ2AJfERrJ+QAovmLRGAExjA
         Ml+dNG9lXAo920WetBJh1lMBnJvDEbzz7iKeRYHIqQ9k9HA7zJonpb4GNpFIlnDAgSTG
         x4UGLv6iM+Mzr0e/XhA9yLbs3/QnfsZLxPKqxpOnh3MUehFahIlJ2kzImWe/nNik3qU2
         fgJtbunxAVkEtMKf/1kxGnFn/55B5NxvLxHhgjcYjxu0BTk4NdyXSw7F7pki/CO+/K3v
         HYzNGeRAd6Ub/QE2nrXVn83K4tLXBPlZTua3stiZdfXGTPNcqO+Fd19i3oL/CtFmD0bf
         YXog==
X-Forwarded-Encrypted: i=1; AJvYcCVSaABLQ7Evk6gpwGrpMPp/64HU8/JIeJwVGhxuv1fmDr6lFGxwpBE3ZtuEar50Bg67596Dfv0VDY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpltcDfY+bnIzuNVUg27cjwBtJ5T9hU47wq4ts9n+eVlfGoGC1
	4kT5T201O1i4GR8JBTMPdRAuTQ+AKlKhnVtFcQTaLtZ07AdyCDGddT43C98X9J+ZOA==
X-Gm-Gg: AY/fxX6nBPjTjSjpIsuIdXFipbyH+iNEMMOGaNWRVw+K2OfyvE+99phMZ5mpPVEb8IV
	nEgFkH5sN+2pK8r4t6vugPF18zslK7WHkiNpcOjs1DtBjrhIOXLxIg9sRwvid1b0SzMNm+b8QtK
	5zbYAXz+yhUy1+fn3DFYXpzRXcip4FcUkBswmwMKSBrumHJS1PI3yZzfWG3xBJJWEO2jsvagWmN
	BqnpXnXGBgLnt9iueL7YlDo4TEfiNtUy8IAzYR90lUUnKXATKZf9dWWtuzqW8XtbRHJ7utX5zVq
	PdhrtN3I0IZO4lpVCNE/13DMrEu+BMAzxA5cSLNYh79hNb/GjgoXhrsAcy69orYoyKqHwNIQBRv
	w0O9TwBYzF8UbiSYFigoDwnUt9CzLuYxy9D4HNRzAeekaJ6JdYm2CF8n7G3ewlKSwls+i4RKExV
	mkTJX5QWKi7pvM+yo3+sNFublBjbu2hm0Y/5rlZc92ACpM8HXIF3jRYmOdlVh6BYG7GvvOKGV25
	GTl7y7PMozOYA==
X-Received: by 2002:a05:6000:4301:b0:431:6ba:38ac with SMTP id ffacd0b85a97d-4342c3f0fcemr6936879f8f.4.1768470229637;
        Thu, 15 Jan 2026 01:43:49 -0800 (PST)
Message-ID: <a3983e24-1664-45c0-ac62-020d08539336@suse.com>
Date: Thu, 15 Jan 2026 10:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/vm_event: consolidate CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, jason.andryuk@amd.com
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20260115092841.2651224-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2026 10:28, Penny Zheng wrote:
> File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
> routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
> 
> Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
> MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
> CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and
> make VM_EVENT=y on default only on x86 to retain the same.
> 
> The following functions are developed on the basis of vm event framework, or
> only invoked by vm_event.c, so they all shall be wrapped with CONFIG_VM_EVENT
> (otherwise they will become unreachable and
> violate Misra rule 2.1 when VM_EVENT=n):
> - hvm_toggle_singlestep
> - hvm_fast_singlestep
> - hvm_emulate_one_vm_event
>     - hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
> And Function vm_event_check_ring() needs stub to pass compilation when
> VM_EVENT=n.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> As the last commit, plz be commited either in the last, or shall be commited
> together with prereq commit 8d708e98ad, 8b4147009f, dbfccb5918, ae931f63a0,
> 37ec0e2b75.

What do these hashes refer to? Also (assuming these might be the hashes of the
commits in your private tree), as I'm pretty sure I said before, committing a
series in-order is the default thing to happen. It's patches that are
independent of earlier ones which may want to call out that fact, for them to
possibly go in early.

Jan

