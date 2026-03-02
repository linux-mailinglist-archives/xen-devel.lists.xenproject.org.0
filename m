Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN8HL2BypWlsBQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:20:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F851D75A6
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244172.1543636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1JX-0006Ao-DC; Mon, 02 Mar 2026 11:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244172.1543636; Mon, 02 Mar 2026 11:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1JX-00069Q-AU; Mon, 02 Mar 2026 11:19:51 +0000
Received: by outflank-mailman (input) for mailman id 1244172;
 Mon, 02 Mar 2026 11:19:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx1JV-00056V-TD
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:19:49 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9930178-1629-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 12:19:49 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-439b78b638eso830408f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 03:19:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b0549600sm12199623f8f.35.2026.03.02.03.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:19:47 -0800 (PST)
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
X-Inumbo-ID: b9930178-1629-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772450388; x=1773055188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GU9opBkaf7BDbY884PlXLT1seZFwGlMBcHTY2nf6ZP0=;
        b=ViJ6Ieu48uJDqEfzAagSZW1AJK3GjBK/ivleYWHHSv/G5skdxquc8ZS0tAJW3LVlNK
         a0hffAz4pGlgGnduU7f/3jVjICeOCb6iqQlryMCcqg3NI3IQrmC645ZrCxNxCqFiZ7Ca
         MSLUBtfbq36UyfJ9FRdOKLIkDKva2CaRX0hMGrFAoXHWOq7CCLIVlNaLdesdamrrXsm8
         gOf6Q4ZXrUTqDn4buIKfP0ynHpvx/DtLoD+ubnJMp9ajM+pd3QP0kE+FFikiNdhUc/dN
         3U8lZjfBDWtZJXgrVhPDGbs+XOmlSTix1JFRr4v4mhxJ4wOQ3G7toQ0n/3xMhn8zwMiX
         I/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450388; x=1773055188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU9opBkaf7BDbY884PlXLT1seZFwGlMBcHTY2nf6ZP0=;
        b=Fhl46YiIbmAJcC7eFzD3T+8V0S9tBFZ6oh+6yuDh5m60oOU9UVb0URultPSuXyXSxu
         bty8globTDMefi0mGj8sfKkUAg1rLdTxd/aLzkbLgD5ARwENHRPzJ3Jf5+ufxNssmpRA
         PiaYGgc5mkP2KlYeDKFzz2qwZ4PuM+2Kka/z5LuDSRtlsFhv6QGMq4x//LIvbSzopxz5
         jIEKqDqI/QEQE5RcVoa726bGpXlEilnsYO6sSsg3vOjMaFaM/cT68JIutllpIBRv/ysN
         aNAVBKHgCC3hwN55vYNbj4eTGFWUOFlaHG/vfXpbIqLe98nd3CFIFjoJIvkFuieXiZHi
         3m7w==
X-Forwarded-Encrypted: i=1; AJvYcCWYMUrMCESVwRXEZCkcrM/tpwij/oHRAcUYXBumUu26n+FgxU6KudjulFT2f+5b7URvODq3rzgWwOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykayCwSfYBo0j2XBzEP/VXHRymLu+1o1nm+Xa4kCTrppi8tIdL
	cliqCS+34gzxCMX7D6xq0Q10/JjqmsDLlAZ2of3n/o9OAmAHewTALiGTAZe+JEAcSA==
X-Gm-Gg: ATEYQzynzCUND3LsAOUxJM4WaAeIQ8PEXNMrC+4RlUd3cwGimsZEvq7xVjaStCGdjCL
	ALFGGTtK/MUpm5xrSr8SsO6wCvwFF1GbRJWGFOwfLFT9Vqs8U8uGbLeONM9CNkUG3eGRuji54JX
	25QlW15vYfyjGYTMMV0KZ0zEoq8V5vnWhJpUfzmwEMDrN6sIAIiVLoegkSO0nw31MpTNRxmZ9MC
	su/NFJoujNkA4qgbu5MLJDZpH0Qq1n6VnXZwwQoce5ZwV3EPhLUv+3+w4C0Yc7DaGZTLAQZX3r0
	BCvnmLeKqXgfW1gKPTyf/EtFgMoAh0WguWHQR2Il5s8F+ApE8hv3V0ou8m5xPXAuimDUzOOB/IN
	HL3mFCTXgRzYCojau77qwiJMJSLAer8HL4jrK0A1ZJvTthW3Z+HuPWAbSmrdYQSFF2sLR7PCMW1
	AIrkGnZWvqqMuiBr7GbX7D30tajT2nK3zAl4URub5IfxkR12VU7jS5GyYEQxyBlwwlFG1lhJTA8
	m0ICewPCFQ+4k4=
