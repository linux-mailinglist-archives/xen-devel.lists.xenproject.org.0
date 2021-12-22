Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B147D34F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 15:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250847.432035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02CG-0006TF-6Z; Wed, 22 Dec 2021 14:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250847.432035; Wed, 22 Dec 2021 14:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02CG-0006QQ-3B; Wed, 22 Dec 2021 14:02:24 +0000
Received: by outflank-mailman (input) for mailman id 250847;
 Wed, 22 Dec 2021 14:02:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n02CE-0006QK-E3
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 14:02:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02CD-0005Ql-Sx; Wed, 22 Dec 2021 14:02:21 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02CD-0007uY-K0; Wed, 22 Dec 2021 14:02:21 +0000
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
	bh=iNqOuow6paNFTCm8eHq9fAHol9EpAhax92qfFQvdB4c=; b=Kdz2CArPJxwM/L0YblPKX8YkA+
	yzZ23D6B+XEiTWJIq7iCNVknk8etNLDEPBl1Js0/3wklY/39KLd5aG85gcy7lvpDNpglxLzyrt3/e
	0IQU+3Dn3VQXbjG55SrlS7M5RbWE8zz0I7H4tB8+FqTdoCLBuk4Sa+bLuVRtZogHKxmo=;
Message-ID: <3dbf3736-98d8-6960-5559-f74a5941b075@xen.org>
Date: Wed, 22 Dec 2021 15:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN][RFC PATCH v2 02/12] xen: arm: Add CONFIG_OVERLAY_DTB
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-3-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1636441347-133850-3-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Please add a short commit message explaning how this is going to be used.

On 09/11/2021 08:02, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/arch/arm/Kconfig | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa682..895f0ee 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -46,6 +46,14 @@ config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>           depends on GICV3 && !NEW_VGIC
>   
> +config OVERLAY_DTB
> +    depends on MPSOC_PLATFORM

None of the code looks to be Xilinx specific and this will prevent one 
to build a generic Xen and test your code. So can you remove the dependency?

> +    bool "Enable DTB overlay"
> +    default y

In general, for new feature, we want to disable them by default and gate 
them with UNSUPPORTED.

They can move off UNSUPPORTED once they are ready enough to be supported 
(and possibly security supported).

Cheers,

-- 
Julien Grall

