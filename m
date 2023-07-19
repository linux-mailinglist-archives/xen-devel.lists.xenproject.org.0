Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EAF759495
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 13:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565787.884289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5gB-0002DH-FU; Wed, 19 Jul 2023 11:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565787.884289; Wed, 19 Jul 2023 11:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5gB-0002BU-Cp; Wed, 19 Jul 2023 11:49:15 +0000
Received: by outflank-mailman (input) for mailman id 565787;
 Wed, 19 Jul 2023 11:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM5gA-0002BO-82
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 11:49:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4753c116-262a-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 13:49:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9485.eurprd04.prod.outlook.com (2603:10a6:102:27d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 11:48:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 11:48:42 +0000
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
X-Inumbo-ID: 4753c116-262a-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgHl594OUGt86eFuEvhpSRAY6pJi1a3DUN/oigIA+87u5XxnYrpWZ11ATpyxFu/tRHsageLlo9d2Rtz+spmKV5nO7JtgJXDEtos3S0jeCEmSS41M8YWWrXNydJVdQhcIuEck//dX7r4gDqaxVDw1l0Odba93eua15S+uIO96kOMI1AiKteerui2JgqSk0qT/7FPaswtI6Uiz4vxqAk1HRc8lBUMoWFQVodnlbd/0wOwpzugj5xetS0o7Xpiy5Q5Ijz/WxuXTYGUzCmmoQnrxWsoHsEdhHdmMAzFwlmTDFlxpnbahg+mh6Ia4+Jb7wg7wjWY2+NwAy+ozTdmotQE6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zy9RzLqtfWBRjBZjD/nbrzMKbpV68sk/06K6TEQtmg=;
 b=CrW1MCRt5Qv5ABNnQXedPJ/sniHRmc/bpXzZS8/MB/RiM4sIbJK47Af/azYDEetcSOqlGp2iZgh+LZFEoO79q91lrDf9DJlXZBEVlezQC/fEwQZWzvv5NjRUuXQebYqbz0jUKfiWX9g5pv53J+p0XxpSO24JQPtu9UF3zXGd3jazLTSxFnvYT3zFLv+XSuFkH9AB2ZtsXxe3HQzOw1q6bK+Qxs+rT2aTRgE54U+ghw/gnY34AxnzyWMOOzePHJSmceCwO0Dzykg/4M8siZje9Cx/wq73E7bFqAnyP/blKpnHGCyYhABXLj9fFD2VWrZekeRIYX4B4fEvYj5bDMfLmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zy9RzLqtfWBRjBZjD/nbrzMKbpV68sk/06K6TEQtmg=;
 b=USvhWBzcxYnI2M9wgCzKlipZCv2LHWuwrwDY97AFA32FwzaMpB2ae9RVi2oBi9+W1ugVk7h8CixyNeK660V6DSMSrOdl/ZjTWCr59gPBM816u5q5RaBSaZm5zN19Q4A1rV1lWgYYN2ael+uqv16pqbSTjJQu/G60f2fh8d53GSzuqhiUrXFGQgJGJc8hFZPZqSwKPU08oPGp+n3j5J6vklb0cdWrgndaBfEBv0mM8ZtK8QM/6K+xgTlbsoTjYIpckZeWIO9UlONCW3qgeb/n4h3YryHkcJqCewi3ogVdnpcBZQ3lMZZcMHezyvqP3n8gP7BuDI0FEH3AaQb6BEXMVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59c33c29-3b0d-fad5-d84c-3e00dd79847f@suse.com>
Date: Wed, 19 Jul 2023 13:48:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/HVM: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <7c89ac0fe44dbd1ba1436a91024efebf2794db40.1689761143.git.federico.serafini@bugseng.com>
 <e0b03fd7-0487-3328-b532-2950c3b1e34b@citrix.com>
 <c4534f8a-d479-dbcc-ddb1-81eb00b074a2@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c4534f8a-d479-dbcc-ddb1-81eb00b074a2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcc9156-4558-4cad-7c79-08db884e19c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O4cyZ9U9r3qExT5hZyxeicli1NjuseaMiN0qJwPfy3Doz7GmUokCcRY5jHPCxlZOo94VZs24ciWclRH7DgLWZPefL7VBNNVJD44qDxVbza1I2D3O6cZ3F12T142KmSCXMtlnkV+ZDPnHvVniVRetLoE4bzHS/z8T1iaEaAqLLVP2/pn6E5/cXgJjp+PjxhNFU2oFpSJ9IXkjq302LiLD19ve+o7UYg6hawq9hJg5jJWnZPS69NKQjefFlkzMr/3jy0+WEoiJK9TDnfbnfjT72sNO1rXl3/7Whtg+3+8urpeqLyUQWV/EB6ClhUkMf+ev7VGh2DKAD2dxBNEBbT74fqxq4mAhwJONvojo6Kp+mJz+fzQZq6F2OTToZW2dpykH7oInoh5XvLCxXPB5MrUfsAX3Vmya0yIz2QSfaZd+wYhgQBm93useQ3pm+jZjEEoLAzPitetSM68pcj55Q/q5avKyTvWztlV7RYu0xHvS6m8qUAN69FkxiCTKOHe27FLZsG7d2o3nL5NyGUo3HrE8mW2PE4pD0vQhYe9kyMXtKnhkiPjh774wlKERWw2nMRcrTlskWtJkbeLQtlBvJ645pZQfYrIcrQ82xffuBMN0CWXibuYsZev9/dATgs9fEPsKE+h2U1MxMGJftZUgvlnvzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(66946007)(66556008)(6512007)(6666004)(6486002)(66476007)(2906002)(316002)(53546011)(7416002)(8676002)(8936002)(6916009)(4326008)(36756003)(5660300002)(6506007)(2616005)(38100700002)(186003)(26005)(41300700001)(86362001)(478600001)(31686004)(54906003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHJyc3BDOVZ4SGRacFFWS0hqbXY4V3YrZitkSFRmbnErLzhJNGtDRnVaQlFp?=
 =?utf-8?B?S3AvYVEwOXdwZ3NMTmU3ZWR3S1Fwc3oyTk91bEVIMmpueXRIdnZKYmQyQTlm?=
 =?utf-8?B?M2h2OHhVUDZzODZ3N2ErczUyZysrc2EycTJLMVhqUVZuVk5ocjBhd2Y1amJa?=
 =?utf-8?B?YWFLMHd5MzVuUW9yMC9Dbzk1RHVaSW4rLzBrN2ZTdEdHUGlNZWI4RVpyZUIv?=
 =?utf-8?B?SlJHM3BVbUVqdy95WHFYNWZ4QVFENmRmb3JYc1gvbnR3RHdTUmdVM25vK25X?=
 =?utf-8?B?L1VlcHBFY2JoaVlNdVRPV0p1RnRxQXRsc3lJNzY4RlNJZkR4VWd1eUZTZFVt?=
 =?utf-8?B?VituOUYwc216YVFRamVJVHRCQWJaSzI4TFR2NWpOU2VLUlVuQytDdnMzQTFN?=
 =?utf-8?B?TXJsTElna3pKSDFVWkFEL0R4OEtUYzFrZEM1NUZZN2pRTG5QbitvRWNCUFI0?=
 =?utf-8?B?RFEvODUxc2pFaEFialg0TDg5Qm1SSDVpalovdHdKek51dzhKQ3N1blRuVmNG?=
 =?utf-8?B?aGU1UDVxbzd6T000ait3TXc3SjA0RTZpb3kwRUhaSWgwd3BVOW1mOEFVQUUy?=
 =?utf-8?B?YlBieDliTDFJNU11aEhVdGhEaDFGSk9IVStMYVp4WUhXZHpZTTM0Vk9yUUJj?=
 =?utf-8?B?aTF5MTBSR1ZNWHcwMjV4a1duWjNaOGxVUVlsK0RLZ0RaZWZPS0hlVldPNkU5?=
 =?utf-8?B?UGhTSnNzRHZUNk4vM09PZU1qWGZZTWZVU081bVdKL3Z5YVBvT1d5ZDhZTnJk?=
 =?utf-8?B?alNGeWUyakpSQlRXR2hMdVlLRG1NY3FyS1haMXBYdUN4eW0vUWZROTFQVE8x?=
 =?utf-8?B?a3gvNUcrckVtblBIeE1TYXpoNy9zaVVsdTJDcytQMHFmNS9Ha0NGWFAzdFVj?=
 =?utf-8?B?N0JRbzRLbHJwTktJS1NtWmU1K2pjbzFwTnFRUVcrZWVMVXpxTDBva1B2NVY0?=
 =?utf-8?B?TUNpY3ZlcnM0MjZmOTNJY0JiVFNGL3RoTWRXeXBpQTVkZGhteThxMkVFSWpn?=
 =?utf-8?B?Z1RxV1psaU5QZFphR0wrNThJN0REUUtzTFpINkgwU3BhVUZNL3lWQkNmVGM4?=
 =?utf-8?B?OG94cU1UN3ZBN01acmdTK1V4Wkl2S2x2bGpDRDRSMkxqZGZ0NjREMjhxYUto?=
 =?utf-8?B?cEhsRFErbHVSN1pwanNHcFRCeHZSYjgvYjhKcXRoeW8raE1rdFp5Qi9McEFv?=
 =?utf-8?B?bzU2VlVRU0xIVldwRjRJNDhVREhUWmJleDJIcjJkUEgyQTErL05ZdFEralJq?=
 =?utf-8?B?WldMOC9xNzNlL1JMRUdLeTR4RUxYazBVbDdwc1JJQ1laSk5md1p0SDYxelp5?=
 =?utf-8?B?QlNLTGlxRHVSNzlwMktvQjlSV0U2TEI4aEUyMWloMGppNnRvOG5DZFFCQmY4?=
 =?utf-8?B?dUxmQ3VpZTR3UWpLZEN6TjNNT2sydlZHZU5RN1FJRG9YQTRlbnVzcWllWFh3?=
 =?utf-8?B?UU9HZkJjRm1XSG5KTGRPcC9QN1BnVVV0VlJEdVhUSnRMSUxGb3RKSzRuQmcz?=
 =?utf-8?B?TVVhYVF2MmUwWjQvb2xpRGhxMDVhV3cyWGs5QjI3RmszLzJacHRGZ0hWVVJM?=
 =?utf-8?B?bXFPV09wTEZUTC84MU45dXY2a0laLzJLOWpFM1dnY2ZpNEhqd28yTU9QaEcz?=
 =?utf-8?B?TzFOM0hBMmZFcTEraG0zK0habkRxaWNzK0txVEhaV0VYVS9uZU50QitSWlVs?=
 =?utf-8?B?UE9jVEhNVWFTMVcrUXc0ckgvVnNsMkZ6NnRkZXk2YWJkbWp1dEFER1RHcnp0?=
 =?utf-8?B?Vm9tVXYvSC9hNmx6cFdSZUZOQlhCc1lxM2Naa0VDNXBNNWs0Mmg0Lzd4Umsx?=
 =?utf-8?B?UHh2NWQvanhYV3A1NGJraXlnckxob0FBUzdTVEE0dVkwd2tCMFU3dzBDZUVO?=
 =?utf-8?B?RGY2dVpqL2RtZWFTSFFiRm0razlCV3d1cjNEekJFZ1g3VlA1ZHh0a0pPdnpa?=
 =?utf-8?B?bFBMV0xHc1pZaXUyazhoSks5TXFwRXB3WktiWUoyRlY2QzZtZEUyTEZVblpG?=
 =?utf-8?B?UHFrUWxMelQxL1p3ZjVVS3U0bVVYK0M4ZUxYNjdhSlgwNjJpbUorWi9TRXk5?=
 =?utf-8?B?S2F1WGdCd2tkZ3ZZOHhCSlJyZ0xPSHc4aTJDTVpQVjZXSGFQSlFLY3JBR3Zr?=
 =?utf-8?Q?GPlmaxXLDJNB+P5HG9L148T32?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcc9156-4558-4cad-7c79-08db884e19c5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 11:48:42.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbb/piF4q1JFzvVUNtk084GVW28xytB6LMreSgxQoDR77uO0WlYEf3ZbFKHNCrb0igvxQvncgtWDmmfTQ/qtJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9485

On 19.07.2023 12:38, Federico Serafini wrote:
> On 19/07/23 12:23, Andrew Cooper wrote:
>> On 19/07/2023 11:07 am, Federico Serafini wrote:
>>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>>> index 57363c2ae1..8f19a79f6f 100644
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -319,7 +319,7 @@ static bool pat_valid(uint64_t val)
>>>       return !(any_gt_7 | any_2_or_3);
>>>   }
>>>   
>>> -int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
>>> +int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)
>>
>> If there's a u64 vs uint64_t mismatch (or others for that matter),
>> resolve in the way of the stdint types.  That way you're correcting in
>> the direction of the Xen coding style, rather than away from it.
> 
> Changing the type in the declaration from u64 to uint64_t
> touching hvm.h will lead to inconsistencies with adjacent declarations.
> In such cases, should I propagate the change to the adjacent ones
> as well?

Preferably yes, I would say, but I wouldn't make this a hard requirement.
The decls have a pretty bad mix anyway. One thing though: You also fiddle
with hvm_get_guest_tsc_fixed(), and there please also convert the return
type then.

Jan

