Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A677B2A6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583258.913370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVS9e-0004vB-N6; Mon, 14 Aug 2023 07:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583258.913370; Mon, 14 Aug 2023 07:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVS9e-0004sq-JN; Mon, 14 Aug 2023 07:38:22 +0000
Received: by outflank-mailman (input) for mailman id 583258;
 Mon, 14 Aug 2023 07:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVS9c-0004Vo-I3
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:38:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 896c7c81-3a75-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:38:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:38:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:38:17 +0000
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
X-Inumbo-ID: 896c7c81-3a75-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mV5Kdz5XhF3u17MnVDGfnF7HnpwfjPzET7DaWChmpBhxi/7Li3wC3gPfnmLCYjBJGKZQrM6teq3JP9DbK+QUGPVyt/S3ljPb87XXfJvHPTnmf+JvmAnxI4ymu2KVxKsT0BKJUn9FaZd6gZpf/pIH1iHs2J2OyvBBSMfyws3DGQ7A+imMXk+QeZFWFevSM6jRZ4bDg/qVur5S7yKNh4+So2ulYxN6ruG7nKEkUstSEFlv/URwurCwUjTmqnKxuX27vm8cmXBj0XO3VoDU0jC+B7mVoO1bfYdYHfU3cWtCczJvHa+iWLiFNZiN7cJWW50tNSh9vnEtBD2V/kEu5YJaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwuEGgs4k31BocMir/ftFDsWnxydLEP34wxuBjdVGPM=;
 b=OAxgCk3g1nSQNpF1hn2S5dAd3SUxB7P0V1BuTwCS0ejDO0rhBLC51drIi89ytfVLq5Z3O+Ew98H10AJ3hteh6hz/SMehR/T1Jj+Dc28QEBX9tdhsh+qBumFgGnDfnpH1SyhSNpdlkNs+LpxcvslL8u27l2VjiSSnIcmaAN332ZGhqA+NFpUrLf10hbuoU0lKTZM/5aCMCVZKU68NLLnSvhiC0OIi4lwrEpiE0nVgDIism+8UPmm6kors3KENgC0p1SJKKEeEL9YJlEybbMdaqPh2XGtl0apV/UKYxT5p0AjACR5Mg41hk0xfQThfTNI6DCwz0LlYHEeDZPNLzYNTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwuEGgs4k31BocMir/ftFDsWnxydLEP34wxuBjdVGPM=;
 b=3fmyEgIA9ajB3T5tIqgX6fo2Q/zbhwzwR8mudWzbzA6/yirTVqrGx1MQU4p0NAUELY1HBpqEk2TLibIvmmtCzfhUgxjyWR9m4YvBP5IBDV/fM+8UVm7HTZ7Fsu6E69fxOmdM247+w0s5E5yLnmxcTgmz0zBOwUfmaz2mUe6Ntzu66TWfuIg7LOaNep3JZMTiKEpVIDueqdXhcENUNWYuqsw6nfq+ThhIp7G82nWk8v4jBOAztyVDH7IR8E5y3+IDBXGw7/QvTsS5VTPkV45WsySpa2vgPLOfBtEuicMKLZ+6jC0UTIkLxpii3wc7H8McLAr9LcfR0hTmzMjFYtThVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e621f307-f83c-044a-cd9b-6592f452454f@suse.com>
