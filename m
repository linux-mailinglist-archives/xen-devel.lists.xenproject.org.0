Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0CB7CBD54
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 10:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618130.961411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfPT-0000Jm-Vs; Tue, 17 Oct 2023 08:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618130.961411; Tue, 17 Oct 2023 08:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfPT-0000HM-Rz; Tue, 17 Oct 2023 08:26:39 +0000
Received: by outflank-mailman (input) for mailman id 618130;
 Tue, 17 Oct 2023 08:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsfPS-0000HG-I5
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 08:26:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e27e5605-6cc6-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 10:26:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 08:26:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 08:26:26 +0000
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
X-Inumbo-ID: e27e5605-6cc6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIdfeU0OJyg31wdf8bUtDc3BLC37QOJ0yM6WdZQV8AW+zRjUt2FFJFPviAP6aZhaQJWhsn5Y9/kw+uAVGZ+JPSgTurJ8AVrpLaHTI6qBnw6HDRLW3KRiMh7WrhIAlFn41C2YiJJinN/qf9irHP49+aSSO4ckKozF2CdlKqMj7gBEuX3rcVTsMhjMdZULQx+n2XklbFEFTbvzxjRuia7m2PWfqrnjZQ2w/KRYWXDcgsU5QRNIGi43cozETGXUFcJzSggppSpSo+J/X8OM9D9J3POHoHuJORSxNfy/n0aR6plgJ3Udf26r07XcLvLtSQchRK4dNTjf7uv8sYWEv3qG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5owAHsH02mEG9Pn1Q8DiJ+GrtJZuEr0uo6ZXpXZ2Ss=;
 b=KqaL/u+6q8j310RwvrGCZ9HhipafT75CnPrkML8PxFVlzf3CX0YLHtbN4iaNXOh5jPpG5KButksQQNYMPuchvtLoRkJtQKw63CsHGo3jEc8QbiQQJtneAfF+TqPbMkGrCEOMrfq0Sc9FR4zLx+9aYHg1MZaUo5yY4kpNT3z/BPedi5OOrCySNrAEww/z5hpsBx6r1QeIGSco7O3zmPKkFAo7+SeR0s5nFb71Bl7edJ7zV7nffVSP8sHjIHdD2mLMUr2Rk2mW/ITmCsF8sQPcm/kPFQAolR2inqjRXG7328799TP2mXsthzuwbQy4hgGTK144PT5m4lhnD2OPZTXVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5owAHsH02mEG9Pn1Q8DiJ+GrtJZuEr0uo6ZXpXZ2Ss=;
 b=XAhEE/siumP7U89nF+pPHlZ+ALrooI2TaK/9oJkU1YSnqaSvQyF23WcQX6rBtEf19OBjIhiVJvFlBrd4KPuvLVC4e6C45LPsh65xd8fNYUmqHwPiD+vIwggJLgBjhefOxVtlT7adxg403IXTdEY56HRlWhMj0z6UCsOnalKGrQoM8ruA5pdDtUSDy74Yjfu3Qhn0X8CRu3zfqabpS5J25PWlG422uxvfIfOjZxd6Eeeqmc7iUtGDeiGVu7vCvgHQBYPxuaUaOe2Af5nN7IjFFmEdgAHTih98Xxy9TSjy7SxDV199eNx5hDCvZAYtiuEa1j89y0FTqmPBuZRR4qFu8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59692ac7-8b68-5913-8e51-0a68feb2a1bc@suse.com>
