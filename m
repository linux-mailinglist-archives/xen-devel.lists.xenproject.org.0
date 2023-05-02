Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2B6F421D
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528489.821708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnix-0006Tr-D0; Tue, 02 May 2023 10:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528489.821708; Tue, 02 May 2023 10:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnix-0006QW-9O; Tue, 02 May 2023 10:59:11 +0000
Received: by outflank-mailman (input) for mailman id 528489;
 Tue, 02 May 2023 10:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptniw-0006Q7-08
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:59:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c08f4e2-e8d8-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:59:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8177.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:59:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 10:59:04 +0000
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
X-Inumbo-ID: 5c08f4e2-e8d8-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx78q1ZzM2xxCujcPgwQ+6ZG6BElMZMDs60MTwfinDgo2+DKHGpljpZyZHGLiKvk86uJVD/XLXLTqDO6F9jBWWyYOILl7E9uXwlTPMW5bEBrwYW0xG/+11SHQNLXEkX/+8LluV/M2q2vRlFJGlak8oOmtm/OP3bBhbG7tDmnoRPvLixGmTHVDb+RvHbVEt3qykscCITNbuLYMgup3y3ZCQ5oRqa7pPSN8O266jZPyvtpqe9wYFRK2k7sQu0w5HA4G7W5o9fCCfgsffd/wMK5CFCVsSvNbZiWySrdwv5eaJ7lEBmjMWkDLL3Q7N6SERauYX9nvuSVM/l6HmilU/iVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3fCQlvpDzEPjiM6a2fCovblRteLnyI0+TpO2FGT6zY=;
 b=Lr09JNO3cDo1JUzF+X3OrIzG1wkHh5cvu6ZjfS5QlDyaXZ9h+D9C8xy7jr6jL+v82c1RSiwYFA1xhZeRdOEz0E49wV8X6wmzNCWKmG31Vi1M7P3z5BKteoaGMOFxNdwTVC0Twcq1J264cG/PX8kg8nlE+xCJIiIuVcYnRaVzNC+VpYlzJRQfMy2+O+dfKvCvTfxAs35OeO8hLMwkAeDzttvjUNS53dkkeHB7q382U2bVIX/cNw5rH+uOJrdrzvPZ/mMBRuqtZvPNiK6/ldaUhOWpxssf7b4/hFLFXdr2CYlPOy1wyPdU56ZadBvtzVHkfZV24uvlYMRHpS8XwOjpow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3fCQlvpDzEPjiM6a2fCovblRteLnyI0+TpO2FGT6zY=;
 b=MQN2nyNvqbSvypviWgvIKv28HjuQU2VPz9XUsO7kKp1cdnY2QzYu47H7+4mtN2DdBQqWQUBlkRHIpVS2YNAeAggiedyMQU8lKEuusdPCoB658VtEXxAonFzFAfH0qULea5x8c4wFSi7NHKJP/r6mlzNuHoSfXubbIM5EfO17SsmOup9MnPEvFi4mnzMVzBMxegceTx/iHBgkQrP/Q17pDJ8oHoWY2KeBS4dsZDqRe5GW83crL35Pb+Mg+HTHqY56hhkVWL08iMzZyCW4rzRP/GP0oRVwS9Zz0u3XUrDrhWR7sjfyVgZBLcbV88FcP2DJJdPU8VFpGbhUTOih4TkIzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22b2e03c-ac5e-915a-78a2-0a632b09a53a@suse.com>
