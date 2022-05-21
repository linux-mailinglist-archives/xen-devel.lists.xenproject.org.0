Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E313852FC1A
	for <lists+xen-devel@lfdr.de>; Sat, 21 May 2022 13:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334694.558761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsNR3-00043c-JX; Sat, 21 May 2022 11:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334694.558761; Sat, 21 May 2022 11:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsNR3-00041H-Fu; Sat, 21 May 2022 11:38:17 +0000
Received: by outflank-mailman (input) for mailman id 334694;
 Sat, 21 May 2022 11:38:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nsNR2-00040Q-7W
 for xen-devel@lists.xenproject.org; Sat, 21 May 2022 11:38:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nsNR1-0006Vg-LG; Sat, 21 May 2022 11:38:15 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nsNR1-0007xp-Eq; Sat, 21 May 2022 11:38:15 +0000
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
	bh=lTuoWx6mRZsb/net6vk3evSBY5xzenmNWJQ9EeKj5aE=; b=SzIUNNzMNhxC2cxzrKdQxvmNHz
	jrC136yURZYw+HpUNavzYTRWZfl7w8aGBLCbuqm1FVdCKQ+b0uDjynP4pjYjozv/D3N2GHBR1dGsL
	cD3u9jCFTcfGwFQeRzclrvBkJdHE2YTgtYukxhd3RVEkkotH7kPPrGd2zfQCQrhizznI=;
Message-ID: <e25f3d42-03e0-02b2-e3a5-c05932dc025a@xen.org>
Date: Sat, 21 May 2022 12:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 10/16] xen/arm: add Persistent Map (PMAP) infrastructure
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-11-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220520120937.28925-11-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/05/2022 13:09, Julien Grall wrote:
> +void __init pmap_unmap(const void *p)
> +{
> +    unsigned int idx;
> +    unsigned int slot = virt_to_fix((unsigned long)p);
> +
> +    ASSERT(system_state < SYS_STATE_smp_boot);
> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
> +    ASSERT(in_irq());

This needs to be ASSERT(!in_irq()).

Cheers,

-- 
Julien Grall

