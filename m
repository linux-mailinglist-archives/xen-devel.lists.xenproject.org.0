Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nMcBMLFrR2ogYAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 09:58:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549906FFCE2
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 09:58:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CENsmDGG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1352940.1609204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfYmn-0001Ey-VE; Fri, 03 Jul 2026 07:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352940.1609204; Fri, 03 Jul 2026 07:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfYmn-0001Cg-RT; Fri, 03 Jul 2026 07:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1352940;
 Fri, 03 Jul 2026 07:58:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfYmm-0001Ca-Bv
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 07:58:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfYml-00AaF8-Os
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 09:58:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a476b8f-2eae-0a2a0a5409dd-0a2a4507e994-0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 09:58:07 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a476b8e-9c8e-0a2a45070019-d155d0b2cc3c-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 09:58:06 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-39afb0d9f7eso3011291fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 00:58:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aed13c4acdsm283255e87.76.2026.07.03.00.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 00:58:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783065486; x=1783670286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLuTWbOCGUpepJm0WQVVJLBtO432gPwRh4dR2sQxfh4=;
        b=CENsmDGGll90igdUxHbTvLyphvTVYxVgFspOwRlVaaUcB/A21kuWj5JebxfJPfpUYh
         dxQ9Mj6mv19bN0/g0pQ8osWT6bxtmESsYqNrMa2Ud7xg1Eoq4t3vK/wOjIho36k936kt
         Hc1+/Me8S3vEp+iAYN655chCA5xR024R3P5ZV02ERXt0H7g+a5faDLKG+EWLGgAnpaW9
         jq1ixsokN57dZvrTG28Vqsm10BEQNfBH1XA3DVS4uA6NVFhWTqR2AUnU3S8iqxOEN7tA
         zq5TMBmTVJS9Fu1IocYcy5NpkmT/GA4KBwgGsukRfLWVbbVvJB0I9jRS7k2yvvYxcUjP
         nhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065486; x=1783670286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLuTWbOCGUpepJm0WQVVJLBtO432gPwRh4dR2sQxfh4=;
        b=hPC7sq+WMcdeUeMdp11qBbnIJ5qZyK1NTaBXNinCpJ00wnkdqjr9PGBI4WI/8h4Lbv
         0y5xLFfcg/tsDAopXEVSRhVPR0uXJCO0Lu6yA4a+tywez8uQe5eBRfaEp0rXIEfALvQ/
         IzvyA7K5bRo3acwAvCqXqHP7Zn7zefey1rNDL4gKEZo3GDMLdSjDWEc4EPhz78d15Akz
         u0/71m0h0gewluDBUM8geRzr6dSR8g8SSNuOXrcu4yh5mtAKwScJXty/JjBU06cLMonb
         hX1nX8HhvwUb0VqjQqcKsndNrJwgc1o6nZzPQqDYfgOgoyigBSMWsG1eUWzq7RbWDPdn
         nAww==
X-Forwarded-Encrypted: i=1; AHgh+RpOWPc8IVVJUUIHeyIBF6FMSD1x0r8kDJtHe46rXdVJvH43DUy97ZKkvh538XtavjpBmT+VIk26IY8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8JpgUWn8Iweo1G4cdQg95HfWnmYHXuwi1/CcJHKs/naDRUT8y
	IhrdKmNRgYjK292m7YvE78lnxzcO/60Ii60l9HgghWKQRlK+/KlH4MDu
X-Gm-Gg: AfdE7cnY/tIJrSUpajVbuhxsbcpSTU0DDXpmYjPEe27NK4o18SFVM6NZsg+af2GOFcj
	LsCd4SJXhlxNmIhP3hDsS4em4WqVF1znNVEoN2PAy9Dqtxv7iBEVhkEZQqxDmNpBxXeFVnD3ikq
	H0cwL+V3i8RZ4lmUFgRY3wbQf49rCQQGVDJrb1GX8t+yiaAFja/NNs5MnpNTQT/n7aqs1b9FBJd
	jXsfkUH01QeqhWgL70tIBA1gYzQ8aa+T/T/vBpueYEFd50yna2yrzj9haw5ElmSRwY06HsjhIdV
	Y7JEG8+rXwbXyTewCE0YGLk22RDV6qa/xTRKo8pjWz2atwfc2LSi+B0YQoX9D8Y4kZeVUrzXPNQ
	EDlWvqDVbXzSxRGhcSp07q51S9R/x3C7CVml6qDuPvhzHVfqVCAECw54sIa1SNv6RxVa6b0yaam
	kqtIqih+jSPNtDdFNZP0HWYlbna8Pzb+V++g766oUAvKFzjKxEtGzjnixWj8uM4VA9W5E=
X-Received: by 2002:a05:6512:138e:b0:5ae:bcf6:b07c with SMTP id 2adb3069b0e04-5aec6795a7fmr2066254e87.4.1783065485964;
        Fri, 03 Jul 2026 00:58:05 -0700 (PDT)
Message-ID: <5a4024d7-370a-4519-9191-42c64c614847@gmail.com>
Date: Fri, 3 Jul 2026 09:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22] x86/cpu-policy: set up host policy earlier
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1783065486-7F53025E-1AEC714D/10/73395122804
X-purgate-type: spam
X-purgate-size: 694
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,invisiblethingslab.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 549906FFCE2



On 7/3/26 8:26 AM, Jan Beulich wrote:
> In order to use cpu_has_* expanding to host_cpu_policy.*, the host policy
> needs setting up alongside boot_cpu_data.x86_capability[]. Arrange for
> that towards the end of identify_cpu(). Then make sure .x86_capability[]
> and host policy remain in sync when setup_{force,clear}_cpu_cap() are
> used.
> 
> Rename the function now it's no longer static.
> 
> Fixes: 894bd7617924 ("x86/Intel: use host CPU policy for ARAT checking")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

