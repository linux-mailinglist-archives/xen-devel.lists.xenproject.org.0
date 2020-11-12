Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6FC2B021E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 10:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25607.53481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd95W-0007Uf-Nm; Thu, 12 Nov 2020 09:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25607.53481; Thu, 12 Nov 2020 09:40:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd95W-0007UF-KH; Thu, 12 Nov 2020 09:40:18 +0000
Received: by outflank-mailman (input) for mailman id 25607;
 Thu, 12 Nov 2020 09:40:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kd95U-0007UA-NN
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:40:17 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3764a262-55cf-44f6-b19c-6724659a8f5d;
 Thu, 12 Nov 2020 09:40:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kd95U-0007UA-NN
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:40:17 +0000
X-Inumbo-ID: 3764a262-55cf-44f6-b19c-6724659a8f5d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3764a262-55cf-44f6-b19c-6724659a8f5d;
	Thu, 12 Nov 2020 09:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605174012;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TV+J106vbCP05Jfh2VTPOPChPRP/wm8xStzRmUyYG1E=;
  b=eR3fIeuPDmXFp0ssQVmlQDgdspJ/WsL1bDNzLXSkWD10aPWLSOeQHeU6
   E3WdYNc10gXIiEFzZcGj1X8YkfgyG7dySu/XeaCX9inS+A7mpQ4yYpWmT
   EW+On0veIpf+flOmOfrlQ2JAJkFH7q6Nlv+eJZnK5Q/tzNP1qOKPO+UB5
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aqbbyYh7qYje18++vylt0q0OgitcAyjLl/DS9q10P4hrjqDOuxrn5LPrNchc9yXEEGf5I5+JCC
 KNhco36FVI0yMy/ofxIsMzsNVF499X2yTuZ6xVXJiRC3teQ++H222sS4iesiDSycL6JbICxlOM
 5+By6Gr4/GTjzECIHvda3mHcjO3rjV1ZWsPCSI568spHvHqLsyfytPM16tNeDoJlXsCJOQpJ7d
 CKxO1FtpKIOSU9sTmhClNI2t4/9chJyG/P08d+cqu8uG0vIR7CkNomO8fbKcDT0QmA9d9KoxUI
 kdg=
X-SBRS: None
X-MesageID: 31245969
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,471,1596513600"; 
   d="scan'208";a="31245969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgoClDx7c6NM+0zlOfvHg6dEMzBnaLvLsMSNyRnWjDB14blZJstk3eVVm63oCQu7UQqZGxc1wa2Y+l6o0co5Uv6Gpb+4u5gqymWriE+tOko95Pz+Ax35WNtDz2WhqLV+KTzCzLhchlvuWznCVbk6BwSgnUr6PBzAaJEKUVJkFjw9itMGFl0UCLQ5xsgIl1d90br0IUV0nMskIum9o1kR1rV+Y50KNMJBy/Rtf+oGruc7wdC+0gkKIF1xlMWF4FPcWLlCoOrgsIKBdmob6KRItXcKXpGDqYbk7Nu8V0qgjmES4NRfgiF3wU3hfh+xM1DJQy6r1Ev/8piZh9Yxyy73jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbzmE2kxRSKUNyPPI7O4G6Gu00y4rOiPrH3KBINLnb4=;
 b=W+6e4fq71kLiCgyBkgJbvYDAsucfcSdw30q8F2MH9RdFa4vd1duR92HxWE0ZDOX3VvDyQ1RrSgESqtnsZxa1UGS+KSV1QY38Yx1re4nxEHrNtLBSlLeYYVbCobKMrGxv1JJRRKBNFHmWszNWjy76sd+InMWB543HroaP6LNNjwdSVSwiC3dV8lq21BgeKCyqgtnEiFJkGt6wvpSbfgGr4vTkY9u7DJmBkU2of0pFuvMZO/3DeFbZzRdWoA9VZGQq+PqUHa4eQVTT06oKtKNnBCZOfuJN/4bUt0yNRvACIjSICh3xPewOSQUSdnJdZ5s3TV8QwzFFyXdX1rp5pd2BTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbzmE2kxRSKUNyPPI7O4G6Gu00y4rOiPrH3KBINLnb4=;
 b=lWP3RO/BDrt2rI33GIbivfShSfqHZEIwPCyBZPDZMaLAa0Fn79KemnKYXQ0EPtccpIR2d01vdVsYZWQhYv6q9QWfm4yOl56iziHvwBiekJURo0AGPuuEkYGgIuQ/295UVrf7b7rAsxV+TXLhkA6t/hjbzD6kThY1DIyKZhuSGv4=
