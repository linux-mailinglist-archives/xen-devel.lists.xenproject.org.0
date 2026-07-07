Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UBBaEuukTGowngEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 09:04:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B177183FB
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 09:04:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=A5YJojyK;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355970.1610637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgzqV-0002iZ-4q; Tue, 07 Jul 2026 07:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355970.1610637; Tue, 07 Jul 2026 07:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgzqV-0002gb-1o; Tue, 07 Jul 2026 07:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1355970;
 Tue, 07 Jul 2026 07:03:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wgzqS-0002gV-PF
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 07:03:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgzqR-00AxM5-Iv
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 09:03:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ca4c9-bab6-0a2a0a5309dd-0a2a4501c0fa-44
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 09:03:51 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ca4d7-400f-0a2a45010019-d155dd2bd907-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 09:03:51 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso1945421f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 00:03:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f43912sm39170425e9.7.2026.07.07.00.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 00:03:50 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783407831; x=1784012631; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fy7Qln24UXWaLRE76c209nR2gsTmukRmjmzTSulMGc=;
        b=A5YJojyKAwQbK/RZ2sEwJijFF9IJNgoCGwzXfA2e8YhB2oiE6Bi1Y3+dOIazmsWXSG
         tMawf4qh8Lr7jHeJ8+Cr5YfWuAk3WxkPU9L28UOOKr8ZtCiTRBCvIAj10JIn7iMSUhMJ
         uzA6MrkXW23QAL1VrhQGRTYCRTGioQ1HAncsTB66sqS3fKDYAQe34AGkgBBg0ixvUpgy
         p7Nd+0hreNbVayFP3p+tYAU9/ILPZDFuqb1cGq9YHKqzftcb1LkNioSYf8ADdXea2b9m
         lmtjmUbgJDHFlZe4F+pdrz/sGLftQR8JP5oL+ec3J51X1BE99AXgssHx6yZDG/S2/dUg
         VLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407831; x=1784012631;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fy7Qln24UXWaLRE76c209nR2gsTmukRmjmzTSulMGc=;
        b=HiW5uiNSMcnoEnPNlGyiBOn6MgNxTP2zQVkD/qiWynYNI7m8gCtdcCpQ/ZcwWsQHLg
         ZIc27mahqn4tKPdGDoPn+Phq81QvRv+g7tNWfWYQNpSGiAbpxi3mn0hd9Erij14kjH3N
         p42GdmBuP3KIDUZx/hxH5iVmu5t9euDb8sjG+TEc04CV8uFInvYtDIAPUFYdWY9vKmEe
         f1Im0vu5WPlktLwuJSxAu1sOhtYPC4vrJNvi5PzPdfNFYq/6X0veEfI5wyXNdHJvyr0m
         W0KuFKLeuEbVFtst2ZOj2+J58BY+7ZREGyVHDxDpMKHxm4EJd0ByljQchvStfLvdy4RD
         dELA==
X-Forwarded-Encrypted: i=1; AHgh+RrbGcBfSmv6/tTvT2qR7I2DPpSHoLIVG479Z3rmgRtFhy/c4FA7s2imekewemymjNVmOmGydiiPiLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFMGO5eyfnAH3l2qJ/iC7EH3dzRSOH+JciX8xZBwZ8c+efJyl7
	aXKVXc3kl22dpPBn4jQDdrRv2LWy2GBIoZ1oAix+c7SVax7N4pKM+ZDJMyMAo3QCuA==
