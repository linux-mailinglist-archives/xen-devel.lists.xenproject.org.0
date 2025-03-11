Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31586A5D290
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 23:30:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909494.1316427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts86g-00044P-7G; Tue, 11 Mar 2025 22:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909494.1316427; Tue, 11 Mar 2025 22:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts86g-00042x-3B; Tue, 11 Mar 2025 22:29:50 +0000
Received: by outflank-mailman (input) for mailman id 909494;
 Tue, 11 Mar 2025 22:29:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts86f-00042r-1Q
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 22:29:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts86e-00Ekk7-2o;
 Tue, 11 Mar 2025 22:29:48 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts86e-005YO1-1S;
 Tue, 11 Mar 2025 22:29:48 +0000
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
	bh=JTHGc4tpnyxIH+ZcQlX/czbtFNl9Ino5amPRFfI7cns=; b=yGjTItYTh5IWiHeYOGHsav6j7P
	KQthFy2Emm6xhtT7WCtwPBoB8PjQKPUS2PZrvzIox/oRBJi8eATjewy+FU6CRfKHl6xD28lbrkLYm
	jpei5/dEhm+FpVmS6r8lAkkYlP/a7CUCl40H0t6QcUQ5sfs6zN8V/ZwdhHyTZcnefZHM=;
Message-ID: <849e6163-141d-4c8a-a57f-e589a38dd38d@xen.org>
Date: Tue, 11 Mar 2025 22:29:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] xen/arm: Introduce system suspend config option
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/03/2025 09:11, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This option enables the system suspend support. This is the
> mechanism that allows the system to be suspended to RAM and
> later resumed.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>   xen/arch/arm/Kconfig | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a26d3e1182..5834af16ab 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>   config ARM32_HARDEN_BRANCH_PREDICTOR
>       def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
>   
> +config SYSTEM_SUSPEND
> +	bool "System suspend support"
> +	default y

The default should likely be no until everything is working.

> +	depends on ARM_64

I think this also needs to depends on !LLC_COLORING (unless you 
confirmed cache coloring is working) and UNSUPPORTED.

> +	help
> +	  This option enables the system suspend support. This is the
> +	  mechanism that allows the system to be suspended to RAM and
> +	  later resumed.

You seem to also tie guest suspend/resunme to this option. Is it intended?

Cheers,

-- 
Julien Grall


