Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDTQHOMXzWmMZwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:04:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFE37AE97
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270263.1558978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7vEh-0000ZP-Vn; Wed, 01 Apr 2026 13:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270263.1558978; Wed, 01 Apr 2026 13:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7vEh-0000WZ-Sp; Wed, 01 Apr 2026 13:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1270263;
 Wed, 01 Apr 2026 13:03:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7vEg-0000WT-Aa
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 13:03:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7vEf-00G3Um-Eh
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:03:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd17b2-2eae-0a2a0a5409dd-0a2a4509899c-10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:03:53 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd17b9-bf79-0a2a45090019-d1558034ec0c-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:03:53 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-486507134e4so77588135e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 06:03:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf330872asm33496849f8f.17.2026.04.01.06.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 06:03:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1775048633; x=1775653433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h/lioYAC4GUA58SdhE5ceGXkvUy8ColhOQryMEBxi4k=;
        b=CjdH5TfG+dqDxJCDNRcj7TH+IexwmVmChMKQSqqO6u+U42d4Z1B8bevG707YTdIN4b
         6accHLsmaalaEJdYh6vzq0QIWATAeYO9Mev9e2DMEFieun0rh+nUqUIhwldm2iS2l/BU
         1bns6huNfLvf8dVgweuXQl3/wczCDmcqzAGC4pFbBN82YZHo041UbL5wfTRoUw6fmeas
         BrwuiWnYk0uXGPDUJLZ9F/pR0HUXT1d6ILLphHrnoUu94Ltsy4jebZV/7s7gq0gSVDWq
         5vfNuypE5oCHXAFOGSaOHSyBeh8XlJINY4frGAsHVuE/9aQhDpqgEcx+8VaFR4RR5G00
         WtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775048633; x=1775653433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/lioYAC4GUA58SdhE5ceGXkvUy8ColhOQryMEBxi4k=;
        b=Si+jeFlkM8VYP08uq4rulUGbNFHgOXzvRVIImF2GOLNOUSRdWv0R4dkrezSEt+dJ5i
         DsML0MCRbOQesrXvmkR988WabMYTMaZq3ugneeotDUVJACihnXaBwzDZ1YjCSXro9pk4
         R9tIu1VpfWqN+3DRCaRxkzLAoaQW7P7ZsqxIKYB98GPe4QLyVnf1VdqbZoNbmCApp4zG
         xGXjIe+DnsLZ/b3m6E0w/c+xB6qaiI9vB/akYyeMNIIPkAAGYrFY8QMq99Xm9V3x6qo8
         JMrglRd7HcKsiBgy5ScGmbdBXyV3mGucPiFmSa7c2l8mhuBJe5WgYdwm1U6E3/xI/xV3
         6asA==
X-Forwarded-Encrypted: i=1; AJvYcCV0j5hWxgFH4VdyU5BryWRBqgMI4D7rEOgN4Ax23DgHIzDEe2cZ3Ep45+oAHiOhBVXS4WsbHoyw0lM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6JxdvqGV7bO9A0p1l+SjmOMjpBuegb6An/kNCr+kVneL4/zCA
	4auAdhSbIHIViVNyVqpTyvU4v/khber6tTliFMv1JZWH2g8rb+lqnhA15wBza2AHAg==
X-Gm-Gg: ATEYQzxQqJDCSUK3Vre7ycZBbMBjLDb8EEhXRXOrF6NLnAnmD+HRSoXkdzGEXrk7Cj1
	E8vq5GfH2dI6NGOCFO8gPElSRvtpBvNGIYoOGWaZLvIR41Pfr9+kfKjEN86WzNZKesCgrPhMpw/
	sWIunnVoFZDPM8xSnasJ0OYx6d2f0xENAJrInWvzqEMy72fjFV5GU/OrQlFtIPBMc5PueYE1fAS
	OFBN7iDICLZ/Vkbx/wqj0IdBDd695asMZcFpF6cTclu1bY9KphyJuZXWWT4HA9zXe5RPKWoHIP4
	hDcLslnPFxOw9TI8Eg2mxEFikgg59qnqZ1BJ2It6P6CsAoq//vN1N+dQbxdZ7pyOBCSKmTWfGFV
	KuG051fPR1QsUIxHxdm0T5u1CBBHovPVTODSZrJgp4G11r1XLySbLWOFp/SHrNg8nywrD5WcpxQ
	JS24tjNjv+ZV39IMbLywSWSL7bn7DdC/4bAHp2XxtYoOZztHTfBltiVowx6GGC96lNlMuTRW7u5
	fs/lioprL3ra4Q=
X-Received: by 2002:a05:600c:3baa:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-4888359ce97mr59716455e9.14.1775048632521;
        Wed, 01 Apr 2026 06:03:52 -0700 (PDT)
Message-ID: <ca934061-f3e2-4511-bdad-465c4f2d0de1@suse.com>
Date: Wed, 1 Apr 2026 15:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arinc653: don't assume Dom0 is the control domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
 <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
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
In-Reply-To: <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1775048633-5515D152-7A2A2607/0/0
X-purgate-type: clean
X-purgate-size: 2600
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BEDFE37AE97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 14:57, Jürgen Groß wrote:
> On 01.04.26 14:29, Jan Beulich wrote:
>> Leaving aside highly disaggregated environments, the control domain is
>> what will invoke XEN_SYSCTL_SCHEDOP_putinfo. Its vCPU-s therefore need to
>> be able to run unconditionally, not those of the domain with ID 0 (which
>> may not exist at all).
>>
>> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> There being no "else" to the if(), what about other control domain vCPU-s?
> 
> I guess this is a stale leftover. Doesn't matter for committing anyway.
> 
>> ---
>> v3: Don't mistakenly include the idle domain.
>> v2: New.
>>
>> --- a/xen/common/sched/arinc653.c
>> +++ b/xen/common/sched/arinc653.c
>> @@ -411,10 +411,10 @@ a653sched_alloc_udata(const struct sched
>>       spin_lock_irqsave(&sched_priv->lock, flags);
>>   
>>       /*
>> -     * Add every one of dom0's units to the schedule, as long as there are
>> -     * slots available.
>> +     * Add every one of the control domain's units to the schedule, as long as
>> +     * there are slots available.
>>        */
>> -    if ( unit->domain->domain_id == 0 )
>> +    if ( is_control_domain(unit->domain) && !is_idle_domain(unit->domain) )
>>       {
>>           entry = sched_priv->num_schedule_entries;
>>   
> 
> Hmm, is it really the control domain only which wants to be scheduled initially?
> I would think that at least the hardware domain and probably a Xenstore domain
> would want to be included, too.
> 
> In the end it might even be that other domains created via dom0less would want
> to be able to run initially. They could be part of a mandatory infrastructure.
> Why would they need to be created at boot if they are NOT important?

This part is easy to answer: Because in a dom0less setup you simply may have
no toolstack at all. (At which point there may also be nothing to set a
schedule, yes.)

> The question is whether the arinc653 scheduler is really meant for such setups.
> OTOH just modifying the test to:
> 
>      if ( system_state < SYS_STATE_active &&
>           unit->domain->domain_id < DOMID_FIRST_RESERVED )
> 
> seems to be fine for catching all those cases.
> 
> With or without this modification:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks, yet I'll have to leave to the maintainers to decide which form it
should ultimately take. One remark: A restartable control domain wouldn't
pass that conditional. Granted that's looking far into the future.

Jan

