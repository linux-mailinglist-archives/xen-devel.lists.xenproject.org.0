Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F1D76528E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571039.893902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzHT-0001Lw-VK; Thu, 27 Jul 2023 11:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571039.893902; Thu, 27 Jul 2023 11:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzHT-0001JZ-SM; Thu, 27 Jul 2023 11:35:43 +0000
Received: by outflank-mailman (input) for mailman id 571039;
 Thu, 27 Jul 2023 11:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOzHS-0001JP-Hm
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:35:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6b9b66a-2c71-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 13:35:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9517.eurprd04.prod.outlook.com (2603:10a6:102:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 11:35:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:35:38 +0000
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
X-Inumbo-ID: b6b9b66a-2c71-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BO8zXo9dOiwV6NfNnpuVRZzUKcA9xYPABM7dcToQhDGQQnaO4/BhWlAgkpp+d4eC8IUH0Vw9pT2UVLhkUygzpnvBDjBm0Rk79UqLawYwrZGP4Es/bTQcQrrFvOAbWdq1lzVcAQcn2wHJColfmUtyj5sf4UfBPh2BL2q6z3Jd105qxzJGMAE7fuyw5uVzxhQtbv3W+Dc7BhNYW2S0gSAgVYIEqSJ5aziGxH8NXfovy5auQIH40mbbl/l4W3P0IEglxMaBiN6gD7MlwZ+3XTRuNL5wPRGACQxBh0DJKexExOY0fr1hjpEG4vL/V+WAMlbtqIQ07+nhTcVzOgoXw89VEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ7Bt4bKzvvAUqYc1pqZEPq1l2hAsBEIywIW2BTRUXg=;
 b=kaR4BTwtj36XbEDtxLMbwrT3u69/DV0LL0kR4U24L9d2YP2z2wss1o2bnUF2JQ+Z7cqzDn9avbbyhkFOLlXqkeOc1DDGw4k15guLoiNB/TVlkecbArU5w9E/110XwoNZzymkwrJWazeS5+cu+1LvU+qS54KORcdLFtXSWgxq9PRpu5F+k85fAHQSl/HuQLUlS+i6frUkupEmrqAyZA2q31TsFmRhY7bq2az48hdu1A2jZ+Ca9e9VIjJ9fxAox7WrzOwKSE0jOMyc9YrMJU3FT/5SGyKn6meAg62mr1CmuRaCT0FC5Q7jfN/pub9jopw0/TLXKHnVn8QsPDjkCT6JjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZ7Bt4bKzvvAUqYc1pqZEPq1l2hAsBEIywIW2BTRUXg=;
 b=RdEicMvQjizu2pV7YdHJPSmstTFfD4qJJAQW4WJIpc1YqRxcSXdFC1jdjdr0I0bfk88bC8LKnIdJOxRChryhZM+f8Wy20w7IctLkjOpKN+UjpMNCzvzSDADwNpazcEcQ7koHKYsLi+WPZt10KSFiC6dyyfkkneG3Ypj/5kM5dpR+sJryeuuoHphi7hMnNW0XM+UrFIhW64AoeGpKF0YZzLBhoXFOQ+Sdem4UjS6fFNdpe88sQ3zMHIoATvSEWfP9cIKU4/W0/y8Mh46nuCTfzWouf4wUMrRFS6MU04h6GuOpSWWvOOBtLfYZnFG8RvVslr/vFQhMjadMIBbwEJusZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <099d7f75-95bc-2c43-0d74-433fc70bb27f@suse.com>
Date: Thu, 27 Jul 2023 13:35:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] vpci: add permission checks to map_range()
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20230726140132.80151-1-roger.pau@citrix.com>
 <a277dacd-56f6-a5ab-6982-b5cc4f9d507c@suse.com>
 <d46a1bf9-2f66-542a-9e7f-3d298ad1adb2@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d46a1bf9-2f66-542a-9e7f-3d298ad1adb2@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eed8331-680f-4d62-a57c-08db8e9599a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XUU3HcOWN2Sbm8xWa5zCC72szd4Y+gHhmPXGK7U7Z2aMQU5vzr8xblTty0/caqoCrEOuJsNkaiN3IqhWg1Gjok2NIEvDZ2R8005DSAgu8eYgTKn3rPPpwI0ToycX8TcCj7fvQRbqzKJuySATLclnt4S9pLrz1SJgnUDcJntXsop9rGtFpiY8chjmKoACImc088sWcqqWpo4o5l8+yp6G8hvZLgxG7j0wAzNw5vhgFIa/z6Zk/PEblbFDyn63us+O7/dh86ojhsyo6juLIeli1B2ESooJyKfa73+nZu+vRm2sCTHD5AayRXEAE/zbeW2mGhOd2om7EGEmHuhKZW1akiQDmn4dzF1Tv4LmfXZvYeahQu4dZocQUvN1b9RWr3KnvYShCrz0ob4JsUDebGLUZw0crSkmt3v0C+BIpPL81CfUvqJHahhFA/8q3iyEYpzYPg2H20rkfYchtiyt5fE4uWQU60UAsa9Tc+eKbHzymViSl8sLyAXewLIeMNn7wuzUwYNXzc+3wwpjHEdjI+IhAEgozRBGW7rq0gZURpj0DIalcxc/4WXAyq7T5LTng0xBH/2e2P6d7Ays7QsPV1QeWVzMf4y414RuQlDa4MLfLbSw407ANl+2ZbvG1CODONptE9AjUXM/TCv4FV22Pl8QNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199021)(478600001)(6506007)(6512007)(2616005)(53546011)(186003)(26005)(54906003)(31686004)(6486002)(66476007)(66556008)(6916009)(66946007)(4326008)(38100700002)(5660300002)(8936002)(8676002)(2906002)(41300700001)(316002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlR2MUMwQks4TnVnYlpLYktXV0RlczlTdzg4QTgvUlVHUDZiUnVFUFQvWXhP?=
 =?utf-8?B?RE5uVWxmcGNZQ3hjZ1pVV1kybWdXQTl3QjBEZDlXR212MDBYaGNCcmcyMEJa?=
 =?utf-8?B?MGhKd0s0cVJJQkhBZ25WQ1BOZ3NLRkQybkVvOXdxMklKRWRsOWg3eWRYVzgr?=
 =?utf-8?B?WUZxRHNmV3Q2SGpsMlhqamhRcjE5N0pPMW11bU55blBZOWw1SWFsbStEQmN5?=
 =?utf-8?B?cVpsZDdROTJLMXkwVFQxanh3SFArSHYwT3FPYU9jbTRtdFQranN5Ykt5dXJY?=
 =?utf-8?B?aVZnVUw1YjdZVmJOTzhBeFBIZlBBS2NaSlJId3MxT2JUeVlCS0RaTVZRRTR2?=
 =?utf-8?B?WWZ5bE9ad0FDZXBsRHNPa0hpV2M5eDFVWW1PYkNVVkhJWDh5RGVNRE9TZlQ0?=
 =?utf-8?B?cUlYZXVnTFg5NlNrcTg5NXNkem1jcDV5c3JzTHVFVjZMME52eHJZVTl0TVpX?=
 =?utf-8?B?WlJOVDRubmY5ZTRrd0RJeE9hSWZOUjl4NUpWNENtYjdHZGNCc0dmUFd5OHFX?=
 =?utf-8?B?YlF1ZitxdVFQRjRYZTB2YVczcjNKS1BsRm8wZC9DOFJkemNuQkZlYkh1YjJX?=
 =?utf-8?B?UVB0aFRJRTRsd3VsMk0vbDhkcmxWd0tCNzVWUHJpWWE5cmZwZWlCQlp6bGE5?=
 =?utf-8?B?NFhFSnY1US83ZjhSVXNjRlppdmMrcFN1Vk1SNWxQbmYrRHhoRWpOL3ZLZENS?=
 =?utf-8?B?QzAxbkRpZ3p6NlBiTnpubUtjZE9lR1pSQWt1cVhWM0YxN2dKT2U1MVVjUytV?=
 =?utf-8?B?cmQveVhJenB1TzkyUFNrSWFCYk5IWUNwVUQyVHJQOUwvOU1ad3FrNnpPTVdk?=
 =?utf-8?B?RTZoUWFTQVVFbFNtYUZIVFhCbnhpdjJ2bXJYSDZBSlk1bi9UTkxCQjhxZ2RR?=
 =?utf-8?B?MEJJYllHdlEyS3dOUUlBd3g1K25jY0oxdFhWTHZnL3M1SFZlVVVkOHMwa2ND?=
 =?utf-8?B?OVNTaStHSDdDUlloYWJYN21MNmFzWFMyYzZ0QnY2NmN5WXJiN2tMRDJ5YUp4?=
 =?utf-8?B?VzRKRmJjakh1SjdwbENmOEdoWXlFRWwxbUhHbTFzVi9MUWNDejYvbkYyanZL?=
 =?utf-8?B?UEFVNng1TUNkT0k4NnFCbXZWYjNnd05XREdLSFlmamRPNzE1c3BGSk1zWlho?=
 =?utf-8?B?OHFnUmhqUHgzaFFTV3NVSlQ1YkNLc3FmNlNnbWVIQ3FvaDBVWVdpK0xSQjhP?=
 =?utf-8?B?cGMwUG5ZcVlGSGcxZGpQQzVNYTVjVkQ4UWRLYVBOb1BBTkUrVWhrdmh4Q1Bw?=
 =?utf-8?B?dUZpQXVDalh1M001Q1J5UGhNYmFtQkNKN1Z2bThNU0dCTDhYZmIzUGtBRCt2?=
 =?utf-8?B?c2UyWmt1RTUyQzlGSHp3Y05VTStXdGsydFRjU2REeHFLUkluNytzeEZGczdQ?=
 =?utf-8?B?M3BkdWxpSlV4Rzk0UG8vd29kUVlTUk92blhpNlYyR1NicnVtRW5ET1B2YVpM?=
 =?utf-8?B?SDZwSUtxbHo2RDJzTDNOTnZPcEc5cjRETlVkY3lLVHpJdmkvVk0vTUZ0ME9V?=
 =?utf-8?B?L1JuanNPUUZVRTF4THR1K0NrZStrS2NFZmhFUUNCRnh1Q3hzWWVaN284Rit5?=
 =?utf-8?B?VzcwK256aW5jalROTmdPbFY5bTBXZTNxVjltV2IxMlNUR1hkNEFLWWozcDRK?=
 =?utf-8?B?THRxcUY4SEhjUjcvbW8wR05zRUp6MkIxMmYwYWhMdGdWQjBFT1djK3NCZnBy?=
 =?utf-8?B?N21iTWl4WXVsZkcybDdmWlltZTl5NzdvN2lWNHJGS3NsQXBSbU9GcDMySEVE?=
 =?utf-8?B?dDlCMzFwNThJMUhETHNPTDJIK3d4OWxqUlpMY1pNWE1HM1M1b2xSY3BmY1Y2?=
 =?utf-8?B?NkZtNnFwL3dSTmdFTmxJSHp2ZFNtN2g5aE1JR0RVL0g5TWxxSWNmckREM2sz?=
 =?utf-8?B?Z0s4ODdVM1c0cjlSWU5GUlpxNGQ1eXFtQXpUdE1WWmZ3VW1oMW1rNHFRME10?=
 =?utf-8?B?L0dhNXlDbFpubnZ0NGM0S1Y2SUJjV2d6MDJETXNaVnRxeUs4S1VwM3NvNm84?=
 =?utf-8?B?aGRmM3lHYXV3Z2o1SDF4SmNxZldGZ0kxL0xWVEdqazZ3SGhWWnNPNy9nNzhZ?=
 =?utf-8?B?MVRjVzF5ZytJVk80OHBHbmJSc2JMZWlzdFNvR0VyNFdlSytqaUVIKzc5cHlR?=
 =?utf-8?Q?pr4HfyzuDjLfn14/u5z1+2yss?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eed8331-680f-4d62-a57c-08db8e9599a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 11:35:38.3097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLVPhZE4dhUl4pGB+uGodVAdXuIaq4EMGn2pVok+Zooa2sfBf9l9JryBPjbPiMj6euGHlT7cpGuGydH6fveMOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9517

On 27.07.2023 13:07, Daniel P. Smith wrote:
> 
> 
> On 7/27/23 03:56, Jan Beulich wrote:
>> On 26.07.2023 16:01, Roger Pau Monne wrote:
>>> Just like it's done for the XEN_DOMCTL_memory_mapping hypercall, add
>>> the permissions checks to vPCI map_range(), which is used to map the
>>> BARs into the domain p2m.
>>>
>>> Adding those checks requires that for x86 PVH hardware domain builder
>>> the permissions are set before initializing the IOMMU, or else
>>> attempts to initialize vPCI done as part of IOMMU device setup will
>>> fail due to missing permissions to create the BAR mappings.
>>>
>>> While moving the call to dom0_setup_permissions() convert the panic()
>>> used for error handling to a printk, the caller will already panic if
>>> required.
>>>
>>> Fixes: 9c244fdef7e7 ('vpci: add header handlers')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I've committed this, but despite the Fixes: tag I'm not sure this
>> wants backporting. Thoughts?
> 
>  From a cursory review thus far, since this introduced a new XSM hook 
> site, shouldn't this have at least had an Rb by an XSM 
> reviewer/maintainer?

Probably, but already back then I said this model isn't going to work
flawlessly.

> I would have replied sooner, but have been on holiday for last two weeks.

I guess there was no way for us to know without you sending a note to
private@ (which, I will admit, you may not even have been aware of).

Jan

