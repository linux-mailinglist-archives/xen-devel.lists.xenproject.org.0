Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF642ED0A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209980.366586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJ68-0005OQ-Kt; Fri, 15 Oct 2021 09:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209980.366586; Fri, 15 Oct 2021 09:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJ68-0005MO-Hp; Fri, 15 Oct 2021 09:01:52 +0000
Received: by outflank-mailman (input) for mailman id 209980;
 Fri, 15 Oct 2021 09:01:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbJ67-0005MI-Fv
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:01:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbJ66-0008Hs-Ft; Fri, 15 Oct 2021 09:01:50 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbJ66-0003et-51; Fri, 15 Oct 2021 09:01:50 +0000
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
	bh=z82C8+p6wH+cgCBmok3OzvBn3VVk/jtgwPysru9FCNc=; b=tECVEH6Y2RUMTJYsYRK5DjGKRQ
	oD7m+f2aExXR/8mQleqLB7DEdsQYFaLQIPiWL1PMCZf1/ISwuuJ7GEK56iSGKrHtfttx6HbPq2Apc
	1g8OyrXnGsHY9uy9/pSCWa0QdMRfyFJvYuWEuI/2vzqjl6ken7ChCyEiM3U098UN2naQ=;
Message-ID: <4e29e233-3741-1f2e-52b6-a56f2a6aa3b8@xen.org>
Date: Fri, 15 Oct 2021 10:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl
 [and 1 more messages]
To: Michal Orzel <michal.orzel@arm.com>, Ian Jackson <iwj@xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Rahul Singh <rahul.singh@arm.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <Andre.Przywara@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
 <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
 <24926.53690.621007.507249@mariner.uk.xensource.com>
 <294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
 <24927.7235.736221.270358@mariner.uk.xensource.com>
 <8A04B9B2-E816-425E-BF1B-5A8B89F8836C@arm.com>
 <cover.1634221830.git.bertrand.marquis@arm.com>
 <fd9c54a381daa52436b0a1b27cf1bba8e7ff9af9.1634221830.git.bertrand.marquis@arm.com>
 <24936.28385.679884.535704@mariner.uk.xensource.com>
 <6f82141c-8a0b-1e30-a996-223f7c0c508d@xen.org>
 <623814d1-a40d-df93-34f4-c1dd3eef60f6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <623814d1-a40d-df93-34f4-c1dd3eef60f6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 15/10/2021 08:41, Michal Orzel wrote:
> Do you agree on the following approach:
> 1. Modify argument of libxl__arch_domain_init_hw_description to libxl_domain_config (patch 1)
> 2. Modify argument of libxl__prepare_dtb to libxl_domain_config (patch 2)
> 3. Remove arch_arm.vpci completely and in libxl__prepare_dtb add a check (patch 3):
> if (d_config->num_pcidevs)
>      FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> + make_vpci_node implementation
> 
> Does it sound ok for you?

This sounds ok to me.

Cheers,

-- 
Julien Grall

