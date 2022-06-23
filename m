Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DCC5575DB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354626.581827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4IUu-00039I-1N; Thu, 23 Jun 2022 08:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354626.581827; Thu, 23 Jun 2022 08:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4IUt-00036v-UL; Thu, 23 Jun 2022 08:47:31 +0000
Received: by outflank-mailman (input) for mailman id 354626;
 Thu, 23 Jun 2022 08:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4IUs-00036p-B0
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:47:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a0e5e0c-f2d1-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 10:47:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5210.eurprd04.prod.outlook.com (2603:10a6:10:19::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 08:47:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:47:18 +0000
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
X-Inumbo-ID: 1a0e5e0c-f2d1-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt5C7P1+Bv31e/p4jMNXCZYQbiw7kPY+qX6f7/L052DPz4p7/w6cYgoJFOzhl9lwqri6zpqxx/xDilEwrMbolxy4gx89l9udWj7wRyIVX8qDes7qn45F+7CALrHl5Yot652rRcIRJpA6reN04oiFGCNOyrnmZuC9eQ7UpQnWKt+maxDC7NTitBD7pf/5ZxSyUYmv5iPQIyInuYXblQK99EUwyKSgrGhXVqppK9H1fdNArajD0oRzga20zq548afHhMMgxiT7mwmY1JgW30o7Ms6391gTkoSwe0V2oR8qzjdXXZ31NawaZoiB/BjUGgH1VpOkCLopemkxgPMtt95jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+og/IjaRDM4Uv/kfH/Qocl/zhwcuUO3jysX+GyaNWUk=;
 b=Nih2Tv5MWywMPVOmKFmWZiSrxVei4pjIxRq9y8PPjVlzG48CCdrQ0XImDnibLkThWYwnyQL1eOzf4x0TPYQbJ1tfVN2K9Twjwl7/QgMyDwXjaQvuhATUCMkd/5gPFHO/LZhb+fe/HoMCC4NBs9A5HvIQqcJwwMuWyYlxC/P7X7YsaB2U5JutD+PiLOXoQZ2tP0SXRiQT2KSzK9pNSvgySgQWGVZfiPs/PcT1hrLW3bxzut3GRHcY/iQWiaN1olAA1d+N3qr1AfADLmWszd0uXeyVYxOcs9LgaCKunK1NyNhWKNPZjJPviGkVFf2Qqy5kbsMHPY3muzyBwBCq2c42DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+og/IjaRDM4Uv/kfH/Qocl/zhwcuUO3jysX+GyaNWUk=;
 b=y63vLAyf4TEkb1jpe/Gd5f7mZIFp6RH8kFeBWJOkRAtG4Ejp/5ZZNHi09WZU+NwCVlzIOtSJKuVFVY16BVqWUe1C1tOLKQ39vBAEiXps035x8FHOfIJkVbhQaPvZtY3Wj857L3T4yrmtBla8lSbsn3kaafJ8cGOYXmxcR9cFPfLeaCzCRAONZlMhSx9nVEiyaLwkOSv257SGxxeAu0DPqqus5Mp9lc685No6G2aJ8eqfUU9263t9eUZz8RPPz8c4f2KQCBboRMl0ctx5QNVpttGKA8oo5hpsW4MaPafkm1zqbQ5/p/sdje9pdlXspkw83A1RaZSwXtZ1D19aUZJwcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53bb13f6-04ec-0ed0-2c19-9c7947654989@suse.com>
Date: Thu, 23 Jun 2022 10:47:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Problem loading linux 5.19 as PV dom0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
 <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
 <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d60a23b-8118-40cc-e7a5-08da54f4fac9
X-MS-TrafficTypeDiagnostic: DB7PR04MB5210:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB52104E9D455C8EC0D54B3F27B3B59@DB7PR04MB5210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7fKafMQeazuCcWxEO7zBuDIfzxKUV09iJB8Q6Y02oM7tAqXLO13yhX2/p1pClOr/pwAEwjCJpwFIEoGJ2YKRWL+qu2O2QbVAaKCcX2AKwherd/R0UCdJoSbQcGnn2A8wrEaeidEwGkFZ0dZLoTQUsiEa/KNSLKKo2IyWbLTE7PlVwbjv5G2fPgq0JVceHFXNKJXJCvzMIzBBWL6fjKd4L3DaHiNqCz52IHvfLhXqtx4NRwuX37hpwKLl4M2qLGLUZSG/NpsmiDO3CL59xEvQdGB6sNIqFV2LTN8hqJjSYfRPcQh3wHtO4HuYW5arPPsSVwk7qXkgLxIsd5EWXF3JOOb1xX/4h2zmuIGnWDFeGxMA27m23PMXNaA0MAi88/8un/XXJYR6pJj+mh3JfDXcbk6lkHYQLtf1ZyFZac/NzcSEVMiur9oQcUt49MGbMS8ZGQrfPOuV+nWMpVp487R6UipW0qHwf0LFbMTwn47gnBFx/usaH17hiaaYT4KFzvdQ+w31sxwHrn3cshKZTmmIiFvJxuSmdjzXD/HO+wCAFlcvfz7hpFr3qVuLAOhlvlPh/oEqFu+tsM7Tw7v/zNMSobuDwN3GlIz3Obs4Jey81OUtPOJ1p2/pMxkj8QrNZXalom3IuSPNMoxF9ZlIyP8k+o5E2P7K6a0LMylZTrBnle+aUtsMhnUerwu+zMmw0r9C4JixgpDQRfjXzkA8Co7i7+opnLgHSkMNk3UKAQ9JJkrAAcxD3ZLINZhyZM+8wgBdSG8Ntqwq4QYeWYPtqcTLLTwGDEpAiHVtCXy5ZL1cCyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(366004)(136003)(39860400002)(8936002)(478600001)(6636002)(36756003)(2616005)(31696002)(66556008)(8676002)(53546011)(6862004)(66476007)(38100700002)(4326008)(6506007)(37006003)(66946007)(5660300002)(6512007)(31686004)(2906002)(26005)(186003)(86362001)(83380400001)(316002)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bytieGVyZUdXbjRsdVY0N3djeEFtV2RLMVIyL2x4ZGxWRTF1eVNoVjNHNWgx?=
 =?utf-8?B?NlkzRTVJM05HUnFHSUpMZS95dDA1eGJMRTQ5R1QvSUZzSlovK2pDMnRuY2lu?=
 =?utf-8?B?TTdCdGhhcmtoU0J5K0Y3ZGhkL2FpNk55TXNoYjI5eUpLTDdYZlFwak1PaEVC?=
 =?utf-8?B?Y3RDQ1VubUJDRytxMnlKT25MMFA4Z0huUXphUjZpKzNnRXhSdi9MbnVQRUw3?=
 =?utf-8?B?U0cxYk9zaE9CaTltdkpyTHlqdFg2M2RxN3VpWWQxMURCWHBSVG9ibnR4S0Fo?=
 =?utf-8?B?ZzdBc0NNb0pyaWNWeHpldFkyN2plQUpodmpBYnhOZEZiblFRQ1NEcUZmK1pm?=
 =?utf-8?B?dWNmTjZhWjVQZGpjOHIyQVBpUW1YZ1ZBRDhkRnJJQStsOFFqVnlWVWVkUUIr?=
 =?utf-8?B?b2NTUW80elZFWTZVT0NzckFYNVZuVkhaWk1MVDhsQkpJVkd2MUZOUE9uSzNj?=
 =?utf-8?B?UHVhWFBvandVWWIzZmJMRFZNNUJoVThxcHJlbmVmMDk3WGJVb25KYkxqeHVZ?=
 =?utf-8?B?TDFHdmlhOWhLVDltRlcvWU1USUFLOXk2d3hXN1RjbEd0RytUbTdpTkplaTho?=
 =?utf-8?B?aEM4SmIrdVpPdWZzdUN1RkJCYkVWT2JtOHBZa3A5bUQ1R2dITzdvTlFCQm16?=
 =?utf-8?B?eWZ6WnpJMXR3aHF3ZE1kYkZCNG9udGRicXFGQmFzei81am82c2xOZTlLeWZr?=
 =?utf-8?B?QUlKRlVDcll6Vi9yU0pyZVBqVUgyNE1seThPeGF4SHVhNFVqN3BRNDFSQUVt?=
 =?utf-8?B?M3RYVXJCTThuZTg0TU1tQ0NYTzQ2dk5nSHZTL2pRZDA5a0o2dWZiSW9MNS9y?=
 =?utf-8?B?UlNCN0tvQTcxZHV4QkswYU91dGd2N3IzelNTeVhqNzZENFE3WENUbE5qVS94?=
 =?utf-8?B?b0VYdG9ZZnJXazRCWXdyc2RoMHlYMDNuUWJBU2hFc2k1UEN0K2d2TkREZHRP?=
 =?utf-8?B?TmhLMVdEK3NmRUhPWlc0TFdmRytadmo5dFJqanc0V2FSVWdmS21KYmEzUE1p?=
 =?utf-8?B?M1BLK3gxYUF0cVEyVEV1VFJicEZsT05EMlFCMDdjUzl1LzVwV1IzTDYxaUdF?=
 =?utf-8?B?WFl6Nng2c051RTl0MjFuY2oyY3JwRGRPOXFzd0daQ2tleWhiaHF3V01xMFRw?=
 =?utf-8?B?ekZaOVJOVG9NVjQ4N1NMdXNVUVViYzUxSFhLc3ljL1RNWWptYVRQV0UxYjBr?=
 =?utf-8?B?LzdGV2djWU5rbjZiQmNTOWFqM3BGMGc4SXVhQVlWQ0llK2t1dmFTOElNR1cw?=
 =?utf-8?B?R0VwL0gvY1ZSdjN5YzJOSnltUHhPNlBxb0lndXo0MjV1L3pWb21GQ0Y2N2Vw?=
 =?utf-8?B?R3FHMW1HZi92M2pWRGFxZGJmaW5XY2xiSE43ZDJmTzhLMFkxYS90am93Si9Q?=
 =?utf-8?B?OHVBMkdJRkVNdS84TFQ3MksxU0JpWFFGMys0Sm9oOUtBZkJqeWx2ZUVoV1E1?=
 =?utf-8?B?RS9OUVdFSE95VEJvTEo3WUdOd2dYb0g2M0h5ZVlDMU16TUFkY2FDTXJjWmN3?=
 =?utf-8?B?QTZsV1pMbERkcWlnRTlJVXFXUXZYaUNXTmJTSDdUNHVvdEJIR1FXQWJSWDV2?=
 =?utf-8?B?N0lvUmx2WHBxbDJ2OS8xSGpKSE8yQTZqa2NPM3FxTTJ5Vm80YVoxVTZQQWh2?=
 =?utf-8?B?YnhJamp3VG0vbjdYbVRGdnBUdlVCQUMwSDBsVDRITVpHWVpudmZYOGg2L2cw?=
 =?utf-8?B?cGE2bUdXaVRmeGVPd0R6VkhYU202L3ZBMXRlOUxDbkJwUlBwMzBVQUlWR2JN?=
 =?utf-8?B?SFFEVUI2ZENqWVBKOVc4bW9MeDhWSmRpUHhSQ3ZnL1kvcUkzVFp2NWpNZUt3?=
 =?utf-8?B?dmhwTVo5Qk10bE5tYWVKOEtwLzgwcFkvVzZiMzg2ZFdBcDJnSnlmZHZwRWdL?=
 =?utf-8?B?NmlPcUxmU2hhNGd5VFlHemxyYm1mUmo5YWF4N0lYOVdheHlXdFpTWHc3dGQx?=
 =?utf-8?B?N2V4ZFZBZElaY09OSWJSbjQvN05YQmVaQi9vRGN1My93ZzMxNHZuUFlETkdi?=
 =?utf-8?B?WjFIaVZRYno0bVVOT1FzeUttSzFhVW95d2RiV1VSNFdvYWdTWWZ6VWRIdUdD?=
 =?utf-8?B?VU0ySVlFRDE2by8yeEs1ZDRQeXVMQ21ucDk2Z0NScGpLRnZFMTM2WDFwajdm?=
 =?utf-8?Q?uNa7uP04aU7PG7sFgrLa6zB9r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d60a23b-8118-40cc-e7a5-08da54f4fac9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:47:18.4042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXz13IuBZuq1H/RU045pAqjWnYblrSq30JsyRf97HUGvuDRnhIWJIX0l+8763OkB6yz7lJ0J6fZdxgDqVOw6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5210

On 23.06.2022 10:06, Juergen Gross wrote:
> On 23.06.22 09:55, Jan Beulich wrote:
>> On 22.06.2022 18:06, Juergen Gross wrote:
>>> A Linux kernel 5.19 can only be loaded as dom0, if it has been
>>> built with CONFIG_AMD_MEM_ENCRYPT enabled. This is due to the
>>> fact that otherwise the (relevant) last section of the built
>>> kernel has the NOLOAD flag set (it is still marked with
>>> SHF_ALLOC).
>>>
>>> I think at least the hypervisor needs to be changed to support
>>> this layout. Otherwise it will put the initial page tables for
>>> dom0 at the same position as this last section, leading to
>>> early crashes.
>>
>> Isn't Xen using the bzImage header there, rather than any ELF
>> one? In which case it would matter how the NOLOAD section is
> 
> For a PV kernel? No, I don't think so.

Actually it's a mix (and the same for PV and PVH) - the bzImage
header is parsed to get at the embedded ELF header. XenoLinux was
what would/could be loaded as plain ELF.

>> actually represented in that header. Can you provide a dump (or
>> binary representation) of both headers?
> 
> Program Header:
>      LOAD off    0x0000000000200000 vaddr 0xffffffff81000000 paddr 
> 0x0000000001000000 align 2**21
>           filesz 0x000000000145e114 memsz 0x000000000145e114 flags r-x
>      LOAD off    0x0000000001800000 vaddr 0xffffffff82600000 paddr 
> 0x0000000002600000 align 2**21
>           filesz 0x00000000006b7000 memsz 0x00000000006b7000 flags rw-
>      LOAD off    0x0000000002000000 vaddr 0x0000000000000000 paddr 
> 0x0000000002cb7000 align 2**21
>           filesz 0x00000000000312a8 memsz 0x00000000000312a8 flags rw-
>      LOAD off    0x00000000020e9000 vaddr 0xffffffff82ce9000 paddr 
> 0x0000000002ce9000 align 2**21
>           filesz 0x00000000001fd000 memsz 0x0000000000317000 flags rwx

20e9000 + 317000 = 240000

>      NOTE off    0x000000000165df10 vaddr 0xffffffff8245df10 paddr 
> 0x000000000245df10 align 2**2
>           filesz 0x0000000000000204 memsz 0x0000000000000204 flags ---
> 
> 
> Sections:
> Idx Name          Size      VMA               LMA               File off  Algn
> ...
>   30 .smp_locks    00009000  ffffffff82edc000  0000000002edc000  022dc000  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>   31 .data_nosave  00001000  ffffffff82ee5000  0000000002ee5000  022e5000  2**2
>                    CONTENTS, ALLOC, LOAD, DATA
>   32 .bss          0011a000  ffffffff82ee6000  0000000002ee6000  022e6000  2**12
>                    ALLOC

2ee6000 + 11a000 = 240000

>   33 .brk          00026000  ffffffff83000000  ffffffff83000000  00000000  2**0
>                    ALLOC

This space isn't covered by any program header. Which in turn may be a
result of its LMA matching its VMA, unlike for all other sections.
Looks like a linker script or linker issue to me: While ...

> And the related linker script part:
> 
>          __end_of_kernel_reserve = .;
> 
>          . = ALIGN(PAGE_SIZE);
>          .brk (NOLOAD) : AT(ADDR(.brk) - LOAD_OFFSET) {

... this AT() looks correct to me, I'm uncertain of the use of NOLOAD.
Note that .bss doesn't have NOLOAD, matching the vast majority of the
linker scripts ld itself has.

Jan

>                  __brk_base = .;
>                  . += 64 * 1024;         /* 64k alignment slop space */
>                  *(.bss..brk)            /* areas brk users have reserved */
>                  __brk_limit = .;
>          }
> 
>          . = ALIGN(PAGE_SIZE);           /* keep VO_INIT_SIZE page aligned */
>          _end = .;
> 
> 
> Juergen


