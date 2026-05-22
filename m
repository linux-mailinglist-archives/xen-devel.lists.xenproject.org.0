Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D1ECGwCEGqLSQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 09:14:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E330E5AFDF4
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 09:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316383.1585772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQK5f-0004zi-8F; Fri, 22 May 2026 07:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316383.1585772; Fri, 22 May 2026 07:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQK5f-0004wq-5S; Fri, 22 May 2026 07:14:39 +0000
Received: by outflank-mailman (input) for mailman id 1316383;
 Fri, 22 May 2026 07:14:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQK5e-0004wk-5f
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 07:14:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQK5d-005JNX-I0
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:14:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a10024c-bab6-0a2a0a5309dd-0a2a4507c526-38
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:14:37 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a10025d-229c-0a2a45070019-d155dd33bccd-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:14:37 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso3892774f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 00:14:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d49132sm1770497f8f.24.2026.05.22.00.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 00:14:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779434077; x=1780038877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BicD9TYxpHdVMRFLSDVpnuTrLVUpY+pOYydHNRXgQYg=;
        b=Ug2ZtriPURY580Y4fIC7hiWBQmGIkdoTYAqVY+pCy8ylhH6ml9+RNClbazmvi3ZBdv
         WuhjsAbwsvf8qF7uMxH90E6nLHi3cpPGCtJkixPg59W2p8k+RIFmjrDk7g+j1CxQyBLs
         I4g23Knk5paPMZw0qWmZVnqZJ7dPje/gtuakISZ8Gee+4qr41xRZPR4dSLAC3AHsbY6a
         FEGMIa7L0Yv/wMCTPe7ezLXdLDTIBjYwzvYUwDf0UoJUehe+KPxZXJSm4cLsVGjdYRyq
         uqqt/rIT5mqJAv+nBOHmE5gutDOW5PDDezOoCSxaO2loqLS48Pz4RG2EtF3xr5czL5hD
         zA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434077; x=1780038877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BicD9TYxpHdVMRFLSDVpnuTrLVUpY+pOYydHNRXgQYg=;
        b=FHXL1p4pBjPBNzYztsoPS3VCcRlQewxtUkL4b5zRMAorisFQnqLEnEIJCp3YBIYWnq
         HDCimK5w4LZ7vspoLrnh6nNXzZIBXtLcKxFSixIrI/IHY+R2+oXZpB7D0Os7b7tYVjCq
         GFpdg1RVOkTTcaC0jNQ/QyW9KTI03cjMehjrvttEm45h3tZZNPtLzfjbKIsiD0fLFGUZ
         X3PZatEQn+BPlmYQCAKZWV+Dlx6rZjudN1UIT6Ymv6GYtO5MYMc6KDUBOodrjWNVPNq/
         DH/9jqNpnIna6yIYixBokiNu8MjWdWqxhN+DhimtadSRbEvHpViLyaSguWkjQmDy2FlZ
         MOAw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZVEq5TFr0OvPXAfrZh4Q695FZK3OvT0Ks0snH3oPA1kaYyBgd0EW3HdsPYGvtp6KdHHmZvWYi6I8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqXOdY4tnoLwOEBTrJcpGsWuySxD1yEpui5vxxTE+Fg2qDaC1G
	BCE2V7cBwQXCIrbImXPdm84j5kR8c2NysjZn5i4qCG0TdO8V+pAOYg9Q
X-Gm-Gg: Acq92OHYceltzOpSvKnHeqQnG0K0AQo2+WF0UHh79zOGyN979bOSmliV6awNr8kfavq
	x947wCSkZOdrPBVtpQJb2JUUvFBJxVm0C3xgMkWlFputrUirW19bwA/BE+xrBNOol590GoccIcF
	dZbM520QscmNrXEdkOQ+iizFN1d/8og9hu5AS8eS4PtCa8Ai2up3j6NKhgSrWLSdZmM8tkclzIt
	aaOUuU/wrDBamH16FQtbrE6e+o8G0cDHyvmNV3LLsxXpKgv/EgLkZYjsqIdH0rfCOfJEW78H7cy
	5fl3yJZBOqNL54/kn+7WNHqkClMTxQNTDIdsYl6v43yoo/djSN+1gPNvbYNSwipPNo18ut0es+B
	I5oWKZiv6ZONzTBGCGCK/JQ5HqMJjCNlZVO7t0HpZaQa1LSJikC3Fln/etwlas+HXHT8Uc+YQgL
	1v0y+Z/mYfZJjaZr61qJ0N+JVcxc6eG3IhXKZ+HjJx0sVLMVdpgEWN/9gmNnHDtGfmJJzrmgmi4
	6w=
X-Received: by 2002:a05:6000:26cf:b0:448:7049:a6c9 with SMTP id ffacd0b85a97d-45eb3688808mr2878148f8f.5.1779434076972;
        Fri, 22 May 2026 00:14:36 -0700 (PDT)
Message-ID: <e359f9c0-83c3-4375-ad5c-9bfeceb030a5@gmail.com>
Date: Fri, 22 May 2026 09:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v3: Fix redistributor wakeup polling
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260518070524.19813-1-luca.fancellu@arm.com>
 <64094528-9c9c-47d4-98b6-640df0a9df3b@amd.com>
 <7bde7370-cd19-414b-9b53-37aaf076ba82@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7bde7370-cd19-414b-9b53-37aaf076ba82@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779434077-2236CC48-8C2BB95B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1251
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E330E5AFDF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 9:06 AM, Orzel, Michal wrote:
> Oleksii, can we ask for a release ack for this fix?
> 
> ~Michal
> 
> On 19-May-26 09:19, Orzel, Michal wrote:
>>
>>
>> On 18-May-26 09:05, Luca Fancellu wrote:
>>> gicv3_enable_redist() clears GICR_WAKER.ProcessorSleep and then waits for
>>> GICR_WAKER.ChildrenAsleep to clear, as required after waking a
>>> redistributor.
>>>
>>> However, the polling loop currently uses "while ( timeout )". Since
>>> timeout is initially false, the loop runs only once unless the timeout
>>> path has already been reached. As a result, Xen can continue before the
>>> redistributor has completed wakeup.
>>>
>>> Use an unconditional loop, matching the surrounding timeout/break pattern,
>>> so the code polls until either ChildrenAsleep is clear or the deadline is
>>> reached.
>>>
>>> While there, also fix the timeout message. This path polls
>>> GICR_WAKER.ChildrenAsleep, not an RWP bit, so "RWP timeout" is misleading.
>>>
>>> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

