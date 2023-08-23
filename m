Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C821785282
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 10:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589037.920743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYj1S-0007H7-Pa; Wed, 23 Aug 2023 08:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589037.920743; Wed, 23 Aug 2023 08:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYj1S-0007E7-Lz; Wed, 23 Aug 2023 08:15:26 +0000
Received: by outflank-mailman (input) for mailman id 589037;
 Wed, 23 Aug 2023 08:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYj1R-0007Dl-8B
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 08:15:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3552aac9-418d-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 10:15:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 08:15:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 08:15:21 +0000
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
X-Inumbo-ID: 3552aac9-418d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBrWTeEvaxpHgQkA29JXKSvF22csSXcZ+2C0r6DPUiNKcKSnxwoVAeEIo+lnKgcW0bb8t1VBVil7blRi78Rc0V/A4pd8fZXCdZ2F+wGhduDryFFYBQwpPHMh8WR9dygChYFbo8FN/2Ag39Fy6shfMRWEss5TIOLqqc4L6iRyRO/1//N83bgAUDr55ykzM03YPqm8pJGSssNbQW9k81sZpmb4V03In84RoRDUd49ZAyH4zsfjbOkg3Sb0+nI8IKo5vcyGWkRmlb0/u/lredmAYGIBCyyN1n/QTCYSV0Mzz2OTLWspGEnsM7qVehJR8GUepgf0HCeG67NW0TRR3wr3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcYt0Sz6AdMExX7RMtFa6+Z83TI09FhfagIrtxUX9D0=;
 b=QHJBOf9Brh2l/sBQEHogBDx9x5DhKW5SbdwuFnIpCXRJBud7Vvy00NCsNnPigitRX8e2lV7RLIPFTtEnaTVSzDJCR1yAb5bU5Ym2VxB+UwwWDRMxZOvSt8EhrkU1OX5tVNfUUB38NwL+t0y5W+ZOUGBCNJM8rX9PxBATJpWpYB4uqUceVxTAC62UPLTJeU38nKdInGzLFWKP5z0Ebs8HYJ27NWbl9aXxXfCBLcOavW+POLqXZAFE4e7VIhzzc/1fkO4ApQ45/5NoDhgqY0nfRlrmUd73f1tUg68GJsvLqg7bw8PrM2Y+fLN1s43ZUSVU4SUK9Hd0bhVoIJ6SG4wfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcYt0Sz6AdMExX7RMtFa6+Z83TI09FhfagIrtxUX9D0=;
 b=uknzyYol9JrV4n5aUCF2OjkoRe+YEQcMnl/G/HEPzK4XFZNRNbkYC+4kvqSEe5bNDQ2KnBBAh0pMSCWejuOiXmupZxLESI5IAKAfq0KaepXe6ryBmuvF1J+UN0e0Fc+Zj3WILvmY/ZyuzkpkrLe5uO5nvrSd/ZLFclQHBMxM7QPLtteHTeo1UJHKOTsogo569efGiXZ0aE4VVPez7a0HhzQfBdA8xlFtx2qjifRt18vQRSbDDIvtazIpaQO0XzE8ua+IuB8oXjkGrRQZeDd4AEMKdjFCzZx2nJyrp5hiRZLP2qECPIpC3M7nb+9nYMlMv/+KZh/GQlbNsrC4bxrarA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd594b48-365e-0bee-aaa6-f413fc93267f@suse.com>
