Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8814A5AFEEE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400928.642566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqNv-0000b0-Uj; Wed, 07 Sep 2022 08:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400928.642566; Wed, 07 Sep 2022 08:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqNv-0000ZD-S1; Wed, 07 Sep 2022 08:26:11 +0000
Received: by outflank-mailman (input) for mailman id 400928;
 Wed, 07 Sep 2022 08:26:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVqNu-0000Z5-9y
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:26:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqNs-0000UA-2m; Wed, 07 Sep 2022 08:26:08 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqNr-0005E4-Sl; Wed, 07 Sep 2022 08:26:08 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=Xz4v1F92Bq9wTRs1yYIiEnrnwkV/Cp9iyBNrBggrlUc=; b=wWA8cTM0kqI6Pd2AdbA3dwcz3r
	DdmYqR7oGdYdl6TuyPR71NYMvrc70XYUL9sM2wYx+gynjKsUTTzcbuLczTzbLlDwFvZT3eQ0Fk/HU
	60pLfKM/kX34cG8GYxzMEEeW74GDON1YT7D5vxvxaLqf62Ryj/0PRjLgkdQy4C45y0e8=;
Message-ID: <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
Date: Wed, 7 Sep 2022 09:26:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220906113112.106995-1-leo.yan@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220906113112.106995-1-leo.yan@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leo,

On 06/09/2022 12:31, Leo Yan wrote:
> On Arm64 Linux kernel prints log for Xen version number:
> 
>    [    0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found
> 
> Because the header file "xen/compile.h" is missed, XEN_VERSION and
> XEN_SUBVERSION are not defined, thus compiler directly uses the
> string "XEN_VERSION" and "XEN_SUBVERSION" in the compatible string.
> 
> This patch includes the header "xen/compile.h" which defines macros for
> XEN_VERSION and XEN_SUBVERSION, thus Xen can pass the version number via
> hypervisor node.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

AFAICT, the problem was introduced when we split the ACPI code from 
arch/domain_build.c. So I would add the following tag:

Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")

Now, this means we shipped Xen for ~4 years with the wrong compatible. 
The compatible is meant to indicate the Xen version. However, I don't 
think this is used for anything other than printing the version on the 
console.

Also, the problem occurs only when using ACPI. This is still in tech 
preview, so I think we don't need to document the issue in the 
documentation (we can easily break ABI).

> ---
>   xen/arch/arm/acpi/domain_build.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index bbdc90f92c..2649e11fd4 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -9,6 +9,7 @@
>    * GNU General Public License for more details.
>    */
>   
> +#include <xen/compile.h>

So this is fixing the immediate problem. Given the subtlety of the bug, 
I think it would be good to also harden the code at the same time.

I can see two way to do that:
   1) Dropping the use of __stringify
   2) Check if XEN_VERSION and XEN_SUBVERSION are defined

The latter is probably lightweight. This could be added right next to 
acpi_make_hypervisor_node() for clarify.

Something like:

#ifndef XEN_VERSION
# error "XEN_VERSION is not defined"
#endif

#ifndef XEN_SUBVERSION
# error "XEN_SUBVERSION is not defined"
#endif

Could you have a look?

>   #include <xen/mm.h>
>   #include <xen/sched.h>
>   #include <xen/acpi.h>

Cheers,

-- 
Julien Grall

