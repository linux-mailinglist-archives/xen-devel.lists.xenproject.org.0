Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86C6645583
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 09:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456018.713681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2pwr-00075b-Fc; Wed, 07 Dec 2022 08:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456018.713681; Wed, 07 Dec 2022 08:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2pwr-00072j-CX; Wed, 07 Dec 2022 08:38:37 +0000
Received: by outflank-mailman (input) for mailman id 456018;
 Wed, 07 Dec 2022 08:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2pwq-00072Z-1h
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 08:38:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8959ee48-760a-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 09:38:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 08:38:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 08:38:33 +0000
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
X-Inumbo-ID: 8959ee48-760a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOTBfYqFPsQCTi2PgehOpGHgbXpYIOezers0Y81zJtl2nYMSukTXrgaNBN9vfXV19LAGGSHsuhF2hvltLlPClLhV4hlBLgMZoEokYtSmmQTmTjP7fF6SuERP5gT4V2ce2S7wgmyYFHkdOWyz7RsYBmTeM1IoViCYzE5wGOyaW4gH10jipQtblgIqRWmFrEY8yCmr2sYFhp4kqbj8oFgkcEOlKd4r9b3ToKiSDKJgMA/SkookJ9eLZkh4zeQpWU1tRnJZtQfD1GdMexJzMayYo/iABaeZsIAPzPnwFc8RxsWroonWA8ZOKTJ3zhKJfTgXee0aVx/LpUvldh4QpTn9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl9icOvadYcBfPefK8H1y4p6Jsmqe2EENwuaB/xJsWc=;
 b=nRI02HF+YzCy09Tln6okbLM8K2j1kxH94OUr+FwJ+ugqKmC61ZiRieOlA38jCHRJ7d7m3sa4RL0YoNG92pSTMGkM3BSvo32Zc/1w7i/WZ0YehcAiiwxz0aWd3bvxZRPEsbH+DZSuNHA2Agy/QexYgfuiXL+Lm5ftKNmIV8ecyBuVOt0HMjKypq6h6/Xs1DtiXmjnLUbcYAfCzTYdKFfmNJyG6qXWk2FJCxS4ZKy/BNYvGAj05ghdB7vbHQ7csXMIlNPLC0KWN9zI0muhgTEgexwikE6r+HPpWbiPqlu5w+btlp6uzHC/aGlrxRaH5L8ThfWErz5TSOiDagWfo9zYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gl9icOvadYcBfPefK8H1y4p6Jsmqe2EENwuaB/xJsWc=;
 b=tp/7HYGG1quo9ZuHf1OeuX+gnymUazGw0a/sP/j/J/HhLZqetmQHgAduyci/57v6k9fZ5/O4GNquNAQzrfZOg43wXIz8m4zt/Dn9se1oKkmJ6Uj21hoQf8tyPtweH5KlQdreapaND3IQUqQ49/+k5cmEF+oG9xaRYbVSRB26Hl7pXSQltwxZ6VLgrROBdFKcNfEx6YA1uB2d0dSN3L7vuZH/vhVShiMh7jHos06JpdIYYYzd7RgMgfmsUqDs4MwJjoCYzsik671bHEZvDfAGNvAsb+hM8QCaI9Eh6q24yG0vJNtNBlHtxmgZf4eOqwYSi9kJuhMtxjqCogEI6x1CFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9fa2474-c7d8-fc76-0d26-97ad147502ea@suse.com>
