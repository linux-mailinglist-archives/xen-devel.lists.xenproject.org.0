Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB935EEF2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 10:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110339.210589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWaXB-0001e0-3r; Wed, 14 Apr 2021 08:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110339.210589; Wed, 14 Apr 2021 08:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWaXB-0001da-0W; Wed, 14 Apr 2021 08:06:01 +0000
Received: by outflank-mailman (input) for mailman id 110339;
 Wed, 14 Apr 2021 08:05:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5rk=JL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWaX9-0001dV-3p
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 08:05:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36529e68-a244-4389-b87a-6c28204f77a8;
 Wed, 14 Apr 2021 08:05:57 +0000 (UTC)
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
X-Inumbo-ID: 36529e68-a244-4389-b87a-6c28204f77a8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618387557;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GaS/yoBcUppYnWnaJosLv4M67DmKrFpKzkhZKTieNP4=;
  b=MvBAzsi/0QyTeAatMMlr7UTrw0mkpZLUaefpjfSqX/MFqNV77V/Yr83b
   7k81Qxy8uTAUGh7r6dW2Up7hleDUancilF4Q8x++Sy8axyEXrvUVQN9tl
   AP8WPUPu2bi1W2FWO2xle+hA5/2vjwlR55NuIzvEBReAGzj0FhY52mtgF
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qI3sCWQeWxujgC8S1+OZwG8NyMOgZVCYLb0C+LLLKqo7FO0Mac8WbvMP2gJwoN0DpHwRADdpKm
 RwswCuOl3+i6yEgYgpmqTptqXP6hPjihuPpLYcILKkt1Q8pJOQRBldstubfHVHibc/DPdhNM4k
 hC1SX2X01MYRus+AQl2F4XBzjglJF6EG6i3T3lRfLA001jYvTkEP7iVlLVCT9e4lmy5Eb65VnW
 DUfUKy/U5RFS4cz/znG7oUQf2mi3kG/1uDxaE4AbU/3C/5uegmY3+emN8UYJe0UIGt/5Eupos/
 z5U=
X-SBRS: 5.2
X-MesageID: 43026145
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gba91K704OtKBjWrqwPXwAfXdLJzesId70hD6mlaTxtJfsuE0/
 2/hfhz726StB89elEF3f+BPbSNWhrnn/FIyKQYILvKZmfbkUSyKoUK1+rf6hnBPwG7yeJHz6
 dndMFFebnNJHx3l9zz7gX9M/tI+qjkzImSie3Tz2hgQGhRAskKgmtEIz2WC0hnADRBbKBYKL
 On+sFFqzC8EE5nC/iTO39tZZmhm+H2
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="43026145"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY9J5RibPtcF1iAJk82u3bac+PG+BnraYTgCan/2SwIOHF2h4tloEgWPz0IT6HDGEXpC0IYjm0l1G5xHRplrKcjW1bQ346DgqkIe1dTrxygD+3QpDIEUrnnkJQkuTz+JV/JfreSAIcv0JaSSJB9mp58xw7hwJwOdCKsfsV7bTfY8Y1u6vYdvt9RntP/MeylFUszXr2Q/mm21evBVnzk3BpprlPKrm3hD5DpX9VzlLEcqafXNouY/4dadYZ1Wx4bsAto2tuaRwijdTWniNYJVqmT59QovdOK0CXYz2gpQ9H9CGQv1uceDDKl77eoUFHzXssW2EtjlMiOpkeyNKvm7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsHuwwBdQVd57mVYD2uKxQIAG8SOmWmvcteKsfY3zCc=;
 b=ag1WbcXVj8Qh3+qKY4GYuV2KgoqoFhsyvyF6RdR8EwFvqSB3dgMfv3NIzlQjZbomxCxLW6kVf9j9RFtZ0eQTQEI0KMs1/J53hfxVJW8Yugzksb/lLgDRhxMzFEbeCWbI3Iey8jS6pH8GTC1Zuzj/6TwDk3yupjQZka/Yrq3r246PZ9+kLtGSxwLmik8y1rrAaMEJnzsxWp3iFidp6ieLUmCg0p51ZHoWciOfFyTVYWA1BHVecLQmQGdBW2CH3TK3N+XDNNyccD2INF8uZ0KYw/cTlHzWnSaxfqww1/5/t4I8mGg2o94ZRmIo0a75Fsp949gCvOT9HRkMCo4eGfqzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsHuwwBdQVd57mVYD2uKxQIAG8SOmWmvcteKsfY3zCc=;
 b=TbaVjg7/lJBDKvqyrUM+psNDf/xTaTOgFwuGYPCDFPJz8LFwGCVJgo9IUctNfbNiZQvo1RsFhozpYtZThP10UaNwhRQCowu8FrML65/4GZbFF1LC8KnEaLfKf/A1BXIOXfZatFfMaY2WNMz/hE0wOCMIRBrcd4Q6aGRJPGtB1Bw=
