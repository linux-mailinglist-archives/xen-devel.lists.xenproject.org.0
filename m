Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8167A328
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 20:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483721.750060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKP5D-0007G5-QT; Tue, 24 Jan 2023 19:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483721.750060; Tue, 24 Jan 2023 19:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKP5D-0007E5-Ng; Tue, 24 Jan 2023 19:35:51 +0000
Received: by outflank-mailman (input) for mailman id 483721;
 Tue, 24 Jan 2023 19:35:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKP5B-0007Dx-VE
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 19:35:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKP5B-0002z6-Lt; Tue, 24 Jan 2023 19:35:49 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKP5B-0003EC-GL; Tue, 24 Jan 2023 19:35:49 +0000
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
	bh=40ovQOdqdNKYosNiIyhFCiP3TotRxN751t34JAYVahw=; b=d8TvLErFib9Tss2uolGcDLAWUD
	Z+sYD/QIoucmBDvhJ/FExJAPZ3L3BWt7JXJJ8EA9vSwFMkYyqUjOGaTcBknc7uCzauYCZg8LbxkVM
	VgoytSZCXhf8dzrYIdWOp1wOdc5jYKZAXpEMjxH/5nDkmDA4Yl42evtM19LK1u3z4RXU=;
Message-ID: <715433bd-69ff-8682-bd15-fc8f7502ea61@xen.org>
Date: Tue, 24 Jan 2023 19:35:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 00/14] xen/arm: Don't switch TTBR while the MMU is on
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113101136.479-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 10:11, Julien Grall wrote:
> Julien Grall (14):
>    xen/arm64: flushtlb: Reduce scope of barrier for local TLB flush
>    xen/arm64: flushtlb: Implement the TLBI repeat workaround for TLB
>      flush by VA
>    xen/arm32: flushtlb: Reduce scope of barrier for local TLB flush
>    xen/arm: flushtlb: Reduce scope of barrier for the TLB range flush
>    xen/arm: Clean-up the memory layout
>    xen/arm32: head: Replace "ldr rX, =<label>" with "mov_w rX, <label>"
>    xen/arm32: head: Jump to the runtime mapping in enable_mmu()
>    xen/arm32: head: Introduce an helper to flush the TLBs
>    xen/arm32: head: Remove restriction where to load Xen

I have committed up to this patch. I still need to go through the 
comments of the rest.

>    xen/arm32: head: Widen the use of the temporary mapping
>    xen/arm64: Rework the memory layout
>    xen/arm64: mm: Introduce helpers to prepare/enable/disable the
>      identity mapping
>    xen/arm64: mm: Rework switch_ttbr()
>    xen/arm64: smpboot: Directly switch to the runtime page-tables
> 

Cheers,

-- 
Julien Grall

