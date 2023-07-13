Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589BB751E77
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 12:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563077.880031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJtFu-00033Q-0q; Thu, 13 Jul 2023 10:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563077.880031; Thu, 13 Jul 2023 10:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJtFt-00031a-UF; Thu, 13 Jul 2023 10:09:01 +0000
Received: by outflank-mailman (input) for mailman id 563077;
 Thu, 13 Jul 2023 10:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJtFr-00031U-Kr
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 10:08:59 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 481304e3-2165-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 12:08:58 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAWPR04MB10031.eurprd04.prod.outlook.com (2603:10a6:102:38b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 10:08:55 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 10:08:55 +0000
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
X-Inumbo-ID: 481304e3-2165-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OESnFr6jOVm6AdjCKCMPVu1Z9Hi8T0SOEmojP2Vb9kSwdXIrbMYPj04QiyV4f2p3dcCmQwxSk+5TRh7X5/ByIciBUFIcoItwP0L+mNB9uWiVwm9KwScNcmGsRYVYWbDccDLOdR1Vb4IIfXiLTdQR8IPxk9q359WcvyEaM3EOpCeFtTp9ZPBILMpzUw8t3ZyJ0GZcoVgJAMNMMsLHL5rQEUMDVyKKt2jKvlrZK8lp1QOGWEHwy2ouEWjV+hXwoadD02D4RRo/SKkNNLzzBQTr+BxKWQaSvV6FCFBQnLevMPNBnKiD0nYxZV2A/KHSE8x7OrgmvuO7d2NJscoJMXtzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cs/iHZ6wTOUd5ud+2uIVAP6yVHZ7HE+7sLg9mA+mHfc=;
 b=Fxp3x1afOz/5HLnZ9X/lJoq2Qs9fgp1JAGCPneeID1PMMsQFAU+Erst0ykzm6gHkCYtkDKROJOMyuTBOWbenmpL66OsKzEkw0YWGNDz3LgJUutpFnKiwy+Y+wjyo2/YFlmdiuRs5iY10u5hjC1wjWmr5kzX8ip2r08Z/pN9d68pewM7iDIbLY21kP3//8e0ZqxngRTif5PTL+PKuDlcyfSqGRm/5BfnSoZfm/u2zFwPUvIyyBfIHWIujR+rKCG8gRz65lg6Ea1XyTG+pZw1Fqk9Q/H/hoGQFH9jW3YyNYiJGtwWDhQgwgB4TpDKScjsqx6l+Hkqo07sHKl6iPwy9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs/iHZ6wTOUd5ud+2uIVAP6yVHZ7HE+7sLg9mA+mHfc=;
 b=bQAP+jepya/ZHgRSweGtoY1tBAX9Pu1kJG/hSszBeZtra/yTUvLn97me0V7XYawqdH2Alc5NTHDeCkiuWjLzAlQpmh8EiRHCfg7TDN7UgfiBEcbURivagqn+JlkXmpx0n/bLs8kS4OW2RRpXrKNJEY8nf+7+dA5bI/un3HtWL5WU8C/fFZJt3wm3tqKBYaiL++K6HK9W7GNmmm1t6StJus8kiWMPYkp0Gogq6Liv1Ax7NsWUANowD+qs6mtgeuvM90Q1UQlxCzsQzQ5YU9VmnIuN/dUNqNFHs3q+NENcsqHtvOYMCcfVWj/WEcdTckNHhan2h0c5RV5O0nAI02Jqgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
Date: Thu, 13 Jul 2023 12:08:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAWPR04MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c7e2c5-fdd5-4e7f-6974-08db83892afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	epnUZaItMMpWX1fGx2Z1EikdmHtXc6I4//gx5PxKoDjf3m+DWN1SUycxft9x4Lxo6wCG5XFaK9Y4xMS7/IaKmi8livpfWrVmxmeFFodLFCc71+z1C9/0EigM6I2JHEXK9heojIp6BbYx1jEVIhHuoXNktA4OR1oArxJLsc90Py5QXS7pLhPFXzcuLgYW78ayHjB8qfxRk/qUA8rgoCqxWXnsT+pr2coZAbA/QVGy0W5n6wQhU8H6klZ2u2muMV9WCaOb2m5mGCWOUH6uVxKjW5KldG96bLt1XURESgPOf+6ZQyijN7yYn5aUH1ebGcx/SrUXat6jaX68abEsvgYXyTHbdpsje/Kz+hith21CX9a75p4N3JYYoJQ17QIJBT+u+cW/ad61Oxf3RloPP/8Q6HBUl6b5EZKaU3o6eiFtjZdckQHUMv5VFrz09J+UYeHtiyo3/WQZ5kZyf2icxBn0NcaTfCw8ZT5cJeg8l/aInkGCtJeZrMj4RX8w0KVD6lDFbBiSkrwNHWzz5abRnQJ19AGkBbAaT3UdR33Qh1MPeWDHxH44OA7O4ktIM34M4iuLeg6r2dv4znEzJaeFOdi+WglbeS8j6weIjvSsmEDZ9S9p2AZpbxB/7HIN2nG8NtzrPeIKfiL7B7oO6hTeGbJGrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(478600001)(31686004)(4744005)(54906003)(66946007)(110136005)(4326008)(2906002)(5660300002)(316002)(41300700001)(8676002)(8936002)(66556008)(66476007)(6512007)(6486002)(26005)(6506007)(53546011)(38100700002)(186003)(2616005)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aERqWGp2eWQyRTRlT3o3YVFxdXRjZC9hanQ0SGpTcXhHNmtZT2Q1OS93aWZX?=
 =?utf-8?B?cUN1MndUV0VIRTZoTnpNM2pvS09tRDI5dXhuVE1UNkptNXhFdUI5ZWthQTJk?=
 =?utf-8?B?WFJTS3RlcjNocXdONzJtQ2h1Vm9CQm5lTWRBZGI5VVV4K2Q4TWhkM0NWNmp3?=
 =?utf-8?B?ODdjT0wzK0szc3lUYlN2aDVkVmxuZjdMcmhEVDdmeVNkTUZCaXJoWFhzeGpC?=
 =?utf-8?B?YVJpbkpBKzdObnNrcGVpMTQwSEJ0dmlXWkdscnBjcS9CMEhLazIxOGlOM1Qr?=
 =?utf-8?B?VXFtaWd6UzNyQUZUTW5wTEhIa2Iwd2ozdFRRR2FYVlFkZldhemNHK3NTaERS?=
 =?utf-8?B?d09FUlZZV3BvOEpHeEhpMCtGWURuY25Jb3ZEZHNKWHc2c01yRUxUelJyVXdB?=
 =?utf-8?B?Q3dwTzVXTTcxTGdDSHFMVmhaTm5ITnhBSmIvcnl4cEFtOUtEY3BDVElkS0tB?=
 =?utf-8?B?Wk9sTU1xVEVEdFhxYzZPbHlsOTJaOUJnZTd1VmsxRW8zVnF0OXJkSHRUeVJB?=
 =?utf-8?B?TzEvTkN3Rkl3TjVyUWRmQW1UWUtmV0RnT2NSek5MR1Z0ZUt5eGJUSkIxNHkw?=
 =?utf-8?B?TU9OakFOanVSSVE3V2VQTHZIeGpWQ2FmR21OcjRIQmRGVU11ZDRtd3dYbWpN?=
 =?utf-8?B?cXZIWFZnT1VaWDZlK0l1UENMa1dXT0ZtWXlBUXpiYWkvT1Y3V3llekxxVTZQ?=
 =?utf-8?B?Q1lrWmJaNmhqbXdDS3p2NW1xZk1KNHlTNGhVTWVzdWMxNWRtNHcydjRLaXJs?=
 =?utf-8?B?em50UU9XYVd4a0tzSjYrK3B2aTh2dGlrRVBOQng2ZmRaWkdQc1QzWkNLQUI2?=
 =?utf-8?B?dnErZjlXTWFqZ0szWEs4YytSYkgySVArZ3JOWXdDYm1vbTV0ZytiZDFkTlVo?=
 =?utf-8?B?S05raXlmUWxUMEI4Ti9UckVKdTAwYzlFZVJOSUNFSkZsNGdrczlLSHBQdkY0?=
 =?utf-8?B?dUg0Ukw2R1V0cHU4SGYxb1E3bmxmekh2NjNxREtHd2l1RFlDTjNKRjJ6djdS?=
 =?utf-8?B?MGFOdU9JSUtwSFMrV3d0OURlVk1TNmNBcmowNVVhUXNQMnREeFNMUkNYNklt?=
 =?utf-8?B?bkt6bnlnZG1JYjRKVWhjYys0YzczS3hid29TR0xVaXZhTFhjZEVESlowbUJI?=
 =?utf-8?B?L0lDN1BzWXFSbjgvU3BKUjJBMWg3OHAyNEMzR0Q5cmJOOTBtU2xqV0p2NHZh?=
 =?utf-8?B?ekxGTFgwTEpHOXNTV1VsUmhuOUZWdWFwSEtFK1R3WWl3M3JqcmFDb3F0bDBQ?=
 =?utf-8?B?K2xJSjNFOGZ3Wkpvam40K0NZbjM4NDBFWUJSbkVaZ3p4SndNRmE5VjZZM2Fm?=
 =?utf-8?B?ZFBhRWJSNjFMVTEwYktZY2UyRi9WOTErLzF1SmZoSDVzNEFZb1ZKblRQVm9a?=
 =?utf-8?B?MGV6RGMyNGFFYmFORGFuWmhVOWdKTFZhZFN1aFl2ZktSVE82Ky8rdmZ2cEN1?=
 =?utf-8?B?b1hDTk8zaWxPK0lKdHpnMC8zZzh0YlVoMW9qbXNVV0w3cDVubU03dzJsNS9K?=
 =?utf-8?B?TmpVRWF2SURSSzBoRjJhcTlFZ3B4bnQ1YnJFS0ZaM1R4b1AxM0w2a3p5Znc2?=
 =?utf-8?B?eEtUZGVlK2QySDFtZGNNRVBXcVVjYlAxSU5Da296THU1ZkxMaExNVVdseTlY?=
 =?utf-8?B?bWRTUmxTdmxGa3V3aDFlN0pPL2o0NUJjSENVLzVJVWFhRXo4M3hUWlhqODBv?=
 =?utf-8?B?enZnK3hINDZyeTNqYnhUY1Z0eHo2MWkrZTkyOUZBV1N4WnIvME8vZW1kR05n?=
 =?utf-8?B?UEhvMUc2VXJUY3drd2hHRnpnR0F5M3FnNWdUVEkwWnAzR094MGtSSVhZNmRj?=
 =?utf-8?B?Q05CU3dPTzYzV3ROUFBnY3pXaFNlOVBLMlA1bnhwdXNwZzR3WlpmVXVqbk43?=
 =?utf-8?B?ei9WY2l4azNQM1dpSzNYbENUM2FvTG82cy9XL0NUd1RSOWFuZ2Y0MVlZVUxS?=
 =?utf-8?B?ZnlRRyt0NGtFRDloUjJOYjNwQmlDYUpMQUtIT3BUT3JzMUs4NXF1RzhlbUND?=
 =?utf-8?B?dXpWMjJ3ZzdJakFwZVlJbkdFWEt0MHB1SWVzOHFqbEc5MFBxQjJ2T3o0dGRB?=
 =?utf-8?B?aTM5amVMa21MTGVuRFBobkxId3o5YlpJVXBFRzlwdit3SnMwcmtrNXJVZWRk?=
 =?utf-8?Q?9JeKh+3k50qkIUtPSDOmqhwTO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c7e2c5-fdd5-4e7f-6974-08db83892afa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 10:08:55.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fx1i1IumrS1QqUsPjw6nagl0FxCfYGltQMMHl+9FKHWMJu0W1+upil2Qd5XWZYHoYtAs0kcUIVFsCR4eG4gD7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10031

On 13.07.2023 11:30, Oleksii Kurochko wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1791,8 +1791,16 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>      }
>  
>      res = platform_get_irq(dev, 0);
> -    if ( ! res )
> -        return -EINVAL;
> +    if ( res == -1 )
> +    {
> +        printk("ns1650: polling will be used\n");

Nit: Please don't omit one of the two 5-s here.

> +        /*
> +         * There is the check 'if ( uart->irq > 0 )' in ns16550_init_postirq().
> +         * If the check is true then interrupt mode will be used otherwise
> +         * ( when irq = 0 )polling.
> +         */

I wonder in how far that's actually correct outside of x86. On x86 IRQ0 is
always the timer interrupt, but I'm not convinced something similar can be
used as kind of a heuristic on Arm, RISC-V, or basically any other
architecture.

Jan

