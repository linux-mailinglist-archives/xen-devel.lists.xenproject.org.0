Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B98966EDDD6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 10:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525866.817341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDuJ-0002sp-97; Tue, 25 Apr 2023 08:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525866.817341; Tue, 25 Apr 2023 08:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDuJ-0002qu-66; Tue, 25 Apr 2023 08:20:15 +0000
Received: by outflank-mailman (input) for mailman id 525866;
 Tue, 25 Apr 2023 08:20:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prDuH-0002q2-L2
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 08:20:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffeab647-e341-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 10:20:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8392.eurprd04.prod.outlook.com (2603:10a6:102:1c5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 08:20:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 08:20:09 +0000
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
X-Inumbo-ID: ffeab647-e341-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzwqqpXSn2uCxHe9I2vxgBwXwST7+fqG3K6uBNIMLm60UW/gs9RzP9z/TNVGgp4MnzyNKDSVwpICWK9b1F/piPtK1lWw7mB0hnFTDhvqr0YSswZx7IOdIESvKw9n2LLb5d3Xua6MLgXPxafD4ZB3Nkf8Suy0rRBNlfllU2UwmGaktyz0TFQxK5W/GjaKmWALTJq1afCZGfBhU/G/KzR4kGx55aAJdHAkXTf8xkIw/xWM6TYFz64G8kZpkuMdQn5NVf1gxuZb8znKh7O948ynGJykkvIrbeQEPDir2CwSiI1rsUC8oQQqHTn0uUqYpYgPDkmMiVx6aWBHVaZpCOPbMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7D+O7eAjRI6QP88+awE5NKGVnJ/s/oPhYACqqFuXpC4=;
 b=i3GLZu644N4gOMiteDtyw0gqnV3y8xX41xFM83ps+36cbM41JsWS7r3TkdaOTu8SIEefe66HPXCKAd+jNtAx7bLuOBEelwK+btHXO14+GvDM4IDmWH73J++kNlP+O0z+xtH8iiYREdxuHxS4DjAwZLA8ktAXkwEyARojmtWLUMOk7R3Am2eUi13j6rS5UPt4Crb3E+QvUKBTXTSpcFeVRDP6Yi+wmVzTJ31/cSkvk56yIPCo9UKc1e2prgEuFdNywAs2Dd97W+nxDCaEBLXAaXog96RDw9S1F+9tRSujZtnBujiy8D2UdoOJfgDedQTlm9zMGkaPqtBocrz5/mJKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7D+O7eAjRI6QP88+awE5NKGVnJ/s/oPhYACqqFuXpC4=;
 b=zBYCcancDUAIzIQ24cKk0o4eLuAWRxOdqTP44VHhqEstE/iwpshDoZSwsGHmzMVXqbEdg6CJDFBfG+jWE4rHQfmsCqZYLB3Jb1Go6moSC+DTXLODb5ua96fyGmgpsNtBJW4pNmerg5smv2plZ04L4ll9CILd4aharu1dD6G5IkjMp668TTehNAvGgAgrjgQ3min8OWsZ+Uu/WErc/hbXhrO0T6HxRY/oaTXbgqpcBAry4xDZu18Wx99oDb8jzi9UsFt9s54fsvDinoLlECOmIcfnF7OBZ86MqNdzXJXcs/KsTyF6TwhmdrXzDNoCLyJCvODhPIwdwBYj8pNvKt7v4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ce925a1-dadd-79c3-3b0f-c3ab45b1a669@suse.com>
Date: Tue, 25 Apr 2023 10:20:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 07/17] xen/arm: introduce a helper to parse device tree
 processor node
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-8-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230425075655.4037980-8-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 44aff554-7090-4fe7-543d-08db4565e262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xg3S2eA/jkFLMQ0zENmNznv/cCiU8kqe5t2mgROz9gGsGOrrVMcvx2ppg71rODhNWjrOvn5DryBFtbdAE3xdkPouuA7qUU9rDHyFvf5Dsonh7xT5ljDS3IAIJHkQY2e+He4dGHnSuATjpL3hNMxaegG56HUshoKFgLGtgBZSKWuuqToNLTaAyul0KpMdbtI/CYrlFGs8iWB4gUPYNDU911tg2wtEFvxXzgThwvxqg48GnftrL//sN3jDt8oBkaxHjk1rZL5L2im15DN6SQAGiFWFhx97W5B1Ue1HJkkYrtiuEo2BXsev+WmI7WCDIHev+ZpdsiMRB7a0WkZnPAHN0XtGwPF1lu1AuNDgJV12fxg5itMLkVMIiMjCE8sLR6WsZVOsSdUDg/8H6HLFOIoJRdBKlV0sIS4apQ2D4sS1bFaamZsDtXYw8aDOOGGoNqmuiNXT9bQWjRP/cStPqiddGBm6qBLi7ZPItx6PxnqeT6l8hw79acFjKGnt87GF6H3MCdj8bCm/mAEmy6xdkqs3uM9GQ2IThA3EviO4KOO9D3ONZ0PFXKrNieynTDrDGdU61muWox/kT++FdpT6YgmUiMZiIQoUBHqYSMkxPeBWQCLNzrehDfV5AZqsjbM40N/al/8YZ/19ithwuMxn7DfDCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(66556008)(86362001)(83380400001)(26005)(186003)(6506007)(6512007)(53546011)(2616005)(31696002)(38100700002)(316002)(4326008)(6916009)(5660300002)(41300700001)(8936002)(8676002)(6486002)(36756003)(66476007)(66946007)(478600001)(54906003)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RldKNVc1V3E3dTdMV3IxRkZDY1g1YWgyajRCSjBLYlpjYmkzVWpHbHc3Ujlr?=
 =?utf-8?B?RmszalFpV0dITGNVY29teG9hQzlQdEErSjkvVDllaUdybnhVbjN4OXB1YTgy?=
 =?utf-8?B?VkMyUFdlQ1FQdWlUSUUzYmh0MnUydnJxNXRjY1JJYVJsMGZGbHJHd2wxOVkw?=
 =?utf-8?B?YWNPMWNvK0lOMHFwOHIvMU9sVlQvRXBuNDhrdXBhZTNoaUJneWptbnNpRW5N?=
 =?utf-8?B?cGhoMW9rMHNlbFF0M1AyVFlQTzVQK3lFSTNvcDdwNVI0eE9MQU5Pc21ZSXQ5?=
 =?utf-8?B?cFN4V1lSQkhlMU1zZkdRUnhUTUE1eFAvU3E1QXVJckJjamFadEJ4aVg5bnA5?=
 =?utf-8?B?UXZvOU1SR1k1azEydnNrbkpFQjN5c2phS3p5elRMUDdiV1gwOTlydnUxQUQ1?=
 =?utf-8?B?cERYSTFMRDVicHdjdngzbkxuV2JhK0ZNMjMrN0xaTGhRRi8wQ2xOdkc3U0FD?=
 =?utf-8?B?NklCWTBEamlSZTcwa2lpWVduT3pnV2lXOHNsdHdPU2ZuZThMcm55bDR4cWZC?=
 =?utf-8?B?Y1dTdHA1aEZQV01hcG9GOWdiNGN3VUI2Y0RlSHR2b3hVbVcyVlUrNDU5cWpW?=
 =?utf-8?B?c3c4YmJxUTlWK05FbU9DWmZKbmgvY1d3dXYxZlI2Q3JMMStWOENVU1J2K1N1?=
 =?utf-8?B?dnJoR3E3d25oYlRzTkY3cGZNaHBBWU1yVTU1NzBMOFkvRFA3dS9DajBTb0Vm?=
 =?utf-8?B?d29XQk1qMEtwU1FLbk1leFhGVXl1eWNua0VjaDBmWWhlc3NPSkNaZjRZNjEv?=
 =?utf-8?B?MlowcWNMUkd3NWNIeDhXcjdYM21QenBQMEdpdXo5UnkzRjl5UmhRWXVXYkFm?=
 =?utf-8?B?M2diT2V6YVRFeEZUQlVOMUJIMFZUbGZFNHFodUtDK1E0cTBvRGFoMHNlOEJs?=
 =?utf-8?B?UytsNmFJNmx1N3BodFgxRUFaL3pnYjdMUmpNQjQrR3Q3WllBc2dteWxIL3pj?=
 =?utf-8?B?Q2kzRWN3STkxNStPSGZmaGg1Y2hGeFFhS2s1VVpLMUFaeGpnSXdDYWE1aTZ6?=
 =?utf-8?B?R0d6UUVaVGxpbk9sN3Rud01WeXlJNXo4bkxJbWFpdVJpVFFyaTJsWGRpRVdN?=
 =?utf-8?B?WUlJOUd2U3hnNTFWVmxnbjU3VkRmK2xyTVNoTG1kL2drK2EzR1dLOFdIbUI3?=
 =?utf-8?B?a0t2Vjh1b256cktWcWd4KzEwOUZTWk85ZFdTSjFTOENzYnQreEx0cEJ3bFdh?=
 =?utf-8?B?S082SEswUWtSK2FRVXQwNVpRaW82aTFydzRiUGxCN2JJSlViMDBiVlRDbkcy?=
 =?utf-8?B?UkdVRmxkdUdLMnpPaGE4eXE2UHFrRHlsUWdySG9CcnNNaWNSMzlMdUIzUGs4?=
 =?utf-8?B?b2lkeFlIVDRad1FLTEkwNFZNeXdpKzI2SkNHUDQxTlRXUDhha25qOE1WSzJp?=
 =?utf-8?B?WmdwWTZBZWMzN3lwVGs1SVBHZ0N1NWVTZW9rRFBxcU5tWklXR3ZKUUVIeDBO?=
 =?utf-8?B?djlrMUpjOUNqblVpOCtGaWt0ODB1R2pKV1g1QWV0T3p6RFE5eEZTTzBaTVVH?=
 =?utf-8?B?WkVodUszNFQ0UTc4U2RmbVJtS2NYb3hDSkc5SVhsOGRjRVc4Z0R5dUY2RmFF?=
 =?utf-8?B?LzRCL0drNTMxMVQ2blFwSk9DTTR0QWt3ellidWRRaTI0VzB2U2V3RnJycEJT?=
 =?utf-8?B?UnFNdHJyUlpJYjhHaUlnemwvcDhPQS9MU0d2U3dXd0V3ODFwMTYweWRTNVBP?=
 =?utf-8?B?V1plTTBHR2JvTUxRdUVnOHRLcEhlV1ZYWVAxMldtQkYwQ2FRVURRWmlqejRk?=
 =?utf-8?B?UXdndG1EbWtNREZwcHBxRmVhN1gvMmlVbS9uYzZVazNEQ3NhSG5NUUpSb2kv?=
 =?utf-8?B?ckFienlvUUtOWmNoRHRNL3VDa0h6eW00T0xGVGl1YndUdlZUeEo3bHQwUmlP?=
 =?utf-8?B?SUpmSncwN0s0MTZDV1FidTdRa2F2QVRKbVZybjNzaGY4cHVrNVRYaDlTYThs?=
 =?utf-8?B?QnNtV2IvT3FnY1hSWXkrc0loMFRHNWp4VVoxR3pNZVlBdVdPM0RoNjJtZnR3?=
 =?utf-8?B?aWljL3lXT1pzWnFLRno5TlNYNEFwQnRqRGt2U1RmM0syT1lueGpwb0xla1Y2?=
 =?utf-8?B?VmJib2pVU2JFRVZSOGsxbGtGaUZrZHM5QmU5V2xwY1VaNjczVUh3YnUrYVJ2?=
 =?utf-8?Q?Xk31SGDtRrIzuefe9LuZpIaHO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44aff554-7090-4fe7-543d-08db4565e262
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 08:20:09.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odIFPg1ewxciHDYBlGwz6Ug0WHPjj1WeVBcrgrIY6hw5hccJp4bZvzEUsVm4nh5oRBcJ5D9QIgI4lsdMmsDr0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8392

