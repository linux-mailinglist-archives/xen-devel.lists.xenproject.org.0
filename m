Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBqvEM4W+mkrJQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 18:11:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E17C4D0FAB
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 18:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300863.1575314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKIMw-0004gq-SP; Tue, 05 May 2026 16:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300863.1575314; Tue, 05 May 2026 16:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKIMw-0004ds-PK; Tue, 05 May 2026 16:11:34 +0000
Received: by outflank-mailman (input) for mailman id 1300863;
 Tue, 05 May 2026 16:11:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKIMv-0004dm-7Z
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 16:11:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKIMu-00Ei4m-Fw
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:11:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fa169a-e002-0a2a0a5209dd-0a2a4502e76a-44
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 18:11:32 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fa16b4-af86-0a2a45020019-d1558032cdef-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 18:11:32 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso47867505e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 09:11:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb72a17sm377921635e9.6.2026.05.05.09.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 09:11:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1777997492; x=1778602292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SyIrH5vXAviTW8mLwRkpgf9FBflz3UdGJIStN0SWxmo=;
        b=c4mvjy1lyLRQXwy/fZItzoPnEQBablpwX6wd9fNDM1geuuytPqJFmfeDNqUK/yi+yp
         9o0gdX1iaQtr7zRU0S7cPGDcp9OlKqNUlUVazf3dBCgqOygccgoKZ6ko5CC2MjmDZv32
         1aJBtaF+60/YeXn/VPE7AAiWoXR2JuzAZL4xp8/2R+owgLBY88osuMcVTAyty51v6klx
         iWzi9xCrJv2jSiLFwVDj5Ep0AzA79VmKdkjNpFvQTC/0lbTXqoyRakIjgB4WG6s7gQL/
         Uxo/9/+wn44bcINJjroZrCCH9kayXuzDE3VjyWxhfiBMBwlGos5fojZr9MksMe/GrMj9
         qDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997492; x=1778602292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyIrH5vXAviTW8mLwRkpgf9FBflz3UdGJIStN0SWxmo=;
        b=RdEzDXihy80Tm105fc2QWeL/nfQjqul6pbPOC/zpcDYt48z4qW49k/r2H/2e0HD0Zr
         rOT/JnGtd/m9aop0xZ2kcwK1EbepaOYd0yfGM+xcxFez0yM9fqdZAzAI3EFVi9SCyyqm
         Mpao705ZDaJyDK1YKSJGrkCvUrGHojqpGkaUXA3fBZlH68+h9vbhht9o8mKAJcsE01tp
         SGnVNzH0fCdu9YN8zftZAbInakCtkvYIPAUNijm60uLCwNfr56Hcw2UTC4XfI6knvP6j
         knjKJmSkAJTXGHGq+Sky8hYr0UwWkdHF8itmbAo6H8Y5N/IvTB2Z+oaO/h1C53ttMD6u
         hsBA==
X-Forwarded-Encrypted: i=1; AFNElJ9Oex1qm9bTjferPb1pvyAD0fQv56E6zbAvyZN9RQMd1Dmbjx2bxvcMSLVl4RqehQ7DhGwyz51kPo0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvMSZ4NWpVcNXHFti3+EAq6WYCCaH6ukWUKbOU2d5xc7PDpFFf
	+EwK/YoFcXDY9vu4ucyJDw0JCtgBjIO09ue8b/NvpNytsfpTqyFS20O6DtqqXupDRg==
