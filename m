Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C864573D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 11:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456133.713849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rP3-000319-Uh; Wed, 07 Dec 2022 10:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456133.713849; Wed, 07 Dec 2022 10:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rP3-0002zB-RT; Wed, 07 Dec 2022 10:11:49 +0000
Received: by outflank-mailman (input) for mailman id 456133;
 Wed, 07 Dec 2022 10:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2rP2-0002z5-AH
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 10:11:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eafef26-7617-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 11:11:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8118.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 7 Dec
 2022 10:11:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:11:44 +0000
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
X-Inumbo-ID: 8eafef26-7617-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C99zVsvAMCbjdqDLUA/zQaaZlEDne2MS8e9MIaznT0MrxeXC4DamurIYu7eQu6BmjxCmSPmWRbw5HLCXGr/bJ89AQI0zL4pVj/0lrWUdWi7+amjcNOwzzOyqS7jZLHvB/HGgPYpQuJUYAE80SCyMlRr5MkBkVkrwf7fu/gQCO6GgT2hTzZquvtuP53FMwZ8zyojScXJ1YHYM9baS1TnpYI9XtLjCUW694LpROJ912ZdIRHvqCK0muSrDzVINwovRt4SnEQhy2CIF3hMYaG+pP2C02T7GI/DsNrf+bdlBBXM9pOUbbNuhgeb7A7MoJg+QvGRPbm2Xz7AMqAqbAF8Ypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TroBOdUX5HfBGqTjb4GCit156LcMDpVDMRjHzR3YSVU=;
 b=Ww/91U0w3L+VG7pAiZTO+zqEObZpHP5pncnDN7cjfs9Vj/miCLxfFdGLuNaESuEOGLfvJ+RNy2z/M9xdeBKtmIvENDHzAW9mJI3kMbEyefv47knNaZc0DJZZqEjjA2sbEYCjK41pgVBqCBgDiLGyK8TZVfiQUcIhWQ0bOZ0+YHWR+hfC8OrivusUdhfrkf+kzso3tgu6plF7JXBtibNpffIvxeaRfA7WbEjvziGrEbkS0MqkzkNYnNaxR3mOErTHmV4IlSPNK1QbcRIq32frTtZF5YXhq/6GL9K9/FBFbonX3VV0/Z8/7wwPrltzuVvQw0Raxq636vQyjMGWadsmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TroBOdUX5HfBGqTjb4GCit156LcMDpVDMRjHzR3YSVU=;
 b=2eHpgqUy2D3jafoLxoN7OaWYqt61Rx3TFC5fFo4mb36P6x710rSgM+Mf3tcuv8YtslqC21v2RW4kr7FLNsbfXd+WtMYQJucF6I4nN/qzrKVSYJ/BKbRl/Bf6BAg+p5eUDwrepwrW07jsQ1KI+jOl+sffJgw4JsjFrMG1pes0DXVhH2XhZwjQs6u1s9PxPHI0iWImR6j8R+4bX9qbRHk37QwrkvaTqDydQvmD2/kGWuQbag2YLl2s3Bwio/vi2nfIXPC4S2bk/ClloiQhEggVgTTGjXzlvAfzrzUZFzxZf5NICnaiz+1qqWhpSBX0a7V6rlsbjvHz4x3PjU0gBr0aLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <678b618d-335a-fc9d-97f2-2c6e0e05ed79@suse.com>