Date: Thu, 12 Nov 2020 10:40:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <Rahul.Singh@arm.com>, <Bertrand.Marquis@arm.com>, <julien.grall@arm.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
Message-ID: <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201109125031.26409-7-andr2000@gmail.com>
X-ClientProxiedBy: LO2P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::26) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fdb6a0d-4877-44ab-9f32-08d886eef153
X-MS-TrafficTypeDiagnostic: SN6PR03MB4304:
X-Microsoft-Antispam-PRVS: <SN6PR03MB4304E1A4393965682FE542C58FE70@SN6PR03MB4304.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSI2Uo08IyPgPyc/vqsR6u0919MeVfGZSgqOo17O0wxiUveI5gtqapVyd5kSUOZ3Ycc0G6nHX2f4hLRfuXI+26NDUxOdeCm046YLx2G6op8rfnnRGS7EmjUnzMaqPxYm8tJ1h5ojoqBkv7geyS1/v1b0r3i++y/G0K1IxTU8eSB70b+xfYFtC4tqogvF5DgPAt6TIHJ/NS2Bf76qJjant4LUCJkXkc2t4zRNDsnQ0rqRdyYJDPrtmdc4Wp+6ah/mKVHSF34NUq/rqKmXf6vbBU9wMCTbZATsoEE2qHON1CMCB3FHbFdwaa3KsBA3TUuk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(33716001)(16526019)(956004)(6496006)(7416002)(316002)(186003)(8936002)(478600001)(83380400001)(5660300002)(6916009)(6486002)(4326008)(86362001)(66946007)(66556008)(85182001)(66476007)(1076003)(6666004)(2906002)(8676002)(26005)(9686003)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BWd6OTlN9v37JzwrvGy1tGS24l/0Zd9EtREPUL/okrwOWtzNhhCkKTJdAO4iN4xxjgqKV4Qd3pEn9PF9qeWhxwMfYN4Gc2mTAQZX7N02jNhQB573JQlYY50lpuRG7g+i4E5hasatyYqfJ20uOLHDQUP8ZYRtlJzcBB3GTXvfKZGTqQi/R7xW//c0ZT0cyisrKE3Pw1NZbDW/eJhsZZo/oTG/aF6nxXUSw+zXwqvCpPRtkPrgsT6P7WpoQtNckesHXs+l8dhL3p4Y/KaV9hM91QYEzl3DcntAylYGsZY/GmG+H6uxmYhQxHOv5ybzlAVEkcudhwhk1wIE/PLCQZa9GPnupRrqIOxI42iOw7jrLtiHvJwiTPCc31uAvk4KJrVPr1Fuu/LRTUaWKSZV3D1/ENULw+qvIWDwA6cWWZR4GB7hBF5BkF/ndFmtiG/r4RfkmldOeZtJEjo0NnPoToyaAlACKmh7/mjTCLdEtI1ageThZHj1h90mIXhcwOM7VHxriwXobSKEJGPxc6hj6oFHtY/wIcAc4k3O0sp97p52JL/O9QNnDgJ/QLarfy1QVOT7VPpWK86PUyPeVQD6vZ7S5uEZi6Z762OeJYiYN0/1CmC7F27PzpYqg8llqOpdFaQz7529AxN2+fUjPZOlIMMV9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdb6a0d-4877-44ab-9f32-08d886eef153
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 09:40:08.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnmZN+4igRLHEiZZeACw0LyJ5ysr0rK46vfLnpPCYM2maBqU7jvwzO0BfzMnQUhcti0uxaFb3YqVjGn/Ua5x7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4304
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 02:50:27PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> At the moment there is an identity mapping between how a guest sees its
> BARs and how they are programmed into guest domain's p2m. This is not
> going to work as guest domains have their own view on the BARs.
> Extend existing vPCI BAR handling to allow every domain to have its own
> view of the BARs: only hardware domain sees physical memory addresses in
> this case and for the rest those are emulated, including logic required
> for the guests to detect memory sizes and properties.
> 
> While emulating BAR access for the guests create a link between the
> virtual BAR address and physical one: use full memory address while
> creating range sets used to map/unmap corresponding address spaces and
> exploit the fact that PCI BAR value doesn't use 8 lower bits of the

