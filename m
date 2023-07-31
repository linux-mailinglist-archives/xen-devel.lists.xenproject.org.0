Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7367769AC4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 17:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573145.897571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUo0-0004yw-4O; Mon, 31 Jul 2023 15:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573145.897571; Mon, 31 Jul 2023 15:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUnz-0004xC-W4; Mon, 31 Jul 2023 15:27:31 +0000
Received: by outflank-mailman (input) for mailman id 573145;
 Mon, 31 Jul 2023 15:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQUny-0004ww-Jv
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:27:30 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe16::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0b4505e-2fb6-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 17:27:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9770.eurprd04.prod.outlook.com (2603:10a6:20b:654::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 15:27:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 15:27:23 +0000
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
X-Inumbo-ID: c0b4505e-2fb6-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr4lcPlTy5eouLrGoZzpkqukohLFkeRw+I5LaUgrtnZjQc81Y0tyyNuXercD5KwCHp8DvTWHpmRnSi48BXF4rHhcciAuoHkkstHvnBfqLnXAvtHmVF0ngAju+1LIaxwgAbdRXsWPbFVhBvZCBiGGVY7vFnl4fNCYfN4QL/lpNy6UgRU1qcKoNWjMykEqSks7P6xVZl+T8dVRo7G8T0zSFR9KwTan1GHlayBDogbJAlH96C8LF794PEqj4cmmR0xfUY3adJOVx5w75gBrHHsjc9ul2rKqGgGlp8MXu5t5rSQEcY1k9KNOF8ya4+pXtsqkTfH+jxYg2ZvsmXk7h/meMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgyXJifNPbPXkToFim0/Zhr51r9tThsgLGbrHxY09Hc=;
 b=crcqQbOViEXO7N4Z03m9DtpzSqjWc7y25DqenJ5E9W9p3AvOAr3yYzX1i0ueqYIYzkhSp0G6/QlV/tS4x77KiUXLxhTFPekYG2RiwaXP7rHUmFTJzndJh2XhrQSdvaYGMxJF2VDxpAo5YwQCHu/kl8W4qPj8rQBpBGllDg2eBUMHSKZAWQbAqaJV5g6Mtdm2V6aK3np35HHSNqAHVaCocF39wvbZZL0rFpRhPC8Nw/RYx0QXamfs9CJOQpnNm3+UQOVcUGwaoWs/mBcNE622nAJ9Nr7vhP0jmmgU/lvHKs4/PUQ4CPl8LLAkwyra/JEUBPOmVTn7UZnh1MRfEMvUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgyXJifNPbPXkToFim0/Zhr51r9tThsgLGbrHxY09Hc=;
 b=jm5yaldA/bPLT7E7p+QSL1f/mUB1Wk2xVt0HfyrxhcrVTeTlGrPlYMUaZ6XYzBtm5o0/0ixBJGw9+h0165KzpYWC7qfsf5FHUTghpSxchXvTtfrGBoqemDAShVT+1Yjp3Wh0U9eA7CD2Ux3Et/udL5iPbI/5hWp7SOOLLt6lJFfy65uCqMa8lHopPJJ1jM/dsismmG53/+isMdrtkH0Hl9ifLcVzIaSXwoOrrsUDg1k70Sbi/0ndpzELmDmT2/jfPnSEwaiaGl0GToTnKnTUlOKY4adBwVc/gc4M0z61SUeSX3pQZDrqcrD0PpE1N2BINNFsy01ZkcP7fWsSo9oUPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca38d130-ba56-33b2-3134-3b8d4d0dc4fe@suse.com>
Date: Mon, 31 Jul 2023 17:27:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 3/5] mm/pdx: Standardize region validation wrt pdx
 compression
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728075903.7838-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e81ce1-d30c-40f1-b2c0-08db91daa376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zU7jhrQXSLOlQYdcEaEzrnFYRWnLfAbUT4Ghhnf1ClDTEntx90TC60C+Zcee2EfBJlxXWRIm4vuIboKw2FrdzNYQTwyiHW791jnMyec5iVVy3Fwz5fuii/UhfydsS8JjG2cubJ+iZPOXBVCNCebpz1Ns7QCI5iG3cZR59j5ExI36M3vYCN6+1CyrL4wARZoP19Vu0hPBQt+lzICudD/TtpDNDs2T9J7C9/Tz1iZu6B1NEhgms3RjO4D5fCAXnUSINpYheGrRqd7SlIXzgh96zXdzDS1b+RWO89q1UBfCWcSd3ov72iGXkhp+oWdo9rYPEEdhMeHYF251B/2trM5J5LN/awg/MXWcr8bOxSBlkEUx2SBYPbeYDVAXa0Wvzq13wEzFuobcJAB27T8X9MiICK2PgpfoVHTXxWUhG6/vrTiPoYFzIZ2p1DxNKrbQVsc/Hwxs7E0J4DlE3+hFCJ+4++1RQ89wB2FZ9/jI7YMrVvPQG/vs768luSd97gsh4/+oDbUv/mv3DupGK9JURMuirgspqJ5Mgzkg2bFMjjUAlkg3rGYOI1pWgjjk3lp9uWb9RPM7cFlrjT5yGbHnorlI1+n8CQMeLwnWT1Ar3//w+zqEmx53WHns7f8xuh9BAxiTYfZyHXFbV7lVbSrl1nYgHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(39850400004)(396003)(376002)(451199021)(41300700001)(5660300002)(6916009)(66946007)(31686004)(8936002)(8676002)(54906003)(4326008)(478600001)(316002)(66556008)(66476007)(2906002)(6486002)(6512007)(38100700002)(53546011)(6506007)(26005)(186003)(36756003)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmc4SU01a2UwZHJNNXYvVjVpSy9KSXIxS2F5TmVpaG9pZzNqRlh1QXZxaUpK?=
 =?utf-8?B?OEdOd0tpRXpNNkIxdHBkZFlud2IrQ055YS9PR2c1ZkdUalBWdlRIZ0FEZTg1?=
 =?utf-8?B?SXR2ZUI1L3NObnk0OEE3VTZRUmp4dUtDN3VsNmFlUFZzT1pjUUgwSWxoWmFU?=
 =?utf-8?B?d3VkOEp6Nzd6bTRldE1Eb0lVT1crNzVLRE84RzdBeVlCOExMT0F3Q2lWTDJT?=
 =?utf-8?B?ZUkvQmxESEREUUZwanFiNGU3U1Rjc0h4Tk1Ob3o3aEZDTWlOd2daWHdnUzZL?=
 =?utf-8?B?TFJnRXEvclg4S1JsMmU2NnB6V2xBSFFCN3pKMFdjblFuV2JBUU83WGNVa2ta?=
 =?utf-8?B?UkE4ckN6eXI1Y3RIRGU2cUZjS1dLQlk2d0M2OXdSR0JGTlNOR1hrc1pKWTdR?=
 =?utf-8?B?cEhEUURXTGowYUNyN0Z6eHdYNW13c1ZUNFJuQnl5c3ZZOW5SdzRHZnozcGNn?=
 =?utf-8?B?cWg0QlV1WHltVDMyMVlFKy9OMnFkUjl5alZGOVZuaUtqY244Z0FUMlFMK3ls?=
 =?utf-8?B?OUVEYWpveWcwN2k0Zkt0WVY2MG5md3lCcFUvS2RMT1FiYnpSNUpsczlRaWto?=
 =?utf-8?B?ZWJZY1A3dHppUHk1WlpBMklnclZXaTQzZE5tNWFCd0UzWC9TMmxrdDBpbStM?=
 =?utf-8?B?dnRCcVlqS2c0QXlZaXV1Um8rV2dTM3lEUWF1V0F3TGZIQ1NCOGlvemNFamh5?=
 =?utf-8?B?MUVDZHhHdjlzZWNSUTRoNlFFMnBFV2pQVVVaZnhnRUI4MXg3MUxPSWhrTUh3?=
 =?utf-8?B?ZFlPRUJsa1JlZllXb0RSdGNzcnNWWXBWK3IwUno1Mks1bllmTmY3Rk9weVhv?=
 =?utf-8?B?S3A4Rzg4ZFU0MFFtZ3cxNzB3cUhTRkRBY01WdEwybmhRMVp3YnV5YU9OMzl0?=
 =?utf-8?B?QnRMWG5xMi82OUY2UkwyamRJU3Y2L201SDMxcGZ1Qy9ETmJtM3NxYmZFb1pz?=
 =?utf-8?B?NFA5dkN6ZERZb2pNT3hvazVOQ2k4aWNNaTZGY1ZwSnhMT1RZMnlZenEra091?=
 =?utf-8?B?SUxuYVRlVjhsaWh4M0xJa0llTWc3Smwzdkd4Zi9VK1pKRURTKzkrWU1rVkVL?=
 =?utf-8?B?Y1g5THpHdmNhM25NaVhxTVQ4YzEzK0VKWmJLNkdVZkxyVUtEMFBWRy9LMlMv?=
 =?utf-8?B?U2xYNmRyWjlhTmhWRnZBUC85VFVPazJOMC9PT0RaV043NjNUbXF5dnNOS3pV?=
 =?utf-8?B?amRiL1IrYW9MU3NzUWFTSHIvWEt3N1Nna1UyTFlsRjhRaTlWWHY3VXEwT0xv?=
 =?utf-8?B?MjI5Nk9YOU9VZDg5VVJEL3ZTaW5sc0JVUHJtVG1mbWsrdzN2NlRZQnpIQm8x?=
 =?utf-8?B?czJUY2w1Wm1KUU9MK2dOK2VoR2xrbld2UENmQi9LcUY2aTJxeUFrQmg2TWZ5?=
 =?utf-8?B?cVE1Z2pENGkzTmxQL3BlU3VmL2JyTUZOMVVwcVllRjlxMURwR1cvTG15MWE4?=
 =?utf-8?B?RzlKUUVCRHRONk9pckZmemEwTDhqY1dIUENwNjVtTWNXUkc1STQ0MnFaR2p4?=
 =?utf-8?B?TEtyUnZCam8zemw2V2h5TkJyc2xrNzM5UHVpTGttUTNHNE9EN28rZ1JxQUsz?=
 =?utf-8?B?YXJLbE5tL0tFUGx0c2hpSVRnbkdTdzl2RG1PSFlnR1k3STVoV3prUFdaRmc0?=
 =?utf-8?B?LzAyRkFJbE1jWnp0cHdyaTRtV00yL0lrZlJCM2hQOG9mQXZyeVR3LzREVWxl?=
 =?utf-8?B?U3U0bEZiTFhTWG15TWRUbU9vR1BnTTBtbzJwRWhIUXU0cHp3MTh1aGQxRmZY?=
 =?utf-8?B?MkVlT3d1dUVKc0pVc3hVZ3ZBWGplVWlKVUQ5Ky9ncVo0ZTJrVXNPN2lzeEFr?=
 =?utf-8?B?Z1lsNjZUT2lqNlJ2Rk1iaFRqcjJLTUtGYlNnWTd4eENWYzAwWW9rTDNNRDha?=
 =?utf-8?B?OFMxK0x5dlBXazB2RjgvakpnOU5KYTJIRC92cUxiTXh6OFJaRUxqZTRpWFdN?=
 =?utf-8?B?aE80TFI5MnhQUURucXh4OGtKTWJaUXBvYVRWQnY0UVRQY1k2SDh5OGVyTHN1?=
 =?utf-8?B?dC9kOHh5LzZWRzRySTN3QnVLSEJGUERkOWNyMVVmWVFSQXZ5WEJnV21xVWpK?=
 =?utf-8?B?bk5LN2dPcm9kME5CbWRKdnA4dU9xNnV3N2plNDhBbU82Ny9kN01JdW5udXFM?=
 =?utf-8?Q?4HWTKomMNviJegsHBCgm9lSRF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e81ce1-d30c-40f1-b2c0-08db91daa376
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:27:23.6121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUuqS+fuxiiV1hfQMW9gRtKpqvwwBG0CbKveY21RB8BxaM0H6VhvjIHAGvrMldCR2y60b3Y8eT7zJgR1bsJFmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9770

