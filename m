Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o7PzHAOMOmpo/gcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:37:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CBC6B77FF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:37:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=f8RnwcnU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344271.1603370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1Iy-0000SD-7W; Tue, 23 Jun 2026 13:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344271.1603370; Tue, 23 Jun 2026 13:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1Iy-0000Q1-4t; Tue, 23 Jun 2026 13:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1344271;
 Tue, 23 Jun 2026 13:36:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wc1Iw-0000Pv-KK
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:36:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc1Iv-007kJd-Py
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 15:36:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3a8bd7-e002-0a2a0a5209dd-0a2a450c9052-40
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:36:41 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3a8be9-94a4-0a2a450c0019-d155da2bec49-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:36:41 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bec3ffb95dbso795417066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 06:36:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c0c615089desm539333166b.54.2026.06.23.06.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 06:36:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782221801; x=1782826601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3/AJFEfESGynlXm7mwdZdVu6m4rYWwrCxe79kOK9Ww=;
        b=f8RnwcnU8JaNLeBnPF29imL3+jTgGvg8+buJ49YBfhFQ+Z2zRZQ0lV4c8kjyK1J1Fy
         21Hq4V9IGfr1Ikt1B/Qp3dWodL2iHoG1X9uavC5C+gMHnU/8CCLDvxCr5EcZn5JXjLtT
         dq/SRBV3LdVMG6AWs8Xamvmohx2gleptWiRCpYn3vNpag7+q25HztrTGrCpgQydPEBUq
         s++PQaO/eTj7zrYH239Dahn/5QuYJCFvfVvc2c+eYCsxNsNLVfaSEf4u1twYCoT3Rilq
         4amJUonrrb68jtrJGWvKroSC04lhvrPYHa0oe8ycGT7/sLf9mdbe3w2ZsV5CYJk3VBfZ
         PLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782221801; x=1782826601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3/AJFEfESGynlXm7mwdZdVu6m4rYWwrCxe79kOK9Ww=;
        b=KmB1wVzS1uQad7HdAZ2AWQRyrSiHeBPNk57tZtBUW+HGtOnzEcV4ldEYpsUCpirbXw
         iPjkymD7z+Tnqdguf63pbp/Gv9/JoHeouW3MVsCp9JPXlcipmT3pJW6iklqs7MWfIbGo
         ZDMmBbV65vhHfIBgA7rYGHE5n1AEObAdxbIB5Y4Bl+aDoDqUdU+vqIIO7tmDv9YteTAg
         rvuSZ7UxP0NsR4saUC2J6cQEy+mnvxZ5Qk40JEjLXIoZnphsVDcG0IForzb4eSJ/eC5a
         WrCky/SJ0vwxCjIlbuUNkiT40ycBy0yDhZdtRx0UUAD8w9b3hBiCA351MAVot87GXNNm
         OYbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3MQpB+kzJYCZ0z1PPkiJq0mOm9i13SbpbdEs35pg+PsI+ELQp+I9WOxynUWZZDIZHZl1YPfdXUA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHTezj5IzaTFlbbc+FAlBOOueI08AaXr24y1M6UpsbA0MdVk2E
	2q5+jMZSiU3yg82uZX2K6pn+2NzIIhEcLiiIVdfOJ5jmfxthpqYg9SVZ
X-Gm-Gg: AfdE7ckRykS3KtJmAZwxC1X3XQfqaZK0xC6NT1PydBH4+TK7baPPm3ZweJLCFobVETh
	VUmXEdTs6SYd/gIa/lB5sbyVITyMOpXNf0snei14sLvmSNcIFzOGR7UngRA38lxkB1wG229l8ff
	8RXzYaTAiQXU2PsP5S1dhnn6H3vCgipCpXgPLIAbFuIDO8Gpw3dLa0bvCYP+DPofopeGelNHLjE
	n2EhzYFfxQdCn+hPPczQWBUo4BqLAaB2tNlRMLmLlmXAxIwoGFjor7IqUYEX1GYP2qp4Zk4cO2t
	1nQ9kMhXgzf0LRalx52ZCvnS/PHMJJiYzM0yrHvfVXoglBYtyztdOV4CUn35XUlmIljYQjjzbHi
	C7RitlqrMgTIJIowRqtcKheFBw1PRLbl+gHaGJREQRnfn56UElaro7SGX+F2SfPPP+GXxrbicK9
	2ePXuT8J4JWqQUPeJObDY0tizqsZORyesRlQzYMwwxyty8BZgBRXPGpVVIK/jcv2UfoXShNGtCp
	cpenw==
X-Received: by 2002:a17:907:c07:b0:c0e:883e:e4f2 with SMTP id a640c23a62f3a-c0e883eea07mr481839866b.30.1782221800838;
        Tue, 23 Jun 2026 06:36:40 -0700 (PDT)
Message-ID: <20161bd5-a081-4562-a1d9-14dbdba109f3@gmail.com>
Date: Tue, 23 Jun 2026 15:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260623103145.76383-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260623103145.76383-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782221801-DB1EEABF-D9F25515/10/73395122804
X-purgate-type: spam
X-purgate-size: 1453
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: 18CBC6B77FF



On 6/23/26 12:31 PM, Roger Pau Monne wrote:
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

Don't you mmiss Fixes: tag?

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>> ---
> There's a possible alternative approach to solve this by moving the actual
> interrupt processing to a softirq tasklet and disabling the interrupt
> source until the processing is done, likely unifying the logic with the
> timer task.  However that's a bigger change, and too risky for 4.22 at this
> point.
> ---

Agree, it would be better to stick to  the current solution:

Release-Acked-by: Oleksii Kurochko <oleskii.kurochko@gmail.com>

Thanks.

~ Oleksii

