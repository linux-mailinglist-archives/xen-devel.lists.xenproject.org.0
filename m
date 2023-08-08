Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49663773A0B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579728.907827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLUJ-0001Z2-3q; Tue, 08 Aug 2023 12:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579728.907827; Tue, 08 Aug 2023 12:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLUJ-0001X8-0G; Tue, 08 Aug 2023 12:06:59 +0000
Received: by outflank-mailman (input) for mailman id 579728;
 Tue, 08 Aug 2023 12:06:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTLUH-0001RT-HA
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:06:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1122ec32-35e4-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 14:06:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 12:06:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 12:06:53 +0000
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
X-Inumbo-ID: 1122ec32-35e4-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyOM7dJNu0A7qG6HCeasam+Gn4m0TCwhQcapVozyWE6sfjOgUUwKoQgahM0Owsp4l9a5LRecP50tobVYtqAlq8xx2LwtrcAhRzeUoki+UEVFemxAWWL9cwTYD6ZKz4aBYGszqxvWUYuELTHev+3Haq35wLqtVXegZFMrfzxezd6K6EjpiLDOuLUCYvyBzTbBHReiUplwq3f9iizGFhTeoXujiMbs/pORHjuesNyFHxcfP4IfSO81ZY1+xUEeH+riDqXjUz8LDD5ubBX7R3TZ5sRqQ5wnluue5Y3V3l+z+WWtBRIjL88bwhs00IjrEwiJEhLiPACykdL1u2jjwnPP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbSVd4AQ/cg4rWC6Eiz1nBnPOOJ0qhAEOljRQ+KIphM=;
 b=iWWxYU9cvC3XTEDGpweRMDzKC28vtcsJTGiE6eNm9NJm9/jWyH4aE36Up7cDjIEIezpjQxrsp1djVVvkSJ3mx8YAtNZpBCpR5tCDFUTEJm5noJc1G/5sbAP/71khH22KyqPWDo/Cc2DlZDMv2yEr5u/wLt4d0xYtWhBPR/CaFmjzdOEIFX8figWLuD9iR4wBO64QmFgHW2NDP5rPdnlcJQJegOIZCER55kdN/y7O/3uUGkxhlgUDqLuq1e/Wqh8YqkidTXlJoRK1SNQ/5nLHc9BHJFdiO04TaG8DjDpuFVtps7SPvETNGfn416wEX08+qeu7cNw8ggFGRBBMdjsYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbSVd4AQ/cg4rWC6Eiz1nBnPOOJ0qhAEOljRQ+KIphM=;
 b=GrH10CNa35lRbA9RZv1cA4GU8oF8vgbzpZLDXRistgOtxZrzI6gDTaHRN7dCZsdaE+hk9VmzQoQH2I7ebO6TepuRSoJa1uqR0/R6d7SmssvU8dm1q+bCWbCFYUJrUwvgrjqzHYBIsqc2eD4V90SaqDEO4JC9HtEmsQkjtZWiPUAy5ok4nfPmvEb1dIdFKKixjVqeiLA8L/VjDIv9wvV0e3Aivlk+64sazEFjNdQSyQxM4QoDd2hmDH9PzBraywJqzWw2RFjH+8vGRDlAHcXyzQy40aHllAwWt1ZwYnhDBzHMe7LqoHENU/RQv4zFKlrHhDYyCKiqSyd97+weyRvW9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80ead475-68cd-0cf3-3d2e-252ad4b1f976@suse.com>
