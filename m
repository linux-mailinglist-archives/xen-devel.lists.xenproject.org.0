Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4C86715D5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 09:06:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480209.744474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI3Sd-00084q-H3; Wed, 18 Jan 2023 08:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480209.744474; Wed, 18 Jan 2023 08:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI3Sd-00082I-D1; Wed, 18 Jan 2023 08:06:19 +0000
Received: by outflank-mailman (input) for mailman id 480209;
 Wed, 18 Jan 2023 08:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI3Sb-00082A-O7
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 08:06:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fad9fbaf-9706-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 09:06:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9431.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 08:06:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 08:06:13 +0000
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
X-Inumbo-ID: fad9fbaf-9706-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVkZxLwoQX2MKOmJ8MeiY8uWk+VlZFsmzNQjaZHBQ0/84JlIxpRYy8OMBzoXvHU6ah4LXh2x38zUCYpbrg4fKvtcaLVVVy1J1sEI/Ms3535N1SKRiVhIZaPiIr4FgM8rkL5Fgc9L+z15Xk9hBfu792215wuFDZYEFkhqYvSzd4Ls2kPLT0crX2AK2iUfCFIT+wO0pYdJAPZP3Vgubh75ia9ZREW0psySuOSp39CowYRixL8se0F94cnSEqHuJFzTEgwwXrAJsxyqN7xZrv2aDSPYf9qABah6c0+rsRf9GxhTdY5wW1/hvhZJLUPTvoLhC2j/y1NTDdANawxCvmvCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcjF/V17acJHqxI6kFqCw+dxflXgn48UFej3AAMu1Pc=;
 b=HadsNJyOs1zPyiR9qq8OW656uBah1OM3nPkxxcCuB3KnKhHnLhupSh5E1AyFNdrvxUp1eeRQycrhkprLROnoEXoKeO++7kx8xe+G8M6WQRpyUncqHy5DPT0hkqIaM55EDi7+ca7eyPjHvYhBz+kf6qhJ3j0PJgL00npzB32QXvfm1lUeqwUD1O3WpVtflTjvzoFrCEjzXIRd/fvSTMlBziehwwiWPHix2fFGQa55LTILgHTae0Z8OXAxljvRUyiEcqpzWZsYWejL848VsKW63YvRl/w8y/3teTM3NUWD61zFgm+Ee7W8fdPEMB14VjDaqddd9mURcgrFBLamIQMHpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcjF/V17acJHqxI6kFqCw+dxflXgn48UFej3AAMu1Pc=;
 b=or5hab+pBekfJNdk3hFCnpy5Xt031+j+5A5gYvWZS+kj318YBblc4BfdSjIlXMeUuvokGGyVlwRd0ayZzyTFDsaHao0QrICmzL0uOaEXG3IU/7UwWg95wYNB3Fx5svUqzzp1+ozhPU0qXhJhizHzPrEndgnHP1HHO2qwyyeRo3otOLIJJMI186BG8n6FJEW7Ady7D3xzF3U4M+jvJxk5laiN+4f6JFZ6LKaY8ZDDfjTsldm1mtpyVGkoxl3O1Esj8lJttFfzOtp05cNnPQfPo8+SdVdQB2LFlhBk+wQeF0FzePuZPG1qIfcG35sEC+cUgIQOddcNg6ak9DTjEOloBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6d6812a-fa3f-49d1-3e2f-4971f411fb16@suse.com>
