Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956396507FD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 08:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465837.724638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7AME-0003lu-Ik; Mon, 19 Dec 2022 07:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465837.724638; Mon, 19 Dec 2022 07:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7AME-0003k9-Ff; Mon, 19 Dec 2022 07:14:42 +0000
Received: by outflank-mailman (input) for mailman id 465837;
 Mon, 19 Dec 2022 07:14:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7AMD-0003k3-Ag
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 07:14:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd4b9da9-7f6c-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 08:14:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8194.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 07:14:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 07:14:38 +0000
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
X-Inumbo-ID: cd4b9da9-7f6c-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0jN/k8Ae+0IkJPad1PAdJba3ogyh+E3RUlxC8KI0t08u3kMSZgrQbvwkIAGIpwD1qV+YMUoG+LbXuCOmFZvKGNbImX2/2ZeI/uEp5/0VDV27s6Txrn8egn7MFNa3Vt1tgCzQAKu5AOmcyh57fBMxKTOxFbMyOw1G8t7/fy8Z6oWRMz+jQaBj9/kMq1kJe7fTYFXyp5PVGVqBGAENsnb/VRhJLYeSM7g2NuWlZTxUiTKPkKjX17xKv2Qhr7KrFxqNy0645s1SoXzCHFXI/9Nc+26SedCU30X1uaOUBj0E0dwViPFekXmerXketos3bks+3oRFCazJTCjLV7bL68H1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+9+IQID3kGCWMZuEhomuLsDCnnBIrhPWeoDCI8Mt2g=;
 b=O4j1TAVnR4ggVIRAr2Kp9S83yo3yZE+tWKG2g6Lgap3BttL1lqjMxPo78zNXcgiafvb2aApo75enQ0tr4IUcJeS82oBSD2pmMzpF3dCfOQaN+0yZ/oKX0E28U3xopxHujIzglWOSYABh3jYatEHh+g79DwL1ZMsXPMHWaqWYu6bhzTh41rbIsXOF9gp38X5trX1yWetHeVOJ1Jl0iG0XeCBi5fwpDmzFUAIuE9ekSk0U8oF4qFJXPIRlWsGeVxSAf3OehwXQELy8TcAp0g10gNkVoSjyIYKqOe2LpJ0w2WdzI8zVl1ypI+jtdwpAjsqXoFJcJbVUPB9mxbzRUKdAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+9+IQID3kGCWMZuEhomuLsDCnnBIrhPWeoDCI8Mt2g=;
 b=GKZRatQE6hMMdG/7klhEpmXWBqLl4mquFEF+ZofKj6IFKQIi8FdXQK73pmIoCrMo/05/CEcxFlqS4KGcnJaJ6L4u86zYgW9HLKsmNsprumeyxEjsxXGMB0DaW+xDH96xaf99nSSWILcFkh4qiuKy9TbeDbIH3dcyfE1LXL5XgTQrPcuDoCnHHUjkr3BNfahZ8cfjvPAtV3htSlr8v6WAulaZ4B7lYly7fpbc8e77NS3W8LxoD6H6yGmyet1AuwQeHNnJbzUXMK3k8ODF2ADF07+wPMJW5/5maLe3Xcwfna07lIaWLJUUqLBxQOkLdFfVszA2HdYduBWawNmSSbzupg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f22869a2-0bba-ffe9-8628-de6787558d6d@suse.com>