Date: Wed, 23 Aug 2023 10:15:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 00/13] xen: address violations of MISRA C:2012 Rule
 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f99c43d-6875-448c-76fc-08dba3b117d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jma4XClRtZF4xGP6sjHYr4gUn3GcEH+DTTQrbBZJ6IotQ7GpArnTEB0vuKNAQW9oGUKI1a2lxFWGMng+dZ9IqO08CruaDoJ0dc/+rJNMM+e1BFjU4lEEQS4JQHc2rTnvhbgs28X8yivxb5ZJcoQbAPrc1SoU/7Gyz4eWnSkT756k3NlHkQ1cUxhMzuh50yStGO494ihXnT1hcn1hN6cXo+QnnANYu6kHdHbxtf0EU3cvktioWRWNleT0DZeaDqIZdehJjek1erxRKVUba/g8D03D9VnhoH1q+JZCeIPgTnKDCqqrppveW2CpyTx8kLp0K6HDxT40NZrv9TXwpsLEZh/SU4NiLFU9b+VrvBkubDoyYZmadIcTNB5eTulgm1uu+KmHu1SR7p3pusFjYfEXIH5Jj9MWISpVxpBE+lte2zgCjHHNysLbz2hBAxosGzbI/kamPWAUdrlt1HvNyix9VVY4KWr7FRV/Ga2ydRjNng4kFZpWyMpKlqv2y7c85UPHZkRBKKwqvxvvmjP678vZoZPaaAKhIQzumhLiRVxs/5/Jk8ugkr9Es2nhpbuGBVYsXId7caw83fh+DaMkF6JOCC+qOYpC+vzsBqQz+mOOGuc8RmQHGwvcJFmBcieEakV2jbOrK6sq3IvjPOoVzVyyKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199024)(186009)(1800799009)(36756003)(31686004)(31696002)(478600001)(86362001)(6486002)(66556008)(6506007)(316002)(66476007)(6916009)(54906003)(6666004)(66946007)(53546011)(41300700001)(6512007)(38100700002)(8676002)(8936002)(4326008)(5660300002)(26005)(2616005)(7416002)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnJsWjI4VjFBZ3hrTEJCTmtqc3FKdFpiaGJINjBFUWsrVW52cG85UkFRcndS?=
 =?utf-8?B?SER5bG4vY3RVcTFnZk1wUDRONnduR1dwMkZkNmFtQlpueFUwOFA0d3E5Nk43?=
 =?utf-8?B?MGh6MnpEUVZENjFrVUNBRVhFc3V0Rmtpb1ptWHJENGh5MW1oRkNmdFh5NHF2?=
 =?utf-8?B?TlBXRmRkZENhd2VTYXAxK3lNVjUvSHRPMkRqeEUxUGtnQkhJa3FodWFEMGxn?=
 =?utf-8?B?UDMxVVBZdEJpbTQ3YWRUZnZMcGhpcWRXeUxLeXVIazFpYTBaZ1BIdzFyckVT?=
 =?utf-8?B?T3hWSWpYZktWdFkwSjQwVk1ST3pQa3Q0MVhIWEZjb014OHdFOFZSVzNkVWNB?=
 =?utf-8?B?MGFxMlh2R05YYndpTjJTQmk0dEw3RnNFU3hYNDd4TDJUQkppQWZqdHVBMDVi?=
 =?utf-8?B?TWp6Y0FpQzl0YnVleVd2TCtsamJ5TUpyOE51cHdKbVY3d0lMYmZodmNCazh0?=
 =?utf-8?B?Z3BuSmxvWUJYU2lYU1dXKzZBNjZMWi9hRytBRDNaL0FaL2dxUDBKTFZnZFlJ?=
 =?utf-8?B?M0toekpmQVBqMkFJOG12SWZTN25iNUtobW9malZRRm91TEpyaHNBWldqSlEx?=
 =?utf-8?B?YW5ybnhENTZsMU5SNkxUaHpHVHE3TDBvby8yY0JKU0d6ZmMxWndSUnZuTkF4?=
 =?utf-8?B?Q3lYc2I3d1lNUGdhdGptQ0FxSFJ1N3pmaDVRZ3lHeVk2WDZKSUFEN0ROR284?=
 =?utf-8?B?eitEYmhiNTN2bHlodjBPZVZFbmlmbHpIVVpmeUw5dHRyVmg2Y3FraE9XOFQw?=
 =?utf-8?B?bVRBbUVCRXQvNlNCNE1oeHJFdUdrZXBkd2VlNisrMjhVZHdPaG8yMU52a3Vs?=
 =?utf-8?B?cTd0bjNmSUU4cFpaWkhwb0pPUUpkanBERWRDa3BwcUIrd2ttSHIwS1dlb2hr?=
 =?utf-8?B?WTF2WVZ5Y2UzL0tvemh5OEovSTY3VXo3UXRaMVhVQnZLMkp6YnJ4ck9PRTZY?=
 =?utf-8?B?ZFFNNGY5QTNsekVWRVk0OW5lWDlnVTllcjZnc0NSQ1J2b1c1VVdDLytqODhP?=
 =?utf-8?B?TExpbllhTXJXWmxJMUJGdTBidnJ6VDZnZ01hK1FLT1RJZmRqUWNBREVma3lq?=
 =?utf-8?B?a2MwNGZmRjNab3NrWHBmdlhTc3hQMG9ua0VkR1ZjWndwS0YwajVVOFQ4d0lh?=
 =?utf-8?B?MUpZTURna0NndjV0QjFSV01OT1ljNXpsUC8zbEJ3MTVGdW5HYVRCamxpS3lt?=
 =?utf-8?B?c0RqNkMrQ3dUZk9NaTdWMU1xSzJXTld1OW55djZoeFBJbStFWUJST3NvQ05X?=
 =?utf-8?B?WFgvZnJEK09SUURWa2RlK1pKNGJFZnZHTGhKamJVcWxuSXRTa3NtY0tXNURl?=
 =?utf-8?B?TjRVdUNURkJqUUdHa3VNeDc5aXY2Yzl0R3B5cUJIRkMwUGVpdzNXbXYzdTlT?=
 =?utf-8?B?QVZRZDl5UVdPcEJ0V3pVWUQxY1lxVVliYTNzTnduTklpSEVtUGdSL0RkRCts?=
 =?utf-8?B?a0cwSlJybndYeFd3MFNwTzlKTWdNblh6THZoY0h0SlJ1WEJML3dGdy90cGNV?=
 =?utf-8?B?cmVlTFMvZDJLT3FzSnZFLy9EeTJ0RlU2cGhnbVd3MWhqL3hXRXVJbHA5K2hq?=
 =?utf-8?B?bFJ5NCtGRHBKQmhhL2pVVThNQk1QamlranVHWlY4clFoWk9HYUcyR0ZVNUJO?=
 =?utf-8?B?NlVWN1FjN3lxVDFPUkhtSXR5aWRmRkJZMWdzY1EwVnEzQ0NFY1BpRmwrczBF?=
 =?utf-8?B?SU5ZYW50eTl2elUwZ1pzYUhRZElMang2TFl2VTByMG5KU1dyb21LTHVJRHBI?=
 =?utf-8?B?Q1R6VEV6bUVOT3J1c1FCanYwcGZHL2U4NGR0aFNlNENKN1NQb2dzZFBVTThn?=
 =?utf-8?B?RXFXYmo4NnZVaEVUUUNOdkJJNVE4cDFTZllyMXhIYXBlOGlnMmFISUtyQnEw?=
 =?utf-8?B?dGttY2kzU0F1VnBOU3VTM3VUNjNUQ0lDblcrUmpQNUJqcnhVb28zN2x2N0pX?=
 =?utf-8?B?dW4wZklkSnFxenQyQ1RTdVNZVUdSSTlid2haVE9GckU2SWlQVFladmlQZk9a?=
 =?utf-8?B?NEZrTmIzbGdMQU92RFhJdnk2SGlXMDZTYzJVTGNFOFFMMm00b3VXNm43UDdl?=
 =?utf-8?B?ajlWVHc2aGhsR2RzUWErVU9CQnFuNHVTN2xyRjhGTitMaUJaL0FuTzNnc0lD?=
 =?utf-8?Q?4Io7MqPpmjRCeXbzb290J3EUH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f99c43d-6875-448c-76fc-08dba3b117d9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 08:15:20.9314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTXZQEirbY4oxdLf331xY7kmJMgr45xFE7boOp0j0tqzp7XJjPtqz43ztZVJGxstKxCVOULVYdKcQWwtcN4bQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709

