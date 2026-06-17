Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tEjbIaGLMmpE1wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:57:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E66995C0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:57:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="JkMiV/i8";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340365.1601421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZotN-0001Rh-T5; Wed, 17 Jun 2026 11:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340365.1601421; Wed, 17 Jun 2026 11:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZotN-0001Ot-Pc; Wed, 17 Jun 2026 11:57:13 +0000
Received: by outflank-mailman (input) for mailman id 1340365;
 Wed, 17 Jun 2026 11:57:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZotM-0001Ol-Mi
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:57:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZotL-00FYE1-LJ
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:57:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328b8d-5cb7-0a2a0a5109dd-0a2a450ad2b0-20
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:57:11 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328b97-56b3-0a2a450a0019-d155802fd4ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:57:11 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so36862885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:57:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a9b45bsm128734775e9.15.2026.06.17.04.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:57:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781697431; x=1782302231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcEj/wX8+0v0s7gTYD+pD7os/25DvNNp/UVvbt2iki4=;
        b=JkMiV/i8klO9DqUi+mEJYBx/3rnFuBVSV8OTFofsOAaivL9Zr9KICa5nM+NokjV5AE
         ADFvS20JBeoP1okHdOc8LfnbcBBBN+c5MP/6voGKuslM7To7cVb1VXhwP7IkzsvykbIJ
         aUa9kZaRnQrq8wa7S+S+4yPVN3pL3XDEHm71N/o3Jj+DoR5MRjmVUoPs+be93QLx8dh8
         JH+Q5iqbudJmgNq84PVzo/2Q/BxgeZTjiCl/VZ0wMfruGddaqS/uDHCf1vDGbqkP79yn
         UOYfR1Puj34d7Fh7JNdsYONBznX2jYJ8xY6EBWl8XXcyxV+rx43sRKHcMneCby5zw21q
         6e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697431; x=1782302231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcEj/wX8+0v0s7gTYD+pD7os/25DvNNp/UVvbt2iki4=;
        b=pT4WmazrbTqQvYeZ+kt25Mvk6yeqwoKvt4CZCtzxY0YfBup4CPmfTsfZB7E4WQIrAv
         BXfR74lcRbpGiJ/J2VWNSYESs9A98175nUvg47oqiJjxBponNAYuP3T0uJI5R/Bp4ACC
         E/Gb1qQrKR/81eHGvlHTDurm5QzwdpxnSH/ZMeuXhf2SfemoQ392tQ9OgzcpPf4SwiwW
         Nn/0QEBd3XXY0cebFh8/Ns7PBdEGqsEIeUu1FR4QFt/JMI4mvVsHC6EFXygaGul+fwY7
         8wFBVSApYb1gxunjwEbjxFNRZygfqoligaDcsKvEknsC9b3xDQH4HvJrEEnX8zZQYrhd
         s2WQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VdYwPXwt42UyfYRBrqv9qE4wq9SkabTWUR7CUReWdEO+HsO+vzF7TEvMsOA76tbsxxkBJBlIFWqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL+Ti+PF6D7//aCeWKhTX9BMPVvaUWdksizlQ/04/KlzKrtIwV
	Q2MWAdkQFbgNuCDE9qcoX9+penmJezE+epHZmRhlxCy74Ip1Db/BWPv3v5lurw==
X-Gm-Gg: Acq92OFjFuxDBgQyOajW3dwGfUDU98yL500Hsdsjyj+2sr6vT2QMMkruG2AH7PGoRl6
	V1AB3ZDLtBsZjUW51dCI5rilRRtR1DrdB2hXEjGV1g/lw1nfh4aRPZpaltj/GugYJ7QIravhFEj
	nvDPZpYdMu9z79G24+vjBr5j/Gzqb+cucseIFkmlBXPkXUCa0BwoFJs/7mIlMSwD2W9m795CueR
	agOFD/DEvgziqfkAMq2KtLexuzrDEaWvbj+zUjldtDamT7reCAcG7YDJLc+kZiUPbqJ0uz9lCGz
	3OWzCKEcsFDGawvHzELZ62FCYyGQVKnOue5+7XnHc6yTVFfGRGe/LKQ9c06csWP1RFJpAy/ZB5A
	UjaZ2dZckf5rCt/aV3SprJVpNrIhI+dJ1WXLXUZfwqZB/sv/rZackcqVK2fPlqYxvnsjdPTioDi
	XOiSadpkGucwAzAdrRAsmWLje7Ix7ffY8+tUgtHwq+JWEqgTJlJU6Z3yZnGuo4qRD66Y8=
X-Received: by 2002:a05:600d:103:b0:492:10e8:3f92 with SMTP id 5b1f17b1804b1-492333c94f6mr41085095e9.17.1781697431025;
        Wed, 17 Jun 2026 04:57:11 -0700 (PDT)
Message-ID: <b25b051d-c37e-4110-b250-a3c2ce34a936@gmail.com>
Date: Wed, 17 Jun 2026 13:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22? 4/7] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <f17b9ac9-abeb-44c1-8eab-6b08d563bc5a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f17b9ac9-abeb-44c1-8eab-6b08d563bc5a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1781697431-7176D8B7-0AD39D5E/10/73395122804
X-purgate-type: spam
X-purgate-size: 414
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 315E66995C0



On 6/17/26 11:27 AM, Jan Beulich wrote:
> While the granting of permissions when mapping was already removed from
> this operation, check whether permissions actually were granted when
> adding a mapping; the check of the requester having permission remains
> unaltered.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

