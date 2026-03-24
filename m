Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO05GpKPwmn/ewQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 14:20:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21CC3093C5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 14:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260834.1554014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51fo-0002G7-Ja; Tue, 24 Mar 2026 13:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260834.1554014; Tue, 24 Mar 2026 13:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51fo-0002DX-Gy; Tue, 24 Mar 2026 13:19:56 +0000
Received: by outflank-mailman (input) for mailman id 1260834;
 Tue, 24 Mar 2026 13:19:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w51fn-0002DR-20
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:19:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w51fm-00AkNk-AK
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:19:54 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c28f6e-e002-0a2a0a5209dd-0a2a4509adf6-36
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 14:19:54 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c28f79-e484-0a2a45090019-d155dd30a917-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 14:19:54 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-439bc14dcf4so4322701f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 06:19:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6470380asm37198190f8f.24.2026.03.24.06.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 06:19:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1774358393; x=1774963193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R9QsqbgjXwUMedaMFBIFeJrnDVuFKhj+2CnnalHo1zc=;
        b=YnOisVNtdn43xJw5cY4FsiPi1u22ArugykK9Dz+dNU5iPoNXBN3QnEm7+MPzgL8xVF
         DcLnzDApFfhWTnrSGtVcwYETE9FUCVmdr3pbsJfogk44nvMWtbg2uMJOdB/NQCy+ZDs5
         DMadaWUJCqB8zOq7PJxCZNYHm7v1hmGaAAHAaiTNnYR3E9nUWg1bEzbNtfhJaPPveu7s
         Lf+FsA6cTepZpdpNDysKH335LlDYszWGYE9SRDb0R0FOk19Q7cBHLbYZi6SM85NVllh2
         f8UKV/u8NaOSTmilX8+I6HTMtAS8JtmkEaV2fGtIckmbDiNTZtDrRP0a1979/KfChc6Y
         ityQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358393; x=1774963193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9QsqbgjXwUMedaMFBIFeJrnDVuFKhj+2CnnalHo1zc=;
        b=Ub16f7rEnx1rgZwpyD68kB2Ks+tgtSx+3kr9wu21NCDvMgCARmi0GYWRO+7GQMBQcI
         QDGELsMBkGo9h7QcnjM5wb6KdD8CC2d1AIWgF2A/cXbRRCfu4lg3nY1dXyS8IJLPK1cr
         iH/jkx7cs97AtGwSJ4fEIf2ibROZGFAAqJWVlsQaencV9oCHJRGUj18L85baTV6g4QlB
         bSfrKonjJgggk6KPaAHA7G9RhWReQvR/JE8KeM/V3LKyBQ2Kjb3MkHCc+ODsSbhwRJyS
         fLQWMOnfyx9LIQTi8+Gboq2D8lf7FWZoXDXL1rHdwpHbwqUUdMumUpnTCxXOqn3ALLop
         t0lg==
X-Forwarded-Encrypted: i=1; AJvYcCXmeaxjRLCXJ36pDemZZc6w9OxpshLzC9CxXquV3neav5EYyIu1PvOyF3AILxQisV7NQZ/nugEe4vo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzXfcgaG/f96Wodzq1KOfNbpNgHkn02foE/50XVvzzmh09X8FM
	xqgTNLPDNYooWfayMVaVxKXBIYKX10WIv64NPsHwKCL0FMquEL6W6cfuifeUuhXrqQ==
X-Gm-Gg: ATEYQzx/Vp0rLJB337MnP8ssG7XJZz0SSXO6hjnKPjLtAJ7Iboh06bi2CywevHqgfcS
	dWhAMN4haQfJNDHvIWJPKZ+7a1YIkJrzjuVYKnVpN/Q1NAJ+R4vnOYCbbNt+nVMgTj0LM8G1vEB
	zlamyCEkwAJyEqiwbb2OKzQ3llXfbqEC6b6lQKfwUR1+UvE83b7RNfoguGrd3ltOJEpI1AVPzi+
	y4uhWsB5yX3oR4cl2sGv75ErBFFTfix1txSvPNdPxd7VfNPFfbfOGeC6c/ZOUc8lnTeqguROz2M
	1yObq3z1KFu3qsoAGqLjrCl2gZp24I2fIG4U5UGl2c/qgN8Ltv1SuRlyJEFs/+yNdwx6BX44Dj9
	wE+ck3SxP8VITXSRkaGLujfMnb8jXh2A9BfIKh07hUCZLTNfGhOojkQWS0h8LUt7BkJhJr8fhaa
	VNmXoXDt/JCv6pEtgNJb0mSr9SqIIIYG7tPlvWfLAHmTMHZL1gGggkYFibQjCTT6gIRIV/r+QRj
	zijDrBKyJmpih4=
X-Received: by 2002:a05:6000:430e:b0:435:96a1:ee4d with SMTP id ffacd0b85a97d-43b80550c84mr5679842f8f.14.1774358393421;
        Tue, 24 Mar 2026 06:19:53 -0700 (PDT)
Message-ID: <bcade1d0-4ab0-454c-9f2e-d7b407bbb230@suse.com>
Date: Tue, 24 Mar 2026 14:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/kexec: Disable FRED earlier in kexec_reloc()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260319122549.922724-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1774358394-60EBAA73-FD99E66F/0/0
X-purgate-type: clean
X-purgate-size: 1589
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
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
X-Rspamd-Queue-Id: D21CC3093C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 13:25, Andrew Cooper wrote:
> With FRED just as with IDT, it's unsafe to run the exception handlers after
> switching stack.
> 
> To remove this unsafe window, %cr4 needs clearing earlier.  In turn, we may
> need to switch to PCID 0 earlier too in order to be able to clear CR4.PCIDE.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> The pagetable switch cannot easily be moved to be earlier, as that leaves a
> period of time where FRED is enabled but all stack pointers point to
> non-existent mappings.

But the clearing of PCID could be moved earlier, I guess.

> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -54,6 +54,21 @@ FUNC(kexec_reloc, PAGE_SIZE)
>          lidt    (%rsp)
>          add     $10, %rsp
>  
> +        /* Move to PCID 0 if necessary, as a prerequisite to clearing CR4.PCIDE */
> +        mov     %cr3, %rax
> +        test    $0xfff, %eax
> +        jz      1f

This conditional looks not overly relevant on this path, and we'd get
more consistent overall behavior ...

> +        and     $~0xfff, %rax
> +        mov     %rax, %cr3

... if the implied TLB flush would happen in all cases. (Of course the
clearing of ...

> +1:
> +
> +        /*
> +         * Set CR4 to PAE only.  This may disable FRED, which must happen
> +         * before switching off Xen's stack.
> +         */
> +        mov     $X86_CR4_PAE, %eax
> +        mov     %rax, %cr4

... PCIDE will flush again anyway.)

Jan

