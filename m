Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IsHzEOh8Imq4YQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:38:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD164610F
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:38:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=I3KplxBW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329098.1593310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP84-0006b8-9a; Fri, 05 Jun 2026 07:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329098.1593310; Fri, 05 Jun 2026 07:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP84-0006Z3-6P; Fri, 05 Jun 2026 07:38:08 +0000
Received: by outflank-mailman (input) for mailman id 1329098;
 Fri, 05 Jun 2026 07:38:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVP82-0006Yx-Tp
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:38:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVP82-003pHN-A8
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:38:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227cd0-5cb7-0a2a0a5109dd-0a2a4508806c-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:38:06 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227cdd-63b5-0a2a45080019-d1558035a8ab-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:38:06 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso18006365e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:38:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2d2d11asm34783715e9.1.2026.06.05.00.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:38:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1780645085; x=1781249885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p4L0/Zh7iLA+43rU0ptXpe9fMnt8lujr+imsnjE6Y1M=;
        b=I3KplxBWpYiaFI8du2oH7tMB9wZm83sD4SlQUTPhNc0tRwMF/YveS8sa2CCI1IkFt7
         FYc+vAvlUw2IWtlgiDGJsv/hABMg7XPIz6GjfYfEDlsNrUmn924Y27PpzIe2ihM5Cu5J
         uczls9/53pvD+oFWRp7grGUUN3uFlFsbAVYFjqX9npxdhH51yQcW99Djz0qNzfTm+7yL
         eeckoR/6R4qhYI9I4aJWKCSoSoDVxMeOgBgEF7q4oNUikGY/vK1Fnyir4+53UEKkeW30
         53bFIrqhV3OUtNkGjr42vdwzH0MsYo5X6dmxnynK1kp+xYjUpdd3tZdupNfb6hjyh9xR
         KaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645085; x=1781249885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4L0/Zh7iLA+43rU0ptXpe9fMnt8lujr+imsnjE6Y1M=;
        b=mgqeCqNgtzoNINnk90zRlyPbVd+CsiykYjf5+wn9xJyqb/jemcG/L9csYys/fMw5nE
         frQdwI63/9BPKU1QfAml5xIn+IeMhs40bPpP3YrlrvACLeHegi4oRe51jh+HU+w/AMpn
         DrMcRjoriSIS5xwoPRLbntKXiQZdTdAVwzxm9IGJTWRnPWdwd7xbxrT2xKePc/cbxrGN
         7NYGilsxX8P2Ran1xgBrLVGGUY628EannODd/8wMwS44RnxGH10jVZV/B4hFSYFjckM3
         9B+yH0hTZXgRi17Z6MV+ZpUZnwRV4D1RfoRvKpVgBTmDUCXWXDBaZIbX0qy1uX2hgs23
         jc/w==
X-Forwarded-Encrypted: i=1; AFNElJ8QCLgEPUZWAgQjTUse+UkCzjrN7vgCSHsng+/YOnYQPq0fApxBKNA5IVsUYfkRjA83CGMMDNPGnV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPiBk1SWr55fvMzN2EmFCJMeXO6rNO9se6/EhBxuMH1HrIczwQ
	6+TbeJViyTR4+PVidC8KU8ueM2ufGVbDQX0RbhwTefTI3bu/TUEGcB96EgEIgh5q1g==
X-Gm-Gg: Acq92OEzOyd4GN6VgBX7xEPebiQ/SSQ+tOd77e+vvwDofBcpXroRKH0RERqjVBAWvml
	QEmUgJH9Zlk2WnzU3MyIkISX2q9VQrxL873DyijmzQ+vl/FYVIp5iTnjSivHi39/oTWzwrXdFrS
	kCCh9c8gYvQf8VjRoVoIgxzdWTtzAO5eYV21QMaqKG37HXudtnILOd4Atk780JFVjdtGAUElZaj
	R+Qy/6VeTkTQunbwHwX1D6FVg0w+yNYh9NrZ7LNRL0hLy8vjM5C0JKZQcmRIpNyD5/b8bCccN0H
	WFesQRmZcvsXVj9cNQxIJgCATYJnZX8zlawwkrVqBybWlBP3+m94qeYCvNph3rV8igXVzWUTWUb
	Kto0Yf5KM2HNyR8XMBt5GOs5G+3jV+DIs3XMcbhoVdYH4Cwi9npHj1EsKjI8o1YH2v8AakVR6ku
	+jOQTupgJpoWoQKSejfxAUCG8z8SCqiQ3EDbFDJ1i/e1Zsr2/WimL+X01eIIPFrSts4/Ftt3xCK
	WGtAIqcEc2foeIWtqjLGTKnQfxYwZ9SMJWx
X-Received: by 2002:a05:600c:3b04:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490c2cdd2bemr20385805e9.7.1780645085561;
        Fri, 05 Jun 2026 00:38:05 -0700 (PDT)
Message-ID: <c0ee1938-a098-4d95-a1de-a9ad4a1887a0@suse.com>
Date: Fri, 5 Jun 2026 09:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/26] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <ed5218e94790ff8de36af12852605454606a6d80.1778250616.git.oleksii.kurochko@gmail.com>
 <1941ee36-cbfd-4d7f-a15b-e74843371f3b@suse.com>
 <60ad843e-3fc0-4f99-bbff-0a2f84679274@gmail.com>
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
In-Reply-To: <60ad843e-3fc0-4f99-bbff-0a2f84679274@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780645086-C407FDB1-60D6A784/0/0
X-purgate-type: clean
X-purgate-size: 1018
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 79DD164610F

On 04.06.2026 17:35, Oleksii Kurochko wrote:
> On 6/3/26 6:01 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> @@ -86,6 +88,22 @@ unsigned int intc_irq_nums(void)
>>>       return intc_hw_ops->irq_nums();
>>>   }
>>>   
>>> +int intc_route_irq_to_guest(struct irq_desc *desc,
>>> +                            unsigned int priority)
>>> +{
>>> +    ASSERT(spin_is_locked(&desc->lock));
>>> +
>>> +    ASSERT(intc_hw_ops->guest_irq_type);
>>> +
>>> +    desc->handler = intc_hw_ops->guest_irq_type;
>>> +    set_bit(_IRQ_GUEST, &desc->status);
>>
>> Is desc->status accessed anywhere without holding desc->lock? If not,
>> __set_bit() or simply |= ?
> 
> In release_irq() it could be used without lock:
> ...
>      /* Wait to make sure it's not being used on another CPU */
>      do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );

That's fine with the update being non-atomic. I probably should have said
"modified" instead of "accessed".

Jan

