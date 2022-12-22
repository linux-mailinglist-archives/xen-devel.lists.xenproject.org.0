Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D226541D5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 14:25:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468524.727641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8LYr-0000AU-1D; Thu, 22 Dec 2022 13:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468524.727641; Thu, 22 Dec 2022 13:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8LYq-00008V-UE; Thu, 22 Dec 2022 13:24:36 +0000
Received: by outflank-mailman (input) for mailman id 468524;
 Thu, 22 Dec 2022 13:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8LYp-00008P-Ul
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 13:24:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2086.outbound.protection.outlook.com [40.107.105.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f852f6a7-81fb-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 14:24:32 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7720.eurprd04.prod.outlook.com (2603:10a6:20b:299::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 13:24:33 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 13:24:32 +0000
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
X-Inumbo-ID: f852f6a7-81fb-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBLzvpA2EmEwRYFlVzUEtiirwum5YzCBcjn3qcI2w/fF2+FMNm/MMxV+GkVzIPsxAIGC1gMZqwsh1FGc6LHgnETKyx+WI+9zBP9tleiG9khPm5JJTP40MfG80UZubw6/QD/O7QH4d0eS5/kM47ONwmmKuUIjogcSOdZ0/hIQQsT+faxmpYVExswpnhCq+pSoa3EUaxfIcXA6Feds96mlF5sj2MyDbfJ4ec7zHSZyltpPmEULFr3S4cwNRuzATDb2uKpgdTrZhx7EYYC+K4YQLnjrWpLNvumtOJESICNgpcEIex9Oqz5j7zrO+mCcq0r2bcenKjQwIKvOiN5aVUvxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+01OFubpNaP9bGDH6x8+gYO3b8F4tB3SdImxcaUwjg=;
 b=lXwCtbwQh3P+TeT1BBwm2BN61szkhvFoa+y7FgqEjLO1dlDDlw+eQvXvD2qP5Ad/OciOqmHsVLZrvvoKPq6ILosvF5YZGVw+TjbAilK5OYgKt7zLAyjLhioQoHHCmcxcIGsiyv1n2CuA57GUXYkiTOPPbsxzQllha3bCEmWnid57DEsa6e3oHo+yocAOAKqZn5hXZZUQRjOafmk206UftB/0Kga8+G7JOc27GYaFsgUvmwvnzqQQ1ZZl4tJNNjQ2vQX0mAniHNy7zdIK4f27oAhfdS+N2vhcJiFGYYqm0UNZSpYgoiTiSkBsqyY0ToPhXfx0RQx1GFXTnoVitM1g8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+01OFubpNaP9bGDH6x8+gYO3b8F4tB3SdImxcaUwjg=;
 b=k0QVHhkEE3YcCK6RTveN67Y4Cy4F6326qI+Mou0o3vjh+HxM959dAood+2SMnCSAi4alpTRF/hOrgTCqtRgbpJ5hhp3NR3h6bbMPy/KyR1oF2SQEAtK6cZo802Nc3KI/SeWFFhK4ab7wuObYzt4n3NDCA67VZmqNICZ8322eF8PxefqnhFMaT85EZL4N4QOiwuU9bCwvMfjIdN6nWdhNUDlvGDNdrjc30tbFe5/o0nty+/O/g03i9xUzFZ567Vy0De65yyjaAcbDXbbJ9+QCVPTBy41X18oIqr80RRsXfOi6tQxMoMUd0sbzbv7407W4u0XR07mLw0LRN3l9HWmRww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc70f967-34bb-9569-f514-7a3208e746c6@suse.com>
Date: Thu, 22 Dec 2022 14:24:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-12-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-12-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 142e90c8-4302-4702-fa65-08dae41fdce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n/d1b1zZWKlhlP89AaHXSWLq/U//TsB7NRbrNinsIC6q+aqcLeFJoKWndpwBNgHPJEjNH67p18O7CR/LkkNqv/LjZB6Kme+jDEH+QEc+DNr70whHHx1I3sY51+qZZO0eSJep8Ye/gk0TLm6HStca5o23ypc4kYkTIHUloo6rUDH9cHi9dgMdkypaabCWlFAhxL3e7Mk+TXSvU56QjuhD7h6RITdTBWNALiGivUQ+Xzm92PqmTxw+BPxeeztpa8atTUPU2+9wJdjH4/VFtibFyjO2Pe1VzWRfeMCSyAFHNqmFMPl3+wflxWCwOKNnKiSWFu8kXGD2a5wMa4fbQTimNFUC2h2/NYvRDJdMCJArnaVlm2TynQC8sIEfDmcKnsz32UflOKwk44l/vSUnsXMlco9yRGvjoAjqdNkkCobdzqqAo8XG2SfUxTMCjnYsByk+mfbWh4BLcf8QSmQ2l19L46a1Sbvoo0AaVXPVEUcptIFkNqORwwzVqKZh0wI3+OwuXII/vzXSpjJNtNFnrjgy1CMs3GZi6RbjIxe3R3ORxTliss98rFxgQj2GylpCe5dMU8lFKJ0Ueb6H+HCV5FQHi6JqoMKOfPNCBG+h+AmHBoO3UU7t6iBXemSU5CAACNShI+I0yoQoj5pNvF4B0f4/A2SRkjuljX2g5NIk3lh4OAN546Vp7Nt0iJ9c5T0Jdu+iora67nhWGXEhd3m7MJ5mHvSBqQMn7j3303E6osVPV/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199015)(31686004)(53546011)(6486002)(6506007)(478600001)(2616005)(186003)(316002)(26005)(6916009)(54906003)(6512007)(8676002)(66946007)(66476007)(4326008)(66556008)(41300700001)(8936002)(5660300002)(7416002)(38100700002)(2906002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGZ1anNoM1ZUTnNQTE9YZDE2c3FidlBjMFhHd0tsTXhqdEk4aWpxdFgyVWRa?=
 =?utf-8?B?ZVo2Z0NVYnNFemVaczUyWXBPdFB3MlhrOGttM2ttekx4YktJb3ZIUU04bDJ1?=
 =?utf-8?B?bmFzc3owOEZjclkySHc2K2VIYlpQVUhHTHhYbDFhQjMvL01yYWlOZk9UR21t?=
 =?utf-8?B?NU9xTUFkSFNONDFrV24vZ0VQazMyNFFOUmdTeVlFNE1uRHA0eFNUSFRSUXNZ?=
 =?utf-8?B?RGJDTEpZMlhvTGJJbTBDM0hNelRKVTBDclhrQVB4Q0RYUzYwOVdhaHYvNXcv?=
 =?utf-8?B?UjRVaGRqNXZ6d3gyTzJKTXdhV0hHRmZGOHMrTGthY2VHNEcvd3JYSVZ0bUlV?=
 =?utf-8?B?eCtJRGJFbCs3TWVDbE5pd0Y5NzJOWmlXdXZ6eEtVUU9jclg1b21iZEhhb0Z4?=
 =?utf-8?B?NUFwenRYb1FncnEyejR6aGwxenh5T242STh3WlkxL0RpN1QvaGJ3UndnRzdk?=
 =?utf-8?B?Nmg4dmsyQzhSaHRrV1J6ZSsxS1cwYnA1YmdVaGlwOXJaTG5KODRkNlpuTTNF?=
 =?utf-8?B?eVBTQXNRdXA4ZU83YnJGSERqZk05RGc3clpWUjRFNXVnTXR2V3lGQjRTU1dF?=
 =?utf-8?B?aTl6SS9oYlMrcmZiQWN4NEV5L2tnS2JnOStIUkVra0VWUVhjWitoTTk0QnFP?=
 =?utf-8?B?WFBRa1E5blFlK2lHVlJ6bDNFWENOZkpaZWc5NWlrOXdvRkdjR0tzbUpoRXhR?=
 =?utf-8?B?eVlLRDZGL0dzS2JFUmhZV1dpdzNzdkhnd3ZFY0J2enJwUTFudWJCTHFWR1NB?=
 =?utf-8?B?TkJ0MmU4SkI1dEpyRW5XMlhCcE9iSS9td1ZxQVA5eEVLRzF2b2pUdHEvQ2N6?=
 =?utf-8?B?ekZHaHZmRlR6by9SSW00NXNpaU12WDRlWDBRak1FVmVNdFVHMWFjUWcxbFpP?=
 =?utf-8?B?enRXVnlZb0ovekRqbHhVZUZUVlFZVDE3R2RETW5HRzdqOGsyMWJleTJrMllz?=
 =?utf-8?B?K0l4bDlWK1gwdGZJNEpRUFUyVWlIWG9WcEQ0blVXYVpzSUxPKzV6VTR2Yytl?=
 =?utf-8?B?VjdJU1R5a0t5REZVSThuTkVCUEFiTFl3VWVYdUtRNWxxMzVOV0JQNnlMQ2NM?=
 =?utf-8?B?Z2pGMUlRMFVqeE5zR1Z4cnNEdXVlY2I0cHdocTZYL3N3VEh4dWtScVpHZHNE?=
 =?utf-8?B?TVh1VmV4YkQ1L0dvY21lT0JGb0Y0enV0VElrdWdKK3FKaDB0Z011K3JjYXFv?=
 =?utf-8?B?K3pHdlo3aGZHQkhCRjRQbjZqaEtuQVc2NWl1R01Gc2VVUkx5bXdsbm1aL1pV?=
 =?utf-8?B?TCtJbzV3WGxVNmFxeDdTTnFvUEt3MldnZnVRbk52QWZqVFFYeG1DeW55ajhU?=
 =?utf-8?B?c1NkWHE0WmdDcldKQ0VEY0RsUFN6eG5LaWw4Q25QaS9kcVFNQ1R2SmJCNmFY?=
 =?utf-8?B?T1FSSURaRGRTWXJMbDhGTUkrQkRMZVlYOEFZNGZybTVIK0ZZYW9oUzZkbU5v?=
 =?utf-8?B?V0lJRDAzTkJaVUdBbVhXY21Vek0rWk9HK0ZlK3dwUzRyem5MMzkvOWp0bDBm?=
 =?utf-8?B?bjBIcWJwTVJHS3RTd3FjQzVXOE9FYUdFZXI5ajNoYlE3WitQVUoybFBGYzRw?=
 =?utf-8?B?MXIxU2NYQWlvQ1c2TmhzWm1UUThIR1dUTXY4TTM0ODNZcThYMWM5bXBrMzdm?=
 =?utf-8?B?ZDQxSisyNTBnWU1KUm43UHM1MmI4dnZ0bndqd2hBWlBzSDZMTHcyQThBTi9Z?=
 =?utf-8?B?aG02T1U0TGRxWDNnbFozS1BBazc0YktyWHl5Q2w2SVd2YlFpZWRVaWoreFdr?=
 =?utf-8?B?OEg1RFN0THM3MEFWRDdCdnVqcXlVY2oweEtkUlNRSkFBTlVhcGlzenpoNWVQ?=
 =?utf-8?B?TWV4bGttenlyVGdBdVBMMWU1NzJDOTJ0VkhuU3cvLzRKSUVGZDJxQ0xvOXZ5?=
 =?utf-8?B?alRqdVVmZ1FJbmF1Y1BJcENDMmJGTWhSRFlZWUFmOXMrWHhRWExldWNMWklO?=
 =?utf-8?B?VjJBa2hhVi8vN2k5T3hZQXJSS2hHeVZ0dkYxZVE4d2Y1c3llUi9TMXAyOFly?=
 =?utf-8?B?OTN0NzBIM21LYjFjOGlLK2NNZ3VLc25XVjd2dE5xblA2Z3c2MEVwSWw4aHpZ?=
 =?utf-8?B?dlB0amxTdFY1azNwaEtkUVJJc3hvRzNZclBkK0laajNTRkZKaGp2dWZMRHA2?=
 =?utf-8?Q?Iq3mzAyJIsUImcTsZbQ+0NwIB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142e90c8-4302-4702-fa65-08dae41fdce1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 13:24:32.8356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXkNjXMWC3UwDiOAeO6uq0J6sSBoYIxlFuXPOoCOCjTl3zW6r/uA3lilkHvxD9gQ19RTczWLH8xjhpdCWvdYUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7720

On 16.12.2022 12:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also add a helper function to retrieve it. Change arch_mfns_in_direct_map
> to check this option before returning.

I think the abstract parts of this want to be generic right away. I can't
see why Arm would not suffer from the same issue that this work is trying
to address.

> This is added as a boot command line option, not a Kconfig to allow
> the user to experiment the feature without rebuild the hypervisor.

I think there wants to be a (generic) Kconfig piece here, to control the
default of the option. Plus a 2nd, prompt-less element which an arch can
select to force the setting to always-on, suppressing the choice of
default. That 2nd control would then be used to compile out the
boolean_param() for Arm for the time being.

That said, I think this change comes too early in the series, or there is
something missing. As said in reply to patch 10, while there the mapcache
is being initialized for the idle domain, I don't think it can be used
just yet. Read through mapcache_current_vcpu() to understand why I think
that way, paying particular attention to the ASSERT() near the end. In
preparation of this patch here I think the mfn_to_virt() uses have to all
disappear from map_domain_page(). Perhaps yet more strongly all
..._to_virt() (except fix_to_virt() and friends) and __va() have to
disappear up front from x86 and any code path which can be taken on x86
(which may simply mean purging all respective x86 #define-s, without
breaking the build in any way).

Jan

