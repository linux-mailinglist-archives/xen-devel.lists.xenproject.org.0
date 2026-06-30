Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MELaLvlfQ2pQXgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 08:19:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A96E0AE5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 08:19:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XMid6dXN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348334.1606128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weRoW-0006ix-Rz; Tue, 30 Jun 2026 06:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348334.1606128; Tue, 30 Jun 2026 06:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weRoW-0006gO-P5; Tue, 30 Jun 2026 06:19:20 +0000
Received: by outflank-mailman (input) for mailman id 1348334;
 Tue, 30 Jun 2026 06:19:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weRoV-0006gH-0d
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 06:19:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weRoT-00F9TE-BU
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 08:19:17 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a435fe3-bab6-0a2a0a5309dd-0a2a4509dfd6-2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:19:17 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a435fe4-97e6-0a2a45090019-d155dd2dc49e-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:19:17 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4728c12ba97so1602396f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:19:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475643cd64bsm5575010f8f.14.2026.06.29.23.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 23:19:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1782800356; x=1783405156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r6KI4HvngP2zRMm0XQShRygyxq6ugGXCmkWg//rK56k=;
        b=XMid6dXNqBt1v+lSToJ3dflOJY1vgnmwPAPqknc3gq/zqTtMSW+gTL+dQ3lMj1jRen
         xDf2osrEgdkM4JmmJdPNSTp/W+jXQt+Z9Ql6oFOIU8f96kKI5J3Ims5ZEN8ctMTqmbj0
         3v5itInwCOtdU32YZysrw7PhcypsufdPjXkzWHce9ukv3NHn3hAvckmcYMKHyNzl/0lV
         d9umb2u8HVapDgmQ/j0VI7gkcYhOjGuN+plNKe53xglX98xSxsG12AvmF35UwPLWbUlM
         sy4pfOEzuu4lkzZQUg3HZjDAfhwP6ABA8bQIZ/fzK+yjOPMHCaXqPCNVxrNhtdQPEY5t
         ymUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782800356; x=1783405156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6KI4HvngP2zRMm0XQShRygyxq6ugGXCmkWg//rK56k=;
        b=JKmHBG6Ze3EFMS4Yjp8XXdtrQTmjba4Odvmbz+/9ndH6Wl8ojBU6PWK5GspuDRPBkb
         Wh0tGDKefX5V2pNN2ZKVZsmfkwjDaxFB2zj6oD/sIeEjimtCImUIH4Il0SzqWhbrONzS
         15ZvbiefSNoTwGWnVFrsMuhIFYiLp0qKUDuP/9+fisxF1ZUOylhs5jFNapu5kWHYYNeN
         Sd4gdjWLVoUBwBiY/VZY5Im0pS6uZwSMBO0fgFRekwu3YbPBxCaJXrJNNy+04tsHSP/q
         2yVJ7pBTNXaDM0J4e4R6S9nFL0iL7nR6sybPqa4j5cXltJUjOHHuC2BDn9/z0swiYxeg
         H2cA==
X-Forwarded-Encrypted: i=1; AHgh+RpX5+VKt00TAqB/MArjScPz4v/9v/bqm//UzlXcVh4tzG8WEofFKp5a/4GnTdF2fVvhM+aHbM5e2eE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweyRLKBL0qWZbaDzQ4quUEOdLo2OKX9hybctihEEcoJlZjqTHm
	IoWRBWHCYCj67AF2exZ3oq5L7RZCUyE0XIqmBp7usJIgFH2kzUu9FrbnFmChPIl87w==
