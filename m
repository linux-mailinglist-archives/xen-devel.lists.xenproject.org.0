Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF6E7CAC91
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617698.960557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP0m-0002bm-W4; Mon, 16 Oct 2023 14:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617698.960557; Mon, 16 Oct 2023 14:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP0m-0002ZS-T2; Mon, 16 Oct 2023 14:56:04 +0000
Received: by outflank-mailman (input) for mailman id 617698;
 Mon, 16 Oct 2023 14:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsP0l-0002ZM-K5
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:56:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fee3018-6c34-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 16:56:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7873.eurprd04.prod.outlook.com (2603:10a6:20b:247::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:55:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:55:32 +0000
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
X-Inumbo-ID: 1fee3018-6c34-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdbEg3GRrShyKFvske5pX9Mm0LrKZ2YYdLH0lYJ0ZwfYLtUbngaX8JrQDGAqz6OVObjl0Pc2KgoX2KFAjNgTMAm2e/jl6xmSeK6q23o42TVyRadc+ZfqT1H/WtNeqcktCA2quxj+c4jc2s2SYoX4U7/y+MAbichHo48QJEiCFiRV/NJem2tc5T2oFEVZX2ptKMXJZlTVFkjnt8o4cMGMLe8c0WjVaEg6A80oDrjB4iNIvKMZhwKnNVEJpK4N7kqZ0/gN/JBcjDVTk2ihM8C8PAgZlMkg0jnI9UHJnPqMEAdDrM5lJGUTgOowmLlk3hs34Ir50CCo70ycC/NBBPQzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlLtZUIu1iGBTjgfN899h9SWB4IqzT2WKjg+cmWeNAM=;
 b=U8M3ZaL5vReqBIfNvp9+bB9FHKt/rdWYiVX9404CtGhmB2FyLtePLAlzGlGH4Ct8jUq387z9bgOIdfsvAlrfmRQJzpOlU/SaRPvkqfSp2aRbYFE+aP3Y9L4bUr1pU+rBdfmifmgilrRquy00C1LtJA5oPkM56dk+Y1MyfzM0zyPMwRzoQnd6pF+Pm7p8i4sLpiSvqcvv1XTtnTp/bsaeSmsfNB/E9MwhS0PHTYasrnNIa61/JQQ43XSvE/glxXEXJv7iNSY+GjTEpg4ZttR7CC0QjckGZBOraBUGayTnUBQIaRmaL1ETOPY3ajW7Mke53kltbOuUdx/sbO19aYlpow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlLtZUIu1iGBTjgfN899h9SWB4IqzT2WKjg+cmWeNAM=;
 b=W0AjhrJxIbjVOUM8LgasZ+s3vxUMeZbqr1VY5KnKOlGQA16ttwvl9ZtNJwjv+cIzlF635v2N/kgkK5qjUiZ2RACeWeatfNA2H9+7tvb952da4RyvLCJXa/vokYY39BAlyZdNjYwd5s12i+ZqFtcya6RgewGXiDdJj6hGga5KxhX/uO9hAVMvGpuqIAxvPFm9i1uww0ssRo5I+4p4e4KXbliv2ULtsFiLMR6c4f7IP3QIygecQa+NhmaTGhMGZ2+Hdw3C2QHsXswyusdEwe1H1GkTADiZXPoD8AYybeyvCQAG3Y/XFRwCokJMJAzBJ7GVGME4wn2lmuGrtAG+Rmffrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35528dc6-dbc0-3f3e-e774-c2fe4094bffa@suse.com>
Date: Mon, 16 Oct 2023 16:55:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231013085654.2789-1-roger.pau@citrix.com>
 <9aaae72b-fdcc-b48b-1155-e1cb0401d7d1@suse.com> <ZS0_zPxGLwfsuVvX@macbook>
 <879e6934-93b3-e260-770a-966cf8bcd2f8@suse.com> <ZS1N9wZ05ebun3WJ@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS1N9wZ05ebun3WJ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: ff35dc62-d0d4-46b9-6fbc-08dbce57f271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bvCmCjEh+UfDhNBbQbqRZEnnAky/4PJwu6rnycV1Fle2vhYkFW3lIawiZ6MuP6v6xLc72VxedmdC6COc627trxXHoGEJxSKZJUZ7UoZQCll6a8F/WtgYHZxyPTN64crgfXonsQgf8xFe8lVlIBonS9CY2ESph52XkDKncL9AeTuPH1KYE6OBOC36b6QOrW0xGI25YLnZfyo5loiml8kykKkgYFlj1AwSkJLAmWQg5cAk1WLqDRuFxO9CMJpjhxXNjbLk15+D89ZoC1SOlpLl73eUwWxY1gggkDHZFsFNHViXJS2BbbEVnAaFGwAUb4g1vg5Pr9AIyfMZbnkV5pzkCwAZjO6VZfIdgAs5IipXN16hpyFVtY5w0S4BGrWIaOlGsnvHcGNpUrTtjSqZ+xSSzEQtvCbxqW3jXecJm+zYpxPSWSS6zbPL60rLHVUGcZXVKGpJtBj9NyZhFQgBq75daT8jYqX2mhMKRQWGiy3LU9+6IH9A66QlN5NcsIObZTSOV6uMHcmDNoqhzT36ybwzai1Jo+YotNJJGNMWQSo//NiJvbAZrNWWyila8EodpM15gdpzV3Ge0Q+m9NhSWoG9e7tFM40roVwF08Vh98CGmKBIzO8CQpfS6aUpV6sO6dd48fRFAmv7A2S+wmQxApdScA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6486002)(38100700002)(478600001)(2906002)(6512007)(6506007)(316002)(54906003)(66476007)(66946007)(66556008)(6916009)(4326008)(41300700001)(5660300002)(8936002)(8676002)(83380400001)(53546011)(26005)(2616005)(31686004)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG5HajRmaFZkWlZVUyt3K2x3SGY4Q25JRVpaeUFUT3ZNQTEybGdqdmMrdlBt?=
 =?utf-8?B?ZENERnpLQStiTUlIUjVreFpEL3FITWpyTDNrUXIwVmFxcHhPNEE2Uk5iUDdy?=
 =?utf-8?B?cDBSL2NHcHplaWh6TlVHS0Z0RFdxcTNRbENRdXhLMG00OWwyL2VJUENqYjJo?=
 =?utf-8?B?VElyTU5pZWhNRldFRlJnRmlKenBOaWM4N0ZxK0FLQm52TkwySVR0YVEwODFj?=
 =?utf-8?B?Tno2cVdiSndnSWZ3TXBPZTk5RW1GMjBoNUJjZ1cwcm51b0N4VFVjSlhvM3JP?=
 =?utf-8?B?cVdVOTFNbzhOMytzNjhtd1NzUkx1SE5ZamhsWDZXK0VTcUJ3SUtJRmpKV3Vj?=
 =?utf-8?B?Y0pIWDFXd3lyb3RDN2x4a0U2bVdxZlF1cW1mNFM1MlVqOFhDY0FmcmU4OUJ6?=
 =?utf-8?B?bzN5TzQwZlRUWWRvd2hxRWFaaFBRc0FyWlRubm9PQUdUdkFCVyt5QWVrcHM0?=
 =?utf-8?B?dDM5YTZpZk8rbU1Ic3ZQcEFtbER0cERKaTdwT2x6ZmdRSVdaM3pldm5yeTJu?=
 =?utf-8?B?TWltc2Z2dnkzTGpnU1RMQ0hTWWZZdk1LY1N4WWxqUUE3QXVHcDZ5ZEMwaWhM?=
 =?utf-8?B?NTg4UjE3R0VuZ2JtbXhlVDJlRGZOaEtVcEdYYWRrVnBVMzh4U2RYVCt4ZE0x?=
 =?utf-8?B?MmRKMUhiZlRZajVFdndKRDVDVURBRnNIbGlyUGhiQ25kbUdvK3l6QWZFQi9L?=
 =?utf-8?B?WDhpcUxXenpZR0IvSS9oL3JYelhtV09uaWV0U2RwNDRKWEM1UHpDdGozeWk0?=
 =?utf-8?B?Rkg1MHc5bE1jWDlmN3ZWeUR1YnhHUzZtNmtqYzJNa2Jqdm5NV1VXa2hMYWtk?=
 =?utf-8?B?NjhpckVaUlc0RmMwdy9JV0Q4MWVwSlBocm5pMHMyRGZvWlFjaEg1MEdSd2Zj?=
 =?utf-8?B?L0k5ZGtjSDBLK1NNa1Vqb1p3N3IzTHhLZTMwWGpOMy9lN2tiWjAyc3ZnTXVK?=
 =?utf-8?B?ME5BTjdZM2l6ZzJPcmh2TzR0ek1udzhpRDQ4Mnc4UkxRaDJVc2d5OTBkUEh0?=
 =?utf-8?B?bGxWTjF6YWtjSnpMNzdBZVNYcnBDNlVON1laS0lNMTlDMmo1YUtoUGRjUE5U?=
 =?utf-8?B?VHpTb0k0UGMwdVFVTjl0NEQydFV0c3RkeWJGOEx2ekZMOUhIWklPZnlyeldp?=
 =?utf-8?B?bWFkMUhKbUFhcHpKQ0liVHJha3FZV1lNdGFQM3FNTzhUVXpGTTc5N0ExRW9n?=
 =?utf-8?B?SjhjTDE3cEpTbHFucEZFMkdPVXFCTUhBTkZrVHprQ1NEdkhQcVo3WFZLWk5N?=
 =?utf-8?B?aThTNkFwZjBrZ2lxZVNrckllcmRobFArVmd3b00wNFBneTVXa2NxQUhJUTdC?=
 =?utf-8?B?dHprTnptTE1rTk9RKyswQnQ1cHFhZ1NuT3lXQ285MWMzUXJHdElHa2Y3Q3dT?=
 =?utf-8?B?WVpFTkFZMTlJdVNYR2t5VlVOVWxvc1VURmpJZGNiOURsS1JrbGNhVDkwUjhz?=
 =?utf-8?B?Ulc4UTVRNEFIRDVvdkNrT3ZzdUxjd3BxWkNRbS81SjRRWHM4VlZyNk81ZGR1?=
 =?utf-8?B?OHZ6eGtkOU1Ua3lxYW1ORTR3N1l4emRpNXJoZklrcWg2V3dQUmh3cjZCT3gy?=
 =?utf-8?B?dExwRzBiMWk4Q0VyeVRnVklzUTBxRFQ5a3ExTjZuQ25RdFNLWk82Sit2MmZY?=
 =?utf-8?B?K1l5ampqVWNubnlBKzhsMXE0VDhoRnFxY2RiVTVHS1A5emlpSnJDM3BBdTVk?=
 =?utf-8?B?cUNtL3pHUngzZ2xLaHV6WC96QmpaT3M2d0RRZ0VFTWxkTmhHNmNzcnN5TVBI?=
 =?utf-8?B?aHhEOXFpS2E4b3RYSWxlREFrYVpBM1gzM09hWmxYeUlxUmptY2pYYmt1NU10?=
 =?utf-8?B?cU1xT21HWnlYWnpQdlI1RVhaYlVQZHlOUVJtUXczZ3ZtM1U0dEdCN1JWOTVL?=
 =?utf-8?B?WVFKbjlmeTBKd3lGVVJheUk2aEt6R3NsV2ZOTnd3VldjSjNjciswY3AvdDBt?=
 =?utf-8?B?UmdFRU1zNEhzN04vTms2U21pa3F1UGdiNGxrVnBrM1l3cnVOR1lRY3pZSzd5?=
 =?utf-8?B?eW1meWxNSVZyS3NGbUhrZTQ3R0FFeXEvc2xTdUVBVTZQQmNtMklIdnY4YzRJ?=
 =?utf-8?B?YjY3MHlaeTA2dCs1NnJndmZqZGVBS0xMWGo0WUc2aVNXL1cvdmFBb0hYRGY4?=
 =?utf-8?Q?s1ESck6Fc2/61lqFgigZfx1Ev?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff35dc62-d0d4-46b9-6fbc-08dbce57f271
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:55:32.9128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCefvgtxlIHe7WmxcnGwIo0OrbDTs+lHBBeOGYFdJc7/81NXdgLu3363PBJYjF1qnTd2jY9gzXKahC2vO2msrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7873

On 16.10.2023 16:51, Roger Pau Monné wrote:
> On Mon, Oct 16, 2023 at 04:07:22PM +0200, Jan Beulich wrote:
>> On 16.10.2023 15:51, Roger Pau Monné wrote:
>>> On Mon, Oct 16, 2023 at 03:32:54PM +0200, Jan Beulich wrote:
>>>> On 13.10.2023 10:56, Roger Pau Monne wrote:
>>>>> The mapping of memory regions below the 1MB mark was all done by the PVH dom0
>>>>> builder code, causing the region to be avoided by the arch specific IOMMU
>>>>> hardware domain initialization code.  That lead to the IOMMU being enabled
>>>>> without reserved regions in the low 1MB identity mapped in the p2m for PVH
>>>>> hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
>>>>> describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
>>>>> faults until the p2m is populated by the PVH dom0 builder:
>>>>>
>>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
>>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
>>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
>>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
>>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
>>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
>>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
>>>>>
>>>>> Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
>>>>> Opteron(tm) Processor 3350 HE).
>>>>>
>>>>> Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
>>>>> leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
>>>>> arch init code to create any identity mappings for reserved regions in that
>>>>> range (like it already does for reserved regions elsewhere).
>>>>>
>>>>> Note there's a small difference in behavior, as holes in the low 1MB will no
>>>>> longer be identity mapped to the p2m.
>>>>
>>>> I certainly like the simplification, but I'm concerned by this: The BDA
>>>> is not normally reserved, yet may want accessing by Dom0 (to see the real
>>>> machine contents). We do access that first page of memory ourselves, so
>>>> I expect OSes may do so as well (even if the specific aspect I'm thinking
>>>> of - the warm/cold reboot field - is under Xen's control).
>>>
>>> The BDA on the systems I've checked falls into a RAM area on the
>>> memory map, but if you think it can be problematic I could arrange for
>>> arch_iommu_hwdom_init() to also identity map holes in the low 1MB.
>>
>> Hmm, this again is a case where I'd wish CPU and IOMMU mappings could
>> be different. I don't see reasons to try I/O to such holes, but I can
>> see reasons for CPU accesses (of more or less probing kind).
> 
> Hm, while I agree devices have likely no reason to access holes (there
> or elsewhere) I don't see much benefit of having this differentiation,
> it's easier to just map everything for accesses from both device and
> CPU rather than us having to decide (and maybe get wrong) whether
> ranges should only be accessed by the CPU.

I understand that, and I also follow Andrew's arguments towards not
making such a distinction. The consequence though is that we need
to map more than possibly necessary, and never too little.

>>> Keep in mind this is only for PVH, it won't affect PV.
>>
>> Of course.
> 
> Would you be willing to Ack it?

If "it" is the present version, then me doing so would be stretch.
How averse are you to re-adding the hole mappings?

Jan

