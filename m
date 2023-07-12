Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5024750B69
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 16:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562585.879329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJbAv-0003JM-Ho; Wed, 12 Jul 2023 14:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562585.879329; Wed, 12 Jul 2023 14:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJbAv-0003Hh-F8; Wed, 12 Jul 2023 14:50:41 +0000
Received: by outflank-mailman (input) for mailman id 562585;
 Wed, 12 Jul 2023 14:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJbAt-0003Hb-PU
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 14:50:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76dbeed3-20c3-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 16:50:38 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8086.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 14:50:36 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 14:50:36 +0000
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
X-Inumbo-ID: 76dbeed3-20c3-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhH4ZVNKSYuNHiLDblrALwKOuprX4FxB+AFU8/TjagABSspGhPqPdgpyi1/I9AyOLImYV9dPsMNeTUs2qGDnJUKqAWiIy9T7Ex4jgLpWWrLHlEhu3lQ5zRDdxGkvmb+uEbqAztrwl3aiZbsMUC9xPot47nhB0dxN4J1JnxSv+bcJLfo/yfcOx8AAtEBb+jN28KPrVCMARanoHsCAKJy6UlKXJ424QpfsZFQz7ysv83CYToqXDc5ZopzUbF2EEQY8mZkl5i3SkWf7XHULoWJ1mWrcJx5Y+X1jv3ab4ELdSP/Zw5c6GW32NfN4WDudb8Q+3NSokVRg5q2TSHIcMdYB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fmrr+0oe+hp5dkJ3y2M5RfCMw4ULlntis3R15ewqVQ=;
 b=kcAWuq66bgl05LwOK7j3skje9BFFlBOR8nw2YBC6gaLb9YOiFRYcU3aEDdWMxFLuad5BT38uj10UGoGn3re67AgFjDka/qKUF9ke8nYI2kvh7/0L+OulrjtIaSP1+tU94qT5gjMo73TWDKHa0r5YpNgQoZYPVm2xs4VPLn9VaAGdpjgQ/CGql0qMmDMUrYtr56aszsUDTIER6Iwe8H2eVq0SQCm6cyA+DeCaujVqQk0oH219zymiPON1aFx3Fus60TsGOBkAoP9ejZVhummuOT8bSWj+uXBPA9RhYTPYU3i4iZj0E2Mpe0n8wX6SG4SJOXLIE8Nc9fN7KBQK76jBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fmrr+0oe+hp5dkJ3y2M5RfCMw4ULlntis3R15ewqVQ=;
 b=Q+AFOjcifNPEM6yP+KeRT9ASOGsaYZAasY7xIXTX/GwXQfkG4b6FkuFcpcSiXak47kao8vm50WJPVmzZ7jxc+EsV423utRGX/jSonb7cItbpFIkr3GoGAryAisQ8KK7ew49rFCdv0TRKTx6aKodriPPeXYAZAHImX6UU7aATw+nvBTnfMmWxOOIWjwNpI7nm7+8I9uuATiNa01Pi9UGckwvnGUoY6j9VFNOn7bPsViAerEPDuu0mvuZ4teghXFSETOc31+r2ml/Qm/lwBdMKcy2EMRQwXfcW9Yeprx5e/bkVpyMiC69guJC0onB+VR7XVam/idpiOr0sxl3wytRfNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
