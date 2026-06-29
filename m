Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ksGFQ14Qmrg7wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 15:50:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32246DB891
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 15:50:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=S53NKLaz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1347534.1605368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCMs-0001wT-UE; Mon, 29 Jun 2026 13:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347534.1605368; Mon, 29 Jun 2026 13:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCMs-0001uJ-RJ; Mon, 29 Jun 2026 13:49:46 +0000
Received: by outflank-mailman (input) for mailman id 1347534;
 Mon, 29 Jun 2026 13:49:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weCMr-0001t8-M7
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 13:49:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCMq-00EeYR-4F
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:49:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4277f6-5cb7-0a2a0a5109dd-0a2a4508a2d8-6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 15:49:43 +0200
Received: from [209.85.167.41] (helo=mail-lf1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4277f7-edec-0a2a45080019-d155a729e5b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 15:49:43 +0200
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5aeb5829fd5so1285701e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 06:49:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad69580f7fsm5934492e87.61.2026.06.29.06.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 06:49:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782740983; x=1783345783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=495slxjqKmCy38FTYb4GpyK5CV8lVyW69ubl9euwJ/E=;
        b=S53NKLazZfwiCYb2mJ/WSwlY6AY5/8Le5jLMgsyyNO+m+pscKSdYcPsL2iT7dYuhgM
         pn6CoojLdecwxEfr2XeDq+Y5btr6ke71/KnIOO2qycAm65K1HtaDRS+M8kNpwykCWezZ
         XjTTxgbn6eqVZbC2m6N7sr+a23SltISXL9cKoVsYLurxcTPmgQIsNJKNtp1TFuIQZAC9
         gPovTBOnp9VFNxkC7r0sqTguE8eAo+jxSqZ8A4h2X94mPn5MrlTwY1elDPWaP32i3nE3
         N5lUqnvJvvQhTzNGNH6xK50a+VdQCdYL2TCBF618fLvGbO/mkS2GiloGTQUaOMM7Lv4x
         axow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740983; x=1783345783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=495slxjqKmCy38FTYb4GpyK5CV8lVyW69ubl9euwJ/E=;
        b=fcbUznjbhK9qRQ9E6RI89j0inOknSDSxerdGuOO4u0M9u0FGGpoCZ0q5aNZ3PXpZYz
         KLOCE8ve1oUBpfnI1cnzZyLBYrm7JClKAIPtP4FEGRDQjtLSclabrY47S2WjGmSv97en
         bsMeizja79AFNaBTSJL/n+79J/F2GuTTv9goNjrMzuquXClS7FkuEs5+23V3GcX6HWJ4
         Nq4s/RtNoTiszoHmB5SMXYlg7S6iTMUpR/25LyYD7ygQQ3Q+rcJwqJ+YY52dIRw9YjIF
         /rbWKPxVvDSOcUoPQp8o/ekkEjRdgXvKK82HIeVMFn2PYJPZE1l5r2va3K372YN6Q3PF
         CAmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpejy6o4GZCb8lBXDekyipQtELKHRPYk1DYjTS4xq9r479nRHNn+/QeqjpBkK5zkwOrN0D0nApg9nQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi2hpSv/PpQdU5XBsLqml4gqVBd67lXJiJdT/MNVQOis5M9yxC
	a3h66ICZzxJeiEVmnTuOW7PgRU15xJkYrBxUaRVES1wPBWIwXclYSQYU
X-Gm-Gg: AfdE7clLWqdz//BmvdgL9RaZ0OiQcXUd4Wqcvutl8xTYdVnmBF8fBOdtGh6hq1GYi1Y
	CHiVQRpKjibbgt79SdrZCrf74SY0flmSaZ51l9G8J5vgzxml3c1x6KAYr17na/gJ2tjbFtlWIpF
	NojaGmN8/yZlGb8UsSGnltXRzREDaSnVG2Ppz1uE8v1Two2we9hqCLLlcXiTpVXZDqCDflXGVox
	recqjidrTuWzUdhqnqobrhIy+UJw4s6KWUaH3VNcxMX4CKjf/Ph9a2U88UxHwhTjkto34/JJEk0
	D5FXGvGz2YhVQT8fpreEVYt1tNfaeGb5Z6Tu8/BJ0zchS1Y/1L+NDmCUDqd3HZwOJm5wQOUVWz2
	c1/MNo2A5CKr7tmsCEQ8KAWQBik5ZWAgoTCGV5nuDa4GBrmSNNU70E1VDqtNUZ1BKX2jBKueaAi
	0qbgsMwSF9IPKtUcewBqIHM14AgA7TbzqxFoZrOt5Ul+KIDtzpXM7dj6wrANSUFKwKgHM=
X-Received: by 2002:a05:6512:6513:b0:5ae:b7d4:7dd7 with SMTP id 2adb3069b0e04-5aeb7d47e82mr875497e87.24.1782740982857;
        Mon, 29 Jun 2026 06:49:42 -0700 (PDT)
Message-ID: <cea435f8-9805-4b41-988c-433714fad8ba@gmail.com>
Date: Mon, 29 Jun 2026 15:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 4/4] char/ns16550: bound execution time of
 ns16550_interrupt()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-5-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260629094531.55555-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782740983-43D333FC-FAAD670B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1031
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D32246DB891



On 6/29/26 11:45 AM, Roger Pau Monne wrote:
> The current logic in ns16550_interrupt() will loop until the device sets
> the NOINT in IIR.  At least on the Lenovo ThinkSystem SR630 V4 the flow
> control of the serial-over-lan emulated UART seems to be broken, as it
> doesn't set the NOINT bit consistently.  The Transmitter Holding Register
> Empty in LSR also seems to not be properly signaled, as even with it set
> writes to the transmit register take ~6ms.  This leads to the watchdog
> triggering very easily on such system.
> 
> Introduce an upper bound on the execution time of ns16550_interrupt(), this
> is currently set as 4x the polling interval, which is calculated as the
> time to fill RX FIFO and/or empty TX FIFO.  The current maximum is 5ms.
> Once the timeout triggers the interrupt is disabled and the uart is
> switched to polling mode.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>


Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

