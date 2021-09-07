Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78514023A7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 08:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180450.327120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNV02-0003Ge-8j; Tue, 07 Sep 2021 06:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180450.327120; Tue, 07 Sep 2021 06:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNV02-0003DS-4X; Tue, 07 Sep 2021 06:54:30 +0000
Received: by outflank-mailman (input) for mailman id 180450;
 Tue, 07 Sep 2021 06:54:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNV01-0003DM-1R
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 06:54:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c4fef43-8188-4913-a64a-d6de9c1a02b7;
 Tue, 07 Sep 2021 06:54:27 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-Tx5IdKCpMGGYJcqTF6j-Cw-1; Tue, 07 Sep 2021 08:54:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 06:54:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 06:54:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 06:54:22 +0000
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
X-Inumbo-ID: 2c4fef43-8188-4913-a64a-d6de9c1a02b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630997667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hqt8KpC+/cLPQGezf9kbhcn7tWO956T4Rz/kcs8uU+Y=;
	b=nHEndOrvXG0TETMQaPDvkGsH9YxyEVR7pRXsd5SqzcFMbS9z62K8EDkO+X6ZXpcZw6lcxO
	sWZFFq7diA0ZQM9vyFrNQBj6Mecuks7RhIY7mshwKszUCgupcIUJirG/iLgiyQ8UgSlzVG
	OFXl7P3hh7HrZIn+46ypNsAjLhsCmXg=
X-MC-Unique: Tx5IdKCpMGGYJcqTF6j-Cw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMppmzkvfoDfCDXioiJMvUs3WB4q73YFpeiuLgVf8zOj/qsaIqm8oiBG7h9ad14PdvM/8bBNpQ8uQwRV1Ax6YHJJFsluiZlVkz8sBQoa2LM/iXdwFDmz1iMewNGsU8aDhkVfYprGs5yb4Ed5V5jToGTguu89KsvCxb3wroZeyVFfVdqqTPFC7Z8S+PZuLRBrObMnM0Y9Mxc25pXAogKzOYuoOmLUxdSlsP3KPZQeBJ76OKSx8TKS63vPoKs66Ub+ottIFRotGqgUY8Nfj8/05FDZqoO4A6OId3nnCPzeBjlF6/a7sP8K4l2CWVp/pkM+WU5GdjeWlTMujCxBw0MM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hqt8KpC+/cLPQGezf9kbhcn7tWO956T4Rz/kcs8uU+Y=;
 b=SCDoFaNgwzabALppQMsCmPza1E6jAgogXmAGhjBObvhJ1yiNMvhNUSNfs9j3Z7tRJ7NEcuKJfK5VFB+pkefEpNEjvKVIqRGc8S68RquqjGAT+L7Z6CakNf5sY5JVsQCTEJkG5PTpq5qfRsvg0uoRblRkgqZCsdTYzfWCeqpI8dNLqYd2GSkn3h70mEJJUadBWD+fFladbyrZTpcnq+ZzmVHGasdX9ICNJZpV0W/Tp0bFlrD54LAUr+q0q6/fpp1Ek7veacVQM2ISvisAhXehm9ExpeQbRcoUsA/QCkxDMbeMD66DaZQqcK2ls9rms9sbykyZxwQGlXQyIcXoio3ZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <468f4d74-d469-51f9-a0a0-3fcbe24d298c@suse.com>
