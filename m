Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCUvBmoy5mkGtQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:04:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81E42C952
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286002.1567126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpEK-0005zM-Lu; Mon, 20 Apr 2026 14:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286002.1567126; Mon, 20 Apr 2026 14:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpEK-0005wB-IQ; Mon, 20 Apr 2026 14:04:04 +0000
Received: by outflank-mailman (input) for mailman id 1286002;
 Mon, 20 Apr 2026 14:04:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEpEJ-0005w5-5Q
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:04:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpEI-008jqn-IJ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:04:02 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e63247-5cb7-0a2a0a5109dd-0a2a450ca7f4-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:04:02 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e63252-62f1-0a2a450c0019-d1558033bcfe-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:04:02 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso6459585e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 07:04:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c08faffsm156295305e9.1.2026.04.20.07.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 07:04:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1776693842; x=1777298642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zz2b3aedKjdY9PGqKELdtxVqQ+BX3mNG+YwacUxTB5s=;
        b=EWnd7q2NCsLUJ9o6Vo9ZIf0R3MyiP6TIYbVBse0lO8RReQ/UcMQfhfXQtp5Q6XrNI0
         ycfGzK46urA8VjbOU/cbp0P1zO5BQrF9wbvJrd3cE49Lv1uTVZB9RbKTi5o7YKbJC8x0
         TKTZM686VJ+FXZta57mYRfY86riAw1ULmx1yNDSGdxj/urGNEGydxB2xy6jfJpgg0mif
         l140cc4l1+zBQjJRJ7jP1el8hWb0P/DIiTXTLEozbo/5nYGvF9vmcx2fWZVJwZ+8tYtC
         Qv3Pnkyx3fT+DDPNhUhyPrxDBepH0E7VVDFVTspDZIkdXLZxx0nHGnje8tlkv9K9nsGJ
         AOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693842; x=1777298642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz2b3aedKjdY9PGqKELdtxVqQ+BX3mNG+YwacUxTB5s=;
        b=jI5hJvCkR1BrSXs4S0ljQiWG8XjuumbgoRdKzS874ujXanuzPnPhAGDuy13kU87Cry
         kh9x690HkPK5+S5JxWCBwTbr+1tbZzK5v7iYunRIdZtw8gwiJ/au4lnptgz5fQT+uEOs
         M44lp6Duf/qXvOmXkyIGazu064qpAapueT+kOs5uP/ckynlD6PtRj/xz9pY1UqV/KwAL
         /9W3PdTu0IMXqzEcMn7PJChuPKIhw4jgPFQXVCK+afNjgGYkD0RPW/8lmKvehQRBUfru
         BPGonxX0IjWDA8+MppniuFn8IL/csRuLsXzAOugq2UaM/yV6BWy5c30fmrdz5W8o8sby
         IuLA==
X-Forwarded-Encrypted: i=1; AFNElJ/Apgky5aamY4pLahaOQwlPlEhLkxLksYPZ7yNiFGuNF/dtCtNS3vIpbndSmJYI5AoLKabAnT5giw8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVHISbfIayojDI2ddn2QkIUdtrMSjZSEPkrmLIuV9/MKu4wttp
	j2OmZIAX5Xow1CXxF01QCRF6RBeGOiQP9dm8vA0Zr15nfytQEdo9glTGBnC0ibCpRg==
X-Gm-Gg: AeBDieu/89G/xNf5mEsPn4tbz9CiQzQkB3YfQAA0Twc+xQOmR8bJ/kUgLLnFozQCuC1
	tQDJe98y1jSke9ElFFNEoD/PjjLj8UQb2B3IiKiob/p3yG7EsuzXYfAq56rwI6TGyCfpBKnTAFx
	EFi5nI3r7LMvNvgka1sgpm+7JyV23dTqRPA+O75COs+AdTK9lhYchpAW0NwMHHW0to8cCc73Cgr
	OCc/YMMaxnnOM6a20Tfa0WxAKR/5ZYxK6faHYJGhLFWrJoifChDpHEiy9nTaS8sSD7pqjOpg6Ze
	XtERonzzUA6oFdfARNnptTBnrL9eEvyrFiYDmgEs1keglWYmm48tdCJwnFm3Wypm1FvyYKbgwT7
	52vc79mYq2o/vByHbcEjFSzl0Ru+T2ZrlmUoS5Qg8AKupe90WC9/hbg3nq+1v2cYTIf8RB87KvK
	OxNVwOAgO9K2Gn68Mm/SeKj4vrRw00HIH4wYnXHyR9kDwm5Cd1DKbrDqzAM8wEvtu9izFIzyid8
	1FFzq+TpluEw6hAyjk4H9paMQ==
X-Received: by 2002:a05:600c:8b8a:b0:489:149a:f9e7 with SMTP id 5b1f17b1804b1-489149afa2bmr88286285e9.27.1776693841647;
        Mon, 20 Apr 2026 07:04:01 -0700 (PDT)
Message-ID: <8f6ac421-8b6e-4655-bff2-bc733da52995@suse.com>
Date: Mon, 20 Apr 2026 16:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] x86/smp: Rewrite TLB flush using
 on_selected_cpus()
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <20260401163521.3603665-4-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260401163521.3603665-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776693842-6EB74CF5-EDE52468/0/0
X-purgate-type: clean
X-purgate-size: 596
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6D81E42C952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 18:35, Ross Lagerwall wrote:
> @@ -275,21 +274,18 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
>      if ( (flags & ~FLUSH_ORDER_MASK) &&
>           !cpumask_subset(mask, cpumask_of(cpu)) )
>      {
> +        cpumask_t flush_cpumask;

I think we want to avoid introduction of a new on-stack variable of this
type. For large NR_CPUS they consume excessively much stack space; it
wasn't that long ago that (iirc) in HPET code we successfully eliminated
one.

Instead a per-CPU variable of type cpumask_var_t may want using.

Jan

