Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79798772545
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578397.905874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT06w-0003DL-9Q; Mon, 07 Aug 2023 13:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578397.905874; Mon, 07 Aug 2023 13:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT06w-0003A8-6J; Mon, 07 Aug 2023 13:17:26 +0000
Received: by outflank-mailman (input) for mailman id 578397;
 Mon, 07 Aug 2023 13:17:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT06v-0003A2-BL
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:17:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe12::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be8f740e-3524-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 15:17:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9100.eurprd04.prod.outlook.com (2603:10a6:10:2f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 13:17:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 13:17:21 +0000
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
X-Inumbo-ID: be8f740e-3524-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYg+aHr8kYlWRO64YP4JH8Job/4szQcM2Im00spGlCHsWqu1AM9IS48gD7PZP6MNL3G5/K0r5Q+mifVm8KDMcJMiYUsvYYT6+GsfUUSWTiPnCMg/j0oYU5om+xYRTLjeyzUkxs6mG1kDTUtZsl3nDNabZIgqDW2/dKM0vDZpveLwzSEeY2/Gqsr9DCBaPmiF1aWeq/y0ZAH+6MaxgtAdkBaujoHGK5bf5ki6f4oFQO3IuBICgge2Suub9GApK2+58caznsw9wTTRFn+NBUHUyGZe9hjwsNBOI8a/EaAFxDWKCFEZtTvH6pVUBlCgIYNJ1PgTypvrgmU5vJrU0jxQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/SCxTU+aK2lFTFgepLV71s72ZZnKyo6fCuV6V7d+4Q=;
 b=ZF783xnS6UMck/laOXDYH5s5J38e/kb1Zp571/kmBreiTuPCEuE1IwyfOailJB+rasu0ccBleO36iosTm4W5r6BdTaxRCzPn8Fl3bSNDdsrVJFY7jAOYU6Bcp0NlRXBBQvtHZ8NAGavLpmZD3OfLyZOoQUmrDCQ/j1/mGLBtti+N/xZYKF9s+1D6IjldAx18lhjqEy8Z6Z3eWd0IVJVAysyAGORu8zj9yFZRxJqwVjVIQpO7K8d8kaiTTCYiot4TtKU1/VqRswYgDaNJRhlR3IKUouMvnjgv26rQkyAe0HTirAKFvNB3Qskp5v8dJNyKFHHo48AEA78FlONztc2xlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/SCxTU+aK2lFTFgepLV71s72ZZnKyo6fCuV6V7d+4Q=;
 b=RfBoUfGe02q2Y4dZp4hE0ClTGB7lcMqGf6FyuQ6bUEGCJkQP/5F3td5gt/zW0di8mtmX++L9jVO+QFAPT4LJUMI6dgMrDItE7n0nDcQCuNmHZNBmtQNiK1Ynivplx8LotGXn9KuY7jGkVlUtN7/wHEgFHR/56FkJaqx+pfGpaUr+YUJR64cqC0GldZ/esFHEWL4ghZ0DOwCSUVi6oV5zD9kB1/zXIweeYYsLV8vYVEBZ7SIswTQHuMwsrwvCg1e+qVmQPMSH2UBWJjaFsl6hIgyb5JY4X2FyRLPTgz5n4i1TNQjRoB45HQY0k6xKByVtFEEvTDdgJXIRp8uxd81KCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
Date: Mon, 7 Aug 2023 15:17:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1554d1-3bbb-42f3-0e50-08db9748a19e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kroh1qSMPknClRd9c8xDjPKVL2Y2SGv2JHxjhjBWyicWZiDkQASnsnW2atUn3RMzND9jWK4UUR0imZdBoRp8VTIDI/Fq3wdQPgtCxNpGrM2mTqZwM5m8+HflTx5tteGdGp0PbE1Q5VavpZABJT16F8JCLO9tcMYFlBkCB5aHq5jAov9/Go9Lv5sO95r1ZlwEVg0uH7IdbQ3Lw1u7/9JfmE/4mQ97mawy6mAgqSk76/u5k5bkiHj4fRAaNPJIhKXXdFtqVMNhH18hJr+jBFA5QNbFLOqew7eV6sSFHoI80ZvCS8/a1zHwq0Zu7A1/33+/wdqnyvT7BCDm4oZPmoPWI8xFRqoT1p8VLkGFNz3QFmLIKi9/Ha/4OVxMKoIMG1vbBYa5c5aIXyTbo8ZlJVFTo270NvQ5TPzVIAsUcw7k3eppiP6n1gCc5P5oQJ5zjJpMtWhtzU0IOCbDAB9+GPV88xlh/C3wzwZ7TPafNZveGG32f2iIA2a36doJhPHZfmW7przGOynBf2wuAXVDMQlnmfHj+4O0ljSk3o+0NyxES6B3Uvp2Un4JG0Tbq8bAGJKiFcakbNpda4Ud5vcvRiViqUpS/rIX4TfJEKCXBoaTzeXtd/cOrdbN3wftu3KBxZx5xt8f/J9Qupkagedf3FozIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199021)(186006)(1800799003)(2906002)(83380400001)(36756003)(5660300002)(2616005)(54906003)(6666004)(38100700002)(6486002)(66476007)(66556008)(6916009)(66946007)(6512007)(4326008)(316002)(31686004)(41300700001)(86362001)(31696002)(8936002)(8676002)(26005)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjIzU3E0K21HakJrbVZiZWtoSW12bnRYWWgvdDJPbnJNTGU4MktvZzFiaCtX?=
 =?utf-8?B?RnNjTklKblJ3Q3ViY3pwYVNvbjdJc3d2TUhYNFZ1VkQ3amJTN0tYYVJCVDcw?=
 =?utf-8?B?bFp4WjYrRzIvZmxpWU5mM01iU0JTWGd1M2N5OTVvRlluQzdhS2V4dksrYVJK?=
 =?utf-8?B?SlRkcFlZTk1vdjRLWG1qSGEwbFUrS0lMa2o4UjAxRUJuRER4UGJhMXpJdG9z?=
 =?utf-8?B?d1dFVTdWUzNsM0hxcTkzTFZSbzdaODd5d3hWRFF5UGtqZm0rS0crcWUrQTJO?=
 =?utf-8?B?SnFyek0xK2JTenVPR2NzN0xXdk15R1JqTHdLc2hUYlc4WnZrem1KMnJjTG1v?=
 =?utf-8?B?dVdhVGM3SnVYREhKTFNqU1NZcG9sZUI4b1Fja3BWYkVPVnJnODFoODh3Z0hs?=
 =?utf-8?B?S093bVBrTXZnNEQvK1F4NW5FZHJEY2pMZmprZEh4cXV1dlU4aUhkUjUyT3ht?=
 =?utf-8?B?eXBXeGg0Q0VtVktjMnp6WkN2c0lRTjFWTEIvY3lNQ2k3TjNobVFCZGRZdnRK?=
 =?utf-8?B?Um9WMkpGRG11RDdqTFFhdEZRbjU5ZkVlVHpGMWtWRnhqMWhSNWJrMW84MENm?=
 =?utf-8?B?YTRyUzNHQU5Hdk9aVG43bDlMeUFLTFIzNWxkb1ViRzVRS0JNa21Xck03NEZD?=
 =?utf-8?B?M0JWaklUc040NHArWjJJSEVZMmZaL21zMFVtYmdEaldacEZ0Uk1wVjVrenFR?=
 =?utf-8?B?cWV1QVJXTVM5NmhzYVArOU5nUnhFMXUwSTFCVks1YWRpMnpJdmZ1b2E1Z1pl?=
 =?utf-8?B?a0hvbE1oUFQvd2NYUmpkUTRCeFRDYVVVWCs4WWFob1UwZWx6elRrQmVSK0Y0?=
 =?utf-8?B?cUpxbEw0SjJyQi91TWMvOTV1ZXYwaXQ5VkovRDZySGptbFpRU3ZMQzZXU1Nl?=
 =?utf-8?B?WWRBbHNjN2htblFSUm1YVXpNb3VsU2JWcVZMWnVPTFZOVnRyVk5WTlh3Q1ZL?=
 =?utf-8?B?aDl4UUpXK2tUQ0lZZU1GSTE3UE1XVTRKWTFMblgxZkF1Qy91NExVQTdqOUpw?=
 =?utf-8?B?T3MwYzhlWkpYSFBoZ3NEWTdTOWY4Q2F0bmJnemorQ2c0NGRpaE5LdzJqMlh3?=
 =?utf-8?B?allzVWZsNkk0bFM5Z1NKMUNMdkdXU2U1RmNhblpnWSt4SjJkWFREbEFHNUVM?=
 =?utf-8?B?c3AzL2NtVGg3UmVmZmFHak05amc0MDgxR2FRNnN3NGM2S0trRlNKNm82WFZS?=
 =?utf-8?B?RnNYeTRHa1lhdTNzK0UybktqYyt2ZS91cStVWEdHTXBQdkxmQUM4cTFjRVpC?=
 =?utf-8?B?d2NZVTQzRlk0VWxhRFdOVFMvUE1BSExrL1FKU0Nobm1STGdzNy82VmhNNmh2?=
 =?utf-8?B?cTNDVXFTWWVlQnJFZ2dsRnJnZkU3VlhSYVJkR1N2dytpSVpadDVaZ0poUjNV?=
 =?utf-8?B?UTlVbWlxQlRvaUxsVm8yUjZvTHlJNnY4bXNldnU2ei9XVjJLUEQ3N3k0WEdS?=
 =?utf-8?B?TFpxL0dqOHpqNXVISHd1d3h2UEErNiswWTBHeElXVzdFazhVZG5EVjg2M3l0?=
 =?utf-8?B?KzBvSkNlbDN4NFhGT0x4WXZnL2ZVWS82Mk5MNlFMaTQzbTVqbjNVNXpIR2Fk?=
 =?utf-8?B?L0pvNzh5Wnc5SW9uMUFJTjE4SGVmM0l0Q3ZVc2ZDaXhYdFZJQXFDNEt3UkhZ?=
 =?utf-8?B?ZkF5R1llREdOdzR1Y2pvSGpKK21uWVc5UndKUklCUWdmK0txcFhDa1VSOTZ2?=
 =?utf-8?B?U0JIMU1sNXVYQWhaOEpISjdxZDk3VmtQWStkdkZJZzV5Y091SWVrOUd5M20w?=
 =?utf-8?B?UlcyOFQwRGRGUXRvalF4ZXRsZlAza1ZGdGhtcncrQ2xIUmVibzY1NlcxSVlY?=
 =?utf-8?B?SjRETkZ5TFlOZGVraXhUeFJsR25PVFAwd05nN2RHcjBiOUFqSm5UdWdsaGRL?=
 =?utf-8?B?b3ZudFdUZTBEcmd0c0tpU2F5K3NzVVdLNjdpbjAreEh3RmI1TWR5ZnI3Wi9j?=
 =?utf-8?B?WEYyNDhaeUViY3ZIV1RIalpNOGExcFNoLzlyemRSTytRbkFaK2FZN2hvcytz?=
 =?utf-8?B?b0Q2RDhFRGo5cWRlckRoY2UzM0tPbDROYnJuMVY1Y29lb2hnbFFJVkhKVzNn?=
 =?utf-8?B?S2d5UEpHemwyU0pmWlFXaEpOR3A1Z0phcjluejlZbHhDc1owckN5bmRxdlp3?=
 =?utf-8?Q?laDPazdBo+Mkr7nIMBW5dX00R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1554d1-3bbb-42f3-0e50-08db9748a19e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:17:20.9302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B34ypUbo9rKxuq4597T9Z8Ryxf7mLqUf0lyNEV/lAvSfx6YsXg5u7liCRQlFyPm/v2zSExpv1N9+hod4qCcI4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9100

