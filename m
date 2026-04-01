Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D29G3AkzWlkaQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:58:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D537BB2B
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270334.1559033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7w4z-0002NN-7J; Wed, 01 Apr 2026 13:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270334.1559033; Wed, 01 Apr 2026 13:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7w4z-0002KX-3k; Wed, 01 Apr 2026 13:57:57 +0000
Received: by outflank-mailman (input) for mailman id 1270334;
 Wed, 01 Apr 2026 13:57:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7w4x-0002K0-BW
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 13:57:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7w4w-0075oB-NN
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:57:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd2457-5cb7-0a2a0a5109dd-0a2a4509a278-40
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:57:54 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd2462-bf79-0a2a45090019-d155dd2fbcf9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:57:54 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43d17bb1c65so428429f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 06:57:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa?
 ([2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e52a0sm12470f8f.30.2026.04.01.06.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 06:57:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775051874; x=1775656674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUZMAdF4ivbIXalcOFKTDwoVQAHa9uHqKk5ZVbAmvHo=;
        b=kLrQbLsEuK7Oib0oeh7LP7chiWqQuB0kTdijuhvx+Ss0EwFUlkXrzV0/Rs24omsGWI
         lw9palfhx5GFVZ3I2NM+VhnnQUQ4yUEgZ8AjKrbchS0Wk6nc5IOQeSSRggt0tyNdRSkM
         IRNtr7U5adkrCtHGNTMHsgV4XqLcw/4/p5eL2yFAY18DOpnXVstDPDndF8yhuNc0vXeL
         Nn2mTqyR+a8F2prdoUYgbOlChxk16fRZYUzVTt4svFvfO0man9TDA14bYLpI0TekSP7z
         5OMlfhcxNvyAmV3V7bCPhT5eeREM4dFlz0dt0P+819UtQ+mvLe/P36JabRn0c/zDNELF
         ueQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051874; x=1775656674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUZMAdF4ivbIXalcOFKTDwoVQAHa9uHqKk5ZVbAmvHo=;
        b=XahNZRJ5ub3tCIOMYgS09CG6RjQfVXJLrJnvlh8eYWFmNAyt8YhBQ6wDzkqUftcd8h
         2JOZA5yF3TeJzjYdTmTYJZhSUSFEyGHMfWpnNPSyXyFUrIBA+ytmdlozEkeAmMODCJ30
         h3wKWjnlnj5OGKwkykswOOTgItUMqPTGS/mqkcoGPydY6l4i77Pl0bdo+kcBpAn4X6OU
         00Vvthj1T96Dw+K1dObUlLYpiE8KdOFQrL3TwgDQ0sHZOgwgDjgT+Eb+x0FS2B+PdbgV
         pca8Dn4aMIdhxjkAnm75Z5MnDZNXsib0gvHMqjT00FSDq3svjJpv4PVHEmMm1Qispwov
         +JhA==
X-Forwarded-Encrypted: i=1; AJvYcCU6WicD0nLzPj0WNOngkyQ9NUAYHNz1XAymgfo7hovKPy2gpOaiVc6NdRUcSQzu1LL24/G6+geYLbU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVE+rZPAwOWuQY7iTF41722KmJ0ZFaRccONvTeGgJwFnoGV7Hi
	4AgomAD5/BnAcb0f50JIJm2amWVOqj+OOvh/R850YRvGMVHB0RloJpWB
X-Gm-Gg: ATEYQzwEeUQRdPepGLWqOmC+HSxaJqm0vOZNR/4vTwfN6myuBHsGq2NRMi9MW4okY9n
	/Ok9m94SS+6zeY+x3wV+Oo//qnXNtD5+clZE4ALpWYyrQm0E2gy2/SYGvV89Wnya6O/t0mXfFaf
	CUjK/nQwE+kj0s/6oVLeyAaOQZAn93PE9hHMnOgTkWqZjSKBAP3PxnMFsvYgMwHczXAKcZIwwyu
	Qp8DAdnBC/H7x/hpnRaTnmw9GB00xOP3p9WW6zqdpuqVNfF+bU4DQ9k9aBFdjLuKVV3g6kYzWV3
	SU76szfRONFUJf1/m83roSqKJ1iVGYgO4THSZ/7lD8owb0aiykGXmQz50saNVRFk1F/AGoQI1zg
	fqXdlMNfF+n6Tfd2GflfGHF5mbqtFgg/XhMh0Dqg4f/pB/8m08KObDhkMRFVbbIK0fhr0ivdj4v
	caoJXSdy31yTLsaBonFEpSJzPhksdnPE/pYBj0/YSjxI6nmiqB5xKJxOZi8fa/GccF9SnadpV2O
	HbvnIq8S8aVrUGRDczBJw==
X-Received: by 2002:a05:6000:18a3:b0:43c:faee:87e with SMTP id ffacd0b85a97d-43d1512f373mr7334739f8f.48.1775051873960;
        Wed, 01 Apr 2026 06:57:53 -0700 (PDT)
Message-ID: <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
Date: Wed, 1 Apr 2026 15:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
 <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775051874-2E949152-40001258/10/73395122804
X-purgate-type: spam
X-purgate-size: 2432
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E76D537BB2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 8:17 AM, Jan Beulich wrote:
> On 31.03.2026 18:14, Oleksii Kurochko wrote:
>> On 3/30/26 5:51 PM, Jan Beulich wrote:
>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>>> so introduce macros to describe guest RAM banks.
>>>>
>>>> The reason for 2 banks is that there is typically always a use case for
>>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>>> there are other things under 4 GB it can conflict with (interrupt
>>>> controller, PCI BARs, etc.).
>>> Fixed layouts like the one you suggest come with (potentially severe)
>>> downsides. For example, what if more than 2Gb of MMIO space are needed
>>> for non-64-bit BARs?
>> It looks where usually RAM on RISC-V boards start, so I expect that 2gb
>> before RAM start is enough for MMIO space.
> Likely in the common case. Board designers aren't constrained by this,
> though (aiui). Whereas you set in stone a single, fixed layout.
> 
> Arm maintainers - since a similar fixed layout is used there iirc,
> could you chime in here, please?
> 
>> Answering your question it will be an issue or it will also use some
>> space before banks, no?
> I fear I don't understand what you're trying to tell me.

I meant that there is also some space between banks and pretty big which 
could be used for MMIO which could be used for non-64-bit BARs.

> 
>> Further, assuming that the space 4G...8G is what
>>> you expect 64-bit BARs to be put into, what if there's a device with a
>>> 4G BAR? It'll eat up that entire space, requiring everything else to
>>> fit in the 2G you reserve below 4G.
>> I assume that such big devices could use high memory without any issue.
> Well, I could go (almost) arbitrarily low with individual BAR size,
> merely increasing the number of BARs accordingly. Assuming 2G BARs are
> 64-bit capable is likely fine. Maybe the same is true for 1G and 512M
> ones as well. Yet a some size the assumption will break.
> 
> IMO RAM layout wants establishing dynamically based on the MMIO needs
> of a guest.

I have this in my TODO.

But with the current implementation of dom0less it requires to have RAM 
banks defined in compile time.

Can we process with the current suggested way with the following update 
of dom0less code to work with dynamically allocated RAM layout?

~ Oleksii

