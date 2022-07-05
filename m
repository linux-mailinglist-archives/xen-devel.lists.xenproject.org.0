Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828F1567A19
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 00:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361657.591295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8r2l-0005wP-Vl; Tue, 05 Jul 2022 22:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361657.591295; Tue, 05 Jul 2022 22:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8r2l-0005tb-Rj; Tue, 05 Jul 2022 22:29:19 +0000
Received: by outflank-mailman (input) for mailman id 361657;
 Tue, 05 Jul 2022 22:29:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8r2k-0005tV-Iu
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 22:29:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8r2k-0007JV-5r; Tue, 05 Jul 2022 22:29:18 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8r2j-0000xo-W6; Tue, 05 Jul 2022 22:29:18 +0000
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
	bh=bsS/akIE1f6M9t+O6fIMH/IXWZxRgLcgoDB4hcgV57Y=; b=G/xzicCp3BueALFci2EhZP5Vw7
	ENxDpz15q6g3Yr19xjkT4lvpiApTZQEf+etzZK3V/all8yXzU7BLSrv95FEWTzzvi7cqDKdX3MRPJ
	V/NTCGiv6aqxhW+/iXEeXqHOlSt3laajafm2DRmAAJSIqfVJXcuquCFhb3GjbjMpRVgM=;
Message-ID: <0144b4d7-6caa-5e7f-b8c3-9e72e0085e1f@xen.org>
Date: Tue, 5 Jul 2022 23:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20220630015336.3040355-1-jiamei.xie@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3] xen/arm: avoid overflow when setting vtimer in context
 switch
In-Reply-To: <20220630015336.3040355-1-jiamei.xie@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jiamei,

On 30/06/2022 02:53, Jiamei Xie wrote:
> virt_vtimer_save is calculating the new time for the vtimer in:
> "v->arch.virt_timer.cval + v->domain->arch.virt_timer_base.offset
> - boot_count".
> In this formula, "cval + offset" might cause uint64_t overflow.
> Changing it to "ticks_to_ns(v->domain->arch.virt_timer_base.offset -
> boot_count) + ticks_to_ns(v->arch.virt_timer.cval)" can avoid overflow,

 From the commit message, I can't quite make the connection between 
"cval + offset"  will overflow and "ticks_to_ns(...) + ticks_to_ns(...)" 
will help.

So how about the following:

"
virt_vtimer_save() will calculate the next deadline when the vCPU is 
scheduled out. At the moment, Xen will use the following equation:

  virt_timer.cval + virt_time_base.offset - boot_count

The three values are 64-bit and one (cval) is controlled by domain. In 
theory, it would be possible that the domain has started a long time
after the system boot. So virt_time_base.offset - boot_count may be a 
large numbers.

This means a domain may inadvertently set a cval so the result would 
overflow. Consequently, the deadline would be set very far in the 
future. This could result to loss of timer interrupts or the vCPU 
getting block "forever".

One way to solve the problem, would be to separately
   1) compute when the domain was created in ns
   2) convert cval to ns
   3) Add 1 and 2 together

The first part of the equation never change (the value is set/known at 
domain creation). So take the opportunity to store it in domain structure.
"

The code itself looks good to me.

Cheers,

-- 
Julien Grall

