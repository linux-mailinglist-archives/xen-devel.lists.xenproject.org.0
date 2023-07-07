Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7087974AD38
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 10:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560288.876079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgym-0007K5-QP; Fri, 07 Jul 2023 08:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560288.876079; Fri, 07 Jul 2023 08:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgym-0007Gp-My; Fri, 07 Jul 2023 08:38:16 +0000
Received: by outflank-mailman (input) for mailman id 560288;
 Fri, 07 Jul 2023 08:38:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHgyl-0007Gj-Ay
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 08:38:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHgyk-0004DS-Gj; Fri, 07 Jul 2023 08:38:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHgyk-0003sQ-9W; Fri, 07 Jul 2023 08:38:14 +0000
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
	bh=Go+gRQINtb+8VfVbDmio/1Qi9ARkNncfJHDaDLH14eY=; b=aBwsz3hz8vkNxullu6tAUfOwEL
	ebyGqVbHgo7rO6sILGJANEHPMnoK+Wr5saNb+ps5cSqxsDrcYtI/YKOOdockEqh+0GCNy52Dk0XrG
	u4rEZnyLD4tI28UYcpFPrckLvFjg45zYjbz8goP8e8O7ohhmJKXPG2Ht26+IxU7fBSyU=;
Message-ID: <b6edce56-a7a9-9df2-0275-5a529fd4df5a@xen.org>
Date: Fri, 7 Jul 2023 09:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230707014754.51333-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/07/2023 02:47, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
> the feature is not yet complete in the current upstream codebase. The purpose of
> this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
> testing and development of PCI passthrough on ARM.
> 
> Since PCI passthrough on ARM is still work in progress at this time, make it
> depend on EXPERT.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

