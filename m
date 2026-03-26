Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPMhLgz5xGmC5QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 10:14:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69033214C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 10:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263585.1555477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gnL-0000af-QK; Thu, 26 Mar 2026 09:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263585.1555477; Thu, 26 Mar 2026 09:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gnL-0000Xc-NC; Thu, 26 Mar 2026 09:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1263585;
 Thu, 26 Mar 2026 09:14:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5gnL-0000Wk-4U
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:14:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5gnK-0023XX-DG
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 10:14:26 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4f8ef-5cb7-0a2a0a5109dd-0a2a4503871e-16
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 10:14:26 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4f8f2-1947-0a2a45030019-d1558035c1bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 10:14:26 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso5345765e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 02:14:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b91942f24sm7093488f8f.11.2026.03.26.02.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 02:14:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1774516466; x=1775121266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YaY5Mtc3vyE10CYVSwn6QWKaGGHtIStLX7Ld1MYNUSo=;
        b=aKUjdr+alkAI/qzBLt274Rqelcql5G3/nAQ0fLuyKM2hhlx+Tthvxt0apIYG5ZTIx4
         DmN0MdRHoyUpnNW5sBEuA8ZlkAeHqPyRFGoaqKnNJ4A0Klyld973gLP0kIzHaNJMriYc
         uUqxNUfOv/wvBZeuT0k3voY3aZwsnpKteAhNBdiEsrAMIfh+rDTn3g/yStfrm3gcSs4f
         aoRQLvBsk/wTmqknbXeSy/h994Ch3XLicOZMbn5P+yMtfU1oSFRtx1gEj0J1YUibuhoo
         Nqgib7MpTZopdeO5/OhjpGSMryB1cRn5yEkpsnnt9mbyykNL7vW3z8kfp4Wkujh7Cg/5
         28SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516466; x=1775121266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaY5Mtc3vyE10CYVSwn6QWKaGGHtIStLX7Ld1MYNUSo=;
        b=RoePH6jZEdjxESMTtI1WrVyxoiALrIb39ZIoesF6IamvRrIsmMGUvYcoEhT7Ny2aeM
         c2W1uLANj+lxCPjGp2nWMDX1QzAtBXKobE/Z9s5mD31x7e4HgiXBWG5GOqePAyXmfj2O
         dprVSyTokhP9NqQtVuLA5SzSaQEA6lRqajbmgTX04evH5wdB4jowuQOj+RnB/IqRHN8P
         j/eZkrjgWkfpPcBL6uCZqRjvMgFakEFwDb5UG5tY0455Gn069olE5BAbLCn6IM5IffaI
         T6c0aKIUAiPIXot+i3tFQW4xMyw27JbL3OomkVpD3Fe9tdew6Q8qDO0IFR4Er0zzNQje
         aDyA==
X-Forwarded-Encrypted: i=1; AJvYcCU1BNM9FNJHR/fmiX81fJnEdF34Rck+S9guB1a5y6+6aatFtQZ579WJZ7lYwtg6+Z5hPkwmEpTxgyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdKzwj0dbrwXBPeLuN+gQ4Ecc4I1Tpyv+NioMxcylNyznZC8Ju
	+46ruDcOxA+zNPTbsANLl1K77S4vcXyWaCmKl2+yn/V81vtMKNm0RYmlKGHdUVJ07Q==
X-Gm-Gg: ATEYQzwYuvuNmPYCwThzOPN4H2TsHpg8PepqSTzE6eD+87PsJl6Mp3xJGamlKZ8+KFU
	sN1lj9aIIop8X7t8ZP+NEx4/cooGYhxWFfDSh3mGOX03ZYbnCII6lXl14NBaJpaXRG9CFDXoPta
	25w7nudXT3LjnEJJhLl4JzoLxdtMfQH8tOjqmV+hQ/0C7rZOqfBs0y5+hEDdu2Oxz4ov1+oHDpJ
	Fawx9iSLyjaKJPD+VwHxU7DEWQCD4fFjiKZzorY8qVUyFXWceer6g40d3M4/y5o0xrTaeA0MXyH
	t1ZdqEfMFoA45yKpgfrik6ozIUjJ0dp1vkLPnOSzpz4gZO8hYlluIWL4x7817mWj9FX+h2f7dAg
	RMYtZAoLEbyK7eGkbV5GYKJfsjpBTupfN8eIzIWo3nx15sIVxmTPxQrRZCUkTnL7oQSb99NOFbu
	EW03ueOiXp05TjVqzJf960NmU7794KI28b+yC8FBG/x/b342rKtSVsrd18h0vBpSY5sUcsJRV4J
	QRE7RzUmHLznig=
X-Received: by 2002:a05:600c:8b6e:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-48715fbfe01mr92879225e9.3.1774516465526;
        Thu, 26 Mar 2026 02:14:25 -0700 (PDT)
Message-ID: <059588cd-d73e-40a1-98b4-65be01957d41@suse.com>
Date: Thu, 26 Mar 2026 10:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/pv: Provide better SYSCALL backwards
 compatibility in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
 <20260325170208.1115832-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260325170208.1115832-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774516466-4A05C72C-5CB79164/0/0
X-purgate-type: clean
X-purgate-size: 2227
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0E69033214C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 18:02, Andrew Cooper wrote:
> In FRED mode, the SYSCALL instruction does not modify %rcx/%r11.  Software
> using SYSCALL spills %rcx/%r11 around the invocation, which is why FRED not
> doing this goes largely unnoticed.
> 
> However, consider the following migration scenario:
> 
>  * VM suspends.  Hypercall, so SYSCALL, %rcx/%r11 left unmodified
>  * VM moves to a non-FRED system
>  * Xen resumes the VM with a real SYSRET instruction
> 
> Instead of resuming at the instruction following the SYSCALL instruction, the
> VM is resumed at whatever dead value was in %rcx.

Would it? In restore_all_guest we load %r11 and %rcx from the stack
frame's EFLAGS and RIP fields. If we didn't, various other things wouldn't
work either.

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2405,6 +2405,8 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>  
>              regs->ssx = l ? FLAT_KERNEL_SS   : FLAT_USER_SS32;
>              regs->csx = l ? FLAT_KERNEL_CS64 : FLAT_USER_CS32;
> +            regs->rcx = regs->rip;
> +            regs->r11 = regs->rflags;

Don't you also need to set TRAP_syscall here, for the new code in
eretu_exit_to_guest to actually make a difference? (There actually is
a paragraph about this in the comment out of context above, which then
may also want adjusting.)

Further a question as to limiting overhead: Doing this on every SYSCALL
entry ...

> @@ -26,7 +27,16 @@ FUNC(entry_FRED_R3, 4096)
>  END(entry_FRED_R3)
>  
>  FUNC(eretu_exit_to_guest)
> -        POP_GPRS
> +        /*
> +         * PV guests aren't aware of FRED.  If Xen in IDT mode would have used
> +         * a SYSRET instruction, preserve the legacy behaviour for %rcx/%r11
> +         */
> +        testb   $TRAP_syscall >> 8, UREGS_entry_vector + 1(%rsp)
> +
> +        POP_GPRS /* Preserves flags */
> +
> +        cmovnz  EFRAME_rip(%rsp), %rcx
> +        cmovnz  EFRAME_eflags(%rsp), %r11

... and every exit-to-guest isn't very nice when concern is about just the
specific case of migrating FRED -> non-FRED. Couldn't we instead make the
adjustment when generating the save record for the register state of the
vCPU?

Jan

