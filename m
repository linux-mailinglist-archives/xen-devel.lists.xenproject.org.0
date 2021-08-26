Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A343F8701
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172977.315631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEDC-0005DI-4P; Thu, 26 Aug 2021 12:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172977.315631; Thu, 26 Aug 2021 12:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEDB-0005Az-Ve; Thu, 26 Aug 2021 12:10:25 +0000
Received: by outflank-mailman (input) for mailman id 172977;
 Thu, 26 Aug 2021 12:10:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJEDA-0005At-JM
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:10:24 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4476dae7-5990-47fe-aa27-a3908331f9de;
 Thu, 26 Aug 2021 12:10:22 +0000 (UTC)
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
X-Inumbo-ID: 4476dae7-5990-47fe-aa27-a3908331f9de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629979822;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TaHf9M+qx/tN7LVZKGfHnNu9xVIOpi0Peww4wHa8yEM=;
  b=PfD4fd6mv+F4acGfmh5VzpliCxdDK4pbGdNucxv+iRlhZJvoq43YzRsQ
   HOokdeOjVuYlHvKC2Y0TcmeaFL9VM6T/MrvTH7+u53CXA+1hJ4h6zBsTA
   hvU+RO6ttcgfkKnCCDw9nKjOgQBlCv0uLipUojBz/YKls/ZOJLRhHkrSR
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1Nu4iBAF/LHP3f+8rPQFnvcMEZgU6sxdTdp/+obg3VaXUbIdqv+CR0TAk3iOvn7COi/rc+k+Di
 YjyQT7N2e6T1qKUPrxOmhyZYn5Wrgy9xdKtDib+kghf+WuHBTgQ+WSEMfvp6OIZ8YBR/BHiCnR
 tI0QxQt2Xt89rShccaD2ySQ1PHcU9Bx/0NEFGDX695OrdWICx382K7WfWlriDVsXBE0E9Yo2fR
 SpqivQezDotDVYecyM4Wrm5OBTzBG7sb6Ocw+2zUIqb8kGuYeE0VuXI4ltqcJ8IStbxbgxnMeK
 qoEkFbQ0toonor3Sa1hs3FkV
X-SBRS: 5.1
X-MesageID: 53091430
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RkGczKGex76HYA4kpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="53091430"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJuPnJOzNi/AOz4iYvbycooZBP0KwZTbtpnIBAwAdvaPO95N5MTig8/6tv899Aw3MTfPT87Jxo3v7Q5McFVvCudwJ1KhM/zc0E0Hc6U6SjvMi/lNu6CuC15U6guP00c9CjI73ixlKkzIp0eIjTPeCfUL0Lb+bYALW53wOfn00HkG3OlaFuLOUFPz+G8t3FgrFtsnVpFN9jZMwQ/ZIXyWEZYzIyTylLQDdgZdimen3vLRFYX4XFcGFm0qp6zUhoL+slwTilHjsGMIfNd0lx2WxfSWuwHAIsG6uKMqKeZGAtyxRE7JQ269u3eGCjxzyqe867R7g0ZPoYMF/0yExykeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7Uc5TIHZISEM7DFkRn6MOnP9gHt5BLon77i8zu0xQ0=;
 b=lHD4tYcZtKaDutZIV8twZZTo6mkuYaUGv85D/e/YhkU/AWg2vEOsZ32bo+cuBvFld8Oo9DexJoDBzywfw+DaWqu+3Wuvq/c0KkFvyRsSJUTAyOes6K2rubfDjGKFybcbyS0qxLHnDPRHxVEXKjoI74YjxgQvIJdaVxVfE6q+HymLWy7XrLxKciS5yBLL4A60pkO+zzRX2uGP9s0INzp6dOlIt3fp7O7YaAOtSDmDYq9tyu6YNeZFdSlhfJI0wCnpA01wPBfKRs7LxMCOzVyP+C9W0iAxnIpRfbk5j8l3YqbbCTdD1ldZxitmby1D0C3gCyL+CWbMVORntHsSfgOqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7Uc5TIHZISEM7DFkRn6MOnP9gHt5BLon77i8zu0xQ0=;
 b=X8YU5xvx7zcPPvEy5Fxp+pWhwJRFOJftd18OYphnOEW3IflTeXrAh6+glBKml5HrxuErJ4xPN+3t/hYVRQ39N5H/TwMrmj9DCX8xlw6QaN2/Hptcir4vuWOISTT3E1iKSgsPlDKFzY+y162rYisG+MMM9qUw6r53kttJz5Hy80o=
