Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKSWB9Eb52k14AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:40:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159443707A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288294.1568577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF4lK-0002zG-0O; Tue, 21 Apr 2026 06:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288294.1568577; Tue, 21 Apr 2026 06:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF4lJ-0002xn-Sx; Tue, 21 Apr 2026 06:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1288294;
 Tue, 21 Apr 2026 06:39:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF4lI-0002xh-F3
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 06:39:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF4lG-009kyr-QT
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:39:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e71b80-5cb7-0a2a0a5109dd-0a2a4505eab0-40
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:39:06 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e71b8a-aaa8-0a2a45050019-d1558031e083-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:39:06 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so60776455e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:39:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4dc24cfsm35022815f8f.16.2026.04.20.23.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 23:39:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1776753546; x=1777358346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yzhBlOhnJOygDZAANCZGc+/s53N/OJLF2UDAF1iprhk=;
        b=Kc5ok7gIS1qaDr6tu3b/h9lPGrA6s1CSMzKLkh0mgnx2qyNI+CyexM/mG9DGNjIAkW
         XuK8u0E8QCu9RQU85pQP/PnfARzICep++ZNIPnmrbpcLlPvuTlO/FbC52WPYf4xBeCdc
         +Mdf8L3G09BgKV1/xpdGVESLaUI/6xkGkTbNLCe6feB0XYcNHgu7XI8KFf500rHUkQ8Y
         Y8lluKz3bHsCJONRmyLqq2luailZR5sHZSdCLaZHBlN7UVvL3Np2XaHVmkECh3JFx5Uu
         GQ+l4uPkaYjv/Eh4xaCbHwfdlR2WaiAvEPfQPPUzUiFTUBOrJBtNWQcgn1UYhBrdalTB
         iY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776753546; x=1777358346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzhBlOhnJOygDZAANCZGc+/s53N/OJLF2UDAF1iprhk=;
        b=GvSeVLOPylss2tSKMnzfkC+jvtijcWKw8x6Z/N+eKWc3vfkx1mVWHSMdN4W1vzd1y6
         8ibA8xvl0iQ2YOMBRQRIfk2RVfQhOEVtcoQsgP5NUJ1PQYzbLzq0YrJZNpviLR5bC5GF
         l8qywSyebYwok3O5FYqYa0c7RjLPw1DBnMm9Rx0PZNcR5myseRwLTIH9TF4v5rvEMj1N
         YAxANl9sdLNb+7oNDv1Xcpx7C4HLAFbVKrvshbDEadJkjNH+vydlKIRr1we38dGrX4bI
         GAAG7j+q/WEdHPrRo9PKgFfux9Eu2wTmud6kq78xcuFxYyqJwUL5QBYsYOVdCsTnMqWq
         nOgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WEBeJHwz6gTr+vbV1irmd3Ri1T85Qg94r3CYiDMjZrFwj4s3tya936LGmgcE9fMkdIhX+cIV9fas=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA+32v0XiZL37XMWlsnwb+ZgOwYjaYHG3mFijNDC+/9WDvxq7a
	4luGgrQyCNgafJbn9WkHCBIS5KXe4CADEz+6uc3z56RZATRvpsVoRYLYae/hwXLNOg==
X-Gm-Gg: AeBDiet3Ex6Gv4cV7qhSal+g3oCUxQ+AfvwYLc9xkolbnAvhxLfaiSOH8Immd7aUqXd
	d2unsrnokcw8N5B7xFP+NldAAFPhn9BBRfjXJrJUukRVtmWAdMidWjtL5aYKaIR+x4a+k1lhyXJ
	kcoqnEhHRwMHoRgjLMUdrCjjplGP+otYm+m1LqqKPxuYi3KJh/K/l6BX6DQSsnbXHp596M2AfUk
	q+GCIO1k2ZAkGE9O1gkJIAFcV7g06/PWoo0o5dL5DYkiZi9tpovv9mX7skHC+ZN1Z2I1wKbNW4H
	croXpixcRjWwHFlgTcvDGllaISIDL+G82beYaEiAir30hTLmaOyCTTRmjnwSyBF3YKzFMfkTcJw
	gpCBw8QATXReSPQtrUoQkjEiEyOvT/fX8IibtQ4nQflWrWx2WRpP9CjTRZSkmGwluwfWIkcC1ZM
	PwIHrYbRsdCZ0VN6I8agdmQDrYLebAe/t5IuCcFVDqJz4ELfz1kr7ucOFT7R6ZTyy/1X1L+JAy/
	80oYqOfdA7K8QYgATlOqzP2nA==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr128039215e9.8.1776753545908;
        Mon, 20 Apr 2026 23:39:05 -0700 (PDT)
Message-ID: <85fa4bf2-e288-4376-aa74-c3aef511c2b6@suse.com>
Date: Tue, 21 Apr 2026 08:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Xen 4.20] x86/apic: Fix asm() constraints in TMICT
 calculation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260420174605.706329-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260420174605.706329-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776753546-E1BA4443-50D61DF6/0/0
X-purgate-type: clean
X-purgate-size: 1984
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7159443707A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.04.2026 19:46, Andrew Cooper wrote:
> The encoded MUL is 64 bits, so writes %rdx too.  At a minimum, this needs
> expressing as a clobber.

I'm embarrassed of missing this.

> Also fix a logical disconnect between 'overflow' being the carry flag not the
> overflow flag.  CF and OF are always the same for MUL instructions, so use the
> flag which matches the variable name.

I don't mind this too much, but the use of CF was deliberate: Imo OF is
relevant to signed arithmetic only, whereas CF is the flag to use with
unsigned operations.

> Fixes: d5c70a51bfbe ("x86/APIC: handle overflow in TMICT calculation")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I've kept this form because it produces best code generation for GCCs which
> support flag outputs.
> 
> An alternative would be to capture product_hi and check the nonzero-ness, as
> that's how OF/CF are produced in hardware, which would be better code
> generation on very old GCCs.

We could fit both, by further widening the use of ASM_FLAG_OUT().

> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1317,9 +1317,10 @@ int reprogram_timer(s_time_t timeout)
>  
>          apic_tmict = UINT32_MAX;
>          asm ( "mul %[expire]\n\t"
> -              ASM_FLAG_OUT(, "setc %[cf]")
> -              : "=a" (product), [cf] ASM_FLAG_OUT("=@ccc", "=qm") (overflow)
> -              : "0" ((unsigned long)bus_scale), [expire] "r" (expire) );
> +              ASM_FLAG_OUT(, "seto %[of]")
> +              : "=a" (product), [of] ASM_FLAG_OUT("=@cco", "=qm") (overflow)

Noticing only now - for the non-flag-output case this should be "=&a". With

> +              : "0" ((unsigned long)bus_scale), [expire] "r" (expire)

... %rax also being an input, there's no risk of the compiler using the
register for the other input, but still. Would you mind making that adjustment
as well, while at it?

Jan

