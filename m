Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A8BAFE1B5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 09:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037786.1410310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZPhY-0000jS-Lo; Wed, 09 Jul 2025 07:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037786.1410310; Wed, 09 Jul 2025 07:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZPhY-0000hG-Hm; Wed, 09 Jul 2025 07:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1037786;
 Wed, 09 Jul 2025 07:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjof=ZW=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uZPhW-0000hA-Aj
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 07:58:46 +0000
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c405::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 882892ca-5c9a-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 09:58:43 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYYP286MB1859.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.20; Wed, 9 Jul
 2025 07:58:36 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%4]) with mapi id 15.20.8922.017; Wed, 9 Jul 2025
 07:58:34 +0000
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
X-Inumbo-ID: 882892ca-5c9a-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhBB7Fv5/fr5NDd4rQgvUf4SwzSwZvk/YYb4bxzN8u5vmG5EBI6kJFdNhLrQQ3TkGACxcZMykJ+dYYR0Wj3npQb6EsKCc1Dy8Wj8fb+PpWFuHwTJ3kcKA4Qxi1ofNChVW3uRwxOQ3ignBFPRjnDCIAz8RMT4JeHZEptUVQ1nsMbkfHhHewOb+gAjM55LYpZFNBWaks8fbehrbdi/B4pStPSkv1kL9/mHnVmTLfqgMoQzmzdJK3vwSuRnvjlVQgp2K+u0hYwRmkWP8qbAXI8MuUgxJvFcD5w0TGUPz73RMB5KNLQ/e5mxnznL5KHHot2DQGQa5Bd/ZHfAbqy0VcNrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aardLZ7aQxGLfLPNkNXAqLZh06MA7rO5nsuQdf/hrdY=;
 b=Erh6lAct0XmUB6ICnFnmlte8IBGBPI27RNM8vzHCnfmwqe9TPyJVjDtJ5IXXQHzjtYvSqoLeMfgJIH+vVMsDg2Kk1HCIGj/WX7ezu5yxsZpTzJUdq5SxYXWwr9bC+BWQCZ/8t6ge1A7k+eBdY512xcSZ/u/KEieviijgfxD7irYuBypzE6BfXehDbFFKUXgUhcn9T2RRIOcLFDPE26W2RUKeuCpr4n3lSPcbnAodOeLQmxfKioOrcKw5e56Vch7uEQUvUdAtZrVSeRVsQR7HbAZAq/oQUqo6ZDbYZR96tgJQuDBnKnhmrWUnyoY7LfFq6QwGpN4s9OqM1tHq6cuEjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aardLZ7aQxGLfLPNkNXAqLZh06MA7rO5nsuQdf/hrdY=;
 b=KYq9ydUdU02blRB3ai0T2cmBrXWL0MHsQgXyhghHggjfEog6lNLQoSQxeimpxyAZZ+6wT5j4GuBXscOKGvuFhiiIWUjX2CI6OV1bmqzMtFs3xGRff7gaq+yYD3+1JlFH5gYql1Y45omUPsxRqGliflnBWltDwuAqUE1i+cxHkvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Wed, 9 Jul 2025 16:58:32 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/5] xen/arm: Move make_resv_memory_node()
Message-ID: <lfhrxqqpwi536wtuwks4j4dtrpcypi26ojv3wnaxfi4qcqslx6@r7xamjwjm3nq>
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-4-den@valinux.co.jp>
 <ed706953-f6e3-4911-adfd-0e19290a85af@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed706953-f6e3-4911-adfd-0e19290a85af@amd.com>
