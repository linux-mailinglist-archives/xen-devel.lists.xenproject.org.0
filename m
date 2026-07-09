Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1DLPJeF8T2oUiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:50:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2247472FDF1
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:50:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Zv8aUfeW;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357934.1612249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmKJ-0005Jb-8e; Thu, 09 Jul 2026 10:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357934.1612249; Thu, 09 Jul 2026 10:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmKJ-0005Hx-63; Thu, 09 Jul 2026 10:49:55 +0000
Received: by outflank-mailman (input) for mailman id 1357934;
 Thu, 09 Jul 2026 10:49:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1whmKI-0005Hr-4m
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:49:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whmKG-00BcZL-Vc
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:49:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4f7cc8-2eae-0a2a0a5409dd-0a2a450adbca-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:49:52 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4f7cd0-e40e-0a2a450a0019-d155d0b2a8f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:49:52 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-39c62764c7cso6908031fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 03:49:52 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b007f68765sm2293170e87.10.2026.07.09.03.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 03:49:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783594192; x=1784198992; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zhWQNEAsdS01hIEuljmqZWiSFpvLV6INoFO1IuYSEcA=;
        b=Zv8aUfeWp219kJ6mlOEsVylyNeBm1f2UdzznvzNFsu+r6s8JPz3SdMyuufFLQ2U4W5
         36yZ4tMQJzW8stSI2guJIgdKng7VO0sd6XoLGDCoBra9aHAM/e9nmOgdodBxxAeFMUxp
         A1xc7BkRaXo911bNB4zEJjBh9EeVJ5UdXlrmyQyDge4hkMu5b3lvtYeO52kqKMSqe+Fd
         5jiXIpc/6q78LSUpQR8pqaCI4O8S0Jrj3pnlucLFtNidejbu1iZl1Kr4QKLAXbCeF6sU
         ZqlKTICsc6xr5j4QnC0UX+l0uLXGJRmMW4jDOhvTEKrXn3wB2Qe6M+41jhO9a8cKH0Lk
         oC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594192; x=1784198992;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhWQNEAsdS01hIEuljmqZWiSFpvLV6INoFO1IuYSEcA=;
        b=gatGbW49R1wYKZJyLukiwrxG37pLvpC4dYXN4vxotRSo0z7T0JA8Y2ONWi4P4Czw6r
         /+/soAQRwUC0P2/Fq97FgvxxtOmZ70NpZ+2edQzwsWjY4cEENaBJnl6hOnRkkg66MbbB
         D8NGPJbEupRvHZl3xGfz8WGGX0rwdwVLJMS7CPj/HdPH4DxCBQJ3TPWVgSkXh9beKZvW
         ZLymxfYl6+zoHViUlxeKdTC9PdtFp7W5Dldm+un3FiaFJZdALGxNQcbLODHnFtiM3JwA
         rKpimBdZWIG06+t2xMMbOt9YuG5Co/HXDZf8F834SkQNEQJe5rz1JIOIyFmDqi/Dfxbv
         /DiQ==
X-Gm-Message-State: AOJu0Yzqm3V5nGLaS1kPdnzhhHbMt61JZJsxmQE+rGy6Nw9Uvye/OqMx
	oYX3QLa0oVwGLgyU7QpJueU39V9YS4vx89AUcKcLq2+X7/tNZG7iSanW99vWBg==
X-Gm-Gg: AfdE7cnzK6swWr//nkhVXuGnm3BuqQDKIsv0wn1Mz5jPIfHNkA8wioZaZlJg/mED6pS
	Mpo0tXzzFXkxxDJmbuqunzkZQo9+l90HTOvAWwILOwtFO3Yu7zAaoQhe6Jm9FwukYVm5iqaZ3xC
	d4iZFn1xL4KAtgCuk4FVts0CW8Fp+fyx6d/4hU0evG+4oH2kL9NYU1g/iyquwuX6NWC4xJSvb2n
	oGRWVlMQMfB1Y+SmngCVvQ1OquKeWjUdEhS1XrH58nNBIDLKl3Ly/aOVvYty2MnuPU0gBQAWAJl
	5Y4jT8oPmxVTEWQnuvHR4byTKZThQxCSHdZuqe+Jheirw9nnydqM2za6MXjXMv9pIqDdps1qWRY
	ZraPHWD5OfVXVlxpI0bUtcjhh2AYNB3uEwJM4Sn8ACzZzY9XcL7otfl5ZpDwVl7/QI5UnVWqjbv
	E7odj5MaxdvIXUgU+UZ/JpUkgpkG9KviBWuuEGo+aaqTGmD/DIgvU2MmkeSre8iEd6mdnlypUEk
	SOsJg==
X-Received: by 2002:a05:6512:3e0d:b0:5ae:b6cf:c745 with SMTP id 2adb3069b0e04-5b016d36f76mr446246e87.17.1783594191995;
        Thu, 09 Jul 2026 03:49:51 -0700 (PDT)
Message-ID: <89509e85-3345-41f8-a6dd-5dc4ba3619ac@gmail.com>
Date: Thu, 9 Jul 2026 12:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Orzel, Michal" <Michal.Orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Question regarding Locking in the MMIO Handling Framework on Arm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1783594192-D653FDDE-88268D39/10/73395122804
X-purgate-type: spam
X-purgate-size: 1332
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:Michal.Orzel@amd.com,m:bertrand.marquis@arm.com,m:julien@xen.org,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2247472FDF1

Hello everyone,

I have a question regarding the locking in the MMIO handling framework 
on Arm.

Is it sufficient to have read_lock() only in find_mmio_handler()? If
register_mmio_handler() is executed in parallel with find_mmio_handler() 
(which I assume was the reason for introducing the rwlock), aren't we 
still exposed to a race condition?

find_mmio_handler() returns a pointer to a handler, but the object it 
points to could be changed by a subsequent call to register_mmio_handler().
If register_mmio_handler() runs between find_mmio_handler() and 
handle_{write,read}(), we could end up operating on a different handler 
than the one that was originally found.

In other words, shouldn't we acquire the read_lock() in 
try_handle_mmio() and keep it held for the entire duration of 
try_handle_mmio()?

It seems this is not an issue at the moment because 
register_mmio_handler() is only called during domain creation. If that's 
the case, do we really need the rwlock at all?

One more thing: it looks like
   BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);
in register_mmio_handler() would be better placed inside the 
write_lock() section. As again in the case if register_mmio_handler() 
will start to be called in parallel we will have an issue.

Thanks in advance.

~ Oleksii

