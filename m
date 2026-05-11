Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD0+M5LdAWptlgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:45:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4155650F3F3
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306203.1578268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQx4-0002lv-Ki; Mon, 11 May 2026 13:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306203.1578268; Mon, 11 May 2026 13:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQx4-0002kU-Hj; Mon, 11 May 2026 13:45:42 +0000
Received: by outflank-mailman (input) for mailman id 1306203;
 Mon, 11 May 2026 13:45:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMQx3-0002kO-Rw
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:45:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQx3-00DIsP-8P
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:45:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01dd79-e002-0a2a0a5209dd-0a2a450c9c28-34
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:45:41 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01dd84-62f1-0a2a450c0019-d155dd2de8e2-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:45:41 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-44e5624c053so2436454f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 06:45:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491304505sm25771075f8f.22.2026.05.11.06.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 06:45:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1778507140; x=1779111940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+YTgXmWq9qLFy6bEkuJcYNTC6uGfrxokEmbM3hqNgqk=;
        b=aftNDMD1xYcO9tIccodYzsFpUfWzDtQgKTuwcB0rU/cZpWbV6IVy4DxFJH8s39/pF9
         b+HT9uqC7gchPSFSc4fbjvwixg7FsVwwf5Cv11xMMQyTD3hkJnsZjhXSqo2rPKmp8KIO
         OTQKuD2jIOMKhebF5OrKmRyQE9ACjZJ2uMR3ZcKpsGWCS/z5SND+o2L/78O2cYHhwoAN
         Yi9pRimXD4p3Natj3XmJ6G2XmojHagWQfpEix/Fr422qb2r4QoQhevcEtjHCGifN37sE
         n0zmbNPMgj/gnbfRSfAIu5kxy5BvxK+KM+jk9JYGeOmipTt0subDp++sUOIVDXMup3+B
         YI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507140; x=1779111940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YTgXmWq9qLFy6bEkuJcYNTC6uGfrxokEmbM3hqNgqk=;
        b=sRxMYc0LrsHIaR46Nj5h7Gmrw6x6pmhfRDxcXpI548pLucTqPrrsnep0aHSGaCMjYa
         4ihHiFKgQurvVVcf6sy5EnY6qI7nkr4cvMj1Mgg1269QGblWCosui9wTfjV/8CnHWYrU
         dOkX24QvKIq9w9+dzaHCYnwPQsd3fKcYPjueSt3AFsJT3QwEzqwHEiR1RVQAwVHb86bG
         Z4U4rvWcMaHddXg3c7plOkl/h9UBA8AiXRPL90MdY1Lb0dRveWFrXvIh/ak3b4EuW2ot
         mVJ7RX2zsBJPSz2ebq1EpfF5FXIySxbk2y9+2JPyw2Olb5INgotz8JhQ4SOz6gJNAwhO
         lNhw==
X-Forwarded-Encrypted: i=1; AFNElJ/gp0hbxZ3hvMFaRqUSIP1k75CbPzEFycXq263laWOWN5/RS4w7ixRHFbLpnoktwdRIbVGreGaFAMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnkIX6pAw0XSAZPK5Aoj1Qbc0M9jT6M1Pg/VIEWBa2foD8lYll
	hIOCi6YvkVNKxaT8S1dPfDl/2/4R0GzbhQg+muwoslaecRBSf8O5DdBHkgmdCQl1jg==
X-Gm-Gg: Acq92OHTMIWt9O4UhqGJ4fAKsinEtPmT2olvnFKJMtpO/WVn2MLueOgDtvmmkM7Rzv+
	HfwhxuUBBCI9k3tlgcjmFZKUWRfBcO9Jj2z39BeL6LT9OxbBbZ4WMJ2v6XHeqn0S6hKEsi6BE/A
	EEw6AGehF+AbcdKnXL8WpZLRlalXmuZuNw30KJwHtTPC1Ac9Eqr/MfHLL7Gy4aqUtaDyOFIsTvL
	IH0BvW871Sk9JWt0ct5z0KHAU1urKE/rs9OT/Ut7TF6XVQA1iGJQnIdMG/HlkO2v2dpwtMjzF6p
	7FELQhbFv+QsEzYiMquN/KVR76RzpN4y75Ko6dr96R9cPp+E+qi2mcdqaRiWDvSbiXg2gQHv6UA
	XmuSJ4VP33XvoOFHGErYjanRL5PXHzOg8Q04nd6M2OWR1fhQjPIGAdfvsVs9Sy1hRASLV2wEXe8
	0HR9mJWkXdL/JbJGQl49VZz033NcJ2P2bpzgLxCnDMbQ2xoAmzn36JB58KwNJJoeNutSAqExrYE
	FKXBJl+GtIQ9KY=
X-Received: by 2002:a05:6000:1ac6:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-4515d5c6b69mr39595707f8f.34.1778507140425;
        Mon, 11 May 2026 06:45:40 -0700 (PDT)
Message-ID: <4b0f55a1-1e9b-4ce1-b6b6-29b868d57e25@suse.com>
Date: Mon, 11 May 2026 15:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Code freeze for 4.22 started on May 11, 2026
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
 <2a6117e6-e458-4818-9c22-0c356982eb59@suse.com>
 <58f80bf6-b9e0-42b8-9f84-831a1c546768@gmail.com>
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
In-Reply-To: <58f80bf6-b9e0-42b8-9f84-831a1c546768@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1778507141-E3B7CCF5-4321E6A0/0/0
X-purgate-type: clean
X-purgate-size: 965
X-Rspamd-Queue-Id: 4155650F3F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:committers@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11.05.2026 15:34, Oleksii Kurochko wrote:
> On 5/11/26 11:41 AM, Jan Beulich wrote:
>> On 11.05.2026 11:35, Oleksii Kurochko wrote:
>>> I would like to inform you that Code freeze period is started and will
>>> be until Fri Jun 05, 2026 (+4 weeks from Feature freeze).
>>>
>>> Bugfixes may continue to be accepted by maintainers without R-Ack.
>>
>> Gives me context to ask right away: "x86/mwait-idle: sync up with Linux
>> 7.0-rc" has had a few small adjustments and hence would want re-posting.
>> Question is: Does that even make sense at this point, i.e. would you
>> give it a release-ack despite it not all being bug fixes?
> 
> I don't see any Fixes: tag in the mentioned patch series and also based 
> on cover letter it doesn't really clear what this patch series is fixing.
> 
> Could you please clarify?

It is "fixing" us lagging behind the Linux driver that ours was cloned
from. Plus the series was posted well in time.

Jan

