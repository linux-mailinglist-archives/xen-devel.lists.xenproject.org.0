Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A36CC120
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515854.799124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9Wo-0006ri-3G; Tue, 28 Mar 2023 13:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515854.799124; Tue, 28 Mar 2023 13:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9Wo-0006nu-07; Tue, 28 Mar 2023 13:38:22 +0000
Received: by outflank-mailman (input) for mailman id 515854;
 Tue, 28 Mar 2023 13:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph9Wn-0006no-BI
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:38:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccd06fca-cd6d-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 15:38:19 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 13:38:17 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:38:17 +0000
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
X-Inumbo-ID: ccd06fca-cd6d-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPEfitOWIZUu0PKAfkGvaN4S2vrVZQrOzX0ky+/1n/W2ASz+LOlAj24qT1qnVGG2EA9gEsZE9V4X3EfUTOxLFCLjCVr3cIOY9GGjgz5JarODTyY+QUpXKeCFz7mFWnqW3XsUdXSbd2sV/hyTASZWfgacLUS52UbqELWk16p/oIQJ2ppk+rrKvrRlV+LQes9nBnV3ZK7fwfKmhzMjoKxJNWbKfH4k2bQjLztYeoUej886XTZBtjIvG+fHGerByBzHsXHNbJCjSXJE4WC/HPLlX5ZP/wFsUvgvS0sChaGZstTsJ6wEnZ4rn/F72TBof8FOWq4Wz0NecCwiu1Ax0A8cHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dakqjN5U3rEqL38YqYMoG9qIj7Qank4HaaLaGPfFkrw=;
 b=XGsFeCgoYk26DKOXyMfvjWuoM7BOof++hgIQzKDPyUvb0+4eMg1mZljGg5Jer/OErzDGd1LZrgs0Llu84XYt8zCpMDtM1eTMa9bbtUFoEZ6KawXzxGnwxlOobZ6FotW+k1yOGHlRpUs2Fn1RXJsan0l6J58LnfKsgaoeod1aH9OaWsB4eoYaoOlGEH+Sd5DRZlq5ZoKH+9pXIQhsQbTaW9mUgx3nCommdrOUYU/T5WGyn1kmMinBuxJEViYheZDGwH2OmAgVKrDadXjIrqSjz4ZgmAHJSN1OOEeKJK/ChBWvMNxiTJBeF1x/I6KSocKJK1sf9garcozn9pg+UWALjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dakqjN5U3rEqL38YqYMoG9qIj7Qank4HaaLaGPfFkrw=;
 b=qPXbAc5gwBS8CTaSxyyfzh/xuBcdqJzaIJdOiqATXkuTJLSlB8WuqP537xQloGX5wlui9Q9wi1MH5rSml/szDEHIM7Ue60sqIotEDJHmATpKcv6YJdsWnfPKPY6OSmM+Io+Bt9VdiVcKdDH1Cg6t6b260KfCxmA8vwBj6+u0Or3RVLJBzglTY2x2yW4smBANRMy7vUaQCGuMjfxlqkYtwqi8csd27/xSjKEYjEsYE8PAcRIzN/M/KyVEEab+uF513LklZzqYftQV+xfyYWb96kEQ0HHEvR7GYR9T0jGSnb4bPJx7bm3013Ba8rPJg+EH3sPAEQsxJS/MAsSz65KufA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d217ea45-b0d6-c6ad-5d06-76cd9885d3d0@suse.com>
