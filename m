Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1377F54F2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 00:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639312.996506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wu8-00077g-RW; Wed, 22 Nov 2023 23:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639312.996506; Wed, 22 Nov 2023 23:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wu8-00074e-ON; Wed, 22 Nov 2023 23:45:12 +0000
Received: by outflank-mailman (input) for mailman id 639312;
 Wed, 22 Nov 2023 23:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HQf+=HD=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1r5wu7-00074I-4X
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 23:45:11 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe59::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a661262-8991-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 00:45:08 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SJ2PR12MB9189.namprd12.prod.outlook.com (2603:10b6:a03:55b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 23:45:00 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1%5]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 23:45:00 +0000
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
X-Inumbo-ID: 2a661262-8991-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJnYph2PHUxnuS9aZQmPSnhof15H5DoTxqGJi9JwrGSx298l/3ldioFaZFouiyTpN9JO3bGtge0xA0NMkxF2jCNOHiEQELJ2DtvhS+qpUkLimsa98lvTzZblhl7PRddd2xnr6G4c3tPsJx6ntESX/8WqgVpGgf48mGmk5DlWp2vPR1Vq3ODjthCWnB0ytKwQnbJ5Ohf1wpsX13ppkX9OEBPGXC++BkhlZIF2aREFgak4E9wMKsrpMEpI/Lkn/J/Qw5zAOSIaOVLnwAKMnBA9TJZvIpPAGRFT8i0XtmRlZSTpVUC+9pN4XzppvBqJ0e+ztmu6YOY1suRFTz8rUi1JGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHvIOruygj/Ewos3yNdLkF2v8uWcQpnz0MeyV+3Pv3U=;
 b=XE9AKphg2aQQhrO/fMJ3HbYnu6kmfkqohtfmmEtJNNSb4qYpvmwwHLQWGrv6hI6epkm57Fdd0TTCdJf9Lm9P6ka+CC6OM967RiQ5QRQPfMKIxqUehPPl/2PH3n5ICRSeCJvuqWpVzftf0Fvhx77a2RtkEngLKHUpfsdKQXoZ5axWRVUv/FvBrzqwMUaMJ/YrM7Xd7sUYgtnWpI8U94UjVX04uPFOcVw481UemDhXUPTeXgdRzWyve25unfdyqQE8joGXDF32nyO9ap5ZpoTg64Cif5PIUB5/xE4kXOrmJeRwvskaVOtP7k33nFkvNQbzMBJUKu1xHq0Y8ThucwzXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHvIOruygj/Ewos3yNdLkF2v8uWcQpnz0MeyV+3Pv3U=;
 b=VH6c9hS3JMmCeco7PSgahB+rgwk+jcZYWSTNgDlD8wM5cIE3LXtzyE/znZT6WYUQuF+qLgZa1OHMcifeXSYn7qcQgB9wYjkiuwdWubCpQYOuRJR2W69nuIxBBzirt8Agl5St9G0wEXwTFDG64tbt9uvrUSbEgA5+auxU3ovInio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 22 Nov 2023 15:44:53 -0800
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	David Woodhouse <dwmw@amazon.co.uk>, Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
Message-ID: <ZV6SdQZ7ZuN-xZKF@amd.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-7-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2311221436430.2053963@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2311221436430.2053963@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SJ2PR12MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e01c66-f108-49f1-ad0e-08dbebb50ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Y+eqqpO0ewrqaaVzpsjKOfGF6MdGCq4Eymo9k/R2kJjet0dad82L+EWYHYELlcgK5qd91BhtWTL6wmUgAE+VOFPyGxAAr40IBWPMJ8yPXIgKZ1Kxu2W4ql0OvJLlgvJk4WfVurgy0RHwbmEIE4nZled4pxccBINXe7wFCKCUzpe8XvvOpdolYovk2V4HI8UEyQoew+M2ah5JrfhXjDDmSrE0vQh963IPy+Vx9hq6qhWbQ93BpBrv+IL06NubqxmVNB+evbFbcYOjAP/vhZoF1EE66nEhj0TbKYEXhdxtUZ+wkB+5eg4kzqRFGTJ+ZEeExlwDITOlsP6fa8h2rYwE/BbeTN9yZBnyRNwN0Aweel+1SYO2xNDWiS/GQrK9Wbm+Cmoec9oL0MMyHvydmXPC7zfgyu6YBF9cbSYdexhwlgJxNt+Iz+QbdRsPo+2GKaNQtpwS357sbeDkcUtFRKhxAM/umIkPLgkpF+kMTC9cL+KyyIqpZeEvxEBGpq4YDzmr/85YQmby0pYso7OYlbkSV5DwWL2UOwY9x+tb2grklIPeuy31nLTZ0pWRr9GgVUs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(38100700002)(36756003)(86362001)(66946007)(66476007)(8676002)(41300700001)(66556008)(54906003)(4326008)(8936002)(316002)(7416002)(30864003)(5660300002)(2906002)(44832011)(26005)(6916009)(6512007)(2616005)(6486002)(6666004)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnI5V0NFZjUzVXduYWxEbmZwbzA5eGxqdTlkWUsvQmhFaEtuNkwyUTFHZTc3?=
 =?utf-8?B?Qm5Wb2lTbE02QkVvM3NldDlwQ0VNV2lIbCswb0JnK1hVc1oxVCtqeVEvSGJs?=
 =?utf-8?B?eG9SeVdKRkZldkdyVm1zNXNwU2g0Qm5yTndLWE5OV2loVUJTVmRmZmxMZ0pW?=
 =?utf-8?B?WFY3eFloUHNtMFlTNVU1YmlYTUlDL1dmR0VsSEU4VHZ6RUdKdWpLcEEyc1dR?=
 =?utf-8?B?ZEUrVDEvZUZ2bUNTN3hqb3g0aFIyYWpCZjdpM1JZZnE1RDhiVmdJNXhsc0NO?=
 =?utf-8?B?cEVmbEQzWjg5Wkx4bEVoU1ZRb1FrQ2p0OTdQbFlDME40Tll0VnhTL21Uekwz?=
 =?utf-8?B?UzFwbWRrUFpvVk9LYndsV3dHNXErOHI1cXBJcnAzRXZ5M2N0R0xRSVJiUUpW?=
 =?utf-8?B?aW9LcVk5ZjQ2OVdxU2QxYkh4UzJTckdRUnZVcUVhWXJwSUZOVm5TR3FQV1Nw?=
 =?utf-8?B?cUtzQkx5TXpRcWIwZzQrTkFDN0NJZUlXcFlYMGFTejRzZ2piNWlGcG51aW05?=
 =?utf-8?B?RUVZWUZWcFdPdkhvVFNlVXBMdlBVZW1YMS9La29CREpqbEpOL3dnWkpheko3?=
 =?utf-8?B?NmxMZjVzSElWbSt3dDdsT0VZdFc2VkJrT3RtN3o5R1UzYXRJVmpwUXRMRFpL?=
 =?utf-8?B?QWR0VENEbTlEM2RTRXNGampiUzRkbVFTYmxVa2RpdXV3TzM4eWdWRkJqU0lG?=
 =?utf-8?B?UFVmbEltQ1dVU1crSmZBTDBJaThlREVjVnJpS240d29IZGpEOHkyempjSi9X?=
 =?utf-8?B?SStOK2NMYkJMU0xDWjBvMGVCWWhFZHpIaFBVOHdNVGpOMzNrcVN6d3gxOElz?=
 =?utf-8?B?K3lpNDNlc3A2NEVGRmJwa0txZFJjSzhCWG9HWS8rVjBIdEpsbGFlQTBLdDRX?=
 =?utf-8?B?MHNHMGVjL2JUSDFtMTdzL2Y3SmEycmdrMXovYVVtT1hiczQvbTM3dXFoUGpz?=
 =?utf-8?B?TU9iSDdwRnJVTnk2UGNPbVVUb0dLbG1FZ2dlRzRDWklXWmVBMVRzbHlyWFJn?=
 =?utf-8?B?NHZVRnNKSnhGd1MxeGg5aktUZ2pYNE02ai9vQzRvUW91amZLWFpxNFhybnRB?=
 =?utf-8?B?VEZwODFCenNkMk1SQkJFNktwWHdWUlU4bmR0Ui9Fa1NXeG94aC9kNEp1OHd4?=
 =?utf-8?B?K09lWnNaVjkwYngraFV4QWdweXprQTQ0S0R3b2VrK2o1K1hCR1hpVEZ2TVJX?=
 =?utf-8?B?RHEzQUtuUkxnZzlXWlRpMTl1czFEdjZzNWtnbkZOVUdiQldIQlZZMzlNSSt1?=
 =?utf-8?B?U2EzNnpqcWVDYUFNVzlwRFY1U1BvWUQ4VThoNG5DMzJBSG5nR2FRTkZsR1F1?=
 =?utf-8?B?UFRTRUc1Q1JweURuZ3QvRWtUZWdwZzB5Q2NxWE1pU2Jqa1JoakhlNm9RWEYx?=
 =?utf-8?B?VDdIVXBNWWIrNlczQUhhalhxN2JMQzRoQXlLQjc5NmNzNGhOTXRRcEdjOFNT?=
 =?utf-8?B?SG1IMVd6eXk5QllUeGVodVczTUdhbWlaSHdVdy9LWlVYRTBJTVM1OEhvcnh4?=
 =?utf-8?B?Z3VyaWMzSk1Wa2hQMDZOdDF3MWJobGpjTEV3dDNFeHROR0FBMFEzVmV2RWU0?=
 =?utf-8?B?YjBrR0JUMDZ0S0VEdUN1RmVNZVZ3WkxNcWh2NkNFaG0rM29EWlcrbnVOTERD?=
 =?utf-8?B?cWhKdmlzbzJxYlorbUtkUzJ3Nkxod2lOSXkrdExLTS9ydmNHMzJVV0taeFVK?=
 =?utf-8?B?eVVqcmhpZXdmUml2VlFXNzJyYkFFTXBQUDlKdWcvVlNFMHBoQStlYnF1RDNJ?=
 =?utf-8?B?UEhJT2RpVU5uUzllbTQveGNNb2hGVmFpUzFOUE9JdkZteFNzNzBxeFBvU1pi?=
 =?utf-8?B?ekhNdXhWUTJobEV4MjJULzYzTFdGaEQ0b0lHUjdWdk5mWjZkNkpza3dZN1Np?=
 =?utf-8?B?dlNKSUdTNzFMOG9aUmdKdm90VGtlc0N2L1JOWmJ1cXkrMGQxckMrRDhtbnlP?=
 =?utf-8?B?ckw5b0lXVDlUV3Rib0NWWDRWS0NscGNQZUx1a2p1NWUwUFZGR1RZbnkvU3pl?=
 =?utf-8?B?RXJYZ2Mxdkd5RGVIa2EvQXNieDNKUFUyVUlRYzBrLzVNWURTbU9TWGViR3I2?=
 =?utf-8?B?amg1WUlpemxkdlJvbjhkVTZ0ZmNITU9lWUt6MU5VNFd5MnZ3OVVoa3JOekpF?=
 =?utf-8?Q?2YscQfSAD+5u48XHV1l+tfe7a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e01c66-f108-49f1-ad0e-08dbebb50ab4
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:45:00.5980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkyiXj/q8UcG9tcnS/bW8ot9ajAasBZVWXwkMMSCBskCWVOCqv9ZK5pnLFrNZKmk1LtHjzhSCHsUkEovN7Qlnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9189