X-Gm-Gg: AfdE7cmBSyMPFc0ZRhwhYzelLv78V1Bzcq4LukBfg12/sgSbDoU1LbxVrgQF/4p/PYz
	qRH6xLL5PXqsCtUFkzKZatnDWDI1eq3aeEMRvcVMKXMknFnvELOKdSoaCjWUZ5tmJ8eveQb2rIL
	Vh0FEluIS2Tvm4UxwYqDZTdUxINlgiQGcIjIE/EQ4/BLVEPCtm4IbH7hQ9ZICdpzsgL1hsRaanJ
	R50a5BaLOOf8UPzvbHh0Tt3qgv9kYk+Zg2PNA/QHnde5TADhJh2K/dDPzqkpD5lR4gI/NXHVOMa
	QEer4gAX0PqNr0syZ1UoIa3c9PxF7YEBoaZCn2+rY4QauKb+H53HdsKByBZ14pVCzqYeUinNCrk
	s8uoA1PxokQFzVUBCuKLvXrjm8wexQGdXW8lVMcNwsyOpNkCiamrdOxX8VQumpw5VR25DOkvVIu
	5BKes2yhBrV+nKGBXRaTvNNUUnesBBUlL/Kw21qfM+29yIOgYeytAdOyDtN6hJwX9ETrn9qttTn
	98j
X-Received: by 2002:a05:600c:8b6e:b0:493:a5d4:3798 with SMTP id 5b1f17b1804b1-493df0663fdmr38673565e9.1.1783407830756;
        Tue, 07 Jul 2026 00:03:50 -0700 (PDT)
Message-ID: <25cdcaa0-64cf-4014-ae52-3114f39abea7@suse.com>
Date: Tue, 7 Jul 2026 09:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/entry: Use POP_GPRS and remove RESTORE_ALL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
 <20260706153415.1264750-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260706153415.1264750-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783407831-838C81E0-6711E8DC/0/0
X-purgate-type: clean
X-purgate-size: 3090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2B177183FB

On 06.07.2026 17:34, Andrew Cooper wrote:
> POP_GPRS is shorter than RESTORE_ALL in terms of emitted code.
> 
> By separating the popping of entry_vector/error_code off the stack,
> SPEC_CTRL_COND_VERW doesn't need custom displacements.
> 
> Get rid of the compat=1 special case for PV32.  It's not obviously a win, and
> PV32 is getting increasingly rare these days.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
as-is, however ...

> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -160,12 +160,11 @@ FUNC(compat_restore_all_guest)
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>          SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
>  
> -        RESTORE_ALL adj=8, compat=1
> +        POP_GPRS
>  
> -        /* Account for ev/ec having already been popped off the stack. */
> -        SPEC_CTRL_COND_VERW \
> -            scf=STK_REL(CPUINFO_scf,      CPUINFO_rip), \
> -            sel=STK_REL(CPUINFO_verw_sel, CPUINFO_rip)
> +        SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
> +
> +        add     $8, %rsp        /* Pop ev/ec off the stack */
>  
>          jmp     iret_to_guest
>  END(compat_restore_all_guest)
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -226,7 +226,8 @@ FUNC_LOCAL(restore_all_guest)
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>          SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
>  
> -        RESTORE_ALL
> +        POP_GPRS
> +
>          BUILD_BUG_ON(TRAP_syscall & 0xff)
>          testb $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
>          jz    iret_exit_to_guest
> @@ -753,20 +754,17 @@ UNLIKELY_END(exit_cr3)
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>          SPEC_CTRL_EXIT_TO_XEN /* Req: %r12=ist_exit %r14=end %rsp=regs, Clob: abcd */
>  
> -        RESTORE_ALL adj=8
> +        POP_GPRS
>  
>          /*
>           * When the CPU pushed this exception frame, it zero-extended eflags.
>           * For an IST exit, SPEC_CTRL_EXIT_TO_XEN stashed shadow copies of
>           * scf and ver_sel above eflags, as we can't use any GPRs,
>           * and we're at a random place on the stack, not in a CPUFINFO block.
> -         *
> -         * Account for ev/ec having already been popped off the stack.
>           */
> -        SPEC_CTRL_COND_VERW \
> -            scf=STK_REL(EFRAME_shadow_scf, EFRAME_rip), \
> -            sel=STK_REL(EFRAME_shadow_sel, EFRAME_rip)
> +        SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
>  
> +        add     $8, %rsp        /* Pop ev/ec off the stack */
>          iretq
>  END(restore_all_xen)

... both uses of SPEC_CTRL_COND_VERW's with arguments go away. Shouldn't
the macro thus also be pruned of its parameters?

Jan