X-ClientProxiedBy: TYCPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:1::15) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYYP286MB1859:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8b0dc8-2d49-45a5-41b1-08ddbebe6759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cA1bykqKPEFn5xgNsEHUsp6YBfChOuIWPw3ejkHSx4OCbj7yMi64F2092d9L?=
 =?us-ascii?Q?CEBIOAZZrafH4exmyrxMDELb/+M7ZEthaV6jGUlMZkYzLObLuwpsUGxzU1al?=
 =?us-ascii?Q?GrKmbNiJ4bGM2GvFAyHmbY8olhAXkPM3BVtWZm4C1J8dQukfpMOdHk0aYbYK?=
 =?us-ascii?Q?/EkW/Oy/gyoX/ddI3mGt+75Z+2urRuZDSbjrqiqB9Iv0iCQalQeqFTXxZCO+?=
 =?us-ascii?Q?4iYnVVSP9OjiUQQmlFSTtHuwd/LmDz6i3/wSexxLn4tzV6V/7/ITs5SwXe1N?=
 =?us-ascii?Q?i9aR44FHDSjvG18CHVERaQv9SYp7VESrHP5yndQB0ZUlOolgGXDLy2pXkx79?=
 =?us-ascii?Q?+fnP7ViaLZ7WBhcQVp56cW7DckvyYjy4W3ydO1hXHVhlJ8jMcjRq5M/T+du5?=
 =?us-ascii?Q?tReGWcVLWxM2YsSDf6HNJ6FJNXoFbWs50sgQa9aZHxKJvM8HNw+knV3DxRDH?=
 =?us-ascii?Q?Y8zXKAoQ5BUJTcHCoiIMM1jjxlQBxRDXW/MSjWFhDQrR4P7wgkg9V/baCg7s?=
 =?us-ascii?Q?etmtY9gYAWEaBueJy4zw8rN37MGWFylVHxUdsKyPBy4sqYMCPlP9TKW+Q1s5?=
 =?us-ascii?Q?kz2+cKuPTEP3Z2WMNgYWb/eqLwS5uXduXorCDVpgdkiiSApUXNSy1DNPU14C?=
 =?us-ascii?Q?6kj2JwVRzH6HZDRnf873yW3emGh//6R/pT/sVW+mv6A5GP88UtETKUGv2IaT?=
 =?us-ascii?Q?u4ohZXt+tueiccxAaYxu58sCyRmSOcepjBn2ph7yTr/pgoC6z2OmZSiqIchk?=
 =?us-ascii?Q?LpJMqbYxY9ij0W8j4Kv0/p64B38GXLcBo5u60PfGLcRzVKGrBh8HV4vZk4/D?=
 =?us-ascii?Q?ZmBWS8mOvVZ94mW9XRQzH6ZtPIbONEKSO3a3Fac9dW/n4vI+LoNQSholgYHR?=
 =?us-ascii?Q?8WyBkFSpfTHKyWv5uGp1Hzibcd1rWgrcWA1GqGgR3WKMxFJ5LDLQEvfdPys5?=
 =?us-ascii?Q?uvzwIRuEP3nF79LMYb+yVlkybj2oHhag4PUA0VIq5tLVXs4nF2aioIAQ+2my?=
 =?us-ascii?Q?ylRFvjSR3ytsnPGgqi4QJiw9IKWM8OkErL86GZUeaZOUwcJ/ifSIex810HHe?=
 =?us-ascii?Q?3l4kDFqe11bRlLKa05mUmquWBUN/prgfJ6ctOHUN3x0+2vatlF0FYtILji8f?=
 =?us-ascii?Q?obOLqxIhgmE8mPK1xabNl7rKJV2LPBh7bbnBnFb5ztaH8cKpbFsFWkaJex1J?=
 =?us-ascii?Q?uzyK8TOb3ypLsmI/hLmwYR+S7mmzv9H6bKBHAPn3ZLmUY/fHRFLIZ1eG2V5m?=
 =?us-ascii?Q?YWLt4LCkRrOioh2/cpjDrUTJ/YVDKQcBM96SneIb12lhIgTyAY9TJ01PfiZ/?=
 =?us-ascii?Q?NFKOATKCHHVKC9xiepTll5gJa7r9dVP9B3+qagwLZmCSPd1UepxyKfxfhpt1?=
 =?us-ascii?Q?rjzUZUyH888RYb8TUDz4Q7vBjctEIp9V51U+0WAqWCGD5bIlnCTaLOmyUfp/?=
 =?us-ascii?Q?pSCIrcL2Ewg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?43F30tGQBqwdEwyUX1lHBO2oG7c/rM3TjKzaAIRHcfAg0ehxICpU6c4unmBC?=
 =?us-ascii?Q?wtPc89uqwDI4fRbQ2C3kWYHg5c65yC1eEZZJbYouMsbF94AKtbVzlevUQT56?=
 =?us-ascii?Q?7OXpuJP1H2HmH/55mWDGItw87PKqG3ppF8rP5Ve0nwfWF2hHlEDsNlavP1G7?=
 =?us-ascii?Q?TNsWZdAn4+nHeW6MqrSYd3aSLEgTe9IxPWP8c0kUR7+cVLTeBog4wCL7CyVc?=
 =?us-ascii?Q?sygk5xHeAxw/SajNrlwwqtNUQiGf9zBQJuvO0U0y0jsDUp4wQGYO9vA4UfS5?=
 =?us-ascii?Q?F4U9VWZOHXKvn8sLSuBvQkokJXTTKokQWLWpUAJTLwbXhO37UxZae0MW2SID?=
 =?us-ascii?Q?W9Epl4H5Ojvn4x6TfbRa+P8RoVRSRvSyhMuxnNdl3PDPUnB2+GTrwbFlu1mq?=
 =?us-ascii?Q?qDEnAYxRRlATYKl3sYaQDNP00gulQT5Hki/6r3rUkA1zXWwjEckplorYzJaV?=
 =?us-ascii?Q?5xRfpkA4vL14CV1n1Jn9nXtdg5vAwAi4tBtmoZ9fL4/XDDywWIKK5WrM3V6+?=
 =?us-ascii?Q?9BIAM2pcVvYkUs2ScctsKxarrAWYbm3jBCJcDjMA5X9Ygax8xDAGS4yAOs9U?=
 =?us-ascii?Q?7ZszF/zUuNUpwbB/I8aPIFSJDp2TC3sA+8j6OetqbKxB325t+sX1hI3iw3Ij?=
 =?us-ascii?Q?ZdAlFWgK231tJ9D5EiHY89k2HMDydAj58AhDG6tfseWGf3m+NlXXm3abicnl?=
 =?us-ascii?Q?Yi8jPSAaKykIRxswNuiPqYdJX+2maGh1MGJmAfKnaGQmmigk3xAlBUnCYLFZ?=
 =?us-ascii?Q?6Dn6zOa8J6zVhAKFxE3lu9peYMJVnuwJacCSN/urwOPHFchF0/npo+Q0gjoq?=
 =?us-ascii?Q?WorJRBKEpoZJnrDUTzk304wCOrm7Yy2DWcXUMIHPdsKfU5+DSfPfZ56xgU2g?=
 =?us-ascii?Q?6GxvM+vmmII4U7cUqIxYet2F/ZFWD42af2N5SN+QKS4xTdAbl+a4ETB3jhVo?=
 =?us-ascii?Q?sisYbkOmB1axp7sGxsrfEvuWXJrgBpRLy2tZQ6fUXPYaOR8bqkki6MvLYVnb?=
 =?us-ascii?Q?1m56ePR1vwnFUlhZtdOVxcP7w6vBBO0x2MtAwaRDHjzeYjulpZoitmsX1UOb?=
 =?us-ascii?Q?NHw/MLlAiNocjRAHGS5bRxkmqnTnjA4iv7LoyJ3GqoBpfvFzGh8vlOJrh0uV?=
 =?us-ascii?Q?fFrks13iJrT2hSn95nN9Rc+/kVB3tY+AjRNgePTinkGrUDJC/xVxgECcKUzU?=
 =?us-ascii?Q?e7uOkikgyY/xsV/wh/8HdEmQs5lHsQiYymgp7jlPUKLgLWX7NquaUi4i5BsH?=
 =?us-ascii?Q?1CqP1VoB8aexUzYuJvm9hpFYUOk09uTjq82WXatIHq+oHcOGTBLCEDfdmScB?=
 =?us-ascii?Q?mQenlgNq4ITJdkJ3X2K/PnuuqQFvsD6HlvpaF3u1fP/erc1POHdpts7HpeEA?=
 =?us-ascii?Q?UEfIvarAfwMowfWRAzyXsPpzjZeBdf52FwI7koTN/pTdv3m1LEKynn0boizx?=
 =?us-ascii?Q?9Z2abc4Ia/S6sFNemW2FC/vWdM+k/K71eY/H9R6JHKqNtM0qSr6UfXeYWTJs?=
 =?us-ascii?Q?ptqNK2sxfGBGUJJE+a4ZlVlClt5NuYCqlDKUqhrTx4JS0Y0Q8ObggmxAmiKt?=
 =?us-ascii?Q?mHGdMhQWH4F0plAxs2ycacUXeaf8bySl9CFn0RVI0M/NfmKkUO4SztL35lnH?=
 =?us-ascii?Q?aewhREyVTmEXkQDlZuDXgqk=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8b0dc8-2d49-45a5-41b1-08ddbebe6759
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 07:58:34.6243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtegHR8/uaoWaZnG8sPO+jf7mGZsXTh1/kbWzWA58V+UnjlYlDfM2ShB4o+pFbiiT+RD7sji6jZwjWi/Q40EHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1859

