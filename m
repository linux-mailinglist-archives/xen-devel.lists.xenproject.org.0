Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E172260D12E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 17:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429949.681310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMJl-0001x2-J7; Tue, 25 Oct 2022 15:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429949.681310; Tue, 25 Oct 2022 15:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMJl-0001ub-FM; Tue, 25 Oct 2022 15:58:17 +0000
Received: by outflank-mailman (input) for mailman id 429949;
 Tue, 25 Oct 2022 15:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onMJj-0001u2-KJ
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 15:58:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d46fd3cf-547d-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 17:58:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 15:58:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 15:58:13 +0000
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
X-Inumbo-ID: d46fd3cf-547d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW8s4Die/PZFLnTMlWwnrjtwHN/rzRD/CyU+bP5FIe6EdAFXv67TuHIM5sSKX6kNJQ3R3lS3Rfv6WmzdoZEMkZW5Vw0lOJbrhwAYgOugU+iw/1seFKPHVqze8CXaVTXoMqidyjuzuRhKQ+eMjTpwj2Txy3wD0tln16+GaZeoLJ6Yj1LnMpEcHX7tFmb+hqy8c/MNcRpvgZaoA+AgDQAX8n9zR9fyv+Ps8ykabB4nuVKIiw/V8r9LnfycXYkLrO9cBVaIUuSkA5HatlyyGZkn9ebxhHfoTufisBxlnfu0WdAuQanV++AzlTJcasIlTn0et2VtB0rF3/EFwMdpofDBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRC46gAylqR+KERkvSuW4X0HQ7Hd1weNXfSpL0gBtG8=;
 b=oVEuT/nw1kR4NqIk7guabnypFXzK07FuRPf2rCqzlgSFSxM5DkZNliPbrsr28pQxcyi8v2ypjXj2M6jyviGYfPxV3e+fy/aszZvuvkalAxnCRxnYSZPj36e2njwZYHRDY0ixydgrSNNP3VW2Jlwb5TBVayv9SOC69SCQAZE49o3CVaRBxJDR5+Wrqz12Nj1adourF06UmmB5CQLBC3oo14YvZRkyBEJTPkGsi3oosLocIcgSHHnoN3lRy8kjfMBuLjzPxZ/NKuHLPxj3D2FUzHyupKuzlW5RaPBPPrvsNpUJkoNJxLmg+7LzA0Jph7Zz9FioibqFzXzO7lerbGi1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRC46gAylqR+KERkvSuW4X0HQ7Hd1weNXfSpL0gBtG8=;
 b=50nMiNjtglULmIx9g1yXfEdm/UUm+XevPX0ywJPDiSgPQDIHfsc2HyLKwj23fpSfcxJTSQhiczZygqmpclxJiGKW6nZYJRTAS5cCD8GEbNtzCZbwrgS8Q5G3alxwqDJs+53a6H9AmmBweBtqgFMPX16GxfcCQRz7Lu+XTiWM0TEZyob+PdLIk6QzzGeQWGO4FhJNAR6V1AmMElqQCEHJ2sXRPrKnZK7kIDQjG3A19dyH7wt1n6thLKVHK1kqiGjT5qybV05iZ0MxA2Wi5qDaShtQzOR7PovGVDJNET2K+tTDxeR1FQTTx3t64fYx7MWgw5CTfDuCDLYsepS8USnBCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76d0ce3d-7c05-9f4c-921a-0c7e0f5d9348@suse.com>
