Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC94AB02A0F
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 10:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041728.1412326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaVYm-0006I7-E0; Sat, 12 Jul 2025 08:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041728.1412326; Sat, 12 Jul 2025 08:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaVYm-0006Fs-A9; Sat, 12 Jul 2025 08:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1041728;
 Sat, 12 Jul 2025 08:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=STbM=ZZ=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uaVYk-0006Fl-MY
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 08:26:15 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d57532cf-5ef9-11f0-b894-0df219b8e170;
 Sat, 12 Jul 2025 10:25:58 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by OS7P286MB3760.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:23b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.22; Sat, 12 Jul
 2025 08:25:51 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%4]) with mapi id 15.20.8922.017; Sat, 12 Jul 2025
 08:25:50 +0000
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
X-Inumbo-ID: d57532cf-5ef9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/ms6siOTlnjtS9kL84W7RQpSu8Mwx7/qpQd0f2GwbDvwfFj5d/sDz51fQS0w01SwHnGtZQOvsoSD09fXhtYqOfJwRg0SdUoSWgOqDSRvA7TtQZPTGpElMkcu05LtHAj5EZmfmMSiT3kyuPAec2WZWwXKvHbvu74PPDMY7R+K3O7l948V7yn58i0XwtP66fnm/dhZ78B/16lTJLtF9bmcrMVlU0mFhlQVQH0LjGXU7yfNJHUGwY1BlYfyQ9PuwWYVMm1wuBaCHkTBzygWHM2dcjj8gmJZG5noKrKBOM9lrtPdMFX9GRy/p3C677c6zNYsXaw2C1fOkJNfbNb16ddoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R583yR0jXeLf07wZcKDH6ddwhXtHH6lISsk+OR8Q+Po=;
 b=VOVXiTeO9ytk3YntbMjthNSDv79nd8Dflc36aqgUxVtfuje3cKqKlGV4t+JRlmIP6i6JGNhoVxVbDxeyMn6EJZztFX7bLxE/7gOyCpuLWAPN4vE822pOuEb0P/h9nWtG/O6J/sWauBSevtCMNoC4qCW6pJyf5SusHqktsxyRZD1UIbYYFRfdAexA24enhduqLCHYXVwmCi1lopkGdz7KONW6QndkV7QrUDwBThaHmsXT78DjqintFTY+MbJBSI1sDz6AdrFSCqChXNKCk4Zyumtybjemlp+fJZunpchU80PVaAWItaJeG1u5VLmI6VoxrCN+YNWGh9EAr0BqopV+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R583yR0jXeLf07wZcKDH6ddwhXtHH6lISsk+OR8Q+Po=;
 b=cq7QBhFZnt0ptYOW+X5RBHjwo35ZTDoQhd/KphFHP7yMWfp2PjwAGmfP77b8Q8P0+XoKe6tUT4hKGhuJ/71TfwFnyIgbH0WYYFHomPlY7Has4lE+H79vz9k+nY7ZWWUi9czRDbbBLO4djp8RjX1AHxbdF8tUHQ32h9Ds1rI6VHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Sat, 12 Jul 2025 17:25:48 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/5] xen/arm: Move make_resv_memory_node()
Message-ID: <nfzunxrztluwf2hlva3i5t3qw56hnj5w6waaoqt63skczftqsf@wgfq6lxtgysi>
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-4-den@valinux.co.jp>
 <ed706953-f6e3-4911-adfd-0e19290a85af@amd.com>
 <lfhrxqqpwi536wtuwks4j4dtrpcypi26ojv3wnaxfi4qcqslx6@r7xamjwjm3nq>
 <72892ede-5269-44eb-9c7e-8f35bd0716fb@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72892ede-5269-44eb-9c7e-8f35bd0716fb@amd.com>
