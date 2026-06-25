Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jc1KDbEOPWrrwQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:19:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C66C50E4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gelsSQTb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345497.1604348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wci6r-0000pV-Cd; Thu, 25 Jun 2026 11:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345497.1604348; Thu, 25 Jun 2026 11:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wci6r-0000n8-9Z; Thu, 25 Jun 2026 11:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1345497;
 Thu, 25 Jun 2026 11:19:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wci6p-0000lp-Rb
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:19:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wci6o-001ZnF-O2
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:19:02 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d0e98-2eae-0a2a0a5409dd-0a2a4504ea56-20
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:19:02 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d0ea6-a01d-0a2a45040019-d1558031bc72-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:19:02 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so15212365e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 04:19:02 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492660a32ddsm46324015e9.1.2026.06.25.04.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 04:19:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782386342; x=1782991142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCGi4Ypjo8NkCCu23rt75GsmtottTmFRUmirYlhxDHQ=;
        b=gelsSQTbMlj3QlPFNKx0mc+N/fsxXUtBm0f6pAlO8l/ajQ7NoMzoocNYMIQxnI24BC
         GANyMFUolpcmydJ/cT/ViGheyu9gvRovngc99eYJan4xatvQ04VaS3QIiVYV7h0bVd4m
         TyjgjmgzGxvyL8fDLN5RJ1PApx6pLVFh/fFPmhLinCYUMmbvbbpN6I4w8NOvxPbfGXPU
         7iY2YZuZX1ZjlTPxnqSMD+vfWf3+c4Y/a5hnsOFDd3fO5cHAP+fPy6JwSBafG1Q7/c8I
         uUPjMdMeaDQYa9sgDZjhAoMPYHCv48eYnSM60r8zhrldJXBVq2+WM4KlnspFlHDpPXpQ
         Yldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386342; x=1782991142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCGi4Ypjo8NkCCu23rt75GsmtottTmFRUmirYlhxDHQ=;
        b=I/MDpuO8PsaoXQNaxSUCyAjVpDE4B4Y5c5icTByBCuKqwBWTfTv+CQLTHM27K/xYTS
         TS/4lqH/SlieG4H2AhtrKFIMZqkHeSgDnIknDP7bvnr00UpHGXFDB876l2NsrKRlaltQ
         gJ7uZ7vf4cN27qe9RRqudqPFH+b6Md1oL5V0ZiBWRf2PFiOnJzwnFX5dNpSHA+PXxAf1
         0Ybxj0f2Du96BFmo0QWsjSKST6NZ+01UKDgCbUB8ZKfYkwrnZU8njsGu5KASUyQoCIRm
         OfQpVYzzKHy0u2ZmqMkftmBqxNctn3H8YuDmVlTQGpiMO5yJLe1rBx2h1CZgfiuVD/4j
         1K8g==
X-Forwarded-Encrypted: i=1; AFNElJ/ko7IevMlX7LYsNYBSmvfZF0HJvuwmQkEapK6Dn8cVpWNOgTAVjjglMgxm+9XzSbuJgnBowYq3HJQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx59d9KjSJjSPIN79iyG/UKWX3MqZsLHeTtnKWaQXV5pTbaiQNr
	KKzeRKOg+xPrZZ8J759PMUJT84kesRbZ+0LVOxPugM5+d4yJH3zXY8sj
X-Gm-Gg: AfdE7ckfXZBy9hXA5GIstSuU09UiVaae8r1BGi4TwkPMW15azxtYkEQmURceBM5NzRh
	11GQaWRNufm+JJad2zlLAVnutodgNW1zYUTGAnTfp5m+1tfNDZK751PD31+G/wJUx7XmYgwRCP6
	Fo+T1LRKkbUJCsWcBzx5wRBwwNvA+R4pV67jk2ywXhlDfEik9N8sB4aS4wFcJtRlYLLUpd/uJqi
	Zm+trmJHbZRx1YEtEnw7jdBTwXCd8HyiBUb2rssA8HM5nidMQG3wjlfHgmKH+pOQWVu/C0Zdas5
	lY5dFx7uFupvIsWi/UQw1+znAnoyy/fH7maDe6t0vWANpeZ+qJeIYznsHo4OjyMGCbEoK3GcWpp
	qbKtElNO6C4LSF2XldLHXXdj8wcyLysK+iqAJwDGd4bSzfgVzZG7r1zMmWJo6tEo0gXEaJO++gj
	VDVxn0tkKz7Y1YeGXY/+PPGMZrBFoj9zFP/ArTnOiM6fSHe0DOr9MN+I1/UvxIvEzwMZw=
X-Received: by 2002:a05:600c:4692:b0:490:4b89:535d with SMTP id 5b1f17b1804b1-492668677ebmr30114425e9.1.1782386341946;
        Thu, 25 Jun 2026 04:19:01 -0700 (PDT)
Message-ID: <e8fa36f3-e8ae-47a9-9f75-0b8f9a306a02@gmail.com>
Date: Thu, 25 Jun 2026 13:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
 <910ed097-10d8-41a2-9035-a3f10d60c214@gmail.com>
 <73452348-466c-462d-884e-f181fe12b293@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <73452348-466c-462d-884e-f181fe12b293@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782386342-2ED5D1CC-9243DC9B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1503
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 911C66C50E4



On 6/25/26 1:04 PM, Jan Beulich wrote:
> On 25.06.2026 12:50, Oleksii Kurochko wrote:
>> On 6/17/26 3:26 PM, Jan Beulich wrote:
>>>> +#define shared_info(d, field) \
>>>> +    (*(typeof(__shared_info(d, (d)->shared_info, field)) *)shared_info_absent())
>>> How about the simpler
>>>
>>> extern struct shared_info *shared_info_absent;
>>> #define shared_info(d, field) (shared_info_absent->field)
>>>
>>> ?
>>
>> This could lead to compilation error:
>>
>> common/domain.c: In function 'vcpu_info_reset':
>> common/domain.c:316:20: error: unused variable 'd' [-Werror=unused-variable]
>>     316 |     struct domain *d = v->domain;
>>         |                    ^
>> cc1: all warnings being treated as errors
> 
> #define shared_info(d, field) ((void)(d), shared_info_absent->field)
> 
> Which it should have been anyway, to make sure the first argument is evaluated.

I expected that as shared_info() is used as an lvalue whose address is 
taken (&shared_info(d, vcpu_info[...])). To "consume" d we can't just 
prepend a comma expression as &(comma_expr) is illegal since a comma 
result isn't an lvalue.

Trying what you suggested leads to:
common/domain.c: In function 'vcpu_info_reset':
common/domain.c:320:26: error: lvalue required as unary '&' operand
   320 |         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])

Thereby this option:
   #define shared_info(d, field) (*((void)(d), &shared_info_absent->field))
will be better.

~ Oleksii


