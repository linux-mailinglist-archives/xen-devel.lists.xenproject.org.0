Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ4OEpGw72lyDwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 20:53:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0DB478E04
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 20:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295214.1571913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHR4V-0001pA-7S; Mon, 27 Apr 2026 18:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295214.1571913; Mon, 27 Apr 2026 18:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHR4V-0001mC-1n; Mon, 27 Apr 2026 18:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1295214;
 Mon, 27 Apr 2026 17:59:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ynorov@nvidia.com>) id 1wHQEh-0001HJ-Vz
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:59:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHQEg-00GhMm-UA
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 19:59:10 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ynorov@nvidia.com>)
 id 69efa3e4-e002-0a2a0a5209dd-0a2a4509c82a-10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:59:10 +0200
Received: from [52.101.43.68]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ynorov@nvidia.com>)
 id 69efa3ea-2497-0a2a45090019-34652b44deca-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:59:09 +0200
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 17:58:53 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 17:58:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=temperror header.s=selector2 header.d=Nvidia.com header.i="@Nvidia.com"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwpVDJgRLpkyPrfWdsCpP94nHFQqYhYYfzZrq3/Y3eNMNV9kiDiO/lbPQcnh84Kc9KV6mYkk8nn970vbv0+7s6iPEYVW6K4EoChbQ41Qt789Udh9qXYG0iRgkAlDfrPUTQ8sayrAf1ja/JDhQMouPOkZWD58nKWYqpFBMo1DDNj8wVNgDK9FxRdlDaJopLZdzHGxZYNJ5taZ4f+3AlBWDxckohAjQSiNvLpxdNeatx21GsEOk2kuIxck61/13uzdWjKAIWRN7lHpHYgB1JwAWYdhnI0JhIPLSMLkKBOcW0uKNe5jsqRdVec4b90SQh3bBTkUz0ka/PlhmT5JsiSnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWBdJXFvUsRNS535pCc24v4leweSht+XdLI4YB0XzRQ=;
 b=JzUtnzYfifHT4anVN/U1LZ+ey7uTRcx8Nn6Nm2hS9ao6k8XZlQLiaLdpmpmADTsoF0ln9yrZ43mTgzp40gS4qmCP3SHZse2kmq2eYIeYuMuHwoWEH5Vv7fhlfZ2f/diNwlwlNxlMKsTb0izAMGGMQ4cYn6SIIE/MJoDjMtlx4eVbTb6wUFNjAz0H8mGu6ee9kYZLwb1h4NdHsUxdFPnysIwTjLgK6AvD73khRL2k8fi7iymz8mICE66X711dcKdxGAaSE87cWJD8y89JkEkcX+zpl2DCijx6ZDalEAkq61Vdd/L+W8dfRfgTksTcDbvv+E+khdr+3nyDPvxgL3L9HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWBdJXFvUsRNS535pCc24v4leweSht+XdLI4YB0XzRQ=;
 b=JEzvcYXQdwVjYZQlnStgbJQRfUGE245OkUv62d/erL7f0QOnr7fp+plL1zfa5mv2O11r5j+JLE5qQdINthQPR+Bj7wYWw46AWrQu/eYz6ED1n8xbwCAyvlDxh9XEzqZC2g1/3KWQVSH/DH18jJwgAfYkttpt/Blmd/pUHyEDc3Wkd3edhlrvX1h1qaZ6ZPmQk/87myHHQ3TrQ1ak0Xvkilcg5V0KT50UAZqYfZ39xcshyA39b5FsO98OY/S/YtJ/myHG6I+ftEFEH6NVP/B7k+6+4RVku7Lrcmp3zsQ+ArtGrvl5bXoyxfgJj2OT6m5rwYJbHAOe8gpGdj72kjww1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Mon, 27 Apr 2026 13:58:51 -0400
From: Yury Norov <ynorov@nvidia.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
Message-ID: <ae-j2_QirCySZD02@yury>
References: <cover.1777306795.git.chleroy@kernel.org>
 <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
