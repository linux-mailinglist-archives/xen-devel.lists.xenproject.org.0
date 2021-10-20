Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC943523E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 20:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214049.372470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFtA-0002U0-Mj; Wed, 20 Oct 2021 18:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214049.372470; Wed, 20 Oct 2021 18:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFtA-0002Rn-HK; Wed, 20 Oct 2021 18:00:32 +0000
Received: by outflank-mailman (input) for mailman id 214049;
 Wed, 20 Oct 2021 18:00:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdFt8-0002Rh-Od
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 18:00:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdFt8-0002tZ-Ld; Wed, 20 Oct 2021 18:00:30 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdFt8-0007hx-Fy; Wed, 20 Oct 2021 18:00:30 +0000
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
	bh=nk6p3GphD9fOzRbADdcK32HQ5KULYFp39jpVqY55l3s=; b=j0+cU2eRogXjos4Gz3+jgt918o
	xF/wEZuC2wCaJ+P1YGcN+MPmLKkttxr2BvQQLd8NODq90bS/YbrFVEGZvGnv7I/+3bdzZxTZFe0/n
	GRSmhQ/QKKjvz/6sKhU9jho+mcpVkJJNgV7UAwKDJUZCkPHwlpKTTJKr3WzYKsgk+iTk=;
Message-ID: <23e8372d-d921-e695-f3c3-43e0b2e198c1@xen.org>
Date: Wed, 20 Oct 2021 19:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [XEN][RFC PATCH 02/13] libfdt: Keep fdt functions after init.
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
 <1630562763-390068-3-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1630562763-390068-3-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 02/09/2021 07:05, Vikram Garhwal wrote:
> Keep libfdt library functionalities after boot of hw_domain. This is done to
> access fdt library function which are required for adding device tree overlay
> nodes for dynamic programming of nodes.

AFAICT, the new feature will be mostly useful on HW with FPGA. I expect 
that some users may not want this feature (for instance because the HW 
doesn't have FPGA), so I think it would be best to introduce a new 
Kconfig to enable the new feature.

This could then be used to decide whether libfdt should be part of .init 
or not.

Cheers,

> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/common/libfdt/Makefile | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
> index 6bd207c..8002f8c 100644
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -1,7 +1,6 @@
>   include Makefile.libfdt
>   
>   SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
> -OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
>   
>   obj-y += libfdt.o
>   nocov-y += libfdt.o
> 

-- 
Julien Grall

