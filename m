Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1746FCABC
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532305.828433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPrY-0000Fg-PR; Tue, 09 May 2023 16:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532305.828433; Tue, 09 May 2023 16:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPrY-0000D7-Mj; Tue, 09 May 2023 16:06:52 +0000
Received: by outflank-mailman (input) for mailman id 532305;
 Tue, 09 May 2023 16:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwPrX-0000D0-2I
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:06:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 813f5b29-ee83-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 18:06:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 16:06:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 16:06:47 +0000
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
X-Inumbo-ID: 813f5b29-ee83-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/aAe4/ecbZj1RKXN4pQn959ccSSYwhtW85HEwMRS1QI5Y+tK08qwEvzoTgYirE202JSIxkUYzF2X+cXvjoHTX+OuxB1c4ZW88MybtvFmeo093CVOHbsEo0I/rETAEU4XzOkqYfHd2iAOK2F3M0AFBm724mUOCW3UXeMtIYXya/kuLighU52Nugw7sSC7bwR65YMEyVgTRxbYX7waHIgw9KqTCLGMkJasFeC34Lip20wFFzzIEyTA51UGuo02FFEyJr/6cPa9hrGnsRgoF37VaV2fR/P/luObS17LgUNwvWxJFViTevC0vo6B/J99uqtjGTxHqVaohInO1T55MrNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4bY/LJ2S4yEbyQjwXlFZ98iAIm3DE0husNP6Aq8f3A=;
 b=cvGv28AX+xCdCe3NXrJDV6a36uGzRObUqPqp4kfXqviwWrVNEkeM49HrpYaAwkxO4sk9ohrYMUrsulDJs7EVPHENH9e48mH7se4iav0LgrwTkTQaRAztZHL4nd0R33kr9WFNo19BbVTvLbem4z0UKesKVHUCLV/rF7jx+unHobDFZ7cRYDAnoIE/soSztb5Pr+PDQ//PgwYO9rvttfWoxWWbIJhc4yrjJw+BOqL/nPz4FHY3lff0QmkLdS8bCv+7RUyUREokDGeytwkgupj2fFYs00SCdqrRJsy0xQRHPdF2IXDjfb2ZuLUwSpPnxe/FJv7/kaG8buCQeREqd0YQcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4bY/LJ2S4yEbyQjwXlFZ98iAIm3DE0husNP6Aq8f3A=;
 b=maxb1mI13ZSzJimMadbc94vn41h8/ml96Lu2mU9o8da8O7KLCcN0/QKUn3L53skLXntOfdgAlin7ms4eEbCSTeeJ8Ty+nshqoZSeV7WNNP8MCqZgUkkVk2Ofw7AHnQqMXBOG02u+hZhfR/oezVXBbdZjCWbJrvVYFklQMjDHrMlkkCaZkkjY1lBnbHoqMEAITD5IS+BnovmtMyHKLs0f8dFTE/npWTA3+d61V5ySdaM6rfx29xJNTNn5pD8vKZGe+tFhznFpGwtff3DgBb49OrbeStZJvEGcyti53lM3aJsgg993vdjXEN0Oq+qVyuCFAqpBSoZSaNx5eCqseboLfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc750b8d-77be-f967-907a-4f19c783ad99@suse.com>