Date: Tue, 7 Sep 2021 08:54:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0027.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a47430a2-5556-4036-3873-08d971cc5316
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192EE6A52A7F002D2D326ADB3D39@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mt28rYVlfml3dEboFw6TkvNRYSiO8CiJZypLeK2Ii1i0qN2hT2XTEQaRrt9jmOn1wCpb2Tg9UbhqJpTCQd6gc4kuln5VBR1+OeuAB6uFHfJJExcecVt11mJI4j/qPJwoeHBSpGSR+Mv4u9MtfxzzIqCAL3MPrBiiEfTP2vuxP1/ORs9536sTTnJWyai4N7UqvOvWDBpBRCk4iK2R6A5aAd5t4VuWpIXO1iQIq0i8/XgUUjpjco5ZBaRyDiEnjGq6NLr4LFaqKBf2h4XBv59T6/RkB9dW375bRie25y+eY6JX9tpVbR9rZkRm9EsU0SroPvPuMrjVZ1pIfWWZ4MgsiMyhTiHrHGlMy29skl+Z6slzPT0X4kV04VjP+AekPJPkcLjUd5r9gkR6unT9iKpWNFHwylmofDePCh+7QEEkZUQj37EYx5oMSORdFWCqcstioYtvW4uitlj5iBQlXawdx0Kty+ltL1GnYB9YPBVrjctIDv65WJUpEkdHiu3D4WncUhn3HPOEHFnQ+uKt7fB6gsLU6ExB2kly1CplEhX7rmEFdepUQaTsf6cpO8/UvfN+0hYVCUa9TCjueDxhQ2v4yxkx5JIdoWR3PjkQtXKubP3zKpcbqTeKgA7hV70bFzx7ba5CQeGW4/Xlkq8krLrcTFn3JjMQYRCI0g/P7VURawlZA3XqoSDtFcDDYiVwVnuzFaqtjhiRGHtk4gLAL/suXi3qoq0+PzcFaJm3Js0ehbU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(376002)(366004)(396003)(31696002)(956004)(36756003)(8936002)(2616005)(6486002)(2906002)(31686004)(4326008)(83380400001)(45080400002)(8676002)(66946007)(86362001)(478600001)(316002)(5660300002)(16576012)(38100700002)(6916009)(66556008)(53546011)(186003)(26005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkVhQ1gzY2NTWjBSUWxKRkY2b0FRK2JySWpVR2hIaGQ5eElKblEydHZ1azgz?=
 =?utf-8?B?WGFkODRtdkxtdjRkU3EvOXFJcFBPQ2toU1JrcmZQcHV0QUl3Z3ZZbDU0cDh3?=
 =?utf-8?B?YUdOakNlRFJTZkx3eHBld0N6VHRkYzE1c2xJY2xHcTVKamprTjdJMnpya0w1?=
 =?utf-8?B?SVliSzZ1NXdnaUVTWWhJeWlzSzBjN2cyTE15dzVPYjdYTnRCamFyUDM2MStB?=
 =?utf-8?B?b3RGd1ZBMnRUNTZwV0dyNVU1WVNTeXBiN1dRNWY3a3RGbUZodVEzb2dWcE5j?=
 =?utf-8?B?VWs4ZGp2Tm42M2RXTnQ0d3l3amJTK3VrSWpldUdNa2tsYzc4WUZPdjNUR0dl?=
 =?utf-8?B?Z3ozaGhPWlVDNG1lWWpFNlRoQXNkNi9FdXptS1phaUwxMmVUMTY4MkZPbkpp?=
 =?utf-8?B?b3FnNy9xOERrb1V5NXZBTWhNd2JLZ0NVTWlhWlI2VUN1SXY2RzlVdHA2bGtP?=
 =?utf-8?B?S1ZDdWg5ZDlwQURzdlh1WUJoRnU2dURsbVpwWnM4NkRnYWhmMmFyYTVWUDFi?=
 =?utf-8?B?TkxlamlYWVZLY01na0UrRjdLMzVISGRTcUtFeE9nYVN2YVRVdzFyaldqYmZr?=
 =?utf-8?B?WGhCYWVWSktsR0lYZDJ2bEZBSU9XOXNWUS9wY2FLOGNRZ1RXeEpGcGIzeThi?=
 =?utf-8?B?d09qUzBndG1zaXJMbHU5bVFwcWVoTys0bGl6WHZFOUUyL2FwTGtFRnJ2WG5D?=
 =?utf-8?B?QUljRG8rem1zZVk4ZjF4UUIzMEVMTjMyb1dZVFBUR2doVk5HVi9JbExJS3lk?=
 =?utf-8?B?YXhSTEU5TStBdG5zd2tNemxjczY5ZW5NbzFrOVNCb3VzZmZVL0VFM3dva21B?=
 =?utf-8?B?TjFDaXUveWpSWGZxRjd6VFRhVWJIeUo1NlV6M2xFSzFYSEZBNE5RMWEzMy81?=
 =?utf-8?B?bGxZR3FoZGI0dzc3NkZpYXdlZnlncTZFa1Frc1VkRnUxem9Cbzd2bFdDci9Z?=
 =?utf-8?B?QnhaSXMrcUhSc3pUam54NDlmV0lPMmorMVN3bHJiUkVOZkdNSGNQd2wvRWVW?=
 =?utf-8?B?OG1aaUJrZ2hoZWhWekJIMXI3TXhEaU9ZSmROdXd6OG1ISDhZeWt5OFE1Qk1t?=
 =?utf-8?B?Qyt3S1o0bk90Y2xiZTBUdlJBT21CaEVoVFJ1Sk8wOUZPcVNpWGlBSnJTb2k3?=
 =?utf-8?B?OVl2bzNQTDI0OVU3NUZNckxCM1pscmk5OHJDbEVtNlJlMno1QTJSaFZOSzZ5?=
 =?utf-8?B?S3YzZXRuTGVETk5GWUJRdE5GWW1XWDQyY1dKSUpJQ3VLaTBaTmM2VDdpbXZ0?=
 =?utf-8?B?U1dEZHlYaGgrWVZiRzJWZEFDNXY3VnM1SzlTa0ViaHZhdFdpdHdUNEtJand6?=
 =?utf-8?B?clhiRHUzYzNvaklhU3ZYZG9KRkI2MzRReWdUZ2hYSGpOR3dnd0JyZFVFVmFI?=
 =?utf-8?B?Q1ozNUVaUHhXMFZkMHl5aHE3V2NaaENrSDdqR1dxb1l6WFdWa0I1YkpXditw?=
 =?utf-8?B?YzE2YmRJWFVLUmxDaVJKWUYyWWJXTWhEdVVqQ3dpQWJSdk5nbkFuamJHZzF6?=
 =?utf-8?B?Y0R3MFVOWno3RXNZUjdPaUN3endscmlCTEZTMGc3UmM3N0FiV3RRd201TjVu?=
 =?utf-8?B?a0d6MkE0dDBZeHRQcDRockYrU3pVL1QvaWFhTXVoK0JDUEdKVGw0WGpGZGtj?=
 =?utf-8?B?Zk9Zd1R4dUI0MmtzdW1TTDVtQmtyWEhjRVczaXUwR2FGY0UrakUvR1crRlY4?=
 =?utf-8?B?endPTWtpaWJwdCtZazNFbTkzYVdjNW5wMHpOSjMvUnZDbDBiOVkxb0FuZE40?=
 =?utf-8?Q?ckx4J0UnpUVHkgIrF/mv4j54pP8iIYTDwxVs+SL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47430a2-5556-4036-3873-08d971cc5316
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 06:54:23.5775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kftMAkS9f9pR2u+l8Wa9sjIRe8wwadWXS6YNx7hl3SXS8fx1TMjQSDecHKRtTyTWlkL/mqRTPa+H80WuN/9+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 06.09.2021 23:35, Sander Eikelenboom wrote:
> L.S.,
> 
> On my AMD box running:
>      xen-unstable changeset: Fri Sep 3 15:10:43 2021 +0200 git:2d4978ead4
>      linux kernel: 5.14.1
> 
> With this setup I'm encountering some issues in dom0, see below.

Any indication as to "since when"? Xen update, kernel update, config
change, ...?

> xl dmesg gives:
> 
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 63b936 already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a0622 already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6b63da already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 638dd9 already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 68a7bc already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 63c27d already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a04f2 already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 690d49 already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6959a0 already pinned
> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a055e already pinned
> (XEN) [2021-09-06 18:15:04.090] mm.c:3506:d0v0 mfn 639437 already pinned

This hints more towards a kernel issue, but I wouldn't outright exclude
other reasons.

> dmesg gives:
> 
> [34321.304270] ------------[ cut here ]------------
> [34321.304277] WARNING: CPU: 0 PID: 23628 at arch/x86/xen/multicalls.c:102 xen_mc_flush+0x176/0x1a0
> [34321.304288] Modules linked in:
> [34321.304291] CPU: 0 PID: 23628 Comm: apt-get Not tainted 5.14.1-20210906-doflr-mac80211debug+ #1
> [34321.304294] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
> [34321.304296] RIP: e030:xen_mc_flush+0x176/0x1a0
> [34321.304300] Code: 89 45 18 48 c1 e9 3f 48 89 ce e9 20 ff ff ff e8 60 03 00 00 66 90 5b 5d 41 5c 41 5d c3 48 c7 45 18 ea ff ff ff be 01 00 00 00 <0f> 0b 8b 55 00 48 c7 c7 10 97 aa 82 31 db 49 c7 c5 38 97 aa 82 65
> [34321.304303] RSP: e02b:ffffc90000a97c90 EFLAGS: 00010002
> [34321.304305] RAX: ffff88807d416398 RBX: ffff88807d416350 RCX: ffff88807d416398
> [34321.304306] RDX: 0000000000000001 RSI: 0000000000000001 RDI: deadbeefdeadf00d
> [34321.304308] RBP: ffff88807d416300 R08: aaaaaaaaaaaaaaaa R09: ffff888006160cc0
> [34321.304309] R10: deadbeefdeadf00d R11: ffffea000026a600 R12: 0000000000000000
> [34321.304310] R13: ffff888012f6b000 R14: 0000000012f6b000 R15: 0000000000000001
> [34321.304320] FS:  00007f5071177800(0000) GS:ffff88807d400000(0000) knlGS:0000000000000000
> [34321.304322] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [34321.304323] CR2: 00007f506f542000 CR3: 00000000160cc000 CR4: 0000000000000660
> [34321.304326] Call Trace:
> [34321.304331]  xen_alloc_pte+0x294/0x320
> [34321.304334]  move_pgt_entry+0x165/0x4b0
> [34321.304339]  move_page_tables+0x6fa/0x8d0
> [34321.304342]  move_vma.isra.44+0x138/0x500
> [34321.304345]  __x64_sys_mremap+0x296/0x410
> [34321.304348]  do_syscall_64+0x3a/0x80
> [34321.304352]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [34321.304355] RIP: 0033:0x7f507196301a
> [34321.304358] Code: 73 01 c3 48 8b 0d 76 0e 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 19 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 46 0e 0c 00 f7 d8 64 89 01 48
> [34321.304360] RSP: 002b:00007ffda1eecd38 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> [34321.304362] RAX: ffffffffffffffda RBX: 000056205f950f30 RCX: 00007f507196301a
> [34321.304363] RDX: 0000000001a00000 RSI: 0000000001900000 RDI: 00007f506dc56000
> [34321.304364] RBP: 0000000001a00000 R08: 0000000000000010 R09: 0000000000000004
> [34321.304365] R10: 0000000000000001 R11: 0000000000000246 R12: 00007f506dc56060
> [34321.304367] R13: 00007f506dc56000 R14: 00007f506dc56060 R15: 000056205f950f30
> [34321.304368] ---[ end trace a19885b78fe8f33e ]---
> [34321.304370] 1 of 2 multicall(s) failed: cpu 0
> [34321.304371]   call  2: op=12297829382473034410 arg=[aaaaaaaaaaaaaaaa] result=-22

Just as an observation: This (decimal) output of course isn't very helpful
for investigating issues like this one. But the 0xAA pattern indicates
anyway that what is being logged has been clobbered by the hypervisor.
For the output to be useful, MC_DEBUG needs to be enabled in the sources.

Jan


