Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A129B78262C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 11:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587446.918824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY174-000559-3h; Mon, 21 Aug 2023 09:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587446.918824; Mon, 21 Aug 2023 09:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY173-00052x-Vz; Mon, 21 Aug 2023 09:22:17 +0000
Received: by outflank-mailman (input) for mailman id 587446;
 Mon, 21 Aug 2023 09:22:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY172-00052r-Fy
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 09:22:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY172-0001Q4-5M; Mon, 21 Aug 2023 09:22:16 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY171-0004tP-VW; Mon, 21 Aug 2023 09:22:16 +0000
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
	bh=F4aWz34myItYzHoNROXGKm1R7zviZhXHGfXUClxSW/8=; b=a/34EzSi2heKgnRp1c47psClwf
	gcyLv67AygQu7ycj1iZ2ZTJkg9Q190PS1yoh599MGPctvQr8kdsg/51TfjPYjrNHN5atqdXCQwiR/
	XYxz6VUert4Lh9FmdFxbRZ54Z1GW7OGvIA0NYe/LiNJ/HH/VaPoC/smnyPbFl7OB2LN8=;
Message-ID: <2178de3c-db05-44ac-a7d7-fa605723d16e@xen.org>
Date: Mon, 21 Aug 2023 10:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/13] xen/arm64: Fold setup_fixmap() to
 create_page_tables()
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-7-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-7-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/08/2023 05:25, Henry Wang wrote:
> The original assembly setup_fixmap() is actually doing two seperate
> tasks, one is enabling the early UART when earlyprintk on, and the
> other is to set up the fixmap (even when earlyprintk is off).
> 
> Per discussion in [1], since commit
> 9d267c049d92 ("xen/arm64: Rework the memory layout"), there is no
> chance that the fixmap and the mapping of early UART will clash with
> the 1:1 mapping. Therefore the mapping of both the fixmap and the
> early UART can be moved to the end of create_pagetables().
> 
> No functional change intended.

I would drop this sentence because the fixmap is now prepared much 
earlier in the code. So there is technically some functional change.

> 
> [1] https://lore.kernel.org/xen-devel/78862bb8-fd7f-5a51-a7ae-3c5b5998ed80@xen.org/
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

