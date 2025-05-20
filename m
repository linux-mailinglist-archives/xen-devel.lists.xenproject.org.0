Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F6ABDE16
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990882.1374807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOU4-0006Y6-NJ; Tue, 20 May 2025 15:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990882.1374807; Tue, 20 May 2025 15:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOU4-0006WY-Kb; Tue, 20 May 2025 15:02:24 +0000
Received: by outflank-mailman (input) for mailman id 990882;
 Tue, 20 May 2025 15:02:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uHOU3-0006WR-4T
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:02:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uHOU2-003Y2k-37;
 Tue, 20 May 2025 15:02:22 +0000
Received: from [2a02:8012:3a1:0:8d74:6848:91ae:ac06]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uHOU2-00FesM-1i;
 Tue, 20 May 2025 15:02:22 +0000
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
	bh=iidGXnlNqWRD0tS0NpWxv4PIeId9ZAVA03dv3tORia0=; b=DAm8SVTEkR+wjjVlSKEbaCvslt
	iz0ai2z+Ti8o1Qde9bacHoncH1yy3YN+Ctum7S8hewhVQpTZQJQyjCIq0EUMtC9r6f6vowt2pBDrK
	iUYJYkl1DVkNybVbHiKfisL80Js0A9QmYSj+r7CepZD2mNSM4gkYs9ljRFWhMpK7kwXE=;
Message-ID: <f1e13b59-d7ec-4143-b859-ccc8777313bf@xen.org>
Date: Tue, 20 May 2025 16:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250520134751.1460968-1-oleksandr_tyshchenko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250520134751.1460968-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 20/05/2025 14:47, Oleksandr Tyshchenko wrote:
> An attempt to write access the register (i.e. GICR_PROPBASER, GICR_PENDBASER)
> which should be ignored (i.e. no virtual ITS present) causes the data about

I assume, this is a guest data abort, rather than Xen crash?

> due to incorrect check at the write_ignore_64 label. 
> The check should be
> inverted.

OOI, why would a guest try to write to GICR_PROPBASER if the ITS is not 
present? Was it a bug in the OS?

> 
> Fixes: c4d6bbdc12e5 ("xen/arm: vgic-v3: Support 32-bit access for 64-bit registers")
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

With the commit message clarified and Andrew's comments addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


