Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8CE7CE0D8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 17:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618673.962625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8DO-0000ME-0f; Wed, 18 Oct 2023 15:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618673.962625; Wed, 18 Oct 2023 15:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8DN-0000Ib-TG; Wed, 18 Oct 2023 15:12:05 +0000
Received: by outflank-mailman (input) for mailman id 618673;
 Wed, 18 Oct 2023 15:12:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt8DM-0000IV-ME
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 15:12:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0d303fe-6dc8-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 17:12:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 15:12:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:12:00 +0000
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
X-Inumbo-ID: b0d303fe-6dc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXS2V/f7SG/5uqqS01nNtZ7xJI5OpwQ8/XoBfzfDL0Jywndk1tdKPIzSKGJHB6nCJkNwnlwqQc3DVeTeI0+O1cEVOfNRwKHYAQ5GKdSkxCdSPd4KPxvyCjpiq6xH5mXU/JD+cGwgpV/8wKSQyu1XQwwe6bCWqHzw/smHUYTfpyXT0zd+9qXihvvgkqJTInv/22JQNSj3BSQgXL7/gibKaZVohSFkZlzegGQH7nX6mgLWXS6QJV0iHAyd3exnxrpWcQ2zeGCt9ORcEy4ev0wJMOXsjNMX/v9KGajjZijGIquKJldWum2dKEp/+1r/k69IEkg0J5GWmJg8NW/7TXMP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAajDSIlP3B5P8dCbd0NMHnP5H9T3O4uCEqiz7W3HTM=;
 b=fSOWxSdoeE/FZkM7Duw10CkFre+2pyXdQCvdoznlHFFjcIGSV7NQ8ycZWLYtAukGRH2KhuCVLi3m9kcFbjLFZRsstucntgkPNXpH3gRmLbrYz4cu+iy5L3Ub9i1eRaknUjzJtEPu7zHm/jTKWbAQrogBwo3vi0xeCTIgeWti0nWr3DlyEB0L6YeWw3jCZ6UULVNHEl2Lv/QRd4UeOu5YxTfWAwJkhjl84oL0+BMU2dyJfjo6Z3gnbxMGZC3wiAjDhT8DearUEdF6QEVeDGu8AINskFgYLP3tii4ljKdV5JvP9eamzoNIm6ei6snSjUx9XTRDM+PDM33ep5DTFdbSFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAajDSIlP3B5P8dCbd0NMHnP5H9T3O4uCEqiz7W3HTM=;
 b=zUdHDUFvwQtB0ogXVxsSZGyzwd8zyd8rKT9VhcCFIccKeXSv2lMuNqcIyxHnfmvkd9/Eb/g2WvmTsvYVVp4IV/ASuaBB/v3T431dUrsCgfx4Zp78gS0R4gN4TsTO3qqUdgQNuk9mVOWdW2ElCmsMVxGXiVjWCpW6h4SYuKjJNNPA89PNq5WMqpe558gNNUllb7ZMaWALB85u3EN7xnSIn51QBMvuxKaGs5cA6Aenuyf+HPBSMoU7enXizIk6nEHD8yT5gfQzEFBEy97ywdz9M6NlyPqLeFqOp8NNz8S/ih1OIAF92jgfgK53djhkwMZWQSXNkGMxRPrqa02xbWvISA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1ef0a3d-fbca-51ad-f282-fe3b9d49414b@suse.com>