On 03.08.2023 12:22, Simone Ballarin wrote:
> This series aims to address some violations ofMISRA C:2012 Rule 7.3:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> This patch replaces "l" suffixes with "L", to comply with the rule.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> Gianluca Luparini (13):
>   AMD/IOMMU: address violations of MISRA C:2012 Rule 7.3
>   x86/svm: address violations of MISRA C:2012 Rule 7.3
>   xen/arm: address violations of MISRA C:2012 Rule 7.3
>   x86/IOMMU: address violations of MISRA C:2012 Rule 7.3
>   xen/ioreq: address violations of MISRA C:2012 Rule 7.3
>   xen/mem_access: address violations of MISRA C:2012 Rule 7.3
>   xen/vpci: address violations of MISRA C:2012 Rule 7.3
>   xen/hvm: address violations of MISRA C:2012 Rule 7.3
>   x86/mm: address violations of MISRA C:2012 Rule 7.3
>   x86/viridian: address violations of MISRA C:2012 Rule 7.3
>   xen/x86: address violations of MISRA C:2012 Rule 7.3
>   xen/common: address violations of MISRA C:2012 Rule 7.3
>   xen: address violations of MISRA C:2012 Rule 7.3

Since about half the patches are still pending due to missing acks,
just to mention it: It's normally the submitter who is to chase them.

Jan

