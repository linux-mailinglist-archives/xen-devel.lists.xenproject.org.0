Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9D842D624
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209166.365543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1max7E-0002KI-7V; Thu, 14 Oct 2021 09:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209166.365543; Thu, 14 Oct 2021 09:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1max7E-0002GD-3r; Thu, 14 Oct 2021 09:33:32 +0000
Received: by outflank-mailman (input) for mailman id 209166;
 Thu, 14 Oct 2021 09:33:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1max7C-0002FM-B6
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:33:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1max7B-0005EB-5t; Thu, 14 Oct 2021 09:33:29 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.16.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1max7A-0008Py-W4; Thu, 14 Oct 2021 09:33:29 +0000
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
	bh=dIfbK4SVYRibsDHNURyklg1n0+pQI3CZoHclS4pA1QY=; b=TGvlKklnSa/2BDPvCrTSwc+I1V
	cCub3D5edR8YWtEJcUlYwYzX3VTjgw/fPJhm/yF4uTGrhyuQxyQHW221UbpZbR/7clVDOAmzibon/
	D1w9jr7iJSmAvEfbuj73kJsYHG3aJxRcHzIM+VQqA41A7B39Hn8BJwZ2kiRE1WbQKVkA=;
Message-ID: <26a54c0f-7177-20d6-9186-08df5ebe852a@xen.org>
Date: Thu, 14 Oct 2021 10:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 bertrand.marquis@arm.com
References: <20211014084718.21733-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211014084718.21733-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 14/10/2021 09:47, Michal Orzel wrote:
> This reverts commit 2075b410ee8087662c880213c3aca196fb7ade22.
> 
> During the discussion [1] that took place after
> the patch was merged it was agreed that it should
> be reverted to avoid introducing a bad interface.
> 
> Furthermore, the patch rejected usage of flag
> XEN_DOMCTL_CDF_vpci for x86 which is not true
> as it should be set for dom0 PVH.
> 
> Due to XEN_DOMCTL_CDF_vpmu being introduced after
> XEN_DOMCTL_CDF_vpci, modify its bit position
> from 8 to 7.
> 
> [1] https://marc.info/?t=163354215300039&r=1&w=2
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Looking at the thread, we are only missing an ack for...

> ---
>   tools/ocaml/libs/xc/xenctrl.ml  | 1 - >   tools/ocaml/libs/xc/xenctrl.mli | 1 -

the OCAML part. I can commit it once this is done.

Cheers,

-- 
Julien Grall

