Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6464AF4C4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269280.463318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHoYX-00086E-5U; Wed, 09 Feb 2022 15:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269280.463318; Wed, 09 Feb 2022 15:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHoYX-00083y-23; Wed, 09 Feb 2022 15:06:53 +0000
Received: by outflank-mailman (input) for mailman id 269280;
 Wed, 09 Feb 2022 15:06:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHoYV-000831-TO
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:06:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHoYV-00070B-Mv; Wed, 09 Feb 2022 15:06:51 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHoYV-0007EO-HI; Wed, 09 Feb 2022 15:06:51 +0000
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
	bh=zHYMQ86MlMfcRuUbB+OHuiPjXxRPxV7eopqvTa0WZ0U=; b=xDMv5H2WjHq8hu45OhdEldZt4p
	skHRm1XzeRnNMmOMa9ywxT97OJNHWFP/l1xOXcAjK1Ehx7H9P4fp2HcYNquM8VO+buBlyQ9eONKZk
	OXkKvPNq+IGesjkEv+tEdetorreRNoQdLvtW0ZTVwUw6GDyIrT+O1W3HgsT+2yrQ+JFE=;
Message-ID: <d61d1368-9cdb-de19-079a-da41213c2659@xen.org>
Date: Wed, 9 Feb 2022 15:06:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 07/11] xen/arm: if direct-map domain use native
 addresses for GICv2
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220127074929.502885-1-penny.zheng@arm.com>
 <20220127074929.502885-8-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220127074929.502885-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 27/01/2022 07:49, Penny Zheng wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> Today we use native addresses to map the GICv2 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> all domains that are direct-mapped.
> 
> NEW VGIC has different naming schemes, like referring distributor base
> address as vgic_dist_base, other than the dbase. So this patch also introduces
> vgic_dist_base/vgic_cpu_base accessor to access correct distributor base
> address/cpu interface base address on varied scenarios,
> 
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

