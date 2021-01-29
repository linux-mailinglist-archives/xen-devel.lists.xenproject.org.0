Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC23087C1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77903.141432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QuJ-0005Oj-Dm; Fri, 29 Jan 2021 10:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77903.141432; Fri, 29 Jan 2021 10:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QuJ-0005OK-Ah; Fri, 29 Jan 2021 10:21:39 +0000
Received: by outflank-mailman (input) for mailman id 77903;
 Fri, 29 Jan 2021 10:21:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5QuI-0005OF-3G
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:21:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5QuG-0003BN-E6; Fri, 29 Jan 2021 10:21:36 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5QuG-00025d-61; Fri, 29 Jan 2021 10:21:36 +0000
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
	bh=YGdmQH5H8foxC8np7cSTCtqNmpjjnoAZ9MG+XhPtyB4=; b=D8TNP53kAL/goAYzPqmOW5dRLx
	ytjFaLrXlLe6DWxjRKQZcvUOGW/tBdc6uqFQNImd7yVcOdiK1Fb0JJDACA4Ch1GclEE4OPVFg/BxK
	eswSvBdCCumYtMpsyWzWYcJJkOT2xZsv5y97aPa6WknGHlzY7SUJzgyffzsZiFgcvjg0=;
Subject: Re: [PATCH V6 23/24] xen/ioreq: Do not let bufioreq to be used on
 other than x86 arches
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-24-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <344681d3-eb27-cb5b-2179-114b8e536c72@xen.org>
Date: Fri, 29 Jan 2021 10:21:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-24-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 29/01/2021 01:48, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch prevents the device model running on other than x86
> systems to use buffered I/O feature for now.
> 
> Please note, there is no caller which requires to send buffered
> I/O request on Arm currently and the purpose of this check is
> to catch any future user of bufioreq.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes V5 -> V6:
>     - new patch
> ---
> ---
>   xen/common/ioreq.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index 67ef1f7..a36137d 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -629,6 +629,9 @@ static int ioreq_server_create(struct domain *d, int bufioreq_handling,
>       unsigned int i;
>       int rc;
>   
> +    if ( !IS_ENABLED(CONFIG_X86) && bufioreq_handling )
> +        return -EINVAL;
> +
>       if ( bufioreq_handling > HVM_IOREQSRV_BUFIOREQ_ATOMIC )
>           return -EINVAL;
>   
> 

-- 
Julien Grall

