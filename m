Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jc64LeBWTmq7KwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:55:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADA2726FEC
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:55:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Yjg3Fgc6;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357045.1611546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSkE-0004QP-VN; Wed, 08 Jul 2026 13:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357045.1611546; Wed, 08 Jul 2026 13:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSkE-0004No-Sf; Wed, 08 Jul 2026 13:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1357045;
 Wed, 08 Jul 2026 13:55:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whSkD-0004Ni-7a
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:55:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whSkC-000ChD-HM
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:55:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e56c0-2eae-0a2a0a5409dd-0a2a4502c264-44
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:55:20 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e56c8-5a27-0a2a45020019-d155dd2badaa-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:55:20 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47df43bfb07so93612f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 06:55:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e785sm42566313f8f.8.2026.07.08.06.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 06:55:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1783518920; x=1784123720; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuWt6tWDnRraObhWqZWhDbPPPU4ZOgcLZcE9EY8FRmc=;
        b=Yjg3Fgc6csTrI2YHr5BMnpFYKQ5cJWXoYT2RomDfQOL5i6GKIP/GleQDAVYlTr3Cxf
         SI1kIyyo9gv8C5Lihq4heG3UtH6DRrnPgheVh3QxBUYsxA9IwQyR3G5U0h6JvMls2Bux
         WljEQDdC8INED7WOKqOvxc4ZX2z9CcWqw7dqZ2VnOKaTJhglzs72vuelhRdIlpfPJX5i
         0FICntTMl+LtRa1mqaeJnnwdcQrMJe547ZS3Kjx30b3RZ/Ymofm5lLrTS6u3r6+8L2+m
         qpUh3JgTfr4zg3QF5DfBzN3AvOtcyiKZiDV5kNOFAY6bBbaPU9ugRqAJN9LD6nzPjH6Y
         065A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518920; x=1784123720;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SuWt6tWDnRraObhWqZWhDbPPPU4ZOgcLZcE9EY8FRmc=;
        b=JWWBNbSpdkml8qfxxHxrsEMI62HLx1kX8Q7D+YBtvhGZu/mWdFO2TiPBQk6qeXw5/Q
         JOXKtyFN5lFtNiEPbyvL3vsiMJVT8Ii52x96bS/iD6+hR0QlxXAwyJpIvcoyjrt7x6HH
         ZxWcaWwnEIZXsNoZ19wW89MB0RH0edJjXUED4SaOKTz7Z0uk/iXWM5/3nuZM+q8Irkvs
         is8EeDh9Dkp8U/QJ/JTS6PyMlDrWhmHoyt3TLrWvSf+Xc/lu/IDgkH2ae3kQ6xP4VoTd
         b19fsyNwR4iUm9T3DwDl0dZhPMF+/BwI6K1C332AppF2QXfYuzbiVhrDPKmMQvBomYt0
         K/Sg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0Jl7ZgRmxP6TFWDh4G6nih+Or0gaFaOOt26flmtVxjLMO9aPUi+V2xSpT/tkIo/q8SZ/fB+/R7LY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygC60NsTOOBpkFQnBawU85sjh9Iw9n1BDvr6kj6eckZM1Suu4I
	yI+o7SUAhiB2MjDQJoAF186V3wJLpt0i3X9gSyGyIF6feZQ9b2cMHVRjjdRyKi/5tw==
X-Gm-Gg: AfdE7clXIqXhzEdhnrT9GRe9FahTi4K02HS92BgtEDtdZYWFPUKtWJ9dHiXTCeXUAjY
	TfTBVAXqo3lbju3m6KBvjozExlW04V7g9+WJ2doQww80Tthq2gX/IHVfSV0RiUv9QqwS5jXDbvV
	CUF8tWyQYNXP6wHbGEHOgqOhNUdS8RWizdUHjcu3BxC/iLyE1FlgBAit+aln4mfa+XzX8mF63At
	A+75WA1KD1Lxw+5lGBaGNZJ/4XS4i6UP+VcuTQ34/36qH4vPuyT2BL3HDjF6GgtHcySUUMfTUCe
	e3XTVQ9ERpdQPuu+N502TL144zdjD61b88oQy9HRFxDVQxiHgR7AG8V9AD1a+W71mi3Y7Zw77CT
	I8ZBT8gk1IMOFkD8vFwzRn5lfiwvwNI7iPTJqDZoc1LsekybWLkb0klvW+JjhJwgW/3qM3nVrSz
	KoQLF47FOe3z/P0yYPgwpnroFBMb6Uo1v90lW741f8xrX2PYRD82ej8GzqKZqrl/10RphqL24IC
	q/A
X-Received: by 2002:a05:6000:2287:b0:476:5c84:e830 with SMTP id ffacd0b85a97d-47df071e53dmr2931859f8f.9.1783518919445;
        Wed, 08 Jul 2026 06:55:19 -0700 (PDT)
Message-ID: <598f9701-6fc7-4a7e-a26c-6d60b1f7e667@suse.com>
Date: Wed, 8 Jul 2026 15:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] x86/efi: discard multiboot and PVH support for PE
 binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260706104557.430097-1-frediano.ziglio@citrix.com>
 <20260706104557.430097-3-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260706104557.430097-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783518920-4D50C7C5-84690848/0/0
X-purgate-type: clean
X-purgate-size: 694
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ADA2726FEC

On 06.07.2026 12:45, Frediano Ziglio wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Multiboot and PVH booting are not supported for PE, hence discards them
> in the linker script when doing a PE build.
> 
> That removes some relocations that otherwise appear due to the usage of the
> start and __efi64_mb2_start symbols in the multiboot2 header.
> 
> Section discarding is not done updating DISCARD_SECTIONS definition as the
> change is specific for x86.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


