Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sHYfN44HRmo4IAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 08:39:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344376F3DB0
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 08:39:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="Ru6umzU/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351253.1608478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfB4X-0002Bb-Gm; Thu, 02 Jul 2026 06:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351253.1608478; Thu, 02 Jul 2026 06:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfB4X-0002A4-Dz; Thu, 02 Jul 2026 06:38:53 +0000
Received: by outflank-mailman (input) for mailman id 1351253;
 Thu, 02 Jul 2026 06:38:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfB4V-00029y-N7
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 06:38:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfB4U-006Bsb-Ih
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:38:50 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a460764-5cb7-0a2a0a5109dd-0a2a45019a46-48
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:38:50 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46077a-400f-0a2a45010019-d155802abc05-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:38:50 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so9643035e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:38:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c6354771sm23124965e9.3.2026.07.01.23.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 23:38:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1782974330; x=1783579130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tTOdo7r99vUeIh+Bzq2POYKkkUa284xP30k/bUUTVmc=;
        b=Ru6umzU/0upR/Q9bI2KbSz9MApTTg+VmlyE1IwhsLTImbn2ASsiZm6CdLfO7ZYPD61
         AGmdv6vn2mCzJDCSurOiecM4tv7aUbIZrG+7DfsJuZPIvpeYCBvYOEQ8Pp+UGiO+eP/1
         1yumUkG5YhuTG6IQ8qh4N+Gm09vbrlqJKQNr3ul0O65pSJ/jLmZNsfh2JQ/H2wN6bprV
         Q7eXoPXnUYfxhVvlzcwOg8qtcGYjh7S3Lq0Gkx+p/7z+yYgQjPMoJ5EnLupL623XSKIr
         vwdMDFjwC5cFEUbt51xe5gV9tTYsxDoytVQzEEJCq6BThCgNHDrQ14uLwZ4wIErg6Vbw
         aTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782974330; x=1783579130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTOdo7r99vUeIh+Bzq2POYKkkUa284xP30k/bUUTVmc=;
        b=F60kKyMu9RUZl0KXqlE3GqabnvrkS7QhElSOZbArqNza0FE8KZPE2Er2LY8pIUmymp
         LxkjBD2UV8CjLQMD7i3udOZ8yuhttIMnnenqynihL7UfR+Y35UW321iwRWnyMqxrcuuL
         iMYpGRyB0zUKIyjwxZXNAdhNcUFilcj+i1PwMMqRG/BJ6rJJdX7DRkSGsKRV18kbaf9Y
         JVhwcAY1FFRxuflCc1jY6AoQ6WXr4vx1ipLbOqGxOcs8IWG3B1IR+hG95doz4XMMVHqt
         eY6UL53mY2MMpmGAZoQpfoYv/c0/L37SfMFVSeFfj6kLeJglnlKWV/uU/Xv4VLZmv0Qz
         nV8g==
X-Forwarded-Encrypted: i=1; AFNElJ+Ql92VWBnIn4SuFavGvRtzIxgyT7YL5s9U6zM2bdaEFl6wO3xGShBfZ+FYZ4y1KIFvfW9XzP8TcQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSTLovz5+cRsGjHFEMFUmluNeCWkQpAxhOluA814y0eDi/w/bX
	wzMHMx2OD1/nnzuzY1nUXpA0OUGKPDw4YoEqMriamH72NWzP3p/hvBqQE2jWIkYfVw==
X-Gm-Gg: AfdE7ckIPzkWCVD8l1b9p/eB6Tq4hL4TIOwv/vAsJtPrkX7NT1hN8S5JaqRvz/bZ3Mx
	4ERlEZeo7nwC/EKXnVPqOXEOXgPXWc4SRVQvwwpAtapYMvQEl4FNmTlMrYVqCIuR9WQqiv0fpGv
	JU9tve8TBIHYMORgHqci2zkrh10/6PY9xLmLaro06W3QF9POKE//Qdr37erTP2BqWWx1hSTt7fZ
	IS9gVuSd2hGDUpEhqQwPs3OsOFIieZmXvxUPH11piGR+JlpqejzKIbPhZP1S9bt+gA8r6BCHnZU
	2xXVPvkjFkGc3IsRNi9auCtQ5WFKgSGYmPzVWWNJrdHdsz2uyhfNBlHkQZC2M2i15aGmfQ8li6z
	8WpwEdOL1bW35qwjdR/6gDiZv6bpPj51iLVNTSagmg5uZ2p+fahob4gJaIhVJs+TxVznsAJFNlz
	+iHzKCt1MLMgaGBlO5ankBOv/qTpvZfCBRzzG0JEvSibEmfATJgxJ4hQxpoyLqR54N1/QujP3rk
	hUc
X-Received: by 2002:a05:600c:8590:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-493c2ba4f75mr52259095e9.32.1782974329984;
        Wed, 01 Jul 2026 23:38:49 -0700 (PDT)
Message-ID: <40bcf6b7-306a-419a-bf12-1855f9e589fe@suse.com>
Date: Thu, 2 Jul 2026 08:38:48 +0200
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
In-Reply-To: <6aafbeb5-2f33-49f4-9d14-937b0bc4d15d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782974330-D16DE1E0-82700991/0/0
X-purgate-type: clean
X-purgate-size: 1953
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 344376F3DB0

On 01.07.2026 16:49, Oleksii Kurochko wrote:
> On 6/29/26 5:55 PM, Jan Beulich wrote:
>> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>>> @@ -221,3 +239,215 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>>>       spin_unlock(&desc->lock);
>>>       irq_exit();
>>>   }
>>> +
>>> +static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>>> +{
>>> +    ASSERT(spin_is_locked(&desc->lock));
>>> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
>>> +    ASSERT(desc->action != NULL);
>>> +
>>> +    return desc->action->dev_id;
>>> +}
>>> +
>>> +static inline struct domain *irq_get_domain(struct irq_desc *desc)
>>> +{
>>> +    return irq_get_guest_info(desc)->d;
>>> +}
>>
>> Does this really need a separate helper? (You effectively open-code it
>> anyway in release_guest_irq().)
> 
> Considering that I used irq_get_domain() once at all (even in 
> downstream) I will drop that.

Good.

>> For both functions: "inline" generally wants limiting to header files.
> 
> Regarding inline I think that I don't understand, it isn't in the header 
> file as irq_get_guest_info() is used only in this file.

Right. I didn't as it to move to a header file.

> Do I understand you correctly and it is needed just to drop "inline" for
> irq_get_guest_info()?

Yes. It can be simply static here, and the compiler can figure out whether
to inline it.

>>> +    spin_unlock_irqrestore(&desc->lock, flags);
>>> +
>>> +    release_irq(desc->irq, info);
>>> +    xvfree(info);
>>
>> If, in release_irq(), action isn't freed, it's ->dev_id field will now have
>> a dangling pointer. (I think I did point this out before.)
> 
> It should freed in release_irq() as route_irq_to_guest() always set 
> action->free_on_release = true;

Well, "free_on_release" must exits for a purpose. I.e. there must be, now
or soon, cases where it's set to false. Else simply drop the field.

Jan

