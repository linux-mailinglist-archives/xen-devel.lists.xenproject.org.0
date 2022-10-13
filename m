Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302405FD920
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421948.667676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixCK-0000Fw-Rd; Thu, 13 Oct 2022 12:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421948.667676; Thu, 13 Oct 2022 12:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixCK-0000Cb-OE; Thu, 13 Oct 2022 12:20:24 +0000
Received: by outflank-mailman (input) for mailman id 421948;
 Thu, 13 Oct 2022 12:20:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oixCJ-0000CQ-Du
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:20:23 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2050.outbound.protection.outlook.com [40.107.247.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d48f1f8-4af1-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 14:20:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9356.eurprd04.prod.outlook.com (2603:10a6:10:36a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 12:20:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 12:20:20 +0000
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
X-Inumbo-ID: 5d48f1f8-4af1-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K04w2s3lLrr7N7Uxk3TUtbpWrT6od+6WUDes995j17tdVhd+YUr2Q5l36dyp3wTg7iMHKpRcvr16XGEmIMOX3L05oaOfV/ktUxFCW0Ffo4uMondgEP1zABmb2jV3GnifrbI3NIxfNN7TBOcudsUoSPWKpFuHQlJw47IABMx4Y0kxNKePQNBjQe++Y8XtRo1kiGOgf12NMqigm6OAMNLp3KhS85fjFZIIoDwu1232cvV9H6jM28UWBWRnutSvNaF++PVTU4eLPW5xJT6OUEIxeH8a62XqnnaE0p8mJIJ9KbsYB6r8eFb+3it2vmr/qxmIwP28rYe+BicPyD76CjDsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kEJl75AvkSMZCQz7ztX9awwOVBs46NebKrGHcye7XE=;
 b=mg4szHsBMi+6wzRnqoDUEELFRkYPw/oNDhVHMzPWSx6DYrlJ4BzhYYlHXI3270VSmgJBInih9YgOOy293nuKza/S2AKLDB52AjRc0T0RbBnlYSWmoxt7cu7c2qZvVejFDP+ocdf4lPoEf+ObbOkVUeOn4Xs2J/TAGdHwA5Zvd5ZAgk3CkDam4l/RV4+ni0dgWCyZWfovR8AZDJbXtsqqvPhJTLYuLov7EIISD0NOknFJTKEitZ57/xZLMb6wq2ZcXx34Cjy7wRdkQJQNTwnmXsqjmmrfnO9yY/4c/qYb7wiyaXYTW20+neaZcVsgT/w968AdHrvxHizx3w0gUX2fAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kEJl75AvkSMZCQz7ztX9awwOVBs46NebKrGHcye7XE=;
 b=j0LbnMO0h8HKqByRtOBE22G50nT1NEv9csKDh7+VUQNBM7FS5cVEXhTKCqCHb2ToK3R8hwFkd5ujEJyxhu44g0f7sD4GNfHau2YKV6bC5lXUdIRIEd3HQ7qloA1dj6AqiHcoHgs+PBwWd6xNogHi/L3+A+ljqmN0M3paXiWIFwulgnhWsrrHeHzkQkaH6dD0+PPtzWrqCOlIDVci+jEoPItoGx2JVtOeT0tvV5fZk9QnkmfgQaB8Z60e7JvVJON7Ot9h3HjXM8VYex31cbicL5AGGLwah3ZAoatnNy49vKl3HpOoIhTJxoOgvcf1xmzSoMjhfKYE6g2ZhMY6JdSyMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd359087-05cb-a50a-8d15-501a096d30d0@suse.com>
Date: Thu, 13 Oct 2022 14:20:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 5/5] x86/mwait-idle: make SPR C1 and C1E be independent
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <3bdae38c-1dd4-558e-64a7-886b9bcf771f@suse.com>
 <Y0f+7pZWOzGD70Gl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0f+7pZWOzGD70Gl@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ab9bf1-4a9c-46a0-8747-08daad154bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	le2m+ixbTSgSarNmjEiTfgRkn53Yeyh6RPEcXAxyL8UvQh7+Y6+SBc/yUiYJvaVxG0U5q+VmaNV7dflfZrk0OekRzV5gwAavmg1dqmJiuYFtmWblftqjoLS3j5S3FVIuBESj9JWY452RldULrpBPwiy+TmGf7Edt504B38xAdgnb7uBYMk2r6dHcqq2ayjZO5Sj0RC1D90pJnS74Kl6mIKzrOBr/RBBR2fY4yNxyesdQDw0c/ZtERLN2PU6Af1xwiq2Y6QJRoyjM6p/TmlJZ53TXt49Qcpljopoa8/OxfzSteknQkP6r+v3Z5lckiLXEcGZpuQ2RI9g7trjgkUc/SMl4YyaltnINu2LWXZ5FO6ev+0IShjV7a8817KDucnG9+bGX3UKdCgYpceilqlYYeF0VOBjDQLFQ4/eV6LeL72DaNo28WIqQDbQOFgq85I501NQUJpBx3/ORry9ilGSB/pJSkIce8F6y4rz51vBMx75i7z7S52NzbdUVEj8e6/rSsdsDChuewGu9GvRhsBPPsMu6cE/C3TkT5MFBGVflt/FVfICWo9RPX/Ls7TeIDPyEeOaOgQnffeCIUig0ik0E1QFgTWizACIkvbthWjQafs0CNYoUGm9wlXeXNsCjpT5jpPRve7CGEvKBRZNcOcZ2xM9gsq/CTAQ4ZucXogDGkvF6PfBrX0IHl6IcvTR9yAAsPRqwykQefTXiuT/8RxbjwtZNcRf+VCHvmpueH4tjgUZlAdjS98lxebUuTQvBNEYJsvEDZIVhQB6Y5zArPB6VKSHa5Oz5WKvg64Dh/0N2Cu8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199015)(31686004)(8676002)(41300700001)(4326008)(66476007)(66556008)(66946007)(38100700002)(83380400001)(86362001)(316002)(6916009)(36756003)(31696002)(5660300002)(8936002)(54906003)(2906002)(186003)(6486002)(2616005)(53546011)(6506007)(6512007)(478600001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0h2UjZPSElQbDhaK2RBK1RJR3Fqa0VYNUFCVGVZRExWWkM4WnlQRGNzUmYx?=
 =?utf-8?B?cTI1L3E0VWNJa2xkc2FiU2lvWnpPYVlLUW94T1pZalNWWkdUZlY5NitheVlT?=
 =?utf-8?B?UEtDanNsQnhrS1RoMlBLLytiM2o0SEVaSmV1RlNRNEtTcmNpQXV2aG8wMGVa?=
 =?utf-8?B?dS8yQ3RieEY5MXlFdzhzdXR4U3VpbHc1MU0xdFVVL3lYVStoL0prQ20zMHNE?=
 =?utf-8?B?S3hyOE1TQkdTazZxUzkrMFdaZmpKN2lFRFZjNXAxdlZnaEVKL0FHak0zOU82?=
 =?utf-8?B?S0RUT3hZRnMzV0V2QmJjZTlMaE0zczBNZUtmMGpqMDczOGwzNkFxUEdSZ3M2?=
 =?utf-8?B?MStFaGdYSXJiRmdTUS9ZV1NLbGpoV2pVdW9URTlsUVdZc3luNFJvL3ZIcm1p?=
 =?utf-8?B?c2VXSWJ5Y3dXQ3hrbTNqUVVnYWJjR2g5U0RPSXd3N3NacXM5Sm8vMTdrd09v?=
 =?utf-8?B?UmUyRllVdnVnWVM4eFBKQi9DWWxCS2dIQnkyb29oQjZLQjVQVVN2TTZ3R2xw?=
 =?utf-8?B?UlpPb3pId2s5bUVOYXdUMS9HanpJdHFTaS9PNnExKzhEQTMrTUVUK0lCQTNK?=
 =?utf-8?B?eUJKb29PS3pmclJuK2gxMmtwdHNyWU41Q2ZnRzVjZ0pLUlRsOGFQTUhWdnZX?=
 =?utf-8?B?dGxmRWlUaFNnRElyVTh2T3Nqa255RlQrd0VpQUwzSmNUQTBtMWM0VFlob0hO?=
 =?utf-8?B?YTNjSldGTUdLZ3BTRVowS05nSCtKWXl3c1dTQlcycnRmci9RWWdpc2g1MW40?=
 =?utf-8?B?blVqMWlFdllWUGhVd2ZxZzVjOUpTN3ZlM1EvdktZVGt2bitqL2pTbVpVdzVU?=
 =?utf-8?B?amU0QVVSWUlWeGdNR2xCSS96NDF1dHVWbVFpcW9mTG9GQzBpR215QS83OUgz?=
 =?utf-8?B?VzVDZjRRY054RXVjd3lEd1lkcTliRy82NVE5dFhTNUxNbGRQR0l3ajRueDZ3?=
 =?utf-8?B?VWVNUGVIUVJ2S1Z5YXlnM2U4NUp2c1dQMmk5bzZKNTBBdFlSR0lsd1NsT1A3?=
 =?utf-8?B?SVF4cEdtaWhoNEtPM1RKc1lNenNnOTZlYmJVK0V6YmFsbyt0UElBZTlxbk12?=
 =?utf-8?B?U2xXYXVQNEk5bmpKN0RQZFhhUXNmcUNiQWt2V3BheVlwdHJrci8yaUxYeFR1?=
 =?utf-8?B?ajFpSFlMdjVvQ3p5N3ZxdGx6WUVDbXdwZEorc3RDOU41SUtDVDBHNW4zbjcr?=
 =?utf-8?B?cUtOV3Z1WTJGSWViMEFxY3RxME01cUJHUm5SbnFMQmxLWmhOdWhEVHpxRmJz?=
 =?utf-8?B?dWc3NkNDSEorai95cWRXK2NSNTRhaDVvTEdmUkdFS1pFVkJzWDNMblFnVG1r?=
 =?utf-8?B?Y2JrSnRoVzE5Zm1YUDZxK3o0U1R4VFZ2TXB5MnEzVTlsMEpBMVM5Y2xwbGcr?=
 =?utf-8?B?MTFxRCtJSnJHWGZ0TElsRzNyVGFWcmJUeDJVVkFaV0hJcWdrWnF1dGZuV1Jo?=
 =?utf-8?B?SWlEUmlNUlBwR1VrNUhWV1BKa01RejBQL1BIeENoQTVNYndYMUlsckxTZ0Iy?=
 =?utf-8?B?YlI1L0FUTk5nTHo2M0ppOGs1SGJrR3hDL0tjQ2ZaZUhwNVhtWko1U3c0N0lX?=
 =?utf-8?B?MER6UEZnK2lJamc5RVMwQUc4MSs4ejAzeFcrRlBZbHpIS05HVVUvNlREeVVD?=
 =?utf-8?B?QjI3T1FrRWIvemx5OGhMS0ZIajJCWWJTOXpRZm1YZjk5bVRYUXl5Mml4VVow?=
 =?utf-8?B?SlloTW96czcvcEZmVEY3NFR1L1JNSXB0ZFNTREpCYnVaK3ArTE00cFJpMldk?=
 =?utf-8?B?eERYSWNOQU5xaEQ4NWQ2V1dHdUFzeld2UnlmU0Y1U1ZkUy9RclhMczVnVEtC?=
 =?utf-8?B?U0YzVXAwUXFCZDV1L1BWbVd0bVAzOEdrSDFCRWJzTEJwY0hra2lDd3NneDBl?=
 =?utf-8?B?RWp3MUpiR0NTVWFvQjVEM2JJaWNONlZNZ1hEQXJmd3YxcFhNekpKeUFCeVVp?=
 =?utf-8?B?VXcranlPQ2cxSGFFRVgvMElpSTFHUCtQWEo0ckRQL0lGdlJaNGw3MVFDelpL?=
 =?utf-8?B?UDgrQkVuT2FhNEFsUFVLQTJZcFg3Wjh5RDF4SVJhajM5eTRwQlAyTmgxTGgw?=
 =?utf-8?B?UFhNNVhNdjl1aWRWa0MyTTNjZDZNYnBHdzFsSkZYS1JMMXBXOE96SkU1Tlg4?=
 =?utf-8?Q?zQvOIhti5r4VpM89kQ/ebwuIp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ab9bf1-4a9c-46a0-8747-08daad154bcf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:20:20.5406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RT3eKqNV1Bm85ntlgsz6ePIrAMcMWzA4lNaQ6N0/lzyf913T6p3Ih9H9F4mXftC2hIY7PKeLSFGY6BgvwQSE+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9356

On 13.10.2022 14:05, Roger Pau Monné wrote:
> On Thu, Aug 18, 2022 at 03:05:19PM +0200, Jan Beulich wrote:
>> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>
>> This patch partially reverts the changes made by the following commit:
>>
>> da0e58c038e6 intel_idle: add 'preferred_cstates' module argument
>>
>> As that commit describes, on early Sapphire Rapids Xeon platforms the C1 and
>> C1E states were mutually exclusive, so that users could only have either C1 and
>> C6, or C1E and C6.
>>
>> However, Intel firmware engineers managed to remove this limitation and make C1
>> and C1E to be completely independent, just like on previous Xeon platforms.
>>
>> Therefore, this patch:
>>  * Removes commentary describing the old, and now non-existing SPR C1E
>>    limitation.
>>  * Marks SPR C1E as available by default.
>>  * Removes the 'preferred_cstates' parameter handling for SPR. Both C1 and
>>    C1E will be available regardless of 'preferred_cstates' value.
>>
>> We expect that all SPR systems are shipping with new firmware, which includes
>> the C1/C1E improvement.
>>
>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1548fac47a11
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I guess we need to be careful of running this on pre-production
> hardware then?

Well, power savings may not be as expected there, but beyond that I don't
think there would be much of an observable effect.

Jan

