Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67574DB10
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 18:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561279.877727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItjG-0000o3-W6; Mon, 10 Jul 2023 16:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561279.877727; Mon, 10 Jul 2023 16:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItjG-0000ln-TW; Mon, 10 Jul 2023 16:27:14 +0000
Received: by outflank-mailman (input) for mailman id 561279;
 Mon, 10 Jul 2023 16:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qItjF-0000lh-9K
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 16:27:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e4a39e5-1f3e-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 18:27:10 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 16:27:08 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 16:27:07 +0000
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
X-Inumbo-ID: 9e4a39e5-1f3e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrAhFqAjnWyqSBaTHOOKfwqYia9Ua++C44SAcV5lPnAseExDQTgLl4q32elATUNcLrlmLlMU2XQJ9XM5kR5doZ3LeWlFxsnUWFlShliJqkeHeJ6jAlqw2hN8CFqe5FnidfGlGGTq1cBx8hfbJdYmc8+S73eU+SI0/aXUqKroNo3k+52qKdAt+rQYK0iULra4HiG4vlEqoE9eTjV3WFbqONF0f2JfQxNrGvEWVfSu3LkprqYI1WtMeWHydanPZaz8xVZR6ui6h9dDQigbI1H9dTaW/FyvjRNtzSt7zz+y1yM8BarP1wX5sa9oMHNWRaKUT3Q01pDbBuNae/GSUsycTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzBtm0/T/QzvcYKk3AIn+WHZc+OO+e7mpprAfPqkIXM=;
 b=Wt/ESUofCX4d5Ghfs4dv36c/knTCcHw6XkiBNRH6to3S6xqxTVWWGlfEp5DAz89ng4uF8x1j8gUzJAvLTc3r9xuF8ocl38biXH0QsrIg7ecm7AQkNfbah7SkA03kaMQ8tQfPBnHpahdHzjkyEbfYmJBP6YShhRokGusa3SPhlkl4E/HwtV9QUd9CW9XsicvuVbMbq9LPDRkc1z9XC5ah2iAWbKF+Y/uDLzQyGhbFOiE0prQFvEgtI11RyyPNPEawOktVsN9E13Xjg8tlWKWhZ+2Tu75PW13rK2kyyaVEfvxDvnIKJoj/7xS1ORiTCkLwmDegE5pAVhV0ZUWfm+hfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzBtm0/T/QzvcYKk3AIn+WHZc+OO+e7mpprAfPqkIXM=;
 b=AZi7r/qur70H/ivsI3a4IwqUiqwH6uRYOYkmYE82GIgncLDsPuyedFyJtAIAHlV3suoJ9OqrILoSpeW+Nsnov50cJ++d6GMkqAqBm+43FKzpa3/6lDcsOICQE2gXv9DRLSLI0XD7cypU2Zif6d8u+lhqwIHw2yxrm227dARRDoqVQp9bWbPwwIUSFT4l1WtFEAh2l0wCnKwLcix2M37dcTOGiF4kz44g694pRM3UZZ3hjC3b60WJ9otFfuVbFoODORKploeu2oMZ4lsuALbO8hILr1qv27xDrFRxrMnouU8lpNRoA9P1UH6SZz8oC7FTOriNvjxG7yLJms4agaU4fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9827433d-54dd-47e6-1f74-53612da21c14@suse.com>
