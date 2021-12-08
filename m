Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B6046D99B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 18:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242551.419481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0fz-0004EG-RJ; Wed, 08 Dec 2021 17:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242551.419481; Wed, 08 Dec 2021 17:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0fz-0004CB-Nq; Wed, 08 Dec 2021 17:24:19 +0000
Received: by outflank-mailman (input) for mailman id 242551;
 Wed, 08 Dec 2021 17:24:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mv0fx-0004By-LR
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 17:24:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv0fw-0002N4-LA; Wed, 08 Dec 2021 17:24:16 +0000
Received: from [54.239.6.189] (helo=[192.168.13.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv0fw-0000LT-FA; Wed, 08 Dec 2021 17:24:16 +0000
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
	bh=OuAPBDev9/Uu9bm2z7JUAGO2V7fL7Ay6vD6bdAgeJGo=; b=55ME+ehw2fgCl0Jx6PV5Kt2NPj
	8L/6asewHDuE/OfMI7mQCYWGqnC+gFfUEluu86Uur2MumPRE9ysL2/nOpNByKKQ/tvTzjG7O5o4TF
	ExqTwGtYgW/ekBNqkS/lyNt03eXsaPe6ZWf6CMlBCdcejRvUv5BHic+Rfy/9lvL4dmSQ=;
Message-ID: <9a6473ba-e8c2-08fb-6391-617e34a6a2a6@xen.org>
Date: Wed, 8 Dec 2021 17:24:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v7 2/7] xen/arm: add pci-domain for disabled devices
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-3-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211124075942.2645445-3-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 24/11/2021 07:59, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> If a PCI host bridge device is present in the device tree, but is
> disabled, then its PCI host bridge driver was not instantiated.
> This results in the failure of the pci_get_host_bridge_segment()
> and the following panic during Xen start:
> 
> (XEN) Device tree generation failed (-22).
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not set up DOM0 guest OS
> (XEN) ****************************************
> 
> Fix this by adding "linux,pci-domain" property for all device tree nodes
> which have "pci" device type, so we know which segments will be used by
> the guest for which bridges.
> 
> Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if not available.")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

