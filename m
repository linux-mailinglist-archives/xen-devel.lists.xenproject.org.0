Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L6O0G/CDMmpW1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:24:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0A699088
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:24:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DkPtUucG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340266.1601313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoNZ-0006gk-S2; Wed, 17 Jun 2026 11:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340266.1601313; Wed, 17 Jun 2026 11:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoNZ-0006eK-PA; Wed, 17 Jun 2026 11:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1340266;
 Wed, 17 Jun 2026 11:24:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoNY-0006eE-1A
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:24:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoNX-00Cpbt-62
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:24:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3283de-5cb7-0a2a0a5109dd-0a2a450bbf84-38
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:24:19 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3283e2-212f-0a2a450b0019-d1558034c560-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:24:19 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso48572925e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:24:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2e6a8fsm54072488f8f.37.2026.06.17.04.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:24:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695458; x=1782300258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBocIvoUleMZb+LC/S6F/0Ytgt4h7hzLS/5y+YIK+pg=;
        b=DkPtUucGefwOWNjD5Srdi0qG8RLvY0NN2j0qTBZadKu96s8eHx5GuB3VJcCvWUtGzC
         5XV8JgNMc6yttEtbFEMprXGPuP9ygQxZVRVt+mlV5oCZkV/zoyjpqy0mRdeHMlJXK1O3
         gNI1nrSNJfl62QlvaRNNhWUJCfMk0xeJHnweT7V8AgFuaVriSZLuytoFp30x3T6KL8LQ
         0xvt4KsTEJMS1jYPedhTAQUF7hbtAOgfIvZAnPyWvMBU4s3Ad3AnjgNApMrxv081B3oL
         hBRhvZx4Q9gq8Zp4ubBrmOBfAK2ICRYKS0xP4qij/4k7IksJCU1dYr1ty+cQXhXhFRXf
         LrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695458; x=1782300258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBocIvoUleMZb+LC/S6F/0Ytgt4h7hzLS/5y+YIK+pg=;
        b=ioNEQWFALNJj1D5mlAaId2AjGk9IHxpbkU5ZCn3fl3iamt32CJz6EMTcT1RXMEjfRe
         GgEe0uoEcu3woUt41l2VGG3AjY1wQtJBs4MX2eOYXyP6pcrHf0XfSrLL9ynBbi3iNhjC
         y5WCiK2B/GKPpbftsFN7puoePxVOSJcXp/ftwRALgUmz4oWVFFcQk5eaEdRg/uYraNY3
         Qb8hHjBnDHv3imn1laj//7hht0MzQb+ydZvSSPMb16tEpZwoMtowGyME6TEV+KHyNf4Z
         QfLBR7gKh8L5wgJFGIeaWd5OidBvQRqD9rWDGiYbgpNu9XGFGvtBeDygTzvV/rf9j9AN
         Qt5A==
X-Gm-Message-State: AOJu0YyvLN/3VqfUxFac6dfH7rRdUCUCkXzFtQLN8wv19qfcjPXDmSac
	IjaFNRdm8X9aIcEYTJxQ5Rba3Rkh5sSyQ6QT0MELstme4ggj5dVOcOlJSpsMLA==
X-Gm-Gg: Acq92OEmRcruIl8F9yIKmxlCJ/rGppIfSWk4kTY8B7AurWISuTQqV9nDzeX3zBPeq4x
	ZSi/bl05spnn1bSKLWdfhodmHiBSFQAaxXG4SDXK30eDC1MNfgHlwEOZg2HmC8Divxzrd3Nx1Do
	a2yCp7ZcNYlhepB1MwJsVr4XoZrGVCh73Hy6Is8qv50kbVShDfg9aAPVc7yiCFVvqmM0Hklcmnm
	0wyasAYkn8GXdIXgyqyBDBjKS2DgcKgzV53Mj4tmDBQ6u1CYXITLPrFNXn2l9uphMubyq138/ac
	U/Bp7eCSG74kZXUpRagCiTb6jKNx7etVyV0VgD55lIhvJQ1DgULhNCV3jd8ZwwxVqiCyKZGE/Aa
	7iHhVcdXMKwoAaCaneL0o34/Zlhk6hURRWiIe+gCHo/9t8EwrMpt8YfYJ2JPMPzypdfMdrTnfBg
	rww3EWS+AvsdWN2ipOa3aT7irDrRaggkhldy8RvmPd5dOt7DAkxb973nSoMXdLkjW4Dfk=
X-Received: by 2002:a05:600c:818f:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-492333ba2d8mr66733985e9.5.1781695458375;
        Wed, 17 Jun 2026 04:24:18 -0700 (PDT)
Message-ID: <a6f322e4-f5a6-48e1-bf6f-bb7739e14430@gmail.com>
Date: Wed, 17 Jun 2026 13:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/23] xen/riscv: generate IMSIC DT node for guest
 domains
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <18938bb8845fa91315e320f88d17147592aba51c.1781693963.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <18938bb8845fa91315e320f88d17147592aba51c.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781695459-22589F3B-E2EB1D2E/10/73395122804
X-purgate-type: spam
X-purgate-size: 349
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,wdc.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14E0A699088



On 6/17/26 1:17 PM, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -3,6 +3,8 @@
>   
>   #include <public/xen.h>
>   
> +#define GUEST_IMSIC_S_BASE __ULL(0x28000000)

It should be here _ULL(...) or even _UL().

Sorry for inconvenience.

~ Oleksii


