Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F695F44F1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 15:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415567.660171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofiRc-0002DN-Br; Tue, 04 Oct 2022 13:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415567.660171; Tue, 04 Oct 2022 13:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofiRc-0002BW-97; Tue, 04 Oct 2022 13:58:48 +0000
Received: by outflank-mailman (input) for mailman id 415567;
 Tue, 04 Oct 2022 13:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofiRa-0002BQ-8Z
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 13:58:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e48625-43ec-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 15:58:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8108.eurprd04.prod.outlook.com (2603:10a6:10:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 13:58:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 13:58:42 +0000
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
X-Inumbo-ID: a8e48625-43ec-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+YAbk6FF+1IX4pP01bEmLqlQmSJ6CjEJc0gov98Q7CKFPeMi0yoNMtudd1MsnNiyEYpX5fADzaBLVCztoNiYHJVFHQZEq+g9fnY4HMyQhcZZFtp+BoYTs73hKszwyaq6F8RV4PArOcGS0PDHt+Yok8uIZh1O91bB/9z9ItB6m7U11B1pbOT8gc0BWbBis4+U2nCc/2n+LXA6Q6wN7oevWOn7A7jLI7+kgNAlhalyKX1JXRtvNgcfUtoUDxa+nqWTM//RCsWk8r2ZA3hncasMIXhydjfDT+aKRLdjE3qMmHSfgDGxnEu5bTj9jebkQpVfAjUSfzl6VpnQF6zJ1MO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgVmzK68D2Jyq4zTvV5t3uOOLG3wVAeXmYV9fky4Krc=;
 b=VuqHzJd84Dd8KFAj++25nCvfQwKAz6If2CM5i4Be428KDwpZ6C0aPVrZKLNz9e2Ofn7PsaMH4bG7r6cKq70eT3JpveMcWa2FqmwcXSirQuHFDs5hlFvRNk3uQJdBAfWlP88lysGgtazbWrUt1b7L8tRVh7tEQb4/3l4x3h3FL5LNYSRAlvhwAJT50KG9R6OYEsyWyEtinbxO72W1AnVsUl4ex5+kJ/bfu1LpzSC7vCfcANarsN01N/AFmPiJEw/KBvgPXZfE44cl7Ta4Czy8SnCK6heIR76xpiSVT1D9ghQEyOyu5EEBsld+WmvfV72DvVEmhh9QzND/nPkVZs+kaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgVmzK68D2Jyq4zTvV5t3uOOLG3wVAeXmYV9fky4Krc=;
 b=gK6GJp5tVUY3w442juV3x/YP5gaXSeZo+AgJKswnLvDqhZNDR3RgPXv5I+A7IAuQdsB+xgIYDwRXjvdb5pO65YsDI0HM8EdcZDfuRM8d4f6rXiuEraCWcZO/JRo74Nt7loEBIT2w988HxWlkNb3kPvkNy/Mn/yyqtutptTODT5Qwkn0khFYs2M6/XE1vS8Pdr/7OuAmxMizN+Yrq4LeeMxEaKFsxt5/moQj/cjNgursXimzUdsA14L7UmsZFq4SVZC5XMn7U8TRClVOVXCzVB2GZpClzVgBycJsjXVUNSCmK/bkmMP4QxjQviqWJmJn6L952yPql9XaHjMo3QwpL+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <000a9090-df13-6f43-1ee8-0e637714356c@suse.com>
Date: Tue, 4 Oct 2022 15:58:40 +0200
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
 <2d49fdfa-bd76-0469-0840-6260c5a8ff48@suse.com>
 <YzwuJTOtcIopeOlm@Air-de-Roger>
 <5c0f68e5-145a-1616-a128-a2b1a602c1bc@suse.com>
 <Yzw7Ww1s+Ru6qXZf@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yzw7Ww1s+Ru6qXZf@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0395.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1d3b22-d925-4c8b-8348-08daa6108bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lxivd0/WvsJ5i32SBcZev/+nhvk3LnkavYQymWllRWwUQDmsYWHb1sV3RVUwOs/u9ZLo+WlAuHQMKU2hYTq4Tte5ugCvfUnVhe+wGWK3cduFfdxU3vLLc839LLpzBvnKwUdHcoY16Vyfc5YmdcuirUFEO3vOAJv2LA/DZpll1/5lwah3MJyfj6QLK3NeWBh1SbbZ/jAVuZR0ts1GF8F+E/ZuyqLzuS7wd9+wlWU+nkzSdpiSyV2CWQsyg5nWmCWDXUyDos4xCMv/EdcK2gXTbl8KCQ9y1RiWPS7OJFwX+oU3oTTuTzmLJz1yAsUXLcd4asF+t3XSUk4V0q5IhIn/6DmERnkuth+zbtn9XHAxVoGfqbVQvxTxmFBN/g5OVBzQcxDmiG/raP8ENgEUch/PR07nHSW8Jan14xwAKB02qo7Ycixn3vVkikcGJzMwGG1S/RfwVHJ+MxmPiS6Yew1JzaIGULXF3pqdhOBe2TWxzd/V2Oj4Dlh7MVxkPDTD8Uj0ttEgs/f5xSeqlzHmvz7I+8SZzfCTArYbfoEvCCoACzaFAUYVjDyuuiwNAw7X5tMjbYPAGVsl4BlFM9ggQM+iG1Ul1jCCCyQdZtaiTrgf7s0zpQNWoExby3FLBYJQFBz2jpQJ4Vol/qxVeKmx9SsbJ4xAFpeTMY4F22AOyoYPZw6Gx2BJeWKHyK2gDRGgH/kFQWpvS6EU6uEyzCNXw7VWOCo+AKuhqS2nxP7WTjfQXBzN/oZ/yK5elcsp2p0Rh+XMu9Ee0ZPW475vkLBgccYDOEUPJjKcGyCf/9d8V9S+HZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199015)(41300700001)(66556008)(66946007)(8676002)(4326008)(38100700002)(186003)(66476007)(2616005)(2906002)(6512007)(83380400001)(36756003)(6506007)(31696002)(8936002)(53546011)(26005)(86362001)(5660300002)(54906003)(316002)(31686004)(6916009)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OS9Qd3Uxbm82cFNIN205REQzaFRiQlNCNThsdTlYSE5RVFdmU25kRXJzVFNS?=
 =?utf-8?B?REhua1BUSnpZTC82dkwzRndWbU95QTVHbkVKbFJtbk15bWFOQk5scnIvQ3p6?=
 =?utf-8?B?WkdiYXdJazZjenN3b2k2YWpuMTRMb2E4Q2VSM2dvMXFiTEtQc2crTG9XVFpE?=
 =?utf-8?B?S0VGNG90cFUwTWV2SnI0SjdnK2R3NzdXc2VkbjZSZnIvMWJJYmNLc0ovdEhq?=
 =?utf-8?B?SkZyc2NHSEdWVmRBb0Z1dGszT3NxQ2RCNzN1ZDVGdEVWbm9sRU4xeHJlYjZh?=
 =?utf-8?B?aWFSa0tLVmtXTFMwendhTFdITFRJM1BZa1ZpNWgrUjhVc0FpdFJPSFVLZkdP?=
 =?utf-8?B?Uno0dzdmUlZVTjVxSVVYcExCVU80Qk5FY2pBNEplZDdueDU3WmR0dDgyYVRi?=
 =?utf-8?B?aGJrdEJBZlBmVmJOUk1xT3EweWluS2EyRHoydTJsTEEvNEFkek8wYmdzVmFY?=
 =?utf-8?B?WFIrdi9FZ3VIbks1YTk5M3Nyb1FBd1Zzb09MZG9qSFBDYUplcExzKytIdkZq?=
 =?utf-8?B?cWZJbmVSUnR5TGcza3B5Q1dtdHM4enlCSFhMbzB0b0hiSm9uMHpZc0h1M1lL?=
 =?utf-8?B?ajQvVFhqLzNvRkVDVVdGVHBhSTNyTVJ6R0FCd055aW9LdGRHekp6OVJCc08r?=
 =?utf-8?B?cXYyYVRXTitVQXN0c2NPZm1KTWtOMnowKzlmWmhMMGNsVXFOZWhMdTZ2eHYz?=
 =?utf-8?B?SUJwaWNLSXIrSG53SjFBck9ZTVpaVWFSbG5vbUtEUHVmZDAyeDdUcW1MN3lD?=
 =?utf-8?B?UGVNbHVPa1E3UDJTYm0rVWVZYnQwWi95UnNCa1BLZkxOSUUwVi9uS0JqeUI4?=
 =?utf-8?B?RWpOVUFxdTZUMVB5UXByLzFBVXQzQ2tYNitiSU9yQVF5UkdiRUxPcVZqN0VO?=
 =?utf-8?B?RDIxUEkwQmxMcmN1QTZjZVFiSlh3Zm1RRzVXOENmdkI5M05PZXZUbG1HZkRU?=
 =?utf-8?B?czgxbHU1eUlLODdaOTFiSXRJY1VTdEhudjlORnFrRzNtUlVYVGlydklHaXUx?=
 =?utf-8?B?MWt5V3Q5NzV3L2JYZ3V4bGZZY3ZjMmdwQXZmU0dTc3gwbDFxYlNwWmp2M25O?=
 =?utf-8?B?bFQ2SVZPUlk5UDRLdS9uVHZ4a0lGSXB4SlcyMHVNaFN1UDR2ZTdXN3lIYVEx?=
 =?utf-8?B?SG9kbTZmMUoxWHU3MnZXT1VzVi96S0ttRXZHSUoxQ01jVDdJdWQyUjNtbXp3?=
 =?utf-8?B?NytPOXF4S3BJam9RcEJjczkzV2h6YVFsQTFOTjBQRmlDYU1TWHdpd0dBNzhV?=
 =?utf-8?B?aXc3VGhINTc0U00wbzZpdURWdS8xMVd2SlRMWm9JTFd5UjY1S25nakxsdnBO?=
 =?utf-8?B?OG05cVgvNDduUnFDM3RvbTdsSXR5OUZaZlhDcWY3Qm9Xcnk4Y0IxZ1Fjdm02?=
 =?utf-8?B?QWx1UlYwWXhvMUR6WmFVS05md3JyenJyRmpHemZwN3Y2MERRY1duUHRFU0hi?=
 =?utf-8?B?bmYxSEFPODVrcFBNZmtUTkFYZElKK3huRTI0M3JhWmVVaFphWWx3MU4vYXFO?=
 =?utf-8?B?WnZOdThEZ3owdWd4amNQWWhnMG8vOUFsMlp6Tm5iNFQraVJVS2lOK0FqRzds?=
 =?utf-8?B?UU5kb2dhMk5vVGhPblM2ZXpRQm5LalZXdFVHTXVQb1VGdjkrQmtOR1pXZERj?=
 =?utf-8?B?UElISTFvL1ZkdjR2bGNHcklBV1BKcWRUTVpiQTlSRzcrR3lrdm9QZURVVllE?=
 =?utf-8?B?QVh5aFo0V0ExZW1kaDh3Z2lFUTd4dlpRR0dLWmY0ZHNkU21DMkRpL0RGSnpz?=
 =?utf-8?B?cXdNMHVxL01ubWFxU0VNblQxZ2hPV3lSb1RMelQ1R1FCSmdzMm9jRFJydnY4?=
 =?utf-8?B?azEwbnpRQldtblBTRFpjNHlweXBZMkE0M2VpZC84Mms4V1BkaUpmclcxVDVm?=
 =?utf-8?B?YVh5Y2RDWW9PTUE1ZjB1NFdFSmk4STFDb0ZNKzhUUzB4QnNDaUdMNjRzSVRM?=
 =?utf-8?B?WUdSdkxaRTVDazJ0SFJlYUtmNVdMTmRTVE1NR0xTOVVUOU1saU5Oa3VVTWVm?=
 =?utf-8?B?RFhIcjJ0MFMwZnU3V2xmNlhick9VMGd5MktaRlhDQ3FLVks0cHRBVml5UTVz?=
 =?utf-8?B?b1hnbzVDdlF0T3diTHZ2bkU0QnRmMGlMaE1ucnQ0dXh3NHVxeVdvNjljc2xO?=
 =?utf-8?Q?xfY6tCcK4rtyqg3Mhz5l2B1vZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1d3b22-d925-4c8b-8348-08daa6108bc0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 13:58:42.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I845XtGhXsedS5Wz9tNQSFEvCTt7+00KVYsUr0F4gjX5/VCPoPKP/KW7noqE/ItASYKBbB14Mj/8yq36/oMibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8108

