Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD89C83A7B6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 12:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670941.1044047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbOi-0002st-Pe; Wed, 24 Jan 2024 11:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670941.1044047; Wed, 24 Jan 2024 11:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbOi-0002pe-Mc; Wed, 24 Jan 2024 11:26:24 +0000
Received: by outflank-mailman (input) for mailman id 670941;
 Wed, 24 Jan 2024 11:26:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rSbOh-0002pY-6F
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 11:26:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSbOg-0002nU-Nc; Wed, 24 Jan 2024 11:26:22 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSbOg-0006R6-GE; Wed, 24 Jan 2024 11:26:22 +0000
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
	bh=Z55pWqrsVrAYfNXQUHtFcrEcggPBge8pnSxYHx9egx8=; b=sXDCTQzuZnlArZ2DaWbfHA0uo8
	D5x2g+Q+sySMTtA9xaLKOFfR1fVTEdOTbPTT1Oz8BguLwpOTV6KETZvTLS3h+xXKTLP5AHs8TaMeG
	sBdbGWh9BjAAv8Dyx9xzmtaIn29fjTndXeMoEifwQOIbvMPffdKUeg51wWCq0hoTc8z8=;
Message-ID: <69f77f3c-27f2-4353-83c7-4450df28397b@xen.org>
Date: Wed, 24 Jan 2024 11:26:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for MSI injection on Arm
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1705066642.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/01/2024 10:01, Mykyta Poturai wrote:
> This series adds the base support for MSI injection on Arm. This is
> needed to streamline virtio-pci interrupt triggering.
> 
> With this patches, MSIs can be triggered in guests by issuing the new
> DM op, inject_msi2. This op is similar to inject_msi, but it allows
> to specify the source id of the MSI.
> 
> We chose the approach of adding a new DM op instead of using the pad
> field of inject_msi because we have no clear way of distinguishing
> between set and unset pad fields. New implementations also adds flags
> field to clearly specify if the SBDF is set.
> 
> Patches were tested on QEMU with QEMU virtio-pci backends, with
> virtio-pci patches and patches for ITS support for DomUs applied.

I have seen some virtio-pci patches on the ML. But nothing about ITS 
support in the DomUs (at least in recent months).

It would feel odd to me to even consider merging this series before the 
ITS support for DomUs is merged. So what's the plan for it?

Cheers,

-- 
Julien Grall

