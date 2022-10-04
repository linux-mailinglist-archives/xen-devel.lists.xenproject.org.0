Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E269C5F42D7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 14:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415491.660083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofgsh-0004sN-LN; Tue, 04 Oct 2022 12:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415491.660083; Tue, 04 Oct 2022 12:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofgsh-0004qK-I0; Tue, 04 Oct 2022 12:18:39 +0000
Received: by outflank-mailman (input) for mailman id 415491;
 Tue, 04 Oct 2022 12:18:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofgsf-0004dy-EN
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 12:18:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abc477ba-43de-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 14:18:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 12:18:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 12:18:34 +0000
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
X-Inumbo-ID: abc477ba-43de-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KB5nko91p9b+POCA/nBO/BwJhXrVn50vI+ZBrtoEUk+yMmdFv7VJgT+pLComn0tcMB9O1AdaCVTXO2c4U1d3J1NpefEQuTmWVvIcFBJnKVkcDO5weCLLnCGDaGvi1E0n54eGE8nOdLFRLvd1or89tmkWIrnxn+wKcDKFbJj40LnjAen/dYaB9IOXI/VCEymxIknUAaePxZuTIW8fGETnYn9kLgfrkXVdbj8waBxhsO2Zu9p5Gro5rWU0LWGnfBa/nXjTmubZDgPYeefbgz0+lcvYGaKum+kINtx+1VyHeF/Mn38uvlmfQJq2x1/tTEnH3uRlc7da6XKWonVS1/iGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVbNDry6PEnyQE/A23dPIxuY1Ivnj4hf+RYO4PksW9w=;
 b=PC+VSSqdv/3/0EYuGZlD78rp8HnLu7v7ZTnICRHwMAwR44UYqbwXWMU3UX5I6pQjpwGcr9Qr1roIrIth2LnuOkbvy0T8WNmSq5CecTthJLNCmcb68liHNv/1n81fIi1oPMMAFxAfo4QqDJEnlPH4AwFAeVf65QYleHXZauLOjBL73c8MW57Zd3rZlgB80/E0uVofNeVGRXgwrQbcLA4rNEO0mjvSHKJDmbhHmeW61XeTTQeft/IhlmqTST+mRgHu1RExKul5flGjqKLT1ImYwyKvvY9j9NGUDfXuwL/rOLVd8sgvxU/GQhkAP4MNE9PV8nJSxbiu0wVL2RPpyVyLMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVbNDry6PEnyQE/A23dPIxuY1Ivnj4hf+RYO4PksW9w=;
 b=I+ibPiRQwJXxr+I65GVAIQ5MyQxYNaHo/DpU5Rhy4qlmGEiqcQ0qmM7J9vswJfHi8IL1YHL8v5Rlb3YA4EnGJRAIXzqupj4ImWXZ6IgR7blUsaQj81HJ12wwqc6J75gR5BzyJZHcjMA2dn3gosMefCqC7AsKP9bCYuyg8RwRfVeZL/boHE1OiRWF5gUKXx9m6JfEvZxymygh6hKDa3H9g/ZuBEa4E6TSgfck0dnVz28Skq4cmTv5JQLDa3UzflhpLXSYTj88PAj2qISUI6J3HVx8ZtVw68MaEkKJnLaAqIeI7z40y+p0ZLzpAXtd8W3y5L7cCiCLytxCWQsUXnAT6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9aa0569a-bc18-9480-c86a-817222d4fea1@suse.com>