Date: Tue, 28 Mar 2023 15:38:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] xen/earlycpio: Drop nextoff parameter
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327194126.3573997-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|GVXPR04MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: 809a7ec0-1101-4d40-5d8e-08db2f91afc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M/ZeZvujt8Y6bQLsqDH5VABAe5p8yYESe8t9XbPYRp5LWAmSCdLFruFu87AyFg9yeHHHSHB88gFpcmFYwFH2v29JuwB/NEucallWgw0de5tc7Iz6hFvvepLaCCkSIxsMuu8IoPiHh3JcRn1Znpe2jRI6f1XN4lJyG1fnzay6qfJ2lGvH4aHJghD1TAWcMWZdrUaW4VzUYt1uPvp8b9uwx2SLHMronXdNnr8TDvbDY4YsmMZNf8U4kY8YC8c1ssNS1sMoQ96kU+MFAoF89vb3H4keKMLESdBU6EFzIdRHQ34DRTYiteJiDeI70NGrZL492LJivRsy03Vj3KhYANfu0PBm4CxQUF4pWfdYQC8jv9AuQiIBmOAOnjzDCoZux3sv5GxOWnFX4+K0wytI+HHqyOf3/mKjrunBl1faqRiomHtUTbKSve93Dt2qKspeqktwTP0DEexewcbg7i8oIwz1lxIcXF3gDP0UPrqk8wQOrm+Ew8PcuNO9Sd6gaufT45rHoFDqm980PfEwFQn6A/u7P0cm06iIe5ZajPgoye3rLg+Bkvve98JXVm0BfaTk5y6PBFqzzZPZjFNoMjzy4rhwoff76vOI3mNQY++qQK2T/q48hIiSxFOv8yMzjtzqm8A7l2xuUyyOEJwTKogsd6L4/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(36756003)(478600001)(186003)(54906003)(316002)(31686004)(8676002)(41300700001)(6506007)(38100700002)(53546011)(2906002)(8936002)(6512007)(5660300002)(26005)(4744005)(6916009)(66476007)(66946007)(4326008)(2616005)(66556008)(86362001)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDh1dGZzRmpSbENLdENzaFFDalhVNjJoK2xmZnRQTkJlM0lyWjg3Z0RCbENN?=
 =?utf-8?B?U2xUVkdubW9sMmN0Q0xCSkp0eGQxUVVQZnlZTnY3RjdGUzJGQk5zdU5mNjF4?=
 =?utf-8?B?ZURSbGNpNkhUeEF1NFk5Q1U5YU51MnBPUmxoQVN3RE1HOXN5bjdHZDB1QTNI?=
 =?utf-8?B?QzBWanBPMk01OWxIMGNtZVFuVW1hV2x5c3R1NlVHbUdvWW5vZnVkUThXMWV2?=
 =?utf-8?B?RWhCN2ZCY0lpMnVBRjJWUnFlRlhFRE5hdTVYUGxRb2dSZjl1ZkpmRUlGazFp?=
 =?utf-8?B?RzdkY3Y3M2ZhbWF4T1Zvanc5WjNCeWMraWRwSWs2RHdLVHBRVzZHUDhYYVRR?=
 =?utf-8?B?TG52Qm5WNjl4MXZhN0xQcWhyNDlVMHNacE1sK3dQcHduQnRHenhTMmJYTXRH?=
 =?utf-8?B?Wk5VYkRXVFlaRGtIWTFVN2o2NlVJcjNRd1A4VVZMSGxVWW1xN3pWTVJaNFFB?=
 =?utf-8?B?VGpoUG1DQStxTHRYeDl1eHZZSE9SYXRhbWk2bHhwV3dRcjlNL1huZzdHNFhW?=
 =?utf-8?B?WG01WjdabFFnUjBpSXlYRFd6QWYydXN6Q29LbmZ6QmhmaENpVnF5c3ZjaW92?=
 =?utf-8?B?ZktzRjRFaS9wVS9HR3o2a2ZkcEtwL01pRHczUnl2VGNmc1JucitIbm43aVND?=
 =?utf-8?B?Zk43anlKRnZJT1JIcExwdEhiYXpGQzB3cUJ5bDRYV2htTzBDZXVTcVJKMWJ2?=
 =?utf-8?B?Wm00VEtibGN0Nzdyd2hVNUtuMU95UHNtVFlLMCtLUTB0SU5FaFMyaUd5ekpH?=
 =?utf-8?B?eDRaWVhKMnBIdy9iTGlzV2YxUHFjYzR6NkVyUzV5d1R2VEVvSXNWNGVmakJh?=
 =?utf-8?B?UDlZcUtpU2VwNFdtcW5USUtrVnNrVlVoR1BFVnBEaGV6Z2hTT0JhanlGa0Fl?=
 =?utf-8?B?aGh1YTdWSk5UUE1XR2JhUjV5S1VIbzhqZ1J6ZE9Ja3ZJWTI4eFE1K2R4TWV0?=
 =?utf-8?B?VVBDNkxod1BsaGIzSlVCSWdjMjFJTDFqVEpQZGpaVHp0UWozZDBaUHhMOFBa?=
 =?utf-8?B?UmFCY1NJdGtwc0ZoVmNDZllmWnZ5eVlWRXNsT3dYc1VpRFNXeEZYMlovOFFh?=
 =?utf-8?B?MFJuak5JUUo3YURaNFBzWHJBcXowOFFxZzF3eUttaGE5bDJQaHVoS2YvWE9v?=
 =?utf-8?B?NWNwcnhwY1RvSkROSjBJRjdvc3p1LzBJYWpSNGdYWndVYUsrM2RVZXZqd3hT?=
 =?utf-8?B?bGg4UzJocXVKRE4xdzVlS0duTkNEdTFxRHNhRHg3d2xrdXBkR09PNTQ2VWVt?=
 =?utf-8?B?M2d0YjF4MUFOVklabUhTeVlrSStWZnVkTkE4WlBIOVNiaFJuaDMweHdQaFVh?=
 =?utf-8?B?dTRDUERVdDBncG96WGtyS0cxRmsyTjM4TjI3V2ZNM3gzcXNVczRBUjBZWUZ1?=
 =?utf-8?B?M0djSFhPR21MVlRCMUl3U1RvMlhPNXBZUzFpZmpya2h3d1p5RlV6YUJRZTJu?=
 =?utf-8?B?N1M4aFVRSS9jV1d3V0tXQ3FRekJwaFp3SUgxTTdSVkZDL2U0Y3dQb0t5REp3?=
 =?utf-8?B?SzhoSExlTXV4OUhjNk9CSGNtOStFdVJRQmVNTXIrOXZvTjBoOHMvZ3ZzK1VS?=
 =?utf-8?B?eG53eVZqUmF6VW55SXBXaTM5SUh4Ny9obnJGYUo3K1lzVFpjY2diSm5kZWhm?=
 =?utf-8?B?MjU1aHo5cFpIS21hZG1zUFdDTFdlN1d5MmxMM2tuWTNxOE9WS1lBcDdSVEpV?=
 =?utf-8?B?ZUlGVEFuN056dnZlejB4ZUV6alRZajZtRWpwM29iSG9BRm9iRVMrc0hFYWww?=
 =?utf-8?B?R08vdVZ6UzNGSGZRWVpKUnhpK3pJY2xKVEFkRWM0bklxK245UXFPQXE5MExR?=
 =?utf-8?B?VGlyN2dUVmk4TS81TWFzQnZ5U2hPU1pDNDRRdStxaFRaN0E5MldaUy90STJk?=
 =?utf-8?B?Nk9BVC90ZWozcjhNUkVsZDRrdkYzcjA4YTJZVy91R3BhcUNMdDlmQ2N1SjFU?=
 =?utf-8?B?L1FxZUVncXJWUjhTUnBENXZYTmJUQWZPZTM2S3NJaWl4V2dEYkx6THQ2emo4?=
 =?utf-8?B?citidG9MMWFXQzV3VURibTFOaTltbDJTb0hsUkNscWpRYTlUZkhVeDhRQVFD?=
 =?utf-8?B?aitXUWdDU0hPUU4wYUtLbVRKTHllTlBMRTh5MlAzZzFWaDRadDBGdzJhZm5G?=
 =?utf-8?Q?J7OraD2gOZSBGM0eP4cu8M/y4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809a7ec0-1101-4d40-5d8e-08db2f91afc5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:38:16.9743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hW14DKjZvc5JMRgr+brcYMzMm9s7YqlpGoX0Os+Vs+3BnerMgGpp8CYFQYPG+YtIdnN/wwXwa+qmwxbb1jMpcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

On 27.03.2023 21:41, Andrew Cooper wrote:
> This is imported from Linux, but the parameter being signed is dubious in the
> first place and we're not plausibly going to gain a use for the functionality.
> Linux has subsequently made it an optional parameter to avoid forcing callers
> to pass a stack variable they don't care about using.
> 
> In the unlikely case that we gain a usecase, we can reintroduce it, but in the
> meantime simplify the single caller.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


