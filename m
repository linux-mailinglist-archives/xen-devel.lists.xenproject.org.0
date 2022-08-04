Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F6589DC9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380485.614660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJc2v-0005wA-Q8; Thu, 04 Aug 2022 14:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380485.614660; Thu, 04 Aug 2022 14:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJc2v-0005uI-N3; Thu, 04 Aug 2022 14:41:57 +0000
Received: by outflank-mailman (input) for mailman id 380485;
 Thu, 04 Aug 2022 14:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJc2u-0005u4-Os
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:41:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130047.outbound.protection.outlook.com [40.107.13.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 960bb3a8-1403-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 16:41:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9410.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 14:41:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:41:54 +0000
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
X-Inumbo-ID: 960bb3a8-1403-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2LKgEIAGm9ejo/vL8CUuHt76lLTkW1614tOEFoPPV9+iVwRSqA5zVhVIQKD+/4QtN2IMUV1MjM/wp+id0TXUGH/V6JkB7ZViN/v/YZlCA9/gbkiRbXyBx38y9yKT2eaMNfijtfqzpRwzdeBbk25gJRG0+PzTzes7AoiNC97njqzVX5gpPJZtYN4MXs1emN+jCWtZZGmX3bc08rxdr0hHPQtpsIFPaEoch95IJlSkxSvXyCf2eL+6OFBWUp0xavCp3yz/vzigvcgCHXZzIIbqK5PiC5hoLIztP/kyjqRAd0qVL9Fl4IweeQ90/37iO6Siy+4YICHUsBLZ4tL7q8yMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfwZr4EZZzn06f7sL4MeDRRnzsJu3Md8kd84kfoW528=;
 b=hZKSdepwY/lC2WTgPM5SPfzdUF3Zs1FbMP1CgUcmucyyaSM21NyByQ/Cuprtxwq394Cb4JN6A8ebOhtu3sdcNS5YQqAUAAq1pnGPHxuKqZCdlRl7uFNDx+UDRQCYL419P7emm+Lpf2nLOAsiG7+AmUG9SeH1tviohayist6+WnRmC+S/vtKLoduIKaUQPwzB3jkMJk2ofR+id2PNXlH5ERQ1gnEDXjXmIcUQ3BXwYa8KH2LGtaxabdWpPL01xX2tpoRrsm760/KqmwQSpL6A7MMTXSBoXXJRBiUxbkm9Vwu6D/bj3mcsx3P/twb1PnEZVIbvYhPWCrh3R1uUkM+Iyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfwZr4EZZzn06f7sL4MeDRRnzsJu3Md8kd84kfoW528=;
 b=l3ns/6Y9LoX+Y5/oIXDpxkvzVxfa7GRBiQQlLpULYPbThhxBU1bKthcwMIcJmL5SBSKDIdgWCZK25CzRxBy5SeVtj8+jk1nisC6aB39EB/x8Cu+q8dKUb1s579LYdjwWB9abs9MoekXTPmoWkVvNMm7AvDBb/Ln/LnxWMu4w9pD9ujfrLvmv0n7tZTINicv5FFJzgyyo98xMsV9gZHMIWxeuBJzyx0ZWIWImG8Urzv4QAbwe7scyoZThj+8xillOYVjm8cvvMM+4/kRRiqkKITXO9x46raKuUVMmd4UP/SuMlFBUAUuXgCYzLv0cdZRypIoKnbd3Dxmik25BhSUM1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d98ea45-5fbf-9c88-40ad-d225b29939d2@suse.com>
Date: Thu, 4 Aug 2022 16:41:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 05/10] IOMMU: add common API for device reserved memory
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <6a99f9b99b419a20e895d54db2e345c80270248c.1658804819.git-series.marmarek@invisiblethingslab.com>
 <fbffdff5-04cc-f314-98da-29f1984149e3@suse.com> <YuvZ2mhKOkHEdQt8@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YuvZ2mhKOkHEdQt8@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45e61be9-1475-440a-132b-08da76277993
