Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218076D8F8A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 08:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518737.805561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkJDW-0003Po-Tz; Thu, 06 Apr 2023 06:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518737.805561; Thu, 06 Apr 2023 06:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkJDW-0003ME-QH; Thu, 06 Apr 2023 06:35:30 +0000
Received: by outflank-mailman (input) for mailman id 518737;
 Thu, 06 Apr 2023 06:35:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkJDV-0003M8-79
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 06:35:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3761be9c-d445-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 08:35:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6855.eurprd04.prod.outlook.com (2603:10a6:20b:dc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 06:35:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 06:35:25 +0000
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
X-Inumbo-ID: 3761be9c-d445-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uja96Q1S7FCrP9pZP8tp2MAeK0JSKB4cr3AcDwQjA9szlGS6RiBsldddF/83fewOCUfJkwCwIdIB5w9kN40+h4cw8pybsEcu9T77Q/w0d4svMbeZF83c+fjhVkJk+kzGkO393UuCgwRU8TYZc/emiyKanurEx74va/VQOqLhIyY0Nit1SVq3yXQ9jD1FJKJ3R3Yq9oWjJskv+FdayRwbb1QBPpk1KNTIfwLRxEG1vdpGF2ncNjjr3nQDVGRfet1cHn4IBpSOMP4yG/nacIx13tAU6cbHp9gDpZpLzLAQM2zcmQ+OUCCN8xTXcEujmQhIytX/4j2U+oxwOrDV9Jlvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynyCJJbqCagedK2F0kJGUmSwDJt20O0KiqLz/Y/RlX0=;
 b=VTbDgGbU4qoYj8Lf8wspTjMIEKwd+u3zxT6O+q/3quSyKnyZhrRCYr1jeCo/owuDpQTd8o5w4Ay74eFUbR1nnX37JY70Gvk5s0FsRDs5uGqrsYvOJg1Dm3P2HTas3IbgH/MIbsduZaIwgKTAdrb2dQrsyVJLUSvJIBuFxAUnyrpOGXnEbvFAtVtxEn5uJAvMxmXh5ijAG2g4c+jvtqjiVs4mTz5iM+LI4UmsXD1LBzr6vEOLdSiq9scrtH//4Jc+3KdVyCko6ccL6tAZBqNovMwgpCY96QhTslBSgF9nBRB+ru6Ly8bs+SkAajsUmaVQSqCTCFD8knjh2LbsLZbLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynyCJJbqCagedK2F0kJGUmSwDJt20O0KiqLz/Y/RlX0=;
 b=ISG2g9EDrIKOo9dx94jF6+IpaT1fD2C5aBguQxP19Wx/TTq5Gzjo57zmJrf7Ni7CFPnWmk415T1jge3qQcmAdU7DiuTd3eIZG3kvb6whDbWJM7eahM03CQPbLZC7VG44mRhWZQAUhAKw5N7nd1yod47Pt2PMpKt99dfCsQ4P942sng5Rl/pO2h/AKRQ231WMTpgZS2XJy1/SPH8MEXSZPKhSnMNlWFyetgRNmepdrH0x/a+rbhEsEbwi+hg2LFgxld8H47g+DSlxx1UArkSUjfC+keZaAR7M7OJj3MBFh964txJ6JMMB6W4nVEDq01I17YhaZr+SBPDjDDSR6m4+hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8fce2549-a580-6780-759d-f287fa710640@suse.com>
Date: Thu, 6 Apr 2023 08:35:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v9 4/5] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
 <8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com>
 <3a94ad32-159d-d06f-cba6-3bb40f9f2085@xen.org>
 <605245331bb93b7e60a4a9d65b19b6642d897034.camel@gmail.com>
 <9c4ca4a1-1b68-5ee0-0434-e6c9ec7d1ef6@suse.com>
 <d351a7b6d673b70d45e809123e6e42abbf7b8014.camel@gmail.com>
 <fb639472-70f3-f7c9-eaa6-37effd4965b3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fb639472-70f3-f7c9-eaa6-37effd4965b3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: f7be412f-a9c3-42e1-ea90-08db36691ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pR2w+7FRdyc8BXF35h4fu+6riMXivi+oFv4lZtm1CTyYc87EkRwaCARqpgkOAX2/P8XcwchatHniQMvs/GQLjFKTexfjW1JWIjWBwWlHym7HsyM8zJymapZ+XS2P4xcQYVYGxzBtEvh5K688bMW7qFDY7aiBSFxC1dIXrKqOMs1N7UGyapHAc3MxWNQmzZsXrjVJKFqOc8qrY1cAAmowKKe+bZWG6L5Fh+acE278BG8DHy5hW1jT8Qow3Km34Gz5gZQl1IxBa2wHVdk6zdqzKHM5zk8KQdb4Vlflj256ojmxVi6Q6RuV1quwpD4IrxmYgq2IosarQ0ZFxpli425hY7obLVt8obyLMzne64X7YtXkbA0Xd4WBa2W21ErpbuX7cOHUnWM/dNO/wBMAVZRtemQVJbG3Tri0RvKKX6nTftRs1gqwlIF66Y8IZBrslAYjjytrl3DEmn6aH68nLPd4eyEQI2CuZpjFZe0wVXFK3qhM1R80/bjdQt4C/D+XNJY9nTqzhrSIDeUlex8Qhl6byDuWq/pL5yKV8Sh11FYMbLlruL740Zj9k+IGSt7HBjVHUP7o2COD4XYEJfv2yyP3HTQHZA0ZinlXz4lfXrwKO1hzbRcax0a06pq8hDFoucTwZ9qs/NwaW2EjJpT58ddpZ3lUucYSIL2PXNyka47gVnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(136003)(366004)(376002)(396003)(451199021)(5660300002)(31686004)(54906003)(316002)(8936002)(41300700001)(66946007)(186003)(2906002)(478600001)(4326008)(66556008)(8676002)(6916009)(66476007)(6486002)(26005)(53546011)(6506007)(6512007)(36756003)(2616005)(558084003)(31696002)(86362001)(38100700002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmNRaHhZOWxzRndZWWRneWlhdVpWcXlzWTRsMWI2M0htTEVhZFVQNFhXbXFV?=
 =?utf-8?B?TWFqajF4djFZa1VmaVUzSmlWSjNaSnZGN0N5TVlzSVBzampKclh4OUwydDh5?=
 =?utf-8?B?dTZZVWhxRU9OM0lmVGFGTVJpUUdFeWdJZFdkU3c1YmwydmtWbDRzMU00NXNB?=
 =?utf-8?B?R20xd0xVdTI3b0x1MzZWUHFrNDQxUzBuci9yTTVQUElIS1cvWWZsTXNMVDlZ?=
 =?utf-8?B?b1lCRkx5eUVRUkxuemhuTzgxT2RIaDdTbnFJUUVBeW1JSkNrTUtWQmFpMGtl?=
 =?utf-8?B?YUU3aDJHNTkzYzZlUFlmVThsNFBJZWJuQWdEd3pXaEtqSjhYejY2ZVAySXRT?=
 =?utf-8?B?YWtaTlJhWnVBSkhYeHpuSGF0UnVNdndhQzdTSmpGUFg2OE5JeVBCWEh1NVhN?=
 =?utf-8?B?WHp2K1ZzQUtBMUswSW9ETWNzbm42ODF2MzduRFM5VTZrMDU3Q0hSSEEya1pD?=
 =?utf-8?B?V3lZU3YrOEJVMUFlTk5wUnk0UEFaRGx1WFNXQVRvZHRaK1hCdUQvRkhQTjRP?=
 =?utf-8?B?cWxlTVR2QkxwUjZ5RUJQOUt6RFZBTkpFeGh0QWQ5djBKNEdZNGZqK29zT2FE?=
 =?utf-8?B?a29Md01uRDIyTGEvQllHZXhzcEZzTk5GcTQ1aFgrNWcyZzBFMHhsdjNiYWJY?=
 =?utf-8?B?NXN0UWJIU0VTS1B5WXJETWdOeWwwTEtzZC85b0FJbm5jRklkU0t3Z1RzUTdN?=
 =?utf-8?B?Y0k0SXRzTXgzb3hocjdrUG1zclFraUhXMXZ5Nk94VTlqYVZiUTl0bG5tdFdy?=
 =?utf-8?B?UWhDbStNQU1aYXkyVTNESldZN2lIbVBTM2x2d2d3ZGV6NTFZcGtyS084aEFy?=
 =?utf-8?B?Qk00SnVzcmUzS1J6dno2ZGdzcnlLUjNBbTdOUjRGdTRnQ0lkWXRaY2xvUEdo?=
 =?utf-8?B?VFhXN1dTZVc4OWpLcWhMSmh2NStTWm9YMkd0M0NQZzJvV1MycmQ5b2R2QkVq?=
 =?utf-8?B?K2R1Z0JtRjBiM0hmMno1ZFFXajVmeWNOZU8vTVVzdEsycWRNOUZDdGNNTWVk?=
 =?utf-8?B?ZWd5d3hJdzdsS01meDJWUlhpbWJGNWh1QzRSQWhiZnRsMy83Tzl3R2ZyYzZO?=
 =?utf-8?B?MEJJUUd4djc4MnVaMUpMcGJ5Q1ZvVnFQaXhTSUJxOXlHeTh4ZU8vRExPcEp1?=
 =?utf-8?B?eGpvT2Q4MHJ3eFVzSmg0bXdCWTV4S2hZNi8xRlRRNlUxY1JlS1gzdlVGSlh1?=
 =?utf-8?B?QkpKMVk1eDFKWXlLUVNoSUtRdmtvN3luWDFjSUQzWXU0NVpIUGJCa3V2cGM5?=
 =?utf-8?B?YnJaNlNZN2hZaEd3VlJQMUJPWjY2NndQQnl6VTZGbVl1MUpoSmIxUjBjSGs0?=
 =?utf-8?B?aU1KaHdJS2UwQ3FOUXdHcmdRQldUTC9tejFDMVVqS3N6QmREZGNwWHpYVHlY?=
 =?utf-8?B?Y1JNV1o3MGo4V3hPL1ZxOHVmN1cyTGNUWXlqdnUvYjlVc0FUc05yVWNRMGg3?=
 =?utf-8?B?dWE2U0taZ3NvSXNBNFU5QkZja0FEWE1Ob1BqVG9GdDlVbEF4ZUt0Y0JRVDYv?=
 =?utf-8?B?WGNoc29PWi94NkNJNGRuaFpjM2NZellmUGJYZS9qdlBSaW1ZTFZNaTVlVi85?=
 =?utf-8?B?M0UveWNQOWFSZmoxd3JvTkh1YlExVE55SXgvZWZEdGxNV0FXOGJFaWNpdGZG?=
 =?utf-8?B?dXBhVkFCOWdTcGp2dDBCVW1wKzhKZzk1ZFltbk1LNFU2amVOMDVNeDdranZN?=
 =?utf-8?B?ai9yRVBZU1FIekJXanhhRmppMEpmc3QvRmdyK2kvaFFpYkJHanN4Wi9SZXNO?=
 =?utf-8?B?cjBUaGRldlJnUmZzTTZxUTBBRnM5bWRxd2t4cVVpUCt2b01kaG45bnlyblA3?=
 =?utf-8?B?TUVWcDh6UnVtejVkcUxva1g0RS82WEN0TXVKSHFTWmpxVEpVVkdacTd4S0hZ?=
 =?utf-8?B?OEt1b3k3UTFVU2dzMkVFdHMraFk4N2xuNVkzaGc1ZnFaQXBFbnVRekNoVk5T?=
 =?utf-8?B?WnM0OFJCWjl3MkYzNUwrTHM3bVU2SGNrMGIvakF2SXBiWFBYRytkUzlDMHNQ?=
 =?utf-8?B?UW9ERG05MkFXWnNKcXgwb1AzcjlUb3QvbkhSWG5QZ09FdEhYZnNSZmJuVEdo?=
 =?utf-8?B?MDVQU0ZKZWdHRnBmTlM3RC9McjJsTjd0b0lGNEYwT24xU2J3TnBrOE1sOE5w?=
 =?utf-8?Q?N/87Obk2KJ4rVoTWJuIH4GIpL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7be412f-a9c3-42e1-ea90-08db36691ac1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 06:35:25.2833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXjWiTDSv0LxW9uuo0iHnpBMYR66fFoN6d2SOus9IuYdx6/Dxl/qxD1ssdwQ+cMpOtyp7D2JZD0L4j5Hd0RdgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6855

On 05.04.2023 18:39, Julien Grall wrote:
> To reduce the amount of patch to resend, I was actually thinking to 
> merge patch #1-3 and #5 (so leave this patch alone) and modify the 
> default in a follow-up. Any thoughts?

Well, yes, that's what I did a couple of days ago already.

Jan

