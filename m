Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2TucJErnO2pvfAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:18:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F66BF070
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:18:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=AVvlgzI8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345016.1604023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOQt-0008RA-NN; Wed, 24 Jun 2026 14:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345016.1604023; Wed, 24 Jun 2026 14:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOQt-0008Ov-KB; Wed, 24 Jun 2026 14:18:27 +0000
Received: by outflank-mailman (input) for mailman id 1345016;
 Wed, 24 Jun 2026 14:18:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcOQr-0008On-Sb
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:18:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcOQq-002eHB-WC
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 16:18:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3be72b-5cb7-0a2a0a5109dd-0a2a4506bccc-16
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:18:24 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3be730-08de-0a2a45060019-d155dd2ce931-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:18:24 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4627adcf4d6so879199f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 07:18:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fe7b9e5sm441717515e9.10.2026.06.24.07.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 07:18:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1782310704; x=1782915504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GKpmAxy6+hQhK59rbyRdcJYyg0sshmUpGh5LkxRwn64=;
        b=AVvlgzI8wlVZLwp5pErcmIXbkbhgp2x7zzSEoC9jT6djij/6IINBIVOVenwOAIDAJD
         U7bg32xXGWiSB9hINcK8WV7KaAza/n0Pte6IPln8gDUQiEfVLSCQdM9mpPbmaJzom39L
         Q6ourVgMEj4ilFnAB4UGKVfZieiLzZMMIhTYVL96c3E48ywbC2cnvcDHtQzsLXfx/1z/
         DTTfKpS3TDt3E6yCnfmscZ5yCKd/y3+WJdkNtXHK6D5OIk4pca0nRqCY15FjRM32C6Rq
         WxVQFOWkQQM/WE5S9s0Izo6IL3rNXAvfh/vvg6v0OaGgq2vb15txE2HQHJx79/ssQvOh
         NvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310704; x=1782915504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKpmAxy6+hQhK59rbyRdcJYyg0sshmUpGh5LkxRwn64=;
        b=JvwZac/xpkaC0ve95WG0M+kB9IBvGHYvPXILXqQO/RUEX01Ch3CMlrjn/BmHb/Uq88
         DMgWuXlX9ybX4XxomGmG+Nao7tuimfNioAQQNtk2sWscJNaoD+g8JxrmXroLJ2UEKFkX
         gSZAShi7ull6XIYsQwDHkLgdX1EWcKIoZfaJ8kMkI8WpnJzBQTi/YzHGlomxzWAdmq2q
         9C8r7C44GcPmQ+vxokqrOO39fYyyotdoASn0Ljb25NSK/Qb7xPe8MbPCDxwjlHjEWHpe
         0CfIbGfZfm2zJZRy3dWdy4iZUOahuXsMKtONoFrO9k6D+v11i6T1pqFVa8qCX2+RRC/I
         LoAg==
X-Forwarded-Encrypted: i=1; AFNElJ9zEzyRZFx62JCiXTVWJrvkMUhhldfgYRZHWgh8k3M+RPM92aqSjVN3QsjaVIySsabghH8Vq7jSI6o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd5+agN1BBSgLVJ930NNutTWRrBEFM450bOo2cYU2BtKx2Jv7N
	njqB+nVShaxA11dv5kWJwniDHrV0fWq3sAy0vF+W7vvLfYvL5oIrpknFvgu33XiqxPdYbfKrWry
	pjaBmlA==
X-Gm-Gg: AfdE7ckbyUdtf6hw5dYd5+q/VQD4uJ+bdQwEAXmAL1aSDegm94EDk3KvCwyt55j5C+f
	k2QpfxRcwFmRdhTXn+yCIVd1M3JNIOLB3VrCcaERLiU1hvBcjEtTKzV8Hq9FsSAOagIDe0u7581
	9ce3vdFtey6mDso2Q8ps/PsisGh6qGox6IA8JlruknPrO2vPdvSc6veOu9XtX2k2AAfwIj6rHzb
	t2fULhNUGe1m6D5eMaH7hTsJY/1qV2qzL4nTMB0kxji0AOr5oVheE+otA86YoEhOzN/lsOuLiqW
	orLi/H9XDHGR2rGZ/T5ix8XwuQsGWRntmzd/6rEYwh/3Io9VcK5fQunCvnc5OLkUNKN7Pz+W5K/
	oo75ww1EQgmEcZxIwJ/Pmdlgjle5qiE8SE6OQoiceN+C/ylHBIZF2MfngpeEx2w+Wy/4jPeviD1
	7reVfHk1p3V4tqVXEmpJTDPmExIAcjCk3bR4vooErwlIxa/JHTFRoIZihd7HLHJ68n2BXl3oWu2
	mWH
X-Received: by 2002:a05:600c:1910:b0:490:b3e7:4614 with SMTP id 5b1f17b1804b1-49260878076mr50358735e9.25.1782310704188;
        Wed, 24 Jun 2026 07:18:24 -0700 (PDT)
Message-ID: <070ff282-5ee4-4c24-b0bc-92d187c40dd9@suse.com>
Date: Wed, 24 Jun 2026 16:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/efi: discard multiboot support for PE binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
 <20260616172830.111393-3-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260616172830.111393-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782310704-41F3C68D-C37D94DD/0/0
X-purgate-type: clean
X-purgate-size: 1198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime,invisiblethingslab.com:email,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC8F66BF070

On 16.06.2026 19:28, Frediano Ziglio wrote:
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
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

While on the surface this looks okay, there are still concerns:

For one, this also discards the PVH entry point. That's technically fine aiui,
yet shouldn't go without mentioning.

Otoh you discard call sites of functions without discarding the functions
themselves, violating Misra's "no unreachable code" rule. Eclair may not be
able to spot this, but imo we should still adhere to the rule. Proper
coverage analysis, for example, would likely turn this up.

Jan

