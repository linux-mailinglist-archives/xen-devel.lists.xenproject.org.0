Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA99595CC7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 15:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388290.624913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNwHB-0002cF-Tk; Tue, 16 Aug 2022 13:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388290.624913; Tue, 16 Aug 2022 13:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNwHB-0002Yw-Pm; Tue, 16 Aug 2022 13:06:33 +0000
Received: by outflank-mailman (input) for mailman id 388290;
 Tue, 16 Aug 2022 13:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNwHB-0002Yq-3m
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 13:06:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f749916-1d64-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 15:06:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6376.eurprd04.prod.outlook.com (2603:10a6:20b:d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 13:06:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 13:06:30 +0000
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
X-Inumbo-ID: 3f749916-1d64-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLbxsEOWeuOhIA/Jo4WastI7Fhs0RaGelSdVafjgUHYuTWpQyusR5uGDvCdMYtuKWD9TTuqzQH96k4GseFd7O9dNuSteBL+JCijx6gTpwQZG/pvQ43hQfzngyNKcBwMacGuIhZqnLuXjtp9yQXw5oPPo4/MjyDwEa0KWN7n2c2tc7ZAWRIAqhs9w1/WMxEIQFj8Q8vOxc5B6bG0p5QQAilu3P0z9Sr06pWKv2DGWEj1VtUCYudFz4Z/48qIt88mO3XFih00kIKRXGJwctHNWlfoXxOQt2KVmrjNsBDlA5mRsGdNuNcaSJT1+QeYLj0cL9m8WKzGn4MAe6uPk+chFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54PJlK6NQeaQU0C4Ii60dBq9PkbZ7K42HFRnfEtd9e0=;
 b=BnA5qtCu/zsL6/7cH8l+Ed//bJnHCXriOm9AKL1KaK47Ru2XuI01ag49TYTO5Tnx+nxv6GBxUAscFHDmbTYobxcefmxkzBTA4GR5AezFp7WyKZVTv6W2Ptvay8jJAeW+mA1C8ND2xVkJfPmBwDuQEK3AtXDK1KW5dZS5uYChFEO7eeFrzjGCTuWVexKcxaVGNMLvmqoXOo8Fk8reEuFVJNjNV8d46EiRFRQBDGSucIawAdxk9TRyFNGXQ4aU+rPds3cqXaoAnhj/26qBFD8/kMbLyU8PUJYI/DKl/Pk179eQ2JSMQ4h4q9fLH4/ss0CdQK79XNKsOFv/GmL32kKb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54PJlK6NQeaQU0C4Ii60dBq9PkbZ7K42HFRnfEtd9e0=;
 b=tA3+ipxW3gpxs2lOUAvfJf847CumsA5bUTaAiIomBHZklocDJIl/gOEBORkmEkbRAdWQOv7IGFQvzsMz2XjnIiiGXaFfbnECYh1jIk7Zmp5hWROU3xFAYcRnvj1QyVl9Ff2KFK0CBK7bpAsd8xM9JL+9qIOK8Kha8gLfs7fW/i/pDkGvm90mMSbQiD3jpfIkZ2BlNRHtpbXXSZlE6sVW2PabYgPT2qKQTFDmEDN8QfD1cboTL9+VOwJL2h4+5NZQpTmf+Rjeqrkqg/7wm23kcacDTI4DjrhxAV7gjQSyRLmE137F9Cg9jUYZvrXj9ZX9pc0efD5SYU9MJvesq0UiVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <effeed44-afa4-a172-5365-4a7007274957@suse.com>
Date: Tue, 16 Aug 2022 15:06:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] xen: Port linkage.h from kernel code
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-3-jane.malalane@citrix.com>
 <2bd30d03-1918-02c7-02b2-cff8d58c99b0@suse.com>
 <a9a16f4f-a891-0801-69f9-5ce66acbc672@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a9a16f4f-a891-0801-69f9-5ce66acbc672@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0049.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c209e8a-be89-4c5c-4cf9-08da7f8822f1