X-ClientProxiedBy: TYCP301CA0055.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::6) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|OS7P286MB3760:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d132b5-a093-4af4-f1c6-08ddc11db5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xBCA6UBwyeyAS1Bwb1mltiT1gvq7Lsvy7wvNhI15Rmi7yzoc7dDZ8Pj/LKn4?=
 =?us-ascii?Q?/QClr0awc0wN7QOoCA+bprRIzFhMKdIOzxhndlf6ZVd50eG0G7utORTBT8Ku?=
 =?us-ascii?Q?jAy+Mq7gobtElMCNpWEbgPmtSVE1stDrfnehqLA5nzn8LQNEax6b3yv9Mz2z?=
 =?us-ascii?Q?1kPpdsT0OiN2y+IhnYHTm8gla1QXPxjUftdxb/tAwnlp76tVjU8LbwejkeLD?=
 =?us-ascii?Q?8M85xx1BcpSPGuYjqhNGlnCKEK9/bcqclt486gIAIhH9KFF1AeBBE3s7LwWY?=
 =?us-ascii?Q?X/canw+MFkZkOVIyAbp4DwI+gWNJ2O9ss1n7KHBIkcGsGJbWrJyUbZNQJcvX?=
 =?us-ascii?Q?EqlW1V6jEnhDdJBFcObmkYZ/47GA8/ct92ta0OFHgr4pnYHjfES6cUSNWshB?=
 =?us-ascii?Q?rjf170lOldb8EKnaZ0Zn3c9qgz+EepdyJQjFY09rREaTwk7+zxgOKnUCmoLH?=
 =?us-ascii?Q?tJIiYSwxOU0aF9nB2zOCABzvV/yRnQcqcm6vTLGNWAt+mUqv+961G+xdBKeJ?=
 =?us-ascii?Q?GSbsX5X1Db6OenC23uXgKfDU/8HxDPrjeYbWXK/sCUf2WUitzwBLpcT70WMK?=
 =?us-ascii?Q?HhoQ6cs4M0x9qXbVJ9tgi7/x41bxUGuPB2eAHySUXUnBuWDZu1fF0YV/Bcpq?=
 =?us-ascii?Q?1HB8+hKffExBbflrsJxewH9VN8NX8likv88wzQWbs9x/SbQfgN6IRa8JoQ9g?=
 =?us-ascii?Q?casaY3/6RvSMINDUdoa3PeLZUtbOK+JgeNS4UmFUTaRxT2lD8nFZEiJOKI17?=
 =?us-ascii?Q?A95sa4iuktJwx88O/vdyTOV93t1m5mNjfRLHXvEX//P2yjKs70+2FNp4mKaX?=
 =?us-ascii?Q?9LHkm00Yv5yC472q3/6RgXFSWuV+mIQ02jizzh+50YxGeZizz4nvxns9Uzwm?=
 =?us-ascii?Q?Z4Llu20v4/QHE4YBk0jQLp8UXqWRksNaG8qOi4igC8rsBxUF19VQlHje14rt?=
 =?us-ascii?Q?UtJ55NQSxuD9/EB420OPIvDMu3lZQKbpMZFRyvZI/u+QuLSI7hopjcJ/s+EQ?=
 =?us-ascii?Q?SDo7+uon+zSkj8zSk5GZ8nphvOD8+787UqSOy1QZfAsKFTTeGkNNI78hnONr?=
 =?us-ascii?Q?HqosEvg7qo48I1cnZrrbwnGms2SYaZKFvW/ta6TTidsZSvRVBGSGLQzyHcE5?=
 =?us-ascii?Q?84AOYvpJVxSRWAD/NX8Zww8okgVV/zEpXLMo8KKs/wXR++kLydjeuFEf6NYd?=
 =?us-ascii?Q?yGSjJB2lET3P3jz9qzTX6sGq+GNZb1CtCJJEvKCwArw3HxRCdFUmGt5qmRBW?=
 =?us-ascii?Q?f9DURPTL7ipABsfXQ2zrnMKy8z/srRQGwW/jl46BZTDhy1B+onTovmiDFzMU?=
 =?us-ascii?Q?xqKjNtO+X+/3PzH8FZKqWwcbUH7rnZ78g+60dXrN5YQc61boUVjrkSIFoLbc?=
 =?us-ascii?Q?NiFIDv75SJeB+30GK0DOxUGsoikQk9K0VPhaIdYPkp8D1uwE7rueqsZkxN3J?=
 =?us-ascii?Q?srcjIS+M/s0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v/2rELPfLWM0/e8Ptvuh9J4AiUralMXcaaY/FtbUvtAIIP1CVlzxuxWq3m+C?=
 =?us-ascii?Q?ZFQfBST1JdEtzauL+YJOvLnG3Vm8HFDrlKS1/37Kuu46QJRw2jcAzwTc8gFB?=
 =?us-ascii?Q?+opgctK3u/bd4Q8ek3/YeuuX/A9KN/DM0rDz6qHFiuSIyfLK8aRhZNp9W1kD?=
 =?us-ascii?Q?s/5ZsCQ0CYw106nHC6qCv4O0tgfYtdms+1TuKRQfsuPp3EzBSE4DgmU2k9Az?=
 =?us-ascii?Q?cOcvpR3UzobhWZMWxNUbWAG+rBYgK9NgVY1ooxa+HSPEnNM0bEz/NxCct8AI?=
 =?us-ascii?Q?d1mvegaFt+2G1UckM85VZTnoGD3PWFuy8C/u/LS2CL2Eclh9RQ2EvEdFMU5s?=
 =?us-ascii?Q?5ZTY0U9sEClNKosvsm9uzuNSpBvoAczRMVfIymG8qU2c1XvHFOUXXKzNbuux?=
 =?us-ascii?Q?LnzVXxKdIoyjUyA2UnXbbWUx68QxkEyRF1+F32TtKHTVPSWv3L3kcgpvAmzz?=
 =?us-ascii?Q?TYFBce4kcrH9LMBa4fs4ghTe2wS2eYilbHkTHkNvbmD2hu85dtKeO0yhq/jC?=
 =?us-ascii?Q?9uHWPM7EnWTRfo6ztBiABHhVJGp/XcqHS+S2CSjAEfYWJk2+3Z5PLzeNiddO?=
 =?us-ascii?Q?pUuPZEBaiy+Itrm3/bw2tYY1R6PjNWk62JPLrRPsFmBZH3GVwgj7XBDDADee?=
 =?us-ascii?Q?1q8AexeKfVoutUvzba8PvMGUSE1D5LleEJ9D5juiDBMjanSdBk32oXMRx2uZ?=
 =?us-ascii?Q?/0M6DBOmDnri+YzCLGu4qyZi724uuU4a1Mbhrc1kwM2exozwIj5w6XByCpHY?=
 =?us-ascii?Q?B7ifEt60IW/O8TaZzlBXflqNuaHIkreeetaljTPtTJF7SWPFvWr4JJb4H5Yf?=
 =?us-ascii?Q?xlvw8jspa/E9qR1SdAjper6fTe0W8csQFyeGeiRYGEEBt01Np7Ytx6/9IHTc?=
 =?us-ascii?Q?pJdqFwZ0wKOHhVdSOGdJZL2vEp36ohvZBTmrcma017pWXJH5/hhwZcmITgzG?=
 =?us-ascii?Q?Ouf4lvR9vrKuLE/2HDmPVfWkjg4SZTTuD++ex52kXbjB9390FC0Vxd9zl7wn?=
 =?us-ascii?Q?fN4v5AkwKzQ7DH44N0zcVBcnR614pdJMr6X3cn0O3xfga5vmlkAnv0sCGVoO?=
 =?us-ascii?Q?khvp2Q++Yu9qOFPCSM6kyFHrX2z47RLxmnOkWpj1KGvOkaip/HiuD8PiKTI3?=
 =?us-ascii?Q?Cg/dgq1y29YT2gU41ev2maT18edv9YdX+Sa2q9IO/UpUxBsCX9pRCUJRan/I?=
 =?us-ascii?Q?4KZRjs0JmXMmqmluVV51OaXM+XNFy+ZTbD9vV7UM22SR0REIZWNaNl2/oTgx?=
 =?us-ascii?Q?cq0AB/OcqvD8KU+jE+Ht5M8L9qCPOkkJnxmELqhkpdUKzDwsKsV3I90AOy8h?=
 =?us-ascii?Q?abVqzYaDFrO15dTnWVYL59ezVzHgdy91Wc1BfmsXOLzpwt1hh+tHXpkCXj0N?=
 =?us-ascii?Q?/9yLbWyTM7QjXZesfc1QxR89Dwv0cPj3cpJXlpmRNTnCKrc/oFduFTGApoG3?=
 =?us-ascii?Q?QRW6yMWcJeF/+kn3my8TSlDPyW2sPs1/J2JWsFAeL8DQqCRoZ2ijutVyKzp3?=
 =?us-ascii?Q?okb7lxRvf3eqfT7pFdHcr6cpqt7O8npwCeSn5anBO4236ysprMwLuy9VzpXB?=
 =?us-ascii?Q?7oEaWT2+Pqd5cn2Pm+y7dGIc7dcQvPGC+gAyTssYbgyOHSFW4SgJ5zwnwN+5?=
 =?us-ascii?Q?tSb22m1NcvgORGc+FYEYOPc=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d132b5-a093-4af4-f1c6-08ddc11db5bb
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2025 08:25:50.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3myXdttKMzwckEq3iceiKKF+1sgacBD5gHRl+43TPI3Gz4mtlTcxKhrm2PdLxmKl+ysQxbhi5oOQrJ4Fb/dYMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB3760