X-Gm-Gg: AeBDiesKM9VMtU7aJ2TCTrhwylFqMQ3yURgiPNyzvN3YFEOWt9LllNjVFKtOtT2o0c4
	mN8WtCxnPPRAJTqOPWwm/9jx2MuD0rfiDm3Bl9a9Cs8pzuyeL7yQZkqWThMKCgCAExhvnD7mk96
	w0a+8yN+IT94SmZ8QOhVSmwwPNQ4FnicfRdLFOIqC8IieEVW6ZSEnjhpSOqZf2IYRmeGz53+uVO
	IQ8kmb7NXTrYMosMc3F2U0FziFKhZ7qzU3kMs6lOw8eibQc36F2HqHgY+ZTj4e5oLxH5M6mg9GT
	5ineZv2emRzirsoPz3I9LPJsj8sNTrz7iXu+AeTHS10pzP7JzoGkxBk8IE9P1G9eetX4cXImn35
	1YTOfOjawJNcRspRutY7I9HPf+V7nrLsGJwrk0Jm15oD9+uvwiaKPWvXCPl3G1DiIGWKNMuX3Hk
	z/0O7VY6/J9v6FuBbld5O7wWnxAbXZwRXEKP4sMmQJ1QqpB0fKUFtN/rs6BevsGxLCclhmQhWXW
	Cah673sG1k=
X-Received: by 2002:a05:600c:c08d:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-48d18ce221dmr45936455e9.19.1777997491878;
        Tue, 05 May 2026 09:11:31 -0700 (PDT)
Message-ID: <8c5424c1-113a-4f5e-96bf-2613f28b8bac@suse.com>
Date: Tue, 5 May 2026 18:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <661c18d9-eceb-4a4e-ac2e-37a6931e06b2@suse.com>
 <d7b30467-50ed-482c-9046-6a51d43bb514@amd.com>
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
In-Reply-To: <d7b30467-50ed-482c-9046-6a51d43bb514@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777997492-80B78161-DA39FB0A/0/0
X-purgate-type: clean
X-purgate-size: 2329
X-Rspamd-Queue-Id: 9E17C4D0FAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05.05.2026 16:52, Orzel, Michal wrote:
> 
> 
> On 05-May-26 15:05, Jan Beulich wrote:
>> On 30.04.2026 14:51, Michal Orzel wrote:
>>> --- a/xen/include/xen/pdx.h
>>> +++ b/xen/include/xen/pdx.h
>>> @@ -132,8 +132,9 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn);
>>>   */
>>>  bool __mfn_valid(unsigned long mfn);
>>>  
>>> -#define page_to_pdx(pg)  ((pg) - frame_table)
>>> -#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
>>> +#define page_to_pdx(pg) \
>>> +    ((unsigned long)((pg) - frame_table) + frametable_base_pdx)
>>> +#define pdx_to_page(pdx) gcc11_wrap(frame_table + ((pdx) - frametable_base_pdx))
>>
>> If you alter these, ...
>>
>>>  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>>>  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>>
>> ... how come these can remain unaltered? Maybe you have some special
>> arrangements in Arm code, but surely in generic code transformations done
>> should be uniform. After all
>>
>>     ASSERT(page_to_pdx(pg) == mfn_to_pdx(page_to_mfn(pg)));
>>
>> (and alike) ought to be universally true for valid inputs.
> The invariant holds. There are two transformations on different
> boundaries:
> 
>   - PFN <-> PDX: the compression scheme — lives in mfn_to_pdx /
>     pdx_to_mfn.
>   - PDX <-> frame-table index: +/- frametable_base_pdx — lives in
>     page_to_pdx / pdx_to_page (and Arm's page_to_mfn / mfn_to_page).
> 
> On x86 the second is the identity (frametable_base_pdx == 0), so it's
> invisible. On Arm it isn't, so it has to appear in the macros that
> cross that boundary. Pushing it into mfn_to_pdx as well would mix the
> two boundaries and double-apply on Arm (page_to_mfn already adds it).

That's yet more odd. These transformations should equally apply to
MFN <-> page (i.e. frame table index) and MFN <-> PDX translations.
PDX really is meant to be the frame table index, and at the same
time (scaled by PAGE_SHIFT) the direct map index. Both (generally
huge) tables equally benefit from whatever compression is in use,
and hence also ought to equally benefit from that
frametable_base_pdx-only sub-form of offset compression. The
anomaly of shrinking only one of the two pretty clearly shouldn't
be extended past Arm, and ideally would be addressed there at some
point.

Jan

