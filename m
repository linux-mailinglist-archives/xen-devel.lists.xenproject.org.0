Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPbzH54y+Gl1rQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:46:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03324B8AA9
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299491.1574029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm7k-0002ZJ-D8; Mon, 04 May 2026 05:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299491.1574029; Mon, 04 May 2026 05:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm7k-0002XN-9i; Mon, 04 May 2026 05:45:44 +0000
Received: by outflank-mailman (input) for mailman id 1299491;
 Mon, 04 May 2026 05:45:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJm7j-0002XH-1f
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:45:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJm7g-00G3qu-No
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:45:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8326b-e002-0a2a0a5209dd-0a2a450787fe-36
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:45:42 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f83285-229c-0a2a45070019-d155802cc04b-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:45:42 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso31630585e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:45:41 -0700 (PDT)
Received: from ?IPV6:2003:ca:b72b:870a:8d83:125f:d0c4:4383?
 (p200300cab72b870a8d83125fd0c44383.dip0.t-ipconnect.de.
 [2003:ca:b72b:870a:8d83:125f:d0c4:4383])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8feb0cbfsm102663265e9.2.2026.05.03.22.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2026 22:45:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1777873541; x=1778478341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I5jaxdTlW6GXQMnEt7sFJoGWFKaarJ+FNjRxLD7lDfU=;
        b=OJrdwGH/dZqt/U3KojZSAuQXh//G9UWKiX/lvplhPPPkrpm/i/f43E8EIAYfB5d7Mi
         CugHONOjgPi3Oc1+eFdd3gVP8KyNrk2bmr5UNM3DiKAE4AjKqVjdf5tuCT4uoKg0Txcc
         oRrRTiPaUICfaKWD8BY8K5RQGW7xeIbotvnwKr+o+qqRsDWCsKhxDBgQn7qMgaUlx/2a
         iWJGRIoy/3zof+mSW0OZEyI2QFryUjq5bDXGaUkQpgwqCI1AjQiq5mTNFa0GWAyEG69j
         EVs4iWFADbzuZgELrOXzOPHfZXuLCrTZ5HgEtx40tp+6doJUulma/Hjps8njzqiCw0/x
         9bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777873541; x=1778478341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5jaxdTlW6GXQMnEt7sFJoGWFKaarJ+FNjRxLD7lDfU=;
        b=mEVxfkeIiaJOHstI7WdQbuXskWLCq59RNW5BRyg/gAZMpYP1+1dnCLEqAEU1Lynszw
         iYYh/nFT7qorSZBBLiVvH96VEHPt7y/hqii1ruKFM4REZfJ8pQMYytCzF9NUiYgxPy2S
         TEXrnYrJjpEskL8+/TwBQ//RhINyhfrg/M88f87aurWkPS+C/0bV+Sd6a5ZNG7jK1AWL
         cNufBEmxxRJXpHPBlnHth0Dl0qrXTzcWgMvAY1Kj6qNQkcpc4mzBIRybVxHFcxHi90m+
         zHzcljTK0B/UlMn38TRA/KtuamNgq83Jlw4ROMTOfzinvDX9WahPHXN4aM6JM6nevIqa
         3Y6g==
X-Forwarded-Encrypted: i=1; AFNElJ/QTHM4Ogv9JuU8xCvL8dMSbBIhU7y5fFCaLZqvwJ0G2dvrRrPXbmTcdHvd4IK4p2k+N+IX8khcavk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZPzX+z+XxIn5NqRksiVRgehmILNneFcoTU0EdoRu5CD5rghea
	AiK4ui6TwbFaMz8LPe175S0pBovpgLCNej/YHYjMhn6dr3yg05eGRqiT31md9YL4wA==
