Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F395575F22
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 12:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368072.599246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIFj-0000Rg-Ih; Fri, 15 Jul 2022 10:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368072.599246; Fri, 15 Jul 2022 10:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIFj-0000PK-FU; Fri, 15 Jul 2022 10:08:55 +0000
Received: by outflank-mailman (input) for mailman id 368072;
 Fri, 15 Jul 2022 10:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8RKo=XU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oCIFh-0000P9-9s
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 10:08:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 203b4ee4-0426-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 12:08:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9206.eurprd04.prod.outlook.com (2603:10a6:20b:44d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Fri, 15 Jul
 2022 10:08:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.015; Fri, 15 Jul 2022
 10:08:50 +0000
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
X-Inumbo-ID: 203b4ee4-0426-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpKSO2oPomHojWqPf/6keT8cOrJ9dvvYvW3mhFxQYg19JgCzZj1mjEv+B8tWtq8a6p4LMIlmV/1Q6fKy4Zf1kBdU+4YgGr7kGKuJ4YEhID+nqCOVKKfZTQQFZRYaAVCDFbFkdkHl9v+IXIMOaKw5yLED0+hIGsbxuKsVacbvTL2TfosZtG++g49QIo0rWWY8Yez8IWbfTEo59M0iprKm17kqQ57+DQQxrh/L1B0pL0ev4EiKqVlFdANh59rVd/rNRFcROlU9rSXzV3uL8mTkT0h6j5VLrIh863qxEsfCxhSHf1i3tO6qh3kjN/DexHOdhyLulPujk0AIs7+4K0VTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2a6LxpowYNbgTiewYZ2MIYtO8BA4A3pc9y7J+gBXMw=;
 b=W0iKkzCp4aSm+78oRDv6Sr0QcAMuxxOEeKsNp84qSeNUhLFSs6YjbC4cur2oez44GOXqcFAyxaFUT6aVOxRkhml6sSs5S0i+rEYWTemrAzPxjSaBorJDh5f5Ba+Tzbz86XIWDHeOPMUWM0lP9urYfxXT3939xLwVNZQYHoADWGBM7xZXF0HowBYk06c7a8fFD0kaS3ogS3rqL5/zyCyU+MtihqErLOC3xGJaeBRUMvaKcQLsNcEzDK5s2KtM+CkosGIyeml6o9TY3CKwUwehx03CSjPiO+amavs5eC/odoz4iJRUpueJiRoReR2f28dIr+dxlL90z1Ybj9QuS/G0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2a6LxpowYNbgTiewYZ2MIYtO8BA4A3pc9y7J+gBXMw=;
 b=YwYlMyqjsoFhKApoAJaO1b3+7HjdzSAtffPyGIP61T1boyQirrWJCbrWEjhUy5nixzgERJx5AaflYeYStJgbksX/l41d0q4w6l1x+YR11pzftf0YVj6iDICWV69fGGz7kbX5mypjJjHERZeDO7hQn4h2Mma6GIi4o3oo5EEdcPvsenS7yDx3TJ1VwCHhYEQ+LS8CTnOuwiPaDe3pE6iYBdey3rXb/7UeBnl4LX//OE+Z/2oZAyESNDudGVSC5ytVXHCKkJZk2SG3twm4XcdmUhXe78JqArc8dG2NhLvO7QYMF9sfUmH5lkB0B9BpoC7ffwXhPW+HwE3H9PGpvOFTbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c47e95d4-5991-3179-16b9-e746dd0a00e3@suse.com>
Date: Fri, 15 Jul 2022 12:08:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/2] README: State POSIX compatibility as a requirement
 for AWK
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714185305.29507-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220714185305.29507-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0019.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f2eacb2-1c90-4466-18bb-08da664a039c
X-MS-TrafficTypeDiagnostic: AS8PR04MB9206:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fZ6IjFm4c4mxT3gAKvlSiJipHdyit+Ke/eZ8n9AItMrOj3jF4hEQZQmXDOOT2qCPu83CYqaU3unAYmi0NsAqck4oVa0DrbJht4j+/zyha/iX9lcPN436v0k8OByi1WXeI0njuJ9fVAw38T2oGzxPvYHvqxiumoREXozLYd6EHZRLYuVAPW5q0WIqv6b19rAe6E8wDpWGEkQ+HTPmclfPtGF9nuML0hAMxUGkJLPY3DuqOj1/W1xHnYwV9m6ehDOFpYTumklMI9vz1aRLDQG5iQcR9ZLE84HRJ46fZSYdphm4bc4psZcF4ixYWKTJJIlds0K8iKO953BivgYeWu8D0pbXNb+cvdevZa+3YCNrGKNMsD6b7yhmw+vgLxKSPLc00Mz74nUSE8Gc1xYoS4wDz/ks8ztRJv3P53WjDYe1n1eCntknwumwQzhFkq61kquHa2y0BJygeEkD2QMBvsKZ5RibVHYI8g+pw1xppuCty3y5HvW3Tpmzh59i1XBw9yXpFJr4vB1xPlT70h8TaL7QlTPH38o0Z9O5VKwJSMdpaNqilo7Ge/prqY1g6eXBEJ1GXhV3ylhCvhwXBiN1xhoVO2q6H8SBT5bsB51YPq5hBwoMgTQktJcruynBOwMTyrQIMCeit0qbr4Iv9VrYYUaxXbpXr/xYJgVwsPYMgD5/KdoTUwj3v2Ge1on4OMFNj5sHfLoWjcKaVXtLg6MQLNS76BvbXLne2TCimqzNkRbAGPJGQSD0H0hiNO9cxRrhCCz1Hb4g61DOeh3sRgsRFoFZfNUi1HKDQLdroyBDB2YR1h3/EC4yiplUUlGAevtaJX5FfWpkLNpgRLAUzc7ONlqVrkSipreHgY7tX9HonLTq+OTg9PwH4IhOgatmCJ18cqDW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(39860400002)(366004)(136003)(6512007)(2616005)(36756003)(86362001)(186003)(478600001)(6506007)(54906003)(6486002)(53546011)(316002)(558084003)(41300700001)(8936002)(26005)(66476007)(8676002)(2906002)(31686004)(6916009)(66946007)(38100700002)(31696002)(66556008)(5660300002)(4326008)(4290200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em0zK0p4TVhkRHhqMUI4Ri9PRngzaTZlYjJrT1ZEN3dadzdDYkphZUFtN0x6?=
 =?utf-8?B?aDVQbEVidnpIVCs4UFlwNm9YdTQvOXE3ZnhKN0R3NGoweGxDdmNUU1NkdFF5?=
 =?utf-8?B?NXpXS2JnSzE4RFNpNC91KzZvNzhqTUMxRzRzS2R5blpZWHUyVTBSa1BCbUZl?=
 =?utf-8?B?ZDNYWnlwY2FkQlpHUENFUmVWVEx1Z2RFVEFFd05SeTBXR2RIWk8wRVNVVWJE?=
 =?utf-8?B?U0hsZlYyKzg3eFo0S251Lzc2TEFmZXlSRG1Nd3RsNmZ5TXI4cE9CVURUc1dQ?=
 =?utf-8?B?RzRudjh6SXRqak9qd3dkZEVHOG1Ed2t0S3lFQlBQa1NaeGpzaThYZGtTcGRM?=
 =?utf-8?B?OTdFNnJOYVJvTHNnekxhN2hEV0RIMnRFYjk3WkdBdHlIdnZ5ckxhTVE3dzVS?=
 =?utf-8?B?NVprYUJzdnBDb3liS28yQTAzbGJIT0dJUUZ0S05aUDREZE1sSWRMcE05Yiti?=
 =?utf-8?B?d2puWUpQSGFTaXVXOVVobFYyOFQ0bkJaY1RWK1g0WmUydjZqUnMyMFFjdUpi?=
 =?utf-8?B?OHlsblk4dnlxMHk4M3BFODEydDY1V3FjQTJNQUJqWXkwVUphcUpHZ1ozWjYy?=
 =?utf-8?B?S3FJOEllQ2xia1VkNEt0aVYrQTVid0NpZm50My9wenZWalBkNjFWSmVGZFdK?=
 =?utf-8?B?aHpaVkFzSG9vREZzV3VKZ0hJY1o2bkw5MnhaYk1mc0M5VXQ5Z2Z2YzByY1Bx?=
 =?utf-8?B?bk5lTDRNYmkxMEs5enRJdFRwVWVvZnVHdmlQM3lmUU8veStERENDNS9qUFoy?=
 =?utf-8?B?T1hqRjdQSE40QWV3eFRyUFRwWmV5YlE3eXZpaG5mR01ockc4S3grUGZVTzFO?=
 =?utf-8?B?ajU1YnViTGtEZHpzZ1RQVTFIM1g5blJ1Tkp1a3NmNFppMUwyZVVtS3A1MkV1?=
 =?utf-8?B?RGR0Y0FBa2lReUN1TlJkYzg5bVMwNWVPY0ZFWVgvQktLS3d4R3dYaFJQQ0Vi?=
 =?utf-8?B?dUlWLzJNOXRyVHdzSXNwSzRlalkxT1ZJTVpWMk5ZMXZHd1d3STJVMUUyRU9G?=
 =?utf-8?B?ZE5DZVJLKyt0N1VXbGw0dHFvR0I3NkZXODNvblI3T1EvajZHdEJiRDdEeklj?=
 =?utf-8?B?RFczWEpXcFphMVJzQm4rTXB6ZmJEQTNPd1h5L2NReWczaGNDd09iNE1JaklL?=
 =?utf-8?B?NERYTVRRd3Zhem1EOVpXcnJKVitVMDQ3UUhoTjFjYzBnUG9JZzRXV0hYWVox?=
 =?utf-8?B?MWN0YkVaRjNnTmVnd2ZyMWl2UXhtNXozelFEVjlkZUsxWS83SGZkQ0xKcUJo?=
 =?utf-8?B?ZEFGYk1XeTkvLzhGTVFicXhkRGJDLzVaL1JQa3F2cGpqSWQ0TklGYjR3NkVv?=
 =?utf-8?B?ZzNGK3RDbGwvQXZEaHRGWmZISzRMbHJwN0JGZ1JqSEN2S24ydnFlM1ErdDBt?=
 =?utf-8?B?RDROTHlsQ1NXNHRTVFcvbUN1T3J4VEtkdURYaTRvY0R6NXZrV0NoRE5ZbmUx?=
 =?utf-8?B?MTBhYXNSY0JrdmNxbTRoR09hZFZ6Q2J5M0tGRVpmeEdYY04vMEU3ei9nem9i?=
 =?utf-8?B?cG44UmtEcHJtYWJnSUFJYm1TSDVHM0xURHhNWXd1YTZ0bVN0dDZRZTlwNXpz?=
 =?utf-8?B?aDJKd2ZhcUt4NHgxK2IxOWZ6RHRYUkRTeHNXblhpTTE5UEpQclFOaFlpWklo?=
 =?utf-8?B?bmV0MXpxdDEvTU5VVk5oM0FoTzhJMXJDejdGS1krb1cwYUNkM2YwVTcrR2FM?=
 =?utf-8?B?aFZRcmJySS9iMU9KMGtEQ0UvMXBFd3NPS0ZFV2ZpRmhucGhYVzVKeEQwMHVa?=
 =?utf-8?B?QmkxVGNhOENzQjNXUm5UVkFIZkJjTTltU2JlVXRFWmFIZ3hpVllabjRLaVF3?=
 =?utf-8?B?cEk0b3VDVkVNdlV1akI5TmdMdWpyL0ZjRjMzMVVlTzQ2T1lGajUwZHN2SDh4?=
 =?utf-8?B?VjZ5YVZJai84TGlBT1krZVJLT0tZcWpVOWZRdEJjUUlybGJUM0w4U0JISWR5?=
 =?utf-8?B?b2hzWHYwL2NLbFVBU0hvY0U3OHV4WHRNVnNWTFAwUGc0Y2ZMNjlCZ0I0eFlv?=
 =?utf-8?B?UWVKeEx5b2M0ZS9XR2k2d2V2alp2bDBQV3hYNmI2WnEzV20zc1NZOGVFcVFp?=
 =?utf-8?B?ZWxjSlpxM1ZPUnRONks4Q3NBYzAzTDlMREExcE5TNmZuVHMzRWtXZmswVHhH?=
 =?utf-8?Q?AoCcYQMHSXqfaxZncuPOrDTys?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2eacb2-1c90-4466-18bb-08da664a039c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 10:08:50.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNXGAXZGiyzzk5FPQYrSklVPENcNqMbU2Fb31QCHVTiKrUSmH54mCt9QJ8yggNwCPNGc6ngUezEfmhPVQTc2iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9206

On 14.07.2022 20:53, Andrew Cooper wrote:
> In particular, we support FreeBSD and NetBSD build environments, and some
> Linux build environments use MAWK over GAWK anyway.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