X-MS-TrafficTypeDiagnostic: AS4PR04MB9410:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fte5KVdWXZCyJvs/kW1NiHWBIow3vwcQB3TfsHr3LvZK4KdX7YQh2z/W0n+jPrr0u64NWcjs1pXb86fWCegvdSXm1GC7BICEbHHlsotrAVqEmaHaG0QjTp2jE7uWYoEtiAE8GK+frnrlmJ2u9K9FqfktWFdplV93PElCKxxY3FPsyfW8DWlmmOTv7kDVXnROfcO7mu71Gar8R9Lk103+6QBRGW8lkG0Bj99II3ClglcRsahwwZxN3H3Pphr4AUZN+BqCvZ81R9xmUj6TDAD6xThwB9zbm0+qcCSDupNPycNduBHl7XWunqobFl6go1zw5af3ag16qyTUpPyTcZbX3FMyPEAkcChuHyyDa7+UHnRQqADqwZIA2QBq8H0/TbVsL7dDSxEnPARMjb1mUr/AED0HvC4Ts8qbAR8HqovKvlyj0od5MjHP5sGpn98H+J6VgkW3I+2QONvFkT+Aufl8bLZzsiULeoD1cagdqw/pHjZxeWNw/Vie+sKsKVGHnbUdy83ole8qghCNB+rKPSNoSxdHG4ZOsIogX2h5EjljGHi6l1YVSDKGtWXgA1pZy/19KD7ssbPkIV12nVBrUL2VRyi4AJWWv5pOT5fGCastYjQf6N8A4xalMN45vMuz3oCCeUHN40ntsVG0PZXvqUOL9CHGIGskOQFdbPQSfwuIyx+BHRqo2i+2v2GCK3DKl6kHa8dvVd2cVHwWb73HLHlBHilZWsCz7xSkr71DZZGDEraq++VVSBbi0uI3p82eHfimcFtM/vVXMEOmzaAle1c6GeTJ0muA/m426dnOdT+L4rFKAgvwQ5agi7npeGzBOfLZ3Av6058zwn+EU/iaob6w3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(366004)(136003)(376002)(53546011)(6486002)(2616005)(38100700002)(6666004)(478600001)(186003)(2906002)(36756003)(31686004)(41300700001)(5660300002)(54906003)(86362001)(316002)(6506007)(6916009)(31696002)(6512007)(26005)(66556008)(66476007)(8936002)(8676002)(4326008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2RuOUNSUWFubHgrcmpqQk1qK1k3ZkZwOFFTaTNFZFA2dHVleVF6Y3BJRnNK?=
 =?utf-8?B?eXYxbWtQU1lZd0V0VTJrUzNmRjgxeFZmaVJEaEhIa3E2azJkQlRSVjg0NTZR?=
 =?utf-8?B?N29qeTQybDNSa1N4SkZ6bmhZSklwa1RpcFVuK2NJV0dwUm1VVzVFZkM4d0x2?=
 =?utf-8?B?ZzRNK0pMemh3cXVDcnhlTFc0YzVGTG5pL1MzS1lwR1pQSzNud0J2cHV1cmV4?=
 =?utf-8?B?Z21tcFFVVjNYSGcydHdrdU15ZEtDb0hTeTYwWGlUM0Y4LzhQYklyMjRLVG56?=
 =?utf-8?B?OUU1NkkvcE9MY2FvN1ZlU1Q0WUdJWjBNT1psSXgvRUc0aFVEeDJVSmFWTkpr?=
 =?utf-8?B?RWRHZHB6WS9wdmJyUkZUOFJkV0M2SmhLWndxRkIxWmhML3dnaVZ0dElSL3dy?=
 =?utf-8?B?dC9wanRhaURkTUtONG5uT3dweGF4cUlNU3ZPODVuYm1QSEVPUXpvY2w3SDRH?=
 =?utf-8?B?bEl4QVFWL1pVQ1Vtb3lCdlQwdXVSSm5EWDlwQmlYWGVPTUw3aVg5NFRwN0Zs?=
 =?utf-8?B?d1drMCtzQkM2RlljelV6aWZWQmZ2VGE2eXZONDNKaldlb09SUHFiMERPWktT?=
 =?utf-8?B?MFB2emlIaXZkUnoyeTUwb3lxam11R2x0Umk0bHlsUU1NY1hrNUJBamVRcDQr?=
 =?utf-8?B?eGlaV2ZuQ0ZjUk93eFl0Z2l0bS9nN0NLNm0xcGZhMHhjaitUSGJ5WEovQ25E?=
 =?utf-8?B?VUV3Tk55bG9zcVI5dFRmR3ZwdG8zQVU4SVdzNTJwdlAycklETlVWNzJBZ2FF?=
 =?utf-8?B?M1lGODQ1eXBvdUhxeW1ObUg2c21Sdmp1RHBrY3pZTi9IYzFwSVo0MTBGL0h6?=
 =?utf-8?B?Y3FVWHlydk1kVFZGRngwOEs4UHJjUlVnTDZhZ0hVT1BJamNyZ3BLWGhNWkFG?=
 =?utf-8?B?SFE4SkFzMWZqWHFYcDFqeG5KS280b0RhVTk5T1JZdGNYaCtKYy9tR1F0VmF4?=
 =?utf-8?B?d2JMaGk2MXpBSFFhckxPSlN2a09yRVBMeWVVUjdWNFZCeUtkQ0tHRmFJZDR4?=
 =?utf-8?B?bzg2L085WjBWNEVBUDNDTEpEcEd1V3JXNFFYajh1MEMzR0JXYWkwNmpVVkM5?=
 =?utf-8?B?VkZtbHo2dFlyaWIzSTNiMHRnaS9LUDYyQjhPVWtCb1V3c3NRaXJ5ZzFaZXVm?=
 =?utf-8?B?bmluOXZJMWllNTNkekVua0RXM3UydkpkVUVkRmtaanQra2c3ODRxS2p1R0lz?=
 =?utf-8?B?YVYycE4zMmYzbzBiVzFPSmk2ckxpZThra3YxdWJ2V093NVV4UFNkN1I2TFhX?=
 =?utf-8?B?TVN1REh5dktuUFpoampzRjB1RHB4SXBBRnV6ZnZZNERkOEd5R01oczBvUVZL?=
 =?utf-8?B?WlVUQjNFd2ZRNEVkVDdMMmhEN21pc05NWW9FWTdVbm1paUxZTzJEdTVFUlNF?=
 =?utf-8?B?Sy9BbjZia0ttMURSZUp2T1pObXBvNERqK0p5RkdIbFJXeXFTVWFKcFJiaWoz?=
 =?utf-8?B?QkVnQ0tMWDhiN1daRU0rZ2xGRXdhZkF4bmwxOW5OeFBkbWJ4QUFCeFI1dUJW?=
 =?utf-8?B?Z2N0ZXViKzh6ejJCMHF1OGVrZzBERWY0Znd5MkhsclAwaWtSTU82ekJzSWlZ?=
 =?utf-8?B?S3dCOWVWTUlBKytDeEdXakZJY0M5SGhZaXBHb0RwUVhnczRrVjZuVUZJamJW?=
 =?utf-8?B?STNrSVZTQ3FFanM0Ly9xSUE3L09OL2hPSE50VHVkbktYZ1dyOFJuLzdKbC9y?=
 =?utf-8?B?Mm1zcUl4SDRUY0dIQ0VLaUpiSHIxZnFiYlR4akdNUFZMY3dMQno3VytkVzNG?=
 =?utf-8?B?TG1JRG9jL2Voc0ZCNU13VEJCckVlOTM1RVY5QURBTVJUNk9pc0FBZGxFSWxU?=
 =?utf-8?B?UXg0SzZFeHR1MzVVU3FpVHprYnFpSFBIM3UrK1ZCYklNbVg4R3EvZE4xckpV?=
 =?utf-8?B?QTFEQWxmSXdObzFKZC8rQWFUTVBabFRCMTc3UEJkTWxUOUNWN3FJemZweFRR?=
 =?utf-8?B?c3M2ZHV1cVRyY1AwS0lpRHNZWmJPVEhrMW9DcmpvUHVLUVB5QlBseFFrSXJK?=
 =?utf-8?B?VzBLblkvb3JQbkphNnBQRUhlOEVHUjE2dzV6Z0E5RXV3ZXg0Y3doM0R2RXc3?=
 =?utf-8?B?ekwxdWcyNlRSY2szRitVZzh3SDhRZlZoRjE4S3NlbWNocEhJeHphNmUxS3ND?=
 =?utf-8?Q?2pe4M91VKP93Lhnfvg8K1Tbsb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e61be9-1475-440a-132b-08da76277993
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:41:54.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjotWfEZsnz62dxiwR7YdJNqnsS5hlAopprRsiGFdE157F/951qYZjb5qg9TNxiqS4tGRTDYITnotHMuNf2M2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9410

On 04.08.2022 16:38, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 04, 2022 at 04:25:38PM +0200, Jan Beulich wrote:
>> On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -651,6 +651,51 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
>>>      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
>>>  }
>>>  
>>> +#define MAX_EXTRA_RESERVED_RANGES 20
>>> +struct extra_reserved_range {
>>> +    unsigned long start;
>>> +    unsigned long nr;
>>> +    uint32_t sbdf;
>>
>> It's not easy to judge why this isn't pci_sbdf_t when no callers
>> exist at this point.
> 
> I'm following here types used in the rest of IOMMU code. Especially,
> this field is later passed to iommu_grdm_t func, which is:
> 
> typedef int iommu_grdm_t(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt);
>                                                           ^^^^
> 
> I can probably use pci_sbdf_t here, but it will be cast to u32 later
> anyway...

No, rather than a cast you'd use the union's sbdf field. And yes, eventually
that function typedef you refer to will want switching to pci_sbdf_t as well.

Jan

