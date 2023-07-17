Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE61755E61
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 10:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564305.881757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLJWh-0003zc-1i; Mon, 17 Jul 2023 08:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564305.881757; Mon, 17 Jul 2023 08:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLJWg-0003xJ-VC; Mon, 17 Jul 2023 08:24:14 +0000
Received: by outflank-mailman (input) for mailman id 564305;
 Mon, 17 Jul 2023 08:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLJWf-0003xD-Sl
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 08:24:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4de6605f-247b-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 10:24:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8776.eurprd04.prod.outlook.com (2603:10a6:10:2e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 08:24:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 08:24:08 +0000
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
X-Inumbo-ID: 4de6605f-247b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0AeQk8TAOSnZugGftqWTJWPih/G0HVAJk8FS5hqwrjosdAoD8oHtUocjqqifAB839kWaECweU+SiMqYTlgPVTIz/07iLFZMCn1h8VF0xCxElVo1x2K4cgJzh3BXT3diLUCaefsXZZk33X/ZVhyZ8gdXy0/PZGyyhqU1dWsanUUNyXObZxhlDTNKb1iJQMZ5KqBVnLtdiDDGvKw/h0e147je/blI+xlasGuBXM+Mtx418IDXvcL7Q6fH9c0GyYxbKA42GCG/iYgbk9taJQnO2bsi1QuT8127PSFm92W6J1fPAq0SRhAeWx6nfXpCim19kDXZsLyZOCOlwdqoSTHtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yuw+Dxn6OwPytOF3eYN8Jek1bRUNjs3qLPEvj93NZNA=;
 b=KEM5m0k+aw/Xo4UDPMXA9wnhajHzZ4oDDINwJgUPUOj9dANkIYB/KiPLrkJnHiw0sMHtm1e1EbgdgCkUZNkFGkTX3wXM3mScCmjhd58alO8/C6iG8KKuPSbUwWnI9y+ICcyMz2ipSbFjHHvWejCIYgmJnarWYwJINM+r7ektpgTfrGAsdf66aaZaxIOS2Mqh7f2NyX7UURNaheEQudiA/pHTVwTsYvToF4Jdv/6DZpkA0E3H9iGeIPnVVC3N7L3pCtuVrLiVlkcNIXvhw9jIZ4TwQzvQatAVJxBfrFEMpbhBCWGLfFCkn+E6k4EsD+aNQ6D5zlz2yWITDkFzTXJtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yuw+Dxn6OwPytOF3eYN8Jek1bRUNjs3qLPEvj93NZNA=;
 b=KfYWS50n8a27SRPs0v4YLwu0HOIQI/+7rfQWTwVC95e02UF6mch2B2iEEc7VYqIIunUxD4J4tk22FUdJDMQpQEPYu8bFXlIkh6PFpgFj8iVf2KaejuPPAhc2r9F1NKx29NckPQSww+pCzr3rQ4vbjNMWfSweQC55GA23Uv6K8oKzzE6ahozvANUreBqGlOrFY5eAOKqROy2/DLiR4M0CcUIbZMkLm+FuB6cKENVFBKn7jumxpB/Xsh5M4GYYCxKrtmSmAt7fBEVZyxjw93nofLNmpxc9NxL/YvejNmGgxUSXyRrkn4lulhNmg4DIrLUxwPZbySV46jdLZ9QyqPaOXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de7c464c-95d4-23f1-b33c-1cf888f6b00d@suse.com>
Date: Mon, 17 Jul 2023 10:24:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] x86/ioapic: sanitize IO-APIC pins before enabling
 lapic LVTERR/ESR
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230714160314.71379-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230714160314.71379-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aedb64f-8b4b-43b9-6dfa-08db869f30dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jLjYZdnV98YREFJ1Q2VAPs/dMnlJdinmVqjPmbu9rE82AxP35NQd+spIii8DBUIC3hmIriq/4J5En3SdgsBfaQMzt2EXw+6L5zTB26MAvSSTxqOeiz1NPhPihZjVZE794cuB3JUHzDRO/akDmv3NNEmODaRC5c9Q0p0t4Cu6GuBPLc152YIclsMSNYSTntfn4Eqqx+jqAZyCkp2GYiG5C3zUVyN5UltXdfDEFE7DyCTHWRwRZFPM/P4HMvAeO5Y5PCwwAcPgpFIPYwxjtCLLCKt18Ytdmu+U/tYzQqa6TAgK1y9mKxqOL9HrX4bQqa299xvcOep9VXOpoHuEB90c+8VY7ESAm3YpeoygC1AxphP87m6xCv73mqzGtOc3WYSmDK6xbnPY7JGTZdp5D4O6KJoxgUxKOb9B46POgZgeO1/m7pLEXwZQqnq9/Vw5fUwX5MdZLdsjXnfWnCOCSaUcUg8xA0hxieJwJ+flfwpm3lCQ5Rx7usFvHMtH58kl03QAD3zaf99uik2hZsLiybhjeG7o/ecqLVpZkQR3QjK8BV65o51pSCbsGYmw1J/ftKs03aaH74V+VmjpN9goy1t4sUGk20l77b/GdaiF6FYpWbFk0ZDvanifmOy2drqDcAVuk1+uMRXjOelwGbBORiON2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(366004)(376002)(39850400004)(451199021)(31696002)(86362001)(31686004)(2906002)(66556008)(8676002)(8936002)(66476007)(5660300002)(41300700001)(316002)(6916009)(4326008)(38100700002)(66946007)(2616005)(36756003)(186003)(54906003)(83380400001)(6506007)(478600001)(53546011)(26005)(6486002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUlDeDF3SEJkUVNpWXBmQ2dQUTkyWDl2NHJFTzY1a1UxQmhjcE0ySGE2QjBC?=
 =?utf-8?B?Z0NNSU5XK0orSk1ldk1qNHlpM3JFaVJpeENwNEJ4RDA4a09RNFU3MVF3a05F?=
 =?utf-8?B?d1Byd1g4eVRJUVh2cFdmSW90ZGdnT1N2VGFNQ0VGSmw3S0taSEtUS1d5dG8v?=
 =?utf-8?B?M09QY0ZEQUN2WVJrOUNTd21zZVJLM3VVNVhNSFp2YTNtVmZWdndyUXdjRndp?=
 =?utf-8?B?bUs5WkJYTGRaM0o0a0QvbldHN25RUnBMQmY2RU0yWUNtRXMzcWlEWEdyVWdn?=
 =?utf-8?B?dWdtUXZieTZ6d0Ryb2JuZjdMZ2FINmZxRndBZitsK2NpWFA2Wmw1RnpoUEFw?=
 =?utf-8?B?M0pjVmZ0Z0t5QmJwUU56cG5tWkhqaUtZaGZaMUpoemdXd2lrNllVbE15U3Bz?=
 =?utf-8?B?Z3paaEdBdnZYU0ZheGkxQmowVS8vMXNNMDlaZjhqOGZpZ3JWNS94TllzNUtQ?=
 =?utf-8?B?enZKejMyMVR3UmJ3eE1pZzkvdmVxRHQyblp5K2FyZFh4ZlRhYkVhNnlrbnIz?=
 =?utf-8?B?OCtaaTM3Rnk5ZDFIdDR2NjhQSHJjS0ZwZGFCUHdwLzF2TjJ4WXhQSnQxbGJn?=
 =?utf-8?B?S1hWREE5TVN0SW5MTnltb2phbGF5MzZyamJPTzd2akRrZmFVSGhudTVkMndw?=
 =?utf-8?B?Um5NMGFJb2ZCNDVyMm1ocjlkZWI4THJqUEdRQk5vNlEvdko0UEt5Mmo3SWdP?=
 =?utf-8?B?MHh4MG4vZk5jMUc1V25IaWpDRVluL2ZsL3pUclAyWVBuMnFSU0hCWXNHZi9N?=
 =?utf-8?B?Q0ZaWk14MjBDOFZyWUY1UkRGdjdSRlh3R2xVcUFFOXpmSFllTG0wUDRkOEQw?=
 =?utf-8?B?L3I3dmtFUUNzOXNVOStqVG5HU01qeUNvMU45c0xkdjVkV0t1UGd1NFdJZGhj?=
 =?utf-8?B?ek5ZdHNBY1YwL1RZckRvNXZlVjM0YmdiYm9kNXdNM1ArU1BXdHR0TnZtb3Q5?=
 =?utf-8?B?c0ZvZVlSZXpuZk1lTUxhNDJDK3RDN2xKWGQzdXZncTZ0bnkrQlZpMmJVbERQ?=
 =?utf-8?B?OWVQbDlmbjVFcDZvQzFqWUEwL1AvRUw5V3JpeDBvUkI4WkpFYyswY2E3N00w?=
 =?utf-8?B?ZFRGMjFHNDVPaUpFWVdpK3hFdlFvY1JvZk55TkdjYmJqczIvSEJiQVB4c1Vm?=
 =?utf-8?B?TlprcGRTeldKRzhhbzhiZzltVXN2L0ZpalAyMWtMbTZvbE12bG5xZEsydE95?=
 =?utf-8?B?cXRCNThVRFBHeUJFd2tBclpWNHBxMUZQWElrbUpqY2hhWlc4dndUSGZPeW1U?=
 =?utf-8?B?TzdCVGRpTTFVVllWVDdOV25CV29GSU5JVUhhN21aOUtBRGZZRG43ZXhIc2ht?=
 =?utf-8?B?dVIrb2hpUmJoTnZtSCtIVUk0MS9nVmI0UWNCUDZLMHk4d0hkTGF5djJpZnph?=
 =?utf-8?B?cm9lUVBCNlMzbHVQVDh3elhYS3RjakdRREdWN0s2dlpHU28vd1hEUkxsUFhn?=
 =?utf-8?B?VmpLd1hEMjZZN0k2bzRzNVZiWC9CVmN2VTUvcDhmVWNQRHBzMDYzZ3d6MjJC?=
 =?utf-8?B?TDdGSzFYOFNNbzVYMVRoaU9kQ3JoQkN4cmdqaDJqMXoyWFI3U0dmUk9VTjg4?=
 =?utf-8?B?Rk9pT1JpSkdDTjJmZ1lHRHBTSndkWmdVdFJIYWxZZS80RUQvRDBKbGVTa3FJ?=
 =?utf-8?B?alZmZHJldUhSSlhHMzJ4V3V3M2RuZ2hXcXFBelQyVkZnS2VOdTNVSkV1VUJO?=
 =?utf-8?B?Rm14ZlVTMy9JSUhKVzg2SkxWL2ZQMm9LZlhiRStjcWdyWXF5VzFjUEF5TXhv?=
 =?utf-8?B?WGRnOEM1RmJYM0JvZllvbWxOUUxXMmZTSUJtTmRtTWh1L0FmZDBOQUd6ZExD?=
 =?utf-8?B?RC80R0FIenI2VjhheGlSWnRlaFAvTC9UampiWHV0U0VERXBlK0JyUDN3ODAz?=
 =?utf-8?B?R0ttYy84Mm5aKy9MVlUzZTNqcHJzbFVzN3BHeklWTGlkWTVnRXQ4RG9yNzdS?=
 =?utf-8?B?bWhhL0pFWkdldndXSnZ3MHhEUk9rdXR5YW8vRGVVYzZFSG9hQmlNTjF1WSt3?=
 =?utf-8?B?d2w5NXIrRUlVbWlyWXB6eitycWRwdlZZVmUyTXpma0lzWkRxSUNuUjBENjBU?=
 =?utf-8?B?b2p1NkRNRlpRWmFTeGVkRlllVUFOQWRQbXVXUUw3YnRxME5NY2h0dTZyTnNr?=
 =?utf-8?Q?tVo1IcRL+Ut3/MKKmk4llk6lr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aedb64f-8b4b-43b9-6dfa-08db869f30dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 08:24:08.1692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJCbLP5ED8KksmpWtr2YHF4TaDhR/G7n/8fTodaw8rnkdpDsyRPwiE0nZlLsFKayMBhU9kNoBiUyNV5EWz93ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8776

On 14.07.2023 18:03, Roger Pau Monne wrote:
> The current logic to init the local APIC and the IO-APIC does init the
> local APIC LVTERR/ESR before doing any sanitation on the IO-APIC pin

Nit: I guess I'll take the liberty of making this read "sanitization"
while committing.

> configuration.  It's already noted on enable_IO_APIC() that Xen
> shouldn't trust the IO-APIC being empty at bootup.
> 
> At XenServer we have a system where the IO-APIC 0 is handed to Xen
> with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
> with a vector of 0 (all fields of the RTE are zeroed).  Once the local
> APIC LVTERR/ESR is enabled periodic injections from such pin cause the
> local APIC to in turn inject periodic error vectors:
> 
> APIC error on CPU0: 00(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> 
> That prevents Xen from booting.
> 
> Move the masking of the IO-APIC pins ahead of the setup of the local
> APIC.  This has the side effect of also moving the detection of the
> pin where the i8259 is connected, as such detection must be done
> before masking any pins.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


