Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAkINK+h1GlEwAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:18:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418473AA31A
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274446.1560553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9zlJ-0003H6-Jp; Tue, 07 Apr 2026 06:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274446.1560553; Tue, 07 Apr 2026 06:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9zlJ-0003F3-GS; Tue, 07 Apr 2026 06:18:09 +0000
Received: by outflank-mailman (input) for mailman id 1274446;
 Tue, 07 Apr 2026 06:18:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w9zlI-0003Ex-6H
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 06:18:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9zlH-00AdVx-Ic
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 08:18:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a181-2eae-0a2a0a5409dd-0a2a45078ba4-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:18:07 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a19f-ba2d-0a2a45070019-d1558032dcf1-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:18:07 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so8336695e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 23:18:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488b6ff70bcsm182479135e9.14.2026.04.06.23.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:18:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1775542687; x=1776147487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kcQFR3uT498ouHE205N7B6E8t/HZpBYCNaFWd85c+vY=;
        b=dPdpR11rz1CUu4NL1WbwEuYCeWLrJiQyFcOVC1ruqLf+YaYaZANYuFozbR6XuSx/IJ
         1mgXW42wgZcrN4iHeUbftkKw5kWwdCGxkUJZq57LmOGdX71OdBzWtybk+QxyztoilRdw
         AKF9Vt4oNy+/+DUFrK6U8A7DCj4zA5zPFLJLis5AmNVSrNxaTmgUDzWYrap+ZgoSAjkv
         yELcQANWf8ftJ/pC3yIYg0I5d33f0YI66POZk5sy0uvJ+5zV5F6MwUto8fIqrrJjvNTh
         l3IdRGS6rPwoizp6iqd1IvAd01Y5pnn7al386sxs1nSygpa8QK/xAhnxSplAP+RMktWP
         K4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775542687; x=1776147487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcQFR3uT498ouHE205N7B6E8t/HZpBYCNaFWd85c+vY=;
        b=i93atXPqxid2c9a+qz4fMYKeZeL80LF68cX8+20ccePjiNZFZ8f4dqLvw4fMmKY+0S
         4wOR1odV/wkZtvxROl6l47QUU1/ivxQcU4BXAsFOzTNClGQ3s1ubTKRv0dN+7/zM/cj1
         +/u9alADTlz+EcoiHdNLw1ao5g+WhKssykcghuoYKhZX4phoAq86rfKxOxocOs+uFSt4
         6WkCLMl35u2arUJoeIYbsC30aprya4BUiuMQdoTjdSVYxFKSb/O9+13uqjbCx+BVaAtv
         CxmcubXGxT9sNHFr0S+iaMqNgEsfbbXQYXlUMfNc0FcTfdc9jaDwA1CKOPN/D+7ubkP9
         oCNA==
X-Forwarded-Encrypted: i=1; AJvYcCVzCdxUt+YNZHJNa8NbTa21hv4UkH2J8eplD27r4HnqrL7HVSh1LiaXx8APFWWonvZRNQZe0sQvupI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUKCTPeVQmYGZMHDOU+5kg3F2duN/IBuGt3uXEZXVwzNvOhuI2
	TboAAuPPk+icG07RV7rQvi7sTTB0lwTIOjHe5ia1YQXdCtGzm6LJ0SV2VRT6Mud5sg==
X-Gm-Gg: AeBDiesG0PPFak+j0ZBxIZsWyyb2B9lMhM3qLHnaU6u90ZCsPgW4mRiux3c6lRYqKpl
	QXPsdmndK3zDJPVo4lJV/Rk/pOU5xjuF5/TJXlwg9ZogtGMshI0LIbxgWp4hbKNkeQNA8wLGKY+
	0YlW/ywb3tiHe83VGe9rRCeHWUQYNYPr/Oh7vW1pQ0o4UQOmPQdn4Y+rPUfx2d3Yj79ptPnbu8+
	iRYstPNpWrsL3/W9ffB8r5TWPbLkMQleqHBVobJrvevZMCdR4tIYC1Kl0w0g4huB9RBUkN3+Zjf
	gW0Gd9c11gkb2F6B6f3J8Y7y8z8eBYmhtYcTnhByOZ2O2XVLG3yMpI+gmFzP5isstLmVgliZFEA
	jiXJIBMSZTGJwLigUadzgWo1p/bETcRbM77m16UiozgwFi5uaZIf+0Mrkfd+3kFEunJdTdk8V9o
	FdeoidIRiM5tr5WGHPMuogGd/xFllYf3ufKp5uG8W6Wmp20IKCczKxSUkHhZKBwCAP0KEvbNS9W
	yBn/kLWsn0G4Zg=
X-Received: by 2002:a05:600c:a009:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488ab26986cmr116328825e9.15.1775542686718;
        Mon, 06 Apr 2026 23:18:06 -0700 (PDT)