Date: Mon, 10 Jul 2023 18:27:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] cmdline: only set ask mode if vga= is present
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230710141238.375-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230710141238.375-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 7391e6be-7538-4353-ba5d-08db81628136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cyzEVUN3EJJvSNqLoK45R7Uij4/k3e3C2KqtLnUOnvr2gijfATIMrTEr89/Zn1wSrOA65rLet930vg/T2B8CVbYJa3UPpsqmq/Y9aATBToIYTln6OKNoVN6n/GeciT/j3cNeDKxpPEtStQruQ5+rzjgIoY4CbVU42RZbXNbF1jQinW1za0IMnp7wfxGAFeJW6lyU9coNDlkiLomudHZG/1nMhXVHkm2UilmnS5WYtsai4WlylX13kohr+W43Y38jTWl/0viiX3Yo0pm1P9r5SwLM/RCOIyI//X2qCdcwXeVDIJ7gNB1dergniGmpDxig9w7GMhXFeVZiUoHfgQ77e3Kppwtpm33W+gTBJ0jKBHM9BE6ozbTARQjVHVe3a/atmnkgn95Bj/wx3/h6CYdkHuxfnCu+F3xOixgrWF9ZNENsPl+rPTOKhvXaD1Ab+A8FcUuyNNQYONHLV6yypUilBwsf6MSxL2MkMDzooMqp4MbFxNh5BSF+41xV0zdqYVQz40z5f75yypMp/R42cF/t1vuHKzHNiEw6QfbgN0WHsTQ6EzBWL4SmGQpP0zAkvfmvpLTaXGXlgdvzkn1ta342Vxtc9dNJZvbYgWGli38i5FxeDqaZky778mF+0oOKtP7/3zHi4XfqB3LmdsYKuXgqQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(31696002)(6916009)(54906003)(478600001)(5660300002)(8676002)(36756003)(8936002)(86362001)(2906002)(66556008)(38100700002)(66476007)(66946007)(4326008)(316002)(41300700001)(53546011)(26005)(31686004)(186003)(2616005)(6506007)(6486002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk5Vb3R6a0NTRXBGR00waEFCUTNudTAwV0tkbmw0Nk9wL25jMk5IUnNVSWRQ?=
 =?utf-8?B?MUNML1NuNDIwN2ZwdHQ2MFY2ekVHZFZ5TldNSTEwUzFoeHRMbzhDVmpqUWFZ?=
 =?utf-8?B?S0t1a1BLUnI0VHJHY2l1OVVVcFRFdUNPV0hhOWlkbnNhdjBjalFidlpNMjZZ?=
 =?utf-8?B?eGJyL3haeWdobjNVMTFWUlI3NXkzN2RpTG1QdVJWdHBCWmJKL201N1RrTFpS?=
 =?utf-8?B?NzBtdDhCV1JPaTg1NkRsVmdrVkErdVpQVEQwTEhWM2J4YmE3REhyL0RQY1NN?=
 =?utf-8?B?d1pzcUNkMDhYc3JzNFM0c1Y0NjA4c2ppZlJpLzhodGlFTWx2T3RQejBxSitm?=
 =?utf-8?B?N3VXOTYyTlltVFBKQ1RFcTUyYXF0WnBTMkJCNFN2M0NqWTlBNUFmdnNudlhs?=
 =?utf-8?B?dUtjbVFQNXpUQkNBRCt2aEgxUVNZbnFwQW9xT2E5VjB0bTB2d01JOXZlU0I5?=
 =?utf-8?B?WjY0OVg5NW9vTTNHcFh3UWhRTENvQzNpSDRMemZaRTFpT0wxeHMyWk95YkhJ?=
 =?utf-8?B?clNKSmhjejFXYXBkYTBFT2FHOTUzYlBzKzZOcCswNGxxWTROUWJVbmNybEVq?=
 =?utf-8?B?WndJMFdxVTluY1Y1YWZTbSt5elUxYnhrSGJmWWEwdm5ZRjBORTVralU4aXo2?=
 =?utf-8?B?bGNjeW9hZmltdGF3QjJzTi9CMWR3cWhzV1BKNUtjaUdQaGZLdmR1ZzBJVVgv?=
 =?utf-8?B?VFZMMk9JbHFvZmZGMGxmbm83STM2RHBwYk5VckFKRWI5aVprRFJtM0MwNm5L?=
 =?utf-8?B?RGt4YmI3MUdwL01LODNtazFVMnlURFRGRUZPOHlvMm16Q0pmeVFFOWZqK2pv?=
 =?utf-8?B?UlZiSWo2a1lCV3RtTzNqV2hQcFBCMGxhKzJ0dWZ2TXp6VTg4UWF3bHE2ck1T?=
 =?utf-8?B?L05uNUlYdlZMYnlJL0o2aXFjWWMzNU5hTUY3eHo0akpNTHY2MUlGNi9RSTIx?=
 =?utf-8?B?cENQOVZRYVY4WHhZWGRQT2pqTURyS05oaDVzL0p2M3RIekZXRmprK1lKYllp?=
 =?utf-8?B?ajNjM09NelptK1A5aTlhQlIxczdxaFk2emsxTDFZaFVTaUtFaEQ1SGNRbXRl?=
 =?utf-8?B?L0tZOWpKeGFmbW9qbUM0THBHenZRdENLQnpkMTIyaEF3WHdjYXBtU1lkTWJt?=
 =?utf-8?B?YlF3Y0tOUFViTzNFZWJaWGdEeUVMTndiY2ZCTHVwNk50YWJuRW8weGtTOTRO?=
 =?utf-8?B?NmVzTVQ4Ykt3N05BQ0JQTDN0dnduaGxzTlBNWWRuMlpGUGh0dWhPNXRTSnVE?=
 =?utf-8?B?TGF5TDFVVjgwcmQ3YWkxYWswbzVkR09uZEs4UENSNDhQK2JzQXhMZ3lMcDZK?=
 =?utf-8?B?UlNVcDNwUlhDNFY0bGtVR081N01CTFlueHZMdHZYSXNoZ09CeExxSThnaGhy?=
 =?utf-8?B?amV5ZzJ6UmMveUZoVmh6RHc2WVEvTWxyS2dLRGw1ajN2UGFkK1JIUC96MXlq?=
 =?utf-8?B?S1dFMVpoNTJCY0I3Zm1IK1NrNERpT3g0elJBaDMyQWFic1hBaEhnMis4NjRB?=
 =?utf-8?B?MURYaXRtcGJSYkNRc1BwL2VOUXdKK25lZTF0SHE0RVdWcnpXUlR6QUNIdVJF?=
 =?utf-8?B?Qm4yR1BNbjIyTWVHVUx1LzZGOVJxUlVWSjBNTnFGMkhJVmhGRlVEQlNGSTg4?=
 =?utf-8?B?bVR4Tjd1MjlQcEJxYUxiR0cxR21nUTdjTWdXODBHVjZPREMydERRckNTZzVu?=
 =?utf-8?B?ekFyU3NqZjRXMkcwM2Z6V3k1cGtPNC9ENzYybmswRDQ3OWJiRHVIVjFZVTB3?=
 =?utf-8?B?Ujd4SVlwMXRmYVI5bDhGSWorYWNFSlRTNGhoRXV4SzdXUXpGSWpyYTRuYnpH?=
 =?utf-8?B?U0VwUUNzMzdTdDhLbVVab1FieENob1BXUFJyaTIvTmIrU2o4TmM3MDZyR1FP?=
 =?utf-8?B?ZlNkbCtEb040ZityeE92eHRpQWg2RldDOGNjZUJYS0hscjJ2eXdmYS8vcVp6?=
 =?utf-8?B?WUphREtQQ3pzQUNpL09XL3pNZzhmVE1HWmdKMVVseEhSUVJ1bFczZjBFMHhj?=
 =?utf-8?B?K1NaUm5nd1gzOGY2ak1yT2M3MDl3ZnBPZFhVUWZlOTF1ZzlmN0h1RElTbUVq?=
 =?utf-8?B?NzJZM3lmVG01VTRaMUhsTmltUExtNCtkQ0JMQXoxbmVSYzQwZlZXTGRDaTlP?=
 =?utf-8?Q?K5HtcLcpQHJRE8Wjivh1+UeeK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7391e6be-7538-4353-ba5d-08db81628136
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 16:27:07.8859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6N7fAKrh16O4INxtHiIfSw9m81O8A3KBXhYpTCRRvl6Qu8kdnus+splPZoC9u3FJixeU9KzRo6i/zdfdG+DHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8642

