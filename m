Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644875C4F0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 12:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567487.886591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMne0-0001Q5-7o; Fri, 21 Jul 2023 10:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567487.886591; Fri, 21 Jul 2023 10:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMne0-0001Nd-4y; Fri, 21 Jul 2023 10:45:56 +0000
Received: by outflank-mailman (input) for mailman id 567487;
 Fri, 21 Jul 2023 10:45:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMndy-0001NV-Av
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 10:45:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7d00::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c39e4c72-27b3-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 12:45:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8156.eurprd04.prod.outlook.com (2603:10a6:10:246::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 10:45:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 10:45:50 +0000
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
X-Inumbo-ID: c39e4c72-27b3-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ld08XqxJT7sM2QVDO8ykPZrz8wPKwAVS0q97AKlCxeY5EiGcU4GlVNmfajA2J9EhSlLz/aLyYdUaMBEP0cg5A8BVzm0tBFvzLNA/DUcT5eysiM15kqfBnlRbwJnXE7vH5nn78JTnEBsvO2I5uxBy+5g2kDzU8dvH62xvrDm/23nLwlM5Lf7Sh9DA1XIX5fQoV1g6cevm2dArp1yUw/aSseBZAHCDz7KqsPFcV87TOLaNG19gjhDlv20jlrx6UA5Z85rA/87/7fQWPp3QIHMmbr5rLlIBDUDYJhGLK7bllPhVPzRXsc5dPXxVrk89L8lpQWt2rPhdfnwtezgFCBmItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAIP3lDRJAe/1FYN5CHROmmafD7SbM7hOzIbHZn6KTM=;
 b=kysdVPV/jE3OG9emxsxMzl6rwpBX/DI8Vfyvkgdbi+WcP/l6TIH5lnq95JgjzaggMDkIoSdHndNjO0YlIm3qAn0c3M4V7CcP67QNwzZRAAYew2iRtaU+8bHF/o5E5LcKio5bqpmUyZWTvfi83L/PILw4fXUqF8IVMKJJI8pAKINIbK6gQ+1q3RyuqhtBUZFqjlaGFOzyPN4ULJXtgO2WglRHRvTatUrS+d/CAg6ly2G2I06793b4fi4ttey48mPviXVTL8de1qRBY+pSoMw3SxJ4MiLpMY3WyJ9H68ADSaw14gTuCuliDIRWMyQS/6FmfUyg6kW03ET0ran/B6PvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAIP3lDRJAe/1FYN5CHROmmafD7SbM7hOzIbHZn6KTM=;
 b=X8fFMXY6TUSXI/BOKv3PJjGFc7iXganuM2UEc8wLbTWBi1z8HZ9ThWkX28vbG794+bEZq+MaspgTImF2tjKAVWZJzcx4icXKLj0yQFbICgmOzYcE+7bWvpzRWg9GwKjv7eLyhWEaDmW4XmPHb8bLo5rqeFTb/Fulma3bH7JdCxo8bgCec7fkbFukytGvhPGmBzzqGAAsRCKBZaCJw1khmiozJuo8AYuOOyOgmPckwz/phY7Vrs8eCkHFeXwvUm0MLWjjsTEVo9/jWtu7acEOALOLfX79TbwXEmv1J/yFkGvR4AgYW6xZBdvWPM/y0cS0FhZpJKvGi3z911sbjKmmZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b24847c-5cd2-877a-bc72-16bb732e0ca2@suse.com>
Date: Fri, 21 Jul 2023 12:45:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
 <DFD07AA0-E7E2-400B-8961-A646E5531DF7@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DFD07AA0-E7E2-400B-8961-A646E5531DF7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 1901c4ff-7ad0-4ac3-0d47-08db89d7a5f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KIDhwRrUxfBL3EzCpqHINWLe07bFOqArrAaSdowQM0E2U9lTtuSayA9YOPWJedw/JopHpdKi1smNbyVqXS2fl2hQogRz7xgPuz3XCxbCOLGICskfAj5GXzs6rKO+gTln5DbnFLR9e56NfA4PRgjZLGLIp4tTpJHZZOlZQIOsKuzMqVJy4kmSF4rgRX6YU93tcJb9fyMg1YOoJXQW2xjpQONe+8I7pdNzvDZnNyi6GWbU9QForlSjuXrsn2GbB4ukpi5UPCKVgtCcEZXg835JeC5EvGXSiseI0x2gs81a/OOCxdsoFf+qu/myNhBz3BcugS0A7YYAqWi0dsdLUzvKcm4+P18v9sss3OR8lRnhI2VYDEzWTnXlqE7oZSUKkCTq3lKPVp447fV3q1DYwhuTV3iYT2ElPfA7+oP69r4dxzVXHmq1YfcRDdYsTIY99h6fmbCcjQRt0OH+xdzGHjtr65cy7UsNgtJFYIffCn+7NLLHjAV69DBQEmI7+6Z8GLgP2peCiUirHAwgkHINYc2dbS1uF+Q5tY55uQAslNjwx75qh5GIigxaO1xIG5L7KDuVkTWowYzCr+BlCR4CmPRIy+iQh7S7f0YNeUXJqQMFA+pELu02Pms413Zk6NP7230b9E8/QHODz2ikYJwj3+OvrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199021)(36756003)(31696002)(86362001)(2906002)(31686004)(186003)(83380400001)(53546011)(26005)(6506007)(38100700002)(6512007)(6486002)(478600001)(54906003)(6666004)(66556008)(66946007)(4326008)(6916009)(2616005)(316002)(5660300002)(8936002)(66476007)(41300700001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnM1WEVDY0p0VU1yaDNpL095SWUySUhSWnIyM1pZc1FHck9qVkxyMTRWWWxh?=
 =?utf-8?B?ck1pQjlhMlRGVHl3a24rbUo2UXpWYkx4eEJZTFNBL1BWZEw1UnBHK3FqYlJz?=
 =?utf-8?B?REk2OHNYWjR1bGZiTWxiWm9DNVNlNlBIcjY1SE5uMU9GS1lBbDlJb3ZMbFFU?=
 =?utf-8?B?blRzVFE3b1U0QW1xV0Nrbml1V2RXdUhjUlJpMmpORXFJSUdvcEtwdmNBeUtB?=
 =?utf-8?B?UEEzc20vVExYREVPNW5sL0ZvUW9xK1ZJam5BYTRLS3ZTbGZodUhjclArRmRa?=
 =?utf-8?B?QjcvVHZ3MmlBOVViWHF0WkxVUHRjc0NBRlB0VHhwZFRNdTJ0Z0VKcFJUUE8z?=
 =?utf-8?B?SHBETVB5NWlrbkJMZnZzYW82OVZMbHRyZ0NpYmZ6Y3FGQ1FUOFg1RW9wRGlm?=
 =?utf-8?B?bEhmR1BCTTZ3MGUxUjVLV01QT3hHOVgrUlBCMzRRVGVsaS9wR3ZpekJtalQv?=
 =?utf-8?B?Yll5aDNhZHBLYjVCUi9BNFBIb3RvbzZIVnA0SWxHUW9WTm0wTFRzczFid0FT?=
 =?utf-8?B?dlZiTThCdGU1NEdGSXQyeDNYTEpoM0tJMkFZUG9DSlRFenplQ3U3WVZHaXJP?=
 =?utf-8?B?N09CQ0RXZHBWenZBL21BRWlrdmJSTjMrbkJSdEhkSGdvY0ZDNUdyYkJQbm9D?=
 =?utf-8?B?SHpqY3U4bUpYSjc1bkxhVWdVRnB1eWRuaUQ0eEtNOFN0N1FzR3A2MGNmUjhQ?=
 =?utf-8?B?SUc4Z2xMMkN4ekJ1NWtXczQwc2lqZGVCMzhUTHZiaGVIZDV0aE9HZFVqR2dR?=
 =?utf-8?B?UnRkYjNVZW4rNDY0Zmg4dHlodWFIalhYME8zT0RaQjVxczVpMStxUEIrQk9X?=
 =?utf-8?B?alR3Y0YzeExpUURjeUFWR1QzRzVSaVZxenRDaTFSWkxxVytIa0pQK2xzRmgv?=
 =?utf-8?B?V1VDYzBwbWplMkxLN1lDN2tzeWhWUXk4NC9GeXVpcnZsZ25hL3Fsd09LSWth?=
 =?utf-8?B?dHRwL2EzREZwNmEvY3l2dERRYXhUL0FqKzNPTkhycFFsUjdBSk5uMDFOM2JB?=
 =?utf-8?B?ZkwvVVdpUTNJZjcwdDlia2dRNzJJQWFkdXNXZnVVOHpodzdYM0ZhMENpaTJO?=
 =?utf-8?B?TlVEV012d1BZOW5kNlRHT0IyWkwxcmpEVlo0ckFSQ1NVc3hJbVlrZHdTdTFj?=
 =?utf-8?B?WHZibGZ4STg2S0lRSzIrdE9vK3lSNlJmWlB2bWhJNXpBWExRRzArUGQvS1Zn?=
 =?utf-8?B?TXAxTTByQlpRcndiMUplWGZWQWhlNkpFckhHbHJZVnRSV2I2c2FWWGVGMmdx?=
 =?utf-8?B?ZUc4ekt5TFZ1OGFhT2RuOVVqZjVvOXNyY1JrUjczbm16NUhGL3dRYmFsTWtm?=
 =?utf-8?B?UWljM0pnWU5oWHphL1duaU5NVmVsSktnT1Zndi81YVBuK0l5d3JDOUNudU1G?=
 =?utf-8?B?SldJQzhXVEw5R0YzQ0U2cUw5YVF4NVFFOXF5SWUyVjVRdjZNdjF0OHY3OU1R?=
 =?utf-8?B?a1l6R1dKSGJsT3ZvTE5HVnNSWVNzWGdWV0x5VVVCQWtodTBHRVJBQmh5eExz?=
 =?utf-8?B?TTluSXdXNnZMZFFrUUo4bFBIZVlzdm5zK29UaGJ5NXAva0NpRWh6S0VqQ1Qx?=
 =?utf-8?B?Wk0zQ3N5M2FYY3k0VzhJMTR0WUpiZy9oMjdjcXBDOWs4ZUdYamRCVmUwOFJm?=
 =?utf-8?B?dXJFTnIyanBnZ1lxUFR3enRLWXpBWHFYZitRVEdaQU5DYzYrSVc3UC82UG5y?=
 =?utf-8?B?RzI5bUNKVG1nUnpmSVBVZkRUUzdJRVFKMFFRWTR3cnRZSUFiaGkwRll4eFFE?=
 =?utf-8?B?VTlCY0ZjTW8yYTgybVVNajJHbS9zWlIxNjZxR0tsaG5kSTFhL09YZHpBTUtW?=
 =?utf-8?B?cDlpTzQ1WWxHeDFzaTI4WEJXRmRoOTM1ZXprd2tZNjJ4WGpxaUNsQW1aWkpP?=
 =?utf-8?B?WXdqUDB6eW5tamhlNUNjNkZJeDNrZEdBQ0lQTmlpdlAyRS9DTG5tbWg5L0xI?=
 =?utf-8?B?TFE4dWxyVVViMURZVi8zNXdjMk1CanpTb0hwZXNzNyttNWZCVjVOVG5laity?=
 =?utf-8?B?Z0RTcFlERkFQWlFZdU85ek5LcEY1dWFlcWRjcmdnSldSZ0VjWGpaRnhRNVdP?=
 =?utf-8?B?cWx5bmpZVzBkQXhMQk1mMk1YTzlncWF5WVY5dk1pRk8yS3lHbFMvcmpzT3Vm?=
 =?utf-8?Q?tVbL8323OEGK4fUc9Gdtzv4Cp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1901c4ff-7ad0-4ac3-0d47-08db89d7a5f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 10:45:49.9765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0wQFxHY6S3JGFO/VGiUTKoq7WxCePzqbrx1ZjOsXNKjmeMy2f5fzeEnZq8qsUaMPH61ndGtg8Cm5ODY18QiMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8156

On 21.07.2023 11:02, Bertrand Marquis wrote:
>> On 21 Jul 2023, at 10:52, Jan Beulich <jbeulich@suse.com> wrote:
>> On 21.07.2023 10:02, Bertrand Marquis wrote:
>>> --- a/xen/arch/arm/tee/Kconfig
>>> +++ b/xen/arch/arm/tee/Kconfig
>>> @@ -1,7 +1,17 @@
>>> +menu "TEE mediators"
>>> + visible if UNSUPPORTED
>>
>> With this ...
>>
>>> +config TEE
>>> + bool
>>> + default n
>>> + help
>>> +  This option enables generic TEE mediators support. It allows guests
>>> +  to access real TEE via one of TEE mediators implemented in XEN.
>>> +
>>> config OPTEE
>>> - bool "Enable OP-TEE mediator"
>>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>>
>> ... you shouldn't need the "if" here, and ...
>>
>>> default n
>>> - depends on TEE
>>> + select TEE
>>> help
>>>  Enable the OP-TEE mediator. It allows guests to access
>>>  OP-TEE running on your platform. This requires
>>> @@ -13,9 +23,13 @@ config FFA
>>> bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>
>> ... you could drop the one here. I think.
> 
> visible if is only for the GUI/ncurse display but the if is required
> to make sure that a .config file cannot set CONFIG_TEE or
> CONFIG_FFA if. UNSUPPORTED is not selected.

Is what you describe "depends on"? "if" controls merely prompt
visibility aiui.

Jan