On 28.07.2023 09:59, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1159,6 +1159,9 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
>  {
>      unsigned long s, e, length, sidx, eidx;
>  
> +    paddr_t mem_base = pfn_to_paddr(spfn);
> +    unsigned long mem_npages = epfn - spfn;
> +
>      if ( (spfn >= epfn) )
>          return 0;

While occasionally groups of declarations indeed want separating, the
rule of thumb is that the first blank line after declarations separates
them from statements. I don't see reason here to diverge from this.

> @@ -1660,6 +1663,8 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
>  
>  void __init efi_init_memory(void)
>  {
> +    paddr_t mem_base;
> +    unsigned long mem_npages;

Why in the outermost scope when ...

> @@ -1732,6 +1737,9 @@ void __init efi_init_memory(void)
>          smfn = PFN_DOWN(desc->PhysicalStart);
>          emfn = PFN_UP(desc->PhysicalStart + len);
>  
> +        mem_base = pfn_to_paddr(smfn);
> +        mem_npages = emfn - smfn;
> +
>          if ( desc->Attribute & EFI_MEMORY_WB )
>              prot |= _PAGE_WB;
>          else if ( desc->Attribute & EFI_MEMORY_WT )
> @@ -1759,8 +1767,7 @@ void __init efi_init_memory(void)
>              prot |= _PAGE_NX;
>  
>          if ( pfn_to_pdx(emfn - 1) < (DIRECTMAP_SIZE >> PAGE_SHIFT) &&
> -             !(smfn & pfn_hole_mask) &&
> -             !((smfn ^ (emfn - 1)) & ~pfn_pdx_bottom_mask) )
> +             pdx_is_region_compressible(mem_base, mem_npages))
>          {
>              if ( (unsigned long)mfn_to_virt(emfn - 1) >= HYPERVISOR_VIRT_END )
>                  prot &= ~_PAGE_GLOBAL;

... you use the variables only in an inner one?

> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -88,7 +88,7 @@ bool __mfn_valid(unsigned long mfn)
>  }
>  
>  /* Sets all bits from the most-significant 1-bit down to the LSB */
> -static uint64_t __init fill_mask(uint64_t mask)
> +static uint64_t fill_mask(uint64_t mask)
>  {
>      while (mask & (mask + 1))
>          mask |= mask + 1;

I see why you want __init dropped here, but the function wasn't written
for "common use" and hence may want improving first when intended for
more frequent (post-init) use as well. Then again I wonder why original
checking all got away without using this function ...

Jan

