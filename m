Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO/KB+dNDGpIeQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:47:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7E957DF6F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312843.1583004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIv2-0008Te-WB; Tue, 19 May 2026 11:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312843.1583004; Tue, 19 May 2026 11:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIv2-0008R1-T2; Tue, 19 May 2026 11:47:28 +0000
Received: by outflank-mailman (input) for mailman id 1312843;
 Tue, 19 May 2026 11:47:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPIv1-0008PR-Vo
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:47:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIuz-009FXO-C5
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:47:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c4dc8-bab6-0a2a0a5309dd-0a2a4501e64c-12
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:47:25 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c4dcd-c1f2-0a2a45010019-d155dd31e15c-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:47:25 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4585a116a4aso2811367f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 04:47:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17a22sm45400975f8f.22.2026.05.19.04.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 04:47:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1779191244; x=1779796044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=51zVMcdjsyEuHlZvWuxVkpFkf5XLES/mFx0Ss9JKPdY=;
        b=Sf1XH4XEzjY9eiGBj7MxUbk964O9hd7sQXRh7ChW65W44nAxEbEpTN+BQoGpVifPS9
         oFDll/k2uWtv7xtGjwcADjS/mxIyUGO2G+IzzPp7nZP+VA1s1TqWmQ1uSAhNPSkQqtnE
         fPQrTG6os0YLaC8FFTAnnPj5UHc4q7Agfxc9tGkUHaR5XdChOQyXv293OdSA/ysXhR4o
         vOrl8L7GNM/eDtTtTTBKTIhVx6EK0APkkdCJDbwI6koPmLMPkDLySD2UnTTc4g1n99iX
         qJfYK0p37rdm03ZD3a8SNRk/j6aIFpIOwhFav/K/WVvwl3UVGZsmw5IjvX+EVT0GxZyc
         EUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191244; x=1779796044;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51zVMcdjsyEuHlZvWuxVkpFkf5XLES/mFx0Ss9JKPdY=;
        b=Zztivnw5Sg0emG0N0uu0xyfrJkXk5K3I3da9duTLCnZa8OHY3xTbAZJUBbY6g+0S2/
         4JvF5c98Zq4IEZlloxiN+T2k/WxIEIgHsiqOIvO6fSyj3YA7ETy29vP93BDtX0arCeF6
         af8FPvpOvwUWNQX5gm3blLBVsYPrJ0ruuYUJ/EWjb+6J19oNgKSH5Ng5oDoxW9UWqYcg
         yKk4iOmT4KPX5nM7QRaehPR5HEgKp21dxBevGvJZg/WJweaa2CIsqCL9WF298/V/66xg
         gBeQociWK3U7+zZnwTdGO0hHzz/fFNtXndh43l6HsLIPbE1lrXH9ltbyiNF+9TqFgMZx
         RrXA==
X-Forwarded-Encrypted: i=1; AFNElJ+fkgSyn/zH73zpknKO5fY39JbcTm6qXw4HbUQwTNp85rql9S7lhTmKK5tK7hLNXaBAtpRU/HPXBJo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz896P+ewFI3K5VmUjT4FgxxaiP4r/UOWNZQvATpkoUv6DmvJvs
	InU9DV/foU5UVWvFqHbw/aVH0nASEdPMvgSrdFAH4VEnNUw12i6hS+Rqi6qcRtEslg==
X-Gm-Gg: Acq92OHXL8lxodsYdoavLe2kTgjbn3KxXHt+qGvpRzWXMHG/TWFj486WVSiA91pqSb3
	0NZgCmIYmkRZc8/k55z1m5iwTr5J9rrvD72DRO8inJdw09lyORuPqj/DkuJG8I5Bq8vkpcyr7JA
	wn6wnjBr3onMTfg9oRH9HbTEnjOkcmxZXyRQLFQqF5jF64+ZMSkYsux7Fqc0Vf6lADD0TOELffq
	yMa7dh9I2kmLdWEnsqpw+Olq/d9tZlnZl6zvdI9aXW7kGOxJHreF3wC1vrdDmKugFIsc6oSDvpt
	neW8myTnXHWGUCzPsXruByzcMNvBz9Jfm62kP/W+nxBlOixFiXaaDhPuijzdmdOnEVcoc0cEAuB
	5zp2V+Fw+OMhMs8ehsqn4qqXZbe6s3AiF4FEMwywtPPgFleEOSPm3TsrKaaNvZX+m4tNkhW9GXR
	pXChcS6avqfZ8FbKQErSXINii3J7Ul/cd4h/+qHiKVHBEGGZFJyFHVfXqilS627N6eN0S9X1nVE
	p6Q/9/QwizqjwQ=
X-Received: by 2002:a05:6000:1845:b0:43d:309b:9c4f with SMTP id ffacd0b85a97d-45e5c57d2fdmr30802800f8f.6.1779191244590;
        Tue, 19 May 2026 04:47:24 -0700 (PDT)
Message-ID: <71dcfb4f-c3ab-4b19-b91d-6c3e7bdfcbc9@suse.com>
Date: Tue, 19 May 2026 13:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] xen/riscv: implement prerequisites for
 domain_create()
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
 <e4d6f36bcdf13e8fc12e8769dd965954c5f45b97.1778250616.git.oleksii.kurochko@gmail.com>
 <5c047204-09ac-49b7-b9b3-c6e1c7b7f079@suse.com>
 <244209c6-f707-4418-9513-1ef65d1d97db@gmail.com>
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
In-Reply-To: <244209c6-f707-4418-9513-1ef65d1d97db@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1779191245-B7754FF4-E3099893/0/0
X-purgate-type: clean
X-purgate-size: 1503
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7B7E957DF6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 13:33, Oleksii Kurochko wrote:
> On 5/18/26 5:43 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/domain.c
>>> +++ b/xen/arch/riscv/domain.c
>>> @@ -289,6 +289,31 @@ void sync_vcpu_execstate(struct vcpu *v)
>>>       /* Nothing to do -- no lazy switching */
>>>   }
>>>   
>>> +int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>> +{
>>> +    return 0;
>>> +}
>>> +
>>> +int arch_domain_create(struct domain *d,
>>> +                       struct xen_domctl_createdomain *config,
>>> +                       unsigned int flags)
>>> +{
>>> +    int rc = 0;
>>> +
>>> +    if ( is_idle_domain(d) )
>>> +        return 0;
>>> +
>>> +    if ( (rc = p2m_init(d, config)) != 0)
>>> +        goto fail;
>>> +
>>> +    return rc;
>>> +
>>> + fail:
>>> +    d->is_dying = DOMDYING_dead;
>>
>> domain_create() does this as well. Is it really needed here?
> 
> Considering that domain wasn't created and thereby scheduled that 
> nothing will use d->is_dying and so it could be dropped or moved to
> arch_domain_destroy().
> 
>>
>>> +    arch_domain_destroy(d);
>>
>> This continues to be a stub, i.e. upon encountering any kind of error one
>> would hit the BUG_ON() there.
> 
> I think that for current stage of development it is fine.
> 
> Would it be better change BUG_ON() to printk()? And add proper 
> implementation a little bit later?

That may be acceptable, yes.

Jan

