Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711EAEC78A
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 16:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028326.1402361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVWC3-0005Vc-1b; Sat, 28 Jun 2025 14:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028326.1402361; Sat, 28 Jun 2025 14:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVWC2-0005Sz-UA; Sat, 28 Jun 2025 14:06:10 +0000
Received: by outflank-mailman (input) for mailman id 1028326;
 Sat, 28 Jun 2025 14:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XT7f=ZL=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uVWC1-0005Sr-TW
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 14:06:09 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 094132b1-5429-11f0-a310-13f23c93f187;
 Sat, 28 Jun 2025 16:06:09 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYCP286MB3800.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:37b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.13; Sat, 28 Jun
 2025 14:06:03 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.012; Sat, 28 Jun 2025
 14:06:03 +0000
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
X-Inumbo-ID: 094132b1-5429-11f0-a310-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgfPfaI5wsQMCW7sOXmgoPIfnMBT4i/3GEeF4o1VmDRPClrI0zhGxvNlseVaCy44eO2CaAyyBtq1u59RzUKMkrei/0J5O04Oc0BzfOOOvkH/YkiuFaTGe3RypAh+I2AiTO49VoPiZ1Puvj9XxUKaT8EGjlqpETlErC2KfBZHrVx8qZC+JPx85avHqeNpZK+cTQmjZe/zKaMP21wOWyPcxlCWTm6BaC/HPpAKmDrDvz8G577r7sV5o5t4QvHnZEkzLCi1B7L96T1B/51sS1CeyO6UMtFRSqzUJOJGmb/Z+RVGpl69CrTUreQnwbImaP0/tK2Fmia+niyH1G4datXTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvD+z2i2BZKsgAXBEBtWFa+x4cjns8adHkY3wJDThPw=;
 b=XyZrIxrYvdErOXhLSf6lCoIvQCbLsahs7wwP7Wp0WPvV8wfaMMtQcyXjuRohdpWLwnRFjRTiKhQ82vLzfC4X4FeCLMAJRTj+FNrWGL9cqUtiX6pmVZ2X4Ac11ZWNGAPDOckrHrCxjIxjkf0qLZz7L2scZ+HoOhFYe+A3e38s7SegU1Uiex+ZmTIJFAv267DRLW0H2oH30A+21pztIM0epg1gKiPezI43i3arpXWvIg5k3DDPWwtkam7eCf44lovVbVC1AkqaMc3Yklv/rqAD3fBgf3gx0V9jgHDqzzUYEqBXbe3pinil40jxYCykCdfvuBQKHJfwjpQXUjhl1+2C6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvD+z2i2BZKsgAXBEBtWFa+x4cjns8adHkY3wJDThPw=;
 b=BgRpvmMcolRPUa2tE68pH8x5IpMOqohLPwoNAUtP5ISKmgNFEwcERfHjxt8DGrbAuJUQ6gqgHoTfOJ21uePoGhVZtLzZ1rbJhizW+HXrVwoucbFN9hTji/7ldgFocJJdvDgImzy5KEfUxIElNX6pe6IgpRVLVoO9/lpzkA8kMBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Sat, 28 Jun 2025 23:06:02 +0900
From: Koichiro Den <den@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 2/4] xen/arm: Move make_hypervisor_node()
Message-ID: <lvevfus52hh2nkjvckv5ijq7fqzmjh6wfv3z6vrpp43akbiaw3@4b3xoahg4ztx>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-3-den@valinux.co.jp>
 <8e6ed078-9ab9-4f6d-91f4-cbeb74f2c5fd@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e6ed078-9ab9-4f6d-91f4-cbeb74f2c5fd@amd.com>
