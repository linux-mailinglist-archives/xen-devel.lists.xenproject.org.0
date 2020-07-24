Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4EC22CB34
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:38:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz0gv-0008Uj-V0; Fri, 24 Jul 2020 16:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZqH=BD=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jz0gv-0008Ue-6v
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:37:01 +0000
X-Inumbo-ID: e4ecba16-cdcb-11ea-8854-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4ecba16-cdcb-11ea-8854-bc764e2007e4;
 Fri, 24 Jul 2020 16:36:59 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06OGWbg7137538;
 Fri, 24 Jul 2020 16:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=01EMyr1wHjzJZt6M9AJ4M1g1NYiy2MuKr1uPKnQ+kU0=;
 b=QmZP+nPPQVtBy607PuPVscN5d5m4XmbyfpGkWNGPZy+624GVTjIvXlsne2sByCsmCKUw
 K7DOIRjH+oh7S+517fxTU2jBdUXevYRp2Erwqi9UJ0AAgMNpUGFQEALJOYkQNxDRvUDY
 No3OOuhhwEiw+Wrcu5ZqOo2K4WVK0tu3FJzvZwm/t4e1zppdasQVa+d+Extq8hvyUWO/
 FJ3pHVtuorOkORbltPlR1hVf5FjwdCDhAhmb+z8m8jlzg6Rg0A/fcBClM7elvY/bQa9j
 AZbJf8nBQhpi2aMKNURLb0dlNgTz4YX4FAL93EdDejmzC7eGVaziwt7NEzy4k+s1RK/w YQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 32brgs041x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 24 Jul 2020 16:36:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06OGYKYQ175333;
 Fri, 24 Jul 2020 16:36:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 32g38w89t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 16:36:46 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06OGaZAu005069;
 Fri, 24 Jul 2020 16:36:35 GMT
Received: from [10.39.195.138] (/10.39.195.138)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 24 Jul 2020 09:36:35 -0700
Subject: Re: [PATCH v2 4/4] xen: add helpers to allocate unpopulated memory
To: David Hildenbrand <david@redhat.com>,
 Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200724124241.48208-1-roger.pau@citrix.com>
 <20200724124241.48208-5-roger.pau@citrix.com>
 <1778c97f-3a69-8280-141c-879814dd213f@redhat.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <1fd1d29e-5c10-0c29-0628-b79807f81de6@oracle.com>
Date: Fri, 24 Jul 2020 12:36:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1778c97f-3a69-8280-141c-879814dd213f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9692
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007240128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9692
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007240128
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/24/20 10:34 AM, David Hildenbrand wrote:
> CCing Dan
>
> On 24.07.20 14:42, Roger Pau Monne wrote:
>> diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated=
-alloc.c
>> new file mode 100644
>> index 000000000000..aaa91cefbbf9
>> --- /dev/null
>> +++ b/drivers/xen/unpopulated-alloc.c
>> @@ -0,0 +1,222 @@



>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/gfp.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mm.h>
>> +#include <linux/memremap.h>
>> +#include <linux/slab.h>
>> +
>> +#include <asm/page.h>
>> +
>> +#include <xen/page.h>
>> +#include <xen/xen.h>
>> +
>> +static DEFINE_MUTEX(lock);
>> +static LIST_HEAD(list);
>> +static unsigned int count;
>> +
>> +static int fill(unsigned int nr_pages)


Less generic names? How about=C2=A0 list_lock, pg_list, pg_count,
fill_pglist()? (But these are bad too, so maybe you can come up with
something better)


