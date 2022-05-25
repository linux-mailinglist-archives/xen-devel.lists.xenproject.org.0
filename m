Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C947533B65
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 13:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337143.561664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntovp-0000Ro-Rr; Wed, 25 May 2022 11:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337143.561664; Wed, 25 May 2022 11:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntovp-0000Oz-Oj; Wed, 25 May 2022 11:12:01 +0000
Received: by outflank-mailman (input) for mailman id 337143;
 Wed, 25 May 2022 11:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntovp-0000Ot-4t
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 11:12:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ef2d81b-dc1b-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 13:11:59 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-5llw674mNH-5WLkeuizahw-1; Wed, 25 May 2022 13:11:56 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 11:11:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 11:11:54 +0000
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
X-Inumbo-ID: 7ef2d81b-dc1b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653477119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NhJ/hkYyGjiLhb/bgpOLzeT3CNP2lxqvZcaKsWBYCmQ=;
	b=Zhw45anblBuv43IU+smBMPfvj+YOny3b809cc7R6CykoAoDif2z68lJ7L49hlUg2jtMTYJ
	Rr782/3AQUucdcd7cBZyzQTQYa6Twfv239SpnJ0LlTiPbBvgTrrGS05VmImd0uio4gI497
	Gg2BKEC6ZbIDlKBJVC8F4Ky/6DhAZss=
X-MC-Unique: 5llw674mNH-5WLkeuizahw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msw8hEt/TckhbKF2BmBhCZtQKmyhbVQQB5dYEheCk845rziJ0e6gUXr/GlBEE3z3c4rupRmFIz3xkEGBMR02/+2ClANhHacGj+HiKbMWRzuej2tWzMw2m3Q3OGJfeAZeyWFHz4tc+Y1OdECCfblVvfwgrJx7rGnuVznZNJT0450IDyhH+wE0pP0HdkN5Hnp2e9JSoPkmUu4AoL5OS7NDNgRSpVCwzyEEL1TrMm5O/RLV2C8fSBZWSWiesrehkzJKWnGpaHxIdT1zE2AuT/lSLo2Vyyr20WlEp8y+hat1qMy34cKKWoUcuoQEIW0tWtTbDpUAiGciDoWIkmJeiUmqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhJ/hkYyGjiLhb/bgpOLzeT3CNP2lxqvZcaKsWBYCmQ=;
 b=nuxb6ds3DT8XcdZ5mxMsORRoTrXFLnD3GTFG2v9TElaWeMOeYD6wYI2ZVWFd3stGKfb3TAZGrglMMzrpVNnunH9QZnQssc2Wnd3CYM1U/PLivSGynlDN33GX/a+G3Bwk9gu3wv8pRl8uo3lHXuSkG6K1JRCQ3YFlbYx3psqVxeY0gIsw0Aqd3eeQoak3FX6VHqwwkDoLhAVYH8XGVYd8zIV7m6fUgeckZvlv2sj+6Nu54E/pP+oZplmBIXaOcJWOgAh9sGtduOS8Zg74LOvFMm+QimyRGy6CuTjsgDVa6KaB0Yzl6bQEmv6YzaHNstkKoOCTeNJBjG6FgBq5yoaeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ad659cd-826a-4393-777b-f4103d02af77@suse.com>