Date: Wed, 7 Dec 2022 09:38:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XEN][RFC PATCH v4 10/16] asm/smp.h: move cpu related function to
 asm/cpu.h
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: sstabellini@kernel.org, julien@xen.org, Luca.Fancellu@arm.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-4-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221207061815.7404-4-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb5c1b6-b92d-4ffd-dd87-08dad82e6cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9TBtpdPgge/3xWWqu+X6onERBnPpMjfvcbuThvdPrfTjctY45g2tA2GVSzWtWlXTGqxowsXbhdCmJKW1IF11altobWCKdYF3zfEKh4lAjjj27TefbHjjo0DVOGi4kZAdM59qHNbc5259uL+bRhdVMwQGWSMUz1B/FC80DphVyWBO+48+IZ+2VevRmqTiVo4GjuF/O0vZvEHaauF5RHcMlo6ivcqZfcxet1M7xl785X0KvC5prBOOmlJu5yN3kzCJG5pxY991GqS7b2DzfBW9Hhzr5zTAF/ZoTvhMa182KrgkBsM20WFwD+6SEhIUhMNTc4DhKUbQRgwyZ7DaP7rMULMIhWmlpW/AmJ2HZ5rBRxmT6dY/cJRfr8Mq19mbO11FNXk7g1LhQ6zEBgrGnP8yfnBsdOAyUZAvfL39aD2nQkIQGH3rZZ1C+IHVt+lX7f1F1QZGqLSF2CGuAlH5nbaJLgxCFaJH365/I2HDQyzxX+4S2krJ6Hi4Russ14fIj/eF69oDAWdUGqRoDEdzvxZaEFok2WNYGuEmF+nS/FR58DajvNPyMm/1oMZEYra69DoL2C+0wYLsOmuQzaAxwTUS3kniweZxFFZPfwLfa0UdM1xC+Z1b0scuPUd0cJI2BxsBUTTH6nYVdwCRHUh79d98pJ02K4IIAICYzOVvhuOKYqAzo8QG46d6pkIF48ENHzKZR3XPfxGfj9iUgYDpvradToQ59UyPd6q0yH9eSlWtpz4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(31686004)(36756003)(31696002)(2906002)(41300700001)(86362001)(38100700002)(83380400001)(4744005)(6486002)(478600001)(66946007)(316002)(54906003)(2616005)(8676002)(7416002)(8936002)(66556008)(66476007)(5660300002)(6916009)(4326008)(186003)(26005)(53546011)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWZyMVV6UmVSbTNja3BWSlZiQjl0dDlnQnNITUQ5ckVuaUVYUkNqT0hDOHR2?=
 =?utf-8?B?RzNaOURlVThwRXhiQ3hIcm5WbFl3Kzhyd2ZDU2pXeEhDWks5VDNLL20weFls?=
 =?utf-8?B?TjZzUmZyZHk0bWlkMERSZ3o2UlZaMGZRV1U1NlFCR1JaNTdBNy9IbjQzeGpj?=
 =?utf-8?B?aXM2aDcyMCtYYUlSczhFT3NNRTk0ZEdmS29vNC9BUys3dXFrUWptQ2I0b3Bj?=
 =?utf-8?B?TEViaktSZGp6ZmFXRTZZT3lTZ3NlUm1yVkhlL04zOVhCTlRUUFMvbEZqSTZr?=
 =?utf-8?B?aTJ0TVkzK0NlVGkzZElPWUV5ZUk2YzFvajA5ZnQySENhcHp6V0hXQzRJMk5k?=
 =?utf-8?B?cUlIOEIxVzU3U1BDL2VTUGlMRWpMVnV4d2hweUp5Z09SKzA1UjJGWlBOTW5s?=
 =?utf-8?B?YUF2SUh2cmpvckp6U1YrWW1BYkdFRWFmU1BGbUF0Z0RZMUxBbTFQWW1Cajg3?=
 =?utf-8?B?S2VWTk9KbG8rREQ5bGpmaE9pLzVndmFrZVlCdlh0TFk1T1dSeFlldFQwZlJm?=
 =?utf-8?B?aXlHS3I1T0tMSHNRdnpMd1dCSFJ1QkEzQm5EdTJla3FSRXlkaWdpSTBidEdX?=
 =?utf-8?B?eGpvSlNrNFhLdW9mdGdYR00rV3U2UnFUS1VFdTF4Vm0vd3FiU3JLZkgwMDZz?=
 =?utf-8?B?Ukk0d3NFS0pkcnRBVnl6ZDh6WXFWbFV0VEdXUkIrYVNsN0QzL1VxMlc0SFNl?=
 =?utf-8?B?QzdWRzhUcVlTSmxxbmtVWlE5VEhIbjhlV1R1MlBmVGxKM013SFl0NVBXNStn?=
 =?utf-8?B?cS9Hd3krek9neE9pbjRwd3JtOVFpbS9WdVFMM1pLS3E4RStsVEVZeDh0OXBU?=
 =?utf-8?B?NEdYTW9MaHduZWlqdzd3T2ZJNlo4WDMzZ1BiakxRN0x1bEZLTUxYNWJ3cmJC?=
 =?utf-8?B?N05vNkMyeWhIeG0yMGdjdWtrZGtkM2I4OHRPQnJPQjN3Z2FheXVCbzdFNkxp?=
 =?utf-8?B?cHVLSW9vbWlNWHFmZFBUejkzRHo0NWdGdi9PaDlGdFVEbjdVa1FFRGJ1eEEx?=
 =?utf-8?B?Q3A3STFNUFJDWWhjcTNkZC9ReU5FSjl3MVl2ejFxYW5nLy9tME1IK0pHd0xm?=
 =?utf-8?B?aS9jY09WeDZRcW12N3FvV3NISXNNU1ZxSTJNVG1sVk53WjZtU3lRRjJJaWY0?=
 =?utf-8?B?QnZ2WEpteUVXUzNVSFFrbmRxbUxkT3dVQldZTDZzVWMyYkFDUzNia3U3QWwz?=
 =?utf-8?B?bW1hc0FmUmJtVGhvTHNHb1dVbjV6UENOR1NnbWJCYjkvKzdHOWowdW9TYmRa?=
 =?utf-8?B?emtHd1JGOGVadnZKVHRrOC8ydUYvTTNtSHJTK29DT2VQTWdrelAwdWk3eUs5?=
 =?utf-8?B?eFZEWG90RGxwTGtoeXVGVXNqQzd0V0VwVXRITFVWQmVRdjRIYjZDUWsxeDlU?=
 =?utf-8?B?eFBad2M5TWhvMFVrMlBLaE1vU08wek92aWwzbko3WVJPRWV5MUpONVlRVm53?=
 =?utf-8?B?UkY0cGJIV0tta21QYVZOL1dYTkYvdEZQb1hsSDRhYndkd1JmS0FqVnFDWll1?=
 =?utf-8?B?RjAyL25JMDd0SmQyaTlHWlBTeUNrVzNmeFh6aWtCRGI3M1ZXcjBQcEZSQ3lv?=
 =?utf-8?B?UUtUYVlzejljREsxZ0tvVFFTTWJWTWFXeW5Xc1dOaU0xek9GKzdQSFdIWFlu?=
 =?utf-8?B?OExOTDNmRmtpSmxwZ1o0NDUvOVNSYmJLMUgrNHpadzZobXVGdHFxZk9wdDBl?=
 =?utf-8?B?RkIwTTFablBrQVhJOUUwNjhaY2hFdDA4VWpHOVh4bzY2OFViNm01UDVkWHov?=
 =?utf-8?B?QjF1R0lYT3FtbEROOTNKVGMzQWxKQXhzWWhYMGxxbGVzU3JGS0ZZdVlYK1dL?=
 =?utf-8?B?Rmp3MlNGRS92aFdPRDlFUXA4K2liZzlwVkEwVGhYejNqbHBpL2pRU2MxS0U4?=
 =?utf-8?B?UHBna2thU21ndGZUVk1LQ3dsTEM5R3VwZHBvekdITUxrWnZsejVibDZRN3ZH?=
 =?utf-8?B?bk1ZZmFDdDdtVmF3Q2xyVHJaWSszTEcxOWpSeUFQOWVvL1ROcGpoTWZzK2t2?=
 =?utf-8?B?TmdUeHd0U2tZTGVBUGh0TlFLYWZ0M0RPaFJ4UFJTQ1QrUnl4RXJhZitJejRo?=
 =?utf-8?B?NUt0QXZvVWluWkJmVndzRUd3b0tOaUQ5dmZiSks1NitVQ3RCRngzNFpoZkN2?=
 =?utf-8?Q?kLCVe+N8NKMaaSzpYSHHw/7i4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb5c1b6-b92d-4ffd-dd87-08dad82e6cec
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 08:38:33.4997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vh8jrED0jt0TxyLMLoNjzC9TUnyo1gb3gs0xqGt6xzWJWlTBf3/WXvFRRHUJovBFCWuPQTrEv2ggUBV3ZSIsFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

On 07.12.2022 07:18, Vikram Garhwal wrote:
> --- a/xen/include/xen/cpu.h
> +++ b/xen/include/xen/cpu.h
> @@ -5,6 +5,10 @@
>  #include <xen/spinlock.h>
>  #include <xen/notifier.h>
>  
> +#ifdef CONFIG_ARM
> +#include <asm/cpu.h>
> +#endif
> +
>  /* Safely access cpu_online_map, cpu_present_map, etc. */
>  bool get_cpu_maps(void);
>  void put_cpu_maps(void);
> --- a/xen/include/xen/softirq.h
> +++ b/xen/include/xen/softirq.h
> @@ -19,6 +19,10 @@ enum {
>  #include <asm/hardirq.h>
>  #include <asm/softirq.h>
>  
> +#ifdef CONFIG_ARM
> +#include <asm/cpu.h>
> +#endif

We generally try to avoid such #ifdef-ary whenever possible, so the
description wants to justify these if they cannot be avoided.

Jan