Date: Mon, 14 Aug 2023 09:38:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 2/6] x86/setup: add missing headers
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <c4fbf7b2a763f1b8e700e2ed36628c047231cb46.1691676251.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308111557590.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308111557590.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 16fdc25d-b6ab-4b44-3fe6-08db9c996ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cz2gYtqrJeZtZkRv/Pm+1e8L42rFt0Qc8VhzwjLjd0s7ooiHGBzuEG37AZ71fy27YK4lB8HXIiQVtzInIrgfbL6pb3lM6ZkydFR0sd6EAFKAXjrFERnS3hrUMTaL+TnKl9ckPASsUbL58eaFkfb+MtmJZqG3C+tM5rTOcWdSV0l/MtV9bqch4G8zg4tMFeuqMu+w1dRSN5C9DM3a05WgC3rGGzWjEDvVw0Fc6RPvk51RizJ+or0AOG38QxfYsGC0K60SAHH0L6VyytrEc66YZvK/7SS0NiPr7DJO6EiWmDfQ7MpU5OHowbX3uu7w1XfEMMDk5Aas+S1a+/vHZF925UsHoWqiC5gEHJQmHmzbZaLLAx5d0CCXTeECK0/0jWADWXscEdPJo21H9/qqIL+x2/JBamrKX2uhhZBjMz1pDAbtyyAFWcQ9fqYz3JD0bWlcKoLv4YZfHeYqm1lw28gNwE1nLPL9BVK278kCADq913CbBwNPAmIfXz0OqQm3LgssFgpUmIO9c2GiZwzjNJwn5CGlt/d6X2W8LdEvaZgnkHnCLdtWzdWmdrXixgmU/VpN79k8L2iM6Sc3aC5Mo0kGfyD+qDgusuLIfc5HhPvTQjfvipav4cKaVVSUlza3YrvvlwWrxa/42WDqM0YhoLfoAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(396003)(376002)(366004)(136003)(451199021)(186006)(1800799006)(36756003)(5660300002)(2906002)(31696002)(86362001)(4744005)(31686004)(83380400001)(66556008)(6916009)(4326008)(316002)(66946007)(66476007)(38100700002)(41300700001)(26005)(2616005)(6512007)(53546011)(6486002)(6506007)(8676002)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0Z5RkN1eGZIeHk3WmNzdWxscDhCU1ljc0F2L3RSdVNMQ1VhRnhVd2pqb3pz?=
 =?utf-8?B?bzFvZUNkNlZaZXA0Kzl2NkNQY3BwOExPczZ3dkd3eUpKZVFUTmZGclcycWtQ?=
 =?utf-8?B?Q3ZMM28rYU1xcGFPQ1JJMjFrZnUzVFk2UGVQamN1U2ZHMWZBc0xzTHc0dnFQ?=
 =?utf-8?B?Mml2c3hyUFc4UDF5NFg3TVFZdlM0UlRwS3doM2toaElseEhGMnk5d1dyd0oy?=
 =?utf-8?B?dldwSEtoQmVYNzZCOVNJeVVXL2hFNVY1QWpJY1FSK3ZzYnpRdnVOSVRVN2Jw?=
 =?utf-8?B?NzhHcGtNM0pVOGdkWUpLbFlwMGhNblVKWXQxOW0wTXdSOWZXWWxmUGlseGcr?=
 =?utf-8?B?SFM2dGQzeGUzQzNNeUNLYUloaXFwTTVIMEQ2SGllM3NpcENRR2VxekZPWEdJ?=
 =?utf-8?B?eis0NFZpbis0OHEvQU1qTjlvK2N2VEFDbjVsNklyQldUNkYxVHV3SGgxRGo4?=
 =?utf-8?B?WWk0NGhIWFdOajFTSmZrSE8vcFNEZkFvcFM3ZDNpOWdNaXRUMWN2QWVsbWdR?=
 =?utf-8?B?MmNQYXgyR1FkdEYzV3NkSVRwclJzVFZjSHRWQm9zNG16QWo4ZWRVeEhuZ3JM?=
 =?utf-8?B?QmJidmZNaFFvbjE0QUdPaGdIWGhWVVIwcDcxZ1NTNW9QMkxrSkV2ZXNBUno0?=
 =?utf-8?B?cUtHMWNyeHF4bml2amxPQVFKd2V3NWFucTQvZWVBZlJTMjFncFZsU0RoS1VG?=
 =?utf-8?B?QmR2bnhZSW83aGUreHJ3SldRdURpY3l5dGZ1NTJzRkFkVjMyYkpCbVFiK3FI?=
 =?utf-8?B?OVpGejdjL285aTVWK3paRGIzZElyWU05MzNIWWFXKzRjbmhhL1c0T2QyaGlO?=
 =?utf-8?B?d1FGcUFVd2VEeXFxS2gyVnFuZFp4K29rVURXWUpNakxQVzkyVm5ueHZKcXhU?=
 =?utf-8?B?QmI5YXZBRGNJazlRQm1yN29GVXBCZURPY1ZaUnlhbTBnaXhCcjN5UnE1V0N1?=
 =?utf-8?B?TGZRNEdtQUtDcVA2ZWlXUEZZZnNXQ1FzTkJrVktqNjdoU3FVT3NrZTdiTXQx?=
 =?utf-8?B?LzdsT1lIem9NYnIxdWhHVTYxZjhFTlZWc2pYdjd2L2I1bXlUTmI1ckY3eFJE?=
 =?utf-8?B?dzRIeFNtcGkvcnNsTldHNG1SQkhWVUgvZFppZVh5bElETGoyRzNYamlGTGwy?=
 =?utf-8?B?Z1ozd1JSNEduYzZUeEtuKzMrbXUzbm9CaG9YYTMrMnZrMDAzQjk4NVlGUEt2?=
 =?utf-8?B?b2ZYcEZNRFJ1UnVwbEtsdUVUNUp1NlYzYVc1N1c2aXRKcm9heDFsRnlkcW12?=
 =?utf-8?B?Nm1RNmRUL1JNZTVleEFYR1kvM2lBL3Fmd3BZTVdJbm1EWkpJT3RUTk0wQ09v?=
 =?utf-8?B?eUdXaVJueDVmVXhYRVdBS2pINVFLUjgzdStkRFlFbW5YMmNaZzBJcEc3OENr?=
 =?utf-8?B?b09nZ3NnV3Q5UU5MeHBLNERrSHNYcHVPQXkxbGdueW1YNnQwM3oxNFJ3YTNB?=
 =?utf-8?B?S1AwRjF2am9pbDliWGttSUJXL0RVSFVKdXQ0VlFjNHlvdVhabktrdkJwTzNi?=
 =?utf-8?B?TkJyS2J1ci9yTHF5U0d2RFozOW1BSE1STnFZd3VrQ2cwdmhGYXNyVkVoNyt5?=
 =?utf-8?B?U1ozVTd4b29JOEpyWHBtU1dmWGkxdCs3elBFeVhmNFRXbnptYUJKZ1g1T1N5?=
 =?utf-8?B?bjJiVDNweG5nUUZwWUMyNE5tUE9wblAybERYQXBSdEtyQkppODFQakdqTWpZ?=
 =?utf-8?B?TGRsdlNOdjNPS3dSWmdkU3lPQTdTaWl0ODJsU3dhTlhiU0tZSnhDUUh1bWlo?=
 =?utf-8?B?OXRPOVk5Q3VjZHF6K0JZTDNqRzhIZnp4RExBTFR6d1lzdGRQZ0RkZEVBNkcy?=
 =?utf-8?B?SGlId2FtaWpmTkJidjIwMkFTVERWMEYxUWNlejNOcmE2OXZTb1l3cVNnWGxI?=
 =?utf-8?B?WUNlQ1U0clR1VVpIK21kbXh0U1gvc1BUd0hoUjg0VFppSjdTUkhhWDBkVHNw?=
 =?utf-8?B?WmpPNk1ZejVSOEhtRjIwTUR6ckcrc1FtSkdNUFJjOTR0eVErMUNLUmpWZ2xX?=
 =?utf-8?B?TVlWTHFtcGhIYytETnlPWVRydEVwUmFZY1lHdDMxTUxwcmRhV0VhY2Q3YVBa?=
 =?utf-8?B?MGtyQ3Z6SkM4ckZ0V0gyZkRqd2krOGkzMEJJVzYxQk83cDVCYTUrTXp2NW9H?=
 =?utf-8?Q?dl4IuW8LNQDzBx2RZB4HL4IU/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fdc25d-b6ab-4b44-3fe6-08db9c996ca5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:38:17.1088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxMGb2WMZUp61svVumybdblt2JwcHE9M4ITNiQBy7SHO2812x165L4zvrQxm9B7BJl8TULoviVeDATM+AhbENQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

On 12.08.2023 00:58, Stefano Stabellini wrote:
> On Fri, 11 Aug 2023, Nicola Vetrini wrote:
>> The missing headers declare variables 'xen_cpuidle' and 'use_invpcid'
>> that are then defined inside the file.
>> This is undesirable and also violates MISRA C:2012 Rule 8.4.
>> Adding suitable "#include"s resolves the issue.
>>
>> The type of the variable 'xen_cpuidle' also changes according to
>> s/s8/int8_t/.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Fixes: 3eab82196b02 ("x86: PIT broadcast to fix local APIC timer stop issue for Deep C state")
>> Fixes: 63dc135aeaf9 ("x86: invpcid support")

One request: Please can you get used to putting the Fixes: tags first,
so one doesn't need to (try to) remember to move them in the course of
committing?

> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

