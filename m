Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D602C7CD5BF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 09:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618435.962081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt1Nn-0003PN-Gr; Wed, 18 Oct 2023 07:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618435.962081; Wed, 18 Oct 2023 07:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt1Nn-0003Ni-E0; Wed, 18 Oct 2023 07:54:23 +0000
Received: by outflank-mailman (input) for mailman id 618435;
 Wed, 18 Oct 2023 07:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt1Nl-0003Nc-Ts
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 07:54:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ba5a7ef-6d8b-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 09:54:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8169.eurprd04.prod.outlook.com (2603:10a6:10:25d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 07:54:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 07:54:17 +0000
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
X-Inumbo-ID: 8ba5a7ef-6d8b-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmPY7jfNsV6F4feHfrFKQJ8AcY592CshrT+3AD0Ngr9/Xzp6A6kTfSLVP2fZ9fBDqYY53H8hD7NR0k35RV0aeZU6xkVDQvEt2jZm8UBIkSWNnZ3WYhTuA2+7H2rTUWo9xmPu0x2Vx58rHgfwnamlwfZKqZtubjNVJ30GQPYw5jzjsOZ49A0XCih6ar7eD92N0xCwSqbGPXJQoqWjyrbFcSeKMI5QHWLh/Uq3vpNZzilfA34g8c97cgyXbnJofnC3k0H1GW3QBBuO8si9et14XADSVKjO9DguX5nhFvenNPa0RW4X89GF8kFh+0JJ0izBsIRBQLNeaWIVw4T+4ByjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyg6YN3Zh1a9d4JC5xIfee4oWWmRWWvhCuc2nePrjQA=;
 b=XQMHxAK3oAkx0RuaureRHqwjV5E//RUPobR6n1B+5bQrC9eoIpAlITpQYabedgldjTdmHTZTjB00nSKUGHjg4bxMU9nkzOLDGe7U8vLOeS+0l4nsaIUyCJbIW/s8bnFR8xLT/Z3V6cbAyWFxesVFoNOlckfUkA7fLeQMx52SUSqd0kx/LMRufK/uwGVEe9vUSbPDJF32s560/tZBjU2bLUsXUhXSwfF06IPrI/3845sefsYDNPDMLj+G/bWux/glDW5qXr7Z9lzrlj3MGNvLWmaf9nirJWt2sainE1f/NqsOr91CRqny/4KKtHjJHy+yAXZSIYJmZurwxNFIHt6v5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyg6YN3Zh1a9d4JC5xIfee4oWWmRWWvhCuc2nePrjQA=;
 b=z59Unp18YgQ2OKThTFNtMlKaHCjQ30b8iCfZyKfgyCeEiuG3LdwT9S0MIRaDpuK2GvbiBJG1xgOLqfygIRKZ5hNcszEKPP7ltO0orQYdCfPQHJ6V2qAy63K+wnQck0dUk3WkOTLPrlqxI7CMq9iA9nVyXeRjQJFJg/jOuZiP/GNRHSilEc86CuirwQcUL716YcCHwoNH08yt0WDPkkVS5fBUkhw+ut0hqthfD1Li/Pu25m66ExT5PJTKZSb17Oyaz+ZtX5TDHsaASr+QVQec5ytonOjZx8QvtP6dva5rOcuzov27vCkd39oNWHcIstQ4XAF19lwZ16dyD5nUUDicqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6e38ef6-87ef-d1f0-720f-4db6d307f667@suse.com>
Date: Wed, 18 Oct 2023 09:54:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] iommu/vt-d: use max supported AGAW
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
References: <20231017130943.18111-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231017130943.18111-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 01587c13-fda6-4a30-2fa3-08dbcfaf6e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5dfEy+XtvwylslbUNNzjUwmQLzULsn44FieqAk+DKLg9kMfb48TtEEEUpklLT+1nEFheCRv9LeJt6VpQdHJrMGLVn5LMi/YT7+OLLmCaholBH38jKRZ0kll486cNrIb0wYHCupWDYbwxlyTWWLuSW9rtJJumlST3B9ZHNWhXs4ZjFq69shdC6RuiMu1HklqUPDxhulodny3vcQhSvZcQmrmkoB3/g4MJLnrvGkwxwxvdWgVD2ZaJg812tpXU+tPPw8mORoR8ZnfA/NVSxpNDMdICa1StWmGxWhLYhDG6rKbXy1NRsmeEoEf9BsBkzP/e5zZKiQ/mbq2s3JHzio6qlyr6jCG3HGyL9zVIZe8oTXpALfEpiWHpwwpQDK8IeCU1opqRb9dsPQtXM9PRuvwC5l8vKBpWssDoHVCxFogqHGDfpIebgfvgl/w8oLcMWIlCAjtQrmB6i3bAbQ/S4axSCHXdzejzRi+2H6GzoLYkmcJjMP1IVXVll3YMEofL7NdFL10vkg5loaiRs24fUItlVlWaLDCNrIFzVVo/tOt+6OxFpeo0ECFSExq63H79aklGJmaEgdMDg+Btrflm1n9ynIfBB60HTQC/cL2rzeyoxl+arwZhog58joxoDSSBBbqb2fqPiYZZExktpo+Zdvku+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(8936002)(478600001)(6486002)(110136005)(316002)(66556008)(66476007)(66946007)(86362001)(31696002)(5660300002)(36756003)(41300700001)(2906002)(4326008)(8676002)(38100700002)(26005)(53546011)(31686004)(83380400001)(2616005)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzNJUEtnajlnMUczcysvVEpkTFoxK1hUclQrZXM4RmNiWkRkSVE4ZjZ3RTJu?=
 =?utf-8?B?aUpoM3B6QTlHVG13Vi9wMTdvdVI5elNadzFSNmZEejhYeUYweHNiK1ViUk1W?=
 =?utf-8?B?aEVad1M2TjhkTis4alZHemxIamVzQTcwblF3WFJJOHMyYzJqczZWNS83NS9j?=
 =?utf-8?B?RmRZK1RkT3RsNnNESTY1WERwS1pNa3RvY2pvY1NWelcyTS9FZEhvWGNyaTFW?=
 =?utf-8?B?cXJYWFVQTnROMkp0U0VqZHRva2cxRmJXeGpOWnVxaDhSeHhQWStMVklpa2Er?=
 =?utf-8?B?dzV1Rlh4ZG9pVTZ5N3FOekFrWlEwdVNsRENhUjVWUVdrc2JkVGNKZSt1VVJa?=
 =?utf-8?B?TVl5a3pLdm41ZUlSbGJNVDI0YlQ2T3liRnRrOTJkbnFwbzAySlVjR2F5MWdh?=
 =?utf-8?B?ZzcxYXFseE9XRVcyZ3F0OG1ZbUZPUUVIQms4KzMxZk5ZSHpsa1ZGVnkweHVy?=
 =?utf-8?B?alF6R1hNcm8zL1RUNVlTQlBhS3doQlJ3RmU3MmJmNEFGWjgrbFkvNWkyRHUx?=
 =?utf-8?B?bTRTRlpHOERqb3VTZ0YrNk1XL0RlZ0RhNkRSYm5mZnhNSllYanpDUTBQSG1O?=
 =?utf-8?B?T0Z4ZDJDWjFpZ0FsbWY1VzhrRmYwWWJVaUNWSnU2SVpyRjFObGdVRGhxVXA0?=
 =?utf-8?B?d0JSQS9CNmh1emF3RzdqYkNHeU9vQmNBWGJEMi9TaDgyRTMzcDFvVWdYczRW?=
 =?utf-8?B?ajhVaGFQaHlXOHN3UUsvTzJycmNqYmZYVk9tTTNtaytySEp6ZUcxbFB5R3ZK?=
 =?utf-8?B?MHRZWEFvRXpvOVU4TkYrdmVmSzl4b2NibkFiNlF4cUtpNExMWHJnb3lYUDZO?=
 =?utf-8?B?YXpyc3RrOHFZeUdtT010V2dPNnpkVmlhWkh5ZnN4SzZJYkFLdjk5NTUrNjM0?=
 =?utf-8?B?QkhnT0VpL2NXQXBJVjcvbHovZXZMNVNKazJ4RERkeTlCcXV4bDVLaUYxUUk4?=
 =?utf-8?B?aDJLdWM1OTFTclM0VVF5YThZZUZVS01DRFRtV1U3Z0FOUERMZkJVblBLVVUw?=
 =?utf-8?B?cHMyMWgzYkNqdFdhQ3JDOEpxd1N1a2dhNUJpanFlL3VxRmRwMGE1SkI1TjF5?=
 =?utf-8?B?N1paNDM0TXpEQXU3SCtzRE5Ba08zM05BQ1RoOWlxem1LczVYeHFlbkV6UGRX?=
 =?utf-8?B?aDEwZlBUcGR1REpyb0J4YTNudzN3WGhGdWtBV0VVcWU0V0haWEc2MWtYYjBL?=
 =?utf-8?B?YWp0VWpkRlZ6T2hKc1RWVUgrdEozTjR2a1VBb245bVF0Q0NrbURjZ0xWTWtr?=
 =?utf-8?B?eWdRdWlmQ2ZuWHd3V0EwUjg3bWRDTFUrZGdQUDMyKy84TGVUU1NWbUJMRW9F?=
 =?utf-8?B?MDdmYTBtZTg3d2hWREpjQW5FVmkzS2xYUmlES3dJSDNQYkhnK0dYSGJVR1dK?=
 =?utf-8?B?dWtnUlB0bXhuQnBjeTA0TmdBM05PL25yZVlod0VleWk4aElIbUdqbU1GSVR3?=
 =?utf-8?B?NjNKdTdDWW4wYjY1UU5CbzNhMUJaODhSZXFMZmRqVzVhWFV2WTFCZThYQktQ?=
 =?utf-8?B?b3FBa2x3ZFd0eG1jaVhpMk83cTVpZUx3d0xvcUJpdXRseVl4czdnRzBEcFg1?=
 =?utf-8?B?MVRPS1YvaHg1aS9oaUhjSHJxS3NxQWpsSEVzaVZ2T1I1djRreE43cmdRcXNi?=
 =?utf-8?B?TStoR01KN2FBQkl2eFZUZ1J3RTJRaHdiWmpjZmFPUkp2MEllR2kyQittMXlM?=
 =?utf-8?B?L0ovOEpNNFhmTVRMSzNxUG01WnlTV2ZFWWczdks2dEJ0S2RRRzBZclgraVFX?=
 =?utf-8?B?RzZEQ3VXOElJdTVCLzVaMnZEeVlVSmZ1RFc3TjI0M1FnODIrZkd5SVRGbGxN?=
 =?utf-8?B?eWpOMUp1UTh2cDJxMzlEaHdGZ1FwQWNubGc4NlYxbEtzWkJBOVB0c2dxQTll?=
 =?utf-8?B?N0p6WkNDVXFCRTVvR1luTWF0TGQ3Y1VSSjFkTThtdXBGRUovZ2duNzVZbFhQ?=
 =?utf-8?B?NFVOS3RxWWNsVng1cVplN2RJMHRibXFuTWhPN2pCZWVPZFlTRkpnQitWc2gy?=
 =?utf-8?B?cGRFTVljaHZYODdZUU5qd1RJd2VxQWdsc1lQbmlIbDl0WkpPOXV4ZmtZcXZx?=
 =?utf-8?B?eW5udVBtZ2Q0YzQ1VE5KdXp3eW5EcEZ3ZzVwQjl1b2pHRGQzT284Um90VnZk?=
 =?utf-8?Q?jCg3L4v72QKx4I5gHsdWky22Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01587c13-fda6-4a30-2fa3-08dbcfaf6e0d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:54:17.6976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lY+Ck34oRsYmKpt7hh549/iMXFc6e6Y6mBcMqlzxelQzETQ1Qf+/tyEztdR5ecNsY8JBi1btPOjjRSQkAgge1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8169