Message-ID: <4dfd48a9-37c1-4f28-87f3-19646a339b08@suse.com>
Date: Tue, 7 Apr 2026 08:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arinc653: don't assume Dom0 is the control domain
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
 <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
 <ca934061-f3e2-4511-bdad-465c4f2d0de1@suse.com>
 <fa04f9e1-bc9e-4b34-84f4-dc7ca8999eb3@amd.com>
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
In-Reply-To: <fa04f9e1-bc9e-4b34-84f4-dc7ca8999eb3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775542687-10F5E41E-53F6A628/0/0
X-purgate-type: clean
X-purgate-size: 4508
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 418473AA31A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03.04.2026 10:47, Stewart Hildebrand wrote:
> On 4/1/26 09:03, Jan Beulich wrote:
>> On 01.04.2026 14:57, Jürgen Groß wrote:
>>> On 01.04.26 14:29, Jan Beulich wrote:
>>>> Leaving aside highly disaggregated environments, the control domain is
>>>> what will invoke XEN_SYSCTL_SCHEDOP_putinfo. Its vCPU-s therefore need to
>>>> be able to run unconditionally, not those of the domain with ID 0 (which
>>>> may not exist at all).
>>>>
>>>> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> There being no "else" to the if(), what about other control domain vCPU-s?
>>>
>>> I guess this is a stale leftover. Doesn't matter for committing anyway.
>>>
>>>> ---
>>>> v3: Don't mistakenly include the idle domain.
>>>> v2: New.
>>>>
>>>> --- a/xen/common/sched/arinc653.c
>>>> +++ b/xen/common/sched/arinc653.c
>>>> @@ -411,10 +411,10 @@ a653sched_alloc_udata(const struct sched
>>>>       spin_lock_irqsave(&sched_priv->lock, flags);
>>>>   
>>>>       /*
>>>> -     * Add every one of dom0's units to the schedule, as long as there are
>>>> -     * slots available.
>>>> +     * Add every one of the control domain's units to the schedule, as long as
>>>> +     * there are slots available.
>>>>        */
>>>> -    if ( unit->domain->domain_id == 0 )
>>>> +    if ( is_control_domain(unit->domain) && !is_idle_domain(unit->domain) )
>>>>       {
>>>>           entry = sched_priv->num_schedule_entries;
>>>>   
>>>
>>> Hmm, is it really the control domain only which wants to be scheduled initially?
>>> I would think that at least the hardware domain and probably a Xenstore domain
>>> would want to be included, too.
>>>
>>> In the end it might even be that other domains created via dom0less would want
>>> to be able to run initially. They could be part of a mandatory infrastructure.
>>> Why would they need to be created at boot if they are NOT important?
>>
>> This part is easy to answer: Because in a dom0less setup you simply may have
>> no toolstack at all. (At which point there may also be nothing to set a
>> schedule, yes.)
> 
> This is a known limitation. In a dom0less/hyperlaunch scenario, as future work,
> I would like to see the ability to configure the ARINC653 schedule in device
> tree, which would likely extend the existing boot time cpu pool work.
> 
>>> The question is whether the arinc653 scheduler is really meant for such setups.
>>> OTOH just modifying the test to:
>>>
>>>      if ( system_state < SYS_STATE_active &&
>>>           unit->domain->domain_id < DOMID_FIRST_RESERVED )
>>>
>>> seems to be fine for catching all those cases.
>>>
>>> With or without this modification:
>>>
>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>
>> Thanks, yet I'll have to leave to the maintainers to decide which form it
>> should ultimately take. One remark: A restartable control domain wouldn't
>> pass that conditional. Granted that's looking far into the future.
> 
> It may not be desirable to schedule domUs until the control domain has had a say
> in the matter, considering that the default schedule is unlikely to contain the
> desired minor frame runtimes. It's less clear whether to include hardware and
> xenstore domains in the default schedule, though I'm leaning toward only
> including the domain with ability to invoke XEN_SYSCTL_SCHEDOP_putinfo for now
> (i.e. the control domain).
> 
> Hm, the suggested 'system_state < SYS_STATE_active' check is possibly a good
> addition. This reinforces that the default schedule's purpose is merely to get a
> system booting until a user-provided schedule can be installed. Without this
> check, restarting the control domain could result in new entries being added
> while old entries remain, possibly ending up with duplicates and/or exhausting
> the schedule. However, the restarted domain would need to retain its uuid if it
> expects to be scheduled after restart.
> 
> Lastly, we may consider restricting the default schedule to Pool-0, and
> eventually we may want a mechanism to disable the default schedule altogether
> (e.g. when boot time cpupools are in use), but I don't think it's necessary to
> conflate those with the current patch.

So what does all of this mean for the patch here? Should I switch to Jürgen's
suggestion? Should I merely add the system_state check, but otherwise keep as
is? Or should I not change anything?

Jan

