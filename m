Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833071ABBED
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 10:59:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP0N2-00018P-5Q; Thu, 16 Apr 2020 08:59:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FuWY=6A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jP0N0-00018G-Iv
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 08:59:38 +0000
X-Inumbo-ID: 999ab0a8-7fc0-11ea-8b69-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 999ab0a8-7fc0-11ea-8b69-12813bfff9fa;
 Thu, 16 Apr 2020 08:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/TqZOft4RGfERk+H5s4rfyuDHaBPVm0OwmJ0sXepDpA=; b=ooXQYAgs8csaj+aTRKxynXvhwj
 xGF91o5po60r3VN4H4DVa1KuM1mUGN4Y4p2hgKxxsnaznZd7oRSzOhzEwAjW5Pc5IHRXKZ3Rnm8UG
 ENy8vRVRjZzIe9/4NPDJ7hs9Fl9LjIbO4WJxCdkwuhZzKrXb3+aaMofFDjgxM4qle6GI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jP0Ms-0008Ad-Bi; Thu, 16 Apr 2020 08:59:30 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jP0Ms-0000MV-2r; Thu, 16 Apr 2020 08:59:30 +0000
Subject: Re: [PATCH 0/12] direct-map DomUs
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <4a62c7c1-710f-21a9-a6cc-03aa290e18b1@xen.org>
Date: Thu, 16 Apr 2020 09:59:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 15/04/2020 02:02, Stefano Stabellini wrote:
> Hi all,
> 
> This series adds support for 1:1 mapping (guest physical == physical)
> the memory of dom0less domUs. The memory ranges assigned to a domU can be
> explicitly chosen by the user at boot time.
> 
> This is desirable in cases where an IOMMU is not present in the system,
> or it cannot be used. For instance, it might not be usable because it
> doesn't cover a specific device, or because it doesn't have enough
> bandwidth, or because it adds too much latency. In these cases, the user
> should use a MPU to protect the memory in the system (e.g. the Xilinx
> XMPU), configuring it with the chosen address ranges.
> 
> Cheers,
> 
> Stefano
> 
> 
> 
> The following changes since commit 7372466b21c3b6c96bb7a52754e432bac883a1e3:
> 
>    x86/mem_sharing: Fix build with !CONFIG_XSM (2020-04-10 15:20:10 +0100)
> 
> are available in the Git repository at:
> 
>    http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git direct-map-1
> 
> for you to fetch changes up to 43503720ab6851a28a66fdd067f592d5354ae83a:
> 
>    xen/arm: call iomem_permit_access for passthrough devices (2020-04-14 17:42:21 -0700)
> 
> ----------------------------------------------------------------
> Stefano Stabellini (12):
>        xen: introduce xen_dom_flags
>        xen/arm: introduce arch_xen_dom_flags and direct_map
>        xen/arm: introduce 1:1 mapping for domUs
>        xen: split alloc_heap_pages in two halves for reusability
>        xen: introduce reserve_heap_pages
>        xen/arm: reserve 1:1 memory for direct_map domUs
>        xen/arm: new vgic: rename vgic_cpu/dist_base to c/dbase
>        xen/arm: if is_domain_direct_mapped use native addresses for GICv2
>        xen/arm: if is_domain_direct_mapped use native addresses for GICv3
>        xen/arm: if is_domain_direct_mapped use native UART address for vPL011

The 3 patches above cover addresses but not interrupts. Why?

Cheers,

-- 
Julien Grall

