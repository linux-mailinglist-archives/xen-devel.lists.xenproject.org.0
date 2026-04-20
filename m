Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGB5OhTk5WkupAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 10:30:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF79428251
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 10:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285509.1566518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEk0c-0007rN-7t; Mon, 20 Apr 2026 08:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285509.1566518; Mon, 20 Apr 2026 08:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEk0c-0007oO-4X; Mon, 20 Apr 2026 08:29:34 +0000
Received: by outflank-mailman (input) for mailman id 1285509;
 Mon, 20 Apr 2026 08:29:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEk0a-0007oI-N4
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 08:29:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEk0Z-00CLEI-LQ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 10:29:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5e3df-bab6-0a2a0a5309dd-0a2a4509bd9e-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:29:31 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5e3eb-2497-0a2a45090019-d1558030d4fa-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:29:31 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so23586705e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 01:29:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm279130295e9.10.2026.04.20.01.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 01:29:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1776673771; x=1777278571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QWTXAfMVrrFKv6Z3Kx/OO9RQJRVpKh/l9TdFSZILbWc=;
        b=SYruRo2OZ7H56s0zoWBDNlbAE80Xtq7H4FIOyS15EBJA1sL1+myZSEpdODM3joFATB
         l7RnZJC2g0SiqDazILbZ3a2/piENm+sWLE9Y3bP4h8dSVPrJ5hwuJj7lpFkRc+sX1fOn
         eTKmhGveEkKFeSsbk7vqZ+JYI6UUP5pdCEc8xJoJnzR0i3e2dC7Wy7iGud3uZ+mguZug
         cFHm3TMtDozEirqtlECOy3H1AZ+U/NauTY+O76PYcQ2MBnvqBwcF9KhA4FXHEjVdDyvo
         TK0nIGUiGNP+gXg3rBhiOdrFn4fCZRstfGTVqhdkoM0DDQTLvZ0B5SGPWj35+ELX5mtt
         R0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673771; x=1777278571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWTXAfMVrrFKv6Z3Kx/OO9RQJRVpKh/l9TdFSZILbWc=;
        b=mfw/qO7Ycgst6TRk7lB4xUvQyEJtrJTa2hlg6NThdtCqyjV2B7Jx+SO3onZTr4XxvR
         w+7VTW6ZfOvNqRQWnYe/ROahspKcoISzc6lpAH0NaaDMURT59Ivw4KCMMJRCK5VONxwF
         vOd/cHp+aYRYSQ+Ya994zK07fGVJnjKZGtZQAtcV4n7AyiyWdf7SFhw6xpBkcWgnV82v
         e6+jmERdNiPUWOBlg3Ra8fEtIg0XqrKYbTXb9gbWi7X5g1+LC1KWfYMrxLDGKCsZY5LI
         KoA74UXz+1jF3mkHEegN1k3ak8lTnuRm4YXSLqXeO2+uFV+jPlVlso6bviaGajBc09gp
         OSmA==
X-Forwarded-Encrypted: i=1; AFNElJ9LrtqhFomrDmdRklglqn7AlKWFxY97OEsmbP8gR4ob2pFAA5Uf+ibyFQBceMZy7IqhQKQ741KtSEI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXZIcb5HOVr0xJSVYwSwoVUqOecNsv2/BkblDR4TnVni5L14S4
	G098rbGVR4nJTER0YS+4hvAa/H3AGxo+67QPFnKCHngFSFslPNhMaaNpdJHMcy17mA==
X-Gm-Gg: AeBDievEIDjXVYXG4XPx+YQIfa2kc19i4cp149xuaT2by/1Xz+F7hu5cgqu+fmD/BUY
	udEjCtOuPrFk27pQb0VjDI+BLOH/31JY3e4WIg9bdLW48va3DoIVC5uY2e60DRUIz4RwbprzUKy
	hIr5QCoCDliYWfEuCOdgckaFIKp0bs5RCA5SBsRUBvRKCPV+KcbpCdsUJgmsiUSIqLZzf1oEKqT
	WZvFCNZjbdiVgo2INo7CEZ6rJvoqefvAZ9jAOPvGrGAb3uNXgV4nWMCiZQ49RdMtoo6Vsl761ai
	SuSCvQjrbtcjDkD97VSlWNC/AcUd1KGvFCAoVRSo9OdJv5EeThhA2Hsa9/Z8z44mY08p6QpzTgy
	WbKszSC6OEGGQ4Q8QhdNLCkYW2yx0o3F4x1GGiamBsx01Rzl2ZVnJngpswUze3rRlr2mDQKflqz
	8AbSN7TLMl0D0fUub0NOGejilMPh6mFlnbc1YmVydLzdC83fL8xHN9/1bwONlRSSfnQDSr0ECyg
	Phlda5bh9lTZvOwttmYWgtbvA==