I think you mean the low 4bits rather than the low 8bits?

> memory address. Use those bits to pass physical BAR's index, so we can
> build/remove proper p2m mappings.

I find this quite hard to review, given it's a fairly big and
complicated patch. Do you think you could split into smaller chunks?

Maybe you could split into smaller patches that add bits towards the
end goal but still keep the identity mappings?

I've tried to do some review below, but I would appreciate if you
could split this.

> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/drivers/vpci/header.c | 276 ++++++++++++++++++++++++++++++++++----
>  xen/drivers/vpci/vpci.c   |   1 +
>  xen/include/xen/vpci.h    |  24 ++--
>  3 files changed, 265 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f74f728884c0..7dc7c70e24f2 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -31,14 +31,87 @@
>  struct map_data {
>      struct domain *d;
>      bool map;
> +    struct pci_dev *pdev;

If the field is required please place it after the domain one.

>  };
>  
> +static struct vpci_header *get_vpci_header(struct domain *d,
> +                                           const struct pci_dev *pdev);
> +
> +static struct vpci_header *get_hwdom_vpci_header(const struct pci_dev *pdev)
> +{
> +    if ( unlikely(list_empty(&pdev->vpci->headers)) )
> +        return get_vpci_header(hardware_domain, pdev);

I'm not sure I understand why you need a list here: each device can
only be owned by a single guest, and thus there shouldn't be multiple
views of the BARs (or the header).

> +
> +    /* hwdom's header is always the very first entry. */
> +    return list_first_entry(&pdev->vpci->headers, struct vpci_header, node);
> +}
> +
> +static struct vpci_header *get_vpci_header(struct domain *d,
> +                                           const struct pci_dev *pdev)
> +{
> +    struct list_head *prev;
> +    struct vpci_header *header;
> +    struct vpci *vpci = pdev->vpci;
> +
> +    list_for_each( prev, &vpci->headers )
> +    {
> +        struct vpci_header *this = list_entry(prev, struct vpci_header, node);
> +
> +        if ( this->domain_id == d->domain_id )
> +            return this;
> +    }
> +    printk(XENLOG_DEBUG "--------------------------------------" \
> +           "Adding new vPCI BAR headers for domain %d: " PRI_pci" \n",
> +           d->domain_id, pdev->sbdf.seg, pdev->sbdf.bus,
> +           pdev->sbdf.dev, pdev->sbdf.fn);
> +    header = xzalloc(struct vpci_header);
> +    if ( !header )
> +    {
> +        printk(XENLOG_ERR
> +               "Failed to add new vPCI BAR headers for domain %d: " PRI_pci" \n",
> +               d->domain_id, pdev->sbdf.seg, pdev->sbdf.bus,
> +               pdev->sbdf.dev, pdev->sbdf.fn);
> +        return NULL;
> +    }
> +
> +    if ( !is_hardware_domain(d) )
> +    {
> +        struct vpci_header *hwdom_header = get_hwdom_vpci_header(pdev);
> +
> +        /* Make a copy of the hwdom's BARs as the initial state for vBARs. */
> +        memcpy(header, hwdom_header, sizeof(*header));
> +    }
> +
> +    header->domain_id = d->domain_id;
> +    list_add_tail(&header->node, &vpci->headers);

Same here, I think you want a single header, and then some fields
would be read-only for domUs (like the position of the BARs on the
physmap).

> +    return header;
> +}
> +
> +static struct vpci_bar *get_vpci_bar(struct domain *d,
> +                                     const struct pci_dev *pdev,
> +                                     int bar_idx)

unsigned

