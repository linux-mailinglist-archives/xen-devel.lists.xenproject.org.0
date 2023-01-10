Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D7664640
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 17:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474836.736226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHdc-0004yH-0K; Tue, 10 Jan 2023 16:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474836.736226; Tue, 10 Jan 2023 16:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHdb-0004v0-TG; Tue, 10 Jan 2023 16:38:11 +0000
Received: by outflank-mailman (input) for mailman id 474836;
 Tue, 10 Jan 2023 16:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFHda-0004ta-4B
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 16:38:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29d26e67-9105-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 17:38:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8048.eurprd04.prod.outlook.com (2603:10a6:102:c4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:38:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:38:06 +0000
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
X-Inumbo-ID: 29d26e67-9105-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVJo87biQRb3gIcZULgx52UfzVo2zJWsn+kRGQBsCGXivOQr9fipfs9p5doVHk8SV5NKLQB3thYMfXSb90Cg1qJJiT1HO4GQP44HaZ6tAB4m3by76BLeNNRAX02bpdKSUjfwMvDqKPC5VlFCvElYtbtSAwRMmHhEbThjaUsO6O/ezzoZlFAEkmzuXL0cN/q7N/cyfQYrbERLZFY1w69yvQ5w1NZQR9YJwBjw21e5gzS84lZFqBXaz4vN+xeGdsxqjiEZ6JLq1tp4PNkYZDeNohqGpXxcFV25RCPPG60AMO5h4xA5RvD3+VvLiMXGHtyRD6ojaJpbfWZlRFOl68mIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCkOyY0jrVWt+HO5L1tUBGiWYJiPHwjxrjh8Tz7gjjc=;
 b=h4v5CcAF784LOKKT2eAqpP49Xskv7HkQS992tbzz1kHye+1tL8UY73Narsrblv0d/0+6TPxC7S8e1qEXsJ+kgAJE9vaLchsE3d91KA4NlxSARBjsRDohsooTwyYAcaEx8PBoP8V8fA9LmSfYbsD9aou8kgNMaMYqQfIenDzGk1qL3ZPA2rpyzLi5OhCbC+vFoNKteTfFNRiNawzNNLYO2mtciNQuLiqIO4w0MiMatpXPq9L7hep2Rd03o7UZZ0F/KzKnpw3PAYJR0P476XmVSvVPgSBfdXHra3v4dcstXoHgrjthx4jN562gZUz9NMC52ZO6jOwRPBc0wRbFEDDfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCkOyY0jrVWt+HO5L1tUBGiWYJiPHwjxrjh8Tz7gjjc=;
 b=ceUicv+mgLVAfCBk6ahpvCcI1ENvx7k7+gbQBECuVhGLxg/uAVrqpP1BAYKkHK+7EbY4vJxuRSgJ9oCLe/cln7ZkQscGBKspX7aPWiTC7kz59Cd1qlLPC/M7zbHWvQK64JjWwBCqgiXtIxAYmZ3xIicmpI/G+PQpW9YSh6ld/gQIJ4FoL9DL1A6ZNQVhoRBjBmRAcB/IzatQxeVVG2258lbX0x/6dRnpD3oBinnifnJZH8xqEH/IeyIcUY0/OnH7J8LQzBDg9k8LOV2wAbX6jTJenRb0QcdsSgP5ffe5J65zfb/IWxpjwV70wpGBAT0AqjaGCBftZStIUyU43yeM+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e32ffa1-1499-f9cd-7ca8-f9493b1269cb@suse.com>
Date: Tue, 10 Jan 2023 17:38:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/17] xen/arm: implement helpers to get and update
 NUMA status
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110084930.1095203-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: db4e456d-7419-4215-139f-08daf3290c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KyS4bCLfEWqUCkvFbLru780/hpq16fmj7CDKtBHdPjUMpzTRgVB8O2t5MFdmANTJkDE3s7oD4Q6zdIexQli34vC2Gy46qfzLz5sxktdfvR5YOWDXSGSpFQnPiOTuQ6Rj2fYC+WJlVN3bh6emD/YhGEkrCyP/KjUhY953kkmkp878+CrWr9gVZ89BSk6K0slnws2DiVysbcPiu3kheeH1EcgNflhcaIaLtHHO2oYFxeEmTSrH/bXJc/EIntbDlxgAYr3WugBXWDaSGzVsSJtNr+ogym4J2MmQ3yFll6ofIH8ITEWj6e7RmN/OAkCCG1WO2fNtO0a0zj4YZyZz4R5+gXFii05uMoA+FOm8e+sKN9YBosjLqYv0xO1gXR60uDnGY/vFjdXfgjHta1RERaa2UR8j0ptYWO3d+gkVS8Y+h2UEKs/OBD7nt6WUMl/W1gHSQ+4OrFy/uJakrOPwhZlpvcyo1uK73/2SenxLy6RP3MImLvY8rOLghCAqBmk+hKbNdEnkTbxBFjsS86Y6U9wX7HOS6IyIpiVzkzx08FsSBwsgNoz5i/QYlKyL32RCEiZpgbJ1uhGlpaYYYLnflisRuiQu7nA33K4n5cs0kLF9Q522cWwQaKahz2iPkD/B+D3DWDZ5NLrD32eg2IIrPVsMrBKYFlsomZDS8ppJH5PohVQYtsjId5w/mlebqUAnpsf9hi4saRTb+Kc03QULWGN0ZXmlO2SnpOZxyp/Vt8LjqpX8EbJY7+0Wh8zppCN2FPv12UsdOIMduZh1174S4+eTEKfdNd3jSWZ8G6wBcBxJZas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199015)(2906002)(83380400001)(2616005)(7416002)(66476007)(66556008)(6916009)(5660300002)(66946007)(6666004)(53546011)(8936002)(26005)(186003)(36756003)(6506007)(6512007)(31686004)(478600001)(38100700002)(6486002)(54906003)(8676002)(41300700001)(86362001)(316002)(4326008)(31696002)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDlNNU9ZMlJOK0lXbUlwM0p6azlXeG9zcHNhZEtuNTVSTG9pRVNPazVVb0di?=
 =?utf-8?B?S2VVUTZmeGJiZkdmNGVTVklYTWFZU0MzSWlkRitnZkc4ZFJhY3JVZkd3NzBQ?=
 =?utf-8?B?bnM5cFVUNjBLZVBubU5oMlRMWEhsWFFPd1doeGdHK0krWjFRUXMwRVZUNzl2?=
 =?utf-8?B?MnRuUnQrWlJQTFFZdTBnN1Q1VFdPV2pTZlpZSC9uVzYyaHJ1eGZ1K2ZoNFdk?=
 =?utf-8?B?OVZab29zU05OUFgyZzNJVTVhdExJcjFGMXRGbHp6ZFhPWDFiU0RpMVFDQzgr?=
 =?utf-8?B?Y28xTVM1THN2aTZzVkFMeXZaQlgwclhZTkJFdjR0Zno4NGVDazBWVFZybTlH?=
 =?utf-8?B?ZE5WUElzaThkMXF2VTEyRTAybVhXZlhlbDdhbUZyUFpQNXQ2ZTF3WmlwcjdN?=
 =?utf-8?B?VTN4ZHJyMCs1M0x0ZlFXYzl5TGUwdkZkd3Bpa1RFeVZRMmdwNXRjbzdZOEJm?=
 =?utf-8?B?eDNteHhhKzhQZWNkVDl5Q1A4YzVXNUxpdW5sQlVOd3c1aTJvbkx3eGN0Y1V5?=
 =?utf-8?B?SStVWXVKVDRHQ3R2VTZId3pQRkVHTjM0aHAvbDRudWRSQ1pQYmFLNmg4R1Ir?=
 =?utf-8?B?UHN3eDFGRkpSUW0yV1Rnei9tbURVdllxOGxsL2swRFFhdVVyMmFOSHB0cTNK?=
 =?utf-8?B?a0toOGhHR2xIR1pDMkV0Sy9ESkM0QU5UZnBlYy9ZcXQ5OU1ZYWhqR0xYNXVN?=
 =?utf-8?B?eUdCdFAxbm5ZRlJGbjJBRlZJODkvb2dHNWdCazREb3A3OGtKY1lmVWpPMk9r?=
 =?utf-8?B?N0JzRmF5YkJ5VmtyVFhva3NsMkZMYjJ3ajJPWDJMU1lkUnZ2djgrV1YwV1VO?=
 =?utf-8?B?QldsOVJXSVRzWFlEU3lTVjU3T0lWRHNoNERoZ0RDbyt5RHczZGhlTWt0TVZh?=
 =?utf-8?B?Um5XY1NkRmd5bXpjcnJHNnNyNDJYY21pZUQ0RDF2YUpQNlVEdXlUTGdCVVd6?=
 =?utf-8?B?TU13SDhnc3h6VGUvb3hBTmZaN2V4d01WMExsWFE1cUxyUzR0VjVER2piZ0tj?=
 =?utf-8?B?WlZUOGRNT2NBRmZBMExvS2dVQndHV09pd1VUVUoxZkt5ZlVHN3BseWphZDMy?=
 =?utf-8?B?aklYNldtTlJ3ZGdzQTdFbFc1RTEzUHRPSDRsM0hyckdpa1NhNjEzazJOdXZj?=
 =?utf-8?B?YlpKZ1V3NkhCWGE1K2V0TkVqM1NEZFlMeXltVk9qY0pzcTBab3JucExFMU1O?=
 =?utf-8?B?c3d3Y1VTbzFBbVNTYmQ5Ykh3cmNvQ1I1RHA4b3VqeXQ4aEZpV3ROUmg1TkJB?=
 =?utf-8?B?OE4wOWdFazVPdzhNSGVaZitZNzdFVjJoSUJFajdMWFB1VVNWVmhjejBaUlhO?=
 =?utf-8?B?a29BZkU0YkZXUFdiSjEzRldWajc3YVRiMFhPcmpIZ2xNcDBNWWxpQW5zVWZ1?=
 =?utf-8?B?b2t5R05BK01uYXJ1OFAwRGJKUVR2VWEyTy9WNXUvYW12S1JLYjNrOXkvTmxM?=
 =?utf-8?B?ZmNabmI5VldMbjBwMTFmaitMMjJrcG40Vnltb29KM2l1eFM1TzZidlJwS2hP?=
 =?utf-8?B?MFA1UGNYcVo3dm5XdXRsK09pVnlQREdPNnpHR2t2bFAybkRDanR0M2tCcXll?=
 =?utf-8?B?eVZnU1hkdDJJVFpnTUR1TkJzU3hER1c3cG4vV0FwVE1ONGt2QlJXbXhkSmVF?=
 =?utf-8?B?K0VDWWsvU0Nld3ZMQ1U3SEQ1MXJ1NWhSalRTb0tsbTFRS1I3MUZsL2dEdFZl?=
 =?utf-8?B?ZkhJMkM1eHBNLzBEQVpOMTRsRDhUaW00UnZFR3o3NmVnU3U0VFhtTjQ5TDc3?=
 =?utf-8?B?cHJnRUY4enJOTi9taCtWU3d4T2UrOFFFSm5vYjFVazh3R3VXNFRFazBHOWdR?=
 =?utf-8?B?U0FDZ0d0YndibWJMZXJzQ042SEh4SG5vS1VDOUJVbXlsZmRxdXByM3hRbWd4?=
 =?utf-8?B?YndDb1dRa1RyclIvc3c2cWZuTVJLTEJ5RTRFcHBIM2lqcWNXWjFEU2NFN0Nv?=
 =?utf-8?B?aXhBdmd4QnN2S3VUTGxHYmZOQytwSVhPM0pnbHR0NXFGNllMdkE5KzgvS2lk?=
 =?utf-8?B?Ymh3azVaN1VNbWJmRW1kdFc1eVpzVzdiVHhXeUN1UXBNY0xTdzVmdXBuRzRh?=
 =?utf-8?B?bklVUnZNODBCTHZqZlBjcFlmdVFOVm1NNGxQd3p4eTVjTTBqMWNCZ1J6UjNj?=
 =?utf-8?Q?82U6jkcX209hRhVhfSWNR33KN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4e456d-7419-4215-139f-08daf3290c86
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:38:06.1293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hoTFKYwW6voa7wUCykcL1/kpS2uH/CEKC0HCjYu5FZNpXYCicyEobutxzZQECHMXHrUjlrjqhmnF2b6pXIEsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8048

