Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A07495D6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 08:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559624.874758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIi7-00052Q-VA; Thu, 06 Jul 2023 06:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559624.874758; Thu, 06 Jul 2023 06:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIi7-0004zO-RB; Thu, 06 Jul 2023 06:43:27 +0000
Received: by outflank-mailman (input) for mailman id 559624;
 Thu, 06 Jul 2023 06:43:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHIi6-0004zI-8K
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 06:43:26 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67da3576-1bc8-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 08:43:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8145.eurprd04.prod.outlook.com (2603:10a6:20b:3e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 06:43:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 06:43:23 +0000
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
X-Inumbo-ID: 67da3576-1bc8-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7Vs6VFmHkUSNlwrB/oCrT1pkAV4hxSxPBd1OZtbA2Ci2iN6aLB1HQ4TIC8EGESw+SkV8KJL8zUFn2Ru3/p55ZYY1AXsAUZ6VWnQ4J7bWvwTQ5SnbvAAcI2d/pbo/P0XSR0+KRUbYWW9ejuZqqHWCZPe27Hrrhv7CTfk2RkvW2GrFbzGx1z36o90/Ba6rreGPMm4oYxhaob+Tj0u5TU4C5gYTLsicpd29+uruQo66CQE/apFQK5v++aUCz5/ag97I3E496EhDjZ4tqY14NbtSUYCOQFvNg1CpwtFlx6OFsYSG/w6Uqr4jLOOcf5/AQhO/+fDP3dyuYlOEV4cckTtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bagEtTKs5q13dVLsVFlOthdrN3/s/CIu16GN5UDm2k=;
 b=amBcjYuPhao2LNGanEHyVaKciSJv9zJd/AqU6Ims75/5KGuCgZgfABdeMSxQqOGKkC992nKzJqd1p2L0DyZxtdTcTw+mlvjiroHJ95kx3vQY9uzT6FQpZH7r8uO6UN8AIscwrQ5bzmAcqwMpQn9OFw27Q5KyI77QxEJ9f548ou+/YcHhZEO5sRZO7IIJgXnV6CXaOrvctWMhQv+cxup5nc60pw2xOku0z1kfJ4Iqx14yNkTBtVCI45CiHwbNdSF2I5RaRz34PvN9o5z4iv7jqR1gn9lxPy+L+1ZQLQuTrxkiGLd22woDkCRMe0zxiyxh7vJ/hrF092hQ2b7NRuJ77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bagEtTKs5q13dVLsVFlOthdrN3/s/CIu16GN5UDm2k=;
 b=NOXyWL0UhFKQKxOVCW7w3AANrjhUucVqPJStYHI7jTZmeLYw9UeQxNtjkn/4HN6IENbrRWlPY4+yapEMGjEbEWt+meWl/cTVIxRZILXxh2aXYdqIPzkbTbsu2s6Keog5hIdOKte65X3FCs8rjesKU0GsYG3pDysVoL9kOduKLoIJVbJoSOUIU0BRrnmg5e9x+ZBYLwPXYhIF/cD2r3gs1dp2+UKmQaztw+wEkFT4rOcUcrIV1AHhqeD2H4smO5ZOVWbgGcCZs5zGu+A0OLdnAJev5JEson7+CNuruidkpsnLzfi7Y+uyXobEjv/eSsiYa1L8Nb3q7haNz5HsaRDqJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f821cb7-37ea-5f50-0bb8-57044fe46817@suse.com>
Date: Thu, 6 Jul 2023 08:43:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 5/5] x86: make parameter names of function
 declarations consistent
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
 <0076f2d6-03b7-0a1c-c423-1f55b7195407@suse.com>
 <alpine.DEB.2.22.394.2307051550070.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307051550070.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 7428f4ce-08df-4ffa-1b9a-08db7dec4b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/cW266jYN86XZzmx9bLVvJDWop5ENwr/bV97ahnnynQJFqozYzDwI+O5ZTZrw7GpKOI/aOjwgn38W4NNniR69pzWIKqgm1t9f9YI0SvFKwhmR+wuqL6FwDSSaUybX95MS9Xyo1QIea/7MhKqmqUzUlPUaawjomY20N5H6xL33aPQdfp8Ubtszb5kTYYfvSpZWToyPQ3PijwoD+3F3Wasb85HaGDWvfUh48b7ORrOHSRiOsJsIL4ePgobSISpDw36wfB8cFmI/IdzirinRTjgy/7ESxcu8ol91jrJoO4Dkus+6fMaCEkg1EfrI0ufqxhMOMG3Tlnkd98V8PKKmQ8wx5qo51Iatx+3d9e4P9MTXqdiTn+T7IKPUkyQA11pbQrKtfGd8MefxOme7LgRjT/W7M05ahQ6NbAKcjmcGxb963MTgMr6KLmcpbYZCrOCXDeRWm3Rxr6dJ3YPWP/pn0SVVtcSYRAuO6HBRlWXpizbFRXoEJwrMigF6LDSxiUKfkvwKz+YILGe8tWEuM4Tu5Je+TYGChvOMMW0lAOWgrP/ho4Y2SaEUKfUfgnEDBCk9leLxji7xiJ6wpn7CXDK3isI7oh+B8sG6F/IjIt6iHaOpbCz5DMNPzLHiYgCwyajVCFCNY490G5WM3tVIWOEWt67HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(31686004)(7416002)(8936002)(8676002)(5660300002)(41300700001)(83380400001)(316002)(2906002)(2616005)(66946007)(38100700002)(6916009)(4326008)(66556008)(66476007)(86362001)(186003)(54906003)(53546011)(26005)(478600001)(6506007)(31696002)(6486002)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnY1ZTFCbEI5SS9WbWlaVzI0dTZjclRXMGc4ZmdFdU0vZEFJbE1BR3B2ZXo5?=
 =?utf-8?B?NGw1WnJjeGZsZ3FXL3ZQL0tEYWNhVjV5MWN5ZDFZVzVhTXBOODh5YkNQL0Ju?=
 =?utf-8?B?cXp1aVJYRnN1RHpxS21oU1B6Q0JVZGlkYzlvVFc0KzJEd3UrU203RnlVUnRl?=
 =?utf-8?B?Q0pGdU1GZDFja0FYT2s3K3k1Z0MvVjVyenExUHM1b3BKalZEaVpSVzRVbXI3?=
 =?utf-8?B?K1QyODAzZHVnNG1hdUdDclFxanVyK3VKZDdHRFBCTjgyak1BclZvdUlqRHRa?=
 =?utf-8?B?QmpDS0RmL0FxOFBNZGxPL0FnSnlLN3pscGphNXgrUzNvbUljR0xwK2VUa3hh?=
 =?utf-8?B?OTBuTkxjem9QaVM4WDRrNWp6OHREWUdDeGVSNWdscUhXelU0K0U3M0hiTWds?=
 =?utf-8?B?OW5wMURhQjBYTHIwYVZkbDMza3BWS0QvbE1iT3RVenhRMDAzaHJSK01WWVhn?=
 =?utf-8?B?TXExekdZaU5oWGROL1ZpK0gwZlJwNklOYzhrNEdOL0JIUFRqUHdsMUxMek1M?=
 =?utf-8?B?bjU5N3F0TnJwdisvcE5odXJMMzk2cEhERUVnSlo2Rjd4SFBlUy80bGJoVEtU?=
 =?utf-8?B?NWgrRm9vbVJVbmNldGxoWlQ1bGd4RGt5end4UllrTjlEVmtlcTI2UXlLekla?=
 =?utf-8?B?bDBKdTRzcHpGNHpsSk9PWXRzM25SdW0wTzlhbXc1bGNEOXRMbW1lYW5sTmQ4?=
 =?utf-8?B?d1V6M09mbzJqemNjUmE5OE5nNEdYMU5TOGR3MElNUjI0d0twZWRlMHB3Zlcx?=
 =?utf-8?B?UlJyNERxNjRndDdveWZWTE1KMElucGpCWVhTdkg3SnoySzZ1S1FrVENqeFM5?=
 =?utf-8?B?Nk96SjEzZ1hiZk9WUm5oYWg0elhtRUZYNE9uaEtsdERqUE1NMmNpK3ZYamcw?=
 =?utf-8?B?Nk5Pbm43UWdleXVIMjhYaEtUd1l2ZERYdGlheHc5SjlaOGpxcG9tZkxXdDE0?=
 =?utf-8?B?clN0SngzWjNNRlFTcUxUeDlDY09jUUdqQzFwTVVnUTVGYzRWOXpma3pRc3Zh?=
 =?utf-8?B?NjZDbzNyT1lTNlhLN0FvUkJ5elZ1MVMzR0FlRVZKZlJSanNaK256dENuMEt1?=
 =?utf-8?B?ZDNSUVlZak5ha1hnTlh3Nnk1QnV5MVM5MnJCZGhlOVQwTmtBLzIrNE9MVlNT?=
 =?utf-8?B?TEZHR3hoMm56S1dpMlZSblZMa1VvMStmeWhsaXhpRHlIRU5qaWM2b3M4blRD?=
 =?utf-8?B?Y3N6NGh1dHp5ZEVZcVJEOTBMSEV6SEFaK3FWRHFzZDNpV0kwVnU3VlhUclEv?=
 =?utf-8?B?dE9WOFdJTWFKM21lVnhrMWMyamUzZzdFUG1lR0syVm9aVmRCeVpXcXhaVnVp?=
 =?utf-8?B?MXNJNnFwVHRYc3FzbVZHZjRxeWxrcVhFR1Qva0I0UE9HVGJVZFZYc1FWUjRD?=
 =?utf-8?B?SlpsZVlSSlFlam0xRkZwZzFBVE1VOTVQNmVGRE1IaTJ3VGxoOUpTZkxHYW41?=
 =?utf-8?B?Y1hEYU5YamM1Smk2bVQ0bnl1ajk3bFFyMGkwdmpuQ050Z2JLVVJmWU9ONUto?=
 =?utf-8?B?eUcrOTEvMm1Pc3FUZ01nalVXTm1LU2drc0J5cFZhMXNYeGhsRERMb3lubDB2?=
 =?utf-8?B?ZmRVYnFPSDMvZXZqcjV1cVlEM29qRDQ3c0ZjdWYwdklIZHlzUXMyNUsvVWZ1?=
 =?utf-8?B?YS9YYlNERTB2VDZwSlliTUc3UjZpeWdGWFJFOFdjMWVFR2dsc2puRGE0Kzlt?=
 =?utf-8?B?Mkl5MlU1WGNoT1k5SE5xdElaNXBtM2JicjBxQ0pIR3ZUeE16QlZXdFJZSVJN?=
 =?utf-8?B?ZDVkd0loRXhNS2swcjlTWWNQbHpkUy84RG0vTjh3MDd4SlhUQWJZZ3BXalRz?=
 =?utf-8?B?Rk1WQ0hDcWtJK0FzaTY2REFlWEY5WkU1UWhNQXdwMGhjaDlQa3F1amhZK0la?=
 =?utf-8?B?aGFMeXk5andvYXpKdU80UmExT2wwWEpxVlNQSCtEVk9HZUNTRHRiNDZodVZo?=
 =?utf-8?B?cUVoWHVza2tmZHFLLzM2cWJaSlpzT3NpK0lhYlAxblF0WktXZU8vT3Rid1lL?=
 =?utf-8?B?WHhmWEU0d0JQN25GbnJzdzkwZjVsZHo5QklmTHFOYVVLQUlXeVFKNHk0akxU?=
 =?utf-8?B?elA3MlZWdEZieEpvNGJJaTArRlNKT0xtRkJsT2VCYXdxdFc4WGNwN2JFWlZ6?=
 =?utf-8?Q?/dXxA2xPO/pCjKhVlXQtSSV4a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7428f4ce-08df-4ffa-1b9a-08db7dec4b27
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:43:23.0730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvGqw+rNvK953LRmpgMnDHx215rFhAe4FTlJ/X0XkzwtzJ/9SPL33330QATxQKDAZHcpuIfWcRWL+6eX4EhxPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8145