X-ClientProxiedBy: BN1PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:408:e2::13) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: 33128524-511f-440c-0040-08dea486a4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T80DamO5jzLhtBsxTULWy0efzaMbF8i7bT0PZKZ+UW4Z1vXusNNCyeFtPNKLbujbu9HADo2BygF39wi6lx74qp3NIinqoXF6o8xZWMAAFsZmucFOM22V5xO7kTuoG3Q6DbZQuR99ud23XQ2FkmrxQgMHmfI3XdFsqYAVjCS9aGVDF45G53+B/x+14PhezRjA9hqQvcw9EvJb6nHARdhsgHJSbcoZorjI9T48oVUEponu+eLNKghANZW7qOCu576IfZ6NRYzsY8ql1Bj8uCnhHA2nhVrKxbbZHG6LptctXV/l6KubZ/U3ZJxrPqPY1X92d625k4fagqEvx268olGcNZDaxDxTtIunEves9hFv+KACk+0uW+ma5OsqtlX5HthzXN6Acbz5tPRPmIKZ/YCyosbcqxLc7ZwX6TI/oKUfq/0tyKExxJEp/Vfc/ZG4cPWp456yUxuQQ7c0zO0EIJ+8b2gQDonWZCvn2KJzNH3N0drPOUzCQcDDQjndG2yh9Ke573Rkt//8VoZT4MTwoNB6z6b1QOagadBkLNDtxDt0AE1XfaIibN7XpAHe5nsEIn2aXs/8ZEHWz0Zv0D5+n5iwRxATzlfDoLqw+IUuN8nm7pwCMHkXF52Sms8QQtJ2rJZUXeJqLYfMQUF/D3X8mn4B7tCVxc1mKoVLz9/1oBAf2bseKRBX0rfB9ZeVX7GBdP+qZAYwkxdtBveQtq9fZ/UIGHDRO8YYxr5lavOVhUA40rc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ev31P6fGlLQLOmFhG9wf+2ZENF2CJrasImnLdTMkk4B07wVpIqdqcEhUwVr?=
 =?us-ascii?Q?VcuKpfWBww+Qglw6NKPvrbqw/iKodwZS6hoQ2ezn6gKQJTXowcVzIMKKmPVI?=
 =?us-ascii?Q?CaGe2PzzTfbrd+1/kBuQd5inX41eLfMXGSMB4El+/BGeY7LidWaO2U6MXIZl?=
 =?us-ascii?Q?To5KMHCCmaxaSW+0abx+uHxslGaDNGAxlD0ajEnVCyj2PyGw8gfavgZvUBeC?=
 =?us-ascii?Q?31Pn2vGdNJPTEao0o8nkBbqzRysmZBZFRsyFAwtcHiF+LMJewEDkGWcf3C7D?=
 =?us-ascii?Q?MhvHUO7rY2T4Gp8yOxYlhdkCQq0m4ykawDCJw9P3w79tbrFqeU7DKZcc6Svj?=
 =?us-ascii?Q?gpUdDiMP1u+wbi6ktqsa2/SBsCawL8yd85/gdX8JeS4P5U//2zVMdqlbS5oF?=
 =?us-ascii?Q?Om8kn23qHMWd1W0xp+L9zqhhURuKBI3C8K6/P0P2OiLTdsZ7lPLULvDBkdZf?=
 =?us-ascii?Q?UKjydMyY/3pcrF3sadi8xEKK6PbOoyabovH4OGdbUvrwD7GG4qRTd8pK59oC?=
 =?us-ascii?Q?snIKpVz1xKnwCa6xY5VnFP5/u/JjDPLADrD/WslKg8YXRFtCzAtBrdImcj0f?=
 =?us-ascii?Q?8yOAh4lyWUDPVX2WM00ySuZhGhvO+v6NJ73vz9XlsUfOsWyYZ9DOEzjUfhbH?=
 =?us-ascii?Q?0YLtM7C7LxhLfanXFKSW+D7acdbl8uANIv2lLYjkqPUxgpfNe8f+7W2LB5Nn?=
 =?us-ascii?Q?7Np0MclwQhDcY1GLCNhmF+qQmAOMVCLRhyHjLhLWkRHgj+alwIysbQ3EuYLN?=
 =?us-ascii?Q?5yHcsNNjsFo0wDyhRUVx5wyCMlW+Z4NGoPr32ydxiktuCQaON6kbvoanfM01?=
 =?us-ascii?Q?VM4/fS2+speM2tcePSAnjiQa5qjOFuYZ0VtZfeGTBIZ1yXD2cHpN1ixZN0Rz?=
 =?us-ascii?Q?L/dQY0op7e/9Yk5F3A4lFGTivTaixUSEIjTezh3qI+wT/tBYEl0Z0XCO2hjU?=
 =?us-ascii?Q?sFOU7EJ1CIL6HbyGijpDH3Yp4I8rMW9VuNbKDzbyWnaJJg9tVdo0/XIJrdAh?=
 =?us-ascii?Q?vVKIJZb+31gwlMVE1kXLTM4rt1jmj4rcA1rNCuw4fD++YKU0KqxirVrsn6kC?=
 =?us-ascii?Q?lZa0X05s4hYIlo7g4DALYttelKqcNX1HEGU6vO71rQrVfydGtRIQzA8hZ8rQ?=
 =?us-ascii?Q?O80VU2eqMYB7eYpBItWytqLFV33JZ/cuulFCjhdnG06CQcNI6/4ovyhT3Aa8?=
 =?us-ascii?Q?PiZXBZphvtTKhhJqQ1c7RRKZs8niebQgxVT+NqLMFlyPhkta2YjjpBXgNIIx?=
 =?us-ascii?Q?h+iPSpkL/BZ7G18/IWgE5T5t9GEq5s5xWwSmey7027/BRYe03neS8L78GvQZ?=
 =?us-ascii?Q?5ceRI/ymV7A6xiSGKp4h0GdJvHPIvbvLvAXTNPJXPyEy/lkYzUg06m/F5Ppx?=
 =?us-ascii?Q?Ucqpyqpi7uPkJEjc3424leqnNg3d1TwAm//hlnXAadNRP0K+njbmTw4CpTe2?=
 =?us-ascii?Q?4HHWlSZ9YpBEw+Ohv14Uf9RwjiFvVAghctOlWmh5sz2AhDjQMGMs8VSWcPgV?=
 =?us-ascii?Q?CT54kkzGd7BsoQ2aPoLVEhjPxQJKnRuZKDOQB6HL77e6jo+Karv0u6QI8scU?=
 =?us-ascii?Q?/P+zWIUoY7Vp26Mnav/FMyG/vDm64Qhe7JrRNaXxdZN6cKMY0RccPxeEvM6K?=
 =?us-ascii?Q?cokd+q0bbXdS3sEK+pM8MrC/A2+EernBjELOWvLW6UNcdosIRiZXx3jxfYAW?=
 =?us-ascii?Q?NoTKA/lHF00/AFzSuUQZeA/Bt64WCRihJQrbIN0bhLrfQCWWaLbXoiNjdnxt?=
 =?us-ascii?Q?OgQB96s+EfSA5RhJu/4bwnEHg5Lb6TZfXmPjZN7/WMw6zB/yunPn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33128524-511f-440c-0040-08dea486a4e3
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 17:58:53.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFLDrWxkcKDSdWjcRZ0FWTXyKov5/udW2ySQZAiU/0h1WJYCpRdFgW8eHZBY8qsOSQ9+hnLtwBfn4bjMnIR9OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352
X-purgate-ID: tlsNG-bad1c0/1777312750-484A9A53-2BCE8B9B/0/0
X-purgate-type: clean
X-purgate-size: 3028
X-Rspamd-Queue-Id: AA0DB478E04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:tglx@linutronix.de,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-fsdevel@vger.kernel.org,m:ocfs2-dev
 el@lists.linux.dev,m:bpf@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Mon, Apr 27, 2026 at 07:13:48PM +0200, Christophe Leroy (CS GROUP) wrote:
