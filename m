Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52853588BC5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379861.613699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD8N-0005G7-39; Wed, 03 Aug 2022 12:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379861.613699; Wed, 03 Aug 2022 12:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD8N-0005EE-0J; Wed, 03 Aug 2022 12:05:55 +0000
Received: by outflank-mailman (input) for mailman id 379861;
 Wed, 03 Aug 2022 12:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJD8M-0005E8-Hr
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:05:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f6454e3-1324-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 14:05:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 12:05:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 12:05:52 +0000
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
X-Inumbo-ID: 9f6454e3-1324-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXubHTfTQBgaTnzYXBaRoM3EBzpWP3GSnClxTDdeza6kXMfcefhBo82uB+dKUMR2LIZq2TyOFx2KshFveQtFNCXbgNUf6U0mg3ovf6PYuT8eKJ44qnjUfxJfw+cltLaRRyMmIq0RqDreios5m/bE51qi8NnL2wT/CyXa8fsuN0AEAjtklFvI6AUGbDL5X1IvIluNxaP5upFc3ZXFWM5ZBk37DkHn7JPKxNDuDL08YwsDJnUgYroNPDzLrXs629xtpa2lCiGlwNA3XJZukd7GimmIjGKmeYfCklHJUoshdpTWK7v5QpxXoygktPKUpIoUmdtbsFkyW35VXBiBPLeCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhzoG02hON9yL6MdjzVu4l9PeafaiB94RisvywS0UHs=;
 b=MxHuv74UYZz35d4Zf1qJITZB/C/MraFPAUNmbg/zliKmGB3UJdH3GWvXL0jVxr3in47ojLFwtfW3A0/sy1A6r6D/LEv5Fjs3lSeaNeSug/KyD6xbErjhezkNMR/tYCJFb3/DjFCntFYTQ36kawkLlXwsGa6UdURJWM2VGQHFxrQNrELSUT1hPO4cxU5oXmjfAJCrvCsZtp7ukWi9UQB4oS7+bRl03hLTnC9wGQn7Xm6byqASoqvzLubWR7i8Y0oLD2xjTaW3q4hAQ2p94PG5vKS8vZVLRponPcHCdpIuHynIzlbDsulT2di0fY62RqhOTR33gcXkrEwvDtibs3a6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhzoG02hON9yL6MdjzVu4l9PeafaiB94RisvywS0UHs=;
 b=qxHqg8oLNLdeuModks/BvHfzfCrnQ8pdsAT9Y5LO6UG0XBKgZ4vExlgpT/d6X0w9OiRKYbuUrAkn1Ufthr7kXRqFYyrH3zaBgoZ4STWVKv1XbNhkEBfMZsLkhhD4DKFoYoRHRDaT2ypSg20xNZQzs4PcmqC83Ty88ctVTsLiyu8q+OD8t+BAFjgbYAUOyQa5lfxl2XekMZ/0gg331AG5HGaPmO0S9s6pPfcUcG4X+BtMbIxiL+m8ghEeXeXYMsKiGVk2MTVk0dDkNGCEcsn4prL6CwMSETkT2JW6TKewBDWQoDpbcczK+Oi9cjLtHAfzzBpxC4hkJEfNts9T1aP/Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
