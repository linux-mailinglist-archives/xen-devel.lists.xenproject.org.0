Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42858876B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 08:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379576.613127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7xq-0003OX-Rj; Wed, 03 Aug 2022 06:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379576.613127; Wed, 03 Aug 2022 06:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7xq-0003L8-ON; Wed, 03 Aug 2022 06:34:42 +0000
Received: by outflank-mailman (input) for mailman id 379576;
 Wed, 03 Aug 2022 06:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ7xo-0003L2-I6
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 06:34:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 596a1da3-12f6-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 08:34:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3345.eurprd04.prod.outlook.com (2603:10a6:208:1d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 06:34:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 06:34:37 +0000
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
X-Inumbo-ID: 596a1da3-12f6-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpnjSvNj6gGIkID80e+6CG7/C0/LjC0HkEsqUwnUofkJpZB3PiriKCwFhMf8hxi1GsEL0U/iY7bshnbwN9oB+x/jTLCJfbR7v+XJV1TC/vKaKn4rEgQQOvsibq9TJb17Bmki3abzB9ckVlrg/MjcXop/g9vnEQQSl6sHfsvqxPlEnEyJQGRuPBTwPXU/ho26qUN8fVnb/mZsE/YI3NJBW/UNnp76KRaGfpmPoa1NkzNpIhAlk1FKk9zMoHQEO9eAPUAz4CCwvGrMw4Ef7t1j/l6/5nReZYRHTK3A6/l9wBwwBhJPZzcOBF6+5c5I8n1w1c9pHiiUiihJjuT8Wc/k+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1oyRy8Msa0Ye1X2zqJ6rJDSE44k7cK/stifjbbM1uo=;
 b=GT5ToMcwBpanUkiBFixGgkO5uOGiede1BMqiSD0clTc7IfS6O62UJLIllQvp3XF23rcoDXMD7YespxBnYKXIVoJT+SIjKokFJUQ59OiF3VuiTec3PulCI8AaXruW9+OtK0L8kgRquy0gUKpqw3+vLUuGa7q7BQUhERIpppFB+mZK7xfKqNkD75VfkqGmANBYFKWDVrsps3lo31p/tqUhc81bofwv8yj5bfprkzBQjeMKQTdy26DmG14BqeSc9c6OOFGWtO/sXaIaLd2jN0Jrz9/L+dL7/CzMbm0Tqfh1QIKng3xgSEWA2MPTkVDC6qkdbhAJ08a7o/OvtC/OedU1Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1oyRy8Msa0Ye1X2zqJ6rJDSE44k7cK/stifjbbM1uo=;
 b=u7Nxef2DEqYHJY19bRqzbyni06+34jlRHLs5KTllUotmnCnZbijHcNcFrjXqpUBOaUrdw8wFcfin1ntri0AwORzsBRv/UC9zP7MXMZECptocQq894UhmvknaPEXTsA/vwB2TAal5w4y4trH1FDsDg8vkjU9lVuNMIOCNYVm0qsl1gfo/ltormRoSyc2sdEpmm4XyBmKFnl8I+5QDUJ/uU/OFt1o0bmX5+tkm4jT020tIGDHIL4Z8kuNYNVd0NadATkyVftjjDv0boUl/ALP0WrUQiRcYhVy4yDUzzTSAaumk8YHuQtLv7EOc/FYAVaSyLBF+mWLyN03vgDQrZLJC2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ae39fa1-84f8-401c-85a2-3b6208e54d18@suse.com>
Date: Wed, 3 Aug 2022 08:34:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Bruno <brunoce@kolabnow.com>
Cc: xen-devel@lists.xenproject.org
References: <87c86770-9244-dbad-23ba-d449b2c3ccb7@suse.com>
 <B8D2151F-D58B-4443-8171-48623AB77595@kolabnow.com>
 <eaa074c2-350e-c526-b825-c2d45ff0fc48@suse.com>
 <24ec8c9e1dffd6073677fec8d2fb038a@kolabnow.com>
 <cc1058ef-ca8e-12d5-1ff5-9fc824cf260a@suse.com>
In-Reply-To: <cc1058ef-ca8e-12d5-1ff5-9fc824cf260a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1957524f-7959-41c4-75f5-08da751a3c8d
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3345:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cKCQKPpn6TRbTGkb2pWP051E0fwUbxgVnG68iHby2yQ6ZU7x3S/XSfvtelM1NpCezbgFGWr717A4kZ4sSigILV5mqCQAlWcTkRSksszkhlxzzFjKSVWcfagSjSZG6s+pQTC762593xNDAM+bcnUCN+lssuSg6HVBaBxxIv+ADTzLqCgvDhLG8iaM3zxjekA6uXgejf+y8NTGSfb0wWkRC/L2Xf6O+LuxLX8Pthvmu0a8qoLlx3VSHjw5pLPAiLtyXmDGEXCtl7uknJ7Jd3qpJdqUEFZWQcE5nyt/ik1lqQ5fK2oy8AFKWTjVfDNSo3g12Y5C7WKC1Dkxlbre5xLomRaQJEp9+C4/pnN2bf6PwRA5jn9YIw8Jrk6oFmUG1qBcIH2LveQO/6JEaHNK4JaC9medIz2jyXNnOn5xb23mIWQ51G1M/ESO66UIfvDp3t9ZP/52GkUN5Aur+1QVz8qKwld/2ULx9nlN9agqNT1jQfV0kCbVvSPPO0T0FXeE0nN9d40c4wWGls2p0tXzAEMpFXsiHUx1Ei1gRenyKRW4SiKQNO9EmdGfZfyQU85LovsEzbBpmc2VU+zxSDJAqHsDyxxHvIhMyoKzBfsBp2N2hZj3KmzKMBKxeGhhEv32LbJsF8sD4vyfsR7a/vsSkxC1rudmWZNmbh+dMc3xglnSsMT1A88brw5QgJGId3KUyXgyh/Ley91X1VeO62L59RSBNwcJIVUix4BIa20W8LasWEseMi7g6QOgyaHr2LUuFgfy7UOdOxbj3xs21wTlR+Bfnx77CFSijzhq8CiPebk8rjIEAYmUBnwruzU5Vb6oQURWC8Ma/HS8hgnmgX00e2EmOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(39860400002)(366004)(136003)(346002)(8936002)(36756003)(316002)(478600001)(31686004)(6486002)(5660300002)(8676002)(66556008)(66476007)(4326008)(66946007)(6916009)(6512007)(53546011)(26005)(2616005)(6506007)(41300700001)(2906002)(186003)(83380400001)(86362001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlAydmp4UklVUy9wZW42QVE5LytBaTNMa1MvejJxeGxaaWR1VHI5dWJ6M2J1?=
 =?utf-8?B?WExJdlE1dDBoU3RQd29PQ25Ccm1sblUxSThPMUNBYVFWR3AxMTRNbFNkaEZI?=
 =?utf-8?B?NS9seVJjWkQrSE9icG9ndHcrcnNJYUVYUURUNlp2QkFiQ2l2K0VFdVdqZitF?=
 =?utf-8?B?S21RTHA4d0c5VjUxK3NhQUtMVVo3YkExN01xK1o2ckdyb2ZYeWxhdXN3TVhL?=
 =?utf-8?B?MmhTS1BPbHpncUVJRzFiQy9xbmNiSldhaDRXQ1Jtd1k3QWhuemxPelhKczN4?=
 =?utf-8?B?T0YwN1lYZHdnNTBLWXo2Rm12THZsZW9sS0xKREI1NTJjTTNqOE4vbVhxUHYz?=
 =?utf-8?B?OUZOaUpUWmdCdXlxcWdya3RQTGphN0RoZXlZSmRzc21aaTV5bzVQamJEQy9l?=
 =?utf-8?B?NUw0ZlJSZVVKcC9oMXBMOTR1L3VxVkdMUVNnbXZNNUE4VlN0M1hOQWpiSjEr?=
 =?utf-8?B?cHJqblBYQm5maktNMlJqb2xLdlZmZ1JXK0JWQ1FzYjRFVDFKS1l6V1ZKWEd2?=
 =?utf-8?B?LzRkMElSZlc4cjlFeUJpNG5EbnFUQTlmUys0Wk5nbkNYUjFrU01kTzk0aG5x?=
 =?utf-8?B?QVM3UStwWXF0MzN3QXV4L3FPbWRrZm9rNytRQ0tSckVpNWRab3Q0S1UyZDZW?=
 =?utf-8?B?TWwzWCtrbUJKeTNYRXFiRDZXcjUydHh6MTJoS0dqZ2Zzd1p3djIraVFSYlV0?=
 =?utf-8?B?WWIvNG9kY0RTcW5EeVZ4TzR3ZENPQ0xVd1VVRnQzcXJsUDNzV2hoRVhwTHN2?=
 =?utf-8?B?NEpVT05rZVpXYWZiQkhCamdhSk44ek43UXVXV21iS2JqSjFSZWJTazZyZEYr?=
 =?utf-8?B?QzFmWjZMeEhEemtQemhhUGZabnpqMitOOUpkK2RUVVlvSXVRSEVaN0FQQjc1?=
 =?utf-8?B?akFOY1pKeWgrVXYrb1M5UDFxZWd5UDRWdmNZSjZQRFhHdkNJNS9sTC9KTW5F?=
 =?utf-8?B?N0c4Uy9VSXNVekR5bkpxdVZ0cVpEK0NsWExxL3JGcTlqN0w3a1ZDcEExOUdt?=
 =?utf-8?B?bkJUVUVsd3VtMjJWcUc3NTA0Tm4rckxRTkUzTzY3R0pBY1pTOTJ3eVdpR3VW?=
 =?utf-8?B?cnNIMTk4dW93Skt1YlRqN2xockk1WWV2eTgwNWhmL3JaSG9jbjVxZXhnckky?=
 =?utf-8?B?cGV5elZEVTYrekhJMjhXeTg5TlkyWHk4bUtuUkNjZmgydzlvKytnQzV0RlA1?=
 =?utf-8?B?cTRCcFVqUkxUOW1oN3ZDRUFWc3NlMjJyTWZ6M1lUNk10aDJBMVZ1QkltMnJD?=
 =?utf-8?B?VjcrRWxCbHFwYXAvdnEvU1A5K2ZRNkxhOGlZTDhLR0hhU2JDN09QdVEzVFN1?=
 =?utf-8?B?VExjaVhHMDRDOU5hUXNocSsrUTAxYmNvbER3YWN6bEpna1RodytzM0FGNlZo?=
 =?utf-8?B?YTZUaVZJc3lTQW50bEFvRlN5OWlsajRZamdERmlybm1qNzNKMG1WUTRDYkg1?=
 =?utf-8?B?OWtFbmZtd1Vudnk4cmdmMy9LZmE2T2R0aW12V2RLcTlqSlVWTzM0ZnBEeUk3?=
 =?utf-8?B?YXVUYkRodEx6UGE2OHR0dFhlMURiQXU0SGk1WFp6TzJZaE1WL2hjOHhNUTNL?=
 =?utf-8?B?Z1B3aVNld1hzcVJsTkxZcmpkV1BBVjd0cUh1Qnd3RSt1VUFEUC8xdGNKeVZU?=
 =?utf-8?B?YXFBWFR1ZFVEWWdnK09TQVEwQWVHZi9JYTlYQngweW56OEVlU1IzcVZQUVJw?=
 =?utf-8?B?eWk0OXBHWElLVklqN2IzdzM3VVVMUTRJN2RibkxrYzRnNEhpZzY4V1RqTlpQ?=
 =?utf-8?B?NEJqd1ptQlRwUnN5b2tySGJQQTV2bmxhdDQ5OGNCbmtlTkFzWHAydmZKU1VU?=
 =?utf-8?B?WkFQaFJmWjE3YUpXRGMvc0U3VHBOMUpHUlBjTGdnV2lmc2lnZ0xjTlAzOE40?=
 =?utf-8?B?WHZYdjZHeVVwSW5qdjdMSEpKZWV0d2xzOFozVEhtVEZySlFsNXFFdU1CamJz?=
 =?utf-8?B?aEtKQUliZDN5T3dCWDBmSG1XQVN2SlpGWU4rMUthTVVMMGZWNjBPQXp0SGg0?=
 =?utf-8?B?bm5ZZXIwM1d1S0p2a0RhN2M5cXd0Y3NKeTh3dG4vZlhCckpTVmJONjBiVE5G?=
 =?utf-8?B?bm9pWXpyZVFUemVOUTFLWnJTeTlKMnJOVnNZVlRkS2kwdndWNzZPc29qSDEw?=
 =?utf-8?Q?9FD9+BtP/4GHuLu2khgy8S+J7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1957524f-7959-41c4-75f5-08da751a3c8d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 06:34:37.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ft90UoQoEEdQPnyCZ+TejsVGoNd549mwVLTiVapVGeZkhAemw5nTS9d9D8u9AWNoiPrXRYup2eot8wkE8OaHJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3345

On 03.08.2022 08:25, Jan Beulich wrote:
> On 02.08.2022 18:07, Bruno wrote:
>> On initramfs:
>>
>> - xl will give me not found - I cannot do xl info or xl dmesg
> 
> As expected - you'd have to handcraft xl and ints libraries into the
> image.
> 
>> - I cannot mount any disk, therefore, exporting logs from there has been 
>> photographing and using OCR then reviewing and correcting - but I guess 
>> the main difference is ACIP, as I cannot access the disks
> 
> Oh, I see. I was kind of expecting (hoping) you might be able to
> export the logs via, say, a USB key.
> 
>> I have now booted on kernel 18 to get the kernel boot log for you (the 
>> one on Xen-user is kernel 10).
> 
> At the first glance - similar ACPI errors, and a similar issue with
> loading sound firmware. Using two different kernels won't really
> lend itself for direct comparison, though. At the moment I don't see
> a good way forward here as long as not even proper logs can be
> obtained: It may be necessary to add debugging code, the output of
> which would also need collecting. But maybe someone else sees a
> viable route to help you ...

Oh, actually upon looking again I spotted something:

nvme nvme0: pci function 10000:e1:00.0

Note the wider-than-16-bits segment number. Which, afaict, is an effect of
using the Volume Management Device:

vmd 0000:00:0e.0: PCI host bridge to bus 10000:e0

You may want to go through firmware setup options to see whether there's a
way to disable it / its use. Neither Xen nor the Dom0 Linux kernel (i.e.
when run under Xen) have been enabled so far to make this work (and, from
inspection quite a while back, the kernel implementation, during its design,
not having considered the possibility of running on a type-1 hypervisor will
likely make adding support, well, interesting).

Jan

