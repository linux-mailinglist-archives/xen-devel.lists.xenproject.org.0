Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC97E9D25
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 14:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631591.985081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2X0e-00041l-Px; Mon, 13 Nov 2023 13:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631591.985081; Mon, 13 Nov 2023 13:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2X0e-0003zx-Mz; Mon, 13 Nov 2023 13:29:48 +0000
Received: by outflank-mailman (input) for mailman id 631591;
 Mon, 13 Nov 2023 13:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2X0d-0003zp-Ka
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 13:29:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6556b8c-8228-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 14:29:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8576.eurprd04.prod.outlook.com (2603:10a6:102:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.16; Mon, 13 Nov
 2023 13:29:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 13:29:43 +0000
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
X-Inumbo-ID: b6556b8c-8228-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fxu+sZExBMslR5EY05M280R28x1ex36l5XZyDtpGO0Q+zLU1vX4JyxM4sahRJ28S1TyqVRNfDPaDREYKo2xl4XffGG/KC8hbFEOdCOvELAWxykavTHpB3DM012Vd0jMZ/0qRa5P1snmWTAILXiEpUz4VkTRKI0/1s9Qb27VrNMQO1Zxpjzu0A3wTJOIg33lO939yr6Ul5mAGyE7PaE1qNJDKnTKEBJUsPaXAvAi8vf4BtLbw053dgP/PjYV8GcQHAw99A2i2BG0Xt+0pIiaLJEV+aVujMmElOeqkhDaVWa6gW29BGPrdi2rjiIk0kdH7K6LO7HDGcF2GF7lD3eTuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3mTAlIySIX+TD2EvkwavdC8wcdUZn2d5Pzq+5klE8g=;
 b=DB+frUtiZ64ZAxFzfBeOVsIGojibih+Wo8Bw6FvW26r/G32HeYSkDP1b4EBQdXs6pFPcXY3RE/KRnDb7rXDMlN63k7rPhylC/ERYaOE3v/ui+ngf+6Wn4lSm8y6HaizZj7lBtKKAa8tPWS+QhW8dj9kjU7tzCmyMf21sVr6ON0rS5ajM8uRj8V27icK4M64ouJcXaW6WpvwLUTnz34Q1MWs97RolR2bmFvyA6S1jaPCM0rtLL44UjLeStYOmgsoFEghsTdHGWO3W4iGYD1fquvYeS3Kk6aaSmZRYqDfn967KpEO5Z+idsyMQxM3VX1uN6HkLiS6x9smmgfI6lmgjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3mTAlIySIX+TD2EvkwavdC8wcdUZn2d5Pzq+5klE8g=;
 b=YxzDbDOL1JHgD3dj+YTpL4lrlr5hhLeF5vG0NAVdiKaLRwvBh1tkJZw1aE8XExVrAAvmPqv3s0f7rCo8nKFbpu6YznUtFvkpTT92OJHBn0ENZG+8SiELfVWSyfV1tYs/cNqF53RBaIc+grLSiSIipgBgvRbVFPuIqT8uYkjDw+9AEds8LSdAkSUiwi3zXaruj0oUrL0xsuU4znodmd3YDucGTPmVjp7kBuAONHt8xi7yh8g8hAa8VDoNyNrhzBt82QbGGa4+X2TuCf7Nwn+RNRNSwKIvJcV3M5mPRMt7WSvuZalw5Uyzcu7bmnqOiv8Y92VEYavOxyIP7yH7q/hQkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4ae921b-b2c0-5eff-bf81-ab97a909b562@suse.com>
Date: Mon, 13 Nov 2023 14:29:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 03/15] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <cd1341ae337fc9a1619d747b3db1a7a5cd6ad2fb.1699633310.git.oleksii.kurochko@gmail.com>
 <928557f8d62941a2524fc67b7067a777e2180db2.camel@gmail.com>
 <4421cbf44ea8b434c68a7ed218d007d049c08e6d.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4421cbf44ea8b434c68a7ed218d007d049c08e6d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: db2d0ff2-b8b0-489b-53d0-08dbe44c98f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i+eLkG3hgmJcTfSZMZ3oBIvchCmQJfSaHHLEgrpR5ZaHBQQsJVLtu6wDKp5qyLwDHBJE+FURAUTMjXL2xmQkdn0KmLIYoqTlXp1zF9FaSJ/xLbg/L/2GgoEGiJ5C4XYr2WaTgubSZvYqv8MxfWtk19XY4eWioH2UjaWAa4ncVyy79yte5nlwgpZu8DztdoFPuxFbtttWHALuMQlIi13zNVsipvq7EySZJ0cMFQhnUp5shSLjrLn3CR33EYcErxDrAneOxBkl9mrzkj0oint4wTJh05/N4tqyqz0wXhqMBXGeIH2nGk9DAUbg44CUBDlvHOpQsXYCjsi6gIREE6xfE42+EcfQaREe2EXATA4sTBsEvbDedlVdQcjclRRwEUMpzFK3QYNIdRA8Z4ruvjiqsGZt22Q1WSaoB1mQFdcBMksFeDHl+lswl0HbuDHf03Rd3TBMsfuwEWxMSK/S750IR0r643ThI3P2rqcW/80mavqvgs9JXAjz+gzBnKiNFiQfxHkg4HOs/Lor81v/Xy7zHudpq9KuV3wZw3Apv/vlautx2b/mXzqgN5ZDyPZGpIcG/T2sBpzHQMXuHCU8cCE+ZMEZMehhM4YUJ0OExo+PbFF6jQCmjlKolX1mCFKMS0gT7MZ3JDde8JknmD3MRDDKxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(53546011)(6506007)(2616005)(6512007)(6486002)(966005)(478600001)(26005)(83380400001)(4001150100001)(5660300002)(41300700001)(66556008)(2906002)(66476007)(6916009)(66946007)(54906003)(8676002)(316002)(8936002)(4326008)(36756003)(38100700002)(86362001)(31696002)(66899024)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejF1TVBnKzVFaDFtdUxkY0Z6QWVtRm5yUDhWOEU1VU5Nc1kwMklsR1NQT2g0?=
 =?utf-8?B?cUttbVBsRGI0MFRWZWQvUndBUmZlZmVoME9lWnB5dk1qM3IrRTR5Ni9kcW1t?=
 =?utf-8?B?OXViWjRWeUxMOWZGQnVMM3g4TUJXRlFhY1A3QXVtdjhFSTQyTVpQMjRGZDhn?=
 =?utf-8?B?dGFkZDZHUytmakUvS0tjTG05OHZIaGo2RERQSUxqdWIrTFlRbU5STU9nKzZB?=
 =?utf-8?B?WFBFNjZnSGdQVDR4TEFKNnZ6bjNDeDZPTUR3K3B2bzV5eHZHNU9NTDg2RkdJ?=
 =?utf-8?B?WEYxQUExcTludGJ4UWxsa2RCZy85Y1lpODFsMlEvemxJWG1tdVA3eTR0NnJD?=
 =?utf-8?B?MmJjZ2wrMkxFY2xFNzBUL1hiQ1g2Y0VIeTFlWmNmVkIwK0hYMk1SL29ESEhr?=
 =?utf-8?B?VWt3TTFGMHBoR2FXZjg4SmVzRXpEOGU2RThxcmd6RXJtaXlqYkdMOGVBSUJm?=
 =?utf-8?B?RmlsUUFKZUJEUmcyUmxOdXpVT0FWUGF0RmhucEV6SXVBMTlOb2VlK3lWUjEx?=
 =?utf-8?B?emZuSms5TmtMb2dZLzd3TGg2enZudmoxTExVWEQ0TXlYV2l1azNsSC9HdWFs?=
 =?utf-8?B?Rlg4TXlGbW81SXV2RXRZR2ZiMkFBaVd5YzZUdEJrQ1BsOE03TmVSV1d4aytq?=
 =?utf-8?B?U1piVXlxclVXbjJlYnlLVTlFenFuMWJvMjVYbEJGczJicVUrWDNVTVJTUGpK?=
 =?utf-8?B?TUZCcE0wVHErNllwRHNHeHE1bjdJSXBkVE5TeW0zMnlNNlhvbW13cTNXdWNn?=
 =?utf-8?B?YnVDYlhSK3pTdmFuOWpmOW1Xbng1TmhQMUd1ZkNCRDVrZGl4VllnR3NCdks3?=
 =?utf-8?B?ZDdIWDBHS2NxRVhpNGZSWThyNlIzZ3h0eG1oNHE4SXZReU4xSGtHaWttbWM5?=
 =?utf-8?B?TDlhZ05LL3RpUFNWeHpHZTVLcTFXN0R5Si8xSGZVQnc5UUVXTGRkYkRJcE9K?=
 =?utf-8?B?ZXg2OEo5Sk5TbVJ4WWNNL0JlU3RqanVNZWpuQ1I5cERIeWxtYmUrcFRURTFj?=
 =?utf-8?B?dzNObThHMnozdlhRdHJzWFBvRmFZbGZ0VncvbzE1emFKL1c5UFZrV1NUcitm?=
 =?utf-8?B?ZmtnODJlRFdoWWxEOWdLKyszSzhPQmVwTTU5VUl4eUFPeGdPVDRaSWp0SDlv?=
 =?utf-8?B?ZEM2ME9RY3NMbXVwSTZXVThZVTV1ZmJJVm9DU0dZc0pxNFZvaGFwTWFSQnBk?=
 =?utf-8?B?c0MwWkFySStmaTFFaUpwYmNTbFBUSVZmVmJXSk1DdkNSN2drVXkzcEcrV2ZD?=
 =?utf-8?B?WlBjVkNWaUtXNTVwVjdBaWNSeitTOWZLdzlCVllYS3ZZM21pdisrd2wzNnZY?=
 =?utf-8?B?STlOSGlTK1o4d05rcTFTUFBScG52MytXQllRblVWdlVPVXMySHVEVEhVa2dl?=
 =?utf-8?B?Z2RRTnJRSnVwNWwrL2VxamhRdnAxUndFQ0lwR1lpT2I0MFVBUTkzL2pNODdM?=
 =?utf-8?B?ZjdySWRQMkdjRFhrRjh1TzczcVpJeVpjeXVlM2Z5cEpkZVNxcXJuQVpwMklh?=
 =?utf-8?B?QXJhdDZMWUtXdXJzTmhQQ21PRUxQYTlJdzNyblcrWXZTM2hsT0QvZ3owVkNn?=
 =?utf-8?B?dzI3eGFiRVlXWkI1UjJCeTBrY04xQ0E3RS8xcEJLVkkrRlhaVjVyVGQ4WlFH?=
 =?utf-8?B?U3JXVktlSmF6cGswc0RkcGdFaEQ1Y1dJUkNrb3JpMGVBSFM3anpGV0YvQUxv?=
 =?utf-8?B?WGRiRVcwLzgzekdIRWhNb3ZiZktmbXNJR1NyekpILzQ3VUgvQW1HUXFHS0ZI?=
 =?utf-8?B?OUZzVEhPNGQwWEF2bEN1Sm9sTHJvOU5pZGUzLytrM3ZXd05QKzlNa1o4ZUlI?=
 =?utf-8?B?V3JkeDRsclU3YVZtaTVHMTZNeUk3TWJ3UWhXeFhPZHhsSUxIM1d1eit0cEpG?=
 =?utf-8?B?Z0hvK1psTHBNcEx3Y2VsU210eDRqVWVSWjErY0NxTVErOEtGV2U3RjlRUFFU?=
 =?utf-8?B?ZmZPM2dveTNZd0V1VjIxQlRWZVRyRmdyNmhqS1g3ZERGTlVvc053TnZzS2FS?=
 =?utf-8?B?d2lXZnFQK01OZWFDU0g4eTA3RTVDbVlwOHVwWE91M1cvdHlwT01IZmQ4OElq?=
 =?utf-8?B?K2d0Wll6ZDNhMHozWjU3QXpaeG94MHJnR0hoeFJwNFRvUkRRdEZ3VXBKSTJp?=
 =?utf-8?Q?oeGVoFHqr0CXJy3/msIDEM1g5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2d0ff2-b8b0-489b-53d0-08dbe44c98f4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:29:43.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMj2NDliuKnmZUw52uwr+FGcRDIZnuZH3HfWgNHKOEIif2CyMVlPwn0OqVDdXgr5zI5vZkEK/f++GayNtwdogQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8576

