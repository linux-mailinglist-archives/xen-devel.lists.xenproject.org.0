Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90269ADAA25
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016823.1393762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4ly-0007Lc-7D; Mon, 16 Jun 2025 08:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016823.1393762; Mon, 16 Jun 2025 08:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4ly-0007KB-4I; Mon, 16 Jun 2025 08:00:54 +0000
Received: by outflank-mailman (input) for mailman id 1016823;
 Mon, 16 Jun 2025 08:00:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uR4lx-0007K5-7r
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:00:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR4lw-004SGi-1x;
 Mon, 16 Jun 2025 08:00:52 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR4lw-0076kj-0t;
 Mon, 16 Jun 2025 08:00:52 +0000
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
	bh=Sr2GFh0p96NgK7r+6UcZ3nUuAKzYpE5wYqcOmcSczcs=; b=sC4SnoI31nWx4jJCiCovAftd+r
	ENGx5BdUh1uf0LUl5M7Mrh0HcA2sp29DW95farKeTQZ0TxwM37Nv0dr0SrppkU/5CdJ82GyvQu/WO
	k053u0sCZ4tW0PnBsFJe8sy1N+9MN2QasqJtPVl1eP6mTo+lBbqRRyZXCfkpg4S5bF68=;
Message-ID: <2a54e49b-c1ad-4654-9291-4373e92580ff@xen.org>
Date: Mon, 16 Jun 2025 09:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT
Content-Language: en-GB
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-15-agarciav@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250613151612.754222-15-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/06/2025 16:13, Alejandro Vallejo wrote:
> Without picking CONFIG_HAS_DEVICE_TREE.
> 
> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
> of the common/device-tree/ directory. 
 > x86 doesn't want dom0less-build.c,> as that's tightly integrated 
still to the ARM way of building domains.

I don't understand this argument. dom0less-build.c was moved to common 
and it will soon be used by RISC-V. This raises the question what's so 
special with x86?

Note I don't particularly care if you don't want to use it on x86. 
However, the argument provided is lacking some details... This will be 
useful in the future if someone thinks about consolidating the two.

Cheers,

-- 
Julien Grall


