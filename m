Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6134677CB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237613.412137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8C3-0004R0-Lr; Fri, 03 Dec 2021 13:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237613.412137; Fri, 03 Dec 2021 13:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8C3-0004Oc-Hf; Fri, 03 Dec 2021 13:01:39 +0000
Received: by outflank-mailman (input) for mailman id 237613;
 Fri, 03 Dec 2021 13:01:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mt8C2-0004OT-GA
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:01:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt8C1-0004jX-Cc; Fri, 03 Dec 2021 13:01:37 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.21.218]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt8C1-0001t1-67; Fri, 03 Dec 2021 13:01:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=CR8dscnd52wvDxYKBMuYTBECdFZU19Y9HvG1QbW51/I=; b=qQc8d9fDo7+bbFnLSdwFCdNawa
	D9LVhhgbgWWN5iuC6CDXFE4MqSkP033Alc07/cF45uh57kU4Zfnz24qEWISI4eeS3XSMTygx0dpJ5
	jFzej4ddkwqFnKyzzy+UL2acVCX/GYj3pC3p/f7UL/Yw//1hcafEzOptqNeqESWNsJes=;
Message-ID: <f543ce0d-8b0d-2b02-e9af-ae8d90f4896d@xen.org>
Date: Fri, 3 Dec 2021 13:01:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v7 0/7] PCI devices passthrough on Arm, part 2
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211124075942.2645445-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 24/11/2021 07:59, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> This is an assorted series of patches which aim is to make some further
> basis for PCI passthrough on Arm support. The series continues the work
> published earlier by Arm [1] and adds new helpers and clears the way for
> vPCI changes which will follow.
> 
> RFC is at [2], [3]. Design presentation can be found at [4].
> 
> I have removed patch
> [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled devices
> as it seems that this needs more time for decision on how to achive
> that.
> 
> I have also added a new patch
> [PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host bridge
> with a tiny latent bug fix.
> 
> Thank you,
> Oleksandr
> 
> [1] https://patchwork.kernel.org/project/xen-devel/list/?series=558681
> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
> [3] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
> [4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf
> 
> Oleksandr Andrushchenko (7):
>    xen/arm: rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE

[...]

>    xen/arm: do not use void pointer in pci_host_common_probe

I have committed these two commits. I was going to also commit patch #6, 
but it looks like an ack is missing from Paul.

I still haven't reviewed the rest of the patches.

Cheers,

-- 
Julien Grall

