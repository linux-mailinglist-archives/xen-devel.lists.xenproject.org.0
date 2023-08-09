Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA2775635
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 11:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580802.909221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTfIc-0004z2-Nq; Wed, 09 Aug 2023 09:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580802.909221; Wed, 09 Aug 2023 09:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTfIc-0004wO-K7; Wed, 09 Aug 2023 09:16:14 +0000
Received: by outflank-mailman (input) for mailman id 580802;
 Wed, 09 Aug 2023 09:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTfIb-0004w0-1P
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 09:16:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62354762-3695-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 11:16:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7604.eurprd04.prod.outlook.com (2603:10a6:20b:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 09:15:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 09:15:42 +0000
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
X-Inumbo-ID: 62354762-3695-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlyaBEURdZHr7ialhospcLF7ozvSSWdqOSBxqsJMH2TiKAsKlAYt8qHmX3Zrr9bm0t8lsJy0pW0ByfB+IsBweIov/dH50YjdIylHA7VEOhefVb3obfQp/D/Md3QdGLU23J3aCB2Nf4CVIrh/JtO4mf0OBdK+sPtBJTOYEQD5CCO8RWDOHFFCplNXbOJMlbKz8B+Vvi0T9699iw1Gjr+8xH1AsbDWSwrJLSTp9yPoaWwwUyl3d8XupryWFR84fGylFlMPvWS71eqCJYPBmGJ648puZS8db8EPt2otLbVGM2jqdMFTVFKMPHr91jiC4b6f6M+eMyahhX8q+32DpfUubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0SVfRREii59ren720/+A5oU1Ur2AyrXTFM7UsWvm1w=;
 b=LmmoZ66jdR3Lbaq+fc2ezA1FU0IeZpw3/3z/peQD+i7oMy05Fv6UpZ1nn5lp8yantUdxAX7UZdu6btmUmsk9nQ0bNnAP+pkXe7OMsigJnxk+KWSqFJUsB9nupb/WAzUOrMYnl82BrzoQWxZlpX2lR3acrfHHXtVeg9xaCHyPyYGHl1ne1u7rbmuN9zpYPNTW2DvJ4WSBefUahgi+g7T0KYFBZ2KVdajcSJIb2K3V5dGal1zyKF63YAzpDfn/VYl3uIgdsJxwCetja8znIzjgZdiW6+n/GGWorolq8UP7df39VS4L1R/RMW+WwpcWNe7dYvfBSxGLt6865gtITfgQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0SVfRREii59ren720/+A5oU1Ur2AyrXTFM7UsWvm1w=;
 b=sU77fNL94lP1frF6n4A13+YgGwUN27o7SNFiw1/DtCeOHrK+vhxGpSSKSmlg3d7SczvcIva6GavhCH/vqRx+VNWcwBkmK1aJmKMOtsdMPIyHJYfXV/2aEicKXmI90W68F9GP+D4f/BuMeIrJ48UoeqEoEydYcaXTBjOwmiYdSRU3f3UhDPvpWHKNYhLlSvjwW0V8eftfU/QV+eJrMi3oXj/t19EuIMKbZb1ovbALxyVccctUxjxWBeRIm2c6jxHfBiibdTQ+jBVHp7tWEL/3riCWCvRPsbJIKOymKzFBeKa+lY+RmtO+rtyqXVZOpokYo0FC+wbgPnuhAVwY4Wg+yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8da9b4fe-3109-3a5e-9bc6-15fccc13a8f3@suse.com>
Date: Wed, 9 Aug 2023 11:15:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 0/4] xen: address violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1690368810.git.simone.ballarin@bugseng.com>
 <CAFHJcJuSXqzHbB8P6d-YV_GgAadmxnWgETfaqDj_ge_ipWS7Pg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFHJcJuSXqzHbB8P6d-YV_GgAadmxnWgETfaqDj_ge_ipWS7Pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: c76555d3-84da-4622-aec0-08db98b9347f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rHC7YvQOXNbYYTGb7wX+L2C+iDfLzOatZqaIMLIINZTt9UPf3ScfuPIZkGAttVjn7LgZxbHbCClARhRfgytoSwP2sZcom77HtkI6IVAmemt/RWky/4VBdVWFMgKamBaUsa47nsZRiXF6FocK5kQulMajtx2DU+7FpqHif03Gw4xJSgGqtgQBODJ/1kNBtXmJz/5EOYNbcR8feuO8slK2tcbEfCpFegUm7lPc6SYJP+t6/DTMdS+lv5HH2Vp7/PQqbVb3M5f/vmGJCO1fX5subnk/O6IT047ZKBrWQ1VqTLZjSP9tGBuWxGmEm8vdvOZMQC1iRC/Q0J7XSza6CrghUVmGUkK348B3bPoviRVRcx/kx3VcImvykl/yqXiG4YKd86i9jbQdlY9xQakPmV1x7iSaaZAu7peCPd06HyP/zeyMYR23SauTCqwQszd6JSoT54pHZb17AsvZytbUBmT4we6xIPd66H4EEnUV+CllKfvIveWIsFxHwRzOHpCMAIrOVY61y4licsp25CDg921NQOeaGc9jlnXh4tnmphJllpMm8tVkLnqsW87MI0zQEtSfHOV/KiQQJuJ1lAAWjwAl2uqrgfhmglGkUetI9/QRdrWG+BnVJqG9K+j6qkk/lqTGOD4f5RFiXOl5iv+g9sdDoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39860400002)(186006)(1800799006)(451199021)(26005)(41300700001)(7416002)(2906002)(31686004)(5660300002)(83380400001)(8936002)(8676002)(2616005)(478600001)(6916009)(31696002)(53546011)(38100700002)(66556008)(86362001)(6666004)(54906003)(6506007)(66476007)(66946007)(6486002)(4326008)(6512007)(316002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmF0WjFqMitDRHVlaytDRkxiS2Uza1BYd2huYnlTc0NoTWttM3liNXE3S0NG?=
 =?utf-8?B?THhBT1pmVWtkaGRvSEh0VUdSVHNpQWVxYWkrcjhFeDBRV1pjUnNMOFNHeHAy?=
 =?utf-8?B?c3JhREg4anU2dkEwZmhta1ZsN0VXcThKT0F1ZFZXUnZVOFdkZjJ5emdYaVpQ?=
 =?utf-8?B?bnhqRTNvL0N5RmR2NzVLRVVkZzUxUytwdUtGOFJUdithSkc0UVp5QU1ocjlF?=
 =?utf-8?B?dmpXQkhVWUlmNWkyaEZ0MFhJWUJ3Rzc2dXdvWHlPS2ZXY25IemFiV1ZnbDFJ?=
 =?utf-8?B?NEdvblRsRVYvbUh4SmVWRG0xcW80bnNFdjljY1MyYjI3aVpwc3FEK3JPd1Ja?=
 =?utf-8?B?dHcxWnB2RERnOUNwZFZBdG9sUHh0VFh5UlJybERDUGJ6bmVyUVV4a2FMYlVV?=
 =?utf-8?B?dGhOR1JKKzRiYm9XZ0RVSERNK3BUbksvZ1FHSlkvdjU2V1RYdWttTUhSVnZt?=
 =?utf-8?B?WHVwYUVtSVBhbTRuNTUrVXBNcGhzRGJRd3FTcjBPejQza0F2MVFGbXpWZDZ2?=
 =?utf-8?B?a01FMkpHNVV2NjJSSXNKc29DeGpSenZnTGEvMGVwVXl3NDA1SGI1K2pubzFv?=
 =?utf-8?B?d29NNkNPVnIzcVJBRlpYbWRXbmlaQnp2ejdISUZCbTdTOEN1S2FyVlloazRS?=
 =?utf-8?B?Y1ZEUzJYVlg4L2dtM0dGTUl6RlhIVXY5TTRHb0xuUG0rL0daZUhhV2M3QWRh?=
 =?utf-8?B?UU1MVXpML3ZxQ1FhQW9PZU5pU3NXbWduZUdTdzJWeE1vMmZKUEpoZnBoTjhX?=
 =?utf-8?B?RVNKVWhNdC93dlo5d2FSQWxDTGNvS0l5cHlXR0thQXNxNG1XSjhXbzdOdzNF?=
 =?utf-8?B?SEJhZlZUWkpWM3RpT29QaXZkb1VFQWN2eGtMYk1hQUFzVmdaRExCWU9YeU51?=
 =?utf-8?B?OGNibFgzMDAvMnVUWnZFUkplZXRNRThBVW5zZlNwR0JuemUrOXhvaVZGM2VK?=
 =?utf-8?B?N3o2Vy91aEs2SUdseDJnYzJKWEoxbStpeVFsS2c4OHdEdEt4RVlaaVJhRk5C?=
 =?utf-8?B?SEw0SjRHUlZ5VlBqbGxwMk9uM2F2bVNQQVVzWDBZZHVXUkpPRkxna1NDQWw5?=
 =?utf-8?B?YVNSMFFKVEpQU3VoWEViT0RnbEpqVk03RkFMU1FBYUh2Rzg3Tk81VWg5Q091?=
 =?utf-8?B?bkNBQWhiSUhVYlh0WFJqZ2NCdXMzWE0vV2tXaFFoODUxbFFxdmcxd2VqU0dC?=
 =?utf-8?B?T2dSQlIvUDAwNG9OaWV3MVpycUR1UzAwcHkwNFFOanU5TSswUTZoMjI5MlVX?=
 =?utf-8?B?VVdNdG91ZVFteS9MSlBQbVBqSjJJQVloZEdjSFVwQzZRZjZwRnp3ZisvRk41?=
 =?utf-8?B?NFdVWVQrd3k1Z1JrUGhEcUJqaGFWZHA4Sjcwa05LckJZb0xndng3Q2NwRXc0?=
 =?utf-8?B?Y3FQVnUzVEdyYU5aMnBmSDJtMlJuNDM5UGJvM0tKK2pSSFJma1c5MjRadzdz?=
 =?utf-8?B?eGNIWUlZZzgrNFRMRkd1cGpKUW5ZU0dZWnpsNFUzbCtCL2R2djRudC9aNk5F?=
 =?utf-8?B?Sk1FRFh6d0FUdXpKRFNwYW1xNmtxdFM0RVlhbEhxNThBYysvM2hzU0ZKRE9y?=
 =?utf-8?B?SDRhWTBKdHR5dU54N0NMRGFqK1MrREl4NVVkZE5PYjdXdXJFWjBleXJBSHYx?=
 =?utf-8?B?cks3U1ZlZzk3R21QekhYOEEyclZiL2Z3MDAvdXJnWS9jekdRQVVDNm1ZYTQ4?=
 =?utf-8?B?UGMwaWJDUjg5VWJlVXVZdmlOSjd3Zmw1bk1RMmVkOW5FcWY3bGN0cXNMaUJ3?=
 =?utf-8?B?bkU5ZnFINFQzd01vVjVBV0Z1QzVnM01xTjJKK3VMeHU5VkdqNkVNQVdoTGF0?=
 =?utf-8?B?T1ltcXdNbEZ2UUhmY05IUVJYQTFNTjRYL3IzazI5Z2xheTQxd3lvdjBrOUht?=
 =?utf-8?B?NlZaSTRnZDFFNlNTR1U1eVBkZlk1Qk9MYlNqNXU2eC8rZ0NSNjhWbkxZWnk0?=
 =?utf-8?B?QWphZjJxeTU1NUs1emJqdHQxOWJTU29MaG02UnY4VkVIWXFFa2JrbE5TNmxr?=
 =?utf-8?B?TnowWE03K3lQWXpqNnZIUG43a2FGd2JVL0hnZFd0TUNrSXJlK2x2S1R3SUIy?=
 =?utf-8?B?S2g1STN3M3NxbXJncFVBZnVIZXNNbTZ3SEZKUUlzbjJhekVDSUhMeW9YaWxO?=
 =?utf-8?Q?wE+hKoFVl2TbTW9pCwkTDieV2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76555d3-84da-4622-aec0-08db98b9347f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 09:15:42.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FqJ7nKLQu5ZUhT4sA/Xueg3fiPPxb/FUNFc92Enf1PQHrNcd8Y/M6lW9VVDMeg3VAUX/+YlfG96OxAsnf2bbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7604

On 09.08.2023 10:58, Simone Ballarin wrote:
> Il giorno mer 26 lug 2023 alle ore 13:04 Simone Ballarin <
> simone.ballarin@bugseng.com> ha scritto:
> 
>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline
>> states:
>> "A 'u' or 'U' suffix shall be applied to all integer constants that are
>> represented in an unsigned type".
>>
>> These violations are caused by the missing "u" or "U" suffix in unsigned
>> integer constants, such as:
>>
>> xen/arch/x86/hvm/hypercall.c:132.17-132.26
>> if ( (eax & 0x80000000) && is_viridian_domain(currd) )
>>
>> If a rule is not met, changes are needed in order to achieve compliance.
>> The patches in this series achieve compliance for MISRA C:2012 Rule 7.2 by
>> adding the 'U' suffix to integers literals with unsigned type and also to
>> other
>> literals used in the same contexts or near violations, when their positive
>> nature is immediately clear. The latter changes are done for the sake of
>> uniformity.
>>
>> Gianluca Luparini (4):
>>   x86/vmx: address violations of MISRA C:2012 Rule 7.2
>>   xen/vpci: address violations of MISRA C:2012 Rule 7.2
>>   x86/viridian: address violations of MISRA C:2012 Rule 7.2
>>   xen/x86: address violations of MISRA C:2012 Rule 7.2
>>
>>  xen/arch/x86/apic.c                          |   2 +-
>>  xen/arch/x86/cpu-policy.c                    |  18 +-
>>  xen/arch/x86/cpu/mcheck/mce-apei.c           |   4 +-
>>  xen/arch/x86/cpu/vpmu_intel.c                |   2 +-
>>  xen/arch/x86/cpuid.c                         |   8 +-
>>  xen/arch/x86/efi/efi-boot.h                  |   6 +-
>>  xen/arch/x86/extable.c                       |   2 +-
>>  xen/arch/x86/hvm/hypercall.c                 |   2 +-
>>  xen/arch/x86/hvm/pmtimer.c                   |   4 +-
>>  xen/arch/x86/hvm/stdvga.c                    |  50 +++---
>>  xen/arch/x86/hvm/viridian/viridian.c         |   2 +-
>>  xen/arch/x86/hvm/vlapic.c                    |   6 +-
>>  xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
>>  xen/arch/x86/hvm/vmx/vvmx.c                  |   8 +-
>>  xen/arch/x86/include/asm/apicdef.h           |   2 +-
>>  xen/arch/x86/include/asm/config.h            |   2 +-
>>  xen/arch/x86/include/asm/guest/hyperv-tlfs.h |  28 +--
>>  xen/arch/x86/include/asm/hpet.h              |   2 +-
>>  xen/arch/x86/include/asm/hvm/trace.h         |   4 +-
>>  xen/arch/x86/include/asm/hvm/vioapic.h       |   2 +-
>>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |  84 ++++-----
>>  xen/arch/x86/include/asm/hvm/vmx/vmx.h       |  16 +-
>>  xen/arch/x86/include/asm/msi.h               |   2 +-
>>  xen/arch/x86/include/asm/msr-index.h         | 180 +++++++++----------
>>  xen/arch/x86/include/asm/pci.h               |   8 +-
>>  xen/arch/x86/include/asm/x86-defns.h         |  24 +--
>>  xen/arch/x86/percpu.c                        |   2 +-
>>  xen/arch/x86/psr.c                           |   2 +-
>>  xen/arch/x86/spec_ctrl.c                     |   8 +-
>>  xen/arch/x86/x86_64/pci.c                    |   2 +-
>>  xen/arch/x86/x86_emulate/x86_emulate.h       |   2 +-
>>  xen/drivers/vpci/msi.c                       |   2 +-
>>  xen/drivers/vpci/msix.c                      |   2 +-
>>  xen/drivers/vpci/vpci.c                      |   6 +-
>>  xen/lib/x86/cpuid.c                          |   8 +-
>>  xen/lib/x86/policy.c                         |   2 +-
>>  36 files changed, 255 insertions(+), 255 deletions(-)
>>
>> --
>> 2.34.1
>>
>>
> Hi all,
> the entire series has not received yet any feedback or Acked-by.
> I would kindly ask if it is possible to have at least some feedback

I did reply to patch 4 on July 27th. For patch 2, Roger is on PTO for
another week and a half.

Jan

