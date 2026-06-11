Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 80BOJaLIKmrhwwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:39:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E7672C6D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:39:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="Lg/YEAj1";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335699.1597882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgYi-0000QR-5a; Thu, 11 Jun 2026 14:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335699.1597882; Thu, 11 Jun 2026 14:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgYi-0000Ni-2s; Thu, 11 Jun 2026 14:39:04 +0000
Received: by outflank-mailman (input) for mailman id 1335699;
 Thu, 11 Jun 2026 14:39:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXgYg-0000NW-3n
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:39:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgYf-00DBr4-28
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:39:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac866-bab6-0a2a0a5309dd-0a2a4506af98-46
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:39:00 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac884-7371-0a2a45060019-d1558035c536-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:39:00 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso69144805e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:39:00 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e531e6acsm59127275e9.12.2026.06.11.07.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:38:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1781188740; x=1781793540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGN3dQ0qDWmI21IwkH/ZAtvxBn8xKrsbNLbZu47ovMQ=;
        b=Lg/YEAj1VgTGs2G3graCDci2X6vZ6LCWXWm574OFCJs2ZE1MwD2/gNeQJQ/Jflhb16
         q52n2Bw9mmS+SYgL+yQBwetn3S6umugXQK8JXuMXhPrChUpRPj51bNxMXrv/kWqFvOu0
         2MyYyeKwioCe9Ruz85LqrL1gqhH0Brvv0Lm7QbQPocx/M3d6xdDdYXF2p5TcoV5XNvbt
         wD4AtfhdXDWO5eDHW0kq/wmfJCzavQMvDMRBKwZNP3jLlatZxvAdVV1KFgvSDwINUDnG
         HT5UXlYPCuB8DnfvDy3ILUMTuQ3BebP9tw+uV19//TxdcUpQ57TI+Q4m3YkvemUrN8Z8
         WJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781188740; x=1781793540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGN3dQ0qDWmI21IwkH/ZAtvxBn8xKrsbNLbZu47ovMQ=;
        b=fDbjXuiIHGzpkGbvlnvmz/Renanv712VnsEbNzGbV4rMrO69sweAPkU66nxpiWrMJu
         IFXcmXT556Cjv91e5p1voTY5FhjQBz7FZrOAejHyOYCdjrimc8zdRZ0Xig8Vl9s9o5ik
         aQRPZ/ZJVVzSNepMUIotGbC2EtrpY+zSXME6JfZOX0W3V0kLlpVZiwgyV1oxasJklixI
         +3KNc2TJdCBA/qKlnAyUchtBgZTNHPNfahp+gKVQwyrfcAPbdDC6dQBDfpRU5HAk/4DK
         Evsw2Gt6rmrRhUYuGzD3eCpcgAQdQwAvBtPgVqBPFd7OrXQOi2O8WZyo1Gx3dB86SqMy
         tUgw==
X-Forwarded-Encrypted: i=1; AFNElJ9TFKGf+6i1KeRSfm/rCQB89KnisxYy0It/m0j1onqOp9DgR7v//yvsWuVEWIdU/KQVFYzuPXfA9gU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5TvQWiNUkIn1wnitUlAQT8px/KOmfssr4m8G2u9gumHfxE+1U
	4buNjGx1HZD4KocSPgOpCqLzug7v9HhfGGsh2hY/LdKBvwTqF1RibITz7Ft0+cHyWA==
X-Gm-Gg: Acq92OEAl1twWubwgs9zFvFetrtY/fpGQ/rlSbbOI1xj3plaWL9BILMiXPqibqyG3i6
	pwyfgczn4R4dlpuGglg3lNsOHufxfyPQFzhVjhFHphr97KFVE4A/iUa8ZHEJf5iZ4OA7DrUlkwr
	SkWZK14rIbE9uSmpLJwOtjASEhH8cju8aaMj2C1pxEAVg71A6XXdp3FszRYHk/sBC5TGw2zqhDS
	13FycJMiQE7B1epHfJMz+Xktn2a45I3P5vta78AuOt3eHGm9xNnrkWkYIOYfGGb6wsmk9j19p8t
	qhOb1Win6oeYeEby88asXOvc11SSm+//JcqUUDIYRG/IfBKnMTarbz4kLzvAOCaMybsOktGpCnC
	d7MAdp+EpK12ZxvICdor70qzRTvEbOgkdduz1jtITPQER+LdSQ9lUzo7TJOwCa3eMDujTgEI7ds
	epl39yUE502pSnQnLYs0l2O2SKJhc/i6PPkOWRmR1y0mx/BLmvmEpFm3AyfB1j8Cmm80h0ADoY8
	if3AjWrXBedujza9y753L0j1IBEke3/0EQbWeAD54jZEzhd5NWPmhNIhc2lxcIcQNr3Io0=
X-Received: by 2002:a05:600c:620b:b0:490:e342:127 with SMTP id 5b1f17b1804b1-490e561e427mr40169185e9.34.1781188740315;
        Thu, 11 Jun 2026 07:39:00 -0700 (PDT)
Message-ID: <b310db60-850a-4096-8900-54d0816e5063@suse.com>
Date: Thu, 11 Jun 2026 16:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781188740-8CE79D75-144DC2B6/0/0
X-purgate-type: clean
X-purgate-size: 1791
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E53E7672C6D

On 08.06.2026 19:31, Andrew Cooper wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
> to boot xen.efi when debugging symbols are included.
> 
> Either way, having debug symbols by default is abnormal and contrary to how
> the non-EFI path works.

I'm not happy with how things are put here. There's nothing abnormal about
including about anything. What is abnormal is the manufacturing of a 32-bit
ELF binary from a 64-bit one by mkelf32, to please bootloaders. An EFI
binary should be permitted to include whatever data it wants, and firmware
should be able to load it as long as memory permits. I don't expect you
mean to indicate that problematic systems don't have 45Mb available at boot.

Including debug info can be a waste of I/O bandwidth and memory, when the
loader doesn't skip loading those .debug_* sections (for valid or bogus
reasons).

> Produce xen-syms.efi unconditionally, just like xen-syms.  If
> CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if not,
> then not.  When xen-syms is processed by mkelf32, the debug symbols are simply
> discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
> 
> Some old versions of binutils ld managed to produce efi files which the
> matching version of strip couldn't process.  This includes Binutils 2.26
> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
> less broken toolchain.

And we're certain newer versions of strip don't do any harm to the binaries?
Already towards Frediano's posting I said that having looked at how things
work there, I'm far from certain.

Jan

