Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DhSLJO8pWn8FQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:36:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCFD1DCFB3
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:36:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244465.1543924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx6FE-0000qL-K4; Mon, 02 Mar 2026 16:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244465.1543924; Mon, 02 Mar 2026 16:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx6FE-0000ng-G0; Mon, 02 Mar 2026 16:35:44 +0000
Received: by outflank-mailman (input) for mailman id 1244465;
 Mon, 02 Mar 2026 16:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx6FC-0000na-Hl
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 16:35:42 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d93184c1-1655-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 17:35:39 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso38784935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 08:35:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfabb84esm424881895e9.0.2026.03.02.08.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 08:35:35 -0800 (PST)
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
X-Inumbo-ID: d93184c1-1655-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772469339; x=1773074139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SkiveMPDqUa4iYvNv23soiX7FoIfSEYshF9oriBv7Kg=;
        b=EPZgkmSsvG00sSwtRjH83EYcr1ujRoPTBASm4B0BZPsZIsQpnJKUPgvkr7RXvxF2BO
         ptSB9GW+zOZ7eNSPg5ZuYUye83AC2uOsFqa3db4c0I9rZNlODjGz8TFd6BPssZgCdOtm
         LBqSOoO3uks3wJtZZkUyoSIDCR2ATkvl+79iLe+rZs+fdsUDJhv2g9N8FwNc6ePr2Tnm
         l6AOMyprc1HssVaOjocY6HLHDXgtWTCYhCn6sGh9lVLFkpe/yr+W+c/sR2QDVRO21dfU
         PqofYrw5fIVlet/5OM6dVuRhZhYCH5ofaE9hwGidbEx3czUZWY23KqOvE/Tee4EoO1Mo
         jHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469339; x=1773074139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkiveMPDqUa4iYvNv23soiX7FoIfSEYshF9oriBv7Kg=;
        b=O9eU+souIu12us1761k4cUNtVL4HZM4gM1x5MzRR9olCD1+H+Yi0J50AFSFLB9D3tJ
         ljyTHPA9UYs5jbRBwsn0TltshNuGhA8I5Bda6nJLKxBLxsgTY/HltAzwpqLZ65FI1wZn
         iBYPpQmBohOHOymaR/ddUN+8MDuHud93zE4R+fdbZYrOQImiCbMwL8blhXuXxKmeiCTZ
         C918SanbIew8gog7U0PqUnejCYYIzsiRE5ENyd0iAmyUnSNBfivWRzXJF2IcmctiCQfR
         rd5EpuZwPYDRWcvPj0Ep4ZNLgHWuWl7vmWXAMywB5Gqza1X/JYejsH2uMPbezguwYxZH
         uiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzCSp9BAiboPc2aL1uX+AWo/tZee6FyW798mMbrE1megn0sx28/uP1BPPvxp02rMgg4d3chQAwSTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDr08QLaUfa12P71Fmm3BCxYbLV72pzUvtkozPNw/bIebRP1QG
	hLUCUaA8QFNQMZsJvPdjOhb8EZ8xmgzHS5o29E5usTqUsaHk9TZBZox7IY/iMMrPbA==
X-Gm-Gg: ATEYQzxogkqTK+TYhMYzE+J4S5Kj/MzH0ztg/lGPXVcDnMTem86uK/4r4nI0CWGH6Kl
	pj1uaY6coEjpHJEgKpFAtpTRo1o1OUu7JYYo6IwJm6pDIEVMakGyv2p2nDoY4WH3TsWwJGz/Ad6
	a8e9FXUO6KdLNV1BAH4d2rqynGqAn8y4XAvjxG8+rlTUppPoILJkt4AWT/fr/flgb+WjGchs3c3
	n40VNUh6FbR5GzIoUgvOv6W2XMU8PsO/puyLvalGwMuchYTLcrciIib9dTFyTZhzvLnSP6703v9
	Z++XWx81ZUCx86AAiiaP1ob/loetULEASJUpsWxedB9ApicjI4MkOEORUufqV79ar+8K+A3mJLz
	w1sFdM3l2geob+R0CHjBBYjue7aS3+SkiXHlNAvbkwHlmUkKhh5fxHyHAfaLYJlgCKNn4sElAW3
	KwKiejxRNJrw4ira5LyJF8yEmmV4+1m+S0gTgS5GiNhNTAUny+bvFqDMKjylcroJzZ/STINGb96
	x1cHzu2h5qM7p4=
X-Received: by 2002:a05:600c:a16:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-483c9bf45fcmr212700185e9.26.1772469339136;
        Mon, 02 Mar 2026 08:35:39 -0800 (PST)
Message-ID: <9d5526e7-2f82-4a9b-b622-4dc1051bb272@suse.com>
Date: Mon, 2 Mar 2026 17:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/14] x86: Clamp reserved bits in eflags more
 aggressively
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-14-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1DCFD1DCFB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 28.02.2026 00:16, Andrew Cooper wrote:
> ERETU, unlike IRET, requires the sticky-1 bit (bit 2) be set, and reserved
> bits to be clear.  Notably this means that dom0_construct() must set
> X86_EFLAGS_MBS in order for a PV dom0 to start.
> 
> Xen has been overly lax with reserved bit handling.  Adjust
> arch_set_info_guest*() and hypercall_iret() which consume flags to clamp the
> reserved bits for all guest types.
> 
> This is a minor ABI change, but by the same argument as commit
> 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"); the reserved
> bits would get clamped like this naturally by hardware when the vCPU is run.
> 
> This allows PV guests to start when Xen is using FRED mode.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Still slightly RFC.  Testing still in progress.
> 
> v3:
>  * Rewrite the commit message.
> v2:
>  * New
> 
> The handling of VM is complicated.
> 
> It turns out that it's simply ignored by IRET in Long Mode (i.e. clearing it
> commit 0e47f92b0725 ("x86: force EFLAGS.IF on when exiting to PV guests")
> wasn't actually necessary) but ERETU does care.
> 
> But, it's unclear how to handle this in in arch_set_info().  We must preserve
> it for HVM guests (which can use vm86 mode).  PV32 has special handling but
> only in hypercall_iret(), not in arch_set_info().

Any reason you don't ...

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1244,7 +1244,7 @@ int arch_set_info_guest(
>          v->arch.user_regs.rax               = c.nat->user_regs.rax;
>          v->arch.user_regs.rip               = c.nat->user_regs.rip;
>          v->arch.user_regs.cs                = c.nat->user_regs.cs;
> -        v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
> +        v->arch.user_regs.rflags            = (c.nat->user_regs.rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
>          v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
>          v->arch.user_regs.ss                = c.nat->user_regs.ss;
>          v->arch.pv.es                       = c.nat->user_regs.es;
> @@ -1268,7 +1268,7 @@ int arch_set_info_guest(
>          v->arch.user_regs.eax               = c.cmp->user_regs.eax;
>          v->arch.user_regs.eip               = c.cmp->user_regs.eip;
>          v->arch.user_regs.cs                = c.cmp->user_regs.cs;
> -        v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
> +        v->arch.user_regs.eflags            = (c.cmp->user_regs.eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
>          v->arch.user_regs.esp               = c.cmp->user_regs.esp;
>          v->arch.user_regs.ss                = c.cmp->user_regs.ss;
>          v->arch.pv.es                       = c.cmp->user_regs.es;

... filter it out here conditionally upon domain type?

Jan