On 25.04.2023 09:56, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> Processor NUMA ID information is stored in device tree's processor
> node as "numa-node-id". We need a new helper to parse this ID from
> processor node. If we get this ID from processor node, this ID's
> validity still need to be checked. Once we got a invalid NUMA ID
> from any processor node, the device tree will be marked as NUMA
> information invalid.
> 
> Since new helpers need to know the NUMA status, move the
> enum dt_numa_status to the Arm NUMA header.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v3 -> v4:
> 1. No change.
> v2 -> v3:
> 1. Move the enum dt_numa_status to the Arm NUMA header.
> 2. Update the year in copyright to 2023.
> v1 -> v2:
> 1. Move numa_disabled from fdt_numa_processor_affinity_init
>    to fdt_parse_numa_cpu_node.
> 2. Move invalid NUMA id check to fdt_parse_numa_cpu_node.
> 3. Return ENODATA for normal dtb without NUMA info.
> 4. Use NUMA status helpers instead of SRAT functions.
> ---
>  xen/arch/arm/Makefile           |  1 +
>  xen/arch/arm/include/asm/numa.h |  8 +++++
>  xen/arch/arm/numa.c             |  8 +----
>  xen/arch/arm/numa_device_tree.c | 64 +++++++++++++++++++++++++++++++++
>  4 files changed, 74 insertions(+), 7 deletions(-)
>  create mode 100644 xen/arch/arm/numa_device_tree.c

As asked for in various other contexts, may I please ask that new files
prefer dashes over underscores in their names? Additionally short but
still descriptive names are imo to be generally preferred; in the case
here how about numa-dt.c?

Jan

