Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0526F526E
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529001.822880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7Oq-0006qZ-Rm; Wed, 03 May 2023 07:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529001.822880; Wed, 03 May 2023 07:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7Oq-0006o6-OZ; Wed, 03 May 2023 07:59:44 +0000
Received: by outflank-mailman (input) for mailman id 529001;
 Wed, 03 May 2023 07:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu7Oo-0006o0-TJ
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:59:42 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe02::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74e5dbbf-e988-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 09:59:40 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB9PR04MB9499.eurprd04.prod.outlook.com (2603:10a6:10:362::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 07:59:38 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:59:38 +0000
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
X-Inumbo-ID: 74e5dbbf-e988-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBifMORxsMWiuSuej3g989o3uQq5ekhk2Dl3I/xiM5dG0UOk1BUw25p+/kJSuyGu+5t0yNlNONNFhGKUt7VPdWYFxhYnfp+w/n1sW0uwTTzZ6obBTK5KYgBzMLVdZUnOXEKjICXEr8VLZnTjbBq2cURz3sku6wouuLtr7gKkwJ1LsyzvhV33fgPU/Rosm/4At0MhIIpl8TSrZjLE+RpyQE3DkR7X3rO3VB94h/k84PqmyzXTgOc+temXuEAfnINF+ynwk0uFmEKw7u6SZ6Gd4ksGRbnJTZUYuXzRG3ntPrIy0o5SNA8H59hJTV/ExW/xTMDGbyxROMdKWZH5T3OgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnfPxbd9O5raFiv4FU6HklW0GmRoH0bxmZ8WkaI26WQ=;
 b=NSJn5XY9hPeXqzUMPLTlzkz/WjjqRUTcP+/ZBOzFu87gaRU7NR9fBARdZnxbR4CIQ6PWWov1rJOv+dI69J+epm3ILj85PhTT3LjL88Bc/WsGNS3QDUNUxSi1a0HAGvRZarOskBWNnYc4lE9OXP9Um3l2SLlFwc/Djvx8Yc9uajS9+hQVk5/Ptrk7XemJp9o+SytVTJiWbB4pPWaOgLWSVqLOI2KuuYTXFBQMS58O/LxkUvi6tGv+9Jf5XNTcmkCmv3oCutLrJc8IuyK2hpPdw+dN4sVWLF17/67XOrB9Hdqy/6ZSsYsmL7g7LncyT9lvDh3DOx8vovettHZzZPGBEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnfPxbd9O5raFiv4FU6HklW0GmRoH0bxmZ8WkaI26WQ=;
 b=4n2rsWJ8VcynALeWFrSsldxOwOO3xu9YRCNkWDkJejZa28ALA25dce1p5X6guroQYn+kS64fPw81dT61Ep8Ory8h59pbuNfAZ3p1fMIgiwaduPWa1a4e2Yd/2GpRt/jxGMiWZ81OFeIC8QGX33rTm0XasmoVV4Lj21zKfKT+nm2WnlYQbU9Y6HY2/rZZ/16ngJBwWgzSJEkvZtWGtg3Jwg+PDqS4iXJaEWe/6x+cZ7ghzrv9q5gdqe9KXw6SrHOhkqKj0BZ2lwBgRB8nrVhS+cW6+HJARWFKXbCCK5zN/qiTa+zjKDyZ5xQTT0mvFevLFkaR8iFnf8p2QPEMZEg1pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ab506b4-1084-b9b5-6fb1-7d1961416dec@suse.com>
Date: Wed, 3 May 2023 09:59:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v6 15/19] xen/arm: Implement device tree node removal
 functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-16-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230502233650.20121-16-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DB9PR04MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: d7254c95-99e7-4475-c1a0-08db4bac578d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lsxd7DjnsESfd5XmFxw4kLvPKvrjn3YB5RPewRgqIhyoaCfir3fvyPie0AT2HKXMiF9e1221P4iNNtwLOqk5bUV1HyDoiWJkQZ+fT6magpYnviQ8VlJgu6locUVNebVCdQyViugQyitVOgd0Zcb+UtoPXmnl1O0VoWJKhLqrTgadVTIHK070D5M5zNCiueEM3uTa25VellDcP7D6P8XHvA2VGvN8THB4wV/oDHwYL88pNbfaxX4OLLWI0+zOW8sl/1lX+zBMJqpIVIYwTheyydzK0a1fiOWv8yjqDNJ4gTnEXx4k44eaG5EUw30IAq4QI3GpIhUXat/qQDM6QKw9Y/Ipigm0/FB20m2HYkEltUkrTJclvINyGhHuADd69klZLdosapTKaoDqEy+vdFppmuMaQpvqPY6uGg3ip6a0nh0SBWxQJ3NM4OQD8XMdpW9//jNcy66y3piNv3/1MYxjQCydq1s4R9dtVwTCm5Ti7rbkq1sYiXSfhEhDQmQ972/uqWbCZrYA+U1JJuS/LKEq0fQRl1rJlseio3qOskg1Fj0W6pIYycUNzILfI0AfWCOESRgkslaO0nRLeVoP8egcrCuI1eVFM1AME9kisZbVOgnHjGHAloKx+ak4HswEEpKEFf0V22IFJr0oYkzwljmByrKk9RuzNfI8+lMwCCKzJPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(54906003)(478600001)(31686004)(2616005)(53546011)(186003)(6506007)(6512007)(26005)(6486002)(41300700001)(6916009)(4326008)(66946007)(66556008)(66476007)(316002)(83380400001)(8676002)(5660300002)(7416002)(2906002)(38100700002)(8936002)(31696002)(36756003)(86362001)(403724002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2hDbHhDS1NCY0txVTcyT0RVSGhNQjB2ZG1wSERHOUJuMlp4R1NENmpKWll2?=
 =?utf-8?B?ZFBUb0pSMUljeTBFbk5mTVpYaGlITmlXNkpwM3p5SWE3M0pDR0tRTkt2ZmdI?=
 =?utf-8?B?L3JQRWlzakpWQTBRSzY5SHhtN1BPMzNQVlFKdDUvay9yRFdwWEUrSk1MYS9D?=
 =?utf-8?B?bXNXSjdYTHgwb1hMbzZST1BJd0NjdkZLcElDbW52SU94UmNFWmlXVU9BOWdU?=
 =?utf-8?B?LytnVmFFVUNWcTdjZUl3SmNzRmRqUytIdjlta0lIaUVZNTBhcEszRG5hU2di?=
 =?utf-8?B?YXlCNlVmS2N6QTd2WDFFcXBlV3IvTE5mc2tqMXo2UkpjS1d2VUhlMEtKeHVQ?=
 =?utf-8?B?RFU4VzNMN2xOU1hiaFBXMlZHYWU0WmhRdFFlM1hORnRGQW51aE9UUFNlejBK?=
 =?utf-8?B?Wi9zZytGUVhWcVZNc0t2Y3hRQTZvd1hZb2EvNlMrZGVFOHUzc3owekNvdDJx?=
 =?utf-8?B?dFYwOXZxcEJ4RzhObS9sU0NvSWVhcmJMTkF2WkF1R1h0ZS9SZHZ0TG1iK3hu?=
 =?utf-8?B?UE5nWmxpVGJyTFdGNXJveUU1UEQ2elhab3FsNCtEQ2JvUDUwOC9kYlNkM2Z2?=
 =?utf-8?B?bHdidzI1VzRobnB5RHU1VFJJNUtTSlBmWmhwN3JKVGsyVkJJN0hCY2dORkY3?=
 =?utf-8?B?OHQ1d3pPQ0JHUVFEVzB3TVhSQTBSN2hsMVhrczllMGdCMHFZRnR4U2pERThC?=
 =?utf-8?B?MFdIcWdLa3Y0WS9OeG5MOHBDMFNPQ3RxNTZMR0VvZE5IelRxVnZKcmdUK0NM?=
 =?utf-8?B?L2Jjc0l4Qkl5RjRYRjgvTGg0a2FIcXorS0pjcGpSL1F1WE9abU1JZmpTa1F4?=
 =?utf-8?B?bS9LSDZOUlZ2V3RJTTFiYTh3amdKdDdRMFR0SlN6N0VQQkU1ckllblhUdUUr?=
 =?utf-8?B?U1dVNXpIaEZlaTlOaUJKZ3dVU05UenZITGRPZ1E1WGJ6MkcwTWMyaitLNnZ4?=
 =?utf-8?B?YkZzVG5taVhvT3UzNXl3aVBocVpBbnhzNUZzRGZGSGRidzV2U052VStEVEEy?=
 =?utf-8?B?d0hUZ0NnMW9XYVNxdEJZSGpGWmxZZmgxTXlPTjJ4TlR3NkZrSE50cm5KeHJW?=
 =?utf-8?B?UkJkLzRCRTVSNDdqYjUyNjFrdGxyMUFRVjQwR0ZLTGhxb2JKR09MeUkrd1FI?=
 =?utf-8?B?dEhtVFpiWWx6KzBkK1kxeHlJck05TEZaKzBYL0RscHhKZlF2bEg5Y1ROTnp1?=
 =?utf-8?B?N3c3bUdYc2txUUI3NVpGS0RVN1hodkd4bWZiMTBWZVR6a2oyZmxmdkh3YlUv?=
 =?utf-8?B?ZE41cGFTd0wrNDF4a293WkdrMXZZS2xyTUU2U2h0U1o2aWt1alNMbFUvQmY1?=
 =?utf-8?B?cFdHVHhXMURiWTZ4L2RVTHB4VktPYjBibzFKWTQvVlQ2eGlTY2ozU0lmS2Vt?=
 =?utf-8?B?Z3I0ZURuMlU0ZWdWWGtGaWN4eXNCZVlqYUdPTE1peHBZeW42NzNjcmZOQVRR?=
 =?utf-8?B?aW85ZW0zVGp2c0dNOFZHVTgwRUlHZmJaUWpqdTUvSG56TGk2QXJtT256QjBN?=
 =?utf-8?B?SnJIYkkxMzU5RjM0V3VQdW1jcDJHYk5jYUd0NTVZTjEreFdFR3hJa2tLUllh?=
 =?utf-8?B?ZEVSdFdWS0RJUkRPbDBxeHRLMktFRWZOOFcybHYxU3VGc2FRdzFiOEg4b1VY?=
 =?utf-8?B?T0t0TGhWcmliTGQ2cFhOKzRkS0RCaWQ4NUxQeHp0emZyZTZPNWtsK1BZUGlU?=
 =?utf-8?B?V0ZyVmZQNzVlZGlOeW9vM3hQTXFaYlBvT1kzdTZ6MGlhSFhncWVxVTByQTE3?=
 =?utf-8?B?Mk5xZkttZ1JlRk1XOEJVMDhjT2ZycVBUc20rek9yanVhZEVNYkVKUlB4NVFn?=
 =?utf-8?B?cTM1QWhaaGErNndWMFJQVklCN09EYXUwbEhhSVlQRXFRR1JEazJCcVlEOVBG?=
 =?utf-8?B?QitzaS9HNGZGdldPcTM5eXYySXZRT0hmbVJNbTZMM3g3M2dTVWtVZU9rcFVl?=
 =?utf-8?B?S01ZcGtjaTF6QWxJSi9rSUdKbjY2a0U4VXJhZnUvdmZwamlpYjFxTGpmSk5N?=
 =?utf-8?B?UUU5d1kzM0I4dC9QM0RlSlNqcTZ6cFhaaStFNTgzVDZCS2FFSENNcVB3NnVr?=
 =?utf-8?B?ZFBvUzZ4eDVDQlJaNHBlVElONzRobjlBS1lCTEo4cHpoNWZDZXBCN0lmWmhn?=
 =?utf-8?Q?bbEs9uYi8QRZnoI8AeiZJ06JM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7254c95-99e7-4475-c1a0-08db4bac578d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 07:59:37.9763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GcOjQjEbxTAT2sX4nzDbHLCuxWkGhNnlzpQgcTusG+SD276i3/h9Mk56VntdDZ1SWyTIKoFy4bEfoWazzfTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9499

