Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFPKBnk1zWlwawYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 17:10:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649C37CC21
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 17:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270618.1559239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7xDH-000179-TY; Wed, 01 Apr 2026 15:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270618.1559239; Wed, 01 Apr 2026 15:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7xDH-00014a-Qv; Wed, 01 Apr 2026 15:10:35 +0000
Received: by outflank-mailman (input) for mailman id 1270618;
 Wed, 01 Apr 2026 15:10:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7xDF-00014U-V3
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:10:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7xDF-00By62-0e
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 17:10:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd3556-bab6-0a2a0a5309dd-0a2a45099302-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 17:10:32 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd3568-bf79-0a2a45090019-d155dd29a4a6-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 17:10:32 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43ccda008cdso793157f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:10:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e56fesm383358f8f.27.2026.04.01.08.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 08:10:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1775056232; x=1775661032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Of1OV/sjI0XhbplbJcGwuBdgsHi+597BjgLgYsaHQDo=;
        b=PmBs8kGDNo87/N91ogIkWT/KIO8jJFEhfImKt3UcRO8bsP76r30LJDOiGbq73mx3DQ
         uKzzusYlhT1OfL6Y2O4Dy/9Thunz0quAKCJmgFWQS4MugYsqyhE2JqeWUM5mbBQNlyJi
         IqTlvWEUJJXOBMu2cUxT4ELOGHIM43Xbxa045pKJM0RXscSrSHyBMyZMGw9z67gR8SzP
         F5Y/s/i3ZIHmon3N5Kt7pp79lUE/2pNtdIVZhx57aTeC04xuWCJRZtNAlO9D9eBQYYqp
         Q8FvWnxrxVSzbasM9MjYfsQi24zLk0zSoUdsbm45rJak+8D++MYksNdX6DF8kLInAmMr
         /nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056232; x=1775661032;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of1OV/sjI0XhbplbJcGwuBdgsHi+597BjgLgYsaHQDo=;
        b=k4WeLfHHdvuFCr8GgVbNm00ax/69FhJ0PzZ4uLTe6U3oaL1cqkdTBzoEhs/d7Vsa71
         v1XAiu9ClhznnvuBQmznT8krsrrgK5caT6/ISScyBJV/wBznqod11+YVokBSWDzQQ8DN
         laFV1BK1qBYKQkrQCT3Tn4nlbR55kSl1k4QhuPOdvltSXcCICOTLUgmmD12/HFOA6+fw
         oUEqIz7isPzI3sNPgNaiHOgLrUYCHjRe3V46sPufUHQ0Bwx/MMv358jTOduUycoYxgtz
         1O5vOUfZB07jyNwD3YyKVSm4v0OVfl+aigHRFhiC6Hs0U31tXxbDaLdgMd2D+bJ53j/3
         VcZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSjNsAomfQuEoEIGDMuMpsBjlBz201oici8NPCtsMGePpjr7hdP4wfzVxZc5j1Dzbfx0SZO8fbpCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzboU2YPQ9hPl6lSJl2OqUjyR1TkePyfyQqtw9yBPw9QkS1b59R
	FlvovPg4OploUp0o2wnf6IFqtHlh9OfGX3b/J0mCmN1/WYQnO4aX+yDQapb/dWYS/w==
X-Gm-Gg: ATEYQzxmdY2P/L0jiu4wg5gNbRUdpcXMfPvPOQ8USOetzFRLY+0SzSn6VKDMPjHcwDB
	x3qWm1kuIbRwdPxZ8m3wIL48Zr4BAtbFS7VJoKk+icBCXotFiG0tyGwyqeVFs4zo3TE22zoH7p4
	gCKFEB1SzgYTFm2ZMbFyuMicfmwVwJFNhhxMg6QmKfwBVmL6cJ4sv4k054e7JvgwUU6V/RH5MsY
	YacDPAVCbJpHuFyZKwoyVs17+B84jRGOZ6qyacmulQNwaTX9Lgm7TG6YYMa2njisQpPbGABOFSz
	YvQtc3zZ+q7gJyuzFZnc1B1D7sJ0AMbj9fQCAKhdrTnYljEVsZ7vGPfGdPkUaJlTWnXyrpr9PkF
	63SRZ+JAPzfNuvGT+tCM8yd3ONN2Q07bwMSeVQZhzawUt8BSvROZ43eRdm4c0/zUV3gaZnU3GWV
	E5nEq+arXK2NsL/H9Fi8rl/UZLvZ3fPJLsDfIQeMa4n8dLIA/ZDyUbjvmpKVlFB6j75cf4prpXc
	eVZRD6BoiVY190=
X-Received: by 2002:a05:6000:184d:b0:43c:f257:c706 with SMTP id ffacd0b85a97d-43d1561081fmr7389718f8f.23.1775056232256;
        Wed, 01 Apr 2026 08:10:32 -0700 (PDT)
Message-ID: <0e37083a-42ab-4c99-83fc-b77f519394b9@suse.com>
Date: Wed, 1 Apr 2026 17:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
 <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
 <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
 <ffd3a7cd-8c47-4a9b-864a-26a053b5b7d2@suse.com>
 <bc5a9826-c1ff-43b2-a3d1-1a4862301aea@gmail.com>
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
In-Reply-To: <bc5a9826-c1ff-43b2-a3d1-1a4862301aea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775056232-5535C152-3E42469B/0/0
X-purgate-type: clean
X-purgate-size: 2196
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7649C37CC21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 16:53, Oleksii Kurochko wrote:
> 
> 
> On 4/1/26 4:22 PM, Jan Beulich wrote:
>> On 01.04.2026 15:57, Oleksii Kurochko wrote:
>>> On 4/1/26 8:17 AM, Jan Beulich wrote:
>>>> On 31.03.2026 18:14, Oleksii Kurochko wrote:
>>>>> On 3/30/26 5:51 PM, Jan Beulich wrote:
>>>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>>>>>> so introduce macros to describe guest RAM banks.
>>>>>>>
>>>>>>> The reason for 2 banks is that there is typically always a use case for
>>>>>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>>>>>> there are other things under 4 GB it can conflict with (interrupt
>>>>>>> controller, PCI BARs, etc.).
>>>>>> Fixed layouts like the one you suggest come with (potentially severe)
>>>>>> downsides. For example, what if more than 2Gb of MMIO space are needed
>>>>>> for non-64-bit BARs?
>>>>> It looks where usually RAM on RISC-V boards start, so I expect that 2gb
>>>>> before RAM start is enough for MMIO space.
>>>> Likely in the common case. Board designers aren't constrained by this,
>>>> though (aiui). Whereas you set in stone a single, fixed layout.
>>>>
>>>> Arm maintainers - since a similar fixed layout is used there iirc,
>>>> could you chime in here, please?
>>>>
>>>>> Answering your question it will be an issue or it will also use some
>>>>> space before banks, no?
>>>> I fear I don't understand what you're trying to tell me.
>>> I meant that there is also some space between banks and pretty big which
>>> could be used for MMIO which could be used for non-64-bit BARs.
>> I don't follow: Bank 0 extends to 4G. There's no space above it, below
>> bank 1, which could be use for non-64-bit BARs.
> 
> So we have two banks:
> bank[0] -> [0x80000000, 0x100000000)
> bank[1] -> [0x0200000000, 10000000000)
> 
> So i think we have some space between them [0x100000000, 0x0200000000) 
> -> 4gb to be used for non-64-bit BARs.

But a non-64-bit BAR need to be assigned an address below 0x100000000?

> And also we have another 2gb before bank[0].

Yes, but I talked about that before.

Jan