Hi Volodymyr,
Thank you sharing this patch. I have few comments below
On Wed, Nov 22, 2023 at 02:39:46PM -0800, Stefano Stabellini wrote:
> +Vikram
> 
> On Tue, 21 Nov 2023, Volodymyr Babchuk wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > 
> > The bridge is needed for virtio-pci support, as QEMU can emulate the
> > whole bridge with any virtio-pci devices connected to it.
> > 
> > This patch provides a flexible way to configure PCIe brige resources
> > with xenstore. We made this for several reasons:
> > 
> > - We don't want to clash with vPCI devices, so we need information
> >   from Xen toolstack on which PCI bus to use.
> > - The guest memory layout that describes these resources is not stable
> >   and may vary between guests, so we cannot rely on static resources
> >   to be always the same for both ends.
> > - Also the device-models which run in different domains and serve
> >   virtio-pci devices for the same guest should use different host
> >   bridge resources for Xen to distinguish. The rule for the guest
> >   device-tree generation is one PCI host bridge per backend domain.
> > 
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> There is still a discussion ongoing on xen-devel if / how to register a
> PCI Root Complex or individual BDFs. In the meantime a couple of
> comments.
> 
> Typically emulated devices are configured in QEMU via QEMU command line
> parameters, not xenstore. If you are running QEMU in a domU (instead of
> Dom0) you can always read config parameters from xenstore from a wrapper
> bash script (using xenstore-read) and then pass the right command line
> options to QEMU.
> 
> If you need help in adding new QEMU command line options, Vikram (CCed)
> can help.
> 
> 
I agree with Stefano here. Setting properties would be better and easier.