Date: Tue, 9 May 2023 18:06:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] iommu/vtd: fix address translation for superpages
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230509104146.61178-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230509104146.61178-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a4ceec-750a-4b0f-9618-08db50a763d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iLoMJA4l6MQZOeoxK+WmE08vzm+em7Gj8Qk7D6QA2tNXQKoPlenOvtdaUnyNPa0foF580O+bNAsHKhrETbxtI5yUCBwLGYfpyCW3zKiHx/5bfxFi7W8Y7sTDzqezz7+Fs7GJfvuf0aPn+bFOPskUthORk7kKBfTZ37yVNlf3d55ubRQpaZfuQQ1TEcIIqZgfm+YsS7fnNSNS2YU9jvEQb0J/x614G5AoDGaS7LKImJFj68Z9ZSNgz+kZJnej+gBVK5lgIT8IZcEZMEVXjcbLtizgI4WJOQ8LX9ahCpx+mgZn3oZU/wuprwIeqjcmm/Ft2e5/ZQLBxFHKzgRbPwi55TGUFxTrErFiNj5xu1srlwOEvuIs9/5i8rvhZi/QObHuhlkqfxgcJzhNqcwiD46sN3tc6xJyon/G/jUS2N4y+zZaUOSkQz+yJjTpOAzHV+xU4GQ2FLXn4zE8PQwyeNNhuzluI3X7jbqdhUAwHNIwp6QucgWPCvGerOEfdGFS5dk1NAQ7IE66tsNDdvusf0NwYRlfhOM2VmHwe72ndqUr5bFRp5X9u7Xvrx6ZMrPKRmvahKHrs7cfZxPC3RRQoNCRtkHw7cBETu36JQSUULHSRzqbl1xxKWs77tcE0bKijhhY6EAftEWhiRFsUO7zk4w40w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(31686004)(478600001)(6916009)(4326008)(66946007)(66476007)(6486002)(66556008)(316002)(86362001)(31696002)(36756003)(83380400001)(2616005)(6506007)(53546011)(6512007)(26005)(8936002)(5660300002)(8676002)(2906002)(41300700001)(186003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkdQdC9TNkhucDlPQmxvZFNjZlNQblNMZUlSTXpKWlFPT2N4OXA3MEJmQ0pi?=
 =?utf-8?B?dlZpcndMZXgxc1FGT0RMZVdCbkhUK3oyUzhUTlQwOEJmWTErMXMyd3k5WVU1?=
 =?utf-8?B?bTBnaXNTMjNJUHJJaU42QkwrZ3NsUklYQm9PbWxib0ZxTGdFUGVRWVlHNXNu?=
 =?utf-8?B?RStDZjJrUWhQb3lkQ2Njb01xYk5CK3lhN0JZZFVYYkxXbEF6Sks3V2FReGx1?=
 =?utf-8?B?cmJHaHlNNmlBNlNSeS9TSXh0ek5FM1hxQ2pIdzZDQVE2VnlIVmVwWGNOR3Rt?=
 =?utf-8?B?N3p0bGxNRXFDaU9WZ3ZLQVErakRZbzEwUFNUV2RZb2NZRFBsZ09nZUVoNVpX?=
 =?utf-8?B?aVowc0hwTlZIMC85cFhBNzljV0MwUE0zVU1wcjF2Y1dOcm80SCt1Ti9FQlZ3?=
 =?utf-8?B?U09wL2krMVQ5eGtEWENoTC9LYkZFRTVIUEl1YjhNMC9JTkZIUng0TkR2N0Z6?=
 =?utf-8?B?QVJPWFlBa3ZWQ0k0eU80L21tRWVuZGJ4SXF5M3FXbmRGQktjSXM3S3dDRmV3?=
 =?utf-8?B?SVJSU1hrNVlBeWRjRHpUSHlUb0JDNUMyMmVLNXg3ZWN5UjU4OW1JaWZhbUtL?=
 =?utf-8?B?SGFveGJ1OUJnd3Z1bVNYVDMrYW94aXdYQUVqM01DOS9HaWhWaVRBUHhhNU5S?=
 =?utf-8?B?OUtqZENyNSt6aFF0aXMzWEFTTmNkWUc3bFQzN1VPa05YbUFOK1hoZlNEbldR?=
 =?utf-8?B?NVRNZ0tDanNLa01QbkFDR2p5VmU5UHZmN0c0R3VJWVZKNFg2SlpMZFBKMG1k?=
 =?utf-8?B?WnZHNmNRVkw1aUUvNUYxWTRDQ3hFellzSUdqTldQdVdPcmlUQ2pVNVRjNzIr?=
 =?utf-8?B?a0xoZ2xLL1hJaXozWjZHRTJUWWpvNTB1L0krN1VvekY5UE5JVG5LaXJDQVNw?=
 =?utf-8?B?Z21Ca2pFdE81OVo4QlBnOXRjYVJONFZUVFJwVmduNWJKYUdRcndDSXBMMUlo?=
 =?utf-8?B?aGUrZmxSaEtCVjJkMzFpZnFucFhKa1hjUnlkWWpnOXY0VnJNbUlZUEdlM3RR?=
 =?utf-8?B?T2ZCWk8wL1N5RmxXUm1LK0ZaQW1DbWQ5MXo1Um9YTGNxOE03SnYyYWloRy9x?=
 =?utf-8?B?cWVJb2tBU0kvWmd1cnRaWmRBcHViOVJJQWNvVTFBemdZZlkvcTBONzJ1MjJk?=
 =?utf-8?B?NVBsbXU1dzdicDRNZnBLV2p0aHRpajJGd2NicXZYRDBXYlB6OGcrTjFpcTE2?=
 =?utf-8?B?RkN5SjJtSkZVL3RoVjRHOXA3Rk5QdjdDMG55dXpPcGQ5ekJMc3l0STVtMkFw?=
 =?utf-8?B?c2Y2U21YNXBLRjBzbHJyVGRZUS9oL3VLSzE3ZHZ4V3lJLzRXK2FITEd5eCtk?=
 =?utf-8?B?ZlBvK3IwcU1IZlJaejZlNXpCaEZkMEFRZ1l3ZzFLdVNJTFc2a3laU0NYc3VV?=
 =?utf-8?B?a01iWGxjMzZDN3M3eVhnOVFHcUk4dXpFRjZQOWgxK0JmODFrRjFsa3J3QXVn?=
 =?utf-8?B?SzZiNkJBamVqbnI5MjBMZ0w5NDVCS0ltREpZUTlFb3BGZERpaG03VjhlNEhV?=
 =?utf-8?B?d0lZY00vYUhqNi9vMmRrOXhQMUd2ZmZpNi91UktUV3FNdXVDUU9oWW9vZnp5?=
 =?utf-8?B?UjlrYmR6QnI4bnozSDZwNmhtVG9wVHBnSTFZM3hBdklsMmt5TzBtTHFQRVVn?=
 =?utf-8?B?NUlONGJ1TEJUYTI5YjhXb2pobFBxTFc1aDYyN0VObVFLWlJaMUxXQkpRcGdh?=
 =?utf-8?B?VG5HbXRyNldiT251d3ZONXRsVy8wMUZnNTBVTHJxNDlwOVFia1E4UGxKcTBT?=
 =?utf-8?B?NEl2NU0zZUxlTER1Tk42akNzbzhOdjJTMzlxN1VqQmZBMEE1SHZCcy9pLzlE?=
 =?utf-8?B?dEI0bm5sYkFIZGFZeFNtQ0s3dUMzdW9GYkhxSStwLzE4MFg3aU90K1BtNUs3?=
 =?utf-8?B?RU00NGpiK1VjekRFQ2xWT29zMW1NbW05cndHWVVNWnVsRzJ1YW0xS0NYVzhw?=
 =?utf-8?B?MmZVYUc5clEvSitweFA5Q2FqUVVnZDRkb1BVQnN6VTErM1NMcHBDR0RIVnI3?=
 =?utf-8?B?TW56RnJsZ3lQcXpzOG44UUwrOVdSb3VTOU9lVUV2OGJteHZiOTlHQ0p3T0Fa?=
 =?utf-8?B?WkhPelRnMHJiZTlJbjJkdlY5Y0FhQVFOL1dsRGxCb1JUYXN2amtvRUJKMFE0?=
 =?utf-8?Q?+tYgl09pOdowzngM9gCVRqahf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a4ceec-750a-4b0f-9618-08db50a763d5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 16:06:46.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiO6lIpCeIcW5gUWaKxVkurgYZPs68OFS/JYK6cQqlJO8DhalPg4Z1X41MnPvoyHNlsVsJcg2y8hWTKq7XXsLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582

On 09.05.2023 12:41, Roger Pau Monne wrote:
> When translating an address that falls inside of a superpage in the
> IOMMU page tables the fetching of the PTE physical address field
> wasn't using dma_pte_addr(), which caused the returned data to be
> corrupt as it would contain bits not related to the address field.

I'm afraid I don't understand:

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -359,16 +359,18 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
>  
>              if ( !alloc )
>              {
> -                pte_maddr = 0;
>                  if ( !dma_pte_present(*pte) )
> +                {
> +                    pte_maddr = 0;
>                      break;
> +                }
>  
>                  /*
>                   * When the leaf entry was requested, pass back the full PTE,
>                   * with the address adjusted to account for the residual of
>                   * the walk.
>                   */
> -                pte_maddr = pte->val +
> +                pte_maddr +=
>                      (addr & ((1UL << level_to_offset_bits(level)) - 1) &
>                       PAGE_MASK);

With this change you're now violating what the comment says (plus what
the comment ahead of the function says). And it says what it says for
a reason - see intel_iommu_lookup_page(), which I think your change is
breaking.

Note also the following code:

                if ( !target )
                    break;
            }

            pte_maddr = level - 1;

IOW the local variable is overwritten right away unless target == 0.

Jan