X-Received: by 2002:a05:600c:4707:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-488fb6e8eb5mr176572895e9.0.1776673769942;
        Mon, 20 Apr 2026 01:29:29 -0700 (PDT)
Message-ID: <f4022635-ffd6-40c0-a537-9bc9dc4e0f2b@suse.com>
Date: Mon, 20 Apr 2026 10:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/27] xen/riscv: introduce per-vCPU IMSIC state
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <8196fa8f000e384af697a44cb3d50ece966e82a7.1773157782.git.oleksii.kurochko@gmail.com>
 <1f5e262d-da1f-49a2-8e89-87fb714e51bf@suse.com>
 <2f555a8b-d058-41ca-80f8-ce3dc08edfbe@gmail.com>
 <bd50afd3-6399-4c6b-b05d-d86ee4b8643e@suse.com>
 <9bee01f5-8275-4d8e-b217-1b2d2f8fa2e8@gmail.com>
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
In-Reply-To: <9bee01f5-8275-4d8e-b217-1b2d2f8fa2e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776673771-49AB6A53-A2047AD8/0/0
X-purgate-type: clean
X-purgate-size: 3587
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5CF79428251
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.04.2026 15:47, Oleksii Kurochko wrote:
> On 4/16/26 2:31 PM, Jan Beulich wrote:
>> On 14.04.2026 11:22, Oleksii Kurochko wrote:
>>> On 4/2/26 1:31 PM, Jan Beulich wrote:
>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/imsic.c
>>>>> +++ b/xen/arch/riscv/imsic.c
>>>>> @@ -59,6 +59,29 @@ do {                            \
>>>>>        csr_clear(CSR_SIREG, v);    \
>>>>>    } while (0)
>>>>>    
>>>>> +unsigned int vcpu_guest_file_id(const struct vcpu *v)
>>>>> +{
>>>>> +    struct imsic_state *imsic_state = v->arch.imsic_state;
>>>>> +    unsigned long flags;
>>>>> +    unsigned int vsfile_id;
>>>>> +
>>>>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>>>> +    vsfile_id = imsic_state->guest_file_id;
>>>>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>>>
>>>> What purpose does this locking have? Already ...
>>>>
>>>>> +    return vsfile_id;
>>>>
>>>> ... here the value can be stale, if indeed there is a chance of races.
>>>> Did you perhaps mean to use ACCESS_ONCE() here and where the value is
>>>> set?
>>>
>>> ACCESS_ONCE() isn't guarantee only compiler re-ordering (as basically it
>>> is just volatile-related stuff inisde the macros)?
>>>
>>> Generally, I think that that guest_file_id is needed to be updated only
>>> during migration of vCPU from one pCPU to another and I expect that
>>> during this migration vCPU isn't active, so no one will want to read
>>> imsic_state->guest_file_id. But on the other hand, there is:
>>>     bool imsic_has_interrupt(const struct vcpu *vcpu)
>>>     {
>>>     ...
>>>       /*
>>>        * The IMSIC SW-file directly injects interrupt via hvip so
>>>        * only check for interrupt when IMSIC VS-file is being used.
>>>        */
>>>
>>>       read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>>       if ( imsic_state->vsfile_pcpu != NR_CPUS )
>>>           ret = !!(csr_read(CSR_HGEIP) & BIT(imsic_state->guest_file_id,
>>> UL));
>>>       read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>>     ...
>>>     }
>>> which I think could be called in parallel with with migration, so then
>>> still lock are needed.
>>
>> None of this addresses my pointing out that the returned value will be
>> stale by the point the caller gets to look at it.
> 
> Yes, I agree that lock in vcpu_guest_file_id() is useless and it should 
> be on the caller side and used for the whole IMSIC state access. But ...
> 
>> Which in turn raises
>> said question about the use of a lock. If you read
>> imsic_state->guest_file_id atomically (i.e. excluding tearing of reads),
>> the value seen / used will be stale as with the lock in use. Unless of
>> course there's yet another aspect hidden somewhere in what is not being
>> explained.
> 
> ... I am not sure that I get this part.
> 
> If I am somewhere in migration code where I took write lock to update 
> imsic state (and of course ->guest_file_id as part of it) then if 
> someone else in parallel calls imsic_has_interrupt() then it won't enter 
> critical section where ->guest_file_id is trying to be read so no stale 
> ->guest_file_id will be read.

Well, hence why I said "Unless of course there's yet another aspect hidden
somewhere in what is not being explained." If I don't know the full
picture, I can't very well judge whether a lock is needed, or whether ...

> Then does it make sense to use ACCESS_ONCE() during read and write of
> ->guest_file_id in such use cases?

... ACCESS_ONCE() would be enough.

Jan

