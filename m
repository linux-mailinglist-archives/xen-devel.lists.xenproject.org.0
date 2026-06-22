Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sjXdG7b+OGqGlAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 11:21:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA56AE293
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 11:21:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=L4ff1u5K;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1343565.1602837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbapq-00050D-2X; Mon, 22 Jun 2026 09:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343565.1602837; Mon, 22 Jun 2026 09:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbapp-0004xl-WA; Mon, 22 Jun 2026 09:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1343565;
 Mon, 22 Jun 2026 09:20:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wbapo-0004xe-Ho
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 09:20:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbapm-0079Mz-0v
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 11:20:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a38fe6b-2eae-0a2a0a5409dd-0a2a45038fa2-22
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 11:20:49 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a38fe71-a3da-0a2a45030019-d155802ab424-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 11:20:49 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso60015575e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 02:20:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240eef2basm298234975e9.2.2026.06.22.02.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 02:20:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782120049; x=1782724849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jQPD7uf8+s9nAQ5lrjXGt1Aniw5cX8rMp/0hsNVGmQ=;
        b=L4ff1u5KnzzvzjegCWX2NDQvqZeeTGo3ZePfz3F8P4SL2zXcsXcZOVBxWzLiydSwrn
         skRtcRz0r5WIrw4wW2dfPs6AudQVTMIXhP61U4DzthFemC8cTcK++/WzrnmejJ/ZuEyv
         TyDqs/siZ1Akugb2tYuEBduljbpbpnKzrOUyoXpM49sY+HYsPLwSEN/tGA/DfnxgNGUD
         43ocCe+u7zlnaBY+HqtSGeX699g4SmHE6Fqddv4xaALkWaUZUb69HRmiHjlcCyl1kkyg
         RTDhMO0gAW1cITY3+kJF+Zrvb9bXCXnYr8/M9Awxaif7rmTrFe7pmI2zLxCXTd7AlqZ5
         2EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120049; x=1782724849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jQPD7uf8+s9nAQ5lrjXGt1Aniw5cX8rMp/0hsNVGmQ=;
        b=ZqlJx+dzuyy6GJ4+o1xgegL9v9ML9cjOfksvRV3aASIS02fqaz5cIsJJO/RqTnYqLj
         MZ2B0reQEVkr7lVme/QDKaSv5kQE/fdlJXLDYdKCLBfTQp6kiN67eajsSOuiM+a79K0b
         royP8MwHx3yi5B/jtbzlj1B+QajryPY1T7UqLvtZy/31758Xduv9dKT77eDdTnoviIg5
         N/s6UAoSNlSmoMXRe6d6AFuWyRSFfLAhT26lT4iu1OdkMj7qlTK29yxL5nmhlpLgh9NZ
         7ouUAxh5xzlgeCorrvjz14GFky0qKYLDkznRUh+IZsX5IFvAXIHXlqZ+rdj1lnv9iotM
         62iQ==
X-Forwarded-Encrypted: i=1; AFNElJ/12yH11zUj0wrVjgwAauc1ciYMnFBT/nKMTyTF9MmGHvqEd2HuG92dtD5om7LDfQXs02tA0APyOuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLnGEBE4woPUb6yACr3AKfQ3ox98aWXf890eKATWG6WBjgOmwG
	H46VSsSgHvgFNZpg7x7wZvMM9Mpb7/8wEHcmsqik5KIS8u8SJZJAYb4H
X-Gm-Gg: AfdE7ck/SMW7FFlgWkOHUqotKy537s3LI6Hbrx1dNX2YnkHa2tNNxKvX+/zWpgIXuq9
	alcAYUY6Mo8EqDygItn5gTL8Lf9tpCGKrFYh+6YBTMhjT9qgzMu2lxrYakFobdXCBvVQNtrNSQx
	uRpmzYffBq+hziR3OAIgQwloEfdgR3rHW2yJGTPqe3P8yYSsCBnczmWF1JP3M3dLXVchtEu5+wS
	daLm975jS/MUPZJSZ9IYEX2fyMQ5IxxFrwzCSGj8mx8wX/2Lfmixeji1VbUIHaA4BUF+jxeBDbf
	n6ycekU4hFSJxXaKNhTA1crnhPvtcNwmvlxeTGykvTkJ2MrjHoW0ged2yiYKSfvxBugEPpNEaFk
	G5MKWOZ9KbZZ3Yxcf78V5W3Hv8HObRy5IeAn2DQGsA8eHnYWPXU3us2Q2TsTL4LBbTaZQcxJ8Xr
	/9o8D6CEh9eabgxk6BY4DK6v0BCl8zjvDEsY2BgMbNY4VQvvQfLh27U/+6yODp6QhoGBc=
