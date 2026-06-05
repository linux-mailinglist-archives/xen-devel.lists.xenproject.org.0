Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jR7oAr14ImoBYAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:20:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A6C645E35
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:20:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Gkr1FKbg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329030.1593237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOqj-0000WZ-0H; Fri, 05 Jun 2026 07:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329030.1593237; Fri, 05 Jun 2026 07:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOqi-0000Tq-Tm; Fri, 05 Jun 2026 07:20:12 +0000
Received: by outflank-mailman (input) for mailman id 1329030;
 Fri, 05 Jun 2026 07:20:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wVOqi-0000Tk-0K
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:20:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVOqh-006XI7-Cs
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:20:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a22789c-bab6-0a2a0a5309dd-0a2a4502c0fa-36
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:20:11 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a2278a9-af86-0a2a45020019-d155802ed8ce-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:20:10 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490b9318997so11162685e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:20:10 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm25182125f8f.36.2026.06.05.00.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:20:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780644009; x=1781248809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UeclX51Ov2Cs3NN2W7lnINiU79hjaTEGpDH2kL6sC7c=;
        b=Gkr1FKbgbK6iUaRZW0XHpM1B0k9gTeEkips0jkNGqH5Hq3Z0imDQmTR0il+LcczkiI
         AIICkdbczM7KdieJfCpbrHp0CJi41PMJmtCSYHuK6+2hDpN8CBBBHTt/htWu37+4tCGf
         n6h8JJ+QFs0i4jZFBZ/uNeGo1voiDMREEQUXf4lIJdjyd9/c9f82C8d3o9JcgrvzXq74
         P5Ygj98yvQKi/1dxtclSSPRa9pRHZYqKnbCpD/laYJs1LUhd1rRMuk1nZEauaJ0rwRff
         CbYQQRLvN4paZEQgFVoHJGE38GjLDvNadP1mf/1mfL78cyCJy0XdI/DAo6d5K7sPQ3ng
         UKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644009; x=1781248809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UeclX51Ov2Cs3NN2W7lnINiU79hjaTEGpDH2kL6sC7c=;
        b=VMWnyvpsGgCPfT425b3Fz4ydX31WQq1OM919Hmd8z02daFnS+Mrt0OTBw8s+3WYEKY
         Xeq1pNm5FWTYWnrbuqpKYWjP3Wt+3DaS19k1mMFPHZYhr+hZU1v3B1HBN7gSor3cfyYP
         7TMAePAVpb02xN45cIlzMjoOzpw6iO1lQRCePkieQi+CHf9OKiDDoOSnWEDFRWhg2gEf
         rCrzwFp9Knpy7iYJQW6g1RD15gcr9MSzcEvpsMnKhvNlhUsCi9XnMKtp7KFOu1BwWjCi
         /9ACqQ+iJNWzsegD1NrsdNYgEvYZF2rnzYtAYTaAa0sJGPmL2LgtEMRP0a8/D7STbj3/
         3sKQ==
X-Gm-Message-State: AOJu0YxKChlIiMXVcRvMS3xJdoqbSeCp8t3w78hOwCyWNBNAkj1CeyKc
	h7DpcmsF8Mi4g/fVAI5gS2YZ21gce3p+DBghBkZIyOVeptdaswfan13J
X-Gm-Gg: Acq92OG/3MzY9GbE9iyK2KvpQVsrHRSbKFbQdSngehV3JZeRiD5ZxREprU5Pkv2KqUc
	HQfbYUflE4Rr2UqxPcUtcQB84ky2BCB6h4T2FeFOdHN1A2YdCvSexsAjWHl73dFzZ7ib3JMhNKE
	p3YuosXHsoMB2IHQirTQZzHo3VYxIkMkTA8H/4wP2iXIe3bSa0F9xPYySxJbB1mOJz5F5XEWDNA
	FxUjHiWpBQYwus3J3irBa1kUcqzQc2y1DRBhUyltzNxNF3y9JkksZF7X0JquI1mLiikMXH5L1BQ
	f0+/+eKFwGfZGY5ssPNsbB1EAS6kBGyFo6fZS6tB57JOzVKDfxdFxByvyG2kDIm0w5UV2Qmnqgw
	dSpmay/kWuasCidn2lAKL5Sqj1hxXl3v0nZahLFIE286bDLwV8nTR9Ut9yPAcSNY8AtNfISz+KM
	TvyJGGADcbTIVxBTAhNkyqTuRhl2Od58awMtHDfLj3HbuT+HQ=
