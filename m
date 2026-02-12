Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ETgK4qljWlh5gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:03:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA8C12C30D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228616.1534759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTXw-0002NH-0t; Thu, 12 Feb 2026 10:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228616.1534759; Thu, 12 Feb 2026 10:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTXv-0002Kc-Tx; Thu, 12 Feb 2026 10:03:39 +0000
Received: by outflank-mailman (input) for mailman id 1228616;
 Thu, 12 Feb 2026 10:03:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqTXu-0002KV-9r
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 10:03:38 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 189936f4-07fa-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 11:03:36 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so29136185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 02:03:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e50casm178976155e9.8.2026.02.12.02.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 02:03:35 -0800 (PST)
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
X-Inumbo-ID: 189936f4-07fa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770890616; x=1771495416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MRrpqk0bOHKc46TE0OkHA5qgeh7iecJtY+B0HOhlW1A=;
        b=C+ll9VeciQ/o7nun1KDY9jTCnBCp8UPQyNyTnlaEntoE3AUsM1CGaVqlPe1PFt1x/o
         8CBLS2pnzkr3ir0sqtBpWJUCm6S1SVYu893aHCTFfdwhsPFQNMSqsahmLF9qAmzz9e/B
         pjTSDvvfDzYnpmVYtjVWjEJb6VWmV/TUS0F4r/Qps4Ff7aE8w9xPZfVi1AMCC7bw0fAH
         xE9UL64+DJ9pkqjhR505KJEUYJXDceXf62/+e70gTXFdAUQ6De3yo6QQKPAlO+K8A9CF
         E6WzseEAbdle/nYUg0GN7NddqRIDm6w/m8YRSpzrgauE/9k6Rdx2MgFzXSKOyZwx5fvL
         tw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890616; x=1771495416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRrpqk0bOHKc46TE0OkHA5qgeh7iecJtY+B0HOhlW1A=;
        b=eg8gWPqqGAfDB0WQV4Wo6j93ISB5bacdbTwJqczqM13Its9/0pAdWxwTBhGYFh/M6+
         Z5HqZLsIQWEtZ//IfMn5OYC6qVjRvBY1VQvc8Sn654cegGslQmuBd+HhW7u7hsCgMOs0
         7XiDeIc5tQqqrbJXnowd5OzFn8boDnKpRBbUy3T3z5XajCtlIKOeFEBa+wb4KZ9wR+3P
         zKUqOM0zRMYKN6SHw2rAClhIlQhCnvFElr3FW2PFrk3gsHqKdvD19GFkhR57SQKP+k5x
         GlUKxcH2retITQ+Qy0ovUgOjb7GbQsoRG0kTR8KL/qGsgeNOaGpIGfAQF3zzgYEyTpSR
         tghg==
X-Forwarded-Encrypted: i=1; AJvYcCVRm7+TnChxm6krXO8KK3yfJZWMcj8Qy5Ei8Is7T6G7XAeeOu5omkDSa7OqNw6G6b0Vy/MC4nojqPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJEmpLHKHABp5JZ/luOda2NXmgTTAiKccUoqLjXrJssyzysTrL
	obDr4Qjvd5HAvdRM/5+0pZkaQuZ5wO9un2z2CrIQ4Z+8UyIch3MrO94WQxFg9+yxcA==
X-Gm-Gg: AZuq6aKzDdFgfb8NDmbotgBZxFrCSxbmBp9XwbmzDaVVUb0woWvg+nnt7P0gMmf+6Z6
	qgM5mrArWJCvir9a7zVsm31Sw0NHz46kZnYMZ5uW2pSZhEOrvvyBFs9+3IWquLiCGKGcUzTCnjN
	haINd+LEjnSMWHee/0/JIBTntAgajhVFHXKHCh8SSqG58wgUgC2wBI2Ldx55w7avEjf974IflcI
	XK6jBi+/8BpxGgf7RamfypzgSlQTPlGSQl+JS0+G5y/xNQn+DojTmc93NwBd2M2zkAJslVMp1iS
	AyzQOfcs+6cWf1IRN5EGgyKqZPllvtQ4wos+o2x6LD5mtEbLCdneve9ZkseuqP0275uZz09HxRG
	gehg/8knH5zzqFHOfj7oxr4t12Ucv4Cv+12fOU73+t8nn1qRuS92f5XLydbiC2Z8k55QhNdkPsK
	r+9I6RlzD1iwfn7G5qGhNFhm5W7Ccawt7AZCnIt3KWSzpMGgw2tok8ATealPCz3aKK9eHBqBodp
	FlV04oCU6p993Y=
X-Received: by 2002:a05:600c:3b12:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-483670fac0fmr22352875e9.5.1770890615552;
        Thu, 12 Feb 2026 02:03:35 -0800 (PST)
Message-ID: <f0f6b292-1f8f-4991-a76f-fd4a1359199e@suse.com>
Date: Thu, 12 Feb 2026 11:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/riscv: add support for local guest TLB flush
 using HFENCE.VVMA
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770739000.git.oleksii.kurochko@gmail.com>
 <af269cb7b5c03f0661982d41d3d7f1ddde761eeb.1770739000.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <af269cb7b5c03f0661982d41d3d7f1ddde761eeb.1770739000.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0FA8C12C30D
X-Rspamd-Action: no action

On 10.02.2026 17:36, Oleksii Kurochko wrote:
> Introduce flush_tlb_guest_local() to perform a local TLB flush of the guest's
> address space for the current hart. This leverages the RISC-V HFENCE.VVMA
> instruction, which is used to invalidate translations in the VS-stage of
> address translation.
> 
> As for RISC-V binutils >= 2.39 is choosen, we can use hfence.vvma mnemonics
> instead of defining hfence.vvma using .insn.
> 
> Although it would be possible to use sbi_remote_hfence_vvma() for this purpose,
> it is unnecessary in this context since the flush is required only on the
> local hart. Using the SBI call would introduce additional overhead without
> benefit, resulting in unnecessary performance loss.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


