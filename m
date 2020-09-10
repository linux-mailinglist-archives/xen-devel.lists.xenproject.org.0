Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C02647F7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:27:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNXd-00045s-12; Thu, 10 Sep 2020 14:27:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGNXb-00045l-KA
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:27:11 +0000
X-Inumbo-ID: 061d516b-4643-41a0-abdf-9a78b36ac679
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 061d516b-4643-41a0-abdf-9a78b36ac679;
 Thu, 10 Sep 2020 14:27:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFC25AD77;
 Thu, 10 Sep 2020 14:27:25 +0000 (UTC)
Subject: Re: [PATCH v5 8/8] iommu: stop calling IOMMU page tables 'p2m tables'
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-9-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <611962bf-4cd9-7da8-ea47-e95e5181515b@suse.com>
Date: Thu, 10 Sep 2020 16:27:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907074023.1392-9-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 09:40, Paul Durrant wrote:
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -491,8 +491,8 @@ static int amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
>  
>  #include <asm/io_apic.h>
>  
> -static void amd_dump_p2m_table_level(struct page_info* pg, int level, 
> -                                     paddr_t gpa, int indent)
> +static void amd_dump_page_table_level(struct page_info* pg, int level,

Could you flip * and space here as you touch the line anyway?

> @@ -504,7 +504,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
>      table_vaddr = __map_domain_page(pg);
>      if ( table_vaddr == NULL )
>      {
> -        printk("Failed to map IOMMU domain page %"PRIpaddr"\n", 
> +        printk("%s: failed to map domain page %"PRIpaddr"\n", __func__,
>                  page_to_maddr(pg));

Why the addition of __func__? Personally I'd rather see most of its
uses go away ... (There are two more further down.) Preferably with
this dropped again
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