Date: Tue, 2 May 2023 12:59:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: da721443-6b17-41be-f00b-08db4afc3e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YodDVeluo0qVcFLJrtElMsBqieglQfr5MkiCdmfgv/uQNzkb1cM/avK39Olr0MdPE5Osl3Gz86MhpnlTTzPw37i0HDaS8U/YIMATQLbm8WLCn6CC043x8M1CSdQbJBml9K6IlH8AxfML7w6gvIgcL1HUBM7K4Gc+Rpy++wLDkJTJBxrSHVBu5+4Cpscp0YRn4PHtVKZvdyrf//ac0+EQj4ASk0H83ON145y1mLjmeowgzxYTWn5HuQSbDjgyWADICRELIlMrQf+LFqPnWV1Ho48fMmEQ5JNZEpgAiEEi1TGuCupZUqrcn/4FH4RI46dHadOR5W3GYGhcKqnB3ZRvbkoJ2BEWQeVNPWLFiLRM7EJdYbnCSWX25vHuXExB/fGJuI6K1Z8kFnUyT3sgLEo/7Bv0UdlTuuD9mHK7QLwgvjfN3DXjYU3OeGuiq6T1AClMRb0yNv/L9nxEo3WFDwjuK31kduAZ8p9CMxTP0hBDAxr9h+cF7Prrt7o3aa6FZEJf2BD439iHiwmtajz8cP4wcUE3qIHm6aytA4zJnwhmmRPLwFi9+LrnHLcGpW21ueHNZj2mOp53MNI0BEHfBCcXt9cjgg+UDP8aqq49FIAFyJC6cUP+fD/SBoN6MmM0oEM7CMb77NbogYhdCdm/VV+0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(316002)(6486002)(41300700001)(8936002)(8676002)(478600001)(5660300002)(54906003)(31686004)(6916009)(66946007)(66476007)(66556008)(4326008)(26005)(6512007)(6506007)(2906002)(53546011)(186003)(36756003)(2616005)(83380400001)(38100700002)(66574015)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHhHMGxXMEtDKzRrSC8wSjZzcTlRWGNUeVUrcFdacXBrY05MLzBWb3k2Mi9t?=
 =?utf-8?B?MGtoQ2VvYTFPVWNEM2RxSlh1WXlVcW10RzJQei9uMk1HLzJFV1NSeFY0MmJl?=
 =?utf-8?B?OVUzTHgvOGE3ekxpY1U4Nk4zeEJsN2ozNVBOWnpvUlZsOTRGOTQyR3RkcWVS?=
 =?utf-8?B?dTdqejNCVVVLUy9VeHBpb0pLd3I1dHduOXFGZXR4VHRzRFpGVUExbnI4MjNj?=
 =?utf-8?B?d3ZtWmhMT2NXSEpwYXFsbms5R3BnZWVRUzYwZzJ1bmdtMkNTcVFJam9YL1Ex?=
 =?utf-8?B?TDk4NzAvcGZNSlBzamdySFNXdm9ULzZMbXE3ZXNzd1EzdjVCQk1UZ0R4RG8z?=
 =?utf-8?B?MUt6UzIxRlpnMWNCVGNZSWw2cFNERVVzbWtWaHl6b0tVSm5SRVErSWo4dTBI?=
 =?utf-8?B?NGYzbjFzN2dzOWxZTXgvc1NiVkhSZE91WWJHdkNvS3RjRGdaNXpGamVoU2RI?=
 =?utf-8?B?TjdxSXZnd0VNdmdwS1VVdzQrcFN0eU0zNjAzWjFBbWFORDlHdUFaM2dIQUNF?=
 =?utf-8?B?KzgrZCtwMExCTkgwZ1haRWc5SEIyczZ6RDNlR1Frd0J0QWdEbno0SUgzTjVa?=
 =?utf-8?B?MG93eGtOSzhVZ0N3aEJMUWxPMkVkYWpuVzdPb3J6dE9LQ3VSZklPWllKS3VJ?=
 =?utf-8?B?Rk5KMVc4VDBXQjZrV3diZUlMS2N0U042SlQzSXM4L3hQR09va1QwVHJsRGVQ?=
 =?utf-8?B?bDdFM1djT1VuOUt3V3AwTmRMeEV6bENmdE5RK0JCWHA5YVFIWXNNbjcrV04z?=
 =?utf-8?B?Kytrb29sUFhhcUZ1MDFwM092by9DS0Z3czFUNzdSdXRpUlR3ZERLYVdlYXlt?=
 =?utf-8?B?VGhvUTFQc2FXcHBBYXlzb25qUDZOa1VOV2lUSGV3T3IvNHY0ZjgxNTVkaWFy?=
 =?utf-8?B?OTNlY3JTdFBmbDI4eVNNdHNpUU5VTXlQbFJSaXAwc1lKZkt1U0s5V1NVZVBU?=
 =?utf-8?B?b1laUGt3SG84aXp0emcrTzlGRkhhWWdvd2NHMFl2YjgvdnRFamtBN3RWaEVl?=
 =?utf-8?B?ZktKU2g0THJESlBnVkdSRjNMelNTc0dSNU4ybWVDTWpBdU14WkRPOEEwUDc2?=
 =?utf-8?B?L2pMalltMHVJbG44clR3VVFkSDh6SkdudzJIYVlUakIrWUFLcXNZMkJJbmtX?=
 =?utf-8?B?NzhxdU5ISUE1aXN0bk94MlZmRlZuV1d4ZVk4RzZHcDJWRllyTWc1Qi9QTm0v?=
 =?utf-8?B?N0lCcVRHUmM0MFBsdDFYb1NVM1ZUK1VFT0N2OS9YU3lTU3RwcW1ZTElxM0g4?=
 =?utf-8?B?RENQTjJza2ZxcDZNWG05OW9LRDJteEd3OW16eVZPa21Ca3ArZE5oVHd2Wm9D?=
 =?utf-8?B?clYvSkVGT3BmUE5idEpDcGRzUFROUm5PSFp3ZXU2K0Mvd2NBbmFHbUhWS2hV?=
 =?utf-8?B?NVI4Tm0ralE1V05yb0FFdXRZTzR1dXRrc3FnbndGWkFOSUFxU0NqSzV2d2JF?=
 =?utf-8?B?bDhWQk9yQ3ZGdjIzWnR5NSt3bVlCMngrOFVtelNjMWZ2RTFXSnhPSTJwdGdD?=
 =?utf-8?B?L0RCenF6a1cyY0l4bG00aC80RW14cXpZc2I2RjlXMFN5Ym4wUUFpMHlwdXc0?=
 =?utf-8?B?WmJtRU92QzlGOTgzK21GbHh6bFJvQmE3M1Q1TSttcTNJd0RrY2YxVlBIVmtF?=
 =?utf-8?B?bFY1VjVlZCtpZmpBdFpzdlRXMFZvK0VkKzNMaC9ZTWQ3cDhFRzkxWlMwRDZF?=
 =?utf-8?B?ZFlCOGVBbldLaGFwNVJIbGViT29wdlpNcWpSOVU4bmlNWmNOb3l4bThiTzBK?=
 =?utf-8?B?WG5iTEJXMGNkbEV4eU9CbTU3aS9ZMnpnLzd3ZHljZ0NPcm5hVlV1WE1uYTBj?=
 =?utf-8?B?QWd3RElqSXdqVGVuWFFTUFFJS2pCS2Y0aGEvZ0pxbGJPZzZtS1NwTmNoS00w?=
 =?utf-8?B?Sitkbnh4WmMzSWQyVmdvUTJzd0F2cGNNZ1hsbmwxL2dhNmphM3Q3dXpHRms3?=
 =?utf-8?B?VHI1QWQwazZNMko3QzRHR2ZqOVJIbmlEUTFBV2xaWTRLSXpVQkZ2RmNsZmVw?=
 =?utf-8?B?UlR3SlNXV0dWRFkzZGdEb25VQURCSXIzZWtnM3pNOTdrSzRLb0ZTV1p3aTlR?=
 =?utf-8?B?UDY4Q0V0OUhPZE9rVnEwK0t5UW1tS1Bsc1BndHpjeFlBWDNBUnIvVmNDR2tw?=
 =?utf-8?Q?8wPfg6iPR/5pOamGykcONx8oE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da721443-6b17-41be-f00b-08db4afc3e6e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:59:04.4328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wa5abGoCzdx6yeb8wywLyDU5C9b2K+nJ2SfZeP0VJ5jR+7KBU928de8HzHutaiPyiPA/tNJYjL+QW9r6yGKg4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8177

