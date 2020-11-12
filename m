Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96F02B07C6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 15:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25913.53985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdDsH-0007Kt-LB; Thu, 12 Nov 2020 14:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25913.53985; Thu, 12 Nov 2020 14:46:57 +0000
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
	id 1kdDsH-0007KU-H8; Thu, 12 Nov 2020 14:46:57 +0000
Received: by outflank-mailman (input) for mailman id 25913;
 Thu, 12 Nov 2020 14:46:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kdDsG-0007KP-EJ
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 14:46:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c33deb03-62f7-45d4-8e73-cd17cbff5927;
 Thu, 12 Nov 2020 14:46:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kdDsG-0007KP-EJ
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 14:46:56 +0000
X-Inumbo-ID: c33deb03-62f7-45d4-8e73-cd17cbff5927
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c33deb03-62f7-45d4-8e73-cd17cbff5927;
	Thu, 12 Nov 2020 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605192414;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qUhTeOW820x94pax7PSaVLpcLZVEq0uQeaFbYQ5saEU=;
  b=LepBLwTo4a/LyllmK3X2OoNoCCTiRLzugrFTJ/rjbKWyg+ii9TebWVte
   OcPFIAc/dkZApOMsB2bwSeoaxsbHvqoqKCgfZQOWF67wEKLUsa93EnXAa
   Dop8blUn8N9W4BViQKE6mfrh3u5uI24DMvrJcAo7etQrz9D7cSOzKFyOG
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s5jYqgir+5Jc9u+Ngzt2+mSePeNIo5/5fNjUPdK0NeN+WER9xtPeWyWpkrMo/fBtzhQtNuY106
 zoftY40MI5nnotSGeS/NEYznwUbyw36J4okrI99mz7P3HHtL+rRUBDpffNNWxaXJeakNs6FlL+
 n9UizFQCYzbI4dFh5b1ne2CBzaGcwuk23oG1xFNRYEnx8I9XZy+uMVpPc1KD7FmB9OkAlVW5YU
 4XLZ/wIXq/VZ6mpXFIrMjN/jSbztXWcyQttybWt7/Rl7JIWNyBoO72SrODTzT3P629IfUvobsp
 +Ss=
X-SBRS: None
X-MesageID: 31268795
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,472,1596513600"; 
   d="scan'208";a="31268795"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+NBEsZ/t2yyaXUQwItIvh1st19d+hDYb/TbPGC/iQHX7Lr7rKdYDPgQEKMx0X2GAY3/P0DYszY9EEjdVtxz3mwVpB1hukqKaPsZ3rkd9DlrLlj1AgndGXkSRDVrUird0dkQKDYUCwwvEn59g8uEPRvDbWtLk2uu7wiQZjxZ4cGOWy5l84hTRxT4j2Aqa2CcXkXj6luZthrIGMZC0j5wfD7T7stJ8eBSdwDILaDqwLZ+wGFLsTea4wdTLSXQSjqzRi4BlBOCMWd2b+pY1U2rOXleu5EmXTBAvyK6NJ1NDmbQ9zM1wJ7lyD69PNgYsiyk5gLpKYW71/H6oYhRc1pvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNqSDsDxZXRO2EpaifFeChNnd7skvjiStIlunFt7o5E=;
 b=h1xYNaolTC0Q39WLb7jXI35S7Ix6qkBBNgARkkkoKpnaCWsn0pfqMU3FlFHBq2SzcTwTsxDrdk5ab21DGtj0XS9U9dEkLJO0q9vOInePW1EObOO286XC7vF8lKjYPzFWFDADoFS8iViTKQGIgPyQujJ9DQG6qkZJCscBfhY+UoKiaSA7B9o2AXs/Ok5pz4AU88WjZ9gqsJDtQ6f/FcXIM4d3hTMQkA1Z5ESvtkLKJrsNvX4Rc6yJmkDf6U2ZYZzA3a1OQ+05+rV5JHnB9qCjqp0zUQv/8tGeomER8wfjRM6xjDw3TcT3XeG1pgnVZyqQso22B+zJadXGowSpmrzVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNqSDsDxZXRO2EpaifFeChNnd7skvjiStIlunFt7o5E=;
 b=qKBPZUIJJi5qOTywGXiALdIM+uxVzbfC+HxDBESyQadHGYy0VCtJZUueAqhzvp/g7Zm7Xdwxn2eLz7Yy474znbjODWS51tzJ0xJndfQD4EL6gHfwJOOrkhOVUWjHBh7puW8E+ZdvoInp+36z6q85etjt/qa/pqtIq46LLVkI6G0=