Date: Wed, 18 Jan 2023 09:06:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
 <1ab3bc93-326a-172d-4f0f-f6c2ddc84105@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1ab3bc93-326a-172d-4f0f-f6c2ddc84105@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 20341a90-c295-4218-c006-08daf92ade1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mH4ff8qXrRkbT4TrE/I7QIfOVQOYBmm1sKaOle4KEtB6xO7HWKToQisOEI2LcBj77Ot2ZA0ZYNBdtrgU0q5Zzo+yBbFiqRaNdNMJYDTd8XTMC+/mgU2G9JPI2dKlIiXPIY3amSDWIMVib5ojwp/n4me5nrumdQnslRswGFkGKrZSLXdXct+A0/BrV4+VWCqiyMQT7ULKxo5Qcm4ju6vxwzE3ge+iYhZ776vI1hjat3IW3yu1UJopmeH4dy4TiieaBIYGPJ4j5TybiyzvQ4Z4oYpS64jHEtrMUNwmA78kpyFg+26RQox26wfarSQc8C2HqghXZ0nNHLriJBCZF3a5zRVKCys5EY84bOq0MBL2IkQiua11DuJadF3RB1RpSn2GSPaQaXs/0LQ+xS93uMptby9ZePtlaGu25hWT+IxCz1uKh9z1vV9iTcTEJ0mlfqKaWZIfHg3N2GVgBJU9pnvexcFfeGgPJ2/jeZwrrfcJybGKpxQHQj1P13vjd6Ojt0wjWiEtY/WSsYaDdrzp8+1/aix68j6IaUpH4mfj71DL0YVdlPzwTx4Nyh+ATo9XIMpBFaV2Dvv6KxZvAQMympPWq2VHAl1IETZVPnnK9czWWosdteSK4R80tihU/Ekch027fhlMWRhah48VwCfGCcQpDf7j/uqCN8lZy3VhgyMw/FN5MYQz5oe2TUxv3ANd6i6yqWPNf2AUCkrhL6KCjkRPlKR2UMRpwi64+/cRxNINpNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199015)(31686004)(86362001)(66476007)(2906002)(66556008)(66946007)(5660300002)(8936002)(31696002)(38100700002)(316002)(54906003)(110136005)(53546011)(6506007)(6486002)(478600001)(36756003)(8676002)(4326008)(41300700001)(186003)(6512007)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qjh5ZGttWHYvRkQrT1FOdVpsTzNJdzRxdi9SMkkwZDg5YTNKZkx1M3FKRjQw?=
 =?utf-8?B?L1dZQkU4Snh5Si9adVFCQjhSSWxNTXV2czh2Vy9PVVQxd3BGM3RraUM0Vmov?=
 =?utf-8?B?ckVGS29LcVBQZ0JEcDRwL3JUV1ZSY05Mc2Zaa2JWVllybGFhRWQvMzRxd3pU?=
 =?utf-8?B?RUVhbWt3WnN5ZFpPb0VSMjVXMkNCOUliRkJCc24zcTVwZVFSUmRpYVpnSFVL?=
 =?utf-8?B?UXMxaUpyVzlDeWF3dElSZjNwdktIbWQzdnRWdkZMT01KenF6V05wSEhRUTJK?=
 =?utf-8?B?MXF1aEt1R0dLWjFHUUVvYllDSGR5OE1qeUoweC9naXRvaXBjK0x3dW9EQzlr?=
 =?utf-8?B?bFN0WHMvK21rdENrakoyY2piQXptTGhVRWcvaHIzb2RkVEh3Y250dklKam5z?=
 =?utf-8?B?OGZ1bmpyV2RMNmF6b2RrTUlTcG03aGFiekVxb1ZjVWhGL3ZtakNiNFVPTFR0?=
 =?utf-8?B?THowSW5GQ2NQMjRBcHArbTMzYk43ZzFoRytnd0l5ZmNseFlQM3ZDbTNsWjlH?=
 =?utf-8?B?ck9kNzQwZ0cvR3pnbFI0aTNjbE5xNUp5SzJVbTgwNE8yblcvQjk2alpaSXhu?=
 =?utf-8?B?MkY0UHZldEhxUk9iMldxWTNNUzlDaG8xKzV1U3huRWVjRjhLbVpwVnZjQ2pQ?=
 =?utf-8?B?aFhSeUJiNTVkWnNaemhaUjVZYjk4QzUvaHhxV3V4aUZmWjFxdUxtT2RVMUQz?=
 =?utf-8?B?R1hPMFBQbmliTkh0UXphU0tDejVVMDFwc1lRLzM4YjVLQUx1bGgyRk1YK2Fr?=
 =?utf-8?B?NTRCVmRaT2pHRmQ2TU9RVGxRZjhxMkxYNG9BbitpaWlCekVteklhazV2ekMr?=
 =?utf-8?B?UEdKVnVkVzY1OFpnMFhBNzBMVE9mem0vVFFnVkZ5bzA1dG5pZHZuemw0Nzhq?=
 =?utf-8?B?WTRjK1Y5UmtpSzBtMS9HYWdYY2VwK2FJbjd1SDVTU1FJcUI0dFlka3U4QUh1?=
 =?utf-8?B?ZDU2ZFpHWjhYQkdRQSszNkhvYlpPSjJ2UjJnMVhOYmdwcXR3ZnE5dnBtNTNM?=
 =?utf-8?B?d0JtUnE5VnhUa3BoazFuV3VGcUIxbExBcERwWlp2dkVleVVpWUFxMVlUbTk3?=
 =?utf-8?B?VG5aQ05tTEdtM1U4Ym05UjE2eDFkLy9mem9WZHJoaUdRd1o0dFBRTHVEUnQr?=
 =?utf-8?B?dkdiTXZWTHBWcDArb0EvR2h6cHdtL2JSSUJYdjUyV0xnNjh1VTBHai9EZSs2?=
 =?utf-8?B?c1F2bkY4cnBldW9FWUMxNlcwK29zWXY5QmNRelluWXZJTkNFZlYxQ1ZkdjZI?=
 =?utf-8?B?VDhCQk5od2tVQmdiK3hjenhOaXdRbmRtbldIbWZqWXFlV1NOK1VER3hGOTI2?=
 =?utf-8?B?bVNML0xDYnJGelAzOXNBL1NsY0w0cUpKOGd6VCtrMjJLaHBnKzRvWHVENmQw?=
 =?utf-8?B?WUpjUFBhZXQ0bzFqNU14YS9rSTJSSmVCeWRONmpjMXM0SzFlaG0yeTNMMklu?=
 =?utf-8?B?NFA1UHM2WmVOYTJyQkptak1qZTJOblpSSE9GdE4xRTlpL2lWU2ZKemYxOTNV?=
 =?utf-8?B?MlV0QkpYUlR3c242WlNnNjBiM2NMWkxQaHFnN0I2dXA0UFBWZi9QQmdnbTEr?=
 =?utf-8?B?L0NacGlQN3dQaTIrbjJKLzIxTmpFQTRUNGVkZUNTQ2Q3aFdPM2ZyTlRnNEJy?=
 =?utf-8?B?SU1hcnNTVkV1eWZFeW00dmVBUDJyRm0zdFFIWlI2d1loOHF3QzJYVlFEQTlk?=
 =?utf-8?B?TDFnZURVYmdVNGZSUEpva0JzdVZSYmZZazZsTXowb2FPb3BjemdHNUsyU29X?=
 =?utf-8?B?SGFRcDNGZlE4ckxySGlhSVV4V2lxMGJudng2aU5CN3VSS0Q0Y25zU1ViOVpZ?=
 =?utf-8?B?VlZtelRPZGhzZVNiRkxCSmFydFBRek1yMWxpZytaRnA1WVliRldnaVlaamRB?=
 =?utf-8?B?cU9kZU05VEluM2duZmt0bFBhaWE1b3ZsQnoyQkpqREJFTHN1TkNTcVc1WjBN?=
 =?utf-8?B?NlpsRGcvb3ovWGl5Zk1Xc3ZWdFRKaFBvK3p6Q0krYXQvMjFnK3R2b0hTaVQy?=
 =?utf-8?B?c3JqV0ZOazZ6M3lWUUJoaGxNUHFOWnBETnN6N0lBb1NIWVIwc2xnUElVQXBL?=
 =?utf-8?B?b09sdmFicXlMSFgrRkRlelV2U0IzRnErOWhpcjU2NDN6YjBHeUhqdlBnRGlv?=
 =?utf-8?Q?M7uDPHpYR0vqz9faqi0bomKPb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20341a90-c295-4218-c006-08daf92ade1c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 08:06:13.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 571/8cfh2pxZpeMJBTv1AxNpmr44Uxt2oxu5aQoErRpmEiYteVazh5I0wUZmtE9IAXefMo7ELc3/f4ee+eXlnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9431

On 17.01.2023 18:21, Andrew Cooper wrote:
> On 16/01/2023 6:10 pm, Anthony PERARD wrote:
>> +        elif re.match(r'^[a-zA-Z_]', token):
> 
>[...]
> 
> All of this said, where is 0-9 in the token regex?  Have we just got
> extremely lucky with having no embedded digits in identifiers thus far?

That's checking for just the first character, which can't be a digit?

> P.S. I probably don't want to know why we have to special case evtchn
> port, argo port and domain handle.  I think it says more about the this
> bodge of a parser than anything else...

Iirc something broke without it, but it's been too long and spending a
reasonable amount of time trying to re-construct I couldn't come up
with anything. I didn't want to go as far as put time into actually
trying out what (if anything) breaks with those removed. What I'm
puzzled about is that argo and evtchn port types are handled in
different places.

For the domain handle iirc the exception was attributed to it being
the only typedef of an array which is embedded in other structures.

Jan

