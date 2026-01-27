Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ieQ6GiOCeGmqqgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 10:15:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E19190D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 10:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214125.1524511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkf9x-000444-6G; Tue, 27 Jan 2026 09:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214125.1524511; Tue, 27 Jan 2026 09:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkf9x-00041j-2p; Tue, 27 Jan 2026 09:14:53 +0000
Received: by outflank-mailman (input) for mailman id 1214125;
 Tue, 27 Jan 2026 09:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkf9v-00041d-C1
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 09:14:51 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1b0e417-fb60-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 10:14:49 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so3171714f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 01:14:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e7156dsm37369101f8f.20.2026.01.27.01.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 01:14:48 -0800 (PST)
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
X-Inumbo-ID: a1b0e417-fb60-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769505289; x=1770110089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=70SkXzfz76UseVgNS1JovfLNpfYQLaRtH/QS4N6l5Z0=;
        b=Pw1X1wsGYDRcNcg9aBbdI55QYT9Hi/TzjSNkM8Xbk0AnN50MNpZyDg5iQdQpxPs95Y
         MTl3XGEGWCXQ0MLttPQ9FDMPj2rkri8d3LTnZlh4TJFDAR2CT6ItrmlB+dGP8kIQ9Dln
         3S6vHWpn8D8dMEqjLU7vhWSf98U+C0wzQOBbJ1VEdpY14kdN+ReG2v2fQE+V3owDuSmS
         75FsVgFuW9/2zEPcDrtBKrEbHt2tLohpz3juLMD4B2NUvQ4KkUo2BASawNnDGBS+T1HL
         bVUqSgqEtc770tfeQXatmkpMKeFXTz6zBh0IiYeyc5wAiBp4hbGwVKNjRzUC0nJvDzqO
         UHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505289; x=1770110089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70SkXzfz76UseVgNS1JovfLNpfYQLaRtH/QS4N6l5Z0=;
        b=KOjGQWsZMH0JXzlVmtrRhg6vSx+IAzgp8/PFhiAD10DwlLGei5NqiHlxKBNu8r0v31
         9AatyBXPxsFBuhSEhAnZmaHOTWQJu+xxfOsMxSKcq/MAPzvOKtuZNluVBeVF3j4cl752
         T9E1t4H6Qu2wjTQI4uft5mw8flemHi6vUWbQ8vc2aQsA3jvM8Hbm+cuJQjrL+zmK15Ow
         C7gueahVN/IAaU9FEpgG9lon0FQhhWvSh2gDK364Xo2dMyR1m6rmWQwcJ30ZgpTnD034
         lwe70O5DJJG6ISeXVEDFwyvv3HQvRPniTI73xgwjxMx+C3ZZJZ2kdhKgGcxDHaoY1twX
         KAaw==
X-Forwarded-Encrypted: i=1; AJvYcCXbgo3g1S02svwz4WFBOcVK7zXrkSuvvuF0s3N90v0alqAJpOgmm4iO0we6547s/tsfPtOg1CjPIoU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMwJ4iD/roLJYkaXzQC/yApzYbhKMzW5UKDm6ZY9dpuo2z42Ah
	2Vnlow8Dr4DvL5JdXgDTqD348GW/hvju9dT/rwjIkb9sZ87HASw43mwZ+Bzlzamx9w==
X-Gm-Gg: AZuq6aJedVCF/wJKYAnCkyVW8+83oLsL/xMReRDHr1amf+coIE1oXH0f6jZFEgkP6uS
	SqCLdEXgRXNEdH/NvA3sM+tLyiBB+2D1xvFJkUpP48OWEDoFT+cFl+49Tk1cZmYLxpGaagNyavJ
	L/mCaMDk2FEdUw0l0hLGZu+T+g6wgfBlV0Gcgn7VB3xLQ0ia4ySndOM7gEsqrd+mw6e/Mzq3CO8
	iZesBgEKdOR3RVG7AgdB783y61gWYaSASmZMhYs+cogEASecqCSJ0wweSDHxChFdqNaISg2eE34
	65L++f8Vy/Ixp54/KIHRyqrAxltK/vhtvVppdD3uJBSwKW0G/bT0mYxzuyE0b6UBuWIzdc4L2u0
	NSQ9hZeTnEPpHoyV/InGERDqn5OumxTIkuyQp6V0E5GmrH7vHKEs24Q+IrvmdyEwR0LsamaVKcE
	kYFjtzy1cEXu1U7yzuxojFv3OUr5IX4cj+cjj3heKzpABhYXCDoXwkOoWJkLDzzN/DHs62qD8VU
	Sg=
