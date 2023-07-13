Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3A75210B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 14:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563128.880141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvHI-0005Lr-T4; Thu, 13 Jul 2023 12:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563128.880141; Thu, 13 Jul 2023 12:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvHI-0005K3-QF; Thu, 13 Jul 2023 12:18:36 +0000
Received: by outflank-mailman (input) for mailman id 563128;
 Thu, 13 Jul 2023 12:18:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJvHH-0005Jx-ES
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 12:18:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6262d363-2177-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 14:18:33 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 13 Jul
 2023 12:18:31 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 12:18:31 +0000
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
X-Inumbo-ID: 6262d363-2177-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYppZfI4X0XgRSPc0jd8y/nIcbixj9LZq+H8yZsU9vckOei5qSlk1bUE0CVW/Q2hU4wtjB5Kep6zUHznwY5JQ4XNzsKM/x1le8PD1/6qZkIqOU+70o2THlmmn9bsFrBjBU3iaHiH3bL/tQCn7gAqaSWareDX2eLPzTVZVVfOTG3gudeeTXssjeTPNvz4mTc9WavJBScB4/jpn/wl5zGk86vFqB8ib1xf7zx75KSqjqlkNKRyrx7JqraeZ0M1ivJZkRsCIg066ClL5l/9fvUqAfJclnudxXxhNTxbFTkLTK/4KUNo78NZTeWbEqujlazlZ+5cp+C0vusccjf+zrhN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gcd8J65i8vMfqwXzXSD63zpDSYFUuSaQAzs5IcQb68w=;
 b=B3xGPic6ovIMqXGwlLWeyYD2KhIogFsp7dkP7GTu6UER+gCezTN/yq0AyJ9DqqmfKFw7WjtceZvBy9ExlRkx+1AchCvZoGxet8E3NdtIZkfkxCSiu56Ymcsu7fmJfzDTL4bxFFa0r9QmE7lvN0Ibi1HTHEaBMzLN95QoFq5Z2JtZjUDr4tOJSmRE4+BeSMKg1AzGjXB+X2IBYO8I0IdRgI5UXQQ8e7IDo+DyySYGcN+EgxzkKWhh0ILPdZ5ucSTVOWNOGV2Ctt4ZtOQZw8f8BXiMryHRkR1WRSb583F3G8i7mH2DCtU4eSqLBJiq2iOOyk1KrHYlT/corC99t6mqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gcd8J65i8vMfqwXzXSD63zpDSYFUuSaQAzs5IcQb68w=;
 b=gOJSkMIfYFvinQnhJcutYUUpK8ptWZ9jh35GZVynQ+eP+M2WNM6YdubF+X4P9Dy2tG1H8AZcldSnMMvtekAZhn4K5riHG7zWjEkhIYkfCkDTKPLkAm+piuEIxrwC8QlQTxRpVTlOrrGoJkJ11ZL217iZV40lvaZ5MICJVpLZyM+Ew4W39SXZLb2YGA4/KS9+p3abG86mhO2qd0PtSxt4pIoOu+6uYSGKtpETpPmPfLCCGwNoSsTWuRZ3xHUvsfCOfI0AXSf2J2G/WIF7dIK6qMuixpZOknWRxJgz5bEV3yrzBGZsvXkdRRmD3IsZEF/oIUntQW0YbjB02mR4m4dlBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2de675d-b4cd-1040-efa2-1b8b90448d90@suse.com>
