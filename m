Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL4PIdex+Wld/AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:01:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2F34C90C7
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300375.1574912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBdw-0007yg-64; Tue, 05 May 2026 09:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300375.1574912; Tue, 05 May 2026 09:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBdw-0007vx-3M; Tue, 05 May 2026 09:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1300375;
 Tue, 05 May 2026 09:00:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKBdu-0007vr-Ch
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 09:00:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKBdt-00DBYk-Cp
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 11:00:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9b1b1-5cb7-0a2a0a5109dd-0a2a45058ccc-26
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:00:37 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9b1b4-aaa8-0a2a45050019-d155dd2ba938-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:00:36 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d75312379so3383430f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 02:00:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45054b02abbsm2968453f8f.18.2026.05.05.02.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 02:00:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1777971636; x=1778576436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gcZjCWxHIEsDl+ZoSeiR/KjJakZqMTM+f6ZDOXWO9AQ=;
        b=VklbncsOkxVO3qE7LWgHzb1LCUUZ11gNS/t7HQabur0+LjR+mxru0jG6ZXLbs4xuP1
         4bTmXLkJgSDBrvvytQ4ZQKZIQaMOgvSk9TUdsyLhGI9OqFb5B7o1SeDnyEJ43i3Uci7z
         IbrrLpEvgzs+sHEJzuI460k79wHDnh1o0UiS/aU1velNuo4qPBNk6nj1xlkyrCaSownM
         LgATQ4B/PWxVkrJm7fMNNfyEGU2fFqhzppb9X58FUjpjcUSyhYPDHbEhpLM1RJ2DEF8V
         /CDT/PqiyhsD7N9YU1chZ6gguPTB7aBVUsEBYt1swTtmNO/WwSWdyC0jFsT6XC6oJD2D
         aikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971636; x=1778576436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcZjCWxHIEsDl+ZoSeiR/KjJakZqMTM+f6ZDOXWO9AQ=;
        b=h5aYAOnYxCg/7ZUUOZvubVxxbDoeIeNOvoQK0DAqWx3gJauIK8IPbkgXw8shY67eOE
         87Vg/GIhZkqS3Rz0+on8fnLwh/VBvrb6/aIKEnJhdsmam2NuX9kZTFhFJf9XkWNch7wk
         wbIbNvR4Z0vLwQWtPT1mGMIOTjReu6UD1C3nYadJ78oyG/8QsIWrcsYINjSyMto61P3I
         FRxmlZEMmCS+hgTxRZnG4AsHqCp6psWM9TW46ugja8L9ZP4tJ9EN0evxZweo9s+rP/tE
         rE9YR4/9N7q3LDNZjc8CQhT8iB0+vaYhNmITxEp/5d30nSTbxyrNYrnK14cdhV+B+jnx
         x2Vg==
X-Forwarded-Encrypted: i=1; AFNElJ8ymljW720E3Wy5CE4NR1jRn0FJMOh0IYzm6wmy9VjxhM4OUHANNOreGjchGEnMIN7Zv9QRcRe76wE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2nwf83O22I5kO0zQUN2NNfbE0Y8qwXtw7nj1CwuyNn7YaTxAj
	nEyV5nIoiIW9yiBNYvBZ99aA9JD/vyPyqScQdgcCHwdxRX6GZ6dYAdb7bz0WR7LIwaZ1XV/mSTn
	ufJU=
X-Gm-Gg: AeBDievCv7cC8vSQ12QsRw2A893XRMuS4R3DYUbhrIGYN0MH1mWyugnTGKv/S+qUzXV
	iQm6MG4fw8AlgGMIAbCSvT3TWUzJIB14x05XvEwB7JGMW0N6l8FPT22Bd6hl3bLWVCcp4oZml/x
	B9UxAT7grNb4qquOYoG/BbHJtVSxRpT9RrYTl4xaM7NtYSvgeXtIF7RWkUYWuoI/uY80R5mPEtW
	CbnIr8Budz/ch38Sd3/46VplZQiSo3kN86YmtwdijwoXEKTQZQfMtQ8KBh0hO+4RWF21pJ5+AjI
	jvSYUKIyhf/bMP2WJZu75lKMWWK3RrzO3iUhFq93Le+GTT35Fgk2RF2dtLEWSGXsqB3L2d/u9cW
	QLBvtYrpzkFmHoV8+teV/VCVVrhRYh623DsGcTO4SXKy3jx1b7ZdPdUGABrA5YiNpRdcDLEI59f
	gPCnQclghgpTmRPJUD/M7g8Vs+obL8wUC+PUr0gklknHgOUe3S5wPzzctjC+b9NAQWRGZa7jvwz
	WSaVqutuTeZp3DdDp3S9dkmTg==
X-Received: by 2002:a5d:648c:0:b0:43d:7086:b03 with SMTP id ffacd0b85a97d-44fdb5977dfmr3302330f8f.1.1777971636104;
        Tue, 05 May 2026 02:00:36 -0700 (PDT)
Message-ID: <ba9facaa-84e1-4c61-8e47-9ef76067a922@suse.com>
Date: Tue, 5 May 2026 11:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Disable interrupts when establishing SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260505084315.1350002-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260505084315.1350002-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1777971636-E93A0443-12747E49/0/0
X-purgate-type: clean
X-purgate-size: 2559
X-Rspamd-Queue-Id: 3E2F34C90C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[andrew.cooper3.citrix.com:query timed out,jbeulich.suse.com:query timed out,teddy.astie.vates.tech:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05.05.2026 10:43, Andrew Cooper wrote:
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
> Disable interrupts during the critical period.
> 
> Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> v2:
>  * Only disable regular interrupts.  NMIs are fine.

Much neater a fix as a result:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

