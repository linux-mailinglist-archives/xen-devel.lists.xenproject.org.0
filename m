Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE9587EDB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 17:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379387.612806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oItbp-0003dB-Am; Tue, 02 Aug 2022 15:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379387.612806; Tue, 02 Aug 2022 15:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oItbp-0003b9-7t; Tue, 02 Aug 2022 15:15:01 +0000
Received: by outflank-mailman (input) for mailman id 379387;
 Tue, 02 Aug 2022 15:14:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oItbn-0003b3-H0
 for Xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 15:14:59 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dedba071-1275-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 17:14:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3633.eurprd04.prod.outlook.com (2603:10a6:208:c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 15:14:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 15:14:56 +0000
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
X-Inumbo-ID: dedba071-1275-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3t2LH9reOGoQgaLSMHlLPViSGnaQBhxV0Oxxotr6QnitepZ7eSuXtQifm1jXPnioxqtGW3+24CK87tryeNtV7zFapetX1cS2iadC32FidHEiycWkjTG+hU4Wq/u3xPZaQde05lzgOp6+JkP6ihLQm9stJQWg0fwyiae26RQVLPvPef5nbpriadSZB0EMR+Bp7XjFpkVgjUUhQxv6IXXSa5LvWlXTxPMFo4PPuUp5cxXas64jZCRbOexcBVtOeIAYLk6SMSGYIrULAoqtwqbPiKSYhGOT4c4wABgZSPlN0EFbry2FJpyPkD5lslzI7J0DUPq/ZlA3YYUy14nJdgv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YShD9U0wNmUij6YaJtB3efLoxcIMfERPZcluDiOLoA=;
 b=gcLV38IUsVfzM8QeeotHq8dCstejj6KKw9GkLtwYJhVTiwPW2llw0SOoWaHV+nvJ/zmNy1aBV+6sveEiR7DEk4bgL8xgukKE0gviDBFOPpzaZiHiqH0sEAVzy59LAf6CRtloJ1+4VjZ5CmeGsUtQmnFDW+RbHP4i73dsAozIz3tDuL9NkjxVoA6+z5u3vOsvUSMhHKKCUvHeKTY4Yt1ZSF9r30ySSn/GW0Df7LmDJvbnN4VB072FhBBfG97xSAoCL1/kZ8QLaxXJJKLT8iIzOb5TN1W90p8W5r5XGwEz6+OjEJG5cEJ6mEAqkZqX3mmatcAmZTeNOhGYFgvXTrYa1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YShD9U0wNmUij6YaJtB3efLoxcIMfERPZcluDiOLoA=;
 b=mjiWJ81C42xzSt2ua+BnJql2eGaiXnFgLvV1TGX5XO2MijvWCB4pokZu380Tx+O4/EpnbpIY/iewUIQaHx2tb2J67sXE80NxKoSz9vZ2N+UF/JqL+m12UyFgLrHMMTGJMQjoA98K9lPgr3pTPwVcsR2WXlom8FtCwTDgjJUQ4EQzjymw1c+JRRQlF9uPZnGtqE3qZD75UNyl+ad7T4x94fFdHS3eZf1A7AcxmmOPyA6NTWAiFdtUl2enVX8BPgMwqj7x52ccUqS7VH3Yvdde6SOYtHwg/RH51TfCyslJWMWz5KVTs4kbeMKlciILSWFvFCLUvlbvjYWW3kly1NnGrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87c86770-9244-dbad-23ba-d449b2c3ccb7@suse.com>
Date: Tue, 2 Aug 2022 17:14:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Content-Language: en-US
To: Bruno <brunoce@kolabnow.com>
References: <7331DC21-5ADC-4785-B663-742C53710C2A@kolabnow.com>
Cc: Xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7331DC21-5ADC-4785-B663-742C53710C2A@kolabnow.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a5aa5ad-0c36-47af-4fb2-08da7499c221
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3633:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xsrglUTnxVEIN5V5xIyvZdSYHJpA1SiiWkRFENtbBvxKOgaJYuLY2v0O6wnWTcVTWPyUVQ0KWqHpCN8ghwGdzvgBSLC1EoX8jYW3H3UK+4ZEVVxU3UlULKTX2BLZAcX8+g33tPlzuOMMtYOInetfSk8T7OkiFJQVw9WfaEVFgXW0WCSiEYxj8pLbJziofUgHFLZY9cqfeUt553V3tmxocGORKjMfSqQLeobKjpV1HeQb1Ee9/EO8idf8VE8lmoo3n/jca1ZlBeB2NFD1Il0ksgFh6+f0eoRoOfw6O9qhBt3+H17uynEZqWMaRF3v9U6Uk1eM2Gz1I9fp35O7IH5qDOZ5+6n2hVRZcG8ymGoK3PBsVjyMFzeSp+MFiSaBpWUxWQ7dBlOK3JItYUyEw3reCq5b7GNNnyTMc/bbirLdzrc0gxqJj9a+3ipjTr9Z/RwOgkOlAd7AftBTVDZz1ovTP0giFhgoBXOh1cQnZOVC9BE9xDHPrUDp4ac+PlKl6c2ZxDXvcQ5tBErxlxBszA5uROzGomchYG6zgiDcj23ju8V9A9pgAJHo4alldRSPddAh/O9uZnpPaHGvpu9O02DX11IkO5OfjE9jgOCILP4xXTWBAktTOUAT3p6PnDFnOWSvvNKWuRSarfMCr4xtqOEWPD+gusd0GaMgZ+BqW9GFOeRs2j5c0FhtbU6jPpumccD/SX0p/4XDTVE514CarvDvBSPeXdXyJjxMq0dcunDU8qoUH5qgzKZfnm9rObCqLEAT6ubDfa4XHUXGiL4PjYTrPq54jzN34C4+jhtNt/ysbjMtg3qe+doGiPUxxNrz/yy87v/pfzWOhALJQ98O9TLK/CzcwMbAz/ADAkOkFq9N6jo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(39860400002)(376002)(396003)(8676002)(4326008)(66556008)(66476007)(5660300002)(316002)(86362001)(6506007)(53546011)(38100700002)(186003)(8936002)(66946007)(31696002)(26005)(6916009)(2616005)(478600001)(6512007)(966005)(36756003)(31686004)(41300700001)(6486002)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXl5MHJCTmI3WDVTSjUzOEhCZndvZXBXVzJoMFVMeHhZMzNGc0VxeVZsWk9v?=
 =?utf-8?B?WWNwazVLNVdLOEVFYUk5bHFuVW40RkZvRmpSQ2hHdlZ2MFNoQVRyQ1BDMTlt?=
 =?utf-8?B?SHNVdGduRk1JSzRoTDVRMGdvVzZyTXNkeW4vbHRldG9VSVNNaEZ1NWtMcDNJ?=
 =?utf-8?B?UGNhUm1FSG9WSFBJT3lJeWN1ZEk5am9BSHV2YXdqOXdveGQ5YjAvYUxUN2dl?=
 =?utf-8?B?cm1WQ0I0cnlnT09VanY4S2c0bW90ZGpxb2NBOEdWRzRwMFg3MVJYMVdubHIy?=
 =?utf-8?B?ektRRWFPOFNwbTBiOFBBWFlHRjBvL1FaMDV2bW56UzFkRndkMklyUnQ4REs5?=
 =?utf-8?B?clVJcEJxcEhsTE1xTzIwV3ZMRHRwQkY5RTFnVC9sY3BDcVNaS1Q0QjdqUGFJ?=
 =?utf-8?B?TWtOUHp0YW4rMlZpZ0xxcE1SODZEVUxxWEJPajN1Qmp4aUh1QVVzWDRrdTNX?=
 =?utf-8?B?ekdvZEVEeUZJMUJqK0kyU2xOU0Q3ZFl1ek5Zb0s4VUtSdDZIUWdWTW9xSmxs?=
 =?utf-8?B?dy9nR0dLNUxOcmpsQXNPVWVGV0JKY0NzMWplcEYrdG1wOXhUaFlicWIrNDAx?=
 =?utf-8?B?N0h3NytrMVJnclAxWFE5UHNoQkVGbExtSTFnN3Jua3dYQU0yMDYzejIzTWhr?=
 =?utf-8?B?QTdxWDE4YjJrY2pBRk5ZSjNuT2tIUnRiMHJ3bk5ndE5VNDRpWXlWYTZ5TUlk?=
 =?utf-8?B?TjZHWk0zSnU5N2dmaGpXMm9wRFhiUWVOaThucWhYWC81KzJiakpSRlljaFVB?=
 =?utf-8?B?dTV3dDYzV24zYVYrQXIyb0oySldmQ2ZyMGNFRSs1L0N1RDdjVlJxc3ZvNEpF?=
 =?utf-8?B?UWFJZGhJNVJHY1YwQ2FJQWtpS3UvOGpWSDlnRkdOL0JiWnhhNWorUC94a0xr?=
 =?utf-8?B?M3Q4bi9GTXM4OUl5dXdYeXByWGpZKzJiR3VMMkFVNC96cjdpbEdwTHE3dkY4?=
 =?utf-8?B?cXJmNzMwa2tYamNQWDdNUkxKVTV0SFNYalVXaWkvYTIreUFlVTV3UkkwNkVS?=
 =?utf-8?B?MXhPN2VyMTdqbitTQzNrTkRPQ0tmbkVrbHJ6QTUrSFhKaFhyeDhEUFBsTHdV?=
 =?utf-8?B?T0tnQXNFZENFdHoycFFPWTY3Q3hYNjR3TzN3bTZUcnNhVTZ2UzlqaWxxS3h6?=
 =?utf-8?B?NjVnNTlpRWd5UmNrcDNabmc0ODFyaThFa0RJN21Ib3Z5QlhtRHNRSEVkbTdL?=
 =?utf-8?B?WWZPQWFFRjNmSUtRcTNVblpYdkFaMXlVZXpjRkhVSGtOdm9TT0hXVGpERHlI?=
 =?utf-8?B?UzZrc2lweUdDL1dnQUlJTDBLQ2NnaHVkemxMNlVBQXpxSHpoVkJsdThEb0Zk?=
 =?utf-8?B?Z0tqdVBpWks4WHFXZXp2S3d5elNRa3RZYWpLRjVnY1NRYU5sZHhVN1hoYklr?=
 =?utf-8?B?RWhhRTcxbUVoZnlMWVBvRGc0R2REU3ZYSDRIZjh5S0J5Y1lIU1p1ZDZZaXdG?=
 =?utf-8?B?M2NWcFBWbzVxbzJVMXpmR0hHU2M5NzdqNGcxY2kxeTloTk1SVWtYU0FnbU1H?=
 =?utf-8?B?ZHhiaU96RFFIdVNreTBtZm1jZkEzZDM4R28xUGtEaHVmOW1ad3RzZlRrK0Vq?=
 =?utf-8?B?UExrRXVlRUJSWkNvOHk1ZHZyQUNjbzBqSGVWU3cwZTFIbG82QkhXWkcvRTly?=
 =?utf-8?B?Vk0wWnFiZFNVT1JrN3k1RGFRV3FKQmVvelpvbUFuM3VUc0Nxa2ZueU8rSHM0?=
 =?utf-8?B?L3ExWlYxVFNMaFkxc2M5eWR6ZEhQTC9IOTBDRGFPTGxZNFB3TTRLUStDQWJQ?=
 =?utf-8?B?bzFRQUJneEtJY3pYTHFMY2NXQ2pkZ1h0VmlBL2NYR0tIbjlGRnpOTHQraDly?=
 =?utf-8?B?anNsUFRHSVNRRU9IRExsT20vUXhOQy8rS0E1ckVycit0bGRHZElSUVlUTzF2?=
 =?utf-8?B?bWpsMlRpZFdQZ3NIc0pISTYvQUtBakxscTNPVm9EQlk4WVRIQklncGFYb1BZ?=
 =?utf-8?B?dEQwKzY0KzN2Y3NvMjVwMEllZ3dYMEZBQ0hhbTJkUWFwcWFnQjNiTnNueTZT?=
 =?utf-8?B?TFRaamhDTjB4ejU0a05pVzZzQnp3UGphTEQ5MC9SeS9rU3RYbU51OGtzNmVF?=
 =?utf-8?B?dUxMOS8zTUJmT1BOeVVlWEFQek1uNzRRTDF1Tm9GbmtNY3hKTklkejZMWEdE?=
 =?utf-8?Q?TW1Jj+TYaDPQDeHlToKot9Oif?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5aa5ad-0c36-47af-4fb2-08da7499c221
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:14:56.3690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Wmq3YXvCqXq2VUUF5GYo1TghZ5lgTtiFtoTDOPnQbAiVW6GaIFxJIcdPm9ugYGdU2dJEBuNTwqXWgXYllqAfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3633

On 02.08.2022 16:06, Bruno wrote:
> I would like to report no compatible firmware for a new laptop Acer Aspire 5 A517-52G.
> 
> The firmware problem I witness is ACIP errors. Xen does not boot.
> 
> These ACIP errors lead to boot into initramfs without mounting storage capabilities.
> 
> There is extensive logs, dmesg and attempts I recently send to Xen-Users and got a lot of help and feedback there on a long thread of attempts, but we have hit a lack of support at this point.
> 
> https://lists.xenproject.org/archives/html/xen-users/2022-07/msg00061.html

Can you please post relevant logs (and other information that may have been
worked out already) here, rather than having everyone who reads this dig
through a pretty long thread? Looking at the first few mails there I can
spot a kernel log, but since you're complaining about Xen boot, I'm missing
the hypervisor log. Or are you talking about Linux not booting when run
under Xen on that machine?

I do see a fair number of ACPI errors in the kernel log - it would then be
helpful to have two logs for comparison, one when the kernel is booted
natively and one when booted under Xen.

Looking at the tail of that log I see an issue with sof-audio-pci, but I
can't seem to be able to associate this with "does not boot". I guess
information about this _might_ be found in the long xen-users thread, but
as said above - please extract relevant information and put it on this
list rather than having everyone go search.

Regards, Jan

