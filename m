Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAmjGMi5pWmoFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:24:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67BE1DCBDE
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244453.1543901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx64D-0007O5-Ia; Mon, 02 Mar 2026 16:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244453.1543901; Mon, 02 Mar 2026 16:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx64D-0007L3-Fj; Mon, 02 Mar 2026 16:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1244453;
 Mon, 02 Mar 2026 16:24:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx64C-0007Kx-IY
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 16:24:20 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 433dcbae-1654-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 17:24:18 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so4492287f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 08:24:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b503424fsm11876479f8f.22.2026.03.02.08.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 08:24:17 -0800 (PST)
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
X-Inumbo-ID: 433dcbae-1654-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772468658; x=1773073458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4sUZCTH/Q1jwHYCtk/g084ctsIEAOJE2quet31258JI=;
        b=AnoQFyVSuYcKp1u3IlnDWOGwnSO5rDJXG+t21nwauK+B2PfMgYY3g6qcOS0Ecz+Psz
         Hjmt/2bNQiTLFWFztlJrxuyc3CNIKJtZLIv2mkI3/GI9Aza8/pXZ2zN4BxB0VX69r4gD
         aLGhJLt/8NjpGOuBCRl8W2cqmryA3fVXfVxuTnlU7t4d4bDoGDvOGKnUxDQLyMGHt57t
         FonQCHosItpNRN9IUFFwRO+88FPrj8L94/Nx54haC0d96cCVjjHjCq+H+9aEg2Z2xz+V
         A6uRAF3jYeMzT5nH7Yk1WNuMsCypdoGoBMTNusDRJL7H+/5NvG4aCK8a91F7OykqL/pr
         IAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468658; x=1773073458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sUZCTH/Q1jwHYCtk/g084ctsIEAOJE2quet31258JI=;
        b=l1QV+Weq47Bd8erp0Zhac6vxCcCKqO+3Uad+P/TWrl2UDYYuf3JdCAsva7nSU9VyTC
         tks/hIOzCU3AZkroExLQYx0r6EfA0r4MUKbJfQLjkvYaffx7zTLK4b8XI2SXSwGJd7HK
         KeFyOZGJ3K29iXxw/ynBwYRJgtmx1dYnAxVwth47gAIeeDIqkkaTRSLE58nxe9P7rk4d
         DhSmMT8Qz+oYTgC4SnK+MJ2Elwoqr3RrTCHaOUVszzd5SY5eQy7WvJc7pME2RWB5pNqC
         SxCOOmChjuIXug+A/8tQeMYQNp0jd2V/rG0nRLdEV5r8/GYYfDaMkYriVY367Cm5yJMj
         w1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4kAY9egHb6/gD4qIbUOeBMTICziXvQhXy4o9eZck0X7CY6EriSV3quPh70Ha8UIvDSGAzpfhO+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ//T+itYhua89WHigos60D7y2y61RWAFtFpPFzDec9EicrWEe
	cPZepwPXRFM+E8+yLg2O2xPSiOvZJLJeZS0kx3NkWwCdDaixeYbBaV4wefniKUNDUQ==
X-Gm-Gg: ATEYQzwSP4LvqfIH79YiBDLIT4JT3150a7d539802N2fWtop5/Bw3FLdmW22+CbCuDz
	uyJUAUqH8Yc4lfIL2dGEm2npeCqld2wskX1LrrQoPPhk564UtJ7yvyXlO1uhZP2uTBMDEDOSM5f
	KSUjSSSujSENDOisnSwsS5tgcdk8rIn6w2YZwGXgYEw7u4djUDQRsNiY6N/ilhYHlElIrQHQUSG
	wkrf3cfF0tIJRNxFIv/07R3lK1MjJUcqa5JDJUPQbgG9jRhGxWnZGda5H7CerZOvPyMxkmkBfbS
	Wrfso9hyWojBZcpi5l/qZqea6cjcwQeVOWjCyWh4CzjjnD+qO+RW+LgcYpMvhcjkHdDTqVzp/l+
	a5GfZjdVG0wZMJ7W1Pl2gqRJ8HxnYX53HTslngQ0Z1gI7bPz+60jqbrg0qgtT964wfYGmhXN7fm
	H0crGiJr0zEaViW8kOhJO8oiG2ZI1zJquVC2xoWe1EsH9XoHV0Yb4cia8ky1LYkZK4FegPhjEST
	4OkzBkQO33Nw3c=
