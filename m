Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A23760A6C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 08:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569449.890190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBjE-0004Pp-W0; Tue, 25 Jul 2023 06:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569449.890190; Tue, 25 Jul 2023 06:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBjE-0004Mz-Rk; Tue, 25 Jul 2023 06:41:04 +0000
Received: by outflank-mailman (input) for mailman id 569449;
 Tue, 25 Jul 2023 06:41:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOBjE-0004Mt-2W
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 06:41:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 392ce7b8-2ab6-11ee-b23d-6b7b168915f2;
 Tue, 25 Jul 2023 08:41:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9690.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 06:40:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 06:40:33 +0000
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
X-Inumbo-ID: 392ce7b8-2ab6-11ee-b23d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiSbbsIYWCp1pRiCNRAJfJITcAYpnwuoumh4rSu3P6c+IYvPU90ETjoVfD97K49Fo11wGViKQAwYOMdRfOukkSO3tIY278RjX65H9jELSU9R+LW+iUcFBa09QUSxRF2CLwM6XXsfPnwlEBQylS32EpJ/KOi7ee2DEmBzp4SF793oXODmiTvC80vNKhNU+ndaJLtgIRMr+rHMXZY8ls/hhj3V55D3V1FIcBAbBcjgyVd9K6mkoaaRAoz2FORJiI2vzF2u0eR922OQvb6+mHGRh7bVjbRXNncbMBarsnwq4PTYcdSBDYLye5HeZ7Y/uQVZWBEqO7C+f5c6eLeBGYwvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zra/HTMP5ef0ZgjtY/CGV/K/31/jxct9cpzrwEqCzm8=;
 b=SlYrGZr5nMENqw4rdLpOmFYH3yVZrcp5SswLOPZDQRSX+0XyuovrafQDz4Jsh2CwdEZDfzBntVX1p9+SjHSm2P1CDlD2p9HhkRCiJ9azBtgU4RUzREKWH3mbPXZOBwS5BTxbShFPIVz7ab+NlO7nFo3dVU7VN7yGlZuzLZ+PyPXiJ1RpUYr20ZgaACNIvwIxUZL4/trzG8j6GgTZXK2qtQtCIw5cUL0qq6FAPn7y3prZGWSeiYMgtWtYg+QAxB86yfjNB7x6Ji7L/A8zw1m5hoiuQ3UOevxCTY/Qhe2ksy9QzGkUCYLEQCU6rArXePGdFEMhDOB9clJdjuySlEFsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zra/HTMP5ef0ZgjtY/CGV/K/31/jxct9cpzrwEqCzm8=;
 b=25aln6UvudePjaejKYrdU+ygrvwnGstfjSf8DwQg7bjezFU6u/xoz3ina9ZRp3AT/12dD106EB1vBExBmtM12MB+w3bxwuyAEU3fAJ/NS+hfEwMKtWRh6X/vIsDvtDniDsoKqwK3fTTFI4gaTh0ur/3OM3A1fhTo3RxRaInSZhI1euvHs7xYVGCy6MRU5LuC0SmKY/BA/t+OkFVpX79Ec5+9yZg7pbJ99qa12Z5ZyF5+ynakiIE42ql/hJzQsdariDm/GzNsm7+Ca6kMlnIF1sbU2bBsfkREvwggv+HoKlHYq5840Y4BezETNXUm+6fZyYUHVN75BdDgyFLimmV7rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a31893d-a784-ed33-bd47-5db85b3c02b6@suse.com>