X-ClientProxiedBy: TYCP301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::19) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYCP286MB3800:EE_
X-MS-Office365-Filtering-Correlation-Id: e53de166-c4f3-4088-fefc-08ddb64ceb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iBlL84hjIm5jEhbbPUHq+WCEHob1ZRvqVbW+XSp0YDtul4mFs+uYA4TQzmuj?=
 =?us-ascii?Q?bgsOq+qa9OfKh5CvzF1nfUOZoXXKn/unyLJBXEr5Bspwre8lcTws+WzX1KKg?=
 =?us-ascii?Q?P86SM1gq3zQnGSPm484cpTnMMJ+kQtnlJOmb4keep9PnmrJh+s0tXUkwdEQR?=
 =?us-ascii?Q?QK9zuPhGlRcukYGGmASA6m8fcwYMhL2kXcxMHnLsGW8U6T4VZGR9G6kjmxkI?=
 =?us-ascii?Q?SQlZIl08e7zXijE77tjxIVljka7jyMu/Hy6ahK+m6tzgO987TV7GuQZ4gJDf?=
 =?us-ascii?Q?b2BnctAwx6YqH9sU/3JUPHibE5N2IQqf905bQl2eC8F5T2WM0/taBJ2szrAv?=
 =?us-ascii?Q?2TQ3Ntiz15xrR0IQt5O+TrFMe1CtY9CdwApLVTlWe3IUaEtflrLc0494vws3?=
 =?us-ascii?Q?LZbXsC2vF7VpSPjXs90NycHYjWEnl3AhgNYnE8vI+fY7EyWp6CVvX8J+gkGq?=
 =?us-ascii?Q?cZ4ULL3WnD6Ap+4g7r78rLpbzZyQX+PLXOxfxwa8ko3/ZKEkLa3owEKg94Oc?=
 =?us-ascii?Q?MGomfxpQLunnyL7no+B2RqG9X2hoB7nw+ZZJT537zOMjTtDfHcOLBHaeTC2u?=
 =?us-ascii?Q?o/o1gsD4dzw8bqyJBq1tYhUld7IotjygVt0sFgRkzu25iHDaVKWC7rZG3zBg?=
 =?us-ascii?Q?fMVUATVWf63PVJm48Pp0GI5E8unahqCkzX8Gqgwr+5IGaiBUmg69u/u8mGXe?=
 =?us-ascii?Q?jr0RaNT4C8BKM3JG/bb69lO3i5bgitEws89C0F1cfpcNKU83N/4gFBx9B+Yo?=
 =?us-ascii?Q?aPO49JFzbhvp9pzLAFHySpOV8UCBDC+IPbcfG1SbwtFnUVKG1QzsEOMAlrbW?=
 =?us-ascii?Q?x74GnfD1WAnvGyhX2DGXgPf0uzrM9gBZu+En9a5jSrV5qeUjMBlXZusrfmI3?=
 =?us-ascii?Q?zE6HCNQmyMcfWbNtyyeJXhR49AMitAYhvlX76SU14wxAzfTZ9oaMmWglz8en?=
 =?us-ascii?Q?d5kD/JYkKAWuvEE0a6cvlGBpGGBxtNMfPqgXmObLl1ZA4Qa5D/QJOvwxiHZ7?=
 =?us-ascii?Q?F9aDZ8cR7TqbDMu7n7kd8joW67H0ysIn8vIbuTdPHpH+PW21e5f/YgZKwwlm?=
 =?us-ascii?Q?QrZgE28GX274X25ATzXe9iIrXvtHh3wDYSSnZZoBX8svEVL3u1sheAEToDbT?=
 =?us-ascii?Q?cfNI1ZS1cmrhrZTCY6UMA5Q7fJuA0EP6hpwKbMV/1N8VemkBsn7YdVwOsqcb?=
 =?us-ascii?Q?+AILpTPgToFMoeGBltW3UqJhyqwk24vMGxl2gM/EKxVGVar16EnD1J9fNo8P?=
 =?us-ascii?Q?y9i3ZhTH++QXZbgtly/A4AVehAp+ZzzgqhWCdF3+sa8iOOxsV/UUoZoGXiJs?=
 =?us-ascii?Q?AYmEzLSmtDtflhFvlwvlVmXSlLzPWLz6uCjsuM7itbgpIeHKZQ6+Z6aq0HVx?=
 =?us-ascii?Q?b+cRrzh89l8yJNFRwVhn7KovLYXCiOtiK2UbIQFRGbKiIBLK/B0xjDpDE5vA?=
 =?us-ascii?Q?0+iYdQMwppw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bOySTVGD89JZCq+bYjhwfMfXLeXHhwfQgobRow43Hxqsfx2wO4oGYTDLvHa4?=
 =?us-ascii?Q?sP/2ia2alIg4kPUJbL8JuI/rKSewismeRgYTJeBWp3nFJX4ixLCqLBoW+Cz9?=
 =?us-ascii?Q?NMJBgP3ULKlbRqlviSWVTefznhkiAzriA4az4lxXNAIi40ca9qDormJWeb26?=
 =?us-ascii?Q?M2Mu639wL0OiJAQkuS7VlYQuT2lUGy3dq/N1tT09IC73WHdqi9hPM3xDIGLE?=
 =?us-ascii?Q?IJYEyWkn1U5LUiG/eg1TUUgS/adrmUvBAZ+SweXPJU6iR7YuXpvYGWqWcYOM?=
 =?us-ascii?Q?dnhQ2POWo6/LgbTDuEtiWWIYZi0i68HB3GrbCaWCVAY3qN+9MD8qdA3HKVTC?=
 =?us-ascii?Q?Q481B0YwV4EukSCy1FEQTeExHEr2deSZJWjourVEqUPcISSdbSCx3d2oum9o?=
 =?us-ascii?Q?dZViRvYPytZGRRZnAul7qfo0xMdAG1/xx8Xy8udCbKsQHCWeQfDKD+uO99Vl?=
 =?us-ascii?Q?gs+3P1Js3uhXWz1H76HZTLdtKn7xfGyi/uv7M+5Z/tWBJyVEpWA82/0q49Il?=
 =?us-ascii?Q?sL0gjqbSLTirmgmcE4JhYAdxzGGTcb3ZIvceoFaxl7zqpTrSZNgeKWcN9cq1?=
 =?us-ascii?Q?LdauHvSxXj39NqEVZr8Sz34QMWnufim6EGj0yr+wl+VM8MbXuU46XD8QILNq?=
 =?us-ascii?Q?0TGS8UdwczEGki+4yW80F0GvdbnnEgkPiR8tf3nsn8r157co0B4kGQIygaCU?=
 =?us-ascii?Q?3pi+oVCCAKrCspfJSjXnXulPqJQFd/OeLEm1N4afDZDfqdjDCREjyZJwsOPT?=
 =?us-ascii?Q?MrAEIChKDmmXXgPbaExMqnO3fBpHOUh1Ep9xImBwcIGVklTv+x2G3vDyhNSO?=
 =?us-ascii?Q?kEoaRlFzq6IVZfXByYqoo09lu0AXqvxVHMWQLii24dYiCTnxVQw3Jryk8z2w?=
 =?us-ascii?Q?xJIp2lxyHF0wJGWsjpqW6Ujpd4ViSYfdlM2GkL+miEO/Ijzzulbv1bRkNAxS?=
 =?us-ascii?Q?VPPjyXgYzMIHcs1fJxwqFfzQurcO9Iznh6aMJ9T0bP568aor3hjeBedrxBof?=
 =?us-ascii?Q?EiJBNEvR4TFnsSqN8LcEIs9BZqqcIbc2h5ICq0qssI9FM/g6S4o+joDw86Zc?=
 =?us-ascii?Q?v09vm3A540AbWv87Qvzv/Eztq/DKwoM4AoyVinTaPuzWl3aQaKZBI6sBotLQ?=
 =?us-ascii?Q?JNnuG5K37g48pERCTnjTQakI9imKvTrV/qPEqsEnQF/CmkBsxJCheAeyu5qX?=
 =?us-ascii?Q?ZtH8aoJSq3kExEMTs4hwyRaQNHr8vN/gFfgmriVF1gfvAFMItuYH/LCZG3aU?=
 =?us-ascii?Q?KdS7B5q4sX9ty6QoeilDf0x9vjVsydcqSj9n/k1hF0VXu7NBxMorYARNEBa1?=
 =?us-ascii?Q?xDBT2erBZAveaf/osaiQevktLueuPZgsHp7eDmwpbeUDQAFWi+2jqlWDKyOg?=
 =?us-ascii?Q?avWCW8Um0fXaP8R3MKucXojLK5lI1kp+iLiHIGYasTG9STaLRpvOkMxTWQZY?=
 =?us-ascii?Q?JCwJFhbG2chEmju/Ad5NehR1ypzZtcs/nii67ac2hlTQMKPTRGKvu54Ks8oS?=
 =?us-ascii?Q?CAfFrHxBULZvHb2imtgBzGKlVVNymiYY5ro4cP5ROvGSHzLcR8X8BqwDQvlG?=
 =?us-ascii?Q?TJw0ft+kOCLMihZlX60qcrFu3eC/x56PlwkGXxPtdTq+Wt1EDKd6Ai+PRz50?=
 =?us-ascii?Q?LNCBV/u5oFB4k8hz94ZvV/g=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e53de166-c4f3-4088-fefc-08ddb64ceb35
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 14:06:03.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhTfdnyaW7nbHoKG0ROn8KdYNi5uizetGkmjwvYlqpFI7blbMtArpM+x5c4mEOMsuyWW2kH3h57NWQATMB0p6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3800

On Mon, Jun 23, 2025 at 03:40:24PM +0200, Orzel, Michal wrote:
> 
> 
> On 21/06/2025 17:11, Koichiro Den wrote:
> > Even though make_hypervisor_node() does not rely on the /reserved-memory
> > instantiation when calling find_unused_regions() (the wrapper introduced
> > in the previous commit), the next but one commit will use it for PV time
> Unless for specific reasons, you should not rely on which commit gets committed
> first. Hypothetically there could be a different patch committed between this
> and the next one in your series. That's why it's not a good practice to mention
> order of commits in the commit message.

That makes sense. I'll rewrite the commit messages in v2.
Thank you for the review.

> 
> > shared regions, in addition to the existing extended regions.
> > 
> > Move it as a prerequisite for the commit after next.
> This one is particularly not useful.
> 
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> 
> Other than that, LGTM.
> 
> ~Michal
> 

