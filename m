Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B641DCB6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 16:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200025.354399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVxOz-00041v-S6; Thu, 30 Sep 2021 14:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200025.354399; Thu, 30 Sep 2021 14:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVxOz-0003zc-OV; Thu, 30 Sep 2021 14:51:13 +0000
Received: by outflank-mailman (input) for mailman id 200025;
 Thu, 30 Sep 2021 14:51:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVxOx-0003zW-Sn
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 14:51:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d95309f8-21fd-11ec-bd52-12813bfff9fa;
 Thu, 30 Sep 2021 14:51:10 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-XvnH9s1tOgqgOhuJ6aE7tw-1;
 Thu, 30 Sep 2021 16:51:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 14:51:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 14:51:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0065.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 14:51:06 +0000
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
X-Inumbo-ID: d95309f8-21fd-11ec-bd52-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633013469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srFDW2pOcHBYQzELexsxJ7TSCRkMdj8CE4QVd8VrhBs=;
	b=GrY/mM5brBfOBY5uXFTA7GNN/DE+9IDgmCNjhCs9nbtYD+Ho0Vc0TJaRF1lG/SINI1rU4P
	dE44pJKVEfr4yj2/vdm97nrjTkUX+0rjua5Jg0Q+FAK/gl2TR1RoVzO+PACFGtIsCMViD0
	hIjZaYQtq0X/sNN/edmuHddrYyW7dzY=
X-MC-Unique: XvnH9s1tOgqgOhuJ6aE7tw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8HDDEWcyccI2B87WJUEQQNDnd3Zdp7deo1iSvhMdT09s8kAmUVSIvWKuUxdfkfvKyXrT3yqMjSVLepx9kt3EcNALL0W9u8pndzoaLcRWtnHsVa/k5qz0J+y6Qr+oK2DkwS8AyFZr876xlJyzsD2BGY4JX/CtaeOrms1lDO9G7JscYkRX4/Zs4dD+qwNvq7SExPPL0hYF28v20IH7fcMjbi/qKmKmzk7ezTpjLXyi8o5yHIl731it3bq8GyWPCjNVS/hcJ0vWSbM1qLX/Rm0Rr1yjZM0ci5qIw8MbffoM+Huy3FBdOffQbNGV70Pn9MhIV8M+XWdLwBjwqTfV1HeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=srFDW2pOcHBYQzELexsxJ7TSCRkMdj8CE4QVd8VrhBs=;
 b=G/ySFCSu2DtePpKITow1zmyCXpkaf8fKy7HN6sSXBKx22pIBytXP9PKoaGkIqX6dlRvmXkjodPymHnkjGztSJ3DTofgEwLzF/ZVfXQsHUzWUgDGVKzvxEFKm76ScWOIlgJKI9xQcFz0Xsq1NrWAkCTeOXsTxezR46jaMQ1Ju5MSF9JPxpx5n1LG5rS00PV1HePV8P6LSvaBA4dWzl1OyA+u+RxBcxp4/MAnRPtvwlKtULenynl2uQZiKLIFqdq6Jt8SK3Lb5zSp4a/K/Ao3RoGpPsSZ+RFdmhONYRwjoE90pU8EYvgDzXcrxWAJsIIBOfcrtKpytWLY35tPcbhaY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 05/17] xen/arm: Add PHYSDEVOP_pci_device_* support for
 ARM
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1632847120.git.rahul.singh@arm.com>
 <f8ac00f7d52f4853d276b4da24294fbeb3602245.1632847120.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4ff4369-3be1-eed0-d3e3-6c9d93952526@suse.com>
