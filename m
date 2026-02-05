Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMnrGW+lhGmI3wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 15:13:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2AF3D4A
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 15:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222037.1530107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo06I-0006f6-0i; Thu, 05 Feb 2026 14:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222037.1530107; Thu, 05 Feb 2026 14:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo06H-0006dt-St; Thu, 05 Feb 2026 14:12:53 +0000
Received: by outflank-mailman (input) for mailman id 1222037;
 Thu, 05 Feb 2026 14:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vo06G-0006QL-Is
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 14:12:52 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1921347-029c-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 15:12:51 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43622089851so670904f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 06:12:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805813asm13904858f8f.27.2026.02.05.06.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 06:12:50 -0800 (PST)
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
X-Inumbo-ID: c1921347-029c-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770300771; x=1770905571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m9JdkwItn+6Lp4iTVKDXeMjHZogyxORKD6gg6nZLFHc=;
        b=MiH1p8TdMuxfq1gMvwDG9u2P7Gcjb09h1TTU/i5DdsaS0wtmG5gu0afGOnQ5hSnVn4
         M0YVjkJ7qKOdoT2blRnxj0sh35N7JRtd0kv95VJ6MkU6MBW8DBq/iOfi6cjHs1qvZVpz
         zdDtTVT+WftmMzk9rojMFH58tC2f45aJytickapPVgK1hLVnyol9xkrGPSE/wc72HeNk
         Z3cpvMkMa3+AhUl/5tErq6RmJgtJae9r5AEKH61Gb2Pu3W9QYbaDNjrF6qyVxXgVEf5o
         N/t0jWsqQFff9QUpPBsaRPNIw2kJaNup8mSqLmg51Zn70rPCBhN+6cxirxBhMU22WHje
         EN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770300771; x=1770905571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9JdkwItn+6Lp4iTVKDXeMjHZogyxORKD6gg6nZLFHc=;
        b=wdhrCC32QXhmaXCFB+4FlUyr0EwnAx1KP3WxOo8NzvX5wKOEs50QPjjzk/8xLBbSEt
         0O8hgnFq/2NzIUOyrnttjAr/9Z8leIrK7x3Wzq7PPYArbNgBBhwYsBQMg0UHLglriHZg
         SxKM1yCJDPe7m3TPrpA7YpNEbxLd7SNecJL2tgauw4mqtr0QMeNugqAzFBQkALlGE/S4
         w2xZzRLiMVC9C6W1ORqk9oYu0iPehFQrqXJBzo5wpna6I9ZnnIB87FPg+DfcbCQPsTXy
         vBBIwtWsnkwdcI9nSa5Ies76SuZdhSojeSLyYDIXEO+przLhNpWRpijJv06MpUKasYgR
         Vf2g==
X-Forwarded-Encrypted: i=1; AJvYcCW0uGCmM6CBd5JhRPRk7Or/czkv/mWPyL7RSTDhJFh+Z1SDs4DeX0tR/hQFTOAD4btt4uRAgSI/gdY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygN/J4GI+9UmDdErFrKpx4KLoJZ+htc98gpGgSFbd5JAhAQd2q
	H+bIz3ND8gH0p4wCWtee8fyrDKOclIIl6LqtDPRLsOgADGfJRpixmqvdGsfBsCcVtO8bevKiBpj
	/wRE=
X-Gm-Gg: AZuq6aJhGmTZRZGhYAQHJxaf4kI+linvubTTEipK0vOpxRor3q4H50oLWbuTeia3xg8
	1NsWuQxS97u8LDPyvc6ga1FQnf+iMHAdYhuwUfqqXZzTKnBokf/2fKQKOrHborZCpU/GWqObzps
	UaY7VyFh3SegtH+xkAI+1K+ndar6weKxik7eppY4r1MJttbaQwxxlvKiy6wGEZY8WNhZO/LXcZv
	Gg0VKy+dHoeK6jptg4fQbM2tfXSswtQZAEEtiA23GPjMrz0ba5PXflF7oxVaqKFtCiUWi/IL6Pg
	UdQHJ7VEfNaalcXNw8YQ8qsH/SBrl3nuClXwXcH1NMV45YKLBF2jsv0NC5VtRTV3qEASnoT44Tq
	8E2kxIwnVZU1QVP4KBbf+OyysPFQk/6xa2bQds+zkPOHzWaYaXw5Y5Q6N42TpO0dav0MpF+YpmJ
	7UiqgLsAxeDBxsR52/g+UP6LwGFNiWK8eCnUiKJ7HLQ1WX7TeSb/LGgCrtkLWVtcOuF6WtYNhAW
	tY=