Date: Tue, 25 Jul 2023 08:40:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/3] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
 <20230724165235.25262-2-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230724165235.25262-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b92ef6b-b4c8-4540-be35-08db8cda0bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OMQwEfqgdev4VQ9IH80W729qpsBg4gvvryNN1sbjffOoO2PG1ny7TEHLiCx81Lqi+q4urci2tBtza/armdfGbvqlRUuz+CAvPkEdymZKK0hi73nxlDLJSomEqnMJRphzXt3bqNwwsDjII/K5Or/xxE5gyr8afq9oaTvBx2NGOre+lgY7hhTl9GwPkmo4FwBGlrugbWZoCq+WLSnhyDsSHhxie46wkJyGdNKoZgtNLZyIpezGKpJ0dzm7ucWQPUv1KAU8+HRcjdDmMQo1OxGbW6idfdcDNL4XwKFJwbJAxVjSJhxXNwMDGD2CqpiaMfQXKiLo1c6Qa+kDvFcUfzm9JOedoU8DTBNz6QgQoa0e/ZFTIozHtZGka0PIWz7XPeLreT4iBq01ihmknPWiUL0qd23FI4tx4RltVXOrmaAEHXfJKieNgGVGAOCwyl5bpqNc/pPNKKnWJYiX+pXIJko1RzgWom1xDTnt/ISdyuXDvGdvmoP+cvK2ILHAjKq35veCbvx1klElT5Q8Yd5Sc+hiamPtSh25r7huoEx7VTurHQTS5wUSqUwNb20nMdstBahjC00xva6ksaiy9ycAnneoSppJ6iWRtzC9/PZK+DdPeFg0C0DfSBJItxG5Z0r9SZ6MbbKlTo8N+fws5fF1mOiNgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(86362001)(36756003)(31696002)(31686004)(2906002)(54906003)(478600001)(38100700002)(26005)(186003)(2616005)(6506007)(53546011)(5660300002)(41300700001)(6486002)(6512007)(66476007)(66556008)(66946007)(8676002)(83380400001)(6916009)(4326008)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3dBSndaUnI4ZUh1ZENuL24wR09MOHFERWVubUpQVmRiUVZyQ0J1VS8zYWVS?=
 =?utf-8?B?SmNlMXRXbVJ6OE1WOWRtV0lYSWdmeG5pNUE0NEZMdXhhbTFhME44a1JrSUtH?=
 =?utf-8?B?QTJ3dng2bm1TcTBKUjkyL0ZDNnVHTmNlZU1TWGV0cGxCQnpHd3Y5cUVFZWJl?=
 =?utf-8?B?NG1oRjhZUG1lMlB4ZUhwQVN2VEdlQ1hlSjNNUHdxdFZiaGpVd3F4cENMamM5?=
 =?utf-8?B?WEF2bkxuMGExY0dOalpQeHB6UTVFNEhWNnplWTdZSUkzSk5oV0NTUEtaYWtV?=
 =?utf-8?B?TTBLSnlEWDhCeG9LWHIvTDBEUG5hVkFvVGxVVHg1QkcwclpTUzlvWFBoR1A2?=
 =?utf-8?B?UW1GSnBHUENRbURYbGwrZThVejBDTTVqYzZONkltUUFlS2FUcHBrSDNLK3JP?=
 =?utf-8?B?YWJGdnJDb1VnN1dqQWNVVHlJcnA0Nlc1ei9EbTFHaVN6TVBEbnc1YzJzbVE0?=
 =?utf-8?B?bjNBVUpmT0NnNCtleVVic2lMOVdTa0k3ZmNlQ25RWmp4R0RyU01lNnBNaHRs?=
 =?utf-8?B?L2xWQkhwcm8zV3NKeVl2c1FyZHRxM1RJSVdLOVJkS1gyaDZpaVNwd0wrMkFm?=
 =?utf-8?B?eGdsUEZkL09VWExIMnRIbk1tcjltZWJOT2FpVEJaNWlpUjRPUUhDZ2NUWVd3?=
 =?utf-8?B?VnpZLzBVMWdZSGZYQ0ZTTWVlVitkblpoQjUwdUpwZTBhWnFyamYrTVh6LzZF?=
 =?utf-8?B?alBvMG9TWU8vU0daTlk1WDMwK1E5THJtemE3MVFtdG5FMklpMmtrT2hBWWdC?=
 =?utf-8?B?MHptQWJyY05Ud01mcnBDTXhadEVOK0RMdHQ4S1ovVVcyb2N0SDdNcnZyMmdE?=
 =?utf-8?B?c3lGd3duWit5cDNGRS9aQXovMVhJZjZDcy9ERllPbkFoRXBuRFBMVmZWREtp?=
 =?utf-8?B?Qk9pVHhneTdXZWVrcU9haGJ3Y2YxY0ZsNkllVlREeDE0U2hLWDYyM2dyUEpB?=
 =?utf-8?B?Sm5vY0FOanpNTVBVMFZmQm9lYkU3dWpSbVBKczhrcFpFUXRaYVYxUUdTS3g1?=
 =?utf-8?B?WXNBem52RWh1Z3JwQ2FWVldZZ2pQZWVzaGNFamNiMnNWL0JQUmdua2lCSklU?=
 =?utf-8?B?RzVLTTRJVXY4UmlZS2g3VVpEQWdBNHhuejl3R3lYTTFub0cybW9nOHN3YUd5?=
 =?utf-8?B?Z1MxZVplUVEwQnc0cFJsSmt0VFNkTnd5a2p2TkpERmtPelFRUVFvbVNMM0RB?=
 =?utf-8?B?bmdoRS9VTmcxMDNXbmdodDVaN1YrWS85TmVPdTRBamx4NWNRV3VVL3dzSDF1?=
 =?utf-8?B?em1wcVVCaGNaRWdhY21Ec2FjVVdBL1h2OXo4ckw3Qjl5REtORmJnTVhScG9E?=
 =?utf-8?B?ZldRQzRXWGdVSU5nemwzd3BwZVVhMy9TMTNwTnYrSGZ6UnhLSS84WWVneEha?=
 =?utf-8?B?Tk1yb3Ezb0lNQnZpQ1A2TWZPRUVOYjJpVG1lNWFkNk5pcE1mZTk1dzg3bFJa?=
 =?utf-8?B?TzdjUGo3R3BUSzdKYkg3cXB2QnhiOG5NaloyL01oa1FQc01ySlBxcTRxbUlX?=
 =?utf-8?B?TTNJVXFGUndNL01weCt5YmpFOWtxMWp3bXU5U1haVXc1OU5oUjFJd0VkWVd6?=
 =?utf-8?B?VWhvczNDa2lvTVJOR21mNzd1UE9jODhrUEhHS0FIUStzOXB5NXhWcWxMNlZv?=
 =?utf-8?B?OWdoWW56aU9LOTR3QXdtdW05bjF1N1BaSjU2RkNiQnpUOTJvZVNXSXEvL0w5?=
 =?utf-8?B?TG1LOU5UYmU4VmhVNGN3ek1FazZMQUUzb2k3ZzI2YVNJa0RWdDBIUVpNdnR5?=
 =?utf-8?B?NUlvcVREdnZ0ZHNxdkUxc2xScWxnY25FU1VLWjJDRy9ZOXBPQ3ZqaEk5ZFFu?=
 =?utf-8?B?allwVDVRSUR1L2FhM3hFaGxHamdUZ2llUC9NNnFocVlkclNLcERwdE9BZ2kv?=
 =?utf-8?B?WDQvWlJYLzU2MXJtSGVVaXlTeHpmYk1EbGdrQ3ljSGRGUVl6UU1wcGlQbkJO?=
 =?utf-8?B?TFl5WHppSnBaZHFQaFJNNk5ySFRScDdrb2Nid09qYTBzK2N1WEYvTGRkbjRG?=
 =?utf-8?B?dGM0ckJWR250RVdXbWt1ejZBMFE5dEZ3MnpUVXhpdHJUKzlzOGdKWVJpeW9i?=
 =?utf-8?B?dXRQWFZ3M0lXYTd3K2pEUUV6MS9hSCtVQnUyTktVa0ZlbHJ1cWVKM3N0RGRU?=
 =?utf-8?Q?nTGo2/gHEaRV0Gz5eoiKXNbEx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b92ef6b-b4c8-4540-be35-08db8cda0bd7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 06:40:33.3560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebRH8hzNYViT+JjsOFxyCy8XvsZYW1yw9LK/jD6BtS/1VUD2y8nnrgPB+NEN3hDBybdX3glSAK9xp8kIbavAsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9690

On 24.07.2023 18:52, Alejandro Vallejo wrote:
> Some hypervisors report ~0 as the microcode revision to mean "don't issue
> microcode updates". Ignore the microcode loading interface in that case.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Hmm.

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
>          return -ENODEV;
>      }
>  
> -    microcode_grab_module(module_map, mbi);
> -
>      ucode_ops.collect_cpu_info();
>  
> +    /*
> +     * Some hypervisors deliberately report a microcode revision of -1 to
> +     * mean that they will not accept microcode updates. We take the hint
> +     * and ignore the microcode interface in that case.
> +     */
> +    if ( this_cpu(cpu_sig).rev == ~0 )
> +    {
> +        printk(XENLOG_INFO "Microcode loading disabled due to: %s",

While we have tentatively agreed to adjust what _will_ be emitted by
default (subject to suitable justification in that change's
description), such a patch is yet to be sent. As it stands this message
will be invisible by default.

> +                           "HW toggle");

With the comment talking about hypervisors, what is this string supposed
to tell an observer of the message in a log file?

Jan

