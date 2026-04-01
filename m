Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LCGIBkgzWnOaAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:39:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C837B5CF
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270290.1558997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7vmr-0006EN-UH; Wed, 01 Apr 2026 13:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270290.1558997; Wed, 01 Apr 2026 13:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7vmr-0006BY-Qm; Wed, 01 Apr 2026 13:39:13 +0000
Received: by outflank-mailman (input) for mailman id 1270290;
 Wed, 01 Apr 2026 13:39:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7vmq-0006BS-5R
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 13:39:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7vmp-00BePh-Hg
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:39:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd1fe8-5cb7-0a2a0a5109dd-0a2a4501e6aa-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:39:11 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd1fff-6fc9-0a2a45010019-d155802ea9c1-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:39:11 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486fe36cfabso6127305e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 06:39:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa?
 ([2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf24739easm36837455f8f.30.2026.04.01.06.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 06:39:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775050751; x=1775655551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4G+kgc23Mtl85Ap4hYz1pVGsMbvbcuun3C37EJxn4xY=;
        b=r8qz/UCVsm95B1rKYoCUtl3bagd7h2gG6jW7PTe/ZggGi3zs5Rl8cz0VEUVxcMu7JL
         LahR9Bu/8DCxB32AojqJmrJAFIZACfA1pvMfhDITVCEcIwn3x66E4thBD5TMCAN1JDpL
         9wzNZqtW2gUb/ai2BUYYX5cdhk9ll/qprnxec/PSssFRqU6q9je5XWEnq5dCwOgKucCV
         ziMK721TmFXBF3OfRx5JNFOvFNt3wZd80itprLEDCi/vuRlqYOe4+uze44dG+WOPfrRm
         feif5OtFovDhdlBhRKfzC6T/liYQp35KIie6gSPlzEOp5ps5N8dGAMDIWn1n4/NwXXFK
         VTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050751; x=1775655551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4G+kgc23Mtl85Ap4hYz1pVGsMbvbcuun3C37EJxn4xY=;
        b=VsrMUOJh4xpvwDJlK9rYqW4iJ7nKul8zqowjhvpiEjRJdYhWKTzgzxg8XW1/5tqrRL
         mnzNP5nppvH17CPmCniaBx1H69EGZibWhLl3DaW/w995sw8qAcWcp+DuLDX7flcyBqLZ
         TGWhiKcIse0R1M8hOtYJWARvbePcWNHJsg3POmF025LE5QJWHGneKIk9GZERWmjIVZsm
         0Z9ZI+OKsZPOQi8bMf12g8zOVJKt4Exzz/fj2eZ5QiLYtHyvPVGSIPc8hfzvJEx0M4+4
         UMJ9mP7Rv913YUU3peDaCkQDenVCLB9o0486u/15y97sxWjX3B042/EMi+p8wbvuDZTM
         LuQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj6d+2K4lAB2uTVvwB0fpYvCnBpcTcwVRrPHsvhHBdO6LNKi+wEQ2Z9BlL/RPJzDZJFQrowqiTWQo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/ApPszIVQ/mDZxGm904kX0zkqrFAcds57wBJ1PY4fU9ZPwlhZ
	L6KItnZGfYEGMLoe9M2K4WuvoHOIUryyY6QPgD8C8JhDFHqwiS6QK3Tu
X-Gm-Gg: ATEYQzx3izDyRmzNonyQpZ5RdOADGa5RzxZTkq4rdqiLeQyfDSTgSsjXaHjyeFXOCzy
	BkwMiGSaLvZoKg+vSg9Vt1IoPKUta9uB5nWS91vy+JL/vGg5wjMBBUzkkJm6M4hwieAjtFbbrtV
	ejdHk0HFttgfnnvtgkp8b17CsvhJiPTIQLvYi7aHUQ19+b8Nh8DkFGPQxBL/7Pux6tMPEYC+g4T
	cybDIWd05szqVvIsDK5N4JGad7oy1dPUUIruUX+7veLnnN+y+RW4AAs9D2LvJM7O2Fc/URCC3MV
	llU70fcBpFMGdkHLTuw/SnG/EI0FAMkR9PfPLxRsPXK5MWMxpjN10Y7CYdwAwFKuYSNr+PRZrAy
	RneHrPFYncu7G8eLDnH/LCvlS5zIBlsLzFUm1r4tRQy+ViDf1BsUr6FUl06/sw/QIAu+sxPpVdd
	ycPY5ysnepM3pnJDSOLl+q29nQLonaX4SMEpZ9k4hQhWO/SwSyN2mpTSrMHL5VzGtLzvPHEk4YM
	ZPfYACxhcn5shYc8f6zc3s=
X-Received: by 2002:a05:600c:1551:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-488835a15d2mr62276295e9.10.1775050750718;
        Wed, 01 Apr 2026 06:39:10 -0700 (PDT)
Message-ID: <c2e31e0f-17f3-463d-8439-1e5a301dafab@gmail.com>
Date: Wed, 1 Apr 2026 15:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/riscv: init_csr_masks()-related improvements
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <8eb8327bfb2f273cd0fa32ba65e84bb79e8607d4.1774863161.git.oleksii.kurochko@gmail.com>
 <46dd0df2-ccf1-4c5e-9f89-9b0b197e1c95@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <46dd0df2-ccf1-4c5e-9f89-9b0b197e1c95@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1775050751-B4358185-8BE4C0B3/10/73395122804
X-purgate-type: spam
X-purgate-size: 900
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 266C837B5CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 8:19 AM, Jan Beulich wrote:
> On 31.03.2026 21:04, Oleksii Kurochko wrote:
>> There is no reason to use _UL() in define-s sitting in C file hence use UL
>> suffix instead.
>>
>> Drop 3d argument of INIT_CSR_MASK() and INIT_RO_ONE_MASK() to reduce risk
>> of incomplete editing after copy-and-paste, or other typo-ing.
>>
>> Use _VALID_ infix instead of _AVAIL_ as the mask identifies architecturally
>> defined bits, not bits available for software use.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Seeing this is ready to go in, am I overlooking any dependency on earlier
> patches, or could this indeed go in right away?

No, there is no any dependency, it could go earlier then other patches 
of this patch series.

Thanks.

~ Oleksii

