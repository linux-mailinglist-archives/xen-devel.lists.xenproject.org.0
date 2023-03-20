Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705AB6C203E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 19:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512082.791719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKXS-0007aC-TL; Mon, 20 Mar 2023 18:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512082.791719; Mon, 20 Mar 2023 18:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKXS-0007Y2-QM; Mon, 20 Mar 2023 18:47:22 +0000
Received: by outflank-mailman (input) for mailman id 512082;
 Mon, 20 Mar 2023 18:47:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1peKXQ-0007Xw-Uh
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 18:47:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peKXQ-0003yA-Ij; Mon, 20 Mar 2023 18:47:20 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.17.111]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peKXQ-0005YN-Ca; Mon, 20 Mar 2023 18:47:20 +0000
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
	bh=hI5aEs5rSGIzo4cfMLVN9wt9+EdBSxMRZVInUWpTs3A=; b=Vg+NGEmn2XuNATvriCco2dlr5I
	d/nLPW92Lo/eqBwmS587RimT0SI+icq04aaK6Q7XJ5EqTYeMcazVkuLZg/oSf4w8VPOT7Jc4UcKAn
	ENZEDzNZY2ARH3e+q2fhi+fgrQ8ZZJYKiLLaVhDaVT9qosASsBr6sPQgUsPk9Vym8rao=;
Message-ID: <8bc6c861-40dd-5dae-4fd6-68bd092c06f7@xen.org>
Date: Mon, 20 Mar 2023 18:47:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] xen/arm: Rename vgic_cpu_base and vgic_dist_base
 for new vGIC
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230130040614.188296-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 30/01/2023 04:06, Henry Wang wrote:
> In the follow-up patch from this series, the GICv2 CPU interface
> mapping will be deferred until the first access in the stage-2
> data abort trap handling code. Since the data abort trap handling
> code is common for the current and the new vGIC implementation,
> it is necessary to unify the variable names in struct vgic_dist
> for these two implementations.
> 
> Therefore, this commit renames the vgic_cpu_base and vgic_dist_base
> for new vGIC to cbase and dbase. So we can use the same code in
> the data abort trap handling code for both vGIC implementations.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

