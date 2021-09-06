Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F3401A37
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 12:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179621.325984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCIQ-0006Sg-OC; Mon, 06 Sep 2021 10:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179621.325984; Mon, 06 Sep 2021 10:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCIQ-0006Qh-L2; Mon, 06 Sep 2021 10:56:14 +0000
Received: by outflank-mailman (input) for mailman id 179621;
 Mon, 06 Sep 2021 10:56:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNCIP-0006Qb-0b
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 10:56:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNCIN-0001yO-A9; Mon, 06 Sep 2021 10:56:11 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNCIN-0007KY-1T; Mon, 06 Sep 2021 10:56:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=TbH4O9e020jx0sGPeovPiNA2vcT/yAA6hKIcUQf61zI=; b=t0Fgi76jJkub4DJtwu6u80uIh1
	7hbZBfxlc2aDiJ4AuTPrIn+C13Z6tKE2rpTRgun5p7tznUMcaTLWhb2oS+WGKk/1oozXUbfJ0Dlrd
	wuSVjBtGShHkZCRABV+DKWqCt96HCNge6qGhMdFwdvAv8tF6edwJcdnPbjE3nCRKTsoI=;
Subject: Re: [PATCH] gnttab: adjust unmap checking of dev_bus_addr
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <1d2d28ac-bcf2-2a96-a6dd-8282fc59a16c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <79c21c7b-c833-acfb-644a-907707a9fe1d@xen.org>
Date: Mon, 6 Sep 2021 11:56:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1d2d28ac-bcf2-2a96-a6dd-8282fc59a16c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/08/2021 15:26, Jan Beulich wrote:
> There's no point checking ->dev_bus_addr when GNTMAP_device_map isn't
> set (and hence the field isn't going to be consumed). And if there is a
> mismatch, use the so far unused GNTST_bad_dev_addr error indicator - if
> not here, where else would this (so far unused) value be used?
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1450,9 +1450,9 @@ unmap_common(
>   
>       op->mfn = act->mfn;
>   
> -    if ( op->dev_bus_addr &&
> +    if ( op->dev_bus_addr && (flags & GNTMAP_device_map) &&
>            unlikely(op->dev_bus_addr != mfn_to_maddr(act->mfn)) )
> -        PIN_FAIL(act_release_out, GNTST_general_error,
> +        PIN_FAIL(act_release_out, GNTST_bad_dev_addr,
>                    "Bus address doesn't match gntref (%"PRIx64" != %"PRIpaddr")\n",
>                    op->dev_bus_addr, mfn_to_maddr(act->mfn));
>   
> 

Cheers,

-- 
Julien Grall

