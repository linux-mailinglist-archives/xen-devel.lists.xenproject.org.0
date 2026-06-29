Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uXQqM9UXQmpL0AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 08:59:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E216D6A89
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 08:59:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VE2dFY25;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347215.1605090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we5xh-0007sN-TQ; Mon, 29 Jun 2026 06:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347215.1605090; Mon, 29 Jun 2026 06:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we5xh-0007qX-Q9; Mon, 29 Jun 2026 06:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1347215;
 Mon, 29 Jun 2026 06:59:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1we5xg-0007qR-4z
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 06:59:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we5xf-00D4re-Gw
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 08:59:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4217c0-bab6-0a2a0a5309dd-0a2a450bc050-32
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:59:19 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4217c7-ac48-0a2a450b0019-d1558031cd92-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:59:19 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4939a809b24so13472025e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jun 2026 23:59:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268f700c0sm333932555e9.0.2026.06.28.23.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jun 2026 23:59:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1782716359; x=1783321159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6fPiKn4pHM/RYskqWjp06sbYhzTKuWC9KhXmU1wKf/Y=;
        b=VE2dFY25X+3HHo6cbvBoXcuhxoK1iZAgYjy3C/rEMpUErJTp7XI+J+HIbqrvM366eN
         8LMBBPPqiLm+AXRNk3fSjDK2XlRE6PQ4DZYY+Htc+8g/pjc+84sa3jgJbXO7cFT2fMWO
         R55cuLPDOUrGJksIqwj4dNUBCWfLMRRDfPwI7szFb+L9fPf95P2KpafI0ObBCZXKoHzC
         YibellyFlwOcGfT9Ipy5jMYUqNNPaU/QIu2uzKF3Thv0YPkcfaHv8Vkn3BzSi44diV5o
         d5+Qvt9vZ733THt8Js7QNmHFgS+ZApBvvkDKWSnFttQ1ldrgfjyey8y4qVMb9hOq52SX
         NJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716359; x=1783321159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fPiKn4pHM/RYskqWjp06sbYhzTKuWC9KhXmU1wKf/Y=;
        b=MiVgJXjhphj8CWbk1P1fqZz5/L7yNkKco+wqIIJAR+l3fuIF3z0YpiXw6jOWhWyeuE
         U/rPMfeNgCWIjhTAnLMidSJ9+EEQaYftpOM+eh+drfFC0sZ891vbFCNO3OOcFCA6hHcD
         AFItPU+vEQs8XAFsdd5M9B+jxMZwgsDnfp2Pd1Uyw/CKDg/1nIoGbQBlVAVeHCVGyzGS
         d0acy5XtVauwRtlJqYRPxf+3sr6hQWqSLW0ojMXrUjA1fTs/qgOJ0PwhxvVoX2kdq+nZ
         q8YJdYBTWaE2So1Wy0RuVOl2pw0UZ+LRtFQocKgLcMVP0m5DCkzM38Ki1hurPvOZEvXj
         MMSg==
X-Forwarded-Encrypted: i=1; AFNElJ9cvjat8lqWo8j8r+4oAqJDWszXfCEKrdiTKNQrtt7qowbXOC1GxwHDwRkK/ltmcbsj9mt1aIPlSmM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyboY4IkwHQ7yXTYEbwGMI6QiofPeghTI9Td3BbRg++Aq7Z2XuP
	ZiyLAUucfN+i2ZLCJ3EPEhNz3k2dm/hSelDk/cEMQy4WVbxUyrCB4qz2+2wR4oaaaw==
