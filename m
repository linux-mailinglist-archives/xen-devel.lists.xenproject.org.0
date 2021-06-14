Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CFE3A6637
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 14:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141370.261150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslIV-0007IV-3r; Mon, 14 Jun 2021 12:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141370.261150; Mon, 14 Jun 2021 12:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslIU-0007FO-WD; Mon, 14 Jun 2021 12:02:31 +0000
Received: by outflank-mailman (input) for mailman id 141370;
 Mon, 14 Jun 2021 12:02:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lslIT-0007FF-Ua
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:02:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60d32572-a6cd-434c-8aa8-50597cdb6fc9;
 Mon, 14 Jun 2021 12:02:28 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-I-jcRurhNnOLytKe0K2VuQ-1; Mon, 14 Jun 2021 14:02:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 12:02:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 12:02:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0007.eurprd09.prod.outlook.com (2603:10a6:102:b7::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 12:02:24 +0000
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
X-Inumbo-ID: 60d32572-a6cd-434c-8aa8-50597cdb6fc9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623672147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANbCd3cO3EaUbi2pY7tnLHJdKBi2wDGigy4Oyzq6I2Q=;
	b=ZFmZwyg4hryrw0tjNaT3oYQNV3EvtX0ydVr2xaYzH+PbFjCsfiub+fJnzEHfXMmHox6KuE
	HyVPlZbLQm3RRF66COrBPMWYWBSUPd+/HaCWP2Of3FU7ubCsBtoH6+o5ZRKG6Ixv8Pltlb
	aiuQ6XLZn+c2QPxmniUumTzcvxd1CwE=
X-MC-Unique: I-jcRurhNnOLytKe0K2VuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1+Pg6fc/u0UthblUjiE4vEoVfqFW9v7w+lD4eqLVr0ng8YVqPJXAgi7i5yjxOJy2IMOK6YeKDUW2b2MMaWKu0D325YogFMJGZhNkqsxztop0KyGjHGJVmqKvMcQCZGwDPmmu1aVGcbCr31ZmfenSDF9XzX1eLYJDaDmYJsGJ/cuDfSZQ2S+1njQPGpLWBpEehoi0elYLGkbi5pscb7lQE+7StwmqWGWtHNg0rOujwNV9P+nTkrW29VyM4l1am9M2xcGSmLs17MV2Qkec91EFejHDDg4xP87Ml8HELV0NnSrE/uRfxkMQ8BpVUdOXWBam5lRDesvwtsCFKUBHr/4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANbCd3cO3EaUbi2pY7tnLHJdKBi2wDGigy4Oyzq6I2Q=;
 b=F0GPzGS/0B2knsu7BUnucu3aeSdfoSu0aUTx6XRSygF8TD2Y8bkJHt/0Qz/pBsnLg9hHyLQK2xbiDm1LUavJzYg0/FbleDfKEpjVUl1FsgA/j3rw+km5mziAtopP4uhdmL4WyZ9OGGqrUYMJGJ9T4PWtE0mor6FtSKaXlkjYEoB1RqlkIvSbQ5xbq7Qg9oHVX5e3bNRjxqhAgKiq0BqvR5r4BmUs0Oy22q+0dUfmiNj2EHc81I44WaGvTT0szcTazNeFixqJ+gjUU2Zh3R2aoWR6na36oTDCCAnzfA2fTdLLrYIrohuoKzNtXzc8KDO9qJCfpz5EZMUj+qyGj+aRsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Arm32: avoid .rodata to be marked as executable
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25f1b0d2-9270-ba42-d110-2bf14e45b7b8@suse.com>
 <5b819c5e-587b-4eec-b873-73892503c3e2@xen.org>
 <4143bdfd-ca78-d7ce-4ed0-2b6271c48ecf@suse.com>
 <7a57d3df-94d0-5ee6-1ceb-bf4eddec1392@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <666fdb88-94c0-be05-f4d5-d755b0326dad@suse.com>
Date: Mon, 14 Jun 2021 14:02:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7a57d3df-94d0-5ee6-1ceb-bf4eddec1392@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3PR09CA0007.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96c13704-c640-4ee7-aa4d-08d92f2c45c3
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70404628525919E8335026EDB3319@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ztKazuxbUkM1vAmotgLP02STW5T/Fxzwsvg5cBHok7mUT0jfFqfikt1glzruOcrUqJY/bazUxaZgB0Xz2JSQl6JfVqJFIr9L8lYAowyJ7ZbbegoOBhgZN1GlgBxq5XHrtJTG/ZaZiuIpVQgT3ecARxENDoMSqwXS40c7stL9t75gGRsIQBO0HQt5JWMfMN3t0C/apqHxdYYrKi735mvOL2sQsyBUnMS08tx+Lf/4er0IclhtIEQDWaWpiVc96ZOoDRMeq88jMrGLd6GoFpNDm9HCOM8sUnLgR2BV+P9+ZshcPggGbA8qM4hzlPacPB5KwXfhIsrZqQcennuqqMzt0Onm7s8oe020sFP/zzVEwyCnJUFy6zsccWOHIanaD06uwBfKoCYKHsPOUCJRJU8q5H28VfjH4Huh/NsjHqOJGbEmiWeiBEI9M/+aRJyUHtWtzaBlzvo9bIeN++r9SwzaazFHaHQo2+Jl7gutGz4hF7sZozs0LJZT/r1jcDrxPFRautGzPZq7fuj2zj5qjV7IxYf26VdnUa5jlfSjedr3MtwQa0NBSKK5JU0Bp39l6+wKOumerp7IcKz5cDx5Q73zlFymEZoFwwtGmacwqFfOBJ1U/wzD5xQZJnfqRxPxp8Rv4MGzXeE1pvoo8NJDpjf5XTrc/ZnuDLpusCyN2z/guMz20MEuZn83U/d/XwNJRfKL1jxazCOWCa4KiV/0xN2lbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(396003)(346002)(376002)(86362001)(956004)(2906002)(26005)(5660300002)(2616005)(66556008)(83380400001)(66476007)(66946007)(16576012)(316002)(53546011)(31686004)(6916009)(16526019)(31696002)(4326008)(186003)(478600001)(8676002)(8936002)(36756003)(54906003)(6486002)(38100700002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEVoM0p6KzVnTE5RWE91MXkwVXgxVm5VWUJQcWF2bGw3eHg0cVU4R2Iyam1G?=
 =?utf-8?B?U1JwU3UrQ2RTeXc1NXd0eWxHcWlGWEhwdHJmM01qWmhxa2hXWHFDTVVCVTBm?=
 =?utf-8?B?dHpKcU5xdk1jTXpJeU1ZWFVuQVkrQ3NmQzhrcVBzRDJ0blNOTHdEbENOcDdh?=
 =?utf-8?B?SmRsaklIWElMMVlUczNMYUkyRFBvZTZIQTh1NzRpdXNGYmlGa0l2RmRiRFhX?=
 =?utf-8?B?OEl5YWJEQmd3b3dFZHVkclRwaERhc3Y5UjhrbURPODF4VytNMEJtcktyOFpH?=
 =?utf-8?B?UG02cTZxSFNJZGZmV01PT2h0Y2tscHZ5bXlnQTJ4dkIrN1FVZm1NVjgvZTBR?=
 =?utf-8?B?Nmc0Qzc3czlMK0hmMUw5SHNwSldDMTl6MUlRcnVoU1B0b1VoczdCR1JRekgr?=
 =?utf-8?B?ZWViRTFEeDZxa1pXV1hLcUk0elQ2a0VBak5OT3dwZXpCeU1yWXZGZWZobTBD?=
 =?utf-8?B?N2I1VFJTTmZ4clk1M3RoQlRDMm9wZGFwck5odFN5eGRhYWZkMXVjNlJ4NEZP?=
 =?utf-8?B?RkZFNVd1cXJKM0hBRGZCaEJoM0M1bndZMmVCdmlKZ3N4U3E4ODNFdW1hSWp5?=
 =?utf-8?B?c1hrdFlZZU9EUjVNRGdsaStpejdKcjdXQVVnbEJuNk9mRXdtOGk3djlpNUY1?=
 =?utf-8?B?bmVtckFybzRPTEhiVTFwQVQrYTR4RzMxNkFDbXRFaXZSRVdIaWJvMEpmd3VN?=
 =?utf-8?B?bnU2Z0NyeWZDNjNEWUxBc2Y1TTdKNUhOdWgybjZlZEFjUGZtMkhtVk40ZTVn?=
 =?utf-8?B?MVptMm5LUHYzZ1VyTDlESVZvQjUxL1I4alZuRnJ2WFhqUEVPSitrM3l0ZmRu?=
 =?utf-8?B?d2hxUzIzYWFEYUxDRmF3SmluTWNFQVFzYXlvSGRZNlAzY1FkQ3MzYVNPTEZU?=
 =?utf-8?B?ZnNEVXluVjA0UFpEb3A5UUQ3YmdwblpBemxZQ0RNdXBienIvM1hvVXl5aEJY?=
 =?utf-8?B?QWptYjRFQnFRYWRqeWdJVTdEY3lUcWRaVDR2S09GVEx1Wmk4L0tEcDI1YTFK?=
 =?utf-8?B?YXNjOWozbENXUGRRWkFBYjRkeWs3VDFaVEY2aGJndTNuOXdkKyt3UUxLa05Y?=
 =?utf-8?B?VmluWGN2WW9BSHZLTlhmMXRhTjhzRHpZdXNFcFVoU2pPWG5pMy9BZEJFVzU5?=
 =?utf-8?B?NDk2YitoMzRXVW50ZGNEenY0bGFHTUptRldQR0VjVWZtRVVsQ3lWQWoxSU0r?=
 =?utf-8?B?bDF2UVU4MjgzOFVXMlFmODBOQ21qMUVjWTV6aEU2bTZaWHg1NmRnMEZhdnhz?=
 =?utf-8?B?T0g3cHlVTzFGSG1DVVBySExoS2VVWlpYckZDUU45d1hSUDVIaUM1eUNZSUFn?=
 =?utf-8?B?MThaMk1BTVJFb3dXTTN6T2FNdzBJemtXK0JXQ0pxZWRzc0k4cVU3NFpodXpz?=
 =?utf-8?B?VXdkcWN0Tmh1QnkzOEh5R01hNFdMVEhIWU42YTBpOCs4K05iVnJ3RU9uR29Y?=
 =?utf-8?B?YVNDK1RwWUpyZG9rSTIwbDlvZjdzSncxRHRHeXlGdlpZVXY1bHFtcWNyb1dD?=
 =?utf-8?B?dldQZmQ3Y01MTE91ZDJTWnZONzFma3FjNmE2dlRXN2tQc1B6U2syb2tldHVC?=
 =?utf-8?B?eTBNbTdaWkFCZ2xNandGcGdJRTF6Q0djS3NaQWNLZTBGWWcrb2cvRjl6WWY2?=
 =?utf-8?B?RjhGazBCU0FVejBTQ3VKaFNqckNmU1dDZ1ZVcW8wSkhHeVJSb21iczlKNWh0?=
 =?utf-8?B?cUh5R1BDd0xkc0V2ajN2L2RYNDN1WGNDdm9ieTRtZTJ3QzJlWUZNZHBScERL?=
 =?utf-8?Q?86XZw+CBEaqYLzB+fsdIt9aUARpiFJcwbTl6Ixh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c13704-c640-4ee7-aa4d-08d92f2c45c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 12:02:24.9910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfpQzL4Hq/G/Wlobm6bwi1pomHkDz946Z9NagdJjx2MPCTHfkPzD0V2IQl9XZ+Wa0afcsRfMpp8k+W7stezMsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 14.06.2021 12:54, Julien Grall wrote:
> On 14/06/2021 12:40, Jan Beulich wrote:
>> On 14.06.2021 11:57, Julien Grall wrote:
>>> On 11/06/2021 11:19, Jan Beulich wrote:
>>>> This confuses disassemblers, at the very least. When this data still
>>>> lived in .init.*, this probably didn't matter much, albeit the
>>>> "#execinstr" would have been suspicious to me already then. But the
>>>> latest with their movement to .rodata these attributes should have been
>>>> dropped.
>>>
>>> I don't quite understand why this wasn't really a problem for .init.data
>>> but it is a problem for .rodata. Can you expand your thought?
>>
>> I've said "probably" for a reason, and my thinking here goes along
>> the lines of what I've said on the other patch regarding .init.*:
>> There's perhaps not overly much reason to be picky about the
>> attributes of .init.*, and at least on x86 there is also a case
>> (the EFI binary) where we fold all .init.* into just .init anyway.
> 
> Makese sense. Thanks for the explanation.
> 
>>
>> The alternative to the present description that I see would be to
>> go with just the 1st sentence. But I would be afraid in such a
>> case that you would come back and tell me this is too little of a
>> description.
> 
> How about:
> 
> "xen/arm: .proc.info doesn't need to be executable
> 
> The section .proc.info lives in .rodata as it doesn't contain any 
> executable code. However, the section is still marked as executable as 
> the consequence .rodata will also be marked executable.
> 
> Xen doesn't use the ELF permissions to decide the page-table mapping 
> permission. However, this will confuse disassemblers.
> 
> #execinstr is now removed on all the pushsection dealing with .proc.info".
> 
> I can update the commit message on commit.

I'm fine with the new commit message, but I'd prefer the title to
remain as is, as that aspect is what did trigger me making this
change.

Jan


