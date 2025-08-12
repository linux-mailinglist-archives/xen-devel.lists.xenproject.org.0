Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9129B232EB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 20:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079012.1440002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulteE-0006PV-E2; Tue, 12 Aug 2025 18:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079012.1440002; Tue, 12 Aug 2025 18:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulteE-0006O3-BP; Tue, 12 Aug 2025 18:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1079012;
 Tue, 12 Aug 2025 18:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=clj1=2Y=contentwise.tech=evgeny@srs-se1.protection.inumbo.net>)
 id 1ulteC-0006Nx-Ht
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 18:22:56 +0000
Received: from mailrelay-egress1.pub.mailoutpod3-cph3.one.com
 (mailrelay-egress1.pub.mailoutpod3-cph3.one.com [2a02:2350:5:420::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a96ad22-77a9-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 20:22:50 +0200 (CEST)
Received: from [192.168.0.129] (unknown [178.237.248.31])
 by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 4f557671-77a9-11f0-8322-494313b7f784;
 Tue, 12 Aug 2025 18:22:49 +0000 (UTC)
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
X-Inumbo-ID: 5a96ad22-77a9-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1755022969; x=1755627769;
	d=contentwise.tech; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=o18mX66fv7m2/x+9NXZNaApWJUfSc50tE6cdv2xwR5k=;
	b=RRkEX9NN/NANJbheaJfK3OQHdtl/8QkwMEHr8yyXlMnkVGpJi1j3Vkl7PEOdtsYweGEpZ6ay8gE71
	 7KbmFkatVntQgi6yLiSkeZJEGXCLFPu63YXzkUaVgQ5KWBBVNpFGVq3rID/9trBTEmBIB1MNRa+I/L
	 n0ns1v2tMT03FQ4VGgi+vyOXiizhSgAdvIaEx7Jw81T64itL6P8fEakF8sPlkxepvWUATqkeoXqa8n
	 Kh63R/vIaM8MHvckToANC+eO2aJsLNgrIDV+LctPg0/f1iotzSPmjYzalTPQapPdNm44N+zMmPb1p1
	 F3YT/I9qkRe2/PFIvIkrolnyZprFJ6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1755022969; x=1755627769;
	d=contentwise.tech; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=o18mX66fv7m2/x+9NXZNaApWJUfSc50tE6cdv2xwR5k=;
	b=LqYCT8a0gAbFVPaf2J4oCKMz+8bMFOH0Qu2igMtufhJmNEWoFws1qwIMxBM6rxS/NowRfDZItHWUI
	 xvCElabDA==
X-HalOne-ID: 4f557671-77a9-11f0-8322-494313b7f784
Message-ID: <28a1e017-f2c1-48ad-9174-c4184524b62d@contentwise.tech>
Date: Tue, 12 Aug 2025 21:22:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] BCM2711 reboot fix
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, miro@contentwise.tech
References: <1754252178882.7.40484@webmail-backend-production-957f95bc8-4zxxx>
 <f9ac14d5-2b8c-4983-b171-789e2fa196c8@xen.org>
Content-Language: en-US
From: Evgeny Beysembaev <evgeny@contentwise.tech>
In-Reply-To: <f9ac14d5-2b8c-4983-b171-789e2fa196c8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry, this is quite a rare experience for me. I'll prepare a new 
submission in a separate thread. Thanks

Evgeny

On 12.08.2025 01:22, Julien Grall wrote:
> Hi Evgeny,
>
> (Top-posting because this is related to the process)
>
> Thank you for sending a new version of the patch. I am having trouble 
> to apply this patch properly using "b4". It seems to add more content 
> in the git log. E.g.:
>
>     Message-ID: 
> <0057d145ddd90c01922636205484088c02a0e45a.1748380800.git.megabotva@gmail.com>
>     From: Evgeny Beysembaev <evgeny@contentwise.tech>
>     Date: Tue, 27 May 2025 13:48:31 +0200
>     Subject: [PATCH] BCM2711 reboot fix
>
> Looking at the content of the e-mail in more details, I see you posted 
> the new version as a reply to the previous patch. So it contains some
> part of the previous answer. Patches submission should be on their own 
> email (ideally in a new thread) with the subject contain the tag 
> [PATCH v<N>] where <N> is the revision ID (in your case it should be 
> two).
>
>
> On 03/08/2025 21:16, Evgeny Beysembaev wrote:
>> According to the commit b334c1afad17 ("ARM: dts: bcm2711: Use proper 
>> compatible in PM/Watchdog node")
>> in Linux kernel, the `compatible` string for the watchdog peripheral 
>> in the DTS has been modified from
>> `brcm,bcm2835-pm` to `brcm,bcm2711-pm`, which caused 
>> `rpi4_map_watchdog()` function to fail,
>> leading to inability to reboot the system under Xen hypervisor.
>
> On my e-mail client, the lines will be wrapped. But when applied, you 
> have some lines well over 72 characters. Please re-wrapped the commit 
> message.
>
> For more details how to submit a patch, I would suggest to read:
>
> https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches
>
> Patch diff itself looks good to me.
>
> Cheers,
>


