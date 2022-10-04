Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A725F42DC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 14:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415501.660094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofgvP-0006ND-9E; Tue, 04 Oct 2022 12:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415501.660094; Tue, 04 Oct 2022 12:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofgvP-0006KE-6P; Tue, 04 Oct 2022 12:21:27 +0000
Received: by outflank-mailman (input) for mailman id 415501;
 Tue, 04 Oct 2022 12:21:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofgvN-0006K8-OI
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 12:21:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2044.outbound.protection.outlook.com [40.107.104.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fe69889-43df-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 14:21:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7568.eurprd04.prod.outlook.com (2603:10a6:102:f1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 12:21:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 12:21:23 +0000
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
X-Inumbo-ID: 0fe69889-43df-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H48gpEaDsPkdQeW0e0fU8o2QWz5c8MbkIO5FzgdDpiWigi6RwugpraH4n+W8AadLfZ5kLQdKF4kEywCU+u8ProAptrGtkccT1ZiuH3H6AAFcCKxlhG+RijekG0RDr3q6iwEYSM5vcDJF3L0Y+3mA85n2gPzgxbAdoXivlrzC7kPm0y97hV/6dE78S1kcyFko528mHUwBL7eslHCiDV+TgBkI6uyEhj+Iu1O/dOLhshaZuidEi54QRzqg6GVIdh3tPAFT/dLIOoyiZ2sM5G/5fVMuWFeyW2PO++kqqwAWMiYeTkVjC52zxMMVluaHyrz1CSzva/RPMpQcx/jXSwBE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RqG2AficvjTS7M/Y+CFu0Pl9MnXF/3D+TPoZaRxqlo=;
 b=RLV83uMaMDq81U/L5Yv8NvWmWiwd0lT/j0HMg/qdE7wH8nP+5UnyLdcB1x7MXtKwFDOho/V36xZTkOJJc/yBnDVm1DtYTPWYacPuTWSxcaGSBbDAa9p+f9XSELXVF6ZFCa+pwoy/76MPa/EdriBTWPqfYzexBSVOyWpXwvGiRLsxQQbTPjfbciuHLIU1C4veuUuUeQ+mvxsFvVGuYU7IkUfimCH7sI3mf80hFK48W7Hhv+Asd7cWEcc+7zTqZ8Of22iE7fzQVIZHkORrc0kDOIjVq9f0LzKrT71/i4WlB9xaX99n3UsHsgiKZ18BKyQGAx89AVJjVVwVcZb+WRlNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RqG2AficvjTS7M/Y+CFu0Pl9MnXF/3D+TPoZaRxqlo=;
 b=PAi4t99TPTt47rzelcXGgG3n1Bhl0D2lkUEJUE2saGMjDYCEDE1d4XvgwrKAU7m4EwKNWpIlNXTBZfBpLpXSu4sXM+dlkjvuux11sN63BFXrY/INUb8dXH3mygLs3tLk0OqM8VhgKBpPdXCLRr3+NLMy16IqEFt7rSScw5h0EjS5+08cKsFSXS9CS+px+fS1d2NSsasKJlBgJZ+1OIxWHXmAM7ruXD49F5FmWah8aICfn1BIqikGcE2a4cFnaMys8jPL+GDagwAuruYJfPFkHOys/1OUGTCc29mMpASvBFztpor/K5zQiICy2Q7Cq/3cRQ47zYXBuzZs8CPE+MGVkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d49fdfa-bd76-0469-0840-6260c5a8ff48@suse.com>
Date: Tue, 4 Oct 2022 14:21:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO
 regions to e820 RESERVED
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220930141737.67574-1-roger.pau@citrix.com>
 <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
 <Yzv8lpnf28aXgQQM@MacBook-Air-de-Roger.local>
 <ea544e76-0dfd-4f24-89ef-25265f7b049a@suse.com>
 <YzwkXh+8xzbCZdkO@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzwkXh+8xzbCZdkO@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P250CA0003.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 5489dce7-7134-4a66-5333-08daa602f35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G0h8OoIu/efws06f6IqrmcYGP95um2wYcmTYrW9ddsibv6cuj+g3Nnx66DQLUrORfmSfLDlMzCmR84iZsNL+E72SOc9ZrR2JLQvQBJ75YrciB+yA0O5RsXMMhdjVnt3X3ZlnzfnUzrkHLrOag2FGqN57NJJqAMmHK4kqR6+HKheyUFh9OMroGDIymy3PE1SrThlbokqbohfGalLRXk4v1SXDWS50v2W4It4rLYlrBg6d90dn9CDN/Ub8yrR2j+JEEfTAy2lPX0F67pEIy16QnkkRN/F0B3OpoTxL9RmSar8aifxJrpH/Rgc9/meohOf02IG1v13ZvAFdlazaqTQyxxXGD0PNGnwBKvmVwYtqPSKz3BDcAc8IhHv53p/URQpJQ1Xu9iK8dKs3LEdEziTJMOZdBiljleKWMXnSViSuGSobSVK67oGgSY0Yo4A6NXh8JNznBtd2A+hgHMWq8E5hsIG+WMZTBu6OppqTx4RYVglUHBcHZWxc+tw0CcvAtNJt9sS8nEgnydKvgh+1XsbHYjvw9PcDRjWvBTDiPlM9C59pFaArnQAUCwpfzIw9oWU6WhQVcDdWnUbr65nKiGul+v221qutuzX1buqA7TND2QEHRPOIar7wfwA2BMCLq1TfeHBgYNsZa66QY5AoNvdsdKmkdP8k9O1L/urX2fosFZIX1x+aU2Si3PzFHEAryF7648L4JNdFdjTCbTRbbOvS61gfWiFDh4OpVeepxWN7ogAoV1DZxtPs5Y2qSF9s68CDqbPHEXJTBL4qlP7NaC91RDFmYzNDnukAvejZYdSB1+E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(31686004)(83380400001)(6506007)(26005)(186003)(6512007)(31696002)(6486002)(2616005)(478600001)(38100700002)(53546011)(6916009)(316002)(54906003)(5660300002)(66476007)(41300700001)(8676002)(66556008)(86362001)(8936002)(66946007)(2906002)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW1ZdUpaQ2t0MEpHK3JSUkt2TWtINWQzQWhkMjZaaUVTMzJ2Q3g5WXlLWTlq?=
 =?utf-8?B?cUxMeUg4SGJvd2pUanFiV2ZhYjZXMDF0b0Q0WUh3YjliaTA4VWNyR2s1Rkky?=
 =?utf-8?B?N2Y5aDJSYUIzcDZ4eHk3bTA1Tkp5QktzUjVqK2NIUENMVFU4L1FFdjA5NFkw?=
 =?utf-8?B?REJxRjNRRXZNd0R3cVErSWxjcGFPRUdrSjdFQ2s2bGpwUVhDTzhzNUpEZVZ3?=
 =?utf-8?B?TWpoaDRwWmhWK3Y2ZlBVL0NQRm1TVm5FZU5hVUVtVTNTQkZKb2NCbHBZbS9X?=
 =?utf-8?B?VHJWVzFHQ3E2UEdldUJqR0lBQ1RiQzRyT3JaNHM0MmNjSXd6VE91RksrZmhp?=
 =?utf-8?B?cXBNK0psTGE5NmFvV2hXdGZxUXdCWkxSZ2RteWczZDNkR3ErRU9iazBXV0hR?=
 =?utf-8?B?YVp0TUtzZEx2bU1ZZ3JmQk9GM1h4ZldqMDVBaENCT09jbUg0WWx2UTFNTURn?=
 =?utf-8?B?TkI1NVBmdnZCd2VrRUllaGg5THRJbzFKTXdaTDhmRk1JMzFYWU5za1k4SXhk?=
 =?utf-8?B?cXhYYnU0YVRYekNuM1U4aUJsMy85dkJaWTl0NFVQcHpEdHJKSHhRZ1N3dE95?=
 =?utf-8?B?OUVPVnM0K3VDeG82cG1KNU5TNHA2YVgwN0V1SnlyL1lzd1oycFVGUEppR3pv?=
 =?utf-8?B?aEY2amlyRkRmZXdBZlF1ZG9pcFNqalFORzFGR0VadXVBUFlpT2lpNmp3aXNW?=
 =?utf-8?B?OXpGR3VKVWFBZTVNb2tKd01LSURXOTRUSkxyTG81c2FoOVZpall2Rk5uMEhs?=
 =?utf-8?B?MzlqNlFXeEFLNklmQXovVllmdDVXZ1VkNHJPeG9LMFVMRytWN25wQ1V5ck1U?=
 =?utf-8?B?V29WcWF0K3M2dmZodHVYbVFFUm1Sa1pEVEcwdWZ2U2dTTHFROFhOV3JhM3RU?=
 =?utf-8?B?bTNDVXY2ellSdE9vR0lTLzNhUWtTNXZJVWRuV0g4clpKVGVEOElvOEpMNjdH?=
 =?utf-8?B?VjhrQVBuMHBLbjNJMGJqbm9qTXFteUZlTnJBOHNhWlphOUtPYXkwczB5TkZv?=
 =?utf-8?B?eEZjODh3NnI3b2NwMWM2aVYyMXltNmJ6SncxR1NJazlNd295K0J2NlZ0b25i?=
 =?utf-8?B?VFppK3ZjNmlINUpSeGpOSUZ3TVVPN2dNL0tqWFU4M3VwWHVlUElQUzJja3hV?=
 =?utf-8?B?Sm8xMXVQSklEa0syS1A1WUhROVllMGNvSkdncm1UOXpsUDhZU0dBd1JzbHJ4?=
 =?utf-8?B?QzV0ZW5RVk1ZZGczYXVSTGh2dkorQ1hxYy9vRGJtdGNLYXZWcS9YazN1dHhM?=
 =?utf-8?B?SDRGWUFZQVlmWHg4Slhud0tNTjcwU3dXRkJmUHkzVTdKNGF4QjRjYi9zWm5h?=
 =?utf-8?B?UXJjU1hXWFd3Sjc0VktWdFY4OFMyY241UVFIY1laTlcxWU03a1REYVNoZVV2?=
 =?utf-8?B?blhFL25aQ1FwTUZHWHRRY0hzZnl5b2ZxOGJzNVVuVUpKbGdMZGFIQVRvb1Iw?=
 =?utf-8?B?RXBFVE14RHpMelR0MlRwME04VmFua0oyZ280YWd1Yk93MXpDZTNUUkltZXV1?=
 =?utf-8?B?NlBhRU9LNUUvRG5YeE1EeXdRTmtLY09nd0J0Z2tFdkY0Zy9DbW92ZVkxZWU4?=
 =?utf-8?B?S3dBRmFUU0NPdmI3dS9YVjRXSmNUbXFnOVhMN0hadUhuZlYrVktkMTlMWVVN?=
 =?utf-8?B?Sll6STVRekNjZk5KazBjVU42TlVSbnNzd0c4SFdGUit3Tkx0ZDZQYW5NbXBS?=
 =?utf-8?B?OXp0ZkNTYWtmbWl2bFF5V1pOUm5YQ2RNYVMxTVB6d1FrbnppdDd6M0wrRGFQ?=
 =?utf-8?B?cWRyRzU4YnlXNy9ycE9GalA3SWNIZjdkUXJ2bXBRbWRtb1BRUkkwZ3lLNElh?=
 =?utf-8?B?N1hlSGdaRW9NUWN4ZEpDRVp5d2xzc092YjQweTRDMWtGTDhmNWlMTHRYQlE0?=
 =?utf-8?B?bVlGOE15QlY2MEhwTy9PN2ZLaEtFTGwvYW1CaWdueHIxUXpYc0hmMGc0Tmhw?=
 =?utf-8?B?MW5jRkEySm1COFpRbzNWMjdlYWVxdkdFQXpNaitpT3lGUjJCcnloMktibURV?=
 =?utf-8?B?V29kYXo3QVFmYVJXRTVDR2o3UStxNUpsNTgyUEVGSkdLVTFsZW1rdG5CTEsy?=
 =?utf-8?B?RHBaNU4zcWkyckJJUk5pWnROUG1VYlprRmN1OTMzMWhKMGFOZWtZTjZob0x3?=
 =?utf-8?Q?wb/W9o6/kBCRIEBw5XuwKEAfg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5489dce7-7134-4a66-5333-08daa602f35a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 12:21:23.0837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7jvHYcNx6fhbs/B5H1XxdHMIvx3lEjtlKNgQ07u8vtulQdlzdx7h4y6Uf24Q/WR9LsB8Hnqvw6cXk03jWhRGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7568

On 04.10.2022 14:17, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 12:40:10PM +0200, Jan Beulich wrote:
>> On 04.10.2022 11:27, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 11:01:18AM +0200, Jan Beulich wrote:
>>>> On 30.09.2022 16:17, Roger Pau Monne wrote:
>>>>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
>>>>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
>>>>> devices used by EFI.
>>>>>
>>>>> The current parsing of the EFI memory map was translating
>>>>> EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
>>>>> x86.  This is an issue because device MMIO regions (BARs) should not
>>>>> be positioned on reserved regions.  Any BARs positioned on non-hole
>>>>> areas of the memory map will cause is_memory_hole() to return false,
>>>>> which would then cause memory decoding to be disabled for such device.
>>>>> This leads to EFI firmware malfunctions when using runtime services.
>>>>>
>>>>> The system under which this was observed has:
>>>>>
>>>>> EFI memory map:
>>>>> [...]
>>>>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
>>>>> [...]
>>>>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
>>>>>
>>>>> The device behind this BAR is:
>>>>>
>>>>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
>>>>> 	Subsystem: Super Micro Computer Inc Device 091c
>>>>> 	Flags: fast devsel
>>>>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
>>>>>
>>>>> For the record, the symptom observed in that machine was a hard freeze
>>>>> when attempting to set an EFI variable (XEN_EFI_set_variable).
>>>>>
>>>>> Fix by not adding regions with type EfiMemoryMappedIO or
>>>>> EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
>>>>> be positioned there.
>>>>>
>>>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> In the best case this is moving us from one way of being wrong to another:
>>>> So far we wrongly include BARs in E820_RESERVED (_if_ they can be
>>>> legitimately covered by a EfiMemoryMappedIO region in the first place,
>>>> which I'm not sure is actually permitted - iirc just like E820_RESERVED
>>>> may not be used for BARs, this memory type also may not be), whereas with
>>>> your change we would no longer report non-BAR MMIO space (chipset specific
>>>> ranges for example) as reserved. In fact I think the example you provide
>>>> is at least partly due to bogus firmware behavior: The BAR is put in space
>>>> normally used for firmware specific memory (MMIO) ranges. I think firmware
>>>> should either assign the BAR differently or exclude the range from the
>>>> memory map.
>>>
>>> Hm, I'm not sure the example is bogus, how would firmware request a BAR
>>> to be mapped for run time services to access it otherwise if it's not
>>> using EfiMemoryMappedIO?
>>>
>>> Not adding the BAR to the memory map in any way would mean the OS is
>>> free to not map it for runtime services to access.
>>
>> My view is that BARs should not be marked for runtime services use. Doing
>> so requires awareness of the driver inside the OS, which I don't think
>> one can expect. If firmware needs to make use of a device in a system, it
>> ought to properly hide it from the OS. Note how the potential sharing of
>> an RTC requires special provisions in the spec, mandating driver awareness.
>>
>> Having a BAR expressed in the memory map also contradicts the ability of
>> an OS to relocate all BARs of all devices, if necessary.
> 
> I've failed to figure out if there's a way in UEFI to report a device
> is in use by the firmware.  I've already looked before sending the
> patch (see also the post commit notes about for example not passing
> through the device to any guest for obvious reason).
> 
> I've got no idea if Linux has any checks to avoid trying to move BARs
> residing in EfiMemoryMappedIO ranges, we have now observed this
> behavior in two systems already.
> 
> Maybe we could do a special check for PCI devices and allow them
> having BARs in EfiMemoryMappedIO, together with printing a warning
> message.

Right, that's one of the possible quirk workarounds I was thinking of.
At the risk of stating the obvious - the same would presumably apply to
E820_RESERVED on non-EFI systems then.

Jan

