Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGqcOEIflGk1AAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 08:56:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A39A14974B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 08:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234619.1537800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsFwc-0007LE-Dt; Tue, 17 Feb 2026 07:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234619.1537800; Tue, 17 Feb 2026 07:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsFwc-0007J4-BF; Tue, 17 Feb 2026 07:56:30 +0000
Received: by outflank-mailman (input) for mailman id 1234619;
 Tue, 17 Feb 2026 07:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsFwa-0007Iw-LW
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 07:56:28 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a241af-0bd6-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 08:56:26 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so23225175e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 23:56:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac800esm34612079f8f.27.2026.02.16.23.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 23:56:24 -0800 (PST)
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
X-Inumbo-ID: 28a241af-0bd6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771314985; x=1771919785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f7lTYsFkhYZTmN/EA29x8fF4ioIArRgweTYYp2UPiqE=;
        b=NGtmaTTjZ+gfLrXsVjvNSmOQ5G7LzlLAAXhUul5cjKIYuWnFMK/mDfP99fDBeT7V64
         vmLXwnrrNjjW5iaExpLY7OCQ7EI/yhVZA5qZdYYUwNk4KxRVxD3KN2Ng1i42pcEfZaW7
         XeCOjJ4JzlSrieCLryXrEMCshSYJe0aM6lYGOQzYwD9kC1rYkNM3IaVdNyjQTOhnp1KU
         9cE2FySZPTKZTbrAvYDqzO/vT5PMAYMievOA3aTzU+hWBkgrj5PZfihYzAdRvUbtadxH
         6seZPCHkmIZB/kllE19/wtjvg0IXmgxVyFo93KDIWK6G6WiG4mi2dXdGo6//i8eyYt3h
         f4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314985; x=1771919785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7lTYsFkhYZTmN/EA29x8fF4ioIArRgweTYYp2UPiqE=;
        b=lUic9XACR4iEc92+RYJviYykrw0SNLiznTSLpsKcDmxH2jWYkCkYVzWMZWtLMWjl9t
         h+H0Rhkz/c2QcIoq/Xw8gXSNNnU/JROsRyep0tMjmB4Sde0wpJ4BSi90gI7+0HnM+ECw
         3ZTJaI34PxskHFQn7ujcqX/wfx2WIQTbDsxePjZw9o7//5KIXVCIO4q/lv6ZoSOA6KSX
         isoq7rUHnwacXjwLhyN89HlxxcJQiZNuHi09rH/V5K55mP32jlmv0lO83mPNUPLbkRBD
         P+xd7Whnp3wZY86Y8KjLwQzWM9IA3fANbKQF8/y45Td7ZqAf3KosuvRU0m8a+t37fZjX
         4oDA==
X-Forwarded-Encrypted: i=1; AJvYcCWf1B12wpr71iQ6rIUrqiK7PnIMCXMSkK2fEy5OalShK5eJ0gj+89h9VEHFzVtBRttoWez7MkS86bY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIW0JrkUCKg/UI4eGnNpuFGP6HXKH8Zlbpp2PPmnlVebnN582P
	dcwsbLz6SZXP1kqmZg4HljvxVEx6SSg/263MoKf+vT7Sop5PsWI0iEO3Mu2PFUhiTg==
X-Gm-Gg: AZuq6aJ7o4tK7okmIlRDzM2He5wExBwh1sIWItFbsE6p88ol1g9ekrpW2SEQfTKF6vT
	+yci+mxxpFzRpqB+ikFzuaHXvW5JEIqWumXj/Qy+EHiKsWQHJM+6G5h4hN6Fizz/oQFMw9D78Dm
	WSy2+g9RCE1DT18nE9TatbOoa0yJG4ANb+upNPb1iR+KreUR+9KoCxIyNgkGZ+7BH1wjL2rEAZJ
	3Or5KbC8H6uRG22QvFFO87dL4Z/AbR99XhhqiSrkXqmgHti6ebNxRtfRGAtYzuVcKaUHwBoIXFD
	lSRXiWUOJ7plZMq69a2oWxK2+aflYUXPMN3D5QIYMo/TSsEj34YP+OgvJmVY7UFGVpYy2/LPSLZ
	91LqmnRUfHNFnVI4ff3dS/Jc0+3uYXTiFl7fPtO4ux/mtTZZjhXCtgSX1R1IKwkeA5oi5kBJQ+Q
	ZybzyACErAb/y0ppq16btrspe5swO62d5LSZq7a3hbWRHDqyoKtDJ21RugF9TPc9Khzr70xTyyI
	WI3zCVah/2pdog=
