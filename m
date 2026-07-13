Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yJ3UKy2XVGrenwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:43:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE147484D8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:43:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sF0g4IOG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361488.1613711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjBK0-00057j-GV; Mon, 13 Jul 2026 07:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361488.1613711; Mon, 13 Jul 2026 07:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjBK0-000554-Du; Mon, 13 Jul 2026 07:43:24 +0000
Received: by outflank-mailman (input) for mailman id 1361488;
 Mon, 13 Jul 2026 07:43:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjBJy-00054y-Hp
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 07:43:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjBJw-0066dZ-9K
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:43:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a549716-e002-0a2a0a5209dd-0a2a450cdfa4-4
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:43:20 +0200
Received: from [209.85.208.176] (helo=mail-lj1-f176.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a549716-e897-0a2a450c0019-d155d0b0cd6c-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:43:19 +0200
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39d560a1dd4so11643581fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 00:43:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39c97183542sm20548261fa.25.2026.07.13.00.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 00:43:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783928598; x=1784533398; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyGsX8czE0qYYehoElOQnOgOMFNaB9XoGym7wtLlw7E=;
        b=sF0g4IOGFzRd5g6D3VnUY6XgsKFK9u/OCj3/nd8JukpFfSOWPOIA2YJ5TZzKYkoGcS
         ZByMWBBE2acbrBbRsRFVvRw9WAH5aLLg/aVKBHeAzcw56WIMBzif+b5/PvKa/8RHrLZm
         5D7qV0TFfY9efnco6W6zeuG+oaWWaNmSv0Z8HdUQXJidspdCg0DE1kVE+xEWd7PtrJDs
         omfCkbToLPgBLvuN2AXSxhQUBZ3gfDKjHjQ2h7D181Jfz6ryuCWm2zwnp+nMtdr8Frnb
         FNABgDGsx7AYmreHuWA77mCUiwY4uSvRCyb6T8nXw9LwLrAU731SGZ8jZS9p1yg7tdsF
         nWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928598; x=1784533398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyGsX8czE0qYYehoElOQnOgOMFNaB9XoGym7wtLlw7E=;
        b=h588fb4V0NSEMPucczcVRjyKuU1t3Uc2cOg6jLFUyf+mSC4Svq1LXfQZVzAgRc9J07
         +JH0TwM5+gcwQa6gKJ3PBT7+O1MOfuQWIBJS9D/IeaUTGqCzRh8OFI5NCcKFJJ4BWD/S
         DiPgbuQNzagQD84jDnZu0HgNvzpFGV9XrAobFklRCt8dSbQVsqgrTZcqQisT1JhH46UA
         +vVpjRoGAXvyr1ffyFr3VaYyFw2YY8mtJep5RIL508BxkYn2qif1DM44aRDvRRbIyJgS
         O7DONNYpCdetRut8yX0rCPTvd+uAsOyicAQpIIABtZbwSJ9Mee7hiGc7pizODGtQz3fR
         0Uxw==
X-Forwarded-Encrypted: i=1; AHgh+RrVOREZRpjn5VjJIMTmp7oI3PECMyb2Q1D1eCyn5q1jknHRPDGR2gE4Hy3EBWuufbcxrG4J67dw0U4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBDmSZSuAVQCLDKdZ9v3IsBtaNxHzPiQx3uN5jfyPLQaV8pYli
	1Ql5vFb4z/PBNfG+1WtDWZXg5OSwnBF5dg1Xs+DII7N5yeo96illIe7K
X-Gm-Gg: AfdE7cnewXwv8jAWtuEZZEi+2wi72xjddzPZmEv9ZvhO5B9XZzM/VMjgRcYVIto6+Gd
	XoBvElC6340ZcJDGWEUbE9bhSgSTsEGWf5hQRK4n7kaAJmPAMvDif69CFCyYFY0TsLw8VtB1sn7
	/Np3Gk1Ber6w/m9AHaLLZWpIUe724gnLKxXXDNMPOb++C+gTC6wFLs8QprTOiQ1+sRRyYZHV1aK
	7DuBmPw+GpF6YaHVXxF4ztEptyCkVpTXkgd1/sWV2613NAWeCJQrZYZlWu0Dn8n073OI2Qun4D6
	ngS3FlABXsgGawROnWBuo3VOc5F9u/zM/M5+GfLILFMwg7irncm4ZOyE6YHNUR/lIlv6F6z3x1W
	rpRsdfPF7ieRGIgcjswuXj+NqJvfqatf2IvEoRnFR5QtlDyvuWof/buX4bIXwhjlCTke0WAJ8t1
	s17YMmdXmBhbCOZMPxdHYQ8AuPPEhU16LYShJsFg6PfL2aasBnrbEYp0wTRoTBw2ZToTCZU+zZU
	qmtTA==
X-Received: by 2002:a2e:9a16:0:b0:39a:e9c1:5809 with SMTP id 38308e7fff4ca-39ca7ace686mr17875881fa.3.1783928598342;
        Mon, 13 Jul 2026 00:43:18 -0700 (PDT)
Message-ID: <70f92a54-9d1d-44e6-bdb4-e446cb8fca89@gmail.com>
Date: Mon, 13 Jul 2026 09:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/arm: propagate secondary GIC initialization
 failures
To: Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <9fd0d0eacf061cc2a32f440e3438c084fa9ca79c.1783678619.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9fd0d0eacf061cc2a32f440e3438c084fa9ca79c.1783678619.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783928599-579646B2-BD33A6DE/10/73395122804
X-purgate-type: spam
X-purgate-size: 1200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DE147484D8



On 7/10/26 12:20 PM, Mykola Kvach wrote:
> The GICv3 secondary_init() callback can fail while discovering or
> waking a Redistributor, enabling LPIs, or setting up an ITS collection.
> gic_init_secondary_cpu() currently discards that status. start_secondary()
> then marks the CPU online even though its per-CPU GIC interface may be
> unusable.
> 
> Return the callback status through the common GIC layer. Have
> start_secondary() report the failure and stop the affected CPU before it
> is added to cpu_online_map.
> 
> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---

This doesn't look release-critical. IIUC, the issue only occurs if 
`gic_hw_ops->secondary_init()` fails, which itself appears to require an 
abnormal condition (e.g. invalid DT data or a failure while initializing 
the GIC Redistributor/LPI/ITS state). On correctly configured systems, 
this path should never be taken. We've also been living with this 
behavior for a long time, so unless the maintainers feel strongly that 
it should go in now, I think we could postpone this patch until the 4.22 
release.

Thanks.

~ Oleksii

