Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N67PGCJ6S2pjSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:49:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CDB70EC60
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=d6Mt1t7D;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355250.1610009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfww-00017C-Mn; Mon, 06 Jul 2026 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355250.1610009; Mon, 06 Jul 2026 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfww-00015m-K5; Mon, 06 Jul 2026 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1355250;
 Mon, 06 Jul 2026 09:49:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wgfwv-00015Z-DV
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:49:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfwu-00GxeQ-Ml
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:49:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4b7a13-2eae-0a2a0a5409dd-0a2a450be7f4-24
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:49:12 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4b7a18-ac48-0a2a450b0019-d155802ddd6e-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:49:12 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493c2c0b9a8so25400245e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 02:49:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba971sm594498025e9.13.2026.07.06.02.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 02:49:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1783331352; x=1783936152; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRflqAxAhrpTUFhJ7RIMh57o9Sg3stDF/b11bzg+fD8=;
        b=d6Mt1t7DFqhd52XjvGI0PwNkrHdyYYj6oOehrXCViiwQm+CHTJ0ejVT5MoKDoDAlDF
         srp0c8nHlR+NhRZiKPuYxtuqcgJTtqOqUkI94xy2l9fzyq9Na2iyQVRF+eO27BTkqWu7
         aD147UruETBo7lxI8AUk36CKwtMxKI13HCddI2Xi5u+z0ariWNyijAVFCw5SwbOu45Tp
         WMpznb8oOxasKwHdPicRcQKA/4yUsBokH8oEHDVEhdn7OyCWDAksgCa7HcqyN3j/pbDO
         MZ4GEWnHwH9DmPAm4FX3oxfAsqAJzqr8Vd1Szm/34R0PazIxeU+hRz4oQYUYcy+6YnUC
         cWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331352; x=1783936152;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRflqAxAhrpTUFhJ7RIMh57o9Sg3stDF/b11bzg+fD8=;
        b=dwzajE4/PCMOusN62KVXlGsewYX6DXFFvO6dvGFcuR3KG0PLQy2Ydf9eynUeGIK+qH
         1SVEwyt7HMS73ru/DxWuIwNMUDixVqSGFsNzOBp2nAD169rJycXTYtlhkaolItBAUvoH
         vkk0qqDNV3jawnl0KfJb19aEngTC+KiCBRlj0UUm4kZs0XXG77ltwAG7QK7C7UqG+JIb
         f486vv8Uer90yD3gyLyS44PWBpZEOMRWFJ7h57o/kUYPZknTJflNYPUydor3aHKIWejz
         suRcZSpSm2e2vG5wwjhxZFkxfW5sK7W00B/ovJ37+22AJNhMJo/i5P5zpeIaDX35nrOE
         Zf0A==
X-Forwarded-Encrypted: i=1; AHgh+RrymeYT01541UDQNLKVifSNuTggkae1UJmcMNVnf2i4dspGS5sCh+1d4dsPLtwZ+qW1iTGYdu1uQJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7WWK4EJFNfiYGpetqVrimB7SonQ7tUPQu353gupZDuS7k4kS8
	WP+h8u1YqqunD8WllLLVPsv+TvRWb3qLYuSzkYXF2CQQWWa46T9UiSC9VWK59QbKdw==
X-Gm-Gg: AfdE7clTt51fQwP4Y86PEEkBFalGx/+Nyz/Q6MYmfDRdw+KMAIq0fkdW0gQROy6Pkl2
	mXovABUfh/vYZnvW1XY+qatWrwRiBUF6EKEUHxikc/ySAthCLgF+N7kQej69vNcODVE6WTtuJah
	/KwCVZNF61ZtMkR71/SRstts1TDUaNvnGWVBuSis0GvXoYOoEt5xO64VmpnmL4lnLk05RwBZnEr
	LhWiCP8qYCRaz9Lp7HktdZzrjpn/jQTU6YzKHVxRtBJJwxpF4k/+ny03fXLtodo7MSFZLsE9Lzh
	JiuG/9iaTdsUGacwYiS8QYpkp88aAvlWgteqdHGRaExNXm/enc4G81LQl1X4LqKuNevPocAnFCX
	zdJIKy4UilSLrPAKkxnZtqwhO2CTwNKN4H7j8k+Yd2DtEBLAgiGTOFgmq/yXs2M//jFx/siWdZc
	ZNgh+mWpq5YVLeZVvT3tOA4SzUQ1ck1Ib4i9GpvMFLwI51gAZ2emjvc3P+SkPUN/5t4/mDdDTzp
	ru8
X-Received: by 2002:a05:600c:3110:b0:492:28be:6098 with SMTP id 5b1f17b1804b1-493d11d8025mr124122995e9.11.1783331351980;
        Mon, 06 Jul 2026 02:49:11 -0700 (PDT)
Message-ID: <39b4bca6-b94a-47be-a462-b76235ea1c86@suse.com>
Date: Mon, 6 Jul 2026 11:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] x86/efi: avoid a relocation in
 efi_arch_post_exit_boot()
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260706094430.427155-1-frediano.ziglio@citrix.com>
 <20260706094430.427155-4-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260706094430.427155-4-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1783331352-4014E220-73AC8732/0/0
X-purgate-type: clean
X-purgate-size: 424
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9CDB70EC60

On 06.07.2026 11:44, Frediano Ziglio wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Instead of using the absolute __start_xen address, calculate it as an
> offset from the current instruction pointer.  The relocation would be
> problematic if the generated PE binary had .init.text as a standalone
> section with just read and execute permissions."

You did see Roger's reply on v5, didn't you?

Jan

