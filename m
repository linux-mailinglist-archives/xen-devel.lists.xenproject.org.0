Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4IWhCh3HPGqDrwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 08:13:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CFA6C2EFD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 08:13:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gmIWnTkg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345275.1604188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcdLB-0004i8-3e; Thu, 25 Jun 2026 06:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345275.1604188; Thu, 25 Jun 2026 06:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcdLB-0004gg-01; Thu, 25 Jun 2026 06:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1345275;
 Thu, 25 Jun 2026 06:13:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcdL9-0004ga-5J
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 06:13:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcdL8-002RCt-6a
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 08:13:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3cc704-5cb7-0a2a0a5109dd-0a2a4506a2f0-14
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:13:30 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3cc709-08de-0a2a45060019-d1558031e0f1-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:13:30 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49241dbf9c1so15807265e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 23:13:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46d3b59cef1sm5714816f8f.26.2026.06.24.23.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 23:13:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1782368009; x=1782972809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2dJ+bMJmO7xp62XiAzPiiofq/Qsh0hLxOOZq6qBQqYM=;
        b=gmIWnTkgrVFgI+lPtL6P1QQkG490PDdesMyrOTPgTih8SMNqno+iGhER3P+dHfJWwg
         wpkzsFa455k2BXujj98nJfg44jUK2Won/X2xyccllViqXwlBT9WHlloiitcz7cNLzk61
         h1vrce2+2UtsS8USoF5tjsgWqOi2z9JxzXk7P6EDgs8CJ8/jt4WU73bpEXX12nOW8qmu
         ck80Q0v7kyeq4pTOE0a1tdwU71+yMkMpCTe+FOWPaNvps2IC+0UWdaKLorXw+YlOpBFK
         Nom8uTvEbqrnWS1BdWFLQI3fRe16MpLWlzMhpBu5WAXLfKbLeQYK7EW4F3cAOPTliCS6
         S1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782368009; x=1782972809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dJ+bMJmO7xp62XiAzPiiofq/Qsh0hLxOOZq6qBQqYM=;
        b=V26CwTBXlwTzD3pU01hs/8q40+BIOCEQDPyZ1H8jNN/rIeCbrj9bbHcehcS738R3AJ
         4nyFVMbIddxM6bMBkZ0uac978pM8kA5qbG0Wj8uYI3iVWjkCHCw4WMBXLOAw9wutnm6F
         A2jJL25yjXd3mvd0XJrB2ggghNMiSe7r3KZoO90aCxevUjyzzb79hwlJu4RQY0unM6il
         ISouEd6xMvHyCGdho/8lZuU57tB4Wi1rxVnaW5Scg9G4ibt0v3aSCLn+Nc5ZCXG5NrrC
         EY+WssjS3pRTrThmfLDC64L4XO4sgzowpn7kL9vd6J23p83MVr1XJtNkapHFVbUlLQZO
         5BRg==
X-Forwarded-Encrypted: i=1; AFNElJ/iGRSfjVUSavIgP6Ba1/7XnmRLPxaZNVf8LVW7lzqk5hsAlmPKYauOQM5qjNghv760M3zSQH5Gam8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8XQURu63qng9l3e+wtPttwaxPVlD/twBDruRTQq01jA+pCmgd
	hTLqj/JP/QfPUw1BYKXhEXtoPJQryHpCKF0HHwiHuT7NaomoNru1Relo9Ur0ecQDXA==
X-Gm-Gg: AfdE7clf+Otvu68Nt4dEdw42tMmHapgBB0WvbjUzaPcc5fdRxERKX1P9LMz0QKdHLV/
	hjuwhBnLhBNuBNGk5AQBkwUEjYa5HnHF+3ftTphCtHsmbpbtU064xNTKrOHZ5f45/dqsY5fr5gx
	GDv6zNqHx3+eBGym8aEDRTfMf7kWoUZbZZFVxsjRRjMP4ufvAFCvRmL2qGNbvZudJsg5Q3Cj16d
	/0XjzB7JQXa0XI4WeFboqrXmuSqv4yBZXRzzsPzuM0S6iPO7pG8iebXnv1x7wNqPeZv49OhcZQv
	iguhmTY29O4WbwZBgkyNEyHw4y6NNXaWIRB3eODNbOvLt5TXVLs47KT5wnmIZ5BDnGTJvHEbAo4
	mEqDZSx6CbrSfl4hKaVLHwa9hG3WlQDNq/ZuTOzXFypQvd/mzcfT7TN5sxIgCm1JyDdiQ04z4xD
	1SNTltLu3BNi7YB5mIIaMqCXqasDbNxUfpYIOnrOGzqmr/5CxGyTQOOwY1YW/sxHi7lIevd3HtL
	dmAsfP8yC6rmDw=
X-Received: by 2002:a05:600c:e558:10b0:492:59e4:f3fb with SMTP id 5b1f17b1804b1-492668554bbmr7479925e9.3.1782368009624;
        Wed, 24 Jun 2026 23:13:29 -0700 (PDT)
Message-ID: <803ee7da-2d35-43eb-a672-3091d787693e@suse.com>
Date: Thu, 25 Jun 2026 08:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] xen/riscv: add initial dom0less infrastructure
 support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <781214e3cb87a0fe38e210e9b0cefed49d623d52.1781693963.git.oleksii.kurochko@gmail.com>
 <74d47657-2fa2-4f8f-93f6-cdd96c99ce11@suse.com>
 <d55a9dc3-3ac5-4d05-886b-6f79c120576b@gmail.com>
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
In-Reply-To: <d55a9dc3-3ac5-4d05-886b-6f79c120576b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782368010-C6F2468D-5AE7AA0A/0/0
X-purgate-type: clean
X-purgate-size: 1311
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80CFA6C2EFD

On 24.06.2026 18:04, Oleksii Kurochko wrote:
> On 6/23/26 10:36 AM, Jan Beulich wrote:
>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/setup.h
>>> +++ b/xen/arch/riscv/include/asm/setup.h
>>> @@ -5,7 +5,9 @@
>>>   
>>>   #include <xen/types.h>
>>>   
>>> -#define max_init_domid (0)
>>> +#include <public/xen.h>
>>> +
>>> +extern domid_t max_init_domid;
>>
>> Shouldn't this be generalized, seeing that dom0less code requires it this
>> way on every arch? Same ...
>>
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -33,6 +33,8 @@
>>>   #include <asm/traps.h>
>>>   #include <asm/vsbi.h>
>>>   
>>> +domid_t __initdata max_init_domid;
>>
>> ... for the placement of this then, obviously.
> 
> I tried here to introduce less changes.
> 
> Also considering that max_init_domid is used in console.c code after 
> init is freed it seems like it is incorrect to use __initdata here. So 
> what Arm is using better suites (__read_mostly).

If it's never written post-init, then (like in all other such cases)
__ro_after_init please.

> If you think it would be better to do just now instead of later then I 
> would suggest something like this:

Yes, imo something along these lines is the approach to take.

Jan

