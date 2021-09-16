Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228A740E09E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 18:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188624.337852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQu8q-0004qm-R7; Thu, 16 Sep 2021 16:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188624.337852; Thu, 16 Sep 2021 16:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQu8q-0004ox-Nc; Thu, 16 Sep 2021 16:21:40 +0000
Received: by outflank-mailman (input) for mailman id 188624;
 Thu, 16 Sep 2021 16:21:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQu8p-0004or-5E
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 16:21:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a4a559b-170a-11ec-b619-12813bfff9fa;
 Thu, 16 Sep 2021 16:21:38 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-43BqqwukOHe_IaFL9g1n1Q-1; Thu, 16 Sep 2021 18:21:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 16:21:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 16:21:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Thu, 16 Sep 2021 16:21:33 +0000
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
X-Inumbo-ID: 2a4a559b-170a-11ec-b619-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631809297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wY7TnsrZbWO1VPz9llXFhPuXTujUHRVNln7a9qarJVQ=;
	b=fD5oqxzxMQyMJqKsNsKlymNpEQiLiuUuejuMYKIb2Vmb7YF3NWcBXD1BkMOSPQ4TK5HoeG
	TjP+y1EA9q61OyLzfK5E4F9a33iune1k6goCSmH1idhUcnEXqZsZLGgSTIVcvOMAG6Pc3I
	Q3n79JgeFRPHEDmEzJcNViNKS51i9Sc=
X-MC-Unique: 43BqqwukOHe_IaFL9g1n1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXLxaUrZc04u09im7vYN3iEtnKB8q580ZyRMOJdQnlf9Z34W+VsRONJ/z6VMY1Ow+776uJqXRfrXyvOXt7DUq1Kho3fXAjD2219kctPp9jziB6Yw8mU4Fu6L9K1dZQqp1rAwY+Nb8PnudE3pA7/PMnS9T8hUbrfOPne88MMXHCq7zodZbjq7ML0D21mmCSG/aMaaMhh5Dd/rKhMepSL6sCnzABjwxj6IzLVpDyC5TQ47Bfr6j5xHbMEiTAxRlNJHGRge9ez3lzw7rCmDknYsXNJZOY1FIMIk+7FZK/qwscfquBKDhsX2FD5foHdIZa1CFOIO4xGg16PwZ1cFPUApBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wY7TnsrZbWO1VPz9llXFhPuXTujUHRVNln7a9qarJVQ=;
 b=muY+lrfhERL5+/KRuAxT++KhOHUp2T/zTPKvkwPgTspu//IwdMhqgiRgV/ACBd5ECyrOu2dG99M8TMU/9HDbOopS64Mn0YgtGTTVq7EuS31z7ND2JiY8mqC26bgEoouv2h0B0R8Ag9DPjqdEhNgaVniTUMnzyVVZC33neufN16ufDNwdBJhrLh4jzKBc+0JzF/7MiBPDAoAzi3yO+FzpNM1OQdmD4PvDv75DFdoTPkFyKO68QFN3Z3x60GRSrx3WzEQy4Xnl+58J00fzhTZYx1S/Y4SCr0jItLC2H10z2gUwXbUud2wVUK18B+aXLavcZSiv//1gYgMiUu9N0pXMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