> At the time being, x86 and arm64 are missing unsafe_copy_from_user().

No, they don't. They (should) rely on a generic implementation from
linux/uaccess.h, like every other arch, except for  PPC and RISCV.

But they #define arch_unsafe_get_user, and the unsafe_copy_from_user()
becomes undefined conditionally on that.

So please, fix that bug instead of introducing another arch flavor.
We'd always choose generic version, unless there's strong evidence
that arch one is better.  


Thanks,
Yury
 
> Add it.
> 
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>  arch/x86/include/asm/uaccess.h | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> index 3a0dd3c2b233..10c458ffa399 100644
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -598,7 +598,7 @@ _label:									\
>   * We want the unsafe accessors to always be inlined and use
>   * the error labels - thus the macro games.
>   */
> -#define unsafe_copy_loop(dst, src, len, type, label)				\
> +#define unsafe_put_loop(dst, src, len, type, label)				\
>  	while (len >= sizeof(type)) {						\
>  		unsafe_put_user(*(type *)(src),(type __user *)(dst),label);	\
>  		dst += sizeof(type);						\
> @@ -611,10 +611,29 @@ do {									\
>  	char __user *__ucu_dst = (_dst);				\
>  	const char *__ucu_src = (_src);					\
>  	size_t __ucu_len = (_len);					\
> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
> +} while (0)
> +
> +#define unsafe_get_loop(dst, src, len, type, label)				\
> +	while (len >= sizeof(type)) {						\
> +		unsafe_get_user(*(type __user *)(src),(type *)(dst),label);	\
> +		dst += sizeof(type);						\
> +		src += sizeof(type);						\
> +		len -= sizeof(type);						\
> +	}
> +
> +#define unsafe_copy_from_user(_dst,_src,_len,label)			\
> +do {									\
> +	char *__ucu_dst = (_dst);					\
> +	const char __user *__ucu_src = (_src);				\
> +	size_t __ucu_len = (_len);					\
> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
>  } while (0)
>  
>  #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> -- 
> 2.49.0
> 

