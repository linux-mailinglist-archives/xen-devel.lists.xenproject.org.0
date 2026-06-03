Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HchLFKbZH2pWrAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:37:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C763547A
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=LkEXXsM5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325805.1591149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUg9c-0003Lr-3l; Wed, 03 Jun 2026 07:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325805.1591149; Wed, 03 Jun 2026 07:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUg9b-0003KI-WF; Wed, 03 Jun 2026 07:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1325805;
 Wed, 03 Jun 2026 07:36:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUg9a-0003K7-GE
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 07:36:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUg9Y-005a3m-Cf
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:36:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fd987-e002-0a2a0a5209dd-0a2a45019394-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:36:40 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fd988-c1f2-0a2a45010019-d155dd36b1f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:36:40 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-45eedc94d37so3169500f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 00:36:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344762sm5857333f8f.23.2026.06.03.00.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 00:36:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1780472200; x=1781077000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eDlPp192v1q8ObAZ8jaeGflLxcbf6kqkOxPpHfsTVLY=;
        b=LkEXXsM5YRQ/b3QVt5i8EljpLawUnu4dRf9cjNcTP/GrhQqqHsBpVBKYlChUKh32I8
         VhEbkFPOPXqM+921Y8BHJoHB7d2iSHdrrL6jb9f8xLOgFpXk8i6er8/99OXDyObK3+B4
         16HCLazq9ZMF/dsRi87g0/iyiTqC+07/HMrUzSHhtvqXo0SeXdWtpNDAEJCFtfpmC1QP
         98BypbjAuv88Uti/BhufcwYc2maNPJIbWayQxs78VJpuXT89Eh7sVrann6jln83PAmKV
         XqBb7AA2uAkANFu4FlDEn0a3Du5z5pJNmWYPp9Tq5amAqLdRj8vGcWb+MyTqtnurLOUZ
         KDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472200; x=1781077000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDlPp192v1q8ObAZ8jaeGflLxcbf6kqkOxPpHfsTVLY=;
        b=ntzsCDeL8yLsCek3drfDTxH7mMCm5QPDf8HhTj35Th8CGGX86k+i8bygpYC7051PM0
         7btoMyO0sjNsGP0AZjCht9OZZNc+T3y+Ueo2vAue54bMlo4aZrhjZHYprtDd+VZomiow
         9XHtYGgUhwkD0+ry6iNojMDK1Osv7bqmXZ+WjORYiXnQvO64/mz2RInfbTTheFkXWoov
         OKvVtO+imAJkDo2NujHcgNF3iwvG/V/CyfBEDyHZuOwA7wgGVnkcPpLZ0sNxgF5OHxmB
         gvhEue+SW/XnR0PlfjpwLGMEerun0sP2iEnxHROm4qxv5WsLxiHQMwK/ClA+n0vQsqu8
         gKsw==
X-Forwarded-Encrypted: i=1; AFNElJ8CCqQYYIStLdBDCLl2icmDo+iGsSbuu2IyqMjPNSaMjG6yFj0ajynkpLbdlHiztql7yoUXjWsebzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/jNUxrWPKud380xu7JCTuw64rW2iplfUqazfPGQ3HtKGfVhDs
	8rCClWo/XhuZjYzN8M6BlXPALn0AfYuSYJgp4JNG6raXmnWGe14KVrjL3JV0fKP1JQ==
X-Gm-Gg: Acq92OHY9C0qf0j9KZInE621vkMLK2RIZWW5F3AgoppKbPgfEp79FI6LmxvqnHuWa0x
	aS3DjcI/l4Y9huXgYorrCMh5NkA171A1KeXKYjcMRhlVBOaXgObcY1BXZkClDPb67w9Cz46KbgL
	7FbdltnG/D+lG8hIEKX9ErYmhbFv1TAu0Dnfzbi9eH4NH4hEov/5AvdSy8XUIfXV4lV3kP/b6bL
	oxYulU77208nm4LUi6gI07RV3QL9aZcOcErxMDjtmzAm1slrA/XtWI6toGUHtGWQXe0LlNxEBD3
	uIt7J5WQZm6G4IvwajpmhSbgXZLFUh5Yc3jl3i86bHn9rnP9/YhMbZa8pgQVZXeRZCRGws6ruLZ
	SjnC1Yi/iQglG6panLkZmaoO6bqTsLvYGEDQDGBlwzgeh71gpsOjDKs/arJo13XpLGX0dt3D1u1
	pXbz7oUD/oeIerRA7ctzIR6DUmggketELj9AH85O8FJGvJ/uaQR91/sUDYfeXf/9LIzQtzSbQ2E
	RKJrK0FJ6OqGDa1dIhyoGZKMlA+3ZRNXdDz
X-Received: by 2002:a05:6000:611:b0:45e:ea9b:edfb with SMTP id ffacd0b85a97d-46021893197mr2835129f8f.39.1780472199614;
        Wed, 03 Jun 2026 00:36:39 -0700 (PDT)
