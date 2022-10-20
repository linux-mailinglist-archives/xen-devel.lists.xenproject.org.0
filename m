Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB14606801
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 20:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427014.675828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ola2D-0006nj-Hj; Thu, 20 Oct 2022 18:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427014.675828; Thu, 20 Oct 2022 18:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ola2D-0006lv-Da; Thu, 20 Oct 2022 18:12:49 +0000
Received: by outflank-mailman (input) for mailman id 427014;
 Thu, 20 Oct 2022 18:12:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ola2C-0006ll-6w
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 18:12:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ola2B-000679-Ub; Thu, 20 Oct 2022 18:12:47 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ola2B-00084M-Ox; Thu, 20 Oct 2022 18:12:47 +0000
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
	bh=DdTpJ+2PG2G1aHjyP2YH+qpG1DcnSD/i52W1U3q0bOs=; b=y8oBStDcHlVQ3Ov/PuFOFDQ1Mf
	OQDvG3voQ/wde6zSZhxTOrReJQLXB1/1E1Xd+beW81g4KZ4shPj30v11AfJkWU3KR9x98UIiEDfKF
	GyH1YZGGgbAzXUdMu4jbN5wLfMMmnsiQblHUORsNRA4Ma2rSlMTHQlvihgI8bGKXTz/k=;
Message-ID: <c3ecb453-ac2e-fd0d-d5ca-3f485d7f53a3@xen.org>
Date: Thu, 20 Oct 2022 19:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v2] xen/arm: p2m: fix pa_range_info for 52-bit pa range
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221019144913.291677-1-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221019144913.291677-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Henry)

Hi Xenia,

On 19/10/2022 15:49, Xenia Ragiadakou wrote:
> Currently, the fields 'root_order' and 'sl0' of the pa_range_info for
> the 52-bit pa range have the values 3 and 3, respectively.
> This configuration does not match any of the valid root table configurations
> for 4KB granule and t0sz 12, described in ARM DDI 0487I.a D8.2.7.
> 
> More specifically, according to ARM DDI 0487I.a D8.2.7, in order to support
> the 52-bit pa size with 4KB granule, the p2m root table needs to be configured
> either as a single table at level -1 or as 16 concatenated tables at level 0.
> Since, currently there is not support for level -1, set the 'root_order' an

Typo: s/not/no/ (I can fix it while committing)

> 'sl0' fields of the 52-bit pa_range_info according to the second approach.
> 
> Note that the values of those fields are not used so far. This patch updates
> their values only for the sake of correctness.
> 
> Fixes: 407b13a71e32 ("xen/arm: p2m don't fall over on FEAT_LPA enabled hw")
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Regarding 4.17, I am a bit split whether this should be included. On one 
hand, it would be good to have the value correct (not that I expect 
anymore to try using 52-bit on 4.17...). On the other hand, this is not 
used so there is no bug (this could also be an argument to add it 
because it is nearly risk free).

If we don't include it, I will definitely add in my list of potential 
backports.

Henry, any thoughts?

Cheers,

-- 
Julien Grall

