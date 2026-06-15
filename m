Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yEDOCm3jL2oaIgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:35:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D11685C31
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:35:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EGt6SaqO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338162.1599173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5a4-0001md-Mm; Mon, 15 Jun 2026 11:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338162.1599173; Mon, 15 Jun 2026 11:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5a4-0001kI-Jp; Mon, 15 Jun 2026 11:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1338162;
 Mon, 15 Jun 2026 11:34:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ5a3-0001kC-S0
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:34:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ5a2-00CAFw-Nd
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 13:34:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fe334-2eae-0a2a0a5409dd-0a2a450cd482-12
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:34:14 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fe335-62f1-0a2a450c0019-d155dd31a95a-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:34:13 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so2583099f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 04:34:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c473bsm37869103f8f.28.2026.06.15.04.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 04:34:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1781523253; x=1782128053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rTY3CK5hYqBEqw7dfyBzrJMcA6c/UzKiHNRRbK+F80I=;
        b=EGt6SaqOEE/IdPkoznbt3DPvgvNnfwKK9XDqIDD88q9kRB/f0oRGGrY7VnTDOD/jQB
         y8+Sh+hiEnOQZLcqFrpAnS/z2HAz95CfQXsLm61QLciTxUros+MOxR7EbfMUm1g6Gm7t
         UtBHWle8R1Vh5ta47eyDPeCAs+Gs7k22OzK/SI7xx+i7AvvYr4RghUEcPpcdP2TOUqo9
         zTBoWE1mKd/48cJVXYUc0rsFBz9y9ABjqbt/6bxWVEXQADuj4qufqDIBN0Jp0VfqGnsp
         NDw3kA807k7UzeIPcjrcKjzRP5kYzs/QEwkCRmwDnGWjXdQHS8kgQ6WQVdau1WWANn0S
         XDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781523253; x=1782128053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTY3CK5hYqBEqw7dfyBzrJMcA6c/UzKiHNRRbK+F80I=;
        b=L0jM1+oNIV5dBg4NFB5SG1+SNsDeAs1d6qAy4bkXmDtu/Lvu7O6/HXvitgyAqkWyls
         UIpxQxRCkVDdZ6jibqJbHtRtXkI7lFlVe6KFP1qvmm7jlFaFEjt5ZW95uERauSgbjeaB
         9x947fXcIX/sXmcyLlGlM32ELrD2d/ycAchaoL+tNjV6jYii4anHSnANF1BV2dJI5jEG
         PGes7g+yzQTI2VEWwIZxEAGFjhdfen3wwqcoK4BnRY1+GAnO24SCca6KJbrB7fcGBizZ
         xQxr3WPzr5WyUy2fUe8zvW8jA89g2gC8Uc8XpTlv1yZJUnYepf6gPFtndjVvpfGvTgnx
         /cRg==
X-Forwarded-Encrypted: i=1; AFNElJ8Xihk04jn5JdN6gVsFiNhvAiJICOtFYETJPBLx86XlNkimZkrKTWh8U3509+MDvV+NLqZoWcdhMvI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6XXHvXapek7wXmkQiE4spBPlFhrB5Qb5z/MvizY7R5p7AdD57
	3fswVEpFoV6AGyaHKM+9wRszLWQLCUHlzJBsLP7kX4EaaYYj8e3dgL++wkvmSU4QxQ==
X-Gm-Gg: Acq92OGybss1D/FSJ18do1QHphkt5a08l+e+TnNYgfEDqpzenP1IGFaVXDteWC9FWwy
	hUBT5n0NjrYbwEIHkaqEaVGaSP9dL5qQpJgA42CDysjokRT/sGYOhF7wQmdPH/Y85Mx1N4j26WL
	04h3Xbg+fMOSXgCnUEAERA8fXb1aNxFf8gStYeNfvmZWtMH1k2b31PS8cufIioyjSDb2uys4uXu
	BP/TdV9Jid7g1uLlrEnKF+Q3L1VpjGLEOP+6qveDc+CPoQPrLEbtPu/0o9JoADXnK+zoP3JPq3A
	DFAfMyg5qtZ6+QPvKDu4hVaH+BLjv8y3wvJrVrWpqf5q+dUxx+ElQfX0oX9GdG80gGNbZJ4ZDTy
	zwYgFIu14KNRc6+J+1bRKquQuFGThXqhJT6pxHcplV/PTFRbSrGPfBjFCkarhI4I11zUeTn/No0
	Kk1odIZ3GCUplqyOEu6dIIZRkOSQq3Gu7p6HWJChgjx/j9IujtB1qsAcDEFYENmZAnYdVrlETmj
	OJ4gM026ienz6A=
X-Received: by 2002:a5d:5e82:0:b0:460:2e53:a6f6 with SMTP id ffacd0b85a97d-4606f24cffemr16294328f8f.12.1781523253265;
        Mon, 15 Jun 2026 04:34:13 -0700 (PDT)
Message-ID: <023a55e7-233b-45d0-a4e7-74a6cf2ae45d@suse.com>
Date: Mon, 15 Jun 2026 13:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] domctl: Avoid taking domctl lock for certain ops
 used during migration
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <3034d82a-f1ae-4c6c-a293-ca44b7e086fc@suse.com>
 <552cac1b-2be9-481d-a687-01c965ade221@citrix.com>
 <a32680d6-e321-4c97-b53d-71d7041e1c0e@suse.com>
 <683a3df4-21c7-434e-96c8-934631673795@citrix.com>
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
In-Reply-To: <683a3df4-21c7-434e-96c8-934631673795@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781523253-F5386CF5-993F7128/0/0
X-purgate-type: clean
X-purgate-size: 1607
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
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78D11685C31

On 15.06.2026 13:17, Ross Lagerwall wrote:
> On 6/11/26 5:06 PM, Jan Beulich wrote:
>> On 11.06.2026 18:02, Ross Lagerwall wrote:
>>> On 6/11/26 3:55 PM, Jan Beulich wrote:
>>>> On 09.06.2026 17:15, Ross Lagerwall wrote:
>>>>> When performing multiple migrations in parallel, the domctl lock may
>>>>> become extremely contended:
>>>>>
>>>>> * Operations like "xl vcpu-list" were observed to take in excess of 20s
>>>>>     to execute.
>>>>
>>>> Does "xl vcpu-list" involve ...
>>>>
>>>>> * The "clean" shadow op may pause the domain, restart with a
>>>>>     continuation and then become blocked on the domctl lock, causing VM
>>>>>     downtime in excess of 20 seconds.
>>>>>
>>>>> These issues can be fixed by not holding the domctl for the frequently
>>>>> called operations during migration.
>>>>>
>>>>> Thanks
>>>>>
>>>>> Ross Lagerwall (2):
>>>>>     domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock
>>>>
>>>> ... XEN_DOMCTL_getpageframeinfo3?
>>>>
>>>
>>> No, but "xl vcpu-list" takes the domctl lock
>>
>> If this is still the case after XSA-492, then maybe the follow-ups I have
>> pending to post will eliminate (or at least reduce) this. I don't think
>> that's 4.22 material, though.
> 
> Yes, AFAICT "xl vcpu-list" calls XEN_DOMCTL_getvcpuinfo and
> XEN_DOMCTL_getvcpuaffinity for each domain and both of these still take
> the domctl lock.

XEN_DOMCTL_getvcpuinfo is taken care of by my to-be-posted follow-on.
XEN_DOMCTL_[gs]etvcpuaffinity first need to have their own locking added,
before their handling can be moved out.

Jan

