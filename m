Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1590E5ED948
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 11:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413216.656735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odTWG-000445-TM; Wed, 28 Sep 2022 09:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413216.656735; Wed, 28 Sep 2022 09:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odTWG-00042F-Q9; Wed, 28 Sep 2022 09:38:20 +0000
Received: by outflank-mailman (input) for mailman id 413216;
 Wed, 28 Sep 2022 09:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odTWE-000429-G6
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 09:38:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a3ac46-3f11-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 11:38:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8408.eurprd04.prod.outlook.com (2603:10a6:102:1c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 09:38:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 09:38:12 +0000
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
X-Inumbo-ID: 46a3ac46-3f11-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/fBuDx7ceGZo5IY30qdAhrQpUM4tiT8sPrpYhNk2nzcgk9qke0pzZQil1wzVfFoiAoeIY+ZRmBljngvGgBQqTBeKf8Nc29hJyxuzUAYRiiDIBlkGOVGpaYLYZro63V5oKmTxaes9jij6d5k/k/OSfDUKSBwPj5TQlkh7r/xKUZE3BUeJ7pC634KMqskp9MWXQtKUViyVbAt1k6VXb8h41N5kOOx5oDFDynyI8TsAvPU1VtU9lEUhHrsS6Cv6Hi418BkKxEfywsnL41ScyHd1TVNl6vF/4TB2cF7cntE0CxVgRK83uTmOe68cE/GKWGznjCFEhn3heOWvmcqgpAvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3y/YFVAnQrNnOe4c3BcaM0Eb3FyoO40E7RDG6ER9dk=;
 b=mmm5QKH4BlU5+cXvMH4bnyAevxK8/M6TCrYnJjpiVWeOyoLqMHVQYwXail/mCw4tI7jV+U4lPBq++IT/XEPiT1MK05El6GSPtqT3dmQeKNAsLduttpYcirfx1YuaIRnp3TKYZhwwBg/AQKO98GJvtkp6K1wT5M0L9vTUzizXqtVuajii7SBfQsU+Yy6e2qFFhino5RPHGXBKQviXMUT0em2eUhhcgl1iOONtwNzyzz7oUiOGAKfKYhOghI6WAiO6+7Xku84bnpozoSPKqlsrVcPZAyN8CwjDyvnPcEiFWgT95c4vXjwfRnayH7Dukdc53wdJx1QNkytkcZMmOKKWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3y/YFVAnQrNnOe4c3BcaM0Eb3FyoO40E7RDG6ER9dk=;
 b=dhMBN7l9QG1cSwxblkuvVrVXxezl6auoZaccRE6gIUzuuf4YXf9mMRf0cGlYWHXbNwg+P1rl/RmDOiafFIYO4BjSWXejljv5uBuJ6e1o12fXpdMloRQ9hWSEyvpdsG2LnM9wMc4FZSHkOSWs46muZN1giQanS+JlR7cs07TqAFVuyoUNdd39CxUHADvO4HaLKcdbdANiCTC6sx1+RHUKF73IEpB+VxPgDS06uyvsXd89VabJXw5xFvxtHhwpVnkWnoB06Y9tniV3nsyTVOvgpPmYr0KAZPX18nYuYD2AZ/ovcfnCAm7o7ldZ3ck2F5om8d3YAzd7kRpSaqfNYyBeJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59be45ca-e6e0-f235-56d4-4f6064750825@suse.com>
Date: Wed, 28 Sep 2022 11:38:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Design session PVH dom0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
 <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
 <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
 <a91f9205-9f75-7fff-d5db-26d7729847db@suse.com>
 <e2305664-37f2-cdc9-c3f2-a4d9978e28dc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e2305664-37f2-cdc9-c3f2-a4d9978e28dc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: aae7bf7c-f54c-440b-6759-08daa1352967
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vd5lYfzZ/I8gwyXgLeQn70XZfwWU7mguwaWUd/t83lii9AJX5vZ7WcutfFDl4UrNvyCzb7DmWHdcvbufWkFq3WtYt4dQbNzxyFKPHprwZxOR8jkBWZTo5VaA0tJ4VjIBWDkaXqOEu3xdobtc/KA9LhT7sorUrAXZ2Fh8W1dusVrkIk0gxohmyq//LY9yGNqF2qbwIxp86o+760/PSqZabgu/l0mwoR+gF/NpZ7BWHsasLPaSr8w3Ryr0Vb0vgHlIsw+D0QmY30PkvjWU1tJ6HwmbwPQzPRQJg0prYIeHqjsQIaVw9sxi3U19KPlPt9GkZ4V6G0k1HSJfsX8QH9divCtRLhz6ePxOHoHYusP6qwN8tkKwGiq4hUP90UUzi9xDNovy1fZk8I2I/s9l3WxlldQhei9YjJyhM90fsOJdi21uJZ44IP4/IJWBL2DoBwx455zFv0oiptBM5FhnSlx8V/PSxvU0iCL/sZSM9ujYKHdnOIA0dfwhZ7lS5s74RD3v9o1fBtskIh/CHErzM6AN8GbddbNa7TD4xwmRQC5p4Yzy7nE7P089mEoQgHLhbtlPvoRsM0pWkYrmTllB0vU9pYCr5bZvFXb+t/ghu95CaVV8KUUmp0ak/b2/58bFOm3puJike5Y+n+CRmTL+GVLnd7wE81jtyHfwqYp9m4xr9lhOZiI3h7ZxnW5rCl3BByUdMdzSP0ZyKjeYJhCdycsFvNFc01dNaYgTUyDkBaz8iCIdGUOXJWuFXkymgjCve6R7qQmg533RPvFsMATz9eK+1F0QrNloiR5RacJbQnQsVIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199015)(2616005)(186003)(38100700002)(5660300002)(6512007)(2906002)(8936002)(41300700001)(6486002)(53546011)(26005)(478600001)(6862004)(6506007)(8676002)(4326008)(66556008)(66946007)(66476007)(316002)(6636002)(37006003)(54906003)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ymx0UHB5TEdjd3dqWExIUDl1citidncrQUkwdzI5eTlGOTNyZERnZVh4SXVI?=
 =?utf-8?B?UEJ5WGJ2QmptUGZUTjJ3bEt4b0M5YVVpNzYzY0RWd1o4elV1d29ibVZLWjdD?=
 =?utf-8?B?a05RR3ZFVlZJQTVuNGswUmVQc2UyVlpTS0IrakwxcVZIeG5veThWa3pTd3hZ?=
 =?utf-8?B?ZG5zRkxjMW12VDJkV2hZVkwzUEptSDY2QkZJMTlrWDFyT2dROStPTHZVd1lK?=
 =?utf-8?B?U0RVcTNsRGZid2kyczJLd0xjWWF0YVFYbWx4UjNEM2podng1OS9udDBLcXJX?=
 =?utf-8?B?KzJDUjFLbDl3VWdwb2hoMUdVdXVoVkNIeHY2TDU5ak5BZkwrbkpEOVpBRFBT?=
 =?utf-8?B?aVNTQndBQkJjUjJ2WjE5SVBuREw3L2ZjRWFUdWtZS0lWZWhsU3JrUGxodkZH?=
 =?utf-8?B?cnhETzY1RUhhTFVuZVZhRG9XODBIVTRsSkVkM0JKYjFxakpWL3dGY3Z1R3A0?=
 =?utf-8?B?ZDU5aURxNm5iV09ZUzltaG1Lc3JxL25STytIOXNzc2NZditEQVE2VG9XcHdD?=
 =?utf-8?B?UU9YaFhEL0JESUNYdUpIL0FxM1BscTJjaGpyZkV6MktMSDhZalhyZDl3WTZs?=
 =?utf-8?B?S1htbUNreXJuMHBsczlVT3BDdkludHZaTHBERGI0alcxNzI4UTJEUkZmS2o0?=
 =?utf-8?B?UGlwUHNMYjVlZDZ5MWtRYTZqMmx0dDN0cTN2a1N2V2RpZ1owZ255OXcwaWRH?=
 =?utf-8?B?ckdJZHIyOE9yWXlOYXNrQXo0eXhtaGk2RVFGVUFOWkZzNWw5WlNBQmtjNWxw?=
 =?utf-8?B?VjBRdTUwakUyWjc1dzZwWDMxRGdlUVlKZjNVcitNOXA4NmRuRXk3SkFsVXR5?=
 =?utf-8?B?b1JJaGx5QXg5YkNLRW1GNzkyYTFmNm1lYkx6UG1UQ3FaMXlJdWpnVXZZOEdW?=
 =?utf-8?B?R2tZSzVmN0YwOGZURUlaTzN0UnREZjUwRDUvc0IrUTlnZUVNZHN1aGpLcE9r?=
 =?utf-8?B?U0VXYkVQdnRpcTR0QkVjT3M3c0hUMURmVXN2YTNEUWhFUWhhL1RmNUVid3pY?=
 =?utf-8?B?ZXJPZ0ptdzUxNzQrKzU1WmdsLys5aG1UUFhVMWNQNDg2MC9xQy92bXllZHB2?=
 =?utf-8?B?dHdQWDNVNG96MUFPOGQ0djNFTDlaNDk4NVlwT2p6TEhRMkpVMGhHVTBMbjRQ?=
 =?utf-8?B?b28zbDBGc0t4YlVsYmlsWkNKU1d2UnorOGVtUm9OODRzWXM3OS9mdytiWmJ2?=
 =?utf-8?B?TldOUVVJZU1tT2tBME1MUVNwYnJNN2pKK3Nrb0ZWeUg3dUFwdktlcHgwWGxx?=
 =?utf-8?B?Q3V1SmRUYlRlbDdraDlpMXJGb1JLWWRMYkNqbWdsSDF5TWJyZWNkelpSZDNa?=
 =?utf-8?B?UVh0SlFabzNuRVU5TitVTFgyeHlmeDN1TUYvK0JIWGN5Qjl3Zm9yeWhCSWRy?=
 =?utf-8?B?VHgrSThCNUs3S1pQek8yZTJOcFNyWE91WGZvOEFtT2w4WkZwN2w4bEhoZndo?=
 =?utf-8?B?ZDJVOHRoeHpONXBkeW5mSmMyZXVMbWFBMkM2VENnZ1JYMk13bUxPYUc3Q01Q?=
 =?utf-8?B?VFlVNUFiTkNBTmc5ZlBqVmJwdXBYdTVteUx5R2UxM3UySVdQaDA1V3NPWUQ2?=
 =?utf-8?B?MkhTUGtqdDVIWisrKzNtZ0VhRjhDRGJOOHg0aUVUckh6UXJ3d1pGbkRnYllv?=
 =?utf-8?B?WlZUa0J0Vm1PT3BBdXZpT1pxdnkycjIyVVJtbm95aFE3bHRSam42LzBHYTJ5?=
 =?utf-8?B?T3A0TWxPcDdJZWZIMFRpYzFEK1d5U3MxVXlhTnVWZWtaQkZWNFR1RGE2dmo1?=
 =?utf-8?B?b2hYQWtsUFVBOFhoSkN0RjE2em5mbUdRdmlOOFVoUm8zYThMTGc2RFNCbHY5?=
 =?utf-8?B?QjJwS3NkU1AvNWJ4cDRsV0QzWCtYdWRIS1BaRkZ6Q0poZGllNngrZ0d4WlN0?=
 =?utf-8?B?ZXNTS29LWmRmVHFOT1ZNNmVwSFVqRFJiK1U4b2VLbVZTOCtCMUtlM0RHdHQ2?=
 =?utf-8?B?WTVvekFkcHVkaHdseXZiWGxWL1hEYit0WElZYThCTWZDYzJyNVE5aVlFRm5n?=
 =?utf-8?B?ODdpdnlTYmhBRkxDWlpiait5dmdrVU9IZDdkN0RBTllncHlOeGpsN3lRYUha?=
 =?utf-8?B?WmQ4dDlRVzA3akhVMUxPK29RUzFTQWwzNW1uR3BYTklQTkg3K2VYdzVMRS9K?=
 =?utf-8?Q?/1/jjnA1zyFkrHSP4ML5OaHf1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae7bf7c-f54c-440b-6759-08daa1352967
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 09:38:12.7890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6CR4RSwC+7BTVkTCeI5QWYU11C5h8NJaEJXZlMgJ+69aLaFk7QlMw6ETWVUpyz6d49h6jDYc1jy1yVM8fHl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8408

On 27.09.2022 09:02, Juergen Gross wrote:
> On 26.09.22 17:52, Jan Beulich wrote:
>> On 26.09.2022 10:33, Juergen Gross wrote:
>>> On 26.09.22 09:53, Jan Beulich wrote:
>>>> On 23.09.2022 10:20, Juergen Gross wrote:
>>>>> My favorite solution would be some kind of buffer address qualifier for each
>>>>> buffer (e.g. virtual, physical, SG-list, maybe nested SG-list). So the new
>>>>> hypercalls would not mean "physical buffer addresses", but "qualified buffer
>>>>> addresses". By requiring a minimum of 4-byte alignment for each buffer (can we
>>>>> do that, at least for the new hypercalls?) this would leave the 2 lowest bits
>>>>> of a buffer address for the new qualifier. If by any means an unaligned buffer
>>>>> is needed sometimes, it could still be achieved via a single-entry SG-list.
>>>>
>>>> While this might be an option, I'm not sure I'd be really happy with such
>>>> re-use of the low address bits, nor with the implied further restriction
>>>> on buffer alignment (most struct-s we use are 4-byte aligned at least,
>>>> but I don't think it's all of them, plus we also have guest handles to
>>>> e.g. arrays of char).
>>>
>>> The unaligned cases could be handled dynamically via the single-entry
>>> SG-list.
>>
>> Can they? The first example you gave, the bitmap passed to collect the
>> output of XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK}, comes as a handle-of-uint8,
>> i.e. generally large but not necessarily aligned (even if in practice
>> the caller likely will pass a page aligned buffer of multiple pages in
>> size). If we introduced physical-address bases replacement sub-ops, I
>> think we would make the buffer described by an array of GFNs, not even
>> allowing sub-page alignment or size.
> 
> In case the buffer is crossing page boundaries, the SG-list would need to
> have more than one entry, of course (assuming the SG-list variant is chosen).

Of course, but that wasn't the point I was trying to get at. How would the
(generic, i.e. alignment unaware) copying logic know the low bits are not
a descriptor in this case? I'd rather not see us have e.g. both
copy_from_guest_pv() and copy_from_guest_pv_unaligned() (nor a 4th argument
to the former, to express the same).

Jan

