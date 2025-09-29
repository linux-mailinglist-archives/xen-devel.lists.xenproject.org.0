Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C706FBAA326
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 19:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133085.1471262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Hqc-00018U-Ch; Mon, 29 Sep 2025 17:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133085.1471262; Mon, 29 Sep 2025 17:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Hqc-00015j-9c; Mon, 29 Sep 2025 17:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1133085;
 Mon, 29 Sep 2025 17:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cYBO=4I=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1v3Hqb-00015c-4Y
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 17:39:37 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 420b3dc4-9d5b-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 19:39:35 +0200 (CEST)
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 17:39:27 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 17:39:27 +0000
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
X-Inumbo-ID: 420b3dc4-9d5b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKc/qv1PHUlSvIUO4I+jwJm3cPT6XA/RSAY1rBvYjyMAogQhQdTuXqDhOLaibKU2Ca5DxJQ8Km7uYanbcbTyuHsaU/D93DTWb0LwffJizSwvG7H14BjsEnhKzNcRNcVyYBFRjLV4QJ8fdSdiXKg0aHAIsB8rDE0RAPXv++p8Vg7FNVpoXvKDRcH26djNrkd7ltQlJ7fFrdojTz5f8s4IjV+t7huEzz3JFbcL3iA6XEifAxE0DnG58x8v+JfIB8/2m7XvKqfHoQh+I+NqP0Sw1FuT++/aIINwLYw/c6gXQkiiMGIYr38cpUm1KWymtqEOaXv2m2aofQaJZOAaJeNZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtRdpiMoQ/tJHwKBwA1fxlbmM4w3B3EJ5OtppZVIkf8=;
 b=UVATGIIfRig/fYRMucdFAoZHU7QvFa0ONuV3jFRCXxo9AMq74ZQpsm4+sm5aQWTs83HGJlCtDnREnWBFFmE5jG9wGGy2gggPZEzDFMPx7YYpJEkoLjUR0m/LnVNpPuAjI9ixRc+GSg5CrytvHWk0/M6+3I9LJ9W7jLXDoAuDoPvBQBFGzo4zoVXDZ5pxujjB701u+gLfJu6j+N9b2IY5149f4jR/odjeGCCfWo9tmujWpqRQr6qNEocKEhcZM1nSDf9dhtoL+z3l0aOOEU1rM+86Z6Fdq9SU5e0rlf1LsJuVQk9iHI7JYwF7jpARF+p4vXHoRXTHMPuG1pwqHKMneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtRdpiMoQ/tJHwKBwA1fxlbmM4w3B3EJ5OtppZVIkf8=;
 b=n5cXzyNvCDy7Px8SNfUf3cmoMpzFp+WqGN5GlTokiNn1ZUR1GRrvcND5z4FOytPgmqJkayuxnD0UqsP8CBQ4Ze1wIBb5V++u5+HhP4dV3TqKBJlLdUrqYvvFhCkfrhn/wOoSWzVGSgeS3KtpFcEs5ZZXxVspDhKK0GbYuYCiQlj33GU1eQ/YadqYsWusblpk8YeQzUKEJOKjo0AEetHNqn/uE38uum6BSKGZbvVnBl3c+JDgmoCz2tozt0Zw1wuLSptorcTzAIYv7nUVLt1N4C6d23AKLlpi3VSpNA+vcvFFC+6HtcwuWFV0mU3V5h7ddKIgTasycaunBk355Fz2Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Mon, 29 Sep 2025 14:39:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>, iommu@lists.linux.dev,
	Juergen Gross <jgross@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 5/6] xen: swiotlb: Switch to physical address mapping
 callbacks
Message-ID: <20250929173925.GE2942991@nvidia.com>
References: <cover.1758203802.git.leon@kernel.org>
 <997c0122a24c355b4d7ee353902041a7617f4c9e.1758203802.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997c0122a24c355b4d7ee353902041a7617f4c9e.1758203802.git.leon@kernel.org>