Date: Thu, 30 Sep 2021 16:51:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f8ac00f7d52f4853d276b4da24294fbeb3602245.1632847120.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc0b3b67-4c82-45cf-8896-08d98421bbc9
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64798F427007DA2F5F506FD8B3AA9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ImUrXuWjtfeCjEbPy8ZxKzvxJp7jQ7RJPE7gqwt3+nk7dqmLTr92YmrS8YYZj6tk/Vn5Ui1jhX58ETZB/WnGRfc/1rbQ+mHexaftHms95wYCG8YhQ6bQjX43SYRmXN0l9AuAU6Y9E71RXFJuAFawOsSUqeBgfZe5Jyck8zsbYu6LnH3yOcYhe0gPW0RFBMWWDeYT+bNp1rVRNynHalrCe+5UuKXVZ8DgwPxSwvbwxpKUcVjCTpXmzoIBH/LMKwVFKprsRlR3xT/PIr1LEEPfr2WAflg3jNmqpIzpwn+opF9e5Sockc56THqaXhfdRz/1pVpwQ6aIbJVPW3zwVrCpb2qauAj0x+BUsQTOIkR1ii7CUeytS0asFcu49Rs586jVw0pms28vmNNYgeMDUor7+pRwgcElacu64TW6IXSVd64LcSxRnIdixjO2i1+YfpYb+iqGZHfVUQ6bagpMsipRPEXa+mzhP6YxoHk4u3DyGTpjzyF+X1c8C6WuD5/hIZv3g85oNuYtLHdSrWQDnJKfPtflPdbAmunXsht6sIqN4QXZAo5yVZgN1c5RbullOige8P/1Zjg3KHEQn6Y301ahjVdtXKv7MMYDFz5uSUr6yFWkXfHmkWmcBXqDGuBlPTTteFLFbdZOiSQJiHSJgIm3hl3rmyGR41P2rjI3w953MphCwtIKSYn0puMrw0ZX71UyH0NQk4vuT1atR6upauLzBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(508600001)(6916009)(36756003)(86362001)(26005)(16576012)(316002)(186003)(53546011)(956004)(6486002)(31686004)(54906003)(4326008)(83380400001)(38100700002)(8936002)(2616005)(66946007)(31696002)(66476007)(5660300002)(8676002)(66556008)(7416002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDBqbUo3VC9mOUFWcldTNllzYnZTNXlWY25zMDV4a0dHU1VhZEdZWG43aE1m?=
 =?utf-8?B?SThHZkdiSzN0ZDN3a3I1dWd1ZEpGNDQxZ2dwK3JiR1ZJZ1IwblF0bnVNVjdP?=
 =?utf-8?B?VVdqaXBBM3MrSkhoNjgzN0lXU1BPaDByV01yWEpqNnFJOFBUSDVNdjY5eVlv?=
 =?utf-8?B?QnRwejJ1WHlUdDlSdVRndFJFVHY1VU4zWEZLVGRZaEFrSUFiU3Y1RTc3N2N2?=
 =?utf-8?B?N2lFb3drQ2lEZG1veFZCMFNtaS9ybHFzZVk4T2g5cnZJT1RWSmVNSCtnbDZP?=
 =?utf-8?B?Q1FMVklVeTN5OGMvdjBzVGdUYjI2TVdoSGN3dDVoZVBOSnJCVHU0aE51bTda?=
 =?utf-8?B?L2h4Q2s0UmFMZ0VJL0JZK1VzZ2E3YWZYTWhRajVPdXdiNTR5bU0yQnQ4aVla?=
 =?utf-8?B?Nk5rMVNsdFQ3T1pvd2JrVlI5V0VYZk94RjlGVUZIZTd4SGN6cE0yaGpLN3BZ?=
 =?utf-8?B?ZEp3ajhyV1p5djJVZVNHZ3lmbWlQWFg1dHBBZG0rTjZGNi9hdnpjcHZMOFRy?=
 =?utf-8?B?MjdLVjVRQzJ4eW5WSkhCSVE0S3JTOEpVK0xBZFpwZFB0L3VwUU4yRXBIVEUy?=
 =?utf-8?B?T3lxd3JKMU9rZ1htMDduVXNKSHpnS3dZRTJyVURILzdLUWVMQVBNSFBPbnUz?=
 =?utf-8?B?UUxQY1N6M092S21jcUdGNjdEUEIwY1NHY2hRdEVOd3l0WlpWbmdmeXgyRXB1?=
 =?utf-8?B?S3ZLazkvTlFOZENaWUQ4a3g0ait2UlBJRGloQVZMaGxIMGRObHNvbWVYWlVG?=
 =?utf-8?B?MHJJTGZsb2oweXMvUDFyMlZ4dEh2R3BlUS9qNWpyNTdnZzBkUzMvOXFLcjhw?=
 =?utf-8?B?RUsxNCtzS0p5KzVmZnZaS0FocU56a3JlZjJLMkhqYlZ6R2Y0dGtvLy9VNDFn?=
 =?utf-8?B?N3B0MFRoWHdYcVBTR0VkWlFCc2NpZmpMR3JxUDJ3OVQzYWtkSDNkUFlSNWkw?=
 =?utf-8?B?K05RZ1grOG9DNUR5ajhtTGovT3BUWXEyRFR1bGdVMDhlamJ2TWxoTXNxalFl?=
 =?utf-8?B?MU51SkFGZ0lJMGo2NS9yVkg1T0UwcTNQcjJiRTA5bXE5S2ozc2pIdDIxNVBX?=
 =?utf-8?B?bUx5NmQ4cFhubnM5c0JXVWZFbTNGVmIzelk1bWV3Rk90QWM2TmdlRGFVNm0z?=
 =?utf-8?B?UXBaNDkyRmx2a0NNZlVzYzdXaFRBd1JZZEc1aEFtanhhZDBNNG43U08vbEpy?=
 =?utf-8?B?bndhaEY3R1dyT3V6T3hYZmFhNkJOa1FtU3NEWU5MeHdhQmVFU1kxK2V1d3c2?=
 =?utf-8?B?RDdSRVJBVVZnLzFUekFKVkF0ZnhrVmJ1ZGw0MTZkT3Q1cUtPWEo3K21HTVRN?=
 =?utf-8?B?K2E2RUtIenNIVEVkNDFvL29xZUVCZmc2aEFFME1zSHBITXRlUVBYb0NHQVRU?=
 =?utf-8?B?ZjVQbnJzaEplNVA0SWt6dUVmbzk4eENaWVVKeVJ0RmEvMGVMRzd2MGdmRWZ4?=
 =?utf-8?B?SVNsemNvKzZ4K1ZEWHNkY1NhU0Vja3FsSEUxUkprWHlQRmlrSitkL1g1ZFh6?=
 =?utf-8?B?d2REQ3dzTjArSVU3Nk9aUmdWSXJ2MmFwbStzMURzOStMVXl2bjlxY3R3Tm9a?=
 =?utf-8?B?VXkwQXZYaWliK0hNL2RmQ3RFSC9jb2Z4U3VBSWdoSEhjcldZTnJLUkswTWZN?=
 =?utf-8?B?QWF2ZXVyV29KQjA3YUUwalpncE1LMC9qNkYxUGVqK1dmYXBQM1VRdXk3MGx2?=
 =?utf-8?B?bkx4VjhhK3RPSnMxaVRMdDE3M3NwSnBmUlc2S1hwV1lXSWJZdE9qazNRSkhM?=
 =?utf-8?Q?huxRxaYwYIbV3nDUbKIJ4Lv/tz/GHCvFIW73KMj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0b3b67-4c82-45cf-8896-08d98421bbc9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 14:51:06.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qumflTGaykpbWFThVAz2ZHOz4b18NOG1K5XpqsKb1O4lZMc7K3bMk3ea6TjNaHu3xQF2gI6ND1vJpgoahsTOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 28.09.2021 20:18, Rahul Singh wrote:
> Hardware domain is in charge of doing the PCI enumeration and will
> discover the PCI devices and then will communicate to XEN via hyper
> call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.
> 
> Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.
> 
> As most of the code for PHYSDEVOP_pci_device_* is the same between x86
> and ARM, move the code to a common file to avoid duplication.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

On v1 Julien said:

"There are other PHYSDEVOP operations to add PCI devices. I think it is 
 fine to only implement the latest (CC Jan for some opinion and confirm 
 this is the latest). However, this ought to be explained in the commit 
 message."

> @@ -82,6 +83,7 @@ CHECK_physdev_pci_device
>  typedef int ret_t;
>  
>  #include "../physdev.c"
> +#include "../../../common/physdev.c"

Please don't unless entirely unavoidable: common/ has its own
common/compat/.

> --- /dev/null
> +++ b/xen/common/physdev.c
> @@ -0,0 +1,81 @@
> +
> +#include <xen/guest_access.h>
> +#include <xen/hypercall.h>
> +#include <xen/init.h>
> +
> +#ifndef COMPAT
> +typedef long ret_t;
> +#endif
> +
> +ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    ret_t ret;
> +
> +    switch ( cmd )
> +    {
> +#ifdef CONFIG_HAS_PCI

All of the enclosed code should really be under drivers/pci/ or in
drivers/passthrough/pci.c, e.g. in a pci_physdev_op() function
called from both Arm and x86. Unless, I will admit, this would pose
undue problems for x86'es compat handling. But I'd like to know
whether that route was at least explored. (I.e. I'm afraid Julien's
request to move this code to "common" was understood too much to the
word, sorry.)

> +    case PHYSDEVOP_pci_device_add: {
> +        struct physdev_pci_device_add add;
> +        struct pci_dev_info pdev_info;
> +        nodeid_t node;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&add, arg, 1) != 0 )
> +            break;
> +
> +        pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);