Message-ID: <a0de8496-66cb-4e7f-854e-fcc0053bd666@suse.com>
Date: Wed, 3 Jun 2026 09:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/domain: make shutdown state explicit
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <e9c45be41bb36ca341dad57196c753fbe82d1526.1774998397.git.mykola_kvach@epam.com>
 <d53d2b06-56d7-43bc-bb20-4df7b7bc3ca5@suse.com>
 <CAGeoDV8RXEvV03WCRU5WqZvAgU1G9GmVpaed1ZR+ezbEjgLjMg@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8RXEvV03WCRU5WqZvAgU1G9GmVpaed1ZR+ezbEjgLjMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1780472200-B6D59FF4-CB2F02E3/0/0
X-purgate-type: clean
X-purgate-size: 4772
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD5C763547A

On 03.06.2026 08:46, Mykola Kvach wrote:
> On Wed, Apr 8, 2026 at 4:06 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.04.2026 08:41, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> The shutdown flow currently overloads is_shutting_down and
>>> is_shut_down to represent multiple phases of the shutdown lifecycle.
>>> Some users treat is_shutting_down narrowly as "shutdown still needs to
>>> be driven to completion", while others rely on it more broadly as
>>> "the domain is no longer in its normal running state".
>>>
>>> Make the lifecycle explicit by introducing enum
>>> domain_shutdown_state and helper predicates whose names match their
>>> semantics: domain_shutting_down() for the transient phase,
>>> domain_shutdown_completed() for the final state, and
>>> domain_in_shutdown_state() for checks that need the union of both.
>>>
>>> The conversion is intentionally not mechanical. The old flags were not
>>> mutually exclusive: once a domain became fully shut down,
>>> is_shutting_down remained set. As a result, sites that previously
>>> used the absence of is_shutting_down to exclude both the transient and
>>> completed states now use domain_in_shutdown_state(), sites that care
>>> specifically about the final state use domain_shutdown_completed(),
>>> and only paths that still have work to do before shutdown finalization
>>> use domain_shutting_down().
>>
>> In how far is the distinction between domain_shutting_down() and
>> domain_in_shutdown_state() really necessary? What you describe above
>> still leaves me pretty clueless as to almost(?) all of the uses of the
>> latter (where I think the former could be used just as well). Many
>> paths simply can't be taken anymore for a fully shut down domain, so
>> the distinction between the two is moot there.
>>
>> I'm also concerned of the name domain_in_shutdown_state() itself. To
>> me this is far closer to domain_shutdown_completed() than to the union
>> of both states. See how e.g. x86 CPUs can be "in shutdown state", i.e.
>> not responding to anything but a reset or init signal.
>>
>> IOW an entirely mechanical replacement might in fact be easier to look
>> at. And in the one rare case where the distinction might indeed be
>> relevant, "domain_shutting_down() || domain_shutdown_completed()" could
>> be used.
>>
>>> @@ -1423,9 +1423,12 @@ int domain_shutdown(struct domain *d, u8 reason)
>>>      return 0;
>>>  }
>>>
>>> -void domain_resume(struct domain *d)
>>> +int domain_resume(struct domain *d)
>>>  {
>>>      struct vcpu *v;
>>> +    enum domain_shutdown_state shutdown_state;
>>> +    unsigned int shutdown_code;
>>> +    int rc = 0;
>>>
>>>      /*
>>>       * Some code paths assume that shutdown status does not get reset under
>>> @@ -1435,10 +1438,18 @@ void domain_resume(struct domain *d)
>>>
>>>      spin_lock(&d->shutdown_lock);
>>>
>>> -    d->is_shutting_down = d->is_shut_down = 0;
>>> +    shutdown_state = d->shutdown_state;
>>> +    shutdown_code = d->shutdown_code;
>>> +
>>> +    if ( !domain_shutdown_completed(d) )
>>> +    {
>>> +        rc = -EINVAL;
>>> +        goto out_unlock;
>>> +    }
>>
>> I can't help the impression that you're mixing two things here - adjustment
>> to how shutdown state is tracked, and enforcement of completed shutdown
>> right here. This separate change likely would better be split out, and then
>> come with a description saying not only what is being changed, but also why,
>> and why the change is correct for both call sites.
> 
> In v3 I have dropped this part, so the patch no longer changes
> domain_resume() behaviour or its callers. domain_resume() remains void,
> and the patch only makes the existing shutdown state tracking explicit.
> 
> One follow-up question about the dropped change: do you think resume-state
> validation would be worth pursuing separately?
> 
> AFAICT, soft reset already has its own DOMCTL path, so I do not mean to treat
> XEN_DOMCTL_resumedomain as a soft-reset interface. The distinction I had in
> mind is rather that we may want different validation rules for the generic
> resume helper and for a resume-from-suspend path. In particular, soft reset
> could keep the current semantics, while a resume-from-suspend path would only
> clear the shutdown state if the domain had previously entered suspend.
> 
> If this distinction makes sense, I can look into it as a separate patch with
> its own justification for the affected call sites. Otherwise I will leave it
> out.

I guess I'd need to see a patch to really build an opinion. Generally yes,
state validation (even if e.g. only by way of assertions) is a useful thing
to have, I think.

Jan