X-Gm-Gg: AfdE7cnpHPrq5ptnNW9YPuh0KX2cpbTxN4HFZqQQE82ppf5rb8MFMojzl3wzL3tm6c0
	Jjvav1mCrv1wQTFw/IDX3yJftKUqza56RJ7zEcFEzTL7P2qwmhFoJOQ3mAVAaSB1QvTlf/urQFi
	imNj1l0Ik8Igiz2hM5eRHrGnYJDnFY5bFjLeFmOhAAX85hsm3XO4dhKzzh7xbog3m2vBHa0RGcf
	wG0gVIAVGZ1EeTL0k2xZrH06XTrre5VC9ay6KrhnR8jGw2XTHSDtVfKZfWTtjyfr1CvbOsa7JPc
	CBwFGiEskpnSh1K/UnxMBO+uZN8lbOV3IoZ/ZJWJTsMX61FGqlerOo3arTPwdnAx/vX8fXedZbN
	QRwxi5fg4qEeSk4Yf+DhUUH4aTmDPnDAZNFzqcdk32yxADVN3ubsgAqq0vdjmwksuuQxhArONlR
	2gOsJ9ZsRg9NgtJMnVNOeX3fyOADyXMp7xJxgYpaSRLsW+YaJjZRlMi5Dx9sGCt46ohUw1rOOlP
	znx
X-Received: by 2002:a05:600c:4e12:b0:493:9b02:484c with SMTP id 5b1f17b1804b1-4939b0249ebmr95882325e9.29.1782716358815;
        Sun, 28 Jun 2026 23:59:18 -0700 (PDT)
Message-ID: <46b70e9d-1ade-4ba6-ad5f-87d2c9652a7b@suse.com>
Date: Mon, 29 Jun 2026 08:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com>
 <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
 <CAHt6W4c0FDaMZK-4-7CReG_PdV+L=HNxVGNjV5vUjDkKq3EMBA@mail.gmail.com>
 <2889dc4e-33ec-4d8f-b01d-026506a39cbf@suse.com>
 <CAHt6W4cghz1Rh=MXqmx6ZHA0iOz9xTBDNhFWaqtZ=npd4Hb=GQ@mail.gmail.com>
 <07b3bbb6-ef62-419c-b708-1b9ae2774462@suse.com>
 <CAHt6W4ckkQOKn9jvNpMG5meFeagY8uFZJsC6CEUsu9tfc17cHQ@mail.gmail.com>
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
In-Reply-To: <CAHt6W4ckkQOKn9jvNpMG5meFeagY8uFZJsC6CEUsu9tfc17cHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782716359-A673A220-7239E01E/0/0
X-purgate-type: clean
X-purgate-size: 5820
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,xenproject.org:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35E216D6A89

