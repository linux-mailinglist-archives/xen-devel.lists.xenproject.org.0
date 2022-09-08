Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940205B22FC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 18:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403449.645571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWJyS-0006Vj-Su; Thu, 08 Sep 2022 16:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403449.645571; Thu, 08 Sep 2022 16:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWJyS-0006TW-Q9; Thu, 08 Sep 2022 16:01:52 +0000
Received: by outflank-mailman (input) for mailman id 403449;
 Thu, 08 Sep 2022 16:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWJyR-0006TQ-3v
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 16:01:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b7ba6e7-2f8f-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 18:01:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8277.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 16:01:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 16:01:47 +0000
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
X-Inumbo-ID: 8b7ba6e7-2f8f-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLIsWOhGnDhgfTqQKYR/wxEy0MmFraMGrWkelxMNTwXmqBHjW4dENDOU2z7Q6IG+wdz80NQ/vD4SiAHcBjFySwzrk2/W0F0NT7n2ng3dFQaQG+WrYrbDEKsR1GzUfin8QxW0bH4RFq2ojx1G8zqCY/6Gto2YrsPeAfDj4KNimw94Zh+uXJa0xGRmgI8BP5VQslV475Z9D5RjQNqtgG21Wke3X2HOqWUyhF98neb8jA/+aCv92gTN8GRUou4U9o/JPPphkmXU6t+bl3iY7o2wWtZ86E1uSKf6kmtITdwZsaZHvInUJwNDwCRCUgIXOBv9HS+pFBbfz5GYQ5QhTclKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6R8v5F9BSinZzVuDSIJ8utL4egZv2vn5xb4qQq6px5s=;
 b=bmpxeM3LNyqi4ZW57XJD/y5Rj+f+Xrg6jp8/wbP+uKPYqFYY2yKzbVsEsr+VXvc1DyDk3ovJYhv2Jqby/jEM19m1NTqOo+882uTEq6xAfQIhT6Pc+Kx3PY0b3SO6ncUFKOPKH6uX6Fx2MlrFcq1AdQeSHdjTGxWL9C92zcs6iE4yiODmLig2Uv7+pv/JpkeChOoA8RPtQl3caXGdFD8d4OIjOfpE0OcYIulun5b4V8cSBJtNsQ6akzDFV2NkbpQ3jTJ+DjfcPo29WjsuVCJP3PNm3g1f5nGcW+yGKNa2nv6z7rwZRlZk4aisShcrJXrCtSM0kFAMhAe9Yv7EgugsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6R8v5F9BSinZzVuDSIJ8utL4egZv2vn5xb4qQq6px5s=;
 b=zLM8kgGZM4HeF/Yj8GdPLyLqHRbKfCSwISkYwozjsf6zTHb9zdIRnnxbiVheDTMFYgzrviRsgHmGwo0Jnl7s3hHHjQQ5dGUNieOB52eDFcyJpiKjPeKPM+kJvNEDYByZJypm+sPVeD7HokVOfzr5p/e3SJ+Uf4R6+IxGgmHjfFIboDxRkEUwX6y+HQgKYJdNnEek14VsY8/X7P9zZGNQhVItZTbsP3YeJmhX4CizJB+i5BrIcHeV3z5R8qIm0/pZ04sQYptWYLHL0Si4wrHsKgQAuknP5DF68OStWZSFz7+m8Yi5ltckSCCP65bgmDB9C5C3IMVlqyPHURBP3tmi4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb369beb-803d-c11b-37ed-7fce6c9e8988@suse.com>
