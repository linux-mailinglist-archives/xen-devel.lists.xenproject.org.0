Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SxD6A412RmqMWAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 16:32:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666726F8E58
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 16:32:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="W7ERDM/r";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351985.1608963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfISy-00086U-Qr; Thu, 02 Jul 2026 14:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351985.1608963; Thu, 02 Jul 2026 14:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfISy-00084B-NN; Thu, 02 Jul 2026 14:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1351985;
 Thu, 02 Jul 2026 14:32:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfISx-000830-73
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 14:32:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfISw-00F19m-GO
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:32:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a467682-5cb7-0a2a0a5109dd-0a2a4501dd04-0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 16:32:34 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a467682-400f-0a2a45010019-d155dd32ed85-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 16:32:34 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47231f1f8f3so2172020f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 07:32:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbb01sm9540012f8f.1.2026.07.02.07.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 07:32:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1783002754; x=1783607554; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouAIXKABUS86tGqzusDeAOuz+zhrRm4/w2+8FueUbIw=;
        b=W7ERDM/rc4qEM24HtyAufxDDtvndKMXU3OvNT8ZkCfv02i8bxc90pCc6GG23Ej4oRM
         n3YPgcNndtugus9l6Aa8Ig1wskh6whOhap42zHWRn4ppMwF/0F54i0vOG2FHNqdJ1+0C
         aGXrfDPl01Bk1FpfOimrDdOAS4y6y9rOPc7nAv0SSUVhtrrlRt0cM84zlD0mDzPgfUCj
         6zcDDG/Ai3GzsiA+Ev6JYD+8NYabVPeQrzJFnLcfGlPUT4PRi5G/i68eV7CzdZ8UQ9W6
         a/D2YPjx25kScml3P2vXCKl7IGKzSpUCXz5vuVPrL8PN0deRDnG5TW2m12DpRnovyVFD
         +4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002754; x=1783607554;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouAIXKABUS86tGqzusDeAOuz+zhrRm4/w2+8FueUbIw=;
        b=VcjtbfFzQSakhpWhOdKOAxuRnZ8y1+9Yp4j88NvadfuQ69Q4zDcb4fVdtUFvylX4yy
         pRtAYen5rfG8hAa1ctcMoIdhRTQVqI+ttU2XyxagCOsJ2uz2uETMAA1eqETcIxvLdoBa
         czldpwphWwQAF4pX1QwFRSrkG0ICI9FuseVXoUjKynUtT7Hnp/pvKmz1ny2uB1Oel6P8
         OlmjmvkE2TIf+kbbADFRQHZcDs8OFWhpjxPeAr2jVlTJoxp8glNT0jAtRh86n6VMW/+H
         aCqgFN2E3ZUBM0PFMDlpmv345YVPLlDL4HhoHdo/nZAnGvtkiWW4+RlhLQ8KT0v1tlzS
         EyHA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0BUJw/ThFFHerLOIeobF8XZuPzUJPU5QVzKtwZzKF/m2YjffIH5PIDjekDVWa8s084nLlttb1qDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsglNKmpHdpFAeBEc1nkQnGmoSnzTra16ZcXeT+TrYVO83cxlg
	IJo3wO6zAyc6B5o4JpvRSPEkBfqCk+2LKGUajwKy9j7bA03ItvfgdU9nEB0e5tJqVA==
X-Gm-Gg: AfdE7cmT1kwmnlwnAVN2WAH+NViAsLQnA4r98veWuKWxvH0W7/4h/qsJ6kYapkjPZ3l
	CWWzD5if4VqmTwE8WJVh5l8vr67GRGA551E29/y7/Bo//G70/F1HtSjns5+phjTfSVeNgeTq0pV
	Kjsm0qx06sw6OciG3W8hY+BJJVgE3o12G1FbsHcm8x60VkIbdKC1RmcFgUDNpZZXrmtp6iJ0nIR
	QhocFNIkOPGOm2ZSB70haMc5BJh1nypM5iUB3XYT7Ku71p8kdWJDhER2u2fWIU8Pnoo9bBEv99i
	Dbv9/vLpyyx5AQYirnWwmbx4IAgWEM6kn3HPsVY98+btdw6KrRSRrja7ATjx4rhvYLoQ8Avk51l
	lwDbACxrKHnTtbsNQsA47bXMAladO0TU2AIuth/dIhqPzQb7SeuZvnEuPWWjqjmLEr8GJKpAmc4
	ryeL/nziD3Jxz64Sf9S7Z/dRzGlvEfECaPrZnnCihJVgStxvhAjE5LYXJwNABOIGkFma5Ne6r05
	6fO
X-Received: by 2002:a05:6000:402a:b0:441:1e41:194 with SMTP id ffacd0b85a97d-477b3983918mr8722264f8f.17.1783002753853;
        Thu, 02 Jul 2026 07:32:33 -0700 (PDT)
Message-ID: <e7d430c1-fe57-4b28-a5a2-1c8bfcd54ac4@suse.com>
Date: Thu, 2 Jul 2026 16:32:32 +0200
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
In-Reply-To: <91ffc1b2-7648-4185-a2f1-12b30181c8a9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783002754-830C41E0-5B701841/0/0
X-purgate-type: clean
X-purgate-size: 1772
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 666726F8E58

On 02.07.2026 11:33, Oleksii Kurochko wrote:
> 
> 
> On 7/2/26 8:38 AM, Jan Beulich wrote:
> 
>>>>> +    spin_unlock_irqrestore(&desc->lock, flags);
>>>>> +
>>>>> +    release_irq(desc->irq, info);
>>>>> +    xvfree(info);
>>>>
>>>> If, in release_irq(), action isn't freed, it's ->dev_id field will now have
>>>> a dangling pointer. (I think I did point this out before.)
>>>
>>> It should freed in release_irq() as route_irq_to_guest() always set
>>> action->free_on_release = true;
>>
>> Well, "free_on_release" must exits for a purpose. I.e. there must be, now
>> or soon, cases where it's set to false. Else simply drop the field.
> 
> I can't simply remove this field because it is part of the common 
> `struct irqaction` and is used by other arc-s. (I assume that it is not 
> what you fully meant...)
> 
> IIUC, this field is used to determine whether an irqaction is 
> heap-allocated (and therefore should be freed) or statically allocated 
> (and therefore should not be freed).

Yes. However, all uses of the field are in arch-specific code. So in
principle it could be #ifdef-ed out for RISC-V. There may be a better
option, though:

> At the moment, all IRQ actions are heap-allocated (on RISC-V), so 
> free_on_release should always be set to true. In particular, the code 
> snippet you asked about releases a guest interrupt, and guest interrupt 
> actions are always heap-allocated. As a result, when release_guest_irq() 
> calls release_irq(), the associated irqaction will be freed.
> 
> So, from what I can see, the current behavior is correct and I think it 
> should be left as it is. Do you have any concerns about this?

If you only ever have the field set to true, use ASSERT() in place of
if().

Jan

