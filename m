Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB68C71587A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540820.842873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uhg-0002aY-5n; Tue, 30 May 2023 08:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540820.842873; Tue, 30 May 2023 08:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uhg-0002Ye-2a; Tue, 30 May 2023 08:27:40 +0000
Received: by outflank-mailman (input) for mailman id 540820;
 Tue, 30 May 2023 08:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3ugC-0004aU-5u
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:26:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2043.outbound.protection.outlook.com [40.107.13.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb08c37-fec3-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:26:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7446.eurprd04.prod.outlook.com (2603:10a6:10:1aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 08:25:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 08:25:36 +0000
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
X-Inumbo-ID: 9eb08c37-fec3-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hh3DqetLGB8C2p4BuDNnJgm5p3o4K2BuAlzx4vB7dLTyM3LQot2qoBLOYAKRGKPv/1HnLq8k2KlIiQlSf5tBabxkjpl4HVc4H2OLGNif1TxU/VBpwS1q5d/jl97A84O0aPXyg+cf91yYrHHqW3bpu4MpPjL5ebfxcbn+aGgZOYpEkkvBaMK66NEmEYoYxDjmEA6lhZI7bWqReHT9ucqQKBg3jSFsY8VuRtQzX+YLFyOz8w6Ca8UfOz/ZOFO14BeB+1S5NTbpuBzY758eEtuwZ5/6Xi3HgQE3Zh03aopOH8jcgyH4W4u6+jyfmZkH5rcpebx0tl+DfQqMQbaoLCagpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpLYpGGB9e+TbEwsNORP02sNNtzPIMRgsx8T5MprrHY=;
 b=Y2hmC9muMNbBydPYXqUWqBBhdFoMppCWpdiuxZ8Agfd0edLF2k2UDlUFGjx4JRskx2VgGJeXOoT5UHo4rmqoy2sJAQO7rXzNZ/jzQEHC9OZFu+L7k8kGLvMvp9xd6gz3C9p7QZrAGsRPQRbnFv2gb51T33B8j0Thfh4sRWo8Cs8+w9Z6Q7C7FKLr8LOKaKyA0fx2fOsrLOu85aPpczER5npaXJXU/CQZZTnf8jgxKB2dkBUhn70nlWeNMpdfeWiscADTNjuzPikwE/K9azkvQMLbvhJW9I1c6b+1bHu7LsFIJJ7EMzEo3IL+An6MNibk4aleYqr7RsE/u8xNATNxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpLYpGGB9e+TbEwsNORP02sNNtzPIMRgsx8T5MprrHY=;
 b=0NXfR51sCcH/0QeQlkgvBZFcWuES2I2mhpEgFkBF+vK7ZKW1Cr8YVpRbnGmhqLbSw1uLYS+ucEwFBvpFLVjVg/zHi+VBtTH6pTMmBVSqa3IRb/cdsutoJcbhftyHb8w3KdFQFBfbAxcousuYFVj83Exn0ed/3aq2ZEjjwP2vuStfhK5lxOTa2W6BgzQv6/PLdvTQgTPuyvh4+7a0dfoQExW8vuWZyLZKfX6olvuIPBUIgZTF2VpjqRQkr1m+KDF4rsJv+T4W8En8RA5SMTF0Cfay3XK+VNaul8Q4W5fRQeQrjwe4o+cRJn1EzSEeEGiEKriJ7IbdPStqZHa9OIfqMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64820a10-622e-dc10-988b-613542349ec9@suse.com>
Date: Tue, 30 May 2023 10:25:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] x86: Add support for AMD's Automatic IBRS
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
 <20230526150044.31553-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230526150044.31553-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a38aeb6-99e2-4b30-77f5-08db60e77161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jKX2mz3Zbek9WhuOgWi0I9VaIKhXXucyK79+q5Xkd578eISQvgs8J78p7QpQk/wn24nFGzU8PHFfdTxB6mxkt1M1QfqNkSBsDl/ati5xZZrxUi+/SM7VDKnnbqtq5r6Cg5DCKEyGQFIlCpZnoThqGST671hcVo4cvoc/qrXqciUxu8xsF8pIiJ1MVOMWi9TzF24hvbuNrrqud82P2Sh38WCA9VkRtyivnZ/CXOGBmejxgnz0/DnfMmVoI4+j4Tj2Eg7rXPplN/RBztV7ie60afPCIL1XgkP3NEPgxYlAMrWSuUFT5nwBCptVZQ9ErFjFGSP3sC+duIup1/MHQsdCTmBb+skhL8d8daOqUVnFa10r5MfXolCav3lF4uBjLdlswJXS8Fex5HANNve4XixTt/yQVt+uYKHdJmWyE5yi+jOh5E40awzsCPpncPKR65uAIQXxKW8k77T4CwKmtVwrPkKXBLHEeYxjDkMALE7Jpm7XD3CQPo0mykxQkAFxMlQiHEJnSa7pKaAF/3/n0BuI3oLoncbak3oEQ4XdjR+S1gVyu4kZJYew54jn1lrLkxz+KOmoNF68qjvY8u5M6aU+IUvZWaBxQqA+HsCDjLC5tUlHIDewwVpMQqMPBM0YX+H2c8JGkfkZzBKv6jYpMLOwsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39850400004)(396003)(366004)(136003)(346002)(451199021)(478600001)(54906003)(8936002)(8676002)(5660300002)(36756003)(4744005)(31696002)(86362001)(2906002)(66556008)(66946007)(4326008)(6916009)(66476007)(316002)(38100700002)(41300700001)(26005)(31686004)(6506007)(186003)(6512007)(53546011)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akdDR0hqZklncytBNVhKellGWUNWbFdLM3plZDhRZDg2Ly9GSkRrdlpSS2ZB?=
 =?utf-8?B?MUdGY0FZc1MwbnBhUW9vS1hzbG45RmY3Mk1JYkY2bUsvL1dPd3EzZGNTck8r?=
 =?utf-8?B?YnIyMVlub0dQL0FrV2MyTDY1OVh5SGRJdWszR3ZRcEl0Y0pWVlE2a0tGUnQr?=
 =?utf-8?B?Uk9xQWZqMmRPNnN6Y3dKWlFkNjZlaWx6MlZlck5DTS9aNkZWNytRcWtMSTY4?=
 =?utf-8?B?NnZPb2tRekREZXZuZUt3UEdSejVNQVUyTUtZbzBiSjd5TjZYQTlUSGtDQ2F3?=
 =?utf-8?B?NXlWQkdIK29nb0d1bm5zMS9yb0lxVWlhTjNpdFJrOFBqM3U1T2hjZHZFL2gy?=
 =?utf-8?B?bElrYlBOTFJueDY2bFhwOW16anNXSTBFSENyd0plZ3hKY2JVVlpRbGUraDlQ?=
 =?utf-8?B?THFKSjVlUlEvSXlVc1ZRVmRzcjJNaVZRVFlFQ0pvODMrSXFZZ0IwS2JMYUdP?=
 =?utf-8?B?QlNydGhITEVNcTdwRG80SUtoNlhvUStEVU8vN3hkTTc3SVQ1Z3ZpTklkMTcw?=
 =?utf-8?B?OXp6WTgzQWhXTWJZVndhZGJHb2hkbURGS2tEZnEvWkwzRWhHSWZSU0ZsejdX?=
 =?utf-8?B?V05haVlVK0tMY1hNWTNSa1pWQ0EvQlk3YlNMTnFvWXdkV1E0YWZqQWkxZU5p?=
 =?utf-8?B?RDhOemxITlJMU1ZraDJuWTNyU3dGSzdIMVVvaDRGV2RpMVRLZG1mSkplbERr?=
 =?utf-8?B?UkdXM1YrOWFkcEE0d2xBbGxYSzZ6TUxmdytKK2g2Tk5uN1ZMWWxuTGlKT3c0?=
 =?utf-8?B?a3NlbW42bVVrNXNHanNrZlFEUEJyc2JKVjBQYm9FK05QaU4ySko2aGx4VmFw?=
 =?utf-8?B?ZWNMcjZieU9qeWY1OFgwWnpTUkduUVJ3alliWlg2RkErSllubUNxZkwveE1X?=
 =?utf-8?B?cGlIK3psbnR0L0U3RWREOGp6bWhDR2dTYWRXajdqMGJ2YWlTcU5HMDlKRTFz?=
 =?utf-8?B?cHpDTzVVQWE1TU9lWlkvUEpzVm5hU3lYMFRHNzRBQ1VzQ0F1SGQ2bmtzY3pL?=
 =?utf-8?B?ejc4a0tSVTJMMmNMbG40SHRLU256bm9HS21UQUxNMUNpalJIZ3MrNXdGY3dF?=
 =?utf-8?B?V2JNRHdIMlRGd2l5OHJybU9JZWp2d1ZWODhXUFpMaVJqRUhtL0hPeUpuN1oz?=
 =?utf-8?B?TFdFMnNVK2E3THAwcFIvb1JicVRjblJ2Nm5JTWNlL1I0QkltSmx0MDlTWEpD?=
 =?utf-8?B?SUcvL3Q1UlUySW1scXp6djJQeTdLc1h6UXJUUDNZZmxzbENvY2tUdExjSDBH?=
 =?utf-8?B?WkdCZHVHWVlGNkwxV0F2VDdEb0dyVXBBc1FqZ0tRUXZhWm9veVU4WXJvZnJO?=
 =?utf-8?B?WGt5UHJ3RDZOU0FxT0pXV3RWWlpWOXVsazAwTS9wLzF6UmdvbFc2cXVYaWxt?=
 =?utf-8?B?Yk1razB3UGFEU1pLTEhSWjF0dk0xMWZ5R3lDU3lYVlpSOFFKb1hrYk45cTAy?=
 =?utf-8?B?ODljaXloUmM2NDlSbVVCOURDMS9nNTNLeWVkOVhTQ0FLMDVSTURVbGVlSEkz?=
 =?utf-8?B?MlJ0V1g3YjN1UDVKTjdIQWN4a3N0TlhtSVNiTEdXSXpXWnBWWll2Q0toZXcw?=
 =?utf-8?B?a05mbytpN0tnSkN3RTgzUGhpWXloWi8ySUN4UXg2K1ZHUDY1UUltY1hqSFJB?=
 =?utf-8?B?cnpWbWM5cmE5Q3hDbkViWm1qaUxnZWF0Y2UxaDFlWG1mOGFJVnFQYkpETFlO?=
 =?utf-8?B?NElGa3J4KzVVOGt3aHdBdkRKbnlhMGV1SWViT1hGU2xyQ1plYTQ0TStYVDBZ?=
 =?utf-8?B?aWUxT29xK0U2cjVvUlZjakFLc2xJamFVcjZic1dGMEsyUVA0TE4yWUI4d3kz?=
 =?utf-8?B?U1dYekllQXljVnRaQ29zbTlZRFF6Zkt0bnY2WEY3SkJsUXVweGdpbElleTli?=
 =?utf-8?B?NVZXclo5RGQ0SWo4NWtlUERWMndUdUZiNnVzWXFsTEVRNTRYMXROQUxoeTJu?=
 =?utf-8?B?REZ4aW05WEY5ZEVxWEV6SzhKd0xqNTloNDl1TXBVbGRONzhESXJSRWdzajZE?=
 =?utf-8?B?UDVnVXZQd3p5WGZiR0kvd0pHZmNteXNEZGVsVWR3OUxMbHVVWTZ6ckV2bjlF?=
 =?utf-8?B?UnZ3OVFBNy9rZGNRZHAyS0JvZXcrK3RwWFJkaWlIWjBidTlUNU9PQlI0MkI2?=
 =?utf-8?Q?cMuGuXJQ9n27oscW1UQNqv09/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a38aeb6-99e2-4b30-77f5-08db60e77161
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 08:25:36.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALvGtT/GBkH14bAUV2hg0AFmL3OY2wcIsT5y2QSA4j82SFVA41gS2qLIqo761x540z9Hq0Wr4BR0YVNNW7rWgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7446

On 26.05.2023 17:00, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -376,6 +376,9 @@ void start_secondary(void *unused)
>      {
>          wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
>          info->last_spec_ctrl = default_xen_spec_ctrl;
> +
> +        if ( cpu_has_auto_ibrs && (default_xen_spec_ctrl & SPEC_CTRL_IBRS) )
> +            write_efer(read_efer() | EFER_AIBRSE);
>      }

Did you consider using trampoline_efer instead, which would then also take
care of the S3 resume path (which otherwise I think you'd also need to
fiddle with)?

Jan

