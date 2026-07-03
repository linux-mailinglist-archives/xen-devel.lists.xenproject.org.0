Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6nE3ETBjR2o1XgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 09:22:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B94D6FF801
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 09:22:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=E+Q37yFp;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1352912.1609195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfYDR-0005ZI-6W; Fri, 03 Jul 2026 07:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352912.1609195; Fri, 03 Jul 2026 07:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfYDR-0005Xt-3Z; Fri, 03 Jul 2026 07:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1352912;
 Fri, 03 Jul 2026 07:21:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfYDP-0005Xn-Ew
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 07:21:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfYDO-009EYT-Gj
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 09:21:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4762ea-e002-0a2a0a5209dd-0a2a45019242-26
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 09:21:34 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4762fe-400f-0a2a45010019-d1558033b42d-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 09:21:34 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso2108745e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 00:21:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c0e92687sm157586555e9.0.2026.07.03.00.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 00:21:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1783063294; x=1783668094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=njq/POdC0ep8atQorNWA20dk/rulCctxQiil69IKqHg=;
        b=E+Q37yFpRxKoqdeuHzQGhbZvl0LX3E2AJ4LjML8Kx5bVA8oK9JX1cYRg9JMRint7MJ
         gY7yPt6m7HmG/Yl91jOYL/UfYnVZv/1WsJEb2Q0Ozv+f805pefEs4lJ+1T8p8srwkW42
         m3f/Ic3kx6NBr265BEqs17GirEUYsFF2FuTAl+NpVuOGlV/UNAkIWBGCoUjC27vwCA3e
         0MVWEuRzAR6rIRF/l8hHL4+AVRqkqgedYhEJTuMRbEom3psQ8eRS8SYjEgt9P5rcaG4y
         EJMD1tBMyt0jmzZhcKtQAlk4OrF0niSF6bbZDfY0G25eJJLH13Z6xtOHJE6usYZPv9FI
         rIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063294; x=1783668094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njq/POdC0ep8atQorNWA20dk/rulCctxQiil69IKqHg=;
        b=aqXXhRlBCvXD097RGXc8b2Zj29kz1GoCpm/5DBYGYhloQfO4v7pHUV2bIwHCSDUpzw
         uzyfYDfD/Ld8KzmlTzmpnSD5Ybb9PAHfYb6sRgDIRf3JkfqrzVwN5KfLQ3XHqaPPbnJ8
         Mlf5X0poL/TRtgUzeRx46b3DVlJJe5AzWAyyCdueiG5cwV7HmpV3Wcgvs4ZE7lCd+QBg
         LoRzJ3flv9OdOQFKazeC1nzPSKdP8V4Lls+QXLtOKIz9Mfu9Y0XZ7UNOZmCgRgByTZE4
         6dhmNqjwmHU2EROPLdiww6e2Kp29ovWYdsQSzsHLEl/JoEh9vvjZxXxjgT2NqLjSqsQh
         iSeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MkojeoVZJ8877PhI8a+/qN4WXQTmL8XPOQxTK8J422koclIGPvavnAASqbfhbdzcASeroxtSl/4k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykaWa4HR2b3ZrpQsX89f3Pz1mZl5RUkbWorMc402haWNvkGWS+
	g43CtlbJInnC0lXbTD6GR2OwCpcZKfTf/sDLeO9Nl5soBcbSB6rUhrOzBQ9YcHypuw==
X-Gm-Gg: AfdE7ckkx47QngciCDvTdqBuH9rajlXSws5wcjNNpAutof42AFNm9EPfp4WjiAQPqfT
	xnwEPIU1qA86FNpZfmYzLuQiJghnozwEq0wW7oUko7aymt7jkGHpQBn+o5a7Q9UojqJtaWDNkWG
	ss9u2IRWF+4t2Gz4PHrhY0EQQxgqFoJfZU9BjXRF6Mfw+Aucp/BXQK/xxxe6iIcrQcmDdi/GndC
	y/C4Nbim8oPVXZy/GoZrZ3/ci/z3L6oHw/MQBWyyhv0Ikvrk2PF9+PrXqwch0Np7iYnp25mNyFa
	caPMVHA+2o8h2OuIIROhkrNo9qvxjDI2wcmIy9AMeJWLrR2cJklxusMZbuEVSm5MRrd+vA8R3cO
	cGHFy/vKIXAYeK98Z6dWL1wED41kWpOoZGZ8XSNQTYeu3NwYmQsdZJkYIG3ydFhF61H2TxwYIfl
	FOjYGRSi6CRT9CyiCut+RC8gzXhQKOCsXzlug8jQL6ZiyhuuHWlTKN7o1soPgRvUSrK2ZAwTuPR
	MOd
