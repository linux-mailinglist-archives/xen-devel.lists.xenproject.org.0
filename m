Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AE49B12B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 11:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260033.448980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCIp0-0005Wb-MZ; Tue, 25 Jan 2022 10:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260033.448980; Tue, 25 Jan 2022 10:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCIp0-0005U0-JX; Tue, 25 Jan 2022 10:13:06 +0000
Received: by outflank-mailman (input) for mailman id 260033;
 Tue, 25 Jan 2022 10:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCIoz-0005Tu-EW
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 10:13:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 621fbe58-7dc7-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 11:13:04 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-p3N56v0tOk6wlpn4-HqgwA-1; Tue, 25 Jan 2022 11:13:02 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by DU0PR04MB9273.eurprd04.prod.outlook.com (2603:10a6:10:354::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 10:13:01 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 10:13:01 +0000
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
X-Inumbo-ID: 621fbe58-7dc7-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643105583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S2nglaKedNhjEXl/TXRE9njFgiXWIGDGR89CVPZ6Y2c=;
	b=NlR24ccOsPBt5SP76niKK1lRObyuTraoYfD61M7m6mcTxVRh7kTvw0Zo1lOBSNhYVk1U/k
	to81T22sv0ePt3qy5hQXMRtpJDK++1N1rI4jHjek2ODrlrTc3ZqnpfvJdM7nuCOvBcxpOe
	i302W6rWdq7FOuYxoeNVOp72uZ1EEbs=
X-MC-Unique: p3N56v0tOk6wlpn4-HqgwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQAIGOyMBfDd110EPTtlNsqfYan5WQBERd9+Esco97tTEzYw3IE2+cpkm0eLY24d0TYZbtJT9Dy3BzproNktUqQ3AN8K/8ICDyENJFuxe3ColCXt2FoSbiIKDmCF5vMUIiGNrosacHW41rLqSISH0hJHTvNpTKUsdYd1ZhkVHR8LK/Me1SJepVMezn7QG/EXtl/WvgXIFiiHUhNRQ4Y0+DzDFgZwBRrdSZu7KrToZ98hUgkhTfPgfOBOU1U69SENvJG0peUQU1MMAnnnodb4tYSJOtvHqF9BOheKzOA1v94LkABaAuE5jFursw4FVtvekJFWfei4kphAT5s/r5ZmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2nglaKedNhjEXl/TXRE9njFgiXWIGDGR89CVPZ6Y2c=;
 b=DL+g3hwWEiDFB331yR8lXVVW6SMm1+a+aN3+7d/mq0FOLOH5SVLnC5jkVyY+aUdq2zGruo/PoXD5L17vKM5eEv8DGY2MVtkRmQRc+gYacSa3iS8p6supCuHLdVpCiL4gWgzvR+6F0irOa5ONm4+qX4M2W6mCnkzuuyYgzBg++JBZY8KQ2wdAUyuopZnR4NON1SgxgQBMaJEGiJgnN/9u2A62Wihy6vivkPZD+mB0FF4RtivzBXfJmLfDeb2HOg04eyRkml0ZJ7iz2f6bPVJVUe0KXa5GiCZQSdqDm7u7yyivJEatxiCpcUS8NWKH1C6XhKp+MLLNpEilmvXFCkX/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74c249c9-4c49-0f46-2b51-cf76fe450b9f@suse.com>
Date: Tue, 25 Jan 2022 11:12:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/37] xen/x86: use name fw_numa to replace acpi_numa
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-15-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-15-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0401.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::11) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d302f8-334c-44c3-6cd9-08d9dfeb44b8
X-MS-TrafficTypeDiagnostic: DU0PR04MB9273:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR04MB9273B0EE9F7A95C783B8CCDCB35F9@DU0PR04MB9273.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gN9HjTlL81Paad3U+SsbT52k2kHfCEurSRcpvxeakCI9w7CZhHUPElj3trsJFj4top2GzTPXFm1upnqPgxVOUyW/gZn5G9ML8TaH+5uiihX1ZDCw5jlYyeftEouS1fH/QxVwbMl9B0xzT4yo6N7xRWloFASpV1ppIuA2N9morrDJl3he3MzHrfzTlck+2+PsBrDmCaRhq8XMdfRW1x9zNqpt86MxF8HRShYfbkErls9uWL6xqC5dsqIr5q+eFo/rPSs3biTb/aye/7b0ZetKK2At7sHptGofS97WUw64uBsF2dnsfcm4sn37O4bbz6LN/JubK9D0uvtbCMUZ6erZSsylAQeMhDIE0m1HvFqybBXxFSf5nndSOORvx1tta3hVJoLi3hDqh4tmpae8OxjiY1WMe8FMGyKtjTvPCz/0FEwvMyb72Vi99NvzfbSb6+b022Y39txhB0sxs+LwByJR83HR8Es/PNcPrSsUkPDqZxTTH0mYnAclOHr5hcdtDBOhVaUZjM3xB7IqRI+EBKzex8JkrdCcPOmzEY/RPOTjuCHRbt2gy2ubCgM3LbeEVOySeHv/OAM/E4ojNeiNbLds+Z1ZyG/yp7VIJMMDTTUFtJAUZPx6MeTJoHkxGQ5R04L/V8kqS1WX/y4TU0vxO5oHsHHHegm9YjAwnT4qCRW5YCOXU9nixI//E6NhmUHHd7hhvTTlHc4UW9mbB3EmMKiqpuSzb8FJ74pLh4YBGb/YtzBa/TD8faRq2ZpqbanvPTS0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66946007)(83380400001)(186003)(8676002)(31686004)(66556008)(316002)(38100700002)(66476007)(26005)(2616005)(36756003)(86362001)(8936002)(508600001)(6506007)(6512007)(53546011)(2906002)(31696002)(6486002)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFJleVJkazBVcFAxcys5eHphMm5qUEdTODd5WE1NbzVTWmxzK2h6NTIybFV3?=
 =?utf-8?B?QjNhSWNGZWk2RjJ6ZTQ5d0laTEJydzM5VVRzdDdJTnZoR0Z0dWVyZElKcXpT?=
 =?utf-8?B?N1AzakxIZmt4eHdjRjRaam9kdERaaEQrZS8zRnd0RmNicUEyekdoMlNJYS9M?=
 =?utf-8?B?dXdDbnNDTDhmNXBxSi9Zemlsb3FacWt5MWpNVTExYU55b2twS2NDaXJsWjhV?=
 =?utf-8?B?djhPNEM0N3VMOUp3RXdhN2dMdFl2TW9YRHVHcUh3TzJFSDhTS3ZJM3A5aDd4?=
 =?utf-8?B?Z1U1Ym03T1MveEdHWWdDOE9xNTdldGdWcHFOOVVWNzdncTJpSzRPTmlhc29n?=
 =?utf-8?B?S1ZoRDM5T3ZpR25qa0x3MFFHdXZsdWVkNk9EcEQxNUcySjVuTVFad3N4SmZi?=
 =?utf-8?B?V0ZmWXZZWXpTME15SHozMHQwWkdjTm1DVzFSNitFVnZTUU5MYjRHNHdWOEpL?=
 =?utf-8?B?UDFNaTNtZUVYdXBvNUpLcjFOWFJjMGNYcWt2MUhZUExqb0gzdUZTbThGR1dT?=
 =?utf-8?B?ZHpDRGpadk41ZUR5YWl6SG5iTnZ1dHVObUVDY3BPTzk1ak05NVplNXR5YXc5?=
 =?utf-8?B?dTVXM2RINUNYUG9oaCtBQmF1UzcvK0Q3MGFhcTRHVktrU0c4T21MSW9lbmR4?=
 =?utf-8?B?T2NhNGpJSGh1cWZqU0ZhNlQrYU5kRFMwb1FsclNaOEk3WENEU0JzN1loQXdS?=
 =?utf-8?B?NTNxeUVwaGhCVkFodk1TL0grQTNHRnE1K2ROODlVUmdobGNCNXl2QmpxSmFn?=
 =?utf-8?B?QlFCdlRHTXREQkJQRExGRER2dy9pTUM5VkcrMVA4OGtwSmZZV0UxdlhSU3BT?=
 =?utf-8?B?c3RZak9PRGY2dlVWN21paXNKMGRSU3BtVlk3UjZyZ2hWckhDcGNQNkgyVzdN?=
 =?utf-8?B?TFZRbFBKdElvYzB5c0xMU2I5aDNadjBnQm1aOEtGSXdrblk3TUZYbEZ1Y0RN?=
 =?utf-8?B?Z2FUS29tMDluSHVIQlpoU1RwWi82QUxRUVUzNWVTUEowY1Q0eFMwRm9hMVVw?=
 =?utf-8?B?V1NpVWYvQUI1Zy90blM5WWdHbTJobGF6ZEpsWEJ1T1c4cy83Q1NIZzJIS2t5?=
 =?utf-8?B?M21pN0U2MllVSEphRERNS1NHV3hnUUlDM015dHA5MEo2UXlla1gxSW0vMzZZ?=
 =?utf-8?B?dWcrKzl2dU85dzJxOFZXbEJITyswYWV3SmJ1UWp0NW1ydUhKeVdIY1Z2TmQ1?=
 =?utf-8?B?MTM5R1NFQ284ZkZVOVVaTnNVUWY0TysrYWs1MGJoZUJrSzFQTVNLWm1Wdjh4?=
 =?utf-8?B?cXN5STdOR1FQSWNIMWJRTjBobTY3K1Q4TFU4Yzh5ajY0WVpvYlUzdjJxVXlF?=
 =?utf-8?B?ZVNtTVZLcWlMTlVVUVNlc01URXdPdXR4dnU4Tit0a2h3ZnF6Tk1SSzFnOFZH?=
 =?utf-8?B?K0NZOFl1NWRGMDBoY1BFWUJjbkR2UXJTeVV5ei8rdk9TSzdXV3hjZmw0R0Vj?=
 =?utf-8?B?Mll1dkpCdERPbUZjU29OcnF1Z2tXM3puMEVNYzhwZXd6b09SaTNvTFRzU2t0?=
 =?utf-8?B?alJlMzQwYVVTL0JQVFBsZnFKL1FjQ2o3a3lTWTRJOUpJVGJJaTlNZ3d0dVEy?=
 =?utf-8?B?b0hBT09XVkRlWjJZRjkzeWk5YjNyUDZGMzVsc0pTVDRvV3VIcGtLeTlqZ21m?=
 =?utf-8?B?Nnc2N3dLZm01Y1ZKVG5BVGR3THVhcmVVQW9kaUt4Y3diM0hVSEdVT0N3ekY5?=
 =?utf-8?B?L3NnYk9mOU9NRlYvWndzWTMxTkxGRExGcDhkSFVtNGVLMXhCK1pKWENUVHRl?=
 =?utf-8?B?VmJ1MWlkakh3Sk54NC9OVDNzL0NtWDBjbS9yNjhLdTVYN2lMcGRIRXkwL0xM?=
 =?utf-8?B?Snh5dEVkcGU2QVF2cFU1akRHQWhQdEVTNkJqdGpsV1RpbmExVnJRTjl6dE0r?=
 =?utf-8?B?aEZJR2c3SXlIVEJFRFZyV3c0ckZHdHQ2Z0VDZ1JMNUgvQW9WVWo4OE9HdkU0?=
 =?utf-8?B?N0FDTnd2UkMvZ09LK1F0Nllva1FyUEhCbnJqd0hQSDFxUW1MNnBpeFVNd3Ar?=
 =?utf-8?B?M3p5aVoreEVqWlZ0aXNwS2Z3cFlBc3FyYjJNcWhCRUplTDhQY2pMVHFmZkpM?=
 =?utf-8?B?ZEx5U2Y2eEtwTURkZXNaODZvbmxQODVPM1BQcmhsblpOYlQyL2tNTGlZMUtq?=
 =?utf-8?B?ejZNMjAvb0pSTGV5aVNoY0VwTGUvaDlnRFErd0ZRR2UwWFltVkNycjNOUmlY?=
 =?utf-8?Q?Mmj/qrmktV4lK0EcuV5hkW0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d302f8-334c-44c3-6cd9-08d9dfeb44b8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:13:01.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4Y45tmcrDqDg03H2vVOUMRq1qgq94QdE3e5HCqw+2BInzTaxOTDm6twaB7MnA22lw1AUDfqnesCUjdPAqThjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9273

On 23.09.2021 14:02, Wei Chen wrote:
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -51,11 +51,11 @@ cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
>  nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>  
>  bool numa_off;
> -s8 acpi_numa = 0;
> +s8 fw_numa = 0;

In x86 code I'd prefer this to remain "acpi_numa". If you need to access
the variable from to-become-generic code, introduce an inline wrapper
(possibly named numa_mode()), allowing you to do whatever you need in the
DT case. It may be helpful to fold this with numa_off then, seeing e.g.
...

>  int srat_disabled(void)
>  {
> -    return numa_off || acpi_numa < 0;
> +    return numa_off || fw_numa < 0;

... this. Actually I think the underlying enumeration could even be made
generic:

enum numa_mode {
    numa_off,
    numa_on,
    numa_acpi,
};

is, I believe, sufficient to express the present (numa_off,acpi_numa)
tuple. In this context I'd like to point out that the two uses of
acpi_numa in srat_parse_regions() and srat_detect_node() should likely
be invocations of srat_disabled() instead, to also take numa_off into
account. This would then be addressed effectively as a side effect by
replacing open-coded uses as well as srat_disabled() by numa_mode() (or
whichever name the new helper would gain).

Jan


