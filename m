Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576365EA5DA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411761.654812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocn7z-0003un-1u; Mon, 26 Sep 2022 12:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411761.654812; Mon, 26 Sep 2022 12:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocn7y-0003sP-VE; Mon, 26 Sep 2022 12:22:26 +0000
Received: by outflank-mailman (input) for mailman id 411761;
 Mon, 26 Sep 2022 12:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocn7w-0003sJ-Uh
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:22:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60044.outbound.protection.outlook.com [40.107.6.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfb3a65c-3d95-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 14:22:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7824.eurprd04.prod.outlook.com (2603:10a6:102:cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:22:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 12:22:21 +0000
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
X-Inumbo-ID: dfb3a65c-3d95-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKqMYz4mbe2rPfLpFuX65uIFMHcbnnmtwdfP6SGdRuI0V00IChK00rv7EQmYP0q87RPWV5mrbzvYgCoky8JUzEyNwhxi0AdaXQHnLp9i/Y7ppvQabQveiDcMoiU36LUDDKCEaUF49LOsq1JMRZbQSKt9Z5fxfy2oix/Sw+qdCNy4Fq89NOXZgKc7GwmQ6aCjXpofzcDWA3GFC/rKt2HhyTFrsJAApZbSpaP4+LB7KJazgWLg0dwO+quT4EBrkv6s3bUAAsFOjqLe5ZNPwstB/JLUIrGYaXm+uo1L8Pi0+TkqMsAUqA8lIja4iwclXF+DuKng8oUc/rTEkfrsv5tz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNifXSZfcJy6HhuQWlAFfZBqNhPJYZnfAF6RhQX7XHQ=;
 b=gSXQNt3OzpxYk6LuSWaFL/5I8kfPAq1tzsZjfaecf+UROtIdCMJ1U7Smm8mTjmjkCKm33W5uBfbhBdIoQQ6z/4jPjcumdwAMOI+yh72VUWlbgsjvsqxg3seBxIXsDyN4IEoteBHQLjhkzlBV4u9DOqg03cDLCHtsSQa6WchsNLWDP5otw+nsmVUs0tJ6bmwBRvrQY8EB2SZIBuyOf5k64vJGtdOz4iKBVaqUjfVDRJLHVmQLctxxi0CmL4m5uy/mrwDp9aPkVP4EA5Pn7wVdeeoY2PoJPtL2+chcHYPcMT8mTp3TUyiOb8TSS7bSsQYKNxS+6UtrMkUnMRmT2Kwiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNifXSZfcJy6HhuQWlAFfZBqNhPJYZnfAF6RhQX7XHQ=;
 b=EEEs2fZbvDLe2vfJZpo9SCus2jG/7fcDYkcdLlJMhlmyfpn8cQB7ktzXwkkguHpigdePIU3MKdWCiy0O6bjXwzvuvQgHhx8MeTgFBlozO7OsvJHTQnf0RTNk/pdqMpDMkan2je0ujZxWtjnn/IeH5QNq6if1682e8M42fu1XSdB5eixr0gdea9QV6GARlQmnIJgEiSUQ4Ca36dC6XsghStSdlV8F5+x0ry0/oVIHykGOoXVJOYfNdP08uX53omcHgRoRQciLMEfT6lmKyiXR5jarY2C12WoB26xqUDolMYNXFRNraEkGeeSkoTMDVsf0ngZatYLC+z1MYG4z+ST58w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2bfe781-58dc-06f7-aa7c-0a2ef6af7e03@suse.com>
Date: Mon, 26 Sep 2022 14:22:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220926110547.21287-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220926110547.21287-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b4c070-ceaf-41f0-8474-08da9fb9c2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FoOmT6Ih1dK9HwnPjJrTkkQln8QxgatyJItJOnHPBwrIp2sV97Mn8x0fjEaV/0KHZgCPiP8ZXvejIyEDqxnY9zdhR629pB9VCyQgow5FM+rv/kXFPN3iCABs2DTyREKwfcwt/waNdXLyboDbQiX0X27RfqLXeNkXXf6AfemWhDvUpngBUdQM6kbFTc6yVAxrwjKMgMnR65K9eCpzVWioNaOzU5ItNSkV4vJ+GwYYwRcUeiZ3ybBL+dKvthNjj3Y5m5V42lQDmQGIVD/6h79/rQ1NDMIUnYsHRzCCyNjiYV2O2UGb1KwcGkRWBXYDbxqp9wT8VMYu12MiphAy0J6WKj37nfnyJX+MnaSVkJ0dq8P+k9yBaNARXnIwZrjzPYvjdE+2alLvs3ogT725CBEGNkDV0k1Xus6z2ladQsrW6mJyutPzwGrG/YF+lqruz5u3GKLTrCyWzH6hIEwInOlFTM3ORfQ+nFZ20tunHA8MjnCZ4wtZiG8VrvX27sQET71rkmC9Jo4jh9bqzQ4apvBH9B53m3Uack2ljfNn1ao8ZCMDnTavIpXz+h6OTQbYHML1cSmF3n+C/KdxHQLjYRSdgY841SDHRTgCDCxF70UpNz0gx5gBfn781C6655ZEUdcSrCVKMEOR9aWrj1TpQUzqSsICiqo+w/NklDq6mTAyEq5gzLX75RHzvnUchVyosyVqAnabqqlIkd8mioUskevM67T4yrcDpG6SKc/u8OyohBzqQGPX80zjeNvrGwIQakBtfIcIgpZuXsacs+yv5kd29+op/k9/eqppwDVZCA0ZHc1RKwJr2MEMSd4SFkDtXQ6yUEne2hAk7vu3RJPi+qlA9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(4326008)(5660300002)(966005)(478600001)(31696002)(8676002)(86362001)(6486002)(66476007)(66946007)(36756003)(66556008)(41300700001)(316002)(4744005)(54906003)(6916009)(8936002)(38100700002)(186003)(2616005)(53546011)(6506007)(26005)(6512007)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OURzbngrS28xTGF2Y2o0NkhnZkN0UU9TeFRwNkRRWnRkU1lzMFlicGMxbGNh?=
 =?utf-8?B?Sm1pandJOFJadzc1ZnJYVzFLcFhvMEdJeFNVaTB3c1EzbC9nUDhlaEFYVU0w?=
 =?utf-8?B?YzdEQ3FoRE9ZRU5WY2Mza3BHUVlUNU90eDdxN3RyYWhCMzV6ZG5RUVE4RnJ4?=
 =?utf-8?B?SlhDNklTV0Q1NFk2UGVsRXdPenNhbzF4dDVCY2hFMy9pRGxLWlZOODM0WTB0?=
 =?utf-8?B?dklzVkdjMHRCbW9kYytGRzJ4c0tmOUNnT0o1bmxBZCtteXp3N3hVR3ZVUS9F?=
 =?utf-8?B?dWpaK1JGMHVtS1JkekUrRThDaytla0hrWWRCcVpITHJFNVBpNmNFN3dUZVNS?=
 =?utf-8?B?VUxMMGx6dXZRSGNvQlFobXVkYUFQcTFiQ3JvYXRkMW5GWE9oU3JjZElUU2FX?=
 =?utf-8?B?bjFWNTZMcEkzS21BdVVReW8xSVliMFpVdHRZSHZRWVhyc3lzSGFyeHByNmM4?=
 =?utf-8?B?b2Vlamxxc3RwRThtNU9zVjhnVWVnOWR5SmVpSUZNZ08rWlNrQ0JUV3htNHhm?=
 =?utf-8?B?TVQ3d0dlL1c4bGZXK0Y2VFltWEZNa3dlNlNlTEdQbHpvQlR4Y0xuWW1xQnFs?=
 =?utf-8?B?Y1ExRVhYNlI2TTd4UEJjWjg3MkJLQWRVdU9NQ0w3Q2k0bWFEUERncHUwdFVh?=
 =?utf-8?B?SmJmNDNXQ2YrUDAzYjFTUWtPd3F3bUdSSVl4Q3oxZWhjV0J0cHljVVIxZE0w?=
 =?utf-8?B?ZlBWY1lmYW54Q0hRUm54aUNhRDFuSTNuRG41K25IbkR1ZnJtWUJCVHNqb25s?=
 =?utf-8?B?WGZHZ01nZ1NxQnZDS2F5WmpKT1l1NGhva0VUdWVVZTZ1bWJPNUNDaUJLN3hD?=
 =?utf-8?B?R0xNRWN2RmNQMnRBRC9KazdUODZkOU83MFliREhuRXIxNldLb3RPbVM1b0Q4?=
 =?utf-8?B?S0VVOEJTeGV3Z2tlSjFaZ1dLbi9OekJ6OWl1ZHBDbGlmTlVXOG9LTDhYQ3pJ?=
 =?utf-8?B?OG1CWEtHMDA5Y3N0RmRUL3VOc2czSXVDZ0Z3cWxsakdlZ2FuQldxK1hNM0h0?=
 =?utf-8?B?elNUTi9Pa3VBNkZLdjFHcXk5TEhhMDVweERwd0l5VzdNdjlFK3BHdytucjlu?=
 =?utf-8?B?QXkwMDZWcmdhSzk0M0k4NjI5WXROSHBzQjR5cmpQSnEvQS9iKzdpN1RZNTJz?=
 =?utf-8?B?Q2tibXNiUHl6STVKbmtaN0kyRnBDMEJONVVuMlV1V2NGY2p0bG10YnRLNm9m?=
 =?utf-8?B?K2I4SmY4VjBKTC83TzRDd1hTNng5UTZZdlBKSTQ3TFVaRWR3Sk45SVJyWXNZ?=
 =?utf-8?B?bksxVkw5ZjBKdm5qVGxBK2FRUTI3bEVoM1RIVTBQbzY1Ymd0YzBPeC9nT0dC?=
 =?utf-8?B?MWkwSngxYldCR25PYWpuU1FYMTZYWmlMWjNHbkNMdWQwMzIrYmFvZGRueElM?=
 =?utf-8?B?bEVTMU9tV1FCUHMraG5wNHRmbzFCcDcwc2FOTWMyL3ZheHNnUGZKK2VYOE5K?=
 =?utf-8?B?clhJVnpRZGtTNllSNTZKR2pEMWFNZnBvcUNnVjRJTklMTzVwRWlxNFBFK1g0?=
 =?utf-8?B?NTJDbnNoNDhUMjlabDVINjdVbStIblZrMXNDSEhDRHpidk9PTlRneldnSVMv?=
 =?utf-8?B?dW9DL1Q2NEc5dlk4N2Z5NHpQb1lTMjE0a2R1a2NzT1duM0ZzY25wQm8xZTNa?=
 =?utf-8?B?eFF5UTVmRFZFNzcyQ3g4U1lXNjV1MklPTURyOFl5NlpnSnNmU3FiMEVibENO?=
 =?utf-8?B?anZad0RwZkZpRjc4Q2hjeHFxSWpYRE5zN01jWEo1YWVnY1VnUVN2S0g0cWJ5?=
 =?utf-8?B?WE9ZZ05xZGFvcmFpUFlLcVF6YllMbTdyamY5RytkMENyVHpiTExUZUk0T1li?=
 =?utf-8?B?Rk5mQWozOUE1MzVwNzRGM2t4MkorOHZHZGtmelc1MjFyaWk3dDAraEFrWGl6?=
 =?utf-8?B?OWtUOUVaMi85WDN2NWNTY0Y1TE1hNEpnbmpyUFRHb0NhUHdsWjFqNE1SVnJa?=
 =?utf-8?B?TTBRUnFyb3BXWFcvb2VTWXRqbXB3ZHQxa2hGWE1pcm01QjNyaFJXWUQ4ei9G?=
 =?utf-8?B?KzkyckpVRHRlbE8zYUx3alFrQjQxcVJOSTV4c0tNeTFUdHVRemx2ZFRsRG5u?=
 =?utf-8?B?c25raGhSOFNnaFhvMTZEOUZzdnEvNlN5MGQ4ZjlyNWJqMFZqSDVITUZ5b2cr?=
 =?utf-8?Q?vfxt3YTqEhMmkfkQkKEOjM71U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b4c070-ceaf-41f0-8474-08da9fb9c2bb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:22:21.2744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9vHArCayhMvqubBKgjW+CJZjRRFjJwWbBjt3T/hMkma+MSKhu4B40aIL1+MRz6OM4UNXZdfDCOzaRkIrPMkfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7824

On 26.09.2022 13:05, Andrew Cooper wrote:
> https://gitlab.com/xen-project/xen/-/jobs/3083068950#L1763
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 022e40edd4dc ("drivers/char: allow using both dbgp=xhci and dbgp=ehci")

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm sorry for having missed this during review - we were well aware this
is likely to be happening (and I'm quite certain it'll happen again).
Any news on the status of the compiler side patch?

Jan