X-Received: by 2002:a05:600c:1d89:b0:483:71f9:37ef with SMTP id 5b1f17b1804b1-483c9bc031cmr206487835e9.8.1772468657824;
        Mon, 02 Mar 2026 08:24:17 -0800 (PST)
Message-ID: <8d0a13b7-3387-4766-bdd5-de62c868e365@suse.com>
Date: Mon, 2 Mar 2026 17:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] x86/pv: Adjust GS handling for FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B67BE1DCBDE
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Action: no action

On 28.02.2026 00:16, Andrew Cooper wrote:
> When FRED is active, hardware automatically swaps GS when changing privilege,
> and the SWAPGS instruction is disallowed.
> 
> For native OSes using GS as the thread local pointer this is a massive
> improvement on the pre-FRED architecture, but under Xen it makes handling PV
> guests more complicated.  Specifically, it means that GS_BASE and GS_SHADOW
> are the opposite way around in FRED mode, as opposed to IDT mode.
> 
> This leads to the following changes:
> 
>   * In load_segments(), we have to load both GSes.  Account for this in the
>     SWAP() condition and avoid the path with SWAGS.
> 
>   * In save_segments(), we need to read GS_SHADOW rather than GS_BASE.
> 
>   * In toggle_guest_mode(), we need to emulate SWAPGS.
> 
>   * In {read,write}_msr() which access the live registers, GS_SHADOW and
>     GS_BASE need swapping.
> 
>   * In do_set_segment_base(), merge the SEGBASE_GS_{USER,KERNEL} cases and
>     take FRED into account when choosing which base to update.
> 
>     SEGBASE_GS_USER_SEL was already an LKGS invocation (decades before FRED)
>     so under FRED needs to be just a MOV %gs.  Simply skip the SWAPGSes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v4:
>  * Adjust GS accesses for emulated {RD,WR}MSR too.

I think this ...

> @@ -926,7 +927,7 @@ static int cf_check read_msr(
>      case MSR_GS_BASE:
>          if ( !cp->extd.lm )
>              break;
> -        *val = read_gs_base();
> +        *val = opt_fred ? rdmsr(MSR_SHADOW_GS_BASE) : read_gs_base();
>          return X86EMUL_OKAY;

... calls for a comment both here and ...

> @@ -1066,17 +1067,22 @@ static int cf_check write_msr(
>          if ( !cp->extd.lm || !is_canonical_address(val) )
>              break;
>  
> -        if ( reg == MSR_FS_BASE )
> -            write_fs_base(val);
> -        else if ( reg == MSR_GS_BASE )
> -            write_gs_base(val);
> -        else if ( reg == MSR_SHADOW_GS_BASE )
> +        switch ( reg )
>          {
> -            write_gs_shadow(val);
> +        case MSR_FS_BASE:
> +            write_fs_base(val);
> +            break;
> +
> +        case MSR_SHADOW_GS_BASE:
>              curr->arch.pv.gs_base_user = val;
> +            fallthrough;
> +        case MSR_GS_BASE:
> +            if ( (reg == MSR_GS_BASE) ^ opt_fred )
> +                write_gs_base(val);
> +            else
> +                write_gs_shadow(val);
> +            break;

... here, much like you do about everywhere else.

> @@ -192,11 +193,12 @@ long do_set_segment_base(unsigned int which, unsigned long base)
>  
>          case SEGBASE_GS_USER:
>              v->arch.pv.gs_base_user = base;
> -            write_gs_shadow(base);
> -            break;
> -
> +            fallthrough;
>          case SEGBASE_GS_KERNEL:
> -            write_gs_base(base);
> +            if ( (which == SEGBASE_GS_KERNEL) ^ opt_fred )
> +                write_gs_base(base);
> +            else
> +                write_gs_shadow(base);
>              break;
>          }
>          break;

Same perhaps here, and ...

> @@ -209,7 +211,8 @@ long do_set_segment_base(unsigned int which, unsigned long base)
>           * We wish to update the user %gs from the GDT/LDT.  Currently, the
>           * guest kernel's GS_BASE is in context.
>           */
> -        asm volatile ( "swapgs" );
> +        if ( !opt_fred )
> +            asm volatile ( "swapgs" );

... the comment in context could also do with inserting "unless using FRED"
or some such.

Jan

