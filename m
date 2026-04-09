Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBkDF6Pj12mzUQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 19:36:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75233CE351
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 19:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278037.1563057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAtHv-0008B0-4r; Thu, 09 Apr 2026 17:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278037.1563057; Thu, 09 Apr 2026 17:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAtHv-00088b-1n; Thu, 09 Apr 2026 17:35:31 +0000
Received: by outflank-mailman (input) for mailman id 1278037;
 Thu, 09 Apr 2026 17:35:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wAtHs-00088V-Ub
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:35:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAtHr-006HS6-U1
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 19:35:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69d7e35d-e002-0a2a0a5209dd-0a2a4508dba6-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 19:35:27 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <olekstysh@gmail.com>)
 id 69d7e35f-fab6-0a2a45080019-d1558032d454-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 19:35:27 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so11306795e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:35:27 -0700 (PDT)
Received: from [10.17.80.122] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3d4dbsm5917455e9.14.2026.04.09.10.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 10:35:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775756127; x=1776360927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zASOO5sUbm0qt4ARyAXDLmKxNyG8XSmbIY+ZXxkGWOw=;
        b=CV64k2KAK+FFO2rd0Fz/z4/Sir5jEyCjcXhWYFlMi6vD1ECcqbb0pw9212qNgYPq3G
         Mh02/wBsGA15OFBzJheqUgyBN6XyxlKvM42F4sfk6SU+u3k6XWsVUvIdZy0LGyNigf3G
         XaQzcCGS5dYx25mazT+XFunVCgpQmXHHD+n7TobV0NvwE2DSOpdQNLGBd3r2YlS9iztS
         /cic5JEz/rsStQbiwd20VK5/ejPk7lDJx7Rzj0lztG2RcAy5MTaV4QtwuTr0uvDyDfgK
         fMTQekkRwq28rFX4/XlYr5nYsa8HIg+8GwR1KqSp110wSKQKlFCj4mOUf4Aynf4BQ8Kh
         x2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756127; x=1776360927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zASOO5sUbm0qt4ARyAXDLmKxNyG8XSmbIY+ZXxkGWOw=;
        b=Si2TNClclQIwah2Ck09MwB0pdNmp2plZkGyOlNN57i3r5zLN2uDUOpMWQoEbX2fTYQ
         MQRL7n0996MnhoheesshXpQjWMFx1xJb47MUakuDA4yNVVEGSKgmkUDnuinvr6eE/fXN
         jJ7CIfCVSuuf6/zhxFBexDKYlNvOxU1yqFXSIx2AKwxZb5LhBJdAoCigUVZEgveoHUT4
         8dgClMO7z+omI65oioSUi5JqV/Rme+bXLdBlU2ZBIJMX3L302qzgfrvhXQGRhhkw5LxE
         353oujKJLTgTpkBY4LmCdwh69hBfP8ev4yhRJG0aPGe1at3R8KPssqxL2A2BMRQjZal+
         A3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMaLH00o8BxYB6py7+FnX9zhgsDOW+O1UhducO5R9w8U469X1UbFBLsFYWomw66FH8H5DY8bNwUlg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZ84RQ8361exHNJBLCUs8S+kSAIQazVxy1WG73e5dfXZxkHg0P
	huVeND1tR43dvXJaYv4g1JLvPtgug+PasK/E8bwDROfFRHmhQZXh0oiV
X-Gm-Gg: AeBDietEpjSQ2rAC8RGwDOdXicXwYwk0wtUhh25GSunsW8O04GmuHqc0WZ8Bab4aS3P
	82V+F9GJH3o/oYr28Y4KsjW3za0spNW6HPL+J+H+VKXXff/RWBUSM4vih4uU3LYi5jbldsSLNP6
	3ZW+Oy6MQfie6Cpkt4frm9kjEWr3GYSlgVJ+hxQHHOaGeOhpsBaPZXFAZj1vCFMW9UqmmcrNg8P
	mMYdxq5HJQ01NSfgQ2RxRrqrJVsmrd0O3bpxUlCTCPpsKkell+rFHGV6kgAuA3Nk/RLn8PYayY2
	I7V/C55kz1Be2kXhtazg0qBdQVZUHNAgof7VDQzJsL1dj8x78kiH2WAh1p0YciDgHHZeaaEXpcw
	2ES0qr75F4wFQJ4Ec/T5Nk5XK5OKcFx43snY412XwUyGLBLp4OLqEyBWN4uMTRoU4kmjwsy6jGy
	dudYhtlGSIM07/r9YsnTY8ji5RqmVbET7JC1MXMa3w7RN7Q+Px4h/RQc0=
