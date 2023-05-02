Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A53826F3E7D
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 09:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528376.821438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkgM-0005U6-26; Tue, 02 May 2023 07:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528376.821438; Tue, 02 May 2023 07:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkgL-0005RU-VJ; Tue, 02 May 2023 07:44:17 +0000
Received: by outflank-mailman (input) for mailman id 528376;
 Tue, 02 May 2023 07:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptkgK-0005RO-8v
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 07:44:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22f6fece-e8bd-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 09:44:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8325.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:44:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:44:13 +0000
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
X-Inumbo-ID: 22f6fece-e8bd-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0MkeRvdBlHcdeXBcm35bwRiLFQPmolCJds6+9mWx3r1nXKu/kRdd90R1j3eENd8HrOqILcnVkUKeneMOFnSwlsDaI0CJcViI9iLwzTGMvb0E9GfmU+aRhFq6VM15RfUZSR5+FH/iAbrocdQPGrsJyIy9DgvhjeG1/0AnOCImfMKyTPkkuoQsc1waUWNy7/3WPgcuh6fxtAj2+1sT7UbXCEteYSwx3pQBdgBknupc6fiZv0qwGtOlZlf5MYJgyJ/8nMgknfbjrsyBPXJ0P7jRFwR+mNtgF9jFmBgMaEJIkrDy4cLr9X/WiJh8QU4PGnuJL8JiiEXe9yNntolXLpxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZhG623XH/gq2heft254aHJTyUmLp/RiNpLTQb7PQSA=;
 b=QNr1C77pYQ1NecvL8LjmdFvoBlb65WbXRgIIktTvGLJah9K/zuzg8OoICWB3FtuLzGc5OINwIXDl1JydzToifnoO0b5EZIlKZvqYTIqhJaxNM8ijnJJyFDY0vSsVcsdJ+QuF9vkJ8pAgJGebQM/W9OYMxiVmmhrHvBHyAGdy6gkOV/23vuuuwl8Xx9an7Qx40nCT1iYSMT13honr5tJ85JqgYw0VT/R7jpZpOelTUwpyTtNdttPlSCoNB/toA/LH0Jt226TnIN2I9IGvvg5vzFwomfK7gOP43/ObTjy/cBPnshzDhnciLQxn4QXty+RXvEh5nkAUK/XkHKSK92zyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZhG623XH/gq2heft254aHJTyUmLp/RiNpLTQb7PQSA=;
 b=JJQAdrVqcfrqN7+eW+q1MJ3sTvKNFz2/krgCg1INt+R8YHP59n1F6p+BdXB8Z+MGC+ImKybsfiIuP7Vg/IAYwIFlc01J8Oso+JULQy43eQG3XVxEywAZHVZWBKGQguFGmbtVs/d7SU93egXBYg/wp/AV7on/Pskti4d4Bo+ZjmciAqpIzLL1PDZjTuWH8CBB8Wu4gXrBbrMkD8B+4c8HLfGoMeLkI7oPgWC4vKoHBkO8q51KgV2JKxSdyMWkplc+dMqPhgALJsLDMQ97f//CVDVMU6tYrHZDLWV1z8tj1bOHKY8hubcMN/I2CWhYG75ingM8UQ9sStr/oRnQKGjecw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e7404fe-e249-7b3f-0628-b8b8b1925765@suse.com>