On 07.08.2023 14:55, Simon Gaiser wrote:
> Jan Beulich:
>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>> 0xff. Linux already has code to handle those cases both in
>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>> same check to Xen.
>>
>> I'm afraid it doesn't become clear to me what problem you're trying to
>> solve.
> 
> I want Xen to not think there are possible CPUs that actually never can
> be there.

Did you try using "maxcpus=" on the command line? If that doesn't work
well enough (perhaps because of causing undesirable log messages), maybe
we need some way to say "no CPU hotplug" on the command line.

> Without ignoring those dummy entries Xen thinks my NUC has 2 sockets and
> that there are 8 logical CPUs that are currently disabled but could be
> hotplugged.

Yet it's exactly this which ACPI is telling us here (with some vagueness,
which isn't easy to get around; see below).

> I'm moderately sure that soldering in another CPU is not supported, even
> less so at runtime ;]

On your system. What about others, which are hotplug-capable?

>>> --- a/xen/arch/x86/acpi/boot.c
>>> +++ b/xen/arch/x86/acpi/boot.c
>>> @@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
>>>  	if (BAD_MADT_ENTRY(processor, end))
>>>  		return -EINVAL;
>>>  
>>> +	/* Ignore entries with invalid apicid */
>>> +	if (processor->local_apic_id == 0xffffffff)
>>> +		return 0;
>>> +
>>>  	/* Don't register processors that cannot be onlined. */
>>>  	if (madt_revision >= 5 &&
>>>  	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
>>>  	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
>>>  		return 0;
>>>  
>>> -	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
>>> -	    processor->local_apic_id != 0xffffffff || opt_cpu_info) {
>>> +	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info) {
>>>  		acpi_table_print_madt_entry(header);
>>>  		log = true;
>>>  	}
>>
>> In particular you're now suppressing log messages which may be relevant.
> 
> I intentionally mirrored the behavior of the check directly below.
> Unlike the the version in Linux the existing code didn't log ignored
> entries. So I did the same for the entries with an invalid ID.

I'm afraid I can't bring in line the check you add early in the function
with what is "directly below" [here]. I'm only inferring the "here" from
the placement of your reply. Maybe instead you meant the rev >= 5 one,
in which case I'm afraid the two are too different to compare: That
rev >= 5 one tells us that the entry isn't going to be hotpluggable. The
APIC ID check you add makes no such guarantees. That's why the new flag
was actually added in v5.

Jan