To: xen-devel@lists.xenproject.org
References: <osstest-164996-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
Date: Thu, 16 Sep 2021 18:21:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <osstest-164996-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d92193a0-a1b1-4aec-d89a-08d9792e0cd3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6303A406665D9253EA1F073AB3DC9@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tH8h31edKHSy/nvCFZHULRYCKNbm4i+8gOMTNNZ5Qn96ueSOomXa9kxDYslN7brEHhJIIVntFJ2GDR9sq+hJ3YgPvDuZ3n6yRlOh9xD2DsDijx1hJMTFqNI0mLx2TPFOgMUbvLqWLthBFt9WbGEQnXl7pE/fSYi46r/xT8IXEFvduSfsYMkSE+++hrQg71hwyGmghm6rBLYb65Nq1GqkdrDi15dziGLuSG4Zb4592bBsAXM0tsBpV9JqIKJZNwFatBkcwcZpkkmtFrR8/buE6ruuuNSRQO3AfyDcMRR8Mc+goeuhb8uqOmlD/IN4Yg2Cz5i+HPTBFGvlWnVSqiNGEt+HQPfjiIpydoJLiSFM/s9livEa+QnWuMc7ExKNrsz4nCPukqfY3DPQ0NM+fgXZKqAyuB9xirMy0Aoi0bSrME374WjkQdB7cmRoAmTLsecAx5AW1w7pJFsUgE67ynjqpqRee3P9Tk3lEqCx/rlPWG2r+/OR3oiyY/XNwo5eGQtkTSAmf2LEygt0ZotY/LPRpK0r99z8LOoAjfUw4w2rPgZPfgMTIKMUnflySz65PJ/LUQEld87q4vlOx65sdy4h+n7+xAV2RGH7qI9cqDcoBf3oX03VQZYjOu5lS9SVyapySoZadOAekptvI9QkrRIizIOxEvN2poYbcz/ViTfIS7GEqhtjphoECC6GUgWrThlz7FkNpbOJhk/VayfTJp5ChDmrgmnZOJpHGnZi1I20pCXAxPQ2adn6nviYo5Iw5hD7L/++4gIAKQTiN7Cf491Kn6x1KkhyDhR2TLZhNWZhTlgGWuMCqW22tDI7nsAuIG3rcXL3FbFPiJ9ENZt6c+DPMA1Kr01XBPK/hY7zW0J4n6U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(66556008)(66946007)(2906002)(6486002)(66476007)(186003)(8936002)(38100700002)(83380400001)(6916009)(2616005)(4326008)(956004)(8676002)(26005)(36756003)(316002)(16576012)(31686004)(5660300002)(86362001)(31696002)(508600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHcyb0FYeGRpWWV6d0h6WWIrR1JYZjBLUGJXMUUvYjFRYjYxWlAzblluM1R2?=
 =?utf-8?B?SEZZYTRHeFV4RGE4cGhzclVJVE5BMVNDZTdsUHdqa1ZOUGRGcmNoQWJxazAy?=
 =?utf-8?B?dlVBVUNXcGd4MWY1Mjl1NE83YlFnYUJiWkVPUXp4QTlOWGc0SXI3TzdhK0N4?=
 =?utf-8?B?N3l3anNFRTRkaEo2SmFpY2dYSThkR2wwS0NnMlFZQVdXTXRCSVFPbFpCT1ZL?=
 =?utf-8?B?by9VS2x4RTFobHUvNXM3MmJwcFo0N00wbHpablV1bXU0RkpLbExrUTFvZ3Q4?=
 =?utf-8?B?OWV1bEFiVzVQNjRJa1V5S09odHp6VmtsK2ZRTHN6V2UrQjlpVWlYNnJ5Uk1u?=
 =?utf-8?B?VDlPWFB4RHRpNjBJK2RGNlhicnUwbkJqWUhvV3g4eXVVcGRCdEgrMmFXWWhu?=
 =?utf-8?B?d0c2cDIwNjg1UmVrY0xDZ2MxK1JJVVhzSEFESUFtVVczOG5pS09wYjZZb2ZD?=
 =?utf-8?B?eWEwa3pocXdyam5pZUJyNXVXUXRvdDF5YW92dEZlbGNTamNaMnl3ZGk4L0wz?=
 =?utf-8?B?RFlHN3p4aXgzR2ZodURHeGRYOXQ5aDNiSkcyZGtXL0s3ZG5sYXBkb2ZtTm45?=
 =?utf-8?B?WjFGRURPUHFOb0ZFOFhsN2ViclBXTmF0V29KQk12dEY5c2p0OU5HQkNxaU5R?=
 =?utf-8?B?bUlkMGJFR3dkT3lQMDR6VUwyUmpneTRKUGxqdm9qR2ROR2VVenpFbWxHdTdo?=
 =?utf-8?B?bnhvMTRQSGRaZ1JvdExkY09LRnIwSnlFQXBSVUVoZ3F3K1lWZU9YV21oWEhC?=
 =?utf-8?B?LzB3WnNaQXo4SUlWamkrS1MzSTZNeEsweWdZL1YzR2xKMTl1QWVGSmxLZEpw?=
 =?utf-8?B?WWY0bVQvWmpDYi9WRkxBSUF4Y0V0cWFTY3ZORG96VGhMWG4xMG1zbFEvK25M?=
 =?utf-8?B?bW9iYkUybytENUFVbXdtWFBnNEpWcWNjbTdYTVliU1FYOXU5c3JuYzZmc05L?=
 =?utf-8?B?MW1vMURldnN6eko5bDBEM1F5cW5tV0srMjF4aW1jQXhMell5ZE5Bd3ZJSmZM?=
 =?utf-8?B?ODdsM2gvL0JTZVZLZmpHQVlhOHdkT25OZ2VpOXh4TFAzeGZGWEMxbXlEUytn?=
 =?utf-8?B?bW12eWhCTVk5ajR0TUdUNks2dVJiQ0JLMkI5TG1yYVl1ZXFZVDhVYThjaHg2?=
 =?utf-8?B?VHJoR3ArMmJjSXVIL2VlNGZ3bWRBbXo0eE53T2NTdWpvUmt6RVNBMFZWTS9q?=
 =?utf-8?B?SjlwMHJOZzAwa05paTZHRVFDc0pJVDAyMGovN0NXekVDN1BneEFQTWkxdGll?=
 =?utf-8?B?MjFCTXJGbnluN0gzdTNkK293dWtjZTJmQjJXby9hYko1dmU4UmtnZHJFaitG?=
 =?utf-8?B?RXE5UnlmMHF6SzZpR29DQ0o4eUVaN3VCSzhQSGhjT05LeEJtQk5LSFdtYkEr?=
 =?utf-8?B?ZnFTYzhDbjNleDNNQytxVXl0YU85SFU4WDF1Y0VheHFSVkMwRG9jTFJGRlBK?=
 =?utf-8?B?QzU1eDlyTmxBMmk3Zk81SjIvdHdCWVlMTFNFb0ZYY3M5cTNiMmg0bU1FL3RC?=
 =?utf-8?B?UkIyRWhHdnovVENuTmVIT29Xdk1tNXdESTJndUNubDBLQld4SlZ6WFh6RUJG?=
 =?utf-8?B?NW9BZG1FWDF6UmtZRkFvZ3FSUFFOMSs2Unk5Z1dNb0h5bGNkektmUEtEZkQ1?=
 =?utf-8?B?bnJFNldOZks0dHlhZzV3TVZXVmpiZWV4N3d5YVJqTFQwd3BsZldXZnRJNk5M?=
 =?utf-8?B?TFdDM0hpOGt0bHd1QlFXQWNUejRhT3lWRW9ZM0FhOVg0Smh6MWhmN2ZmNG5S?=
 =?utf-8?Q?7acQxRsKgFwmA4VBgJXk950rO7EytKVXlKK7CZ/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92193a0-a1b1-4aec-d89a-08d9792e0cd3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 16:21:34.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uDfg/kDN62BOjCUCFkoFx61hICQCNhkhJftZZYiHhprhznP7fS9qcIscCfZCBUryRey3f/auro4iysyYmK12Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

On 16.09.2021 06:06, osstest service owner wrote:
> flight 164996 xen-unstable real [real]
> flight 165002 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/164996/
> http://logs.test-lab.xenproject.org/osstest/logs/165002/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail REGR. vs. 164945

Since no-one gave a sign so far of looking into this failure, I took
a look despite having little hope to actually figure something. I'm
pretty sure the randomness of the "when" of this failure correlates
with

Sep 15 14:44:48.518439 [ 1613.227909] rpc-worker: page allocation failure: order:4, mode:0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
Sep 15 14:44:55.418534 [ 1613.240888] CPU: 48 PID: 2029 Comm: rpc-worker Not tainted 5.4.17+ #1
Sep 15 14:44:55.430511 [ 1613.247370] Hardware name: Cavium ThunderX CN88XX board (DT)
Sep 15 14:44:55.430576 [ 1613.253099] Call trace:
Sep 15 14:44:55.442497 [ 1613.255620]  dump_backtrace+0x0/0x140
Sep 15 14:44:55.442558 [ 1613.259348]  show_stack+0x14/0x20
Sep 15 14:44:55.442606 [ 1613.262734]  dump_stack+0xbc/0x100
Sep 15 14:44:55.442651 [ 1613.266206]  warn_alloc+0xf8/0x160
Sep 15 14:44:55.454512 [ 1613.269677]  __alloc_pages_slowpath+0x9c4/0x9f0
Sep 15 14:44:55.454574 [ 1613.274277]  __alloc_pages_nodemask+0x1cc/0x248
Sep 15 14:44:55.466498 [ 1613.278878]  kmalloc_order+0x24/0xa8
Sep 15 14:44:55.466559 [ 1613.282523]  __kmalloc+0x244/0x270
Sep 15 14:44:55.466607 [ 1613.285995]  alloc_empty_pages.isra.17+0x34/0xb0
Sep 15 14:44:55.478495 [ 1613.290681]  privcmd_ioctl_mmap_batch.isra.20+0x414/0x428
Sep 15 14:44:55.478560 [ 1613.296149]  privcmd_ioctl+0xbc/0xb7c
Sep 15 14:44:55.478608 [ 1613.299883]  do_vfs_ioctl+0xb8/0xae0
Sep 15 14:44:55.490475 [ 1613.303527]  ksys_ioctl+0x78/0xa8
Sep 15 14:44:55.490536 [ 1613.306911]  __arm64_sys_ioctl+0x1c/0x28
Sep 15 14:44:55.490584 [ 1613.310906]  el0_svc_common.constprop.2+0x88/0x150
Sep 15 14:44:55.502489 [ 1613.315765]  el0_svc_handler+0x20/0x80
Sep 15 14:44:55.502551 [ 1613.319583]  el0_svc+0x8/0xc

As per

Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:
Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639 inactive_anon:15857 isolated_anon:0
Sep 15 14:44:55.514480 [ 1613.324918]  active_file:13286 inactive_file:11182 isolated_file:0
Sep 15 14:44:55.514545 [ 1613.324918]  unevictable:0 dirty:30 writeback:0 unstable:0
Sep 15 14:44:55.526477 [ 1613.324918]  slab_reclaimable:10922 slab_unreclaimable:30234
Sep 15 14:44:55.526540 [ 1613.324918]  mapped:11277 shmem:10975 pagetables:401 bounce:0
Sep 15 14:44:55.538474 [ 1613.324918]  free:8364 free_pcp:100 free_cma:1650

the system doesn't look to really be out of memory; as per

Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB

there even look to be a number of higher order pages available (albeit
without digging I can't tell what "(C)" means). Nevertheless order-4
allocations aren't really nice.

What I can't see is why this may have started triggering recently. Was
the kernel updated in osstest? Is 512Mb of memory perhaps a bit too
small for a Dom0 on this system (with 96 CPUs)? Going through the log
I haven't been able to find crucial information like how much memory
the host has or what the hypervisor command line was.

Jan


