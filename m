Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QhorFNQeMWrObwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:00:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0182B68DD2E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:00:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=V2xgqwDh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338986.1600084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQav-0006f4-Qu; Tue, 16 Jun 2026 10:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338986.1600084; Tue, 16 Jun 2026 10:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQav-0006cf-OC; Tue, 16 Jun 2026 10:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1338986;
 Tue, 16 Jun 2026 10:00:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZQav-0006cZ-2v
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:00:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQau-00GASE-8h
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:00:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311ebf-5cb7-0a2a0a5109dd-0a2a45049f82-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:00:32 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311ebf-1dec-0a2a45040019-d155802ab167-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:00:32 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso39931925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:00:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a58becsm46435065e9.7.2026.06.16.03.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 03:00:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1781604031; x=1782208831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=47lvtc1qPBlaDe4wl5rQuZQ6Hp7433nFKcad71tFleE=;
        b=V2xgqwDhc6jZBcysDF8r/xtP27roxZj7lo19TLCZWegeJA2FzGIAkjljNJBP5wUjF3
         ypEweO0Gxvo72ZRghyREJ7+rDoVbcIwV0OLQNTnzUqD1LPYTw8zXOoeFvgzXb49Oxtk4
         1tkikcwii9elgxH06epWOMxPJlzrZMy7QMQ0/TKx9pW+CsOX22hUK83o90kvBc3zUh0w
         FocjB7mWUO/W/ccgWDIkBurL4xWKNZJE48iniTxJez8016WoaRy8WBEIhDKmCq/1C69Y
         wBvTJ/3qNvZZEeSkK1I8BJU7kWE5YNWJJgK7Gn8gWENq0BgZji7DquG2Dngc7IXY7iwD
         uCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604031; x=1782208831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47lvtc1qPBlaDe4wl5rQuZQ6Hp7433nFKcad71tFleE=;
        b=GmBzX5Fv7pGlKbVawteC6ytpbaGHaW8PiesPrt/znSymOjopLmqaACi4ViNPw861rl
         uZmEsCYcPE5GqyPFEhcR+oInkGkIK8/yRWcGIMIyV4vMDE3vb0Dr0gGame9+yTGqMxnN
         Y0rgS3DUIVWaLS3xM/Mtek9/RAg9CmxkhqDmE8uvTAF+ebGoK1DrrujZlRRQjedRNLgL
         zBX1G3NHiU936tZm06BdDItXLVCXCbtIebIeK6VMWEA/JdAySa1mCw7mXbMKCJiHJC9a
         bKa4sAyEe+YVPG/TG31FfmmggX3PzPsgiExMJMWx0GXmZLqZEgwG6INTH3sqpzyLwGO9
         dx6A==
X-Forwarded-Encrypted: i=1; AFNElJ/LBHY4p9PjabSHvTdxVtVxdYZlEbqB8qhAb+WcrMjx3JdHnH0sD2ZkUgizhNbeipk3M/mht2JZnPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCcTNkWjNStcPoslVivAv4qRN4NP4TZWDkoT67QypUjeCdY5Y7
	FcnGSgZh+E9/wp5oODCU51kRBqDb68EoME/lD7bEbSQkEhzAO+ZFFVAjKUVI4v/24sQZK+NPbyh
	1pSQ=
X-Gm-Gg: Acq92OHF2fAguekjALWdYc/YMXgmWxdABwuFoeVi4I48NLdDKMd1pt7xohX4mJmrHAc
	be+7E3r1ZawoJxVqB8zmF89Ksv+ep4VVjlacfnj7lrACA/2YAlQPKaWaTfcvx1oPl8takRcOfnq
	EiSGoMRO+jEsCLUlTeot1cAJpEduLOzPw8NmY1HJOqaZuQ5KK926smbr+Xz/a+aUVZQAmPX15DI
	b2hKA5BINaTwAphjFYDgbsdv3kVKwc/vfXhHkqLd2xwNGscJigBVDje3E4FHRpl3JGbv/zOF3tP
	YjXaHyyo6YKvmey2wmhMf4lRReD4V6JEME6sUuc5KJ1G256PtQk6Dw6Kf5iBvT1nJgod7LidUrt
	Nj42/fkLBnJzh8fCmxUrua7ShR7lQR5Ny0XiojWoRaRsLM05L/zr27KcqTNvmknoX8O0zqlKcMC
	ExJTlEks3xm+dpBvhbINNbZecJHRlceYDJbE3kBWif8TOipeoubgxQu7wb2esg8w5T0XF4xBKHG
	ZIcHY8p8T4PoSU=
X-Received: by 2002:a05:600c:c3cf:20b0:490:48b7:c1ff with SMTP id 5b1f17b1804b1-4922ffaee06mr34955355e9.17.1781604031364;
        Tue, 16 Jun 2026 03:00:31 -0700 (PDT)
Message-ID: <2cc83d7a-1e22-4c2f-85ff-7e9daa0876ab@suse.com>
Date: Tue, 16 Jun 2026 12:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] libxc: drop size parameter from
 xc_flask_context_to_sid()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
 <33cc1e9d-38c5-44b4-b25b-0f38b625d279@suse.com>
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
In-Reply-To: <33cc1e9d-38c5-44b4-b25b-0f38b625d279@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781604032-429623FF-A4965DE3/0/0
X-purgate-type: clean
X-purgate-size: 831
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:anthony.perard@vates.tech,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[xen-devel-bounces@lists.xenproject.org:query timed out];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0182B68DD2E

On 16.06.2026 11:19, Jürgen Groß wrote:
> On 16.06.26 11:01, Jan Beulich wrote:
>> Nul-terminated strings are passed in all cases, so the strlen() can very
>> well be invoked by the function itself. In preparation for a hypervisor
>> change also include the nul terminator in the size calculation.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Ideally libxl_flask_context_to_sid() would follow suit, but aiui doing so
>> would break its (stable) ABI.
> 
> You could use LIBXL_API_VERSION in libxl.h to modify the interface for new
> libxl versions. See how it is done e.g. for libxl_domain_create_restore().

Question being - is this worth the effort?

> Note that the ABI of libxl isn't stable, only the API is (which is far from
> ideal, but OTOH it is the current reality).

I see.

Jan