Subject: Re: [PATCH v7 1/8] AMD/IOMMU: check / convert IVMD ranges for being /
 to be reserved
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <133d60ab-0de6-4831-7387-0ba9cf6efb5b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <88994b1b-a8b3-1207-5ac9-dac50c383a98@citrix.com>
Date: Thu, 26 Aug 2021 13:10:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <133d60ab-0de6-4831-7387-0ba9cf6efb5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0455.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6babfe7c-dff1-458e-2ca4-08d9688a792a
X-MS-TrafficTypeDiagnostic: BY5PR03MB5046:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5046E4F3D8D2F5F402E11F89BAC79@BY5PR03MB5046.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RTQ1TFAnxkPiVkn1aaV9FLVncAE6ijU8daKZWVS31F8ksNJcvuiB43EF6tEvmKWZhmtS7pgafkXpkP4Br+YNYIJclzG4/jqUJ12JLD9isA0HQdeepIfVd7yCwZiOk7OLb6Q0Saodai0JsY9DPgxDPfGt5gps8tpeZ1GYBHV7I/aLUuMmrciLFWLChn1QFrijCLAqtQDGOInmFEv7+2DDWJ6GSrwKwbXaLticclITHdm+quGM1qkhA4a5NV7i4JNnu5jVHjJttZo4zsOb4jz2n2dibhSbVfJBDLVqEmLNbf4OALPkur7stboTWp+zCZqcebngEj0HW1HZGe4WcRyUs9vsYcByu2i5LVy1H8kxO8bLJfQii/MuDdRGzOih7uR8xj6PBnoEx7a2fjrJQpyHT7QNiy0XeUWD5jYWCFsXOpn0EAKBXqeqekgiI2UKEZ4q4B+ta4B08QZ6gaK4JVY1lUuw3IeTLIVslansny7mRE8rlqUwSFy0cIjHni3I26ekemg3pB+lC7yf/CYF5Skycxa096yDQ09wNZ517+4QC6+pB6MLUzWwUC0GtMotqaqAiuyQvWcATDp7tjvTYz4YlWjjlt8KOer72k+ohmvRHtRLvjKIC7ViHaxBxjNFyuKJSq6VCjL486scdSbwGuNYeFx9Hte7pDn/+hqSjteYktksYoU6fmDyGJBIJ/ctUw5bt+Kc2blyn9/o3S6zK1zQ0F0aV2JcNPU7dC+DijpeDBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(16576012)(55236004)(4326008)(86362001)(2616005)(66946007)(8676002)(66476007)(66556008)(316002)(956004)(31686004)(110136005)(6666004)(38100700002)(2906002)(36756003)(53546011)(31696002)(26005)(186003)(5660300002)(508600001)(6486002)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dldmU2xlMVREUHNtYUh2Z2dPTHAwd25pOUUvc2ZLUCtpTzUzKzdWOTQxRDg0?=
 =?utf-8?B?dFcyV21pNEFIeW55MWZkckVKZWhNM0FqVFpmVmxxWDU2YTVFUnFySXRrelVY?=
 =?utf-8?B?K3hMZ0FHSXBIVm1YaUhjbXFTSDRXTWVZdmRGRllmR01TbFFoelhhVGpqOThZ?=
 =?utf-8?B?RE5KdytGdmJ0dUJLYmw1WWl2eHNlMnAxa0VqSEhyUm9UYjlQTnVWbnhLL2FG?=
 =?utf-8?B?Q3REN0NzbVBueDdUQS9EbDZ5WS9vZmNJQmhjQTNqSHdsUG1zc1Jud1dFNDhC?=
 =?utf-8?B?Q3FBaUhnSTlFMkZ1RFJOMTNKTDRCWlFKa2wrYnlubjFYMVR4TjZyQ2IvWVpZ?=
 =?utf-8?B?aEtuUS9VeEdDd2FUOFhjRW13QmVlRmZia2VMUUtiZ2RBdnAxSDFZeFRWQXNW?=
 =?utf-8?B?KzBsYm5JWTRHWUZaOTd6WG5ORy9JbzRzb0pIQU5FeGFKbStxS1loTHJ1bmZl?=
 =?utf-8?B?WkVMNStCeFVLSFpYR3pUNnpTbnhpaVBGRjZxcW5mWCtUK3VlakVHRnVUYVFJ?=
 =?utf-8?B?NFZWZXd6QzdjbjlMUUFqM01lYnRZVndDb2VTTU9BRmdwT2NhMXd1bnJiQ0Rq?=
 =?utf-8?B?SElTMGxqdmFGT3RUNVM1Y1p5SHkzKzJ2TDF6bmt0Wk9PdS8wYWExOG5GTjdi?=
 =?utf-8?B?ZXN6amZNUnJMKzZSenpUWFpkU3FrcUxIT0Rla1lNd20vSEZReXVQbWtjYVZI?=
 =?utf-8?B?cCtaU3gyRHVSOFUrdnpQd2dONDFnWkJjc3Q2ZmtxZmpPYUl5b0pCSmtoR0Fx?=
 =?utf-8?B?amgyTGgrWGF2WldtWU81Z1gxdzBPSUFXQXdMMzN3ME5LRE81dE5ZbWpoakFN?=
 =?utf-8?B?YVBLemRlUk1FeFMwWGUxd0p0SlFDVFJyeGc1OGNJdEV6eTVtdWZXcTBvVFVa?=
 =?utf-8?B?aCtBdSswMDhLQmFkYzFSZDZVOWdDWnhCb09QTjAyNGppbVZrTW1NOVcyQ2lF?=
 =?utf-8?B?ZElpamMzTGswVXBXcFE0dU45MGlYdE1JdXErR3YvZ0tMQ3NGenlTZ0ROaVF1?=
 =?utf-8?B?bDdvc1VwUHVNanRYZ095K25BaW5BV0NXbWdyN0R2M0JUK3FZcXU3MTBybWFI?=
 =?utf-8?B?blgrQmo3WEljd2ZhMGVGT282MUMrUVY2TC9UOWU1eSs4OTZ2Vi9BSWxKN0N1?=
 =?utf-8?B?K3JndFBnSTltcTJCRlpseEt4am1rRTJMRHJHN2xiaXk4ZUFZZ2Njc1NKWEhD?=
 =?utf-8?B?TXpETVVWYXdpYXYySWtnTHVCWHM0Q0o2SkZMLzR4WVZaL1VJTXNGUTRPQjJU?=
 =?utf-8?B?QVBmcHF1V0R5ejBOZnBXTDZxV2Z1Z0ZLcE1SR05EYjVmZXRjMExNVVJGd1JO?=
 =?utf-8?B?MHlONmUyYlkxc1FrcTMvb282T0NGeUt5L0E2bTF2bkFPcVdzbkM0T1NyWjFF?=
 =?utf-8?B?dE1xTGdtMjY3dUlZako3aVRUc3RLVlkyWkk0bkx1Y2RiZEpWY3V3azBGS2M3?=
 =?utf-8?B?TG5ZL0s1a2tIbVhRWVlIZ2pIS21zQVBMZ01ndERzL1g2MXplME5SbHViU01C?=
 =?utf-8?B?UldOOW9La2xDMzVHZU5BdUZaWHNldUVkZlJwRmt2Tk92cXZTbGJEQ2EzaFJ5?=
 =?utf-8?B?dUozWWRtdkVQalB3L2ZLTUFob1F5V1pUWGlOZUJPTk5OcTB1MWtJV3o2YnMv?=
 =?utf-8?B?SSs4UGJ3MU41OXo2RXBETjFtdE9KdWZyVm9wWHBCRGVncHB2M0xlQi83cjcr?=
 =?utf-8?B?eGd6dWJuWnZzbzJMNVJPM29EMExOWDRSNithRkVmTDdGN3NNZXZnZ3UreTQz?=
 =?utf-8?Q?KEAiRoxka/eMqkGuZesiG/+SqVfze5lOTGx4cxA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6babfe7c-dff1-458e-2ca4-08d9688a792a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:10:19.8347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaqgJgBVyEWZZvAAQiMIXgwjYI72xoc84ID+IQsHrnk8XIMSR6zGDZFdwTNH5O3E3irHFIvPnK+FG3BUR2FU6xLatTXSEDjJ7tE5XihBVnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5046