Date: Mon, 19 Dec 2022 08:14:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] x86/mm: avoid phys_to_nid() calls for invalid
 addresses
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <d503a684-1689-ef60-23e8-5eb6b33ab5c8@suse.com>
 <c982fec2-53ba-f448-e073-967925f61bbf@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c982fec2-53ba-f448-e073-967925f61bbf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e6f7ca-a88c-4f6a-40b8-08dae190b0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lgeXWueolui3su/5erJfXKmE/mRGCJzfSjM8BxTgbOAPQHn7xHwc80IoEgrsbC84iqxLccs4ITu64Gom9BcD5dpPkwFphgJjZTmxv4YY6QKShAZhoX1IuJ0JkOqTLDniUy60WKmGf0WpAvrMam7n9cY57BUW6ljEth56J6xFylGTqgsfZup7omEGbGvG+mlbb8HLlojOb26q0pNrtApW62bBc3LNttGgC6FAQx+uiB/pd+HSZdjXJc/MGDPNzjARaqntUtrLcXWe9nqyOpt4rQpmTVyVRzCNd0iJPzJm8hvqofywG2tQPOIPFVhgzvwQQ/vjmsKs6GVBUCxY4LE6/uOHuAr1b3CYsJhcEXXR+iTrnmLbZTR8lPFjJcGhi/4DFgqFaqch7VpR0/0ohut6jXEBVGJhQR3XM1Qo0ve7SAAC6XiYc1ezYJZTjviPIBz5uOcXjyFywsexP5aI4Txf4zDJjjF6RnodUGaLGgRBxZfRz+2kR4S7aIdJb0O0QyBGwqEQLzAJOWCnpz5ku6fjlgbPZEHoeQ7m9c0WdpqK/VXFdgtCZroDEHZkxVQGcTHnT9E97nksOf63g1/y2Bu90G/78sRzLqy86xhRU1ZbnqGSPe5jjnLgyaLEzwlvyPcCk2vgen4k/mmoQAJt73KmLwChanRHNko5wQgDfdJ+i6RWXvbD1VwmtzovfxSxns67THwHEXWWzv/jsnNGE4GZH3GtRhMm1k1ranz9O+5HUl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(6916009)(54906003)(316002)(53546011)(6506007)(6512007)(36756003)(186003)(26005)(2906002)(83380400001)(4744005)(5660300002)(38100700002)(8676002)(66556008)(66476007)(4326008)(66946007)(2616005)(8936002)(41300700001)(86362001)(31696002)(478600001)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVBQNHh0Uk1GbExZMU91bWI1cnFSdXZXZ0RyNHdQcUpXcHZEdGs4UG1idDFY?=
 =?utf-8?B?cXRVV1dQbU1MVEpvdmJ6YVhIU0tMQXNaZ2NLYkJ1WW52cGMvSVlWNEg5dC9q?=
 =?utf-8?B?NHNENnhvTWNLeEpIV3dtVFJwaERJbCtCMytJNFYwREpnT3VTQ0dzTVNOMTZ5?=
 =?utf-8?B?LzNIVjBRQmhTY1o5NGF4SVpCMXNjdFVORzJ6d0NuaFdhZnM2TEQxaytRbnF2?=
 =?utf-8?B?clhmbEZid1FQZG9OTTMwSzVXd3hMSHRUeERZNXQ5QnUwbjRFZUhrUUJCWW4z?=
 =?utf-8?B?ck1XVFZNeU5GU3ZXRW1HUkdpaFFuQ054L0dPKzJUZVpqbUJneGR4cGpJRTJt?=
 =?utf-8?B?bEVST1BNWDREL3RCSDlKbHpybHNTUkE1TmR1a2U1RUNJTU41TERPN2xxZ0F3?=
 =?utf-8?B?QlBEQWQ2TWZsb1JqY1phclA4UWRncWVRYkNPcUk4TEhMUHhENnZOSHd1WHdo?=
 =?utf-8?B?dTRCaGk5Q1draWpaaEcwNjMvd0hieC9pdjJnR0p1ZmIrM1k2dEZJa1pGV1Yv?=
 =?utf-8?B?dERvdkoyaTBFeHZUcHc4b1BxK0l1TWl6TnVRZjNYSE1ZTHpvbWRiWFV3TU1U?=
 =?utf-8?B?N1UwajE0YlBpSkUzTVlJU2llcldIaUxNdnIwZjNDS2RqNlBTZ2RWM2x5YXl6?=
 =?utf-8?B?MGNEL3BFdzdveUJtd2VwbzdIemtWckVhV3U5ZC9hM1JyQTJiSVAyUmNneDNZ?=
 =?utf-8?B?RkVRVmExRVF6cGVMZTR3OVdSczdESXl1VCtnWU9Na0o2d05CRnU5ZktSUEhx?=
 =?utf-8?B?RENXdjZnUlpzTFV4QW0rT0RCdnVlN1MydEtYSG5EWVhvYUhkRDRjT291RGJJ?=
 =?utf-8?B?ZG5KRHVPM1BYOHBDYjJHRTFYMFpQSDFuRWN1VlZLQm04ckF5STQxWDdkeFlz?=
 =?utf-8?B?U0ZMSTFJa2p6RjlZZVR5RTNEUXFTNHlZeTA2T2tqbjR3Vkg0MVNXK0Mrdks5?=
 =?utf-8?B?R00yWDByR2FJdFZNUlVkY2xHQk5ZelA1QXF4WklYQ2dGZG1Yd0hnSzJLRlFN?=
 =?utf-8?B?enRCMWRuNlVQUDlUTHhBaVNsZmtLSzVXSy9leTVGLzFhQ0JlcnJwaW5HYS9V?=
 =?utf-8?B?ZDZZclNHbS91OUZTbHdTcnZYNEFJL2Voa042TFhyTFR5V08xM052QzJhNGcy?=
 =?utf-8?B?UXJ1Z0xrcmpuWjhNQkFpaFRYdTR4aXplUG81ZFFrMVBNelRPaVRjRUJhdjlj?=
 =?utf-8?B?Mm1UZXNycXArbnNCcVRlNTRienJ5blY4NlFsZGkveGVWeEVGZnk1SXJEOFAv?=
 =?utf-8?B?Nzhla1RkTktHOXRoT3MvZlVqcmg3a0JJcWlMd0dOZkU3alZOQjdubTB1UGZJ?=
 =?utf-8?B?bmsyZEl1YTlHdWNKL3pDTE5ZamRtT1ZaRXVpMlc4WUhOa3h1OXoxblFERzEy?=
 =?utf-8?B?bTJBUTNXVnkzL1h6dmZqV2ZQcE5ObGorcmpPSGtITVkyc2pLSzZWVFliN3Ar?=
 =?utf-8?B?ZnhiaW5kUUM1eFNiOTdibzJtNzNEdDRTMkNPV09HRVczNVdlczlpeGVCZXFV?=
 =?utf-8?B?dzQrWklRcytZYTJXUmlGbWJkdjlHWVRYVGNYejJqYkRLOVkxTDEvT3JDanFk?=
 =?utf-8?B?WUx2ZzAyRlhTU3FmRG1vR1l2Z2RWVU5LaE9pcmlWdW0rL1JTN0FVTTR4cDk2?=
 =?utf-8?B?QjdndERCT2c1ekxUT0ozaTZsT1NveHRGakxMRjR1RTdocWQ0SUcydE0renF4?=
 =?utf-8?B?aXVjaHA4MkF3NjQ2cisrbmk5a1FVNmRRbVZ5bVFSVVl4bzdDQ3cremF5TFd4?=
 =?utf-8?B?akdWRnFlbk43bXJ3OHVSVXR3dUFZNnFtOHVoa0lhYUVLVlpnYXVaL1FRWUNi?=
 =?utf-8?B?R3FyS3BUeWw4S1RiZnRBVWlRZ3pDQmY0STZsUUkxdVRpdnYzSEZpQlFXODNi?=
 =?utf-8?B?MmM4dG5DY1lkd1VQV1BZTVhIbjJsU1paTGVEcUJMVmNlcFZ6cEUvQXdtUHhs?=
 =?utf-8?B?L0xoZDN4ajdQL1VmWEtOem40V1hjT1VGWER0dG1vODdLLzQ1R3Vva00vK2ZC?=
 =?utf-8?B?Y3FQM1NLRWRWOWNackRXdlpjdHJ6UWVLL0Fya2h2aXpvdUlHVTVCYitnUDQ5?=
 =?utf-8?B?ZGVrc3BQOVc3MHB3S0ZYaUt2Tm5DUHNseEZidmZtcGZtdEN2NEl5SU9VZWcz?=
 =?utf-8?Q?wVDVQXImAPTOyZw48y+RRKWBh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e6f7ca-a88c-4f6a-40b8-08dae190b0a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 07:14:38.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLnUsCi7c2/WS7xnCH224HaRvB7FTVQvIZGViJxdc7UNbCQmAPCceUKtmuJ8uRv9xCIyMp1y1RsGUvi9w8w3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8194

On 16.12.2022 20:24, Andrew Cooper wrote:
> On 13/12/2022 11:36 am, Jan Beulich wrote:
>> RFC: With small enough a NUMA hash shift it would still be possible to
>>      hit an SRAT hole, despite mfn_valid() passing. Hence, like was the
>>      original plan, it may still be necessary to relax the checking in
>>      phys_to_nid() (or its designated replacements). At which point the
>>      value of this change here would shrink to merely reducing the
>>      chance of unintentionally doing NUMA_NO_NODE allocations.
> 
> Why does the NUMA shift matter?  Can't this occur for badly constructed
> SRAT tables too?

Well, the NUMA hash shift is computed from the SRAT table entries, so
often "badly constructed" => "too small shift".

> Nevertheless, this is a clear improvement over what's currently in tree,
> so I'm going to commit it to try and unblock OSSTest.  The tree has been
> blocked for too long.  Further adjustments can come in due course.

Thanks. And I see it has unblocked the tree.

Jan

