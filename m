Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBx3AKdcnWmxOgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:09:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9571836E7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239508.1540908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vunTZ-0002WG-Jg; Tue, 24 Feb 2026 08:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239508.1540908; Tue, 24 Feb 2026 08:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vunTZ-0002Ur-Gy; Tue, 24 Feb 2026 08:09:01 +0000
Received: by outflank-mailman (input) for mailman id 1239508;
 Tue, 24 Feb 2026 08:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vunTY-0002Ud-8f
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 08:09:00 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 126b9394-1158-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 09:08:59 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-483a2338616so33099645e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 00:08:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b66932sm270989295e9.1.2026.02.24.00.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 00:08:58 -0800 (PST)
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
X-Inumbo-ID: 126b9394-1158-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771920538; x=1772525338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kXaOAysdjDjXPGk8OV2XcQA2x+8/aoMXAZD0ZSYWRQQ=;
        b=NcLnxWGDXxsDvkBPHobTfzjnzl5co50LQNNBExvpWNIQgrwNJdSPY1TMWOa99hcnUH
         KDBsJwtkkQqgVgu3QaujvpFb1Yc5vDl26oKUR5i1Xiv2c/mlm8ib2azD8hQDTXTWIkGw
         6C+ez+tlwMoOajNnNdpVqkkplzk8H0KUahtlH6vSjwg+yN2e/IrNF8DJi+4psjVhIvUM
         EkYqQibM7DMprAQSGtonqvUDHZZ2zDJgDHdXW1gBis8wnr1jT16b9DmbeN8o1JSex53d
         NC1Xp2rBqHCFpSm6Gl1vKzmvM+rHrN7v2Jj0/qtEHu+zW9W4sjKPhL/d7ZLFNbwVTJpp
         rrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771920538; x=1772525338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXaOAysdjDjXPGk8OV2XcQA2x+8/aoMXAZD0ZSYWRQQ=;
        b=bWVvZWP8NDB81UnocIIGXPPdzr0p3s71Ang/MwkTUN4fifPodzQ0P5zOqJZpeODDKn
         jmlwFDJvGi29n8uTgTEF6UZy6sZeH/ChaTGEzJcMuuJjNrThwQ7LZQxtorPVtrcYEnFG
         /dGpei8E3bXbxfXfejwRPdhnFnfe3n6l8oh6ZtEs17M4dd8sXdgx9KdO8M9u4lDxDPPv
         QVDLZOXNqYW0LZ+NzRAfE1suQt/Npq/OWCMEft62ymxAyAhkBM9g45kawp2RM9QTjQS6
         qSH3WzMafCuWxk9rAZh4Nm2I/5dRLVDmLnPoOeOXUoBCEUqrmcYGPbWt87EOil32QccA
         zA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCU80f2FDtHMFxwt1C06ZEuBRrdZqoyTig4sfZlSaumcTm70h++4jMmaPL1k6Q6ewCQ5N35ao9Y18=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX7Q1/pnW4zw/lV+mQTz78PdlfsUKPWw6MDaYloS/3d3hMrlm3
	5P/V0ZP1dEQiFn05/LF/t9Gcc7g4BxhsIZk//bETdXObSzQj7B1wcAa8512ML8h1Yw==
X-Gm-Gg: AZuq6aLYkqjKluaUctkv5V/Kd3cHqW2yaCX7vKtSt9BK4pHgH94Y8vSmzVPCZ+L8bw4
	WLU26UFa9gX0f4McF8K7uvQZBMLrm8j9UpMsqcKPxAV3NYDrgi1ZkXeU64FSoEwQL5/n2CuMYmg
	WfUMnPhze51bxzSqEiZUa7JYG9QW1juv2LJrb1DCrqSw3vRslqfznwNB/4UXPNMv7B5woqd0vzi
	y62xFd3QCMqigW8rIRm3i1rTxHEEmCeASdxe/rKTk6s3NkU0SVb1029auG+pDHqvSS2kGSok98I
	w6dExBjYp5eu/6QZZ9OvoIwo7bwTmf/hrYbZrkdsiWnaEeRft+5sTsaUkdb3PZOqiLnKOZEQ4Om
	4RRm3rJDUy2LPNJb9ObdQXbaxi4hNTg7viYWtUBXmRvlIe17+lhLUiY/22bUNCm7qNukc7DtovD
	hYJfnbUgORHs89knrqhC9d3KeRGs8jbv8KsqqLo65a52/gh8I4ROTa8MUlKv9l3Pbn26P8MEqN9
	QpdoiWkov2A7Sk=
X-Received: by 2002:a05:600c:3e8d:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-483a95f5a48mr175401875e9.28.1771920538419;
        Tue, 24 Feb 2026 00:08:58 -0800 (PST)
Message-ID: <153082ae-4bf6-441b-8222-09aee302db87@suse.com>
Date: Tue, 24 Feb 2026 09:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] xen/riscv: implement vcpu_csr_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
 <3d301ac4ca901f0aa471d6c4234301a0199fe5f7.1771590794.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3d301ac4ca901f0aa471d6c4234301a0199fe5f7.1771590794.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8D9571836E7
X-Rspamd-Action: no action

On 20.02.2026 17:18, Oleksii Kurochko wrote:
> Introduce vcpu_csr_init() to initialise hypervisor CSRs that control
> vCPU execution and virtualization behaviour before the vCPU is first
> scheduled.
> The function configures trap and interrupt delegation to VS-mode by
> setting the appropriate bits in the hedeleg and hideleg registers,
> initializes hstatus so that execution enters VS-mode when control is
> passed to the guest, and restricts guest access to hardware performance
> counters by initializing hcounteren, as unrestricted access would
> require additional handling in Xen.
> When the Smstateen and SSAIA extensions are available, access to AIA
> CSRs and IMSIC guest interrupt files is enabled by setting the
> corresponding bits in hstateen0, avoiding unnecessary traps into Xen
> (note that SVSLCT(Supervisor Virtual Select) name is used intead of
> CSRIND as OpenSBI uses such name and riscv_encoding.h is mostly based
> on it).
> If the Svpbmt extension is supported, the PBMTE bit is set in
> henvcfg to allow its use for VS-stage address translation. Guest
> access to the ENVCFG CSR is also enabled by setting ENVCFG bit in
> hstateen0, as a guest may need to control certain characteristics of
> the U-mode (VU-mode when V=1) execution environment.
> 
> For CSRs that may contain read-only bits (e.g. hedeleg, hideleg,
> hstateen0), to the written value a correspondent mask is applied to
> avoid divergence between the software state and the actual CSR
> contents.
> 
> As hstatus is not part of struct arch_vcpu (it already resides in
> struct cpu_user_regs), introduce vcpu_guest_cpu_user_regs() to provide
> a uniform way to access hstatus and other guest CPU user registers.
> 
> This establishes a consistent and well-defined initial CSR state for
> vCPUs prior to their first context switch.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