Date: Tue, 25 Oct 2022 17:58:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH][4.17?] x86: also zap secondary time area handles during
 soft reset
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <c80390e6-b9c2-e15a-b513-ec97e8329ad8@suse.com>
 <Y1f/iQaugcmhiP+0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1f/iQaugcmhiP+0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: a2afe673-d5a5-4b96-6ec9-08dab6a1b8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h+ybTki+s3MjPRjlfQSdQo6njYwNrsNWqTlIdGH9Sim8MbaGX71pHeXPpB1cg64rg6mlerdy0iIbHmP9I3GMpstFhWGO4qMcTrbEfi71Y4ktDnptrJyqr1JMqnmGz2NteMN+a+4A+s49e9fTNMj3O2hkG0fq4m1NHuDfPVj6xgs4OWy4VN01jvlIaW5Ps2k3Z49SHDkIfPdqYJD48AzCb1VjGzWcALyvRj6W77GBC8M3m+YhzCwFwakWQawJByXm8FIcMfutKxkzpRnwlMWgbrGe91ii5bMcA+CGFsdg/f0g6GyflvTSAz5W+CxmNDGIFhnIcl6zT9oioeptgmjlYxri4cl2nRe0VKyLiJS6ghRyZ9wb2tjPQmjgUxhgBISK7eXQkHugCyT0ohhMbhOt//effHCh2YRCLlWJcF+HNayATDfW7aKlAQ7EvifMaeGuzpM0Xnetm+BM1wEv4nl5tykgplXFekV2ae/a3+Fv2czHa3M2rVLC18I3qTgtisS2oo7qsXprkrypqE+Y8OSfhyufPvjJ3Q4NJ5mtteeGys5eKuZLusY37KUGPpxfRrZm/wvXjGgGU15qTYQMM3AC9mHQZKHBApQ69gPqviYpI4Ayq7TA9pjTSHKKooKf6M1enzYmvyQFtIqJ5PDTyi1NQhKPEUpYy86/QMfUm7a8TVUhrB51qRGbWh2eKk1sSZ7OJl1fK0Llrg/wT1hLUkXvJxSaypiOzWTtfsgIwTkbWMD5KtkhgfmI5y666wNpZRij6AXZ7dGh7rhhK570KJnZmAeX1pNqth+vmlfgw57fyiU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(38100700002)(54906003)(6916009)(8676002)(316002)(5660300002)(8936002)(41300700001)(66476007)(66556008)(66946007)(4326008)(53546011)(6506007)(26005)(6486002)(2616005)(6512007)(186003)(478600001)(2906002)(31696002)(36756003)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVA4N0RoVW8zVnJTNnNVTEFNTWNHNG5YdDlqc25UNGtmeU1hSFdMTHpyTVJj?=
 =?utf-8?B?aGJ0ZVNwY3pubXFZc3lCd2xWVFIzSGo1QjNSTnZ6MGpiL1pwOFdwcDltTExx?=
 =?utf-8?B?SFY4ZDNmemdlWXlEZ1lYeGQ4RjdycXIxeGpmeW1TbFd0WTZPM2VZaEdyN2I1?=
 =?utf-8?B?RkZoR0VidUt6a2hrK0NhV2hPZ0pPUGhPS3NmN2FjYmdXWm8vRU9ndFBaZ2Vk?=
 =?utf-8?B?eUhOaTUveHE1cVhycnZ2bU05TlNjTDMzWWs5K0REcGZ3YmtZYjU0SENrS21I?=
 =?utf-8?B?K2pCdTNIcHNybUtNM1RxRlEvcmpad3k2c21QbHRXN3dRYXBwZE5IRTE4a1d3?=
 =?utf-8?B?bmp1anpsdmVPMWViSmFGWXRIOXltRTZ1UEpRUWQyQlJpWnFnY3pvOW1ZRUZV?=
 =?utf-8?B?OWYzanZxeWJINWZ1M1hKNkdtbkxHbzlBV2p3ekhzODVmVjZ3cGtYaFZRV3Qz?=
 =?utf-8?B?cFhaK1NWdGcvb25IZ1VNWHgrOHF1d3JTY25LMmhscVU1Q1FhQnRaUiszVDJo?=
 =?utf-8?B?VGIzelRvaHRSdUZPRVFmQnRVTjIxUzBoVWl0dkRRWkE2b3A2d0xpc1JSejJy?=
 =?utf-8?B?Z0YyVFE5VHMvVm1qMlBHN3RyZEE3YTRuMHlIS2NyTW1vd3pHRnpCZGV0cnl6?=
 =?utf-8?B?UzVqVXNmVEZPS2xxMjVxR0ZaTnF2RTJpN09WbEQwaDZvTE5TZUp5V3ArckJh?=
 =?utf-8?B?VVkvK1lURXlQR2tUdDZkV2VtaEdCckd2UTdqSG9WVjBiZG9JYzdsTDlJd01K?=
 =?utf-8?B?N1hSZlJzNHdXbGFqREFRbERpdk9qR1RnWUZyOVhwYXZZZDAvcjI5ak9jTk1t?=
 =?utf-8?B?emhWNC9HREx2ZTgzWmdQSWZPSklKeGJ3R1JFNWpjRjFrK2I1MVRQY3M2ckNs?=
 =?utf-8?B?Q2FjV2hvL3BoVldUZ0lrc24vdk9DOXdTR0JSVmVYMmhjNFJFbHpLVTZraWFZ?=
 =?utf-8?B?TStXSDcvdTdPR2xzY3h2TnJNM1B6OVRSWUpwdWRGWERXYTVkdkNtN0pJMlh5?=
 =?utf-8?B?MklZaGZ2S2FSQUtWdU9NSDZ6OTJWY1I5dWVOSmM2eURDUDNuM1QwYXN2eFdP?=
 =?utf-8?B?NUtpeWVrWlVKZEFlcjA5czh2UitSRlQvaDlxK0FxdTRSdDVQSDVadDZxSkE0?=
 =?utf-8?B?WU12ZkNJcjFrYldtUjFuTXhuR1REUGxXTUZ4RFB6V2lhZFFOS2hSZFhTYUVZ?=
 =?utf-8?B?NjJ3N1lKVGJYcVlOelM3TFZuMmR2NHpQVDBheHNqSTlnYWFOZ1JxZUc3emV0?=
 =?utf-8?B?N21nSXR4U09oU1FDUzlkZUtKK3hISzVFdTJGSHFQYndkQUZNRVd2MEhacCs1?=
 =?utf-8?B?NUVkNnl0YlRiZkNnMnNINjFaV25UZ1NURUV4VzdKN1NnS3IxbUFKck9vNEJx?=
 =?utf-8?B?NlB1U1dOTStJenh3andjbVZ4ZnR0T0piTWRtcEwyKzRhQThkVFU4Y2V3b2R6?=
 =?utf-8?B?UExtTDdmY3RVTlRaRmhKcVhUeC9NZjNRbUl2cUxhU3drYmRneEEzc1RTYlJQ?=
 =?utf-8?B?NEJEazVZbytDazF0WUhOQnBLZGQyTGNSOStDR3lOblU4eDZVemlGWVpiMDJj?=
 =?utf-8?B?a1pvZVJuMzk5Q3B5WUlPdWdjc3pNTUpaazBTckhHdTR2MXMzZ3JSaDJNN2Fi?=
 =?utf-8?B?M1lBUWtYOTBqc1FQOFZSWUh6TGVjZjVIUHduMGI3Nzh4R3M5aUg0NWxHNzM1?=
 =?utf-8?B?enl0TUpHM1NpNkp1UzhMb0VuS09FUDQxcUhZdlRqWWlQZjVOeVBLM3dFZkVG?=
 =?utf-8?B?VWYzRkkvUW5UM29nOXFjUmFWcWlUdEFSWFZzRmYvRHcvNWNxT1dJNVFJUDZV?=
 =?utf-8?B?dXNzZFdramFzSDlrUUJkOEVBak5nbTBrTzE4S0NUZ0FkK1c3Q2E5N2cycXJn?=
 =?utf-8?B?OGc4d01qWjJ2eDJ6ZEdwZGNjUkU2bFIyL0F0UlpKcndrUlNOR1lnajJnbWVF?=
 =?utf-8?B?QVkvdWpuY2VuT3FZSjh1RTNMMC9IMUlkdUFmZS9uZ2lGL1NnaEUyTDFVNlRW?=
 =?utf-8?B?dlRKV3dHVHNLb3NBM2Rma1pMV3QrTFIrWkxuYTBWYmJ2clJDK1I3RU1KcUFp?=
 =?utf-8?B?UEQ0Q25zeUlTUzlZUHlxRXdHMzUzOGZQbUh6ZHRGQk5heGcyU2xEaW1jZ0Fu?=
 =?utf-8?Q?+bDiP9ilTKSX/lDZFGTGmliHB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2afe673-d5a5-4b96-6ec9-08dab6a1b8a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:58:13.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQABtt5rAuElLcypgQNdOENqjin83bA4YJZO4ACS/w2jIxie66rd8QVoJxeVcraKCVRsZ5kFzvb/gjHi/uHPzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521