X-Received: by 2002:a05:600c:1f8f:b0:492:3291:9011 with SMTP id 5b1f17b1804b1-4924257cbc4mr182647255e9.30.1782120049041;
        Mon, 22 Jun 2026 02:20:49 -0700 (PDT)
Message-ID: <6f5e13f5-cd6b-4f5c-88c8-73d3f39867a0@gmail.com>
Date: Mon, 22 Jun 2026 11:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Mykola Kvach <xakep.amatop@gmail.com>, Julien Grall <julien@xen.org>
Cc: "Orzel, Michal" <michal.orzel@amd.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
 <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com>
 <e43afc29-cfbb-4978-9324-e8d540040bfa@amd.com>
 <1877ea55-0c8d-4593-a310-259b4c5aef3c@xen.org>
 <b47b9bf3-1aa6-41b6-8c7c-48d64cca1c36@amd.com>
 <5d3dff74-f51d-4bfc-b917-3c84f2094f34@xen.org>
 <CAGeoDV_LM9hQch5YEqYFA07t76eXKxZRT5tzxMqzWkej5Jwidw@mail.gmail.com>
 <f06a4fe0-24a4-46e2-a7de-ede4e654f767@xen.org>
 <CAGeoDV_O0qBitauMC6saq6X6uijis2obpNVhJwKz+CSfkzPU3g@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAGeoDV_O0qBitauMC6saq6X6uijis2obpNVhJwKz+CSfkzPU3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782120049-CEE76D84-B4E020D6/10/73395122804
X-purgate-type: spam
X-purgate-size: 6531
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
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:julien@xen.org,m:michal.orzel@amd.com,m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:oleksandr_tyshchenko@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com,xen.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,xen.org:email,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEDA56AE293

Hello Mykola and Julien,


