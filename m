Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98FB43118E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 09:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211730.369373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNMa-0001tp-HS; Mon, 18 Oct 2021 07:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211730.369373; Mon, 18 Oct 2021 07:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNMa-0001rk-D9; Mon, 18 Oct 2021 07:47:16 +0000
Received: by outflank-mailman (input) for mailman id 211730;
 Mon, 18 Oct 2021 07:47:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcNMZ-0001re-42
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 07:47:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b1caae8-2fe7-11ec-82cb-12813bfff9fa;
 Mon, 18 Oct 2021 07:47:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-3_jM1QqIN12wt6_e48vr-A-1; Mon, 18 Oct 2021 09:47:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3534.eurprd04.prod.outlook.com (2603:10a6:803:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Mon, 18 Oct
 2021 07:47:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 07:47:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 07:47:08 +0000
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
X-Inumbo-ID: 9b1caae8-2fe7-11ec-82cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634543232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGNuHK/ycs3TRq7mbZuf4wdWnWMhifvOvkq8vtsDVgI=;
	b=nK3RD8+Ct1uQ2QUwf1lkCbxPMaShJmDLegKVQ2iNM3vW8CyT4G2IqhTgwSpadPZ2tEIo2j
	CvaUoUEcHRUwGBX0YiGLd57ILfvRCZ6PU2j4v/j5n/77ok54Cw+JruaNKZ0zLUEAOVdqYD
	UKqUy9P0+BNtQ4xU4xm0pRhlyadXtLY=
X-MC-Unique: 3_jM1QqIN12wt6_e48vr-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD/YMWuegoh83KZ5q2IRwKJ7BdJnS2klsUne/x0WCkhZsytVVQe+o2RRGdMxaCRQSNCmPIS646aM9E9jjCaRHyXfPzeDqvqkFUMkldQZ2ltClRfmlAV/Au4DWuTx3QBqc0aGTksRPYT57ar16sDXyie/fz0k7qnWLpifaWQAcsCxSWGz8r4kFREWWlNXUgtx4MDrDlZ+RQykhv+O0tRe1U79GD/9OiRFKqwLtBdDpfQutlut6+SdZPgzTsrlKAKfdfCpTknoomM4TMBeCe4VaYk7xFpsaUCLA8rTEZemjNG9ZGaXkIeNXRiN3dh0GTD+RzpkjOUdz3iDInc73i6Zrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGNuHK/ycs3TRq7mbZuf4wdWnWMhifvOvkq8vtsDVgI=;
 b=C2GUpjCK/w4CA6UBC45yk6ICJLBUJhujeQZIGKa8NHKNsDA3A73s8JxlVRAIRdZ8D+tiwPUT/x/lXtH7pXwNvD3lY3sLKVQfNNtkZAocptQsuk2XS1ndrpFRC9cWF8sVyRnvyDx/cY3FU8LSHXOufivLvAcJN9bjRiHKlEz5MxX2jyDjom7PIuMHb9Pubud7v2Sh/ke+jQ5JJwjHFv9E3gy7IFMm7jWVpNnm1IraexK6ELqeNdl/5TDxo8/J3SEs9/8Uf5kMCfgOa2I58NCNdF/GV9UjtvsSo1SD3h1xDX013frvOrdl3vU0MEYshxFiKLO80ixXKWorah9egsNU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: iwj@xenproject.org, sstabellini@kernel.org, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
Date: Mon, 18 Oct 2021 09:47:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7305aad7-6b38-4ab7-27f1-08d9920b7d2e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3534:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3534129C77AE3046043E78D9B3BC9@VI1PR0402MB3534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N7Fs5gUIIbQRV0OyKyqjAbPuE7UBWJZGsgFr+pIpbNXxgdYs+pOdoL7met6Eynt4ijKzK2LY0c9GY0fNn5fPYmAIkzewf2hS/z9LgxZcG0Ga/ut5Hv2I2Iz4nk7d8+OsVpHTbCxbgFF+aH5K2yAdEXXyUIbBSkcvZ+9Xaeu36iX2R+7amp6xassOVicBAbsray1cWcfSEWFF3N894uPqT3upyzfS9D5sWtxIzwTAzVgetPq8PjVPjs4x+urMuNhx5S4spbP0tFMJUm0Sb8oTRbsFlR8l16UcH+EOrz5PylxNXu3Mz/F6x3rtYOyMxS4LIupv4j6b0WG6sAg5wzoOHpL69KYYfb2h1KIaW4ZeHv58tMWdJZ2xT1S/1tjLC95LaT/7CJg48NcY7DvO/XrDpqSpDQsp015SfP7c8P4BkBzmX7oNGN8DuGUvsZgOs4ZsVrpWgphvuOA7yrnH0trz9Z9BfSTKwOFqsXgePkdSqCLrFcybRDBYMB0RY9I0Zbqre1RTvui6gXEhtReDFvju8d1aaKgd25+ALGe7DFptEgODwrfbnLpR7V+QUulVvzOBUuqXISxL+IFBOIMVBsj97XeYiF8vPKUbYtTBcLZRNY+ucc1ryvvy4UB86pCLbQKGrPLgMfREeBqW7Y3aMVVxKEBUetkjdQdSHt7oitBLcwHMOdXlumkQbr+FUb96+tAI2QRhxKuVwUpT+exxyfMHXsLGeZaLJDm6WbwgAkEXxRhACW1xguUZxT6i8FroMFe7LN9G959TlLN9aYk9CCoYeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(6486002)(53546011)(83380400001)(956004)(8676002)(38100700002)(16576012)(186003)(8936002)(26005)(31696002)(2616005)(66556008)(66946007)(66476007)(5660300002)(54906003)(508600001)(2906002)(316002)(110136005)(4326008)(86362001)(31686004)(7416002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXRsNVBiMVJPUDB4VG5aQlNQWUVUcmFyVkRMeHNBRjVZaXhUcGZxOHh3bjI3?=
 =?utf-8?B?bXdtK2hydjVCanFGZm1pSGEvZXhzVVBHQjRwcW5NQ2labHNYMnk0R3lDQ1A3?=
 =?utf-8?B?UUtGMHN4ZUt2blZUM2pubUk5R0tyaWplNEFCV3ZYUkhmRFAvNzltNEd5UkJU?=
 =?utf-8?B?OEcrNFJVVmNMK1MzY0huRFBTZHlHbDBHdVFUQ0JneU1jdFVHS3lWRzlBYWd0?=
 =?utf-8?B?Uk50T0FhdVR5eDVmSU8wUTM5S0FUL0tCRTJBWmw1S21pd1RFOW40V1MrUFd1?=
 =?utf-8?B?bnJSSGRSWmNQdThwejFSa3BuWjlkWWNQcEQ5bnlscTFEblkrQ0ZmMVhCaEp4?=
 =?utf-8?B?dEtFRi8zUGFXZDcySFlOY21IbnZNQkxSMkZsOWFsZnVhODhXdGlyRnhWWkNa?=
 =?utf-8?B?YUR5cC94cFhZVlE1amR3Q3RwdFlmZldncUVZSTVnamdOcnI0UEV3eWVDQlN6?=
 =?utf-8?B?clBXUnMyV1poNEtsNis5aVFudmlvWkpVZVpYcjRrQVE2VFdiRExIV1J0eTNh?=
 =?utf-8?B?aDZsK2NhNVBBNkhhWmtwbkd4VUoxRStxakZ4VGdtc2w2ZjdnckJHVnlpVGxw?=
 =?utf-8?B?Y01oK0hiYTV4Tm52V1czbFQwQSthY0JycUVBTzRCMWx3bHk4bDh4Vkd2bHJ5?=
 =?utf-8?B?OE5mYXJQUFFKcU0ya3RyY0wxT1hheXRRRjlla3BZSnpqdzlLVGhUVmhhY0dH?=
 =?utf-8?B?amo0a0FsQTc2TGRoNGQyMGdObkNkajM3aUtmZ0tEcWM4b2V4eGNLQklqUGhh?=
 =?utf-8?B?TzZ0UjBhZ1krRmFvdnkwQzhiY05ZMjd6cXY2bDByOWcvWG1KdkhwNU1QT3Bt?=
 =?utf-8?B?MVkxMXB6RTB4RVgrREs4ZHNVRTlwVlN4WEV3OUpIR1QwaE1LTGZ2WllMRG1I?=
 =?utf-8?B?SkpVWHA1TDNGTk53UlpFekN2cU00SDFrRTd2cjJ0YldCaWt1VWg4RjdFL2tT?=
 =?utf-8?B?UGF5d01pb2l3eXdXZ3Z6U2ZWZ3lqRWFUc01HWWJ4Z3JOUmMzeHBRdDdSeE1t?=
 =?utf-8?B?Q2F6M2NBQVZIN2RmblVDYVI3NjdkVmZIeWQxQWlUOXA1VWNFYVRpOFFpVGo4?=
 =?utf-8?B?ek9mMnFsRFNWZmpMVnhrTDJINlpZNTV4RXBvalNCMEtEd2pLdWdqTEhSTEEx?=
 =?utf-8?B?OXBuNFlsOGpLK3NWNWZlUE1ndmpIY3VHT3RVYlFLdko4QlIreHJtTEpGQVB6?=
 =?utf-8?B?NndxZFZMK25BN29xRFdWQTJOM0ZpMlpaMUhQcGhRbGd2ZDlaRTBZQnV2eThi?=
 =?utf-8?B?TTBnaFRWZFg0UHRobzA5bERjTEhSa0RLVkRXeUNVQkF1dFZ4SzZaTlpmT00y?=
 =?utf-8?B?N2hVaTFUTUVpZ2h6OUMxQitxc3UyZjRXd0JMdjZyWnc5TjI2dUVFeDhlZnB4?=
 =?utf-8?B?d1V1T3VGQkxZbkRiU0VsbmV6Q2VSNkozRkdRTlpVQXRRYy9zdlF1cUpBbjMw?=
 =?utf-8?B?WjF2aitHSmdJVnRTNzE2dzN2ZXNmeDdXU3NmVnVKN1JDakpLV1V2RldDVG8x?=
 =?utf-8?B?aTZZVk1qNUhQN2Uzdm12TCt1MzlNN3gybTZPQThtaURPQmRNbndPZmkxYjRW?=
 =?utf-8?B?S3dHb0FZdnRHTFNaZ2ZkMGU4NFNSK3N6N0J1bHhRQm1lOGgyQVdYamJ3OFkr?=
 =?utf-8?B?TExHQ2hJZEwzZ0piZ2RRSkhiVGYrb3kzZ1VrdWVlYzhMTVVHb1JFcURzenNz?=
 =?utf-8?B?YUlYQmwvaDJWSEhqcWZjVmlXVVd5Slh0VmcyR240aXlLQkg0V1VHYk0xaUoy?=
 =?utf-8?Q?G2R2AIvF5Sl3oPYMyStqCsDJZeN8sW9BnGezDx8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7305aad7-6b38-4ab7-27f1-08d9920b7d2e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 07:47:09.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xLaS2YxbfghTob+nhH4Pt8L1ThSxDp2WmhspQSvePbF/m2zLfTCO/6DJLysHFBd2QJBbqgnWnDsyMlcb0WUSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3534

On 15.10.2021 18:51, Bertrand Marquis wrote:
> --- /dev/null
> +++ b/xen/arch/arm/vpci.c
> @@ -0,0 +1,77 @@
> +/*
> + * xen/arch/arm/vpci.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +
> +#include <asm/mmio.h>
> +
> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                          register_t *r, void *p)
> +{
> +    pci_sbdf_t sbdf;
> +    /* data is needed to prevent a pointer cast on 32bit */
> +    unsigned long data;
> +
> +    /* We ignore segment part and always handle segment 0 */
> +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
> +
> +    if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
> +                        1U << info->dabt.size, &data) )
> +    {

Here it is quite clear that the SBDF you pass into vpci_ecam_read() is
the virtual one. The function then calls vpci_read(), which in turn
will call vpci_read_hw() in a number of situations (first and foremost
whenever pci_get_pdev_by_domain() returns NULL). That function as well
as pci_get_pdev_by_domain() use the passed in SBDF as if it was a
physical one; I'm unable to spot any translation. Yet I do recall
seeing assignment of a virtual device and function number somewhere
(perhaps another of the related series), so the model also doesn't
look to assume 1:1 mapping of SBDF.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> +#ifdef CONFIG_ARM
> +        /*
> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> +         * when Dom0 inform XEN to add the PCI devices in XEN.
> +         */
> +        ret = vpci_add_handlers(pdev);
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +            pdev->domain = NULL;
> +            goto out;
> +        }
> +#endif
>          ret = iommu_add_device(pdev);
>          if ( ret )
>          {

Upon failure, vpci_add_handlers() will itself call vpci_remove_handlers().
What about iommu_add_device() failure? The device will have ->domain
zapped, but all vPCI handlers still in place. This aspect of insufficient
error cleanup was pointed out already in review of v1.

Furthermore already in v1 I questioned why this would be Arm-specific: On
x86 this code path is going to be taken for all devices Xen wasn't able
to discover at boot (anything on segments we wouldn't consider config
space access safe on without reassurance by Dom0 plus SR-IOV VFs, at the
very least). Hence it is my understanding that something along these
lines is actually also needed for PVH Dom0. I've just checked, and
according to my mailbox that comment was actually left unresponded to.

Roger, am I missing anything here as to PVH Dom0 getting handlers put in
place?

Of course as soon as the CONFIG_ARM conditionals were dropped, the
__hwdom_init issue would become an "active" one.

Jan


