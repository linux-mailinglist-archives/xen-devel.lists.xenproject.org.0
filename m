Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC77046DA
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535025.832617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypPd-0003vN-Ob; Tue, 16 May 2023 07:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535025.832617; Tue, 16 May 2023 07:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypPd-0003sQ-LR; Tue, 16 May 2023 07:48:01 +0000
Received: by outflank-mailman (input) for mailman id 535025;
 Tue, 16 May 2023 07:47:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypPb-0003im-IO
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:47:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f96cd99d-f3bd-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 09:47:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7132.eurprd04.prod.outlook.com (2603:10a6:10:12e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 07:47:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:47:29 +0000
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
X-Inumbo-ID: f96cd99d-f3bd-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfMDtuliroXiVFxMP4m/MdVDHlDQTw+mNQvT1D8H7hT4rgT1HubQyjd3qJQ16tpp1pmUAhobSelKDe1SRsxLx7++uSvxn5DHdBw4niqowDVDyK46pgODlVxbPpkT207QQtM8aRng7jqn68FmqTqfs6ZvT4LGq546v6pFk/b8JExRuZ75FX80r5LFFkkuUrjA+F2UYCQhat75z8N/zWcHapXBuhiUXgIo/3SMrxTh/FxQUS0q1pQyniFVL8MGGYAjpZm4E1BYU8U6Iq6bnJaKea3uwl9xyBWMS6AcMC+iMz6NGOB58if2cNudZJDZT5yEAFiR8LUFNEOi0SEtXPql3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+mOXDtYrs539yzrfbsePpJM9wrJrMjthB/l2RTNe0M=;
 b=NYir+z60iozFVuDZ/v63rVn+xj9K2/NcbG5GrEzKwffYkbWhahiNwdWawE8t4usW/Kg/KymSOu20kIHLJrq6rjkw9JYQly5zihl6KXU6+7brM20PrLQChpN/hj4o39Fs8+HS+GiB4bJqqBJJCdG2VcdhAwVIsOdey3fP+jNSXRKYlfj+hrsO6srQRuF6IBb0yCw6IkjX/gGP9mnnTsK66TNuXmaP4uMaZDk2tNCYD9uIppOLgUchmY22bTnFo/PM5pzDvLsTGogcSqcW9DedIYHzyN+N6qr3IIqxEeaf7y9+4F5IUa5vidLDyRQQvGd8UF03VkMb7ouiQkVaq5Y9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+mOXDtYrs539yzrfbsePpJM9wrJrMjthB/l2RTNe0M=;
 b=PDKiS/4hHB55a8GuTaYgUw3R1KP2Dlb/2DJo9S3a0vbP+IT3G3BVnUqF0GGU5+2MARnvPnHzSq8hp3JQaI9KYcjCzvD+L8RW3fKZz+8q/wtFq9edgzfWmQLcC8sMbHMymf8rYPc7seCcqO/l8M6aN6SIdRyEEiXSUwWTDNPVwKsuKJNg+dlQcw+vXXDVH5ia68N22ZLyvqpd6cI6NRVycSIOGg76y6WAWIGy7W9badmaw9yWsQUcfOvvGL3MP+xS1f0RxIvN7PHeBoRQLBsf7rzn4TZVODZsKfvrIkVzfNoCFPN0XbAmY+2BWDLLAjJs5NVIDQ1HZBufucSGCuTumw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f68cafb7-1b7c-b6c9-c1b4-cf3d7395bd38@suse.com>
Date: Tue, 16 May 2023 09:47:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/2] x86: Add support for CpuidUserDis
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515113136.2465-1-alejandro.vallejo@cloud.com>
 <20230515113136.2465-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230515113136.2465-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: bec287a5-920d-4d67-49a5-08db55e1cc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hp9COV7433kF9HY1tt5yatmRZhhZQ04m0TkmPqjsEM2U+5jZqJ/gdnPIJhrW/NlPGD9oOUzUoYNW8Z1jHWZhWXffzywmlY1/h4t9NdLw2mzjew8QyKsSWC7R1dml/qcXy4GYrEWIIPmAxV3tEOplFCPhRHwZ27Va8boLKgRyAQeKvNMsb5jkrAfQe2XXWRom6F5ZZWqY9SuGfh/gDVHDC1omRjB04oNia/olC2LjNox/wLUeshTAAXQmWiq20ogXwQsv49fT77odj/AFs8NESI/oIWHECois0Bz4sYcgVlpBrTyn58vMAlJApYzrTL6r7kU8nlzGKypZ2ClJIKmBEXDdw9/oq1gcXYBIKj65Ti76C2N/pjK/FxD2Rgiy4Ur6ZYVEQ+hZSokbRMwh1hj2FAzz9oMWN9byJvA+K2ECih4q6i0ND93VZQ9bQ5VuKBsuvkOV4teDavybAfWdttwxxajZx/86FRtj93ZeL/JH+56KHxflBUjGwFxSWsUurYUrO8lTHutkxPcU9svH2vYCQz9h1JjFowXIoDLdYXGnt1jJYediH8v1GEJupDCgV7AO24M42teDzxqHyJ/twpUmyM7dJGdeGm6qoGtFJQt39Aqkx2tbYGi8goMjpvzVcuTIgQQXizE6qg2XqSPJKjLmpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(31686004)(66556008)(66946007)(478600001)(66476007)(6486002)(31696002)(36756003)(54906003)(316002)(6916009)(86362001)(4326008)(186003)(2616005)(6506007)(38100700002)(6512007)(26005)(41300700001)(558084003)(5660300002)(2906002)(8936002)(8676002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0doYkFudUo1YW8yNnBsa0FoTzR5Vy9rQzVReThZa0ZUYldkZHlKZHU3Z1Rh?=
 =?utf-8?B?WnV6Q0VVL1U1U1A3K1lmMjIwWkhIMFM1Si9rOWJlcS90QSs3ZndZNlA5OWFs?=
 =?utf-8?B?UDZWcWhuSGZBbFlKTVNkMjh0S3d2eEttRUhxam1yVjI1SzlRV05VZEdBVWlz?=
 =?utf-8?B?dHc0dnZFTnZkNmU2bENRZk5iYXlLSXphakl6WFpaemhCNkdPWndIQVFUcDFJ?=
 =?utf-8?B?YW9KK2lpNGhCemF3cklZcEliM2tNZFppbDBUTG1kUDZ4T2VPZnBCanhlY3pk?=
 =?utf-8?B?RjB1S2lzSEJlRDJYY2ZDSUJCcWhhOXhuOHhBQ1FxUlduQmx1MlBDanZzRjgw?=
 =?utf-8?B?ZVdrYXErSndBZ3RmN0Q5YVltcXVMVyt0UGFwc2RxSisyY3dsQ002NVVPVW9o?=
 =?utf-8?B?dlhRUGlQU1NDbWhNV2RjektxV0Zld3J5Tjc3ZFZBb3IwUEhIRE53cXpsMmw5?=
 =?utf-8?B?bnVoeDE4MkNLNk4yU2RvdlZQZ2hGRGtianBwOE1saTl2R3ZacllPZDdvb1lk?=
 =?utf-8?B?RWp5cUI0TzBScnJUeWJHOU8zUnp5aTFBYkxTbmx3cVJRRlhFbXJxQWNoYUxw?=
 =?utf-8?B?MVgvOTVUQzl2OGxqNlJXSzFjOHdRU0dXVy9XazB2WENVR1ZsR1R1cEdkWDFV?=
 =?utf-8?B?MU9FaFZuWG1URnVhcXhRV2FobXRpMnNvNXNEM1hxVUdtYTZWd2lXaUpIeXFt?=
 =?utf-8?B?WGE3NUlxdU0xUnJwRnRJazBTdDdjRWxYM1BkMkVXVHNPL1VGVllOQTBmc0Jx?=
 =?utf-8?B?dmpqU2doT3gzKzh2QmlqWXYybmRwbGsvT2htTzZiZ0c0ZXlkWWMxWVRmZlJO?=
 =?utf-8?B?RjhSdGFGSU9HMHV1WlFpWUNLbEtOOVRza3BpWlVmVVkyMnFERHMralRsNHIz?=
 =?utf-8?B?MVZxV3ZpYUtoa0lCeXFZR1RxR3YyT3pQYTUvVGlCV05iMWs0Y1M2VDg4TjJS?=
 =?utf-8?B?dXVmU2VHRmlPdzN3YTNiNU9XVmZYMGFQMk53OUptTm1wbGhFU1FiYW1pN2R0?=
 =?utf-8?B?RC9aVXMwZXhDTCs3Rm15OUlITEhNTnR0V0NDOFRKd1RBRmtweTFSTkVNbEVn?=
 =?utf-8?B?QWZpd1YzSHEyT3RJQVNxczdIU2VxNk1FWVRTazRFL0pseXJPWW50M0o3dEFq?=
 =?utf-8?B?Sjh1ajV5YTVhdUlaSUZtMlZBS0Z4aENyaUt3d3ozcUZBWXpwZ1UrUVJSNHRE?=
 =?utf-8?B?Vkw1enhoU0ovZzlRc1YrTzFVNnltaytMSXNpYi9hTi9pL1V5Z01MUTlZcHF1?=
 =?utf-8?B?T3NkcHhvY2pLSlhZeWJYOWRuNVlZeVBRT1lydm1HYU04STJUQ2ovOXNzd21Q?=
 =?utf-8?B?OWZSdmZjMFA0RzNVRURFSkluSkZrcHFNdkxBYmp1c0UxbDYzNTZldmZwOWxB?=
 =?utf-8?B?MnNlT1ZYcUNtUVVGSnVFTE1QQ2JCY0laODU0a3BTS3pac2lOYmNkZTFWUThj?=
 =?utf-8?B?aG1pQlN6dklWaDVKTDluRWZRQ1FWamFQbWxDQlZ3R29WeTlzeWwycU5zOEph?=
 =?utf-8?B?NXJaY1FYNWxPQWpEYnhtMUdQcHpLaDc4eG1SZ0tnZVhJamVoZmdhMllOUzNw?=
 =?utf-8?B?T0ttV24xRzlFYW11K3VrUjBvUzRzb0pZOXdza00zTkJFZUVwMVZBNG1NMzlM?=
 =?utf-8?B?Y3BCa3g5MDJwOS96ZFhnSCtHMzB3M3hKcEVnb3h2QW1JakhVTFdmTzF2cEQ2?=
 =?utf-8?B?RCtUTG5NaDhuVzBsVUZwcERiS25TM09tV3Y4QVRtZjAzUldndkdOWGQ0Yjg4?=
 =?utf-8?B?NEMwcE8zd1cvZjRNejdCUTZBWGdzcnlLVkNyL0pTRkZiT2h2NUhBWDgvWWd6?=
 =?utf-8?B?OXJiUXhEbm5JejRJY2RvbDg1ejJQL0xnRkVBc3kzbTFvOWFuZmpYQ05aWmx3?=
 =?utf-8?B?VWZEaHJPc2YvK0dzZ2NjNTlwRGpTT0NjU3paNVMrSHMwM1dESVd2a1MvTzZY?=
 =?utf-8?B?dHZ1U2Q2eXlqK0kzRS9FY3BUWWdtQW5OYVU5SzUxTlhaNDVKRVZOSmFvVXhG?=
 =?utf-8?B?ZVA4TEZLUFA0STFPRUVVUTU3Wm42SzBxRTdJSVh5Tnl5eDB2T1Vna01nNGJF?=
 =?utf-8?B?eXVDMFcvbGIxaHpVQlJxRmg3OUxhbGZsalNob3hxNE1EdkNvb1JhS0g1d0hG?=
 =?utf-8?Q?RZIa2Bdq86i6P/UrrA/3PKs/E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec287a5-920d-4d67-49a5-08db55e1cc69
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:47:29.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDY6GJrgMvW5ErxTHfmsUorDevdD6fep59G8exwb3QQuX7BBvu94ed4Av2B5MCQjFKq73KuTF/WLkCAouf3VbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7132

On 15.05.2023 13:31, Alejandro Vallejo wrote:
> Because CpuIdUserDis is reported in CPUID itself, the extended leaf
> containing that bit must be retrieved before calling c_early_init()
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