>> +{
>> +	struct dev_pagemap *pgmap;
>> +	void *vaddr;
>> +	unsigned int i, alloc_pages =3D round_up(nr_pages, PAGES_PER_SECTION=
);
>> +	int nid, ret;
>> +
>> +	pgmap =3D kzalloc(sizeof(*pgmap), GFP_KERNEL);
>> +	if (!pgmap)
>> +		return -ENOMEM;
>> +
>> +	pgmap->type =3D MEMORY_DEVICE_DEVDAX;
>> +	pgmap->res.name =3D "XEN SCRATCH";


Typically iomem resources only capitalize first letters.


>> +	pgmap->res.flags =3D IORESOURCE_MEM | IORESOURCE_BUSY;
>> +
>> +	ret =3D allocate_resource(&iomem_resource, &pgmap->res,
>> +				alloc_pages * PAGE_SIZE, 0, -1,
>> +				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);


Are we not going to end up with a whole bunch of "Xen scratch" resource
ranges for each miss in the page list? Or do we expect them to get merged=
?


>> +	if (ret < 0) {
>> +		pr_err("Cannot allocate new IOMEM resource\n");
>> +		kfree(pgmap);
>> +		return ret;
>> +	}
>> +
>> +	nid =3D memory_add_physaddr_to_nid(pgmap->res.start);


Should we consider page range crossing node boundaries?


>> +
>> +#ifdef CONFIG_XEN_HAVE_PVMMU
>> +	/*
>> +	 * We don't support PV MMU when Linux and Xen is using
>> +	 * different page granularity.
>> +	 */
>> +	BUILD_BUG_ON(XEN_PAGE_SIZE !=3D PAGE_SIZE);
>> +
>> +        /*
>> +         * memremap will build page tables for the new memory so
>> +         * the p2m must contain invalid entries so the correct
>> +         * non-present PTEs will be written.
>> +         *
>> +         * If a failure occurs, the original (identity) p2m entries
>> +         * are not restored since this region is now known not to
>> +         * conflict with any devices.
>> +         */
>> +	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
>> +		xen_pfn_t pfn =3D PFN_DOWN(pgmap->res.start);
>> +
>> +		for (i =3D 0; i < alloc_pages; i++) {
>> +			if (!set_phys_to_machine(pfn + i, INVALID_P2M_ENTRY)) {
>> +				pr_warn("set_phys_to_machine() failed, no memory added\n");
>> +				release_resource(&pgmap->res);
>> +				kfree(pgmap);
>> +				return -ENOMEM;
>> +			}
>> +                }
>> +	}
>> +#endif
>> +
>> +	vaddr =3D memremap_pages(pgmap, nid);
>> +	if (IS_ERR(vaddr)) {
>> +		pr_err("Cannot remap memory range\n");
>> +		release_resource(&pgmap->res);
>> +		kfree(pgmap);
>> +		return PTR_ERR(vaddr);
>> +	}
>> +
>> +	for (i =3D 0; i < alloc_pages; i++) {
>> +		struct page *pg =3D virt_to_page(vaddr + PAGE_SIZE * i);
>> +
>> +		BUG_ON(!virt_addr_valid(vaddr + PAGE_SIZE * i));
>> +		list_add(&pg->lru, &list);
>> +		count++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xen_alloc_unpopulated_pages - alloc unpopulated pages
>> + * @nr_pages: Number of pages
>> + * @pages: pages returned
>> + * @return 0 on success, error otherwise
>> + */
>> +int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **=
pages)
>> +{
>> +	unsigned int i;
>> +	int ret =3D 0;
>> +
>> +	mutex_lock(&lock);
>> +	if (count < nr_pages) {
>> +		ret =3D fill(nr_pages);


(nr_pages - count) ?


>> +		if (ret)
>> +			goto out;
>> +	}
>> +
>> +	for (i =3D 0; i < nr_pages; i++) {
>> +		struct page *pg =3D list_first_entry_or_null(&list, struct page,
>> +							   lru);
>> +
>> +		BUG_ON(!pg);
>> +		list_del(&pg->lru);
>> +		count--;
>> +		pages[i] =3D pg;
>> +
>> +#ifdef CONFIG_XEN_HAVE_PVMMU
>> +		/*
>> +		 * We don't support PV MMU when Linux and Xen is using
>> +		 * different page granularity.
>> +		 */
>> +		BUILD_BUG_ON(XEN_PAGE_SIZE !=3D PAGE_SIZE);
>> +
>> +		if (!xen_feature(XENFEAT_auto_translated_physmap)) {
>> +			ret =3D xen_alloc_p2m_entry(page_to_pfn(pg));
>> +			if (ret < 0) {
>> +				unsigned int j;
>> +
>> +				for (j =3D 0; j <=3D i; j++) {
>> +					list_add(&pages[j]->lru, &list);
>> +					count++;
>> +				}
>> +				goto out;
>> +			}
>> +		}
>> +#endif
>> +	}
>> +
>> +out:
>> +	mutex_unlock(&lock);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
>> +



>> +
>> +#ifdef CONFIG_XEN_PV
>> +static int __init init(void)
>> +{
>> +	unsigned int i;
>> +
>> +	if (!xen_domain())
>> +		return -ENODEV;
>> +
>> +	/*
>> +	 * Initialize with pages from the extra memory regions (see
>> +	 * arch/x86/xen/setup.c).
>> +	 */


This loop will be executing only for PV guests so we can just bail out
for non-PV guests here.


-boris


>> +	for (i =3D 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
>> +		unsigned int j;
>> +
>> +		for (j =3D 0; j < xen_extra_mem[i].n_pfns; j++) {
>> +			struct page *pg =3D
>> +				pfn_to_page(xen_extra_mem[i].start_pfn + j);
>> +
>> +			list_add(&pg->lru, &list);
>> +			count++;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +subsys_initcall(init);