> +{
> +    struct vpci_header *vheader;
> +
> +    vheader = get_vpci_header(d, pdev);
> +    if ( !vheader )
> +        return NULL;
> +
> +    return &vheader->bars[bar_idx];
> +}
> +
>  static int map_range(unsigned long s, unsigned long e, void *data,
>                       unsigned long *c)
>  {
>      const struct map_data *map = data;
> -    int rc;
> -
> +    unsigned long mfn;
> +    int rc, bar_idx;
> +    struct vpci_header *header = get_hwdom_vpci_header(map->pdev);
> +
> +    bar_idx = s & ~PCI_BASE_ADDRESS_MEM_MASK;

I'm not sure it's fine to stash the BAR index in the low bits of the
address, what about a device having concatenated BARs?

The rangeset would normally join them into a single range, and then
you won't be able to notice whether a region in the rangeset belongs
to one BAR or another.

IMO it might be easier to just have a rangeset for each BAR and
structure the pending work as a linked list of BARs, that will contain
the physical addresses of each BAR (the real phymap one and the guest
physmap view) plus the rangeset of memory regions to map.

> +    s = PFN_DOWN(s);
> +    e = PFN_DOWN(e);

Changing the rangeset to store memory addresses instead of frames
could for example be split into a separate patch.

I think you are doing the calculation of the end pfn wrong here, you
should use PFN_UP instead in case the address is not aligned.

> +    mfn = _mfn(PFN_DOWN(header->bars[bar_idx].addr));
>      for ( ; ; )
>      {
>          unsigned long size = e - s + 1;
> @@ -52,11 +125,15 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, mfn)
> +                      : unmap_mmio_regions(map->d, _gfn(s), size, mfn);
>          if ( rc == 0 )
>          {
> -            *c += size;
> +            /*
> +             * Range set is not expressed in frame numbers and the size
> +             * is the number of frames, so update accordingly.
> +             */
> +            *c += size << PAGE_SHIFT;
>              break;
>          }
>          if ( rc < 0 )
> @@ -67,8 +144,9 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>              break;
>          }
>          ASSERT(rc < size);
> -        *c += rc;
> +        *c += rc << PAGE_SHIFT;
>          s += rc;
> +        mfn += rc;
>          if ( general_preempt_check() )
>                  return -ERESTART;
>      }
> @@ -84,7 +162,7 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>  static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>                              bool rom_only)
>  {
> -    struct vpci_header *header = &pdev->vpci->header;
> +    struct vpci_header *header = get_hwdom_vpci_header(pdev);
>      bool map = cmd & PCI_COMMAND_MEMORY;
>      unsigned int i;
>  
> @@ -136,6 +214,7 @@ bool vpci_process_pending(struct vcpu *v)
>          struct map_data data = {
>              .d = v->domain,
>              .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> +            .pdev = v->vpci.pdev,
>          };
>          int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
>  
> @@ -168,7 +247,8 @@ bool vpci_process_pending(struct vcpu *v)
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>                              struct rangeset *mem, uint16_t cmd)
>  {
> -    struct map_data data = { .d = d, .map = true };
> +    struct map_data data = { .d = d, .map = true,
> +        .pdev = (struct pci_dev *)pdev };

Dropping the const here is not fine. IT either needs to be dropped
from apply_map and further up, or this needs to also be made const.

>      int rc;
>  
>      while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> @@ -205,7 +285,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>  
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
> -    struct vpci_header *header = &pdev->vpci->header;
> +    struct vpci_header *header;
>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
>  #ifdef CONFIG_X86
> @@ -217,6 +297,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      if ( !mem )
>          return -ENOMEM;
>  
> +    if ( is_hardware_domain(current->domain) )
> +        header = get_hwdom_vpci_header(pdev);
> +    else
> +        header = get_vpci_header(current->domain, pdev);
> +
>      /*
>       * Create a rangeset that represents the current device BARs memory region
>       * and compare it against all the currently active BAR memory regions. If
> @@ -225,12 +310,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       * First fill the rangeset with all the BARs of this device or with the ROM
>       * BAR only, depending on whether the guest is toggling the memory decode
>       * bit of the command register, or the enable bit of the ROM BAR register.
> +     *
> +     * Use the PCI reserved bits of the BAR to pass BAR's index.
>       */
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          const struct vpci_bar *bar = &header->bars[i];
> -        unsigned long start = PFN_DOWN(bar->addr);
> -        unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> +        unsigned long start = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) | i;
> +        unsigned long end = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) +
> +            bar->size - 1;

Will this work fine on Arm 32bits with LPAE? It's my understanding
that in that case unsigned long is 32bits, but the physical address
space is 44bits, in which case this won't work.

I think you need to keep the usage of frame numbers here.

