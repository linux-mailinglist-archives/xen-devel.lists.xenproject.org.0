Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD91075CCBC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567641.886941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsSh-0000TQ-TO; Fri, 21 Jul 2023 15:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567641.886941; Fri, 21 Jul 2023 15:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsSh-0000QW-Ow; Fri, 21 Jul 2023 15:54:35 +0000
Received: by outflank-mailman (input) for mailman id 567641;
 Fri, 21 Jul 2023 15:54:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMsSg-0000QQ-V1
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:54:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMsSg-0001FY-BO; Fri, 21 Jul 2023 15:54:34 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.21.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMsSg-0006Y5-20; Fri, 21 Jul 2023 15:54:34 +0000
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
	bh=rUoOoweRa5HydyDUpA0mv1S5V7GjblEr08agVZ9dhx0=; b=ll8a6O9hprqgEBNDwSDXcTqy1M
	1xLDNYPx5H128mTunNzuvJcQsV6BifMSozQwCcKGpSTN+IPojqCZU2DCEU+JFIawb91hHhIghHXvk
	kVIM0nLdza0+ivW9gufmOBzfRYQLBMa1fJPHDvD/trGm9qUkcWqFTrIMatl7P9hs/LbY=;
Message-ID: <ae4beda6-bb2d-b494-bc06-ce6475bf3624@xen.org>
Date: Fri, 21 Jul 2023 16:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/arm: mechanical renaming to address MISRA C:2012
 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <164303a2b19336a0e5f934a995d2a9c104035fab.1689952914.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <164303a2b19336a0e5f934a995d2a9c104035fab.1689952914.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/07/2023 16:22, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The function parameters renamed in this patch are hiding a variable defined
> in an enclosing scope or a function identifier.
> 
> The following renames have been made:
> - s/guest_mode/guest_mode_on/ to distinguish from function 'guest_mode'
> - s/struct module_name/struct module_info to distinguish from the homonymous

Typo: Missing '/' after 'module_info'.

> parameters, since the structure contains more information than just the name.
> - s/file_name/file_info in 'xen/arch/arm/efi/efi-boot.h' for consistency with

Same here.

> the previous renaming.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Assuming there is no other comments, I would be Ok to fix it on commit. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

