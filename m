Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M9bzBbVKIWqsCgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 11:51:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B163F63EB1A
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 11:51:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e3UDcxHA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327586.1592417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV4jf-0006qG-J3; Thu, 04 Jun 2026 09:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327586.1592417; Thu, 04 Jun 2026 09:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV4jf-0006nS-GC; Thu, 04 Jun 2026 09:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1327586;
 Thu, 04 Jun 2026 09:51:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV4je-0006nM-78
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 09:51:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV4jd-0065sb-K1
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 11:51:33 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a214a97-5cb7-0a2a0a5109dd-0a2a450bdf50-26
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:51:33 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a214aa5-212f-0a2a450b0019-d1558034f141-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:51:33 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so6286345e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 02:51:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3b59f0sm67542505e9.2.2026.06.04.02.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 02:51:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780566693; x=1781171493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuF8mqbgU6BDShbBCGqWxeRk1VGmEnnq0sn7JrTTZ2o=;
        b=e3UDcxHANjWDSkspsjn9bIgoEupyGlZeaqRFJV/0dh17gBcZ54VuOLezViGilXYvbn
         uH/Je66onNq8kmg2Klym60budCT8Mvx0NAKw9w5MCxANA1iok6hNnVAlVxNVMoe87pYC
         gbV23h4YtbMvDcAJBjyDy3hadrEmaEl0j41e9Fu83XB4Xwu8SnDlmz9VuXr1473JxBzv
         cswma8bLQVh+ondveaCRZ3ZycvR9pEpV1vJ9dMaZkr4wTc/bottENKeQV0BfsAc8HhET
         RQcYjvW0ZzBy54EDFZ7GEJTmYeOJQD0LJaf07pZStrt7urnOjM7AvdiIQafFFgUvH+cD
         C1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566693; x=1781171493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuF8mqbgU6BDShbBCGqWxeRk1VGmEnnq0sn7JrTTZ2o=;
        b=jgZK5L9XAihRLJbsuW1v0+4HAFDQyiC8cpn1AFPtgT0C3XjNdVdVN6cZwQ1LNkGvet
         q0E4RSDoBl42eTT71GDV4e/0buYlh/ZKdvGkWqO7kEdKMZa6YI9L594weqoG3OeHzCOC
         UKCVCVaERi8n1ud/BB1GBMuj9fzsIB6RL3JcMs6EqkysTHKKVVQ0XeQJHIotJu0e/hYv
         CWNrceqy5zXHUAm+NlKj4xDv4bev8vhenqAVT/dvChLVn/88QnoRWIKF4P+HlzqiX72Z
         1ENPT5h7XbOiigApLg3MjgpsK/uIE9rIlSPsHUIdsCEutohRermDhsACE2NEEcfQSG9S
         g2pg==
X-Forwarded-Encrypted: i=1; AFNElJ/bv9n8PREnp/Kixliwr801JalPw5g4u4IABKD6/pqC/HxPNXH46dz30xBmbpdo35tnXY+EIZiO5FQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwC6nWBx5lho+KT5asEVCXVo7nlqQ9weBSFR3iGeUrB3rkSU7gQ
	3o6E2jJDiETx9p1RGlyr2YKmm9yOmFcVFR80ZX3cmqi9ksF6t5hgoPFYPLvgdg==
X-Gm-Gg: Acq92OESF+lhBnKtM0zsnaKupey7xiH/OyEwsxAuRquJ2PgVp3u/eiNaFYJe48uR4UH
	inHvfkQ2TcghkO7cs5sWsCjpDnNgC/znbvEExA7MWiha0iqzi58L357votUkGxsUQ3LXOLm8rtf
	8BRF74HmPkAl+CfFLjcdnK05i6pzszGiQQePDmKLDbVAKF9V4DDQvuW2sG4a/gW3hsgwh8DFbRC
	buWTrJplVQx1Fo0uo2V+aeprhG/iX26C7zZL3Q/DGO10Y1CgXQgtah/wHLRs/3uSk6bTEp4tqXe
	31KBv+wXjPAFBLB/Nolgi/3L8Vl8iNd39gNPb5rHr86JYKdiOdSOl/FNjhhO2cZWjLDYDO6/g6O
	+AOSA6CqVONuHUg93ZdjOWDCUNx2NF3IEioIrGSwQkQblxVeGX3dpAu4btuzRcFoIKGu4MM96YP
	xgKSFaDrdlg2EYjONEDSOTOBaKI+n0fosBly1q7CVGZDpuqsOBoA1VloH72uooUEW3itTKqWjYh
	VknUyN/fKfvFLPK
X-Received: by 2002:a05:600c:3508:b0:490:5cd8:d21c with SMTP id 5b1f17b1804b1-490b5eb3310mr113676295e9.14.1780566692860;
        Thu, 04 Jun 2026 02:51:32 -0700 (PDT)
Message-ID: <b8872547-8e3d-457b-a01d-4854657bd086@gmail.com>
Date: Thu, 4 Jun 2026 11:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] argo: few log fixes
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
References: <20260603194131.1468654-1-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260603194131.1468654-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780566693-1AD77F3B-D72BD8D7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1527
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.com:url];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B163F63EB1A



On 6/3/26 9:41 PM, dmukhin@ford.com wrote:
> This series corrects Argo module tracing.
> 
> Patch 1 lowers the verbosity of a spammy log message.
> Patch 2 corrects the debug logline.
> Patch 3 cleans up existing loglines by dropping duplicate prefixes.
> Patch 4 re-wires argo_dprintk() to gprintk() to include mode debugging
>          context.
> Patch 5 adds new Kconfig for short-circuiting extra verbose Argo traces.
> Patch 6 enables extra verbose Argo traces in CI for ease of catching
>          potential issues.
> 
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2574255630
> Link to v4: https://lore.kernel.org/xen-devel/20260603060539.1181809-1-dmukhin@ford.com/
> 
> Denis Mukhin (6):
>    argo: lower level of noisy connection-refused log
>    argo: correct logline in ring_unmap()
>    argo: drop argo prefix from argo_dprintk() calls
>    argo: fixup argo_dprintk()
>    argo: introduce CONFIG_ARGO_DEBUG
>    automation: enable Argo debugging in CI
> 
>   automation/gitlab-ci/analyze.yaml |  2 ++
>   automation/gitlab-ci/build.yaml   |  1 +
>   xen/common/Kconfig                |  6 ++++++
>   xen/common/argo.c                 | 22 ++++++++++------------
>   4 files changed, 19 insertions(+), 12 deletions(-)
> 

Considering that changes affect only the way how ARGO messages are 
printed I will be comfortable to have this in 4.22 as it is low-risk fixes:

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thasnks.

~ Oleksii