X-OriginatorOrg: citrix.com

On 26/08/2021 08:23, Jan Beulich wrote:
> While the specification doesn't say so, just like for VT-d's RMRRs no
> good can come from these ranges being e.g. conventional RAM or entirely
> unmarked and hence usable for placing e.g. PCI device BARs. Check
> whether they are, and put in some limited effort to convert to reserved.
> (More advanced logic can be added if actual problems are found with this
> simplistic variant.)
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
> v7: Re-base.
> v5: New.
>
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -384,6 +384,38 @@ static int __init parse_ivmd_block(const
>      AMD_IOMMU_DEBUG("IVMD Block: type %#x phys %#lx len %#lx\n",
>                      ivmd_block->header.type, start_addr, mem_length);
>  
> +    if ( !e820_all_mapped(base, limit + PAGE_SIZE, E820_RESERVED) )
> +    {
> +        paddr_t addr;
> +
> +        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not (entirely) in reserved memory\n",
> +                        base, limit + PAGE_SIZE);
> +
> +        for ( addr = base; addr <= limit; addr += PAGE_SIZE )
> +        {
> +            unsigned int type = page_get_ram_type(maddr_to_mfn(addr));
> +
> +            if ( type == RAM_TYPE_UNKNOWN )
> +            {
> +                if ( e820_add_range(&e820, addr, addr + PAGE_SIZE,
> +                                    E820_RESERVED) )
> +                    continue;
> +                AMD_IOMMU_DEBUG("IVMD Error: Page at %lx couldn't be reserved\n",
> +                                addr);
> +                return -EIO;
> +            }
> +
> +            /* Types which won't be handed out are considered good enough. */
> +            if ( !(type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
> +                           RAM_TYPE_UNUSABLE)) )
> +                continue;
> +
> +            AMD_IOMMU_DEBUG("IVMD Error: Page at %lx can't be converted\n",
> +                            addr);

I think these print messages need to more than just debug.  The first
one is a warning, whereas the final two are hard errors liable to impact
the correct running of the system.

Especially as you're putting them in to try and spot problem cases, they
should be visible by default for when we inevitably get bug reports to
xen-devel saying "something changed with passthrough in Xen 4.16".

~Andrew


> +            return -EIO;
> +        }
> +    }
> +
>      if ( ivmd_block->header.flags & ACPI_IVMD_EXCLUSION_RANGE )
>          exclusion = true;
>      else if ( ivmd_block->header.flags & ACPI_IVMD_UNITY )
>


