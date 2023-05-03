Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757686F5B91
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529322.823609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEnt-0001qe-3k; Wed, 03 May 2023 15:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529322.823609; Wed, 03 May 2023 15:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEns-0001oR-WC; Wed, 03 May 2023 15:54:05 +0000
Received: by outflank-mailman (input) for mailman id 529322;
 Wed, 03 May 2023 15:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puEnr-0001oL-RI
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:54:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b85d7bbb-e9ca-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 17:54:00 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:53:31 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:53:31 +0000
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
X-Inumbo-ID: b85d7bbb-e9ca-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjb8BEJj0PYX7jh5eTsnRZYJT/OqHwLu1yxqLdmcEoz3+b0vR5QJ4irQXi04nd/F39NLnD0A35wsx0MQDVjgeiNkzzPcB1BD/SRVSygfIdSdjLMfWkyllKnp5ULtofG2RENazC8pftLy6Vwp1MqNevIeKCxiNF6+w5gT7JNYyqVCAuzvIo2seDo56cWPRRH7urzAwMkmXuARUTWL1ecgGLJkDLGFZF9VNzwqU6oOYAfeP6+6i41e3GT88ihr3OFatS75alePmh/4Ockdz0mw8DY/HpOly25xpbgpFZy93JhF+hAiY4huqYtJ1LhOC3qNpm1IVwTjoYdHFHUDygJQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q1JcwX+Pu//DS9SDuAr7savIZQBK7Vvwp/Ti40aPT4=;
 b=BtlQrmpw6JlLjgYKRNa0EQNrdNfaih0UMFhfclqidS88MN5woWRMBVvBXZWE/4loVpph1q+iKWbNK/QZFGVnbku7UFASp3YXvt6sdwNQ0JcHQIUDdPj8BHDGClvnmClBZaGFc7f+ZX7wVGZFQ8SDiqN1v2O3bSGPDAmpwc8sUIQ3MdWINyPIYPiZSVYQbw9R3F/xThhc5MT5VgBQrqVvpIonDQSXrGivihmzDQ8ZvFlWuAORCMdN4nKkq7Tb6BWwcL32NP7fSf0dnsNoFB2ao5UPIUX+g/ViWowEdeoUF9Mi6x2Mb7Bg+6ZwAIhbinIjy7c0dUEF02vzVxLKFm1FRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q1JcwX+Pu//DS9SDuAr7savIZQBK7Vvwp/Ti40aPT4=;
 b=JRgaaE2k4VlhP2MKPwoVmj1rHn0FWA6lSyc/dZVuNFSanSJI7c33644RuJMM2MdLX2jE1ufzlq4STsWxJGWGXVPmzSE5tcjqVXYSHGpAdkMZlquu+Yqxsax8N6PRHRhRvH572yZKx+xKHBzVW3v98SeCO5HJODf+ZVQdNjfibJ08opjJAICrdEnqVSHOr2JJ1NWVf8HLi4bxtGtkV3nKpgnFEKzRwTgEyNnbCaLwi7BZ7NIdTYYku1pUWY7XpElAudrFyIA3PaHpHcPJ2GcPYq6kZ3bFNIRWj0f8Z+loX4QQu/eK0vcgOuOVBys61VJ+osrt21kHYD4wX3g3kbaUaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