On Fri, Jul 11, 2025 at 03:36:56PM -0400, Stewart Hildebrand wrote:
> On 7/9/25 03:58, Koichiro Den wrote:
> > On Tue, Jul 08, 2025 at 04:12:50PM -0400, Stewart Hildebrand wrote:
> >> On 7/5/25 10:27, Koichiro Den wrote:
> >>> The /reserved-memory node is inherently not specific to static-shmem.
> >>> Move it to a more generic domain build context. While at it, add an
> >>> empty kernel_info_get_shm_mem_const() for the CONFIG_STATIC_SHM=n case,
> >>> as it can now be invoked in such case.
> >>>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> >>> ---
> >>>  xen/arch/arm/domain_build.c           | 40 +++++++++++++++++++++++++++
> >>>  xen/common/device-tree/static-shmem.c | 40 ---------------------------
> >>>  xen/include/xen/fdt-domain-build.h    |  2 ++
> >>>  xen/include/xen/static-shmem.h        | 15 ++++------
> >>>  4 files changed, 48 insertions(+), 49 deletions(-)
> >>
> >> make_resv_memory_node() was recently moved from arch/arm to common in:
> >>
> >> 72c5fa220804 ("device-tree: Move Arm's static-shmem feature to common")
> >>
> >> Is there any rationale for moving it back?
> > 
> > I overlooked that commit. So to preserve its intent, and make it usable
> > outside of the static-shmem purpose, which is my original intention, I
> > think I should place it in xen/common/device-tree/dom0less-build.c. What do
> > you think?
> 
> Hm, if only considering its current callers, yes, because STATIC_SHM
> depends on STATIC_MEMORY depends on DOM0LESS_BOOT. However, whether to
> put it in the common domain-build.c or dom0less-build.c would really
> depend on how you intend to use it, but I don't see any new calls to
> make_resv_memory_node() on the hypervisor side in the remainder of the
> series. Given that you do introduce an equivalent call on the toolstack
> side, I wonder if that's an oversight on the hypervisor side?
> 
> Lastly, in the context of the series, your intent looks to be to add the
> pv time region to /reserved-memory, but is that actually necessary?

On second thought, it's not necessary as the region is always supposed to
be recognized by the call (follows SMCCC) only, and it resides in memory
holes that Xen will never use for any other purpose. I'll simplify the
whole patch series while also including the other feedback (ie. fixed
assignment instead of searching for unused range). That means I'll drop
this commit in v3.

Thanks for the review.

