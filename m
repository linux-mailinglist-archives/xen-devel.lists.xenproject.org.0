Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E088FCB78C4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 02:36:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184810.1507096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTs3Z-0002fq-B1; Fri, 12 Dec 2025 01:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184810.1507096; Fri, 12 Dec 2025 01:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTs3Z-0002cp-7S; Fri, 12 Dec 2025 01:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1184810;
 Fri, 12 Dec 2025 01:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aL34=6S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vTs3X-0002cj-K1
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 01:34:51 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bee76aed-d6fa-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 02:34:49 +0100 (CET)
Received: from SA1P222CA0105.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::13)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 01:34:43 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:3c5:cafe::e3) by SA1P222CA0105.outlook.office365.com
 (2603:10b6:806:3c5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 01:34:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 01:34:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 11 Dec
 2025 19:34:42 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Dec
 2025 19:34:42 -0600
Received: from [172.30.226.132] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 17:34:40 -0800
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
X-Inumbo-ID: bee76aed-d6fa-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re464mdR1BtVHLKKFJSY1GSMDU27ucY9+MEcXTzTWG7QqfbH2gnp09PAVT7HbuoGIrtJFWbIqa2Y4S7DrLUpvccPX6VqvuTqDLTkA50TI0tGe4yzxfYRmv3wiVD9J2opn421C24g0lFzUdwPXw8giqBmIjFiQGetWN9bRTsuDVggS03EVrv1KCbnWUd442LqL7cHOygtpjOITyX0F+qC3/pTufkFO9fhBnXySAXVcOrsInvjMiVPld+z7b3m4Xv85L0a3xCcg2pjVt0LKOM4J3cIh06MwWHXUBNFVJfuc+RiO3DDEkGpEMbua2Av0iSE2u8zyKnP7iZo/a4OOQ9E+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tLlvn5bqm9GdUuvWheXY+BVx7twHKSUSsvq5c0iXHQ=;
 b=A3y2YSn/CRFo/4KLgc9e8rNt1szOEGZTcrT8Own5vWwFdOsU5NNpYXZzPP17esg+oItpbuLl6mDKtsESLt+gJ9SRgg3xhrCeDlDxaa3GMGmywx5kl+KoPY/+F2X+rmKR67NNuIdQtYQpptseGLcQzDChKlJ0G1cUmakwThHQU2p19DQ6feuCZii79o86O2nDPXnnCyt3cfKbRGGZyQYXyLdjqb+Mpz34cl4irrx6dtqDI1C6Qz4MjOvjsF82ouJ2tRY1QL5FXu276oZH1P/qOrJWlJKTed1gj8p4vk9IqHCDF2B6YJY3EVyS5LiuMttuS/Js3MyHNxhW/JQvSK9B+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tLlvn5bqm9GdUuvWheXY+BVx7twHKSUSsvq5c0iXHQ=;
 b=DsQerVc2XDO8o+IKJYdXT0St01VgYR9xgclfhEtLz734DttGcn+VtHsUPEdye/ywO0q9VnnY1cOtyYiJavwRcGg98iDfrNE1Ttl0v3zUKeyQS/jyfSSXVjOqHVIYmdunKtPztHsoYc2q3uWqHx+qgxhDTLF194YtR8lk65CiaEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <fbe63318-b764-46ce-a377-dd4ce7229abe@amd.com>
Date: Thu, 11 Dec 2025 20:34:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Victor Lira <victorm.lira@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
 <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
 <7514a67c-d140-43b6-bed0-3467530a086d@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7514a67c-d140-43b6-bed0-3467530a086d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: bef7a5cc-3cdb-45bb-ba02-08de391ea03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TW5MckFURWh2WElKTDFoaDk0K0hDQ3cvSU1UYlQ1TmlHN2djQzBicUp1b0tq?=
 =?utf-8?B?d1hqVjdjcnFLdzYrcUl1ZWFkWnhQcEVHVzFreHY0dmN1djBuU2NkMVJZQk94?=
 =?utf-8?B?dzNPZlRkVHNPSmlyK2NxMUdMZm9LZ3RDM3g3NE4rdGVWdmFVSGlFbnlkREI5?=
 =?utf-8?B?dnI4cHhmcTFoS0JhSGJIek1xNlFuNGQ3Z243OUJzQ2xxNWFOby9CNmNKQThM?=
 =?utf-8?B?SkdtcW9JSUlYWkZhUFdWTlEyV3J1WVZEckplQ0hnSGFLMUNzdXRGMCtPN2Vu?=
 =?utf-8?B?S3BrakNlN20rR2YvUnowTHBZZ2hRa1pyT2lYbHZlZXRYUmVRQURFMGh6b0sx?=
 =?utf-8?B?YkVEelc0V3Q5L0l1MDNreEZLcWtYOU5IS1VMQmlvZkVnS0g5ZkE2T0tBdEZB?=
 =?utf-8?B?THp5b29QR1lCZFFRRzJjYUZlc2owTlEwb0N4KzBnVmhSdnpLd2tCelU5Tklu?=
 =?utf-8?B?WVlsSVlXalNwOHdJY2FYbXVqSE5oRDR4YzNEZVpxM253bG9ZVVVzU1NkYkQ3?=
 =?utf-8?B?V2l3RFpkeGNwS2s2Y3J0Nm1hallsN2tHTmphaUJ1RnYxRWQwR3NYbTBIU3N2?=
 =?utf-8?B?YURoU2Y5SUZUamhIN283WnpFWU9SWTFGSDVvTVMrRzdMcVhmWWZPWEVQZ2ZK?=
 =?utf-8?B?OXFoMTFOdE9vZVhHWG9uUWhTbndwRUlab2VnOC91THNvUE9xSE90NnE0SlZ6?=
 =?utf-8?B?TnY3d3FmT3dld2VuWi9rWXhQL3c2S01IYi9qc2hqajRVT0hrM3Z1Q2puMHFh?=
 =?utf-8?B?Z09aK0dZekc2OVFiMGhRRDFuSDAxaUpNeUFCNE8rbmt0VXJYOEJHbWgwTkwy?=
 =?utf-8?B?czN2aEtZbjBxZmFGUWFYTFdFb3luU0s2cUwwSkQxS1hnaVIzU0VmNHVBVGo3?=
 =?utf-8?B?ZStDS2xoZERCNS91MHJnbkhSbFoxcjI5SWxzbC9WRUROaXNGa1EwamVCeDNa?=
 =?utf-8?B?QXJYL2JybTJ6NDdPT2IvVmlaeDZtTmtiNThKVEU2OGtHMU8zNC9FdjNmN2pY?=
 =?utf-8?B?SkxkNTkzeGRCOFoyTTFzemsvMHdCZG96LzZmbWdLNkpFWUlMQVpiZHBpaVJp?=
 =?utf-8?B?Vyt6elB5bTRoZjZsRDZOZU9QdWFpdjB3RlRRdUVrNEU5WkVLMUE0b1NlcXlY?=
 =?utf-8?B?UlFaallMaS9naTZMVFVCdytVYnI3K0czdlRDQ2Fndzd5VmVuUitPOGVVSWVW?=
 =?utf-8?B?eWw4aHB1WXpmUXI3cEFxcGRJTmU0NjA0eGxacUgxbnNEWHUyOC94aC90ZmM2?=
 =?utf-8?B?UjFwNS9CdjBxMS9FYmZ4Nzl6ZkdPV1FqeEtkV2M4cGRydVRaV293bmNVRVVw?=
 =?utf-8?B?YXQyYm1NbXF4NmhHVVRXOGlScnB1SHdoVyt2YzhDRGdPUHJvdnlwMENiOEFP?=
 =?utf-8?B?WC9UM2Nvay9HTmlVWXlyMzNSSUc4L3lYMjZMdm9iQU9pWEQ1NVI5U0oxYzhp?=
 =?utf-8?B?aFA1amMvVWMyTlA3YytHc2grS1d4TDdjTkxJRW5Samd6bjdkVmdmN1owSXcz?=
 =?utf-8?B?OUJhZkpSN2NCSjNiTGtFWTJQanZ3bnBhNWxzU0c1V2h0RXlEYWcxZVJEVVV0?=
 =?utf-8?B?TUxPL204Wll0cUMzVnVJUTV2RVlMcVVyOTJiNTNUWk12bE9zTGdYSUkvSEJJ?=
 =?utf-8?B?Ui9ycFVHVzR0NUZvQjdBcVlkQzQ1NDVsVWpzeThZMTZ1aCtsZXpLNVpRSUdH?=
 =?utf-8?B?a1U4V2s3dEd2cCtUOXVDRWhmOW4rajROYVRmZEdqVHNBRmxYS0c3cGJ1Mk1D?=
 =?utf-8?B?LzEwZHBzMGExbFlBSC9ibUFEUEhsaVBRWVdvWjdlWUVaNm1Ed0FZRXNuM3JU?=
 =?utf-8?B?ZlF3Vjc3NjBtbXc2bGtLeVRnYkZjV0NQcXp2UHIxWE5CT2hJUFNoVkVwbGhH?=
 =?utf-8?B?NlFpQkVUK0hGcUFqa2Z1RE80cjJJVEw3bXhBcWt1eHdxMW5oYjk5c2dUN1dh?=
 =?utf-8?B?NE1RZ1plSHc5UTNxSDBPR1ZCOTVJU25obWczZmt2WjhyZ3ZrWlAzNGZGYVg0?=
 =?utf-8?B?NnFTaEowem5oVFhuRG1UME5LS1dCeUhEV1I2Y1MvTlhsa3R2eXVCem9nVlNS?=
 =?utf-8?B?a0xqOVpnT3BkRVpzSS91YktYaE1ORmErZzdmNW1WRmRDdEVJUlJQMVk3c2Er?=
 =?utf-8?Q?tHyg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 01:34:43.2523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bef7a5cc-3cdb-45bb-ba02-08de391ea03b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

On 2025-12-11 03:29, Jan Beulich wrote:
> On 11.12.2025 03:47, Andrew Cooper wrote:
>> On 11/12/2025 1:28 am, Jason Andryuk wrote:
>>> On 2025-12-10 11:55, Andrew Cooper wrote:
>>>> On 09/12/2025 9:47 pm, Jason Andryuk wrote:
>>>>>           . = ALIGN(4);
>>>>>           __alt_instructions = .;
>>>>> -       *(.altinstructions)
>>>>> +       KEEP(*(.altinstructions))
>>>>>           __alt_instructions_end = .;
>>>>
>>>> Thinking about this, what we need is for there to be a reference tied to
>>>> the source location, referencing the replacement metadata and
>>>> replacement instructions.
>>>>
>>>> Looking at https://maskray.me/blog/2021-02-28-linker-garbage-collection
>>>> might be able to do this with .reloc of type none.  In fact,
>>>> BFD_RELOC_NONE seems to have been invented for precisely this purpose.
>>>>
>>>> This means that if and only if the source function gets included, so
>>>> does the metadata and replacement.
>>>
>>> With Jan's -Wa,--sectname-subst changes added to CFLAGS, this seems to
>>> work somewhat.  I'm trying to make the ALTERNATIVE place relocations
>>> against the .altinstructions.%%S and .altinstr_replacement sections:
>>>
>>> diff --git c/xen/arch/x86/include/asm/alternative.h
>>> w/xen/arch/x86/include/asm/alternative.h
>>> index 18109e3dc5..e871bfc04c 100644
>>> --- c/xen/arch/x86/include/asm/alternative.h
>>> +++ w/xen/arch/x86/include/asm/alternative.h
>>> @@ -90,18 +90,25 @@ extern void alternative_instructions(void);
>>>   /* alternative assembly primitive: */
>>>   #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
>>>           OLDINSTR_1(oldinstr, 1)                                       \
>>> -        ".pushsection .altinstructions, \"a\", @progbits\n"           \
>>> +        ".reloc ., BFD_RELOC_NONE, 567f\n"                            \
>>> +        ".reloc ., BFD_RELOC_NONE, 568f\n"                            \
>>> +        ".pushsection .altinstructions.%%S, \"a\", @progbits\n"       \
>>> +        "567:\n"                                                      \
>>>           ALTINSTR_ENTRY(feature, 1)                                    \
>>>           ".section .discard, \"a\", @progbits\n"                       \
>>>           ".byte " alt_total_len "\n" /* total_len <= 255 */            \
>>>           DISCARD_ENTRY(1)                                              \
>>>           ".section .altinstr_replacement, \"ax\", @progbits\n"         \
>>> +        "568:\n"                                                      \
>>>           ALTINSTR_REPLACEMENT(newinstr, 1)                             \
>>>           ".popsection\n"
>>>
>>
>> There's already a symbol for the start of the replacement.  We only need
>> to introduce a symbol for the metadata.  Try something like this:
>>
>> diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
>> index 18109e3dc594..a1295ed816f5 100644
>> --- a/xen/arch/x86/include/asm/alternative.h
>> +++ b/xen/arch/x86/include/asm/alternative.h
>> @@ -55,6 +55,10 @@ extern void alternative_instructions(void);
>>   
>>   #define as_max(a, b) "(("a") ^ ((("a") ^ ("b")) & -("AS_TRUE("("a") < ("b")")")))"
>>   
>> +#define REF(num)                                        \
>> +    ".reloc ., BFD_RELOC_NONE, .LXEN%=_alt" #num "\n\t" \
>> +    ".reloc ., BFD_RELOC_NONE, "alt_repl_s(num)  "\n\t"
> 
> Is it even worthwhile trying to further pursue this route if xen.efi can't
> be built with it?

The alternative is section groups?  I'm trying that, and it kinda works 
sometimes, but .attach_to_group fails when .init.text is involved.

Here's an example that I think would work, I could make it to 
--gc-sectrions:
group section [    3] `.group' [.text.vpmu_do_msr] contains 5 sections:
    [Index]    Name
    [   43]   .text.vpmu_do_msr
    [   44]   .rela.text.vpmu_do_msr
    [   45]   .altinstructions..text.vpmu_do_msr
    [   46]   .rela.altinstructions..text.vpmu_do_msr
    [   47]   .altinstr_replacement..text.vpmu_do_msr

But I don't make it that far.  Other files blow up with tons of:
{standard input}:9098: Warning: dwarf line number information for 
.init.text ignored
and
{standard input}:50083: Error: leb128 operand is an undefined symbol: 
.LVU4040

Line 9098 of apic.s is .loc below:
"""
         .section        .init.text
         .globl  setup_boot_APIC_clock
         .hidden setup_boot_APIC_clock
         .type   setup_boot_APIC_clock, @function
setup_boot_APIC_clock:
.LFB827:
         .loc 1 1150 1 is_stmt 1 view -0
         .cfi_startproc
         pushq   %rbp
"""

diff below.  Any ideas?

Thanks,
Jason

diff --git a/xen/arch/x86/include/asm/alternative.h 
b/xen/arch/x86/include/asm/alternative.h
index 18109e3dc5..8701d0e0a7 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -90,25 +90,31 @@ extern void alternative_instructions(void);
  /* alternative assembly primitive: */
  #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
          OLDINSTR_1(oldinstr, 1)                                       \
-        ".pushsection .altinstructions, \"a\", @progbits\n"           \
+        ".attach_to_group %%S\n"                                      \
+        ".pushsection .altinstructions.%%S, \"a?\", @progbits\n"      \
          ALTINSTR_ENTRY(feature, 1)                                    \
-        ".section .discard, \"a\", @progbits\n"                       \
+        ".popsection\n"                                               \
+        ".pushsection .discard, \"a\", @progbits\n"                   \
          ".byte " alt_total_len "\n" /* total_len <= 255 */            \
          DISCARD_ENTRY(1)                                              \
-        ".section .altinstr_replacement, \"ax\", @progbits\n"         \
+        ".popsection\n"                                               \
+        ".pushsection .altinstr_replacement.%%S, \"ax?\", @progbits\n"\
          ALTINSTR_REPLACEMENT(newinstr, 1)                             \
          ".popsection\n"

  #define ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, 
feature2) \
          OLDINSTR_2(oldinstr, 1, 2)                                    \
-        ".pushsection .altinstructions, \"a\", @progbits\n"           \
+        ".attach_to_group %%S\n"                                      \
+        ".pushsection .altinstructions.%%S, \"a?\", @progbits\n"      \
          ALTINSTR_ENTRY(feature1, 1)                                   \
          ALTINSTR_ENTRY(feature2, 2)                                   \
-        ".section .discard, \"a\", @progbits\n"                       \
+        ".popsection\n"                                               \
+        ".pushsection .discard, \"a\", @progbits\n"                   \
          ".byte " alt_total_len "\n" /* total_len <= 255 */            \
          DISCARD_ENTRY(1)                                              \
          DISCARD_ENTRY(2)                                              \
-        ".section .altinstr_replacement, \"ax\", @progbits\n"         \
+        ".popsection\n"                                               \
+        ".pushsection .altinstr_replacement.%%S, \"ax?\", @progbits\n"\
          ALTINSTR_REPLACEMENT(newinstr1, 1)                            \
          ALTINSTR_REPLACEMENT(newinstr2, 2)                            \
          ".popsection\n"