Date: Wed, 12 Jul 2023 16:50:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
 <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 32de923c-e7f1-4f0d-78ef-08db82e759ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OdIidflwN4YO+u46KnqZDBCdl7owgGtqrFmjdiRIamMmwCUlmXVMftWzfry2bxNT6rwFZ20gsucYARwDhFrxJRbwYzJbr89i2dF9fKw3sBFr4G4zXoKaEWX3qS/k2ViriDCUbcPfItlm383W4abKmMC8o0/VaBVyel15yu33c/HNTjDLYDpv8iaV5mFmNxqUwNLIA31FXxVr6P+1BqcbP1M+KSqRF9c6E0rf+kiORHqdgZ6m9gkS/JR/ovkOgSOwZX8uV5wp+WIpMuCSnsU4RsRE5tylwtwiv9H97/xpIqTlmXV3jW/vfZ4kdXElclQZGqDWz7quPCwDcm43g9aq79HbGOgoYaoHyspFRgiGM1DNaBMKw4LA/fX3TlgapJ1hxJ6msjEH2Bv31XB2pnLHzQBbwAh2oVGJKkc1D3mlSXlmz5DxKJmPI6NjkAk9Cp7Qhc01cE/HC2iZweI/aZoBtiw42cD6ERgFPHLXtTv3MMvSw8QHQUhbfOwZODH2fk0LdvrRa/FuaI8yhGYi0fkgjr4nssRC6mc/EygU66Tbm20ujMh7Hft40pDuRQ2TegFEFck7D59mQ2dGgjCK1jGLvr9r+phFhn8tlm3xhpAnk54a2t6iZWvqitmBiBCwGmkUXA6IkXKXIzC8+hvCXD1Aza621ixr2dXYn1UG/GiiCD2KMxWXNPhcO1ZczfwPonnBY5638ZK3nZMY2xlepFP1hQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(8936002)(8676002)(5660300002)(478600001)(41300700001)(316002)(6512007)(6486002)(4326008)(6916009)(31686004)(53546011)(186003)(26005)(6506007)(66556008)(66946007)(66476007)(54906003)(2906002)(2616005)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3JNa3hjYlZmc3QrMjAyNnJWenN0QXVBdi8xSUVpNDR3K3QyYllsQlJaUVVZ?=
 =?utf-8?B?MWZCdGxJcFI1VFNvcjFTaVI5RWN0Z0laQzExVFlKalp6NmhCRGZ6Y2JCSVh1?=
 =?utf-8?B?c0ZTdE5IS3hCeEdTT0pXd3dTTTlaaWFDU1hnWjNnSml2Smg5eXhUem1VRzFV?=
 =?utf-8?B?OUNMdTAzblBmM29ENS9IUTZ3RzJZZGNRN1JvVlNmZnJjT2ZNTVBEcW11QzNQ?=
 =?utf-8?B?aUVFZ3ZCMzFCaXRyZHpxL1pDZzJabEgrZzZFZnVHNmdWazlnck9Ra3cxdkNw?=
 =?utf-8?B?akN6UGJyUDJEK3lCZURFME1NcnBUSnNYUElJNXRZZEFReis4WXNuS3E3YzRF?=
 =?utf-8?B?WTh6eENFLzFSdW5ISkZBNUlHZ0x3YjRWVjVVcmswZjVSb0EybjZPOFVBSGU1?=
 =?utf-8?B?YlFERkRXanBjZFAvODZPVGtjMWVRTnVxMnE5enNMUU9XQVJ6bnZPVWd1WkR5?=
 =?utf-8?B?QzNrdUUyQTNseWY2ZDkyWnBpdWVqUC9Fcnl0NVZRQ0lzLzJsL3dCcy90SkVi?=
 =?utf-8?B?bFRhSWRQcTYzY1NNeWpodzhKRmE0bjBsMlhjTGh4cHVhcUNWMmtPcllJL2xt?=
 =?utf-8?B?aGlVaE0vbmNaTkVGaFNPMUp1UjE4NXNZZk92ZzVjZmtZMmlzbWF3cXpkR1pL?=
 =?utf-8?B?dmRtcTB6OHNxaVJldElIMlZYb2cwdVZ6K2l1b003YzlaTGZVMjkyQW1JaXA5?=
 =?utf-8?B?VlJZTGJYVGJuL0grT3FWVVVkaVY3aEVCemo5ajFnbFY0enJiZHNtRWVxcWZK?=
 =?utf-8?B?Um9uR2RJaUppeHlUQnVkZGNDWTQvbjBKTENZYzdkOVdBdVZzc0lGTnM3cDZM?=
 =?utf-8?B?cmEvTE5wL2NxZW14NW5wSVFHYzI3RG0xZkR1WU1TTHNLV1ZHM2RBd0I1UVFn?=
 =?utf-8?B?VkgvQnFvb2Y3Zm1EaHJaUE1ON3NSczc4QVhERGFrNERNQ3g4N09TUVY5ZVFv?=
 =?utf-8?B?QXdDL2dScWVyaXpHMU5rY3plWGNTb1ByL2xjVGlzR1QwOWRibmtvclhWQW8v?=
 =?utf-8?B?c0haRXRjV1JSN1pLeldZMUVSZ1ZxYTBydEM3eXplZmhocmttN2NKUHg4V1Y1?=
 =?utf-8?B?NnZRTk1DcE53RjR5S1JIT3hXbU8vb0t2a1ZMQ0hWaEI2eFVZb3ZQeWphTHYz?=
 =?utf-8?B?eDJQeHphNGhEanVLNTVhTmcyakpraEZyWHRSYkNrTDkrZnlZZHJNQnAvZHRi?=
 =?utf-8?B?K0EwUkhuK2ZrOE05U3V1bnY0aDB1SWZKZW0xaDJHQ3lUSUZ6dnlOcEJvcGRq?=
 =?utf-8?B?clRON2hMQnBOaVR0cG1nRTg2Ykt3LzR6ZEt1NlVoT0Q0NWJlL1huQlNxdE45?=
 =?utf-8?B?MnhXT0xKcGc1ZTh3TDNYZ3JhS1ZvOElIYTFpVVhqQlpQNHhwY0hUQkZmRzFT?=
 =?utf-8?B?YWE1eEs3cWc0VG8yUXFqN2RFODJqd0MvMWJFdTNBcGlHaTdMS0xuQWhoaXdH?=
 =?utf-8?B?WG84WTBzQVNTZTJaTUt0K3MzcmlUTmR5NVh3VHBKRThFRWROMUk5QTdCeUFM?=
 =?utf-8?B?YzVIZkJJL3BzSUFxeVBRbUwzUTNLb1hrS3lWQUhJT2VmdFpoaytPSEJ2WGY4?=
 =?utf-8?B?dkQ1bDYxUlNYNFVuUVhvSTRRZUJpRCtpQlgxcHU1WUdGdmJQV1g1YVJpVFJ5?=
 =?utf-8?B?UEVhRWlZa1lObmxEaVFoWVpTd25jd2JqODRqdGh2WTlUWC93emhHM2ZNTC9s?=
 =?utf-8?B?VStnai9JWDJRcE03eXp0UEpuY0FnWThENDNGdFJXdVBjRnJDVXFvcnFkY0V3?=
 =?utf-8?B?dGNtZTFPcmJheWd3OE9SWHRhTlQrWktXQmJ1TUpEN0QwbmV6aEJud3NMakh2?=
 =?utf-8?B?Z2pSWldOVCttQjBvSVJleDdkYUxlUU9mMTVWQUw3VnlMKzBSNW9pVWNBT3Ju?=
 =?utf-8?B?YUp1b1BUS0VGVzJoSkxlQjQ1eXNUZjZjYWVPR0swUWhZV3pCM2J3NnMySEdz?=
 =?utf-8?B?VlFCelpQaCtkRkZBL041aGVyMVJCbmtwZUdhTDYvT252amtXWkV6NUYva1ZY?=
 =?utf-8?B?eFdOU1pMQWZQdVJpVEFaMW5zZ3hjWU4vOVhLd3lhSkplZ1puTEpCNWZOUjR2?=
 =?utf-8?B?OFhhRWJDMWMwOFdRa3ZVWS9FL3Z4clZpRGl0ZVZ2d1R3SGtiMFhsaTAzbmdu?=
 =?utf-8?Q?omgyGvrtxWnbA8qBIi0pPSGeJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32de923c-e7f1-4f0d-78ef-08db82e759ff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 14:50:36.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/DaovDOkrklZl38YPUYoQXeCBzyEQxiGDYj+l3Ew+wRZJp91cSsD3iBEbduv7mcA+Ko/zMIDSIJFNDe2RczTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8086

