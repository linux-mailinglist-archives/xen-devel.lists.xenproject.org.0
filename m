Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K4iJZuClGniFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:00:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097BE14D5AA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235127.1538175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMYS-0001k0-J3; Tue, 17 Feb 2026 15:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235127.1538175; Tue, 17 Feb 2026 15:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMYS-0001i6-Fd; Tue, 17 Feb 2026 15:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1235127;
 Tue, 17 Feb 2026 14:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsMYR-0001i0-AK
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 14:59:59 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53277553-0c11-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 15:59:57 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4837907f535so30213365e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 06:59:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfafcdsm797593575e9.9.2026.02.17.06.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 06:59:56 -0800 (PST)
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
X-Inumbo-ID: 53277553-0c11-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771340397; x=1771945197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/CYrcFEt3vGVceGxtOUFzfPgovofweU6KoacVz4zb7U=;
        b=Z090uPW9vdcs2xqyNvMm7EYDdyTZnK/+v6oJmXDUFteHZfGRcKIPTNqx2wATY9f6gA
         kNqGDULtXF4nqyxrKH5AGhRXzCA8NI6z6HQ7YGVqbndDixb0TvCgDqcU5DDm2DDEUvYj
         sn9s/4jh303kuCv7SriV8y+v3xIhVzG+4QfgsC1AO38JMHpDMdv9PZ4pM64AV7bs1kFQ
         qM9xFSPy8VRhmb7o2cowaqJkSnNRlX3C3RR2VxD+Eo6hj20v+Il5nhDVzKJYMcBXwuZA
         4VSPWK+JxaZbfi/7c56gHmJj4UN25qEV7F6pxsIkJeVzM+R3Rlzxfk6oi+XQVu2e6iZ5
         HjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771340397; x=1771945197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CYrcFEt3vGVceGxtOUFzfPgovofweU6KoacVz4zb7U=;
        b=kV+P73wa/EftTtBg65x/Icx1HzQEnZVHJjQJdciQyryOUQgoivfdpmPUq49W1hR2Yd
         GUqHwPEFsp94hatQFmiYwbc0a8g/081SFRathEPW0ojlXfPhNZZtOcEq2JpZ4YFh0Mm2
         1zcRtBSuHNetWqQY+NoQeMZWMk/MQZ890J93gPUe8sJz3CYW3SQVJewsw2eGdoKv85cu
         WCyM9w4QgJ0BGm5pDORa5G5F2UPhdrYGk1RCIxaAohDycyqZLeJ0JM/KhUIO8y3rs8bv
         CsR6KUtaK2yCwJ/GOPP40TUnpMlL40xPy1Wz/xrZ1d+kS7Rnd7bXWL4qyXnnYL9BBPfn
         8MWw==
X-Forwarded-Encrypted: i=1; AJvYcCWBejBk7ghg5qA1AnyJImtuxEqh4YrkIrWIswEf90LZAEgBxRuqDnxgD2MalgeG1H7J+EG8gwLb6TE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFDzsC0trLCfwWhmBSnmKt/aV7PxDO3OOlD+s7KkIBak2I0s4K
	2ErdAub+Dy2YkmPLyHwx10EPF2ibSD9AuUfXrYKiAKR5vMwQ/EX9pyh57Lfkt9SnBQ==
X-Gm-Gg: AZuq6aK6FgBiS31DVuDHnSpKis+yvbNSAHUAJVRCjQTEaZ2oh16+tQ48x1gp/9nhFPF
	ak+JC31Q1ALqEA32Bkskp0scHccOfuEgQy/5P2NMirVAyf4Eqyp6W0Zud8btP6VKIZxWzfalw4y
	+cq+iyEbXY+DMZUe09dUdkhCLGQLAfxdfMd5k37xiDNmzYwffk3ZR89A24ElrBIU1ktzjuCkI78
	A5O5OBmh5z4c9qQn/L0zCDmg/iQIAm5rMCwBQLRj6LFovY1nZxpAmkI/7wJdAgXvkpoecV+me8p
	ruvT4O4wZd6G8biaqrnSOnMIyh8/Cco1JZTKvXapLgMOYK0Cg+ijxDkx5Ku3xgHsnItap96qwYH
	rwW66O7RWzhDRIsyw3JsSoL1SgX7SlXH5O9JsvLM1/wto+mXN8W7LW8dbWO6YwWzb4qClIM0hm6
	HWRoP2lGMVFXbYZXXfCyPkN/In7TCIJQbkiZz/yN8C+HNtxjItPXTxw5C4EFIr+rO36ufmEWbY4
	uKGtNSOmky0klY=
X-Received: by 2002:a05:600c:6814:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-48379bf4788mr187254045e9.34.1771340397037;
        Tue, 17 Feb 2026 06:59:57 -0800 (PST)
Message-ID: <f7a05f4d-b547-4b5e-aaa5-88e249c88b4e@suse.com>
Date: Tue, 17 Feb 2026 15:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/16] xen/riscv: introduce basic vtimer infrastructure
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <7426e2d974bfe67786c67709d487c7f64c22ae58.1770999383.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7426e2d974bfe67786c67709d487c7f64c22ae58.1770999383.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 097BE14D5AA
X-Rspamd-Action: no action

On 13.02.2026 17:28, Oleksii Kurochko wrote:
> Lay the groundwork for guest timer support by introducing a per-vCPU
> virtual timer backed by Xen’s common timer infrastructure.
> 
> The virtual timer is programmed in response to the guest SBI
> sbi_set_timer() call and injects a virtual supervisor timer interrupt
> into the vCPU when it expires.
> 
> While a dedicated struct vtimer is not strictly required at present,
> it is expected to become necessary once SSTC support is introduced.
> In particular, it will need to carry additional state such as whether
> SSTC is enabled, the next compare value (e.g. for the VSTIMECMP CSR)
> to be saved and restored across context switches, and time delta state
> (e.g. HTIMEDELTA) required for use cases such as migration. Introducing
> struct vtimer now avoids a later refactoring.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with a question and a remark.

> @@ -126,6 +130,8 @@ int arch_vcpu_create(struct vcpu *v)
>  
>  void arch_vcpu_destroy(struct vcpu *v)
>  {
> +    vcpu_timer_destroy(v);

It feels pretty late to do this, yet I notice vcpu_teardown() doesn't invoke
any per-arch function (yet). There's arch_domain_teardown(), though, which
technically could do this for all vCPU-s in a domain.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/vtimer.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * (c) 2023-2024 Vates
> + */

Is this correct? Is this needed here?

Jan

