Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15D3310CC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94980.179101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGvI-00036J-Jv; Mon, 08 Mar 2021 14:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94980.179101; Mon, 08 Mar 2021 14:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGvI-00035s-Ga; Mon, 08 Mar 2021 14:31:52 +0000
Received: by outflank-mailman (input) for mailman id 94980;
 Mon, 08 Mar 2021 14:31:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJGvG-00035a-Lx
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:31:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJGvD-00064a-0Q; Mon, 08 Mar 2021 14:31:47 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJGvC-0006ze-NY; Mon, 08 Mar 2021 14:31:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=wUADUy5CRV7i2GKakvMeVwR7brx30CZn1gWbHASJIq8=; b=ARbae4knno9KiZHfEJpFe4Bkjl
	687OdCbjXz2jDFr2z4yV8XtMbIvaaRRQWEavIsBT5u61jvAhawmTLcVW3ZxacO+qgR2FHDOZaqQKq
	nfVLeM4FGJ/GG4mjV/dq+ase4mHCXXlOS9YJya1Ri22ll7mr08+IFCn1fA4qqt1ToS1U=;
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210308135937.1692-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <745c5049-fb09-5605-8bc1-838a4def45d6@xen.org>
Date: Mon, 8 Mar 2021 14:31:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308135937.1692-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 08/03/2021 13:59, Michal Orzel wrote:
> Currently in order to link existing DTB into Xen image
> we need to either specify option CONFIG_DTB_FILE on the
> command line or manually add it into .config.
> Add Kconfig entry: CONFIG_DTB_FILE to be able to
> provide the path to DTB we want to embed into Xen image.
> If no path provided - the dtb will not be embedded.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/Makefile | 4 +---
>   xen/common/Kconfig    | 8 ++++++++
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 16e6523e2c..0f3e99d075 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>   
>   #obj-bin-y += ....o
>   
> -ifdef CONFIG_DTB_FILE
> +ifneq ($(CONFIG_DTB_FILE),"")
>   obj-y += dtb.o
>   AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>   endif
> @@ -137,8 +137,6 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>   xen.lds: xen.lds.S
>   	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>   
> -dtb.o: $(CONFIG_DTB_FILE)
> -

Why is this dropped?

>   .PHONY: clean
>   clean::
>   	rm -f asm-offsets.s xen.lds
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index eb953d171e..a4c8d09edf 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -400,6 +400,14 @@ config DOM0_MEM
>   
>   	  Leave empty if you are not sure what to specify.
>   
> +config DTB_FILE

May I ask why is this add in common/Kconfig rather than arm/Kconfig?

> +	string "Absolute path to device tree blob"
> +	depends on ARM

If this stay in common Kconfig, shouldn't this be gated with 
HAS_DEVICE_TREE?

> +	---help---
> +	  When using a bootloader that has no device tree support or when there
> +	  is no bootloader at all, use this option to specify the absolute path
> +	  to a device tree that will be linked directly inside Xen binary.
> +
>   config TRACEBUFFER
>   	bool "Enable tracing infrastructure" if EXPERT
>   	default y
> 

Cheers,

-- 
Julien Grall

