Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB3589D4F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380426.614569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbc5-0006x7-Ot; Thu, 04 Aug 2022 14:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380426.614569; Thu, 04 Aug 2022 14:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbc5-0006vC-ME; Thu, 04 Aug 2022 14:14:13 +0000
Received: by outflank-mailman (input) for mailman id 380426;
 Thu, 04 Aug 2022 14:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJbc4-0006v6-7Y
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:14:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80081.outbound.protection.outlook.com [40.107.8.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b55b2586-13ff-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 16:14:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4674.eurprd04.prod.outlook.com (2603:10a6:208:75::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 14:14:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:14:00 +0000
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
X-Inumbo-ID: b55b2586-13ff-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgcutbMdFrHM7NevH5EOloYyvYbNZaSDE5Z2jbGwKSHFTZgioYzCn7mseKQiLVKrKeTtI7D3lWBM2ewS6rWhBx9b0zz5Ljn/w92UUpfkgJAlN1TVS8DUyNoqQjeKZBLCvUV8QcHzmEesoFDqEOh8K3GC2L3D+yyotqHxKFxDQM+YgYsT+WQVnhSVKajcsmJzgeQOU0gBtihjHPthxsA00+AMfYAwSrynyc2uGUMWoQpGL/laWn5kHmnZHX/CAqYUOovb+OX61KPVNuvOWUAWMjmiiIkkTkiuaH+bbOz0ypSWChXCz0NWVm9YxH9rSSIDBxDrgKQ5/NMKPM7xatsITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTuDKxZ7q6XrynJBt6sd1xWkzC4emYIpt0uOrgjtYzI=;
 b=MTVtO4OyZYYyrXtS8Bx0JFuQ6DBzojcMS8GqcE8fJshth5kuemJJ6oF0+JPFvuicrfGv+sgVXHP83Uz1ZXfFP35bwlVIwlGjSWDXSaxjoozrQi1DygJC43QGnnznP2/zoGAaApIMxoHRTMqNMR7K10qZYJ2NRgtmBfT36tSfmW94BjTHIECKv7fvY64nW0zhhSFzfqn/L8R7gHafje5+KFAjysKED+UU6ooNh/CwTmDCp+TjCrGPL9BGl4dda5xzhjFBeKRcTOc+7w9kRtesGyjQ/IJpS/rjHgF5ZALpxTB0QM2HWlWzwij1TdTOt2EXquwKPUXlfnk/65lD3Y4bUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTuDKxZ7q6XrynJBt6sd1xWkzC4emYIpt0uOrgjtYzI=;
 b=P2ZeMP5n2EVcwP2hP733HLkfPh0WLqtP03Hgbq9gBj4ZxJFXVf4nODfpla0dsVF1IJRS23HHsIxjEwjNE2Y/Q9mQyXsA6k7FMLaNpgaJ6K+kNdp+5CPkM0rrfsHyulGKpjbWkD5huxUs+Dddm5NsfkuTXNGDhX3kGPHCz/7WSo1YSy8XHKy0DPT2JfQlKPaJtZYDW/y6gm5qMbAXqdEZM17lYk57HwKdGNHlLstSElNBOuJTaoDcgBpwozOmi3iBL7Z3x7TLUeHS1VwkhApjTSqM1PnJ9Bd2sCMpEVmFfbSTpLr1w5CX1g2PvIm4ANDu4gNBa//coGQged1LITRIRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9ddc9df-82ad-ad92-a5db-4a0e67dc972e@suse.com>
Date: Thu, 4 Aug 2022 16:13:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 04/10] console: support multiple serial console
 simultaneously
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <14411aa674b61d22d9626a3455206454793b6a37.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <14411aa674b61d22d9626a3455206454793b6a37.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0245.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3daeee16-2473-4935-6257-08da762393dd
X-MS-TrafficTypeDiagnostic: AM0PR04MB4674:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tKWIpW4TPcUl1wccRztqsD52WPzE3r7rAEj8s14PI3wXbhpxbUflNOhZ+oMkk0xtjX6r1JKIHVsihMBFgVNE7Nm1fgIHufVY6zoKN/kEcCc5Vn8rW7fv4zZh0+5ye9IxRNYf+v5Rv0m03kPTI9Pd02MVLYkFzNU6rN4EEvaIddBx2h5Dsfe+yEwMMaexyHWtPwBoJRxJEI9LftJawZJHLl+KQj0STsn/DHEM2NnYzjeLL1ASTOrcWdPYklTmuDxLQ6FRoVu3v/xcZoQnYQrHViBcel5ZsxFmd0gUusmA7b8+pa1PrBjcNw3nnG8lHilLLMzANmpz18FZl+RLUlW1Og3zxdvkZLfgYo20x6D4RR5z7gTJpo6RG5BD+RxyhGo+cuNE2eYa05KkbH4Q87l8rYtCjvjtqrfSyMtTVpNhWHtzytUUXgAeN6tWghL0N5E9vgSdCZ5SZd97UUohr8N59KGn1p8G+G/T8LsUcfKRyI1LII7VL6sJe2KTaK5vaWmfo1E2fydJKAhVwcMQPqAcAYp4NvXc6nMucI0xzrH3VvqsVWZx2HO0amfpBZaX0+a+A/KcEtzfCftLX5pSM20KCrR/cf30avI9nMjcJptG6BPjyzFL7EtP7e0tFLrg8GJ4JHUkcs4tJm22SFTFaWn6pyBT5Aa6mPXHBXDiA+clCT8exv11elZtnSh769xqSTgLbdr5fGyT00lfThlGG1kuTsA/wg7RWawUIoeJVhK0BnIO5B0Lu3uC3QlWNRxbxbIx88nynz9OdQBQhEWiWuvbYm7Pgi7yHrn3hRGis62+QpPvTAAnK6UnqQtwfY98PnUvv/uHHanSDveq3NTMRy+IJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(376002)(396003)(366004)(2616005)(186003)(26005)(83380400001)(6512007)(53546011)(66574015)(6506007)(31686004)(2906002)(36756003)(6486002)(86362001)(38100700002)(316002)(54906003)(31696002)(6666004)(6916009)(8936002)(478600001)(41300700001)(5660300002)(66476007)(66946007)(66556008)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azI4TW1KZGJHL1F0NlppMDBPWXR1cTJsWk5Xd1duSjBQNXNBMmlDNGJUY3JC?=
 =?utf-8?B?SC9jZW9oYU1XYnk4OWltMHEwR0s5VjkyYVdQVGpBcnJaeWFHZHdBVkFJU3FJ?=
 =?utf-8?B?bEJDd01lZ3dPNGlkVEhOVmc0TFBTeGNMYlZBdWs4b3JVd3pQd0dFUWhBcnp2?=
 =?utf-8?B?SDduY3NRNHhrcEkzVVBtOW4zREdHZzU0NW1XNVl6TWdPaG5vNzBLTlowMytZ?=
 =?utf-8?B?MGMyMUN0MTFWQnJ3cHVvRzBWRXRxL1p3WVo3cDRXTlZXTGM4bi81d3BxeHhx?=
 =?utf-8?B?QzJrL2FkWFF0SW9uRjBiM3lVY2ZJbUVaV0tkbjBYV2Nzc2I1czJzeHBCY3lj?=
 =?utf-8?B?WHBwRFh3d2pFRk9SeldPaEwwSVJnQjFlaUFUZnU3MlVxSUhBOGwyQ1Q4Rmcx?=
 =?utf-8?B?MkhCMVhaT3FJYk9JbFdkaGppVzlJSGUrQXJTUGIwU2U3bXpvdDRLZzVZaGNU?=
 =?utf-8?B?VStqUEFwK0VCYjZ1UHg5SVNJZ1FFM21tdWNtME8xRFdFTUEvOTVyRDhkdkVz?=
 =?utf-8?B?dGxJalBiMWZVZ1BCK2gvUTBtR3NIeUNvcFBCZ0J1cFhtRUl4Kzd2Njg1dXEy?=
 =?utf-8?B?MmN6RTFDTkpKR0pLNTcyQ1BUejQ0WHFrbENVVEp3bWs0cElBT2RZeFM3ZlhQ?=
 =?utf-8?B?emlwOVM0N0RCQUg5SlJaL3M2a2htVS8vUzdOV2drUFcrY1FWd0dBTGdMUDBV?=
 =?utf-8?B?cFpCbm5ndEpEa3JrelE2SDFxZ3NlUnJLRWlsVUxlcnpHUnArTmUxSkFoaUVB?=
 =?utf-8?B?dTBsZStiOGFYY0JUU2JrdStvUVFrQmF1SXJ1czB3OHBEeEtWdG5Hek1XWVho?=
 =?utf-8?B?RUF0SlpPZVQ4dk41VDlGcXRlMi92WDdiY3pGOUdxOXpJdi8wbVlWUW1XUGIy?=
 =?utf-8?B?VHo5bUdhZTZrNmdlcHJ0dmcvVjRUZkdOK3JEK0NsQmJCU1FZWTI1UlFlZ3dS?=
 =?utf-8?B?bVBNeFJGMGEwQ0RFYW1rUHNvaWFwM1RhNDJZZXdNalIyMGUwbWxuS2o4dWF1?=
 =?utf-8?B?VjI0TVZzdWt0Zmtxazkzd0JvblVEVjVoS3BzMXhWRkdkQ0xVdk12N2U0TjNV?=
 =?utf-8?B?Mk1jazdlNkxsVDUrMHNrVmlTbFl5U0pBcnBZbFhMSEtvam15VjFzZHIyZ3U1?=
 =?utf-8?B?RXR2d20vUnBHaDZBUloxblFRMEVYd1V1THd5N1NhQWZHWmlTeGo2RXQ0YURU?=
 =?utf-8?B?SFZUeG5RK1RrN2JyYUFtazhJUWZrL0o0dXZqdXhjQ1VvNXNSNEdoejF0WTY4?=
 =?utf-8?B?LzFmbXFtd3FhK3dmK3RUVU5xMVluTDBKc1JOTFBjTFZzQ1BoVmhwMUZBZzF5?=
 =?utf-8?B?SUlaVytiVGo3MFJTelVBNzVNQzdndzlyaXhEdnFOZzJvZWw3UWZVcWVWYmRP?=
 =?utf-8?B?dXZIL3BCRUUzSUhPcGpLSUxvZ0pUOGlhM1QyYmJTOU5sNDRNSS9QRVBDQXNq?=
 =?utf-8?B?cVBrTlloNGw1eDgxRmVwa0k3c0ZkZFZaNnNmTGhKSVNHMGUxV3RJNlU0R1VO?=
 =?utf-8?B?Q0tiOEh5MG1kZzNSYVpWWnl3YzhNaUV2WkI1RDlPZCtQVlpqTkdaR040d0pF?=
 =?utf-8?B?ZHE1WUxmNTBLZU1ibG4wVzc2SVh0akJkQjU5MHlCTjRYVnQvaW1SYW1YR2xB?=
 =?utf-8?B?Q2NCR2lqRGZRWWExNVM0WmtLM0lRWXJZbUZMMDE0SGZhU0tIeFNjTVpXSzdN?=
 =?utf-8?B?clM2TTAreUJnYzZBeVg1WVdhVjFMUDFiZlZZcFNDekVhamM4Q0x0ZG96dms5?=
 =?utf-8?B?NEFnNmtHb3lMa1lmSTJRbmhKRXhibVhWR2had2RPejdtNHM0aHVrcjgycnhZ?=
 =?utf-8?B?N01GQ0Y0Unhadm1sSXlZMDl6NENZZ3BuRG9zOC91U1AwVmFKQ21OS3N6WXlu?=
 =?utf-8?B?NHNpYktwbmNzT0hFS1dMUy9OdzYrMzVteWdocklOT1YwazNVOWhTV3I4QzVk?=
 =?utf-8?B?bkYrK21HYkQ5REZkUmtQTDMydGtKcjBDRFFKS1ByeEttcFkvZ2cxcjV3U0pn?=
 =?utf-8?B?THNDK1RyeWM1V3JxY0dHVWI0bS9qZmlSVVVhdmNiQTRMenhwOWRENUY4aitH?=
 =?utf-8?B?NVMveXBmVDNrZW9QWC8wN3kxZGF3allPc2E4NkhBOXJsMGdqckdKdzl0QVh1?=
 =?utf-8?Q?B+H/NP+WDpIDK7VRTkerdub4g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3daeee16-2473-4935-6257-08da762393dd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:14:00.4757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BixZTVESVwYSQhajhCSYhUF0f9qJDv0DkKGYiJluuRYD9EwPmJy+lY9nVZK/qZjefcJeETTT9yapXrzuZJ+dqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4674

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -85,6 +85,17 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 16384 (16kiB).
>  
> +config MAX_SERCONS
> +	int "Maximum number of serial consoles active at once"
> +	default 4
> +	help
> +      Controls how many serial consoles can be active at once. Configuring more
> +      using `console=` parameter will be ignored.
> +      When multiple consoles are configured, overhead of `sync_console` option
> +      is even bigger.
> +
> +	  Default value is 4.

Indentation (the help text ought to be indented by a tab and two spaces).

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -113,7 +113,9 @@ static char *__read_mostly conring = _conring;
>  static uint32_t __read_mostly conring_size = _CONRING_SIZE;
>  static uint32_t conringc, conringp;
>  
> -static int __read_mostly sercon_handle = -1;
> +#define MAX_SERCONS CONFIG_MAX_SERCONS
> +static int __read_mostly sercon_handle[MAX_SERCONS];
> +static int __read_mostly nr_sercon_handle = 0;

unsigned int please.

> @@ -393,32 +395,59 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
>  static char serial_rx_ring[SERIAL_RX_SIZE];
>  static unsigned int serial_rx_cons, serial_rx_prod;
>  
> -static void (*serial_steal_fn)(const char *, size_t nr) = early_puts;
> +/* The last entry means "steal from all consoles" */
> +static void (*serial_steal_fn[MAX_SERCONS+1])(const char *, size_t nr) = {

Nit: blanks please around + . But with ...

> +    [MAX_SERCONS] = early_puts,

... this initializer you could as well omit the dimension.

> +};
>  
> +/*
> + * Redirect console *handle* output to *fn*. Use SERHND_STEAL_ALL as *handle* to
> + * redirect all the consoles. 
> + */
>  int console_steal(int handle, void (*fn)(const char *, size_t nr))
>  {
> -    if ( (handle == -1) || (handle != sercon_handle) )
> -        return 0;
> +    int i;

While from the use inside the function this would better be unsigned int,
I can see how that would be slightly odd with the return value. But with
overly high a MAX_SERCONS ...

> +    if ( handle == -1 )
> +        return -ENOENT;
> +    if ( serial_steal_fn[MAX_SERCONS] != NULL )
> +        return -EBUSY;
> +    if ( handle == SERHND_STEAL_ALL )
> +    {
> +        serial_steal_fn[MAX_SERCONS] = fn;
> +        return MAX_SERCONS;
> +    }
> +    for ( i = 0; i < nr_sercon_handle; i++ )
> +        if ( handle == sercon_handle[i] )

... the array access will degenerate when i is "int", but will be okay
when i is "unsigned int" (and of course everything will break if
MAX_SERCONS > UINT_MAX).

> +            break;
> +    if ( i == nr_sercon_handle )
> +        return -ENOENT;
>  
> -    if ( serial_steal_fn != NULL )
> +    if ( serial_steal_fn[i] != NULL )
>          return -EBUSY;
>  
> -    serial_steal_fn = fn;
> -    return 1;
> +    serial_steal_fn[i] = fn;
> +    return i;
>  }
>  
>  void console_giveback(int id)
>  {
> -    if ( id == 1 )
> -        serial_steal_fn = NULL;
> +    if ( id >= 0 && id <= MAX_SERCONS )
> +        serial_steal_fn[id] = NULL;
>  }
>  
>  void console_serial_puts(const char *s, size_t nr)
>  {
> -    if ( serial_steal_fn != NULL )
> -        serial_steal_fn(s, nr);
> +    int i;

unsigned int please, again (yet more further down).

> +    if ( serial_steal_fn[MAX_SERCONS] != NULL )
> +        serial_steal_fn[MAX_SERCONS](s, nr);
>      else
> -        serial_puts(sercon_handle, s, nr);
> +        for ( i = 0; i < nr_sercon_handle; i++ )
> +            if ( serial_steal_fn[i] != NULL )
> +                serial_steal_fn[i](s, nr);
> +            else
> +                serial_puts(sercon_handle[i], s, nr);

This for() would better gain braces.

> @@ -977,8 +1006,12 @@ void __init console_init_preirq(void)
>              continue;
>          else if ( (sh = serial_parse_handle(p)) >= 0 )
>          {
> -            sercon_handle = sh;
> -            serial_steal_fn = NULL;
> +            if ( nr_sercon_handle < MAX_SERCONS )
> +                sercon_handle[nr_sercon_handle++] = sh;
> +            else
> +                printk("Too many consoles (max %d), ignoring '%s'\n",
> +                       MAX_SERCONS, p);

In order to use p here, I think we want (need?) to make
serial_parse_handle()'s parameter const char *.

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1078,8 +1078,12 @@ void __init xhci_dbc_uart_init(void)
>  
>          e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
>          if ( !e || *e )
> +        {
> +            printk(XENLOG_ERR
> +                   "Invalid dbgp= PCI device spec: '%s'\n",
> +                   opt_dbgp);
>              return;
> -
> +        }
>          dbc->sbdf = PCI_SBDF(0, bus, slot, func);
>      }

Does this change belong elsewhere?

Jan

