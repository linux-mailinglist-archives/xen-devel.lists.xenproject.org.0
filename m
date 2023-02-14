Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B897696933
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495300.765640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRy2x-0006hn-54; Tue, 14 Feb 2023 16:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495300.765640; Tue, 14 Feb 2023 16:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRy2x-0006fV-2R; Tue, 14 Feb 2023 16:20:47 +0000
Received: by outflank-mailman (input) for mailman id 495300;
 Tue, 14 Feb 2023 16:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRy2v-0006fP-79
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:20:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 872acae3-ac83-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:20:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:20:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:20:41 +0000
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
X-Inumbo-ID: 872acae3-ac83-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXefGrCB7BNWaeqL42vS6JhpPlxyErv/GObGPynku42beKzcZYFSIaaKjcnNPUF1QJaFlGGJ0OltgQy2xVKQvTeRyiAMykcq/d3pOPyjUVTikJJx+STJGqo5U5oewHLrFdmaWEliQ9HAAB/nhgm0iC7SBGUGupZBqLIXWKcBWmUS+RsMTirGg9MOTa/Jqv6UEOVotQQi4hEfrOFFeSt+XTqBnvW2MHWOWyX/f86QZHDp5muzK+ai44BOSWXyAiffqrPd58RIR6FZs7b9TlHnaEOD/GXCSTQPnhHBdQB58YvLpJtWR/cLOGSBAq7Ax1Hj8+yR5ILG66FVbarZbDjh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgFuH1YLVG5t44UiYK5Dv3o3h6q79PMckx2pRN2Zo20=;
 b=aHBWS1qmatLZPSCAk35rrCjcVTkhTY5noL4HEMEG1UdHvd+AHOyeUjq3v8lAtygXKRr3TGHqBnfrzm5hhO7z5glNLc4DkgdCwMAwKes15wLrDr8+GNr4syeOI30rS7LIYHTZEpEDwByeJaszk8n81oD9OVNA4elM1Fc9UCFu7l9cC4g0sHBxfMRnDB/5NG2kUMJaC+7WfoPrMsPDH/abvKz1j3T0QmrYVrqieurXfKangzH7f5vBPu8bkWwIktASE0ZeJWB82EjZzU3SGQWlX/2n0/2HLfYGIP7RmM9r2qZhXgNwQRMDa2oDwhxfVQB70PX2RNFBefsjyDGXtgiE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgFuH1YLVG5t44UiYK5Dv3o3h6q79PMckx2pRN2Zo20=;
 b=RVFfW3lp6yLXvIQGK/BQfxLCxc44ymfxuPas6waN25nGH92qpk4GI2rRKpoemVcuvU3bQ21Cx2nlxeXrn2LhzKL4fH1QYGTHfsP68pDzBhgOoTBhBPqsHNKhc751ggs56m7Iecr220CdZiotRDkkigFnlkMZ9DXDduxNmQXbIO6Ks1ODw+4JaJgxhRHgbw4+RvhB6GniFuJdZALEVmR3/7sjmmLmCqeaNcEboaLCAcK/j9zE40rGc2qcjD2Ye0DazK2O8+cs00SrcNz/2hZ2OJuRPpQdaYZHiyYSXZJ41oGImy6Du9VEcBoox3VTM8G10J3uV9mg4/iLPSe+q8+Mww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd4a0127-554c-8dbe-fa66-ef651470f44e@suse.com>
