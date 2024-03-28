Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DE18907D1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 18:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699146.1091766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpu17-0000Ib-H6; Thu, 28 Mar 2024 17:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699146.1091766; Thu, 28 Mar 2024 17:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpu17-0000G2-EH; Thu, 28 Mar 2024 17:58:21 +0000
Received: by outflank-mailman (input) for mailman id 699146;
 Thu, 28 Mar 2024 17:58:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rpu16-0000Fw-07
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 17:58:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpu15-0008WM-Bi; Thu, 28 Mar 2024 17:58:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpu15-00033W-3f; Thu, 28 Mar 2024 17:58:19 +0000
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
	bh=0hm1AqLZSGL8zb0pM9llSwhKywcrruBNnAT3mJmXX78=; b=22KQHmmeumbzSFToS0LNwzlknK
	xysdFjSF/cpkngTr+G5Tsr1hiooZKrGR6a8IsnB0Y1PnO4/1YXjw2dR18fc+wM5oZBSNVjiL7deBZ
	0Ox4zq/6id/RTaFfGrN0qD+zQX27TtuTyODJ3NVnPz4haD0MomKcMJ/zbhvUVCFjaJCA=;
Message-ID: <e43bee20-3307-4646-ac1b-a794e8211b4b@xen.org>
Date: Thu, 28 Mar 2024 17:58:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/6] xen/arm: ffa: separate memory sharing routines
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
 <20240325093904.3466092-4-jens.wiklander@linaro.org>
 <F5023C5E-4563-4643-865B-601B022F7AC8@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F5023C5E-4563-4643-865B-601B022F7AC8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 27/03/2024 13:40, Bertrand Marquis wrote:
> Hi Jens,
> 
>> On 25 Mar 2024, at 10:39, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>
>> Move memory sharing routines into a separate file for easier navigation
>> in the source code.
>>
>> Add ffa_shm_domain_destroy() to isolate the ffa_shm things in
>> ffa_domain_teardown_continue().
>>
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> 
> With the copyright date mentioned after fixed (which can be done on commit):
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com

I have fixed and committed the series. However, it wasn't trivial to 
find the comment in your reply. In the future, can you try to trim your 
reply?

Cheers,

-- 
Julien Grall

