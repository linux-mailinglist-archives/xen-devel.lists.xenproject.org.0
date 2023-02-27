Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F696A4208
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502521.774374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcxk-0006CV-7h; Mon, 27 Feb 2023 12:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502521.774374; Mon, 27 Feb 2023 12:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcxk-00069l-52; Mon, 27 Feb 2023 12:50:40 +0000
Received: by outflank-mailman (input) for mailman id 502521;
 Mon, 27 Feb 2023 12:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWcxh-00069S-Sv
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:50:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54306c4f-b69d-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 13:50:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 12:50:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 12:50:34 +0000
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
X-Inumbo-ID: 54306c4f-b69d-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzOoGP09TyknkK86hONgnd3WusulZfODsiaskFohOrtwqHJzgUlKelJ/4TeUn/8rgr83Db+jP8pAV1Sx2LqhgWMeFD9rkMaHuHXgg8EMHo6t3xpXhTcqF+b1akPv/WBQJ4b8fq3hpMUwou8tFMoCmdfkmmrZo4ImD7rMi8rOxvw30Du2Gk2C9uZ2jn4sDYFT9K1dNM2o8l9gZTMo8QAZ1HQOt2iyWPwy6NcLRYpu6qnoh023fTBl82zzQmnutKkRNdNc/5DChQ9M+xPt4QWNTxq/nbL3Jg8mLKUrukL8gwanRyKR8H87x7jEgl/nbvIMIt2OvjV9WOyWHBMpyhqkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY8LEK2B6hlb+oj2c9Iw4wZ82eXPqpeP2A9YpklpZLw=;
 b=fO7S76DqNvwnxUKjhNKZBZy8KkSv1vQBC8zr4BeJTGyZN3Y9JlXwWIJUjoJvFCHEkpo3iGC9F4w/GMIswnxA2u/fiDAnAwYH0mZahCHNtxcWCIDelk+q4ivnnXV89HSRAunSDak4a911IW7vOwZt7o7dTg+tSMPLIo5Fh1NYAStYZBCWLMBd2j7CITBU0CL5CJg1YBhN2Wn9vtXVG/rGEmSuXbL0Oy1tlBZp2yrJU9wJ5UitS+ZBGbLdC8mDy+HgpWlsEaNS08TjL5x+O8GVJ60D2BQUYS3r8vOJa4knmoyDTS6Jqeg+0PE3TvxVDrtawXPWe37DAab9iPVjUXX4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY8LEK2B6hlb+oj2c9Iw4wZ82eXPqpeP2A9YpklpZLw=;
 b=MLlGapuaCpBeq6kmyoLkcr+dP7//WoyKN8H1HI86NS/+eN1n1/NJ3N9DBd+ASzX3vWKbd2fOG1IFlSHTa/tp97WpxgaDX50/dHmWbUdPBQKXCtuLm/wdoWq+gNIUZZ7s2PO/jDo1CRVWNXt0HU2VLI44mpimiSeLM2uzh8mKGif4/+ttWzm9sJb375tfbhlHfW4jOkq5fwqnLioItFm/aIxT1EfGebZwRqwsssaGb7NyVpI+wHFdPuojgc+H2ULvS73hOZDEPacuZkUUuswC9zjN3vHp4ju1yzA255VotBXqbId3PMRF2pzB0rV5woqtEt6oJMHlDznSkzAE5SnjoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcfa24d7-20c9-b460-32d7-7567b17c0b32@suse.com>