X-Received: by 2002:a05:600c:6087:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490c25b0231mr31282105e9.11.1780644009217;
        Fri, 05 Jun 2026 00:20:09 -0700 (PDT)
Message-ID: <255cd553-a519-42e8-a28a-9e4b08fb245a@gmail.com>
Date: Fri, 5 Jun 2026 10:20:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 1/4] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
 <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <a2f1164d-ade6-4355-95da-f8c246613e9f@gmail.com>
 <CAGeoDV9PfXYNDCOWv7HYUi8-C-27rwFOXxZVcsG3UvKdLt0FHA@mail.gmail.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <CAGeoDV9PfXYNDCOWv7HYUi8-C-27rwFOXxZVcsG3UvKdLt0FHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780644010-82F6E161-19A3425B/0/0
X-purgate-type: clean
X-purgate-size: 7455
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.xenproject.org,epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,patchew.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64A6C645E35



On 6/5/26 09:28, Mykola Kvach wrote:
> Hi Oleksandr,

Hello Mykola

> 
> Thanks for the review.
> 
> On Wed, Jun 3, 2026 at 2:19 PM Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>>
>>
>>
>> On 5/28/26 03:25, Mykola Kvach wrote:
>>
>> Hello Mykola
>>
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> gicv3_lpi_init_host_lpis() allocates host LPI state, including the
>>> host LPI lookup table, CPU notifier state and the boot CPU pending table.
>>> Those allocations use gicv3_its_get_memflags().
>>>
>>> ITS workarounds are discovered from gicv3_its_init(), so allocating host
>>> LPI state from gicv3_dist_init() can happen before the memory restrictions
>>> required by the ITS are known. On affected systems this can leave
>>> Redistributor LPI state allocated and programmed with the default memory
>>> policy.
>>>
>>> Move host LPI initialization after gicv3_its_init(), and only run it when
>>> a host ITS was found. The old call ignored the return value. Now that the
>>> call is made from gicv3_init(), check it and panic on failure because
>>> Redistributor LPI initialization relies on that state being available.
>>>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> Changes in v2:
>>> - Replace the v1 ITS pre-initialization hook with the less invasive
>>>     approach suggested during review: move the existing host LPI
>>>     initialization after gicv3_its_init().
>>
>>
>> Just for the context: The original review suggestion [1] was to consider
>> splitting gicv3_lpi_init_host_lpis() and defer only the portions that
>> depend on ITS quirks being known, specifically the allocation of the
>> per-CPU pending table for the boot CPU (gicv3_lpi_allocate_pendtable),
>> which is the actual consumer of gicv3_its_get_memflags(). But here, the
>> whole gicv3_lpi_init_host_lpis() is moved, so the scope of the deferral
>> is broader.
>>
>> [1]
>> https://patchew.org/Xen/cover.1774431310.git.mykola._5Fkvach@epam.com/a7732487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola._5Fkvach@epam.com/
>>
>>> - Check gicv3_lpi_init_host_lpis() and panic on failure, matching the fatal
>>>     nature of host LPI setup once ITS initialization succeeded.
>>
>> So, this patch appears to fix two distinct issues:
>>
>> - ordering issue (LPI init occurring before ITS quirks are known)
>> - unchecked return value from gicv3_lpi_init_host_lpis()
>>
>> Should these warrant Fixes: tag(s)?
> 
> Yes, I agree that the patch should carry Fixes tags.
> 
> For the ordering issue, I think the relevant tag is:
> 
> Fixes: 751ec850ec1d ("ARM: ITS: implement quirks and add support for
> Renesas Gen4 ITS")
> 
> For the ignored return value, I think the first commit where this became
> observable is:
> 
> Fixes: dcb6cb263689 ("ARM: GICv3 ITS: introduce host LPI array")
> 
> The original call site already ignored the return value, but at that
> point gicv3_lpi_init_host_lpis() could not fail in practice.
> dcb6cb263689 introduced the host LPI array allocation and made the
> function return -ENOMEM, so the ignored return value became meaningful
> there. Later, 69589c374a92 added another meaningful failure path through
> the boot CPU pending-table allocation, but dcb6cb263689 seems to be the
> earliest commit where the return value became relevant.
> 
>>
>>
>>> ---
>>>    xen/arch/arm/gic-v3.c | 14 +++++++++++---
>>>    1 file changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index 17ff85ef5d..acdac22953 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -764,9 +764,6 @@ static void __init gicv3_dist_init(void)
>>>        type = readl_relaxed(GICD + GICD_TYPER);
>>>        nr_lines = 32 * ((type & GICD_TYPE_LINES) + 1);
>>>
>>> -    if ( type & GICD_TYPE_LPIS )
>>> -        gicv3_lpi_init_host_lpis(GICD_TYPE_ID_BITS(type));
>>> -
>>>        /* Only 1020 interrupts are supported */
>>>        nr_lines = min(1020U, nr_lines);
>>>        gicv3_info.nr_lines = nr_lines;
>>> @@ -1990,6 +1987,17 @@ static int __init gicv3_init(void)
>>>            res = gicv3_its_init();
>>>            if ( res )
>>>                panic("GICv3: ITS: initialization failed: %d\n", res);
>>> +
>>> +        /*
>>> +         * Host LPI allocation uses ITS-derived memory attributes, so defer it
>>> +         * until after gicv3_its_init() has discovered ITS workarounds.
>>> +         */
>>> +        if ( gicv3_its_host_has_its() )
>>
>> This looks like a behaviour change. The condition is narrowed from "GICD
>> advertises LPI support" to "host ITS is present". As a result, on a
>> system where GICD_TYPE_LPIS is set but no ITS is present, LPI-specific
>> variables and data structures will no longer be initialized or
>> allocated. If I am not mistaken, software-generated LPIs without ITS
>> involvement are currently unsupported, so this change might be safe.
>> However, I think the commit message should explicitly document this
>> behaviour change and explain why it is safe.
> 
> Regarding the behaviour change: yes, it is intentional, and I agree that
> it should be documented in the commit message.
> 
> The patch narrows the condition from "GICD advertises LPIs" to "a host
> ITS was discovered". Xen currently has no supported LPI path without a
> host ITS: gicv3_lpi_init_rdist() already rejects that case with
> -ENODEV. Therefore, on systems where GICD_TYPE_LPIS is set but no host
> ITS is present, deferring and gating gicv3_lpi_init_host_lpis() only
> avoids allocating host LPI state which cannot be used by a supported Xen
> LPI path.
> 
> The CPU notifier is registered from gicv3_lpi_init_host_lpis() itself, so
> when host LPI initialization is skipped for the no-host-ITS case, the
> secondary-CPU pending-table allocation path is not enabled either.
> 
> I kept the whole gicv3_lpi_init_host_lpis() deferral in one piece to
> keep the 4.22 release fix small. Splitting out only the boot CPU
> pending-table allocation would be possible, but it would make the fix
> more invasive.
> 
> If the patch is otherwise acceptable, could the Fixes tags and the
> clarification below be folded into the commit message when applying it?
> Otherwise I can send a v3 of patch 1 only with just commit-message and
> trailer updates.
> 
> Suggested commit-message fold-in:
> 
> This also narrows the condition for host LPI initialization from
> "GICD advertises LPIs" to "a host ITS was discovered". This is
> intentional: Xen currently has no supported LPI path without a host ITS,
> and gicv3_lpi_init_rdist() already rejects that case with -ENODEV.
> Therefore, on systems where GICD_TYPE_LPIS is set but no host ITS is
> present, skipping gicv3_lpi_init_host_lpis() only avoids allocating host
> LPI state that cannot be used by a supported Xen LPI path.

Thanks, the justification is reasonable to me.

With the Fixes tags added and the suggested commit-message paragraph 
folded in:
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Regarding fold-in vs v3:
That is a maintainer preference question. Since only the commit message 
and trailers need updating, a fold-in at apply time might be efficient. 
However, I think that you still need the Arm maintainer's approval on 
the patch itself.

> 
> Best regards,
> Mykola


