Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCsxGjPIAmq4wgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 08:26:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A2651AFE1
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 08:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306570.1578441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMgZq-00022x-IY; Tue, 12 May 2026 06:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306570.1578441; Tue, 12 May 2026 06:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMgZq-000211-Fr; Tue, 12 May 2026 06:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1306570;
 Tue, 12 May 2026 06:26:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMgZp-00020v-Ba
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 06:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMgZo-008Opg-L6
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 08:26:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a02c80e-e002-0a2a0a5209dd-0a2a450ac0c8-42
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:26:44 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a02c824-56b3-0a2a450a0019-d155dd34ad6c-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:26:44 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso879573f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 23:26:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549120eab7sm29755149f8f.23.2026.05.11.23.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 23:26:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1778567204; x=1779172004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K250rKmBEtrlsIr2d1MtsYeB0UaG3/8VH+Dt3+zVzfU=;
        b=TbYR/Fn10e50tqdacSYZECtTZJBI8EyUEPpJYhMmRP7S7ZCubDvE58twTT+mFZNgkl
         pdjvDqnbugJli2QlNcjr09PPPw97vbB4qKtvM1YtpfUnZCngtJZ2XZmI7ja6RxHS2ID6
         lHE70Wk6s08wCS57gQN1u3MEi/OULCiwP2FzFILzFPZbM8p2CYkMa9z3KWS6Vsqa8Mwd
         0Nb8Q/yVgvA9yTpxcBonyIjMgAsKg5fPeUVKCNWSVDNtvJv6Ihz4rZLavzZHO6Ahg/6t
         65CnU7k4qsx9wRJjWYz5+F3o7IlHJzeVhkbFxB+3T+Pw1yFsf6MJ3rNZxqKOV0TWUTLV
         mc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567204; x=1779172004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K250rKmBEtrlsIr2d1MtsYeB0UaG3/8VH+Dt3+zVzfU=;
        b=IqeySLeNuh0KBEtu287KMmeHboeLyXL9/Yn0hgFsVAG6C4QFDSppCsmd63f3LiURvw
         QTlGcFaSAQ9/vnMX4FzEXVDI+4cnUouGNtA5Ez1RjtyUjwirJ+Gi9kCxWXm0WhQ9by3o
         R4JfSg1Sx+cBYBQxdf8AmVE5h70hWQhpPQPQqiOlsLz99nuhGdZ3L82ambf3It2GxbAC
         aUrOFj/8rNaTDnudfzBinVXI0zIStzqtWT3XqjXFt5mEXekWb3sh+7fhi3I+A2WSO9I1
         GZdwbl/RXBwHH+kSQEevMF6HtXLSdNt5oV2DiiIDgrlx+lRkmAour5yrM4GakZy9xb6L
         iEmw==
X-Forwarded-Encrypted: i=1; AFNElJ8X9h1cE+S16jDfU7HHFvJO3Z1zRkXpqIC09/QoJAqVR2Bg62c87PgPmEYgfjHTnZey0nyqbyg1JHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNZnS47qKvqw2xeukLUp2f7aW4nt7kJ2VIj+nv2qzYMtAA661r
	INdxpEAA1JkP6rTDIfnPf9a7rsyNPnbYXbixbLs94HvH+E3wo5SsTZYYj1oL+LuEOg==
X-Gm-Gg: Acq92OEbIuNpf7+txDl+UCek/3ogrqkPrdaURWoiyT/g803PVrZzjKwVohvoWDHvkHQ
	Dc5eufcWtDJ+2j75oevlNZeeB5hvipoqZv8KaXaOQFIjMZyEEnqx7xyMx2rMIG2wjaQZvwmTTV6
	+u05aNgBf1ICX7mliKFyp5HtVbSEymQluxLshMuvbDyFMnfz8QRsarKomHy5i5vCD/fe/0etB9b
	1AM1+21YexHcQ02fQ4c0yZTF3Pd+up9UtXuMzNnXjdP7qTT7n4e9xT3KFdfKc5Xu6egIb/TzSbI
	uMm8eMB3bgHSklO4VlUHwTgccPywcg48XB7PNApSqHrXWwZxGCQVekzQMvJnc6dtwbOV//gPLnr
	ZZd9TT8IqJgeksZz2IDYTxKyeVm+ZX8EsY5MpX8zaAxOGljxgTqI9Y8coJPxYMgwXoOcAf7y6Aq
	k5WAcoE93icHJ2Cv793Jfzsc5m6YVcKVHyhIWLZK3wKG+6ujsbPmMFIkOr81IRIk6p4hkv8w1cI
	WEQ+kl3X/dX8t2rQtykiREk6Q==
X-Received: by 2002:a05:6000:24c3:b0:441:3144:efc5 with SMTP id ffacd0b85a97d-45463d8a9a9mr27201888f8f.42.1778567203918;
        Mon, 11 May 2026 23:26:43 -0700 (PDT)
Message-ID: <d251abdd-0cf9-4542-ba78-63db890b5d10@suse.com>
Date: Tue, 12 May 2026 08:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/dom0: enable pf-fixup by default for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260511185145.23750-1-roger.pau@citrix.com>
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
In-Reply-To: <20260511185145.23750-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778567204-7FD788B7-9076BA07/0/0
X-purgate-type: clean
X-purgate-size: 426
X-Rspamd-Queue-Id: C5A2651AFE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11.05.2026 20:51, Roger Pau Monne wrote:
> A non-trivial amount of issues related to PVH dom0 are fixed by enabling
> the `pf-fixup` command line option, and no issues have been reported as a
> result of its usage.  Enable the option by default to make PVH dom0 more
> robust in its default configuration.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