Date: Thu, 13 Jul 2023 14:18:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
 <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
 <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
 <ZK7JwEhrB-70nlla@MacBook-Air-de-Roger.local>
 <6d0ed712-0807-33b6-1586-a0588086c3a7@suse.com>
 <ZK_gHltq-1se3fau@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZK_gHltq-1se3fau@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f64496-b82a-4d15-a37b-08db839b4543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DvaYFcB5H/xDXczYOavqsw5XMW5N2vQKrfPxjcC7LewL/8XZJL2/O+9TCtkz5ClLjDHx8f1XxfXf+I9vKCu1JWDtPqknS0qT74SC5VC8g5SzdNOT7yKcO7AaxiT+dru4k/j7klghafXzOVtSpYgOiG2+1uJdI2qu5DsbvORhHYyhsCwyTqRsAqrXgVKfPcK9bmhqMPDCR9A9Nnwl90J14YA9vnA3qiNDFlqCBT9dAFd4V14oIciwIJ2dSdDe6NLOsm1wAoX3ZT3J7D/qUJ2FLdrUd3Z6jdZ3mufv514guv5uaGAioj/ByIZsrJK3wHW6osMU4bot0dp2HL+28qxuwGVPm1Nfp7ihZMx4XuwXty+7VgbpXsuWlAWrd5lHpCq5op51PeREnWiKzZgnjynwarIR0ElOZRSYvcFMr/UJO5em+OAUJz/mkgi8f88xQmIssTF13YRRQjYtohapdMwfaCchLGVfkvtzBRct3MAZH4LSp9IcTH1YxqodpXR6rgg9YSxPuq5XLJcQlPSBvmqZZrpJJ1TgsDIOFxBJoFpFsdxdYR6iJ95MLi1VHyNRO5PUj2x7RbSX3MdZD4WOaQWLYi5VcGvMH+doZG67q6KAjZXQhP9go6p0mtU0dA7B9WcOOZeiiLLoVZz/haYt9QnNOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(31696002)(86362001)(31686004)(36756003)(6512007)(2906002)(41300700001)(478600001)(186003)(2616005)(26005)(54906003)(66556008)(5660300002)(66476007)(53546011)(6486002)(4326008)(83380400001)(38100700002)(6506007)(66946007)(6916009)(316002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk5kSWdTR3NZVmhvU2NkUXB3UnlSeFJEK05EaU9CdFVRbmxiSWtydlZRRUNl?=
 =?utf-8?B?TTdXNnN2QmJrVEF1ZE0vRXhjKzhVSWNGaXhnWWs0Z21oelRLWHVKOGpUTkUy?=
 =?utf-8?B?czA0cmF2bTVJY0s2bkdKU2NXc1p1bUtJbnhUY1RnMzNhelVxYnFobi9HRTBm?=
 =?utf-8?B?Vlk0NzNBb3hTemlTUWxiOU5hWWxhc0ZYTmNXNDBkdWpsbVh4bis2dGVsUzI5?=
 =?utf-8?B?UW9Sa3NyTEYzMmQzenlnUU5HQXpuZDQxeXMybXN3YUNKMUFUUjNSZFFXOE5Q?=
 =?utf-8?B?QlgwWjZHcThXa2NKNmJXb1hZTzhPQjVJWFFRSmI4R0EvMnZNVi8valFQSGdF?=
 =?utf-8?B?Q0F5b3NKWXBZdWk2Q0d5NGE1eWJDWXhhdmRHNEJFY0ptU0gyV2hGbVdqNmxx?=
 =?utf-8?B?N0RpYlcvTnlEUXlYaTFlZ3ByVmJSTSt3cHhjSzkyUFhrOVVtUGFzR24zM1ht?=
 =?utf-8?B?QjUxaTRrYVVOU0w2TS90UHhLUXlEbUQvbXlxeVRyK0lIR05UejVEaTBwbTZ4?=
 =?utf-8?B?ZFlRUWdUaU9UN3c5dE50R2RjZHhOY0pYMkwwQlo1aHdtMGhMVktEQ3M5YkVn?=
 =?utf-8?B?Z0VwekFVQmhvZzJzY1VsS0FWYkxYNHhuUVZqYTFrSS9Xa1RoSDRjaitIa21X?=
 =?utf-8?B?TDJjQTQvc0wxRXRZclgwdnJGTnVuVTNVMlgvOXVjejRPbnBTV0U0UFYyTlNM?=
 =?utf-8?B?WVM3NVJ4VngvMmg4WVNFUUJwa0JUK0IrdkhtcWdUeDJoVy9ZdDBSeFZvRDE1?=
 =?utf-8?B?bU5vZzZ0b3paN2kwa3k0KzhXenR4MGR4L1hidzZMUGY4VUVFQnNDRk51OW5Y?=
 =?utf-8?B?VXBuT0dkTkhDRWozSUJIZ3BQSXFhS3FTMXBuZGkvUkNWVkhrYUw0SkwzS0xU?=
 =?utf-8?B?L21OUUZGeG9PN3J0NjZmTlo2Zzd5OGJNenpnZ0N6dno2WCtaa2I4K2hOeFhD?=
 =?utf-8?B?a2JUOXFOSUNzUFdFY2pmZ3hnam9kVzNESGFzL1I1bEF5ZE9sdGhONVNhRU1Z?=
 =?utf-8?B?Ym9qV3pOeXZtV3pQYWxsTkV3cytMTnNWbVpzV0Zhc3ZZeld1MGpuSytWVWwr?=
 =?utf-8?B?aVpYcUVzelcweXVqKzZRL3d3c1RreHBpb0YxU3VYNkVQMjhVZzFWeEJ1KzVO?=
 =?utf-8?B?TDVkTXZyR09UTElGT2FWcEVPc3I4dGJucnUxS1g3bGViY2JXWGN6T3RwZ1NQ?=
 =?utf-8?B?SmZrdHpqQWFmSjFBMnE4MUZOOFZ2RzdjdCtQQkRzbmI0MkEyVDFxcUE3UGFT?=
 =?utf-8?B?NFpWaXBla2dRQmRhK3dxSk00bWRTYWZGaWx1djcxSkhyem1XNnpVQm1zNHFS?=
 =?utf-8?B?MVRGc216M1VNY2VRUWxFSDRUVU1kenhTNkFMUWswaElXaXJUa1lHdDAyVUZ5?=
 =?utf-8?B?SXdCY0NJVWVjNWRQQUNDMStOQVJDT1AyT2c3WE41RjE4bEV3UGdGQVNEZnE5?=
 =?utf-8?B?YUR5bnE0RFM0azhCNGgrajZPT2w3a2NkR3dwZVhyLytlZy96d3grMzFJaG1p?=
 =?utf-8?B?UGpTU1N0UkFWTW5vcXJ2RFYzWjh3azdxeCtuc0R6VzRHZ0xVRFIxaWNSbDNu?=
 =?utf-8?B?UnBWK1I0RzRGZFdrYmdINW1jdUdKRmFuMWdhRkdCQ0xFT3VXSnpxOUtBazlp?=
 =?utf-8?B?WXEyRFh5ckY1WXUxaXVtZEY2eW9HTjh3SEVyaTBKaHZmbmw4MWIyTE9ycThi?=
 =?utf-8?B?VDVZb1lRd0ZnbmxXcjhsNXl0UEFLSHRudzNqZHFlZ001RzArcDZvOTF3dCs4?=
 =?utf-8?B?NGtGK2J4M0VUaVhaalN2MTJNZFlBdjRSd3hzeUdsYmxPaThScy9hZ1NrM2xq?=
 =?utf-8?B?WEJuSlZDRGFPdHdOVWJyYS9oTjhFY1hUaytFZ2ZkUkEvTnpCeHY3Mm51OVg0?=
 =?utf-8?B?TVdoRmltQ0s5WE5MU1BQL3FtVWk1S2dYZGJrb3ZnbzQ4bmhXbHBlcjVGaHVY?=
 =?utf-8?B?KzdrZ3BKZ2V5RG53TVJqZ3I0d3FVb3d6L2YxUnkrL21GdThuMzFXR0g4Rk02?=
 =?utf-8?B?WjIrZmlMRU9SU1drUjczTENlRzFLcXN4aU1MOVdKTFdpbVRlMm9wVW1iYUs0?=
 =?utf-8?B?cm9hK2M3UHpNVkRRVWNybUxuaHdJbStTOGxlSnh6dHlDMUtHZGJNdEtaM3hJ?=
 =?utf-8?Q?mchrPHgtfVcl4t8DLuPZXWGy4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f64496-b82a-4d15-a37b-08db839b4543
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 12:18:30.9942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t55SJXWrWUe3uYf6KD2ku3eQ32K2UVBiUkNKW3DteJgiEvfEkfxTTD4G/5PYryj7met7vNbsik2Y1k3fhiPWhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8604

On 13.07.2023 13:29, Roger Pau Monné wrote:
> On Thu, Jul 13, 2023 at 09:49:14AM +0200, Jan Beulich wrote:
>> One other thing I finally figured was confusing me in the
>> description of the patch; re-quoting that paragraph here:
>>
>> "Fix this by moving the masking of IO-APIC pins ahead of the enabling
>>  of the local APIC.  Note that before doing such masking Xen attempts
>>  to detect the pin where the legacy i8259 is connected, and that logic
>>  relies on the pin being unmasked, hence the logic is also moved ahead
>>  of enabling the local APIC."
>>
>> The last sentence saying "also" is kind of odd with the first one
>> already stating this very movement. To me it's therefore unclear what
>> exactly the second sentence is intended to be telling me. I guess you
>> want to express that together with the making the detection logic is
>> also moved (i.e. the entire function is called earlier), but I'm
>> afraid this isn't the only way to read that second sentence.
> 
> Yes, you are reading it as I was intending.  It's merely a logic that
> the i8259 detection is also done slightly earlier, as it relies on the
> RTE masking not being tampered with.
> 
> What about:
> 
> "Fix this by moving the masking of IO-APIC pins ahead of the enabling
>  of the local APIC.  Note that before doing such masking Xen attempts
>  to detect the pin where the legacy i8259 is connected, and that logic
>  relies on the pin being unmasked, hence the logic is also moved ahead
>  of enabling the local APIC."
> 
> "Move the masking of the IO-APIC pins ahead of the setup of the local
>  APIC.  This has the side effect of also moving the detection of the
>  pin where the i8259 is connected, as it must be done before masking
>  any pins."
> 
> Is the aboce any better?

It is, thanks.

>  Would you rather prefer me to drop any
> mention of the i8259 detection being moved? (as it's just a side
> effect of moving the masking).

No, better mention this aspect.

> So to recap, I think we are in agreement that calling enable_IO_APIC()
> just ahead of the call to setup_local_APIC() is the preferred
> solution?

Well, yes and no. My preferred course of action for the issue at hand
would be to convert RTE 0 to ExtInt (under the mentioned set of
conditions). I agree though that we also want to move the masking of
RTEs, and for that I further agree with the placement mentioned above.

That said, you're the contributor, so it's still up to you what you
submit in what order (you could still decide to leave out the RTE
conversion change). The two of us not reaching agreement merely makes
a little more difficult to decide which of the changes to backport
then.

Jan