On 12.07.2023 15:53, Roger Pau Monné wrote:
> On Wed, Jul 12, 2023 at 12:07:43PM +0200, Jan Beulich wrote:
>> On 11.07.2023 15:02, Roger Pau Monné wrote:
>>> On Tue, Jul 11, 2023 at 12:53:31PM +0200, Jan Beulich wrote:
>>>> On 10.07.2023 16:43, Roger Pau Monné wrote:
>>>>> On Mon, Jul 10, 2023 at 12:56:27PM +0200, Jan Beulich wrote:
>>>>>> On 07.07.2023 11:53, Roger Pau Monne wrote:
>>>>>>> The current logic to init the local APIC and the IO-APIC does init the
>>>>>>> former first before doing any kind of sanitation on the IO-APIC pin
>>>>>>> configuration.  It's already noted on enable_IO_APIC() that Xen
>>>>>>> shouldn't trust the IO-APIC being empty at bootup.
>>>>>>>
>>>>>>> At XenServer we have a system where the IO-APIC 0 is handed to Xen
>>>>>>> with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
>>>>>>> with a vector of 0 (all fields of the RTE are zeroed).  Once the local
>>>>>>> APIC is enabled periodic injections from such pin cause a storm of
>>>>>>> errors:
>>>>>>>
>>>>>>> APIC error on CPU0: 00(40), Received illegal vector
>>>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>>>>
>>>>>>> That prevents Xen from booting.
>>>>>>
>>>>>> And I expect no RTE is in ExtInt mode, so one might conclude that
>>>>>> firmware meant to set up RTE 0 that way. Mainly as a remark, albeit
>>>>>> of course there's then the question whether to change the RTE
>>>>>> rather than masking it. What do ACPI tables say?
>>>>>
>>>>> There's one relevant override:
>>>>>
>>>>> [668h 1640   1]                Subtable Type : 02 [Interrupt Source Override]
>>>>> [669h 1641   1]                       Length : 0A
>>>>> [66Ah 1642   1]                          Bus : 00
>>>>> [66Bh 1643   1]                       Source : 00
>>>>> [66Ch 1644   4]                    Interrupt : 00000002
>>>>> [670h 1648   2]        Flags (decoded below) : 0000
>>>>>                                     Polarity : 0
>>>>>                                 Trigger Mode : 0
>>>>>
>>>>> So IRQ 0 -> GSI 2, so it's likely pin 0 is the one the i8259 is
>>>>> connected to.
>>>>
>>>> Then wouldn't we be better off converting that RTE to ExtInt? That
>>>> would allow PIC IRQs (not likely to exist, but still) to work
>>>> (without undue other side effects afaics), whereas masking this RTE
>>>> would not.
>>>
>>> I'm kind of worry of trying to automate this logic.  Should we always
>>> convert pin 0 to ExtInt if it's found unmasked, with and invalid
>>> vector and there's a source override entry for the IRQ?
>>>
>>> It seems weird to infer this just from the fact that pin 0 is all
>>> zeroed out.
>>
>> As you say in the earlier paragraph, it wouldn't be just that. It's
>> unmasked + bad vector + present source override (indicating that
>> nothing except perhaps a PIC is connected to the pin).
> 
> I can do this as a separate patch, but not really here IMO.  The
> purpose of this patch is strictly to perform the IO-APIC sanitation
> ahead of enabling the local APIC.  I will add a followup patch to the
> series, albeit I'm unconvinced we want to infer IO-APIC pin
> configuration based on firmware miss configurations.

Hmm. The question really is which of the changes we want to backport.
That one should be first. While it's largely guesswork, I'd be more
inclined to take the change that has less of an effect overall.

That said I can see that Linux have their enable_IO_APIC() calls
also ahead of setup_IO_APIC() (but after connect_bsp_APIC() and
setup_local_APIC()). IOW with your change we'd do the masking yet
earlier than them. This may of course even be advantageous, but
there may also be good reasons for the sequence they're using.

Jan