X-Received: by 2002:a05:6000:2906:b0:432:857d:e425 with SMTP id ffacd0b85a97d-435dd0a40a4mr1286361f8f.30.1769505289153;
        Tue, 27 Jan 2026 01:14:49 -0800 (PST)
Message-ID: <cf8f345c-185c-4b6f-aad2-7ac1b67fc018@suse.com>
Date: Tue, 27 Jan 2026 10:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <27ab0f8eb6fd6ecef1eeefa4a05e4fe1f43acbbe.1769427484.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <27ab0f8eb6fd6ecef1eeefa4a05e4fe1f43acbbe.1769427484.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[suse.com:server fail,lists.xenproject.org:server fail];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: BC1E19190D
X-Rspamd-Action: no action

On 26.01.2026 12:43, Oleksii Kurochko wrote:
> Provide additional context when an unexpected exception occurs by dumping
> the relevant Supervisor, Virtual Supervisor (VS), and Hypervisor CSRs,
> along with the general-purpose registers associated with the trap.
> 
> Dumping VS-mode CSRs in addition to host CSRs is beneficial when analysing
> VS-mode traps. VSCAUSE, VSEPC, VSTVAL, and related VS state are required to
> properly diagnose unexpected guest traps and potential hypervisor
> misconfiguration.
> For example, on an illegal-instruction exception the hardware may record
> the faulting instruction in VSTVAL. If VSTVAL is zero, VSEPC should always
> be inspected, and can be used together with objdump to identify the
> faulting instruction. Dumping VSCAUSE is also useful when the guest does
> not report it, or when the hypervisor redirects a trap to the guest using
> VSCAUSE, VSTATUS, and VSTVEC, allowing verification that a subsequent trap
> is not caused by incorrect VS state.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I still have a question though, which can be addressed incrementally.

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -99,12 +99,70 @@ static const char *decode_cause(unsigned long cause)
>      return decode_trap_cause(cause);
>  }
>  
> +static void dump_general_regs(const struct cpu_user_regs *regs)
> +{
> +#define X(regs, name, delim) \
> +    printk("%-4s: %016lx" delim, #name, (regs)->name)
> +
> +    X(regs, ra, " "); X(regs, sp, "\n");
> +    X(regs, gp, " "); X(regs, tp, "\n");
> +    X(regs, t0, " "); X(regs, t1, "\n");
> +    X(regs, t2, " "); X(regs, s0, "\n");
> +    X(regs, s1, " "); X(regs, a0, "\n");
> +    X(regs, a1, " "); X(regs, a2, "\n");
> +    X(regs, a3, " "); X(regs, a4, "\n");
> +    X(regs, a5, " "); X(regs, a6, "\n");
> +    X(regs, a7, " "); X(regs, s2, "\n");
> +    X(regs, s3, " "); X(regs, s4, "\n");
> +    X(regs, s5, " "); X(regs, s6, "\n");
> +    X(regs, s7, " "); X(regs, s8, "\n");
> +    X(regs, s9, " "); X(regs, s10, "\n");
> +    X(regs, s11, " "); X(regs, t3, "\n");
> +    X(regs, t4, " "); X(regs, t5, "\n");
> +    X(regs, t6, " "); X(regs, sepc, "\n");

Does this sepc value differ from ...

> +static void dump_csrs(unsigned long cause)
> +{
> +#define X(name, csr, fmt, ...) \
> +    v = csr_read(csr); \
> +    printk("%-10s: %016lx" fmt, #name, v, ##__VA_ARGS__)
> +
> +    unsigned long v;
> +
> +    X(htval, CSR_HTVAL, " ");  X(htinst, CSR_HTINST, "\n");
> +    X(hedeleg, CSR_HEDELEG, " "); X(hideleg, CSR_HIDELEG, "\n");
> +    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n",
> +      (v & HSTATUS_VTSR) ? " VTSR" : "",
> +      (v & HSTATUS_VTVM) ? " VTVM" : "",
> +      (v & HSTATUS_HU)   ? " HU"   : "",
> +      (v & HSTATUS_SPVP) ? " SPVP" : "",
> +      (v & HSTATUS_SPV)  ? " SPV"  : "",
> +      (v & HSTATUS_GVA)  ? " GVA"  : "");
> +    X(hgatp, CSR_HGATP, "\n");
> +    X(hstateen0, CSR_HSTATEEN0, "\n");
> +    X(stvec, CSR_STVEC, " "); X(vstvec, CSR_VSTVEC, "\n");
> +    X(sepc, CSR_SEPC, " "); X(vsepc, CSR_VSEPC, "\n");

... the one logged here? Nothing changes the register between entry
into the hypervisor and coming here?

Jan

