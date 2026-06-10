Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S9lAJRRPKWppUgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:48:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01700668F25
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:48:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H1AuvL6p;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1334174.1597273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHPh-0005Xq-VS; Wed, 10 Jun 2026 11:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334174.1597273; Wed, 10 Jun 2026 11:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHPh-0005Vt-Sp; Wed, 10 Jun 2026 11:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1334174;
 Wed, 10 Jun 2026 11:48:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wXHPh-0005Vn-9G
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:48:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXHPg-00HNtC-Lq
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:48:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a294ef1-e002-0a2a0a5209dd-0a2a450b8322-18
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:48:04 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a294ef4-212f-0a2a450b0019-d155dd2ee4f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:48:04 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso3514689f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 04:48:04 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f2710sm55831289f8f.14.2026.06.10.04.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:48:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781092084; x=1781696884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=klKAI6eDIO5WBI16a8BB5I2aJDmDuSM0lhrEUoezX3A=;
        b=H1AuvL6pJ09lXaq3N7z+iyBbgvagrsxBBMeP+bx5KJWzZ4m0r374nF0Y6/Wq9l3vs1
         7xLLyre+h7aUZE68VQhyGmCwcyadefRNOvmHWbTfh7g53eMMvyUyMFlR/gVZNZONpcDA
         DaxiGxh0SbHil17AO/rZQxmgP5E3jHYG2DRDMZQ7mF9FRb2E+O5AT3N4UHLHrZyk545E
         EHNevJ9afjmbVmhIKHOUup/ljn44CfcI3maT1wc+XPlfyNMwGvUaNS/TldBIFEWyvVRc
         c0zl25ivcxYYdDws7+JAjX1f+S7vWLIRiNS0VBJCh+wGfoo37mO9+Ws/7pDgwfEFKpd8
         qOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092084; x=1781696884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klKAI6eDIO5WBI16a8BB5I2aJDmDuSM0lhrEUoezX3A=;
        b=sgUmaLRK66i16hyi8hgQw7mJBlqmOC2RbyHYtr6ug3QJwP0HtkHU1wQXJrrqAK+61o
         QNx/jzn9NDv0jwvXS7vaVwZPTS9vrdoVwBb/Z4D8QWqteBRKcGQjblDLxN9wzEjIhHum
         p2bMfwrdaCXu/xdr56lTRJIgcYumaVQPefS2aQt7I85aClKeelBJXazKDTed6VQWEYen
         vOiRaoSuVwGxiwoWcnbE6lfWWw47b3pO6msvivSwiGs3YFmbGwqSbXVqOdIaIUWlMa2c
         OXu/nn2cnNgrKAXwbRT2OUfDA6ezqabnUYiSMsTv3f21l6W9/Q+pGvAaNDbVN6QcHegS
         Hf5A==
X-Forwarded-Encrypted: i=1; AFNElJ+JnlKzR4DBXghkF6geCBFU1L3TtYgQyB53cmeFAmX9+ZPoEdUHWe+g6lHdbMPOvi1pyptZ0e+omjU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNk3x4avZKUbf0BdmL2uI9JLGpDZPTUl6O5locGECiUv820NZm
	TtfLuhayb0STjsEGOfzLPCwZG631eDJoVRNdbk2Y2gBY41cVDKhpdjEb
X-Gm-Gg: Acq92OE43bwbJMez1jXBgUKXa3hduufHxkU22/oR1Ja97ivSS4VlcIVUuyw18lcxXfF
	sbkI0+YKaPNGi/5jM1uU/gVYTflk4P+jhXB0UYv7I2gk/p1gxEcVVb+EPTkqa1y+d1fXiYfPsCP
	teIZIU7gUIQk4yka5UTRbKmTfthQYsik16FrruUpXlu9of0G+cqI1rvuiYPPRkS61rWVclYPheH
	EEZBZ3zUcr0MtKPBwEGlhmmVhNpI0iv/j4QX2Vrzbd3eAkclPfNoIJ/3SkefZ4H+iH3Ro4rpwS4
	jW1pNaKEY7V8jKUxO5AuqypdI0iuNipnma4nNeqTTahwc4K5hglMsfjrNRo3efqSJrlMrFnd6us
	os3QOspbgBaCnLLIKuTvexF1e6/u5KVxapKIJqbOYI+YXuQITYTkmgXzagjF+p6m2f9lkDSQf82
	cPRKTD5ZkiA/yzhntB5gfxWZ8O2PvZOc49jLce1I0q5VzFJyR7go78Rtky3+z5mbTKFnSEdOZnf
	Bp2z2zwQepHJxza
X-Received: by 2002:a05:6000:2081:b0:43b:4f86:e985 with SMTP id ffacd0b85a97d-4603075ded1mr42698738f8f.33.1781092083661;
        Wed, 10 Jun 2026 04:48:03 -0700 (PDT)
Message-ID: <e8827d99-c45d-44fa-9981-d012ab651891@gmail.com>
Date: Wed, 10 Jun 2026 13:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] domctl: Avoid taking domctl lock for certain ops
 used during migration
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <071947c5-00ad-45b5-b782-121ad2b7f919@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <071947c5-00ad-45b5-b782-121ad2b7f919@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781092084-2087FF3B-0B50F3DF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1430
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01700668F25



On 6/10/26 11:57 AM, Ross Lagerwall wrote:
> On 6/9/26 4:15 PM, Ross Lagerwall wrote:
>> When performing multiple migrations in parallel, the domctl lock may
>> become extremely contended:
>>
>> * Operations like "xl vcpu-list" were observed to take in excess of 20s
>>    to execute.
>> * The "clean" shadow op may pause the domain, restart with a
>>    continuation and then become blocked on the domctl lock, causing VM
>>    downtime in excess of 20 seconds.
>>
>> These issues can be fixed by not holding the domctl for the frequently
>> called operations during migration.
>>
>> Thanks
>>
>> Ross Lagerwall (2):
>>    domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock
>>    domctl: Handle some of XEN_DOMCTL_shadow_op without the domctl lock
>>
>>   xen/arch/x86/domctl.c    |  4 ++++
>>   xen/arch/x86/mm/paging.c |  8 ++++++--
>>   xen/common/domctl.c      | 13 +++++++++++++
>>   3 files changed, 23 insertions(+), 2 deletions(-)
>>
> 
> I'd like to request inclusion of this in 4.22 since it fixes a real
> customer issue we have observed and would have been posted some time ago
> but was delayed to avoid drawing attention to and colliding with
> XSA-492.

Considering this and performance improvements it would be really nice to 
have in in 4.22:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