Date: Tue, 17 Oct 2023 10:26:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next v2 6/8] x86/mce: Move MC_NCLASSES into the
 enum mctelem_class
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
 <f1f0fc3c-0eb2-81d6-132c-d6b2ed2d7308@suse.com>
 <d417da49a926fec385c95774035dc4cb@bugseng.com>
 <172b1f70-bffb-125f-3181-38ce5989daec@suse.com>
 <831edadc894659a79f7689dfe384ba97@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <831edadc894659a79f7689dfe384ba97@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 20edcc63-8dff-46b9-d16d-08dbceeac14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PDkYBt2v6fMNDGVNsdcuZfIHWh7vdEOSmNI1gNCjGiVy4qgEBrCAeW5qn0dilFY+2eaNkBU2TDSUPAmwsKEvw842RdC2Z2QzEMYHctFETvV1rhYqX99Zog6sWOiIWqMcrxzPeZeep+y2UmDYyHA3k/8rkYkXIQH9OhKNw6UEoYxqQGC/0ugrQIwzmU0Hp3i71vE6EgqMv2j3emZ/Yd7U0+QKsZZEAg6OEj/RAhCk52xdpEpvDDY5aNOwR+WXy1odc5+z04SBv58gJ5MSRsVW6dT1se+/ZnbRLwDcpOnHvNQZlSNphtlQ+mtDeeIW7y00FrQbiiMjDZFsfPpcLtIrFPWSnhmvaYioHYFR8yxNTo287YV+YAuGSbrBRcZIs0QSG3ojQ8zGvwGupGZlf+FqUmh8dGRJ2S3IpyK3+2WsN8os2Fd65so9FrqXZXYoLFCKLsNgDKZlr6QPqszrCkFTlkyxg+sRM5PUhbApOQ1AZIpHJFwjy8j+DNyVaJHwUdwo2Tbh3deD0EB4IAnMz3Cu2URntX0Pg+GzATnmyTs50gl7R/1JFymo83JCTEfFEo1enfmR6xGPClPhZPh45Gj+snl0ztUIYIyky1vSfClwghgaFt5BhUcSjhaBTn3o9bmPl9VtlAO0Nbh3IRDhn0iSAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6486002)(66556008)(66476007)(316002)(6916009)(54906003)(66946007)(83380400001)(26005)(2616005)(31696002)(86362001)(36756003)(38100700002)(6506007)(53546011)(31686004)(2906002)(7416002)(6512007)(41300700001)(5660300002)(8936002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFBEbHJWVlZJOUUwWWZNVHdjZnlZbWc3VnpXVlFyWEkzcHZERXZ2ZTlFN3ov?=
 =?utf-8?B?Y2I1cGZ4c2dKeHkxeFJyL1pvZ0ZpYm5KL0NQY3pkRHM0UTRGTTdoWnRRZDI0?=
 =?utf-8?B?UUlyRnpFUHZxQ0JwM0JiTnREajdwRVA3dHBxSlMrTWJFYXFEMkkzY3A4Tmtk?=
 =?utf-8?B?L0haUmQ2dm4vdkwwR20rdGhYSDB4VW5VYVpSNUh1YlQ1aHNCK0NKQWw5Y295?=
 =?utf-8?B?enl1V01VOEFBeTdLM3JxakxUWlRrUXFVMFE4eWlKQXl1ODRTYkFqYUlCU0lN?=
 =?utf-8?B?U2ExKzZKWnZWSG9EUDc4ZlMrUE1Hc0sxQ20zMXE1Q3NSR243L3BHa1VUUmwz?=
 =?utf-8?B?YTNHRHZndERObjJXUVhGRkhGOXFQN0FNeVJIcW5zSXFJaHlGU2l3dWVKUU1m?=
 =?utf-8?B?QWdUTXhWQko4UldtVld1YWg4OGFhSjBZVld1RjFGZElyQ3pXYVNhNHlrcVBj?=
 =?utf-8?B?Z3JScHRJTEQ5K0gvSlRvY0kxQ1hXN0R3NTBsZGoxWXRkSEQ3UVhPdHBFc1Fo?=
 =?utf-8?B?TkxHcndtWU1oUWJ4TldvTUdUR1hVUjdOaTNyVEFBdlRkM2FjZTlrTTRGQnk4?=
 =?utf-8?B?TXJIekpqbTdEeXlnalJZeTBGU3N4VkdYbFNFcU9KV0xwVHhkQkNCZkdIUVZn?=
 =?utf-8?B?K1owVk1wWGtXK0pBS2xHdnBCSFA0UkgxVkFlUmxoRWdqQUZYQWk4TGs0QjlQ?=
 =?utf-8?B?NkR2bWUzbVRxbEs4Z1RsbGF2ZCtlQnJnS1RKTm8rQ2ozZWxwMVFscitraXp5?=
 =?utf-8?B?Mm1vdU0vS2ExbmtmcXNnRE90OTZYbTg4QnpFVGJSMUpocGhsaUFuRDYweFgx?=
 =?utf-8?B?cGtjd21iL2IrS1lsSDFOME0zSEFXVnV5SHVVSTBaR3plRlgya2pYZkZhQ3VL?=
 =?utf-8?B?dGRPRUpHMjNwbStSZmZlc0tWSnFCM21YdThCd3ByWTRBMGJsYVovZlJRbEMw?=
 =?utf-8?B?WEVIOHhZbWtteGFWbXZseFc2MHJRcmQ2aXJ6ZlJBUFpreTNBOHl0SVNvK3Ft?=
 =?utf-8?B?Z1dKUy92c0VWcTFsK2pteEhOTjNoOS9nbFZER1ZPd3NjclhtSm42cXUwc21X?=
 =?utf-8?B?LzAyK1V6eWxaS01WU0FhejZqN0RSeUt3TlhGdExwTVNXQUxVNUNWR3BtbUIr?=
 =?utf-8?B?VTJ6QjBFRVMvOXYwdkc4cTkrSm45SE91eEp6WnZXaC9sME1RZXoxZzJ1Nlh2?=
 =?utf-8?B?WkFTc0d1ckM1a1k4ZGNMUHRvemV0S2tmUTdVZ2RBS2RtNFB1ck4vbkZNWFpX?=
 =?utf-8?B?T1QvQmRXdXZ5dWlscmxCRmE3Q0lVMlBzYlRsVUZqSlRqSlIxd2g3QnpCVkhZ?=
 =?utf-8?B?RGloT3QvSTBKbFFodjZvR2hNVWMrS1FQcVNEbDF1S2ZQalVybktndUp5ai9V?=
 =?utf-8?B?QTVzcjE2b25WeS8wV0Njc3cxbGlwTG9WQVNpOTRXejNONmhDczlXY1YvY2U0?=
 =?utf-8?B?OXE1VUxaMUwwZ3FFNy9sMVIvdG1LbzR4eTFjOHVod3hWOWVGdXEyaWJBZjFM?=
 =?utf-8?B?Y1dvS0JUOWVkcTJVOUNYaXkyTnRybUh3MmwrY2dpQ0VUVFlseUFjWEx3akR1?=
 =?utf-8?B?WEpFeWVUR2w2ZUdoVlN2YUtaeU1acGxVQWxldVNLa05sakdBOHhFUklmSjRI?=
 =?utf-8?B?Mi9FeWNMUVV0c0NKRVdKY045T1lzUDlHZkdFdFdBMjJvSjJkQ29GeGN1c0ZF?=
 =?utf-8?B?dWxMQTVwb3pvbndobUxPMXRVTExLRHBYSTYwMVBqKzU2Z1V0amZybGhJYlV5?=
 =?utf-8?B?WUpib1ZZL0E1c1BZOUFLdk42MG93N2srQ2tDM2hBeWtRQVhGZEwrdVR0TlN5?=
 =?utf-8?B?djZqOUM1emdGdFVMMXp4RXRqQW9IVFpSZCtBVHhJZDBhUDNZV09zdzcvK0RS?=
 =?utf-8?B?aW9uZENMWEJBK1kvMnAzNEdYTFVkL3UwQzVpNmh6MlVEcHZtYjNudlM4S3JP?=
 =?utf-8?B?ZVM0VDFuYXU3RGovZUJObTB6U1IyeEtCeHYvTGJ6RGlWcHJTUG5DZGJqdEJG?=
 =?utf-8?B?cnFmc3NjbndWN3BZYm9NaTBSSy9xYTdCMUlFeTVtK2ovdUFRUm1WVHpDUXYx?=
 =?utf-8?B?YkpFRGhqK3EzdzAwRmlMUktrT3ZLbHgvV3l0WjF5M2FEVmY1L0ZkM1M4Q3cx?=
 =?utf-8?Q?MEi9B/VqBlTolbT05vDHlBV3R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20edcc63-8dff-46b9-d16d-08dbceeac14b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 08:26:26.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FzOy81ugLq4ARg0wGK4nyu0bM0S2zB+eHzPhdZxZ7+bdcCpFmg8bTWZbbASclIw8aFKm76zhhDh/NPj5JepWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

On 17.10.2023 10:12, Nicola Vetrini wrote:
> On 17/10/2023 09:02, Jan Beulich wrote:
>> On 16.10.2023 18:05, Nicola Vetrini wrote:
>>> On 16/10/2023 17:45, Jan Beulich wrote:
>>>> On 12.10.2023 17:28, Nicola Vetrini wrote:
>>>>> The definition of MC_NCLASSES contained a violation of MISRA C:2012
>>>>> Rule 10.1, therefore by moving it as an enumeration constant 
>>>>> resolves
>>>>> the
>>>>> violation and makes it more resilient to possible additions to that
>>>>> enum.
>>>>
>>>> And using an enumerator as array dimension specifier is okay for 
>>>> Misra?
>>>> That would be odd when elsewhere named enums are treated specially.
>>>
>>> Yes, the array subscript operator is one of the few places where an 
>>> enum
>>> can be used as
>>> an operand (also because negative values wouldn't compile), as opposed
>>> to mixing them
>>> with ordinary integers.
>>
>> When saying "odd" I didn't even think of negative values. May I 
>> therefore
>> ask for the reasoning of why this specific case is deemed non-risky? To
>> me there looks to be a fair risk of creating undersized arrays, leading
>> to out-of-bounds accesses.
> 
> Two reasons: MC_NCLASSES is the last value of the enum, and a pattern 
> I've spot in various
> other places in Xen, so I assumed it was a fairly common pattern for the 
> community.
> The other reason is that since the value of an enum constant can be 
> derived statically, there
> is little risk of it being the wrong value, because no arithmetic is 
> done on it in its use
> as an array's size (and besides, the enum changed the last time ~15 
> years ago, so I think
> it's unlikely to change much in the near future).

You focus on the specific instance, yet my question was on the general
principle.

Jan

