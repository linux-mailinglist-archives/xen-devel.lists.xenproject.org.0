Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED8D1BF88E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 14:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU8iY-00033l-QF; Thu, 30 Apr 2020 12:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jU8iY-00033g-74
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 12:55:06 +0000
X-Inumbo-ID: cf7c5754-8ae1-11ea-9a43-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf7c5754-8ae1-11ea-9a43-12813bfff9fa;
 Thu, 30 Apr 2020 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+9ZwCAs6Ak667bWqIBnVNtQqduDdWH0n+/Tw5qPVbA=; b=s60S29kZsvnoUaCl6Lxlh4uDGZ
 srVsCXpgMvP6wZbPks0IjiqtATGIVIM53gX/5/Q+nXm5qwPMbiQoZzzIpXjGj8ekcdeKVHBaQwbm4
 XNZ7UC36ul6CTboneaAc0Hw1L/gd2zUm0/NG6rUTiFeJ/9RXsFzxtH0eg4qopErKE8rM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jU8iR-00033y-18; Thu, 30 Apr 2020 12:54:59 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jU8iQ-0002Gt-QC; Thu, 30 Apr 2020 12:54:58 +0000
Subject: Re: [PATCH 0/12] direct-map DomUs
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <4a62c7c1-710f-21a9-a6cc-03aa290e18b1@xen.org>
 <alpine.DEB.2.21.2004291313030.28941@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <91b9d1d9-6e6f-c8b9-55ac-a3477b20a17b@xen.org>
Date: Thu, 30 Apr 2020 13:54:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004291313030.28941@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Artem_Mygaiev@epam.com, peng.fan@nxp.com, andrew.cooper3@citrix.com,
 George.Dunlap@citrix.com, Bertrand.Marquis@arm.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 29/04/2020 21:16, Stefano Stabellini wrote:
> On Thu, 16 Apr 2020, Julien Grall wrote:
>>> Stefano Stabellini (12):
>>>         xen: introduce xen_dom_flags
>>>         xen/arm: introduce arch_xen_dom_flags and direct_map
>>>         xen/arm: introduce 1:1 mapping for domUs
>>>         xen: split alloc_heap_pages in two halves for reusability
>>>         xen: introduce reserve_heap_pages
>>>         xen/arm: reserve 1:1 memory for direct_map domUs
>>>         xen/arm: new vgic: rename vgic_cpu/dist_base to c/dbase
>>>         xen/arm: if is_domain_direct_mapped use native addresses for GICv2
>>>         xen/arm: if is_domain_direct_mapped use native addresses for GICv3
>>>         xen/arm: if is_domain_direct_mapped use native UART address for vPL011
>>
>> The 3 patches above cover addresses but not interrupts. Why?
> 
> Hi Julien,
> 
> I take that you are referring to GUEST_VPL011_SPI, right?

GUEST_VPL011_SPI is at least one of them. For long term, we may want to 
consider PPIs as well (e.g timer).

Cheers,

-- 
Julien Grall