I have one questions here:
1. If there are multiple QEMU backends, which means xen tools will end up
creating lot of entries in xenstore and we need to remove those xenstore
entries when backend goes away. Is this already handled in Xen tools?

Regards,
Vikram

> > ---
> > 
> > Changes from v1:
> > 
> >  - Renamed virtio_pci_host to pcie_host entries in XenStore, because
> >  there is nothing specific to virtio-pci: any PCI device can be
> >  emulated via this newly created bridge.
> > ---
> >  hw/arm/xen_arm.c            | 186 ++++++++++++++++++++++++++++++++++++
> >  hw/xen/xen-hvm-common.c     |   9 +-
> >  include/hw/xen/xen_native.h |   8 +-
> >  3 files changed, 200 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > index b9c3ae14b6..d506d55d0f 100644
> > --- a/hw/arm/xen_arm.c
> > +++ b/hw/arm/xen_arm.c
> > @@ -22,6 +22,7 @@
> >   */
> >  
> >  #include "qemu/osdep.h"
> > +#include "qemu/cutils.h"
> >  #include "qemu/error-report.h"
> >  #include "qapi/qapi-commands-migration.h"
> >  #include "qapi/visitor.h"
> > @@ -34,6 +35,9 @@
> >  #include "hw/xen/xen-hvm-common.h"
> >  #include "sysemu/tpm.h"
> >  #include "hw/xen/arch_hvm.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/pci-host/gpex.h"
> > +#include "hw/virtio/virtio-pci.h"
> >  
> >  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
> >  OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> > @@ -58,6 +62,11 @@ struct XenArmState {
> >      struct {
> >          uint64_t tpm_base_addr;
> >      } cfg;
> > +
> > +    MemMapEntry pcie_mmio;
> > +    MemMapEntry pcie_ecam;
> > +    MemMapEntry pcie_mmio_high;
> > +    int         pcie_irq;
> >  };
> >  
> >  static MemoryRegion ram_lo, ram_hi;
> > @@ -73,6 +82,7 @@ static MemoryRegion ram_lo, ram_hi;
> >  #define NR_VIRTIO_MMIO_DEVICES   \
> >     (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
> >  
> > +/* TODO It should be xendevicemodel_set_pci_intx_level() for PCI interrupts. */
> >  static void xen_set_irq(void *opaque, int irq, int level)
> >  {
> >      if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
> > @@ -129,6 +139,176 @@ static void xen_init_ram(MachineState *machine)
> >      }
> >  }
> >  
> > +static void xen_create_pcie(XenArmState *xam)
> > +{
> > +    MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
> > +    MemoryRegion *ecam_alias, *ecam_reg;
> > +    DeviceState *dev;
> > +    int i;
> > +
> > +    dev = qdev_new(TYPE_GPEX_HOST);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +
> > +    /* Map ECAM space */
> > +    ecam_alias = g_new0(MemoryRegion, 1);
> > +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> > +    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
> > +                             ecam_reg, 0, xam->pcie_ecam.size);
> > +    memory_region_add_subregion(get_system_memory(), xam->pcie_ecam.base,
> > +                                ecam_alias);
> > +
> > +    /* Map the MMIO space */
> > +    mmio_alias = g_new0(MemoryRegion, 1);
> > +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> > +    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
> > +                             mmio_reg,
> > +                             xam->pcie_mmio.base,
> > +                             xam->pcie_mmio.size);
> > +    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio.base,
> > +                                mmio_alias);
> > +
> > +    /* Map the MMIO_HIGH space */
> > +    mmio_alias_high = g_new0(MemoryRegion, 1);
> > +    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-high",
> > +                             mmio_reg,
> > +                             xam->pcie_mmio_high.base,
> > +                             xam->pcie_mmio_high.size);
> > +    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio_high.base,
> > +                                mmio_alias_high);
> > +
> > +    /* Legacy PCI interrupts (#INTA - #INTD) */
> > +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> > +        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
> > +                                         xam->pcie_irq + i);
> > +
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> > +        gpex_set_irq_num(GPEX_HOST(dev), i, xam->pcie_irq + i);
> > +    }
> > +
> > +    DPRINTF("Created PCIe host bridge\n");
> > +}
> > +
> > +static bool xen_read_pcie_prop(XenArmState *xam, unsigned int xen_domid,
> > +                               const char *prop_name, unsigned long *data)
> > +{
> > +    char path[128], *value = NULL;
> > +    unsigned int len;
> > +    bool ret = true;
> > +
> > +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/%s",
> > +             xen_domid, prop_name);
> > +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> > +
> > +    if (qemu_strtou64(value, NULL, 16, data)) {
> > +        error_report("xenpv: Failed to get 'pcie_host/%s' prop",
> > +                     prop_name);
> > +        ret = false;
> > +    }
> > +
> > +    free(value);
> > +
> > +    return ret;
> > +}
> > +
> > +static int xen_get_pcie_params(XenArmState *xam)
> > +{
> > +    char path[128], *value = NULL, **entries = NULL;
> > +    unsigned int len, tmp;
> > +    int rc = -1;
> > +
> > +    snprintf(path, sizeof(path), "device-model/%d/pcie_host",
> > +             xen_domid);
> > +    entries = xs_directory(xam->state->xenstore, XBT_NULL, path, &len);
> > +    if (entries == NULL) {
> > +        error_report("xenpv: 'pcie_host' dir is not present");
> > +        return -1;
> > +    }
> > +    free(entries);
> > +    if (len != 9) {
> > +        error_report("xenpv: Unexpected number of entries in 'pcie_host' dir");
> > +        goto out;
> > +    }
> > +
> > +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/id",
> > +             xen_domid);
> > +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> > +    if (qemu_strtoui(value, NULL, 10, &tmp)) {
> > +        error_report("xenpv: Failed to get 'pcie_host/id' prop");
> > +        goto out;
> > +    }
> > +    free(value);
> > +    value = NULL;
> > +    if (tmp > 0xffff) {
> > +        error_report("xenpv: Wrong 'pcie_host/id' value %u", tmp);
> > +        goto out;
> > +    }
> > +    xen_pci_segment = tmp;
> > +
> > +    if (!xen_read_pcie_prop(xam, xen_domid, "ecam_base",
> > +                            &xam->pcie_ecam.base)) {
> > +        goto out;
> > +    }
> > +
> > +    if (!xen_read_pcie_prop(xam, xen_domid, "ecam_size",
> > +                            &xam->pcie_ecam.size)) {
> > +        goto out;
> > +    }
> > +
> > +    if (!xen_read_pcie_prop(xam, xen_domid, "mem_base",
> > +                            &xam->pcie_mmio.base)) {
> > +        goto out;
> > +    }
> > +
> > +    if (!xen_read_pcie_prop(xam, xen_domid, "mem_size",
> > +                            &xam->pcie_mmio.base)) {
> > +        goto out;
> > +    }
> > +
> > +    if (!xen_read_pcie_prop(xam, xen_domid, "prefetch_mem_base",
> > +                            &xam->pcie_mmio_high.base)) {
> > +        goto out;
> > +    }
> > +
> > +    if (!xen_read_pcie_prop(xam, xen_domid, "prefetch_mem_size",
> > +                            &xam->pcie_mmio_high.size)) {
> > +        goto out;
> > +    }
> > +
> > +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/irq_first",
> > +             xen_domid);
> > +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> > +    if (qemu_strtoi(value, NULL, 10, &xam->pcie_irq)) {
> > +        error_report("xenpv: Failed to get 'pcie_host/irq_first' prop");
> > +        goto out;
> > +    }
> > +    free(value);
> > +    value = NULL;
> > +    DPRINTF("PCIe host bridge: irq_first %u\n", xam->pcie_irq);
> > +
> > +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/num_irqs",
> > +             xen_domid);
> > +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> > +    if (qemu_strtoui(value, NULL, 10, &tmp)) {
> > +        error_report("xenpv: Failed to get 'pcie_host/num_irqs' prop");
> > +        goto out;
> > +    }
> > +    free(value);
> > +    value = NULL;
> > +    if (tmp != GPEX_NUM_IRQS) {
> > +        error_report("xenpv: Wrong 'pcie_host/num_irqs' value %u", tmp);
> > +        goto out;
> > +    }
> > +    DPRINTF("PCIe host bridge: num_irqs %u\n", tmp);
> > +
> > +    rc = 0;
> > +out:
> > +    if (value) {
> > +        free(value);
> > +    }
> > +
> > +    return rc;
> > +}
> > +
> >  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> >  {
> >      hw_error("Invalid ioreq type 0x%x\n", req->type);
> > @@ -189,6 +369,12 @@ static void xen_arm_init(MachineState *machine)
> >      xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> >  
> >      xen_create_virtio_mmio_devices(xam);
> > +    if (!xen_get_pcie_params(xam)) {
> > +        xen_create_pcie(xam);
> > +    } else {
> > +        DPRINTF("PCIe host bridge is not available,"
> > +                "only virtio-mmio can be used\n");
> > +    }
> >  
> >  #ifdef CONFIG_TPM
> >      if (xam->cfg.tpm_base_addr) {
> > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > index 565dc39c8f..0f78f15057 100644
> > --- a/hw/xen/xen-hvm-common.c
> > +++ b/hw/xen/xen-hvm-common.c
> > @@ -47,6 +47,8 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
> >      g_free(pfn_list);
> >  }
> >  
> > +uint16_t xen_pci_segment;
> > +
> >  static void xen_set_memory(struct MemoryListener *listener,
> >                             MemoryRegionSection *section,
> >                             bool add)
> > @@ -382,7 +384,12 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
> >      }
> >  
> >      QLIST_FOREACH(xendev, &state->dev_list, entry) {
> > -        if (xendev->sbdf != sbdf) {
> > +        /*
> > +         * As we append xen_pci_segment just before forming dm_op in
> > +         * xen_map_pcidev() we need to check with appended xen_pci_segment
> > +         * here as well.
> > +         */
> > +        if ((xendev->sbdf | (xen_pci_segment << 16)) != sbdf) {
> >              continue;
> >          }
> >  
> > diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
> > index 6f09c48823..2b1debaff4 100644
> > --- a/include/hw/xen/xen_native.h
> > +++ b/include/hw/xen/xen_native.h
> > @@ -431,6 +431,8 @@ static inline void xen_unmap_io_section(domid_t dom,
> >                                                      0, start_addr, end_addr);
> >  }
> >  
> > +extern uint16_t xen_pci_segment;
> > +
> >  static inline void xen_map_pcidev(domid_t dom,
> >                                    ioservid_t ioservid,
> >                                    PCIDevice *pci_dev)
> > @@ -441,7 +443,8 @@ static inline void xen_map_pcidev(domid_t dom,
> >  
> >      trace_xen_map_pcidev(ioservid, pci_dev_bus_num(pci_dev),
> >                           PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
> > -    xendevicemodel_map_pcidev_to_ioreq_server(xen_dmod, dom, ioservid, 0,
> > +    xendevicemodel_map_pcidev_to_ioreq_server(xen_dmod, dom, ioservid,
> > +                                              xen_pci_segment,
> >                                                pci_dev_bus_num(pci_dev),
> >                                                PCI_SLOT(pci_dev->devfn),
> >                                                PCI_FUNC(pci_dev->devfn));
> > @@ -457,7 +460,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
> >  
> >      trace_xen_unmap_pcidev(ioservid, pci_dev_bus_num(pci_dev),
> >                             PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
> > -    xendevicemodel_unmap_pcidev_from_ioreq_server(xen_dmod, dom, ioservid, 0,
> > +    xendevicemodel_unmap_pcidev_from_ioreq_server(xen_dmod, dom, ioservid,
> > +                                                  xen_pci_segment,
> >                                                    pci_dev_bus_num(pci_dev),
> >                                                    PCI_SLOT(pci_dev->devfn),
> >                                                    PCI_FUNC(pci_dev->devfn));
> > -- 
> > 2.42.0
> > 