X-ClientProxiedBy: BL1PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::33) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|MN0PR12MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 605daae0-2b76-4ed3-34b7-08ddff7f2313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bGzBX2cj3doO9BU9QyqzXAIwDAIogWi/hJkGlkKjl41FPbJmR5hKsYj6x5X9?=
 =?us-ascii?Q?warEZs31R/7kBj5vdtooWW0H3fppFR/bhH5R2UR6pUi2Dd7V1+0LnXqYlzZE?=
 =?us-ascii?Q?ycjAWMHt704VouS8nvg25oPOnfCVerUPi/iyofCUk2Scpsn+r1PKo9NgGYGx?=
 =?us-ascii?Q?WpmyfWmdTt3O9TCatd1110egkbghC7KlnQOlYMB2RDTo0jVWjrvcx8K+Toh+?=
 =?us-ascii?Q?R29GOxDt9MDRXzNsI7zNONNvkjdlDFEcHaDZDxM5TNutac2FXKfxdLuhFMtH?=
 =?us-ascii?Q?3LLzvsB3s8pJX7qCYr/tB7t+mzYyKn1s6SW8aCFxkAiSYtDZ8WjO+VGZzyGe?=
 =?us-ascii?Q?G8IY2teTUUHFNTO4mW3NT0R/XyXGj6wkDAlzRr3ComhwGb6hgomi8uLJXxpI?=
 =?us-ascii?Q?aaVQEutfQYggWHjdNBHCAdX0vx49dLkYSm4aTNDGwmfLlUaUqyPLyg71yhME?=
 =?us-ascii?Q?s3KZ2hT+wIhWXBe+EANv/WreLsW0ohdubuC/rvk9Re9AMMtJfKCalBqZp3Eg?=
 =?us-ascii?Q?9zAMwCYdJEh3mVshs7EEjFpKQKyc76+DuMSoU6e7OS6hKwCmuXuuMY/Q3ZDO?=
 =?us-ascii?Q?POIHElQnxhhguvVQ+XSm+4QqP7I5a5SjjkYiYw3eU20ZrpghWiZrPpm8CZ02?=
 =?us-ascii?Q?+tOx4zoc5PZdLNYUQLEFp+OiFmDgDC8VGqz/k7oT2a1lVk4ukSha4bbtAGL/?=
 =?us-ascii?Q?fcYFHQDowa7+QJfTKlaCEe57KEBLFJkgLxjGBMJZ8pesOx7F6NY8FJx5d0YR?=
 =?us-ascii?Q?afEAb/nKm8q+ojvj3oTVOYi26N5PG91XIOJc2AyKhme25xGKVnSCCX7LhRK9?=
 =?us-ascii?Q?Dk8ZYqpGlS5YfiGGPFVT0x9HHmFoZ8o/oQ2wdAmQBzEtrOVOXrR6nfFfJnVy?=
 =?us-ascii?Q?ya2IvefD8W6hpgaOn0KyXPi7igPSUbitkpSnCs6AUxmYWRvQOlj5grnbxfJ+?=
 =?us-ascii?Q?R9ml+igG1iHoD3KYtXHs7rzmR7T2QxBkHqbqX8nBqGvutbzXeLFSAV4ip14F?=
 =?us-ascii?Q?j6Zo2V/1TnEvLDlwWyfvBxe+4XxoKdgM9UQLcuYfxejHU1yQvltNpaFTfefs?=
 =?us-ascii?Q?+MZCPYi7vnKYHPpVXV3bag+PYr6cKwBCRXQhXGu2TihrA9bs6UtqRXnd/0qm?=
 =?us-ascii?Q?XAVlqLpIzqhJQCvVbVpDTbLtdySCsJkszBz72W0O1y2MtIzfsxjhdhgOCQix?=
 =?us-ascii?Q?1jdHI8RIlPt47b0jAf1yGAVHISW7iOcw1RfmzGTA5j9YpfTuHrZmUEW69UDK?=
 =?us-ascii?Q?UYZnMfAULwNuVdGbHM53oYRMIyo4bbLfCPJzvXtz61OZcWzEzwYZK8NO8ugu?=
 =?us-ascii?Q?VBC/QD6R3rQzRkqnsPcJ2mEx+npiAQUMVUUHwawOH61uXmTnjNvjslkOzaHN?=
 =?us-ascii?Q?hMTzYpcHCMTs3eEhoCBMqvr9rcjKMbhYgYrQk+sx8bLmjHYB9dxMMR47rAuJ?=
 =?us-ascii?Q?7RwWACByhXUqROerjJl3rGMDUrm1ubo6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7rw8PttBxy94nlK24vGIyBMo2iARMNMsxMaKZNG70lQxEWpMwSo0FxrN28xC?=
 =?us-ascii?Q?Kk7hUJz4HAlL41FkLJuYtBT9nrU/yWYZ1q03Khm07pkNY9x2TuZSgrRy8hFj?=
 =?us-ascii?Q?13jX917d5RNi+JjDClq371iEvDDgwBxMIM6TJoixeRt0Er4ZIWSHL0MrVN1L?=
 =?us-ascii?Q?m4zlEEs/bQKuc3icfoHWnb7zm7KlqjAu4mEG/GcsGVbIFOzjyJtSwfBV+vBW?=
 =?us-ascii?Q?2brXJJKXjSL4VMpMdZacmDJAaSUJTKn7jQFJaAsNLXEG7MGthif7nyhveHqA?=
 =?us-ascii?Q?sU6Eb6Ff54dUKlSZP9QuQqip8/Tf8Dc9UNOdGfeMN1fzGSZETCFHGwuO+sd0?=
 =?us-ascii?Q?bW1Fr11t36rydIkvA/9IUoxE7LxBYSosMln4eDYB5ws76gZ9GqZNBuFfeqYU?=
 =?us-ascii?Q?rMglwCiH18wSvd3b0bD0CVCTPtj4HK1K+207QEAp42dF/a7OuP22i+lND53U?=
 =?us-ascii?Q?cSCGdn9X1wF0oECl/liUExs2MOU4vg7uN0wBj83Wyj98J0YVyZXj4+OcbbFj?=
 =?us-ascii?Q?83sBJewNhhvQSSzdEQw2sts0eK861xB7xZ+SxLH5KKV9flPj6/TLY5R1wMBn?=
 =?us-ascii?Q?oMVonn9vLfL7iwPjt/kOt0S2IYTxMEZ4SMDQHK24Qhw68rIlaO9B6tnvyvjq?=
 =?us-ascii?Q?Xsu9fiW5VNSqxyUteYdI2panohxblwcp/BOI1e7HOcIB6ab/LS5KddiNU5Lq?=
 =?us-ascii?Q?ktj41SxcxTjpBkvAdQfZ0vZWUuTqkCwHpni8AJD0uc0Cr9jYGcySV9X1FHRT?=
 =?us-ascii?Q?gSISzKg/ynhcRWxk87QP1h5yt8ehBt1hJVBhktDUIKOG1dInFEARrU8oMgu0?=
 =?us-ascii?Q?Mdn7LDqFIh0gU/Jz3BMHhEGEz0FcVkzLeLWXkYzQiMDdAAPX837me5Mp/H7b?=
 =?us-ascii?Q?b5XCOdkSA5OfGq0h2F4Lsy0V17qqFSFkOHnIQb+bOKHJfDTptMWWuwOcPMvh?=
 =?us-ascii?Q?XZjpu3NFzMkMjMvHHKpY2GHnWTfDRWR+UJFq8NO07wfIKzqx123cBw7KECvm?=
 =?us-ascii?Q?8vd92TAZbFA7zHfs6A37+BlDUi4FdWWKauwYnh1AnY8z+B4Y501i0CgthIe0?=
 =?us-ascii?Q?vgDGwz+gbZRNCBE0GmNK/TtCf+QBeE+3IaFKf+IkOZJFuWuKKNDX6MWrr6Nn?=
 =?us-ascii?Q?KKvXjZSssDNxlYm4BGkAhGLdQ9xQfvhNCvFHalM4z6p+tFiVPE3f9EHlDDtR?=
 =?us-ascii?Q?oloVJTe3euWx9bF/tjqKPLdJ9dvpF02yQCiDC0mm7JnejSAjyfQ4fayzpUrr?=
 =?us-ascii?Q?w18IGYPPnniFg0EVG0tgt6YJ4EoBBf4QOuUS8InejOwHLZCQWH6dTCd5aWEC?=
 =?us-ascii?Q?wonTGW7DzVB2ztVa5QmrynjJxL0ckjOCUs/ouuhPyOusaSUMkkceFwrZc1er?=
 =?us-ascii?Q?YJhHQyYRDWBPqlHPemX1tbqgTkE/tqJzk2BHzz7vWAaSOibjCZXaN0TTVpZr?=
 =?us-ascii?Q?ph/wmz1blWVkRQaVXCTcE5Fjc+nOER30otwN5Bw85BV9ieXSCAq6eGspr4qz?=
 =?us-ascii?Q?03cqAZcF6Omsc6RgU789hJLY85tPJjId2DKfIntwX08ujHQG1sEtObOOWI9J?=
 =?us-ascii?Q?jb6+Z3t3INWB+/CG5rRWwRUKiXlnGYu1l2SPbWM9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605daae0-2b76-4ed3-34b7-08ddff7f2313
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 17:39:27.2572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+hl7cBcv0F7z+opKl0LDt4UKsqiFSGQLrARsSse/0f/CdHu0PKCQxz+f8b4Qj1N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5907

On Thu, Sep 18, 2025 at 05:09:28PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Combine resource and page mappings routines to one function
> and remove .map_resource/.unmap_resource callbacks completely.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/xen/swiotlb-xen.c | 63 ++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 34 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