X-Received: by 2002:a05:600c:6098:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-48379b9f286mr136756445e9.11.1771314985197;
        Mon, 16 Feb 2026 23:56:25 -0800 (PST)
Message-ID: <0f7e127d-9d53-4b32-8aad-bbf741a0e3ec@suse.com>
Date: Tue, 17 Feb 2026 08:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: move vmtrace_alloc_buffer() invocation in
 vcpu_create()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <528578e1-6374-4fd0-9f67-0769afd2e1c6@suse.com>
 <50c79874-d07e-479d-80c2-7c0694a0828e@citrix.com>
 <871a5922-9d7d-455b-8257-d583e3e47bc2@suse.com>
 <33498e90-dc3c-4763-a953-3ff9eccd2594@citrix.com>
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
In-Reply-To: <33498e90-dc3c-4763-a953-3ff9eccd2594@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:tamas@tklengyel.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5A39A14974B
X-Rspamd-Action: no action

On 16.02.2026 18:17, Andrew Cooper wrote:
> On 16/02/2026 4:39 pm, Jan Beulich wrote:
>> On 16.02.2026 17:29, Andrew Cooper wrote:
>>> On 16/02/2026 3:51 pm, Jan Beulich wrote:
>>>> The label used upon the function failing is wrong.
>>> Is it?  Which label do you think it ought to be?
>> fail_sched, as Roger did point out in reply to the original other patch.
>> After all ...
>>
>>>>  Instead of correcting
>>>> the label, move the invocation up a little, to also avoid it altogether
>>>> for the idle domain (where ->vmtrace_size would be zero, and hence the
>>>> function would bail right away anyway).
>>>>
>>>> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
>>>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -493,14 +493,14 @@ struct vcpu *vcpu_create(struct domain *
>>>>          set_bit(_VPF_down, &v->pause_flags);
>>>>          vcpu_info_reset(v);
>>>>          init_waitqueue_vcpu(v);
>>>> +
>>>> +        if ( vmtrace_alloc_buffer(v) != 0 )
>>>> +            goto fail_wq;
>>>>      }
>>>>  
>>>>      if ( sched_init_vcpu(v) != 0 )
>>>>          goto fail_wq;
>> ... this comes first, and ...
>>
>>>> -    if ( vmtrace_alloc_buffer(v) != 0 )
>>>> -        goto fail_wq;
>>>> -
>>>>      if ( arch_vcpu_create(v) != 0 )
>>>>          goto fail_sched;
>> ... here the correct label is used.
> 
> Eww, yes.  So multiple observations.
> 
> 1) This only functions in the first place because
> destroy_waitqueue_vcpu() is idempotent to v->waitqueue_vcpu being NULL
> which covers the idle case where init_waitqueue_vcpu() was never called.
> 
> 2) sched_destroy_vcpu() can be made idempotent against v->sched_unit.
> 
> Then we don't need multiple labels and this all gets a lot easier to
> untangle.

Yes, but as a backportable fix what I have here is the most suitable
first step, I'd say.

With what you suggest, I'd then want to check whether either or both of
the function invocations could move into vcpu_teardown(). At least for
destroy_waitqueue_vcpu() I can't really figure why it's called only in
complete_domain_destroy(); for sched_destroy_vcpu() it may well be that
it can't be done earlier. Or wait, looks like vm_event_cleanup() would
need moving up in domain_kill(). The comment there right now explains
why it can't be done later; it's not quite clear to me whether moving
it ahead of (or into) domain_teardown() would introduce any problems.
Tamas?

Jan