X-Received: by 2002:a05:600c:3e15:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493c2b15c9bmr129669105e9.4.1783063293517;
        Fri, 03 Jul 2026 00:21:33 -0700 (PDT)
Message-ID: <9a8c4ef2-ae6d-48bc-bd41-6c3147acaff8@suse.com>
Date: Fri, 3 Jul 2026 09:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/25] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <472a77604d35a0bc2a75b71f250fd67b63afde4c.1782487661.git.oleksii.kurochko@gmail.com>
 <ac1a3a08-dc39-4794-ba96-dab4b88c27a3@suse.com>
 <6aafbeb5-2f33-49f4-9d14-937b0bc4d15d@gmail.com>
 <40bcf6b7-306a-419a-bf12-1855f9e589fe@suse.com>
 <91ffc1b2-7648-4185-a2f1-12b30181c8a9@gmail.com>
 <e7d430c1-fe57-4b28-a5a2-1c8bfcd54ac4@suse.com>
 <d25c4b45-c3db-4a48-bc18-da9037a858d0@gmail.com>
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
In-Reply-To: <d25c4b45-c3db-4a48-bc18-da9037a858d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783063294-FF4CA1E0-AB9AEFF2/0/0
X-purgate-type: clean
X-purgate-size: 3110
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B94D6FF801

On 02.07.2026 18:04, Oleksii Kurochko wrote:
> On 7/2/26 4:32 PM, Jan Beulich wrote:
>> On 02.07.2026 11:33, Oleksii Kurochko wrote:
>>> On 7/2/26 8:38 AM, Jan Beulich wrote:
>>>>>>> +    spin_unlock_irqrestore(&desc->lock, flags);
>>>>>>> +
>>>>>>> +    release_irq(desc->irq, info);
>>>>>>> +    xvfree(info);
>>>>>>
>>>>>> If, in release_irq(), action isn't freed, it's ->dev_id field will now have
>>>>>> a dangling pointer. (I think I did point this out before.)

We'll be back to this if ...

>>>>> It should freed in release_irq() as route_irq_to_guest() always set
>>>>> action->free_on_release = true;
>>>>
>>>> Well, "free_on_release" must exits for a purpose. I.e. there must be, now
>>>> or soon, cases where it's set to false. Else simply drop the field.
>>>
>>> I can't simply remove this field because it is part of the common
>>> `struct irqaction` and is used by other arc-s. (I assume that it is not
>>> what you fully meant...)
>>>
>>> IIUC, this field is used to determine whether an irqaction is
>>> heap-allocated (and therefore should be freed) or statically allocated
>>> (and therefore should not be freed).
>>
>> Yes. However, all uses of the field are in arch-specific code. So in
>> principle it could be #ifdef-ed out for RISC-V. There may be a better
>> option, though:
>>
>>> At the moment, all IRQ actions are heap-allocated (on RISC-V), so
>>> free_on_release should always be set to true. In particular, the code
>>> snippet you asked about releases a guest interrupt, and guest interrupt
>>> actions are always heap-allocated. As a result, when release_guest_irq()
>>> calls release_irq(), the associated irqaction will be freed.
>>>
>>> So, from what I can see, the current behavior is correct and I think it
>>> should be left as it is. Do you have any concerns about this?
>>
>> If you only ever have the field set to true, use ASSERT() in place of
>> if().
>>
> 
> It looks like that if we want an `ASSERT()`, it should be in 
> `release_guest_irq()`. However, that would require duplicating part of 
> `release_irq()` to locate the corresponding `irqaction` and verify 
> `free_on_release`. Since guest IRQs are created through 
> `route_irq_to_guest()`, which always sets `action->free_on_release = 
> true`, we are already safe.
> 
> I don't see much benefit in replacing the `if` statement with an 
> `ASSERT()` in `release_irq()`. The current implementation is generic and 
> would also work for Xen-owned, statically allocated interrupts (even 
> though there are none today). If we replace the `if` with an `ASSERT()` 
> now, anyone introducing a Xen-owned, statically allocated interrupt in 
> the future would simply have to revert the change and restore the `if` 
> statement, bringing us back to the current implementation.

... such a change was made. Imo you have two choices: Deal with the issue
properly right away, keeping the if(). Or assume "free_on_release" is only
ever true, and add an assertion to this effect (indicating that code needs
auditing if that assumption is broken).

Jan