Date: Tue, 14 Feb 2023 17:20:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 05/10] x86/traps: guard vmx specific functions with
 INTEL_VMX
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-6-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213145751.1047236-6-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: f3714235-18e1-4a5b-2007-08db0ea76a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	azv4aSsqNt3FuGLrltNDRs83eMxJwXR6YfCcmS0nPE/ofdODW9hq8rgXijqJeasFns+wFhW7ExlTMWrRI35uPIFaiwsveuA53nAw4yeSb42dYmLjKMRNLfDiT2CbIYYRcpgqnwKtAIrffYKyS0xEGhvmdaKhdE0JaOrCtFZZHHnTKscwaoU+bY9dQDMtPUc09B2IMSZL1Otbh9nOy79T2e+smqw0fbRKxtIDOmyvGC+DoJ2vYFd+4HQ6IE6B3/3bySfM5iC7w13ZZAlLD8H6+K+kLwZMsPmifAUU41fz54r+zFdO7Sz80DVbnTPdpP81sk2S7JS9DD3lg7T9cy2IFgw9u5MUI+uQuseBLHmXL57l/tC9jX1x1/QQpg5ORS+r4q0IGV/WF893v7MIq4wsiD4IuPA+DEUPBQrsup8k3URapLnIfIXegaz+yK/R2mvhU0Qs2Pa9CZ4WR14vg3YTPI4Sk35p6KVav1s/H37DSfwVZj1yzRNlg+RlbYk3YsjE1huA3fTJb7gKHYM66LvlL8z0dDmQtNUIB7YWxq0qneu80xl7rk6TFgBHbs3Xjc0//0qC51X+OqFRGXZR7Lj929nZQx72stgx2d5iMiEng6ZBzP5xt9BGIdEQZMEeP7oBUDqCB8c85C5BTKL7GqyBfRInVBSKhKg9goOvg02Mmnd8r9IOj3A8pPJHcVWBNMUySB29xoWoBaB2fRawPaIC/kBdOBzQoD6Sc7qAz4HRoUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199018)(2906002)(86362001)(83380400001)(31696002)(2616005)(66946007)(26005)(38100700002)(66476007)(66556008)(54906003)(316002)(36756003)(4744005)(8936002)(8676002)(41300700001)(6916009)(5660300002)(4326008)(6506007)(6666004)(53546011)(6486002)(186003)(6512007)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmF5MExmaFhlTlF4aHg5RVR0NGNoNEZjajI4WDVMdzdWV3d6OWtleWtwNDcx?=
 =?utf-8?B?bW1oazFDelkxaHNXUS85ZTEvTGRuWEw3ZkhtUkxSNE4wQWZxNC90M3NVVEUv?=
 =?utf-8?B?RWMzMUpQYkdKbnNGOEJ3b0NjYmMrZnNDbzg2RG5DWmtwU2s1WHg5anhEK0R3?=
 =?utf-8?B?aEg5MGV2aTk5TEtyeXB5VEF6bWVxSHJOVUl3Mkk5V3lNT2RyY1FoNG4zRDQ5?=
 =?utf-8?B?cVVkcXJXUVQzNDZYWWdNeE94bzVVdzZzeURaSDVNOVlReDZRbjRRYUYrNEgr?=
 =?utf-8?B?UnZ3RGVwRy9QS3hqSEFoY2V1ak4waXhjejNFOURoL2U3VzZ4clptUFlBOEl5?=
 =?utf-8?B?V0NKdEFzSXp4ZUJPUGtOUWcrVFc3Wmxyd0dBRDVIRXdXMWNTcFVNQTkyOXVj?=
 =?utf-8?B?elhQWERLU2xXenR6eko3eGtSaHdUODVKQm5mQUlnQnNuYVI5Q0FtOFc2Z0Rv?=
 =?utf-8?B?OUJwV3dIYnk4VEhBbm9tajlUcERqTG5VRFBwckJJa1hqWnRtNTloUDFOS0ZH?=
 =?utf-8?B?Y014Vllrb1Yzdm04MGlweDBKWXB5ZXdPeXFjQkNDT3BzY1hDSFdvYlpBMS9D?=
 =?utf-8?B?NkVQbWJWSTcrN25DdWNKUHN4WVBURlV3VERJOFM0TDZjR0VvWHU4SFFvaGZH?=
 =?utf-8?B?anNQdEhDN2tRUkFWY0pralJaMjlGQjUxZHU5SDZqeWtRRDhUcnpteDZCUFF0?=
 =?utf-8?B?djNZc3FYbEljYitBQnZDd1NuQ0lvRCtJenZaNHpHZnJVUEtPYU5xNjZlaDRM?=
 =?utf-8?B?cjh1cVdVU1psbTBIRm9LUy9qMmJEdW80M0YrbzFKbHJFcDNQMVFzcmNveGdx?=
 =?utf-8?B?K0VTdkRraFUzbzlRbC9ZUHZ3SUdmbHVHblZjOGFlVm81OXpiYjJJK21pVVIx?=
 =?utf-8?B?SlVrclV5bFhqTUYvK1NISWliamJyZXNsaXJLR01hREtjZXZySE5iNjV2eTQr?=
 =?utf-8?B?bkJFVm5TZjJvRDUyNVoyUG1vUkI3Wm92QitNZEIvOVFBYit0YjA3SGV5V3Nz?=
 =?utf-8?B?M2FDV0JJanVaQmVvaXBQc3krSldyemtTb0xBbWViT1BDSUgrWExXa3BlSXEy?=
 =?utf-8?B?eS9XM1l3c1pKeWRSc1l6NE9FS1ZSYlQ1NHZQM0lkNEk0M3hwRnVKS2RqdzVo?=
 =?utf-8?B?a0ZtQ2dReGVINDZKUW4wOUlZWGFMbEJTT0loNXBJYmhJYWF5NjZFM1Q1b0Fj?=
 =?utf-8?B?aHdadU43N3JNY1FyYXBqQWhFZm5vSkFPTlBueUpBVmJKdVJUU3ZDT29oS0JW?=
 =?utf-8?B?b3R6dWJBMTRtRzdTeGZWOTBnKzJBeis4Zzd6MXVFSndFMlhxSlZjNXpwTEpU?=
 =?utf-8?B?bFpTYWdOZlM4UHllQ1AzK3NGd2ZCekRmd0tld0hTanJSMXprQ1hwRFErRldt?=
 =?utf-8?B?Yyt5dEsvM2pldFlsT1laMUFRNUVqZis3RmF5bEpCZFFCbVAwcWhmSjhUZmc2?=
 =?utf-8?B?K2lBYnBwdkV4LzBmZXEyN08vY3NMaFkzblk4ZzVvTUhzOUQvb1o3WWZ3RW5Q?=
 =?utf-8?B?UmlSRVRVOHRNbVlpQnRSM2pTTUMxaVFqZzlJaitCU3o4Q0lycWVKRVJLTWhq?=
 =?utf-8?B?QmlFcndUbDliZ0xkTTlRVlJmTjVuSVFIZC9aelh1MEtsc3dGOXFNUDh0SWlB?=
 =?utf-8?B?Yms4SkV1a1U1RkczL2wyTHcxNXFSRkN0Y0hLcFEwdVFCdlNuWHh2N3ZuMStx?=
 =?utf-8?B?QkFSTERuYXZyeUlUdGZmc29FZzFoYkJHT3oySHFpNzdjVk9OaExpSU1OQm92?=
 =?utf-8?B?L0pqQ3Z3U1JWRjVjQXk0cEJIWEhVdzFyZ1B4Y2NnTE0xMDEyZ2JPTWpnU0Z5?=
 =?utf-8?B?bFdUbFgxa3dlS1h0MzZLY3pDSUFVeUQ3VW5RTnRnNERtUmRsT2drcHRjaGk3?=
 =?utf-8?B?bkpsQS8yMmlXRW9SMjZGQ2svVVhBSEpaUXhmS0hZdGtWY0IzcVMxSGtYUEpB?=
 =?utf-8?B?MDMxZnVGYXJRMTlVVWZJbTdjVEE2Z0dqQ1UrQkxQTVYwNjIybFpzOHl0Mklt?=
 =?utf-8?B?QWU3WWVERm5FVUJ6VCs5Q3R1SElsc2VyMElLWEQ1azJvZDhhN3B6R0ppL0dp?=
 =?utf-8?B?d0NvYUFzcU9XYys3NHFpcEV2Tm1OeEw3V2pVV3p0cUFDSkxKRVU4Z0VyNFdO?=
 =?utf-8?Q?PvHmSdYKoMOY/Fsv1xxHGwL6i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3714235-18e1-4a5b-2007-08db0ea76a88
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:20:41.4877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcfWIeHwT2k8XX5Sr8FhIY+AM/FKQbtXhXl8K3E/GYknBkCYGFM8CXpv6jHlQ58UQ5B3AXzZZ+uDOFAxPisusg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

On 13.02.2023 15:57, Xenia Ragiadakou wrote:
> The functions vmx_vmcs_enter() and vmx_vmcs_exit() are VT-x specific.
> Guard their calls with INTEL_VMX.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

With whatever the final name of the Kconfig control is going to be
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