X-MS-TrafficTypeDiagnostic: AM6PR04MB6376:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1OOv4p+EHDw5tbWQhoAeBCTSvbO7FNofEMXA4cfTmlPTCcRzjtoDr0ljsTHk9TFEpBjqQaQqqpciZsnTCR1Toqb0phh32K8F19AWjJk5G6SkQbjTtX/B7rBQqUHIO4Li+An2ijlx5MNdWF7/6f6z9FLZDupUUDY6fM6b5QJXLzqKvSXoNSnHtQ2f7BNO5L+3L6XzBttMbKdRAe95C6K3WKY5CvcgU1gZHgiwOkUUo92NdqqXzvERTlqSyAPwJaI1SqZ82m9ZCvwp0TV9+lEL01oMIQgEWPoiGJiQ6vejAb/Ws3Q8goIqmCDipC3R6vRvxkycaOpYmxciZtdMtLEzWumIZqw9oEo/bYXNRY7ReEtlOTGdq3Ck+CPeC8MY+C6YEYaycTXIBfCrETcDpP2LunO6tMEr8Tt7te9bwM1cUL/vPpMFkUplYu4O31VBHIKrsFDFsgSbEMtOGYa4E0XLydbAnL5krveh3/hLCAUFVQp5/Y0DT/+Dj/UV/vmYudH4m8VUhCM2jiqlW7LPgEGwL7EjKKl6We0RZG1pLOaKnSDY8ijt1iQAbhabp0LfMKtMwdjWDEGm2ye0eXGHkBDw9a4pLal8MoJkdPnBn98AOPIQM/0aW2igA9YVDmdpRo5Ml10Xq09xwy9qy4s8YLLTaWuWFx7n+FTg4ogzRWRdJVuqaq1FOCl53Z9pZju5NNkBak4XmhmdVWB8OagYeiC1TDMWyGsro8XCos5PDHaktlqkowvnMBCZ8VlKcTrGhJlsFbhsWhfOL7RCyHFFF7v/xpn0N4c1NyPGsC4UyfASY1eE/h2FfhrnjTHNwDtxM8txDePbcoYfTnI9J/DpZtxMqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(346002)(366004)(39860400002)(66476007)(2906002)(86362001)(31696002)(8676002)(66946007)(4326008)(38100700002)(66556008)(8936002)(316002)(53546011)(6916009)(83380400001)(54906003)(6506007)(2616005)(186003)(26005)(5660300002)(36756003)(6486002)(6512007)(41300700001)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3VFckVaWFpzVm9PdDFuZW9wRjU1M1puQzFaQXJrYWNhNHpodVdYM2VQbGZB?=
 =?utf-8?B?ZjMrWVRLamdTcENPcXpSaWxXN2Rlb1JuWCtoZUVMUWt4TkhGQ1JXaVpzM3NP?=
 =?utf-8?B?bFo3Q2Nsb2QwUTZXQUNTQ1hUQmI0eFJ5Q2xqYnFJMWZ5emRHRG5nWWFRMnA3?=
 =?utf-8?B?N0V1ME5ZclhRTHh0dGgvL1pua0tBNHAyQUV4d0RmL2t1akdQUkFqaHRHZlI4?=
 =?utf-8?B?QzlBU05DWHpIQVNMUzlYZ2RqbHEzdEVTdDF0aE5iRTlVMmd6enRNZDdJKzUr?=
 =?utf-8?B?cUtnU2RkN1JOUjVCampEeFBOWktUS2tkdDJYd04xaU9yekVjcDBrblpmME44?=
 =?utf-8?B?QXBaaXd6QWlvNGZjYURQZjFTYjJvc3QzUExaS2p5WVJ3WC9vWk9qZ2d3SzVy?=
 =?utf-8?B?RXRTRzRXUG5DMHVkYXNNNFJ6NmJvSFM2UG5SbFhSeFZNdVMxbHhrMjdEbHJH?=
 =?utf-8?B?THBLSVExa2JRbklySlRUbUI2dHZJRVlYZ1JPdjY4TEgvTEdiYVFWaEhweUFT?=
 =?utf-8?B?M3VaUFFDL3B0OUxDdG1LTWllUCtwc0R0WFRDcnpYWWZVYjhSMnFCQWg5YmNO?=
 =?utf-8?B?bGZYMjBhcEIwV3I2RURGTTBaZGY4OGJ4blJHNHFIRlJ5QWhzLzFnNXhwWnQ2?=
 =?utf-8?B?YmhmeXBQcXFQYjZJYzUzM1JFMTFJdHR1Z1NMUTN6dWVZV25oemx4Y1BOR2d5?=
 =?utf-8?B?cnVGcFY5SE9zZkhNWEV2VzZtL2JXMlZkOHR5TU8zc2pVeGVIQjlGcmNYdDRO?=
 =?utf-8?B?Ylhqc1B5Sk83ZlVxU0krTFNIZFZrZDR6d3RwY2U5RS96UkxnM0ZtU2FFQTBh?=
 =?utf-8?B?akVkM3F2YUl2a3c2RWdVSlNId0ZzdHF6ck9RN1BEd1RBa0pUblFwNnpZWUFm?=
 =?utf-8?B?WkkxT0NaaE1JUm9GZ2M2aHVxTWVlNXNPS0ozQkQ0Zk9zT3dDTDZxSEZCYjc2?=
 =?utf-8?B?OTV0djJlUWZoVmZxQ3d5bm1YdTY2cEU1ZFkxclZTN3M5MU5TQklmYU5ua1BP?=
 =?utf-8?B?TEdZK1JzU2p6NngrTGtFUVloaG9raHVkYlYxQnZsd1RITnJrR2xFZmVoTW1o?=
 =?utf-8?B?MmFLelhsQU5sYVhCM2dFU0g5R3FDQVU0ak9oUE0zWkZFYmpmcndIbXNRVGtp?=
 =?utf-8?B?b3paSjdIMzBNZmVJc0pQMDlnY3plVklyS0Zud2J5emxHQ0tuR291Nm5Fd1dk?=
 =?utf-8?B?dEo1cXVXZTMzMm03NS9HVVQvZGhHeThTSFZobFV5WjBsN1poZlRaaXdkaU4v?=
 =?utf-8?B?UVlyTVdTcUNPV2xJT3hoTk94bUF0NXNjdUtEVXRndEtNYXk3aHRZcXN2dS8v?=
 =?utf-8?B?WlhjVzFObEdtZEJRbHJybjlob2pYVVZ0Ly9tbjZ3a2FTZ0hyYzNVNnVRQlpH?=
 =?utf-8?B?a2ZuL2s1Y1BhNW9TOWRPU1NXM0dTZUZOREYwMlFEODJVMnRxRWFGMmpPOUg3?=
 =?utf-8?B?c3VjbHVldHRyWGZDU0RoaU5CMlVaM0RsczlNcmhSbm1NUUVkSGJwOVdCWHRi?=
 =?utf-8?B?OW15ZHhVUjhib0dKSHBNcDdJTVUwdmNsMjJRM0NtUWxvL2RmVWRETkR1WEcx?=
 =?utf-8?B?T0NZblBQN2lGZldrTmZzOHhqWkR1RjM4d1RHNEw3a21ILzRYSnZMTDVUNVlE?=
 =?utf-8?B?S1dhcDRhOHRBWjZZMFVpa3FLVFZHSklTc0xyNk9YUDd0MU9pdTFROStsbTdw?=
 =?utf-8?B?WHhLMDhieFhHS0IvS3J5dmE0QnRCT0pId0FFa2xuZndMQ1JFZHp5K0FTYktK?=
 =?utf-8?B?Y1Rvc2IwQzlqcHk3TTJEYklacFZrMHNDQXhTNC9ETWlhVndZVjJGYmJyV29x?=
 =?utf-8?B?ZDk1REl0cnAvbVpSejIxZytjSDRMdzM4eGhLMXFKUFBZSjZsQlhzNFNtTlNi?=
 =?utf-8?B?NDdBZnNDdnkvckdqa203c2E5VlJWd2E5RUt3MWZQTEZIaEUxWnVqbUh6cS9v?=
 =?utf-8?B?UkNaT1c2Ykd0S0pMUmszbXl0bEJXeVpTTVFKcVMwWHlQdjRQd3lTWTZUa0RD?=
 =?utf-8?B?UmxHMzhBdEFOQ01MR0hhZ1V5RHZFV0x0cGF6MmFOQXFWcVBNR0ZUVURudlV6?=
 =?utf-8?B?UkJHdWp5MklQYmZSN0x1SkF4cWRyVWtqa2J5anlwdG84SXJLaWE3dmRsMHkw?=
 =?utf-8?Q?mHvryshNv+59fHAxB9geJwhbo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c209e8a-be89-4c5c-4cf9-08da7f8822f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 13:06:30.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhVW3J+LrMIQtqS3VhbshZeYWhfFhR3xBNQzNVPj61rxHv8yjQW3KJ5F/fdSdoBlV7vgHGupMTkstjGdGM4ddA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6376

