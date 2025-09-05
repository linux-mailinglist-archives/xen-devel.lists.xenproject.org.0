Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7EB44F7D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 09:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111415.1460140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQs1-0000HX-Sr; Fri, 05 Sep 2025 07:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111415.1460140; Fri, 05 Sep 2025 07:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQs1-0000FG-QK; Fri, 05 Sep 2025 07:28:29 +0000
Received: by outflank-mailman (input) for mailman id 1111415;
 Fri, 05 Sep 2025 07:28:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uuQs0-0000F6-J0
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 07:28:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQrz-007pRr-2n;
 Fri, 05 Sep 2025 07:28:28 +0000
Received: from [2a02:8012:3a1:0:2cb0:b4e5:ef93:763c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQrz-00GioC-2v;
 Fri, 05 Sep 2025 07:28:28 +0000
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
	bh=gIBPNaziA6biKrZeOx0UTR7gu3T1mb/qz3J6yftXYMs=; b=IfqPTFuJs6rjF9XRBi515RZvB5
	ReNVYBG3OT8ZncuayEB1PUL6+mTGE5tYneMaGpgFjOorS0oZs8hePvfEevJFfYC9qnoYzIXSO+5ia
	0FOFjVVkj/uqgHosq00u5V9/UY5IFNEKZLqVA4L0oqodgXOrQy0yJdBcGRBlMZFEPvuo=;
Message-ID: <66adb789-9fd5-4326-a25b-88093195dc05@xen.org>
Date: Fri, 5 Sep 2025 08:28:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <fda3aa7e6093463616666b263e425592b6a4e3a4.1757015865.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fda3aa7e6093463616666b263e425592b6a4e3a4.1757015865.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 04/09/2025 21:01, Leonid Komarianskyi wrote:
> The Dom0 and DomUs logic for the dom0less configuration in create_dom0()
> and arch_create_domUs() should account for extended SPIs when supported
> by the hardware and enabled with CONFIG_GICV3_ESPI. These changes ensure
> proper calculation of the maximum number of SPIs and eSPIs available to
> Dom0 and DomUs in dom0less setups.
> 
> When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is enabled, the
> maximum number of eSPI interrupts is calculated using the ESPI_BASE_INTID
> offset (4096) and is limited to 1024, with 32 IRQs subtracted. To ensure
> compatibility with non-Dom0 domains, this adjustment is applied by the
> toolstack during domain creation, while for Dom0 or DomUs in Dom0, it is
> handled directly during VGIC initialization. If eSPIs are not supported, the
> calculation defaults to using the standard SPI range, with a maximum value of
> 992 interrupt lines, as it works currently.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


