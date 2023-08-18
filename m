Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FF78072F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 10:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585857.917058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWuuP-0008D9-4d; Fri, 18 Aug 2023 08:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585857.917058; Fri, 18 Aug 2023 08:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWuuP-0008BD-1X; Fri, 18 Aug 2023 08:32:41 +0000
Received: by outflank-mailman (input) for mailman id 585857;
 Fri, 18 Aug 2023 08:32:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWuuN-0008B1-4G
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 08:32:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWuuK-0003RV-9v; Fri, 18 Aug 2023 08:32:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWuuJ-0004J8-V1; Fri, 18 Aug 2023 08:32:36 +0000
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
	bh=gEVrgqXOZTLiOiqX/jFc9u4m5/9VT58SLbRlaiC95xM=; b=W8UG4i3H0kCFVp2ne1mgtJG+Z7
	sPjgAAOXhyBUn/+0339tfax9kIF1/LMjoE+NzqHhnbgCazT+hb0dbx/AG5yBxelE3/V2/7cBWBwoY
	nUKOS8Ta8x2GQt///sLefYYfnOmkCruanMPX0mEo93MBMznxSpnrCduwXb0gDfyunIyE=;
Message-ID: <e4b538d7-447b-4b4d-8c3a-bfb452cb76a8@xen.org>
Date: Fri, 18 Aug 2023 09:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 00/14] Xen FF-A mediator
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 31/07/2023 13:15, Jens Wiklander wrote:
> Jens Wiklander (14):
>    xen/arm: ffa: add direct request support
>    xen/arm: ffa: map SPMC rx/tx buffers
>    xen/arm: ffa: send guest events to Secure Partitions
>    xen/arm: ffa: support mapping guest RX/TX buffers
>    xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
>    xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
>    xen/arm: ffa: add defines for sharing memory
>    xen/arm: ffa: add ABI structs for sharing memory
>    xen/arm: ffa: support sharing memory
>    xen/arm: ffa: add support to reclaim shared memory
>    xen/arm: ffa: improve lock granularity
>    xen/arm: ffa: list current limitations
>    tools: add Arm FF-A mediator
>    docs: add Arm FF-A mediator

The series is now committed. Note, I had to resolve a context conflict 
in the CHANGELOG.md.

Cheers,

-- 
Julien Grall

