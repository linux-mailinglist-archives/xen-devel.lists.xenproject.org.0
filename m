Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIBCG/ZFA2ri2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:23:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A045238F4
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:23:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306940.1578668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMowm-0006qs-2V; Tue, 12 May 2026 15:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306940.1578668; Tue, 12 May 2026 15:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMowl-0006oa-W0; Tue, 12 May 2026 15:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1306940;
 Tue, 12 May 2026 15:22:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMowk-0006oE-EP
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:22:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMowj-00F0wi-N9
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:22:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0345cc-bab6-0a2a0a5309dd-0a2a4505d3cc-14
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:22:57 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0345d1-aaa8-0a2a45050019-d155dd31d125-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:22:57 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45297094718so4569466f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:22:57 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491e94c0fsm34465243f8f.32.2026.05.12.08.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:22:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778599377; x=1779204177; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UbmWzJK9tVEiQkJFNESC0HiQhi9drHePm3IQIdmCNrc=;
        b=h6iYsomhLp6DzBCrk4+KJpTIDnlq5BSiIUVXyuZ42o8/7sTnkq3fjxESksoBfxUv8l
         TkL2NfasaUR0h8TVE4p/I8dpt3v87YvK6wsitNOfnd7mMVPiQw3NtTegPC3m3rRYclep
         X76zUBKSuNeA3jrXfXXKwo8dYw9kmxHfaJwJnljnU/kkOgEY1HdGmt7AUmkDSOaZgXKJ
         rcsX2w8siHuXiv/SYA1/Zoqft/HIje0sR5DLvGAUiIG+Fu/sqApIu7iJ/UdXp2VGMHj/
         vaQ11fpdxTc35YARTI4JtWYuGdmeaAxCfK/8N1eW0qBfk7lX8rlBf/EIu1sMRKF2vgT7
         Gpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599377; x=1779204177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbmWzJK9tVEiQkJFNESC0HiQhi9drHePm3IQIdmCNrc=;
        b=P3al9TCVTCT0Ad928LgiTGCUkwI/01e61w3eEDq6CFCpbqHQ+aIJM3KOC8jXSeO99S
         NHNyLv+9Ig+/PXbBZdYlXvTbEcZ3db3q3NPwzSPnTdiDhduZ4gX1zW4+bHHbGUeGcLre
         SmwVj0kmlj/J7pRAHGqdJmhA0HgeggH6v2/WpdVNHa7SYGSnW9dLzRqjB+vRKqNcBMXI
         0uvjff8OraqSFzvV1WItL6Bp2WtxTknSfbHjYHkBC890Mgg4UlNn1rgoX+JdbUY9OEBT
         NZUssA+gymviHjJxUWkkAEVOWpz18UsxJcYLXpwCwf7DUnsNbe2w8zwWFojtWc7uiFQU
         5EFA==
X-Forwarded-Encrypted: i=1; AFNElJ/rsOETh+ObrLC+b/USEo6nSmJUKlT1PwR3hPhlvYGI5SJoAy0vb1soi4qLUxZFXmluxmFxqnv5HFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVnpdsueHS+spgtmBJZ6FmBEO4IoU+3jXhuiw/fz3sjoV062zB
	DVdM5KfliC3UsPk+dgg6ifWCP0W3QtAzMALV9Duu5D6yAGK+5Wd91wyz
X-Gm-Gg: Acq92OF+xuxMCVrvIu3A1D81+StJqXagoVQo5JcACSdCL9LQFChfZuJ1WI2OnuuGUyk
	78TQD1nMSc6dlFS6mGlPf0uPJ2mmiGNOIZ6yymJPMOqOXDvB1Yf9r9TWCUTe7wIynhHzY+AxvAi
	t5J8Z9kOEqQQFaEFSGx45GEbcARQpHVSuW/q5g/3M0485r8dLMPLTJJjcEoEP1cCcMYfBmxv/WN
	ySP5IbeKo8r0PZT6aWyiwxCWKeQvGIFgn8fdkoRt534Ahhgue8YaBIx5ZHH8pe3qV6mOo9QpSBU
	lVXOwYobH2SuMIXsvUlc5dWlRFj6/NOrqCl5I61Yqx3NrwBAWBlEIlybUCrCRetGb5y5i0fiFF8
	5g7uCnc3lAp3gxuCTAa2945xHGwVm9OBGxgL9z6T3tv7x0d8RVoxPsE5TfGo8WDO2TIz3/7V6+k
	aVPvkgXvgyG+Hlxu5KtK52xM4OJfbrR8UhUxMVlb3IyPaii2MaCWNjFkDgBp7WUQDk2k0s0T4SY
	y4=
X-Received: by 2002:a05:6000:2308:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-45b13790ffbmr5597262f8f.26.1778599377019;
        Tue, 12 May 2026 08:22:57 -0700 (PDT)
Message-ID: <cba2c354-2aae-4333-a323-bb4a36c7e439@gmail.com>
Date: Tue, 12 May 2026 17:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] x86/mwait-idle: sync up with Linux 7.0-rc
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1778599377-D8F7E443-2BC24D1F/10/73395122804
X-purgate-type: spam
X-purgate-size: 582
X-Rspamd-Queue-Id: 18A045238F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 3/12/26 5:53 PM, Jan Beulich wrote:
> Includes a few custom changes, too.
> 
> 1: arrange for BSP MSR adjustments during S3 resume
> 2: clean up BYT/CHT auto demotion disable
> 3: latch struct idle_cpu contents
> 4: move pre-initialized struct idle_cpu instances
> 5: Remove unused driver version constant
> 6: Remove the 'preferred_cstates' parameter
> 7: drop const from struct cpuidle_state arrays
> 8: Add cmdline option to adjust C-states table
> 9: Add C-states validation
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

