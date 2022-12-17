Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5F964F9DE
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 16:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465293.723944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Z56-0006UO-RN; Sat, 17 Dec 2022 15:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465293.723944; Sat, 17 Dec 2022 15:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Z56-0006Rq-Oa; Sat, 17 Dec 2022 15:26:32 +0000
Received: by outflank-mailman (input) for mailman id 465293;
 Sat, 17 Dec 2022 15:26:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p6Z55-0006Rk-In
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 15:26:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6Z53-0008Qd-AF; Sat, 17 Dec 2022 15:26:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6Z53-0000vI-42; Sat, 17 Dec 2022 15:26:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=pmPoEEycSInrIphKy1irRiK7vbaRkCFjmE5wIu5XwFM=; b=j4O7wqMWqAt2Ch36xr/Y2tGP25
	gxU9rGKFvWYpkc5GEXJjnPlXqx6ikVlMOUxHktUcy3oDataYPfKB44iCqkKxq/W9L6VGBdIflg8fe
	jMmaXgV7nWcGu3CmHmyY4bjWo/1YOBaOYrcYh4vHDjxFBjOjMksigJXMg3G8ATdFc+10=;
Message-ID: <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
Date: Sat, 17 Dec 2022 15:26:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
To: Stefano Stabellini <sstabellini@kernel.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com> <871qphc0p3.fsf@linaro.org>
 <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
 <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
In-Reply-To: <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/12/2022 22:36, Stefano Stabellini wrote:
>> Do you know what Xen version your build env has?
> 
> I think Alex is just building against upstream Xen. GUEST_TPM_BASE is
> not defined there yet. I think we would need to introduce in
> xen_common.h something like:
> 
> #ifndef GUEST_TPM_BASE
> #define GUEST_TPM_BASE 0x0c000000
> #endif

I think this would be a big mistake to add the two lines above in QEMU.

Libxl is responsible for creating the domain and generating the firwmare 
tables. Any mismatch of values will be a real pain to debug.

Even if...

> 
> We already have similar code in xen_common.h for other things.  Also, it
> would be best to get GUEST_TPM_BASE defined upstream in Xen first.

... we introduce upstream first, the guest layout is not part of the 
stable ABI and therefore could change from release to release.

> 
> 
>> Another way to fix this(as Julien suggested) is by setting this GUEST_TPM_BASE
>> value via a property or something and user can set it via command line.
>>
>> @sstabellini@kernel.org, do you think of any other fix?
> 
> Setting the TPM address from the command line is nice and preferable to
> hardcoding the value in xen_common.h. It comes with the challenge that
> it is not very scalable (imagine we have a dozen emulated devices) but
> for now it is fine and a good way to start if you can arrange it.

It is not clear which one you think is not scalable. If this is the 
command line option approach, then I think this is unrealistic to ask 
every user to rebuild there QEMU just because the guest layout has changed.

Today the rebuild may only be necessary when switching to a new release. 
But in the future we may imagine a per-domain layout (e.g. for legacy 
purpose). So you will now need to request the user to have one QEMU 
built per domain.

How is that scalable?

Cheers,

-- 
Julien Grall