On 26.06.2026 16:14, Frediano Ziglio wrote:
> On Wed, 24 Jun 2026 at 07:44, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.06.2026 23:18, Frediano Ziglio wrote:
>>> On Tue, 23 Jun 2026 at 14:21, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 23.06.2026 12:55, Frediano Ziglio wrote:
>>>>> On Mon, 22 Jun 2026 at 11:34, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 19.06.2026 15:04, Frediano Ziglio wrote:
>>>>>>> --- a/xen/common/memory.c
>>>>>>> +++ b/xen/common/memory.c
>>>>>>> @@ -1545,6 +1545,139 @@ static int acquire_resource(
>>>>>>>      return rc;
>>>>>>>  }
>>>>>>>
>>>>>>> +/*
>>>>>>> + * The "noinline" qualifier avoids the compiler to create a large function
>>>>>>> + * consuming quite a lot of stack.
>>>>>>> + */
>>>>>>> +static int noinline mem_foreigncopy(
>>>>>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
>>>>>>> +{
>>>>>>> +    struct domain *d, *const currd = current->domain;
>>>>>>> +    xen_foreigncopy_t copy;
>>>>>>> +    int rc, direction;
>>>>>>> +
>>>>>>> +    if ( copy_from_guest(&copy, arg, 1) )
>>>>>>> +        return -EFAULT;
>>>>>>> +
>>>>>>> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
>>>>>>> +        return -EINVAL;
>>>>>>> +
>>>>>>> +    direction = copy.flags & XENMEM_foreigncopy_direction;
>>>>>>> +
>>>>>>> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
>>>>>>
>>>>>> Iirc I did ask before why this isn't ..._by_any_id().
>>>>>
>>>>> I probably was confused by the question about MMUEXT and the 2 domains.
>>>>> There are different similar hypercalls (like the mentioned MMUEXT but
>>>>> also hypercalls to map foreign domain memory) that have this check
>>>>> (not the same domain). Any domain has, obviously, access to its own
>>>>> memory, so it should not have to use hypercall to access its own
>>>>> memory. If it does it looks like a mistake causing performance issues
>>>>> or an attempt to circumvent security; in either case you would like to
>>>>> avoid it.
>>>>
>>>> No. Self-grants are possible as well, for example, and for a good reason.
>>>> Allowing normally-remote operations on oneself helps with testing, for
>>>> example. It may also help avoid needing to special-case "self" in code
>>>> which needs to cover both cases.
>>>
>>> But this is not a grant, it's a copy.
>>
>> Sure, but the underlying principle is what matters. Plus you don't prevent
>> self-copy by using ..._by_id(), you only preclude the use of DOMID_SELF.
> 
> Sure about this?

No, I'm sorry: I (repeatedly) managed to ignore the "remote" in the function
called. That said, my request stands: No arbitrary restrictions please. If
you can properly justify a restriction, that's a different thing.

>>>>>>> +    XEN_GUEST_HANDLE(uint8) buffer;
>>>>>>> +};
>>>>>>
>>>>>> What was (again) left unaddressed is the question towards using GFNs on both
>>>>>> sides of the copy. This would eliminate the need for the flags field, taken
>>>>>> by a 2nd domid_t one then.
>>>>>>
>>>>>
>>>>> This was addressed in
>>>>> https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00567.html
>>>>
>>>> Well, yes, but not in a satisfactory way. Back channels tell me that you
>>>> actually got the same feedback already on internal review. Which makes it
>>>> all the more puzzling that you insist on doing it differently. Multiple
>>>> maintainers asking for the same thing may be an indication of something.
>>>
>>> Not needing to have backchannel feedback, I already wrote that a
>>> similar approach was tried and made the code more complicated.
>>
>> Even if indeed so: Yet at the same time more flexible.
>>
>>> Both maintainers didn't comment on my replies so I assume they were
>>> fine with it.
>>> And you are failing to provide positive feedback.
>>> I asked (that one internally) for examples of guest buffers provided
>>> as frame numbers but I got no answer (or better the answer was more
>>> "currently there are not").
>>> Also note that the location of xen_foreigncopy_t structure is also
>>> provided using a guest pointer.
>>> I remember there were some discussions about ABI changes (2/3 years
>>> ago) to address this and other issues but I cannot see much progress.
>>
>> And it's that (very slowly progressing effort) which made me ask. The
>> fewer virtual addresses we bake into new sub-ops, the better for that
>> effort. And no, that doesn't go as far as completely eliminating
>> handles (presently representing virtual addresses) - that needs to be
>> part of the new ABI.
> 
> In other words, you want me to code something temporary that you
> already know that needs to be changed.

What do you mean by "temporary"? We will need to live with the present
ABI for the foreseeable future. The new ABI's requirements haven't even
been spelled out yet. Patches to allow use of physical addresses in
place of virtual ones were actually turned down on the grounds of there
not having been a write-down of all requirements.

>> To preempt the argument towards "fewer virtual addresses" not really
>> being true when changing from handle-to-uint8 to handle-to-pfn: The
>> former won't be able to express a buffer mapped contiguously in VA
>> space, but discontiguous in PA space. The latter will, simply be
>> avoiding buffer VAs in the first place (the array of frame numbers
>> can e.g. be placed in a dedicated hypercall argument area known to be
>> physically contiguous).
> 
> If it's mapped continuously in VA and you pass the VA I don't
> understand the problem. From the way I see it's more the latter that's
> the problem.

I'm talking of the future, where VAs wouldn't be used anymore. The
buffer you use couldn't be described by a single PA, unless the caller
took specific measures up front.

Jan