Date: Tue, 8 Aug 2023 14:06:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 5/5] x86: refactor macros in 'xen-mca.h'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <8df1af6384606d8176525fbffb364ec814d48db1.1691492441.git.nicola.vetrini@bugseng.com>
 <9eea3e6039a72d0502ed1416449e041a@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9eea3e6039a72d0502ed1416449e041a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a56f3d-2096-4524-9b0c-08db9807f476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p6KjIhenvxpMQYt82C+KjOGC6wyXZXR24cZA86svZQZcur6yTF+41C54NlZbRRUPJThVYAFW2k8benA8P6Qynj7qype5QpVNL1qze0hjVZcmRGb5eFzbCD3AizA+4E0dWm4amBw7VgPejImCqN00dwhrg4ViGkzg5qD8bCH5GMvCj/0yP1gTrd+PmELFJlHjl4OHcJZWxJih7lQ0a2bOx7LjiSvk0SfX9/e7FXfvJMZ1B58CGoHo8m+VINzRBWOYAn2Ojb+0NMIaoAdabQ5UIQPa8GKac6amLuaM3NoSIePPu8o6uizlCiyY/OY/vAt2Pf1DfceeCyUjEOVkAJDKS6wulsEdJOwW+ILg7GToMQXJ1WUTput057yLNZVsNBsN4Pcd/YynWC4ZyK4l7tAsHuqgqgf2OjB2oR6s1SwmTcdSW/LgxnpDV+9rwbsgPS1N/74SPrMXZlwBp7BMZL5YP8Vlq16HEE/yNgZd34u5cA2gfeQ+cJxzJ62PpEypksrbygAnp+ZgG2ELgp3x9meqbZryWFvKnpWgjkwFYCLpytCgCI835SmcNGxmlR8hsH6apBjl0ScOZudyonGuo17y5CnJ04braqhlXxgPjfKNS5F+7qSTz75yL9MMhjCoEJhcomsLQDg9fE7qoFqRjYbx7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(186006)(1800799003)(6512007)(26005)(6506007)(53546011)(66946007)(54906003)(38100700002)(36756003)(41300700001)(7416002)(86362001)(5660300002)(31696002)(4326008)(4744005)(2906002)(6916009)(66556008)(66476007)(316002)(8936002)(8676002)(478600001)(2616005)(6486002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWFNM0h3N3J1aVlqR3ZDWWQvalNGQk9vOGhCOWVjMHpWYXFDV2ZKNXpseUFN?=
 =?utf-8?B?QllUZ3Y2YVc4N1VCZ0dNK1BoTkNIRjdldFlJSmNPMHNrV1BReUVoRFJNeDBp?=
 =?utf-8?B?NDRtZlBoM2JUM1AwYnhIV3kyRjBheTZoVjdqd3Z4NjhGT3ZIcFdtVVB4aGxs?=
 =?utf-8?B?ZkxMMk5TQ0ljNnJDclQwQ1NGL0dMeU9GK3V3V2l6WjlJeUd2UE1uUHB3UW5s?=
 =?utf-8?B?aVpoOW04aGNOOHlYVWlaUUp1N3BsZ2NxeDlHc2JZa3JRdTlHRXVLOHVXSXpT?=
 =?utf-8?B?SUVDbHZ1VEY4UjJTMWhkN1NhM2ZSV05IV1kyMGdtTldKZWozZFVMMitLUEhB?=
 =?utf-8?B?LzRNc01SeVA3R210RUhPLzI0WU95Vkc5bmJ1VVVZRjBmWE10NFB4TmtOUmFQ?=
 =?utf-8?B?ZG51enhQdGV6SnVVK3hQeHV6Ni8zQmtGQnh5MlBnSExTQ0VSazY0VjA5MnU5?=
 =?utf-8?B?QXhiQmZPN2FyMlM4SHhlRVhTdGtxd3hxY3VidUMzN1JCTjFHdGs1bzRLMEg5?=
 =?utf-8?B?UzdINEYvVWo2c1d4bzUyWTFFak5RcWtuQUZsbFJGNFZiWFVWblFZSzZ5M2FI?=
 =?utf-8?B?a2tkd2w0VzlHTFJCSk92VmNCNzNwOVJINDg5c2ZBTEs0QzZYbGQyN0pNaW9k?=
 =?utf-8?B?N1dIbXh2dXNiY25PdjJWVHpjNFZwODBYRUF2QXRnRzNxTFBTNHpKbk9QWG9n?=
 =?utf-8?B?SER2eG9ST0w2RWJ2REgySTdOOEFyZTgzNklpTEZsUS8wb2V5ZkNqVllpU3JE?=
 =?utf-8?B?VCt1c3UzeWtHRis3M1VFQnM4Rm5FbFRzQXhIeG0wMU8rQ3FYc0ZsSWpmTXNM?=
 =?utf-8?B?VUVkdmJyQUc3V3Q2RkFVQys4TmNXUHdMbXJkeGl6S2Y4ZFo2bHVaT01VNjdw?=
 =?utf-8?B?enpsOFU5dlV5RURXQ3pzcE9pcW1NdGxLNTFlcDY3b25wYit1cXN1N2xkZXo5?=
 =?utf-8?B?U1FmdFdwaXE1dnJwM0RJbDFhc0hDV1VVdk95aFk3SzVYaWlXeUZiMHlFNFZ5?=
 =?utf-8?B?U0hnK3ZzUmhVQ2NUWHNiRlJCbm5ZQ2tma2doR1VTb0l1Z1BLVmlnTzRveklV?=
 =?utf-8?B?TVRLenY5QWlsc0RKVnBlMHNRdE9JNGNheXZNMktKWGVmQVhpaUZGS0o2Z2Yy?=
 =?utf-8?B?K0lScUkrWEc0ZkRhdHprdDNhd1NKY0Zwb20yYjZ4cjlCM0wxN2Mxb3pqMkdk?=
 =?utf-8?B?QmRlZGpVRU5ZS2RRdFpLV2NDdkNUVk1TbGFra1VQUElLbW9oK2dPUGE5bW9x?=
 =?utf-8?B?SmErODl2U01xZWVQa2tOV3ZQb2xHRjJnajMyRVVNcDNNNzkzNnQ2cDJNQWY0?=
 =?utf-8?B?YnlNazZXKzl2d2dYMHp4RGRDTmJwRTFJQjQ2L1ZYY3VzYmJrWmpQcTY2c2x2?=
 =?utf-8?B?SHg4MlhHcmUzc3hnVkc2QVVtWXJvUEZuWkhJM3BTeTBGaXZHdGFDNDBpV3Nw?=
 =?utf-8?B?SEZ6OGVKUngvbkNCeUxrMVRXM1ZubC93Ly9VMlR2azd5YlplY1Q5SHgwUGY3?=
 =?utf-8?B?RHFIV0tlR0lZbldqSVIyeWt6RGVwWlBnZGlEb1ZoZWwweGozcWJjSGpETlh5?=
 =?utf-8?B?enJqM3BxdEhiR2g1ZUswOEVjczl1RFZIT1BlQ0J5YU9YcEJScllYdWh2dkM5?=
 =?utf-8?B?bWVqUExuZXo4emNrSTlza3I5THRLbm5uSjBXbngvU3Nwa29qUmhxQVhwUHdu?=
 =?utf-8?B?RnNDK2UrQWZYck1ScUVOTlBvcVBqYzIrUEVJcUhnRnZFNit6T2xSUFB4NU4x?=
 =?utf-8?B?Wk01OFZrSnFBYi9NNDdsY2hzNDFmdithT1gydlU2YXdzQm1KSmd6WU4wc1FG?=
 =?utf-8?B?MjdMUmNTNFNqQStROTBFcGg0cUNzZzk3ZFlFRE1iOWZmZDU3U3B4VytDZHls?=
 =?utf-8?B?QnhSRWQxTEJQSWxNckVSYlFrTnEwT1h0NG5HQ0d3eTJ4b1hSaXRselBDMy9X?=
 =?utf-8?B?Zzd6d3F5SEJVQ3A4KzZyWVlkakp6Y0lUc1k2dnFTSEY4dHZ3cDNhMTlIQVdi?=
 =?utf-8?B?bmx5Qjc3ZXZXdUM3d3NTZzBSNjFNdTB1SDUxMW95eGRiQkE1RElOOU45RURq?=
 =?utf-8?B?QmVEaGx0Z0lpcmZCNHc4enl5WmVVVjY4OUMvUFVXdCszbytQd0hqVXFURFNJ?=
 =?utf-8?Q?N0T3QSIWDBDmxzbFwdMaTQ3ED?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a56f3d-2096-4524-9b0c-08db9807f476
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 12:06:53.8187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhcZ9DkAJ6yRiKvCiQOjP1RjHgIMlwrhV6UNCn4K0PRZXtTjKww3wQFpLNEZTqo/G06Kwghj9sW6VixegwPIWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285

On 08.08.2023 14:02, Nicola Vetrini wrote:
> On 08/08/2023 13:08, Nicola Vetrini wrote:
>> The macros defined 'xen/include/public/arch-x86/xen-mca.h' are revised
>> to address the following concerns:
>> - needless underscore prefixes for parameter names;
>> - the variable 'i' in function 'mce_action' that is shadowed
>>   by the local variable in the macro.
>>
>> Therefore, the refactoring aims to resolve present shadowing
>> issues, which violate MISRA C:2012 Rule 5.3, and lessen the
>> probability of future ones with some renames.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v2:
>> - Added missing parentheses.

This ...

>> - Clarified commit message.
>> ---
> 
> Missing a
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> from the other version, since nothing changed code-wise.

... isn't exactly "nothing", but well.

Jan