Date: Wed, 7 Dec 2022 11:11:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Ard Biesheuval <ardb@kernel.org>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fef9a77-de41-49ad-fdd6-08dad83b70e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p4AaAjCR4QPj/gcQcxv+rc3qXjzExg4W4yVaWOW58IZRQH8itIFEllOHoWkjb2HjgJt4TJGM9m8WR+NkKxppsMETi2k3Lyc+5Q6uh/0DqSB8DDafK7CopM0+0xBJlXQKYBLt9nhQweWqgRnVPgOuqjcCT7vTDa0wMAlHaX2m7tKuJVyf+F/z65FyCwlvP3q3Bohh6NUjRQe9mxo0qozVjgF7FPNxuQ1f3OosqpJweFYGjT6liKPGuk6qeyzbH3+34xRk9wSTVZLc/CEB2B0uVtlQJyvrqN7Z3PHqd0/8Xqd7/5hqrWoNSWIDTxuxZq6GaTcYdB9zbl9GP4/Yff3YURveH4BNgIS5CzRqutecf2C/yDI+RvYOLiIGfZyac5MQLLnMjsVNIJKxnx4IokMgk9S3jFYLYOeWkE/ffJPHy58KFh3975mYHjxUDIJDhI5hy86DlRGepGoKkBGJ9XlddvlgFUahg33rR5cKf7kcy6Qh/mQVbqbOX/1lwxuXoMAkGwlLVj8BZo1OsselivtK7U9oGNOTRIxAJw8QDgoc9N668+0KE053XcpdYQPW9/RPa0vUTM3/MLDdwlXmpANGa4f8RHIn1moMRrnCV0Omzw6rNQaLlq3tSlb5BS5Me5/uy5Nz9mVo20bAezfyqfC71VcOPNgfruY45zHe5FzJF530zazDAeQ6RDPwCV4dcDvbkqHIiWn5jBux0kpgZiiUsQBQa9yydWS0e0B3drAuqTJWvs1SXdXes/4cWKh6+cHMu+C9aa+ZJs5PgxdFwbEdtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199015)(2906002)(83380400001)(31686004)(41300700001)(186003)(36756003)(66946007)(86362001)(31696002)(66476007)(4326008)(38100700002)(6512007)(8676002)(26005)(66556008)(2616005)(966005)(53546011)(6506007)(478600001)(8936002)(316002)(6666004)(6916009)(54906003)(6486002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVdHMHAzTFNud2hlWEV1ZWVFZkZyWWI5VHZUQVk1TzFGYm9odUtIdyttSEJZ?=
 =?utf-8?B?bXBwUVNodjRPdzdhOE1jd0hqeHNBSlNkcWR3VDJKVmFXM1IzdUpJeWtTMXc0?=
 =?utf-8?B?MGxGLy8rdTR5ekdFeDlnUENIT09HZmpLWmZQcmNWUEpwZ3VESENDRjY1NDRj?=
 =?utf-8?B?V0NOWWozRWZGekowaUptcnhjcTZzWUErVFBqSGFycHhzcy85Tk1nUk56UlFX?=
 =?utf-8?B?c0JYekRjU0xNbUwvbUU4TmFMZFQrOGxPOUVGNWZZZi9vZGZERFAwQUY2UzVO?=
 =?utf-8?B?OHNMNzd3cVFyNEZ6c1VDaE9oOXp2clFqVVVLN1ppelhnVjIvME1SQnBFZmds?=
 =?utf-8?B?Tlh4dUJWKzNnVHR3S1VsQ2t4S0t6enZUdlRWNWttWTc0SU91V0MyZ1g5MzdP?=
 =?utf-8?B?ZjJPaXdNMkpzUE5kWXg3eVVtUEdFVGwvczdiMzJneDhpSmpQOXFwQmFQSU8z?=
 =?utf-8?B?UmVXclA0N3BBcXNEUWRQVThuNXBjNTdqVWtkbzZ1d2g1L01NcVJTclYreDNX?=
 =?utf-8?B?cTRrQXlSSUNNQmJsVjFBVVREU0srZk8xamJRcUVuaHlmMGt1WTQzcFlvdWZ5?=
 =?utf-8?B?U0gyaDl1ZlhiOW50Tk9QWVNsdlRrNlJKYVQ5RmwvbFhPVEhMVmxudkN0a01Q?=
 =?utf-8?B?cFFMRWNRS21tamlHdXNVbnhGSE50UUlKbjdSM21vL0ZHeXVmdWdpSVNYZmFr?=
 =?utf-8?B?TVRBZlJ5cUNOc1hFUldLUzdXZThoMkdVWHhRWTdkbkZJeVBrRmYrVEd4R0lH?=
 =?utf-8?B?NzNsajhhVW56L01jT05rSW5OYXo5UlNZYVNLMVFZYnZLVU5SMHVicjVkQlBN?=
 =?utf-8?B?VFRuME84R1lRVyt2RGNEK3pBMmNyRXpTcjdoWXlONjc0REdxMjZlRFpWN2Nz?=
 =?utf-8?B?VUJCQzgzMzdGTFE3bS92d2VOWEp3K210VTE2VzJMSklCL1l2NUZESjdQKzl5?=
 =?utf-8?B?T0h6RFp0eUQ1WXZ1VEJpeUpqd1lpSmEwWXdWVjQ1QmJKWmVzNXl2Rk4zUXNy?=
 =?utf-8?B?bU1Wc1ZSRWpoT3hrSW1OMnlhQUZIQWpMSHNONFAxb1FvNFluMXR6VGZjYWtF?=
 =?utf-8?B?OXRkYTg0V3RuTkVPVWlTNGlSWGNCRlZJQWExQmprOG5HaFBBWWppZUprcWMv?=
 =?utf-8?B?bXhGREV6d3NlcnZIVUhOR01xYUtlaE5WcXFUR3U3Z0c3cEpkOFEzVE5XajdC?=
 =?utf-8?B?dUxRYjJHSi82S3Jqd29DeXVZeHhnUnFoWENjMXpTQkFyYmR1Vm9VRWhmWk03?=
 =?utf-8?B?c0h0aWtqakozQ3hreDhSWjFtRDY3Zk10S0hlK2RQbWZFL1Y4UW1qZnBQUlVI?=
 =?utf-8?B?Wml3ajRTYkYrbHF0WWZrS29ZSWE3eHI0RjlvZTFJRTlJYTdRdGwxanJJeXFO?=
 =?utf-8?B?RXZ0NTQrcGNvU1JVZk5YZVRUazRDRklzTy9PTm04REI2cmxlR3BsNDE1TTV5?=
 =?utf-8?B?c3JVaGM0TlUyWGVxL0hPMnRhY2dFc2x2bUNDQk5RcjV4VDkvd1pWRWh2OCtF?=
 =?utf-8?B?L1hXRk5aOTNDK1FOcE1ybHh2cW9sdUV0Z3VqNXJkY1dCUVZORkVlaDNvb3lF?=
 =?utf-8?B?WEg4U2dCT2szODdVT1U3YndrN21HWTlpbzQzVXBvNk5Ba0xFOFpCQTU4Y0tC?=
 =?utf-8?B?SlNvZTlyOWlqRUJWdkV3WWlJeHFaUzc5Ny9FV2h1VG5HSnoycDk5QlFYelpk?=
 =?utf-8?B?aFl2aTIzMzU3RWZkb2J4c2x0TU13a3FsSmN0OGdsTnVtNFhMeDBmQjViUDUw?=
 =?utf-8?B?YVZQeTdJOXYySzA0QlhVRmpxUWhNOUJJYzJNajhCQ2F6THZXY0RhaG9QUnBy?=
 =?utf-8?B?dHdSa2ViNHZPYzZJcitDcERQSlp5Y2tuOEw2V3N0UnFjM0xUTTFLUDBrOCta?=
 =?utf-8?B?cmRWWmg5SWN2VndhVyt1OGozajREZ0YwNDQ5K0w1ZUo4Ry9mQlVhZ0tZaHlQ?=
 =?utf-8?B?V2t5d3VlYUZPcjdUWXVHVTJzU1pyengrV2UyL3pTazBoNXQ0VnlnaW5IQXRS?=
 =?utf-8?B?SkZ1UE5PZU1WMXJjeUQ5QzY1cUpkQU9WSEx4V0pmUlR4azZFTDdXcmRQUmp5?=
 =?utf-8?B?R1g4RXFJeU9CRGFicWZSUEdTZ0VjcERYTXliNTNpdkNySTl3QjY0QUNMOEVP?=
 =?utf-8?Q?KUSNvFfH6bWKpjFxhpwbwCBCh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fef9a77-de41-49ad-fdd6-08dad83b70e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:11:44.0515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfSHALlpuzXMuHtHbqK2jzBemfsKQnTeCZfYyUouqPahPvCzS6nyq80r0ChdW7kUA0WRkxi5AQcgM7h5d8kHLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8118

On 07.12.2022 00:27, Demi Marie Obenour wrote:
> A previous patch tried to get Linux to use the ESRT under Xen if it is
> in memory of type EfiRuntimeServicesData.  However, this turns out to be
> a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
> winds up fragmenting both the EFI page tables and the direct map, and
> that EfiACPIReclaimMemory is a much better choice for this purpose.
> 
> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01365.html
> Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
> Should this be included in 4.17?  It is a bug fix for a feature new to
> 4.17, so I suspect yes, but it is ultimately up to Henry Wang.

First I was surprised this is numbered v2. But it indeed looks to be a
plain re-submission, merely with Henry Cc-ed. You didn't address my
comments; you didn't even incorporate the one adjustment where you
suggested alternative wording and where I did signal my agreement. All
this form of plain re-submission (without any kind of remark in that
direction) did is that I spent (wasted) time checking what the earlier
variant had, what was requested to be changed, and whether any of the
changes were actually carried out.

Jan