Date: Mon, 27 Feb 2023 13:50:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] xen/riscv: introduce trap_init()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
 <b1b2252d3105eeaf0cee10ae2be253c8526d0e5c.1677237653.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b1b2252d3105eeaf0cee10ae2be253c8526d0e5c.1677237653.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: dab56dff-c3fe-48e7-9ca2-08db18c1378f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b0AwPWnkb5DdG1AH/Se/hBLKeWgTBw3oAx8Kq7BnkrnjlCz3x0MMe7mCUQtbibltntumn/GUBhGpM+ddmm3WXx7bvnw2fuQT6q3flNH79pz6bI6g2DqookAk5uXnXEbEAhbzYI6Z5IvgLbruA3fzZA7uBpVJqO9eBv8hOJw8YVVYeFSybt5vZ6HiPScaO16JF1eVvChUc2Q5fL+tJHVsZv27jr/Jk5+S9KJtXb1aWwm9vp/d4oH4xCXOgqCl7IiJJRqDkPEstRwFP5W+rEYDgIRF5T+Ed4520uXYnyjAEmXJGCbDmIo9sG/seftkGlpRS5LNYe5zxgyulbf4qiKKIlRME/qRC8Pejd3Pt3y9Vuk4KvD5LRqg36Dz3GZIHlOkQ8lSfT/lcIt0NT5SLDTB+0Hekkbe5LTO+8DAyYvS1G/9ycOkJEJ+b3Xtm0c1e+oiGWCKAob8/S+ubcNMwT/DgZA2GTHkg0wYifpsgIB5iGlO/p1TvWOE4pzedsdKj6NsSP0OW8Rn/baojzI8vCQv8k0LlEhK/B8mDWgtM1sVIRfCL7sKuyxj0P2sHaTRzA9HOtMClaQYNzh0gqLrSUCdtEiV20/EUX6rxCBFV5IXmJLYG+Zdovr4EEnyACC+qk5tc/KcjGsspOrnlbVdO4+WiqulVxK+Hb9WemQKJ79RUgdUDFfGt4UBAmUA8AVHcPGWyWFKmqVVff5tOglpbVkTz60TEe6DBvfd0jaiR3H6uts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199018)(186003)(38100700002)(83380400001)(8936002)(6916009)(4326008)(66556008)(66476007)(66946007)(41300700001)(2906002)(4744005)(8676002)(5660300002)(6506007)(6512007)(26005)(53546011)(478600001)(6486002)(2616005)(316002)(36756003)(86362001)(31696002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDhFNEtvV1NTV1hwRUc4cmVHOUt6U2oxOUVIRFNPaDZFTjFjWWZoL1Jyb05w?=
 =?utf-8?B?V2UyWFhTT1dXSWoxSEZuS3AzeEQvd2tDQTJPdDdRNDN5RWV4YUo2Mk9tRGho?=
 =?utf-8?B?K0VXekVVV1pGekhRMGVqVE9kd1cxd0VrSTJnNERnWExmb1VpV3FRbTZMenpn?=
 =?utf-8?B?eXVTRnI3d0xYcGVDNlR2aHI0ZGd0bGZFRDEvUU5teFlBd3dUcDJOYktTSU8z?=
 =?utf-8?B?bVBIWEl4TWczT0JnTXVNb1dGWnlVcGNja083ODNVSTMweG1BREdxT2dhNy9t?=
 =?utf-8?B?WWhjMEI5WFcyUWxyM01zTzR0Unp0SVZTUHo5UWhYeUo2RmExUlZkajNGVEd0?=
 =?utf-8?B?cFJLR1VKd0lsc2dlcTh1KzI2enUyYUZXUDVLMmxzNmlMeDl1VzhERnoxQTZy?=
 =?utf-8?B?N25McmE5c2EwTGhqRG9pZE81VFozb1NHS0c1N2RjL0UwREo3bUxNdlBDU0J5?=
 =?utf-8?B?ODVYUXBVZ0hzNDZqa2ZKZzFyemk2aGp6a2JiTnpJQkxNYjdRQ1BVUHpxbzJu?=
 =?utf-8?B?eHIremlEcTI3NHhNNVZPQUxQWlNRV0VCODU4RjJzRHI3VkgvWmpZZ05pOUs0?=
 =?utf-8?B?Z0hBSmNURlQ2bUhRbmZaM09MV1dQaWtwbU5tQlRiL2UzSmgrWGhiVytsYTU0?=
 =?utf-8?B?a01LazhKUFBMU1hZdkt0Qm5sQ0xqTUFzeE1EQ1VUcy9GK2gyb0JFWkhmZ3NF?=
 =?utf-8?B?WVVqVzhxRnJBb2p1MzBTeGt5VkMyTG9tT2M1NUgvR1R3empmUnFpcXJiSEt3?=
 =?utf-8?B?UXlxZy82emxYc0hFMmZnb3FtNFk5eVZUMXdJODEycm5sdTYrSGsyVlgxTXI4?=
 =?utf-8?B?OVpYTDRWajJWeFUwd05Xbi9ObWw0bkhCVUtTc0tkU1pqcG9RTFgwR1diVENW?=
 =?utf-8?B?L21PVVlzSmdWa2dzYkppRVVTeTNhSmxQMno2NTM1d1ZBQStzYVluanBvMk82?=
 =?utf-8?B?anpIN2NyQ2hqR3FyZlpmaytyVW1pKzM2QkEzNXlVT3lFZFNxaEdWOGo0a05C?=
 =?utf-8?B?M1pJV09GYVZrdzloR002SlZBS2NBd0RDbzlTSjhTN29HTGdDWEk5amFMTlpF?=
 =?utf-8?B?dmRoMVJJZ0x5djBsYzVWQ2ZXK0hLWGwwVFFsbGN0ZHpicUw3MzFyZnU1czV3?=
 =?utf-8?B?dkFKYW1WcEhiVlhwazZJd29uMldBbU1wTDBVakhLMDNsdWZOeUcvdXRmT2hz?=
 =?utf-8?B?UndISEQ3STZKek1QaUxZQ0Jvbm9oQUNRRlIzVVhvN282bjVtQnJPaXpBbHQ3?=
 =?utf-8?B?NUlXNFFxSzBWd3lVZlpiUzlEUmVZekl5cjFIWU9RbHBVY0UxVS96NHhldEJ1?=
 =?utf-8?B?MjR0OENBRFd2elArcE1hRWJZOXl6QnM0Z1o1U3l5cGZ4NU5TM05SYjVhZGpv?=
 =?utf-8?B?bHlhYjVIek5hc0JlOWQwQ3QvYkZBU3dDK0lWL09BUGNOMjBWbXJSZHJXeU5U?=
 =?utf-8?B?Y0lrNm1WYlptMnc3N1Q1U2h4eENtUTRLRWdjVzFkT0UrVmVnbUhaQWg1UWxN?=
 =?utf-8?B?ZWpKZEJCcnpiWkpmRG5KRWdldGFMV2ZtUnNtaXhaYWNncGJWcG5BRVNYQUFW?=
 =?utf-8?B?L0hmMWVRTjdHeWw3Y2NoMHZHb1kwaGFoVVBRUURxMzROWDJCMXhxeTZ1ZXdp?=
 =?utf-8?B?WCtYY2l2Ui80cFA0WWQyV1ZVcmtobExVdWxUYkhZclliY1ZYUjA2eTJUdXp1?=
 =?utf-8?B?Q1VTUFR3TnNHQ1BPVnBmTXcvSHpkTnU1Z2ZKQWhpQmpEU1dOTkdyOGNFcWFH?=
 =?utf-8?B?SmprQzNxNGp5ZVFiYnY4a1p0TmYwZldmSUkyMm9qN0tROWJqeHY0Y3hGd1JR?=
 =?utf-8?B?MmJ0emF0U1d6KzRuaU9PQXVIajRrOEtvM2Iwc281RmlSeEt4Q05YZnVpRENP?=
 =?utf-8?B?eFRTY3N5QjVRb1Y5VHNPR0VEWFVJMkJQQUFaT0ZCeGh3endLMENNcFg0aGM1?=
 =?utf-8?B?K3FiQkRPVHZUbElnT0RnS1A0ZVk4OHVpZEpROXhWZnBNWnZkOHNOWVFveVZx?=
 =?utf-8?B?K3RkTlhuLytUbHoyWjVRTW5UZCtFU2ZhdTk2YkJZTkN0emhGWGFKQ2ViQXRi?=
 =?utf-8?B?cjlGeWUxNXlyalVRd1NycEM5MXhuN2hGaHJMS3gvRHhTRHFJQ3FZbWQwcXVD?=
 =?utf-8?Q?ZEHCFqQsZyop6lTRYbAuJy5Qq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab56dff-c3fe-48e7-9ca2-08db18c1378f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 12:50:34.4064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyTC2tLFGmZrfqPJvQSzdlCj7sAzee4BdwVM0oE+P7TNLbGYdqdUSY2Qv76uxNtX2l8YapGT6RxZLAx2qFbMOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900

On 24.02.2023 12:35, Oleksii Kurochko wrote:
> @@ -11,6 +13,8 @@ void __init noreturn start_xen(void)
>  {
>      early_printk("Hello from C env\n");
>  
> +    trap_init();
> +
>      for ( ;; )
>          asm volatile ("wfi");

Along the lines of what Andrew has said there - it's hard to see
how this can come (both code flow and patch ordering wise) ahead
of clearing .bss.

Jan


