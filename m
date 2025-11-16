Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A418C614D3
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 13:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163282.1490457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKc1R-0004AQ-Cy; Sun, 16 Nov 2025 12:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163282.1490457; Sun, 16 Nov 2025 12:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKc1R-00047k-9i; Sun, 16 Nov 2025 12:38:25 +0000
Received: by outflank-mailman (input) for mailman id 1163282;
 Sun, 16 Nov 2025 12:38:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKc1P-00047e-Fv
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 12:38:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKc1O-00A7oL-2g;
 Sun, 16 Nov 2025 12:38:22 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKc1O-000hny-1N;
 Sun, 16 Nov 2025 12:38:22 +0000
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
	bh=cz+VurqoZ8ATYsY9mCF0wLcD48hlu3jc2i66+aPGEfI=; b=jIyi227SgpxbHikMKVV2hmVfZN
	uycIFBw7j0UOtoOv8XMSVTasdCT5SKboQyR3nAc6aaXm0JWY9wafe6pFvqnECx5G/9ySCRJFp4ILN
	DSxkuU+Are8HfwlcJELmO5oCLyrPZAo8/YX592xKz1g9RreJVJU4nvbZeAKA+qsons9c=;
Message-ID: <f0dc81bf-2cfc-4912-9a2a-849e960e10de@xen.org>
Date: Sun, 16 Nov 2025 12:38:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gicv3: initialize eSPI unconditionally
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <70927412079d26973fda7025b99c566e03217aa7.1759222404.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <70927412079d26973fda7025b99c566e03217aa7.1759222404.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/09/2025 10:00, Leonid Komarianskyi wrote:
> Since the firmware may initialize eSPIs before Xen, and without
> CONFIG_GICV3_ESPI enabled, Xen would not reinitialize them properly
> during boot. In such cases, once the GIC is re-enabled in Xen,
> interrupts may be received that cannot be handled.
> 
> To ensure proper operation on hardware with eSPI feature, even when the eSPI
> config is disabled, gicv3_dist_espi_common_init() should be invoked
> regardless of whether CONFIG_GICV3_ESPI is enabled or not. This will not
> affect hardware without eSPI support, as the function checks if the
> hardware supports eSPIs by reading the GICD_TYPER.ESPI field (using
> GICD_TYPER_ESPIS_NUM macro), which indicates whether the extended SPI
> range is supported. If the hardware does not support eSPI, the function
> will not perform any actions.
> 
> There are no functional changes for setups where CONFIG_GICV3_ESPI=y.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Suggested-by: Julien Grall <jgrall@amazon.com>

Usually tags are ordered chronologically. So this tag would need to 
appear first. I can fix that while committing.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


