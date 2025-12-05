Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DFCA8522
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 17:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179253.1502837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYNU-0003wF-VB; Fri, 05 Dec 2025 16:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179253.1502837; Fri, 05 Dec 2025 16:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYNU-0003u1-RN; Fri, 05 Dec 2025 16:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1179253;
 Fri, 05 Dec 2025 16:09:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3Xi=6L=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vRYNT-0003Yi-7v
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 16:09:51 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d335d145-d1f4-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 17:09:50 +0100 (CET)
Received: from LV9PR03MB8368.namprd03.prod.outlook.com (2603:10b6:408:364::10)
 by DS7PR03MB8267.namprd03.prod.outlook.com (2603:10b6:8:269::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 16:09:47 +0000
Received: from LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3]) by LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3%3]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 16:09:47 +0000
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
X-Inumbo-ID: d335d145-d1f4-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkLZA6N1nvbup+Fk6cqMWepStCUaBsRjeaJmTKjeoP6Ab1e9YWsCTJK+G8S4UF/RNWfloWTBFJMgPQjM8OfDuhkEWXrMepih6KQp4qjWziJxy3vCfhiFxiYY0tQ9Itbe3gAcSe0CG7RpLSYamRgUtGLL1RHao+VZmM99EyUrImPYgCwV0fGZbiUaVTWpLyGgrRDS7qkEkNDizUMJQF5xnzaf8dPQfrMzMflXJlTxKY33BmetQccGKH8kuan63OlXuxxgbtKP0JJKIEqkYnCERsI4/jfHyrZjdx3hQPXgzSRD5CBEmHz5ZohgBjn+CDHTqqULqVuS5fKKWcAxAMiPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vtj4u6Sb0FKSJakR21FFtoFVdRNuXPAtZwmS6dhYuwQ=;
 b=iMcDgBEG2IulswbpW52tIGyHTR5CHjrkDRTXSRCddrjZklioQh+5+poc26clCh3L1jA6PbY2mhplyh4sgJPLA83fwReTB0uUECi/J2izAFFXKsE5cjStQbpbiBRYJuvHQZKvJKko7JLK3JiAupjfZ7qiyNq+RMg6ohTZfezJsJ3MY1fM9hrHpeCzQMq8jzFWF53JcNfpslhWwkS85L/FVWolueutrWT915JdHw/rlTLN3HohVLPiFrJTlkUwUngGr870boJ1uWEuNNhNijztoFdmYoeKl/FwMyJBGWvcCaHqLTtbu4xqIy0qqPKr6bXBwXuLauY04lEGOw9QP5ZbVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vtj4u6Sb0FKSJakR21FFtoFVdRNuXPAtZwmS6dhYuwQ=;
 b=KjpXOuU7pqMN/JNTfogrN3172zjbd0dAyRlI/ecO9m8Gpis+EwlZtV4CXj83g3hisJw4YtgKjBuTiSBugM/t9Zk2tSe2O9U5Ss3cazD5aN+L1ETu1yfLV2L3HwxASUjwf6ivLC9A86QPFMd6ba0DkWJNMCYoZuJGZmHu6ajHT+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v9 0/2] xen: Strip xen.efi by default