On 10.01.2023 09:49, Wei Chen wrote:
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -22,6 +22,12 @@ typedef u8 nodeid_t;
>   */
>  #define NR_NODE_MEMBLKS NR_MEM_BANKS
>  
> +enum dt_numa_status {
> +    DT_NUMA_INIT,

I don't see any use of this. I also think the name isn't good, as INIT
can be taken for "initializer" as well as "initialized". Suggesting an
alternative would require knowing what the future plans with this are;
right now ...

> +    DT_NUMA_ON,
> +    DT_NUMA_OFF,
> +};

... the other two are also used only in a single file, at which point
their placing in a header is also questionable.

> --- /dev/null
> +++ b/xen/arch/arm/numa.c
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Arm Architecture support layer for NUMA.
> + *
> + * Copyright (C) 2021 Arm Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +#include <xen/init.h>
> +#include <xen/numa.h>
> +
> +static enum dt_numa_status __read_mostly device_tree_numa;

__ro_after_init?

> --- a/xen/arch/x86/include/asm/numa.h
> +++ b/xen/arch/x86/include/asm/numa.h
> @@ -12,7 +12,6 @@ extern unsigned int numa_node_to_arch_nid(nodeid_t n);
>  
>  #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
>  
> -extern bool numa_disabled(void);
>  extern nodeid_t setup_node(unsigned int pxm);
>  extern void srat_detect_node(int cpu);
>  
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -55,6 +55,7 @@ extern void numa_init_array(void);
>  extern void numa_set_node(unsigned int cpu, nodeid_t node);
>  extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
>  extern void numa_fw_bad(void);
> +extern bool numa_disabled(void);
>  
>  extern int arch_numa_setup(const char *opt);
>  extern bool arch_numa_unavailable(void);

How is this movement of a declaration related to the subject of the patch?

Jan