Date: Thu, 12 Nov 2020 15:46:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>, "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
	"julien.grall@arm.com" <julien.grall@arm.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
Message-ID: <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
X-ClientProxiedBy: LO2P265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::14) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da7d8451-ebc5-4437-43ce-08d88719c8c0
X-MS-TrafficTypeDiagnostic: SN6PR03MB3776:
X-Microsoft-Antispam-PRVS: <SN6PR03MB37762588E5D3052140A4137D8FE70@SN6PR03MB3776.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:137;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8c2NlhpJbd0OO6PiQWcXAvcGtHZIzc01QoCwI/FW1kc5h6FDQiW7VhCxzZSnoxSVS2R/OYYZY8EOhfq+dEGWwKQDmqemR7EnE2kTQWox22JEFUeJXwuMw42TTOZTua4prqpdK6tvRSd3AnnozfpYymBgmcb358FSNdVfYb/sSnZjAZrMtBXl/o46w/UC09/iLk6A2tVoqPyPCmEfs2y9gB1v9lJ3icQgQ5eINILQbRzbuYE7lNr6T1ieBJl5zZ/B9QyrpHcvEKFF1Hld4IJQB3GlCGOOsufzEqXG3BP88FGHx8YMUf5Y0Bs0Lo840Og91wx+7TgsBtZ9lQCcZ/AGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(396003)(376002)(136003)(346002)(5660300002)(478600001)(8936002)(85182001)(54906003)(2906002)(66476007)(66946007)(66556008)(956004)(8676002)(316002)(86362001)(6916009)(186003)(6486002)(9686003)(83380400001)(4326008)(1076003)(6666004)(33716001)(16526019)(30864003)(26005)(6496006)(7416002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kB12FbTVj17O6ywDp3opHkNqrmM2IUI2kaaerk5jxCkd6kx9uknn2OVlvMOWVO/oBcyQO3ewFSWGIz5y/v+hA78DDVwFASwC4ZdPP/tesI5j8CS1BXXM8hF/Ee+8B0UbWUHK7axJ+sAzL2FKi44EwOa2CBgK3eJ/06R6j/ihzV+IrBFIVfkvrMY9Qr+7s9I16Ordt4wCKhKwswiRv6GuxJaXU7Sp149IlhpOSoC85Px6yTsDHcWOC4XCYUPimrRqpX/2ZK+a2oQJXNNPAxgqynkHZTolPTa9ATM63goCmGLdfs3fzjluXjHx9dYNt46DwO2zoSAymYB7jgFfFrDAQyFrT2Q32cd2pFrVVMhLBrYs3rGwZPln4fAyCki8z+tZ2FMuie7USNt2MIkTJ4XXEqhTSLzyB4PqBoLBvb7etH3fAYem1Ghg1WKirtLW4Iklyj1PITRY06bvTVG2mOnXGU4rsewuXQuGQdsYPsuZ7nNorvu8yRVnICHRX22WTB0uPAsim7v0F+HlY8IlTBAuMAyRV+ZH/Fknl9VZI8P7eiMZuMQa095ZgQhWzhjL3Bxfk6Spv45bkuAp9RCFL1HH3uG4yLDQ39p343LmYfh3WEx+hpKh9sJnUmLo4UTPVSYC/hN1cnwk0ozGSeZtwVzgnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: da7d8451-ebc5-4437-43ce-08d88719c8c0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 14:46:48.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3BAoRL3n1M7aP1Wr6WAxwf1Wb+1q/AXqj3myZ5NpLn5HAGmtgPO8D+Pf+2jg3XrAAZoODdliFrN/QuGUANI2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3776
X-OriginatorOrg: citrix.com

On Thu, Nov 12, 2020 at 01:16:10PM +0000, Oleksandr Andrushchenko wrote:
> 
> On 11/12/20 11:40 AM, Roger Pau Monné wrote:
> > On Mon, Nov 09, 2020 at 02:50:27PM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index f74f728884c0..7dc7c70e24f2 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -31,14 +31,87 @@
> >>   struct map_data {
> >>       struct domain *d;
> >>       bool map;
> >> +    struct pci_dev *pdev;
> > If the field is required please place it after the domain one.
> I will, but may I ask why?

So that if we add further boolean fields we can do at the end of the
struct for layout reasons. If we do:

struct map_data {
    struct domain *d;
    bool map;
    struct pci_dev *pdev;
    bool foo;
}

We will end up with a bunch of padding that could be avoided by doing:

struct map_data {
    struct domain *d;
    struct pci_dev *pdev;
    bool map;
    bool foo;
}

> >> +    s = PFN_DOWN(s);
> >> +    e = PFN_DOWN(e);
> > Changing the rangeset to store memory addresses instead of frames
> > could for example be split into a separate patch.
> Ok
> >
> > I think you are doing the calculation of the end pfn wrong here, you
> > should use PFN_UP instead in case the address is not aligned.
> 
> PFN_DOWN for the start seems to be ok if the address is not aligned
> 
> which is the case if I pass bar_index in the lower bits: PCI memory has
> 
> PAGE_SIZE granularity, so besides the fact that I use bar_index the address

No, BARs don't need to be aligned to page boundaries, you can even
have different BARs inside the same physical page.

The spec recommends that the minimum size of a BAR should be 4KB, but
that's not a strict requirement in which case a BAR can be as small as
16bytes, and then you can have multiple ones inside the same page.

> must be page aligned.
> 
> The end address is expressed in (size - 1) form, again page aligned,
> 
> so to get the last page to be mapped PFN_DOWN also seems to be appropriate.
> 
> Do I miss something here?

I'm not aware of any  of those addresses or sizes being guaranteed to
be page aligned, so I think you need to account for that.

Some of the code here uses PFN_DOWN to calculate the end address
because the rangesets are used in an inclusive fashion, so the end
frame also gets mapped.

> >
> >> +    mfn = _mfn(PFN_DOWN(header->bars[bar_idx].addr));
> >>       for ( ; ; )
> >>       {
> >>           unsigned long size = e - s + 1;
> >> @@ -52,11 +125,15 @@ static int map_range(unsigned long s, unsigned long e, void *data,
> >>            * - {un}map_mmio_regions doesn't support preemption.
> >>            */
> >>   
> >> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> >> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> >> +        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, mfn)
> >> +                      : unmap_mmio_regions(map->d, _gfn(s), size, mfn);
> >>           if ( rc == 0 )
> >>           {
> >> -            *c += size;
> >> +            /*
> >> +             * Range set is not expressed in frame numbers and the size
> >> +             * is the number of frames, so update accordingly.
> >> +             */
> >> +            *c += size << PAGE_SHIFT;
> >>               break;
> >>           }
> >>           if ( rc < 0 )
> >> @@ -67,8 +144,9 @@ static int map_range(unsigned long s, unsigned long e, void *data,
> >>               break;
> >>           }
> >>           ASSERT(rc < size);
> >> -        *c += rc;
> >> +        *c += rc << PAGE_SHIFT;
> >>           s += rc;
> >> +        mfn += rc;
> >>           if ( general_preempt_check() )
> >>                   return -ERESTART;
> >>       }
> >> @@ -84,7 +162,7 @@ static int map_range(unsigned long s, unsigned long e, void *data,
> >>   static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
> >>                               bool rom_only)
> >>   {
> >> -    struct vpci_header *header = &pdev->vpci->header;
> >> +    struct vpci_header *header = get_hwdom_vpci_header(pdev);
> >>       bool map = cmd & PCI_COMMAND_MEMORY;
> >>       unsigned int i;
> >>   
> >> @@ -136,6 +214,7 @@ bool vpci_process_pending(struct vcpu *v)
> >>           struct map_data data = {
> >>               .d = v->domain,
> >>               .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> >> +            .pdev = v->vpci.pdev,
> >>           };
> >>           int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
> >>   
> >> @@ -168,7 +247,8 @@ bool vpci_process_pending(struct vcpu *v)
> >>   static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> >>                               struct rangeset *mem, uint16_t cmd)
> >>   {
> >> -    struct map_data data = { .d = d, .map = true };
> >> +    struct map_data data = { .d = d, .map = true,
> >> +        .pdev = (struct pci_dev *)pdev };
> > Dropping the const here is not fine. IT either needs to be dropped
> > from apply_map and further up, or this needs to also be made const.
> Ok, I'll try to keep it const
> >
> >>       int rc;
> >>   
> >>       while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> >> @@ -205,7 +285,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
> >>   
> >>   static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>   {
> >> -    struct vpci_header *header = &pdev->vpci->header;
> >> +    struct vpci_header *header;
> >>       struct rangeset *mem = rangeset_new(NULL, NULL, 0);
> >>       struct pci_dev *tmp, *dev = NULL;
> >>   #ifdef CONFIG_X86
> >> @@ -217,6 +297,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>       if ( !mem )
> >>           return -ENOMEM;
> >>   
> >> +    if ( is_hardware_domain(current->domain) )
> >> +        header = get_hwdom_vpci_header(pdev);
> >> +    else
> >> +        header = get_vpci_header(current->domain, pdev);
> >> +
> >>       /*
> >>        * Create a rangeset that represents the current device BARs memory region
> >>        * and compare it against all the currently active BAR memory regions. If
> >> @@ -225,12 +310,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>        * First fill the rangeset with all the BARs of this device or with the ROM
> >>        * BAR only, depending on whether the guest is toggling the memory decode
> >>        * bit of the command register, or the enable bit of the ROM BAR register.
> >> +     *
> >> +     * Use the PCI reserved bits of the BAR to pass BAR's index.
> >>        */
> >>       for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> >>       {
> >>           const struct vpci_bar *bar = &header->bars[i];
> >> -        unsigned long start = PFN_DOWN(bar->addr);
> >> -        unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> >> +        unsigned long start = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) | i;
> >> +        unsigned long end = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) +
> >> +            bar->size - 1;
> > Will this work fine on Arm 32bits with LPAE? It's my understanding
> > that in that case unsigned long is 32bits, but the physical address
> > space is 44bits, in which case this won't work.
> Hm, good question
> >
> > I think you need to keep the usage of frame numbers here.
> If I re-work the gfn <-> mfn mapping then yes, I can use frame numbers here and elsewhere
> >
> >>   
> >>           if ( !MAPPABLE_BAR(bar) ||
> >>                (rom_only ? bar->type != VPCI_BAR_ROM
> >> @@ -251,9 +339,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>       /* Remove any MSIX regions if present. */
> >>       for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
> >>       {
> >> -        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> >> -        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> >> -                                     vmsix_table_size(pdev->vpci, i) - 1);
> >> +        unsigned long start = (vmsix_table_addr(pdev->vpci, i) &
> >> +                               PCI_BASE_ADDRESS_MEM_MASK) | i;
> >> +        unsigned long end = (vmsix_table_addr(pdev->vpci, i) &
> >> +                             PCI_BASE_ADDRESS_MEM_MASK ) +
> >> +                             vmsix_table_size(pdev->vpci, i) - 1;
> >>   
> >>           rc = rangeset_remove_range(mem, start, end);
> >>           if ( rc )
> >> @@ -273,6 +363,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>        */
> >>       for_each_pdev ( pdev->domain, tmp )
> >>       {
> >> +        struct vpci_header *header;
> >> +
> >>           if ( tmp == pdev )
> >>           {
> >>               /*
> >> @@ -289,11 +381,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>                   continue;
> >>           }
> >>   
> >> -        for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> >> +        header = get_vpci_header(tmp->domain, pdev);
> >> +
> >> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> >>           {
> >> -            const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> >> -            unsigned long start = PFN_DOWN(bar->addr);
> >> -            unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> >> +            const struct vpci_bar *bar = &header->bars[i];
> >> +            unsigned long start = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) | i;
> >> +            unsigned long end = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK)
> >> +                + bar->size - 1;
> >>   
> >>               if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
> >>                    /*
> >> @@ -357,7 +452,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >>           pci_conf_write16(pdev->sbdf, reg, cmd);
> >>   }
> >>   
> >> -static void bar_write(const struct pci_dev *pdev, unsigned int reg,
> >> +static void bar_write_hwdom(const struct pci_dev *pdev, unsigned int reg,
> >>                         uint32_t val, void *data)
> >>   {
> >>       struct vpci_bar *bar = data;
> >> @@ -377,14 +472,17 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
> >>       {
> >>           /* If the value written is the current one avoid printing a warning. */
> >>           if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> >> +        {
> >> +            struct vpci_header *header = get_hwdom_vpci_header(pdev);
> >> +
> >>               gprintk(XENLOG_WARNING,
> >>                       "%04x:%02x:%02x.%u: ignored BAR %lu write with memory decoding enabled\n",
> >>                       pdev->seg, pdev->bus, slot, func,
> >> -                    bar - pdev->vpci->header.bars + hi);
> >> +                    bar - header->bars + hi);
> >> +        }
> >>           return;
> >>       }
> >>   
> >> -
> >>       /*
> >>        * Update the cached address, so that when memory decoding is enabled
> >>        * Xen can map the BAR into the guest p2m.
> >> @@ -403,10 +501,89 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
> >>       pci_conf_write32(pdev->sbdf, reg, val);
> >>   }
> >>   
> >> +static uint32_t bar_read_hwdom(const struct pci_dev *pdev, unsigned int reg,
> >> +                               void *data)
> >> +{
> >> +    return vpci_hw_read32(pdev, reg, data);
> >> +}
> >> +
> >> +static void bar_write_guest(const struct pci_dev *pdev, unsigned int reg,
> >> +                            uint32_t val, void *data)
> >> +{
> >> +    struct vpci_bar *vbar = data;
> >> +    bool hi = false;
> >> +
> >> +    if ( vbar->type == VPCI_BAR_MEM64_HI )
> >> +    {
> >> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> >> +        vbar--;
> >> +        hi = true;
> >> +    }
> >> +    vbar->addr &= ~(0xffffffffull << (hi ? 32 : 0));
> >> +    vbar->addr |= (uint64_t)val << (hi ? 32 : 0);
> >> +}
> >> +
> >> +static uint32_t bar_read_guest(const struct pci_dev *pdev, unsigned int reg,
> >> +                               void *data)
> >> +{
> >> +    struct vpci_bar *vbar = data;
> >> +    uint32_t val;
> >> +    bool hi = false;
> >> +
> >> +    if ( vbar->type == VPCI_BAR_MEM64_HI )
> >> +    {
> >> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> >> +        vbar--;
> >> +        hi = true;
> >> +    }
> >> +
> >> +    if ( vbar->type == VPCI_BAR_MEM64_LO || vbar->type == VPCI_BAR_MEM64_HI )
> > I think this would be clearer using a switch statement.
> I'll think about
> >
> >> +    {
> >> +        if ( hi )
> >> +            val = vbar->addr >> 32;
> >> +        else
> >> +            val = vbar->addr & 0xffffffff;
> >> +        if ( val == ~0 )
> > Strictly speaking I think you are not forced to write 1s to the
> > reserved 4 bits in the low register (and in the 32bit case).
> 
> Ah, so Linux kernel, for instance, could have written 0xffffff0 while
> 
> I expect 0xffffffff?

I think real hardware would return the size when written 1s to all
bits except the reserved ones.

> 
> >
> >> +        {
> >> +            /* Guests detects BAR's properties and sizes. */
> >> +            if ( !hi )
> >> +            {
> >> +                val = 0xffffffff & ~(vbar->size - 1);
> >> +                val |= vbar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> >> +                                                    : PCI_BASE_ADDRESS_MEM_TYPE_64;
> >> +                val |= vbar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> >> +            }
> >> +            else
> >> +                val = vbar->size >> 32;
> >> +            vbar->addr &= ~(0xffffffffull << (hi ? 32 : 0));
> >> +            vbar->addr |= (uint64_t)val << (hi ? 32 : 0);
> >> +        }
> >> +    }
> >> +    else if ( vbar->type == VPCI_BAR_MEM32 )
> >> +    {
> >> +        val = vbar->addr;
> >> +        if ( val == ~0 )
> >> +        {
> >> +            if ( !hi )
> > There's no way hi can be true at this point AFAICT.
> Sure, thank you
> >
> >> +            {
> >> +                val = 0xffffffff & ~(vbar->size - 1);
> >> +                val |= vbar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> >> +                                                    : PCI_BASE_ADDRESS_MEM_TYPE_64;
> >> +                val |= vbar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> >> +            }
> >> +        }
> >> +    }
> >> +    else
> >> +    {
> >> +        val = vbar->addr;
> >> +    }
> >> +    return val;
> >> +}
> >> +
> >>   static void rom_write(const struct pci_dev *pdev, unsigned int reg,
> >>                         uint32_t val, void *data)
> >>   {
> >> -    struct vpci_header *header = &pdev->vpci->header;
> >> +    struct vpci_header *header = get_hwdom_vpci_header(pdev);
> >>       struct vpci_bar *rom = data;
> >>       uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
> >>       uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> >> @@ -452,15 +629,56 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
> >>           rom->addr = val & PCI_ROM_ADDRESS_MASK;
> >>   }
> > Don't you need to also protect a domU from writing to the ROM BAR
> > register?
> 
> ROM was not a target of this RFC as I have no HW to test that, but final code must
> 
> also handle ROM as well, you are right
> 
> >
> >>   
> >> +static uint32_t bar_read_dispatch(const struct pci_dev *pdev, unsigned int reg,
> >> +                                  void *data)
> >> +{
> >> +    struct vpci_bar *vbar, *bar = data;
> >> +
> >> +    if ( is_hardware_domain(current->domain) )
> >> +        return bar_read_hwdom(pdev, reg, data);
> >> +
> >> +    vbar = get_vpci_bar(current->domain, pdev, bar->index);
> >> +    if ( !vbar )
> >> +        return ~0;
> >> +
> >> +    return bar_read_guest(pdev, reg, vbar);
> >> +}
> >> +
> >> +static void bar_write_dispatch(const struct pci_dev *pdev, unsigned int reg,
> >> +                               uint32_t val, void *data)
> >> +{
> >> +    struct vpci_bar *bar = data;
> >> +
> >> +    if ( is_hardware_domain(current->domain) )
> >> +        bar_write_hwdom(pdev, reg, val, data);
> >> +    else
> >> +    {
> >> +        struct vpci_bar *vbar = get_vpci_bar(current->domain, pdev, bar->index);
> >> +
> >> +        if ( !vbar )
> >> +            return;
> >> +        bar_write_guest(pdev, reg, val, vbar);
> >> +    }
> >> +}
> > You should assign different handlers based on whether the domain that
> > has the device assigned is a domU or the hardware domain, rather than
> > doing the selection here.
> 
> Hm, handlers are assigned once in init_bars and this function is only called
> 
> for hwdom, so there is no way I can do that for the guests. Hence, the dispatcher

I think we might want to reset the vPCI handlers when a devices gets
assigned and deassigned. In order to do passthrough to domUs safely
we will have to add more handlers than what's required for dom0, and
having is_hardware_domain sprinkled in all of them is not a suitable
solution.

Roger.

