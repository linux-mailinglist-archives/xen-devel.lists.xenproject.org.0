Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNflM0N2sml/MwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 09:16:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F408E26EBE6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 09:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251788.1548656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0bCq-0007Ih-Re; Thu, 12 Mar 2026 08:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251788.1548656; Thu, 12 Mar 2026 08:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0bCq-0007G6-OO; Thu, 12 Mar 2026 08:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1251788;
 Thu, 12 Mar 2026 08:15:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0bCp-0007Fu-91
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 08:15:43 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b6538a-1deb-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 09:15:41 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so6233635e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 01:15:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854ad5ee37sm86741115e9.2.2026.03.12.01.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 01:15:39 -0700 (PDT)
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
X-Inumbo-ID: a8b6538a-1deb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773303340; x=1773908140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+x4KFIxZflzg6VTQwH/Ob8N+WJi7OG0Ofvzmyt3h8g=;
        b=Fx8galqdxR2OiigNui/1+jcmYAXcm2zDKobYxC5cJE2vAbvb9oY4RfajAtbDOUs0eB
         gQbH79ReH3pHIhvpczRj+TPGwXQm2DiScIw3aAnuDaJgVw92GEjlE1YsJ0TGpwjpByBf
         RL9WnpHpa+U7SDMVsmQrmRXQjqKYsL0B7YKs3rGXVxDpE1MZnqDo/t5JcRh7vYqxNK/M
         0EjfREv7Vn/XWYDZOtGtKbUmpg+ZiE0pcfaug8wP+5Z93V5mvrPAnpnzCP8KbPJNrc6k
         VPtqvyJ7JkFDdXduxHi/ksGJsQEXhBBPKJxtesykmAytkKpGWk4tkV30do1kD53QMqUq
         WgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773303340; x=1773908140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+x4KFIxZflzg6VTQwH/Ob8N+WJi7OG0Ofvzmyt3h8g=;
        b=OMGlvGcxM/KgB/ApCLE8ivmf8cP+6CtMD5+QhOUakT4A1t5A5HZrcrlF/3/NRqp007
         6s4/Pi+nvmBTXi20fo/wUWyNP5lEpawxqNXZ5BPixQkV3LmVDKNFoE15oTH4aPsyV71M
         7UNcVvOdsUWHYG6LRh8VBIt9ixgKa4nHWE5wu8HW9eNLJQhZHtzqLPXEUVMuKkDCqnHC
         nmm7yxvAnb/GAVxnsgWmF3JiiBx+QJ+coTIIdYrHNSZcSKEYSrNXEwPys2p2Ksd8TQjm
         15qc1QnuNuGgMPnuoz7I5jp27QLyQDliMuHzIAsmjcu5Kf1rA1No+CDSAZYoGkevK4VY
         7Rfw==
X-Forwarded-Encrypted: i=1; AJvYcCUC9Kl5HA/arQ9vt8RVStCSa/5HtCNu1CbvRPHfB8Qdw8Lk8hn+Nb8Q++mZJ807cN+aB1qkMZMoUs8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywntq0zNvohgg7yorLtI05EyzvabuJ5QqAO0BH3DHsJ6qBwtY+F
	4mf86ZEfkyBib4GYyJQSCTx++eXgCIug9SeaMAJV3iGVHrINYnpGzNH/K5sq6LTFkQ==
X-Gm-Gg: ATEYQzwS6FWSS5WGFghAsISKgijksetqSSk+pOjjDM5Xy8XDJUGdoy7IQA31/gSkxUN
	K03yNon+LXnvooWbQIFiduUdTSodw8iOFIGx4m7njRKCELZByrT3SllSMvzG8JlVjSF+Eqr44PK
	mfOSefBxrcEfJc76h0od2Arf/iW13zmCIlH21VP/h0c4tDjv4lx9hdS8CTEUeXuTJDng38el2lX
	6Lp1J9nOObEeI0Yr1qDCiZk6la2ARuFjTqJUBp/MgNcDyZ7LPZaVFHb7mTEeW9v2yByn50Jg8CW
	JzR7gs5N69RI6rgI2hDV8fg/IkJ2b9VaYt6VDaaXJUDQxUI9x7WVv+lsnOgBaMbRGACmFn3QH3j
	A/zxTJsP66jhfrc6GX/H6JSc5Jfgso6G6UWV1Vcbb91IfnvvZYWbJHdS68kxwLX805LceYFsIfB
	zCw07ZMmLXrwGr+qCS6FxLqJ9HUafrIHrzJISJ2KzxG+Oxd4EMYCgrHwhYrd3FOgFCfJM6ZLjdT
	SK4JfN57zpwyxk=
