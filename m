Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDuPBRZGA2ri2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:24:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651E523919
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:24:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306946.1578677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoxg-0007Hf-AH; Tue, 12 May 2026 15:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306946.1578677; Tue, 12 May 2026 15:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoxg-0007G8-7D; Tue, 12 May 2026 15:23:56 +0000
Received: by outflank-mailman (input) for mailman id 1306946;
 Tue, 12 May 2026 15:23:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMoxe-0007Fy-RS
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:23:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMoxd-00AOFE-TL
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:23:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0345fb-2eae-0a2a0a5409dd-0a2a45068124-14
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:23:53 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a034609-7371-0a2a45060019-d1558033d80e-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:23:53 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso48816765e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:23:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f410558sm40446705e9.5.2026.05.12.08.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:23:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778599433; x=1779204233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwBXFHs0lzdhpjzG5xBxPBnMCMuNjVm0MveNrz4qwK0=;
        b=U8MVMrjb4XceUr5VLqJhX3xvCfD2jFXjV/mU7fLRankjx8ur6lRdzSYBtSj8JyqMPX
         APeaCR/a8V+J8/QhTcHthJN8GLIGYzKyeBJjcA1YQVSqsA5yYOy1SLW70EGPFFwMIjV+
         PSFvDmndbP9+bFd1J9Ss8Skhl6hB1yuEg1CvOOtY4KFrBodSxWdxQ6Z2pI6dAKaX7M9y
         FwJ1nhjggii5ygeiMQkGYQHaVi810GgDD8iJe0A8kihJG6iH/Y0bOUN6d/0/6pk1J3Do
         /z4hmFPORGrUMJ8NlV05+3ZKEwIXVqpqNPT2Jr9262eNhPqXaJ901ESsdxb0O/xI51kp
         VEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599433; x=1779204233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwBXFHs0lzdhpjzG5xBxPBnMCMuNjVm0MveNrz4qwK0=;
        b=HpTMIA6pPyFW4VmnFli24GDXV9fq77RUa2KswcsDkzyWXvv0/kqzjourTo3b7nJCPa
         afm2wajGvDUUUxVZRK7g25Q2gDsLodcEsI/Gb1DuGAluIG2/zJ+IVvMymnvCIvaXcZne
         Rpnup/eJvJWqFiE9xgzO72Cg7O3a2KcUw2mZB0geOzMIALGMFNiePbWywXXoAzoplhwS
         QAl4xBZ58dgnTt47i8iJeRw/ZspSzQL93AWDj0VIFpHOmX/g1tYlAhtIf4ixUlkaO0Qj
         yMIVxM/ZXR+7QGtsSZG3/Ng9ZMlmLqTFeGk+KWAmra49fyWmk982HnHpku4uT/JXiFBs
         62cA==
X-Forwarded-Encrypted: i=1; AFNElJ9+/Mwj3Ay2aT+M8QAOE8DcANTXqYTDl7/NMUkulS+CY54Y2N+Yp2ZpuHjwCwjJHgUXeIfhBuluzuk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKGRV3zCbBD2pdROs88DMp+O+bPkLhlyUrN6KGg9VCtIVgYKzc
	T9PMTGXNQPeYA7MVqqwJ7CVpHjLw30iGvFB92I1dGLIHNsjF/IBaSwAC
X-Gm-Gg: Acq92OFsuddkUMy4QxTR2+mw+AyVWMxdH7mJAHtqQ3as/meVxLqv39Jikk4hAYpF29c
	lJF1cgnqWdb5huZzJtbjXFfPDTxSArSVdqSp9hkOWGHqzA2KtOK3psj+/797WKJyszDMBVEStKf
	SOZrkNGEqr1JXQayld2w32akjAcdZSwLU6lWXP3g7gJ0x7eTj0gcC/25SFGz95KhdqK2nKtjjhZ
	b1Pr/g4WzngfhTy8/+UcN3HTGtKfJoM8FIdzfMbbaoShMXiKLki17g+eDewJV2rf0xpzulOQ31+
	qJwxsuKYCj+iL0378pMBYqq8TJH8Ob61kmSrYz7iGXhBFTW1wb3Lm7HlTWsmXmyKLZ7z9v9p0aF
	XmWDFc93yaWhC7iSCDDarVJHKPYVJVRV8W4EzyvNl8BNOHDuZOAGcRtDwCbkUw/Yq9nPgjqXXQ/
	JeCTBOuBK181Th+r+wVCMvPJlABHr84+NBuXJIQNqQyKwL3Zl8K8cOR9fejHNdi9UvD2vO3adMS
	G4=
X-Received: by 2002:a05:600c:c058:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-48e8fe7b8bemr37613455e9.23.1778599433216;
        Tue, 12 May 2026 08:23:53 -0700 (PDT)
Message-ID: <3d8e5b0b-f7f5-4102-b3d2-a973517c8daf@gmail.com>
Date: Tue, 12 May 2026 17:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Fifth MPU Series
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260508143353.3512004-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1778599433-87371D75-43463CD8/10/73395122804
X-purgate-type: spam
X-purgate-size: 1804
X-Rspamd-Queue-Id: 9651E523919
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hello Luca,

On 5/8/26 4:33 PM, Luca Fancellu wrote:
> This series continues to further the ongoing work to introduce support
> for MPU systems in Xen.
> 
> The patches in this series aim to implement MPU specific p2m functions.
> 
> This serie is based on staging 10d417b8b62efa5093707c1dfe9bd48e0abeb331.
> 
> Harry Ramsey (2):
>    arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
>    arm/mpu: Implement p2m tables
> 
> Penny Zheng (1):
>    arm/mpu: implement setup_virt_paging for MPU systems
> 
>   docs/misc/arm/device-tree/booting.txt    | 14 +++++
>   xen/arch/arm/arm64/mpu/p2m.c             | 80 +++++++++++++++++++++++-
>   xen/arch/arm/dom0less-build.c            | 74 ++++++++++++++++++++++
>   xen/arch/arm/domain.c                    | 11 ++++
>   xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
>   xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>   xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
>   xen/arch/arm/include/asm/cpufeature.h    | 13 +++-
>   xen/arch/arm/include/asm/domain.h        |  4 ++
>   xen/arch/arm/include/asm/domain_build.h  | 21 +++++++
>   xen/arch/arm/include/asm/mpu/p2m.h       |  7 +++
>   xen/arch/arm/include/asm/p2m.h           |  5 ++
>   xen/arch/arm/include/asm/processor.h     |  8 +++
>   xen/arch/arm/mpu/arm32/mm.c              | 17 +++++
>   xen/arch/arm/mpu/arm64/mm.c              | 18 ++++++
>   xen/arch/arm/mpu/p2m.c                   | 72 ++++++++++++++++++++-
>   xen/include/public/arch-arm.h            |  6 ++
>   xen/include/public/domctl.h              |  4 +-
>   18 files changed, 353 insertions(+), 9 deletions(-)
> 

I am okay to have this patch series in the current release:
   Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