On 04.10.2022 15:55, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 03:15:02PM +0200, Jan Beulich wrote:
>> On 04.10.2022 14:59, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 02:21:20PM +0200, Jan Beulich wrote:
>>>> On 04.10.2022 14:17, Roger Pau Monné wrote:
>>>>> On Tue, Oct 04, 2022 at 12:40:10PM +0200, Jan Beulich wrote:
>>>>>> On 04.10.2022 11:27, Roger Pau Monné wrote:
>>>>>>> On Tue, Oct 04, 2022 at 11:01:18AM +0200, Jan Beulich wrote:
>>>>>>>> On 30.09.2022 16:17, Roger Pau Monne wrote:
>>>>>>>>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
>>>>>>>>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
>>>>>>>>> devices used by EFI.
>>>>>>>>>
>>>>>>>>> The current parsing of the EFI memory map was translating
>>>>>>>>> EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
>>>>>>>>> x86.  This is an issue because device MMIO regions (BARs) should not
>>>>>>>>> be positioned on reserved regions.  Any BARs positioned on non-hole
>>>>>>>>> areas of the memory map will cause is_memory_hole() to return false,
>>>>>>>>> which would then cause memory decoding to be disabled for such device.
>>>>>>>>> This leads to EFI firmware malfunctions when using runtime services.
>>>>>>>>>
>>>>>>>>> The system under which this was observed has:
>>>>>>>>>
>>>>>>>>> EFI memory map:
>>>>>>>>> [...]
>>>>>>>>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
>>>>>>>>> [...]
>>>>>>>>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
>>>>>>>>>
>>>>>>>>> The device behind this BAR is:
>>>>>>>>>
>>>>>>>>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
>>>>>>>>> 	Subsystem: Super Micro Computer Inc Device 091c
>>>>>>>>> 	Flags: fast devsel
>>>>>>>>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
>>>>>>>>>
>>>>>>>>> For the record, the symptom observed in that machine was a hard freeze
>>>>>>>>> when attempting to set an EFI variable (XEN_EFI_set_variable).
>>>>>>>>>
>>>>>>>>> Fix by not adding regions with type EfiMemoryMappedIO or
>>>>>>>>> EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
>>>>>>>>> be positioned there.
>>>>>>>>>
>>>>>>>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
>>>>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>>>
>>>>>>>> In the best case this is moving us from one way of being wrong to another:
>>>>>>>> So far we wrongly include BARs in E820_RESERVED (_if_ they can be
>>>>>>>> legitimately covered by a EfiMemoryMappedIO region in the first place,
>>>>>>>> which I'm not sure is actually permitted - iirc just like E820_RESERVED
>>>>>>>> may not be used for BARs, this memory type also may not be), whereas with
>>>>>>>> your change we would no longer report non-BAR MMIO space (chipset specific
>>>>>>>> ranges for example) as reserved. In fact I think the example you provide
>>>>>>>> is at least partly due to bogus firmware behavior: The BAR is put in space
>>>>>>>> normally used for firmware specific memory (MMIO) ranges. I think firmware
>>>>>>>> should either assign the BAR differently or exclude the range from the
>>>>>>>> memory map.
>>>>>>>
>>>>>>> Hm, I'm not sure the example is bogus, how would firmware request a BAR
>>>>>>> to be mapped for run time services to access it otherwise if it's not
>>>>>>> using EfiMemoryMappedIO?
>>>>>>>
>>>>>>> Not adding the BAR to the memory map in any way would mean the OS is
>>>>>>> free to not map it for runtime services to access.
>>>>>>
>>>>>> My view is that BARs should not be marked for runtime services use. Doing
>>>>>> so requires awareness of the driver inside the OS, which I don't think
>>>>>> one can expect. If firmware needs to make use of a device in a system, it
>>>>>> ought to properly hide it from the OS. Note how the potential sharing of
>>>>>> an RTC requires special provisions in the spec, mandating driver awareness.
>>>>>>
>>>>>> Having a BAR expressed in the memory map also contradicts the ability of
>>>>>> an OS to relocate all BARs of all devices, if necessary.
>>>>>
>>>>> I've failed to figure out if there's a way in UEFI to report a device
>>>>> is in use by the firmware.  I've already looked before sending the
>>>>> patch (see also the post commit notes about for example not passing
>>>>> through the device to any guest for obvious reason).
>>>>>
>>>>> I've got no idea if Linux has any checks to avoid trying to move BARs
>>>>> residing in EfiMemoryMappedIO ranges, we have now observed this
>>>>> behavior in two systems already.
>>>>>
>>>>> Maybe we could do a special check for PCI devices and allow them
>>>>> having BARs in EfiMemoryMappedIO, together with printing a warning
>>>>> message.
>>>>
>>>> Right, that's one of the possible quirk workarounds I was thinking of.
>>>> At the risk of stating the obvious - the same would presumably apply to
>>>> E820_RESERVED on non-EFI systems then.
>>>
>>> One option would be to strictly limit to EfiMemoryMappedIO, by taking
>>> the EFI memory map into account also if present.
>>>
>>> Another maybe simpler option is to allow BARs to be placed in
>>> E820_RESERVED regions, and translate EfiMemoryMappedIO into
>>> E820_RESERVED like we have been doing.
>>>
>>> I will attempt the later if you are OK with the approach.
>>
>> I might be okay with the approach, but first of all I continue to be
>> worried of us violating specifications if we make this the default
>> behavior.
> 
> In any case it would be the firmware violating the specification by
> not hiding those PCI devices, Xen is just trying to cope.
> 
> Xen went from not checking the position of the BARs at all to
> enforcing them to not be placed over any regions on the memory map. I
> think we need to relax the checks a bit to match reality.

Sure, as a workaround. Yet we don't want to relax too much, or else a
primary purpose of the check will be lost.

Jan

