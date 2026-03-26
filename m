Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBX3HI3sxGm+5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:21:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D653033134B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263454.1555378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fxv-0004ov-Kt; Thu, 26 Mar 2026 08:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263454.1555378; Thu, 26 Mar 2026 08:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fxv-0004mE-IA; Thu, 26 Mar 2026 08:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1263454;
 Thu, 26 Mar 2026 08:21:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5fxu-0004m8-9R
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:21:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5fxt-007gN8-LW
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:21:17 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4ec77-5cb7-0a2a0a5109dd-0a2a450a85d8-12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:21:17 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4ec7d-1772-0a2a450a0019-d155dd34a88f-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:21:17 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43b949bf4easo289316f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 01:21:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919df6d4sm5949774f8f.25.2026.03.26.01.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 01:21:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774513277; x=1775118077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6urAeXWvgk6cNlszjl/35+RojX308Y1j/QIq7vY/jLU=;
        b=PGAHk17HZfCZgsDzQ3BGAkboymZPWfEUQbRL6uBZX1o9tAtJYBUnr9Ln7MqkwQ53Iv
         9B96kgzex1/7blxpyTJ+qkqY6RjGNS1YXAShMnD6zXt4ZgCpIcpRB8RVLhC0/xPsKWe7
         DWlq1pym3RQcpMNxkPm8cXeD+YLFPrhXhqL8jTHcOENAoWRU2rRoyA0umI9c4Y36SAVY
         EtcqZTxF1mprMKYu6gUQgCazBAEZXohmVS/t5k1J5ywTQ1w8Zs3cQTu4pV7FaikibLsq
         4L3mvDCDdBEx4tuf2+vUvDV8++1V9Yg2LSGgZIo5WUumdmkR7LsrHgh2zSQPfRq44HRQ
         dgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513277; x=1775118077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6urAeXWvgk6cNlszjl/35+RojX308Y1j/QIq7vY/jLU=;
        b=VKAowxlI+5XNx1M7HR0smiT9XxepArFdGh6eWEFMhh0wqx1Kj1nhHdCf2NxOGolyoj
         YYI14/PW1gEL6UN2NSl6CJhwFCsGxqz1KDumZI9+L4LetbFgTqIryW/AZ2Ni5aKURuj6
         E21kMPPO+btGkOfTO+hOyhdjzH4/dQB/ha5MBemeKPwZlrDCtnmgoxGQoSG8J/pq150v
         49zWlQttP3MnLFmIJCnVEvpVd2Ve0s4HINkNSqnl69ABQTFp9I4Y5fBy1+0odFJ4J6ms
         oTAarcTPTNN6tuhHdOuzg0Qn4tWwVPvNdftIxRGetNGUk0oIXWGGHMBMfNqRE2nmnDd0
         8Hwg==
X-Gm-Message-State: AOJu0Ywp2IBGSm2XeTr6GmJxHpP/ux6u/ldciB1GwYajhp4JsBucTP+N
	XLvnmbk45S4RLJ2ovicuLRsvEeWE1nu9o9XW6/NzXtTPZ3XbuToAZ1KyasLFC2ZHyhqXAIr/8Qs
	cI2CQXQ==
X-Gm-Gg: ATEYQzxChxfrOD4vK5lN+viTwDIXKi2w2W4D3zpiMW6hlCpIX4oKyFxXhIdpimgmrZt
	hvenPhX/OmxJTXKDGznayrBqEa2kqFUw023T3YucUSM06xXwDIiLsZkYZq0FH8ekn5e1MxcotVC
	eUUO7oxPnGvdklC5CN96gw/mHjTTi6JdZYiH+j73G9CjVzDKOvGw6nTb0PwGN/8wYDAiOVju00b
	HYoz3CZSk/hgu5mtwU5nGZmNf5wLwqAznctLmDSIX/KdjoZju8rwnKHOMKP40YvI2L50IvCVlFH
	byIop+A2Pl/MDjh3iEI9eskEme0bXzS1W/6XamMdzWGm924MfFIlR8VWqHR1rpKlgOWKyBmH7Vj
	QgetTkMgTwuGjeYsO3B2GLYfUCyEZzAKFpiXp1Whctv5cdDUPcCw1obHkIP3sjd9dgzRKNrIkcK
	viS31FOHFCM6112+iY4oFH6vY65aNsYh7ceWFzBMgfZhW3BXNIAxaT4EbCN83Wjc+2T7cWq2ae/
	yMxbJLlsW4Lul4=
X-Received: by 2002:a05:600c:792:b0:485:4f11:aabc with SMTP id 5b1f17b1804b1-48722bf80d6mr5917265e9.15.1774513276976;
        Thu, 26 Mar 2026 01:21:16 -0700 (PDT)
Message-ID: <330c25da-1f7b-4af1-b14c-1c5e732ea441@suse.com>
Date: Thu, 26 Mar 2026 09:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <aPzBO_eW8mQHM66u@mail-itl> <acQzzlXNDxNq885V@mail-itl>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <acQzzlXNDxNq885V@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774513277-53E9D900-6A42FC99/0/0
X-purgate-type: clean
X-purgate-size: 324
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D653033134B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 20:13, Marek Marczykowski-Górecki wrote:
> In the "bad" case, I see this extra line:
> (XEN) [    6.902973] Platform timer appears to have unexpectedly wrapped 1 times.
> 
> But in an earlier run of the same build it's not there.

And in that earlier run, did the post-S3 delays also not occur?

Jan