X-Received: by 2002:a05:600c:3b16:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-4854b0a4a1emr92300665e9.3.1773303340467;
        Thu, 12 Mar 2026 01:15:40 -0700 (PDT)
Message-ID: <2f006ef9-8a2e-4059-83ed-65dbe50ea9bb@suse.com>
Date: Thu, 12 Mar 2026 09:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4.1 13/14] x86: Clamp bits in eflags more aggressively
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-14-andrew.cooper3@citrix.com>
 <20260311175838.573925-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260311175838.573925-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,xen.org:url];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F408E26EBE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11.03.2026 18:58, Andrew Cooper wrote:
> In FRED mode, ERET is stricter than IRET about flags.  Notably this means:
> 
>  * The vm86 bit (bit 17) and IOPL (bits 12,13) must be clear.
>  * The sticky-1 reserved bit (bit 2) must be set, so dom0_construct() needs to
>    set X86_EFLAGS_MBS in order for a PV dom0 to start.
>  * All other reserved bits must be clear.
> 
> Xen has been overly lax with reserved bit handling.  Adjust
> arch_set_info_guest*() and hypercall_iret() which consume flags to clamp the
> reserved bits for all guest types.
> 
> This is a minor ABI change, but by the same argument as commit
> 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"); the reserved
> bits would get clamped like this naturally by hardware when the vCPU is run.
> 
> The handling of vm86 is also different.  Guests under 32bit Xen really could
> use vm86 mode, but Long Mode disallows vm86 mode and IRET simply ignores the
> bit.  Xen's behaviour for a PV32 guest trying to use vm86 mode under a 64bit
> Xen is to arrange to deliver #GP at the target of the IRET, rather than to
> fail the IRET itself.
> 
> However there's no filter filtering in arch_set_info_guest() itself, and it

Nit: Excess "filter"?

> can't arrange to queue a #GP at the target, so do the next best thing and fail
> the hypercall.  This is not expected to create an issue for PV guests, as the
> result of such an arch_set_info_guest() previously would be to run supposedly
> Real Mode code as Protected Mode code.
> 
> This allows PV guests to start when Xen is using FRED mode.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless, a largely unrelated remark and two suggestions:

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1193,6 +1193,14 @@ int arch_set_info_guest(
>  
>              if ( !__addr_ok(c.nat->ldt_base) )
>                  return -EINVAL;

Seeing this still in context: I had some trouble locating the position where
you're making the change, as in my local tree this is long gone. Is there
any chance we could make progress on "x86/PV: consolidate LDT checks" [1]?

> +
> +            /*
> +             * IRET in Long Mode discards EFLAGS.VM, but in FRED mode ERET
> +             * cares that it is zero.
> +             *
> +             * Guests can't see FRED, so emulate IRET behaviour.
> +             */
> +            c.nat->user_regs.rflags &= ~X86_EFLAGS_VM;
>          }
>  #ifdef CONFIG_COMPAT
>          else
> @@ -1205,6 +1213,18 @@ int arch_set_info_guest(
>  
>              for ( i = 0; i < ARRAY_SIZE(c.cmp->trap_ctxt); i++ )
>                  fixup_guest_code_selector(d, c.cmp->trap_ctxt[i].cs);
> +
> +            /*
> +             * Under 32bit Xen, PV guests could really use vm86 mode.  Under
> +             * 64bit Xen, vm86 mode can't be entered even by PV32 guests.
> +             *
> +             * For backwards compatibility, compat HYPERCALL_iret will arrange
> +             * to deliver #GP at the target of the IRET rather than to fail
> +             * the IRET itself, but we can't arrange for the same behaviour
> +             * here.  Reject the hypercall as the next best option.
> +             */
> +            if ( c.cmp->user_regs.eflags & X86_EFLAGS_VM )
> +                return -EINVAL;

Technically we could support VM86 mode, by fully emulating things. Hence I
think -EOPNOTSUPP would be more appropriate.

>          }
>  #endif

Having all of the EFLAGS handling together would be nice. IOPL and IF handling
sit further down. Could I talk you into moving these additions down there? Yes,
there are downsides to that: It looks to need another "compat" conditional, and
it would further the mix of state updates and error checks. Yet I still think
having all of the EFLAGS stuff together is a benefit.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-09/msg00157.html