On 10.07.2023 16:12, Roger Pau Monne wrote:
> Commit 9473d9a24182 set the ASK mode without checking if there was a
> `vga` option provided in the command line.  This breaks existing
> behavior, so exit early without changes if `vga` is not present in the
> command line.
> 
> Fixes: 9473d9a24182 ('cmdline: parse multiple instances of the vga option')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Should have spotted this during review; effectively you're (almost) undoing
part of the earlier change, just that ...

> --- a/xen/arch/x86/boot/cmdline.c
> +++ b/xen/arch/x86/boot/cmdline.c
> @@ -279,9 +279,13 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
>  {
>      const char *c = cmdline;
>  
> +    c = find_opt(c, "vga=", true);

... you use c instead of cmdline here (and I'm heavily tempted to actually
make this the initializer of c).

Jan

> +    if ( !c )
> +        return;
> +
>      ebo->boot_vid_mode = ASK_VGA;
>  
> -    while ( (c = find_opt(c, "vga=", true)) != NULL )
> +    do
>      {
>          unsigned int tmp, vesa_depth, vesa_height, vesa_width;
>  
> @@ -332,6 +336,7 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
>          else if ( !strmaxcmp(c, "ask", delim_chars_comma) )
>              ebo->boot_vid_mode = ASK_VGA;
>      }
> +    while ( (c = find_opt(c, "vga=", true)) != NULL );
>  }
>  #endif
>  