On 6/21/26 5:49 PM, Mykola Kvach wrote:
> Hi Julien,
> 
> Thanks.
> 
> On Fri, Jun 19, 2026 at 8:23 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 19/06/2026 15:55, Mykola Kvach wrote:
>>> Hi Julien, Oleksii,
>>>
>>> On Fri, Jun 19, 2026 at 2:52 PM Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 19/06/2026 12:34, Orzel, Michal wrote:
>>>>>
>>>>>
>>>>> On 19-Jun-26 13:23, Julien Grall wrote:
>>>>>> Hi Michal,
>>>>>>
>>>>>> On 19/06/2026 10:48, Orzel, Michal wrote:
>>>>>>> @Oleksii, can we ask for a release ack here?
>>>>>>
>>>>>> Can you explain the pros/cons of introducing this patch quite late?
>>>>> The advantage is that it fixes the broken LPIs on affected hardware.
>>>>
>>>>    > The disadvantage is the reordering risk but I don't think there is
>>>> any issue.
>>>>
>>>> See more below.
>>>>>>
>>>>>> One of the risk here is that we are now initializing the LPIs *after*
>>>>>> the ITSes. I understand this is because we want to know the workaround.
>>>>>> However, I vaguely recall that there was a dependency in the
>>>>>> configuration. So are we confident the new ordering will not bring other
>>>>>> issues? Ideally this should have been explained in the commit message.
>>>>> gic-v3-its.c never references host LPI state, so ITS init has no dependency on LPIs.
>>>>
>>>> My concern is at the HW level. The ITS is using LPIs. But we will
>>>> configure the ITS first and then the LPIs.
>>>>
>>>> What probaly saves us is the fact gicv3_lpi_init_host_lpis() only seem
>>>> to allocate memory. This is a bit fragile though.
>>>
>>> Regarding the ordering concern, the only operation moved by this patch
>>> is gicv3_lpi_init_host_lpis(). It does not program either the
>>> Redistributor or the ITS. It initializes Xen-side host LPI bookkeeping,
>>> registers the CPU notifier, and allocates the boot CPU pending table.
>>>
>>> gicv3_its_init() programs the ITS tables and command queue and enables
>>> the ITS, but Xen does not enqueue any ITS command there. The first
>>> MAPC/SYNC commands are issued by gicv3_its_setup_collection().
>>>
>>> The relevant hardware-visible sequence in gicv3_cpu_init() therefore
>>> remains:
>>>
>>>       gicv3_lpi_init_rdist()       /* program PENDBASER/PROPBASER */
>>>       gicv3_enable_lpis()          /* set EnableLPIs, followed by wmb() */
>>>       gicv3_its_setup_collection() /* issue MAPC/SYNC */
>>>
>>> So the ordering introduced by 95604873cc is preserved: no MAPC command
>>> is submitted before GICR_PENDBASER/GICR_PROPBASER have been programmed
>>> and the write setting GICR_CTLR.EnableLPIs has been made visible.
>>>
>>> This matches the relevant architectural requirement: while
>>> GICR_CTLR.EnableLPIs is 0, ITS translation requests or commands
>>> involving LPIs in that Redistributor are ignored. This patch changes
>>> when the backing memory is allocated, not when the Redistributor is
>>> programmed or when the first ITS command is submitted.
>>>
>>> The benefit of taking this for 4.22 is that it fixes broken LPIs on
>>> systems where an ITS workaround changes the required memory attributes.
>>> The ordering-specific fragility is that this reasoning relies on
>>> gicv3_lpi_init_host_lpis() remaining allocation/bookkeeping-only. I
>>> agree that this implicit dependency should be documented explicitly.
>>>
>>> I will respin the commit message to describe this ordering and explain
>>> why the hardware-visible sequence is unchanged.
>>>
>>> Does this address your concern about taking the fix for 4.22?
>>
>> Thanks for the detailed explanation. As I wrote back to Oleksii, I think
>> the code could be re-architecture post-4.22.
> 
> For post-4.22, I agree with the proposed restructuring. I will take it
> into account when updating the follow-up quirk series, so that all ITS
> workarounds are queried before host LPI initialization and ITS
> activation.
> 
>>
>> For 4.22, no need to send a new patch. You could propose a new commit
>> message here and we update on merge.
> 
> For 4.22, I propose the following commit message:
> 
> xen/arm: gic: defer host LPI allocation until after ITS init
> 
> gicv3_lpi_init_host_lpis() initializes Xen-side host LPI bookkeeping,
> registers the CPU notifier, and allocates the boot CPU pending table.
> The pending table allocation uses gicv3_its_get_memflags().
> 
> ITS quirks are discovered by gicv3_its_init(), so allocating the boot
> CPU pending table from gicv3_dist_init() can happen before the memory
> restrictions required by the ITS are known. On affected systems this
> can leave the pending table allocated using the default memory policy.
> 
> Move host LPI initialization after gicv3_its_init(), and only run it
> when a host ITS was found. The old call ignored the return value. Now
> that the call is made from gicv3_init(), check it and panic on failure
> because Redistributor LPI initialization relies on that state being
> available.
> 
> Although this reorders host LPI bookkeeping with respect to ITS
> initialization, it does not change the hardware-visible LPI setup
> sequence. gicv3_lpi_init_host_lpis() does not program the
> Redistributor or submit any ITS commands. gicv3_cpu_init() still
> programs GICR_PENDBASER/GICR_PROPBASER via
> gicv3_lpi_init_rdist(), sets GICR_CTLR.EnableLPIs, and only then calls
> gicv3_its_setup_collection(), which submits the first MAPC/SYNC
> commands. Therefore, the ordering introduced by 95604873cc remains
> unchanged.
> 
> This also narrows the condition for host LPI initialization from
> "GICD advertises LPIs" to "a host ITS was discovered". This is
> intentional: Xen currently has no supported LPI path without a host
> ITS, and gicv3_lpi_init_rdist() already rejects that case with
> -ENODEV. Therefore, on systems where GICD_TYPE_LPIS is set but no host
> ITS is present, skipping gicv3_lpi_init_host_lpis() only avoids
> allocating host LPI state that cannot be used by a supported Xen LPI
> path.
> 
> Fixes: dcb6cb263689 ("ARM: GICv3 ITS: introduce host LPI array")
> Fixes: 751ec850ec1d ("ARM: ITS: implement quirks and add support for
> Renesas Gen4 ITS")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

