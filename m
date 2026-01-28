Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDSNCawoemlk3QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:18:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEB7A3A25
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215796.1525918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7Ia-0007js-7c; Wed, 28 Jan 2026 15:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215796.1525918; Wed, 28 Jan 2026 15:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7Ia-0007hB-3G; Wed, 28 Jan 2026 15:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1215796;
 Wed, 28 Jan 2026 15:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl7IX-0007fI-Ur
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 15:17:37 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a0c7b7d-fc5c-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 16:17:36 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so4314700f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 07:17:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee04csm7886115f8f.12.2026.01.28.07.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:17:33 -0800 (PST)
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
X-Inumbo-ID: 7a0c7b7d-fc5c-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769613456; x=1770218256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JniLaYBMgd4Sp05rWxfdwmRCwqM9Fb0uwk+/GezMf/s=;
        b=dMZ7dfXeaKPewNriBMiUgdVBKvg2I7Thu6qKc3eyAXh7t4tyJQ7zXDuzp0DZX/PjRO
         J8Rrv1PWV4T/sUlpCuk3J8UT0FOhLsAHsptuzmY7VsdVpPMojvPXlK6gQFxAU3SjQGc+
         lJFTOwk8app/JaNljz/Fefq+6Gyt5rbsMEJGLTBdECVqddh8kZDelPTjV2aZpXZtoYu9
         qiIngHvqZsfNA4PcPMt4C6eBOjzzKQXhkqByTGo9lCtbi/XeSEOHr0J57prRtPrubAkv
         CXC3UsKCOZMH+nWCTpaPe/LmPuOuq+O/mHCFImL3WDdz3MKCPH3OpqStEYhgmiXC3Yj/
         YV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769613456; x=1770218256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JniLaYBMgd4Sp05rWxfdwmRCwqM9Fb0uwk+/GezMf/s=;
        b=dR3x4Ti5/g60XREOozaGSJYANchCRMB2S40vRgD238B9qUW2P7QSxHwiv6ugSOMexV
         h8Q2kIcC3knAzA2jeLVBpe7vYMD3MfR47JkV7BljNDGnhAECiUmOLnSL0DnnOTPTfEV/
         v27TN//HSOEfJJ6/P6hkRqAKf3xHSQY1meR0BffAecdZiQoHT5A3QNZ0L917Sg3sNUwp
         fhvzM94p1zasPFrgbesmti7J/RDijw0Z764Q2Tl0qmc9JcXRot6MKNq5FlS1n1vPHLCB
         WFMeBa4XAYghtGwztN7WOxFGy/DEgd5FyWAlHN+HzR3POZd4z4v1/aQbk0vtJyXGreGi
         bjZw==
X-Forwarded-Encrypted: i=1; AJvYcCWnVDDOeP4MC4ULKprHra+FLq19BZELOMDRXqIlQi74rMk95i1W9cRE7NArfInvaBzJ8G08EYIQgic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzo6Vo6EMYNACwFFCq2Hm8PmJo60PwAtREIGcwNfSvDqh94/LeK
	qQ7BFOqy3tqZI3YNcJbtVskl49OZd75JUn7eWA00/CiqrvB5L7xF7ghURJyTEoyzyA==
X-Gm-Gg: AZuq6aIffpWNElHVDW2+tjO8sSY6Ii278AXm/I1J78DuZulJw/8uSh6auQfKggw1QbF
	nrL0lJ93vJ6w3CbTMPy2G9a6RdSaeTh1eNxmyLShFd56Ma6Eo8h2bZl3O72YBfqpOWyja3umYkK
	5vllhbDUZhyc2MAkrHRxzjxMxLJN37VVEUCkxtp8h1leFutSw1nFnZIgbP4WPb9FvxZ0O8G4RDn
	DOyzvlsBCDx9LtfC/qRkfdvEENvoLcfKBEvbxfVb7xZFadrD3x5SAd2XBV9RsaZneE5aI31YBDW
	B02IVxvG8sCQ/KYNZnwhKbFrdbVwTF+hCTi+nksjZq8Mgfk7TGeDdfsO5XQ6U5xoOmVbx/omiwy
	+znDQPwAx1Krp2BeyWnWE2qOpmAOV2l5t7Beh53Pdfh1GWv3dTKP6heOVrreQDJd3KWotbJeGDO
	6ZNrnSou98QsMBZZ5/AR3y9O8DEbprzIlexiCwHtq28a//IXZgaVG9mqGe7wjPg9PFSxksxwJ/m
	B8=
X-Received: by 2002:a05:6000:2c0c:b0:42b:3806:2ba0 with SMTP id ffacd0b85a97d-435dd02dc43mr6544255f8f.2.1769613455769;
        Wed, 28 Jan 2026 07:17:35 -0800 (PST)
Message-ID: <b5cdfbe3-63d2-4fa0-8956-2f371e0e7a36@suse.com>
Date: Wed, 28 Jan 2026 16:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d0fddb38c11e1ab5659ef981e770a2a850ef8ac7.1769602563.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d0fddb38c11e1ab5659ef981e770a2a850ef8ac7.1769602563.git.oleksii.kurochko@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 3CEB7A3A25
X-Rspamd-Action: no action

On 28.01.2026 13:53, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -99,11 +99,65 @@ static const char *decode_cause(unsigned long cause)
>      return decode_trap_cause(cause);
>  }
>  
> -static void do_unexpected_trap(const struct cpu_user_regs *regs)
> +static void dump_general_regs(const struct cpu_user_regs *regs)
>  {
> -    unsigned long cause = csr_read(CSR_SCAUSE);
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
> +    X(regs, t6, " ");

DYM "\n" here?

> +#undef X
> +}
> +
> +static void dump_csrs(const char *ctx)
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
> +    X(stval, CSR_STVAL, " "); X(vstval, CSR_VSTVAL, "\n");
> +    X(status, CSR_SSTATUS, " "); X(vsstatus, CSR_VSSTATUS, "\n");
> +    X(satp, CSR_SATP, "\n");
> +    X(scause, CSR_SCAUSE, " %s[%s]\n", ctx, decode_cause(v));

For it, in particular the "ctx" string, to stand out, perhaps this wants moving
first in the function?

With the adjustments (happy to carry out while committing, so long as you agree):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

