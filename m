Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F0D64C60F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461916.720080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5O9w-0004M9-Ad; Wed, 14 Dec 2022 09:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461916.720080; Wed, 14 Dec 2022 09:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5O9w-0004JY-6p; Wed, 14 Dec 2022 09:34:40 +0000
Received: by outflank-mailman (input) for mailman id 461916;
 Wed, 14 Dec 2022 09:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5O9u-0004JN-T1
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:34:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86dce9f9-7b92-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 10:34:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 09:34:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:34:29 +0000
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
X-Inumbo-ID: 86dce9f9-7b92-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkXHGHUgmQh0XpFjMJz3YYuJPN4YTSYQLFhpeZjVH5MiXTvWhsQ0oPfLZBFC1MrCYp6zzJ6P5mbJopc390Ec/nlJV+yzcSB2T0PaULtVte3M2t8LPFnyJg0v52Wn6uXW3lRaXmWPzMbyB0DBTPsOqULxf3DIEyb6AuwsSY1oUrJx2OZrX+itXKNLiHNvLcxaH4mh8oJCOq22o6yy8iny8BeBtrJ8GlEYyFkFKTpc+9bXWSJPX7JFCgT8Nb8q4fnX8vaKVp0hDdrPNL6tMntshoMR5nvXQUoS7Kln802GKJNhL5zUn5p6PihTKpH5DY2RAGXtbf1t+QcuUw2rGMo8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWw5HH9xajBUKyQ7zeSCCSpXOdeoVqkj2/ya9fqC3tY=;
 b=kpDEo+JtuROvBu0JKKMiEhkIOK9N7eJ2u1s2fmyyh2NmKpxonni0qG21trVShJhPG+2Xyycj5yrj7cGRxIFwORmCWbrvEVlz/RCV+h+H8z8etZpZiJGTtFRjzjB26DBm49fl5yMePwghi9Ki8UutlcnK6S0grtAjI7kRMEdALQ05pBV9oDwCwO4ZukW8j/qeb+cOcuifAy53pCZVOHq4I9t6SbLE35LdjBIRYY34CDVMbUhK6YvNaGORpmoviOJdBR/PHbhHF0A13Aj5plu65QSQ/iXE/BgbG6hnekc627PWqW4qU+QChwBvAgHwOkB9gCZoFQlpz2NUFbgCZtGNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWw5HH9xajBUKyQ7zeSCCSpXOdeoVqkj2/ya9fqC3tY=;
 b=Gx9IvB9TeayStN6XCSheUnuBW0GPlOfcpw3D0UO+Vyv/mbV0w/tlLpthXj0LJPLKtqYzN/u/kPG7k4onlRVWyGDc1AfyIki2MlbviS86BSxtx2GtYr3rFev27ffVw/cTd67X8FXEzQvZPkI0MuTM7Z6mwAaxj7cIxU+nGPGilO5S+y7Jbk+qHAEFzTb7fWIemLkG8P6QXIU0P4IATCH1UhrLEDHJY65VkzyVDRwdkPtVzPfIjzrrKe+aL4VVMoCCHk6QZzoZ6zKtaN5i9gLhnPCpM8Ou4vIRgWEHbAGUlV3AhIpdy9WxO+/pb2xwA2syPAZxXoZBocokFGt6gix0qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e4935fb1-8223-a2c5-9700-b2277d78404f@suse.com>