X-Received: by 2002:a5d:588c:0:b0:439:b60a:b403 with SMTP id ffacd0b85a97d-439b60ab61emr6796477f8f.34.1772450388099;
        Mon, 02 Mar 2026 03:19:48 -0800 (PST)
Message-ID: <4052793e-094d-449b-af97-e2d068836366@suse.com>
Date: Mon, 2 Mar 2026 12:19:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] docs/guest-guide: Describe the PV traps and
 entrypoints ABI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: E5F851D75A6
X-Rspamd-Action: no action

On 28.02.2026 00:16, Andrew Cooper wrote:
> ... seeing as I've had to thoroughly reverse engineer it for FRED and make
> tweaks in places.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- /dev/null
> +++ b/docs/guest-guide/x86/pv-traps.rst
> @@ -0,0 +1,123 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +PV Traps and Entrypoints
> +========================
> +
> +.. note::
> +
> +   The details here are specific to 64bit builds of Xen.  Details for 32bit
> +   builds of Xen, are different and not discussed further.

Nit: Stray comma?

> +PV guests are subject to Xen's linkage setup for events (interrupts,
> +exceptions and system calls).  x86's IDT architecture and limitations are the
> +majority influence on the PV ABI.
> +
> +All external interrupts are routed to PV guests via the :term:`Event Channel`
> +interface, and not discussed further here.
> +
> +What remain are exceptions, and the instructions which cause a control
> +transfers.  In the x86 architecture, the instructions relevant for PV guests
> +are:
> +
> + * ``INT3``, which generates ``#BP``.
> +
> + * ``INTO``, which generates ``#OF`` only if the overflow flag is set.  It is
> +   only usable in compatibility mode, and will ``#UD`` in 64bit mode.
> +
> + * ``CALL (far)`` referencing a gate in the GDT.
> +
> + * ``INT $N``, which invokes an arbitrary IDT gate.  These four instructions
> +   so far all check the gate DPL and will ``#GP`` otherwise.
> +
> + * ``INT1``, also known as ``ICEBP``, which generates ``#DB``.  This
> +   instruction does *not* check DPL, and can be used unconditionally by
> +   userspace.
> +
> + * ``SYSCALL``, which enters CPL0 as configured by the ``{C,L,}STAR`` MSRs.
> +   It is usable if enabled by ``MSR_EFER.SCE``, and will ``#UD`` otherwise.
> +   On Intel parts, ``SYSCALL`` is unusable outside of 64bit mode.
> +
> + * ``SYSENTER``, which enters CPL0 as configured by the ``SEP`` MSRs.  It is
> +   usable if enabled by ``MSR_SYSENTER_CS`` having a non-NUL selector, and
> +   will ``#GP`` otherwise.  On AMD parts, ``SYSENTER`` is unusable in Long
> +   mode.

The UD<n> family of insns is kind of a hybrid: They explicitly generate #UD,
and hence do a control transfer. Same for at least BOUND. It's not quite clear
whether they should be enumerated here as well.

> +Xen's configuration
> +-------------------
> +
> +Xen maintains a complete IDT, with most gates configured with DPL0.  This
> +causes most ``INT $N`` instructions to ``#GP``.  This allows Xen to emulate
> +the instruction, referring to the guest kernels vDPL choice.
> +
> + * Vectors 3 ``#BP`` and 4 ``#OF`` are DPL3, in order to allow the ``INT3``
> +   and ``INTO`` instructions to function in userspace.
> +
> + * Vector 0x80 is DPL3 in order to implement the legacy system call fastpath
> +   commonly found in UNIXes.

Much like we make this DPL0 when PV=n, should we perhaps make vectors 3 and 4
DPL0 as well in that case (just for formality's sake)? Maybe 4, like 9, would
even want to be an autogen entry point then?

Jan

