Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eISGHWONwmlvewQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 14:10:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF5C30901F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 14:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260821.1554005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51Wk-0001BX-PJ; Tue, 24 Mar 2026 13:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260821.1554005; Tue, 24 Mar 2026 13:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51Wk-00019h-MV; Tue, 24 Mar 2026 13:10:34 +0000
Received: by outflank-mailman (input) for mailman id 1260821;
 Tue, 24 Mar 2026 13:10:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w51Wi-00019b-S3
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:10:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w51Wi-0096mb-7f
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:10:32 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c28d42-e002-0a2a0a5209dd-0a2a4509e052-12
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 14:10:32 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c28d47-e484-0a2a45090019-d1558036b8cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 14:10:32 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-486fe655187so50221755e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 06:10:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116abe8esm53772565e9.4.2026.03.24.06.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 06:10:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1774357831; x=1774962631; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z+6IO4QYdPiC4ntRFBdIAN2hT1NYIg/s5TcpclHkt5c=;
        b=WWvHZCYPw+AGPaTlwAgFbWofX4FnBLSJtq8jg1j3D798QQc4OfYJP8SlxR9NPbTHTq
         RxhZ8gOTR+75f5VKXc5GHYA0btMZhe1d+9jjAHfy9ZZEO+QDq65aB9J90LMvgp1VY4q5
         ZiErbXaqnHuadYmMh08Ubtmpk/GDOPf+ef++IO2Pr/7oOUZTnssDLVSYp6a+4/3EZeBM
         cPUygHh1OMsVuy9kr66+U6Vv790bOQ6yT7C/FMG1mP6Z52+AR0Yha9I/6blymQ/HxC8O
         XsJ0imgzapKgKfGk9HKtjChPnAx4/xEXCEKWXSyCLy5D3p+9YdkUsQg2fNCd04uWeNKd
         QLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357831; x=1774962631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+6IO4QYdPiC4ntRFBdIAN2hT1NYIg/s5TcpclHkt5c=;
        b=lZKO/2UUKMDqn5nRRzWHo6NPPMj2gWWRUn4xRDiWn10XHaUHKQjBZC0eZ+WgXzmnrz
         F+w/mpCZvtEZIJYHGLsKmEOe4h7IZJS0YKeDYYkJb+3jemunulBSYhXgInaSlTwB9BOe
         yiWkQ2uidKVAdZdFy6nEOnkQ+KbGqSzJqkVVVjUrtpAUZbWaE6InU+aNzwNcSw5KJDoZ
         Ihv8f0/iH3wygR0MTDhs1x7Jb9tF+7NBzN6LMnHhSmjtdCAhli/aXWT4OxPTZw/D2/yL
         7Su91RWGRF07P0YYNOh9TJ/ar/1NEWQErOTAjbJf/V3neLRZIwSpzWhOHTYMJdZDpOKp
         rjSg==
X-Forwarded-Encrypted: i=1; AJvYcCVycrOpUnRY6L8f+ZfykwEOi/K7QRzR9rsG/ABAGKsthjUrOT8LbbuDzFK5VoZhnEPwR4a+fr8z9qQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvSeUx7IwY4tcrIXMblny66GrYYTNGxEAVxPy6AJcZhsoG0OHB
	+NIyDsjeFhmZj2XvJZ+U8NN3fudy3zMPguWiru3sUv7cgDg+2Cy+yB8vMfh8Eg40Jg==
X-Gm-Gg: ATEYQzwehzykyspw+biFu5rivL4x5A09mAox8L6H8cT3Viywd4/vg4HJZ+IVsAZbA9k
	1PRPdUxt21R/DdmZ+Eit3CWcg+Ka8Oqk2pDVpjbZ6Frm33u7g2Vlel7Bcdhn5tv/npbTbSdHN/+
	jCbWvHS9M/csiTf3EVpAtmxTSQHbzBYJR2OKvYtQG0NwsQvCnYfLbSqFV7g8mekzSoglCkdEi3x
	202PCvPl+bkIWc6+z6iaRreS0bI/JhKOwjlIAoieAPzTrli9DyQmR7kKXA4ndhaFOeF7PwhwWXY
	rIeNjksELqUFe+2paP7vNxHwzacjOLq8Ta47s5jpjJ14d6GXLA1UQJ0GcOBtOn6HWL9H5CHp4Bs
	1cEl4vwvPchFzv1exqVaAGPw2emS+XXq0IwwC7+zLHOxhY2VoAkmTwpEdfsMojDUWaAG+ZaKJCv
	vP4zYvadT2FT3OVGv6PixdwhjcCZz2llMIaBsJ7ay+awER7uwlgLdKKw+Ye+8frXoE4MU/Ku1VK
	OLmEAzUkoQtf1s=
X-Received: by 2002:a05:600c:3056:b0:487:1fc:14f9 with SMTP id 5b1f17b1804b1-48701fc15bbmr111418745e9.15.1774357831202;
        Tue, 24 Mar 2026 06:10:31 -0700 (PDT)
Message-ID: <2edd208b-4de4-4cec-a35b-31ae696cd777@suse.com>
Date: Tue, 24 Mar 2026 14:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/kexec: Invalidate the IDT earlier in
 kexec_reloc()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260319122549.922724-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1774357832-68F4FA73-50BFAC3A/0/0
X-purgate-type: clean
X-purgate-size: 1430
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
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
X-Rspamd-Queue-Id: CCF5C30901F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 13:25, Andrew Cooper wrote:
> After switching stack, it is not safe to run any exception handlers, because
> attempts to access the cpu_info block are out-of-bounds and will generate wild
> accesses.
> 
> Invalidating the IDT in the common path means there's no need to do so again
> in the 32bit path, so drop compat_mode_idt entirely.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Yet still two suggestions:

> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -44,6 +44,16 @@ FUNC(kexec_reloc, PAGE_SIZE)
>  
>          movq    %rcx, %rbp
>  
> +        /*
> +         * Invalidate the IDT.  After switching off Xen's stacks, the
> +         * exception handlers are unsafe to use, because there's no way to
> +         * perform arithmetic on the stack pointer to find the cpu_info block.
> +         */
> +        push    $0
> +        pushw   $0
> +        lidt    (%rsp)
> +        add     $10, %rsp

Deliberately misaligning the stack is odd (but not technically a problem of
course). How about using two full PUSHes instead, possibly adding a displacement
of 6 to the LIDT in exchange?

Furthermore, don't we still have access to the full Xen image at this point? If
so, why not do the above without using the stack, using zero_page(%rip) (or
zero_page+6(%rip))?

Jan