Date: Fri,  5 Dec 2025 16:09:38 +0000
Message-ID: <20251205160942.46694-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::14) To LV9PR03MB8368.namprd03.prod.outlook.com
 (2603:10b6:408:364::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR03MB8368:EE_|DS7PR03MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0909ba-7fcf-4614-c1b6-08de3418b651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hn5YtaeLhxNMIvnISfO1GgkYTa3qLkpH/X4v7bk5aXRcwpL5CNZpJYiRQuhj?=
 =?us-ascii?Q?pVvc/7jkFlTzwXe5pr10Vb8kYn/VEvahkoJ9GIh7MJLp0R+P4hE+rIx6j2lM?=
 =?us-ascii?Q?yHrMLkbIQ4SZ4Ei1ejidFieCF5Q2zlXlxy+wQMIzDbwwR5oZdP+36ASZulfF?=
 =?us-ascii?Q?OjP9yySTHYSCh56aOL1rJtgJVjRUEd/yBHM0/BzXNteuclTuoAMpJ5PAz9vH?=
 =?us-ascii?Q?E22TkGvpytC+mSBLqfZMkaDKsNvrImlGKi0DgAdlthfGJQ0p1LLJH0FJT234?=
 =?us-ascii?Q?uSQd2sQHHGoIlYubjSn/8IrHJEEkKp4Npe7KCakoAKdjoghQk08NJLf58Ypu?=
 =?us-ascii?Q?OOnXD4eWJV5gXUAenyYT/mm3r3RiluBNDDjpxK15uTioOTzsLOJuj5acJdsZ?=
 =?us-ascii?Q?Y/xWIOTFqj4Ex+vBGSVSzyw0F5VkSQsrT9kUmWjDMaIstq21s8tPioyieKY+?=
 =?us-ascii?Q?lFgcHLsTEhEK6FvrjWyJaMUpBjAnK5q/9VpyNStuuBu58l+GnyHDRJw4dZa6?=
 =?us-ascii?Q?HwPVbY88mh3GkgWgguymfNIWzumt96AyggeL8zxb+uQvG8etqY8G7CeIL/iy?=
 =?us-ascii?Q?AAJa2xjTbGMCM+nDsNiGQedKNAiiroM+rA4+DvbvvsynhJckEk4WHS0VAfCq?=
 =?us-ascii?Q?fn1htcvGYG7ZtlZhe7B3xFjPBJVQrIdRpu6PiEL6DrbHjjqkr91EfpLxq+7f?=
 =?us-ascii?Q?O1M43SeZXQdEbxoQZR08zkJe3LpY0l/gmv9QXn0lKe9UgWlUcnDvSDMDSz/G?=
 =?us-ascii?Q?1RN4XT3vKELDlORmeB4CuYFYIrH8AvBreStRWdMDvjYFXg8mwVLlSkYXFQ7/?=
 =?us-ascii?Q?oUXv7Cju0TuCg21zwbBGz50jpTcSgmP/sMxEP1MaZadO+NyH6kiQXsKZr3FL?=
 =?us-ascii?Q?D++L6XncyGBMReth62ISPuz8YCb82mzhi2sUl36tT9UDnOKXk9zAqFWGhb7N?=
 =?us-ascii?Q?+/BXPlkpxJ4gG/CTlMOVmk0IAXdsC2GJCWNM7FQyQ1EPrFzGE0tixpAlmapE?=
 =?us-ascii?Q?rVFQoXoY/+/C6etU0tcrKEgt0eJtPr6gS9tHco0J7PUto4brx7VzzOxuer3W?=
 =?us-ascii?Q?uIyJvtE0d0samB7zjLDCQ+3yG6Rxe/qTprzbivQ2AJPRhN2Srh9yzkdWPVNX?=
 =?us-ascii?Q?glJcePmIozSc+Y5+u/ZhHK8l8khDef6m/NKZtBPQ+G5eGmHXPw7LBTeVTLTf?=
 =?us-ascii?Q?Xu2BFPobB/Y9auLfxSaxaTfwumg7bQI9+gBdWOapbjp7OOLZd2bGpInQUxh2?=
 =?us-ascii?Q?9Lz+rzfLJsOVnmOFCj9l803nihjBmohmbt4BgAu3N05MbGc2LX1jrKAGZVn0?=
 =?us-ascii?Q?6S43r+0Mtsdcldjh5+Yj4YMD59CJa/Mo9N/NN+KuttzfGzp5jJFzVxVaEovs?=
 =?us-ascii?Q?wOOMjm8AKgcw4/c9rp7pPrUi6fFPU2fPxvxLf/UH2aC/8C+T/5wmYdnnQhIh?=
 =?us-ascii?Q?YzxQS84G2F/EAUHwGQcARs/n1D98hCFa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u3Iiv2cfg0DBWIkiPr37fBcXV01ksofOKJlgmlwyClwrth9wIwjyxk3O2V9s?=
 =?us-ascii?Q?1EM5Kch8tLMmnTFEgkhixzjLHoi6f5S0Fu58PPOvF3l3lfZgkE7IECAmrR4S?=
 =?us-ascii?Q?QHAAj/lNVdiK5w1zQdM265PUP/j/9SICEY7PEz3bz7NQljnJoxydymR8uZFM?=
 =?us-ascii?Q?QmNJI1dgVd0QwenLKoLzojSd/+EetOZIf3zXO5sWpGIMBKMkHzfVH4YPTfFX?=
 =?us-ascii?Q?jqn+ldeZVP2jrQOFZUWIRXmBrpbdrhxmftRDemH/j/dO3dblHJ/cYLwbT4ui?=
 =?us-ascii?Q?6SWeE7j0HOJT/y6gCAqNmO/E7zDA+6PXqz4CGbXQPZim8MmBO2p/IEEfliX6?=
 =?us-ascii?Q?OQlc1uiEwVZXz7tbEPb5Xl+y7ARjNzIpN2a4Vuz3GmPOlK6cMA10mwE6z26n?=
 =?us-ascii?Q?UKuXneqHaY4PYrmnUvLW27r6iTLpFX8RSKLXBYEe37bGVxkE4Qw4uvPjyw80?=
 =?us-ascii?Q?fE08TxAj+yS62xRornIc5JR6dfwnPNRgt2G8l7jArt6yUDU5vuhgEcOYmUxP?=
 =?us-ascii?Q?SeIMfE/y9cNkmH+tWjLw5qBtJzUIdtpU6hawQNhpUN/BD/nOkvEnLntid0lg?=
 =?us-ascii?Q?M0iejvFH/NKib4X/kjHddsakF6xt6AZCtT8CeVgqfTuy7QupLR+x9rjSuSjp?=
 =?us-ascii?Q?FhFgfwQSE6NBnOzoSbWtq/3IpLP2bhv1P/zf4CQ1cemFqHa3O1UwbFMJ85DJ?=
 =?us-ascii?Q?af09lEj3+OL63miarFs+3kE2/xtd6yotQwCf1ij1oNrH7BerNNxlpu1iGmhS?=
 =?us-ascii?Q?5BTGJ1rxX5ehknG/Ths3d3X6hlPrM+YxqpJVNU692+LRGnGvNJNvY2gPW39k?=
 =?us-ascii?Q?Rwn66bzUXoxIfftqmfAAM9ZcYc8IRpVqG2U1t0mv2JTuPaTktlkv94j3Tx7K?=
 =?us-ascii?Q?HWZxjJ7UqqgB1CaqwIVy3X6fJzXdiKKRIeKcVE053PPjMsfng3+Ux2bf40Vq?=
 =?us-ascii?Q?pDQTc0HiL+HietLQfvC4RFn5mfrnhyM06BxyT88f0exJt7SnHHoNTYqQvsQu?=
 =?us-ascii?Q?ZMt5UPbVcd/0ZWxqEjgGfy48KPkzRjwNSpLfEmMaBXgdgVXoN3TnjGyzikso?=
 =?us-ascii?Q?qGlykCwra671J/tG5E/9QOdSt2ZZF5V0/bQ6hMnNb9ja+jYTn/rN+lU9VKE5?=
 =?us-ascii?Q?Q+HTat20/9sqW6rwrMiP5Ao8WGr1zLmlzF+bnmUG1rFooTXztlGQq5WH8VqB?=
 =?us-ascii?Q?vkPSUzJ7va3PJE6FVpNRqB9HD1uHVZU+aNci/rgyKcFC5HBLfFLwlT4MWtOs?=
 =?us-ascii?Q?uiLeKpMth74rXoPPzt392zLfcU6yGwXl+vt/sBE3IhQ93ggE6ApKyWx0Yuxg?=
 =?us-ascii?Q?TB7XY2oKDe+jIsgUERHmnRZEJxRjETeoJbzXuiY9O9n37krrmozYTr1K0Qmk?=
 =?us-ascii?Q?NOvzT7ZVgVl+g1f1XCKnCQn8ozMZ8jPUjscasIJDzshoOH2Zh4glkKuApw1r?=
 =?us-ascii?Q?nM6JBRlNv66Hdjg7kfpm1s8BuFOS1qNBy7gs4LHSsVmQi8V/X1RM1c1mt7Qz?=
 =?us-ascii?Q?+u4Hz91gXxBZH7VsAJSIPviuweEhJTCDTR+Jc+VIi/0tnL4yjb0VC+GJlXxc?=
 =?us-ascii?Q?hUGQJ5jPcJLjlTxZtaM7V2y6uLTjUyhERDnEOxrp5tyu44sBo6gvQ9Gqj1/q?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0909ba-7fcf-4614-c1b6-08de3418b651
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:09:47.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9U/HezxF5xQ7+lSbDVjtbxjMb4pSbC3LH9WxBdXXKkhqhtmS0+4s33Er25J/IF7sybBqQi/6x4Qvn1TfUr1qmW3N6okEbbeQNTMwB3rK4z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8267

From: Frediano Ziglio <frediano.ziglio@cloud.com>

The main purpose of this series is to strip xen.efi file.

First patch disable the build of the file on systems having broken toolstack.
Second patch strip the wanted file.

Frediano Ziglio (2):
  Do not attempt to workaround older binutils
  xen: Strip xen.efi by default

 .gitignore            |  1 +
 CHANGELOG.md          |  3 +++
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 25 +++----------------------
 xen/arch/x86/Makefile | 12 +++++++++---
 xen/arch/x86/arch.mk  |  7 -------
 7 files changed, 19 insertions(+), 46 deletions(-)

-- 
2.43.0


