Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F247D353
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 15:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250850.432046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02Dl-00071k-Gz; Wed, 22 Dec 2021 14:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250850.432046; Wed, 22 Dec 2021 14:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02Dl-0006za-Dv; Wed, 22 Dec 2021 14:03:57 +0000
Received: by outflank-mailman (input) for mailman id 250850;
 Wed, 22 Dec 2021 14:03:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n02Dj-0006zU-FW
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 14:03:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02Dj-0005TI-2R; Wed, 22 Dec 2021 14:03:55 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02Di-0007zq-QZ; Wed, 22 Dec 2021 14:03:55 +0000
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
	bh=VeoXK/OEpfHvbzDQoenm3wUrEzxO+9ELS6JEIkljLMU=; b=hDkIeqX9N9rj1Q23uIhcoXf8m5
	bS1aHcE+xYhAX1H5q6+rJ2skRsQDDxrIrJ+J+cW8yVdBJs9KswmVk3TJuYhSDaNyUE4ws82lQIU/Q
	iXxga8iK5dHk4CBAlmRS/LxUNqByi6ykE/QKruPYz7zEhD2nudXUcoxJdLumBrk+AVy8=;
Message-ID: <5c7e494a-c94d-4924-883e-f845b5fcd27f@xen.org>
Date: Wed, 22 Dec 2021 15:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN][RFC PATCH v2 03/12] libfdt: Keep fdt functions after init
 for CONFIG_OVERLAY_DTB.
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-4-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1636441347-133850-4-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 09/11/2021 08:02, Vikram Garhwal wrote:
> This is done to access fdt library function which are required for adding device
> tree overlay nodes for dynamic programming of nodes.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/common/libfdt/Makefile | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
> index 6bd207c..f838f5f 100644
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -1,7 +1,10 @@
>   include Makefile.libfdt
>   
>   SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
> +

NIT: I would add a short comment explaining why we need to keep after init.

> +ifneq ($(CONFIG_OVERLAY_DTB),y)
>   OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
> +endif

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

