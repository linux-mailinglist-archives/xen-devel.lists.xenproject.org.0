Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD446F5281
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 10:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529013.822900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7RF-0000x7-07; Wed, 03 May 2023 08:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529013.822900; Wed, 03 May 2023 08:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7RE-0000vR-TU; Wed, 03 May 2023 08:02:12 +0000
Received: by outflank-mailman (input) for mailman id 529013;
 Wed, 03 May 2023 08:02:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu7RD-0000vH-Ft
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 08:02:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd75bf2c-e988-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 10:02:09 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB9977.eurprd04.prod.outlook.com (2603:10a6:800:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Wed, 3 May
 2023 08:02:06 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 08:02:06 +0000
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
X-Inumbo-ID: cd75bf2c-e988-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmLCN5c06VUAzbyjhWOYR4eFmmS8TyCVRoJCKrCDV42a7R0YaJlMnC0hUwgfxIK3o1h6suRH1wP0dFup4lpIT+H+dbBDrWDc8JXI7D7hdxBKhuC4Xyng17i9Pd2vGi5aqKJNbNOP3X/Xd2LnxB+G5B6LUhw0VuElnW75pH0XJbJHGSjRRBj0bUy/WfRgw5qfwhaztVLli0fcT+LjjlrscwO/UMK6IfGodKnmxxMndk78c2p4B+lK9iDedYtPBlGYbK7tsWYNfzAWZpTY6rzHAj8Lq125ao3+UL+qPUJy+flyMDcnosTIbssTO6epSNmTUlpHbZCErNjsnIFL/ZZXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XxwCWxGBDJ9HjygqjC1krQMtwlO2IPEWApQaNDq2/k=;
 b=hw4Om+hBEv1rQlltg6NlspKK4fq9dQkYU/MoConA7RP4HX5YPMMq5b4L3eviyP+C5F6CsX78KeRtYRaCPek9eLEWn/KPIGw3L9b+heWuYJGOWsGuZRUz49/Uz2DpsaqHNJ3Jgzj52dmX8ixbzV+7rsfikFCXeZlAvEQc1MQMAWhodmTYr6TrXtVxeEMhlMA2E37cOSNX6iCNSOtFKYkIg0hjV0zp9U1PKluHPHyEVmfhrag0kgjEned7D75I1sDJO4GNnbbzWQCe3pha1cT0UT/xH++X2OMg781oAbJC3U1eU/UOUrHJoOHqZhdyzg7kmoU4cSP+NqiPTCe4LC1XRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XxwCWxGBDJ9HjygqjC1krQMtwlO2IPEWApQaNDq2/k=;
 b=dwYShb5MRg7YFbxstPKVZQKCoPdfRZeLLX0vLtT0W5Om+U0M6gNcql7F67ZvIKoszpPGhHkbzBhOdZ0+KK9/Wo6FqSGn0+GPB1wDe5+2rtI6XTPmPHwwo1GNuV0AwCN7uKEITUGRLyhyiRbcfSth6cPma7JbmAwYkcwZ51fphal4QfLUdH0h6i8FzC/aJbjk75WoiByk7deZnHym/RnKt15xCXtuLPskVVd8JpYy+UMtnl8EPfCApgGphmBfLC9zWw2H1iYWwDF995FdGSLuq4QHHZTWhjs+p4eid1WknO1bmYUoNqaP8Q3pIY6C2Dl7o7aoVS1JGI+gZokvcTmOhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83a1b85b-ad6e-475f-41fb-9d3ff896d86c@suse.com>
Date: Wed, 3 May 2023 10:02:04 +0200
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
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB9977:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3b8679-072d-449c-682e-08db4bacafd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HqqQ5e7WcyI5bytZHxYHbsChOpxEG3GapNkcR8M8yhIzPBgNa3rIuWeCGdQF6zDRywxVAACC50olUA9So7RKIj9DnWD3PqONqNDqsIxgVorSE+swWnPZzOmAFB03EPyLRRj41dZXW9sVd+E4TVBgp2vDOKaCh6mKrvKA4XVM51DI1nRJA6z9M+N/cgMv8G51Q6aSP1gUdwF4aOF0qmpYa06RUaMSkcLBUK4Z28cFun9ZpE41mdVCbD593er/ExJXbNJ9HDWajSf7OS3BwgSEnDplGJt0qsq4J21+hUWcETVG8cBjjpX2sti5il6m/NUjh+fO472JAafWD9ukKojmj1annvrUmLhiGGl4WfxBTLRuVuIyZMBp6bO/W0DF4v/xHYxdrBkOLCDVijruJLOW3TmiuEg5gt+zpEG+lgjrExarh7VdGbLkKJm0RZ3xSS01Xe08Ig6ah5aIMDVRzvKwQN0tVz2kw8E+pXMzteZAAxyW2kaTX5F8TROZrsQ6tkv1zn0hSkJkqOsK0k1YWasSJBm01395SYx4qaTsHRVQHwx6QxuShy8M9lwQ9IiwSbja4dnVmlFmyXOKSBIUd1PrN2opUEERsOuyPfRh8xvb0s1K/NHf0wbIpgSr8xYp/5gGeEhJ8tcTj3fAAxVuHQjyyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199021)(86362001)(31696002)(2616005)(83380400001)(5660300002)(478600001)(41300700001)(8936002)(8676002)(4326008)(38100700002)(66476007)(66556008)(6916009)(6486002)(54906003)(66946007)(7416002)(31686004)(36756003)(316002)(26005)(6506007)(53546011)(186003)(2906002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmhQTVFKOHBqd0s3RDgxcXZqeG5jbFNzRTRMY0M3bUpmcW9Dc1QzNnkrczZ3?=
 =?utf-8?B?b2JycW9Jc205SjM4TWlpYW1JRFBHc2NDOUE0cHlJZEdVb0RPWUVqSWt6eUR2?=
 =?utf-8?B?azJIaHdjVkdaT3ZxcmFpNUxkWm1OL3c3U3FwamFkenRVMWFkbEFjQWhoWlB4?=
 =?utf-8?B?NXZEV01EKzJkTEsxNjhEL1lhVXlUa2JHWXFNT3hFaDlJRzhBdURhdmxQSnlu?=
 =?utf-8?B?c0tmSFExQ2JVQnRiYU1aTyszQXprVExnSERVQWlqRW1QaVY1bkVMMUJZK0FG?=
 =?utf-8?B?enFoRVJld2JQSWdHM0RRVHA4cjd0TFBkaDNKL2JLeURXaUpjUjNCdnlwRmVQ?=
 =?utf-8?B?V0FWQmRCWWxxU3RleGZ2b3pRVEkyMmZOMFg0d3FadkxFSktJTjJQTzRrb053?=
 =?utf-8?B?cE94OVRScllrOWVpSEVxMUdyTDhLSmgxb1FveHE0aFA3RWIvS2dGelVkY3FN?=
 =?utf-8?B?V0lzcTNsS0lTVjRadjIyS3B3Q01zN0NkOUUvN1grNDNLVEk2NjhnQnRUTUFG?=
 =?utf-8?B?Q2FKdkJ2Ris2NEsvTzZMNE82UTlHQ0dVM2xJTUNDSjRpUmc1UCt4NHZVSnEz?=
 =?utf-8?B?ZWJub0JqZEVzZG5RTlRoTEZiY1BYYVBaWW8rTzZqQTJyUXdMejd6anVFenVS?=
 =?utf-8?B?RTIyZVNKN2hnRDBkdm9NTHAvalNBY01Vbjk0WUVqenRSUjBZT2o3ZUQ4L3dk?=
 =?utf-8?B?eUJKdW15TS92YTYxQVZNZjJIZ0xVL1llM3ZrbnhnSGVwVEVXQURVT2ZHalVG?=
 =?utf-8?B?VUFRamJFSzNMS0p4Q0gvNklQRXZwclJSdFo3ckVJeHFjeEJGQ3J6L2d5L3gz?=
 =?utf-8?B?all2RWNTWDFiWGxDem9GN0p5QS9hbUwzd2pQZnd3STl3NlgvUWhMWUZaRk1J?=
 =?utf-8?B?TlczNk9uUDVCNEE1Ym5NYlIybFlaQXBkUEp0R2l1S3VIMEZHbGw3dDBGZWdx?=
 =?utf-8?B?dFJNRjk1VytrUWMvZEpCYitLK0RsZ2NUMmdNT1JmeGV2U1hSY0s2VzIxdlR1?=
 =?utf-8?B?T0NXOHQ1eFNYNmlJS2ZwTlJUczBMcG8rZXBtMUx0N1BuY0o1T3Y3ell2Sndx?=
 =?utf-8?B?akpQVmtHS1hFeUJ1WTV4NU9aM21xOUdFYzdiaXg5Vy9GOHlaMmpqU2dJZDFl?=
 =?utf-8?B?M093V0pjd0w0ZEFZK1M5TmxYaFVXZ2xPS1dVNXU0b0l6cS80cmpJWXE2RlpW?=
 =?utf-8?B?RTYzNERmT1ZrOUdZL0hBcWtvMGlMRkd6bEQ2cUw2a3hML3krL2V6aEJxSlJ5?=
 =?utf-8?B?My9kN1BUNkg4ODBKT21xTEtBVENzSDV2TkhOMTBkUUZZVy9ucG1GWVJXa0dl?=
 =?utf-8?B?SERNbTdySTV3RnNYZXRrWWsrVmFMTVZFZFJVZ3FUTnp6MCs4VHlpdXowMURz?=
 =?utf-8?B?eDJzRWRVdUV2cHZTbVZDYXFDQUxLUzcvWXhHNGs0d05qaGY3MVZtSFpuVURR?=
 =?utf-8?B?YmIxWDc3OGRZQ1NqYXFaaGxBVmt0dmszQTE4MFlXUmUzcXphbXNwSmdOSHhH?=
 =?utf-8?B?T0tETXJRa0R4TUtNQlU2MFFIekU1N0VrSldSbUdrVUZpaWNqdUtCSlBkbW94?=
 =?utf-8?B?bUVRWm1oMkRCVXFKYzJLTndtaTdJQUszMWhqclk0bGtoaVJ1RU94TXR4cUZI?=
 =?utf-8?B?amJNaW50WVJkWmdJeFpDalQ4THNQcGZQMkpzdUJkZDF0UzA2Tk9UbXFMSVZS?=
 =?utf-8?B?bWx5WGQ0a0pyTHJUWXdsV2tIQWRNY1p1Y3JUMzV5UEp2TkNOdXRKbTZMcG5T?=
 =?utf-8?B?UkFoNVl6TUQwenZacjlJc2IvQmpvbmxRUWhTb3lmYVlPUk9mbmdTZ2FIeE4w?=
 =?utf-8?B?M2lKSFZGemdOU3VMeVlCamdkU25zQXA0K3BHamFQMmJMaC82TDd1Z1hNSXVw?=
 =?utf-8?B?YnhaU0ZUOTJIaytUb0VySU1XUk5wNFVmNmFjMHRiS0psN3hDcUM2Y0tUWDVF?=
 =?utf-8?B?R3dwRWNnOWJ4ZjFyc1Rpb3hUeU1XbXNJV2l4clB3Wi9EMUJkd08zRmVNeGJ1?=
 =?utf-8?B?QTI2VWFIRXFMWHhoV2xxeHNzV3oxS2NlZ2NFdjMzTnlQdjZ0ZEJMczZPaWdz?=
 =?utf-8?B?VS93RGZnZldxWUkyQ3N4STNyTTJUbmszeGdVeE94VmtWWTNCR1dmZjE1Rlhs?=
 =?utf-8?Q?fD+RiU8S4LrTeTM/+nWbLArEa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3b8679-072d-449c-682e-08db4bacafd6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 08:02:06.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ux4OGw/yrdQcyIn7hFS+ExpqCcdcN/aYPM4uSN0NMja2/0McON/Yo+IjXfj7P99IYBrIybPNJkO6PR+l66BaoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9977

On 03.05.2023 01:36, Vikram Garhwal wrote:
> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
> device tree overlay.
> 
> xl dt-overlay remove file.dtbo:
>     Removes all the nodes in a given dtbo.
>     First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
>     in dt_host and delete the device node entries from dt_host.
> 
>     The nodes get removed only if it is not used by any of dom0 or domio.
> 
> Also, added overlay_track struct to keep the track of added node through device
> tree overlay. overlay_track has dt_host_new which is unflattened form of updated
> fdt and name of overlay nodes. When a node is removed, we also free the memory
> used by overlay_track for the particular overlay node.
> 
> Nested overlay removal is supported in sequential manner only i.e. if
> overlay_child nests under overlay_parent, it is assumed that user first removes
> overlay_child and then removes overlay_parent.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/arch/arm/sysctl.c        |  16 +-
>  xen/common/Makefile          |   1 +
>  xen/common/dt-overlay.c      | 419 +++++++++++++++++++++++++++++++++++
>  xen/include/public/sysctl.h  |  23 ++
>  xen/include/xen/dt-overlay.h |  58 +++++
>  5 files changed, 516 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/dt-overlay.c
>  create mode 100644 xen/include/xen/dt-overlay.h

Is it possible that on the next patch I and other REST maintainers are Cc-ed
merely because at this point of introducing the two new files they're not
added to (perhaps) the DEVICE TREE section of ./MAINTAINERS right away?

Jan

