Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5775840F3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 16:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376838.609875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4Nh-0003tI-9y; Thu, 28 Jul 2022 14:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376838.609875; Thu, 28 Jul 2022 14:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4Nh-0003rF-6p; Thu, 28 Jul 2022 14:20:53 +0000
Received: by outflank-mailman (input) for mailman id 376838;
 Thu, 28 Jul 2022 14:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oH4Nf-0003r9-60
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 14:20:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ad305da-0e80-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 16:20:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8172.eurprd04.prod.outlook.com (2603:10a6:10:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 14:20:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 14:20:47 +0000
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
X-Inumbo-ID: 7ad305da-0e80-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndCS1omBHznKx88iPoWAUn3BthfzfRtCojrUKTjB/sz6suhq5iGrkBWHKwsw8H1MNgIzpkSYNX5PjguDbbEA1pS0yKvxVT3p1ikzEuOBYyBvS+BPSIimqYsyljUeyDVhwkJHGC87BXkm/n/p7vqE+NyUr8caINAOyGX05Z+K2gjEEUQmmzkPFFbxcbFCGMZRD+lf5pUmz3Ed6Pap+v06kCIYIV9HaDPpl1d2nbS74b/q++wsi/KQkm4jZ4aJEucoNAhpb1B3gsqGzO8LIq1fFDWzhvt20gkfvL3mTBY7bX5KKroFD4MPEWO/pEPmRGeh233WrLDwzgxUQL0NjnxWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEEYTecIwfQViuafC873OhjTtNQD5vxg6NG9mUvXe6A=;
 b=e3bpDxYsZw6m7Zmx/xW2CVv6PE9dQ8WdUZu07/InPvccG0fdUBNPI1Zu09cpJ8LHZtkP7smOcrrK0/1GNYckQfs3t91q1uGX1zCt1fBGLQNeAroxZK9wPmwKWn/bVhMWdhkNXphzYCGHkiaZhdzWogQwR5jVvlC7LFd1w5tbg1aMV0bdfdjc5/UI+iAl+WfBA+Gtu4hMsWaAQIHIIDwc3osEt1sq7iMgyTYs2u/vadhFuhTHSOUtmsXQ9YHKlJFqsDFGSJ1Su8zRh2mV9HYcHVuL42RpUEfC3rUwHr0XE614ukH9V1+K2vYgmmitzrEJhYF+STVMQZA6HXEXpjQEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEEYTecIwfQViuafC873OhjTtNQD5vxg6NG9mUvXe6A=;
 b=TEYJerdGYx46UOc4hi5HS2+EJMbTESDXAPV/LOxdv0UCrku3zj9DzTbyyO0pYymiH0k7j2xMpl3ahM0qCrJJRnVZrDglLBZrEau6heh3FlgK8Zojldr11ybMy/BVLVfPzOj6kp1WrHHU8N7lPYrEBn0sJv3f36wsWHRgAi8qitXgFBAsnPw+OWxHRjDOG29cwB1p4G3OPHBAdIifNaSi5Y9vNYXbQTYaMs3XOdHB11xC/14PhBdvu8r8Jd01l3rGB8tGvEoTbZgZ37RkGtkJKX4WQ0MTb6ULuEbP6jwdfUr7fntlyPzz+i3AcEJBTtCrQzZ7OPY/rAsWEznRsYzvww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
Date: Thu, 28 Jul 2022 16:20:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4151b83e-6c7b-4505-a08d-08da70a45d65
X-MS-TrafficTypeDiagnostic: DB9PR04MB8172:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+lDTSLIB2UiCGz72loN9YS2jsNFXkr2zo1m5KYEUbr0SYysZ21LHGAOzDux786yK4TGdwnRoknu3yq3SZz8lCFEkLDxqit6Y/8QBUkpm7wD1X0UCRrkwVhQuhC/Zd9pom6UPnrvKnkGiSjv0LjDjRgekq/Uig4xipRPdEpnQHHIVUlYFPBeTfgrVqK3P/JI/aQhpWh8gkaTmk2SAGAjrzpK/I2lhf2x+TCbSBggpGxVs6ltJD8QYChl+jZls+cz55X0KOyQxznqGlMKzVj4VAdPNZAAXdxue1vd5C4CwG6raz+omS24kkfWBdOKCP8ITU0k9ISD0FpoYV1HSkAg/IGkoZ2h/Qhl72p252Gozjdvp5FhasWsj1lM5ISbLm167PBqWoylmML7ac5PCo1y+VPOXxzIPByrMXUnYKc3vsh6PTxRV2lTcuHKd+jzSV8s7mskcG/A3XxFjvAgGRm+u0Uz7bOjgGjDT9yG4JSHkSX1l6RXaVF/1l9FFOIzlQblAgvwVrGLqVLXchp6zdxn2Ed8rCbrCT61xU7BS5x2+ihm7PBpRLSUr7MaCZrgzMAZgL3q5hFFy7Z9D5pLyvPQ+SMie5lRa9ZBmTRn2L1cpIhc4p2LMjuRs0pohwKJAXKsyD1TULqv8fb+bqt5GASftLGDpPvyB0TTWbXxwQPdv+8SADt//AxQa0hya9AgNSAl4KeJaO9fYg7Ra1z8YnqZ55aDHvaIffLXYi3Z6lcA3IO0xGHqRLn/AXeL/Xdac8gUYhC4+2HEhPSkhoix092GOLIueWzbgo+5k7uRblbbSHNIMUpw+9/162LbNenBv/xysRsFETCGI5uq/oCyMPvh+iQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(346002)(376002)(366004)(186003)(2616005)(4326008)(66476007)(66946007)(6916009)(8676002)(53546011)(31686004)(41300700001)(2906002)(54906003)(36756003)(6506007)(5660300002)(26005)(66556008)(86362001)(31696002)(83380400001)(38100700002)(316002)(4744005)(478600001)(8936002)(6486002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE9zeTMwdTZZZGptZXhGWC93WXhuODZvd1lCUXRhb0wzYWs5eUpveVA2dXpS?=
 =?utf-8?B?UVUvVlpyWVFmaHdkQTExRW1aREdLNkZZcWhaN2pTUEpzTDFtM0hldzhKQlV6?=
 =?utf-8?B?bmRob3RvcG9Dc3RUSE5SKysydmhkVUw3K3hHUlNIaXZGd3JPRmNBQkJBSE5l?=
 =?utf-8?B?c21BRjRqWjJvRUliL1pXKzF5L0FuTVpqVk9nU0FSRHhsR1FCR2t3dVJTT0VI?=
 =?utf-8?B?UERiZjNxcDRrSHgvR0tpcE4wcGRlcXF3MGY5MlFuOVdpNEt3Q3Y5STJZM25j?=
 =?utf-8?B?WlJ2T0l3Rnl0bTQ2SnBXVmQ0Lzl5SENvZ0VCQURMdnFtbHdabVFzY2tJbVNq?=
 =?utf-8?B?UnAwRm1talFvejBNNGxVV2JiQkNPWDQrQWN6SGRvNENSRWRKM21TYXFkb09u?=
 =?utf-8?B?MWV4MjJmVEtaWVdyN0hkK2E3RGl5NUFKd2xPcVZnTVNYNFpDc1JTQnpTYUQy?=
 =?utf-8?B?OHhKa3cwbTI3NHorTk5vcERMelFLTkQzUUQ1bWk0UFJrcGJJcUx5cTdRaW1h?=
 =?utf-8?B?UVVNcFBEem5CUDZZeFk0endDWGU4Q2FZc052cEhYZWVGVktsZUFvcHN5U2tU?=
 =?utf-8?B?aE9RU1dkaDEyRld1ZFZ2SDBSM2JzYWhWVWV5OHlGb3BKaTlnYU5sY05CV05l?=
 =?utf-8?B?c0pDcWhTb0F4R1lTS05sOS9INEFDZGljd2pXN0R1REFaYk00bUJad3VvQkts?=
 =?utf-8?B?ZERwVUJsYXBaL216UUIrL2dDeVQzamNaQlNIWWtKdWptNjVpdGoxUi9kcjZS?=
 =?utf-8?B?NWMwU2VmTDA5dVFudTZOaVhxbHM3OUt3UVhyazhvOHF1Z3JDRDdQamlwUDcr?=
 =?utf-8?B?emZXbnJhck40MVk4czhyOEZoVGpqSjdxWVI5YnFCVUV4aE4rdldHcSt2RWZK?=
 =?utf-8?B?dTVnUDB1ZlducDEvN2tQSHp5MEt1NHRDNndEUTRKYWVPRE1yb01EZHdUMGpM?=
 =?utf-8?B?di9GMnZnc3hXZG8xRFQ0bkdzak1lS044SEdzN3NwQ0JXTUl0RmVxYXBHM3pj?=
 =?utf-8?B?T1lCcTNRb3pkemZydFl5UWhyWnUwbEhNRjFLNFB2YTRuaHVJdk54cVBBWGps?=
 =?utf-8?B?ZldDZERjUVcyLzdsZGp2eFlkbWcvYzhCVHB5QWYwZUZPeHZsYzlWejdzQ2Vz?=
 =?utf-8?B?ZXBLOVZwTFlrdTBJVnhERUY5eS9VRXQ3enI1QjFFVmxvbGFQK3ozZXMrTktV?=
 =?utf-8?B?MzVpL29CeWdTdG9TZmpaRElzTDhaeGxqVCtGWlhMalhmckE0bmtISmZZOU9K?=
 =?utf-8?B?ZzRrSC9YY1dZWWNNSmZ6T2JqQkpWZkZJMUJMYUltajQzQzVRTGVYaXBySlJu?=
 =?utf-8?B?RnZoU1F3QWZUbmZHcXE0cEEzWUZxVlR2d3dJQVRvSVA3R1FnOWJ2UU8xWFJR?=
 =?utf-8?B?MnlZYjJ6NGdVSSsrUnVkT2QybzluaFBXQys4NVN5SFhvRXE2ek9oai9tTndE?=
 =?utf-8?B?b091YzczMnJxQi8wNXVra24xcUZuem45dVd4eHk5S1haUDNKTm4yVDIvSFV2?=
 =?utf-8?B?TmUzaWQrZGlDWnZvVUhoNWh6R2QyWjhEZW43S1RxSGlFdW82d1BlT0tGbU9N?=
 =?utf-8?B?WFQ3WFB3ZFFjS0pNbU82bUJBUER0bG1ia3NhalRScnZqUnN2VThKb0R5dGM5?=
 =?utf-8?B?Z2ZRaVdoUzNtc3ZOM0Q3Q0JvWkpkN0JtUlJnRzdZTUltU040QW1oVWZaZ3Nl?=
 =?utf-8?B?czBQNGRJcGdEUEErMVA0UWpuclFic1VwMm1XcFYra3FWOGZKVXZWaFBHWkZx?=
 =?utf-8?B?S0lYc3d2RnZrdVBtbi9jWFRBUlUzN2FmU0lHbVVvazBHWDRRZkFlQXYvWHE1?=
 =?utf-8?B?QXhQUytKajZRUzd3SUg0SWVpY3lOZG5DNGJacjcvQUxhbW1tOTYxQkNuWmIz?=
 =?utf-8?B?MVVtVTR1djhWQ29CN05hN1QxMGs3N3d2anNwQTAyOWpzZHpER3EvNExpWHAy?=
 =?utf-8?B?UVV4ZUZxUFFVTG5aQjIzemZJelJoZDVBcFBNb0dyLytSNlFYQ3J4b1E0THhK?=
 =?utf-8?B?Q1VPOTgyOHMzTHhmY01BbkFLanI3NGdMMVg1Qk5KRFhGcWxlWHEwdHJmTTls?=
 =?utf-8?B?azA3TWxxblUvVTRHOFczMm9UUkhieFhSRFNGbGtHVnZtSVR2QWM5S3ZTRXdZ?=
 =?utf-8?Q?Az4WGCay8grk2+sLlZSsWJeKI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4151b83e-6c7b-4505-a08d-08da70a45d65
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:20:47.1328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVjJUUhf4rwDnQQtLPamn54c0i4jCR8engFJnhcbGZQVOuCWamljw2eSe8mxNg7NrbSUvsjQno17pvJuKAw3Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8172

On 28.07.2022 15:56, Julien Grall wrote:
> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -461,7 +461,7 @@
>>   /* Access to system registers */
>>   
>>   #define WRITE_SYSREG64(v, name) do {                    \
>> -    uint64_t _r = v;                                    \
>> +    uint64_t _r = (v);                                              \
> 
> I am failing to see why the parentheses are necessary here. Could you 
> give an example where the lack of them would end up to different code?

I think it is merely good practice to parenthesize the right sides of =.
Indeed with assignment operators having second to lowest precedence, and
with comma (the lowest precedence one) requiring parenthesization at the
macro invocation site, there should be no real need for parentheses here.

Jan

