Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568396ED157
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525507.816761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqy9E-0007Xe-RJ; Mon, 24 Apr 2023 15:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525507.816761; Mon, 24 Apr 2023 15:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqy9E-0007Um-ON; Mon, 24 Apr 2023 15:30:36 +0000
Received: by outflank-mailman (input) for mailman id 525507;
 Mon, 24 Apr 2023 15:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqy9C-0007Ug-KV
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:30:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2089.outbound.protection.outlook.com [40.107.13.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3ec5532-e2b4-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:30:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:30:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:30:04 +0000
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
X-Inumbo-ID: f3ec5532-e2b4-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUJB5Fiu/zXMXo5b2KK0IOUNYr9dpyniYy/necX4UdQjJLTT8OAwdAB9G9pxxUv3I9YgJXE2ytLtRuSv5wQg7ELUN8yNzq+J4ZOHAbqINI3VmpGPv35jSxBb+NBQmoAAv1Gk1q3TC3l6T5fukFggQ5NDSKbu+vF5TP6S5s2tc97N6xUm5vRvnEejyCe6EHJwWumkmaWBQmqpQ6pHr/XZSVrsqvo8DXsAPN4ncpqDazvt8DHsVg2Hjg1LktYizzeMizire2fiZFRQADmTz4iOWtkRtLVqiFv/aVhtg+N65dZh4hdK9GMCpuDP4jFDKZzzdpZnpDR2fKsrmmrWVmyC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDeIOqfcbR2UUhbgoEWDvtWfNlE2iU/FWi3AzS6QAiA=;
 b=CIvbBDN3OHMJiaGbQ3dwDOjywJFCRdPbH9P8mXrdPc7dWQc/rgMMGAaZC+ml0x67fyP4QH/kCkgWXDBMM40H8LlNbgyW6+EMbtEz2jSvdiwQi1kc4k8KgucL+knTp7k9dJGjVSj78CcdjZTQ0VVddNHtyBXRR66BU5KDiHVB1DmAJpZXiaMjwA6bzFCB9Vr03KOhZcl3zcn0JLfc+e/P8yFIKt0hPlHfR9btYGlmQEVeoDXUshpKpzLds/6sjxv1HKLX+oJPoheUEPo+HPsSr1Eod7yf8U3vO0HVJdKhuhbn/as2lDVzW8je78NnMhlPquzQLc1eZqkEmJgZjaut0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDeIOqfcbR2UUhbgoEWDvtWfNlE2iU/FWi3AzS6QAiA=;
 b=2PSbO5G6rMva0e9bgxMGa11Mhd5ggAWu6+ElAz6Mc8K8x40OvKLieDxkCqo0S6Llenom6vQuDtX8p6xEBFgFm222j13GpbvuocRa8N8pIpsNfSkVCyFFw7ISmzN7WcW0WJWHTO02MWBdWer5xwhSOKF/Eej0u30/AbVsIdRcMZvnUil/Yn4QzHnjCLghSAbAQN+7W6s0ioeA4+2MvA1iXvRzOePDbRL2SzxNFts3L3y6eIePcvjP8u4YhmKVOgZe3rH6zmjnQS/3mMZYHAEQwIIpB6FB8ZdMMnBrZWU5flBhiqzR3EaHPXMqYvUk499+pNyKViBsJSH9Tn21ICnUmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50a0883c-efb8-9456-7dac-a01cca3a17cf@suse.com>
Date: Mon, 24 Apr 2023 17:30:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 4/4] x86/msi: clear initial MSI-X state on boot
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <6984a8571dac35d04c85117834d99b00fe1c4184.1680752649.git-series.marmarek@invisiblethingslab.com>
 <4eb45940-5615-2398-633d-e5f59dc6987d@suse.com>
 <CAKf6xps2nVoYL6LtOqW2UBHadNSQzkb1XAe7WRxXmLzyN3kAGQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xps2nVoYL6LtOqW2UBHadNSQzkb1XAe7WRxXmLzyN3kAGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3d7d43-ecd0-4beb-d705-08db44d8c70e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZEdXHwuzdtPe94zHSXAIAcZEImVDbMSvpQiT08PfvNqgNUjB8FCFdsGorM0vlM/rX3L2EpClh1n1F/CZAbqr1myi3XOvO8SUhgc56HUd5ZwhDIHmMommijVjYhGC3fWUskvu4UUtBrChCa3bwWWLcHc+w3+vbjorAk72ABHar2WUXbnnMBi0VkBmDmY3Fr3xntJ8wAlllPxyr/BFlFuomZIMcG/u3oxtM1OO6yQF9dl0OxPddcjjKyHEIFX5qKpxyap3ARd4JxtcR3NpRBFBhnrKgQuCMHvBA8VRG5dAMrE7HPQJ7P7VFUg9z9oCkQ0RzpV1be52QXr9TBGD487p49SkQ3GIBp8alFSdanKi2MoZHptaUT62sPIyKW5GLbWDrN98oV7ZgJnAjWK9TlnlTiyLPvRil8ttTOb/FB/OKchmOnBH3vcXGUEfVmOvA1FadnAi5czfeymoIXtbZFAU5VGCJtxpCyqMh1+RhR3l2Ex9cc7UYiSmdPJ3UjbJjZ4Jj3TQPxke83jjjTb0pjzvPg+VnvhOnlxC+W/EM8BT8Bs/sZ33rO0w1h57Fv9KYbe/qohvUvuhqdKvGR1hVOIeO1M5YQVAOzgc8MnIDXmzmNewhlipjBNBrT7HnYPGljIOjMVNTlbj4hwkhR/MS7maa6NTNwec3pExEZKaotZkxVSSF1VwGzza1mA9bGx6YKvw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(54906003)(36756003)(478600001)(316002)(4326008)(6916009)(66476007)(66556008)(66946007)(41300700001)(2906002)(8936002)(8676002)(5660300002)(38100700002)(2616005)(31686004)(966005)(6512007)(6506007)(26005)(53546011)(86362001)(186003)(31696002)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkxaaURqQmg4eFNCdlF4bmErbkZ6RlZ2ZkZqSm9DT2dybmpUUlJSUFN2VWFP?=
 =?utf-8?B?dFhZUDh6djQvUFJqUk01UnovVjVmMVkzOEJ5OUFTNGZacHpycXdBZVREa3pq?=
 =?utf-8?B?Y0xvc3Q2ZzVJakRhYXFRSTNvYjVGRW5JWDduNmFxbHBwSFhIZm9KUm83MUxM?=
 =?utf-8?B?cW9XZzU4Y0FPNE9wb01IN0JDSDA4Q0F6ZGh4alJXRVFDSTZLL2sxbXlNclFD?=
 =?utf-8?B?RnYyUHdQeldWWGZEUGpnVnRoYTIxZmM5ZWI5S1BIWTVRSEtJRHUrS2JHaCtK?=
 =?utf-8?B?b1VQQk56WHk2anFpUW1Jei9mOVFIVjZ0ajg0SWZEUUt0ejBNSDlBTE5ONllH?=
 =?utf-8?B?NEh0S05YRUsvWm4vaGxIdVJlOTgyS3IxOWx4NmdvdjZJYmYxQ2ZBemVkb0Q3?=
 =?utf-8?B?bFVMVnpvYnl1K09XR1VrTk5nc0hwYlBEWlNQTmV5SXJ4SlV5aGh4NFJ4RW5z?=
 =?utf-8?B?WERuRitaaERTaG54eFMwUlpGd0gzTW5ZNVUxUmppS3JrUjZXK0dERlJUbDNr?=
 =?utf-8?B?K0djS0ZJTlpnQXNRT01rN1NOeU5FV0tIaVhmVXNJVm1uaEcwRktVNy9HYVEr?=
 =?utf-8?B?eFVaM3hvUFpHRHhGS0hPckU5VDlZUkMxcTlELzlDbUdOSHZJb2JCUmlaUjBD?=
 =?utf-8?B?dFVUMUJ2VlZaTmRNWitjTmM0QWlIRENEUmU0WnhVS0Uvd1cyT2FDa05TT2xO?=
 =?utf-8?B?TUtyTjE5cGVuZ2xka1FCZk0vK3dnWXNmdlNOK3J1Qmc4LytVSVU2V09QZmVz?=
 =?utf-8?B?WHhUcjVHbnA5ajVTUFJaZW5pUU1ndjMyUTZ6bGg3RDU4Z2Y3eVNHWGVDT1Rx?=
 =?utf-8?B?c05GTkl4Q0hZTUpQeTVBV205eE5vQzJsaCtWS3J5bHJoYys4TGRZRXBCdWVL?=
 =?utf-8?B?TXhXK29helJNNXVDRTNLbXlnbXp6clNBQit2YWVaQndqeDlOYnlYWGI4WFNt?=
 =?utf-8?B?ZXY2ckxoZGtGd1V5MFVaZFNnTVcvQjVCMVN6UWxJeFYrK21VQ3QycmlxdEwz?=
 =?utf-8?B?cVk4UExnRnc4dDBEQmpCVmhYUU1teGk2ckdqTVV0N1Q5SUVBeVFOMW1QOVJj?=
 =?utf-8?B?RnAvTkNzUlhmSjB5OS9RUk4wNVNTU2Qvb0tpaEdFRXNRblpJaFdOMWhybUtU?=
 =?utf-8?B?L1gxaHFyeDI1SGVsVk9ZWXptWFBSc20wMFdXN1Q0VUNsNHdNS210aC9wb0Fy?=
 =?utf-8?B?L0taT0J3cWFRMnVmT28xWGdiaEpMaHBaSVlKR29mdjFuSE8yU0FJRldkZktX?=
 =?utf-8?B?cGlUMldIUkJoalZiYXdWUkI3TFFmU3hJWDFSTE04aGRiYjJmUEtrZHNBOEJX?=
 =?utf-8?B?M2t1UnV5NmRIQjYwcUlRenhnTXZpZkN6VmdWY0x2dE9rWTh5NkwrTEtHTi9E?=
 =?utf-8?B?UHFDM213YkZvb3lqNVI3dHhaTmUySUhIUnN3NGM5cFBZR3ZMc1QzUkFYSllU?=
 =?utf-8?B?VFk2YnpmMCs3YlRndC9tV1AwTG1IWm12TFFrRmxqZk5IU2YwMHRzQTRJZk13?=
 =?utf-8?B?RWFQK3RLS25ucnBkbjBpc2NxRTR3M1RPci8xU0xYTUhaL2Q0MUJuUmpCd2sx?=
 =?utf-8?B?a2JUZ0kvUWpYZUVXQU15ZmFJaTRPZFFtdmcvZ2p5QXQ0RkIxVVhXcFpsUkV3?=
 =?utf-8?B?OTQ5WXliMU5pdmRiN2FNbm9aR05XR3luL1QvZG1uejEyUERPdmp6Mmtld0hy?=
 =?utf-8?B?WnpGS0dib3ZGL3Z0dWd5L2g2YUtsbmc2ZkJOVS9iYzFtcGdjVENCc2V3Y2lW?=
 =?utf-8?B?MnRPUDJhbHkrelhIYysrT1piU24wUk1HUis0cWU3SDBJbkpoSWxLQXVuTEZR?=
 =?utf-8?B?MUlhaC9sMldUNWRTVkl2ZkxsOWYrWXNCcytNcG5KY3pHSFBFMUlKMWpkcFhr?=
 =?utf-8?B?SWhDOVNsczJHaGxnSlZ2emxra2dUb1BkUVVxSEtZZllkcVo0eFBkUXpMSVlq?=
 =?utf-8?B?OTJoU0czR2tGU09NNEl6UCtmNjhQWk5hZ0Y4bXFqSGk3NThIc0ViNURxUTZH?=
 =?utf-8?B?L3I0cDBEQ3ZMTmdUTklZTFhtL1FxQUlqZXZnWjlQendmUW1Yb21mVC9WVG9C?=
 =?utf-8?B?U0pVZlpaR0l4YzVySG91RUNXYTZIRmlKMVBIQm0yUHBBVDFYVHl2aHNCTGpn?=
 =?utf-8?Q?dP9rzT3jwQExzyXEIl1EhcqzX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3d7d43-ecd0-4beb-d705-08db44d8c70e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:30:04.7539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yazo46s8kccwGR2YE6SeFD5NHXCVCmXMiLhLSzBWtClGVqgHjUoBQ0/JTuF6bsqPMpVphIm+IPiuqQ5NDXs1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805

