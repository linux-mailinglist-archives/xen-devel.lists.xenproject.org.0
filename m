Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30287A078B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602330.938835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnWU-0005E3-PN; Thu, 14 Sep 2023 14:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602330.938835; Thu, 14 Sep 2023 14:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnWU-0005C4-LV; Thu, 14 Sep 2023 14:40:50 +0000
Received: by outflank-mailman (input) for mailman id 602330;
 Thu, 14 Sep 2023 14:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgnWT-0005B4-Dd
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:40:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b09be832-530c-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:40:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9925.eurprd04.prod.outlook.com (2603:10a6:150:112::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 14:40:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 14:40:41 +0000
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
X-Inumbo-ID: b09be832-530c-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGCz81+CviWBEnWnSiP5b9I9MU0Gtjh1ha8nl83lCGbjoiWUSniMHsk1WE21AkNA/hikhQaS5rx0r+ON30C2c1CEWoOcIpNRGRrSykMp3UNGA81/lwkQ3vwAYIepate60a2FAExssGsFmmSYVp/5t8T5o4fP077T0EYLCGncBOFXpDrYnBNe7enED1mA4lVSC3QTWf968mXnJdsJPKBIY1oWXZf2LahsQr3EzfUJSSXeU6494om1FlWu1ufXwXdF4aXdVE/KZe6PIm2gESqCmLGc28YrmLoRKTlXrHfagkFmEJCX1K6TfvR22+QKHVvSfgn9C6QxpqxD23TgspxIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHv3yHWZZrTBuVfh8r2NRgME6gfRGnDR8FYkJl5K53A=;
 b=XUTZ85T7V65EQDvqUT0PWzg+NLYt2Bsr/U2/GgRzLBsBYxzd0bSAQ/vdBAU5YoNb1gO6E/xbMDCesabnE9obzr3ACNj0aA3ozESzFadAunqTb6rzV0G2l+KQKeYD9FTLXAq2RnpN+b/cKMw06gfoY+Yk1VliwEx4UDR8+hqpgnKXQONzG07b6RC/zLj4LLqvN5HbWPbNuhjrIEdPRXfHoeb9rHkg7e4YTUk3LXwse7Lxh13DlAE5LhKXzTmCmAbL8i4G79D4BCdcdOoiAX+FCG9uC4T6HSIK3whpiH4tiNJvjmck4P1ithspnvHVLqkyxpDWDj80TLupmxL48DhO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHv3yHWZZrTBuVfh8r2NRgME6gfRGnDR8FYkJl5K53A=;
 b=W2ZipKQCYmU7+G6Xr+Dz/3kPSbU31Zi/mKnjCXEP7wsG8ycVWNoGuC/Yq5uppKDggUq9gMHJO6HCGNObnP7glG1fyJ+sQN5f7bQPDLMbyv/FIfKGLQCfm+sQ2cGqw08OPS/3JrK/lPUeNTFoj6VzSky1LbKl6Je0EIZ7gtWzgwCXK30LtZMtQ8VpIgumKyIdxelPtJ4nZJlrbaM/pOhc+SYsyPFdNMhZWAYYpudP1twbP/+SffWt0tHMQT6BlHPkjyZjo+Qj5XQS1+mA39+kxhDn9T/SE9QBlq2sUWrqL9nO28whspXm8htekyLHX2k4VPdXr+ESD/ccp7kd/X2rNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7c3d67d-cd5d-d2c8-34a4-2e0c99ebe92b@suse.com>
Date: Thu, 14 Sep 2023 16:40:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/5] x86/pv: Fix the determiniation of whether to inject
 #DB
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230912232113.402347-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6052ac2f-6f30-48ac-e016-08dbb5309208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iREDf9OIc51EiLO+bZ/b05/fKsW73VXxHppcroQSV/ioGj1+P1hwbpbNXnFT+HWbx3ya1I7PoqKNa5AADXP1pHJvKplGfdH6Hd032zGP4qx2s53mwSJ0vLjBniKJ4PMhbaYwYcRurR9XBSg5KQLXaejPbNxUWST2bXb643Jyw38AwLBhhUuBj2y/yO7kgAIuAaM7Sb40EuStPjUQuKul2J3YCt2hG5BGTbB+8bPDxqus8YfLVnKSb/p1YcRaYuaOtEa/svkI8wmVK/mQSMjRM2tz+gyUt7lN1cmkm1+e9qiiGdm/0QGDoJU2eyQOzq/fnyaEaEyblxLyBmVS55bWJYQ8tUMBYhan6pTx1FfbXgJYpckLic8o+cQMLEeyTLGwcWvGZNgA8n/dpTyEROWLCubCY9eG6ayPDLeY6kWHq7EsHhYQVlTHGbenoJp9Tf4DzLmlDFgbDjByIulR4jZKZTKDxkIGoyhkhXtLkXb3tnbjZEyUXjfqh2yPnPrR0NWVKrOrljtWHWTfXM0x215R7XAv//svKHzm6IwAGVbtbgVq/MVLKm04DYqnFm/id8PCr+qNpwdek5sUHnZSbYceO3w1HXRGMOsDJGh3FiqUiR3ArPOC1PI5/9Z9kgJQ1PToD/THd6RKnn07Bj/ZK4ze+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199024)(186009)(1800799009)(26005)(2616005)(478600001)(6666004)(6512007)(6506007)(53546011)(6486002)(2906002)(4744005)(31696002)(5660300002)(4326008)(36756003)(8936002)(41300700001)(86362001)(66946007)(66556008)(66476007)(31686004)(316002)(8676002)(54906003)(6916009)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djJhWEozSnpnV1djM2gyNzA4YTRKUnBiR2VuRjRuQzRQbXVLQ2pWWHUxbm4w?=
 =?utf-8?B?TG9tZVhhcmt2L0Q5Zy9uaEFOaGhJd1JEQStYclFpSWhiTUNMWWh6TlE1RHdW?=
 =?utf-8?B?Wnp5akVGVUpvYlRZWWM0SGJsRStpV09JQVlyWFo2UFRPeWllZVZ0MHNyL1Q5?=
 =?utf-8?B?eTg3bDdMTUJGZVhvNnJRNkNwYVdDS3BVNU5pMTNnTVl1eEpPYnFHMlFkU0tI?=
 =?utf-8?B?RURYUk0wTkY5ZklQNStqa3ZKNjlCK3E0T3I3bWF4STVUVzQxaWx1UU5Zb3hE?=
 =?utf-8?B?VmdYVjN2NVA3Rjd5V3NIcGZkUUJ2MkpDN1B6eE1ZYzljRSsyYnZmVVArMlJa?=
 =?utf-8?B?Ym9PQmF2MzFnMVdxdE1QNmIzUHZLanpHL0ZqYWlOYkR2d0k5WVRwWThGV1R6?=
 =?utf-8?B?emlWdEJjb1hGRzZhYVB4dGZnZXp3dnhvNEhDLy84U3VuVDFkSkFGdmF4ZW0w?=
 =?utf-8?B?YkdGbXVVRDNQdTc0dEhxQldyTkJRMmY5eER5dytCZDRNWk9yQlBoVHlRd1F1?=
 =?utf-8?B?TGVOMVZ3citadncwajB1bTY2eEdYQ3dZd3ZPR2thYmdyYytQUHM5TUhHaFUy?=
 =?utf-8?B?VGx0UU1aZmhiUnZSVEd5a2lzRzdIN3hvZG9Tak1tYmNLTFo0Qk5VNitBaFln?=
 =?utf-8?B?WGhNNTArT052aE5vb0tYWHBNMEJkN3ZxR05vUlovR01na0E3RGZtWVRNWnBY?=
 =?utf-8?B?Y0ZLT0ljeDZhUThqTzhmZitCNkNtQVRTajlETkhlcGZjaDdDc0dHT0s5SEd4?=
 =?utf-8?B?L0pwMUhZQ2ZpZVpLKzVBRTZtc2dGS0ozTTl0K1Uyb21xTTZPZ0UwLzVpNTFE?=
 =?utf-8?B?d2VnK3N6WExObDE1SHBrUlNIT2ZrMFNlN3M3cFlyTjE1R1U5K2RDZVVzb2E5?=
 =?utf-8?B?Sm5qQVJ5RHA0ODQ0OHRhYmhvYUhUUlNIMXlTZjUyOURZNzJEeW1YUWc0K0Rr?=
 =?utf-8?B?MGg3Vm1TdENoM1Y5UHpMSy9ZVTRyUDhIdGR4ZWFhazArYUc1dDkyRm53UGVC?=
 =?utf-8?B?Zk1WL2lvNnI2VXkveHpFaEd4cUpjWHdEM1kvMEJKRVJUSitFb0c3Y0F5VTRO?=
 =?utf-8?B?TldhRGkxT0xNajRXaktZcFYvRHZkaXY0RDh0MUR1dERJTmRHMyt4cTlUM29R?=
 =?utf-8?B?bGw1U1RaSWcxWHQwQksyemcvclo0eEgyNUNBckFubFAvODAxRTBTSHNGclNK?=
 =?utf-8?B?a05oMVhNaHdGVFJ6R2RlcVBucEFnWUhwZG1qZlNaTCs0MzFwc2VON0k2bTZR?=
 =?utf-8?B?TDFPWGJ2dlVkOU5xQjRXSDhBZFRpd3NpWis4T2RlRHpnamhmMGlOSWNzc2ds?=
 =?utf-8?B?eWt3SzJVYm5WN3NOZER5aytMejNvY1UvZjZ6TldJVlcrSUZLUXZNWk1Vd3F3?=
 =?utf-8?B?WUt6dkE0RGtXVVBvQWNZL2kycnVuRkFmWUlMTy9HQS9TUGtmUHA1QlRqTUFk?=
 =?utf-8?B?WjNEdjI5cHF6dWcyRGpvaUloejVJckM0Vmlpam1QZ2dJQXRDd0t2dU8zRVlB?=
 =?utf-8?B?endRZzhCOUNOZThkZmMvUWM3aVJQSGV4VFVKZFNiNi9GR05FMS8xS0Fubmxi?=
 =?utf-8?B?S3FEZHZlWFZZMndJRmltOGpoeGFHaVVmQlJjcmhzaytldnhXK1FKODA1dnBw?=
 =?utf-8?B?VHhYbk1vUEdZY0VKVFZwaVdWTUpPWTNocHkxNVJXeEhITFFpZnZqQ3NJM3V6?=
 =?utf-8?B?SHBYcWMrT0xTNmVkdFBWcENIazVwNDJqKytoMyt3ZXhMZzVZRzhDNmNNT3I2?=
 =?utf-8?B?cGRqTU92eFlQQmQxMkVQUjJiUlhLK3JzRkY2dkFMeHMwWEJvei9PR2lPU1hJ?=
 =?utf-8?B?eFkwcEUreTBxUWlMYnlxQXgwVkFxMzMxZUJCMDN6bStmR2o3U1pLWUNTSFVS?=
 =?utf-8?B?VE0yS3JjeGhxZWJISnVyenBYelNkRXdSL1dVVXdKS1k1aStTRzNMeWlFekdu?=
 =?utf-8?B?K0JHaG1xeW9CNzhkV2pQTXJHU0RZdlQyVC83amNtak8rTit3c09PN29ZYXBT?=
 =?utf-8?B?RmlkUDRKRkpwRVRKR3ZSTGxCd3F1bUhnZk05bEhUWWtUWVBrSXprNXFZWXZ3?=
 =?utf-8?B?elo2RC9uTytzV2tVbTcrYmFSR0ZxNkJFbzl3WGRxM2tvdFNTWlRBVUJIdTRH?=
 =?utf-8?Q?QWUrJFD7g7/L7c+yp+ExPxfHJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6052ac2f-6f30-48ac-e016-08dbb5309208
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:40:41.7633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb0zTSoDPNifnAko7eLDeht0E1ylxUnXXVQVeaqeGJZPl/c/sKnSIZdFAdmR+58MDgK5bsNzHCe4vCri2OuI6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9925

On 13.09.2023 01:21, Andrew Cooper wrote:
> We long ago fixed the emulator to not inject exceptions behind our back.
> Therefore, assert that that a PV event (including interrupts, because that
> would be buggy too) isn't pending, rather than skipping the #DB injection if
> one is.
> 
> On the other hand, the io_emul() stubs which use X86EMUL_DONE rather than
> X86EMUL_OKAY may have pending breakpoints to inject after the IO access is
> complete, not to mention a pending singlestep.

If you look at the uses of X86EMUL_DONE you'll see that this error code is
not intended to ever come back from the emulator. It's solely used to
communicate between hooks and the core emulator. Therefore I think this
part of the description and the added case label are wrong here. With them
dropped again ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