On 13.11.2023 14:13, Oleksii wrote:
> On Sat, 2023-11-11 at 12:25 +0200, Oleksii wrote:
>> I missed to check the patch properly.
>>
>> The patch fails for Arm randconfigs:
>> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1068865674
>>
>> I need to do an additional investigation.
> So the only one macro cause compile issue if move it to
> xen/grant_table.h compilation will pass:
> 
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -23,10 +23,14 @@
>  #ifndef __XEN_GRANT_TABLE_H__
>  #define __XEN_GRANT_TABLE_H__
>  
> +#include <xen/kernel.h>
>  #include <xen/mm-frame.h>
>  #include <xen/rwlock.h>
>  #include <public/grant_table.h>
> +
> +#ifdef CONFIG_GRANT_TABLE
>  #include <asm/grant_table.h>
> +#endif
>  
>  struct grant_table;
>  
> @@ -112,6 +116,16 @@ static inline int gnttab_acquire_resource(
>      return -EINVAL;
>  }
>  
> +/*
> + * The region used by Xen on the memory will never be mapped in DOM0
> + * memory layout. Therefore it can be used for the grant table.
> + *
> + * Only use the text section as it's always present and will contain
> + * enough space for a large grant table
> + */
> +#define gnttab_dom0_frames()                                         
> \
> +    min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext -
> _stext))
> +
>  #endif /* CONFIG_GRANT_TABLE */
>  
>  #endif /* __XEN_GRANT_TABLE_H__ */
> 
> 
> But gnttab_dom0_frames() is used only for ARM, so probably moving it to
> <xen/grant_table.h> is not a good idea.

Indeed. But wouldn't dealing with this again be a matter of having
Arm's domain_build.c simply include asm/grant_table.h explicitly, if need
be alongside xen/grant_table.h?

Jan

