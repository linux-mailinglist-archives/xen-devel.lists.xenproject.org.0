Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFRNOF734GnZnwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:51:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773840FD43
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283611.1565788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDO3H-0004MR-13; Thu, 16 Apr 2026 14:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283611.1565788; Thu, 16 Apr 2026 14:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDO3G-0004Jr-UM; Thu, 16 Apr 2026 14:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1283611;
 Thu, 16 Apr 2026 14:50:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDO3G-0004Jl-3O
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:50:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDO3F-00HEfU-CT
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:50:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0f731-bab6-0a2a0a5309dd-0a2a45088fc0-40
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:50:41 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0f741-63b5-0a2a45080019-d155802ec8d2-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:50:41 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso82041685e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:50:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f581d93bsm59157165e9.8.2026.04.16.07.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 07:50:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1776351040; x=1776955840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XP6qFxUGIohGWvQOJLgxJLyDGnWaSG8PCHN+VV9d/x8=;
        b=Zfl5VhncLrtJU4JaKU7o31y72h8ePRFx2z/oPhtOpAxbXtEIxVnhWtYzpwgKlbei9D
         NhMtatzrDShYb+szyLFDi1VamuPByYMzp2T7y5gcKEH6UvNr1y4zPa87Jmjw0+VH5Hzt
         pq/kdSJou/9Yn5uQ835GRsQE1HuAtYouClypUawblfUTlafRoLDdK7UUXlG+9RpRbiFI
         ea8E45XHulSrEWNE4ynPzo9JLL6FR5f+DQlqvbD0vOVZPI8TCGNsT1ca/D/U7Wnrna37
         Z4d/RpY/HN7D9MS6SqVCq7v8R1wQmT0WqDg3kTnXq64NAu5qqigpMePwTnVS/LCSLHFR
         KV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776351040; x=1776955840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP6qFxUGIohGWvQOJLgxJLyDGnWaSG8PCHN+VV9d/x8=;
        b=FwUurQkQxXiP050xzMo6K0Cjsj5ukMB+2qe0qVw9soQvAmV19ZSBTh5wQL++enwraQ
         m8i3Ut1ZNtEZScuQnx16mfM8gzBXOX40XEJkHorIMkifBd93lRe5KCLH2QJxlwtvuQXP
         GaRvuGwpbqWmkyj2iZuXG9zRH/4iTHIgKkTx6ae808uV53lyUaratNoJCSaouToYgOqR
         seov1yHUaSTyyTHOvlahqxLYKw/6mTPmO2hi9FAceRGzVepdZe8NmF0TsatMFJpY6ubi
         WwvCvw4ZgV+ZaZtGJxHUqY68XrsGBVzSJLvKjHwO2KN+aQt+LchQri5Scog6/8pYeZA1
         x8yw==
X-Gm-Message-State: AOJu0YxUDibInamkyyle0htitHkDP0NDSTxciAq5PwFMgL8HanQrpgHB
	gHbDJfDOsgmCRDyqOJPEAvQMzYXeXqfM4nVfUKCtyGV7cZF1CD8d0gRyys+ZS539PA==
X-Gm-Gg: AeBDieugaFnJTNmkZpGWwZHEieyC9RM04TlobeYhVA/kDffpBNOAF6Q/fvHlLkiaOTF
	BuJR3vX9tvaiHYbsKosxrlJfzZCzDTbdTlKvVrsujw7GrhFvS/2mhI5Nw3zwZF+KGt2G3stEGvw
	7bwqiR9WYgmu4DhUcOQ4TyqSKHmRgquedox7Mef1aEnL10pgc5rqRGctqFZDFgHqfFnA54Bs/aP
	tYLEXqJATPWACalUcAlFSWkVP/piYqRgzoTL4X1ryYoevPa7ANcKidWKs9Zz+2Jma8D1veftA+I
	M0+Q0JpGDDAe6Or/vauWY8TZMlqJI8N8eJVIgSZpCDY0xLvYsEIpGnSMVyQO5CVTHZfYcjftOqF
	0K4vUKAxd9ZoV7OwzP8VI7Z+salEIvT62zHYbtYBnRcaR0L2HTJZkZUsr7DiMg5LJJfvZW31815
	1Gf0NFQP5fMWrZ2irB0oh/KxpKHGbKBVtyYSS9Gx+cdBpJCoCctlt4mhmwNhbm+eSGOpjAUmijw
	I8vpZz1xg3OSFTTBa5+Iyj+PKno1pbWbDnf
X-Received: by 2002:a05:600c:64c4:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-488d68c2c56mr325045925e9.22.1776351040603;
        Thu, 16 Apr 2026 07:50:40 -0700 (PDT)
Message-ID: <58dd3393-02a8-418a-8a8a-7d8f0256fb3c@suse.com>
Date: Thu, 16 Apr 2026 16:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xvmalloc: adjust XVFREE() ordering
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <29c2a896-59b4-4804-ade4-362f65ffadfc@suse.com>
 <aeD0tZVMC-LD5FMo@macbook.local>
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
In-Reply-To: <aeD0tZVMC-LD5FMo@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1776351041-C2F72DB1-2A5C894C/0/0
X-purgate-type: clean
X-purgate-size: 832
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4773840FD43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 16:39, Roger Pau Monné wrote:
> On Thu, Apr 16, 2026 at 04:32:54PM +0200, Jan Beulich wrote:
>> What c4f427ec879e ("xen: Swap order of actions in the FREE*() macros") did
>> should have been done right away when XVFREE() was introduced.
>>
>> Amends: 9102fcd9579f ("mm: introduce xvmalloc() et al and use for grant table allocations")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> No intention to stir controversy, but I feel like this should better
> use the Fixes tag, as it's not an omission or similar, but code fix.

I would have used Fixes: if I was able to spot a use where the difference
would actually matter in existing code. I can switch, but in the absence
thereof I deemed Amends: (marginally) more precise.

Jan

