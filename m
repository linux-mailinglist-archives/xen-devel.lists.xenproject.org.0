Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFD5F4034
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 11:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415336.659885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeVb-0005uH-Pb; Tue, 04 Oct 2022 09:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415336.659885; Tue, 04 Oct 2022 09:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeVb-0005rM-Ma; Tue, 04 Oct 2022 09:46:39 +0000
Received: by outflank-mailman (input) for mailman id 415336;
 Tue, 04 Oct 2022 09:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofeVa-0005rG-Ld
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 09:46:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70613eea-43c9-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 11:46:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7011.eurprd04.prod.outlook.com (2603:10a6:208:193::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 09:46:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 09:46:35 +0000
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
X-Inumbo-ID: 70613eea-43c9-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/1Suy7jHtSk8ZYRGs/FnLEvjF9fujxoXg6g+wFLxa/WAfue+uTFmS6cxZejslLv1WH6E0zzd6o5FMJedn19KRVgVD8m4NDmQBbCWay0cbkhQ7sfKvOOUAKnPpAwSYASKcmMHqaErRnCBLe/bhDAWWbv08uzmyprRZlsS1HGxCBOBb+L9EzqJGF9qjjIR4h5qcU1isQeLcmW8P5lPK8CCrVmCjiQiH9nu8DLVQW9AFIH3Alk+sOYElPu1CfGIMKvjU9JXa69cmgCs12OP1o8z/nRNHvY8Z4z+DNv5gW7t+NY5wd3ffIAYPGFu4NFHZZbLsz87zO21lOt32AST8WnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hu+XXVnldcVSYE/oko+f0oYUaDiRWGRWLd3oirZvlg4=;
 b=TwGdFArBW+U6oxTllNLPU6tteNGVH7UsLfr6pjIrLz7dtppd1b43AQ4cGA+Eljm7c1FpiVkNbg7w3l76GtyYLCd2ooIRmUNR7wZ8zzjuVrx4DDjyU9nlQ/yZ+GPh0EcSGD7pcG26y1OVADHwr4DxKG3mcwCzcZoEYq/o54iHHfyGRxCZYDqucO8G7e3VEURjtn8Wkmh/ACXEom3Ghnjn195zkP4FA6/AeCpPDz1FkMnfcK+6BoZcnthhIkfmi4aTqSjRTKXqK/49vZLcfYnZpKOf1rXQwVD0zJBeSIsZ9esw34EVnBPSn45t9IZDwywd+/1tal0/X/RYU0hs5eS4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hu+XXVnldcVSYE/oko+f0oYUaDiRWGRWLd3oirZvlg4=;
 b=bmlWy9YqxTo/gAhpqmfqbEMAsxZluTgrz7M9YPh1CERS8UhzZJ9/cTPxCx8sqH5S9/Yzq89nfyy6txEjvemd/hqtzr/ssp8eDZuenEGfYYv/EaMynkVS16sVwma7RvL3JPTWxPCeR02jseDCyDKdF9FCxIgujADNkYB44wsN5oHIHj90yhF0+77jdb6H+q/5oCFEGv68EIkDVODYMs7sLnakGG5JN02Oz3OGHbzuDLGAwPvt/c9c9TFrSOxeRgAyn6KRc2JRCCUb33r7uNXgiQoLF7clTXGYTP9HJQd2T5HfEU4MfTH1dJYkrgFzaTxTwHRdh3DfRTuVvN6xzZCD3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cf15704-12df-c43e-c683-15e9a8ab1d05@suse.com>
Date: Tue, 4 Oct 2022 11:46:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: Julien Grall <julien@xen.org>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <639ca2ef-5529-a9cb-df31-7968d7f23a2d@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <639ca2ef-5529-a9cb-df31-7968d7f23a2d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: b650342c-d820-47cf-adbf-08daa5ed5370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jSpgKHpSJ8B8kKAb+8TOJBCIHePsf2nxLTEVW/N3+mz1Tur8F6tX5SDQ7o29G6uFrC/KXOkgr9zZu1YY+ZDC1xKJnmnzhVI0BesSVqc0hzg4FdygxCB0HD9Slk2hmLxsADSy0vWyejwMB0KtCuva9UIy/GHeE6KEHiepNuHONmBI4P75ol3ZLaTMYfwDGpt88aBBJkTV5N+cXkFH7hBqAuJ3M49VG3sQsXv3LtrOQPlKpIMdTdMrbPNUdr6Cn79XitJ45X67Xv0DfmUBNrHYtG6IQGJGOhAbO+1BcKCgTC6oqNSUYMWfZWU2/LQ1OsNphbMTI1zlEArnSPMM7Xin7FdS6CtjVefUkElqX85gc5XQORpRZ0XQWaBkQ9rfZDnVMCl945RaFVuyrUILH/IC4VSvurAGNjoz47Xs69C3qnWMaYxzu3QBZoRGetIdYU142FALDO1dW3lEdW1AxbuM4FEanaQ3TKfgObhnmvpT6BA0Lp3zZ7hz4h3//98tZIVOnlYyAtqjyI4Agjxk2OIYLsGkmW6xxwDlHwrDD6MbGi1+Fg9xYonB22kHolrXb78ypDaJcd8fjY9ImcurX8PMMskcGuBGhwsLEAlLr7AW/LzNyilgAxBOVQbWBKIYhgNCQX8Ch0DRUrHyS7M70BV13yfDYUSna8hITxMMxwvBbO8Ds3nRW6dzoPuIEb68t/DBbgvuvpZyBmZKU14ecFpcmDGIFkq7zu5s+ZAm+I4A4u66ipWkNX0WOCZteXhfz6VPuXSNLcHEcuyxNgjk7zfyBAp/9P3etawZsDemI/IVD2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199015)(4744005)(8936002)(41300700001)(5660300002)(86362001)(31696002)(26005)(36756003)(6486002)(6512007)(6506007)(2616005)(66574015)(186003)(2906002)(478600001)(53546011)(8676002)(66556008)(66476007)(66946007)(4326008)(316002)(38100700002)(6916009)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0NJa0UvLzh1dnByR1Boc2tZU3RHVkp2RzhNcjFYWDdDMUVSajJJYlJLT0hz?=
 =?utf-8?B?T1VzZlhmdkxZVnlPZ1QyV0thN1gwZlphTWg4S2k4cTR0YUl5c05kekhtYkVl?=
 =?utf-8?B?ODZ4Z01RN0tYVHh1RGFMMWxselFHRTBNK3FpelNIUWh6YnYrNjlBYzJMc2Fh?=
 =?utf-8?B?cWRKeXVLdkRZMWZZcWsvU3dSclk1S2l3RUp1SDlxelg1NFlwTnJnZnVMQjZG?=
 =?utf-8?B?UWpzVjdSaSswMVJxeUh2RG9wdnhlT2RmYytSbFVCaDZxd3BibEplSGtWS0NE?=
 =?utf-8?B?NlZSQnhoTDFuVUFVVnZSRkx3TXMrVnhrRlR4dnU3d05KcDJhaXF6Ry9zZndE?=
 =?utf-8?B?WEhYVnplN0FuQVEvcWRNbktpaHN3bTAwaEdJT1JGL0xTSThtVkJpN1QyeDNO?=
 =?utf-8?B?N3lpUXRsRElKdkRhaUJoVDFIVHIzTWlDYnRsTmRQeDRuTlgxUHFINjJPc3oz?=
 =?utf-8?B?WTI4eWtHVFRDKzYzVVRiaFczU0JBYzBZNGpRUG9EVGZaWTlXdkp3RVhoQ1Zx?=
 =?utf-8?B?N3ZtNEFuUWZzZUFGQWZHbFd3cmIwaGtuaG1mVUpodk5laTJ2UkhKVTduOTU0?=
 =?utf-8?B?M01LaFVtdnN5UlhqaWpmdkF5NDZLTVNUWTR3QUVtcDdLMmdFUGFORTNwT1p4?=
 =?utf-8?B?c25hNjdhM1JCeUNTdjlaczlJL0RacmtwanUxTlVMNnNrckhjTkFubjhxU1dl?=
 =?utf-8?B?b3lGZ01oVG5ZQTBRSjFOLzNHak0zTUZVdkFrclM5WE5XZVR3SWxWZlc4QkxW?=
 =?utf-8?B?UjQ3dlMxanFHMmo1Q0h0UzJxYnZaYnRZR3FKZ3F4QnZWVUorKzJjUkpqekRM?=
 =?utf-8?B?WVZrbEpjbXd4T2U0MnNvbkUzUTFWZ1hNak9ZK3A5QUxERGlCWFNSak5IcU5Q?=
 =?utf-8?B?cEJkWitEbnlLSGgxeGJ0aWdpUFd2bXhYTlc0bVUxWTNWU3d5NldSTXRTeGo4?=
 =?utf-8?B?UjIwdytsV3hXam9LdHFJNUR3ejErSFA3Qkx6VVgrTzh1Zjg1YmY4bVNiTjVh?=
 =?utf-8?B?N1c1MGpJUURvV3JlUzlYT1c1Y0p5d0NselQ0aGxQUmNQQkcwYUo2K3JzcnMr?=
 =?utf-8?B?U0tPYTBHZlBnSGMvUm05RHNLM1ZLNndDdTJEamRuNEw2dFlWRDk2VGdmZGdE?=
 =?utf-8?B?cmlBZXdFREU5TUE0bURwZUF3M1JlWFUraTRiQ0x1TlpNNnZEeEdhRERLY1Ft?=
 =?utf-8?B?blRqZWo5bjlsTklQNXRKWm9SK2w1R21QRXF1T3BEV3k5elRQS0ZIVGFrOFRr?=
 =?utf-8?B?dmdaaURlL1RDVUhXRXFrM2dzQXJQTUpuMSs3dVVaMnRQdFRTQWhrYVRTZFJO?=
 =?utf-8?B?RHBJbzBpazk2cXMrY2toT1Y3NFhhcUMyWmE2MmlkRldZdnpsOEF1cHlKRjVU?=
 =?utf-8?B?MG5JUERFMGZBWEtwU1B4Q0N0MlNRU1NBeEhKOWd4d2Y3RGI2K3plZTZiNnRi?=
 =?utf-8?B?Qk9tU3pVMGF2QjMwOXltdnFJYy9CTHg2aTBrWUMvUkFqTWNwSTM3ZVZlZVNn?=
 =?utf-8?B?R0NQWkt1K0I5Zjl0SVJiVld4MFJxYk5ZQmlQUnZEbkFrcm40QTNQbFJMSGJ0?=
 =?utf-8?B?V2hTOW5vZE9FZit3RHMxRk8xd0pvYm5BYVdjRU94SUUvcmtDUnN4KzZYQmlM?=
 =?utf-8?B?cWt4STV2VXdqTUx0eXBuYjMzZFc4L0hncEo0Y2NsZXd1WWQ5WEJDVHVlUUho?=
 =?utf-8?B?cEdJNHF4RGNlcnI2QzV2UmRkcG9pUUo3aVR2aHcvQzZZMzNyMVd5akJOVWs5?=
 =?utf-8?B?T0x0bWdnek9uQUhEOElIQnBuR1dPenRqM2dsVTdWUzdBOXl1RjcwTTltVUFU?=
 =?utf-8?B?c2FHL1NWRGIyUGhqMW9CVmJ4anFXblVkK1VHUU1KeXU1MTM0ZVdRM0FRYzFY?=
 =?utf-8?B?OEFTaEMyeWpwV285U1ZXZlRzaGNiQW5HMkpBOVVmVXN2cG1ULzFSemo4YXl6?=
 =?utf-8?B?aDFQNURxb1RKcysvVCtIUzhHdDJmK29xckRiWjYyMWJSYU9KSVQ0eEhQU0R4?=
 =?utf-8?B?dEcybm1uR1dlQXNMNEFBQnJVSHdHYzhSSGxRR29yV01LVG1GYVRrZlJGWkJr?=
 =?utf-8?B?ZW9HMnJKeWprWWF5Q1dpem9sNG9OU3dsbDRRektBcHNsY1hEc3JLc3ovc1Bh?=
 =?utf-8?Q?VgVMSnJXHQ/5NVCZvJo1h5nKF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b650342c-d820-47cf-adbf-08daa5ed5370
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 09:46:35.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8lQDVq4ZVfc+s5Z+o3tmn8MTZM+KJxPsbtHwrHf3KwgfSknZ0F2kezKiS2jBztsDJD5cWLjrZBy3R+a8OuaKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7011

On 04.10.2022 11:38, Julien Grall wrote:
> On 28/09/2022 11:38, Jan Beulich wrote:
>> Another approach would be to build in a scatter/gather model for buffers right
>> away.  Jürgen suggests that the low two address bits could be used as a
>> "descriptor" here.
> 
> IIUC, with this approach we would still need to have a bit in the 
> hypercall number to indicate this is not a virtual address. Is that correct?

Yes.

Jan