On 16.08.2022 12:16, Jane Malalane wrote:
> On 05/08/2022 10:24, Jan Beulich wrote:
>> On 04.08.2022 17:04, Jane Malalane wrote:
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>
>> In the title you say "port", but then you don't say what customization
>> you've done beyond the obvious adjustment of inclusion guard and
>> adjustment (actually removal) of #include-s. How much customization we
>> want to do is important here, after all. I notice you did, for example,
>> add new flavors of SYM_INNER_LABEL, but then you didn't add anything to
>> use .hidden (which I have queued as a new patch on top of a supposed v2
>> of "x86: annotate entry points with type and size"). At the same time
>> you've left in objtool related commentary, when we don't use that tool
>> (and no-one knows if we ever will).
>>
>> I'm further not sure I agree with the naming of some of your additions,
>> as they appear to not really fit with the naming model used elsewhere.
>> Your additions also look to not always match style used elsewhere in
>> this file.
>>
>> You further want to mention what Linux version this was derived from,
>> to make it easier to determine what incremental changes to port over
>> subsequently.
>>
>> Overall I'm not convinced this is a model we want to go with, first
>> and foremost because the commonly used macro names are too long for
>> my taste. What's wrong with ENTRY() and ENDPROC() / ENDDATA()?
> Hi Jan,
> 
> Since I have no particular opinion on this I went through the discussion 
> that took place before those macros were introduced in Linux. One of the 
> points made was that PROC was an ambiguous term to use, since C 
> functions are not actually procedures, at least not all.

Just one remark here: We're talking about assembly code here, so what's
a procedure or function isn't well defined anyway. I wouldn't, btw, mind
ENDFUNC() if that's deemed better than ENDPROC().

Jan

> The other was 
> that using START/END markers make it easier for a developer to remember 
> to add the END marker, and eventhough you suggest using ENTRY and not 
> just PROC as the start marker, START might still be clearer.
> 
> I welcome other input.
> 
> Thank you for your review,
> 
> Jane.