Date: Wed, 14 Apr 2021 10:05:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Message-ID: <YHaiW4xX0p6ov2Z9@Air-de-Roger>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
X-ClientProxiedBy: MR1P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53cc4672-b76f-40b3-86fc-08d8ff1c208f
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB596800FDDC84F0677385A0A18F4E9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GCJcqYmNRe+4u56ftag9TACaNHa4MDXsas2tVlEYy9O9pU/wjHzCZE3Q/cOLpz9poTKIEXsfBETMwjrrASs55wlPOSuUKlwMQCvAfkGPGEmzkgnsR0JY+EY9tpxwCaSHMMBYYZuDUgoFvYBqDw5t3C8lcbcYbhxdNjoa1SG+5BABjCUG7LEQunR+HcVu2m+yVYyhzx8CJeY2SZgLAUOLjdm3pFR9SSeodOFyHVkFY+EG/V8lbOdRhzJh6P3ldEY6KxqWiVs6X/yKP9p16b3o0tamN1VsxswAfIrhQr5jzJUjlyDNP36zEiqrC0r1ITW6rKZbbfThNaHwjSMuHFFYuCMd/yjoY+M8Qa77nSe5yxxIoE+Y+lewnGUwZf7pqkV2btWfQDW0o1+mhpazMgyRb1Zoei9vFbpGQ3TCfpWSGVBExL8tM90jtxVnGdIbb8I6g6VTEgWAAHxBJ26FYbJl+gzRvQjVDwk8z1E4mBqXL1n74nJekdeuOEAVKyJH5GmFDZFuudzTTRbT8EsU1wBNUrfdCFBPfvKqbzp7Dio4Z/JOy/rhE98C4vFiYoSst44Kj/dIaUl/9zJsNYJCwkL+rEyC8JKjCNH9T7f0jA+tJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(83380400001)(6666004)(9686003)(33716001)(86362001)(85182001)(16526019)(4326008)(8936002)(186003)(316002)(26005)(2906002)(6916009)(8676002)(66476007)(66556008)(53546011)(6496006)(66946007)(5660300002)(478600001)(38100700002)(956004)(54906003)(6486002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YStWQURHNXF0UUZpczBCMkt4RFVmOWtPdGNENEc3enliMFpPNCt4RXVQZ09p?=
 =?utf-8?B?M0FGL2pvRE9SZ2tTeHZsMzlkRXVOVUMzblhFeWxuMlkweFVUQ1Q2am9YdUto?=
 =?utf-8?B?YVFwMzhFQzNIeWkwUVNCUjdnWTBUdzNHTUZLRkJiTkM0THJTbzNQSnY1aDFo?=
 =?utf-8?B?TjVuT1dMRmlYMm04NkY1Vzg0bFZuU2s1L1lDRnN1N0xnNnRsZ2RxQjF5ekwy?=
 =?utf-8?B?aElpOFp4LzJaTHRDcEd2a2pBMDhKNURYNTdpRG8xdkZJd01Qa04xYkdDVDZj?=
 =?utf-8?B?R3ZYc2V3aVFWbGJ3dndDNmRGUUt5bWdTemMvRFE5bFpOaWdCaGZxUjk3dnZ0?=
 =?utf-8?B?UTlTYkZDbkRIZFcvaXNWZm5DSldBUGIwN1hweHo2OXY1VU9Rclc3bWJHOHBX?=
 =?utf-8?B?ZFBjcExpWjRKVzBrQ21vT0hXUERDc0pWSWdXblhmQ0U0c2tBZ0JFTDMydGZS?=
 =?utf-8?B?ZTBCWnpRU3UxOG9uOWpYYWtsWnNmQm1CSEVHZ3B5RlMwemFUTkxqMkhWclh6?=
 =?utf-8?B?VWVQVFI4S3NQQ3NFNUgrODBNaitQcEQ0Mm5aNWxPNm5BNzZ5WWprWHlZMS9O?=
 =?utf-8?B?MkZyWE9jeTFJbE9HYit4Nnd6d0J2dGRaM3h0aTBvb3JKeENrK0ZiWkRvMThB?=
 =?utf-8?B?bWdZcTVRNVhsRjJIK3Z6WEcxRW1Oc2E0SmIzOVpGYkNPQkgxSWRZWUJFRXY5?=
 =?utf-8?B?TUYvN2hYZVhiZ2toNDMzRUJPSjJpMTljaDc4cDhJTDgzek9XRUNYUU5Mdkcw?=
 =?utf-8?B?eGxHejhiZTZ2RjljUStCNHJ6Q2pnVnFKR1Ryd1RFbG1zNGd4dExOa2JjelB0?=
 =?utf-8?B?T2J1OUprZm9PYjJ5MnZ4d2p3QVkyMEluYUlMQTVJbndsZ0laTHNUVE9IcmFz?=
 =?utf-8?B?MFl2R0JUSUovV2M1a2s2YURId0JNb0RJTVROcEVEMGt1eFJNcVBPS2NCYTRM?=
 =?utf-8?B?NmpqMlEyZCtabDFpLzlFR1U1SmhqdXRQWlhwaDgwQjFjQWJWdjJUcEE2K2pa?=
 =?utf-8?B?SHBYekZNRlhhZmFvTE1LUXJnMFN3Um55S01GSm9Ma2IrbFZUcjVmN2FJMm4r?=
 =?utf-8?B?Z1Y2TmlQdWxmdlN0bmw3blNOVHdVYU1lYzFQQW93WkFHVEorNDlVMHdrQ3NB?=
 =?utf-8?B?K2JFcXBzaTdwazltaERZNitvWWJuM3BQMmRhVVUzTUtyMk41TUh1SkV2WEcy?=
 =?utf-8?B?MVB1dmV0Z21FbjFrOWJUZm1oNWhrdmpPUlZON2ozWWZWaHNqWGt5aEVrSUI5?=
 =?utf-8?B?aHJPeEFrMEo5dzNEKzZjRWRSNHFiWWdIQjZ1NUZ6ZWQ1ZjR6cXJGU0M1dDEy?=
 =?utf-8?B?a29JcmNrcVF5SzRXY3o4aERITVBWalFNc1VaLzF0Z0xGR1Y0b0Eyd2xueGVn?=
 =?utf-8?B?eERSVUZEZG1yQ2h6QkRIQ0JSWXJWOTg5WTR4ajR2WHNaK2cvdmllOFNGbnE5?=
 =?utf-8?B?ZElYR1V3Tmt5alVRakhiZEFtM083YWxIZ1ZWSVVMRERhamFNQWJ2OCt2Rytj?=
 =?utf-8?B?R2xWMHhyano5QWlaaUY3ZThUZE16ZWE3Z0plODhSeXNmbCtkdkxSd0pJd1Jr?=
 =?utf-8?B?QVFxbXhhdXE1bWFyY1ZXVGNzZ0tuZXU1YnNsVngwNTZ3VmpENURyKzYwNTBC?=
 =?utf-8?B?dWFVNGdxc2ovYkxtUEFvdmJGUmdEcjBIN0U2dTZwZzV5TXpVU3FNT3ozWGFu?=
 =?utf-8?B?c0M1M21OazVHMnFwUUVjb1Q4M2M2cDVvQmJvelJ4NUNMcEhoZFNEVHN0eUh0?=
 =?utf-8?Q?NtCHki1wEzagdYfeZ3s+JtTvBJXKpYFC6s2Ywag?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cc4672-b76f-40b3-86fc-08d8ff1c208f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 08:05:54.4300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSKmxl3QO7n6lop9GXim9E6w2heOCFRcGVYodZTUcQ5VwBkF6q8XyvDcZVeuS0ahQS3GNgPfBvsbZ9cwCfVgJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

On Tue, Apr 13, 2021 at 06:12:10PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 12/04/2021 11:49, Roger Pau Monné wrote:
> > On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
> > > diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> > > index 705137f8be..1b473502a1 100644
> > > --- a/xen/drivers/passthrough/pci.c
> > > +++ b/xen/drivers/passthrough/pci.c
> > > @@ -1303,12 +1279,15 @@ static int __init setup_dump_pcidevs(void)
> > >   }
> > >   __initcall(setup_dump_pcidevs);
> > > +
> > > +#ifdef CONFIG_PCI_MSI_INTERCEPT
> > >   int iommu_update_ire_from_msi(
> > >       struct msi_desc *msi_desc, struct msi_msg *msg)
> > >   {
> > >       return iommu_intremap
> > >              ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
> > >   }
> > > +#endif
> > 
> > This is not exactly related to MSI intercepts, the IOMMU interrupt
> > remapping table will also be used for interrupt entries for devices
> > being used by Xen directly, where no intercept is required.
> 
> On Arm, this is not tie to the IOMMU. Instead, this handled is a separate
> MSI controller (such as the ITS).
> 
> > 
> > And then you also want to gate the hook from iommu_ops itself with
> > CONFIG_PCI_MSI_INTERCEPT, if we want to got this route.
> 
> 
> All the callers are in the x86 code. So how about moving the function in an
> x86 specific file?

