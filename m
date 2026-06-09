Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MftyK3DfJ2oP3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:40:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A8265E6C3
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:40:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OGcYsnQS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1332568.1595027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsvy-0001Qq-Ut; Tue, 09 Jun 2026 09:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332568.1595027; Tue, 09 Jun 2026 09:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsvy-0001Ol-Ri; Tue, 09 Jun 2026 09:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1332568;
 Tue, 09 Jun 2026 09:39:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWsvx-0001OY-IL
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:39:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWsvw-00Fku2-KX
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:39:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27df4e-bab6-0a2a0a5309dd-0a2a45038358-48
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:39:44 +0200
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27df60-672d-0a2a45030019-d155d032d11c-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:39:44 +0200
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f35so2576254a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:39:44 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e6595c722sm8324423a12.22.2026.06.09.02.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 02:39:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780997984; x=1781602784; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojAoOIr8suU/Ii90bmf7iq53dfd/rns61I5bJ24u/Ns=;
        b=OGcYsnQSMFo609NFYaQTXSeA1Tt7R6WKGagtB3LtbqwsURSbGpJXrutWURWQ/dncmE
         blUIIc966QDW8o6xjEYGhUeupWMHR03uPK8T76ECqvhR+ob+w0+uQzc4jYu6Ac8uQyJ2
         DNBK4UdjtXrWtQ3KmSGLQ+BQAMRkEX0ec71qe2pzGVVa5V+/G1xErqkgGOo7g8MaWvbk
         oOohu/XWjz4wJQYsqAHi9hjxKWtXwYocpCZklFumYjTr7M0eORACrUK74lHF88KKa81G
         lsb6aJk5UMxag096m9nYBqLdIg+RPM2q7rL50HtJvNWqa6QFPr+TUe8OsMLWlg39zEC4
         iRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997984; x=1781602784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojAoOIr8suU/Ii90bmf7iq53dfd/rns61I5bJ24u/Ns=;
        b=JYTHzai+3m2RxQ1j1VV6hcobyhwyDdsDjMuMtf1JIH8q21smxdraMHdfwGCzC/EtbL
         tJ1ZXJNZQUjIHtFMcBNuYytpqYmPlPBHwWPUcTHQ6cFitI4jRtYbOhVMnOAv9eT/2nKq
         XVjLho2OtkfUFtmffdyDWXGH+bS5r8tps33fyaUj3f3AkUGmpKWhsDZidY7GZ1IVNPsX
         ddeNUT89glnuKVItivPVHjOxKTuuQCcRA5pnkv2bP74sxos9LrZMvpg0HeEqV3KK9bzl
         ZOkHuxjQDS01bAQvpGNhQ5CvFaXxBkjKKinMQ/Wz7E49zb3HXk8RxnsnvIGOHVtFJNLj
         1AqA==
X-Forwarded-Encrypted: i=1; AFNElJ/uOrHC40NQQAhoVHDAgx/Je+QEhyzWLIRO/kq+Jg8uy/s9SuT6dCw+Ds3ZoR8Se1mgYbTqCTlIuhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yynf3IeRPTQvGbl0HbM9D76ALhIM6o7GsB/DSiSqzcb64H0uEYI
	qXWyeXYDRQwZMk1YAhjcBrh15xCGEtcYDzvr/8mgYVn5XgSjJ9r589Dtu5u+SA==
X-Gm-Gg: Acq92OEqXinKR5vzr2lkBeTY6g3YC29ABWhdVdJHMqc3cFKScOo6PstFchhN5HmRGW5
	Y4OQBoa2nxaFIgtHYQSWvqpQK75muRVUJUJ+iOnkIWIxme6Ng5JnYnbV4O0P53b118jk/ZfnXRX
	t6PPgUlZ5Pq2yeXaEPr7kbfYUkpqc5Caz4TbmJFwc4YEP8HsxbTFt5noaMoS3hp7sg5k2uTk4ye
	pQbeIugmSvgK7+DGpxMFrPQbu+PxukrUPDRoY2Q73ooFkr8ybyi+7GZ0CGHGDUrJn7S6ZBmgv21
	gs7pmzVIkYvmQZYkpZHngws6tsZ/TWQL1uWK90gKocDJbUg7pLujqCjLRbPwItN9QDG9znD+U7X
	wDFInTUZL6jjMtUT1YbMFdWh6RzfqgzrXMZ9ovQkfbC2toBJpfOS+K2NW/sCrOutDp9T8ddDWQf
	3IWxgahaWYzfO5Z0WCBFF3dvS5xYqgY187ymrZVKXLUS64+Nr2XSaV9TlYudymICQNT5FSNepJM
	PGcDzJw0WK5WvUc
X-Received: by 2002:a05:6402:27d4:b0:68c:33e9:bf71 with SMTP id 4fb4d7f45d1cf-68fa4e18fafmr9061861a12.11.1780997983688;
        Tue, 09 Jun 2026 02:39:43 -0700 (PDT)
Message-ID: <7f8679f1-7bd9-4c48-a112-edc83d95d196@gmail.com>
Date: Tue, 9 Jun 2026 11:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/pdx: fix off-by-one index in offset mask
 calculation
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260609085322.92856-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260609085322.92856-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780997984-3B96D938-39F071F6/10/73395122804
X-purgate-type: spam
X-purgate-size: 858
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 55A8265E6C3



On 6/9/26 10:53 AM, Roger Pau Monne wrote:
> Adjust the mask calculation in case the last range is merged with the
> previous one, as then the mask must be calculated from the previous range,
> which the current one has been merged into.
> 
> Instead of fixing the off-by-one in place, move the calculation of the bit
> change mask to the next loop, after the ranges have been merged.  This
> simplifies the logic by consolidating mask calculation in a single place,
> possibly making it less error prone in the future.
> 
> Also add a test case that triggers the bug being fixed by this commit.
> 
> Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

