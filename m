Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D08CDC19
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 23:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728879.1133942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAG04-0006Py-Dt; Thu, 23 May 2024 21:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728879.1133942; Thu, 23 May 2024 21:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAG04-0006OA-B7; Thu, 23 May 2024 21:29:24 +0000
Received: by outflank-mailman (input) for mailman id 728879;
 Thu, 23 May 2024 21:29:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAG02-0006Nx-HV
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 21:29:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAG02-0006bP-5M; Thu, 23 May 2024 21:29:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAG01-0004SE-Vp; Thu, 23 May 2024 21:29:22 +0000
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
	bh=KAxC7cfXsEysTexnM0Q5OFJjNNM5aUTWf2jS9ID6sIA=; b=zdbToxkgSSuBNUVdLiTp55OyVf
	dTmJ62t+QhjC8v3vkE2OyalvGkLPSjcNCesoNLXuBnYK2n6rQE4mM9TDwDimC/oc7G7LfeS7Ks243
	urMLOZsnJksaGpctD3hi36jc7omaekMYqDWHvrqfgijGskLCafzbuZ4TEUPsXxE/w2eY=;
Message-ID: <d76cb59b-012d-4d3a-99e6-69e151f81951@xen.org>
Date: Thu, 23 May 2024 22:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Remaining patches for dynamic node programming
 using overlay dtbo
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/05/2024 08:40, Henry Wang wrote:
> Hi all,

Hi Henry,

> This is the remaining series for the full functional "dynamic node
> programming using overlay dtbo" feature. The first part [1] has
> already been merged.
> 
> Quoting from the original series, the first part has already made
> Xen aware of new device tree node which means updating the dt_host
> with overlay node information, and in this series, the goal is to
> map IRQ and IOMMU during runtime, where we will do the actual IOMMU
> and IRQ mapping and unmapping to a running domain. Also, documentation
> of the "dynamic node programming using overlay dtbo" feature is added.
> 
> During the discussion in v3, I was recommended to split the overlay
> devices attach/detach to/from running domains to separated patches [3].
> But I decided to only expose the xl user interfaces together to the
> users after device attach/detach is fully functional, so I didn't
> split the toolstack patch (#8).

So I was asking to split so we can get some of the work merged for 4.19. 
Can you clarify, whether the intention is to merge only patches #1-5?

Cheers,

-- 
Julien Grall