On 02.05.2023 12:43, Daniel P. Smith wrote:
> On 5/2/23 03:17, Jan Beulich wrote:
>> Unlike for XEN_DOMCTL_getdomaininfo, where the XSM check is intended to
>> cause the operation to fail, in the loop here it ought to merely
>> determine whether information for the domain at hand may be reported
>> back. Therefore if on the last iteration the hook results in denial,
>> this should not affect the sub-op's return value.
>>
>> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The hook being able to deny access to data for certain domains means
>> that no caller can assume to have a system-wide picture when holding the
>> results.
>>
>> Wouldn't it make sense to permit the function to merely "count" domains?
>> While racy in general (including in its present, "normal" mode of
>> operation), within a tool stack this could be used as long as creation
>> of new domains is suppressed between obtaining the count and then using
>> it.
>>
>> In XEN_DOMCTL_getpageframeinfo2 said commit had introduced a 2nd such
>> issue, but luckily that sub-op and xsm_getpageframeinfo() are long gone.
>>
> 
> I understand there is a larger issue at play here but neutering the 
> security control/XSM check is not the answer. This literally changes the 
> way a FLASK policy that people currently have would be enforced, as well 
> as contrary to how they understand the access control that it provides. 
> Even though the code path does not fall under XSM maintainer, I would 
> NACK this patch. IMHO, it is better to find a solution that does not 
> abuse, misuse, or invalidate the purpose of the XSM calls.
> 
> On a side note, I am a little concern that only one person thought to 
> include the XSM maintainer, or any of the XSM reviewers, onto a patch 
> and the discussion around a patch that clearly relates to XSM for us to 
> gauge the consequences of the patch. I am not assuming intentions here, 
> only wanting to raise the concern.

Well, yes, for the discussion items I could have remembered to include
you. The code change itself, otoh, doesn't require your ack, even if it
is the return value of an XSM function which was used wrongly here.

> So for what it is worth, NACK.

I'm puzzled: I hope you don't mean NACK to the patch (or effectively
Jürgen's identical one, which I had noticed only after sending mine).
Yet beyond that I don't see anything here which could be NACKed. I've
merely raised a couple of points for discussion.

Jan

