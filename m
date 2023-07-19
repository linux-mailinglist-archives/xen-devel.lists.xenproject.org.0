Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB05075933A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 12:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565750.884207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4ZA-0006AP-Bi; Wed, 19 Jul 2023 10:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565750.884207; Wed, 19 Jul 2023 10:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4ZA-00068h-8Y; Wed, 19 Jul 2023 10:37:56 +0000
Received: by outflank-mailman (input) for mailman id 565750;
 Wed, 19 Jul 2023 10:37:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM4Z8-00068b-8d
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 10:37:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 501c6514-2620-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 12:37:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8896.eurprd04.prod.outlook.com (2603:10a6:102:20f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 10:37:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 10:37:49 +0000
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
X-Inumbo-ID: 501c6514-2620-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCZIVOOSi5ntzLRQOwPgdYoMpPKe5KTWe8+sW1E9dbM+7zDSDEm7aiLt1g6qpGhTl2yT2FA545kzebqSnLXhbiwXFM74ZxOL2AXpRdhCvuPP1QUCFPzSqIV9hlJzs/LK0E2EMhIim4O7Ns6RDPUbDgfOcbhjc4gVfOUns5d8P8drtKcZDTUaI47yVOyNcICId3iTYivfxI0VFJrseEfa/dznalrSx+hZwC4T2nTDWpXBPWuuaHIR/qO+Whea4X0pjCrfSkBQYLJ2mkfmnobCX8bJtwzr40m1/EEv/QPYxuSi7Mw6WNNKhZIIvNW+MLqHXFYeC3SwCCGQg1iRCOQGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boKYeskBoVVN+9Be6chLP+CVNjavAA4cY9VIWJlCCfE=;
 b=JBGGHbzZ9c4SYeq1dgZmljbaSGrvL5L91pyGvcqVeqeNIR3ZrPHI8vaaTyJUu9l188wYxdhEA0mRvGcUrCIpqY33mEYw7KXFvCJNz2N4qBBucL1W2updfnavNOooDR/MCQY/tYLUPMvO7vySefotNf8/OHqXmxX3pZEPj/PtU3X42wEymXF5GxjhjsBA4T3VrDVbVGQroKfmvdgSN+gXPbJP8dgeeHTO9jzWHm2xSZT99hGR3GfjVdYx3cs2aUaWNZpftNNqNDX0vsV0O/vAGKWrj/d9SgHdYCzICYsb+6ZrYRz1iVtY8M5S5q3LtNmI4mA3RsYlzarlOhUewX+TAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boKYeskBoVVN+9Be6chLP+CVNjavAA4cY9VIWJlCCfE=;
 b=2f8Adn6SADtSMjyxHTJWfy/eZx3RhrA2XsyPf4IJRIrDPBzY3GH4jpKMJ79qRd40UD+NADw0M1z0PtPBeRlZFCR7ZXLSM24PoLGcUJCkuZHXFRqd59wdMsdnEIhXkTCAqR0B6VbDrP5G4H5PMhZCUlOPX0uiTK12qGP+k298YGcatpiA10j6WM2JXptQN5XQvuEMsWxfvIFHCgL+6R/0wpRtmgPbKr2RCIgVHAZA1eVKVTwMJjXvv2dHJ0+1OjHBK6BPSGVhCWwl/CYLeE2CIG6sMZ9HqQBJaHKf9CIXyp6Nkyz87AzOaum9uXHGBZiUodCHA5c+oP6Ya/CpCOme0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cddab03e-dd17-c684-71cd-5476ffbc0b4d@suse.com>
Date: Wed, 19 Jul 2023 12:37:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/5] x86/iommu: pass full IO-APIC RTE for remapping
 table update
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230718124334.36548-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6521af-ca2a-493a-f952-08db884432d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	72InLy2U2mCyW98XjeQF0YDQVh1WlBWoUzRnpVRF9dbFOSyQH/8U/AmiSYTUTbQ+SsmKR/wUx/mwYl+D0o47i6ScbDQycX0rtrvp+oDu6zvYS5vBogHLc3gp4CVeU6is1seUs6EWXMRhog3ohDXnL8U/5JL6t5BvvsutAcEJBCstX5SyjvVJJ4Hh+Vq2wabVdLq6qNxvH0EbMlPu5OZS977buqQLm+VTUpLdDd+VBTAmOBxQGAYjWdSuHa7bXrBz/UjGDnTb6TekLsmOUetLjdrSGWQko1r/jyaX6rxheoYbBmN+/rgiz6Nt+c/CdoEhOrgAII5r5UC9hcD8rXBUGvjsloBNTLncNhd0CVbUu0n/jhvSDoFTTqF1KXHdCMbjo/gS0WbGnlG4T+DWhXHZE1xbqd+p3/bTCMEJ7AB7NQlHBb6E70pU/XpkczKvhVn85ujkZnIG+yx/U9xikOddHl+4s/A5rKClEhFD99rJ5164Gds5xZhHhwUdmU8G9jxcxt7fuvR+5/K5uAXq2nUwdf3o3OSU6t39c1rji4g6lkq7KlJw2JcsmqBqQuXNIPU2Y5rW0uY4zD9KD7gCDtS8t/G6l7yMt0AvmRvGzdb11SzTWLvfBlyvzXu6TE9T6KH7j4hGipGfLbVK9qIf6Y9rrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(38100700002)(36756003)(31696002)(86362001)(31686004)(15650500001)(6486002)(6512007)(478600001)(2906002)(2616005)(26005)(186003)(6506007)(53546011)(41300700001)(6916009)(4326008)(66946007)(8936002)(8676002)(54906003)(66476007)(316002)(66556008)(5660300002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlVGRzNscmpPVStIWnV4SzdsMkJscXhSd3pIdHozQitCY1BZMnN6cVVIVDN4?=
 =?utf-8?B?dktiVUZzWklxaXQ2MjRiWUhnOTJjb00wcld5Y1JDVVZGbHFiUHNFNTJiQVlj?=
 =?utf-8?B?RU05NTB2ZjZnRXllcEdQMDVCZUk1ZFhHYmtZemhzWXZnamUvS3loRlUvS2Qr?=
 =?utf-8?B?VFNMWnVZc3MvWUJSbzBRTE8yaGRZamZzTVZtV1N0VGRNYmhXU3dJd1A3NmpH?=
 =?utf-8?B?UXJXbDNwMzhjekdKbHk3L2Nlc3o4N2s2YjNsRFJwUUZ2YXRqeXhwNUMyNms0?=
 =?utf-8?B?b3FtRVJGdEQ5TjZRa0toZm5sbktsV1BUYm5scWplYXp1KzkwMDF3YXQyM0oz?=
 =?utf-8?B?cHR6WVpzNFV0WEtUdHd1YUJ4dkVEQU1VcHZnVWtySE1jdkZqOVpqRDczK3Zx?=
 =?utf-8?B?ZXliWG53SWpMRGNwN2FSTmRES0JTQStwcG9pVFYzdHlyaldVZVJnUndzUHVx?=
 =?utf-8?B?UkozZXlqYVNHMjNiQ09yQ1ljblMvaXpRYUlYcGNYQWNkemgzMUttemY0SXhq?=
 =?utf-8?B?bnZkWHNDdiszYjB6MTdoWTlnZTIwOHJGQTNaRVQ2RVBjWmxSY052M1J6OVlI?=
 =?utf-8?B?VFROK0V5aExURDNaYS9ReVUzcjZGdkdpRDRNTERubWFCODhSNFlIUkhadjhT?=
 =?utf-8?B?c1F4RmpWNVNVZFN0cW0yYy9UcVYxd3BzWUxKMjBMV0VSa3cyVWRVK2x1STc0?=
 =?utf-8?B?SjVSUnVYMFVmRlJIeVNXNG05dm5aMnBGQlhnZXRnNDJzSU9mZ0pBVkhaRkRR?=
 =?utf-8?B?dG5RQ3VFNnhHckRaL0pxZmllYmc4LzJTNzZjcE1XOXVmUVFMMkNvNGY0cVBD?=
 =?utf-8?B?RjFRdmgwcE9zM0JsSzMzSCtLYk43SzZBTVF2RWFkR0N5bHZVNmFwTFhYT2RJ?=
 =?utf-8?B?YzJnMVdTVFdESUx0eXk3NEZjbFBmK3E2bk83K1FkT3JCQ2F0VHErc0IrL0cx?=
 =?utf-8?B?c0x2bVFSdVQ0S01DVUNkaGVXN0g5clZYWkFyQ1N2NXFSWGRnbGpmWWlHUkdL?=
 =?utf-8?B?RjR1MGlUNEFKem9IN2dqNjF2cnJ0eVVDKzBHaXF5QmM2ZHRnMkZLdHVZQmNS?=
 =?utf-8?B?T0RxMHNYdTl2OU0wU2s2RnZ3RWEzTmVnMjJZTGowUndRWkJ4VE9UVWxOelVt?=
 =?utf-8?B?cmVBMm14b3hmWjVyb25nbVJacHBXaCswMVhLajdyblRvUDN5UlR1TUw3SGo0?=
 =?utf-8?B?aS8zUWJ0UGJva1p1bXd1Z3lWblhNbnY5UjRreWxkQjB1NHNZMnN2KzNGZjlS?=
 =?utf-8?B?cnZXUlkyTUJKUk14R1FnT016anlUS2czOVFPVUpxVllaYkpabXlzQ1c2ZFZO?=
 =?utf-8?B?VkFXK0xXakxhZzdIZ2lnQ2hyNi8wQVZCcFdEcmxEQlI5SXFDTjdCRFI5K0ZB?=
 =?utf-8?B?MDErcHVpQUcwcEtDRVFQSGR4NC8zU0lpb1hkaHhMVjBTYU5oS0VneTdCQytk?=
 =?utf-8?B?K21nYzkvNkFBNnNTa2VEZ2xrNWEzQTF1SVdQUVA3SVZtc1FnZ2pOYm5nMk9Z?=
 =?utf-8?B?M1owNDduR1dWZ0NyMUZwckduM3Q5MHB3ZUpRK3BFd2J1RFNkencra2x0M0J3?=
 =?utf-8?B?RDdidENMdDZVUFMwQ3RqQW5HSnlhbHFRSDRaWElCTzByVnEvWE1PRGFpUWFF?=
 =?utf-8?B?cWdRM1d3SloydVFPcU5KQURlU0xJYzVqS0VZcjhRTC8rSFg0cWJVZlpUVUVk?=
 =?utf-8?B?VStNTkdnRFcwZVVhT3NCaXVqUWlzeThTMTVINFkrbk5qcld3cjBPQWJhOVFI?=
 =?utf-8?B?TXdTOGhIL0NPWnZOSHMvc29BcytyNlVUUXVnWDg3b1hIMEkwTm5VL1pwbGZa?=
 =?utf-8?B?ZHovUFFzVFUrVjVsYlEwNXA0eWpPd0lPYTdtYXMzc0VTVkpQYnpzT2FjcFNj?=
 =?utf-8?B?bUIxMlJWemFoV21EQVVUYWhkTHRRMzNUb2RBSGJIMTRNTzFyZHllbFlORGcw?=
 =?utf-8?B?ZUNJNWRLaE81dWJyV2RQSHJVTnhHUEtvN1BRdmU5WDZJTFg3aXNMZlV2WHBj?=
 =?utf-8?B?dmplb2djTTVPcjIrbWVKOXF3dmlndXNxLzBhWFNYODFDYmFSMnBhT21qeWRN?=
 =?utf-8?B?Z1R4YjI5ZHNsM2grS3NneEJ5b1g0OTRVeUUvOG96ZWkzSU80VkRNc3lXOHZ4?=
 =?utf-8?Q?UI40SvZV26yHfGx0A2oUyvwHp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6521af-ca2a-493a-f952-08db884432d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 10:37:49.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOnUPz1mFQfaAFr1KGYv5bxNoNtRDVdNRnMpyxoRP30cbOU419eV1wZCR6MQbEMGJql4kSrJ8luIgDi0u55Syw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8896

On 18.07.2023 14:43, Roger Pau Monne wrote:
> So that the remapping entry can be updated atomically when possible.
> 
> Doing such update atomically will avoid Xen having to mask the IO-APIC
> pin prior to performing any interrupt movements (ie: changing the
> destination and vector fields), as the interrupt remapping entry is
> always consistent.
> 
> This also simplifies some of the logic on both VT-d and AMD-Vi
> implementations, as having the full RTE available instead of half of
> it avoids to possibly read and update the missing other half from
> hardware.
> 
> While there remove the explicit zeroing of new_ire fields in
> ioapic_rte_to_remap_entry() and initialize the variable at definition
> so all fields are zeroed.  Note fields could be also initialized with
> final values at definition, but I found that likely too much to be
> done at this time.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Note that certain combination of changes to the RTE are impossible to
> handle atomically. For example changing the vector and/or destination
> fields together with the triggering mode is impossible to be performed
> atomically (as the destination and vector is set in the IRTE, but the
> triggering mode is set in the RTE).  Xen doesn't attempt to perform
> such changes in a single update to the RTE anyway, so it's fine.
> 
> Naming the iommu_update_ire_from_apic() parameter RTE is not really
> correct, as the format of the passed value expands the destination
> field to be 32bits (in order to fit an x2APIC ID).  Passing an
> IO_APIC_route_entry struct is not possible due to the circular
> dependency that would create between io_apic.h and iommu.h.  It might
> be possible to move IO_APIC_route_entry declaration to a different
> header, but I haven't looked into it.
> ---
>  xen/arch/x86/include/asm/iommu.h         |   3 +-
>  xen/arch/x86/io_apic.c                   |   5 +-
>  xen/drivers/passthrough/amd/iommu.h      |   2 +-
>  xen/drivers/passthrough/amd/iommu_intr.c |  98 ++---------------
>  xen/drivers/passthrough/vtd/extern.h     |   2 +-
>  xen/drivers/passthrough/vtd/intremap.c   | 127 +++++++++++------------
>  xen/drivers/passthrough/x86/iommu.c      |   4 +-
>  xen/include/xen/iommu.h                  |   3 +-
>  8 files changed, 80 insertions(+), 164 deletions(-)

Nice diffstat.

> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -84,7 +84,8 @@ struct iommu_init_ops {
>  
>  extern const struct iommu_init_ops *iommu_init_ops;
>  
> -void iommu_update_ire_from_apic(unsigned int apic, unsigned int reg, unsigned int value);
> +void iommu_update_ire_from_apic(unsigned int apic, unsigned int pin,
> +                                uint64_t rte);

Much like you have it here, ...

> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -300,7 +300,7 @@ int cf_check amd_iommu_free_intremap_table(
>  unsigned int amd_iommu_intremap_table_order(
>      const void *irt, const struct amd_iommu *iommu);
>  void cf_check amd_iommu_ioapic_update_ire(
> -    unsigned int apic, unsigned int reg, unsigned int value);
> +    unsigned int apic, unsigned int pin, uint64_t raw);

... could the changed parameter also have "rte" in its name? I don't
mind if it's "raw_rte", to avoid colliding with existing variable
names (in at least the VT-d counterpart).

> @@ -350,14 +319,11 @@ static int update_intremap_entry_from_ioapic(
>  }
>  
>  void cf_check amd_iommu_ioapic_update_ire(
> -    unsigned int apic, unsigned int reg, unsigned int value)
> +    unsigned int apic, unsigned int pin, uint64_t raw)
>  {
>      struct IO_APIC_route_entry old_rte = { };

Looks like the initializer here now isn't needed anymore?

> @@ -364,48 +363,37 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
>  
>      new_ire = *iremap_entry;
>  
> -    if ( rte_upper )
> -    {
> -        if ( x2apic_enabled )
> -            new_ire.remap.dst = value;
> -        else
> -            new_ire.remap.dst = (value >> 24) << 8;
> -    }
> +    if ( x2apic_enabled )
> +        new_ire.remap.dst = new_rte.dest.dest32;
>      else
> -    {
> -        *(((u32 *)&new_rte) + 0) = value;
> -        new_ire.remap.fpd = 0;
> -        new_ire.remap.dm = new_rte.dest_mode;
> -        new_ire.remap.tm = new_rte.trigger;
> -        new_ire.remap.dlm = new_rte.delivery_mode;
> -        /* Hardware require RH = 1 for LPR delivery mode */
> -        new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
> -        new_ire.remap.avail = 0;
> -        new_ire.remap.res_1 = 0;
> -        new_ire.remap.vector = new_rte.vector;
> -        new_ire.remap.res_2 = 0;
> -
> -        set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
> -        new_ire.remap.res_3 = 0;
> -        new_ire.remap.res_4 = 0;
> -        new_ire.remap.p = 1;     /* finally, set present bit */
> -
> -        /* now construct new ioapic rte entry */
> -        remap_rte->vector = new_rte.vector;
> -        remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
> -        remap_rte->index_15 = (index >> 15) & 0x1;
> -        remap_rte->index_0_14 = index & 0x7fff;
> -
> -        remap_rte->delivery_status = new_rte.delivery_status;
> -        remap_rte->polarity = new_rte.polarity;
> -        remap_rte->irr = new_rte.irr;
> -        remap_rte->trigger = new_rte.trigger;
> -        remap_rte->mask = new_rte.mask;
> -        remap_rte->reserved = 0;
> -        remap_rte->format = 1;    /* indicate remap format */
> -    }
> -
> -    update_irte(iommu, iremap_entry, &new_ire, !init);
> +        new_ire.remap.dst = (new_rte.dest.dest32 >> 24) << 8;
> +
> +    new_ire.remap.dm = new_rte.dest_mode;
> +    new_ire.remap.tm = new_rte.trigger;
> +    new_ire.remap.dlm = new_rte.delivery_mode;
> +    /* Hardware require RH = 1 for LPR delivery mode */
> +    new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
> +    new_ire.remap.vector = new_rte.vector;
> +
> +    set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
> +    new_ire.remap.p = 1;     /* finally, set present bit */
> +
> +    /* now construct new ioapic rte entry */

Nit: Would you mind correcting comment style here as you touch (unindent)
the line?

> +    remap_rte->vector = new_rte.vector;
> +    remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
> +    remap_rte->index_15 = (index >> 15) & 0x1;
> +    remap_rte->index_0_14 = index & 0x7fff;
> +
> +    remap_rte->delivery_status = new_rte.delivery_status;
> +    remap_rte->polarity = new_rte.polarity;
> +    remap_rte->irr = new_rte.irr;
> +    remap_rte->trigger = new_rte.trigger;
> +    remap_rte->mask = new_rte.mask;
> +    remap_rte->reserved = 0;
> +    remap_rte->format = 1;    /* indicate remap format */
> +
> +    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
> +    update_irte(iommu, iremap_entry, &new_ire, !init && cpu_has_cx16);

The comment suggests to me that you mean to strengthen the logic, yet
the code change weakens it (the called function BUG()s when "atomic"
is true). Wouldn't this better be "!init && !<old RTE was/is masked>"
anyway?

> @@ -439,36 +427,47 @@ unsigned int cf_check io_apic_read_remap_rte(
>  }
>  
>  void cf_check io_apic_write_remap_rte(
> -    unsigned int apic, unsigned int reg, unsigned int value)
> +    unsigned int apic, unsigned int pin, uint64_t raw)
>  {
> -    unsigned int pin = (reg - 0x10) / 2;
> +    struct IO_xAPIC_route_entry rte = { .raw = raw };
>      struct IO_xAPIC_route_entry old_rte = { };
>      struct IO_APIC_route_remap_entry *remap_rte;
> -    unsigned int rte_upper = (reg & 1) ? 1 : 0;
>      struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
> -    int saved_mask;
> -
> -    old_rte = __ioapic_read_entry(apic, pin, true);
> +    bool masked = true;
> +    int rc;
>  
>      remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
>  
> -    /* mask the interrupt while we change the intremap table */
> -    saved_mask = remap_rte->mask;
> -    remap_rte->mask = 1;
> -    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
> -    remap_rte->mask = saved_mask;
> -
> -    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
> -                                   &old_rte, rte_upper, value) )
> +    if ( !cpu_has_cx16 )
>      {
> -        __io_apic_write(apic, reg, value);
> +       /*
> +        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
> +        * avoid interrupts seeing an inconsistent IRTE entry.
> +        */
> +        old_rte = __ioapic_read_entry(apic, pin, true);
> +        if ( !old_rte.mask )
> +        {
> +            masked = false;
> +            old_rte.mask = 1;
> +            __ioapic_write_entry(apic, pin, true, old_rte);
> +        }
> +    }
>  
> -        /* Recover the original value of 'mask' bit */
> -        if ( rte_upper )
> -            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
> +    rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, rte);

I realize it has been like this before, but passing &old_rte here is
odd. We already have its properly typed alias: remap_rte. All the
called function does is do the same type cast again. Question is
whether ...

> +    if ( rc )
> +    {
> +        if ( !masked )
> +        {
> +            /* Recover the original value of 'mask' bit */
> +            old_rte.mask = 0;
> +            __ioapic_write_entry(apic, pin, true, old_rte);
> +        }
> +        dprintk(XENLOG_ERR VTDPREFIX,
> +                "failed to update IRTE for IO-APIC#%u pin %u: %d\n",
> +                apic, pin, rc);
> +        return;
>      }
> -    else
> -        __ioapic_write_entry(apic, pin, true, old_rte);
> +    __ioapic_write_entry(apic, pin, true, old_rte);

... the further uses of old_rte then won't end up yet more confusing
than they already are (first and foremost again because of "old" not
being applicable here).

Jan

