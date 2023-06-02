Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA771FD86
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543018.847565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50wj-0002bm-L6; Fri, 02 Jun 2023 09:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543018.847565; Fri, 02 Jun 2023 09:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50wj-0002a7-IA; Fri, 02 Jun 2023 09:19:45 +0000
Received: by outflank-mailman (input) for mailman id 543018;
 Fri, 02 Jun 2023 09:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q50wi-0002a0-Q3
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:19:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b59c0f9-0126-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 11:19:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9393.eurprd04.prod.outlook.com (2603:10a6:10:358::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 09:19:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:19:40 +0000
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
X-Inumbo-ID: 9b59c0f9-0126-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0kDEJmYlA+m5xw4O8vvdfVma25iaAAFAHkteutBDneeRb02zJKJN2/KC+FLHKFHFkzaeemuzk5aGI6t/ZNk+OivV/9Aodg1uOL6hspWgBmugTcuC1jxJPhN+wYK1bK0pcQUBccuODezLmnyeCvNbU9BPKGJ1jo6hEQe08db/anxkY1GbhhwSo0KfgA2p5Wv5rfCQdh5u3dRhcAhUftOY8yTaCWhSyxxBtTfy9xkqbfc1KcJi9RAKedwvlUeml+/Og4wMOp4bfGkR/LuuuwdKrqvIBH7Cr1bQyvXMZfIcJs1ULSrIFF+xlbOCZdY0px/BDwhso4dXlGbWcZ0pz7PaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+ymrAfqiNHEOmSRd7iPMqzh5REH8+T2yZAiS3rj7jo=;
 b=UJuKJo6IdwTw6p4AT8L/yDdjXONehb4yhg7Mg1E+Sb1O8ERczVJLTatPVqhLcVYtPk2tK4H0fCpnJDc6dIFIgo0OQ3eNTfKK2XEnDgUquYtXpL7TpXp6vNrLkGcbUXRgm3l951NoPWE6wJAA4EGGhiRMfNOBFgV3JVpGZ16I8Td25kpNRA0qYG1O3iWnIM1OFri3vvuG7JDLtPx9Cj+9R+9CIw6ai5fHyL9XOcoGU5PTPdQe4htmhLyB4/33TjMb8hvRfIAzUEa+41oZb45itls5Af9NsUSkLHJ5qqjvgspZcwJDQDGaZTykVmiDq48+ESKJfhLew9a371WcCE50Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+ymrAfqiNHEOmSRd7iPMqzh5REH8+T2yZAiS3rj7jo=;
 b=Jk1WQig+pMEbycrn1Kn0nDXWRET+gJVxQgepqCSnJIUOsgXGMO46yeaUQV1XO34BRN6W0eaXI7QPnftc61SnnMrxSeFI9DnscAfMOWMOiRpI/H3TcMEN/d820s11+11z2xjX4KPJ2xyCk/ACl3a/di9KHMmyRJ1bBO8SJo1o0nyAmP1by2cL4QcSAd2gasO9jim2qp7/cXXn/byBZR7c2DBzcSbsz/dEMwyiVZT3mE4e+QneHd9E/uhjVd3UJwhhY0TT65RapElgn32jg4ALLUP/FSMLIgpJs+SXl1I7yMQomCiDv3UHuW05MkXrRxS/224yP6YQ70XsE2kDipWOlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7cfe479-9650-0e12-9491-55118c4af70a@suse.com>
Date: Fri, 2 Jun 2023 11:19:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-10-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230602004824.20731-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a84adc-12f7-4846-3bcd-08db634a7e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EwpFBLbXX+ELOyhdvANY6u4rHFdaVwRt5YDabJQdVVBGbn+FRU012ItDnFOiFfP3mAZwHKjfInUxU43Mcz3Zuizx4RRXB9YRisDsbMl1Lhi8UP46W+Hynq9APHjr4tcERMlPx9InFHqjp4+bd1ih5o9wqKb0WrX902bISOOWwbUtsCtWTG4m6kNDxjhW1Stoo72jpY61EFc8Ue4YBMLJveLtQfp1Q+36GpyfSGdbIzUz0KBMNjNIzlYguTTIyI/2aZRAPi3/CcjrUZRaucIC3+tU0eQYu2iiwy4ReJKpqOrLM1VU8bKk3kJ+pM5AgASdL4L9aVtRXBbuKSGETNoOUffd7ZFEETKxoS1YVCbse4w4M78AfLgFEtAXgTKFvI+4ndYGdU7swN/E4n7ih3adkxOve4a7SHdjW2HJhgnGhW3qVMvurAZkB2mzCMpsOWgvGtepeCnYG6IzFLmMfWOJZP7qwLYDwkhLl39zUG8P1Q07maOaUt4rj1L/9pOV1JfToJx7AMVL3fK8+/u3s25DWl6ZOYh1p3ez2yDWo3XMxMFYgE3gitMUFnMkZvCIgo30/xdyborAkc1ytTDEPO6hQdDM+RWbBXdlPSxdAOJGIVpX8se7v5EN5kNxlSymD3V/cIZdTD3As75DjIGxa1IQ1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(38100700002)(86362001)(31696002)(6486002)(36756003)(2616005)(26005)(6506007)(186003)(53546011)(6666004)(8676002)(41300700001)(2906002)(5660300002)(8936002)(6512007)(66946007)(6916009)(4326008)(54906003)(31686004)(66476007)(66556008)(316002)(83380400001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRXd29XQnRISnBrOUNqM2U4OE1aREFNa3NzWkFHK2UxSnFhQUZtYlo2OHZu?=
 =?utf-8?B?ZEJKaE9PZXlpWS9aaS8vK0FQODZtMzNrVGFycVZRQ1JVWG9pZDhVNnVXUi84?=
 =?utf-8?B?WlBMVkRTL3NEZENiVjA5dGR5aFgrQVZLWG56R2lnZXlaTVliSzNxUFBPcEpI?=
 =?utf-8?B?NXJnS2Z1YjZMRFdiZFhNTzZ5U2FlRjVOTS9uVXJzM3dsZHZ4UnlYb0J1QTdQ?=
 =?utf-8?B?YW9MNkdHcE1CUXpUeHgzeHlQTERLcjRjYUFrK2pkdU9WTVhCMmxDOXR1N2Y3?=
 =?utf-8?B?V3dYOWplVXdGOFV2eWVsc2FEV1ZvYWZHWFp1RDNIK2tzTkk3ZUE2VEVnTitm?=
 =?utf-8?B?US9sL3FEM3VHejdiOUVQOXJtRDE2Zk5GWXg3dU5uYlloRUwvQzJxZFUrTVRS?=
 =?utf-8?B?ZUlXcXNHajFkeVhUeFVCV25JWVVEOG9kYW12NlAzM1J3KzNQbGV4MEIwNEVF?=
 =?utf-8?B?Mm9sU1FaTVdJM2FWRUpTdVF4QU1tNE42V2g1RmN0d2VmUGdSak5pbmxNcjRI?=
 =?utf-8?B?T0ZvVFA0OGFCckJVa1BqbUdDNXlmU0RpY09lUEZIY1ZaTFVvbDZDVTZ2Ymxi?=
 =?utf-8?B?QUYrd1lxdFZCOU9Ea01FeWlBeGtOQXVFa0VDLzdHSU1LZ0ZMRHI1N3orU2Jw?=
 =?utf-8?B?L3lzaW9QRHREbFg3dzVmVTZnLzB5YXBsWjdlZjJHQ2Qwc01OcTZZdElxcHRI?=
 =?utf-8?B?aU9DT3RHak1JNFZaTUR4c3JrYStxYVE3L0VnUlNIWStKUTcySEtJUTJXWGRI?=
 =?utf-8?B?dTlVbUVlWFl3V2hTQ3Y5SWtOWFozQlQ3R0QzUWg4R1dINDloaDZQWUtLd0Fy?=
 =?utf-8?B?V0Y3QTNZSG1MYi9kU09CQVlSR3FnYWo2Wm0rYlRCNm5BZUtmV0NWa0svbjBp?=
 =?utf-8?B?bG96WnkxU2k4SVQ5Ymdsa0Z5eEM3ZEgxRUFXbCtxcmxSY2tYaUIraHA2MzlD?=
 =?utf-8?B?Z0hjRU03SGpBVXM1eGI5L1ZiOE91R1NZUWRNeXlaWlY1QldHZEVZQlpzRGUx?=
 =?utf-8?B?cE9LREJOcmh1SDNjY2FEZEl5dU5zdHhyVXNIMVRvUDgyNnZwM1J1a2JMQ3Fo?=
 =?utf-8?B?RUMvVCtSRjBzK1BtbWt3NFdQMjQ0TDZ6VFJYSUVsM284VnI4TjNiZFFUVG1p?=
 =?utf-8?B?QUtUdVUzTVRJaWFHYjQrWkJhbjkzajRnUUxhQWhsR3dwWi8zV1pQWUUvTDk1?=
 =?utf-8?B?U0MvcHlwTUlRVWJnTUtyazJrVFQvSXBBUTFvQTNYeURuU3JpWUViZmJNK2FY?=
 =?utf-8?B?NVJ2RUxybG1HRUtSUHdtQXJta202TEd3TGl4TW5RSHdpSWNjUllLd1JvOTFr?=
 =?utf-8?B?aVBXcUtVcjhWZHpDMDl1bjhlNWNMeVRBK0JhdWw5TkttdmdIZ0RmNzg2SHhk?=
 =?utf-8?B?Rjd0TlA2ZEVsZ3dTSkg1UFUrdDByVGs4L203SXg0cTB3Nzh2Ym1EeGFBakhE?=
 =?utf-8?B?STErWTYxRGN1QW5SeENGaDUwbWQxTktTdGdlZU05amdJSXRSdjBIdm16Wnpu?=
 =?utf-8?B?bVAzYUEyQS9QYTNQUC82a25QSnNnYUVBUzEyRTQ3N2ovcnArYVlEcW9oWnRh?=
 =?utf-8?B?Y2hodDk1eDRqVWRZN281dzBkQzc0a0FGb002a1IxVG9EV25FbHlkTE5aUnJN?=
 =?utf-8?B?VTIrcXU5ZmJrY1VlZFdLSXpkK3Y5NWNSMzgyUmxDSmc2bTFxejY0UTBUSTZS?=
 =?utf-8?B?TUtFYWNkTDF6WWRzWUlkYjRjMUVGd2hrSkt5dThQaDdXb2lqZW1Idm1VUmh4?=
 =?utf-8?B?TzFDSkJQaFkwcFdqV3R3dnUra3RWLzlNZkpPMUJFVmtyeUZUSVUvaG9ZTTJX?=
 =?utf-8?B?YU9lSnN0U1ltTXg3RTBuN1BvOUhuQkZaN3llS3RaNVdIcUxTWHZjSjVnajh2?=
 =?utf-8?B?c25Td0QwMUtra0liNDdUT1QxUERyUjlKdnlGcjdkODRZcGJhd24zcS9KUWRs?=
 =?utf-8?B?VDBUSjYwSFhnUGlpMHNUcTc1Q1plRjJXdWM5dDY3MmpDUHFQVGsvdWZuRWRn?=
 =?utf-8?B?YXFLcyt3cXZVZDlWWmM0c1dyY3dDQlE4a2lLYTNLZ05Gd0twQllVVGpHSGZ2?=
 =?utf-8?B?R0JZZjNYUFN3RDIrcG16Y1AzZ0oxdkxMZ1V3RWRIN0liSVUrK05oTGxjSy9S?=
 =?utf-8?Q?GOvetWWZlBK8mYcJKG+tD0X4T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a84adc-12f7-4846-3bcd-08db634a7e25
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:19:40.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peJTuV1iOcCMUhMj0xgxeGIs/UD7aNU4j+9l+A4QFHYCbGBNheJ6ByLTYb5yJ08UdDNvEtkAjegQBvWSV6Ib/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9393

On 02.06.2023 02:48, Vikram Garhwal wrote:
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -18,6 +18,7 @@
>  #include <xen/device_tree.h>
>  #include <xen/guest_access.h>
>  #include <xen/iommu.h>
> +#include <xen/iommu-private.h>
>  #include <xen/lib.h>
>  #include <xen/sched.h>
>  #include <xsm/xsm.h>
> @@ -83,16 +84,14 @@ fail:
>      return rc;
>  }
>  
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
>  {
>      bool_t assigned = 0;
>  
>      if ( !dt_device_is_protected(dev) )
>          return 0;
>  
> -    spin_lock(&dtdevs_lock);
>      assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
>  
>      return assigned;
>  }
> @@ -213,27 +212,40 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          if ( (d && d->is_dying) || domctl->u.assign_device.flags )
>              break;
>  
> +        spin_lock(&dtdevs_lock);
> +
>          ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>                                      domctl->u.assign_device.u.dt.size,
>                                      &dev);
>          if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
>              break;
> +        }
>  
>          ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
>          if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
>              break;
> +        }
>  
>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>          {
> -            if ( iommu_dt_device_is_assigned(dev) )
> +
> +            if ( iommu_dt_device_is_assigned_locked(dev) )
>              {
>                  printk(XENLOG_G_ERR "%s already assigned.\n",
>                         dt_node_full_name(dev));
>                  ret = -EINVAL;
>              }
> +
> +            spin_unlock(&dtdevs_lock);
>              break;
>          }
>  
> +        spin_unlock(&dtdevs_lock);
> +
>          if ( d == dom_io )
>              return -EINVAL;
>  

I'm having trouble seeing how this patch can be correct: How do present
callers of iommu_dt_device_is_assigned() continue to build? I can only
guess that a new wrapper of this name is introduced in an earlier or
later patch, but thus breaking bisectability (either here or, if the
wrapper is added in an earlier patch, there).

> --- /dev/null
> +++ b/xen/include/xen/iommu-private.h

I don't think private headers belong in this directory. From this patch
alone (including its description) it also doesn't become clear how (and
hence from where) this is intended to be used, which makes it hard to
suggest an alternative.

> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> + /*

Nit: Stray blank.

> + * xen/iommu-private.h
> + *
> + *

Nit: No double empty comment lines please.

> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#ifndef __XEN_IOMMU_PRIVATE_H__
> +#define __XEN_IOMMU_PRIVATE_H__
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#include <xen/device_tree.h>

Why (for both of the lines)? All you need is a forward declaration of
struct dt_device_node.

> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);

Just bool please.

Jan

