Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522BE7CAC4E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617694.960547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOxY-0000zE-HU; Mon, 16 Oct 2023 14:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617694.960547; Mon, 16 Oct 2023 14:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOxY-0000uh-Ef; Mon, 16 Oct 2023 14:52:44 +0000
Received: by outflank-mailman (input) for mailman id 617694;
 Mon, 16 Oct 2023 14:52:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsOxW-0000uL-Rk
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:52:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsOxW-0004y6-B7; Mon, 16 Oct 2023 14:52:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsOxW-0003Aq-5U; Mon, 16 Oct 2023 14:52:42 +0000
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
	bh=pB77ockGoewyVqYBevlh+0bh0VxhXVuVg4dO4hMK4LE=; b=edTYCX+rJ7f6ctXUSN1bGrPpxP
	XAf7LHqZWZHDLmQcC0CMdcxZZEFUz6u0R3J8anY2RRuGoQgo3m1zNoriIjniLcDQK9nrTpirIbED2
	c0XQvxa92MJ0xwqkO/MzdXUBdUFWY5i6sknZIpyuEEbxT8JeeQUu30Wwd0OMy+g7Q+SU=;
Message-ID: <703ec7e7-30b0-4c05-a208-65018cac98fd@xen.org>
Date: Mon, 16 Oct 2023 15:52:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <83ABBD09-D994-4DA3-8F10-15D87BCC2CF1@arm.com>
 <20231016135427.GI928468@leoy-huanghe.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231016135427.GI928468@leoy-huanghe.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Leo,

On 16/10/2023 14:54, Leo Yan wrote:
> On Mon, Oct 16, 2023 at 01:40:26PM +0000, Bertrand Marquis wrote:
> 
> [...]
> 
>>> This patch enlarges identity map space to 10TB, allowing module loading
>>> within the range of [0x0 .. 0x000009ff_ffff_ffff].
>>>
>>> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
>>
>> I agree with Michal here, this is not a fix so this should be removed (can be done
>> on commit).
> 
> This is fine for me.
> 
> I'd like to confirm with maintainers that should I spin a new patch
> set to remove the fix tag?  Or maintainers could help to remove it
> when pick up this patch set.

I can do small changes while committing (updating the fixes tag is one).

That said, we are in the middle of the code freeze for Xen 4.18. Any 
patch requires a release-ack from the release manager (Henry). I am a 
bit split at the moment whether we want this patch for Xen 4.18. So I 
have asked opinions from Henry (others can also provide some).

If it doesn't go for Xen 4.18, then Stefano might be able to queue it in 
his for-4.19. Otherwise, it will be picked up when the tree re-open 
hopefully in a couple of weeks time.

Cheers,

> 
> And thanks for review, Michal and Bertrand.
> 
> Leo
> 
>>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Cheers
>> Bertrand

-- 
Julien Grall