X-Received: by 2002:a05:6000:310f:b0:430:feb3:f5ae with SMTP id ffacd0b85a97d-4361805ec2fmr9042708f8f.55.1770300770758;
        Thu, 05 Feb 2026 06:12:50 -0800 (PST)
Message-ID: <9274f071-88ec-4b95-b9b9-034920540505@suse.com>
Date: Thu, 5 Feb 2026 15:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <82540f88-ffcd-46a9-9813-ebe42ef0b0ec@suse.com> <aYNdJ6sb4GPaSEyY@Mac.lan>
 <3f9b4337-3e0a-4693-b97f-46505bc1349a@suse.com> <aYN30KD0jsJ2_H_z@Mac.lan>
 <5bd55bef-f30c-475d-9831-382406f699fb@suse.com> <aYSkXX9TDoY0KUNz@Mac.lan>
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
In-Reply-To: <aYSkXX9TDoY0KUNz@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D6E2AF3D4A
X-Rspamd-Action: no action

On 05.02.2026 15:08, Roger Pau Monné wrote:
> On Thu, Feb 05, 2026 at 09:29:53AM +0100, Jan Beulich wrote:
>> On 04.02.2026 17:46, Roger Pau Monné wrote:
>>> On Wed, Feb 04, 2026 at 04:08:21PM +0100, Jan Beulich wrote:
>>>> On 04.02.2026 15:52, Roger Pau Monné wrote:
>>>>> On Wed, Feb 04, 2026 at 03:06:52PM +0100, Jan Beulich wrote:
>>>>>> On 04.02.2026 13:25, Roger Pau Monne wrote:
>>>>>>> The limitation of shared_info being allocated below 4G to fit in the
>>>>>>> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
>>>>>>> start_info field is 64bits wide.  HVM guests don't use start_info at all.
>>>>>>>
>>>>>>> Drop the restriction in arch_domain_create() and instead free and
>>>>>>> re-allocate the page from memory below 4G if needed in switch_compat(),
>>>>>>> when the guest is set to run in 32bit PV mode.
>>>>>>>
>>>>>>> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
>>>>>>
>>>>>> The tag is here because there is the (largely theoretical?) possibility for
>>>>>> a system to have no memory at all left below 4Gb, in which case creation of
>>>>>> a PV64 or non-shadow HVM guest would needlessly fail?
>>>>>
>>>>> It's kid of an issue we discovered when using strict domain NUMA node
>>>>> placement.  At that point the toolstack would exhaust all memory on
>>>>> node 0 and by doing that inadvertently consume all memory below 4G.
>>>>
>>>> Right, and hence also my "memory: arrange to conserve on DMA reservation",
>>>> where I'm still fighting with myself as to what to do with the comments you
>>>> gave there.
>>>
>>> Better fighting with yourself rather than fighting with me I guess ;).
>>>
>>> That change would be controversial with what we currently do on
>>> XenServer, because we don't (yet) special case the memory below 4G to
>>> not account for it in the per node free amount of memory.
>>>
>>> What would happen when you append the MEMF_no_dma flag as proposed in
>>> your commit, but the caller is also passing MEMF_exact_node with
>>> target node 0?  AFAICT the allocation would still refuse to use the
>>> low 4G pool.
>>
>> Yes, DMA-ability is intended to take higher priority than exact-node
>> requests. Another node would then need choosing by the toolstack.
>>
>>> Also, your commit should also be expanded to avoid staking claims that
>>> would drain the DMA pool, as then populate_physmap() won't be able to
>>> allocate from there?
>>
>> Except that upstream claims aren't node-specific, yet, so could be
>> fulfilled my taking memory from other nodes?
> 
> That's likely to change at some point, but yes, they are not node
> specific yet.
> 
>> Aiui the problem would
>> only occur if that DAM-able memory was the only memory left in the
>> system.
> 
> Indeed, in that scenario toolstack will be allowed to make claims that
> cover that DMA memory, yet populate physmap won't be able to consume
> those claims.

It would be (following said patch of mine), but only in order-0 chunks.
Which would make ...

> I think there are two item that need to be done for us to append
> MEMF_no_dma to populate physmap allocations:
> 
>  * DMA memory is not reachable by claims.
>  * DMA memory must be reported to the toolstack, so it can account for
>    it separately from free memory.
> 
> Last point could also be solved by subtracting the DMA memory from the
> `free_pages` value returned to the toolstack.

... any of this more difficult. We don't want to completely prevent its
use, we only want to (heuristically) limit it.

Jan

