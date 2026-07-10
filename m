Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id orvPM1H0UGoU9AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:32:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4F73B470
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PZ8wLHsA;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359338.1612952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBKa-0008U3-CR; Fri, 10 Jul 2026 13:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359338.1612952; Fri, 10 Jul 2026 13:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBKa-0008RL-91; Fri, 10 Jul 2026 13:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1359338;
 Fri, 10 Jul 2026 13:31:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wiBKY-0008RF-NW
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:31:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBKX-00H694-NH
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:31:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50f42f-e002-0a2a0a5209dd-0a2a4504e9ce-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:31:49 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50f445-b1e5-0a2a45040019-d155d0b1d83c-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:31:49 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-39c82d9f801so8092771fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 06:31:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39c84b83a84sm9602591fa.26.2026.07.10.06.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 06:31:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783690309; x=1784295109; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwcdzNh54NLuqASMJCV0bL581jn5ZFBktq5QY1eNzF8=;
        b=PZ8wLHsApolp508K9sCE8JTRx3pFNvi6Tei6aYdrbT60k80iStTWjke0QeW7bjf/tm
         LSy3cL0vu7ZVqn8qzmLREwBlcE2Luw8kVfHqtQN3FXJSB1M3+cHdS+OCJIs5/8broRbI
         K0bcVHwK6dv6+437E0rU3R88DWtBdhZVaQfR/yURe7+idg5aOHop7jdsy23Atf+28bRj
         Gp3TL0CYYB+GrRjWvA3zK1j7VIls2gH0yu1c6sQNuVm3EcUk/NSRMkd5GJIZaz9adMyv
         5Y41mFKCE1djT766gu5eeUW8zHGZh0OQwPUsoN08altwakyyGkEjUZbuXrvs1VlSKtB2
         rflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783690309; x=1784295109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwcdzNh54NLuqASMJCV0bL581jn5ZFBktq5QY1eNzF8=;
        b=Hb8YT7PnEIMWsoy6Nu+cXgm7n/UHxDy32juyWuuuP6Z0Y9+0NdOjRq4BIj84SmzlVT
         YE6Uhxmbl6bxgrk8kf///IGrgrO3eJzC2kox8rCdcnq/UxvjJ6EhVhuElHnNA0LC6/CK
         LKeQLIqoUYsGVsYYwdaX5s+ZDg6Nf/UH6LHaZpcAetwLk2p0LtQNURTd8a5rwPS5qCVo
         KbE0ZTPrIhV4U1y4HAmYnl2+WQxhjr1JrR+epNYdcAYNoatF5kB6+QPOL8y800A6/RR3
         vffNyB5UyEyrAQLR0/0NG4+HnseLc3+xnqd/bmm69ARBeF1FN65jUJvJe5BB2MwH0Mmi
         oJfg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+fw6OJt93OmHQfSjrEygDAdJIXvHn6CUxXdI4UMHn5jLoKvfc2moipSLgmJ0d/vcZln6eyPjQyDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCTFHMEv2nGFmvXmq5vU5nqnkyQgZkqFimXU+XVBXYQ0N6xbMs
	PcTwodVkiAKRwg2OTNanTS3IcY1tgSZNEP2uTsvVan6xhfQSu4qAIQak
X-Gm-Gg: AfdE7cltpF2735OY0pq/5fhmGXzFW8gvjG28q6V76/K4CnRO/Y3VLFmS5j3q2FkCd63
	TS3k9EDiLBPJnDL3C8SZUSkLHycpPos1TEkOZBXj54qsXNin6wsvp9RlflycoWLCWX5DzKoHxW0
	jxj7P0S1HD1XHYvlKlnbnxfHAgPNBvsc/pyg17iMax1p+wRTPN50WO5stOLDpmZXLCtPM7SL5vr
	Hj+HheGR6Y7PJ5sUMBMOe5GCrBCgRXVuy1vIhokhmgnx7YKeHAoT93tV+ciheLYQ76bFb91nF7x
	7UG/MzyOMj2v0EOpKCHsf1cZcAumY0QrQkB82TO5MkEcD+CpqmAOZc7HfhduYJnz7OPYamVG/Fo
	jbie/Z6SnRAE6afX4hStzSwrYX7iPq+vdnBPj5zBTZMgZ7xYPXhlWnIOwbS8xeyHQ8dnTXNCron
	pmyPebZdJZtjVBUpA8GTcr/YKCgoCJMKEhEwf2YJBdGYMiVDfBm4Qwqtv7yHkmDhuVuuMcGEhj5
	/ET6w==
X-Received: by 2002:a05:651c:547:b0:39c:805f:ecfe with SMTP id 38308e7fff4ca-39c805ff586mr21860981fa.28.1783690308620;
        Fri, 10 Jul 2026 06:31:48 -0700 (PDT)
Message-ID: <b1c039e3-d955-4708-a805-e136bc73b6f5@gmail.com>
Date: Fri, 10 Jul 2026 15:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <6948fb2823ffa41cf2eabbd87952b236e4f379bf.1783085655.git.oleksii.kurochko@gmail.com>
 <2853c8c1-ea7f-46ba-ac65-a7473e9d3689@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2853c8c1-ea7f-46ba-ac65-a7473e9d3689@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1783690309-777AFFE7-81CD9D4D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1675
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 24A4F73B470



On 7/8/26 12:52 PM, Jan Beulich wrote:
>> +#ifndef CONFIG_HAS_SHARED_INFO
>> +/*
>> + * Placeholder ops for domains with neither a shared_info page nor (yet)
>> + * a FIFO control block.  None of these are ever reachable in practice;
>> + * they only exist to keep d->evtchn_port_ops non-NULL.
>> + */
>> +static void cf_check evtchn_none_set_pending(
>> +    struct vcpu *v, struct evtchn *evtchn) {}
>> +static void cf_check evtchn_none_noop(
>> +    struct domain *d, struct evtchn *evtchn) {}
>> +static bool cf_check evtchn_none_false(
>> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
>> +static void cf_check evtchn_none_print_state(
>> +    struct domain *d, const struct evtchn *evtchn) {}
>> +
>> +static const struct evtchn_port_ops evtchn_port_ops_none = {
>> +    .set_pending   = evtchn_none_set_pending,
>> +    .clear_pending = evtchn_none_noop,
>> +    .unmask        = evtchn_none_noop,
>> +    .is_pending    = evtchn_none_false,
>> +    .is_masked     = evtchn_none_false,
>> +    .print_state   = evtchn_none_print_state,
>> +};
>> +
>> +void evtchn_none_init(struct domain *d)
>> +{
>> +    d->evtchn_port_ops = &evtchn_port_ops_none;
>> +}
>> +#endif /* !CONFIG_HAS_SHARED_INFO */
> ... we wondering whether any of this is needed when FIFO is available. In
> v4 all that was noticed was that SHARED_INFO=n together with EVTCHN_FIFO=n
> is a problem. And having fewer cf_check functions in the build is always a
> win (I think).

I thought an opposite that it is good to have cf_check when pointer to 
function is used. So why we have to make an exception in this case?

~ Oleksii

