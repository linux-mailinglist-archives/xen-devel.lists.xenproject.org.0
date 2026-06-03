Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id el41CyXfH2ojrgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:00:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F2635739
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:00:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=deiM0FU9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325837.1591175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgWV-0001Dl-OR; Wed, 03 Jun 2026 08:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325837.1591175; Wed, 03 Jun 2026 08:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgWV-0001BE-Le; Wed, 03 Jun 2026 08:00:23 +0000
Received: by outflank-mailman (input) for mailman id 1325837;
 Wed, 03 Jun 2026 08:00:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUgWU-0001B8-GR
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:00:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUgWT-0069Tu-Bc
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:00:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fdf12-5cb7-0a2a0a5109dd-0a2a45088dba-12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:00:21 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fdf14-63b5-0a2a45080019-d155802be133-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:00:21 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso14136815e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:00:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e76feasm121457985e9.9.2026.06.03.01.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 01:00:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1780473620; x=1781078420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=No0Kg3CJmx+XsIsMYAeJJPX2Ac33UIHjQvlORMGYxuI=;
        b=deiM0FU9dSrcbn9BdBzCDhRZMCnkmHq7OnXxfKkbYMSTuKuVYaBUUhAjlUcm9yOM3T
         uSgMw1uVyUuByNHEHe+MCBjDE8fx1ypeJuJg+ccm5UMLbhGnORaehB/b4RyOMsZendi1
         f7h8VhvRAIBliy1o/di7gsvvqVYHNcwBbVG9YGSbAQn4S9cGn8G/vz3k+iv5aDflc7pu
         GJOlAX3aEs+dpQy2cjvXZmL6Pg2iGPijlMi4UoFbMOcQ9L4GCmrtOzZop5R5jBHTLxgN
         xseYFewRPcI9IvwQPzb4esd50+6wXXJgKBiMO59GgRp3oW8tXgwk6N4YJ7tk+SUk2FYZ
         7f8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473620; x=1781078420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No0Kg3CJmx+XsIsMYAeJJPX2Ac33UIHjQvlORMGYxuI=;
        b=cy7+xHLIA8X8RmlBk0qMDPdlRFCQ4WNRJjpI1zUbK2z499huzFdlpOG3a47mCzuRWV
         pSgrODh2K4n/dpH2vLfxeXIUdp9/IM00MD9pJe+Acd3LLktTDsiw3i7lTC3NEOGRExE2
         oDc65um7jgnbN93pxSTE4ETa/Iw+BXT9uJ4KCglP7wTYgcOUxW1UdZiCcMMpHd7qMqgN
         A17TKEZoYVB5WXidzLGhJEqPkkHf1vji8F3AWmyTZ7f4Tzp1wlGMjatT9mReyhq5jQXu
         jM3a/l9iqUdTG8b5DJfxUkxmFc9YEQFkTCAukGsT0j0Ya/4sJ/GJZnXkbR9JUZjXEj0d
         iOyg==
X-Forwarded-Encrypted: i=1; AFNElJ+DeJ8G92zPhpEu4ubQV6htjB82spUZaGMLoGWc0NWvGVKKfdErcI3nduW5w2H/j5iDaGL0hIThXLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzIl0EoTYiIN/d7DIUJPiFq2wpI6WLbxobnTYm1y+Srfv1K/6H
	MUuyzHmuIYs35nKOayBUhcW89uOoLMqmYJV7+42+e1aXeDCWZGasaVfygeznaM3+7w==
X-Gm-Gg: Acq92OHS1bkSlb2ujZO51wJ7Syfr+SaxjUhP2bjXMbsYT4slSc5h6TRGiQdCTHqc5yI
	X637EBm5momr2M5CL9BFsiXzkzBTYqsNDNAqJXDnqDuIcILW/k126BpIcoulvXvWU3zT6tSaTKh
	H7n3hxduVAl/r3+Fmj47XnsxK7HSJqqG6ENegVkNdtWUryahDnKZaRxKJ2FSnusu3zg8zW8+Ofk
	usZtUUmhMaj6IpX0FdwZJYw78APpwhQyP+Pn0XW04XYgiPeElutovL+lzpI6GYppwUamLyaPyT/
	/tJNHLY0FEkp57aEezwRBRSgxvKUDVcMPhafohQ0aMCgFpsDv57xYEw+TMY6MKrUsxVzSBZW1xo
	5Baf9afkbEbM0rWRaTHSuNSLaW23jy0BrC5pF5njBsB9917XXBKLdEO/8JfKtHE0Yyc2sv7snSn
	qX92feSffLeMSKyDKBExNQGpLFMy/qRldUeNX8wV7giqjtXvAVM3v/h5kzIzgv8t6Pfha7szl+e
	UZhGWCMwPH3wqWv40uiXyINwhQ3YI+rPbtM
X-Received: by 2002:a05:600c:4fc8:b0:490:b294:c652 with SMTP id 5b1f17b1804b1-490b5eb186amr34691245e9.20.1780473620170;
        Wed, 03 Jun 2026 01:00:20 -0700 (PDT)
Message-ID: <8bb381d1-f713-47b3-b1cf-b195b3d89431@suse.com>
Date: Wed, 3 Jun 2026 10:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] misra: deviate MISRA C Rule 5.5 for 'request_irq'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1779709902.git.dmytro_prokopchuk1@epam.com>
 <ea8766aa1d70072815f98b904f317d02e25f3c37.1779709902.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <ea8766aa1d70072815f98b904f317d02e25f3c37.1779709902.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780473621-BC965DB1-4A5FC987/0/0
X-purgate-type: clean
X-purgate-size: 1680
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 608F2635739

On 25.05.2026 14:05, Dmytro Prokopchuk1 wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -138,6 +138,12 @@ hypfs nodes to allocate per-request traversal data with the correct size and ret
>  -config=MC3A2.R5.5,ignored_macros+="name(hypfs_alloc_dyndata)&&loc(file(^xen/include/xen/hypfs\\.h$))"
>  -doc_end
>  
> +-doc_begin="Clash between 'request_irq' function and macro name in 'xen/drivers/passthrough/arm/smmu.c' is deliberate.

While I think "deliberate" is appropriate for the situation, ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -185,6 +185,13 @@ Deviations related to MISRA C:2012 Rules:
>         function, so the name clash is controlled.
>       - ECLAIR has been configured to ignore this macro.
>  
> +   * - R5.5
> +     - Clash between the 'request_irq' function and macro name is intentional.

... imo "intentional" doesn't quite fit: I'm pretty sure we'd prefer to avoid this,
but we want to keep the code imported from Linux as tidy of local changes as
possible.

> +       The function uses the Xen 'request_irq()' argument order, while the macro
> +       is a compatibility wrapper for the ARM SMMU driver that adapts calls by
> +       reordering the handler and flags arguments.

Imo this restriction to one particular source file wants (somehow) expressing in
the very first sentence already, to avoid the impression that the clash would be
acceptable elsewhere as well.

Also, throughout: Please always append () to function (and function-like macro)
names. Right now you have a seemingly random mix.

Jan