On 03.05.2023 01:36, Vikram Garhwal wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1057,6 +1057,24 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
>  
> +#if defined(__arm__) || defined (__aarch64__)
> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;  /* IN: overlay fdt. */
> +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +    uint8_t overlay_op;                     /* IN: Add or remove. */
> +};

I think you want to make padding explicit here and also check it to
be zero when incoming.

> --- /dev/null
> +++ b/xen/include/xen/dt-overlay.h
> @@ -0,0 +1,58 @@
> + /* SPDX-License-Identifier: GPL-2.0 */
> + /*
> + * xen/dt-overlay.h
> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#ifndef __XEN_DT_OVERLAY_H__
> +#define __XEN_DT_OVERLAY_H__
> +
> +#include <xen/list.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/rangeset.h>
> +
> +/*
> + * overlay_node_track describes information about added nodes through dtbo.
> + * @entry: List pointer.
> + * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
> + * @fdt: Stores the fdt.
> + * @nodes_fullname: Stores the full name of nodes.
> + * @nodes_irq: Stores the IRQ added from overlay dtb.
> + * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
> + * @num_nodes: Stores total number of nodes in overlay dtb.
> + */
> +struct overlay_track {
> +    struct list_head entry;
> +    struct dt_device_node *dt_host_new;
> +    void *fdt;
> +    void *overlay_fdt;
> +    unsigned long *nodes_address;
> +    unsigned int num_nodes;
> +};
> +
> +struct xen_sysctl_dt_overlay;
> +
> +#ifdef CONFIG_OVERLAY_DTB
> +long dt_sysctl(struct xen_sysctl_dt_overlay *op);
> +#else
> +static inline long dt_sysctl(struct xen_sysctl_dt_overlay *op)
> +{
> +    return -ENOSYS;

Pretty certainly -EOPNOTSUPP.

Jan

