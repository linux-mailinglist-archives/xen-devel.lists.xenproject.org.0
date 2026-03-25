Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL4aIszuw2k1vAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:18:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98723269E6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262430.1554937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5P3e-0003pv-Du; Wed, 25 Mar 2026 14:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262430.1554937; Wed, 25 Mar 2026 14:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5P3e-0003nS-AU; Wed, 25 Mar 2026 14:18:06 +0000
Received: by outflank-mailman (input) for mailman id 1262430;
 Wed, 25 Mar 2026 14:18:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5P3c-0003nM-K3
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:18:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5P3b-00GQFb-W6
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:18:04 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3ee8f-2eae-0a2a0a5409dd-0a2a4505dc9c-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:18:03 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3ee9b-5aeb-0a2a45050019-d155802fdde7-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:18:03 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486fd5360d4so29173895e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:18:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871728a19dsm49635665e9.1.2026.03.25.07.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 07:18:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1774448283; x=1775053083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nMa517r3rqrOKroxl3qfk1vcKX0SLtgxKamRzDe99k4=;
        b=fSGN6dSJfIptNClIjPbdlRdfqFXSkU9j5oMpvXVrjsviBS8/QhfK1c42lBbnLu35fw
         gO+m9lXOZBvd9T8IYl1Kwj86k9UstukkS4nNAgRFr9L0b6LVmjqrT4cPIyviqjt0MYY6
         LuM2nYE6W51pm239WqjhpjsYaYJTNDWezH1d0EHtD9DyFEBBCaQGyOaz99HSyRrreWjp
         hxcLrhXUyfOjBIAOTIOtuXMnWwl2lcM4AnZLP6/4S+R0qsYT7wInTgKym02r+aU2/t7W
         Q3K8B2I9cEsEzoHiEX2okDDlJ7cBfECKtI2YqMigx2PqP4ZMEcGNYdqb+se7H2RKQZVP
         DWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448283; x=1775053083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMa517r3rqrOKroxl3qfk1vcKX0SLtgxKamRzDe99k4=;
        b=Dmkh+yU4/L3+eQMXvF+EGTYBm7g1dgklJG52K5Lor7uCla/kUcCVREigzJwZy1LJV8
         ENIZneBNx/etu466wUOMz+SNiECs4/TZrgOfOGb+Hc8kNEA9PRNrUdDKfS8t2Q88qPMA
         4ziMD59chxO0QOg5Msf5HIPzv0wJGuufz4WxED+gBLKIq+5wWWlVt04oT665gP6PCbES
         03JlYjX6l5A9CjJsZDrcGPBOXnC21JgCwIoVSr9n0zqEGA2vBRAtdnLi8FbXJkqg9NMy
         E3h/eQIWghJS4ZYcMZ+ULzURDOyychSkBOS5GvcpUrxoCnJiy6TAiB1DSdu7KDiDc0lg
         WNLw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3pVmF8jDJJcWcYWH3BkYsX/HUIlYfSEhgJD+VnjK8tNZuNoEXr235xLyfKVQDpfe4UExgVkzHLo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycifkSyUYj+6JUwNOYQJAZfJMXdFjLiyK0voYdS4OsVdDAktyT
	9XZUeE+zCK6R/GBN/Un4vYiNvcv49ZueMwuuP030mYNRwwJSLtfaDqa+VbTqi2KM0Q==
X-Gm-Gg: ATEYQzwUxxh9OJE+9n1FkBu8fDCq5OJUWvToPZJFL7yQUZ006BmEEXBkQE+9hnZIK1O
	fNj0PHOFknGR0BOCAVhdcN2cXht2enTuK0dNUaL2OjTSBXUQW4eNSw3j/31zTaOHiwFtcd9fztq
	KW24KxVS6eJUlc7hEuMnF0iPMMDHTO5Kgn9XsS7wHvFPGtAZsVH6GEPauaqPb9FZ/6GekWoVliq
	VkhQwxqmVLxODJuQzIghLye77FnQ8cWg4CD7zhgwXQ1pn+MAixlBg3qLtdPbu1AijqQHQkBbOJc
	6+znK5bobGeLPBCOcCOZEKXDhkUZwf877XHWj4sEYyYNX79oLbXztdTIfxeWyidRltPIeVqvzSr
	gufkQ1P18IyAZCd8PkQBhKnlQ9O7T2XgNyGNfxWRr5RYR+zKMwaZtH697GkKMGmW6oItRfcGA8b
	gpGRhaSiVlfUA5dWzhy3NCvXNKBaKZnfQvoDibDU0xCmqaT3waoyWeawuKJxb3D61+uj2o3UOEp
	y0ZX9Ho4mRhWZY=
X-Received: by 2002:a05:600c:4e50:b0:485:40ed:2d1 with SMTP id 5b1f17b1804b1-48716051d3fmr61554365e9.17.1774448282945;
        Wed, 25 Mar 2026 07:18:02 -0700 (PDT)
Message-ID: <d7af5c2d-f700-4a16-bc55-750cd7f5ba1b@suse.com>
Date: Wed, 25 Mar 2026 15:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arinc653: don't assume Dom0 is the control domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
 <e0031df1-12a6-4459-a670-fbcbca13368a@suse.com>
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
In-Reply-To: <e0031df1-12a6-4459-a670-fbcbca13368a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774448283-20896488-4EFEADE0/0/0
X-purgate-type: clean
X-purgate-size: 1839
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
X-Rspamd-Queue-Id: C98723269E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 14:38, Jürgen Groß wrote:
> On 25.03.26 13:54, Jan Beulich wrote:
>> Leaving aside highly disaggregated environments, the control domain is
>> what will invoke XEN_SYSCTL_SCHEDOP_putinfo. Its vCPU-s therefore need to
>> be able to run unconditionally, not those of the domain with ID 0 (which
>> may not exist at all).
>>
>> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks.

>> ---
>> There being no "else" to the if(), what about other control domain vCPU-s?
> 
> a653sched_alloc_udata() is called for all units of a domain.

Yes, and what if for the last few no vacant slot is available? With one vCPU
per unit and Dom0 having 65 vCPU-s, this would already be a problem aiui.
And ARINC653_MAX_DOMAINS_PER_SCHEDULE can't even be changed easily, as it's
baked into the sysctl public header (when such an upper bound should really
be an implementation detail, maybe a Kconfig setting). Yet then even the
"DOMAINS" in the name is confusing, when it limits the number of units which
can be dealt with.

Imo at the very, very least not being able to deal with all Dom0 / ctldom
vCPU-s should be logged.

>> And why are they added to all scheduler instances?
> 
> What do you mean with "added to all scheduler instances"?
> 
> a653sched_alloc_udata() will be called only for the units of a domain being
> in the instance (i.e. cpupool) designated by the ops parameter.

Perhaps the question is a result of me being confused. My understanding was
that a653sched_alloc_udata() is supposed to be setting up per-unit data,
not per-scheduler instance stuff. Yet the latter is what looks to be
happening in the Dom0 (now control-domain) specific block of code.

Jan

