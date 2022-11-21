Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB9632582
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446637.702310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7fP-0002R4-Vg; Mon, 21 Nov 2022 14:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446637.702310; Mon, 21 Nov 2022 14:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7fP-0002PH-SX; Mon, 21 Nov 2022 14:20:59 +0000
Received: by outflank-mailman (input) for mailman id 446637;
 Mon, 21 Nov 2022 14:20:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox7fN-0002PB-RV
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:20:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b680018f-69a7-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 15:20:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 14:20:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 14:20:54 +0000
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
X-Inumbo-ID: b680018f-69a7-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIoHMEKR7vndtfoZ/JKn4oXOduuQffPtXrxR/vlkfwYi4NQegYpZM0MJnTJ64YHgjheHKR1kLTq1CUfvyR/kUKFWVB0UmcKwyabKv6E83UmxWuWgZg41jgA+5WUq2JCK53++wszSdtY4o5PRQV5VvQe0WirWTEUOVPQYGaWxUtWbCuUrw0XwHGgtSTBalyyno5p2TKzxgKr6LK2v15fKAkHTk87SQrJF6yMUHLxYeKvnhDVzik/xHJ3KteJZrQB6qM3NEMUiD1EeNy/05+qvWPpADpdzDN3Go4iinkWOrI4NPiDhvemKLuc4b8BendajngoFJDTxCwFfMuG8uwjVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RekUAs2NVLsFowGUN7aH39geJvfdQnZe8z04sdBvMy8=;
 b=grb+vbxsf0jXkXrsbs0u3Ghi73zRUVhlgPccVKTWnRfCtG3cltkmXxVDLEO5tLU+iJFIRdMBqzQrrvIKmGxjZz79y0k8YuDGfvvn12KwC1O2Y9J01sTX8kNvVr6SXJSRXxEA07m5KNtaAX7dOw425pxb+Q8rf/86REE5/+/zWQykjsIFrAToNioUS6ZSdxuRMNq4iWhmjt6uLIIzZ/WczHSXSfd1k8IJSSCmQyzVHbR8oC3fYHK6UOykD/IkJ0Uf1P+gcUnEdjGvGE2EzxnlpjOHAA7c+BrpmaGq8S7UacPTwA7hU+1AdKApD0EKlrtHRC1APb62gKrlIAL56fguzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RekUAs2NVLsFowGUN7aH39geJvfdQnZe8z04sdBvMy8=;
 b=dkzcB2kbXSz08n58JTX4YT8qP4fZVZe4OuZVKpWUG47iFiIE6asvjgQnLwEvq54aH4jq4iOIE2AoE+/Hb/rawuER/w6lawFUkH9gbzZPKN/Jp302rnGBhoOIf4c19U7xIlfOgcCAF8PlIuto08YyWpJJAkaPGxr1vkFWj1iCL6U8Wn+lp5JHCpHIO/h4CIRTIKKup9yXn2KRM7GJM/7DpymtFzzniUgGP4yPlJ/DKX/XLPIoGLoECzaPvSaj6GTDTRVa2uJMGlXZK/uHfb2dbhlCsHJ3HyywkhYJ3Kp687ZDNJK8JKL+K6DTRaWala9L7tP9+4Ufxjg4xCm3tWqXiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcecfb8f-f90f-2250-2dbe-a86fee5cf263@suse.com>
