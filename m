Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39071337014
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 11:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96438.182447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIeH-00048s-D2; Thu, 11 Mar 2021 10:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96438.182447; Thu, 11 Mar 2021 10:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIeH-00048V-9r; Thu, 11 Mar 2021 10:34:33 +0000
Received: by outflank-mailman (input) for mailman id 96438;
 Thu, 11 Mar 2021 10:34:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lKIeG-00048Q-Ad
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 10:34:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKIeC-0002sF-Ms; Thu, 11 Mar 2021 10:34:28 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKIeC-0002Qq-Dr; Thu, 11 Mar 2021 10:34:28 +0000
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
	bh=eMBHbKsSIl6Qxu9rRTx9jt5DHya1jvVbeEOmt9KbHyI=; b=YSFcbWENyWm8On0/m44hMw993/
	GiylIAGyVQWxWxfKmRDR5xrSRZZCzY9jcs/fmLXMXPj6oXEcJCDdvRc2nbfoGiBUBIzP+Dz6l9V0R
	eExNwVvQb87AKZhU4geLC+Z2FZFwVrq+Y4uucEh+LlOTdp1EpqTiTSmrJT2sgzCnm/BY=;
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210310065803.348-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3d3e5573-6d64-98cd-1f6f-897eb860d8ba@xen.org>
Date: Thu, 11 Mar 2021 10:34:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310065803.348-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 10/03/2021 06:58, Michal Orzel wrote:
> Currently in order to link existing DTB into Xen image
> we need to either specify option CONFIG_DTB_FILE on the
> command line or manually add it into .config.
> Add Kconfig entry: CONFIG_DTB_FILE to be able to
> provide the path to DTB we want to embed into Xen image.
> If no path provided - the dtb will not be embedded.
> 
> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
> as it is not needed since Kconfig will define it in a header
> with all the other config options.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/Makefile | 5 ++---
>   xen/common/Kconfig    | 8 ++++++++
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 16e6523e2c..46e6a95fec 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -68,9 +68,8 @@ extra-y += $(TARGET_SUBARCH)/head.o
>   
>   #obj-bin-y += ....o
>   
> -ifdef CONFIG_DTB_FILE
> +ifneq ($(CONFIG_DTB_FILE),"")
>   obj-y += dtb.o
> -AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>   endif
>   
>   ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
> @@ -137,7 +136,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>   xen.lds: xen.lds.S
>   	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>   
> -dtb.o: $(CONFIG_DTB_FILE)
> +dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>   
>   .PHONY: clean
>   clean::
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index eb953d171e..a27836bf47 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -400,6 +400,14 @@ config DOM0_MEM
>   
>   	  Leave empty if you are not sure what to specify.
>   
> +config DTB_FILE
> +	string "Absolute path to device tree blob"
> +	depends on HAS_DEVICE_TREE
> +	---help---
> +	  When using a bootloader that has no device tree support or when there
> +	  is no bootloader at all, use this option to specify the absolute path
> +	  to a device tree that will be linked directly inside Xen binary.

With this approach, CONFIG_DTB_FILE will always be defined. This means 
that Xen will always be compiled to use the "embedded" DTB. When the 
string is "", it will be garbagge.

So I think we need a second config to that indicates whether the string 
is empty or not.

Interestingly, your first version of patch didn't expose the problem 
because CONFIG_DTB_FILE would not be defined if the CONFIG_LINK_DTB is 
not selected. Although, it would still happily build if CONFIG_DTB_FILE 
is "".

Cheers,

-- 
Julien Grall