On Tue, Jul 08, 2025 at 04:12:50PM -0400, Stewart Hildebrand wrote:
> On 7/5/25 10:27, Koichiro Den wrote:
> > The /reserved-memory node is inherently not specific to static-shmem.
> > Move it to a more generic domain build context. While at it, add an
> > empty kernel_info_get_shm_mem_const() for the CONFIG_STATIC_SHM=n case,
> > as it can now be invoked in such case.
> > 
> > No functional change.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> >  xen/arch/arm/domain_build.c           | 40 +++++++++++++++++++++++++++
> >  xen/common/device-tree/static-shmem.c | 40 ---------------------------
> >  xen/include/xen/fdt-domain-build.h    |  2 ++
> >  xen/include/xen/static-shmem.h        | 15 ++++------
> >  4 files changed, 48 insertions(+), 49 deletions(-)
> 
> make_resv_memory_node() was recently moved from arch/arm to common in:
> 
> 72c5fa220804 ("device-tree: Move Arm's static-shmem feature to common")
> 
> Is there any rationale for moving it back?

I overlooked that commit. So to preserve its intent, and make it usable
outside of the static-shmem purpose, which is my original intention, I
think I should place it in xen/common/device-tree/dom0less-build.c. What do
you think?

Thanks,
-Koichiro