X-Received: by 2002:a05:600c:4751:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488ccf3e8c2mr61648795e9.5.1775756127072;
        Thu, 09 Apr 2026 10:35:27 -0700 (PDT)
Message-ID: <29d475b6-405a-4859-bc96-57ea58eadbae@gmail.com>
Date: Thu, 9 Apr 2026 20:35:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] Kconfig: Make cpu hotplug configurable
To: Jan Beulich <jbeulich@suse.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <f3c523ef5b94e930902016d69b440032c9e6c3bd.1774871881.git.mykyta_poturai@epam.com>
 <e37330f7-96ca-41a9-81b1-14d7f3947dd6@suse.com>
 <00a42bdd-8d9b-4828-b789-8d6163c0314c@epam.com>
 <3bd1b2a8-475d-411a-bbe0-61b251079558@suse.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <3bd1b2a8-475d-411a-bbe0-61b251079558@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775756127-75F52497-0A35297E/0/0
X-purgate-type: clean
X-purgate-size: 2475
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A75233CE351
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/26 15:27, Jan Beulich wrote:
> On 08.04.2026 14:21, Mykyta Poturai wrote:

Hello all.

>> On 3/30/26 15:19, Jan Beulich wrote:
>>> On 30.03.2026 13:59, Mykyta Poturai wrote:
>>>> For the purposes of certification, we want as little code as possible to
>>>> be unconditionally compiled in. Make CPU hotplug and SMT operations
>>>> configurable to ease the process. This will also help with introducing
>>>> CPU hotplug on Arm, where it needs to be configurable.
>>>>
>>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>>
>>> Looks largely okay from a technical pov; one nit and one (repeated) remark
>>> below.
>>>
>>>> --- a/xen/arch/x86/sysctl.c
>>>> +++ b/xen/arch/x86/sysctl.c
>>>> @@ -53,6 +53,11 @@ static long cf_check smt_up_down_helper(void *data)
>>>>        unsigned int cpu, sibling_mask = boot_cpu_data.x86_num_siblings - 1;
>>>>        int ret = 0;
>>>>    
>>>> +    if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
>>>> +    {
>>>> +        ASSERT_UNREACHABLE();
>>>> +        return -EOPNOTSUPP;
>>>> +    }
>>>>        opt_smt = up;
>>>
>>> Another blank line above this one perhaps?
>>>
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>> @@ -637,6 +637,14 @@ config SYSTEM_SUSPEND
>>>>    
>>>>    	  If unsure, say N.
>>>>    
>>>> +config CPU_HOTPLUG
>>>> +	bool "CPU online/offline support"
>>>> +	depends on X86
>>>> +	default y
>>>> +	help
>>>> +	  Enable support for bringing CPUs online and offline at runtime. On
>>>> +	  X86 this is required for disabling SMT.
>>>
>>> The name of this option may need input from others; I'm not quite convinced
>>> that this is a good name, as there's no true "hot-plugging" involved here.
>>> IOW I fear the present name is misleading.
>>
>> My first idea was "CONFIG_RUNTIME_CPU_CONTROL" I can switch back to it.
> 
> I could live with that, for at least not being misleading. CPU_ONLINE or
> CPU_ONLINE_OFFLINE might be another option, possibly better suited to
> later become a dependency (select) of a true CPU_HOTPLUG. As said, input
> from others may be helpful.

To me, CONFIG_RUNTIME_CPU_CONTROL sounds a little bit vague. Although we 
are indeed controlling CPUs at runtime, "control" could also mean 
cpufreq, power management, affinity pinning. I think 
CONFIG_CPU_ONLINE_OFFLINE is more precise, as it is clear from the name 
that we are transitioning CPUs between online and offline states.


> 
> Jan
> 


