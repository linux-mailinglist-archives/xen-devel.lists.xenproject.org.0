Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S0ifBWKIImo2ZwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:27:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A81646628
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:27:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IspYfcSe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329200.1593408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPsw-0004yp-GM; Fri, 05 Jun 2026 08:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329200.1593408; Fri, 05 Jun 2026 08:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPsw-0004wA-Dk; Fri, 05 Jun 2026 08:26:34 +0000
Received: by outflank-mailman (input) for mailman id 1329200;
 Fri, 05 Jun 2026 08:26:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVPsu-0004w3-Nz
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:26:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPst-00D9vt-RI
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 10:26:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a228806-2eae-0a2a0a5409dd-0a2a450692d8-36
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:26:31 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a228837-7371-0a2a45060019-d155802eedbd-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:26:31 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so19126155e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:26:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3cc0f8sm139243495e9.8.2026.06.05.01.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 01:26:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780647991; x=1781252791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Qf2S8gr1WzOZZmkQqFOkBbOz1n4djtz5G90Rmnx0Zo=;
        b=IspYfcSetgOOGQLKxawMCJTWsOvrTgCl3SFLw2YIoDJ0wqP1Stm5JcqzBDPJqwIKVL
         KUzJ3bx/26cjuwDIDOyPxz3Ib9rMdIyajxj3CC5+Ai+6+yibym0hox1+8AZkMY7fXd9R
         SGxOuKoQ22H/yw5jUD9D3VTXM9LZmXaheNy5e2U3OS307QOLSLsmKdeEMBpwksV4HiM6
         xoCrAL2ZcfDySs4T1nVP1BQlghQ6ty0ozzvjqu0dbtZsGagnUfAWsTH7qbzNNXQBHFSM
         xDs8smwN5ArbclRLM++i+sESZB122wvVNgc9bYuINU/uP8wW79orgOjwmHuwo+JI9Z/v
         zq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647991; x=1781252791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Qf2S8gr1WzOZZmkQqFOkBbOz1n4djtz5G90Rmnx0Zo=;
        b=mqIHB+m9kC7cZe4oVcH5KRXOvLWeT43fYPSgecYJM1KOaEvQh1PXTc8ejrH9GPoTii
         R7DIdxa12WEd+8h9BGzfWBDfu1r0BDtY1Yazuox/lJtTxsV8eRP8IdGyWTDIzCrtdkp2
         0+0rrFQ+kxdg09CMfLhJ7UFJnSAKir4le9b0+0WEvuDCWN/fqcntp9ePo0FhTMwpTVPT
         VmqEUJErpwIAQz7oMJCqL2mmebgqsYcCKuBPzWIDVFyAGoWAhiIs3nh56SSX63dUndMp
         Xo/80+hh75mQGkbWTE4y57Ij8whopc1RRpivZkAnrur1wqYdeH6pHv01gkMF4NSeEj5t
         V7MA==
X-Forwarded-Encrypted: i=1; AFNElJ8mIcBaFL9kAt5e5Rp6Vc+S1MZjxgrL5LquyHpjrr7/YvMpR8r9dHyL1TQdyFEYM6GSGj8hGe0bLF4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6fUmQK1YXVoiNluzUWbuyt1dc+2W8xNldHClLNaHwh12U75Ad
	oL9wpA6ugIJfuZENoybggnvvX7+16NW1x+zHIRR3wd+ktM2YkhbGNyp/