>  
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
> @@ -251,9 +339,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      /* Remove any MSIX regions if present. */
>      for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
>      {
> -        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> -        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> -                                     vmsix_table_size(pdev->vpci, i) - 1);
> +        unsigned long start = (vmsix_table_addr(pdev->vpci, i) &
> +                               PCI_BASE_ADDRESS_MEM_MASK) | i;
> +        unsigned long end = (vmsix_table_addr(pdev->vpci, i) &
> +                             PCI_BASE_ADDRESS_MEM_MASK ) +
> +                             vmsix_table_size(pdev->vpci, i) - 1;
>  
>          rc = rangeset_remove_range(mem, start, end);
>          if ( rc )
> @@ -273,6 +363,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       */
>      for_each_pdev ( pdev->domain, tmp )
>      {
> +        struct vpci_header *header;
> +
>          if ( tmp == pdev )
>          {
>              /*
> @@ -289,11 +381,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  continue;
>          }
>  
> -        for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> +        header = get_vpci_header(tmp->domain, pdev);
> +
> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>          {
> -            const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> -            unsigned long start = PFN_DOWN(bar->addr);
> -            unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> +            const struct vpci_bar *bar = &header->bars[i];
> +            unsigned long start = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) | i;
> +            unsigned long end = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK)
> +                + bar->size - 1;
>  
>              if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
>                   /*
> @@ -357,7 +452,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> -static void bar_write(const struct pci_dev *pdev, unsigned int reg,
> +static void bar_write_hwdom(const struct pci_dev *pdev, unsigned int reg,
>                        uint32_t val, void *data)
>  {
>      struct vpci_bar *bar = data;
> @@ -377,14 +472,17 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>      {
>          /* If the value written is the current one avoid printing a warning. */
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> +        {
> +            struct vpci_header *header = get_hwdom_vpci_header(pdev);
> +
>              gprintk(XENLOG_WARNING,
>                      "%04x:%02x:%02x.%u: ignored BAR %lu write with memory decoding enabled\n",
>                      pdev->seg, pdev->bus, slot, func,
> -                    bar - pdev->vpci->header.bars + hi);
> +                    bar - header->bars + hi);
> +        }
>          return;
>      }
>  
> -
>      /*
>       * Update the cached address, so that when memory decoding is enabled
>       * Xen can map the BAR into the guest p2m.
> @@ -403,10 +501,89 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static uint32_t bar_read_hwdom(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    return vpci_hw_read32(pdev, reg, data);
> +}
> +
> +static void bar_write_guest(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +    struct vpci_bar *vbar = data;
> +    bool hi = false;
> +
> +    if ( vbar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        vbar--;
> +        hi = true;
> +    }
> +    vbar->addr &= ~(0xffffffffull << (hi ? 32 : 0));
> +    vbar->addr |= (uint64_t)val << (hi ? 32 : 0);
> +}
> +
> +static uint32_t bar_read_guest(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    struct vpci_bar *vbar = data;
> +    uint32_t val;
> +    bool hi = false;
> +
> +    if ( vbar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        vbar--;
> +        hi = true;
> +    }
> +
> +    if ( vbar->type == VPCI_BAR_MEM64_LO || vbar->type == VPCI_BAR_MEM64_HI )

I think this would be clearer using a switch statement.

> +    {
> +        if ( hi )
> +            val = vbar->addr >> 32;
> +        else
> +            val = vbar->addr & 0xffffffff;
> +        if ( val == ~0 )

Strictly speaking I think you are not forced to write 1s to the
reserved 4 bits in the low register (and in the 32bit case).

> +        {
> +            /* Guests detects BAR's properties and sizes. */
> +            if ( !hi )
> +            {
> +                val = 0xffffffff & ~(vbar->size - 1);
> +                val |= vbar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> +                                                    : PCI_BASE_ADDRESS_MEM_TYPE_64;
> +                val |= vbar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +            }
> +            else
> +                val = vbar->size >> 32;
> +            vbar->addr &= ~(0xffffffffull << (hi ? 32 : 0));
> +            vbar->addr |= (uint64_t)val << (hi ? 32 : 0);
> +        }
> +    }
> +    else if ( vbar->type == VPCI_BAR_MEM32 )
> +    {
> +        val = vbar->addr;
> +        if ( val == ~0 )
> +        {
> +            if ( !hi )

There's no way hi can be true at this point AFAICT.

> +            {
> +                val = 0xffffffff & ~(vbar->size - 1);
> +                val |= vbar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> +                                                    : PCI_BASE_ADDRESS_MEM_TYPE_64;
> +                val |= vbar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +            }
> +        }
> +    }
> +    else
> +    {
> +        val = vbar->addr;
> +    }
> +    return val;
> +}
> +
>  static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>                        uint32_t val, void *data)
>  {
> -    struct vpci_header *header = &pdev->vpci->header;
> +    struct vpci_header *header = get_hwdom_vpci_header(pdev);
>      struct vpci_bar *rom = data;
>      uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
>      uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> @@ -452,15 +629,56 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }

