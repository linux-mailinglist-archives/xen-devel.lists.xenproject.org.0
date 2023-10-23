Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8E7D3908
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621497.968009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvgg-0005Ym-UI; Mon, 23 Oct 2023 14:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621497.968009; Mon, 23 Oct 2023 14:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvgg-0005VY-RX; Mon, 23 Oct 2023 14:13:46 +0000
Received: by outflank-mailman (input) for mailman id 621497;
 Mon, 23 Oct 2023 14:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvgf-0005VN-BV
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:13:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ff5b517-71ae-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 16:13:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8830.eurprd04.prod.outlook.com (2603:10a6:102:20d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 14:13:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:13:43 +0000
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
X-Inumbo-ID: 5ff5b517-71ae-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUFN/93/MQSpiBzctrhGy1i8yf/lp6am2RRf2N1MX+76nxk1R4hH/aan03boU1Gq7XG95zl9/Orz3djqJRAacTLNRl/dZMn+AzWaW4Vo12tk1Q2crJ+y5NYiNyyJdRRfGSgh8a2YeTVezvFUiaHKkkmYQBd/jsdCJ49tm7DAGVp+8HQIbU/sKOaxlasXU74xdW/1/FLkIMwBRkEf6WDIfZjN/oJvoe/AkwQBWBoYORejNVx2Bl90R49Gv8YsAlkc/Z2/DUFiz6XNBLROpwlOx5/VpVwEA54ahyce68zcRcwm5WQVTSxAYvGYqhHLvH72wjTtXQiep+eYBJsStevG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKkrasVKTla8K2noSDagJeQ4zBLt3sPyI9dO5Gg/sUI=;
 b=mLfRphmd0hghvkm86tGDo+Pk0HhOXMW0JVTMlLPjPkVJ08T6HPAWe0CRwuvh69MJXSK7oV/sYPYnpoaAjYjVW1clwsOt/AXF3Xp/+J3DzUvbW9c/HhlD/UW8Lwtx48211yYNdpO147fuv6F97MUr/4N07qCN3kJ5Q4PE5hQVAeFz+JGidAvwc4j8Su4XiXyeQJQX6OrhY/s62/DGleCw5gLXCq/mLzsogqB78/whwjUS3NupuBdFua827y7xZGvRwmR85XKiivF9VLEGC/ZRKELE1wT/mdqBNAFnXK5pPkRDRvLArWZJCAV/ZKDBCpjWCJnspn7VTYmPIKn8+XCwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKkrasVKTla8K2noSDagJeQ4zBLt3sPyI9dO5Gg/sUI=;
 b=GGtcKS4qSz7xJvo83nEPxLM7Py3ACc91LHVLEAx6KHNycOK7Q5XCg8sEhcvmN1sFwkwHYlOe/XFTgUInd/tjpiwp9ox1Wdfyi0qRiZBL3XN2B7n4bxysEOxcM2/yCRLJGHuUxeeS28YnF+q+zkG/c5WLtyVSwc7nCESxXap4DeSUXgIULzJ/m2N7V+5g3Q2kOcpkKIt7rA653wbnN/yTrLnELp+RWSmXemvMEMw/XrqL/BKAdEcCmFpTFAoZbkVFoeO700EVIy5LP7/qQegt1LpLD4fPNB52YqVhgnSiMqPWxU58MS6b8PtjhTccO0P6Oe5Mjww7KI8OMvO1jVeilQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16fabade-29b7-4882-12b7-1231330a6007@suse.com>
Date: Mon, 23 Oct 2023 16:13:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 2/7] x86/mtrr: address violation of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638486.git.federico.serafini@bugseng.com>
 <d1fbcb647c82032660ffa547a0da073c3e625b7c.1697638486.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d1fbcb647c82032660ffa547a0da073c3e625b7c.1697638486.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0357.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: df9e6431-5094-44ce-a2dd-08dbd3d2435f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BpwhucEnHaYioRKGGiyh2ZIIkg0DMxD5eHLky3HkEpJuIeYJzD9btynBtXh5yJfIJxxYhiL0Zmdz7tqn6mFJYm9pBdtosQYqC6A+xS33d4l8X+nBbHt53Bsl3vPwrgOiLE+61s4L3Y6zItxE/oKjnFd91Pk4eMrkHfu5c2q798kfpjGwp90J4YZ6B/S/NLv8pPod6CnJ+m3v52eNJY4MQdjGi5M/iEwcxVGgmNpMcuE+njQAZHsX3qDsQwlglyeVTZTaBwFyQXlXX8jG2OswuL0fyUzLXbGWFiY8VLr7Ck/SweLxQzXmB0zyWGoHAJ7Tybc+zWPXsxENBDASiC9Ez1/HlbKeriRWos0a5FbZEdi8MNjb+xO8qJFYH6i8rzMjVIte4JnH7MWwYoMUJK2vRZHH9UaQy+EsfXcBxR/o6gEpdn/IlJH7OHGpplPBDiEDFciR5LspcVxqe5SegsGQaOKekTboEHmT7p9w53PFv7YkCLbslQVHFjKx6RAFoFOV6p4Sp9BZUyXqLbnn1ysWqpD3y6Jrp1+Iz5+5Li9EVdqI43fOL0LFuIVkrUUabVgiLBc+ZQ3d8tvFwVEJ9noJ9QMHmurqCIXQdYnEs9Z9Qt/pLVT+mq2HAqKnMKmPcQ28vm9DYhXZ6/sydtrvQ3BwIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4326008)(8676002)(8936002)(41300700001)(2906002)(5660300002)(53546011)(6512007)(6506007)(2616005)(558084003)(31686004)(86362001)(31696002)(36756003)(38100700002)(26005)(6486002)(478600001)(316002)(66476007)(66556008)(66946007)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjRXL09MeXpOYUo0MUZGRU5tZUtJVkZKNFhEdkdNck1WUVFGWlRiUkdDS3V5?=
 =?utf-8?B?bDZuMkVTQy9Pdk5QNkt6NWI1RTd3RXB4M0h2TkNmUXRuNFBsWWg0TDRMZ2hw?=
 =?utf-8?B?NkdWaUVyaElpMFBXSXNldzNITHF2UkptY3NWSmdrQUpFVFpWaU1mV0sydlNp?=
 =?utf-8?B?TTBvakhVT2FncnN6Nlp1Mm5XcjdYbFlxU0hrNWRYU2RSalZ1Qkl0aGZyU1RD?=
 =?utf-8?B?bGJkRGYzMFg3ZGFQem9ud3VmVENwU3ZraGFzc1JWdDZWWFJYWGthT05LTWtm?=
 =?utf-8?B?Zkcralp0QmQrK21yTk91TzE5Mi9Oc0pWN3hzeUFhNk0rOGxnZEpSTklFcWNM?=
 =?utf-8?B?aGdxSkxDZitFUFV1OFZoQ0xaL24rSGExdWxLTFY1M1FlKzdmZUMrN1Vua2JE?=
 =?utf-8?B?RVQ2VTFoMUpKb1VudFk1eURVcUlldVZtbUUwRHI4UGJ1KzZSL29XcXZNTTVG?=
 =?utf-8?B?c2JUL0plVHZmMUxSUEx6SnNSM3d5R2xBY0FoQUJ1ZUhzZVMrNDh4dG5JbGlS?=
 =?utf-8?B?ZERyMTkweGRpYytvd05VcUU4S0gzLzhSbU9JVWhqL0ZrZ2RVRU5ycnZabTRS?=
 =?utf-8?B?ZVdNcy8wT1B0NEVBNE9zRGFuTkVYdUQ5VldSdXlIK1pBV3RVcTRmZzZJajVJ?=
 =?utf-8?B?cnpEV2xKU1M3QkNZbnhubmZ2eDRGeUVZR2hRNkZrY29odlpxVldQTllBYzhr?=
 =?utf-8?B?RXBJVnZSRnZBc2dNMjdJYTZkcmhXUFFsSVRnZUNja2cxRk9nZksvcmc5MTRt?=
 =?utf-8?B?MXpZdk1SZ0RWanhWU1pEd1FkaUluelpreEJwNGlzOU1zQk1HNFBFZXN1bVox?=
 =?utf-8?B?N1p0ZU9NcERtYmYxUXBydmFWckdjc3RITGNNOFBLQ2drNFdJWEtKQ1ZmcW0r?=
 =?utf-8?B?VjByZkQyWUJxSitIalVQWnJhNnlHZy81RkgxYnZtbTFaTVJzbEthMUZGZzgx?=
 =?utf-8?B?L1htd29qb3VlNnIrZXUyWnh0L2tNek1yc0tUL0xuVVpaNnduZVVWZkttSzI5?=
 =?utf-8?B?QWlFeGpydW1MUHMwblpFMTE1bngzM3ZyTjlLODMxNEovWUIrMDM3Wm5ja0lO?=
 =?utf-8?B?UDRBQkp3VExQZVNqR1hOYVdaYm5EbHlyUnltVFZNckRWU0kwc01KV3h0ZDdv?=
 =?utf-8?B?Sk4wdU5qYVgwN0h5U3RjMHRpdFJRd0REbDJJZ2VvM1VhOUd2NWVRTDRDR2VC?=
 =?utf-8?B?WFIvTUtvTVh6L1ZONHR1RDZLRDNBQ1BoS0xlbFQwem83eWh4ZkNSQXptd1kx?=
 =?utf-8?B?S2o1R2NnaXFodmpZQjhRaSt1QklEc2p5TTMxTVpsejlzS08vVXdoRGo3MHFz?=
 =?utf-8?B?RStwSjMrYXdLV1kvUDFkMnVUR3JvaWl0RElNU2s2U3h4MFpydmRIWHZMWndS?=
 =?utf-8?B?bWNLK204TERTdktYS2xxS3gvUzllcTF2Y2pZZ3FrdmpwYjlzZWdUUHJBcnFq?=
 =?utf-8?B?dTJ3b0RkYXZKc3dBMXVSaHRrK2s5cGt0bGRLQjg5Wm1VOXFMSFVTTExzczBO?=
 =?utf-8?B?ZzBWUEdoY3JzRmhDc0xaOFhRU0pwVlV6bFFSeXlsRVJma29Fc2E5bE5WZmpj?=
 =?utf-8?B?c04wWFdsWGJNTVdUKzZtenl5bEVHdUxOYUdvbFFkQUJ3UGF0TlZyTDc2d0dL?=
 =?utf-8?B?cm43Q3lmTGZMN3lEYmNhbkg1Zmg1Z3IvK3lJU2puR2dsVVJPZnV1aldvdHcx?=
 =?utf-8?B?U0g2dnJNYXVOUlRGak5tTHVZbEE0c0FCU1g0L3lENkhqdEUxV0pTRFdtZWMr?=
 =?utf-8?B?TzhNMS9vdTF1VzFYcmppcmpEY0RoWVpBbi9SOWI3VEJBVElmZk5ub2t1SW8v?=
 =?utf-8?B?bVBBbGJJT3diWmVwaUVXaHlQNU1RdUMzNkF5Y2hjQTNiUkQrVjlPbnFEbCtS?=
 =?utf-8?B?WmdtT2x3NXRCOXpUOHJiR0pqd2RER040SHNPakcrVjIxcXBzbnU2RGtqbjRZ?=
 =?utf-8?B?bjhDRzMxdDBuSVoyekRKN0FYdm0vV0syS1UvUEdwamFSNGkxNEpGVDZRbytW?=
 =?utf-8?B?TlkwbTBwNWsrdXBKaWp6M2dIbFFFUCt4THJ2UEMzSjVxQUZWeTNScHlxUitS?=
 =?utf-8?B?M1NkdW5kK1RHcmtmQ2hML1RndjYyN2FDdXlpN0FuYzI4N1dON1UwU2RwcjBK?=
 =?utf-8?Q?t5cCanGl6BILpB2RLkm38i/Q2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9e6431-5094-44ce-a2dd-08dbd3d2435f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:13:43.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKCXIdxZfheKkSUw4Ly3YvQsjcQdgW0ePVAmA44Cohrky3e3nHfKHJKCvIl1CjEgDxWxfV/xiVQdSWMTTtmVyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8830

On 18.10.2023 16:25, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