X-Gm-Gg: AfdE7ckPejREg6XwbhlZtMY7UnxqICfQnWLEjwLA/uccRkkT4p2wmfkhkHRtXalvNQu
	l+1DSzP6N1eLXDxVH0Oeh/IEPLbwPINNtsAScB3aaMdwAGOw9NIoYAP/JuXOqyVUfxXulBrU3zq
	cumPxnq42ZNfFNwWBAYwkU/DzZyCCzAVM0VDVcxo2K7h6fGXvtOHwcFn1GTz3oGZN25esVT5PB4
	GWv0qUynZ2QJ6aMZDtcvIXSmfZ5M0uRCHyz9EC7gL2znx+Rrjvtmyq+xgp5zT/gXcFW4QsJTqQk
	RcMsHj6IXeIS6dLiFwfXjFtCEUbhBIun6uiDa4Cd+co+NfLng9/9d3fAMXJW4qhQGQT/T6UoNbt
	fUj3s4vk4lpQ2zK79dbiXZDwMZ+Fl4P1qYRbtTQe1zzx5V9lrq/mDvuoTYDXtwLzmhpw10jmtVm
	arlCXxm0Q0KGEM41K5TG9CjS1tnAt+j2gu4jZGfPxIywykA3+1ESkkdkOsoLX6sv71AXN5Sf9a6
	Bjy
X-Received: by 2002:a05:6000:2997:10b0:475:3a97:8e3c with SMTP id ffacd0b85a97d-47550da070emr2181061f8f.18.1782800356613;
        Mon, 29 Jun 2026 23:19:16 -0700 (PDT)
Message-ID: <852a3242-27b1-407b-95c3-d070f541da74@suse.com>
Date: Tue, 30 Jun 2026 08:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 18/18]: docs: Document support for PCI segment in
 dbgp and comN parameter
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753824.8631fc262581453bbf619ec5b2062170.19f14688d8c000701b@vates.tech>
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
In-Reply-To: <1782753824.8631fc262581453bbf619ec5b2062170.19f14688d8c000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782800357-45B23986-1DF4D7E7/0/0
X-purgate-type: clean
X-purgate-size: 2576
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 136A96E0AE5

On 29.06.2026 19:21, Teddy Astie wrote:
> Now that we accept full PCI SBDF (with segments), update the documentation
> accordingly.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> In principle, it's correct, but I don't think ECAM is usable
> at the moment EHCI dbgp is initialized, which would prevent
> the device from being probed correctly if it's not on segment 0.

And if there's no other way to access extended config space (like AMD offers,
for example). In any event, imo this restriction wants calling out in all
affected cases.

The doc updates imo also want merging into respective patches.

> Same remark for comN.

And for XHCI.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -349,7 +349,7 @@ ACPI indicating none to be there.
>  
>  ### com1 (x86)
>  ### com2 (x86)
> -> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
> +> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-sbdf>][,[<bridge-sbdf>]]]]]]`
>  
>  Both option `com1` and `com2` follow the same format.
>  
> @@ -371,10 +371,10 @@ Both option `com1` and `com2` follow the same format.
>    registers.
>  * `<irq>` is the IRQ number to use, or `0` to use the UART in poll
>    mode only, or `msi` to set up a Message Signaled Interrupt.
> -* `<port-bdf>` is the PCI location of the UART, in
> -  `<bus>:<device>.<function>` notation.
> -* `<bridge-bdf>` is the PCI bridge behind which is the UART, in
> -  `<bus>:<device>.<function>` notation.
> +* `<port-sbdf>` is the PCI location of the UART, in
> +  `[<seg>:]<bus>:<device>.<function>` notation.
> +* `<bridge-sbdf>` is the PCI bridge behind which is the UART, in
> +  `[<seg>:]<bus>:<device>.<function>` notation.
>  * `pci` indicates that Xen should scan the PCI bus for the UART,
>    avoiding Intel AMT devices.
>  * `amt` indicated that Xen should scan the PCI bus for the UART,

Instead of explaining how <sbdf> is spelled both here and ...

> @@ -731,11 +731,11 @@ for the `all` value. If that isn't intended, raise
>  the `sched_credit2_max_cpus_runqueue` value.
>  
>  ### dbgp
> -> `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
> -> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=<bool>|hwdom]`
> +> `= ehci[ <integer> | @pci[<seg>:]<bus>:<slot>.<func> ]`
> +> `= xhci[ <integer> | @pci[<seg>:]<bus>:<slot>.<func> ][,share=<bool>|hwdom]`

... here, maybe simply say <sbdf> in all places and add text to the top
of the file?

Jan