X-Gm-Gg: Acq92OHrwoP/nrBs+S8WC6IpOkWR136kl8MUHpFKUTYm0ni9XwpfSJOzvomU0xnDomG
	5Csu9nFzDM4rQgMdVjc1GR19bC9+BMEcdbIKY1IhSjdFRdDrPzNmaNTIwPqKsqu0vnrrttJWCNH
	dbd4jXCLnRr0/QbwWS2LriosRMm4JWHeTTOr1mDYu/XSjq+GTMlkGhfXAhW2Kui8/Y3fVRILWo7
	7ZaF6amUX0a+A3CoUk9iM1eiSqKAouVAtxJ95eawXRtyLhyIQQNILK+erWT8+gTSA5I7mV/hFr5
	Q1SZ0XSydA3U0iuvssdW4IyHCZjXA1qG+62WoSBXOJ+i9VGW2n2st3bjb5Pa6GsKWHrO3JVmIfi
	JZ7ao9sn/iyBqE1PJw7TKmjSRwtjI4IRjcGhrDSyU1W76kI7qNDW2mPgBgpLVGRMzcVoeUSnMd3
	nDoSSKMKFxHRbPju8zXUk0hOe0EEOv7Bio7yPOlbDFUb7S+rvTCVivQpSObHbcDtRtV6mlvurc5
	yXoFwBU9S5qOZit
X-Received: by 2002:a05:600c:5246:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490c25ff39amr34236195e9.27.1780647991038;
        Fri, 05 Jun 2026 01:26:31 -0700 (PDT)
Message-ID: <b6e74456-c97e-469a-9d79-a387042a1b5e@gmail.com>
Date: Fri, 5 Jun 2026 10:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 0/2] xen/arm: validate hwdom first bank boot
 placement
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1780602987.git.mykola_kvach@epam.com>
 <6e35fc10-5281-4015-a5ad-78f8697aee95@gmail.com>
 <f9be2a2a-451a-47d3-9273-7cf5f242ad93@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f9be2a2a-451a-47d3-9273-7cf5f242ad93@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780647991-86D72D75-7CBA1F60/10/73395122804
X-purgate-type: spam
X-purgate-size: 2267
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
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,patchew.org:url,epam.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76A81646628



On 6/5/26 10:03 AM, Orzel, Michal wrote:
> 
> 
> On 05-Jun-26 10:00, Oleksii Kurochko wrote:
>> Hello Mykola,
>>
>> On 6/5/26 7:19 AM, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>
>> Just out of curiosity, is it okay that the email address listed here
>> differs from the one you're using to send patches? (By the way, nice
>> email address ;))
>>
>>>
>>> With LLC coloring enabled, the hardware domain memory is allocated by
>>> allocate_hwdom_memory() instead of relying on the fixed direct-map
>>> layout. Since de99f3263555 ("device-tree: Improve hwdom memory
>>> allocation for DMA"), the allocator prefers lower host regions, but the
>>> first-bank filter still only enforces the old 128MB heuristic.
>>>
>>> A low candidate bank can satisfy that heuristic while still being
>>> unsuitable for the Arm kernel/DTB/initrd placement rules. Split the Arm
>>> placement logic into reusable helpers first, then validate the candidate
>>> hardware-domain bank 0 against those helpers before allocating it.
>>>
>>> Changes in v2:
>>> - Split the previous single patch into a behavior-preserving Arm
>>>     placement refactoring and a separate hardware-domain first-bank fix.
>>> - Rename find_module_placement() and place_modules() to use DTB/initrd
>>>     terminology.
>>> - Pass ramend to find_dtb_initrd_placement().
>>> - Update the stale tools/libs/guest/xg_dom_arm.c reference.
>>>
>>> Link to v1:
>>>     https://patchew.org/Xen/4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola._5Fkvach@epam.com/
>>>
>>
>> I would like to clarify whether my understanding is correct.
>>
>> With LLC coloring enabled on ARM, the allocator could assign the
>> hardware domain a bank 0 that passes the size check but is unsuitable
>> for kernel/DTB/initrd placement. As a result, the hardware domain may
>> fail to boot or could silently corrupt memory if the images are placed
>> in an incorrect location.
>>
>> Is my understanding correct?
> Yes, Xen would fail to boot such domain. On Arm we carry a lot of placement
> logic we need to deal with...

Thanks for confirming. Then for this patch series:

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


