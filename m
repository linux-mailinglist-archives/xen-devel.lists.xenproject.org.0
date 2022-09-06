Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34EE5AE04C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 08:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399419.640582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSTj-0003Ao-5F; Tue, 06 Sep 2022 06:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399419.640582; Tue, 06 Sep 2022 06:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSTj-00037U-2H; Tue, 06 Sep 2022 06:54:35 +0000
Received: by outflank-mailman (input) for mailman id 399419;
 Tue, 06 Sep 2022 06:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVSTh-00037M-EE
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 06:54:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140087.outbound.protection.outlook.com [40.107.14.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2cb046a-2db0-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 08:54:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4312.eurprd04.prod.outlook.com (2603:10a6:209:49::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 06:54:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 06:54:30 +0000
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
X-Inumbo-ID: c2cb046a-2db0-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUC8Ew8uUcI10Uy3H+sCKmlIb/1oQx8uFR5MIQVEv0SB2PpjnQ77/6mnktDo5OPZrs4qrQ9G7vVwYjFzV+l5OfI59/f03sS9upV2gjzWtbjfR6sl4YZN3ESyeFF6JT8eRvn/+EgoUfsOBUGA+ZcGPdAmXmegVzq93q66BbE/yO1UYWQX60dLWbtanC2/43bjny3PWuIYN3FTqmHTrgXzEmLan6Wivgz0oyKSdUxP2wlfyYZHH781oA4ichPNZe4p+kgf34SvL+MQ9fQlZQml8N2ENC/nCEa/X/6So2LN63zB/HTPhoU+yQVqUOq/2f+qoywR8eSUUQKSVxbW2+kbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkg1l0K+uoKu8O7X9t9Eq0ec3cB6nljQKzS8X0a/luY=;
 b=US7+HX0MKUgedyWLWqgynmub4QQOGZfnMTFK+EFMES4+MrsrQgoPEg3QN3ODiMmrm/lbc9nSWpfwbP1kA/lJedpkvBxqby7ra1yCeQje8K6UsNQmrzfRz1WP8ZD8btXPVOAEeWaBr2rEP42S/eLCKEWey9eUHaJtL/SPE+1C0UZngN9pZpJ7jUj5VBRpp0SzoB78w2Q3okqaegIA8vlHoE0LjaBfkm/otu1E76FkQml6DmxIANxBWuj/HyGjq/yLc1d52qyNO4IBJZr9EkVKMxC7WmY/Yo4MOMH8gNa0jLSSu1GVpkwHwW2SPHJWUppOx/AL9rULByR/iWfRGobisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkg1l0K+uoKu8O7X9t9Eq0ec3cB6nljQKzS8X0a/luY=;
 b=bNOVC98iwMxPDi/ACU+x9TZYIH26LBVkWTpB0WfEho7UeQTC3qu81aqhfXPNsYnNZAzn9+Yy3Ju3cVTsm8O3pe3kS2RdVK2Y/lr/aPJYBv87xa26iQAbvEr8E1S7mYeGWs2hsrW/Mpb0AvKb1xGc6v3D3keA6lrrdB944woXQHhZTdS9m2aa4Qi19o0a17cKL22Pk5Eqej2T7GCsv+pPBpnAVLIo6+LcZphOalyx94jDWSCtWNotNu5l8cGzA5NLy0dbxvDyY/OXiX1rfG1SytPQ/Vs5olsGOFXJb+y2bo064kDcXrRp2P6U6ZpoAXcFPs2s9xhqljFjNgJVsohe3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2a7116b-ea8d-588f-617e-cefceee319a1@suse.com>
Date: Tue, 6 Sep 2022 08:54:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] Make XEN_FW_EFI_MEM_INFO easier to use
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <20220824210452.3089-1-demi@invisiblethingslab.com>
 <df443aab-a2eb-75c2-3a4d-df6d093b5788@suse.com> <YwfdpPH9PyPXlMAa@itl-email>
 <ab973fa7-85db-af53-9d4c-cfb8c2099135@suse.com> <YwkNt9w4T3H38D8K@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YwkNt9w4T3H38D8K@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 520d9d21-d482-4312-e617-08da8fd4a594
X-MS-TrafficTypeDiagnostic: AM6PR04MB4312:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lasPD4orHryHnJebJuc5tzZW2hg1+goPFhFaB1o1FwoagDYsVTc7mwfvlGc0jvKTJZjwjRzwBF01c+lxkJsuP7qZtEQMYtZZhXeZHt/KQFzasVwVl4YLH8fWIFGBtrojpyYGByy3IYpr8cnl9CDZ9hbLEKQusV+XA3yPZ/raZTfH4wBnxHLjBwY5oOkYpKR2nzKGRSYpX2DvcyZBFbGy6R5PKs8kYH4IW+ey0LwB/7xmEa+UREp3RC7F4UsyhtnFK/7/fyoQn8M5d8whyboQQzCSVMuJwV/kUN0DhR58dQfvG6bp9UL8EUSsPqp+OyZEWBCgMpdghlXWnguz2t8sTAmD/kovRaAlpS9zKhhQj4CBwJM21fbQqnVYWdnRn9PNURBRiD5jFPWlF0o9C6D7SfMwtjBH4piITcf32Le16aV2cynYzPmpaqBBh5tj3F2/MHIDlf3G3haS73ZrAHFnCn2TbdpxAj2z+U24wi+eYnBN3l1hE8xnjSrHqEGqUX2aXsZFJ2KsVzXDk5eKqXegq0X6Yp4atERkcZ2bKAk2tweWXDfQPcpfKgb4tyGkiwToD4p60k2tTKhrUKiRv/6TW23Hxo6bfpXGU0SQ5bvyo1CDO9HyVCTiH+CLwBDfOiTFA7/s/HyhVq3dBXQmIYQBbYekFLWBD/cD3UTkCrfMMpTvOWtVZr/E30pzQC5E4EIzuQEv8tgBzy8OpD7/ubLe5j3D5yukHw8G+FY7aG37jC2FD1XMJbR5bFtc3l319u1Bg0BYAMjCTr6wlxIAkRiSVW4WgajtkU0fUBZ7JuIZAws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(346002)(396003)(376002)(6506007)(5660300002)(36756003)(31686004)(6486002)(2906002)(8936002)(41300700001)(2616005)(186003)(6512007)(53546011)(26005)(31696002)(4326008)(86362001)(66476007)(66556008)(38100700002)(66946007)(478600001)(54906003)(8676002)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVp4WGVMckxwYUkvUEtYTitaR3FhYUlKMnZ0OGo4UWJ2OXczdjd4WFRNeFBN?=
 =?utf-8?B?WlRDVk1zVTIxVmhKMU04emM4anRicXowRU5qU2xROVVIWmVyY1pvRGkwa2Jj?=
 =?utf-8?B?TGViU0dQQjUrQUdOSXlaMVovRHpZOUhPTG1kRGJPUmxSeWt2YzJYS0dHK21n?=
 =?utf-8?B?Q05yb0VLVGpBYVpqNTFCQWkzVDNLZmExOWVLZlF4MjJkcVlKdzl2cnNJZ2Nm?=
 =?utf-8?B?NWUwQkFaZlpHL2d6OXVza2lxMnk4QnlLMHZqZFNGUHh2MFdlay9xaHRXMm5i?=
 =?utf-8?B?SDJKUE44K1Q1ZEVMNXhiS3phSlZoWXg2SFpvdkQ0aWV3QTArRVJuTndpazNS?=
 =?utf-8?B?eGJobkZJeVgrVEdjOXBOaTJ1a3JGNmpCV0FvRGt4Q1pUZ0RPTkV5OVlnQ1Mw?=
 =?utf-8?B?ZXUvczUvWjk3cWQwR2xLVHZoWWhVVlBjWk9YZjNYSUhRRmh2a00zUG5hN2ZE?=
 =?utf-8?B?QlZqQ3BmajFaTFZXQUZQTFhEMXhBN2VPcTREaVNaVEtrbjdUSGxMeEsrL1lY?=
 =?utf-8?B?cHV2eFFPMnhPV25NK1FBYks3dnVqNWl3L1d0RmRSN2RWN0dkR240U0dHdVBK?=
 =?utf-8?B?cHpwaGlHWGtLRXQ0d1V1dDVScVBFZVZYVnJOdFV2Qm9Eb09MMEpNZXF0RmNy?=
 =?utf-8?B?RmEyYzhzeUxSTVVhamwzdGpWdkFIbnlrWXR5MEU3amx4WnE3bHNtVm8yUUI0?=
 =?utf-8?B?bnZ0RGdhMWl5RzUzb2lUN1BFcGIwR3N0SlJhQVpRUnNXd01WWHV0VWJMcnlj?=
 =?utf-8?B?MGRPdnRhUXgrYmVjbFh1c2RnVkR1dHVlS3lOOUh6cnREOGJmaWl4VVhUVGN3?=
 =?utf-8?B?V0M5MjRWNCsyaUpGVkpFckszbXJHWDdURW1rdWZrQm1VYkxpOUlxR1cydUVG?=
 =?utf-8?B?VVJJUWhZai9DZHQ2M3RwaXYrRmpXVk53M1JyYjM2dkg0ZjFWbDdEZG9LUHNH?=
 =?utf-8?B?akJLMjJ0S1V5bU1yckcrdkFONFcwOWFmNlhIbTJMM3JCMk1XSFlZOFYva3li?=
 =?utf-8?B?RUc3VGlNM1pBeDF3YUhjR0UwMmF6YTVhSVBFQ09CZ3ZxbCtwODFqOFg5WEs2?=
 =?utf-8?B?Q1g1dDlFckJReXNBbVR4WC9XRnhpelMrWG95MHZEdzA5S3pGWlk1cjcvUExx?=
 =?utf-8?B?VVB1TEdvVlBFOTZxN3hNOEtPTzRUYk15aExObGg5cnE3L2dZdTlLQUhpTWZ1?=
 =?utf-8?B?VmxVMUMvbkRkVmxxSkh1QUFDYmdqUGFReFpaTFBWOE9Zd0pGNGNzc0VvVUxW?=
 =?utf-8?B?WFU3SUkxNUl2alpQQVNmVUhib0RlYUtiV2FqZnRLMmw2MjVqajIyWndYdHpn?=
 =?utf-8?B?RWRzMFhlUkVzTERHTWoyNERiZHEzb1QyNXpVY3RqM0lScTFpb3ZVZGtEcndR?=
 =?utf-8?B?YXQySGFiT2ZkSXFiNVVzSzBVcklnVEI0Q1pmbE9xRkZnY21TRGZNcVloQVM1?=
 =?utf-8?B?OUFUQ0tiVXdUcE01aWg2T21QS0xkVzBWSVZUVnVXb0pNck1melp3MUs3YU9q?=
 =?utf-8?B?RE1UWmNmeFpTcnB5MnBHVlhjUG1tTXlwZFgxdjlUeXNKTjlrdUtGb1F1S1Vn?=
 =?utf-8?B?NTVyL2RZNWFvSXNoa2I1UU9SQktUUTdUcFl2OFc1MXM4VnExV1ZFOEhUdnFm?=
 =?utf-8?B?dXdIcUFodnIvYXhFelpNL21XT2dGL25BbEJGcy9zZjkydmc0blVpTWU2dnA0?=
 =?utf-8?B?WDV5cGJ6U2I0cUs0K0ZENnhGUzN6RjdOOFlWREk1WlRNNkZiNS9YeStmODBI?=
 =?utf-8?B?b3hEcmdBdzBqQXA4SElZZ1dTMGJKSjZnUnR2T1N6Z0NmVWlVZGIzQUxYZVhl?=
 =?utf-8?B?OEh4em1EYXlNeEJXcjNZOUxzWTBRMzdvUm4xRjNHbWdOTFUxRnRHZ05aRzYv?=
 =?utf-8?B?TENqSmZvcUNzNE5nMkQrTzZIVG43SGgxVXBPbFd2YWs5LzcxUVBmYUF3cmsy?=
 =?utf-8?B?V0VsY1VhdGg4YzRvTGYveTI3T1I4U0l0dmxYSGlqMW5sZ1pQWno1Y01YeGc4?=
 =?utf-8?B?VXVTc3lYN1Exd0FJeGhSelNCOCtTb3RLK0pwK3R2Tzd3NGRLdDN0VlMvTHRS?=
 =?utf-8?B?VWlIZ09pZ290SjlLV3NZQ29iRkdhNXFuT1NWR3pTcHFpaTBhbEFBc1F2K1ZT?=
 =?utf-8?Q?TvGJKT7llJoR5+1KmQsoGWqWk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520d9d21-d482-4312-e617-08da8fd4a594
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 06:54:30.0965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zH4xzuFONIPuxJO5Zmek0/1X/BL7RvEWHKUd+rK3PAX8yj8HlSnwH/MxSDchpmumpbsFnto+aUw45AkX78rjmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4312

On 26.08.2022 20:15, Demi Marie Obenour wrote:
> On Fri, Aug 26, 2022 at 09:18:50AM +0200, Jan Beulich wrote:
>> On 25.08.2022 22:36, Demi Marie Obenour wrote:
>>> On Thu, Aug 25, 2022 at 09:59:56AM +0200, Jan Beulich wrote:
>>>> On 24.08.2022 23:04, Demi Marie Obenour wrote:
>>>>> Fix both of these problems by unconditionally setting the memory region
>>>>> size
>>>>
>>>> If you were to report a larger ending address, why would you not also
>>>> report a smaller starting address?
>>>>
>>>> But before you go that route - I don't think we can change the API
>>>> now that it has been in use this way for many years. If a "give me
>>>> the full enclosing range" variant is wanted, it will need to be
>>>> fully separate.
>>>
>>> Does anyone use this API?
>>
>> The XenoLinux forward port of ours did, and upstream Linux still wrongly
>> doesn't. The two functions efi_mem_type() and efi_mem_attributes() still
>> wrongly fail there when running on Xen.
>>
>> But how does this matter? Even if we were unaware of any users of the API,
>> we can't know there are none.
>>
>> As an aside: Something's odd with your reply. When I opened the window to
>> write this reply, Marek and the list were put into To: (instead of Cc:)
>> and you were dropped altogether. I can only guess that this is what
>> Thunderbird made of the Mail-Followup-To: tag which your mail has.
> 
> Probably?  Mutt generated the header because I had (incorrectly)
> told it that I am subscribed to xen-devel.  Is it best to leave this
> header unset?

Probably, seeing that it results in misguidance of at least on commonly
used (I believe) frontend.

Jan