Date: Wed, 3 May 2023 17:53:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/8] runstate/time area registration by (guest) physical
 address
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ab90fe-81b6-474c-a200-08db4bee8b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XrrkzfdvYkXBQMMtx5RdXqr293tjkkXppdHW4t7rGB5z9+eN78f9SfFU7qk9gkSsdEvtEzIudKG8jRYBz96FVqfYrW66ixOt+xeo/CKiYWd77sn3pjTlbHtvkgj0TD0iO2ef017/ow3jK9Qs/pUc8+4cWOepoGM1gBVOrn3g9IkEyJSngW62TwTuNFSH7vmkQNtEeut7JUugmscN4DyuZlPptyNWsdVUVuy2+TsdL6HpBmlr1LL4ltXmcKsgZzMbCHJr9HGd9rQuzBqnSbN8aPyeJAUBa1P5wmOUM8ajBrKiufiTyqSMjsOAaYMXfzOSyui/kryAMdzt+GeMF+6DJb5AgmvjzVO1USdpAmql0hnKtRPBUxd8Bh7lpek8Ro7t5Jphbe3cIYaF7Ve0ppTEXLWooSSjIBzYs9gmJQbT44KYdI7VDwH6dSe3RmqIL0v869UHVCvmv/Ah+ILXeqsLNDL/v+zldXSrSrJjggaHs3m4pSwyaRu8QLeutQ85ygNqwh84cUQDaj0JPYmMjLptSR6F7MJv4bKzNiAScYoIu8nLfKEeVLyeMqg6kegoVVeBv5KFV/embj20jI6C+72hPHuL+EOIxLYhCaSsh1URlzVmIkALmFzGbczJeqcLjuev8pdAKA8+/nE/kO8X9Flu4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(4744005)(38100700002)(2906002)(8936002)(8676002)(5660300002)(31696002)(36756003)(86362001)(6486002)(478600001)(54906003)(186003)(6506007)(26005)(6512007)(31686004)(2616005)(83380400001)(41300700001)(66556008)(66946007)(66476007)(4326008)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUxqQzBqc2kzNDFYeUpNR29kQnFKekY5NmJUTVpDcTZuY1pKRDhFSXRlTGJI?=
 =?utf-8?B?ajhjOHlMUTZiTlpXdC8vOCs3dG5lOGh4MVpYNXFtd1BhZjFaNC9BZEZkU0Qr?=
 =?utf-8?B?RVRDRmtlYlFtQnhUR09lV0NhQlB1N3Y3U2VnQ0FlV25ZOFM3WFlvdkZOMDkz?=
 =?utf-8?B?bDlNbFd6ajd0cllKS0dGMDBhbkdrdDFlVEN3VGF0emtEcTVvbHVSbnIyVDlT?=
 =?utf-8?B?U292bTVTeEhuNDhhYlMxM2d0dU5ISVFJVE94dGJFSzdwTEN0Ky9HZlV3dmpL?=
 =?utf-8?B?RDlUck1HNzd5R0V1MkhGcGdSOVUwQ3huOW5FMGhOZWswckVuQXBBY1hiTE96?=
 =?utf-8?B?bzV3T0lOZ1BBc05yMWxaa1c1RmRKcEg3c1JZY2NrVEZUNFQzNW9QSlJjUk5J?=
 =?utf-8?B?STZIMFVYV210enRnejBHNTk0MlBpQXVZdXRLOG0xSzRPZ01nRmo0QWNGd1NP?=
 =?utf-8?B?elFyTG9EbFJsNHU0dGhTbUpCWlhJZDlraTZzQUxsMFhBVy9RNjJnUzExd3d4?=
 =?utf-8?B?MXhTVGtaaEFHdFkxaHkzOVdBY3BPSVV1MWRlYWg5d1plalE4dnZDNzE4NW1X?=
 =?utf-8?B?eEV1NmtCWEp2ZUhMSGFzNGx2RUg5QmxxZWVJcEpNWnBOZDJOTkZWN3ZWVFcv?=
 =?utf-8?B?Wi92QTNFWHdPdW9NN0dIQ1dCK2RvM2F3NkxWSkcxOU5jRUlCWHNJd3NPMmQ1?=
 =?utf-8?B?bDB3dHVydnZucG5jajJ1VSs5YjRHbHZNejlKUDZLUCtPa3hTRlJQOE9ld1Zi?=
 =?utf-8?B?YTVMSHlDQXI3SWVQUnJBRUVTTCtLUnhxN1NPb1BLQWZGU01weGFjd3VaSVc3?=
 =?utf-8?B?TXZiYU9nNFY4RHprRitRNHAyUWFkQjdJS1NVRWtRVmhuRFBZUDFMZHhPSnp1?=
 =?utf-8?B?c09FaS9yWklsaXpwbWlSU3YwYXZRZDdUeFZ5akFHWnRaTUVHMVlwd0hHQjJy?=
 =?utf-8?B?Wnk0dnhrSEYrYXViYy8zQzVDMGIvZEJ1bVFxeTVySTlycXloRTlTUWh5Qkkz?=
 =?utf-8?B?TTNYbzBvVGVYcTFrcUtrME9sS1dKa3UzbHFZRi82MHl1S09DaEJxRHlwVVFX?=
 =?utf-8?B?T2RnZ2wyYzdWKzNIekV4TUNjQzV4OFF3UTB6NmMvV0lDcWI5S3VTcmFjU1Fy?=
 =?utf-8?B?dzFmNlBlZ0RzMjQrMnA3OC9FanpHK2U2UWRJL2ZaNkZIVER3UlR4N1lTOFdD?=
 =?utf-8?B?Y1NxTFV1Tmp0NC9xak42M3dCcDV0UXllaTV1bW1TQU9EbDA4a3BFSHNnOW1I?=
 =?utf-8?B?NXFqK1ZYRklsY3l0NlMyZG5TdlZCK2UraVRwZzF3M29kcGhWdmdXa1pFR0xJ?=
 =?utf-8?B?Z0NqMEo3aEJybnQrMTZRZTR5Z3gyam5BQ2twNCt4elFTMzJvZTk1NnhZdStC?=
 =?utf-8?B?dGUzcUJVWTdqeW0xZkM5QlpJSTliUHJ6T0k0TWJqcllJeWx6T3QvSWJaZDZH?=
 =?utf-8?B?dzRsVG9vT1hDcEh6WUMydUlPcmZWeDhUeUhsWURjWWJ0REhOcEtnUjZrS3VR?=
 =?utf-8?B?S0JQSGhlV1l6SGRVMGhqYmhySUxWOXZ2eGZhU0kvVlp5endFT0pMN3NkM0tn?=
 =?utf-8?B?S0JoTGNjTzdFS2pNTUtKbXpsZnQ1MVducnhBMHA3aDg2cWJsWWtjT2N0QXlo?=
 =?utf-8?B?QlVDZEZCdWlhdFBrUytUN3haRXlIdGt5MWQ3ZGZHOXRWWW1ubEZSNlB0Ni9m?=
 =?utf-8?B?YlhQNkFWZHlraG5kZzVkVXNPeThxM3VGSlN0ZkF2bzlSOVVIR3E1eHplVkxW?=
 =?utf-8?B?WHp5UTdvRnlvdGYwTGRkYXJDeStDUHlOaDNGL1VxL0swNmhhakcwUjhQK2hz?=
 =?utf-8?B?NE5VY0JEMy9ONWdQajd1TXFYZ29CY09oM2FKNHc4UzJEODNsTG1vRzhtNkQw?=
 =?utf-8?B?RXdBNzBHMDhTckxSazY1N1RRbWNCRVZPSmsrcThCYy9iRWUxYTlmRW9hOW02?=
 =?utf-8?B?cXNoaERsOG1MTmpRa3lCLzg0OEpVakVvUFdCc3dLYXdiSUc4Tmw2S2dDaGdB?=
 =?utf-8?B?U2s0THY3SmN0ZE4ybzdTQnp2V21sVzV6clZPWThUOG51YzZYNUR4U3BVVEdP?=
 =?utf-8?B?bGswb2V4NTE4aXppQlZaNXJiWkJNYktwek5WUDZZaWlWRHNYWG1Od3dTNmhx?=
 =?utf-8?Q?S9Bnow7KxREHAdw5vGDCqbWwl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ab90fe-81b6-474c-a200-08db4bee8b3f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:53:31.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIDX0MEPcQl6k5iarXJqr0Us8GZ/+wYEt85/K7TmBDv+bZLlEpp7V/pghU/yE3nmsr1si/6r9RLq1Dt8QkUyoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183

Since it was indicated that introducing specific new vCPU ops may be
beneficial independent of the introduction of a fully physical-
address-based ABI flavor, here we go. There continue to be a number of
open questions throughout the series, resolving of which was one of the
main goals of the earlier v2 posting; v3 has very little changes and is
meant to serve as a reminder that this series wants looking at.

1: domain: GADDR based shared guest area registration alternative - cleanup
3: domain: update GADDR based runstate guest area
4: x86: update GADDR based secondary time area
5: x86/mem-sharing: copy GADDR based shared guest areas
6: domain: map/unmap GADDR based shared guest areas
7: domain: introduce GADDR based runstate area registration alternative
8: x86: introduce GADDR based secondary time area registration alternative
9: common: convert vCPU info area registration

Jan