Date: Wed, 3 Aug 2022 14:05:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4164af4-2414-4e6e-3d94-08da754882ee
X-MS-TrafficTypeDiagnostic: VE1PR04MB7325:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bwb8t+cBgISppRpKRaJ7kSwBeEb/YEWMwRU3ygjzs4To1gsInxaHWcMYzV+GNJRlzalW3iLF3DPBShUoNUp2T66oyIuHBNRJ6vdGsv0/ccmihCuaowQrz+B7DRBi1xkdPiGiIwDTMV6pllA833zlZvVD1gKyPcrARPBeJIuGbKTzSIwVwgEiUUlDqlzkRJ8CZX2aWjSZlJPwg3aT+SFhP7NipLTEvm6WnenvWDEfL6MAWn3rfYjYoa2979reqduDTivg8PnAZUt5UeqKWqgI6+qgyGzr7cKWDUgvyWZBVf72m11suK3tEhn9qnLchiJ/BCO8neVFgNCd8CBN+5vUBOdG5uDvUtz/4gxiVHmpJojDY6rYJkZJXbPfJrXPtIiwuVkgQ6SgajwSSYoOhO9oYZZj2D8ORXbABet42PY0PKGMcb3tYG9j+FF4+D+QfcRb6Z49bpeI6d7uv4EyFKNo9B/sL1Ktfddrul2mPvFDu2cPuHP65fVqHt7fFZnfJ5QcdKig1G5LS4xv3wDc/eugjkBzw8QEqOtTqUtY0NrUNXrU/doRCjtB1LXDP20wlfh+/ph+x0cectaC1mNUv0/hWHV9VnYrBPnmv8JA6ZzbzrOaN2n1RUvjyj4d+xKU/oy/ztYHJUQYSIP5o0yaLJMv+130DzkEzHt2sVm7oWTYd6NruY/lvWlS4Yxd//PLSiSZzkd1KllQZUqVktHNNYOJ0qxjT0i1REUnbI8c/iLVx5IvmfGPv+qp1x3LlwhYDZWcbSN04MuM3n20YznDoom4vUSzZYgyUbOjSdLb0EZGvr6sLMUSAkPk94vcRNC7m/PiUSRxpjEIbKvnpyOfB7KdsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(346002)(396003)(366004)(31696002)(6486002)(86362001)(2616005)(478600001)(6506007)(53546011)(6512007)(8936002)(4744005)(186003)(41300700001)(2906002)(26005)(38100700002)(5660300002)(36756003)(31686004)(66556008)(66946007)(66476007)(4326008)(8676002)(316002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHE4RDd1czcyNDd6U3k5SWZ1NTlYemhjcEQwZXBBYWJWVDRMZnkxdzc4NUx5?=
 =?utf-8?B?NWU2ejVzNS9ha3hpMG1pK25kZzJuWVltRDB2OEtKeHdFNENoNzVrY1lyVFQw?=
 =?utf-8?B?ZDhhVDNlaE54Ym5XbEo2WGNJV3FEUUdDQkdmeUlSQjd5bWt2OTRoNWZ5akpR?=
 =?utf-8?B?RU9nWEQzQ01BaDVpWDd2WGp5cnY2Q2IvVzdSMnBOazQ0MWNzaGgzcDRqQUpx?=
 =?utf-8?B?RitxMFh2S2xTWWxjc1dTbldNT1BxeXFucStMWXdWWmJLUllvaGxwRklva3B1?=
 =?utf-8?B?NzlaSWxEZTdZL2ZsM3RsVVg0RTU0aUZ6R2E3SEMyY2tOUkVFYmlMOTQwWS9t?=
 =?utf-8?B?WkZIL0N6UVFSQ0xENDlySjE2cXRXSHNYK3Nkc0lZMFZQSitndjVhYzBwbDQ3?=
 =?utf-8?B?am9xczlRdU81dEJXNEVleTJhYS9PLzVieUxVWDQwU0VLSUxjUG0rMy84SUs2?=
 =?utf-8?B?dEJwUkNNMXVzdFhVbzY3d2JKT216QTg4WjI0K0NPR21nOVlUWTgvU2pGNE5n?=
 =?utf-8?B?SkJmeUZTcEFJV3Y1eTVlZGllQTZldmdQOFhMN2U4V0R5VlVHVUFrc3p4UkFa?=
 =?utf-8?B?M2h6bVFuVkZJWkJZUE42dDNYVldxWGxMN0U1dUVNNzlSaFMreUhhSmlZRGN2?=
 =?utf-8?B?OXc3aDlaQXB0MjR5MEg4MHRZbGRVbXZob0xWTUN4NUZDMWlDS0J4QWsrRitQ?=
 =?utf-8?B?ZEhHY1JmUk9FWCtmcGRjc1ZaTWtUa05MRXhDdk5wSkxwbmlmVXNTcmF5blo5?=
 =?utf-8?B?Nm9UMm5kcjNXeXp0aDdyVXFoMzZtNDEydFpoVnN6QlhIQXIxLy9HankxRFFY?=
 =?utf-8?B?bFhMOEdLbTZjOURzeUwvYVp5ZE83MDRla2tTS0FxWVIrOGY3MnBWYUx2U3g1?=
 =?utf-8?B?eUtmYThPTTNqNHhlZkkvQkJlc1V2ZXFQT01zRmhIaDNhdmpnTVFXSEw4Um12?=
 =?utf-8?B?TVdjcTZBcVhqclNTQ2NKam8xeFBLNnltNStZNXZNTE5TVWdsQXNEaWVwVDN2?=
 =?utf-8?B?RGRhendGaFVJbHFjZ1pGZ05JL0pCdjdqUWw2RUZqZVAydW5DQWxLNmsvRTgx?=
 =?utf-8?B?Wk10WWRuejV5bG1RcmNGems2NHJmUHdIaHlrd3psMWUycDRUaU9wdlUrNStK?=
 =?utf-8?B?eUtTbDA0Q3JPRGIxdnNsakYxcWlYK2hJQ3VZN1ZtM3RndmtUSm1wVk5MVkYw?=
 =?utf-8?B?d2lSUzIxN0dUS3NiYU54eUZEeURhUHdORDRYL3E3bExXSWZpTWxselNjZVFx?=
 =?utf-8?B?Rnh1c3M3TGRwRGFPMVJ6MmpKeTQxK2FZL3Q2dUMyZGFVWXh3bEhYeGR0djR3?=
 =?utf-8?B?ZENqVW1yVWl1VFg5QkZmZnZNN2Q1Zy9ReUh1b0ZGYm91b0hSNG1BRFMxQlhk?=
 =?utf-8?B?Sm9GMVZELy9MeHVycVZvRUNTRWxLVklBSWVxMHEyRWZlOHJnaUZKa2VYZm1S?=
 =?utf-8?B?M1BHK2RlN1hGQUxzNmd2am9uNUVDWmxPdDZRTGJEVTQ5WUJQQStnOXBvZzJp?=
 =?utf-8?B?SWgxcnRhTmNpRVhOOEMwU2dSZTlPeStua2NoQXRadk5uUDkxc1c5U0M3OTda?=
 =?utf-8?B?ankvbnNxVkhTQXFVUjdYcUVxYm54U0doUFd1VnJpSS9ET3hyNEtESG14Ky9j?=
 =?utf-8?B?K2k4TVdTUjZCWmJHc1RUOVdjZHAzV2VOdVI3VXNCZytiMzFkTlduVERPQVFx?=
 =?utf-8?B?RXQwd2ZEN0hxL3ZLTXZVL3RGdkpNa0x5WXczcnh2ZXUzT3VDYXpWRXBtL3Zv?=
 =?utf-8?B?eUpTV3BTVkVtR1hGZlZWSnhKcmpBUHE3YUprUWozVW1SR01La0dkZm1NMzN1?=
 =?utf-8?B?VVp2eCtoRWhpRzBJTFZnaW55SzNzM1RSZXVUa0RXeWJQWktzUGY3bEkvWE11?=
 =?utf-8?B?T09vWk5kTWVlTjJxNE9mdEJwZlU2Um4rUGMwNlF5UmpwUFh6V2VhTmN3dkdS?=
 =?utf-8?B?Qi9xdkcwOUhiN2JVTk15MmQ3OXhJQWNkRWdna004Mm1IU0ZHd0s2WXVxVEY3?=
 =?utf-8?B?S3Y4STZqRWYvZThvVmlaaEtCeHdKZ0l4VnUyZUEweEZCalppclhwYXIrYzl1?=
 =?utf-8?B?ajkySVR5MGQ3cEZPYS9mOE4vZFd0bmZlN1UwT1ZLRmhLdEdWd0NUWTc2VnFM?=
 =?utf-8?Q?1BKUDz2Qu+Zi/EzI4uCJBJcfm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4164af4-2414-4e6e-3d94-08da754882ee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 12:05:52.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAMZVhsA8TKEkJ5d2Rdyo2N2etTVDknkPfmOBSZeDrUYlRNmm62Fa3F5/5OCm1Ia1GIWBqRPTgKxP50S7/jxRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325

On 03.08.2022 13:57, Bertrand Marquis wrote:
> When calling python tools to convert misra documentation or merge
> cppcheck xml files, use $(PYTHON).
> While there fix misra document conversion script to be executable.
> 
> Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
> Fixes: 43aa3f6e72 xen/build: Add cppcheck and cppcheck-html make rules

Nit: These two titles would want expressing consistently. If I
end up committing this, I'll try to remember to adjust.

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