Date: Wed, 14 Dec 2022 10:34:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] efi: Relocate the ESRT when booting via multiboot2
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <a7336c832b0276a1bc7692c537cc14f6e70d65a4.1670972544.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a7336c832b0276a1bc7692c537cc14f6e70d65a4.1670972544.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 489d0d93-e61b-4879-86ce-08daddb665cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jdb/6qOqSR2hNkmf4rvPmNewOXZsoBcdmpMdR6oy46i2mXkQncInuZ3gw0JWY4TuDIGYEn/6fd8TFyWXnHhbYTCqn6z4rIT+sPhtyLDV1mUB9Xs6kgm7SSfGL1lBdXYZQ8sFLgiDZqolPxvJMZB7KvX55Npi4kBm/2tZ7i4aOAI30HYQIsXpteTXMTR2gXWJnEz/QxDVqCrWbIIA6AP0AfLT+i/p6PW/8mv7t+GiGsnMUgf1cvAWCd6leObXghWOfOHo+ogQZLJpWG+/zwDRneO/tSBwiHoousuy4mLPJYsnIGqs5i/X+40nzZ4ezRXA9ps+QeCxdAngIZPhFeF5x8Z24X1JpiRTPzkM/8Qz19WciD/SOTcGv8Z1IYUhNkddYNr8tAzPUev+MNx4uoqUNxaBAe+QrvJGR+cIkSqtq9C7XfxLnghLJEVVXTq4KaDltszUwt7n7WMF6CXk3edm/iGsaTCfYTfqk07zmoQGTfABFp/dwok11IuyChWLdJDHJZn1+1Fn1iKBKpx7v3i7TZe9ocbubpInrH1hDgpnzGgGAb8pH9o89pt2bTH92+cPoIIrCCCpwksB1XGm2CK+kWkD2aikyQWLf5cptnX/FdVN4P7HA7f+vX8l2iooJxHo/RUUVbDX9FAulRBcdoylotSelVWv3OhkfaFtmA4bXpbqu6Y58y347YMUNdT2ywPKQY7/p1mxQ16YHMXwvTyZ4gPVX9diy6PJcCuuOkz6zUM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(38100700002)(2906002)(4744005)(186003)(8936002)(66476007)(31686004)(4326008)(26005)(6512007)(8676002)(86362001)(41300700001)(66556008)(53546011)(5660300002)(2616005)(31696002)(36756003)(66946007)(6916009)(66899015)(83380400001)(316002)(6486002)(478600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmJDSFBKTElPaWhGd2wzWEVFUm56R2xia1haTFJYUkc3Y0IyWXJxU2lYVWd0?=
 =?utf-8?B?em5JajRMaml6bGtxd1FnaGRVQmtud0lBcHVOTmNubHZ0NUNtMmY1RW5CSWl4?=
 =?utf-8?B?Y1dkS2dMRG5GOTBjL2drYTRmaW1neHdkcFhaWlNrVGwzOXNZSmEvV2FWM3Vu?=
 =?utf-8?B?NEhDK0lic2RlR1ZLZWhmd2lxUG5UdDdOMy9SeU9hNTU1aGEwYnhwVy9JN0hi?=
 =?utf-8?B?Wk5xcTVvYU1rR3lseFU0V0pRSnlMSXJVUnpxZTJzZlM5VFZ5VitwUnd6K2VS?=
 =?utf-8?B?UzlWMDY2NUp6RnRtS094L0Q2azRGVGR4NEwvVHlUbVhZSnB5TkMyM0c5UkNT?=
 =?utf-8?B?aXZXRGg5bUlheXNVakF0dE1RSm8wMEFCSCtHdi92ZE94Q1UyeWg1amdSVGsw?=
 =?utf-8?B?b01oQ0NoNVdOemxwajFpR1JtQlVYSW5SYlRIRVBjVHkzMEdIZHJrUHlHbVc3?=
 =?utf-8?B?OTdjTjhFZGZRSzdXU3Q1ci9EL243SGc1MFZzdFZrSS9ERjhDaVAvbW0xdHJh?=
 =?utf-8?B?T003VTViR28yY2txaXovTEdvSHFDQ3JIK21JV0JYeE4wWTRCMW91di92RmJh?=
 =?utf-8?B?TzFPUzhicDl6MkVKa1pPREtncEpHM1pXdTdaV0IwRFJFS3kzb0tVdUtzeXYx?=
 =?utf-8?B?QkJqdVhiTWZGaXFkdnRrNEdmU3FZd0l4Y2dZYk9YaHVpVEtBaG1lR3JmQVZv?=
 =?utf-8?B?RTRQSXkwU0tZK0djTjZpUFFHQmZNWVVQR0hXbXg1c2NncitNMUdjU1IzRk5a?=
 =?utf-8?B?dVd4L2FCMDNDU0VlbWhlT0FiRFJoUlMyb0Z0YUUvelVKb3QzRHVZb0JLZ0Fo?=
 =?utf-8?B?N1Z0bU5Pc2I2bVl1SG9IdVRiV1lIWVRsRnBNYkE3alhaeTFmeE5rVkhNVkdy?=
 =?utf-8?B?QWUvcnEzQTk4SDY4aUZzeXE3ckNJaDFiNlA3VWhTVUdPTWdQOXJYdTlvQnR0?=
 =?utf-8?B?ZFpvLzN1UmhYOUpYalNJWklwYlVGZVpQYnVPWGFvZTdwSWF2dzN1TElPUHA0?=
 =?utf-8?B?VGdPVDI3dkoxSGZ6UldDd3BaRloycnRkcFRnYjVBdWdBQzBiS3NVL0ZJYkRj?=
 =?utf-8?B?RHJoNU9ibSs3TzcwSVg5dUhDdUlFVi83NzdhcFRVU2YrOXpkY3JzU2Z4T2Vm?=
 =?utf-8?B?Skc0dEZmNWE3MEFDQWx4Ynpnbzl0dmJsdmtERXFONmo1U2IwaGdTd0hobDZq?=
 =?utf-8?B?SDUvRlgwTDFLRU15MjdQaW9tNTZTZjAzV0VkRU44R0xPR2dZS3RRRkxYRHli?=
 =?utf-8?B?dDVDenhDMEFtVUZPUEZUazdGWE1tdkg2MkR4c1BHd2ZIaGNZVFFOOUVzVlUw?=
 =?utf-8?B?NjVsQy9Ic0szV3JJN3J2andNSUV3Rjd2ZW1hb1pxUlcwNDVFN1AxM3pweW9x?=
 =?utf-8?B?eVVRUEJUYmNxRXVlVE9kTVVxOFoxNXVJdjdQQVp3OVdXa0oyQlY0UlQzUjMw?=
 =?utf-8?B?cDFGNCticFFFOUc4L0hUSUtRaERqUlpwQ2xaWFpCV3puU2c3QWs3ZmdGempv?=
 =?utf-8?B?dlBUc3F5aytPcEYvTGZIb0NsWnVUU1F6blBwcjZDTmw2ampFa0t1QnhNb0Vk?=
 =?utf-8?B?UllGSkcrNGNsbmlCZEt0NHlPQ0Zwd3h1VWVQbjVSQlNaa3laUisrV1NzdVY4?=
 =?utf-8?B?eXp0bFpHaGwvczIvYk1CZyswRVdGaVpKUjZUQkMzcHR4aHZ2aXVTdFRlQ21F?=
 =?utf-8?B?WGNablN2ZnZoRVhab2ZGLzNqa2FBN0ppeHUwd29WdE1YOUxxZnN6V0hkWVRG?=
 =?utf-8?B?azNxTjIzUDl3MkljT2g3dGZnbnJGYkMzelREaGR4TXRtUlJCTGs3ekd4ZS9l?=
 =?utf-8?B?N0RrTFJqbjJidkpkdStRTm9xcXgwQWxadXFnNzdnUis3Si83VTlwRFNGc1BB?=
 =?utf-8?B?U1RPSlpsQUh1ZnRnTjJVa3BqOEZVcTFUZWJvemFOdWNad204eFBvenVnTEFG?=
 =?utf-8?B?aTN1M3VCZkhlMzJIajJtTTliZmtZdmRRcE9rcEh1SzdiS0ViaTRobGxJbTZt?=
 =?utf-8?B?TWJXbW14eCtwVnduVGVEWTlIZ1BhUE1MWXN0OHBMMEJJSEp2SVFkcDM1UFV4?=
 =?utf-8?B?b2Z6a1RNUS9aSHJaRW5kUFhBelY3VHFmbjVyVi9YMmxSOFpPOHdLbjc0ZWRp?=
 =?utf-8?Q?lVsCfhJNHHy5S+30ZsagUE6R2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489d0d93-e61b-4879-86ce-08daddb665cd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:34:29.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4ZMC11HNqhyinTy4c+k7z3LXr1+W0JXztO6yHGePsIKw1iNPtvRa5lX+Rm6/LIgq9snW0VROxJ8uOlWpZxUuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9338

On 14.12.2022 00:03, Demi Marie Obenour wrote:
> This was missed in the initial patchset.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

I'm sorry, but no: In a v2 submission you should address prior comments.
On v1 I did offer to extend the description while committing, but you
should not take this as an invitation to make the committer again put
more time into getting this into the tree than should actually be needed
(and reviewers to re-figure the unmentioned aspect).

You also will want to get used to adding brief revision log remarks
outside of the commit message area. It would be relevant to know here
there the sole difference from v1 is re-basing.

Jan