Date: Thu, 8 Sep 2022 18:01:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-6-wei.chen@arm.com>
 <837f7b6d-0d73-a352-17e6-5c12e06dab95@suse.com>
 <PAXPR08MB742067502302D24B961B9CCE9E409@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742067502302D24B961B9CCE9E409@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 53808bd1-7f61-43c4-9b50-08da91b36eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1GiQGb2CAxB6CzuOwiV6QbhGzv7LoQE3vFOln4krS/CMjS9fCJagMUNOTO8VcXLycBSHEEujXoUXVIgBuBCcKA2H745VbWCCpkXqha7zDps2GPsCbFRWOI+fN6WZ5xgkEhh3ILW2QCTZvQAofU4oJxVe/xG95twdZhFsUNF++TxkSmqasbSESDvARir3+ZoqsuJGOpa6vPn02bMc3Y+4gDKmduOjTVK/CS17IzO4dYF7XTngmzsiKudV70Z7BIoF4LLOA+qbwUjrz9vYyMFIU55F+1lut0nB3HzLQB95u0FOljnJzeP8nfuOpwodW4FQoJT5IPz6GH8ic9AaBr6ebaPyNdAL5ogBNtDOPt35z7srehqxCRbtnh6deIRtyjE+lv8ssHqOpszpHo8kBKloD432WrJskM6e3aBp8L0WBCp+H/KHD3LEHK8xN33PY70KijY31AjHKuJymY00xpAh/CAAJ8NHUOMad6cZazRkfaVKg+9JI/2i5X7BElTuIXj9TpPQGPj2S559M55jhUAP3+kw2+3kbTrBL258FX+t3jUVb2sfTwB4/3IHnaJNP4UueiHm8kJxXRYKKG7xu+kIbpRJGP0OmQZllhuSuWp7tCbNKTHI4vr9CyIvtycjp1cWBgwe70VfbADdft5kc42E2bynGrK/PLj6X2ZZf/nxzVvMJpk0D4Dqr/lB9o4F8S8htyUfN2kNfYVFCHhIz1qnZJGbuOgG4S/MdBmSz8TW94oXXQO4MivURk/o+VqNS80T8KbAwoLNtPeiCmWVkTuHlJrhXSph2oAiQoQublVJPtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(39860400002)(396003)(346002)(478600001)(53546011)(6506007)(26005)(41300700001)(6512007)(83380400001)(186003)(38100700002)(8936002)(8676002)(2616005)(5660300002)(31686004)(4326008)(86362001)(66556008)(31696002)(66946007)(66476007)(36756003)(2906002)(54906003)(6916009)(316002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkExdy9nSmZHazBMVDFZamJZeXdFM1EwNE1qRlp3dFZ4VElCZVZYdURQNTJ3?=
 =?utf-8?B?T1hUR25BWUtZZ0c4M3NNOTJvUGFncnB2YnptQkNqaVhaUVh3N21teU95YVlJ?=
 =?utf-8?B?eVVEd0xYM2dDamNmNmxuMmVsTHFMRUo5ODFYZ1NmcEdLNDQvOXpDUjBRRERk?=
 =?utf-8?B?YnNNRjNGclhTVVI0YWVZMFV6eUt3Z0lNNjgyQ2pNN3RReWlPRVJWMzRLaDVK?=
 =?utf-8?B?WDlKZldXWTJqZzZra24xQ1hFUndLQmdBRDJZdHdQakVOU2ZTM3dFVlBPRStR?=
 =?utf-8?B?aStWRmJJNmxKSnJjVHRlK3FwVm9yUk9WWWwyQkFpVDZTWEJTVXFtbU9ZU0Ns?=
 =?utf-8?B?Nk93cHFDZmZDbkxUSk84YXB6Qzk0b1pkTHdiNGVCbmFrTHRJQzlGVDRXeUlY?=
 =?utf-8?B?MWhoOW9Dd0lqZU0xQk1DNkJORzZLSklaSFkzT3hxYWxZcTVzVENuL1JZZUhn?=
 =?utf-8?B?VythVXRMemhNd3Q3SmhacWp4S00raXdMWXduSDlzYXNBZ3E2ckVMek9Bekd6?=
 =?utf-8?B?djVpT1VmUUJwTXJoVExKbDIvTkVjN2VCZ3gvWE9ud0JQL2lMSVlZQVY2dU5Z?=
 =?utf-8?B?bkNodlN6amtSc0FoMHgwRTRDQ1E0aGp5emFpbkpXTWYzZUhoVTl1RThQZXpk?=
 =?utf-8?B?c3IwYlJ3Z0k3Vk90bmV1Qk1EMTB1eTJiQllDYmpBZURneWVrTEo3ZEo0K3pq?=
 =?utf-8?B?c2lOOWR5VU1SN1dDbldNVE5EeTk4SkprK3h1YVdsK1ViS0lJVDNKVWJyN2Rp?=
 =?utf-8?B?eDZ4WjZxeEFOWW9IMFM1aFdHalIwL01oYUR1RytCWVhuLzF0UTJzMkh6NVpF?=
 =?utf-8?B?YUVjMUl3VTVjZmhydlVCRWtlcjJTRlZPNEttZGFJeElKTWpSSURoSTFNOW80?=
 =?utf-8?B?bVkrcFVXOVlBeENuSmNnYVZsQjJMVjlrYUwzNnVUMEtnS0lMZkRWbUQwOFZP?=
 =?utf-8?B?dG1JdUs1Z0lOcFNsendBbGo1cmpJRkQrNGM0eFhwL29FN3FHeWZBRE5KdWhr?=
 =?utf-8?B?dmdZdDAvblFxRGs2S2ZWdElVM0tzQlMzOUg5dHA0K0N6a1ZhMWRXMEIxWC85?=
 =?utf-8?B?R0FmT0paeEQ3NGpHZ2t5cHMzOHcxTXBWc3NrNHZ4bUVwVmo5c2pqV1JuU1U5?=
 =?utf-8?B?YTN1NFp1NEN2ekFnQnhSVTd0VGcweWlELzNRUGQ0d25Ob0w1YzV5dUFHV25D?=
 =?utf-8?B?eVl1d2cwdWtkczBPRUViTVZiRzg0VDdxbklOWmxhU1ZiRUVmeW83WWUwd3Z1?=
 =?utf-8?B?alBWRlZBVXRMOXBhNG0rZWhpMmZEWk85Nll5MEQ3dlE4VkZyendYV3lyUSt6?=
 =?utf-8?B?UjRSd1RIN282Qk95UzdhejI1cVc0TVlLdTdmQnNyTzZuY0Y1MGZzSEVacS9l?=
 =?utf-8?B?VE8vQjZ0dFQ5ZE1aQ3JFclBicWFWK2M1SS9xUEdPbVNMcmZFR3k0R1Uzb0kv?=
 =?utf-8?B?bXRBbU0xcjEwTmlsZUR1dkFGTlVaTnFyVDVaQURGSkxEOXBMRW1vRnRHZlBN?=
 =?utf-8?B?ekhPL3p5NDRxVnhDWHRzWUVNT3F6aEhjOHVFZk0rR1JKWXlmcDcwTWFzU0Vq?=
 =?utf-8?B?UEY3NFYrQlVkTWg0NkFzN2xQa3ZhNmVQdGVDa2ZqOWJYM2FpMk5DYWZQVG50?=
 =?utf-8?B?YkhWVlIzQmo4aGpaRlNPZVlwWElLb3crRE9BVTRWZXlwZTVSVXZzOEJnM3I3?=
 =?utf-8?B?aEQ4QjZpSWE4MDNvdE11QlhLMnVSVlVXMWVtdGdKdlJPRG5UcFdSUEtiQXpy?=
 =?utf-8?B?U2paTTlUN2I1OFN5eVFZMkVXeFU2SkxsUUhMZnErd0RmUnZuMUl6dVZ4alZC?=
 =?utf-8?B?OVd5b0ZHSWxjYjB5MndTL3hZTWZ3d2ZrRjhIdndaYkZUbjU5WFhvUTlwT0Rs?=
 =?utf-8?B?VjdvVHM2eG1XU2o3b0hsY3Brd3RlbmpPbHdKWG50a2ZsV0NZelQwRUE2TFdr?=
 =?utf-8?B?eHZEcnZTOG1iZ0JLM2phMzJrVkZJcGtobTZKOHhzYjBwUFJUSWtHMENVTm1J?=
 =?utf-8?B?ZEFXRGNIeVJZc25jNmRBRHo2a01SL2ZEK3FGb2V4MDNPajVhODZNUWM3djJV?=
 =?utf-8?B?cDM3SWt4R05pQVRLbGg3aHBlcXRES2pWdXlva3RUS3ljdTNTVWlVaUFZSnM2?=
 =?utf-8?Q?T4IcIOq0CsQssJ+xrTSqY/KoW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53808bd1-7f61-43c4-9b50-08da91b36eae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 16:01:46.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0GlpKxokYedC86+YX67PgBh3mF2Kx2Nj7d8X14EvCG86VtPv4uBVYS5RVAfmfEQ3GIIy/vqSKK5BXlO2llqog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8277

On 08.09.2022 17:26, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年9月8日 21:03
>>
>> On 02.09.2022 05:31, Wei Chen wrote:
>>> --- a/xen/arch/x86/numa.c
>>> +++ b/xen/arch/x86/numa.c
>>> @@ -41,9 +41,12 @@ int __init arch_numa_setup(const char *opt)
>>>      return -EINVAL;
>>>  }
>>>
>>> -bool arch_numa_disabled(void)
>>> +bool arch_numa_disabled(bool init_as_disable)
>>
>> I'm afraid my question as to the meaning of the name of the parameter has
>> remained unanswered.
>>
> 
> Sorry, I might missed some contents of your reply in v3. The name of this
> parameter has been bothering me for a long time, and now this is actually
> quite awkward. The origin of this parameter is because the current NUMA
> implementation will make different judgments under different usage
> conditions when using acpi_numa. In acpi_scan_nodes, it uses acpi_numa <= 0
> as the condition for judging that ACPI NUMA is turned off. But only use
> acpi_numa < 0 as condition in srat_disabled and elsewhere. I use this
> parameter in the hope that we can keep the same semantics as the original
> code without changing the code of the caller.

The difference is "bad only" vs "bad or no data". Maybe that's easier
to express via two functions - arch_numa_disabled() (checking <= 0)
and arch_numa_broken() (checking < 0)? With a single function I guess
the name of the parameter would always be clumsy at best. Unless
someone has a good idea for a suitable name ...

>>> --- a/xen/drivers/acpi/Kconfig
>>> +++ b/xen/drivers/acpi/Kconfig
>>> @@ -7,4 +7,5 @@ config ACPI_LEGACY_TABLES_LOOKUP
>>>
>>>  config ACPI_NUMA
>>>  	bool
>>> +	select HAS_NUMA_NODE_FWID
>>
>> Are you selecting an option here which doesn't exist anywhere? Or
>> am I overlooking where this new option is being added?
>>
> 
> Yes, this is a new Kconfig option. Should I need to introduce in a
> separate patch?

I don't think that'll need to be in a separate patch; it can simply
be another hunk in the one here, adding the needed 2 lines (plus a
blank one) to, presumably, common/Kconfig.

Jan