On 06.07.2023 00:51, Stefano Stabellini wrote:
> On Tue, 4 Jul 2023, Jan Beulich wrote:
>> On 29.06.2023 17:55, Federico Serafini wrote:
>>> --- a/xen/arch/x86/cpu/mcheck/mce.h
>>> +++ b/xen/arch/x86/cpu/mcheck/mce.h
>>> @@ -44,7 +44,7 @@ extern uint8_t cmci_apic_vector;
>>>  extern bool lmce_support;
>>>  
>>>  /* Init functions */
>>> -enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *c);
>>> +enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *ci);
>>
>> Supported even by ...
>>
>>>  enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);
>>
>> ... immediate context, c is the name we use for parameters of this type.
>> You want to change the definition in such cases instead of the
>> declaration.
>>
>> I also think this patch could do with splitting, not the least to
>> reduce the Cc list(s) needed.
> 
> This is a very large patch but it is entirely mechanical (good!)
> 
> How would you see it split? By individual files (too many in my
> opinion), or maybe by directory? By directory it would be something
> like:
> 
> xen/arch/x86/cpu/mcheck
> xen/arch/x86/hvm
> xen/arch/x86/include/asm

As for the other patch and as mentioned in the earlier replay: By
maintainership area, such that we don't need to accumulate a dozen
of acks (easy to miss one) in order for the patch to go in. As much
as the patch is mechanical, it ought to be largely mechanical to
split the patch at maintainership boundaries.

Jan

