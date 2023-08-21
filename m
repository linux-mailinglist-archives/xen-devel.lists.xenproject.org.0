Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01300782F0A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 19:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587772.919174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8L7-0007dP-DE; Mon, 21 Aug 2023 17:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587772.919174; Mon, 21 Aug 2023 17:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8L7-0007aa-AQ; Mon, 21 Aug 2023 17:05:17 +0000
Received: by outflank-mailman (input) for mailman id 587772;
 Mon, 21 Aug 2023 17:05:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY8L5-0007ZG-W9
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 17:05:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY8L5-0004A6-J8; Mon, 21 Aug 2023 17:05:15 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY8L5-0004IE-Dd; Mon, 21 Aug 2023 17:05:15 +0000
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
	bh=0uaJAuBw8+GJ1203pkCBmdfcFb2P4R9LcXNaH4Q1ERI=; b=JYQHhR3bkTCbS0KnJHG4B1Rh0K
	rBsQtf7kcL/YeEut3OtAYRGNp9Mh2FOy6K96a9HMrGnTbdQTHdKtQIw9oA2srWgwcO2IE1/Mb+3Mt
	gETVDpeT7InMMaDmTk8gU2YOr8fX2IeDJl38USVA2t5dFHtOe4nXRuM+5mRsGOb2IQCo=;
Message-ID: <8f4c4974-a348-47f4-828e-d13df953900a@xen.org>
Date: Mon, 21 Aug 2023 18:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xen/arm: Some clean-up found with -Wconversion and
 -Warith-conversion
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230817214356.47174-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230817214356.47174-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/08/2023 22:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> This is a small series to fix some of the issues found while playing
> with -Wconversion and -Warith-conversion.
> 
> There are a lot more but the bulk are in
>   - bitmap
>   - cpumask
>   - nodemask
>   - bitops/atomics
>   - find_*
> 
> Some are not too difficult to address but other there are even
> prototype conflicts between arm x86.
> 
> Cheers,
> 
> Julien Grall (3):
>    xen/arm: vmmio: The number of entries cannot be negative
>    xen/arm: vgic: Use 'unsigned int' rather than 'int' whenever it is
>      possible
>    xen/public: arch-arm: All PSR_* defines should be unsigned

I have committed the series.

Cheers,

-- 
Julien Grall