On 17.10.2023 15:09, Roger Pau Monne wrote:
> SAGAW is a bitmap field, with bits 1 and 2 signaling support for AGAW 1 and
> AGAW 2 respectively.  According to the Intel VT-d specification, an IOMMU might
> support multiple AGAW values.
> 
> The AGAW value for each device is set in the device context entry, however
> there's a caveat related to the value the field supports depending on the
> translation type:
> 
> "When the Translation-type (T) field indicates pass-through (010b) or
> guest-mode (100b or 101b), this field must be programmed to indicate the
> largest AGAW value supported by hardware."

Considering SAGAW=3 was reserved in earlier versions, and considering SAGAW=4
and higher continue to be reserved, how is one to write forward-compatible
code? (In retrospect I think this is what mislead me to wrongly use
find_first_set_bit().)

Furthermore, which version of the spec are you looking at? The newest public
one I found is 4.1 (-016), which only mentions pass-through, and only as a
2-bit quantity. (Doesn't matter much for the purposes of the actual code
change, but still.)

> Of the translation types listed above Xen only uses pass-through (010b), and
> hence we need to make sure the context entry AGAW field is set appropriately,
> or else the IOMMU will report invalid context entry errors.
> 
> To do so calculate the IOMMU supported page table levels based on the last bit
> set in the SAGAW field, instead of the first one.  This also allows making use
> of the widest address width supported by the IOMMU, in case multiple AGAWs are
> supported.

