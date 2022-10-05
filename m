Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B1E5F5134
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 10:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415961.660589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og09w-0006Zd-T2; Wed, 05 Oct 2022 08:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415961.660589; Wed, 05 Oct 2022 08:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og09w-0006Wm-Py; Wed, 05 Oct 2022 08:53:44 +0000
Received: by outflank-mailman (input) for mailman id 415961;
 Wed, 05 Oct 2022 08:53:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1og09v-0006Wg-Hb
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 08:53:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 364edab4-448b-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 10:53:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8962.eurprd04.prod.outlook.com (2603:10a6:20b:42d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.35; Wed, 5 Oct
 2022 08:53:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 08:53:40 +0000
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
X-Inumbo-ID: 364edab4-448b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTb93ZhSWo2krb/PemS+aXGm8KmWpI6BJ8WxTWnhaeFNchcsQKU6L9nyRiZa+21JPMMWBKeRIa/SHK7F6UKNorSRwFtR+lKN7L7Ix/CMEbWwjeTEeNnbjLzjluW8HB5kzH6m76PjhxaIAr1+W62Z+6lX2SNRGqrgqeIIuugYl7sPhp/NgSucUTGzAO/rQlOYATfHLYMl0RuVlJameOKyCVFrxGgAsQEqUvTztWgQA4lhY9ngGDjx0zLXauPMb1exmOom7rS8TYKdBUfB+DDzfTL5uo4wkvEdGYZeU1DF2Alek2AzGgvv2n5UFR+PA3b4zlSb4SL4aVb1YH5LHucp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2Zetr1xY0K9Qb+N4KGnzbTM303y6IKMboQSifrvcUg=;
 b=XNYtymIAagca71BFQv7E7C2uaTlRlM2HfoL8ieCHSfT7RsTFimvDWTro4StRkU5Vdj7NVdf0Ko9bMRPmr7rY9gin6zRVIvIFSF6wwgLbb+U6pBkMQp3LlNqWJE1KZ2gVhSHxCTh9r0ywfMpeMldPILppvqHROcdx/XIp99M00KubtZa5KAzaF2BwiBRO6ZJmdsjw1fFSUTeUfcrbP6mivglxRfuHVq8TTdGjPC3F5kiKgRBkh1uAwAKpBsP7Pa08OPESPLIL/WBrTc5IWcAPRyrbeOfb38/sN88bQxOSij6ZWXk0dEtog/8bD+5446A0uceT+dcMD2o34bJAabluOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2Zetr1xY0K9Qb+N4KGnzbTM303y6IKMboQSifrvcUg=;
 b=soULI51Z8xHXcUiCKA6anui76pnxXXPUivuFmE9wKjWv8BDaOEjzFQxuXNei1iLg5dOHooB9kcw4uvtVTDlhXwYTQ9VVe0DHZbymjUt3VAJmFqrA2N+2ie12Eh25cOR++4lwDnpbjBbZeU3C5bVkJ2QfYyvxZkFtNf2bJfxgrR87EXT3xKIgmpqMBsWusWK5yt2FF9FZOrUfmC8p2FIwqI8j+wcsZkx1hMp9Rcjxgnb9H9tJ+DaXO3ytoRGMrROKYpklsJJTyFfMhxNXm5EdkP/eI615MUAAW+OODTr99yWHISHKjtJUcPlD2lXK4QqYzEDwHlh7N6oZwoEXMXzi6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e38bae0c-c0ce-4953-2813-0d03bd3effbc@suse.com>
Date: Wed, 5 Oct 2022 10:53:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820
 reserved regions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221004153645.3686-1-roger.pau@citrix.com>
 <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
 <Yz1CPNwo1hiWZTw2@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yz1CPNwo1hiWZTw2@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 30031198-f34c-4c5e-87ba-08daa6af1915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j4YCIE8i2t0SrLXTTxIoM4lkEQiWfaNK8T6SHYRydlEMu3kY2fDq57jyr6cyk8CeFBS4zzJRVZgBlj1YGd+mTYwkgimpCXABmWC+dkHfkMUesL9SnJtyXxKIySDMhzC6LqxjKpQq+ZJRl25wvQdwFPSdE0FspXLboGJ4VL5IG4zqyv0IAREpXMvuFohb9U9ZibbtmPOsPbZ03qHKNUWebVr0wcWfvBPB3WDMuJQHcNAtJw4WI37uU6gLR7rdXqZ9VoyqiBs7XUSc4dW9hZ5UDDij1xkVSJGWYeJ1FDatHLnCHOA396lIno1q9MC1Njnu5zLmCvvEf8WkProil/KlG0aJR38Bprp/f0piNLqoZYKdN10yCOk01oIoe1nf2i351HiYWCSPPATaHRePimj078aWsSAJmMf55udTXpkQFmu6LuKvZ/3RrThRXlM/Crs6fvW0fR0odc3qn1vpROw0Rf9SxJWXX4utvmm9p3jPDS1zfp1E6EFa3QYQoOpsGgbjYQdcz/WO9XJEHWkS5ay+RWyaWM4ONlrFuwnUdd4R/1UvXOgApB5TUDMhA//FX/ma5pR3qGFtlJwrcj/1547FBf1GP+fY/CiJH5ujr+JmOi3CydJ4kKSarJQ7AlVd8f3yEslCa4hcilnzhORVVty7LAfFEn5uWCYdOrmuqPL66/5WxiXZUNJ/8KgjkwlQe/9glMJ36BCFVP1g9lmuR9WnAnF9RqVAtyZlHaQLQe3xdOJm6hz0C3alA/vXkM+ZqdKoCfhpQu0d40LMuCPuoUt5Js6F8XjGyriUXbVyasedJM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(31686004)(316002)(8676002)(4326008)(66476007)(66556008)(6916009)(54906003)(66946007)(5660300002)(6486002)(478600001)(36756003)(31696002)(38100700002)(41300700001)(53546011)(6506007)(2906002)(26005)(6512007)(83380400001)(8936002)(86362001)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk90bHRjNUVkTW90THl4dXlKTk1jNStFWjVCZllpbWxHMUF1UG52NzFZUWZH?=
 =?utf-8?B?bnVNRnVab3BVMkJnTmdsRHVScHNsb0RuNjlRV25JdnYwOHlkNkhMN05vaXRF?=
 =?utf-8?B?bU40eEkraENrYXBQSGhwOE5ZNHZwdVlFZFlVU2tHdVRhbzBjVFlKa0xyVFNV?=
 =?utf-8?B?MkhEL0NTMHhlakdGSklCSzBJQ0VOTE1VMHFOdDNLL09jMGhvQTB5bjRaVjYr?=
 =?utf-8?B?SVNpejNQR1RSdEFRMEpkSFZwaUhMTnlucmxtckkvMHJqZzVjSThrZGlqZDVG?=
 =?utf-8?B?UXV6emltV3pNTmc5bFl3ZUVHRnpIR2x1MGRpWU9iR0JoM0xnY0d3V2hiNGMy?=
 =?utf-8?B?K0ZYTjFHZmhaM0ZtU3FGRHRjQjg0RnQ4NjFoT1F5NG0vZkdBYUladzRja0dS?=
 =?utf-8?B?V0xrVm1nT0JSanZodEF0a1daMWJDLzJ5M2hZNExzVGd1ajRlbys3dXBraE52?=
 =?utf-8?B?Q290VHd0clY1bFFSVlY0QjlJVFkvbWhjdUFDc2p3MXI3ZFhVaE52SDZKY3Rn?=
 =?utf-8?B?aUsyOTlzMi9nTmZCL1E0L0tiYndPTE1tK2syem0vT2NManZ4WGdNWVk3Zm9h?=
 =?utf-8?B?SHkwNWN0NmQyc3ZmTi9acE9MdFVIZzQ2aFlDTTJCUi80SXMwKzFudmFFVGRJ?=
 =?utf-8?B?VzU2WUVvTEQ5cXJYdk11T1VpTkhZU29ta0tCclpCQXozMUt3TWo5cDBlZUlk?=
 =?utf-8?B?V3ZFdVpXcG0rM211bnljdGlmak1Qd0RQLzB5dmVRWStwK3dsRTZnL0lDRmdl?=
 =?utf-8?B?UlUybEp1dS9BMVNzaW5waFdtQzZGZUYrdjd5OGFxaGIxNEVxQWdWMWYrS3Mw?=
 =?utf-8?B?bkI2UEtwdXJYcHNyNU9tY21xNk5FSG9ybC9PZjBybjVzS0lPNytoNGRRWDdu?=
 =?utf-8?B?b084Zkl6VlkzMm9LZUswK2dyN3g4a0wxbk1wVm1pZDhGckp3L0dVVTdZcGRK?=
 =?utf-8?B?cGVjTFhXUlN3OVNYc3V3WE8zRzdTOFVoV1FRY29OVGVFcDFtWjd3N09EUWJD?=
 =?utf-8?B?ZVlDV3RpcXZlTkRRbXl2bStuTDRRZ2tkc2phYVh6bmo0dUlRdWpxRUNjcGM2?=
 =?utf-8?B?a0ZDNy92MkpSNyt6SUxZQzFqb2szTTNFTGN6dWNscy9rcWRkZUlEZ2ZGcGg0?=
 =?utf-8?B?OXVZbjV6d1JRTEJCRW54bFlQcXAwTStEdEtNa2JWZlZMMytoN1RLbVNmRW9q?=
 =?utf-8?B?VW1lOGtEbEZrcmlKR1Jqd1ZDL2dRNVpycmtJNUFVdzd6bDFLOUF0Q2hpZVZ2?=
 =?utf-8?B?WlZiWjVMVS9KQy84ckxpNXRnRWc5a2owVU92eDhiU2hqaHRYTFVGaUNHU1Az?=
 =?utf-8?B?SlZEZEVWZHZ0dGVMbFhCc29za0M2d1pYWHloT3A4V3pLVFRSVUtXT2VYaFNl?=
 =?utf-8?B?a2NCM0VPWjJGaWdGMDgxeDcrUkRFSHUvOUVkRkhIamZZcldGQVZtdG5LZThK?=
 =?utf-8?B?aXV6MktTbU9GbVlCclBzQWlGOTliU05FMHBFbnhzSjBCVUgzMFAzSHNkWldx?=
 =?utf-8?B?QmUybEtLaWhSOUNJVVVQL3pqeVVRU0FwYWdCK251YUVHMiswbk54Qit0VGVr?=
 =?utf-8?B?RitHWXlBUk5wOXpjaVU2MTd2TG9lTEc2T3RpRjlxZFRpcTJwbVBwcE9qMDVF?=
 =?utf-8?B?Y04xcm5wL0Z2V2hrMTNueXVibHdkaUxJU0JSKzlDT0ZReitGZTJ3S3VxWC9o?=
 =?utf-8?B?S3NUS1FSVGxqd2R6dUtvb0lzeWNEVFVjanI4WlZKNHd4UVRwZHBVSTR1eU9D?=
 =?utf-8?B?UW9INnp5UnlndkI3WkMzU2IwNTAxV0RiUnJmYzl4SWFFVzZaRlV4a05vVWM2?=
 =?utf-8?B?UUp5cU9vMC90MVJIa2wxbXlKZjd2NkUyZ2ZRZXdDdFoySnVyeEZxOEE5R1o1?=
 =?utf-8?B?a3kwMkpHcEprNjZhS0lTSndtbE50YnhIME1oQ0h1akNnbnVsUGpvQnc5ZjZ3?=
 =?utf-8?B?WklPNkt6VG5aYkdrZmM5dGZIeDlvNVc1bGNNVGdOVXFlQ0FNOERtaHpMc3Zr?=
 =?utf-8?B?bUFYc2FiNXpLQldpaTFuWVB6YVBJVWNkdDhwYmI0SXMwR3ZlZU14YUFVSGRP?=
 =?utf-8?B?cWtHalUzQXI4NERCWk5rcGx4Yk4yb3NEWGRGRnJ5RlRwaWM5R09iSUVvTUs1?=
 =?utf-8?Q?39W70quG6J8NcLeSj/8fFnhXy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30031198-f34c-4c5e-87ba-08daa6af1915
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 08:53:39.9487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYUF3yUnC296rjuPib8FYF2eGOonIpf1aiYuDD43E1DjYjOZ/wMJWcMYlG8jqB4WdIKjrJGJGjkvdmWzslw6Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962

On 05.10.2022 10:37, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 06:11:50PM +0200, Jan Beulich wrote:
>> On 04.10.2022 17:36, Roger Pau Monne wrote:
>>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
>>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas used by
>>> EFI firmware.
>>>
>>> The current parsing of the EFI memory map is translating
>>> EfiMemoryMappedIO to E820_RESERVED on x86.  This causes issues on some
>>> boxes as the firmware is relying on using those regions to position
>>> the BARs of devices being used (possibly during runtime) for the
>>> firmware.
>>>
>>> Xen will disable memory decoding on any device that has BARs
>>> positioned over any regions on the e820 memory map, hence the firmware
>>> will malfunction after Xen turning off memory decoding for the
>>> device(s) that have BARs mapped in EfiMemoryMappedIO regions.
>>>
>>> The system under which this was observed has:
>>>
>>> EFI memory map:
>>> [...]
>>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
>>> [...]
>>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
>>>
>>> The device behind this BAR is:
>>>
>>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
>>> 	Subsystem: Super Micro Computer Inc Device 091c
>>> 	Flags: fast devsel
>>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
>>>
>>> For the record, the symptom observed in that machine was a hard freeze
>>> when attempting to set an EFI variable (XEN_EFI_set_variable).
>>>
>>> Fix by allowing BARs of PCI devices to be positioned over reserved
>>> memory regions, but print a warning message about such overlap.
>>
>> Somewhat hesitantly I might ack this change, but I'd like to give
>> others (Andrew in particular) some time to voice their views. As
>> said during the earlier discussion - I think we're relaxing things
>> too much by going this route.
> 
> Another option would be to explicitly check in efi_memmap for
> EfiMemoryMappedIO regions and BAR overlap and only allow those.  That
> would be more cumbersome code wise AFAICT.

Indeed there's a question of balancing well here, between two outcomes
neither of which is really desirable.

Jan