Date: Mon, 21 Nov 2022 15:20:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] xen: ACPI processor related fixes
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 linux-kernel@vger.kernel.org
References: <20221121102113.41893-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221121102113.41893-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bb9f93-0c3e-4288-146b-08dacbcb99f1
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2OvNRSD7jsSYx6kqSYKPZdCnnekzeV5hybozR1+lwhQ9zBmBc0oFhGUeUNTmw+lj6dRXrs8zSaY4ZdHVRI0hsvH2OobEpxui2GfO1sVg4I21VY/Ox+FmGgUDR9mxTdH8vBye4bmSujO0vlHZPT1uW82Zd6jiigY538KBxeSxpuVKsQzDHSNcjvOcY+fiFr/v/hinOK89Un/d3qunPWokrCyO4OkkU4PXlLmtCGszbJEp+BxIbEwG5hir6pp2j1q+mGSyibunOQnX1DYBEYlZzbfJ3CEc1VnQdbzMgCc/zl/s89yYcIiKzvRP8tCKhnJPFVBBi6tUU8yMpHUYNku3k5vnJz3SpS6i2etOeGOIU6XXcq0dlwVC8b9zYdOozgT10H4WY/6Jv5Iu4f/dbvoGpUBqGgr/Sa5a+6zw7e6QJ4agwBfxeLRpz22VjKK6psLCLmusX45zGU4mlm8HQ8mj+Mxswz52aCWcHIvr+7EVAKwz5bxsLKM4Ggr7fPP+tiIyRh0wV6oqrU3H9VKh6miQG1sBulObu3AM7MisGvoCMP10DnR7Bm7TkownOtO8+FSH1l5MHBQY7xhDMUKpsML0greQwqhZCySTOLgc5UEVhprQ1P+YFuV3c/SfQu7XdR5f2Zd9FcAyH3SmYp5KcWwz+ppSGUQS7Rk8maFgePepZ3ilTcI8HGwEqDn9sbE4O1REXvB4MADSXLE6O66ZbKawkmMapM/k/YLDtTfs3ijF86g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199015)(36756003)(31686004)(38100700002)(41300700001)(2906002)(83380400001)(86362001)(31696002)(66476007)(66556008)(8676002)(316002)(6486002)(66946007)(4326008)(26005)(6512007)(6916009)(186003)(5660300002)(8936002)(478600001)(6506007)(2616005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGN2alFWeEdqRER1NWhhWDVNUVpXZU5WRHNTemZBTGFRZmN3VjFuL2lOMm1P?=
 =?utf-8?B?WW9ldmU0TksyaGc4c0RVM1VZTnh5ald5ZzJNQmsveVJUbFNSS0xrRzdlTzZI?=
 =?utf-8?B?VW9NdElyWjlNRHo4NGdYVWxQNWJFeGxLaWxwNGVMRlh1WmQrNjQ4dDhhZVkw?=
 =?utf-8?B?VUN2d0ZCS3BrVXQ5a25kaG0zRUQ3cXNZVmtyNUd5amdBWGlmYTJodm1mZ3Ja?=
 =?utf-8?B?ZVYwcVEzUXF2SkFJRUwyYUZ3cE5CU2x6WDF0M1R0Q1dmV0svbzFTY1NjWkI2?=
 =?utf-8?B?NlVUY2dESStRdThZeWxhZGt6REpzVHc2MGdxOS9JVDM1NzZ5TGs0azJDZGdl?=
 =?utf-8?B?MzFudjVmNnlxWHZaTTc5ai85VFhEc0RpZmJXSUN4TjVJSHJOa3dhcGV4ZlM3?=
 =?utf-8?B?cEFsNkhXb3VsdHVFVVhzSnNtem5NYzNzckErdXZOMDYzaFJlMWxMUHFPNWY4?=
 =?utf-8?B?WVVPVlFzWDc3c29sYldsMENRVktWT0Ztd0g2aTVBakVpN3VvSE5YK1FrcE1H?=
 =?utf-8?B?b240OTdzaU1ZSjNFcHRyVUpXdk5BVmRMckJmMEp4Y2xqdDVCbkFqZEI4aURu?=
 =?utf-8?B?VnFuVjlIalVNT0R5T09oWTF2ZGRMVTN2VWdXUndkS1R1Y3RDRnh2Q2NVTTFl?=
 =?utf-8?B?WFFTVGdOMExaVHRkN1J1ZEliSWxTM0JVVktPZ3J0dTJuMWxsVElKSTZNSGhk?=
 =?utf-8?B?SG1SWEtwQ2JacWNDRG00bFNvKzBERVR3bitOcXN3RXBEWHR0NTJlYTg4R0c2?=
 =?utf-8?B?QkhNanl3b1FGbFhUTzBSV2RSUTN2NzQvUVhqMWxSQXpTbjUzMThVbEVpclpz?=
 =?utf-8?B?K0ExL1RLVXBGdTgvZlNPTVRXTTlWMkY0SkRHM1ZnVThSeU5lOWwrQSt6OUpy?=
 =?utf-8?B?MzVybjVuVFM5Rm1oZy9WWFN4OGRoZGUxNldMc01lZERzNFg5dUFuWGNGcUFR?=
 =?utf-8?B?VythcTViQ0ZnWFFUNDM0NURCOFVYUVU3SFlMRDRSUWFiM3NwVUUwZWRYUXZr?=
 =?utf-8?B?WHRxTk1ETGdoaGRiTWMxbHNZalN2Vy9hVThmMXorRWFNZGY1cVdmVHY5UmxE?=
 =?utf-8?B?Mk1WbWRCNVFWeE8zeXlEdFNCMlQ0eDdGaVFVaWlweERoZWxhT0tSZEZYcFJ4?=
 =?utf-8?B?b1lIZXc5MFJDQk81K1EzcDllUDF6OEZYRk40N0J1dzhXT3p5YVlzTFFhNG5a?=
 =?utf-8?B?MEJRczRyeVU1VjN1Tms5MDVuVFVwQlliUUkzWUczT0hZd1lSNEhTTGlLenRY?=
 =?utf-8?B?aEVRVW15QkZ6R3FqRE5naDZyKzB3NU1rWFNmaXpmNXdSN2FBRUJaaURacTdP?=
 =?utf-8?B?UDhCZG40MmpkY1oyNFBFNzd1bjVCalk2ckZHbkgzRk1RVllTYkcxYkJ2SFNG?=
 =?utf-8?B?SWhjNDJodzdiUVFYakxtSktYMk1qaDMyQlZxamYwU2Z6anlDZ0UrdnNnVzBI?=
 =?utf-8?B?cUk0M0g3VXVzZkVNVUZyN1hmaDF1dms4dFVqdGNWckk5UWd3dDBlK1lZMkFi?=
 =?utf-8?B?elQ5ZElHbmdsT05ub250bGZSTnFEUmovR1lVRGFYNUxiTDNkdzI3dFY1emR5?=
 =?utf-8?B?TDhhcWhkTnZ1UkUyS3BXSVpPeHdMOFdlaERpMWtpU2dYTjFiRWFyV2Q0TG4z?=
 =?utf-8?B?LzJzbWlSeHF3ZktNUDNnNCttNkZPYzg1cUtFOUlTSUdhQlBvSnoxQ3FSVS9J?=
 =?utf-8?B?VTN3dER2ek9haDNCMEE5d3RMeW5nQ0tmNy9UQ3pXS1VodUxIVGVna0hveGlu?=
 =?utf-8?B?M0RWNFpzZEdqM0VLdUhLdmd3WUlQbFRQUHIyb2wxYlZzUFpxZ3lrRzZXYSs4?=
 =?utf-8?B?b3ZVWklKcXUzeWtPRDE3YjlMSUJuMUhmZjhvY0RRVkdmSGhjcTkrV0lPYXoz?=
 =?utf-8?B?RFBMMG5HQVVDcE1Ia2ozMWVJNGN5bXluYjU5MnFVTWZodi8wMnBDbjNyYlhB?=
 =?utf-8?B?Mk9KZ0svR2ExeG1GblUvWFN3ck1Xb2RXVEJpbXRWcktwbzB6NGlRcEowQUNL?=
 =?utf-8?B?S01STXN1SWZGYkx6OWlVbmlNbWlLamhWQndzdDZ5NWRVMlJFTm9KMDVsM1ZM?=
 =?utf-8?B?UWQ3S2RRS1N2WlVCczRuRHZxTGpFb2h5M0Vub1RlVUZiK250S3F2bXNBTnZp?=
 =?utf-8?Q?TfR/ohBX4cTcRIufAapv10ulX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bb9f93-0c3e-4288-146b-08dacbcb99f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 14:20:54.8797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jD0YAGzWk/DIMFeR8oZyTtWty5RfISDOKteYXPubBiATb3X0SJ4TE17/huyMRdtW8En4lWME8rYLrEMyYcJ7Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8676

On 21.11.2022 11:21, Roger Pau Monne wrote:
> Hello,
> 
> This series aims to fix some shortcomings with the handling of ACPI
> Processors objects when running as a Xen dom0.
> 
> First two patches fix the execution of the _PDC methods for all CPUs on
> the system and not just the ones available to dom0, while also making
> sure that the _PDC capabilities reported to ACPI match what the
> perfrmance and power drivers in Xen can handle.
> 
> Final patch fixes the Xen ACPI Processor driver to also work when used
> in a PVH dom0, that has a custom build ACPI MADT table and mismatched
> Processor UIDs between the MADT and the Processor objects in the dynamic
> AML.
> 
> I don't really like the current implementation of the Xen ACPI Processor
> driver, it IMO relies too much on data being fetched by generic kernel
> code.  For one the generic fetcher functions can take CPUID data into
> account in order to sanitize what's found in ACPI, but capabilities
> reported to dom0 can be different from the native ones.  Also the Xen
> ACPI Processor code relies on cloning the data from CPUs in order to fill
> for the pCPUs > vCPUs, but this is wrong when running on heterogeneous
> systems.

Yes, these are problems (and as per reading the description of the
last patch you even extend this "cloning" of data), but ...

> Last patch introduces some helpers to Xen ACPI Processor that should
> allow fetching all the required data, for each ACPI Processor object on
> the dynamic tables.  It might be helpful to explore disabling any
> Processor object handling done by generic drivers and just fetch all the
> data from the Xen Processor driver itself for every Processor object on
> the namespace.  Likewise it might be better to just execute _PDC from
> that same Xen ACPI Processor driver instead of polluting the generic
> ACPI Processor driver.

... cloning functions living elsewhere also has the genuine problem of
them then needing to be kept in sync without there being any trigger to
know when an original function was changed in some way.

Jan