Date: Tue, 4 Oct 2022 14:18:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
 <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
 <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR02CA0020.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 608632a6-94da-4dbb-29a1-08daa6028e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSoHqGXsxN0Co9ioLSnTKezwTgprbxyGytigQ4VQiZHblEpdAddPKVUHwAMAPicQdh0GDL8h3Ozy9y5tUN9MVLZQ9Fv8SLt2zsjcvLc54eI4N2yyt1XRFBN436SdoROTwz3M2VQuStg3/MjNvoWo6r5y3Iplcnbbykp5PbV5fW9FmnbeNYVEDWaqe4D4r+EZU9Rywt8kREuD28g7GuMtsi+NIYjZgX1buyhpYZQc/M2ILhtFQS8uiG/Zhmz/NLxFHN2TNtD+B+YZIC9Nguilx+Cp8lIsX+mt544Au+BYtm9nkBeiqIKP5kGmMTXzqbKtMHQWU64KyhcKYcE5nYS38c5hM0YFZ0A2L9tSvf1vq9HLvyB+sO0etGzekuz0c7b2Cy9qsF0YTuY3ntPhvg+TRlfFiN4akM9Sw2LzAe0xChxvPl4AV38Wu9cT1JwpVXJ9a41tn6K9mEk9f7U71UAHXMpsbMLHTnGh+UJ6ASMSdH0EnPfdpVafRaVWFMihUX6DZ7AQdwLCpaW0YJsfMljuh+12ZKRW2PQTxfYWZqh0+4KrC0yBmW/H30W4cUExHHgxzPod7ibKujBzNwtQvjs65t/LK04vdkcqnxFFtszjPr/DZjebTHbGBlbkLFfa4GU0WEOWAw/B0NX0ZCXKddPxY1qZSGEhEfLH188WsTggUKw97+GQqEL433TIB5vDtywf6DEf7VtyZNJUMU4p/192hXidBcYk08tp+rNjpcl+gkPVFk6h6g7f37xjGKDcPPQc4TP/gKgbOKscD+RXblvfEQ/6+qdKeLBwq2B5nW2yVdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(31686004)(2906002)(5660300002)(316002)(4326008)(8676002)(66556008)(66476007)(66946007)(54906003)(6666004)(6486002)(6916009)(86362001)(36756003)(8936002)(41300700001)(31696002)(478600001)(53546011)(26005)(83380400001)(2616005)(6506007)(38100700002)(6512007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVdEVU05ZmVUdDhlK2lSa1lWNXdubm14a3U1TlRTV05pZ1RmZHBJOGxWLzM5?=
 =?utf-8?B?a3ZPOXFKU3RSUXQ2OHRwOE81bmo3bjFSSkNSVXo1amZySURtTlM4ek4yQXRI?=
 =?utf-8?B?UndEUWoxRGFGTWQrQ1BLdHpXdDduNFRKYVBkWHJpWUpSTUVkOUVEaFhZZ09Z?=
 =?utf-8?B?b1dEMGltei9GT1J2VGI2NFhoRmdkOHB5NWJIcTM0NW43bTVOcWdicDV4NjBX?=
 =?utf-8?B?N0V4RXczV3BjSTFJZytQMWxxRFF0Z0duUGhZL2x5Z2wzbFlDeFE1U092TU5p?=
 =?utf-8?B?OUtTbTdVZ20xcm9IeWdjR2RTUlQvNUovdjlCQ21oZFV1WEZoOWswUW1XYlRz?=
 =?utf-8?B?VDdkOXZ5NzlnVWZiNlY0YmRwVjZlQndlaFZza3VlUFZRL1ZtT091YjI1Rm5H?=
 =?utf-8?B?Y1hxOUxkNkp1ZTVSV1dRQXpTTmd6aDA3dG81aUJ2MkJwNkw1dTlOTDBOcUZF?=
 =?utf-8?B?KytjaEJNN3N0NG1SMW9vWkx5N2drQU4wZmMyenROMWZtV25lVDNWUzF2UFZ3?=
 =?utf-8?B?VG5tNGp2ejlQemxTTndpU283WDcrMEJJa2gzNUFQS0J0aW92Z05iZjMwUnYz?=
 =?utf-8?B?eG1FL1ArWWloczhvell4U0Yzcko1NnBublh3dnBlZFo3ZzVXem14cmdYNEZm?=
 =?utf-8?B?Uk8vdW1mNFpadUg3Ymd2YzcvUFBMRkloQTlLUjFPazhybWVmTVFTckJHa2tq?=
 =?utf-8?B?b21XRXF5Q0N6TWJITjNpU2ZJdDUzUDloYzFMT2RKUDhNZTBoZXZNRE1hYkZF?=
 =?utf-8?B?RFduUWJCMFl5VlJpTVZMd016bzNkdlRqWkxpZUlQSy9BUjcxSlg4SFhFMVgw?=
 =?utf-8?B?MGhQQlVoUEJFMEpuTTA1RFJISURGSkoyZHk3TEl0UUVwNkpHSGlsY1pvdUZL?=
 =?utf-8?B?WlZ5U1poL09aQktWTXh5OTA1aGp1OHdkVkdMRS8wa29UaHNPMEFrcnh6UXZl?=
 =?utf-8?B?cjIwOERyakNZakZjQ1poYVJwaDdGYTRvQ3l4VHliUmUxUGkxbElFN3IvQmZn?=
 =?utf-8?B?RXovckRXaHF1NXlsM3IrQ2V4Q1ZGbWNHSWZ1REcrRFhGOFVEOUJITkxiY05O?=
 =?utf-8?B?MTF0c3VYZXAxVGNWeWxMTEkvazlEYkx3UzhHc2g1ZFM0WVNpUjI5ZmNCd0c3?=
 =?utf-8?B?YTU5TmZhekpkM0lMU1MvdllIYnNORzk5TjM0VjQvYzBzbnFGSkppRVR2UVZJ?=
 =?utf-8?B?UVZWM0lvRE1mMTdpa09QQnlPbXhQUG5TbnV3aWMwL0pnQTRKNWxJYk9PVEVp?=
 =?utf-8?B?aEg3MmZHekdqaDJIekdqV3lFQlZEQThNN3NZUVNTaEI5QmtzdzZzb29HNStt?=
 =?utf-8?B?RVhsTjhmcDQxWmtqY2RlWDJvd1U3a3lnOFhUdUlpamRzYll5a09RUW1IYWt2?=
 =?utf-8?B?RWZ0bFZKTENFZ3RBazR0WjBuWXkzd3FScDUvUXZad2x1WW0rT0doUmRmTmZr?=
 =?utf-8?B?UG1QRmRLcnJ0YTFkQVFCK2JhTUZLUE5LVC9KN3hIejNyK0x5V29yV2hsdU1E?=
 =?utf-8?B?VWc3NEhZZVo0RlFRSGJSYkg4MXJ6RHdGUVg5YjRRT1pTVWJjeGk0YU9kd1dI?=
 =?utf-8?B?cUovN3JyZkI5SjhldS9NbmU0Y3BVTS9MZGVtZ1FRRkFNbjk4Ump4Qmd5c0NV?=
 =?utf-8?B?VXpPblY4MzQraWs1M3psdFV3dXg2TWc1Yk0rTTRZRWxqdEowbitpZUN6cU1k?=
 =?utf-8?B?RkdjL1hwSGJ1NUNMbTlPZEJHcHUzOGlCOGFMQ2k5bjgyai9UTldLMFJCTzZt?=
 =?utf-8?B?dkdzVU1rK3ltQXNOVmxxZGx4cTJGM21VTFJOV2EwTXowNm9GbHJ0ZHNzVEF4?=
 =?utf-8?B?bEJNVyt0U1BXMDZCL3JyNFhyQk5LbXBsUFY5RWEveUo3WWllQjdlc3VPZ1c3?=
 =?utf-8?B?MWRGNitIWDRwYVFQOU16bE51Y2JDa1dDT3pBR090VVhHYTNGOTQvdXVEaTFT?=
 =?utf-8?B?bmM5Tko2U0J0UGlFU0huYk5hb3BJdFdBKy8xTmhjcXlEUmI2R00rRjBDdTFo?=
 =?utf-8?B?SmN4ckxlcGluOXYwUlg4SFpuc1kvN0drOUxMSEJMVmFSSkh1R2xPRGlIcloy?=
 =?utf-8?B?VnFLWGs4UWxFQm4yN3Q3UTltUDVoaloyS3hyTFJxVXkxeTNkVnhMT0lJSktE?=
 =?utf-8?Q?inuJJLC/BjzR/HAq+NEtLOJQ1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608632a6-94da-4dbb-29a1-08daa6028e8b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 12:18:34.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqGMCOyGAGyVSZbET037j7wX/oCPOIV9MEXx0etG7hsxR0v3HTdV2eE1iVoYAwEOt/73WnK/HP6VPNIajnCOcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7874

On 04.10.2022 12:54, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 12:44:16PM +0200, Jan Beulich wrote:
>> On 04.10.2022 12:38, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
>>>> On 04.10.2022 11:33, Roger Pau Monné wrote:
>>>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
>>>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
>>>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>>>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>>>>> runtime which was re-used for other purposes, make
>>>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>>>>
>>>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
>>>>>>> dom0 doesn't try to use it either?
>>>>>>
>>>>>> I'm afraid I don't understand the questions. Not the least because I
>>>>>> think "it" can't really mean "dom0" from the earlier sentence.
>>>>>
>>>>> Sorry, let me try again:
>>>>>
>>>>> The memory map provided to dom0 will contain E820_ACPI entries for
>>>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
>>>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
>>>>> overwriting the data needed for runtime services?
>>>>
>>>> How would Dom0 go about doing so? It has no control over what we hand
>>>> to the page allocator - it can only free pages which were actually
>>>> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
>>>> DomIO - Dom0 can map and access them, but it cannot free them.
>>>
>>> Maybe I'm very confused, but what about dom0 overwriting the data
>>> there, won't it cause issues to runtime services?
>>
>> If it overwrites it, of course there are going to be issues. Just like
>> there are going to be problems from anything else Dom0 does wrong.
> 
> But would dom0 know it's doing something wrong?

Yes. Please also see my reply to Andrew.

> The region is just marked as E820_ACPI from dom0 PoV, so it doesn't
> know it's required by EFI runtime services, and dom0 could
> legitimately overwrite the region once it considers all ACPI parsing
> done from it's side.

PV Dom0 won't ever see E820_ACPI in the relevant E820 map; this type can
only appear in the machine E820. In how far PVH Dom0 might need to take
special care I can't tell right now (but at least for kexec purposes I
expect Linux isn't going to recycle E820_ACPI regions even going forward).

Jan