Date: Wed, 18 Oct 2023 17:11:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v3] x86/pvh: fix identity mapping of low 1MB
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231017082907.14455-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231017082907.14455-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8621:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac33b86-012a-4404-2ada-08dbcfec93b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nn6GuMCFVpBO37PFO0mqVt8f6fa+h6aVb1mala7OVofVwBQmsxRFgjiIQszcFaTD18A/kNvQ60c4HfgYsy1780Ck4o6wQY0QoEsH56R8bqaDXeQXVQ/P7O0peOAvFVzZLZ+N8INB8zzyoRYjROImERq/ZqU7U+ORhaYD4mTFokectTt++tMQpQT17BiDp6VKxRVVmLhsP1gdZtTVeFYzZF0FIL7fp54DENiYHQ97EKHbNbva6t/wJSC6QAouhpDvppeMxSnGh3N30Bxl1i7l6zfXQRVsGuf+ndiC/K2cYcG8/8aQbfcomL1f125mgEm23/andDSfcO6GKNleNTwCLOb0TA9VjVesFpdXYBALJZfVbPk1xUNBQ+Nq4EfwfCJ8DKEcdcW4V67jYequDAHIIAnY6kbTgqBTY4bwZ2FO6z0LiCj5+Onj4X+JQGYoOjO3V+ZCWBURvg6FkZqnaD1msrhJBtJyNDAJTELRNLtDPsvPPMrXpNNzKjoEQfz5SlHVPe5WUCPwEnpv0AdwGKTL23Wds6IdMWklO2RUHwa/PQYRjH1CWzC6QBahW3dn1vYKfsvbX6WLmAUqrebB/adBHvZlNQeEqrpT1evijQKBEdc/+keurZGg0/0V67KLEI+Og84RhR6J6IYHmJ6wYeF4uQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(39860400002)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(6506007)(53546011)(478600001)(6486002)(83380400001)(2616005)(54906003)(26005)(41300700001)(2906002)(316002)(66476007)(66946007)(6916009)(8936002)(5660300002)(8676002)(4326008)(66556008)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZzdjZyWm9SYUErdk50ZERHcUlrUUxjdm1LN0VvOXlIMTR2cXFCaC9IK0l2?=
 =?utf-8?B?VE1iRUt6TjJJYW1pTkJOTU4vZVZHeW5vNGtVWER1cmlnWlFXd1BNczVjZGxo?=
 =?utf-8?B?eUl2VXBQSzI0eVJzMVlwaHVmWFNCMjB4azJqOVBQKzEvNjVXcGM5RE1jbDg0?=
 =?utf-8?B?dFk5UFZyZzRkam00TXlvbVFVRFpsdlkzSnNoWnMzZGx4VkFUanJYVGpQQlQ5?=
 =?utf-8?B?cnJ4a0hNSS81RW1JVHI4QkR2MS9MMmxzekwrQk41N3FSSk4xOU1tbzdnM2pM?=
 =?utf-8?B?bkllSEhnOHpPdDFXRUVlZGpRUkNBNGpmNDBBQnd3ZkRWbTN6OHVXVXhiZTVs?=
 =?utf-8?B?U3k4RHA5WmExVXBiNVVqTjdhdTZPcURnWHlrWFZUcUJ1alBiOUMxRjlld1Rl?=
 =?utf-8?B?eVE1aVg2amhGa05qbk9EWXF2bHY3cHpBWXMvZHF5dHFGcmw1Y09rL01GNXN5?=
 =?utf-8?B?TDVkbjA3TmpxWnZOemF5R1E2Y2hRNHExV2RjOVpQaDBtOTZtcHNEa01kUUw4?=
 =?utf-8?B?KzVZTG9NK1pTYkZmNlVwa2xzYTZvd3F0dHFDSlFKR3BqK0NacXY5NFNoeGp2?=
 =?utf-8?B?RGs2N0lYZTBrSHVZSnVqNTl3bkJYVExiN0pDZHBGT2NOMHljalpTSU9ZclEv?=
 =?utf-8?B?cTJ1cG1FM0F1OTFyRWVuRFFTUEJ4YXR4czZzbzJ5TllvbHlaU3E5T01QTCtS?=
 =?utf-8?B?djEwUWgvbk5ySnpyRDZaZDBWWGNWVkJ5KzcvTHZZcGd5bnY4N01RVU00ME50?=
 =?utf-8?B?UXM1VnJ3Vjl0Qzg4NGhBVkpnYUVuUlFSNVBybm5iV1I4YndpcVRxUGFwbmdr?=
 =?utf-8?B?bG9aMUsxaGNRRCtrV2poNWU4Umh0cjRET3o0cFFxdXBaZzdjbEVDOHhaWWE0?=
 =?utf-8?B?cHFnUEdlekhIa1BvZDYwVXlwNGFqMUNLa0dsUDJpMnI2OUNhYWlxK3FDWGtH?=
 =?utf-8?B?RTNJeGUvbmgxc0tSR0N0QjU2Y3Q2U0lHSUYwUXJLWml5ekpuU3VHKzkxbXNn?=
 =?utf-8?B?M205Ly83bDFkYkJKVnFRUHhkOHAzd3Z5TGxURVdSK05rSWpWSGdaaFdhY2ww?=
 =?utf-8?B?S0t3V3YyUkhyNHRxakRxZE84ckZLSytjbW92WTdReHhYNk4rM05JVmllb3Vx?=
 =?utf-8?B?Q0R5SE9PL2ZEdnV4Vjh2TzVnelJLc0tYc1dLN2tzNE1EM2djQkhEYzVkM08r?=
 =?utf-8?B?T0YwWkdidThsUDdyT0h6b0dCcTlyRlB4cGV1RnF1QTY0V0ZwM2hUcW1qZEM3?=
 =?utf-8?B?bnFzU0syVjVua3Z1NXgwQ2Rub3BmRTU3Q2tNVHhvVHVHZEI2ZEtndDNNQlI4?=
 =?utf-8?B?dGF4V1ZoRURkdS9CdXRzRVVyK3M1QTY5ckxULzZRQjh4QVRhdHUyWlRiaVA5?=
 =?utf-8?B?SXc0OVp1aEMwS05MTUlOOGN4N3JhVlIwTHlQd3d5ZlB4NmNMVytrdm56cXBU?=
 =?utf-8?B?b01JM0xyd0JodExXdnRFWG9uQndvV3JoQVJHMHc1cWhiOUdsTE5KcmREQlVT?=
 =?utf-8?B?dEIwSVhlTWNrUkdQYWtBNS8xcHQvY1RESkc2MC85VTFOUlFJdkh6Q092ZTZC?=
 =?utf-8?B?SW5id01ZeHFZNmQ2dStoa0tJeWlLTzJNU3pmTkVuRU0wQVAvWXdQK2wxTENz?=
 =?utf-8?B?ajBMVzlBWWZ6Q09pZEFTMUJFRTlJdG1LZUk1b1VSUDl3NGRUSHNzalZYVnBD?=
 =?utf-8?B?VXpuY2dGS2IxdjU1NjdsdzY2TXpIM05Ud0JwdTdMUVhvTnZick4xMENNQlZQ?=
 =?utf-8?B?SGhhaGRlUG9YMXZPT1VwdEtLSXgwemJUWVptSklNaVZrN0E5K0FqY25aRkNs?=
 =?utf-8?B?TVA5NjZhWVdOR1RuQzh1WjFkeUo4ZHE4Yng2cldVbGlXUFg2V3dNcm5JVEUx?=
 =?utf-8?B?am4wWmlta01XUitBWTBUaTczcHcwd3BEcHl2Ri96RUlLOFJtSm4wVHpwbC8r?=
 =?utf-8?B?eEFPUksvM0M3OGRwYmVjK1FYYTZ5TGZmZjNSSGk5UFdPVkF3SXJ6bWE5VUk3?=
 =?utf-8?B?VUdxb2ZmMDhqeDJta0NJc1ZEek1yOXFMcnRXZjNOTHJySGdabVQ1UWZsZzV1?=
 =?utf-8?B?Qmk4WGVneXlhWFgzY0huc095QzVzWGNzT3ZiUjN6TUNPN2Fqa2tyeDZoaUdl?=
 =?utf-8?Q?xZOEMrzEQPgb4kjj0wtkxz1xd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac33b86-012a-4404-2ada-08dbcfec93b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:12:00.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMaDQ9+Vd2Z/x7J5qGA9Oh2YxhfBr6iPrpOqNpCPIsxfA2xXHIbI5AGifbLMvhag7Fi1MapQ3QKjeThlEXPF0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621

