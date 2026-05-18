Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCPqIze3CmoH6gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:52:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04149566FC6
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311528.1581644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrpo-0000Mf-Go; Mon, 18 May 2026 06:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311528.1581644; Mon, 18 May 2026 06:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrpo-0000Kj-D1; Mon, 18 May 2026 06:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1311528;
 Mon, 18 May 2026 06:52:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOrpm-0000Kd-Kn
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:52:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOrpl-0076WH-TQ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:52:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ab70c-e002-0a2a0a5209dd-0a2a450b8414-46
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:52:13 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ab71d-212f-0a2a450b0019-d155dd29c803-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:52:13 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso885343f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 23:52:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c8344asm403034785e9.1.2026.05.17.23.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 23:52:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1779087133; x=1779691933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4iAmaJNBJRtpqb/vsur7JtbcNtNbCFnALZmghaNeFO0=;
        b=dQ0AMr+/xHKrCrMVrRYKM4bmIIJQEKyY2I6/FWsh69JEyPp0DSh4y7Kh1Y2towTPnd
         XAZfKS1bGxBmvbHEobd63Fma5aZMovIi9uu+i/jHU46M1xyqD4b2PKSsS8HKLJbi9ImM
         KDG06wo87IWNq9zvZ2a5dvWvAkABUnSDnJe24sJJcgMhj8/Bv+hCvGMbFxdMuz+66Ug5
         NOdTUdrjMnf7kGIyxeqFQwiisLXaNMcv+sSuBRkwPSsru8KhRSnLFebz1gh+ucgLqGMs
         v8jGeemY10IcA0qASdaiDXVblUA2YJcRr8odSgpDJ66ISGtSpn5fX+Kellh14ZAIpNB9
         WZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087133; x=1779691933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iAmaJNBJRtpqb/vsur7JtbcNtNbCFnALZmghaNeFO0=;
        b=kBb4jngLOzLvE4e/MqQ5VH+ZG27b9e05fCTdXfbLZlY64K4FwPj248Qdn5TjnGd1QX
         q1fA0Cd6KsIqUBTueQ0La7Z9J6oaYOR82m9lak1GHb+Gv8hDG9V+C6uX7ATOaIIDbj6N
         wAKBJWpfq1Xet6LIKCmP1vcu6TQ04cWw99ldpuXor/mxQmICkaXREDdtbAIQiTk5q8Ji
         FFM0BgG6Oeyec9SsxPDbDg9Qz+NQaAlAuMqTTxIo20rqHKRV0UC1kZO4bGQvCocFawV1
         elRQC28gbRX8HFDuLyuwPX//yU22z38AK8VhGFtxoYPdJHdFpUeEyErGTxITLs8qqFHn
         aqsw==
X-Forwarded-Encrypted: i=1; AFNElJ9/dmdnTenB6dPOKTKBlNUj/RUntIMFa4fE2/Zhkn+kIK4HacZdfV5lE9d3QKqmGHgyb0E7X/sIjjM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4G6xu8juI0yA8xrLkPhhG71n6r19dEW2KuLJ4J/TLL7yJDIkc
	5jwyG6dP89HTu+Xw7QrimVFSY8GSVsLUnrOvUYUi3s+VrzXTGRn8fL3165QzqGxEuQ==
X-Gm-Gg: Acq92OG5eBdgd+nIO2clA0hw0TyHlAJtgiLnwP/+O35hlCSRdhNCnYIOe9HGGUZTz25
	rN9y9GiV0avrXhdW1M0+W+rTKAfir4E52syksPSHzKX4kkQ0orDItGY1udeQCLaVlWZy5cfMgZ2
	FOoWU0zupLU8Tt0184ihk/80s6qLWZOZY18gz8+yfIwVBpDPgQ4UICXK0D1td8jG+w5ygYN2Yic
	bfDF+nPxbJMRO6csHyWHPOUIiFl6LuwxLH9HhnQnAd4Gonjp8JGzq+YTGKsM+55QT4qqzCw5x+x
	5bkw1RACj6anxGQphuS98VNxrju8LQrNOU5OZ65lUXGh4RvbRpvHSDpKgB9VcL8kwks32Dihwcb
	C2nPbqeqlHtwbrFG77nYo1sqXWT1MYoIPAzVGNLGqfB7QQf9ZzMyXLhwoiyZuf82nnNz7ZLpafg
	Wucvxkt8YGW3klYc13cW/Vt4LGJLLQSzsUFJydnpKt5cgNhAwk++bypI15ttEWJO3Htwt7uEPiE
	V/02Y5WtqByWgoNnY7PJqVIOA==
X-Received: by 2002:a05:600c:3e1b:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48fe60eccc3mr198182715e9.13.1779087133180;
        Sun, 17 May 2026 23:52:13 -0700 (PDT)
Message-ID: <a5d1dc32-c505-4f42-8d48-ba2710d7b831@suse.com>
Date: Mon, 18 May 2026 08:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/common: llc-coloring parser fixes
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <cover.1778925998.git.mykola_kvach@epam.com>
 <d9db51c5-97a1-4131-8575-dca1ae2cf52c@suse.com>
 <CAGeoDV9DitsH629pWGe+X=0VM+oi1BfSgWMxE+t32CCR5gMgtw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV9DitsH629pWGe+X=0VM+oi1BfSgWMxE+t32CCR5gMgtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1779087133-21F84F3B-178D6048/0/0
X-purgate-type: clean
X-purgate-size: 2425
X-Rspamd-Queue-Id: 04149566FC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 18.05.2026 08:42, Mykola Kvach wrote:
> On Mon, May 18, 2026 at 9:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 16.05.2026 17:03, Mykola Kvach wrote:
>>> This small series fixes two issues in parse_color_config().
>>>
>>> The first patch makes parse failures leave the caller-visible color count
>>> at zero.  This prevents a rejected command-line value from leaving a
>>> partially parsed configuration behind for later init paths to consume.
>>>
>>> The second patch rejects empty color tokens.  Previously, delimiters in
>>> places where a color value was expected could be interpreted as color 0,
>>> because simple_strtoul() returns zero without advancing the input pointer.
>>> The patch checks that each parsed color value consumed input.  It also
>>> adds the missing newline to the DT color parsing error message.
>>>
>>> Mykola Kvach (2):
>>>   xen/common: llc-coloring: clear color count on parse failure
>>>   xen/common: llc-coloring: reject empty color tokens
>>
>> For both of these, a question which isn't even considered in the reasoning
>> is whether the present behavior may be intentional. Especially for the 2nd
>> ISTR Stefano(?) not so long ago indicating that the behavior is indeed
>> intended to be this way. That may have been somewhere on Matrix rather than
>> on the list, though.
> 
> Thank you for pointing this out.
> 
> For the first patch, my reasoning was that returning an error while
> leaving a partially parsed caller-visible color count behind looks
> surprising. If the value is rejected, I think later init paths should
> not be able to consume the partially parsed state.
> 
> For the second patch, my reasoning was that the current behavior looks
> accidental rather than an intentional extension of the syntax.

That was my impression as well, hence why I had raised the question back
then.

> The parser comment says:
> 
> COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
> RANGE ::= COLOR-COLOR
> 
> The user guide also describes this as a comma-separated list of colors
> or ranges, with ranges written as hyphen-separated inclusive intervals.
> I don't see an empty-token production there.

What you quote is insufficient to determine: COLOR may be allowed to be
<nothing>. Iirc the reasoning went in particular towards a range with
merely the upper end specified being something (halfway) meaningful.

Jan