Yes, that seems fine. Just place it in asm-x86/iommu.h. I wonder why
update_ire_from_msi wasn't moved when the rest of the x86 specific
functions where moved there. Was there an aim to use that in other
arches?

The hook in iommu_ops also need to be moved inside the x86 region.
Please do this iommu change in a separate patch.

> > > diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> > > index 9f5b5d52e1..a6b12717b1 100644
> > > --- a/xen/include/xen/vpci.h
> > > +++ b/xen/include/xen/vpci.h
> > > @@ -91,6 +91,7 @@ struct vpci {
> > >           /* FIXME: currently there's no support for SR-IOV. */
> > >       } header;
> > > +#ifdef CONFIG_PCI_MSI_INTERCEPT
> > >       /* MSI data. */
> > >       struct vpci_msi {
> > >         /* Address. */
> > > @@ -136,6 +137,7 @@ struct vpci {
> > >               struct vpci_arch_msix_entry arch;
> > >           } entries[];
> > >       } *msix;
> > > +#endif /* CONFIG_PCI_MSI_INTERCEPT */
> > 
> > Note that here you just remove two pointers from the struct, not that
> > I'm opposed to it, but it's not that much space that's saved anyway.
> > Ie: it might also be fine to just leave them as NULL unconditionally
> > on Arm.
> 
> Can the two pointers be NULL on x86?

Yes, they can be NULL on x86.

> If not, then I would prefer if they
> disappear on Arm so there is less chance to make any mistake (such as
> unconditionally accessing the pointer in common code).

Any access to them needs to be protected anyway, or else we would be
in trouble. I don't think Xen ever accesses them based on the PCI
capabilities of the device.

Thanks, Roger.

