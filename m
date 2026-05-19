Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ImYD10yDGrdZAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:50:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A0A57BA1F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312693.1582761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPH4p-0000c6-GI; Tue, 19 May 2026 09:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312693.1582761; Tue, 19 May 2026 09:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPH4p-0000aV-DM; Tue, 19 May 2026 09:49:27 +0000
Received: by outflank-mailman (input) for mailman id 1312693;
 Tue, 19 May 2026 09:49:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPH4o-0000aP-HN
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:49:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPH4n-003buL-S4
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:49:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c321e-bab6-0a2a0a5309dd-0a2a4507e37a-42
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:49:25 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c3225-229c-0a2a45070019-d1558036b92a-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:49:25 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48ff4f8ef0dso37744925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:49:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe57944c1sm345441045e9.7.2026.05.19.02.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:49:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779184165; x=1779788965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ssfubz4vlC62LceaJXcP4RoWsVK53s2WgjOkCLZ36w=;
        b=fTthePOqJKydzDl2TeGtH5a1ooskDK5N3u93wemRNv0EYfaHHSlNvOl9KYim2RDgzj
         LTB4Xmkx+mm62LAWfrCAA9z5UnwQ8xkRa+tNPYjCUFS7Q9gknn/1rjrR2GdZB0x3ciwg
         566gzy9L3x2Lry2wsPub6yh1IpV/V1j0D0ZJItyM4aXcs5SkqRwqIeKd1LqEsfw4s97o
         uPgeWaznLFA0DLeM78MlHxrPw66fpRSHAHoDFcn2uTZ8dcVZi+qx0Ixh4EItF0pz/AC7
         L73ajpSRHGJBUb9oIKOMcqk3wgbiG0EbESeneobXolHGLGubfQGAxyDiKBuUCmaDhS+4
         3/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184165; x=1779788965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ssfubz4vlC62LceaJXcP4RoWsVK53s2WgjOkCLZ36w=;
        b=ilw719Ap5i7IBRLxV1LhgocBdXyLxrCS2SqIFQG5hG0L18gAohC1cG/S0yzOv7zsMt
         pVn0JDI3Iulp1GCn3i0m+sfeMu8XcvEcARne/FXcRokhe7Kv7HoOag8QZYfnUdyboTFL
         jhN99RVApeu/DFmoJU6ImNGmhuwPf91dHoiHMfEUXJX/OCtET9tvkgtge1obk89Kwa+M
         LD6wB+FhvUnkPM9DpjimBXPso0FelmzJanRdliXpMOnIfbC8RZtcghZXdUDqMIrTHFgJ
         SzuV3pVyLXra/jYdiP8gegZkWE9yeKpSoKx6TH+tWZzyzSIBhZclYvKe+mTFEEaopcQV
         wRbg==
X-Forwarded-Encrypted: i=1; AFNElJ/QigTAcSmOYObrFq11hycqdl3g0/SJkaYys5Kt7DXbHSZKW5ncldzR7UxxWEjF8ZacFalf5djEXI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxruBix/VP196s0WyW2T6QHd7dL2rUz5weC1r0CUI0xoMjFvR1Q
	566j6uHHlQFU+euAWhHTgst7K6zGIoJNGnFjG29ULoc9pf3XyqTSuVmDfGi7j0yRTQ==
X-Gm-Gg: Acq92OGJQ3Iin8i5CZ86YOvZrJaskYDcX+8P8dmd9tYZrTF6sFeh4efd1XhxEQTNTSG
	7hZ+Bt0AGXUOXDI7ZyOrurKC7y14oRMW6xSrboGfuU9C09lAdhWSQnz6o6S6aYM3nqxthNhqcRj
	HZQiQsfTrkaoBclx6Q3t0Nv6kMYO2+IltZQv2AO+YBCb7qbge//sJAKPL01J5TP7K/xyxF7tSoa
	bROf6nvPIwVeNjAHHnNc8VZHrhdccoF097KGE9DYauIlmtq33mJLB1LyWKu9K773A7T4YAYLd4O
	zJc6G6hKFcyY4GyCuFEhjYpK8stxDdP6gR1R/hszyqGX3gpNdRid58TfYPb1Xk3PuwftI2RYttD
	oZC2heMDLu+qt4IdDbMeSBjbGHPwFcjcXlttsavyUEUDprt5PYW8sOzdL+JFS9zKbfZ24HC6FK1
	RrvX1F1yE2TySOuop63D/q3Dv8LT6AiuG3kQBailC2H5OopNOx/39SUb7t8zsMPQlttLe7wIWOi
	3AGWRuknyaVFUM=
X-Received: by 2002:a05:600c:4e02:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-48fe6322416mr304310965e9.18.1779184164939;
        Tue, 19 May 2026 02:49:24 -0700 (PDT)
Message-ID: <a5b2561f-0225-4f18-bc74-7f66227bc807@suse.com>
Date: Tue, 19 May 2026 11:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/7] x86/hvm: Move INSTR_* constants to hvm.h
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-6-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260518131404.3716969-6-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779184165-2236CC48-77160299/0/0
X-purgate-type: clean
X-purgate-size: 4088
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 96A0A57BA1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 15:14, Ross Lagerwall wrote:
> These aren't specific to SVM and will be used for emulator fast path so
> move them to hvm.h.

Some are SVM-specific, e.g. ...

> --- a/xen/arch/x86/hvm/svm/svm.h
> +++ b/xen/arch/x86/hvm/svm/svm.h
> @@ -36,35 +36,6 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
>      asm volatile ( "invlpga" :: "a" (linear), "c" (asid) );
>  }
>  
> -/*
> - * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
> - * opcode, shifted left to make room for the ModRM byte.
> - *
> - * The Grp7 instructions have their ModRM byte expressed in octal for easier
> - * cross referencing with the opcode extension table.
> - */
> -#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
> -
> -#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
> -#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
> -#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
> -#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
> -#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
> -#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
> -#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
> -#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
> -#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
> -#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
> -#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
> -#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */

... the 7 ones above.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -851,6 +851,35 @@ static inline void hvm_sync_pir_to_irr(struct vcpu *v)
>          alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
>  }
>  
> +/*
> + * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
> + * opcode, shifted left to make room for the ModRM byte.

With all of this moved, the comment wants adjusting, at the very least by
putting "e.g." in front of the function name.

> + * The Grp7 instructions have their ModRM byte expressed in octal for easier
> + * cross referencing with the opcode extension table.
> + */
> +#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
> +
> +#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
> +#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
> +#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
> +#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
> +#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
> +#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
> +#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
> +#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
> +#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
> +#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
> +#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
> +#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
> +#define INSTR_RDTSCP     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371) /* octal-ok */
> +#define INSTR_INVD       INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
> +#define INSTR_WBINVD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
> +#define INSTR_WRMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
> +#define INSTR_RDTSC      INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
> +#define INSTR_RDMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
> +#define INSTR_CPUID      INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
> +
>  #else  /* CONFIG_HVM */

I further wonder whether putting this in hvm.h is a good idea. Is there
anything wrong with using a brand new header, e.g. instr-enc.h?

Jan