On 17.10.2023 10:29, Roger Pau Monne wrote:
> The mapping of memory regions below the 1MB mark was all done by the PVH dom0
> builder code, causing the region to be avoided by the arch specific IOMMU
> hardware domain initialization code.  That lead to the IOMMU being enabled
> without reserved regions in the low 1MB identity mapped in the p2m for PVH
> hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
> describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
> faults until the p2m is populated by the PVH dom0 builder:
> 
> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
> 
> Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
> Opteron(tm) Processor 3350 HE).
> 
> Rely on the IOMMU arch init code to create any identity mappings for reserved
> regions in the low 1MB range (like it already does for reserved regions
> elsewhere), and leave the mapping of any holes to be performed by the dom0
> builder code.
> 
> Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one suggestion:

> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -449,7 +449,7 @@ static int __init pvh_populate_p2m(struct domain *d)
>          }
>      }
>  
> -    /* Non-RAM regions of space below 1MB get identity mapped. */
> +    /* Identity map everything below 1MB that's not already mapped. */
>      for ( i = rc = 0; i < MB1_PAGES; ++i )
>      {
>          p2m_type_t p2mt;
> @@ -459,8 +459,8 @@ static int __init pvh_populate_p2m(struct domain *d)
>              rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
>          else
>              /*
> -             * If the p2m entry is already set it must belong to a RMRR and
> -             * already be identity mapped, or be a RAM region.
> +             * If the p2m entry is already set it must belong to a RMRR/IVMD or
> +             * reserved region and be identity mapped, or else be a RAM region.
>               */
>              ASSERT(p2mt == p2m_ram_rw || mfn_eq(mfn, _mfn(i)));

Would you mind wording the comment slightly differently, e.g.

"If the p2m entry is already set it must belong to a reserved region
 (e.g. RMRR/IVMD) and be identity mapped, or else be a RAM region."

This is because such RMRR/IVMD regions are required to be in reserved
ranges anyway.

Jan

