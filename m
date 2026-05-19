Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOdSDbOPDGqMjAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:28:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E380C5825F8
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313240.1583461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNIw-0003EF-AF; Tue, 19 May 2026 16:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313240.1583461; Tue, 19 May 2026 16:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNIw-0003C9-78; Tue, 19 May 2026 16:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1313240;
 Tue, 19 May 2026 16:28:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPNIu-0003C1-6G
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:28:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPNIt-00DLxZ-Ic
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 18:28:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c8f9b-5cb7-0a2a0a5109dd-0a2a450ca80c-26
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:28:23 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c8fa7-62f1-0a2a450c0019-d155d02ea559-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:28:23 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-678a16429c6so6864722a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:28:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68310b3e800sm6941820a12.6.2026.05.19.09.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 09:28:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779208103; x=1779812903; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cuaRy8vTMZhnsIPU3fg8GazaeIe69JwFVS9UAY+B9jc=;
        b=j3lwY5ZnFj2fgIszGTTerPgs8S3g1fHgNF8EWEB5hsDi4PXOPWunj3MZWsh/e+tcjp
         R+bpA2OUDvbUwXRYmo/EPUMAHlq20NnynlS8O30i8zB8Tj8MrIEiNDMqPHyEcxg1R5zf
         bnJ74pHeCFHam3oXccq1KLQRBTg9ZUaVYbTFlzI03wGYtwq0QG8oJeKwZhISQpqO+/L9
         m8IhA4KvlYEE4ECgjWGRJe8SB+MTsGc68rITeCDPro58TRCP0PvaEnxONnxo0XETq7GF
         HDYYBBXUuLSZBnF7Cnqk/Wgt8ynxgBkpXaA3gkCLrcebH7iNnIp9JkvfgEFrKx2t3Udl
         pNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779208103; x=1779812903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuaRy8vTMZhnsIPU3fg8GazaeIe69JwFVS9UAY+B9jc=;
        b=sFo9GvNxiAoqXl+SIu0lFtE3NpjwxBtnh3PmsWWisr0jBxlxYC0vTohjrFWDFB/mYZ
         IXUjU7Q3ziwSqgMPjUDUeAt2iWuZEQBXX6+WE5W9gjpwAnY7xA9s9KSA5t0I4p5FJc7o
         CskBV+2yUNBtKY9Q+ZlDZX1yuBNU1IQvGYLyMVlFk04P7PpnuiPrkUuK/Nhkr492WR4w
         pRlRmZVamnX7/ditvSj/p/NmrpqEDUGnKEA9JwJTuwFiDVgFu4GbGCU8SgPDAqfS1dtK
         Klglp4KpOY/xIpRAqsRDiV0JO7mPs8gRSdr95kPDJNYcXWaHLFU1psPMwkUGcn0XuGqc
         kShw==
X-Forwarded-Encrypted: i=1; AFNElJ/RcVu7x8DSYqi5K2N5ip8ZUWmbHfbWf1nIusWqWG1fVPljOaK9iqQIKsx/GQoNFwmOrusbPDe6dUI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpMP6bXdbLdID/3MR/xJqeoyBrTgUdGJ9RgxCvRZ50MooOoy9q
	bFwn8pRn8NYY/C/DyLtIK08SKJS3W3/yNiZcsYFDHwlML6hzjo4n+Otj
X-Gm-Gg: Acq92OGJoqkkv0ZuXAZcSgRwVk3TbGcCz9ZfrRphphMN3zqud7qy/ceOY0aIGez0cFw
	qE6PxapuQe88SqJ0ZoFR4+1xAD7z1uCwc8ID7qUfEQymi/1gzmXDHYz/ZpP6mN6jNevlYfciLn6
	9co0WPGCnO6zenqPTDGltwIL6mVtjGdSrM1TkCABELEenj5vWatAWijma9JKlO5Feb7nNO0zPfA
	onoSgh+7cCH+2lqDwJG9p2D8cN82Sdb7PudNdvuW6rh01KPtcxBXvfDHNIt+WvKP+j6qK4CcGWa
	Nh2S6cYdKJbqtZDiq5TJd7JHLYqYiNgvxgBligUsJNSz1AzYc0aD9zrDNKib/02VBpb3RwYX+RC
	/yIoOeHNvYlhiLWtAAO2e7RYFawp69mJU42HbNyfgi/YyYlAM89Bv/YHXWpK+EvaHWAI5oj7JAd
	QQgpWQ3pnjdLtFkN5B7XtJYrda+ouOWeA08RVK3w8nn1WzqK3PZaKh7cMCYhoBwI9ol5KGRj+ky
	Us=
X-Received: by 2002:a05:6402:528e:b0:67c:fb8e:41c8 with SMTP id 4fb4d7f45d1cf-683b506305cmr10834394a12.12.1779208102962;
        Tue, 19 May 2026 09:28:22 -0700 (PDT)
Message-ID: <49d0cbe5-1366-4539-9754-371e9507a54d@gmail.com>
Date: Tue, 19 May 2026 18:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: fix sstc init to write vstimecmp instead of
 stimecmp
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1779207317.8631fc262581453bbf619ec5b2062170.19e4105277b000f373@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1779207317.8631fc262581453bbf619ec5b2062170.19e4105277b000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779208103-DA975CF5-89684A1C/10/73395122804
X-purgate-type: spam
X-purgate-size: 937
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:baptiste.le-duc@vates.tech,m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E380C5825F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 6:14 PM, Baptiste Le Duc wrote:
> According to the comment above initializing of CSR_VSTIMECMP should be used instead of CSR_STIMECM.

Probably, it is something wrong with my e-mail app but this line looks 
long enough.

I think we have to follow 80 chars per line.

Nit: s/CSR_STIMECM/CSR_STIMECMP

> 
> Fixes: 25e032730690 ("xen/riscv: allow Xen to use SSTC while hiding it from guests")

Nit: there is no need for empty line between Fixes: and Signed-off-by.

> 
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Nit: it also would be nice to put here what was changed, for example,
---
Changes in v2:
  - Update the commit message.
---

Please don't rush to send a new version of the patch. Probably 
committers will agree to make suggested fixes during commit.

With fixes mentioned above:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks!

~ Oleksii

