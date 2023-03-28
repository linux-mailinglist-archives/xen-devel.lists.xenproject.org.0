Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCED6CBE5D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515731.798854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph83F-0007vT-CY; Tue, 28 Mar 2023 12:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515731.798854; Tue, 28 Mar 2023 12:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph83F-0007sr-9k; Tue, 28 Mar 2023 12:03:45 +0000
Received: by outflank-mailman (input) for mailman id 515731;
 Tue, 28 Mar 2023 12:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph83E-0007sl-1z
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:03:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe02::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e8f5d6-cd60-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 14:03:42 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB9677.eurprd04.prod.outlook.com (2603:10a6:102:24f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 12:03:39 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 12:03:38 +0000
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
X-Inumbo-ID: 94e8f5d6-cd60-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkZgVfb4pUJIFBYkaxiytcFjKOdlNyKHqbJ4nDeZBrY+Zq1m8ak6d6LGUfMVhAl6nXwgQ5M9GRWrJ3etI5GHHhcfphysT3TQ//VwLYgSVvW6NigCqcftUboQhTvIWlMLLR9tSaFMJ7Jg5hWelAI+K7xYKVx/IHwekRcBAx1KKk3jSXnmHQn4OMO8WpflkcFsMd2oEyaQJm5lDz29y0agWb0HmG01dsUFyOw4lNqmgmvQ9lEfrO3m0vhsmkzA1BqH1UknP5KmmeTM7K06r90eanWL9jj+MbmD6n+FJHBg+RXKzFPL/eHen0PUk9BNc6hIdRcdqUVQ99ZWb5Ij2ojEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTaPpCmDqesLSLqCWRt+vBFYz7YAwSIX21Wt7s5OZ90=;
 b=DBsmaOisDMcgeb2G47qy6rwmhIV4MfUZBrOKBsliQTq8yjG6nbcHDmLUnsB8jV34DPc6j0kgTCOMgPmjU4MXxF2Se3uyTdIleU6WXrlfaQ8GZs8LU+AcZqLthz3n2yFV+rj42GOYgUFnrTzjkm9MwuS2aOG+PBVeHtSA+Y6/ViaYsHUqCrcx+bCWnhNflQ86zBgVlSSRJ3llG5006rGWrboY+BCWq8yYp/A5mYeDymzNlMLRrxrPiVqFIonG8Nj+N6xnHI5YW66xi95LuZizzmi9LEcBaOYvNWyxXMcLA3c+i89JjTr/h77VxWLAePHIJBMEvWqw9hEzBevW7EqfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTaPpCmDqesLSLqCWRt+vBFYz7YAwSIX21Wt7s5OZ90=;
 b=MB9eIvrQzeqcugpFZc4ACVqMAJzBu7SpFkcXjzm+rylvVrBkkHe6XfJk4rGPp64oQPlpZin61y/KtXEBnlZCS5HGMusiXpSlyI8p+/COnRHQG4D42MSIiUkGqYf/Emv5wbp7VnLOx920ec4Rm4s8YpW7xfDDNn0lSP9YinkixJz5DmmTlqgPX7ad4BqrXPMhbUPc2A+G1Gbfw02nNqmr/wTS6XjRaKmJLpZvjYMoshmLhP55LW6vF1ywxC/Hm3SRFe2mblfZcaLR4X0FkKi3r6u1FDrYDKtIWABMoCFUa2lZfYtTVgOz2dyHtYCCFDZzq/e+ZYVK/ZzlKWmciPi+Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e932269e-86b5-a62d-c936-d52ded3799aa@suse.com>
Date: Tue, 28 Mar 2023 14:03:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] x86/boot: Restrict directmap permissions for
 .text/.rodata
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230324220824.3279825-1-andrew.cooper3@citrix.com>
 <d26961b0-0c13-83d8-9102-37e1e297fc4e@suse.com>
 <fe6627a6-067d-c3b0-f6f1-25d21bb6a530@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fe6627a6-067d-c3b0-f6f1-25d21bb6a530@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: 882aa99d-2538-4204-2f7c-08db2f847751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0czL5J8CmNHrD2chOyGduh31P1jOMbGfc80LKwnc95Gy2Y9b6U13xHkwCg90RQmYtePWBH9N3sxKvc5Qz5sIKrqXwbC58136acpWzoxUBRlHiCuuhyxMe3kvrXdYgIXWfFVuXXnG1frGdHqmo2cUww2/FLCVuVg74ZcT/y5bI7pnscbPHSqkOt2hpgBehrERx2xcdHvLaW4aNJMEPBcuAlNdZCfKg7XFi/9SjaPa0eLG4nW2vbQLqls/2fbKVHjTCvzMOpHQJ5UNVR+pac2BJJiYox4cJJV/H7D/l6T7D5tzTmaa75cuikkY1FgjR2/fRpys+gK/A/VvcmkDn2GuEcoAmpcvfYH1+qllazg5NDgYZW2YCeeqo8PDadx6VAFjas4zOcqzf88IASO6bLplKY5xSlJc4Klh4bG4IFZZiNkaNHNjgtRFqf6D6B0h/ZclfJGwsJewVdXrCVk/KXvgosffXY/YZcJtAX9Wsb7FSN1SYVqTs5AowR8JyIgjdm1dLlnYy6siRCUOhVGfxHLHapACvy6hD/e+IVHR1t/OIvAPGk7cwZDJUY9fOFD+Avbbk9oDEjoKkTanLK2Ad6db/Bd8dXjaOdnYz2ULn1ISUt8FeKPZP0HXa/x3ZxnqXJf6MH7TA7E6YdqvM8S9BSGS343zRbXUqXLoBTRXQmhsvno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(186003)(26005)(6512007)(53546011)(2906002)(38100700002)(86362001)(31696002)(36756003)(2616005)(6506007)(54906003)(66946007)(4744005)(66556008)(5660300002)(478600001)(6916009)(8936002)(66476007)(4326008)(41300700001)(8676002)(6486002)(316002)(31686004)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlOWC8yK3RFeWtmZmRrRGVPT0ZLTzNjL2czM1ZTZWUrdXI2K0ZHM2kwcm4x?=
 =?utf-8?B?RThqbEFoaVNzT29IemxKSW84VkJBTDdSSVBlbTlFa2hOQ2pFa25KVzJWVUkx?=
 =?utf-8?B?U3JpZlF3cHFMVTNTNGdWMnZsRmFMT0RURHo1Y0tpSUR5OHByNVFXNVB2cjFj?=
 =?utf-8?B?cU0rOWRydDRwekNhbWJrWFZvUVMxZWdCYjVUeXl5ekJieDZ0V3cwenZjNlRx?=
 =?utf-8?B?cGNDV3ZiYm1Dcjc0WmxqR0JIazE0dTk2WUFjdjU4aHJVcDRnY2VtVWtnSm5C?=
 =?utf-8?B?ZEFoTko0Qk1zVTBQeUdoQVZHOFFudUFwMWpFUHBsbmErMFhieXpjWmV4TW1R?=
 =?utf-8?B?dVZxWWZhb1JjMktoYkx3Qk1temJST1ZSZUp1ckpwRDJWNnRZM1NYV3ZPNjY3?=
 =?utf-8?B?VU1rOG54ZEFQRzFLajl4MnRZbU9ZRFZhSVBFRTJoOXoxVkovb2NFdzliOWph?=
 =?utf-8?B?Z3ZBa1YwdklLMXdsd0lwZTZhWVJYWkdvUXJteERCaGNkMk4wRlZlNzVxQTBG?=
 =?utf-8?B?Mi9lV2UrSk1XVDJ1Z0pUZ3VCNDJHTEp3WnJMUjJQbjdQbWcyQU5MeC9HV3hD?=
 =?utf-8?B?UzdEQnJDVUFXckNoaGh0dytJQjl0U3BvM2VIbmp3ck9nY05ZakpSdE9QbGQ5?=
 =?utf-8?B?aUlTR2g1RFJYcmo2dnBVUFkyNGZBMDd4RlVQUEo2b0l3VUVLeis2Vm5YeHZV?=
 =?utf-8?B?NUNuR0NyZVBMNUVoTzdNeFF0dTJTMlF4VDloRUdWQjlkMHAxUlY1blovTjVl?=
 =?utf-8?B?UDcrZ0l5QkJVWXFzWng0RlZlMGNiWmJYVzRON01IcEtkbndjL01nQndRSEJ3?=
 =?utf-8?B?QnFjRm5LaE12YTBFcnBmR3ZpTng5bWdsV0J5RE96V0JxZFFEZVJwWVloMEM2?=
 =?utf-8?B?QlBWZ0tkSXFHWTAxMHozekFMVlRJeFcxMzFuWjJXczkyd3FwQTFSUzVyM0tS?=
 =?utf-8?B?SlVGTllrS3lFTlpnS2NTdjJ6VzdLSHBCN3IzVXNQVXA4Y0VTRStrREN3TVVM?=
 =?utf-8?B?ODQzTXFHOTNIaUNKUnkvUWp1dEM5SzRXV2FmWTJIMzh3d1k1QVhHNGRiWWFT?=
 =?utf-8?B?eHhScFBvRDBYUmJTdm4zbWloY1pVQjNPM0lrRExUT3p6ME1zbFlESmUyZnNV?=
 =?utf-8?B?U3BKcnBOU1hiRC9ucjQyQ2JXZkZ6ZzVjLzVmaWxOZ2xINFRVU2F2TGgzYXNn?=
 =?utf-8?B?cStldk1KeTgwR3p5akZEWWpvaDgxK2NIdjRCcUNtbHZSekhxOHUvaFJkZkxM?=
 =?utf-8?B?MFJQMEFNZ1dBS05UZGhnNFdhNVlBNzZQZml5WTNOdXJUMzNGdmhrbTRWaUFL?=
 =?utf-8?B?ekhwWlFlaWd5V1B0MVU3UW91azM1dVgyaGhtc0R6N1VZQWF4bWU1eU93Ny9M?=
 =?utf-8?B?Rnh2OHlXRjljbGEybG5yN285aFppVmJDUmRoOGtubklOTTNSZkh2c1hRellC?=
 =?utf-8?B?cmo0Rnk5cnFnUE85OXE0a2k4K2lkQzVPUS9NUGo5WTh6c29VM1A0bnVlYVhr?=
 =?utf-8?B?TmpTVjI3UlBvNkpTVHFqdHF5WEkvQlA3cmZiNW9lbDlnZEZDNTdUd0w3WHlU?=
 =?utf-8?B?aDFoUXNscFlZdVFGN3hMY2ZwSzcwaU1SU0NvWWdyR1I4djRLOURvcjNTdHN1?=
 =?utf-8?B?ellCRERnOXZzdVd5OFFSLzVqMWZmVzRhYVc1bGhCR25TVi9VNllLNVhtOUZC?=
 =?utf-8?B?UXhTTjl3NlNVcU1MTW12NVQzaEZ1eE0rUVlpSFRrN3BqWm9UK1pWbFpjRmdt?=
 =?utf-8?B?MEZqRWo3UTVsTWFFaW1DaUVic1d1a240VjlXcC9jS29aS1o2WERuREZsM2NG?=
 =?utf-8?B?ekJSZ2lVZTlpSFY0cDFYZHQyRm1BUmRLWnRaTm03cm9VQ3pRaXAwS1lXRHBG?=
 =?utf-8?B?dUpVeERnSEVoaHpvdzBYWkVManR2VnV6ZWl3aXJlUm9PYm5idDJMRTYzQ0Ex?=
 =?utf-8?B?cG1QQmlZNjE2RTVjRkZFK0JjdUJTcjVueEk3SWZVN01ES05TTGFlWmdidC95?=
 =?utf-8?B?TWtKSVBvNVJVSWxjSCs2VmdKeSt0TWtpakZBRVg1bDZIdE14SGpYcndEMDJQ?=
 =?utf-8?B?cHpnbDRJV3oyN3J5aEwrVkt2VmVjN0NmRHpMNzY5R3lDY0gxbDFZTDF1ZHZq?=
 =?utf-8?Q?bes+QD35+/5Jw5/Vonp0Xgv/4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882aa99d-2538-4204-2f7c-08db2f847751
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 12:03:38.8496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIyvrC2JvmHBH4zONSJOnVqFGUz1h/Df9Jo6FlLLOKIey+jgLdiWDuy5V+r+nzQ5D6wubT+pjMZvKMCX1IcLIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9677

On 28.03.2023 12:27, Andrew Cooper wrote:
> On 27/03/2023 4:43 pm, Jan Beulich wrote:
>> On 24.03.2023 23:08, Andrew Cooper wrote:
>>>  * For backporting, this patch depends on c/s e7f147bf4ac7 ("x86/crash: Drop
>>>    manual hooking of exception_table[]") and c/s e7db635f4428 ("x86/pv-shim:
>>>    Don't modify the hypercall table").  No compile error will occur from
>>>    getting these dependencies wrong.
>> I suppose the latter isn't strictly a prereq, as the modification was done
>> from an __init function (i.e. before this new code runs).
> 
> This code here runs long before pv_shim_setup_dom().  This dependency
> was found experimentally via testing IIRC.

Oh, of course. I was mistakenly associating the new code with init_done().
(Iirc this was because the only sensible search hit for ".rodata" was
there, and I didn't pay enough attention to context.)

Jan

