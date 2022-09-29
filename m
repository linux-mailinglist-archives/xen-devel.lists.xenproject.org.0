Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F15EF534
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 14:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413727.657557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsXe-0001LD-Ht; Thu, 29 Sep 2022 12:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413727.657557; Thu, 29 Sep 2022 12:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsXe-0001Ij-Et; Thu, 29 Sep 2022 12:21:26 +0000
Received: by outflank-mailman (input) for mailman id 413727;
 Thu, 29 Sep 2022 12:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odsXc-0001Ia-Ly
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 12:21:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ab11d61-3ff1-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 14:21:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8775.eurprd04.prod.outlook.com (2603:10a6:10:2e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Thu, 29 Sep
 2022 12:21:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 12:21:20 +0000
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
X-Inumbo-ID: 3ab11d61-3ff1-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr02ompGWdaXk3rWvA0Wakzpu5X3AOPCvJaZOTM2PWDAAEeqzoeQW/6p2/lEb/MvtDvBm/pKt0Y3DBKYxlL6sdHz7AkCGU3WR2tBE7VAUMTZHf942aIpkI67J2ct8It6/KCqaGgoAh1EG/eFNr3mUjxAAwc7MTktzFPLaMBvWikJFTE9VzQSRiVJPsSmTX28prXSvJOj21uQNWOFAakxRKDyWosR0HBVJ8VjqPgadVl6tfblGNnGJxdWkf0HisQCr7KhJcCk2ROoO+JREMpaa0GYibp6VcqNl6tQheHoVHEIVYXRuuGKhObrpPS2DChSmwO66M9Eh5wN4MZ4Mc/I+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EASFL+Yy2MgNjdTH+kUTqgOKursNorO1SSpvvIuqxfg=;
 b=Z08Mp8q7j1ZXvD69MxCTNuFly+UjpQR7cap/SF7q3etAck6GVCHKX+3GsJEukJtXfnPD/hr8f5fyle0o/dGs3YVGWfMKAQ15/wGDZt+20NuZe1A1YAXVRi8vrWkkgq7zuYvbVtlsbTxDFDADFZFmjLhlH/qgvj9oKxegYjeKNK5Sq5Hq3CsfNAsSYuBpRwTTRQlgDdRj+63v3zQqJXNKx57huweCr+Bq49spFxXM2zjh6mMz5UQpjOaI8wZQqtHgjyOz2eIYOe5GJkoQWpH+z05fKaY22i9vsvRx9LuiXz3N+QBV+ILGsJhBSr18RNxS45bWmkt548p0VsGNSsSQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EASFL+Yy2MgNjdTH+kUTqgOKursNorO1SSpvvIuqxfg=;
 b=jkEoh6Y+xUyIQx7DWslS+i1++cx8fdQ0xQU3tXLOaTkHW7kKORInowy04jG5fMD3RQpizLIiLg6OgkqJ3OMUEq6l0K86LhjtfWkpUPoRIqmaU4zAYPwxCXhDbgYMw6DKWmO/3eC8NNYhUfsWsNGuEw/lFVm81VNj5wUg5BD17J7+MEefl3Gs+RVpyi2y5oNvDCALLvql1jBT4lx8LJcUTrrYZXcSq0AgZhYDwCOCaorxcpnauc3zSYUQqDWEkMll+W0C57B60XFhPXeXU+lDqCEQWFJe1L6jMw1AGQc3s7FXorcSnPNZRnvMIefqqdPi3UlDCT6FU0DGvrxN5wK5mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47ec8e01-8ea6-4678-78c2-c67305fe3b7a@suse.com>
Date: Thu, 29 Sep 2022 14:21:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-6-wei.chen@arm.com>
 <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
 <fc03f565-8c05-e310-fa0a-698ad7c569e3@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fc03f565-8c05-e310-fa0a-698ad7c569e3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0142.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 093b64b9-ecd1-4342-f54b-08daa2151dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/rwO3weJEMDqQM4PJaeAt/X4PClAjonYFmJcYNMfPp6YbaxpqXcFQOcE07KwVwu2Z0pM8KQhAH211XE94FzWgc2rp4DE+CfjUFn+AG7qBhanH7XUjFu90gErFlHaHJSl9hk6EJSmeR1inro955kUJq02BygYXMlbFH2+FfbbGkvf/flD/xMCN8QszNxX3KnIjTr2DCaHPzQ9ab722OvZwRfKoxJjopTfITVLzqetffOqQwlorkADKyCXAE7R7OODiNI25FsG/m/tf+RbKCLEyEkRAiHPsNCk9/zXWxkjOKqMcbTTlrhKBPKPmkTqAMlTrhsRcqtc/NgVg+bNtyHWu1/pfTSaRfAwGXT8arA+Fm+SseurulBrnapB5mqfQh3UsbwuVgUR8oRW8q6u0zDoRIdL1tDXn522rK0u0z0rNjmy4v2nq6ep/nkRHNRM7OjCnreCyhh/d4WzOenNem56YSBl3LonSVdIY7+yOThZdDlLAfHfpG2asGIF/WSe1/xXcE4IS35UZN2jIhwbMRSvQwSDKYOixoc/wEuXnNbqiwzzF9whmrMVEz8WLe4fX7pn9bbcbCDmiujLscePxMmNAQOqhzRXjISzgh9BCcGcDaJAw4M7MVzHL98BrQ13ZwKOl3U+5WU8PL2tUmF0F+r0U8bHhwqFDOv8uC1Q5ibpfT9SQocH2hCVEpeCH+TzhhBDLyZUlrj95IpSKPjHXuVnp8FZ6y4qFS81YOvBN3JXwV/JEgZI7RrnflT9NEiBGlJcE30nH+qRkANE9O1BbYgoCYOykVR3ay+vhQV6sisicm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(316002)(54906003)(8676002)(6916009)(478600001)(31696002)(86362001)(66556008)(8936002)(66476007)(66946007)(5660300002)(38100700002)(4326008)(36756003)(6512007)(26005)(83380400001)(41300700001)(6506007)(53546011)(186003)(2616005)(31686004)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDc2aWRRNVhTYy8vQytJZk9ySzlTRTl4OGw1eE9PamJiNTdsbTZXYkoxMFVF?=
 =?utf-8?B?MngwZFBHcnZvRzViMWR4Kyt2Y0h2Qy8zN2hWN2xZSTZKNE5JUkJFUTFjMDU0?=
 =?utf-8?B?VWZrSlBBQjh0RlNzMjZibkJLOFp2M3ZqTmVaNi9vWjJZU2UvWTUxcWVTbDdT?=
 =?utf-8?B?QW5pcGNyWEE5YXRhQ0N1a1M3WUlHc1dGOE1lZE1sTVpkZUxqekJMRXRaZmxR?=
 =?utf-8?B?elUrVTFweG9sYjAxY3ZSd0h0OEJWSlJHK3NXWHdIbnFXazZucEVpS0YyS3R2?=
 =?utf-8?B?anZwU3dQaHQ4WDBjL0ZRc1B5czMwWU9DS3Rhdk5VajBZaWVpN05FYnZ3aVRy?=
 =?utf-8?B?cytnclVKcXVWcVdsdlJWSjZzMVM5TkJjTkhoWkI2ZjIxUExpNGlrZUVVR0FI?=
 =?utf-8?B?ZVFXTWNwdVdYOC9nSzVWV2hoZUFLa212Z2c2YWhSK2cvbGo4ZExjdjNvVzZr?=
 =?utf-8?B?b0pFcVdjdkh1NE5BTkFJMjhkcGQwWjdKQW5WYUkxbDJGYUQ2OEFyeUFORytY?=
 =?utf-8?B?QmVGdlM0emY5N0k1SE4rb2gwb2Q2QlRXR0xvaWsvZlVsSExVRUMyVm81R2ox?=
 =?utf-8?B?RGhhVVdEZHVaN2p2SUhYT0lkMHRkc2x3R0REbXdOR2k2ZjZoRWhkTWJJUDdO?=
 =?utf-8?B?Sm9RSDROcEh6Z21RNVFEcHhtSElhM2VWTExXQkRJdm9kRC9yeld1ckl2TE1n?=
 =?utf-8?B?YUR3bi9TNGh3L0VYUEwrL3R1eXdkSGN4azV6dkp0UFdIakdNUktCVG1NUFlm?=
 =?utf-8?B?dU93K2I1YXNWYzJoL0pWNDRYN1ZDT2MzM2hFb25oWXNBWk5vZUR1eFpjeVdq?=
 =?utf-8?B?eGZzZGcwaDByczdxOUlTUzQzUTUyelNFSTNPaTFFeURScFhSdTBmdlV6NjRv?=
 =?utf-8?B?cDBKM25nOVIvOGRKNm1MeTIxQzhQd0JRd0ZhMm1NSHhpZUhuZG9DT2IrTUs3?=
 =?utf-8?B?WVd4ZzRDMHNIeW5uOXE2d1NlNlFaalJIU2Q5bnZvbStmcmNyQnM5bG5EUjgx?=
 =?utf-8?B?bThsVWFqZ3EvczFNTHFQNy8rM1EzR3lNdGcxMWIwL2llSkpscDUyS2VUZEdN?=
 =?utf-8?B?UDBjaW0xTWtSWHVuaS91RUNhNDY0NGtoUGkyVXlrYkhjSVJralI3VjBhR1lz?=
 =?utf-8?B?NlhYQXBTOXlhclhVSmFkYXVlRFVpczREd2tGL2U1aG9ZeGZxL1krMkNMVjhB?=
 =?utf-8?B?VjB5NnlLMUpJNEhJUlZDU2pSeFE1eHpyOElKaUtqaEw1amhqbHI1ZTdPY2VM?=
 =?utf-8?B?dURYRy80YUdNN3gvMzk1YjYrakdMMW1mK2kvbzlESkUxWjFIYVBvbFErOHpn?=
 =?utf-8?B?TExrRjhmNDlha3N5bldmQXU4RGFUT2J6QmFCb25pUjRIYzcyOXVwOENtTE5o?=
 =?utf-8?B?cUR4cXlJcFdQOUI5UEIxbWwyQ2NFVDRIbUFDOVJpQlhQVkk1U3pYZjYrNGhj?=
 =?utf-8?B?cEYwSHVTaDJpaXFlYm1zMTlEUk9oK0hLMldqSEtvMXRPb1RhajNMUTJGV1F4?=
 =?utf-8?B?cWxQMkJVOWc4VGZxaFFhdEtFeDllN3VDc1BUNFJkUWhnYVJvRjdlaGFCaFBo?=
 =?utf-8?B?TzRuWG1YaXgxaDBrZW1YVnB0aW9hZ2FmV1BReGt0c1d6Qnh2RlJaVTAyWDdO?=
 =?utf-8?B?MUZKTU15LzBoZmdqdkxDTFZhV0RaalFYM3g5dlV3ZEovMlhxM01aa2EyYVdn?=
 =?utf-8?B?RXp6OEFaSkh0T0xJMzdTZjF2dGIvb2VScWJtRTl3anRXTXNORUR1S0dLY0dX?=
 =?utf-8?B?REM5YXZSUURsMVE4bnU0endLMTltcVVkbDlZd2d0am5UMHJ2bmp0UjR0Vkg5?=
 =?utf-8?B?M0VraEM5ckUrSCtuQ2s4U3ZTYnQ3WkRpUXROaU12QkhsTHVYbzUyMFJ2cTNX?=
 =?utf-8?B?alNlNnkxazlTZzNnUjZ5RjArQXB3SnA3c3NjS2JKbENxWjg1NTNVZXpQMGZx?=
 =?utf-8?B?UUhXRytBVDB0RFptWXJ5SFVRU3FvUEx3emNoUEFXdVREVUtGdlJ3L1V5Z1Jq?=
 =?utf-8?B?c1NEN0d0cHYvbSszRXpTUmdYOFdzSElGVXVrMEduZmxaK2hmL29DYzRxck1q?=
 =?utf-8?B?dHpIc0Vqa05kZGVEb0hZTXdqMVdkNVRKSEFYY29OKytIRFJta0s5MVJ0WVA1?=
 =?utf-8?Q?iRUSjfXAopPpEpqvEh7IoXMze?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093b64b9-ecd1-4342-f54b-08daa2151dd8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:21:20.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tQmAu1p/tE/rS8XFdTTxkP6BYBrqcFNRGBc2SCAWVSUuTvmLUGHz7silfQS3l4ZYlZSJr1V8cZihIFJwj4Wfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8775

On 29.09.2022 10:21, Wei Chen wrote:
> On 2022/9/27 23:48, Jan Beulich wrote:
>> On 20.09.2022 11:12, Wei Chen wrote:
>>> --- a/xen/drivers/acpi/Kconfig
>>> +++ b/xen/drivers/acpi/Kconfig
>>> @@ -7,4 +7,5 @@ config ACPI_LEGACY_TABLES_LOOKUP
>>>   
>>>   config ACPI_NUMA
>>>   	bool
>>> +	select HAS_NUMA_NODE_FWID
>>>   	select NUMA
>>
>> While I might guess that you've chosen the insertion point to have
>> things sorted alphabetically, I think here it would be more natural
>> to select the wider option first and then also select the more
>> narrow one.
>>
> 
> Ok, I will adjust the order.
> 
>> One further question though: How is this going to work for Arm64
>> once it wants to support both the form of NUMA you're working to
>> enable _and_ ACPI-based NUMA? There better wouldn't be a requirement
>> to pick one of the two at build time - it would be nice for support
>> of both forms to be able to co-exist in a single binary.
> 
> We are also working in this way. In part#3, we will check ACPI first,
> only when ACPI is off, the DT NUMA will be used by Arm. If ACPI is on, 
> we will skip DT NUMA.

Even more so an answer to my question would be nice: You'll then have
CONFIG_HAS_NUMA_NODE_FWID=y even on Arm (using PXM as mandated by ACPI
when in ACPI mode). But then what's the FWID for DT? I know it was me
to suggest this build time distinction, but I'm afraid I wasn't doing
much good with that (and I'm sorry).

Jan