On 25.10.2022 17:23, Roger Pau Monné wrote:
> On Thu, Oct 13, 2022 at 08:48:21AM +0200, Jan Beulich wrote:
>> Just like domain_soft_reset() properly zaps runstate area handles, the
>> secondary time area ones also need discarding to prevent guest memory
>> corruption once the guest is re-started.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> To avoid another for_each_vcpu() here, domain_soft_reset() could also
>> be made call a new arch_vcpu_soft_reset() out of its already present
>> loop. Yet that would make the change less isolated.
>>
>> In domain_soft_reset() I wonder whether, just like done here, the
>> zapping of runstate area handles and vCPU info mappings wouldn't better
>> be done after all operations which can fail. But perhaps for this to
>> matter the domain is left in too inconsistent a state anyway if the
>> function fails ...
> 
> We would need some kind of recovery anyway, so given the current code
> and lack of recovery it doesn't seem to matter much.
> 
>> However, at the very least I wonder whether x86'es
>> restriction to HVM shouldn't leave PV guests undisturbed if a soft-reset
>> was attempted on them. Right now they not only have state partially
>> clobbered, but (if the arch function is reached) they would be crashed
>> unconditionally.
> 
> It's a toolstack initiated operation by a domctl, so I'm fine with
> saying that it's up for the toolstack to prevent soft resets from
> being attempted against PV domains.  Would be nice to reject the
> operation earlier on the hypervisor, maybe by moving
> arch_domain_soft_reset() earlier in domain_soft_reset() so that we
> can return without crashing?

I wasn't sure about moving arch_domain_soft_reset() as a whole, but
yes, if that wouldn't cause other interaction issues this might be
an option.

> In any case it's unlikely for a domain that was attempting a soft
> reset to survive the hypervisor rejecting the operation, so it doesn't
> matter much whether the domain is crashed by Xen or left as-is I would
> think.

I'm sorry, I don't think I understand what you're saying here. For
PV I'd very much expect the guest to survive; it may of course then
be crashed or destroyed by a further tool stack operation.

Jan

