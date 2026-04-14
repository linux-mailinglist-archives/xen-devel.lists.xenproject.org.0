Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN2tI5ui3mkeGwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383F33FE573
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282089.1564796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJW-0006Mq-31; Tue, 14 Apr 2026 20:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282089.1564796; Tue, 14 Apr 2026 20:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJV-0006K0-Uk; Tue, 14 Apr 2026 20:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1282089;
 Tue, 14 Apr 2026 20:24:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCkJU-0006Ev-EY
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:24:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJT-001nTl-2o;
 Tue, 14 Apr 2026 20:24:47 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJT-0036wi-2K;
 Tue, 14 Apr 2026 20:24:47 +0000
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
	bh=9YaZxjoKz18ZaT0K7IsqTa9f9VS7PwBgIblFZCsgu/c=; b=3vV5BhkS3eXiLHMLnktLSgq4hK
	/y4zHUPJ9mEJevevpbBBm8Aze90H9YZAv87xN8sf0V9jpMaYEa59jOa/OrTBvR1+ioXnK06wKd9xW
	szSCbYPlIT/RmsCQ6HvJi0/ydaR7vl92rMitSjsCowkvCWeXBTbWsbIaSaCK/RppOo9Y=;
Message-ID: <4d00797b-fe24-43d6-9ada-42426bcdab30@xen.org>
Date: Tue, 14 Apr 2026 16:18:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/23] xen/arm: vIOMMU: Add cmdline boot option "viommu
 = <string>"
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <5d86efa38ca99439153822fa19064bda6843fdc2.1774918270.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5d86efa38ca99439153822fa19064bda6843fdc2.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 383F33FE573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 31/03/2026 10:52, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Add cmdline boot option "viommu = <string>" to enable or disable the
> virtual iommu support for guests on ARM (only viommu="smmuv3" supported
> for now).

In Xen terminology, 'guests' refers to domUs. IOW, this doesn't include 
dom0. Is this what you meant? If so, how would you enable it for dom0?

That said, is there any particular reason why this can't be 
automatically enabled based on the SMMUv3 discovered?

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   docs/misc/xen-command-line.pandoc      |  9 +++++++++
>   xen/arch/arm/include/asm/viommu.h      | 12 ++++++++++++
>   xen/drivers/passthrough/arm/viommu.c   | 11 +++++++++++
>   xen/drivers/passthrough/arm/vsmmu-v3.c |  3 +++
>   4 files changed, 35 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 6c77129732..6531c2355c 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2850,6 +2850,15 @@ The optional `keep` parameter causes Xen to continue using the vga
>   console even after dom0 has been started.  The default behaviour is to
>   relinquish control to dom0.
>   
> +### viommu (arm)
> +> `= <string>`
> +
> +> Default: ``
> +
> +Flag to enable or disable support for the virtual IOMMU for guests. Disabled by
> +default. Enable by specifying target IOMMU type (if supported). Only "smmuv3"
> +IOMMU emulation supported at this point.
> +
>   ### viridian-spinlock-retry-count (x86)
>   > `= <integer>`
>   
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> index 2a6742de73..ed338fe0ec 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -10,6 +10,7 @@
>   #include <public/xen.h>
>   
>   extern struct list_head host_iommu_list;
> +extern char viommu[];
>   
>   /* data structure for each hardware IOMMU */
>   struct host_iommu {
> @@ -50,6 +51,12 @@ uint16_t viommu_get_type(void);
>   void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>                               const struct dt_device_node *node);
>   
> +static always_inline bool is_viommu_enabled(void)

Regardless what Luca wrote, why do we need to force "always_inline"?

> +{
> +    /* only smmuv3 emulation supported */
> +    return !strcmp(viommu, "smmuv3");
> +}
> +
>   #else
>   
>   static inline uint8_t viommu_get_type(void)
> @@ -76,6 +83,11 @@ static inline void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>       return;
>   }
>   
> +static always_inline bool is_viommu_enabled(void)
> +{
> +    return false;
> +}
> +
>   #endif /* CONFIG_ARM_VIRTUAL_IOMMU */
>   
>   #endif /* __ARCH_ARM_VIOMMU_H__ */
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> index 53ae46349a..5f5892fbb2 100644
> --- a/xen/drivers/passthrough/arm/viommu.c
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -3,6 +3,7 @@
>   #include <xen/errno.h>
>   #include <xen/init.h>
>   #include <xen/irq.h>
> +#include <xen/param.h>
>   #include <xen/types.h>
>   
>   #include <asm/viommu.h>
> @@ -38,8 +39,18 @@ void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>       list_add_tail(&iommu_data->entry, &host_iommu_list);
>   }
>   
> +/* By default viommu is disabled.
> + * If enabled, 'viommu' param indicates type (smmuv3 is only supported type atm)
> + */
> +char __read_mostly viommu[10] = "";
> +string_param("viommu", viommu);
> +
>   int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>   {
> +    /* Enable viommu when it has been enabled explicitly (viommu="smmuv3"). */
> +    if ( !is_viommu_enabled() )
 > +        return 0;> +
>       if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>           return 0;
>   
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index 6b4009e5ef..e36f200ba5 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -105,6 +105,9 @@ void __init vsmmuv3_set_type(void)
>   {
>       const struct viommu_desc *desc = &vsmmuv3_desc;
>   
> +    if ( !is_viommu_enabled() )

This is likely going to go wrong in the future if we add support for 
other vIOMMU in the future. If we decide to continue using the command 
line option (see above), you would want want an helper to return the 
selected emulation and check against SMMUv3 here.

Cheers,

-- 
Julien Grall


