Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBBE5A1605
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 17:46:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393490.632480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRF2V-0007bq-KA; Thu, 25 Aug 2022 15:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393490.632480; Thu, 25 Aug 2022 15:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRF2V-0007YX-GZ; Thu, 25 Aug 2022 15:45:03 +0000
Received: by outflank-mailman (input) for mailman id 393490;
 Thu, 25 Aug 2022 15:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRF2U-0007YR-3r
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 15:45:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00f6957-248c-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 17:44:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9177.eurprd04.prod.outlook.com (2603:10a6:10:2f4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 15:44:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 15:44:56 +0000
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
X-Inumbo-ID: e00f6957-248c-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJCvlaKe97pLnEUrGOWFpFBtLVPWVDcUnqclEqk1mwLx2TYWjgibQkwAIzpuTT91BM9YSuz4DWJMGKK+1zUVQQYtSmP3+yoMCK7/1UZKEaGua804YLbbNT8mZbyDZBueS30MFvixiZvaOaDeVIMVrcn9+Udn0KR0Ik2OJG7Bkfz+9Q0oZ4bDuVB83E4fQk88dS8Z3hHZzal4/RdfVtevB4qfKpctFbhbJdh7hhz9iPePicWTsVf/VhSZA+iz7vloBB+EMRe+Xx5Gchzh3Lk9i9eDBj7Lsov4bqMRjFg9KyTuK9wHc3pPfXoKTZaF2PoY+6ld3DqCU3AQQI0Z0o81IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOvEdHyZ5rTZoc1MJBHnVG7KzKZdD5hwPoXSmyAdY+M=;
 b=HdnIvP/w4pvX8FYMSkPFBG9JI/gJTEGLihfub2Dra3WeojZCr/lgMlWgX7KX7fYK7k40RTX38uqEMfZ0PgvsSGSGKo0q33XfjlzvSXVsTAgHKVt2qSFozSoqdi7o6USGPvc757YNoHIVeEYrtu/8dEw5KKNx2CmAoGh6zTzP+gZdp/G8FWAX6MsenIYuZYIJxwOgurZX6W2L0CMVl0NqnYy61523jc/S6/vhxsGykCN4kqOUSKGa5/EODA3HlAHTziPRBnJJBzjui+867HPmHaxDz/NCQ1qUr9A3s/CQwmUQhdSNiGDFyj1HOzS8ZBTJztk65J6W4zhQQB+cLTCBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOvEdHyZ5rTZoc1MJBHnVG7KzKZdD5hwPoXSmyAdY+M=;
 b=rIaegAscN6PDtUxuAwFr0RSF/krjycWdLP1HrpamCPB6dSUoS4kLH0XKAPYRgo3RL7cFC21hstkWxi0hN9otLraq3ussZ/TmgAT1v3eb98sKrgCJWVav2lo6g4zm9/MpCJ9VemUPFH9davu3SihMcO2JUISpzANTxt0ddu5I3P5nAxkA95wPDNXuRWU5yNynIyoMSsUqGZ//UuuWgcUOPYTcSjrLov2hvZ8jymJoxUBLAnfBAxu/Ye9R8aYmpNu7NkKRx343Il3eP+xGqDn3uY0+ZO8QCPrftPUTejfHP+YfcCG6KvKkp9TOC3UODhYg5EWCIxbdcvQ3cKMjEk6rHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b323ebc3-68fc-f6e1-b9ac-d508855a605b@suse.com>
Date: Thu, 25 Aug 2022 17:44:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <edff5ba0d286a41b94a6b4bb332b63228f7faebe.1661181584.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <edff5ba0d286a41b94a6b4bb332b63228f7faebe.1661181584.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0701CA0006.eurprd07.prod.outlook.com
 (2603:10a6:203:51::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 626b76bf-769a-44f2-2f84-08da86b0c2bf
X-MS-TrafficTypeDiagnostic: DU2PR04MB9177:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zC57F94HySqBtqD3Vg1ghgW6DG4tNZU6VX1cRSi0Xt1oimpL6RS1ctDcyuqnM6xAyezky/tDDNi2uBTdMJGSLnZnuV1/3xVcLkcWzDMBw6/8G+Q6paMTJ903qokUEIkao6A6PdE3rK9yrErFdjb9LghWm/cB0tu1xxea3DI4M7SQmsSr1KEne9DmXfR/q13UuPFdN/jyRGC5BK8eEP9jxqnZhAkiSVtTDRZsH8w5WrR5KFJH8VoSQInrNbasBRjfG4JQBFCd/FEgqcJu66uTS0o/M31XipW6khtwqpAEiIaB3Hm8pWnxkGIfOO9C32j5gI3/t7Rh6ANWVn/DE208P6im2YRQYSshYUNTR/iI5IJ2YY0QRTZPqO9PLlZFvOgBIJQBEr+FKRQwTCJaTh9aP4bi68Pv0IAxHlN8F7k0c6WR2vZyy90FE2zoR5ibSOG3yrxA1vPEWAAgpUqf/GwSGZvk6lcAbkiKvOqGLdX6PRzaCxgSbADTooyUyjBpeOxbByXOIK2jXSQmJnwaHqZiATpWv0vhAXMktqYbxxHld4Hohnlizt7FBn7u2uUbu4in4GZdUh5LWBO2zS4lmssTR9mukJFaMjb77XnTcdTmuLdOQqyB83QbIVqiOtKigYuQM8Dpztvm2tRnP81mZuzhH7hg209Ic541ohXH23dll+LVnznwL54q0upJU+hOwUjT4QnsF7wT4OEeC+BMVKrv1nkgmkPOxXiioIaIrLhx+oS3WHjPTwX45o6aOb0S9M9YH1Nbt6ax2jTp66Mvc41JrrI0KaDHuhJQZb+0T5z7OmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(136003)(376002)(39860400002)(36756003)(86362001)(38100700002)(4326008)(31686004)(5660300002)(2906002)(66946007)(8676002)(2616005)(66476007)(66574015)(66556008)(83380400001)(6512007)(53546011)(26005)(6506007)(41300700001)(8936002)(6486002)(6916009)(54906003)(31696002)(316002)(186003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3dpY2pFMFE3WVhHN0hXNy9VSUkyZ2dQaGN2U1ZpUmRISVVoT3ZTRDNRNk9n?=
 =?utf-8?B?SWdLd1E1QThPa01FQi9zVldHMWM5UVFqd0laU0tGbGZ1TUFYMUdGTTdkZGlZ?=
 =?utf-8?B?b1BIVndVYkVQOUVObjVUUCtSUmNSampGYU9hOUkyWWxPNVFweFVUMWg2VDEx?=
 =?utf-8?B?LzNDaUo2ejRyQTd3a1g5N0NNMUZBNmp6UzVrbTBGa3RDa0JKRy9wdnM0OXo0?=
 =?utf-8?B?M2RhVXlRcDFTM0ZjcHhDYUtuTnlERGVJZ1FUeTdQQStZeHRDSnNDZlY0T0RB?=
 =?utf-8?B?Rlg5d00rTmpabEdYaUhNcmtNRVJXdVBYTWMxNWttWnBCRi9oTzQxbjNoTUgr?=
 =?utf-8?B?R2Y4S2lKTmxXQkxxcDkwd1RZNm1IMG02RmFQUkFUSUtScEhNeUxLRk5vZGZP?=
 =?utf-8?B?Ti9TZXJLM3hRTEd1aUdFY0tTWDBTaGR0VkRHdE1TOHJ1YnZ4OWdGZkxZMUY3?=
 =?utf-8?B?d2VlMExDb1o2QjRHR20zUVh5MXAxdGtQYkNQdnVlMU1UQ2NaU2pTUVpieWpt?=
 =?utf-8?B?Ump5VEFGWHR4VUxmWGFqQkVHdlEya3NZamptMUJVMjE3ME1HYW1sUnI0Wm4y?=
 =?utf-8?B?c0dOeFExNDQrSXdMLzBRQzAxRFlZYU1PSmNtUEwwTmJpVHlRZDloUkdhOEpx?=
 =?utf-8?B?clhGL1daQXBXOVMwL1c3YzJ1MkV5QUNxd0x0NGVpb0NLaDZ6cUdnRGNybXh4?=
 =?utf-8?B?TFYyMVFpd2plVTBwOVprcVl1akJWYzMxTkNMZXluczg1Q2o0RW5ROEM0c3Nx?=
 =?utf-8?B?Wm9GaWFVUzJUK3VSN0ZIL3grTTZ1dlE5VnZqcWZwejFJbnFlL1d3MFhEbzZ3?=
 =?utf-8?B?eTBWc1k0b241OU0zU3liL3BnSE9zWjNNVS9aZkJ6b0c3S3BweDRibHl5VUFl?=
 =?utf-8?B?bXY1bXBWaTFLTXFxWjZPR0ZLMExoTkF5OVZ1bTJjNGdMdnJUTXdtNXkxN2Uw?=
 =?utf-8?B?TlFtNVlScWFLMkNoZ3pKeit3WVRvZTc5YXg2OGgvbzBrd2Iva1dEbklBQmh5?=
 =?utf-8?B?b1I4cWlVbkM3Uy9SL3JEM2Q0WHZWOUlTRTRyOGJ0WXdid1VpeXdIQXJ2d1V0?=
 =?utf-8?B?S1lHWmVIT2FkNlUyaTM1d0dlZVlSVHg0b3R3MVlGdEtLa2hGUGVkLzc3dDhY?=
 =?utf-8?B?ZnNEaVlJVUZzdVVaUndQbmNmQ1hMVDZ5QUtXMGdPcC9QVnlneHVSMXU5OFll?=
 =?utf-8?B?TnZOSEM1RkRMMDhpOTFHZE8zRlgvdWw0MlJ4VzZYVFlITjUycEJ0bmdwUjFs?=
 =?utf-8?B?QlVlUWcySFZiT3ZmSGMwT0JkSnl6bUxUdWx4T2w5NE00UldiWXdGbDV1MU5G?=
 =?utf-8?B?SEtlK2ZRRE42bHRsaVowWFJWZ1o3eXlXTW9tcTVpclN6NWtpTmxzTmROd0FM?=
 =?utf-8?B?endwTDBVNVpBcDhlRkdvZDJuaVZQcWV2SkE2TjdkWUo0ZGxZUnRGamRjcStB?=
 =?utf-8?B?YUtsdUR6TWZ2emVtNXFQZUErU2g2TURES1RUM2xucTVFcWgyVkN2NERmSUhP?=
 =?utf-8?B?WTdzWHMzNlFlTEJ1NWQzeVhPZVZZYXpPb3ovVnp1TWhKcXo5RFRTYXNTNzJi?=
 =?utf-8?B?d1I5U1QxazUzWENNVmUybnJJVnoxSWltT1ZtbWtGOENWc2h2QUZZeTBBYzlx?=
 =?utf-8?B?cEcvalJlYmFDWHZRUXFuN0l1emEwaU5FaXZucFhvSkVDNVMxZHVHeUZaaVBX?=
 =?utf-8?B?Z2orNlJCbWVMeGFYZERRRjM0czBVbkhkbVdOcFZkZjF3UlVVeWRGckhzOTB6?=
 =?utf-8?B?blo0Ymw3Yk5XemJOM0M3RTUwUzg1U2szc2NkVkw5Wm5ha1F4TTU0TThZeHlL?=
 =?utf-8?B?d0FUdWFpTCt3V1phSHFwcUw5RDRMbStDaWlObU45eWhwb0pYa25UNTg1dmpS?=
 =?utf-8?B?UkIrTGs0YWI2Mm1uc0hkYmMyMTM3bW1na3pxNDlmN2ljRmJUdE9McWdRSlFu?=
 =?utf-8?B?Y1MxSTBJVGpYSlRxWG4xcGhRRWpINnR2dFFMU3Uxb1BvaGZBNnZHSVJjR2FN?=
 =?utf-8?B?MElOdTFTMTBWZEswRHg4QlZrbjA5VzJEWENkM1lUenlJWnlhdXVUV2ZON3RE?=
 =?utf-8?B?N2F5RW1IYUZKR0tpYk9KdnF5TTJVbzVVSkh0ejNMVnk3emVBemQ5QUxtSW9j?=
 =?utf-8?Q?By7q2oHm9c23vIr3T7Qpsbz6R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626b76bf-769a-44f2-2f84-08da86b0c2bf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 15:44:56.7896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g08KR7rVRmlP2ttSStduJvpHtzSWIAcMkyq9jh5CgQwXXiFgEDdiGhPDIgJwdoV+BCkkCUo/4CwOOV7Pbvb7ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9177

On 22.08.2022 17:27, Marek Marczykowski-Górecki wrote:
> This allows configuring EHCI and XHCI consoles separately,
> simultaneously.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

But was I maybe confused, and much less of a change would suffice? After
all ...

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1058,9 +1058,9 @@ static struct xhci_dbc_ctx ctx __aligned(16);
>  static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
>  static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
>  
> -static char __initdata opt_dbgp[30];
> +static char __initdata opt_dbc[30];
>  
> -string_param("dbgp", opt_dbgp);
> +string_param("dbc", opt_dbc);
>  
>  void __init xhci_dbc_uart_init(void)
>  {
> @@ -1068,25 +1068,25 @@ void __init xhci_dbc_uart_init(void)
>      struct dbc *dbc = &uart->dbc;
>      const char *e;
>  
> -    if ( strncmp(opt_dbgp, "xhci", 4) )
> +    if ( strncmp(opt_dbc, "xhci", 4) )
>          return;

... this already avoids mixing up who's going to parse what. So right
now I think that ...

> @@ -1102,7 +1102,7 @@ void __init xhci_dbc_uart_init(void)
>      dbc->dbc_str = str_buf;
>  
>      if ( dbc_open(dbc) )
> -        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
> +        serial_register_uart(SERHND_DBC, &dbc_uart_driver, &dbc_uart);
>  }

... this and other SERHND_* related changes are enough, and there's no
need for a separate "dbc=" option.

> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -95,6 +95,7 @@ struct uart_driver {
>  # define SERHND_COM1    (0<<0)
>  # define SERHND_COM2    (1<<0)
>  # define SERHND_DBGP    (2<<0)
> +# define SERHND_DBC     (3<<0)

Please also update the comment just out of context.

Jan