On 24.04.2023 17:25, Jason Andryuk wrote:
> On Mon, Apr 24, 2023 at 10:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>> Jason - any chance of getting a Tested-by: from you?
> 
> I'm building v3 now.  v2  worked for clearing MASKALL on initial boot.
> 
> I posted in these two messages - a summary is below.
> https://lore.kernel.org/xen-devel/CAKf6xpto87QRSKT2qc1yApNfaw2SrLLxPoytYJv_jEbYTAbjCg@mail.gmail.com/
> https://lore.kernel.org/xen-devel/CAKf6xptHALLR-Qjf=p5y0o9Ud2V7eFMJuB8Ap-PLjv-N7PAJVQ@mail.gmail.com/
> 
> OpenXT has a patch that performs an extra reset after domain shutdown,
> and that causes Xen to set MASKALL.  I confirmed by removing it.  So
> this patch helps with clearing MASKALL on host boot, but with the
> OpenXT patch, rebooting a domain fails.  MASKALL gets set on VM
> shutdown and then the subsequent boot can't assign the device.
> 
> So this patch is helpful in some scenarios, but it was also an issue
> caused by the OpenXT patch.  Does that make it unsuitable for
> inclusion?

What is "it" here? If I get your reply right, there is a similar issue
left unaddressed by this version of the change (and as was said before,
a device reset changing state that Xen tracks or otherwise cares about
needs to be reported to Xen). Yet that doesn't really fit with the
question, at least the way I read it ...

Jan

>  I assume the OpenXT patch wasn't an issue previously since
> MSI-X was never enabled.
> 
> Regards,
> Jason


