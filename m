Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F564BE55
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 22:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461205.719267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Cmr-0002D9-5D; Tue, 13 Dec 2022 21:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461205.719267; Tue, 13 Dec 2022 21:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Cmr-0002BN-2M; Tue, 13 Dec 2022 21:26:05 +0000
Received: by outflank-mailman (input) for mailman id 461205;
 Tue, 13 Dec 2022 21:26:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5Cmp-0002BH-IO
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:26:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Cmp-0003pK-AC; Tue, 13 Dec 2022 21:26:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Cmp-0000rx-50; Tue, 13 Dec 2022 21:26:03 +0000
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
	bh=25l2B35j46qJmV7lPA7q0BErmY5UTjh3TAmgDCYDTvs=; b=k3pzeoE9CoLccilntGhiiejtw4
	+U8YBGCRZgC2Ax2NDyVKkPkqbw/g/8i8O6PCr2a+T/P9heOqBQEJjSnc8PXr1mDduXs8OxPznXSXj
	BZkng9kwedPgnf+KjSQGmRRIkcmISmPVpg4eetJyqz0KRX+Z5pSb3qPE+zSZtj8UGn9U=;
Message-ID: <11fcdadd-66e3-9d90-e1da-124c12f5b9e3@xen.org>
Date: Tue, 13 Dec 2022 21:26:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v5 11/11] xen/Arm: GICv3: Enable GICv3 for AArch32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
 <20221205132637.26775-12-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221205132637.26775-12-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2022 13:26, Ayan Kumar Halder wrote:
> One can now use GICv3 on AArch32 systems. However, ITS is not supported.
> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
> implement LPI support."
> 
> By default GICv3 is disabled on AArch32 and enabled on AArch64.
> 
> Updated SUPPORT.md to state that GICv3 on Arm32 is not security supported.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