Don't you need to also protect a domU from writing to the ROM BAR
register?

>  
> +static uint32_t bar_read_dispatch(const struct pci_dev *pdev, unsigned int reg,
> +                                  void *data)
> +{
> +    struct vpci_bar *vbar, *bar = data;
> +
> +    if ( is_hardware_domain(current->domain) )
> +        return bar_read_hwdom(pdev, reg, data);
> +
> +    vbar = get_vpci_bar(current->domain, pdev, bar->index);
> +    if ( !vbar )
> +        return ~0;
> +
> +    return bar_read_guest(pdev, reg, vbar);
> +}
> +
> +static void bar_write_dispatch(const struct pci_dev *pdev, unsigned int reg,
> +                               uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +
> +    if ( is_hardware_domain(current->domain) )
> +        bar_write_hwdom(pdev, reg, val, data);
> +    else
> +    {
> +        struct vpci_bar *vbar = get_vpci_bar(current->domain, pdev, bar->index);
> +
> +        if ( !vbar )
> +            return;
> +        bar_write_guest(pdev, reg, val, vbar);
> +    }
> +}

You should assign different handlers based on whether the domain that
has the device assigned is a domU or the hardware domain, rather than
doing the selection here.

> +
> +/*
> + * FIXME: This is called early while adding vPCI handlers which is done
> + * by and for hwdom.
> + */
>  static int init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
>      uint64_t addr, size;
>      unsigned int i, num_bars, rom_reg;
> -    struct vpci_header *header = &pdev->vpci->header;
> -    struct vpci_bar *bars = header->bars;
> +    struct vpci_header *header;
> +    struct vpci_bar *bars;
>      int rc;
>  
> +    header = get_hwdom_vpci_header(pdev);
> +    if ( !header )
> +        return -ENOMEM;
> +    bars = header->bars;
> +
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
>      case PCI_HEADER_TYPE_NORMAL:
> @@ -496,11 +714,12 @@ static int init_bars(struct pci_dev *pdev)
>          uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
>          uint32_t val;
>  
> +        bars[i].index = i;
>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>          {
>              bars[i].type = VPCI_BAR_MEM64_HI;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            rc = vpci_add_register(pdev->vpci, bar_read_dispatch,
> +                                   bar_write_dispatch, reg, 4, &bars[i]);
>              if ( rc )
>              {
>                  pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -540,8 +759,8 @@ static int init_bars(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> -                               &bars[i]);
> +        rc = vpci_add_register(pdev->vpci, bar_read_dispatch,
> +                               bar_write_dispatch, reg, 4, &bars[i]);
>          if ( rc )
>          {
>              pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -558,6 +777,7 @@ static int init_bars(struct pci_dev *pdev)
>          rom->type = VPCI_BAR_ROM;
>          rom->size = size;
>          rom->addr = addr;
> +        rom->index = num_bars;
>          header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
>                                PCI_ROM_ADDRESS_ENABLE;
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index a5293521a36a..728029da3e9c 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -69,6 +69,7 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>          return -ENOMEM;
>  
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
> +    INIT_LIST_HEAD(&pdev->vpci->headers);
>      spin_lock_init(&pdev->vpci->lock);
>  
>      for ( i = 0; i < NUM_VPCI_INIT; i++ )
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index c3501e9ec010..54423bc6556d 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -55,16 +55,14 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
>   */
>  bool __must_check vpci_process_pending(struct vcpu *v);
>  
> -struct vpci {
> -    /* List of vPCI handlers for a device. */
> -    struct list_head handlers;
> -    spinlock_t lock;
> -
>  #ifdef __XEN__
> -    /* Hide the rest of the vpci struct from the user-space test harness. */
>      struct vpci_header {
> +    struct list_head node;
> +    /* Domain that owns this view of the BARs. */
> +    domid_t domain_id;

Indentation seems screwed here.

>          /* Information about the PCI BARs of this device. */
>          struct vpci_bar {
> +            int index;

unsigned

>              uint64_t addr;
>              uint64_t size;
>              enum {
> @@ -88,8 +86,18 @@ struct vpci {
>           * is mapped into guest p2m) if there's a ROM BAR on the device.
>           */
>          bool rom_enabled      : 1;
> -        /* FIXME: currently there's no support for SR-IOV. */

Unless you are also adding support for SR-IOV, I would keep the
comment.

Thanks, Roger.

