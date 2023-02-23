Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B26A064A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500181.771434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8sY-0006x8-32; Thu, 23 Feb 2023 10:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500181.771434; Thu, 23 Feb 2023 10:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8sY-0006uQ-06; Thu, 23 Feb 2023 10:31:10 +0000
Received: by outflank-mailman (input) for mailman id 500181;
 Thu, 23 Feb 2023 10:31:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV8sW-0006uD-KN
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:31:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d1c8c23-b365-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 11:31:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8556.eurprd04.prod.outlook.com (2603:10a6:20b:437::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.18; Thu, 23 Feb
 2023 10:31:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:31:02 +0000
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
X-Inumbo-ID: 2d1c8c23-b365-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdFyn7drBbHhae6jmm4gv1xrm0CXeahxykpx4JFhBNr37ypmN4CjYWKCrYMX+p0cbVy6anLQ0k8BkJXh/iVyBZ1tLisVC1KiMdFHVXjnY5+OL2U8uBS7zOonhEALTH8aIwAuLA9UZYLwcvoiDJ9AVz6aArybOqHhl7rgPIft6KjDEn5LffKUSXPoe11Uas/0guw1DRPiQ1gkq+1DESkwLzHEi/+zOzZdFpmLOyDRuVqx0dJ7AxAV7JJWXn8Mf3wm6fv+vJ5NOfmHq0DA5nGAj8ZMhVRVDvHvtRxfcssCFVVcPMoFLkR0Zq26QAEhXeBZ6EBRF9ZisNR0Id9hdpXytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54tPx6PjpYUwtXOVx80Ls7MuNHjt38yEyunEVuS71PU=;
 b=NNkTZesxp9qlrQqkYeui9g7k2o1OmfJkWu3lbKUQaRu3lnR5oqYG6lyO00rgZ9c3f2LMITgCkgvlF6aJOJjLt4RFvZUddgo3C9Rz5CDr58MouQdnJtRFIso9o9e8j113G1sgiuoraKMEeiP/4PCNTVeG+ElnA5bSfXxvAsgqdi6Yngv289mvCpdV3HMO8N+5NabmGXVFVlxINf4EweY2Vhgc8esa2trl2Q5SVtqMKQcmWYkmwQa9q0dJ86JA7Rd0Fr+4n6bCtL/NtWuBRM3TstJL0lAJjude7lqtG7MFd3UCgoR9VrE+NNRHelG4sxGzReitOOyS4jrQtAJrqsarow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54tPx6PjpYUwtXOVx80Ls7MuNHjt38yEyunEVuS71PU=;
 b=mT3/FJXBEM6bKNr885av2DlFGx25yPhqoJiuAq1KAnrUe9Eo+y7dP50N9XZEAP9v00nC+flfU2uDr5gvDKWK26RcQ6s9esqVBHcV0lqCCxemUK8XAnx61Th0SLqij6+cEHFojYAxmO+yMKHs7/mTgS8qnNuwsy7UMzOliSeZ1SkwhDqTBRcJdZz1OvIkk4TNDm+SYvIiJpltpoXRYONPUBEkE4NBDHLWTFqLfcZ8xtlGfvBPmoF7lplZ8+T4BgRo77DdA8696DjcL7WZ6RH9JiGUm+1Hwy9ltGgne5Z/6DHTnuIiZh/uwubbKUWTyFLjUEsEeSu4p+4yYYolCa6HoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9841c7d-c9aa-7754-1a90-4a069c94f3c2@suse.com>
Date: Thu, 23 Feb 2023 11:31:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/9] x86/vmx: reduce scope of GAS_VMX_OP definition
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-6-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-6-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: e06cf2f9-17c6-422c-b213-08db15890fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PzA3w+IKYQf5zxbabqyy4mLkvCPLJDlZmzn6s9zSNPK1g++s9YNHgbd/j5FIChE6PbdeVy2p93WQmC5iTFtfb04bbUar8YxjRc7qSHv4GltiJlab9MihuhBUJ6kGTrY1mJlUEyvcvNUroL9qHlYolKK/56iI+bWDI6C/HPBe389K7quggyPiKXMC/jpW66MG/FxQabsjI7suBShm8EgiCpdqSnDeUA2uoPvIP1o+W/78Oy0M7hLTgM4ugJLrf2nG6zzQcDFo5NpR85b/wZtE3LkfL5siv+jKLp6vjiwD0plovwpE49Lkw5Dw+WxY2ZhyLJoiwZ2FZgSDyRrcJMkJOMh/SKTizcNcUFILw18a9mO3ORCoNKQysog/kT0YEMSRTREx8L/XnfyYiy9+HmGKjypKgik58O0UAEbuhsInwXjGDD1cNbBcMqTObTx1gZwFVSGAumR8cDNNAJ/EUAKANq3nQXgn4+k9KEoJklQG9STC8xRI5b1dKTYtwLZaD8T9UhcZ19G7qhMQtsmlONekPJIhNMNW9/0TnUxVR0Fxd4iJVzibLS0yuIQaw4fJt/iH5lD5HR5t0frrw4LHROGjEvjwYf2cm73x/uar7LUr4rLg5oDm3iv0YKpsmmC0EP+ru/6+xglAmkrlWoyziuiSiXlzDeOPbooTHaE3JDk2IJA1wnu0Mu0raUgBgNcXFk2sJ8RcHYTFX8VJl1+jSewxzavaR7SqV1ZHw5smTqeR9WE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199018)(86362001)(31696002)(66946007)(8676002)(36756003)(6512007)(8936002)(26005)(41300700001)(66476007)(53546011)(6916009)(2616005)(6506007)(186003)(66556008)(54906003)(4326008)(6486002)(478600001)(38100700002)(2906002)(4744005)(5660300002)(83380400001)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1k2NTRZUDE5MEtDT1N3WGhCQnZuRmw1U05Lb2ZNMXRaWU13cnkwV0Vkby90?=
 =?utf-8?B?MkVzVnIvcFl0Zll1d2tVd3hTbWhObmg0NTdvcmdTd1VYd041WDIwS0Nxa0hX?=
 =?utf-8?B?Nk10NHpkMHZaUnMzWEhtb2NJVjZWNi93aDNYemhibUlVMC94OWF1R1ZnU05n?=
 =?utf-8?B?aG1POXNRNEtkRDh5MGswQnpDeXVJcnYzN1NGcm1pczd1bHVNcUhuRVpIanlP?=
 =?utf-8?B?RFpGRjdRNTExN3VvWVdCTE1zSXhnMks5THpmWjlOWjNLVEJ2WWNKNURiSHNp?=
 =?utf-8?B?ZlhMc05OYkN3eFBKb1p5VXB5OE1zQWU4eGc2c3dINytaUi9pQjlxSDk0NHVq?=
 =?utf-8?B?MU5kUUZXczhyZFZqU1piS2Rjd3I3V2NIcEZvS0pTYjU0TFFtaERBd014eWNR?=
 =?utf-8?B?b09JUFRNVEVpQWdvNlhUQ3JFaTNCYi9LcXFrWTRCbE9zeFFUR0xEQ1dLbEdm?=
 =?utf-8?B?cDl5YkY2VG1LemY1RS9ISll3UWhtN3hwSTByWkJ6SHpIZEpmL2JIdnhRWWRu?=
 =?utf-8?B?T1FQRFpFZUdTVS9SVWVnaWF1ZXAyQ3RoMnJVZS9LSjc5ZVBFRE1lZnVPRkJu?=
 =?utf-8?B?dzUxUHBOVkhWWVZnY08yTEd6OWcxSTYzUnYyUU1Xb053ejNMcU9Iem1ZdnV2?=
 =?utf-8?B?NzdvVmNsZjNIYXVsSnkrejFuY21DRE9wS0NsRnZ4bmN6ZWVmUHdUc3I4a2l2?=
 =?utf-8?B?M29OOVZjbTlSdFhUSUYzb3hjcG5acGhDVUIzb2ZvbGwrdE1nandkRHprZUcz?=
 =?utf-8?B?VzlLUnlqdXJKNENJSXRqZkkyT2Z6SW5SeUlNSzVTV04rWUlkS3N2Ykt6MU1H?=
 =?utf-8?B?aCsxcm11Ly9hKzhiODF2VDV3NGdQei82RWJJQm1UNDkvUXduSDNFNWlabUR6?=
 =?utf-8?B?bncrbHJVODBlaW5qdlpXd2FxVHVHVXUydjBNbnppeWF2UWdWOXJUdHQ0aDNs?=
 =?utf-8?B?THl0MmxVTjJzZlJrU3RJeXB0Ky9mSkF3cEFNU2EwQkdMeGJ2cExlUTdZdUlX?=
 =?utf-8?B?Wnc5ZlFXTVZHdTl3YVhNRGI2V1crSjkrc3BGbmVRc3lpTFMxUjFWSGRPRW05?=
 =?utf-8?B?QUNuYlgvdm5PZDd6WUluM0J3T3dIbkI0Z2pGL1hNRkFzTXBaa0pVdWpVWkxR?=
 =?utf-8?B?azRWLzhsaklhbG5rTkNEM2RGUGJWRElJS1VLc3NpWGRwcElQeExsTVhUUGJ1?=
 =?utf-8?B?Tis4dDY4MldpbXNBMzZKZ3V2aGRVN0hQVUNDcEpORmhjayt0THlqRjBnTWZP?=
 =?utf-8?B?YVlrRFZHZ2w3dDBVc3dHRklCQVdUSXNoeG9FQlowbFBLZUR1dGZUSGRid2Mw?=
 =?utf-8?B?TkVFdEMvV0x3Wkc1V25tVnhUUi9TcjlJc2RrTS85YWdBUTVQRERCaWtGTXJX?=
 =?utf-8?B?RGh2RFRZMEdQU0JqaWM0eExpdTVYbjkybkhtN3VHSUlGUXcrdHEvL2N6MXVl?=
 =?utf-8?B?bWhQL2xMNUViQytwdUI0dnVKYkRXaGZFZ0ZrbSt3TU12U1cwWW1QUzVuSm1B?=
 =?utf-8?B?cUlnZjBJK0FTNWtOc3c1VWtlTEhpTVV1a1N6MVBINjJGT3EvZnVYT3pHS3A0?=
 =?utf-8?B?OTdRMGViYVdTS0NPUmdScHlWOTNlK21FZnZ6SU9obk1PYll5OTZJT0VuZVhN?=
 =?utf-8?B?SjZsM1IvaTU1R1BJcWtoT1FpSGp4NmxaaUVBVGdXOHlvT2dzcExJM2FSakpt?=
 =?utf-8?B?Q1kwYmhZZ1I3Y0hUMlBoOStpZFoyZlgxc1k3N0NWTXpUZDl0bmc4UzVaZTBO?=
 =?utf-8?B?QmJtb25OL2t4dmgxQm9hUUxuS2tYRjdjOWtNTDBiV052QjBMbC8yYnpObWF4?=
 =?utf-8?B?Z1dSaXZUMjcrTmxMbGFDL2V2NFRQSFJvRE1TUEZtcjZrMnAvSDJMYVlyc1dJ?=
 =?utf-8?B?amVqS01hY2xtb2RRUUloN1FzeHZjSFMzNURISnlNVER3NlIwRmZMQTRYclpP?=
 =?utf-8?B?ODdDMU82NzR6UFVXbnVMeGhQTXN2ZVYwZUd5L2ZlNFpGem1scHFyNjhTSUJP?=
 =?utf-8?B?bmV1L2FuL2JvOWFsVERxYkpsYitEUDVFQ0xkb3QzR0paR3RTVUJzKy9idElN?=
 =?utf-8?B?QWJ3dVRHaDQrVW5YV0J2OVpCeWJXUlNmVU52YXJtOVl1UDRWazF5QkE5Vi80?=
 =?utf-8?Q?A5vX1dmGAP3MzUe7BFtf2nYqR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06cf2f9-17c6-422c-b213-08db15890fd2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:31:02.5101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AP9Up/i8Fc/6tUceM4QvTvfOoBeHSWvEucycz2XkSRmEi4xO9ybUqhS+2Swt6SM0Tc+ne8dJuhX0t811FnCjUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8556

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> Since GAS_VMX_OP is used only by vm{read,write}_safe, move its definition
> just above those functions and undefine it after use.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

This can easily be done as part of the next patch, with less code churn
overall.

Jan

