Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A282538DAD
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339376.564225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvy88-00058u-I1; Tue, 31 May 2022 09:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339376.564225; Tue, 31 May 2022 09:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvy88-000569-EN; Tue, 31 May 2022 09:25:36 +0000
Received: by outflank-mailman (input) for mailman id 339376;
 Tue, 31 May 2022 09:25:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nvy87-000563-Jh
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:25:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvy86-0008KF-II; Tue, 31 May 2022 09:25:34 +0000
Received: from [54.239.6.187] (helo=[192.168.31.167])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvy86-0000cy-BC; Tue, 31 May 2022 09:25:34 +0000
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
	bh=1GvnPgw/r0ABpH8jfYa0EnI+qy0pxiaphto3Lnt1lZM=; b=roGoviSNdWli3oWXzAaYLpZYD5
	AGkvPcTzjDzVNF5E8GR99HyvGK7aal1TwDXwHdHF3lvMFwidqZUJitTEZntlciyfqzqn+mBN2bWDD
	eR15bZwsIvoBBn9LqJdtwCGMt3NSshfcBL2gYoPU/q91X3BSA8ZB0Em8QNA4y7p2d5/0=;
Message-ID: <ab531f8b-a602-22e0-dabf-c7d073c88236@xen.org>
Date: Tue, 31 May 2022 10:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220531024127.23669-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/05/2022 03:41, Daniel P. Smith wrote:
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index f16eb0df43..57b14e22c9 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -17,3 +17,15 @@ config NR_CPUS
>   	  For CPU cores which support Simultaneous Multi-Threading or similar
>   	  technologies, this the number of logical threads which Xen will
>   	  support.
> +
> +config NR_BOOTMODS
> +	int "Maximum number of boot modules that a loader can pass"
> +	range 1 64

OOI, any reason to limit the size?

> +	default "8" if X86
> +	default "32" if ARM
> +	help
> +	  Controls the build-time size of various arrays allocated for
> +	  parsing the boot modules passed by a loader when starting Xen.
> +
> +	  This is of particular interest when using Xen's hypervisor domain
> +	  capabilities such as dom0less.
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 2bb01ecfa8..312a3e4209 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -10,7 +10,8 @@
>   
>   #define NR_MEM_BANKS 256
>   
> -#define MAX_MODULES 32 /* Current maximum useful modules */
> +/* Current maximum useful modules */
> +#define MAX_MODULES CONFIG_NR_BOOTMODS

There are only a handful number of use of MAX_MODULES in Arm. So I would 
prefer if we replace all the use with CONFIG_NR_BOOTMODS.

Cheers,

-- 
Julien Grall