While I'm not going to insist (as you're merely moving this code), it
would be nice if the !!() was dropped here, ...

> +        if ( add.flags & XEN_PCI_DEV_VIRTFN )
> +        {
> +            pdev_info.is_virtfn = 1;

... "true" was used here, and ...

> +            pdev_info.physfn.bus = add.physfn.bus;
> +            pdev_info.physfn.devfn = add.physfn.devfn;
> +        }
> +        else
> +            pdev_info.is_virtfn = 0;

... "false" here while moving, as both fields are bool.

> +        if ( add.flags & XEN_PCI_DEV_PXM )
> +        {
> +            uint32_t pxm;
> +            size_t optarr_off = offsetof(struct physdev_pci_device_add, optarr) /
> +                                sizeof(add.optarr[0]);
> +
> +            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
> +                break;
> +
> +            node = pxm_to_node(pxm);
> +        }
> +        else

I think this code should become CONFIG_NUMA dependent, now that it
gets moved to common code. This would save you from (oddly; see
below) implementing pxm_to_node() on Arm.

> +            node = NUMA_NO_NODE;
> +
> +        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
> +        break;
> +    }
> +
> +    case PHYSDEVOP_pci_device_remove: {
> +        struct physdev_pci_device dev;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev, arg, 1) != 0 )
> +            break;
> +
> +        ret = pci_remove_device(dev.seg, dev.bus, dev.devfn);
> +        break;
> +    }
> +#endif
> +    default:

Blank line between non-fall-through case blocks please.

> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -25,6 +25,11 @@ extern mfn_t first_valid_mfn;
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>  #define __node_distance(a, b) (20)
>  
> +static inline nodeid_t pxm_to_node(unsigned pxm)
> +{
> +    return 0xff;

If you can use NUMA_NO_NODE in do_physdev_op(), why not also here?
(Assuming this function is going to survive in this series in the
first place, as per the earlier comment.)

Jan


