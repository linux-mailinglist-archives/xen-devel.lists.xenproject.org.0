Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC7662B07
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473846.734661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEusS-0005CW-Qj; Mon, 09 Jan 2023 16:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473846.734661; Mon, 09 Jan 2023 16:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEusS-0005A4-Nk; Mon, 09 Jan 2023 16:20:00 +0000
Received: by outflank-mailman (input) for mailman id 473846;
 Mon, 09 Jan 2023 16:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEusR-00059y-1z
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:19:59 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2047.outbound.protection.outlook.com [40.107.249.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 757287c2-9039-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 17:19:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 16:19:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 16:19:56 +0000
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
X-Inumbo-ID: 757287c2-9039-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DS6MVoscLNinHaz1t76NJ7UQfKOcw0J1N9Q3RTH+XjWvX0bjNqqYEgCQoLc3rvdXSmz/Wzpuglq8yaOp5Gsjww9PDjyJgYlV5BLZsulDi+olIwxefB7bZ7gOA0wOOycwzoNDNxoiG3UDXFxUn21wrXfdP74OW9hDhiZL+eyDGOGfpxLeZoLm7NBNxVPeW1BczsyMX0TIuDGoAiY8eTvagRhv2ll+0sEGT/KPGYxXgr8o5WY6dXw7bfkiI7zZYQzmo8aWKPzY9sZ+nn+YCoLUye/MP5oWLBqBTGBRzZnTuFpq8eCoMXhvWnDwka6Um1hs72UaTHYSmxNy0sXROSzbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zO+SgpjnIs9Q1ArPETmSVByQZEhBHEBoCmzzLQ0/Es=;
 b=MAKJ7vpeIruZYkFEWeaaHYatNvAGPzL4NoFLsOAepMcW7YrQxFuMjO1FoR9uA//EVcB+A+K0j9WRoQy5zRdLBiOAsx/liUHqL0RAIpW9/3dH7SSwmURVhNZE8WKKGsreBqeqLVeVWtvE+5lOmYavejgCMG/Y9qdqfTFG6KnxAOgNHzSPFpOlj6j+RyRhDfoDm0D6cfZDkPwAX+bo07TDt7DjshGM+ybuAfKh+7KqtSS9Mb3MhqFTe+75wlauDZlGQ5GsMIw+GurYMaeh7gt6ikew3k5JfzsWdb2hQDelfc2TobaumUnK6ydM8ebvmZpQRxqM8GVJYqhinxwW2neA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zO+SgpjnIs9Q1ArPETmSVByQZEhBHEBoCmzzLQ0/Es=;
 b=GfOzEc6S55qqxZvSvvVFZDQPWwDd3zxDQ3McgnqGEKnWMkXHvM+VwnJ+yERGpn3ZIOkEA0ueQwUcGq0WjO01cUVTD+pjQMD9XKTmeeukum3pZfRXD3mPiD8kl4vBNyvXIlXzY3GI+J/xYVKj6cE0YiUDBAWw9UhQI7+uHHboLaNBMD9pe30ZKX56AQm7AloYESL+vhzQv1fNqeTX0Puo4/A4XjPhxA1HhHzER6go5vpw4ov1qa+zE1+JySDq0dcLibIAodGtWzhdJR8FeL1DV/R+/Ahhcy58fHlbu5gCcnnLKfgD77pWCxJY7+08hwcbipdQKKad52C/6ytOCm6XSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f83a68a4-69bb-a5b9-5113-14766dc15403@suse.com>
Date: Mon, 9 Jan 2023 17:19:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/8] xen/riscv: introduce stack stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
 <b253e61bebbc029c94b89389d81643f9587200b7.1673278109.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b253e61bebbc029c94b89389d81643f9587200b7.1673278109.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 390b73f8-e9bd-4816-c87f-08daf25d58df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SEdbCYIQ1+50KBCdHVvliUbscqiyJGwAwUvAI0Um6TCo7jYgztfR+qgU/KN5XBQWuzZ34QBw2fyuyeMExPX3bT5n0zpeztz20K4u+3yAGwiXPFfl8JjjDacDajijUzki39epEkhZ9RnA+gk8BdAUJmb1+ACMMiwdt0bKxSJfU4KmROY6iENqUVNC1O2YFGXEyO91D2SkFlNUtOIZhFmaYo0rMWpKHKkbygHdALdH1X/BHpKdFhyAkA9+uL/6bjMsYAXnfTN7xI58zEtpuOONutvLxaJw3mLCZY/glAs+ikiJIrZz4acG/Vw/7bv7qKPgmTgWpHQC+kRxDUUZJOeF5m1Ygu1hVe8ilk5NB1riJKMh7+TVdWEGJbDI4awY5ctzjlwJiMuZzV/uXfvKR8sdPAPl0VZ/AX00tARumxpY/HUDmR/JvbGu9lqxQjVK7lNXxQ4Kt19OtZuQmpTzlrpP/gr1oFXpB1E5ViGfWXAFlc/8svxLqfAaz5Yc59NzpyV/7exRFiNHxqzS4df1dP4qVB/em58IFK9X/5LGS4DeQvNPPDQjBUVwk8Kpi569ecMULCrjQagF4ZtKyUwlIBJyZk2IJLlwXuTPs8Ka06qMSSMRJNZTsDgONxFXQVr9HBBhEVX94GNcgbykG96xR3wdkQYtVFyVzkkzzX8/T0jf36pktjZuROEVJmjZj0ZcZkGgNKS2m/kodVfQ+BYV548l7cLNvtfksHDL2eTPoAmTKck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199015)(8676002)(4326008)(6916009)(316002)(66946007)(66476007)(66556008)(54906003)(2906002)(5660300002)(8936002)(41300700001)(36756003)(31696002)(53546011)(558084003)(6666004)(6486002)(6506007)(478600001)(38100700002)(2616005)(186003)(26005)(6512007)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDFVUTVOdmtmd0tqVHhIa3o5Q1IzWmNvVlhGYklmNnZocy9Xay95akdTM3c0?=
 =?utf-8?B?dzJQOW5BSXM3M2laSXUzZU9IMkVyK3A3ZVUwVnpUcUFsNGZWODRkYUR6RFYz?=
 =?utf-8?B?UTFYRFlUWENGUHlFUUU2RC9ld3lSc09ycS9sSEJoaHNzQ3NFcVlUQ1hLNThn?=
 =?utf-8?B?d2dScUoyQzhIQ1VXYWdFa2VTdzBFVFhRZlh2MUh0cjJTUFdWbzlOYzhYVkZY?=
 =?utf-8?B?WFh5akdvZFFjeUJSZmFuTCt3anNlZEJ5eVdyWFFDa3c0bEIzTzM2Rk04eS9i?=
 =?utf-8?B?bzRCN09rMTlEYTBubVhwN2w2emxwK015VzIwVmcxbXZsSm9EeFI1TWh0WWk5?=
 =?utf-8?B?RGxXb0xlUWovSXRjUy9rRFgwWnlidW1HUE9pVU9QVWw4TWJxdkd2RlBuUkN1?=
 =?utf-8?B?czAzWklRMFNERThEZStLSEV4M2pnaTU3YitVTUpmZ2diQ1JaeE83S0pLbkE3?=
 =?utf-8?B?Y0d0R1VucWsrTGoxRkVCekVMNVFKd1N1OFkvcXV2NjJNeEFlMnU1SGxKY0Ev?=
 =?utf-8?B?WC9tZUpNdXk2QXdSWDRvbDZkU2M2RGNHZWpMMjEzUUpUajVzd3FHSGE1RjNz?=
 =?utf-8?B?S0RmMEtjSTZoclZpVHNqVmtmcmt1MjBRMjd2SDlUbzBqUW52STFJTHNFM1g4?=
 =?utf-8?B?NFRHUmx2c3J3YkQwZ3VJREpGMjVWU3Jta0QxaXNjNGRIS09mSm83ODZTTTJL?=
 =?utf-8?B?bDFaNHYxRnBVNTNJbjRHaFpacGw0dFJQcDk3MHF2QlpRV0l5YzhlL1hTRUZp?=
 =?utf-8?B?Z2dkdzFITmVzMVBHdFlnMkVwMVE1YWx0UjQ5UGFscGZPSEhlMTF4R2JSSmZI?=
 =?utf-8?B?b3BsYlZraHZxNjdPVVRYMEtZeUtEbmNlS2FBbEZiT0dRM0dycEw5NVdzWkhD?=
 =?utf-8?B?QktsSDhaSXBtSUtUWlJHZjM5SmFtSVh5a1R6K2FFWmZnK3FxMFJaKzZRRUw5?=
 =?utf-8?B?OE50cWs3ZmZsOSt5ZDhOVzAxS1JEeEZackk1czhjclNrNVA5REswT2FCNmlj?=
 =?utf-8?B?YUJhdDI4RHFqVGRBcTRzS1k3VkhsSmplUGwyL000aXYxUnFUR0dqYlFGc1dC?=
 =?utf-8?B?SUUvWEVuTGRnVXFhbldBTG94dnJqQnhidTIyb3ZiZlJERld6VXJvODNsTTBV?=
 =?utf-8?B?bXdjdnJ6VzhhNFBPRnFLUlJJQzVYR3FQcHFsaW5kV0RZNGI5cCtWQThxWFVI?=
 =?utf-8?B?UzhyaUlNdGQ5Yk5Rdlg5Q1AvYzlVWVlnTFhsOEtEMENXZGtzSk1vdDJOTW5Y?=
 =?utf-8?B?bnBIYnlPbDlTZkdoWmN4bDZlZGdRRUhxL2ZHZENDSXdOZVhxYTdjaXdhNTlJ?=
 =?utf-8?B?dnVKUWFRNjlDbFBWYVIvVXRHZ3ZweEdVUzQyN2VscllaNXhLa0tGUjhtN0NY?=
 =?utf-8?B?RnFYeVRhclNEMlNOaHFXZ2JtaFA3dVdITjg1RXJ4N0lhVzl5ejZLSjBIS1ZK?=
 =?utf-8?B?cDdncHlhY2FPNGVoZHVqL0YzZGNwV09TU0FOTEppeFNjZ1ZzY2EzMWU2ZVg0?=
 =?utf-8?B?cDFUUzRjUVJoRG1nMkVGZXkrdC9JTFNoWE4xK05TTDFyVmw3WFZ1TGNlODBk?=
 =?utf-8?B?Qmhqdm5wbmJ2SjRpYitTTlpSYk8yazdPRnZHdmZrMmRGOXBQMUxkdGxyZjNh?=
 =?utf-8?B?MXJwTTVDTjBGeTF0Q3F4azZXYVNMSTNTVXA4WllwTTZhaFpjVXRyRnFWNmhR?=
 =?utf-8?B?R3k0SHBOY3Bza0U1RDhGQWFCa2I1K1d2dXp5WGhwK3c0MWQ3TlZjY0dibXh0?=
 =?utf-8?B?WVYvL2RtZG10QVdTZFBnZEdVRHRLYi9jVzVGbTYrallmQ0g2ZzJaOVFhcHBn?=
 =?utf-8?B?WWdUUkZiWTZFTUNWeXJVS2N1cTgvZkJGTm8rWDZENXQ0NWRiSDFQNmxSVzEz?=
 =?utf-8?B?VG1PQXkxZlAwYk51eEtDdktNRllnNmpBdGlpRjY0bXd4UXRSRDZsdkRsSHBq?=
 =?utf-8?B?RDd6ZWJhTUdSeCt4SEY1OGQxY045bHlHRk94bmptUG10L1BFVDdHR2ozTW56?=
 =?utf-8?B?bTVDTWo1M014Qit2UXM3d29jTXpYcDNNTWkwcmJIWmZ6a0RuRVBTNmQ0ZUli?=
 =?utf-8?B?cS95OFk1L3hXc0IzNGdKa21FdDFZU2Y1dXhBK3IreWRwOENTd0JRdm9HbnNm?=
 =?utf-8?Q?uGAuXivF0sOzeYa/CQlrbpxdD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390b73f8-e9bd-4816-c87f-08daf25d58df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 16:19:56.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhTlM6hHPGLJokD2xBSei21hInNYHsIP8cpRe22aCIyIU35npjj53v8FQaLeNA6DjHlqZ27kCAwdDovxmVqUSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651

On 09.01.2023 16:46, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -43,6 +43,8 @@
>  
>  #define SMP_CACHE_BYTES (1 << 6)
>  
> +#define STACK_SIZE (PAGE_SIZE)

Btw, nit: No need for parentheses here.

Jan