X-Gm-Gg: AeBDievSIdP+bFT/SS5rLq0+cCQC6uGWOWmp9TK/bey2K6eqeZwVaQ6ToT0DQX5DT+o
	vgAL5z2fRvpmal65DA2OGESluBb0lgzgucqgnzN8XWm3ojvmbMkr2gE87ox8EokJlFhgAXtgV8g
	pImJI+9NJ9+UgwhVWT+T1OLCHDgJ0piCm2bEnpQP2DvQOmL3sNMPSzIJ+NJDTWnXFP/EkEeI0B6
	KjB+TWa5nnWCMvM6kAPWavSVO/5TrT4oo3dh5obY7pqWkSETvwa8dyfc6EH149JhsCLTX1v+xdX
	6m8oQ3+dVuLB6NDyZ/Xh8+s/C4tPY1kj1I1y7GG0Yn4VPKA72LDopOksqQ0DafP+4Ng9T3jY151
	Zx+9mNICmMdgF9QB3emr1mlgrLB5JaHOhW/Et2rrQxplTl30kYUc82yDO6snclvDOKqFMJrCiBn
	VH1hHKzDhd4Vt2FR/alKizI7MDKI7Kq/+FV+OLZQHbuxmEvMk1oXhbBxidUrfWCMBQIh8YckTyI
	qiMC7pYacq3+TrXVOA5EYev+TUgp5I1/CNiWe635lGr0xUUFs5gOG+tH7E7xcuKzpJc+G4=
X-Received: by 2002:a05:600c:33a2:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48d0640ec5emr32780275e9.21.1777873541529;
        Sun, 03 May 2026 22:45:41 -0700 (PDT)
Message-ID: <ef24286f-cdef-4b73-9121-d05ee05798e4@suse.com>
Date: Mon, 4 May 2026 07:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Disable interrupts when establishing SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260501191028.1250225-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260501191028.1250225-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1777873542-1625DC48-8DE29D46/0/0
X-purgate-type: clean
X-purgate-size: 3177
X-Rspamd-Queue-Id: E03324B8AA9
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 01.05.2026 21:10, Andrew Cooper wrote:
> Gitlab CI reported a crash on boot on Alder Lake hardware.  The bug is years
> old, making it an incredibly rare occurance:
> 
>   (XEN) *** DOUBLE FAULT ***
>   (XEN) ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
>   (XEN) CPU:    0
>   (XEN) RIP:    e008:[<ffff82d04077bbc4>] arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160
>   (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
>   (XEN) rax: 0000000000000007   rbx: ffff83049a4b0000   rcx: 00000000000006a2
>   (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000000000
>   (XEN) rbp: ffff83049a4b7f00   rsp: ffff83049a4b7ef8   r8:  ffff830497e47000
>   (XEN) r9:  00000000ffffffff   r10: 00000000900c2121   r11: 000000009a392956
>   (XEN) r12: ffff830497e47000   r13: ffff830497e49f40   r14: 0000000000000000
>   (XEN) r15: ffff82d0407dad10   cr0: 0000000080050033   cr4: 0000000000f526e0
>   (XEN) cr3: 0000000043c16000   cr2: fffffffffffffffc
>   (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>   (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>   (XEN) Xen code around <ffff82d04077bbc4> (arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160):
>   (XEN)  00 b9 a2 06 00 00 0f 30 <80> 3d 71 26 f1 ff 00 74 3e 48 8d 93 f8 5f 00 00
>   (XEN) Valid stack range: ffff83049a4b6000-ffff83049a4b8000, sp=ffff83049a4b7ef8, tss.rsp0=ffff83049a4b7fb0
>   (XEN) No stack overflow detected. Skipping stack trace.
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) DOUBLE FAULT -- system shutdown
>   (XEN) ****************************************
> 
> This is on the instruction boundary after enabling CET (writing MSR_S_CET) and
> prior to establishing SSP.  Despite identifying this as a critical window
> where any fault was deadly (the CPU tries to push a shadow stack frame at 0,
> hence the CR2 value wrapping around to the top of the address space), I
> clearly forgot that this meant interrupts too, which are enabled.
> 
> Along with regular interrupts, NMIs are a problem.  Unlike other cases needing
> NMI safety, we can't use a self NMI and callback, as the stack needs to be
> empty at the point of enabling Shadow Stacks.
> 
> Disable interrupts, and turn off the watchdog if it's configured.
> 
> Note that watchdog_{en,dis}able() do not work here.  They cause the watchdog
> NMI to be ignored; they do not inhibit the generation of NMIs.
> 
> Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -908,6 +908,19 @@ static void __init noreturn reinit_bsp_stack(void)
>  
>      if ( cpu_has_xen_shstk )
>      {
> +        bool watchdog = (nmi_watchdog == NMI_LOCAL_APIC);
> +
> +        /*
> +         * Between enabling CET and establishing SSP, any fault or interrupt
> +         * is fatal.  We must arrange for none to happen.

... with a note regarding #MC added here.

Jan

