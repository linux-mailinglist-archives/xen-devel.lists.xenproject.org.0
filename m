Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97775C9DF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 16:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567577.886831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMr3b-0002Pv-S3; Fri, 21 Jul 2023 14:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567577.886831; Fri, 21 Jul 2023 14:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMr3b-0002O0-On; Fri, 21 Jul 2023 14:24:35 +0000
Received: by outflank-mailman (input) for mailman id 567577;
 Fri, 21 Jul 2023 14:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMr3a-0002Nu-3m
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 14:24:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eee65cd-27d2-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 16:24:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9778.eurprd04.prod.outlook.com (2603:10a6:150:110::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 14:24:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 14:24:29 +0000
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
X-Inumbo-ID: 4eee65cd-27d2-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdDKkaYMTSiYuOm/17RdPNTeAETc5rBjlbCKnss4TTR91Ai1ErQAwedEOGO51qz2Rhb1Z08MbmpejuX7AxJ2Ttc9oGjKEwDAILVaqZiSuWeZPanG0aOA7boH2FHrn5t3fiFKElfpOcMpflonE41yvMhYEtOuE/7Lcu0G1DpyjtR82UttCRBulw6wMClrnoTbN3OzOygn/SgMNk5zQAMG7Mt7eKSuRzB8ChHvaRQ4/RxYilWnDMAl2qvqU8ILe8EbX7zxgFyS0WS8WoL1kUnhNSd+PGlbAHsqy4DLY0DlkCVxsTn25CQMCHfGExHwxKm+hNcPwftDJx8vdcN1fw+nGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upfyQASg5GCgFNr8NCwv5iw6jg70UGhBI6DsBqE85rQ=;
 b=hKa/AaRTCqxWg3rNuI80wpFjptkcs6BIeDg51oQPEOITSBVbVduKCjYPiaLsdAL9FhUGLQ2Ty+jc6FVRGIo7/eRcqUvH4elQRVTGb3UVL30GCoSFxIyd2oKUtLLWx1toS/uLafFTGx9iaj/T27EfwGLJMIy+Aa7DXrFq8bUU6XTamy3c2ppyQ+diIXmgUjStnGZJkpjmZnfpmGWGMBgpZxWR0WZ49R6l0hybQJpYEPF32QvyU/xSUYuLdJOoG1vLiqn3X9pk8FKWJ/Ua8826fLAWSrQc9J0jxmgdQQwOhSt5UviWktYu7iNTF0V4yiwnhq+pcKHUZi57Os1QATfycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upfyQASg5GCgFNr8NCwv5iw6jg70UGhBI6DsBqE85rQ=;
 b=o3y75To93Ng552GpUsO9HTR2XWk/eFoFB+suj+MZnroCxYQJwMMGldeG/YnRHjJOLOzD/buOQhgEPedURZBvxzB2Ue+WKiW3EvBY9CpzISuU9ksyyUB0FciKdapBL0bOOsg7wjg3337IEINS611AdSYh8ZQtiZ91CFL5ALeMAzXiYLkVqulojRzsgtgRJ9kGUYzal0t6vQaLv8OCAO98l3WXahtF2rNZXbibTW1iCfaLT8UEpSY7hjyU3YsPvkfba0qIdZh8jm8HThq+SlE1x5F8DIJS9Aocgh9IWS8IbHuPcLY0YD85phprc16jPanwz306iHCW8NeY4haVJkvcHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc1bffbe-c5ce-ba05-ad01-22bb1ff983b7@suse.com>
Date: Fri, 21 Jul 2023 16:24:27 +0200
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
 <6b24847c-5cd2-877a-bc72-16bb732e0ca2@suse.com>
 <C63A942A-AC5D-46CD-81B3-50B6376860E7@arm.com>
 <47ab1431-6a0b-6e74-92ec-8495c6bf8fbd@suse.com>
 <8ABBDFFB-AE3C-4A8F-8AAA-F0C5EB99C2C3@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8ABBDFFB-AE3C-4A8F-8AAA-F0C5EB99C2C3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9778:EE_
X-MS-Office365-Filtering-Correlation-Id: 02adf2c4-6618-4e7e-3e4b-08db89f631e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RI1hDa3b3Dx11C5yLP5HTm10+wk8XUihbQjrZjbV+RpcLvN4hX2oxov+ZO5y1Hh3y5tNQxfBkqTC3YkXeK8xBkxvo/n8ZCdNj0R++ei82BlMtagA0s3r2IAI9WALIqGZaJuhrML0e1nQrptQ/MJ25xJcD7wv3SqvgFxQPNcTSPXum/1SGFdS7H1jX7xr69q1BunHa5owkC0SBEpLjEH7tURjBBnHM4kbl0sk2t8uVh8FtRpR/gLmuBgs0yWvFcbhae24+0oJG64FI01N2irOfiLxEMX3XDkAzMnFMfeouuN9Ifa/ihBN3wgN11qfJvuOQ5zGQtCPmYvyyw6dcjiIbDLndLJwmRCmybW8FPIX0P34c26w1UCmcLTbuP6YN+b8rZjDJ6MqROivP+zvOxgrUYrPvrEtbUefQeOCPKm2lupAo9VjwyFFZ95u45kDvR9XP4Xw0Z+AZeIx5q+Qb3+qJSvBhELTkawRs393BuMR4r15zJ4MNXhdRoT2F75rWPYK6tSx0MlJeF8n9FnSv+shItfG4/95Nfurk/7AJAYT791RkGE0/+CXQ1uxzxcTx/SZ9zcZzomyFo9duHP/q0y2Ir4dk7at0FG7Ksq8xOObWqQtNKs4RltCMXWt9Kf+bSQFfm9gFxau5fnPPZQw7OzEyOyqv8ns2CjcQZDoVte8doUTAMJv7nHS8ZMqK2MVh0ij
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199021)(2906002)(54906003)(478600001)(41300700001)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(4326008)(31696002)(6916009)(316002)(26005)(31686004)(2616005)(86362001)(36756003)(186003)(6506007)(53546011)(83380400001)(6486002)(6512007)(38100700002)(76704002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXgvTTNqQkxBNDNtRzUxQTAwT1JGZjFmbk1FQWFGVVJIUEZmZTZoSk11aDVC?=
 =?utf-8?B?Z3lmVE1YclpXUlpacEV1RmF4cjZtN0dBRE9vVWVjaVJGNDROZGh1VnlHMDJm?=
 =?utf-8?B?Y084Q0hkblM3MlRqaWFNMkZiWVNYNzI5ejJza2t6UTAvaUdWZDNGTy8zRWY5?=
 =?utf-8?B?c09JdFlYMUQ1SjU4cGcwcDhna3hGUGZMMDhJQUFjd25EUnZLVG9qekZya0NR?=
 =?utf-8?B?bWp0M0JnVnY3c2ZmZHZaTDJSUjFYZ3RqdlJ5TVN5K1J5T1NQS1V1cWhrVHNZ?=
 =?utf-8?B?Vjh6dC9wVEpCaFpqZTI1ZEw5aEc3UlhWbVp3cWIwZDFCQ3hQZVV1TEUrd2FF?=
 =?utf-8?B?YW9KM2w2MVlnK2REemQ3a3dHQnVVUTlCYndNVXI1TGhPTmVwbGtLTEYzZCtH?=
 =?utf-8?B?eTlBRDJBVzlwOVJNSjVKb00vUHBiS3lTd2VWNzBlU2tldjk5YU1Vd2U3aUI3?=
 =?utf-8?B?MFdQbGgrMTZBdEFqVHY1U2U3R0oxNDBSaC9uMGJka1ZqdzNXMW5GeG0vanlB?=
 =?utf-8?B?VFhrY0lFNDIzSE00OHp4dFlzbUFRcFpVayt6TkpjenpBYjdxZmFpbDNlL29t?=
 =?utf-8?B?QnV3bjBKd0hWeTVlUUZJZmdNWGZnVzUxMmZuK2ZMUnhXakhtZHBQalZDR1Yv?=
 =?utf-8?B?d3hTSEtJUHJSMXhXVHJOVTRIVFUxSzVNMjFoRC9oZzJLeVQrbExvb1VYZ2Yz?=
 =?utf-8?B?SjBPaGpNclB1Y2EwL1NvOUF2b01ycGxNb1A0RWNmVndqZzhWZjNVU1VTZTBt?=
 =?utf-8?B?alc5THVUaXNFRlAwQVYvYm0xcXRIb05DZzVoK0kxa0ZpZENldmh5bnJaZ1ln?=
 =?utf-8?B?cjN0dXJWWUhmYmt3anllNm94czA4UXNyeXI0TUhvS1ZNUHA2d3RLNlpjSVBQ?=
 =?utf-8?B?djgxdkVyVkdpc0d4ekpVUVZ1bzZmNFlVbWNOdElwb1czR0NpS09wZG9nY2dl?=
 =?utf-8?B?cndFc3loUUhESUJFaWxhbVdhd3F1dWU5UHExSzRrcnJNWWtoc0FZU3crV3RH?=
 =?utf-8?B?VGtwMXFmc3hZNnhROS9LL0wvdUd1Q21xclJyNDVtVlBiU245MGs3REp2Q0Iw?=
 =?utf-8?B?cVZCUHlBSWc3VTErMlI0ZVQ4dWFFbEIzYVcxeVh0U0p3ZTYrSStTUnlDRjZL?=
 =?utf-8?B?YUEwaVFJM3FTK05HU2g2OGFLZmlHRnVSeE4rQWpEblpLd1lrTVp6S05Pc2Uy?=
 =?utf-8?B?REt3ZnFvQWdhUG1TZEcyZEgvK1pBVTFmemtaOHEycDJLTXFtRVUvbjBZTENn?=
 =?utf-8?B?MW0wclVkSG5HWDFibzFEcjN3VkRXbmJTWFdZZnJMRnE3cHB5M2RxbS9uT0E2?=
 =?utf-8?B?SFVRNU85MENEZk1FRHJQYzRxVzI5ZUhuS0ZLZUR4VlZYbVRpL2c2SWpIb1JI?=
 =?utf-8?B?czJrT011Uk1IT001Y3RsZzg1Wk1wRC8ydjg4cEdtVWk4ZmJ2NFY4YTdaMExT?=
 =?utf-8?B?My9XYzJ6RG9QOGN5MGc4UlQwUnNwcWx5cW5EVUFuNnF4cjRJMEVJRmJrRVNG?=
 =?utf-8?B?K21TMUxnd0hSQkZFYnJOUXUwRDY0ZHdCa0JaS08xTGtlYzNmZ3FlWkIvZVRi?=
 =?utf-8?B?SGl3b1d4MkNoUmNGdkdDTXFLTzdudWtscmlXTU0xcHFMUGFseUMrb1RHa0t3?=
 =?utf-8?B?alJKcWJYb3VzRHFLRzQrM3Z3RVBoWnFVMFpWaWRoQitLMHk1RlRZNzhHaHVS?=
 =?utf-8?B?WjB1Ynl2Q0hGVElOT29VMVlCQS9ETDU3WEJaTzJBK05QM1hlOCtHQ0JJcjhS?=
 =?utf-8?B?ZndjV1M5cFkvNkZYaXNseUNtTGJ5ZVRwRnZHQU9YZThqakc4VWM0UUpRZFNX?=
 =?utf-8?B?RzBpQVo4OVZvZDgzS1hpTWY4UW9jbFd2RnQweEtMOHU2eFdlZk1nbDhtQlR5?=
 =?utf-8?B?dzE3VnZIZGZuek1tdFc1SWIyK1E5YkgzV0dqZDVSaHdnVjQ5WWpURXlMcWgr?=
 =?utf-8?B?eFprWjZSaGV0MlgyU2JlVFBjcE5VL1UyenlvQ1pBVVM4M0JoeCtROENqaDh6?=
 =?utf-8?B?MEk0VVhvREJXR3BwckJRdW1TckhxT1lyYzJMeUhpSGQwWnJtK0Vwb29BME9G?=
 =?utf-8?B?K3UrN2U2Vk1nMkFUdFV3VEF0RXFWd2ZSbUNOVHE2UnA5dnBZdFM3Vk81eTBl?=
 =?utf-8?Q?BQc2eBp2U0/LkYZMVnQzBP4Cf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02adf2c4-6618-4e7e-3e4b-08db89f631e2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 14:24:29.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oC/zTumzC9RrjK+uQLJcZomXZHlgy0cxSrKtPJr8pIjmP3lMO5mGlZPUZZnC4k61EWJ8pqzWT9s98LYHYbl8WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9778

On 21.07.2023 16:07, Bertrand Marquis wrote:
>> On 21 Jul 2023, at 15:08, Jan Beulich <jbeulich@suse.com> wrote:
>> On 21.07.2023 14:27, Bertrand Marquis wrote:
>>> So what should i keep or remove here ?
>>
>> My understanding so far was that "visibility" merely hides all prompts
>> underneath (but then I use the command line version of the tool, not
>> menuconfig), so it largely is shorthand for adding "if" to all enclosed
>> prompts. Therefore I think all the "if UNSUPPORTED" are redundant and
>> could be dropped. But then I'm also working from the understanding that
>> "depends on" would behave somewhat differently ...
> 
> If that is ok with you I would rather keep them so that making one of them
> SUPPORTED one day will not end up in wrongly making the other one
> supported to. The visible if i added was more to "beautify" a bit when
> unsupported is not selected so that we do not have an empty menu.

You're the maintainer, so you judge what is best. If I was maintainer, the
primary thing I would ask for is that there be no redundancy. IOW here
either no "if"s or no "visibility".

Jan