Date: Tue, 2 May 2023 09:44:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 3/6] iommu/arm: Introduce iommu_add_dt_pci_device API
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501200305.168058-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: ee445cf3-ff33-4ee4-e0dc-08db4ae1060e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eJVoQSUjT/NrKyKs5xm1/ByNJALAHqyeHMEbWwshn7nKDJaxy1bXCqsM0XFMx/Z+eJ2SbJ3jnojYbBfsnk456ROw7lyNsjvuWiryiDa/u+FmRm8VkqyPho7PZzhU17reNWo0+xYzEtONS8219UOYgPjzDtBBWid1iML4CPcD2VIQUMVzdLMIXyxf8Ljup8g7mj6B/m4VjBVXcmp2KZMvp9Dg0DKl455Yj3JJP1ZsAjMZY5LOGAomAXUEpRA6g88rYWva7f1sFvOUW9kYI3dTTsVlTU2s6Pf8qSi7pX9pOkLpeCKO51YsZ3xR9pcSYj9GReSF+qLkGQrpKmCf1CjxYKelTpyjTU+1TQk7OImHYQyhG1xjWHP1TiOnpQyXOZAmMjAfkRry4CNl3OItKoTkyE3mD62cCVIVhYuFuMqXP4jU0frf64bxILY52oZUiEUKZ28BfGI0qlW975cW6u0pFNq/8ftpCuIMoypqOkVfZkEu4KHXKZtcLDGY8XfmOUhOJXruPnecDQJWgiX6f9G2qojNKiEtYUyYPgYTRiyCnfsh3lODAw7KoW/U2EAfLHRm7w1g2hvWM3sYBE3vVREGs//oPl8ff5iIJgkaFbEDj6jcBFIEL+D9VrhX0yiSUrm2JY2YMOAJJeNI8w7DcF3G8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(38100700002)(8676002)(8936002)(5660300002)(316002)(2906002)(66476007)(36756003)(66946007)(66556008)(6916009)(4326008)(41300700001)(4744005)(86362001)(31696002)(6486002)(478600001)(6506007)(6512007)(53546011)(26005)(186003)(2616005)(31686004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUp6dGNIMUtDWmMvY3lEa2VmYnZ1Vy9RRUJneVpKQ25VK0VROXZZTDI3b0gw?=
 =?utf-8?B?Zi9ZN0Z5WGZFQ0JFdSsyT0hacnFLR0d5bmh0L3ljR04zK3R3RGZuTSsxMnFB?=
 =?utf-8?B?Tk1kTFlLVFI4NmsyN25mZ0kwSjJZK015VGQ0aXJleDh4Z3NHWGJydDBINTZS?=
 =?utf-8?B?Y255NlY2VllkajdpWWl2NTlGSFJyZm5EdnBGVUlpb1psbkFUT2t5dCsxZVRS?=
 =?utf-8?B?Qlp6bUwrSitUMzB6Z1dsU3hJRUtlbU54K3NvK2M2Wmd5Um1EaFpld3I4Sm1I?=
 =?utf-8?B?cmoyaVlNRlM5YnZZS2l0OFV5UnFDaXhOTG15b1ZNZHlyNXhXYXljbkdWYVlM?=
 =?utf-8?B?bDd6UXdETU85R2x4STExR3I3WEl0QjBWcURsOFdEWFFxdnNWcmpCVVlaUkZ6?=
 =?utf-8?B?VHYvOTlGbnJoeERxa28vOGpzUEpLZUgrUzB5YStkTndad3dMTzhqNFcrblNU?=
 =?utf-8?B?SmlHcXlpTUR4L29LY2NUcFpSS2ZJMzZTT2RmdHZ5aXUrcXEvZDVCaG9kNE9q?=
 =?utf-8?B?YTFmMW9rTll5YkVxRno4YUl5MzRoT0dWM25XcS9iR0FoQVFEYmZnaXNWbDNq?=
 =?utf-8?B?ajNjNnJFQWhFNlY1bHFaMkJGSENBUWV6QkRyM2dIWCs2S0lDTlA0SGcwaE5L?=
 =?utf-8?B?eWMya1oxc3ZpU2s0L0hpKzZRdnBWZUU5ZGVjVDc1dFIwakp0Wks0cGdEckFq?=
 =?utf-8?B?cDJVVmhSS1ZKamo0VlREUDVKWDc1dHBvMlROTzlsd2Qyak4yS1RiWHFaK2U2?=
 =?utf-8?B?SVRodEw4R1J4RDg0aUxTUG5oclJNNGpJK3FwUGZmdjdHZHNFam1lc2hYalZW?=
 =?utf-8?B?TmdNZWpoQy9lY0p3SHpQSVdseXM4dGloZHhwNkIrTlZlMTZNRjlNUXViTyty?=
 =?utf-8?B?L253VHpINW9ZQ2RyS0R1ZU5Ob0ZaRnVmbGdUWDNSNnRVQWQ5K1N6S3U2c01w?=
 =?utf-8?B?YVNiRjNCUitLU2l6YkNSSUpHd2ZKVVJqa2tSQmNUakVpYlpucEVGUEt5L09n?=
 =?utf-8?B?UDJRUFJkbU45Nm1rUmdBdG1jUHZiMGFmWWFnRjBSZDVNb1FQU3FrRDJxeTFm?=
 =?utf-8?B?RGMyeGVtZFJzaFVaWlNPak1hR2hOQVp5Qy9iQW1TbldwZXJMSEt5ZElHT283?=
 =?utf-8?B?Mk9XZDYwbHByemNiTm1Lbk12N1NLRjRXay9FWUdMMHlyWURmUXR6aDg3Smxq?=
 =?utf-8?B?Ync4UDMrT1RVby82VDJYK0MzL0tTUmFXZTRFbmsxUFQyQWZ1Z3BlU3NvYVBm?=
 =?utf-8?B?eUxtN3FkUFNVNFJsTjQ0aGx0dUcyMy9rSUVZN3ZjQXFUNEd3MlBkTHdHemFU?=
 =?utf-8?B?Y2VEK1l3RGRBclVocndWNWZ0eDRNVStTVm9DeWVTMVNwNG9mZ3VpeXpqcEd1?=
 =?utf-8?B?a2toMURkSmI3WFpGb3U4c2ZzQ1g0N1NuZW5EQXhvdkNnTnFFTE1ieXp4MWxQ?=
 =?utf-8?B?V1IxbDNqeHFYbzNkMkhvcGdtVXc3YkI4MDhSZDVLUE91QStmN2V2Vzd1MGRi?=
 =?utf-8?B?Rk52SWxvaE9oM1doNENWaHVVZFpEZUZ4SktCSysvK1l2RjMweDhHYTdMNmk5?=
 =?utf-8?B?cmNVS0pMZ21jRmdTTnZOeEZ1RmU5TGcwT2UyNndTTjBoMkh3NjJwNkkvd0or?=
 =?utf-8?B?Q2IzeFhUYVhuSGdhVHRkdUlveTR0UVlWeU9tWlZXWUFBNzFEbDBVRkgyR3g1?=
 =?utf-8?B?djZiV2hESVRlRUZWUEJTUGJDLzBkYkxXSUtZdUw5Q0lrWUZ4NittVm5nd21s?=
 =?utf-8?B?c1RpM2JSaGllSGRPempoaWxHQVBacTVVZmhUNUlHOUdWUS9RMXhFcXZlMmNl?=
 =?utf-8?B?ZTYvbE9SK0J3SzdJSkkyY2tpeTN4VDNVOVAvb1JvTkhVZDZJTmE0enRIZ1Rx?=
 =?utf-8?B?WjJTNW8rNllwRnBWcG5SL2xTV0V1RFluVDFIR2szcHJ3R1F2c1JLZWNpT3ZG?=
 =?utf-8?B?QWdBWHRib2JLRk9xekFmQVYyZkIwNXBQcDh6RDYxVGEvSm5lSUtkcUt0blQ2?=
 =?utf-8?B?VEZzeTJpLzIrcUI5T1RmNzFsY09ad2Z2ZURxNlVJQUk3QUlCVDI1T3hjWER5?=
 =?utf-8?B?RTA1TmRqT3B5N3VkT2JzUHBZTjR0czRDNi9SNkdMQkJVbmVTU3hlTGQ0MXlG?=
 =?utf-8?Q?j3BmGSBzG7hwoyg+DOSK8Ks9I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee445cf3-ff33-4ee4-e0dc-08db4ae1060e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:44:13.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wQ59Car2FuT4GBCUGY0YY70YjDnLJhTf8t8T+pRb1TdfAxoboHpsJvXQSmn4nm9mvL2nKu4FWXfKDrI1mfZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8325

On 01.05.2023 22:03, Stewart Hildebrand wrote:
> @@ -228,6 +229,9 @@ int iommu_release_dt_devices(struct domain *d);
>   *      (IOMMU is not enabled/present or device is not connected to it).
>   */
>  int iommu_add_dt_device(struct dt_device_node *np);
> +#ifdef CONFIG_HAS_PCI
> +int iommu_add_dt_pci_device(uint8_t devfn, struct pci_dev *pdev);
> +#endif

Why the first parameter? Doesn't the 2nd one describe the device in full?
If this is about phantom devices, then I'd expect the function to take
care of those (like iommu_add_device() does), rather than its caller.

Jan

