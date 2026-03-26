Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF8iInXixGnz4gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 08:38:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CAF330866
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 08:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263360.1555314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fHU-000326-Lg; Thu, 26 Mar 2026 07:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263360.1555314; Thu, 26 Mar 2026 07:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fHU-0002zV-Hw; Thu, 26 Mar 2026 07:37:28 +0000
Received: by outflank-mailman (input) for mailman id 1263360;
 Thu, 26 Mar 2026 07:37:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5fHS-0002z6-Mc
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 07:37:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5fHR-001e4Z-OM
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:37:25 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4e234-bab6-0a2a0a5309dd-0a2a4508b7a0-20
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 08:37:25 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4e235-1950-0a2a45080019-d1558035d8c5-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 08:37:25 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4852e9ca034so6007715e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 00:37:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722cb10fcsm12523525e9.14.2026.03.26.00.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 00:37:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1774510644; x=1775115444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MKMXQmpC0QmzLwiYZW0LPjqUduiOTLHtUtYFXU0Gk7E=;
        b=K+ywxJJSd9rDSiFvPM0/JWfUWrIbG6Ty+PhNOrsqYXAqL2FqAEWPZAoHihZEQWQCYz
         NhmpMH/mnuoDrOZ5FuQWYwIOUkcZzf+L3JZNU5M1mNEAgcLb+mQKvDfvv5n1V6YI2WO6
         KZl0zQzoz9nJ6PsnvGBH710ufJmh4s4GrjCsAJ6ST+YTDN3fFjZ9O5vQPgCeFJZ6b7iJ
         ZmUP2pceT57MFLgomOHO9QAjadGh2n22xbINZPxDVeuFxdsHAinLY+rm3zcw2Kat36aj
         9OnzW0G/lGcgnlbYsWp/NJOP0RQiP2U8RuSlls9R4b2SbHMaN+jLbT8t2AikWZHaAMsn
         IbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774510644; x=1775115444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKMXQmpC0QmzLwiYZW0LPjqUduiOTLHtUtYFXU0Gk7E=;
        b=BBywBl32zD18C0PELmFL6BxWlh8SR0jv9Mx2X3XWpDWv83BNsMzalVNeJy9H9WYjzy
         EIoXH07NLFf0aicgkVfHIGmcTT9bcC+xpVyYvsCwAH4tleQFEbhsg7NCL+oIU21P8OfD
         IwT/3ommeHdLonkADCyvNx/lE3ZumNcfaerEOb98s7lttPGZi2OvnuHxGEJF3DKtKGDa
         zLlODRMLAD8ssMcoDlVwElfVQQDTc+26qm0gRpq3iX9+OwOqfRio8LOWKNjp3ggnjQfg
         D37DAaxFzGN278nZhndnvzCM8ES+7FcmVmOVW4FCSoS7DG2T1Gtso0N4BQ1HEH2NuAEr
         8emg==
X-Forwarded-Encrypted: i=1; AJvYcCWN5tsfor8htiSe5JhIzVYdE4NnPJtb6/jYlQL/vUQARo6Pinq5WJJvu8XZS/9hF87zi/EzicAyu3k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywj5IaKqTR2OD3HOZ13cT8G8YUG0+bH3fXLQVtPExgOh3Emd9K5
	qXMSH9XS2FQF9ArQddbyualjh5BHcIwt9OIlpsJbpGQ6fYlay40LoqOYoTqpuQnYxQ==
X-Gm-Gg: ATEYQzyuMcAQNNyuQYz0kPlwK5E05okpHeAcdVvaUuCHslfoRuq2Dk4wtBTR4Z6hm/h
	3KB4r4/CL7V1zRC+WYf1699dw+dWFQRQkw1pUQJ9VhrFAjc+fR+ErW18EfuSPwh1StHBBBQ4hXG
	XVBRmgQCAjuc8SFoaRt6JMYAUTkNqGZ094VgzLHSyLO32YJ7EY7OwjmIx3wiCAd8i5frajJsTdo
	O2SqMrQGPKh0fKbH1JnwHzALs/x7Cqz6DR18P9FwXbUxeVr/UHJ6o3Hu2N6t6dXVE3tbQKarFce
	rMLRtwpd3/L24Ysik52hP8SjjnlMVSc4jehgrMiIAs+469W4h6tiVuoBGM00wmXuUmVBXZIk/7z
	sxSe68xMSMKPORT+z1E/JuoLX5/vP7sLXR4ZEyTfJSLvdcT+X2FdcncgepAsv34YFy9UNMBrekN
	jt0MDhs3FZqQqHRuHPC+6pRQdtK8qLcnMs5U/QAPStHdZ4RwzASA2PdmYrJeu9nNWlgJ4AxYWoV
	+ni5N5d21YSFMw=
X-Received: by 2002:a05:600c:45d4:b0:485:557d:9fe with SMTP id 5b1f17b1804b1-48715fd63a9mr92139985e9.12.1774510644513;
        Thu, 26 Mar 2026 00:37:24 -0700 (PDT)
Message-ID: <4aeb729d-df1d-4e89-9350-f0ef576c4b3d@suse.com>
Date: Thu, 26 Mar 2026 08:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arinc653: avoid array overrun
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 Kamil Frankowicz <kamil.frankowicz@cert.pl>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <7829c799-64b2-4686-8895-6ec73231c5d8@suse.com>
 <362f599f-b195-49da-8c53-1db69add203f@suse.com>
 <0fde03b5-949a-4825-87fd-a11463a3c064@amd.com>
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
In-Reply-To: <0fde03b5-949a-4825-87fd-a11463a3c064@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1774510645-E9689726-17474419/0/0
X-purgate-type: clean
X-purgate-size: 1930
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:kamil.frankowicz@cert.pl,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D6CAF330866
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 21:43, Stewart Hildebrand wrote:
> On 3/25/26 09:22, Jürgen Groß wrote:
>> On 25.03.26 13:55, Jan Beulich wrote:
>>> Incrementing ->sched_index between bounds check and array access may
>>> result in accessing one past the array when that is fully filled
>>> (->num_schedule_entries == ARINC653_MAX_DOMAINS_PER_SCHEDULE).
>>>
>>> Fixes: 22787f2e107c ("ARINC 653 scheduler")
>>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Stewart Hildebrand <stewart@stew.dk>
> 
> Thanks for this.
> 
>>
>> with ...
>>
>>> ---
>>> Jürgen, provided I understood him correctly, suggests that something like
>>>
>>>      while ( now >= sched_priv->next_switch_time )
>>>      {
>>>          sched_priv->sched_index++;
>>>          ASSERT(sched_priv->sched_index < sched_priv->num_schedule_entries);
>>>          sched_priv->next_switch_time +=
>>>              sched_priv->schedule[sched_priv->sched_index].runtime;
>>>      }
>>>
>>> should also be valid to move to, due to constraints applied by
>>> arinc653_sched_set().
> 
> Not quite, because major_frame is allowed to be larger than the sum of the
> runtimes, and in that case the ASSERT would trigger during the idle period.
> 
>>> I'm hesitant to make such a change though, not
>>> really knowing the scheduler; the change here looks more obviously correct
>>> to me. Albeit the Fixes: tag may thus want dropping.
>>
>> the Fixes: tag dropped, as the constraints mentioned are IMO really enough
>> to avoid an issue.
> 
> No, the constraints aren't enough, the out-of-bounds access would occur during
> an idle period of a fully filled schedule. I suggest keeping the Fixes: tag.

Jürgen, am I okay to keep your R-b with Fixes: re-added?

Jan