To truly achieve that (with the 5-level spec), ...

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1328,7 +1328,7 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>      /* Calculate number of pagetable levels: 3 or 4. */
>      sagaw = cap_sagaw(iommu->cap);
>      if ( sagaw & 6 )
> -        agaw = find_first_set_bit(sagaw & 6);
> +        agaw = fls(sagaw & 6) - 1;

... the mask here needs widening to 0xe. But see my forward-compatibility
remark above: It may need widening even further. Yet I'm not sure our code
is uniformly ready to handle levels > 4. As a result I think we need to
further alter the use of context_set_address_width(): We don't necessarily
want to use the maximum value with CONTEXT_TT_{DEV_IOTLB,MULTI_LEVEL}.
Specifically I don't think we want to use levels=5 (aw=3) there, until
such time that we support 5-level page tables (which as it looks right now
may well end up being never).

Furthermore just out of context we have

    iommu->nr_pt_levels = agaw_to_level(agaw);
    if ( min_pt_levels > iommu->nr_pt_levels )
        min_pt_levels = iommu->nr_pt_levels;

With fls() instead of find_first_set_bit() this won't be correct anymore.
Yet looking at the sole use (and depending on the resolution of the other
issue) it may be a mere matter of renaming the variable to properly
reflect its purpose.

Taking together perhaps:
- nr_pt_levels needs setting to the larger of 3 and 4, depending on what
  hardware supports, for use in non-pass-through entries,
- a new max_pt_levels field needs setting to what would result from your
  code change above, for use in pass-through entries,
- min_pt_levels could then remain as is,
- for the moment we ignore the forward-compatibility aspect, until the
  underlying principle has been clarified by Intel.

A possible further complication then is that we will end up switching
context entries between different AW values. That's not an issue when
we use CMPXCHG16B or transiently clear the present bit, but our best
effort fallback would likely be of security concern then.

Jan

