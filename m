Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E32613ADC
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433081.685974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opX8n-0003bh-5H; Mon, 31 Oct 2022 15:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433081.685974; Mon, 31 Oct 2022 15:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opX8n-0003Yu-1b; Mon, 31 Oct 2022 15:55:57 +0000
Received: by outflank-mailman (input) for mailman id 433081;
 Mon, 31 Oct 2022 15:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CXQ+=3A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1opX8l-0003Yl-7w
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:55:55 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20052.outbound.protection.outlook.com [40.107.2.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f68c065-5934-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 16:55:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6823.eurprd04.prod.outlook.com (2603:10a6:20b:102::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 15:55:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 15:55:51 +0000
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
X-Inumbo-ID: 7f68c065-5934-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIs+i+ZmvQvvqvVMX2jXqF13+2jFG9U9TlZEniV4ZgcmUbgrh+HB4k1Cn2Q+Te8QSQv4YsY5nnbkO+y+CjjN/AJcQR0b925vwkobyFYkcGN3BsGi+M4gqeDu6AbbCF3LYAJX09m6kt3+tus4i5p3IOapxnczhfWsR1wadwjGPlz01+qNUL0uKYPkdg7tSIQhEya5DtSwIL6yob4QuiKorttiALLtkO7TRQaa/CBKXjS3FLE9Nl60ewjX7AC2/F/vO6jtXqgjDkFigWgSlkYTGbpdTRqbFpJ66tJi6JxrR5v6+vx+fbz0baHvB7ssgbSw6t8xGXone3O8Md08L3Dddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43LYhshjj694LGAizJ/O2VDaAhBGlD3rOZX6GAlF0Ow=;
 b=MR7g2/YzniL0esrvvU7PQ0ZHAu5lVig9cONdz3sUs8sUNBZ2gl6kEkGrDtmWGUIt0lTWEgts++m1lxKuF6onWbjaWnfJtw15nwsc9tuOE7TvzmvcAmclv12lEbh/sUCcus89tevP/bmPlOulJYrFZhWo4Ix9NEaxL8fok9klTH/skn5Yvbn70rviaWBIKVDPF6qSMf3Is8KjDYtQslCWbfOLeqs1oyPDWs0DRol4D1eMYeU2NDS4nI3+XIKWiGqkN6AMcZ17bjv3rlyhW+7z4e0rTd5lAchvjfaTmXh9VseOoKLHUOyPGY4NIqEk7v6Bw1gxNqKdl0am/i0IOahytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43LYhshjj694LGAizJ/O2VDaAhBGlD3rOZX6GAlF0Ow=;
 b=Dq9WEQbcGsmy6KqHRqe0bkK9heDu4O7Z+9tj/g6Ofa90Ff9PLX41y/9R8tIFtxMrUJWe5iWfmjKoSEyb9kIGWRE5mBHNDPWrrX/kRu3zCQqwqKXkQlQj6mjAdZBrxncDzOF2WRykTjh6ObIFjJLKWbmJg6ufOMN/9AYO84INIH/0LsKfKjzx+xWlKh7IC9pDSQhi//QoQqQq6UgzlhJBa7i94jBigo4tRw7oi1zZ81F4kiRa1Y1ERjtKpKKFNYSVdJCs7LqzUyWbK5rdUuh4pQYW3ypNaxoX5MSw2UT3sG+lvy2yiDMRU7AMgmvvRkBOG+P1WeqwLarloS5bWfF+nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d9022ce-4a46-e0cb-67c3-4124e1c0d2db@suse.com>
Date: Mon, 31 Oct 2022 16:55:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: x86/HVM: Linux'es apic_pending_intr_clear() warns about stale IRR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd7453e-cc1a-42a5-0232-08dabb586280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bXPLhPAZiRjXYMmLZh6oH5gs/G0kK8Np0pqbCCmeMW3Ksjk0uuuyddDZCIGQ9UE6V+R/gaGM5TnwWweD7ZAEij/y9/LotlxN5UWwFRmD46B1SoZaS5prvJzJvBQNtDUIfoptjf/0Kj8KhiKvztZb+JXMAPRMCpV9YaEZtHpqy4au7dsQ1QlZHYerW352VqOi/Ct21f2XxHJ2MEzkzlb9R3I6AMGGmbXAziv0Xx4wH3MR3Z6zlhwC/x9PYd0S/QPzdKx9O1oVou3esVK2TjXmUaOop7ouKoHcmE1czRGjvw8IJRtVTnUnfsaSC/FLEHcXIA4yMTP/Y7P536JimM6YPlbQ3rWpmPzqGx3r63zwXAsELJ5077eoPBJCEiyUoRSKw6lbbvvnznyv6/iOdmcWiG0xEhKbPSWRc/XQKAi6Rusk1Zpi8eqqTKMMtSKk16Uh16wbQ+AmvXP7Hgq1mXTBaO5YMuemR5kiLjqi8HELX5QNV0naW1fmMo8ncsxGGD0yZ35tSEEkX6cA6SOl98ZZ/i//LDohx4ncmPziRs6gqeyAR2Y7501dWwhRE62awmJbE6BsyI3aNiF7nCtdaR1XMxnT/rDVnnRKtbqThb/oikr5JQ1fznmDQxTRbmQCP+wzJqo3vDUBXzud6cNr2XO0eIUp/5MBQNrmZo6qjqtqCRX6z9ifHxoW0Z5p6+wXT5X1yF1Rk9vbXGA4K9tKYFu1hLmmO0MkaUf61hvbr4grm7l4yztSzK7cnnopJ0AluygyO9IkAT3FTTbbZnzulSk7RpjT1W7HxJkN6GIGTCnLNQo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(31696002)(41300700001)(8936002)(478600001)(6486002)(5660300002)(86362001)(36756003)(83380400001)(316002)(26005)(8676002)(66556008)(4326008)(66476007)(2906002)(2616005)(6506007)(31686004)(186003)(54906003)(38100700002)(6916009)(6512007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ymd3cUIzQkM3L3d1d1l4RGh0SkhVT3RmODJaODRVaVpRd3BOY2tDbG1KN3BC?=
 =?utf-8?B?eWFoT1JZK3FLazlNeS84RTBsWGZucndaRkhmSUFmb2FXQzgrNndkam0zQjRD?=
 =?utf-8?B?Mi9kT1dIWTJmYzA2RXUyQ0JVdStwZXN0SUlmQ2tDU2U0Z0UrOEpVb3hjMGpP?=
 =?utf-8?B?YUl0TE1VejlSdDJhS2hxazN1dS9rWmdEYXhOWHg2bm8yL1lCNGREKzBTZytO?=
 =?utf-8?B?akZ0S2tsMXVGdWk5YVNyUnZ1aDZiK2JlRE8yUWNMcjRyTFNiOFlicWl2dCtL?=
 =?utf-8?B?TkYyTnpSalBHbzJUWVZUOHl1UEYzaWhFZzlTNlBCTzdxK1RDKzJ2U1A3Rk5Y?=
 =?utf-8?B?THlFNXZmSEg0L2szMmhGU0hYV05QcjI0bDd4OHFxbUlRM1pPd2FEMU5YQVAr?=
 =?utf-8?B?eGdVTU9JUGFBVTdFYmh2N3gxVUp0SVdFR0ZYYlBQSGtTRjdCWjdIUXlGKzBG?=
 =?utf-8?B?cGI1TmZ3SEp4VjFrUTN4Y1JUUXRBb0lJUzVPdUc0NHdJZnFNdkZMcklqWDlk?=
 =?utf-8?B?SGpabnlSUkVwY25Ud1YrUWRnOHhXSS95Q2JETHZzaEEyRHNoUkRlQld4MXRQ?=
 =?utf-8?B?OTRaS2Q1Y25CVVYwdmMwS01NeG9DQStpaW1WV2xyejc0QXZYLzVmZXVFVWx4?=
 =?utf-8?B?cURuRWhEaDAyeTdRMy9zb0tPYk1zQ3czN2pRblEzVmtLYTgyUHQxeW1QZzJO?=
 =?utf-8?B?N3hsSmNlSTBrYno5a3JsdGFEcXFmSGNjWWRTeGd5M3J2VU4rQy9yWDFQL1Ba?=
 =?utf-8?B?aU5aRGZ6K3JHOE1nSUZzYW51dkdlSTVsakoxQjdxVGVJZGJnZ2dhejI3Vkpr?=
 =?utf-8?B?aFprUGs4SFdYeXZGRE1sTkNJVGdlcms3YkwyUnVxb3Z1RXQ4Y00rL2FUVFht?=
 =?utf-8?B?NXFMQ3F6NjZhNnRVOEtWUTJaTnRjUmdleWZaVVR2UFBldkFEOHlBdmYxeEww?=
 =?utf-8?B?RUgxZXMwT3dERlpwcGQxSFhVTElRN1V2ZGxoTWRMenBVSk15N1ZFazBMLzhV?=
 =?utf-8?B?aTVOU0liZkRjRVJQd1AyRFhlNW1abnpTRmZxWCtLWU81SWFKRVhMU1dhZ3Vv?=
 =?utf-8?B?N2FZTmRmMGZISHFVeGd2TjFLcEowaVVmdXo1alNxOE9Pa2IzZ2tWVmg5TWZz?=
 =?utf-8?B?N1RLQ2liMmltWHJXRmpoT0xHN1hsd3pxZ25qeDBEUVkwb0hJTUVLZVplTXAx?=
 =?utf-8?B?VmdPUmVveHlvUnJ4TCtiNmVWQzZwQlRoMzVQYklqZlFXRmpiZ1ZVZ1M5YnZY?=
 =?utf-8?B?UGkvWUtMT1pGN1lCdW9sREdQT29nbURESHlLM2NYN1R5eE9tTVZkdTZWa0Fz?=
 =?utf-8?B?WG9mZW1YOFY1eTF5R2FwdnlXUzNLMmhoODhHbEl4Ykk2RG5ZMk05RXMrYThX?=
 =?utf-8?B?QWJQV29WRTd0dlVEZDJOSW5rWEx4VEJrMU8wekJ2YURWM1JlUlJLME1RVVM1?=
 =?utf-8?B?cllQYmdZYjVuTEVBSW5IRzMyd1VwR0dxdm1peDlrV2h4TWZlSXBwTTdFazBz?=
 =?utf-8?B?MFk4SkYxaldSS1lPSExCUE5NQ3RGSkoxRkNBemdJT2E0K3NUZ3VnVnlFN1BF?=
 =?utf-8?B?WjV6OFdib2RDZHpzc1lDN3FOL0NjMmtoZzJCZE4wUkhXMDUrOGVEa2IvOG8y?=
 =?utf-8?B?YVMrSDlFZE94emZ4SmJvSThIb29wbzZLcjk5d0V5WTdndUJ0M0QyRkdEaTdi?=
 =?utf-8?B?bTZVSXJ6WUo3Q3VaZFJBMmFMT3lpWXQzUzhrbW1xNzFMN3QxNWRLZHBQaDVS?=
 =?utf-8?B?T0FsN3k0WDY1WTRNcGRwdkRwanMxSHNqb0pBN3RSRnNSM0ZvcDJ2ZklieVBX?=
 =?utf-8?B?Yi9oL1ZzdG1GWjhJSHV4V3pwT3N2ZEgyaXBhTzRuWXQ5T0dYQ2RJUUozS1Fy?=
 =?utf-8?B?S2Vvd1BPUmJqaUJqc1MwanZNaTk1MGVPOEVJMWRjYlFmdjBRQnZjQTduK0dt?=
 =?utf-8?B?NVdkd083ZXJRMmxsZVJSRFlneGlyOVVrZnF6d3RIdFJ4L2FNNEt3T2lLSzJ3?=
 =?utf-8?B?eERiL2kzWXR0Tjg1cjJCb3IyTlo2Wnk0L1l2Vnorem9XWEN2c0IyaW9FbnQ4?=
 =?utf-8?B?NTNvc1R0OEhlUlJYNGo3bm80KzF4czJzY3JoZGo5NmwwTUFIWE9EeHh0MVE0?=
 =?utf-8?Q?f11NCM5AvctJiulHvPfeeK4gl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd7453e-cc1a-42a5-0232-08dabb586280
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:55:51.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLkzfuWY0TMUf+dho+z5BwSYfpNq4oUbDuc7gUUVAkSHbhwUFAXsPhRg9KyRSerUkKu12xVCw18IyA8BI9jZ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823

Hello,

quite likely this isn't new, but I've ended up noticing it only recently:
On an oldish system where I hand a HVM guest an SR-IOV NIC (not sure yet
whether that actually matters) all APs have that warning issued, with all
reported values zero except for the very first IRR one - that's 00080000.
Which is suspicious by itself, for naming vector 0x13, i.e. below 0x20
and hence within CPU exception range.

For one I wonder about their logic: The function is called after setting
TPR to 0x10, which prevents the handling of vectors below 0x20 (and in
particular their propagation from ISR to IRR, if my understanding of the
process is right and the convoluted and imo partly incomplete SDM
description hasn't confused me). Plus the function runs when IRQs are
still off, which is another reason why nothing would ever propagate from
IRR to ISR while the function performs it work. Yet a comment there says

	/*
	 * If the ISR map is not empty. ACK the APIC and run another round
	 * to verify whether a pending IRR has been unblocked and turned
	 * into a ISR.
	 */

suggesting IRR bits could "promote" to ISR ones. And this, to me, is the
only justification for warning about leftover IRR bits (whereas I
certainly agree that the logic should result in all clear ISR bits, and
hence warning when one is still set is appropriate).

And then I got puzzled by our logic: vlapic_get_ppr() is called only by
vlapic_set_ppr(), vlapic_lowest_prio(), and vlapic_read_aligned(). Yet
in particular not by vlapic_has_pending_irq(). While it looks like we
don't really ignore TPR during delivery, this appears to be a strange
split approach: hvm_interrupt_blocked() checks TPR, whereas
vlapic_has_pending_irq() checks ISR. I wonder if subtle issues can't
result from that ...

Of course I'm yet to figure out how IRR bit 0x13 ends up being set in
the first place.

Any correction to my understanding as well as any useful insight would
be appreciated.

Jan

