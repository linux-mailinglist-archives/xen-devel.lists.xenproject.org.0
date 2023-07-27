Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA64D764882
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570798.892941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvLM-0006Eg-E9; Thu, 27 Jul 2023 07:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570798.892941; Thu, 27 Jul 2023 07:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvLM-0006CG-BR; Thu, 27 Jul 2023 07:23:28 +0000
Received: by outflank-mailman (input) for mailman id 570798;
 Thu, 27 Jul 2023 07:23:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvLK-0006CA-Jc
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:23:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78c11b46-2c4e-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 09:23:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9815.eurprd04.prod.outlook.com (2603:10a6:102:381::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:22:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:22:54 +0000
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
X-Inumbo-ID: 78c11b46-2c4e-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y06UicKAxexGybne+xN5TTm0Kdy8R7BCfk/hahTmj9ml1+KsqsEzn5AD3bNSazWkv7dHWzDOt0R5+FoWWq8wJELVH3GxILBFoVaSulkvM518Mxg4jRdPZ+7O6ezEh0ZQSKOJqjCw6hZn57rpPW5zkOYvF7iTmRLm1IPG8vbePjd5npnZqbCxf4lzS+BOx3bJOqU9rtVJhiEgtNIzWzKsKG3RysDrjOJJamGJIeIeg9xXv5yR3CzzArF6ANr31h4mZ3+KNlNaqJfPGNzsWvRe23SxHc3KuaCBviAcOfs2CCpivEaP7p1asTNOJJeVV4hijNQImxtMepHD2AMkiVQWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajb5dH+/30TDlvLOwU6kzYci+WIhf1DmlNaqP1u90xE=;
 b=PV5Jd62DfAtzCdmInoFqz7jJyYafa69f/LP90BTWehnOpDe0K4GP1HwU8ygnnpCis8kzYnGJoBOgkenB2/K2lQOT5eDP+oMIjk9Re0kmEEYgnIfzL+jLTPCmWL+S2SQi1URcpkE0Fu2MCJHi4Msq/1zbCLI1mgUtkZgou00QZTvgtLRpV0O2SRFPh0NH/s/DJI7aoEXzOpnqkkwAVEGV27vkOBx5Yxb8cgejpIrp1aFwiqsLbw7LUxO8El272va7pmtJ1u99DQyUncyguvKEajecimmbTzbrSNcKRiGvCYjJsOvUqRYfjwe9WejNoTuA9942G4kqWXMCxf+uBA687Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajb5dH+/30TDlvLOwU6kzYci+WIhf1DmlNaqP1u90xE=;
 b=tdsuBuQD4oTqRCi3chy4Ms+7EKZlyO2J08IrFev61NQIBkTtYFFzM3AxcQvfgD12fGhkJ5QaxIDiuxKuz7lhe/A2NbJ+5nopuCtBvf76LsGJ2M6NfLSGu45dCSXIJMK4NUjmhLns+XJpJhN3l9ycw16meABhz0v4LTldFZEXatpkvsxpZAiB5tdUu6Pkr8x9cPywdIbe6JI05bHUNkPnkv800IIJReDMQrTLElF5rkSFH3N7ojI9lOVsRbXVYPCdWQp685KG6Oljf2wsDBhIPEStWKVDQ2fWX1Fe6jjnBHSIWOCktw+Zw5GmMd1GitM17UpZFwqQBYQ/0aAi5OThNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d099b736-22cf-0502-df37-9ae7b14d048a@suse.com>
Date: Thu, 27 Jul 2023 09:22:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com>
 <11a3ae18-508b-cf08-2803-bc4aaeec7353@suse.com>
 <f424fc5b-6266-3d04-b494-0448fa453b75@bugseng.com>
 <8914bf47-c4ca-4a14-6a92-b5b23ee739a0@suse.com>
 <alpine.DEB.2.22.394.2307261448010.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307261448010.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f62e58-79f4-40c1-67bf-08db8e724b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U0/iYOoH3+swTB/LHO/PFfBKFjTdj1Twtw8O2tcPj8wpLdWSHbs7tQzVZEqbtNbcmtOeHdmAIcLnd1tf1rBrB1NwunEWBXgkcxZpwHWgr7pgYPztiNiurwEDJJ5RwBcJnvDriZxYTbWQkwIRxt2RGQaeNFPI7gxA86k4M0e+Bvhc62YrQhRVsfCzcNg9B4PKw0QPUgNliHbfZ+tjshy9Zl5NbWwvuFSENATly05GMAgqLIbF1mhZsUMc65rq5UaEx/hapzl0Wr9gNeaCkoqe5C4kOLrUDdZ8yGq6mYgdZCNr9xsi6fH0y7zWme4VsSoKBqFhmpyEWPpVJJd6tQBexKGtFwfjWRDrdE9kEh8+2P+dLSSmJkCni18TOgBIOZA6wX4S9A2aV8Tt+CX866DAV2wJ3K9V84FwJfx7wfkY+suuYWxObQpjCgCrDf9pUeOB155TkZNeObtSZLrOevNLRaBKmFfN2or0FRfvHsbE+zFYkqJlKgnVYiwSKLK98810uo9bj3kRm/PzUdqiCTwR+BgC1sch9XETu1iQ0KHg8VuDiMDa+mYATrRzDWvtGN57hRDM7lFEijBVSIg0JvYrab4U9lkulFuPDR0YjpixRc6kHTlL8qASmXymKt0GW9JZxyDzBQKTA13qD5clQQlBfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(478600001)(54906003)(6512007)(6666004)(6486002)(2616005)(186003)(26005)(53546011)(6506007)(2906002)(66476007)(66556008)(6916009)(316002)(66946007)(4326008)(7416002)(5660300002)(8936002)(8676002)(41300700001)(38100700002)(31696002)(36756003)(86362001)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmR4VFQ5N2NhTFllS3VXWlp0dXRNbnQ1cnh2MklFUXh6Y2dCS2h0QUMzQ1N4?=
 =?utf-8?B?bkRPTTk5WFRxWEpiOHlFbVJ1YXY0NEtHSXlIbjNTc3RpMFZDNmp5eW9LWkFn?=
 =?utf-8?B?cFVkRFVNWXd4UnF2ZEtCZGZxSkVMSFB3M1dJUGcyNUlwaTFMejF2aHIvUGdh?=
 =?utf-8?B?dC9zOXo2MTdVRHVWQWV6WGxqQm9XVGMyUUkzZ01lS0dtZWg0dXcyQmVzUVc4?=
 =?utf-8?B?MEZqNTdVS1BRTVlaNk9wdWY0a3dtUWwrazZobWRZSmMzUlNEUzFhOThKaEJM?=
 =?utf-8?B?Z2JreUtXcnZIN1ZKZCsxZnF3TmRGdWFJT0xtaExNRVlsS1dmVUxGZGs5VGJV?=
 =?utf-8?B?by9LWDl4eGhUYlFTbUx3TFIrQTRPZy95VzlsOWFkMWFsYkVoWE5MMHZBbzBN?=
 =?utf-8?B?WnhIdlp0TGZmbUMyV0xkalhNZ21nR0hOUzhVUDh3a3dnNjVETWdNemtaQVRr?=
 =?utf-8?B?eksrWWUwdkVKbzVzUkwrUFdXWVNpVExIaXVsZW1SY0F0YnZxYm9JWTY4LzRT?=
 =?utf-8?B?L2VFK3ZpUDVuamJ6OGRCclNBMHNDNUpWbTJ4aGlEQjQ1Ny8yZnd6bll3cFFT?=
 =?utf-8?B?ZHdIZ1ltWGhJbHVBTHBqcHpESHZmMk16S2RUZVZLZURJUkJxTGJnZkM0KzJB?=
 =?utf-8?B?QlpBcGxZS3JHYWpmaDBRQWJFd2h5cVdCeUE1eEFnVzFHeW1INVBGZDdKbG1Q?=
 =?utf-8?B?ZlRyZHc0aGgvbzYrZHVLa01mazBpT3owejlkL0tZc1YwdSt2S05HTG1jckxB?=
 =?utf-8?B?ZGoxYnVpL2tYdjRONHl0Q01BYm40MlRXSG40Rk9YSlFUUGhsS3VMdzM5Mjkr?=
 =?utf-8?B?SGo4YlVNVnRCcittNmc0N0VPVW8zNFpBdGo3cDVNN1VxQ3NpSjlyd1V1VVg3?=
 =?utf-8?B?elBMcVRhdjZoNzNVOU1lS3hBdFk5TEg1cW42VmhmTllPUEtNMVFiV2NraUxX?=
 =?utf-8?B?dlRFSVp0TGh3d2M1RzdVZDJtUnM4cldqd2JxVUtmekdNalFRWGd4cTJBRUJr?=
 =?utf-8?B?L2czZFl6Sk5ac0hzNjVXV0xzOUFLRmNFemlUV21VbEhSQ0EwR3MrQjJiM3lU?=
 =?utf-8?B?elhQWDR3aWtDMTZ1ZW5uUGEzWU83Wjl3NDBIeTVwbXozN1J1ckxKNXRtZU8w?=
 =?utf-8?B?MU1HenNpamIxMkJNVFErY0hrSGRJNzl3YnAxQmxzN1BIWlpiZUZpcDI4M0xK?=
 =?utf-8?B?UFBrNklrU2FyMTJhNk4rNlRPLzIzQ3RuL2NJSkFuRDJ0bElGQUNMa2h4a1lE?=
 =?utf-8?B?WFgzN2dTMHg0aWdTa3dWZjFEbmQ0cjlrYkhobis0anVBUWZMOGNtNU5nQlEy?=
 =?utf-8?B?bjloL3Q0WUJzM200ZUxGNmlwdDRoVS9IVzZLT2JUSmRoTmxCZTdadXg1MlVr?=
 =?utf-8?B?UHVBM25QOXdIREpUZ1ZHczREdUZvNzU4aXFMZzZNNy8zZUc1dy9MRjNKL1R6?=
 =?utf-8?B?V2xjVEt4R3dGVmJqSnNtaWRvUk5FWGlKb2ZVZXFnaXJWbi9kM0xpWWFGVzFP?=
 =?utf-8?B?QTE3WmhXSkZRNngyUkw5alBVdDdWRGxIdDIwUDMxY3lZZ0dyMU5nZ2xhQWFx?=
 =?utf-8?B?T2RBM0s4UVZQdFlzcytpRTVURDZwOCtTVk0vVXdYVytrVU5HVDBaUXhnR25F?=
 =?utf-8?B?NjZnRVB1QjMyWnVRZElLdmU3dldoaFE3eWFUTFJiR05aMTB4d1FwUTExVGRO?=
 =?utf-8?B?QVJKVlZuY3RZT1NEWFFKWDNwcmY5TkE2TVBneEVvN1d1OUtHemx0SzYvYUxW?=
 =?utf-8?B?WnQ5bWJ0QkFWNVJxSWtmZXkxSld4dldnbjExYndBT0NNWlk3YUR0ZjZEeGVZ?=
 =?utf-8?B?czQ0cndKNDJYbHVhZXFCZmRVdVlpbTNXckRIZUJsMkNjbS8zellZZlMwUHJF?=
 =?utf-8?B?S1NCKzdrenJNU1JKTEMwQ2FmLzROYXJ1eStIUzROZjNkb25XeUkzWWNIcEVa?=
 =?utf-8?B?UHBSck0yeUdWRnVueVVsMUh5QzVxb1lwR2tHQ1JLRWFzak9rMFE2L0hWaDhi?=
 =?utf-8?B?WHpBN283aUtURlZGcjFTYUF5b3hhaEhhUHlMMGhXSVBzZXdjcXdwdy90cWVQ?=
 =?utf-8?B?TzJyMS9HVjNBVVVGSXVqVVU1T1piZGFpOXk5WTE4M0pTUzRFdjllNXFtbU80?=
 =?utf-8?Q?+NoVO7Bc4+TN4JahmqBNDMd2J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f62e58-79f4-40c1-67bf-08db8e724b02
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:22:54.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmC30+D0oLpfGU/JN7bgwRlM1zziFz4NSB4dX+A4eItvO46CljGsicRrqDFD7SC0aXSVXhlvK8EYLJt9uPpnmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9815

On 26.07.2023 23:49, Stefano Stabellini wrote:
> On Wed, 26 Jul 2023, Jan Beulich wrote:
>> On 26.07.2023 08:42, Nicola Vetrini wrote:
>>> On 26/07/23 08:34, Jan Beulich wrote:
>>>> On 25.07.2023 22:45, Nicola Vetrini wrote:
>>>>> Rule 5.3 has the following headline:
>>>>> "An identifier declared in an inner scope shall not hide an
>>>>> identifier declared in an outer scope"
>>>>>
>>>>> To avoid any confusion resulting from the parameter 'debug'
>>>>> hiding the homonymous function declared at
>>>>> 'xen/arch/x86/include/asm/processor.h:428'
>>>>> the rename of parameters s/debug/lkdbg/ is performed.
>>>>>
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - s/dbg/lkdbg/
>>>>> Changes in v3:
>>>>> - Added missing renames for consistency
>>>>
>>>> Hmm, you asked whether to send v3, but then you didn't wait for an
>>>> answer. So to repeat what I said there: I'd prefer if we could first
>>>> settle whether to rename the conflicting x86 symbol.
>>>>
>>>
>>> Stefano replied asking for a v3 [1] before I had a chance to read your 
>>> message this morning.
>>
>> Right, sorry, I spotted his reply only after seeing the v3.
> 
> For what is worth I prefer the current implementation compared to
> renaming debug()

I don't. My replacement name suggestions were only "just in case"; I
don't really like them.

Jan

