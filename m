Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB99782627
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 11:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587437.918814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY134-0003Va-HZ; Mon, 21 Aug 2023 09:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587437.918814; Mon, 21 Aug 2023 09:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY134-0003Sb-El; Mon, 21 Aug 2023 09:18:10 +0000
Received: by outflank-mailman (input) for mailman id 587437;
 Mon, 21 Aug 2023 09:18:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY132-0003SV-IK
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 09:18:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY132-0001L3-3H; Mon, 21 Aug 2023 09:18:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY131-0004eW-U9; Mon, 21 Aug 2023 09:18:08 +0000
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
	bh=PeR3DWP6ML9TMDhiiCrGMKnX38BXCKnT5/9aVEsTcnI=; b=Ux27h4UVueTHOuvGDjSdCxOMd9
	bO67xLQ9a/FN7sHa5Dvb6EM5mPOph/vJZzq5KRkbG4+KGoAz4NCgdikpWNoqLDDRMJqyhrLWbS+Jf
	WeUVWcPFgV6hrd8PwU3mlLk39lkKF2WxSV8JrdqnRfa88XlO5oWE5UFKAcSs/zaWuOYA=;
Message-ID: <bffdb783-fd63-4a93-b80b-42634643b2d3@xen.org>
Date: Mon, 21 Aug 2023 10:18:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen/arm64: Split and move MMU-specific head.S to
 mmu/head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-5-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-5-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/08/2023 05:25, Henry Wang wrote:
> The MMU specific code in head.S will not be used on MPU systems.
> Instead of introducing more #ifdefs which will bring complexity
> to the code, move MMU related code to mmu/head.S and keep common
> code in head.S. Two notes while moving:
> - As "fail" in original head.S is very simple and this name is too
>    easy to be conflicted, duplicate it in mmu/head.S instead of
>    exporting it.
> - Use ENTRY() for enable_secondary_cpu_mm, enable_boot_cpu_mm and
>    setup_fixmap to please the compiler after the code movement.

I am not sure I understand why you are saying "to please the compiler" 
here. Isn't it necessary for the linker (not the compiler) to find the 
function? And therefore there is no pleasing (as in this is not a bug in 
the toolchain).

Other than that, the split looks good to me.

Cheers,

-- 
Julien Grall

