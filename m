Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F385449FE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 13:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345094.570737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGGo-0005qx-Gf; Thu, 09 Jun 2022 11:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345094.570737; Thu, 09 Jun 2022 11:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGGo-0005p1-CS; Thu, 09 Jun 2022 11:24:10 +0000
Received: by outflank-mailman (input) for mailman id 345094;
 Thu, 09 Jun 2022 11:24:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzGGm-0005oh-LC
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 11:24:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7d00::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac3b4a19-e7e6-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 13:24:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4286.eurprd04.prod.outlook.com (2603:10a6:803:46::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 11:24:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 11:24:03 +0000
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
X-Inumbo-ID: ac3b4a19-e7e6-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUOXMZbynTid7gPpbZtlc4eu1oJkwLNBLbOnIh/VkUby/IpffMyCkFqL+VDtwD8v3/SeaDnf98pEoKKy2DWqSL6ZrJQwyqknW/zkKNMtfBpgxF0QZKAxOgJ+7YJJ4yXcO9HgPTn2M0Bb2VSgLNCQ4BDNoiCiWfgVZATJdZjT2RaTM4e3bhElkPxf+7Jd0hGLPdtoiMuddUQ84Rf62kcw7AiRqcxqLOlhY0MGgBSoXHy2Mp8UGVpn6gGqtBugpP8pgr9hamQZu7zTvRAICrjZdyxxCpkSeV7NlwjIkf1Opc/J07ZzR748A8Ls2wj0GVPCKPi0kAK/bprJmUTmUb7ZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRztNSMmQff1m4Mgag6KGmW8568Om7TlD8Momh3Zj34=;
 b=g7yYV2HWBqQxHk6HpvHHY/lwn6rb7cXr6ZXjBTlTaZpJcOawegdt2w4ftSSkCVtJUVZo1FsrYKdOl5kJ+NxmvhJZvUD4Y0LeHLVwm1HyVzbFPg/K5eIfJPazKT0tLt1oyckriMBvcFZ24XSmwxbQOqmvnSUeYpCsFCsCSfLn8y9hH50lubobamONA5D1ozbYGpWUsCrYaLZws0aiiKTZLHUdBi/lVsKUR4HJ4P8+ZlNrk1pzGOIDEX+FvZuf9bv4NCFz5wFSIxA1sxXecu1abEub2ekTdfOvhC50cKyRPdq3nMLMJwt02x6K5imKxLaW66d3qzexHWorDdN+QeHaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRztNSMmQff1m4Mgag6KGmW8568Om7TlD8Momh3Zj34=;
 b=UmH3cLiwPThhX10rrjLB+L8AVYQnD2i/3seMhw4cUt9JJmjVJ3OkJ6pdAb9mKPFq/XZEhOuQM6exP2apQHTB3KBiNDJGQc0SP/lUTba0t2hMtKHfJq+Kg8ApaJQaTq3AZQejm2Lq14GXet91vkTE3CfoRnlBECpakboOUS/PV0UZEyncFPET9ptf0ool4Pn1ctkIPRixw8I6uv/GXljq0CpVmIm/j9vQibkmc/oeXUDdw08hiJx6nhrHJUsGNKxIKt8bjp8YVR3mufj+QdLYe7Co80ynbJHxXJcnakAvqavLmwK5faQz2HhznXb01MHMcVlEdZx5paHRlxzr2LIy6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a10972fc-0f25-4187-4386-e73b4f5563af@suse.com>
Date: Thu, 9 Jun 2022 13:24:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew.Cooper3@citrix.com,
 julien@xen.org, Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
 <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
 <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
 <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
 <45c4d8fa-06de-b4a2-5688-14b9cbe5b48c@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <45c4d8fa-06de-b4a2-5688-14b9cbe5b48c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0142.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4054d076-d559-490c-1273-08da4a0a8ec1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4286:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4286F0AFD6F5660AD447AD28B3A79@VI1PR04MB4286.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t734zoAY1G80tSUnQjpK4uJy3Gplb8kKd5b0Brx2qgbUSK5pjv5+MV/1F2HNsXjGTDbhZRGXhNtRmQyIldBOADW3pSavqaAfjRQPS2HdBEfy80mf6RCjmElwg7B/7+UYTJyv/k/E/Et/E1txyGmajL7uKDuhBM/rfUvKcjXM6N8pSoC2gCBEaVXVFABNWofJSNmH6yjY1rNYm1tGFymINMlSAAhlDDzWMTEuCccYIze+kKwUGhCd29MOKPhSQIG5FwcPC9MWxnyY7lNUQyNaf6gfmatYF+ycX3kqUfnpP+P5vzr61t0r5wAnr2j6WMgJN/7hs40nyP0z4HGePMeJNtQtDm/eX6HS22BTkKjCzb8q+giGIjiB89c/oWDCXZPqF/JvF76zcLFXjyj+tnU1Wo7ILfINZpaWEDFMs0fQWNICfP45ZfgNN5svO3Su65YfBqWc2e5GGkLe5NKZiaaArlJF9qTJBl5KMMg2QIyiQiVAp2k2K94zTg6QwzLfQ1AURrrhS5FLQ+1+hjJ61L1lHHAdjyyxL9NBGp2Z4FvMnqxb5iVjVY1EdiwvKdgol5ZBtt1QOboTxkSnKgIR5a7MOTTpTVyinGpporGec51wRBXsoTZjrWVzXuoHXquA3Siu4a3DZKp36NSgpKUk48R9R3JAoPscsuSLtSCWuN+sKvdWkpxGh5JxP0jCzT9HCQSpftIEakixWGmaJhfKeDBsTvQDTXDemMq1BvxLuXeJUElnNqRM1fdS/x7otZB+1DB1bwxJB/hD8S35mFKHIGg3b8zr/LWq7JMB1+zUm1/pligwMiPOuYm7V395eqlzJMqOi43oGPICTmSixcfMd3Es96U8vUnVvy1g9n8CxxfFjzg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(38100700002)(66556008)(8936002)(66946007)(2616005)(8676002)(31686004)(4326008)(66476007)(7416002)(6916009)(54906003)(316002)(5660300002)(36756003)(86362001)(6506007)(26005)(2906002)(53546011)(6512007)(31696002)(83380400001)(508600001)(966005)(6486002)(221023002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZC9Qa2JHbDA0TUdObVpRdzl4SmNnZ09Id1htdG5TSHR3bEw5eHBzajZsRFo5?=
 =?utf-8?B?emhqc2VHdWZaU25rbEVVbm95ZHl3NE1OdFdxd2V2ZEZLRWw4VmVEV2VXbTNS?=
 =?utf-8?B?QmJQb09zQUZzdGJZRlVFOHBCVTF4TERySW1IL0k5TGVhSFVhNEhhVDUzaTV2?=
 =?utf-8?B?a0Vzbi9HT2hoUnp6cy9ZaFlxRnNybVpWY01mZlczTi9FNms0cjdGQ3g3S0Mv?=
 =?utf-8?B?c1FQR0MwaGlHSzVUYmhZUHFVQ3A4a0lKajdEcFJMcVdJQk4rRTl5MFBJUEV5?=
 =?utf-8?B?TlMwVTUxNVVuKzBWRUF0bFpSczU2d0VVbWhuWlBaZTFxQlgzOE1SNjAvcDgy?=
 =?utf-8?B?OWhiQkxVVW9BZXF2RlBXUDd6Q3NjeHVhQWtUR0ZqZ0hndThOWUVSdHppTDJX?=
 =?utf-8?B?T0tUbmU2d1JObDdqZlRTdkUvcldWc3dLcWpoNCtQSExLaDRCOE9Hcjc3YUVx?=
 =?utf-8?B?cWwxcHQwM1ZmWWRGNzFnNHZxRXhJY0VRVmRaZ2FURjZKSUduNnVHUlR2bGtT?=
 =?utf-8?B?ZlpZR2pLbzdZNUdNamt5VXN6cXVYbTlFRFVpSDJVMnpObGh2ZUZFNXlPYlhS?=
 =?utf-8?B?WFJlTGt5aUxwY0ZqRFhSTXJNVEVld2ZwNERHY3hEMTNrN0MzSVhxb21VTWgx?=
 =?utf-8?B?UEpzVUVMQjY5VXhETTNOUEI5Um4yVWZXUkpzTW1vaDFSU1ZxODBuMWRnTWVz?=
 =?utf-8?B?N200c0Q0UWxPRG9IMEpHajdiRlovbHB4ZjF1K3dhZjdLVTJyU1lWajF4dDk2?=
 =?utf-8?B?ZndEL1pXV3Y2L0FmWjVNUGRtWnFndWxGTUpjUXlTYytvZ3MxUGozMkVJVG9j?=
 =?utf-8?B?VDFqUC84MmJldW5NOUJYQjhHZlBGeHhwc3hSVEtwQmNvM0hGUEZCd3NUSGRo?=
 =?utf-8?B?Yk1nOW9hak5LZDR0bmpNM1d2eUtGVnIrTTlGaVo0dFJCNGcxb0ducmpFM25M?=
 =?utf-8?B?NmFocFpVci84Tk5HbUlmNU1icFdFWnRBcmpFSUVuUmFRdnJBMXIwMDRSSGdQ?=
 =?utf-8?B?UkN5YU45eDYrdzFHVTRJaW51ak50VE9ZMWFVZ0NoWGZFeHkyVnNTNWp3MW5S?=
 =?utf-8?B?Mk9qanJmSHA4WThTZWR1bUxHVXZCWld2VVhIMFQxanl3NVhTNWhmRkduMWJq?=
 =?utf-8?B?LzdmZGZXcXRLN1NBa211ck81MmJncFB1L3BsSTFubEhlTUNYaXUrZHdzbCtE?=
 =?utf-8?B?SnZJcElxdUl2Z0xaL2FneTRmVGJVWFdXWUhpUzgxS3pSUmJhMnBuVWplek95?=
 =?utf-8?B?QjkydkcvcjFzcDkwQlB4bU9qbUZlSlVhU1czWVNaTDR5TnZPRDkvT3F3L0dq?=
 =?utf-8?B?Zk5XZDhXd3pvTUxpVkpINis0d1RsV0wwNDJoeFRiVUxmbFZ6YzRVMkQrNm1Y?=
 =?utf-8?B?Rk9yOUJDS0lGQlVKWDVUbkpXMlJ2VXZDMUFZWXhzN3E1U0lIYmFOU1U1elhP?=
 =?utf-8?B?WTIzOXRUeCtzVWxoUm1ZUHJHUzE0Uit3LzhrME8yREV6UlBSLzlRa2haK1gw?=
 =?utf-8?B?ekFpc2ZYMm9JUE1PVldpbnQxYlVFNFVnV0luQ211bDJKL014YjVWL3FzUlN1?=
 =?utf-8?B?VmhmQWdTNzZNNmhDSmhSL2RXbUNMbE4vdyt2M3dwUlVoZU9MSGhZMTJOb2ty?=
 =?utf-8?B?UWJ2Y3BiaHR4UmxUa2pFSHVJVm9oV2ZaTWczL09HVFN1OWZTSE4ybjFXbmNP?=
 =?utf-8?B?OVgreWs0Ly9XSDJBM3FvNm1rcndaSXQ4TjFvejJFNGJpL3ptdllhRXRQZlVD?=
 =?utf-8?B?Q2NGUWU0R3hYdVpZMnBoNlVvTEFWaFowRTEvUUxTUzVjNjUvRzBCVUFHYkx4?=
 =?utf-8?B?bzZLd1J5d3ZTUkJsK2Q3TFJraXBTV2hETnY5cUZQTFBBMCszV0ZLZWdBcWxJ?=
 =?utf-8?B?RklhK3VVQWNMeUQxVXZiMlhOenRQa1NrYUpEdlpzVXZHVUlBWFllMkRreVBp?=
 =?utf-8?B?cnlDaXFZLzNQcEVnT3hxRi9rYlhYZ3NzNFF6ZFJDNW8wNWRzdFR6WDZFY3RN?=
 =?utf-8?B?a3FKMkZjNzhmK0txOEpLMng4bU9aQ0tVSk4wdlVXbzZMdVh2dk56eE5ydVg1?=
 =?utf-8?B?MHMydGJtYTAxazJSMU5OQ2VHaG5tdVB5N3ZTYXBZOXJNejRsbUV5VVVlRG53?=
 =?utf-8?B?TzNDNHhJSCtNSW1STzJnc041bmFsUlpaeDBJNXBJdW5Yc3lMK3ZCamRIMzdz?=
 =?utf-8?B?NVNIazk3UWExU01ZNGQvQWU2UWw0SUZFQ0RXWDhTOWZKOGZtTGg3ZXl6YVg4?=
 =?utf-8?B?UGo5aUNEQmVSNDZsZUtya2lLcXRSUUNsN3UvT29OaFlqTDFMU3VDWGs1OTBG?=
 =?utf-8?B?NU9VMWtLMmI1U3RwN09UbzhYVUxyL1l6SWsxR2l4SGIyQXRyWFNMQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4054d076-d559-490c-1273-08da4a0a8ec1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 11:24:03.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0z2gmhFFBxugL9t8Nx24Op/lGg1JFXwceSt0q4HtiyYgaNreP2OfHLQxFJVIReMqgNOgGLUckO32XeFu6STN2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4286

On 09.06.2022 13:11, Roberto Bagnara wrote:
> On 07/06/22 04:17, Stefano Stabellini wrote:
>  > # Rule 9.1 "The value of an object with automatic storage duration shall not be read before it has been set"
>  >
>  > The question is whether -Wuninitalised already covers this case or not.
>  > I think it does.
>  >
>  > Eclair is reporting a few issues where variables are "possibly
>  > uninitialized". We should ask Roberto about them, I don't think they are
>  > actual errors? More like extra warnings?
> 
> No, -Wuninitialized is not reliable, as it has plenty of (well known)
> false negatives.  This is typical of compilers, for which the generation
> of warnings is only a secondary objective.  I wrote about that here:
> 
>    https://www.bugseng.com/blog/compiler-warnings-use-them-dont-trust-them
> 
> On the specifics:
> 
> $ cat p.c
> int foo (int b)
> {
>      int a;
> 
>      if (b)
>      {
>          a = 1;
>      }
> 
>      return a;
> }
> 
> $ gcc -c -W -Wall -Wmaybe-uninitialized -O3 p.c
> $ gcc -c -W -Wall -Wuninitialized -O3 p.c
> $
> 
> Note that the example is less contrived than you might think.
> See, JF Bastien's talk at 2019 LLVM Developers' Meeting:
> 
>    https://www.youtube.com/watch?v=I-XUHPimq3o
> 
> More generally, you can only embrace MISRA if you agree on
> its preventive nature, which is radically different from
> the "bug finding" approach.  The point is rather simple:
> 
> 1) static analysis alone cannot guarantee correctness;
> 2) peer review is unavoidable;
> 3) testing is unavoidable.
> 
> In order to effectively conduct a peer review, you cannot
> afford being distracted every minute by the thought
> "is this initialized?  where is it initialized?  with which
> value is it initialized?"
> In a MISRA setting, you want that the answer to such questions
> is immediately clear to anyone.
> In contrast, if you embrace bug finding (that is, checkers with
> false negatives like the ones implemented by compilers),
> you will miss instances that you may miss also with testing
> (testing a program with UB does not give reliable results);
> and you will likely miss them with peer review, unless you
> can spend a lot of time and resources in the activity.
> 
> The checker implemented by ECLAIR for Rule 9.1 embodies this
> principle: if it says "violation", then it is a definite
> violation;  if it says "caution", then maybe there is no
> UB, but a human will have to spend more than 30 seconds
> in order to convince herself that there is no UB.
> 
> I understand this may sound frustrating to virtuoso programmers,
> and there are many of them in the open source world.
> But the truth is that virtuosity in programming is not a good
> thing for safety-related development.   For safety you want
> code that is simple and straightforward to reason about.

I understand what you're saying, yet I'd like to point out that adding
initializers "blindly" may give a false sense of code correctness.
Among other things it takes away the chance for tools to point out
possible issues. Plus some tools warn about stray initializers ...

Jan

