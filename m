Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C63423DA48
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 14:23:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3evi-00036O-0y; Thu, 06 Aug 2020 12:23:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3evg-00036I-BP
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 12:23:28 +0000
X-Inumbo-ID: 507d9808-a7a5-4e63-84e7-ee5ebf72a60e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 507d9808-a7a5-4e63-84e7-ee5ebf72a60e;
 Thu, 06 Aug 2020 12:23:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2822EAD5B;
 Thu,  6 Aug 2020 12:23:44 +0000 (UTC)
Subject: Re: [PATCH v4 11/14] iommu: stop calling IOMMU page tables 'p2m
 tables'
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-12-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5aa64762-4406-8063-2fd0-c55f168dfa72@suse.com>
Date: Thu, 6 Aug 2020 14:23:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-12-paul@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
> @@ -553,14 +549,7 @@ static void iommu_dump_p2m_table(unsigned char key)
>          if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
>              continue;
>  
> -        if ( iommu_use_hap_pt(d) )
> -        {
> -            printk("\ndomain%d IOMMU p2m table shared with MMU: \n", d->domain_id);
> -            continue;
> -        }
> -
> -        printk("\ndomain%d IOMMU p2m table: \n", d->domain_id);

This (importantish) information was lost.

> @@ -2624,17 +2624,19 @@ static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
>      unmap_vtd_domain_page(pt_vaddr);
>  }
>  
> -static void vtd_dump_p2m_table(struct domain *d)
> +static void vtd_dump_page_tables(struct domain *d)
>  {
> -    const struct domain_iommu *hd;
> +    const struct domain_iommu *hd = dom_iommu(d);
>  
> -    if ( list_empty(&acpi_drhd_units) )
> +    if ( iommu_use_hap_pt(d) )
> +    {
> +        printk("VT-D sharing EPT table\n");
>          return;
> +    }
>  
> -    hd = dom_iommu(d);
> -    printk("p2m table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw));
> -    vtd_dump_p2m_table_level(hd->arch.vtd.pgd_maddr,
> -                             agaw_to_level(hd->arch.vtd.agaw), 0, 0);
> +    printk("VT-D table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw));

I think it's commonly VT-d (a mixture of case).

Jan

