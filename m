Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E535BDCD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 10:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108820.207621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVsKW-0004Yx-Gk; Mon, 12 Apr 2021 08:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108820.207621; Mon, 12 Apr 2021 08:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVsKW-0004Yd-7j; Mon, 12 Apr 2021 08:54:00 +0000
Received: by outflank-mailman (input) for mailman id 108820;
 Mon, 12 Apr 2021 08:53:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVsKU-0004YY-2I
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 08:53:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9dcdfa51-6f79-4e9b-a545-50b1ff265766;
 Mon, 12 Apr 2021 08:53:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F881AF1B;
 Mon, 12 Apr 2021 08:53:56 +0000 (UTC)
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
X-Inumbo-ID: 9dcdfa51-6f79-4e9b-a545-50b1ff265766
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618217636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kqx5Rzut9wWvGHJZ3lq+/iPWxGqOzFknB1SOtS5Q1nU=;
	b=OMkNlJBqfIQDhhmCV2A8AIx6CN+INux+lYz3gWGsxrfZdEGKeuVLBfpXOz67UdQVDZu0fE
	oDK7C57KyQayvIY4ydq+ReiRk/tfxapAZHVt9psdZyKyOiTn3tOcazC2xitVnTYcb3l8Sj
	D6caU63U5qIgOu3RIFfAcwpYxdANGjE=
Subject: Re: [xen-unstable bisection] complete test-armhf-armhf-xl-multivcpu
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <E1lVPaB-0007ue-Ho@osstest.test-lab.xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7800c49-8106-e2cc-2fa3-9682305f333f@suse.com>
Date: Mon, 12 Apr 2021 10:53:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <E1lVPaB-0007ue-Ho@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.04.2021 04:12, osstest service owner wrote:
> branch xen-unstable
> xenbranch xen-unstable
> job test-armhf-armhf-xl-multivcpu
> testid guest-start/debian.repeat
> 
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  9617d5f9c19d1d157629e1e436791509526e0ce5
>   Bug not present: 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160931/
> 
> 
>   commit 9617d5f9c19d1d157629e1e436791509526e0ce5
>   Author: Julien Grall <jgrall@amazon.com>
>   Date:   Sat Feb 20 17:54:13 2021 +0000
>   
>       xen/arm: mm: flush_page_to_ram() only need to clean to PoC
>       
>       At the moment, flush_page_to_ram() is both cleaning and invalidate to
>       PoC the page.
>       
>       The goal of flush_page_to_ram() is to prevent corruption when the guest
>       has disabled the cache (the cache line may be dirty) and the guest to
>       read previous content.
>       
>       Per this definition, the invalidating the line is not necessary. So
>       invalidating the cache is unnecessary. In fact, it may be counter-
>       productive as the line may be (speculatively) accessed a bit after.
>       So this will incurr an expensive access to the memory.
>       
>       More generally, we should avoid interferring too much with cache.
>       Therefore, flush_page_to_ram() is updated to only clean to PoC the page.
>       
>       The performance impact of this change will depend on your
>       workload/processor.
>       
>       Signed-off-by: Julien Grall <jgrall@amazon.com>
>       Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>       Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Is it possible that other code (guest one in particular considering the
failure pattern, but possibly not limited to that) has developed a
dependency on the prior behavior?

Jan

