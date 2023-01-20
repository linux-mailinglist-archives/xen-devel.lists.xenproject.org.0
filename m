Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D033C6747CF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 01:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481412.746270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeuP-0000Af-BR; Fri, 20 Jan 2023 00:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481412.746270; Fri, 20 Jan 2023 00:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeuP-000088-8f; Fri, 20 Jan 2023 00:05:29 +0000
Received: by outflank-mailman (input) for mailman id 481412;
 Fri, 20 Jan 2023 00:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIeuN-000082-H1
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 00:05:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24006c3e-9856-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 01:05:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6BE2DB81A58;
 Fri, 20 Jan 2023 00:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27167C433D2;
 Fri, 20 Jan 2023 00:05:23 +0000 (UTC)
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
X-Inumbo-ID: 24006c3e-9856-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674173124;
	bh=qNK/RCj+GcV6rZUusEkgSFCwekcXk4u2+BLADfGWquI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aeENQG5Z8KIDv61czG0Fc0ble7WWMCJA55Hmq0grZie3Rc3Os8hAYr4rwG2VyViLR
	 Ps29ep6s1h+Np0PrnAZDEkGurlf3c6jpsuc932vSTbrVrE5iRUCy4Ewco6umOopcY3
	 9zj7rxQ5GhQr+ddtC2dpLhxvkI9RbF0eABzVb1mfh6TFYA+aS5bswom1pPHxnymlB0
	 1PcEf71rrm4EArxYBiQ5rt40fYSl5kR+DECMYq4Q3OpMIyE3lXKOhvZwydfysGfimo
	 q3otku+NtA3/PY4HdR/3o3JaAu5fud0cylOxR/FK1eQZe1PW7IQMxHuqqff/dN0+Sh
	 bRcoeufp12K3Q==
Date: Thu, 19 Jan 2023 16:05:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 11/11] xen/arm: p2m: Enable support for 32bit IPA
In-Reply-To: <20230117174358.15344-12-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191605150.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-12-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
> Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
> "Virtualization Translation Control Register" for the bit descriptions.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from -
> 
> v1 - New patch.
> 
>  xen/arch/arm/p2m.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 948f199d84..cfdea55e71 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
>      register_t val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>  
>  #ifdef CONFIG_ARM_32
> -    if ( p2m_ipa_bits < 40 )
> +    if ( p2m_ipa_bits < PADDR_BITS )
>          panic("P2M: Not able to support %u-bit IPA at the moment\n",
>                p2m_ipa_bits);
>  
> -    printk("P2M: 40-bit IPA\n");
> -    p2m_ipa_bits = 40;
> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
> +    p2m_ipa_bits = PADDR_BITS;
> +#ifdef CONFIG_ARM_PA_32
> +    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
> +#else
>      val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
> +#endif
>      val |= VTCR_SL0(0x1); /* P2M starts at first level */
>  #else /* CONFIG_ARM_64 */
>      static const struct {
> -- 
> 2.17.1
> 