Date: Wed, 25 May 2022 13:11:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] SUPPORT.md: extend security support for x86 hosts to
 12 TiB of memory
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5835df1e-8f92-79ce-94c5-1b5df9c9ff65@suse.com>
 <6f333841-17e3-c9ac-580a-fc89f1741596@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6f333841-17e3-c9ac-580a-fc89f1741596@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0081.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b065c1c0-c8ba-4490-1e4b-08da3e3f6040
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB3089B3358F902437EADD8466B3D69@AM5PR04MB3089.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nORVIgqOm/sq852/Amk7rTyHK728Bexdq1aoqGGFBDNvL6/8J7gipzQ9Z1jBpFEmgLFwymJqtH2NCeP3axDTvHl1cEtZnfGZ3bQqDUr2cZwpPP9T4yjW4kb6RYch5RsolQYtEKlr23JDlWnImyixoJIN71sKn/nt00vFa4noZx0Ct/9KuzupWIntCfETzVybcCPCy8zCavPIe16P4VqtaQJFSif226zgqxBOf6YlAWdhdpXRIzewn5nJ55If+DenmR3sHQ3LhRYIGq0ik6QHgnjNsAH6NHcBSOGdiGy4kXSjAkmjklo7z4BojhtPgpr4IaAUaAQNZmgyzqOq/sXac7nurmLgDSU2G5ykCijKIWe6n3yd6WwBDb/KJL5yKfXWVyg0DwZKgmBDXDD4iaGbT7/hoYFra2dscLOPzJX2xx4uOmjGoX1Ta4p0Wz/YNryIrJRBkxbdnWUVM17TyqFQoZAVGkC7XiuWq13Kkcl2sBLNGReIr7XbTwsOuP4VEU+bSRuPdmnLxV0L2tkxYkajnWTSjxu03Zpnsjjt+WqvO+UAtlzAknzpVl7LlJSalBPSQJ6q5eu57WESXetYt8jxGVRu5nm1ADbP2NNkahafo1Mdv+z/TpyARPt80CgLNUdhUOKYbQhxim9d/CE53KznAdeSHZwTIrAj6f9TjhIs+Bkjc9h4lgtSW7rzOQBKrjUdL5ihnSLZ2OWMhBf036fdlJQCW3wG2nY1cRahp/6+WtA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(36756003)(15650500001)(6486002)(2906002)(6506007)(316002)(8936002)(31686004)(86362001)(4326008)(66556008)(53546011)(8676002)(66946007)(26005)(508600001)(6512007)(5660300002)(66476007)(54906003)(2616005)(6916009)(38100700002)(83380400001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm9xcTV1SER3UThiOERqSm0wQTUrVkYvY0F6K1VHODYyS2RMVEZFYjJ4bEUz?=
 =?utf-8?B?Q2U3WndQam01bFdrbkNUTlRkY3BKZUwzTUZGTjRTY2VVT1d5M1BxbDNPbHpT?=
 =?utf-8?B?M2JxRnhiN1VGREhaemNlcGM3WFc4N3RuVjVXeno3OGVVenZYVEg2WSt0R0Qv?=
 =?utf-8?B?cklsL21BdTZTa0JoSnc3VkFQUDh4L0cxZ1VuM2NMVUMxRlJUK2JBMVZQOTdC?=
 =?utf-8?B?d3lCRjR3UnVkNFdUNkZ2U2N4NThuKytNOXI5bEpPbHlUd3VSUGI3Y2htWjc2?=
 =?utf-8?B?dXlLYU1mK2pRaEt1V25DbC85eFFWY0o0VG1mTzVQR2tiRTdveUFHQzhRUU5P?=
 =?utf-8?B?dzJVR3Y1bk8ySFVVZlB0a1NCdVlyY1l5eVJGcTNLc3E2T01mY3NTZTZhMEV5?=
 =?utf-8?B?aXQrd0d1L25wZThKcW9aenZDaHUyaUhyNUdoMkdRZHdlTUF1eWtrd2lLWVk1?=
 =?utf-8?B?ZHFkL2MwQnVWQTY4dWNtWUZWYXhnN0FiaEd6S0RnZG50eFdNUjkvY3lpRG9O?=
 =?utf-8?B?dGVkYkd6cnMrTGk3KzI3TTlFZjVRMk9oem9tcmFWdFh0OTdTQWQzLzFZd1Rq?=
 =?utf-8?B?TFZaU0RHZ2J3L3FzcEZxOHFnN3ZTaTdYOHZKR1g2QjB0TU9oYTRZemNBVUlh?=
 =?utf-8?B?elhuNkNmbld5L1hmMVQrekFxYlMxTWtmVjAydjQ4RXFSUDEzWnBxMGdIb2k0?=
 =?utf-8?B?TEprc3Q1QWhmUXRlcHZwU3gweGc3d3A4a0lBYWJjNlhxelowYmY5akJUZDkx?=
 =?utf-8?B?a0RsUFJYT2hOMkxuWERRVUNaRDFCdkYrdDhBUjZMeTNTelc3OFRQb0FwN0dx?=
 =?utf-8?B?TTNzSXd4enA1U0pyeFkrSUNlakxRYzRrbGNnQzY0Q0ZNRlVwTkNISmgxaWlN?=
 =?utf-8?B?Ujc5c3JUd1hacVBjb1M4bGNVUHpURWl4MlE0dHhjUStiREJVS3V1NnF4eitn?=
 =?utf-8?B?SHMyWWtVZ1JDWUJaUUZJYmFuVEdURFJURTQzTVh4cllKV0xaVDZRdzE5RWY4?=
 =?utf-8?B?SlMyanp2TDhHN3laaGhJWTdFbEZ2SHBlU3UwQW9PeFFGeWNDM2M3U3BXaDFU?=
 =?utf-8?B?ZlNMbjR4OGZ5d3B2b2VMbzhsajNEWUpiRm5RakV0cGRXL2kzeHZOSW05WTlU?=
 =?utf-8?B?dktCellOS0VWQTlwUXM0bnhwU3prLzY2ZURseUtZV0xmVlBXNThnZlRYRFlN?=
 =?utf-8?B?OGhYVjVWY3NsbkMxdjU4am9CbGZRRlhNVVBDUUc2RzBlUjRMVUxHT243Zk12?=
 =?utf-8?B?NE9zTkdYRzJIUVIwc3p2Z0RBSExtVVl4WGNQOEtnUitiTXpWOC9wMzFId3lD?=
 =?utf-8?B?ZDB5enhsVm0rZXVqMDVDWEp0cmdmZUd0ais2L0hhaFJqWEJvSU40SmFTQzdm?=
 =?utf-8?B?a3JHZWYyQWNmTC91TlBoRFFDNmFFUDIvUUNiaDJYSmRRMkVjSC8yenk1N2dM?=
 =?utf-8?B?M1VLNVMxdjgvTjdqVENpcTJjNlZGR3ZVYVBBend0NmpnOU0wdHNnNm8vQUg3?=
 =?utf-8?B?OTgrbmFIWW93SkxRQ2dLaFRzOEE3TmRFL3ZWdmJsSHJTZ3pBVlAzSHdIbWxT?=
 =?utf-8?B?dmZRNDcxd0Y5bUY3M29EamtXYmphUzZKWG9ZRWl0THAwd3c2aTNsNko2YmFE?=
 =?utf-8?B?SkM2SEZKVXBqZE9JdTl1K2xvT0ZjK0NLcVBpTCswbHpYSnVQU2VmdFlLZ2NN?=
 =?utf-8?B?Um9LZFArRzZQaGdPdGpiUHhYNVMycU9qLzVKUGVDeGZNMjNOdTdOZGF3eDIx?=
 =?utf-8?B?eUVRUUxNYWlpMFlJQzJYSUM4V1hPd0dwVHRweW1ieUQ4ZFZJQTZScnFaQ3VE?=
 =?utf-8?B?NkVVa3BPdUJ3c05sajJuS1YyM2hEQnRVNm44b3Z6Z3N0bHdYSHZ0dFJOQmNE?=
 =?utf-8?B?c2xRbElYQ2h0Z1pOUmQ1d01SSFptTEM3UTdlb1J2VEgvdVFLMEFJTnV4em41?=
 =?utf-8?B?UVZPNG1uZWxCR0NhV2RxRHR6eE9aUVFEcFlWS0VURkZJb1lPTlNiYjMrL0cy?=
 =?utf-8?B?ZjIwd3BEN0psSDU2bWNIZ2luUG83dFh3eVlHMWJkai80VXhVeG1CTHFXSUla?=
 =?utf-8?B?TkxuM2tMbSsxTmMvR3psaFRmeHBvcnd0amlzRld5SWljMkc4dHZpRWRMRTFa?=
 =?utf-8?B?eXZjTmk5Q1hoMkg3YXFzbllJYWRjT3dRVnI1NXlQb1FtTnFMMjR4U2NPODlq?=
 =?utf-8?B?dUYxQlBaU0JibW8yYVo5SG1OeDZqWDVucVBycTNVWWUrMTdXMlJFc1ZIUHRL?=
 =?utf-8?B?dUtpWGhNR3duN3hJNnhjMHdXWVFWV3o1WFBnUnZRaHhiVk0rbW1hSHhISi9t?=
 =?utf-8?B?YVpVMnpqTkVJQ01wQzEvTGFHSnRQeERRM1FjdU9LeDNFNmVXTGsvUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b065c1c0-c8ba-4490-1e4b-08da3e3f6040
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 11:11:54.6741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAm/O6Lf6W+Yd77yGjkZ/QyYdAgmZDN4SO4Y+UbPsRubCAqGe/1ldvGTQhrQtcQgORUlvrbxq/S2HuXQnNNZDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089

On 25.05.2022 12:58, Julien Grall wrote:
> On 25/05/2022 10:21, Jan Beulich wrote:
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
>>   
>>   ### Physical Memory
>>   
>> -    Status, x86: Supported up to 8 TiB. Hosts with more memory are supported, but not security supported.
>> +    Status, x86: Supported up to 12 TiB. Hosts with more memory are supported, but not security supported.
>>       Status, Arm32: Supported up to 12 GiB
>>       Status, Arm64: Supported up to 2 TiB
>>   
>> @@ -121,6 +121,17 @@ ARM only has one guest type at the momen
>>   
>>       Status: Supported
>>   
>> +## Guest Limits
>> +
>> +### Memory
>> +
>> +    Status, x86: Supported up to 8 TiB
>> +    Status, Arm64: Supported up to 1 TiB
>> +    Status, Arm32: Supported up to 32 GiB
> 
> IIRC, the max the architecture would allow us is 16 Gib. Here we are 
> limited with how much physical memory is supported by Xen. So this wants 
> to be 12 GiB.

Hmm, while I don't know where I took the 32 from, it was you who
suggested (in reply to v1) I put 16 here. Though yes, with the
host limit now set to just 12, putting more here would be odd.
I didn't cross check the numbers, I'll admit.

>> +
>> +Guests with more memory, but less than 16 TiB, are supported,
>> +but not security supported.
> 
> On Arm32, we definitely can't support up to 16 TiB. On Arm64, we would 
> need some work to support it. So I would move this sentence in the 
> "Status, x86" section.

Sure, I can do that. Would have been nice if you had said so right
on v1. As to Arm64 though - the host limit is 2 TiB. Going beyond
that being impossible (without becoming at least unsupported), is
the uniform upper bound of 16 TiB really a problem here (IOW do
guests really only function up to 1 TiB)? For Arm32 it would be
even less of an issue, as hosts with more than 12 GiB are
unsupported. (I'm trying to avoid moving the line up not the least
because it'll be even more of a line length violation than what
was necessary to accept for the host limits.)

Jan


