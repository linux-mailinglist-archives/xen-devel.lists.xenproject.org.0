Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C967E318B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 00:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628513.980067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r099U-0003VA-Kq; Mon, 06 Nov 2023 23:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628513.980067; Mon, 06 Nov 2023 23:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r099U-0003T0-Hq; Mon, 06 Nov 2023 23:37:04 +0000
Received: by outflank-mailman (input) for mailman id 628513;
 Mon, 06 Nov 2023 23:37:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r099S-0003Su-UM
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 23:37:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r099R-0000EF-L8; Mon, 06 Nov 2023 23:37:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r099R-00017x-Eb; Mon, 06 Nov 2023 23:37:01 +0000
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
	bh=FXZee6PuDgeI2YZADsXwiR4hxv3DFvnuoFN7ilxVdA8=; b=VKAHJwelsWopMRPNFpM18cXlQu
	CZT+Iq2mjB/pYOGhbhfeFEh6Bul8tvTPkwIAfwBo7ePCH6gxE5SFWUzybl2W/jl25xQ0fQdo3FxFW
	LORiWgZZ8TEk4INDreFKYtBr7kSWBApSa921fUVkpVCVyiNOlPL0f0qs3Xqlddm1eXUU=;
Message-ID: <68471b07-6091-46c0-b2aa-562fcdec4a42@xen.org>
Date: Mon, 6 Nov 2023 23:36:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: avoid generation of stub <asm/pci.h> header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 01/11/2023 10:15, Oleksii Kurochko wrote:
> Platforms which doesn't have HAS_PCI enabled it is needed to
> have <asm/pci.h>, which contains only an empty definition of
> struct arch_pci_dev ( except ARM, it introduces several
> ARM-specific functions ).
> 
> Also, for architectures ( such as PPC or RISC-V ) on initial
> stages of adding support, it is needed to generate <asm/pci.h>
> for only define the mentioned above arch_pci_dev structure.
> 
> For the Arm-only stubs ( mentioned in <asm/pci.h> for disabled
> HAS_PCI and ARM-specific) will be needed
NIT: You seem to have a mix of ARM and Arm within the same commit 
message. I know that there are debate on which one to use (even though 
the latter is correct). I am ok if you want to either, but please at 
least be consistent :).

> to add <asm/pci.h> directly alongside <xen/pci.h>. Only to
> <arm/domain.c> <asm/pci.h> was added.

You are lucky here because there is only one place needed, so including 
both <xen/pci.h> and <asm/pci.h> is ok. However, I am not sure I like 
this approach as a general solution as it may require to include both 
the common and arch specific header in multiple places.

Anyway, we can discuss this in more details once we have an example.

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/arm/domain_build.c    |  1 +
>   xen/arch/arm/include/asm/pci.h |  7 -------
>   xen/arch/ppc/include/asm/pci.h |  7 -------
>   xen/include/xen/pci.h          | 11 +++++++++++
>   4 files changed, 12 insertions(+), 14 deletions(-)
>   delete mode 100644 xen/arch/ppc/include/asm/pci.h
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 49792dd590..2dd2926b41 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -23,6 +23,7 @@
>   #include <asm/kernel.h>
>   #include <asm/setup.h>
>   #include <asm/tee/tee.h>
> +#include <asm/pci.h>
>   #include <asm/platform.h>
>   #include <asm/psci.h>
>   #include <asm/setup.h>
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 8cb46f6b71..7f77226c9b 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -130,13 +130,6 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
>   
>   #else   /*!CONFIG_HAS_PCI*/
>   
> -struct arch_pci_dev { };
> -
> -static always_inline bool is_pci_passthrough_enabled(void)
> -{
> -    return false;
> -}
> -
>   struct pci_dev;
>   
>   static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}

Some of the definion in !CONFIG_HAS_PCI seems unnecessary. This one is 
an example. I will have a look to clean them up after your patch is 
committed.

Cheers,

-- 
Julien Grall

