Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB2B1F4C4
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 15:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075959.1437743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukjj0-000167-DF; Sat, 09 Aug 2025 13:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075959.1437743; Sat, 09 Aug 2025 13:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukjj0-00013x-6n; Sat, 09 Aug 2025 13:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1075959;
 Sat, 09 Aug 2025 13:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7I+o=2V=nvidia.com=jgg@srs-se1.protection.inumbo.net>)
 id 1ukjiy-00013r-HX
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 13:35:04 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5495011-7525-11f0-a325-13f23c93f187;
 Sat, 09 Aug 2025 15:35:02 +0200 (CEST)
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Sat, 9 Aug
 2025 13:34:56 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.018; Sat, 9 Aug 2025
 13:34:56 +0000
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
X-Inumbo-ID: a5495011-7525-11f0-a325-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVWxGMpQHc+QFX0/tTrsQ+8oHoHhaaBptiFL16N9lUZjafg2Vwxo83jWrmIx0ys15EM9iLwa74lxSiyNk5ftshFT+e1Eta7JIqCOTCrW5byLiQBsfKVaCVBBzPup2XaTOnikWBB7vgKTU+z4zXiTNeng/jCqYBe2h2PYH2fwzQ3PKP8NSselMu8jizZmYlls+PHYCRS2pHfeAG3XPYxZzpJWN8N4qmR31PJItd4uPx4olthfFjDZ02xGEMNGj13mDybVgBPs2TerV0xYuzIS54FH+0SOXfMTRaQBcIHb+RSZ1q23RYtpQ+AgpWmPR1O+sGDFqziTlb5ldPoq5gKYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hQwFjXQOmqNPj4Z17V9pB+cg3fmuvcbi4cPAiVbgUQ=;
 b=S0eeE5f0L2EE2VBH3feGr3RpQeI9Jf7XwUukXfSWpH0rHI4Cbbq4k8XxHRnzfC3h7A9scNhTRHpB7NPASDxxAvsF2uVw8haHpy80o4tFiNNNIUw1ZrWJjHDZ1HkWrvT4659y433RL1/B32AmUWgHSAbFI2tU2kxcPmRuXX7k97ZcM1BUQ4rRwzn/DGDFShh03rW4LPHeitwa11rKRDFgk34lLSqUk2yOrJhN0A6/HuISK79BDAUQ9Ggyj1furszHvdXn3ecKKQh2Rkhx62Vk0/hAZ8KMsrpAQdp6sLgJo3ysePjx/XPBGuO1iqY+XpwavZOZCbPSJLUiTUCrjYqJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hQwFjXQOmqNPj4Z17V9pB+cg3fmuvcbi4cPAiVbgUQ=;
 b=ixJwxTcm+kMKNa9ZTfkl9q/o6ev8PVNhKEbMjdsrg+H/yTiFRoJ2euaU869KCzSfeGn9H/vLmpUZdjSjHFlDHqNaHmllIc10ECQatkdpiuleb+Knbk+tFIZHhwR9iL8nXEM3zYbe8Rg5DOC1evdVGNJ8ruG6NcLB7HnZdrXeAR4XOFAgsC+8tfOHdlu/c0aPJThwgtyh1JkHkPwiPWAq8ktbbdSmztha/wBga5v5PHzke09E7ei/dXf22IvZmYzqagBxnWwCGKeDxF7oRfVM7V0XK2E8HQnukn5ZWhXcY194nEA/ikp9XYSVRduQqYyaKi2HMxM0JFDOmNJjQjrESQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Sat, 9 Aug 2025 10:34:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250809133454.GP184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <CGME20250807141938eucas1p2319a0526b25db120b3c9aeb49f69cce1@eucas1p2.samsung.com>
 <20250807141929.GN184255@nvidia.com>
 <a154e058-c0e6-4208-9f52-57cec22eaf7d@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a154e058-c0e6-4208-9f52-57cec22eaf7d@samsung.com>
X-ClientProxiedBy: YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::15) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: ea51f777-dd35-4f45-4aa8-08ddd7498728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3E5Z09lcGdXblFaVVFad0VLYzdKWGJzZTU5V0ZwN1c2SEJ2cVpwV1YxZm1q?=
 =?utf-8?B?Y0hBSTNKb3ViWGVZL1lyNmRaVUFOelhBelJEdnQvbDQvTWpXTHhURENMOEZj?=
 =?utf-8?B?R1grOXQ0ZG5Ma3hGU2NwZ0xJamIyaVhwRjcwSXJoa1ZuaDhqRXRPMGs5dE1v?=
 =?utf-8?B?T2wzK0huNCtXUnNlME81dW1pak5ySno4TTZyYzJaNFBVbHF0RWhmZ0ttZnRM?=
 =?utf-8?B?RnBpQWozaWRMak9BZjBaRlRGdW1rd3JtTDVIVFFhUHBETEZ5R3UvTjkzdFRl?=
 =?utf-8?B?d1FYYkZ2aUJxU3BpWVNZUVlSdW9yYU1GbTBHVFp5MXVoSXZIbFE3WE1yUW1G?=
 =?utf-8?B?N0YwaU9OTEVnaXZKeklrYk1OTVFJclVVZ25xRTk4VE9HMkJQR0tRZjBMblRO?=
 =?utf-8?B?YW41b3pnd2wyNDY0U05hQVMvY1N0SVVQT3JUMmFZcXVLbmxDdkhsZ0NKK0Fw?=
 =?utf-8?B?bTBlUVMxRlpoWWRDYUJIOU5vZzlSTDVvZTk5Y2E1eVZaZFdrUC9rN0F0L0Vk?=
 =?utf-8?B?WVdEOThFelpDdzJXeVlFcWVCZjMwMHpXQVB6YTlKSFdsMlBWRndwV29JaGpJ?=
 =?utf-8?B?b2ErNVRtY3VjTUIyMDZtc1d3THJxKzBYNlg3eFBxSmFwbzlJOW04Ni9GeFk3?=
 =?utf-8?B?eVlaVW1iakpKN2ZMQ3dDTTBJelFINVF0Z3djWndaK0U4MjdYaXR6eCtaZVJq?=
 =?utf-8?B?N3h6VndrZnhFYVBrQ2I3OC93eVVXRzVWUFlXbk4rU2RyQ2ZnU0JPU09nUXEz?=
 =?utf-8?B?MUNvNjIyeWZqWDZhdDFSK0M3NHYxTkRNRkovZzl2cTd3RGhBZThpSkFWK09J?=
 =?utf-8?B?UVkrMkhTWkgvanpUcTcwMFRieVB6NGk1VTU3NjFxTVZlbXVqMWkzYVhxb3Ji?=
 =?utf-8?B?YlFxcFRHUUZBNTdPc3FxVlJkVkhMbTlKZ2ZRUDNVOHZsMzFrS094TStiRUNu?=
 =?utf-8?B?Snk2S3ZZRThpdXFOQXZRb25jQ2orZHdtNllFY0xSUnM2LzdyYm5FYXdWT0tO?=
 =?utf-8?B?NUptdVFQU25WKzNBQ0Ezc3pqd0VSMzlIejNJSVJDY1VHTE5IUzhGamRBTExt?=
 =?utf-8?B?NFIwMnh5bkxBb1BoeDUxdWtlUnhKZTBKS2NwT2MweDI0eklrSDl1WUo1TG9P?=
 =?utf-8?B?bFpROTRGcU9MK2dabXpiUThLZ0NHc0tScUgrK2hSUFFJaDVRV01hN2xMZVBI?=
 =?utf-8?B?SWZQSUE2cnFmTC9aMHJzREE3YjhLNG5IcW9XZzc5K0RiRTh4Wmk0bENHbUtp?=
 =?utf-8?B?NVRZRElsZjhLOFZJbkJ2OWQzeUVIOVU5SUZLMWlSaUtFTG1HZWF3RVVJQ09u?=
 =?utf-8?B?N1c4SkxOV0N1SDIzcWQvdmNzSGtqbGtMOTdRWVB1NGp3S294enNqY1Njai8v?=
 =?utf-8?B?RTNod2U2N3F4QzZDVitscFN1K3h2VjNIcHFKNDY5WXJmQTd5eUI3aWRZaEFE?=
 =?utf-8?B?RHRuY3lLcXZKa3pkMEhkQXk2OEFicE1EdisyMEt1ZXJxTElVNXNYZWRseGV6?=
 =?utf-8?B?WC9IRHV2MlVLZ3YrZk5EdmdPTDNSNkRPeVpKMi9xdW15RGsvYzNadlV0eUor?=
 =?utf-8?B?UjBMdmNxMC9yNkp1MDNGc2RSODU3NzVTTytySmNkcXJ4TmJCSWNHdDdLRmpy?=
 =?utf-8?B?WGpHVEFkL1FvdzlNRkk4bjlXMCtCbDR2UWw3NmpUMnl3QzUydFJTOGVxd2w0?=
 =?utf-8?B?UktRRUN5M1NoMjlEWThpQVpuTURCM2Jvaml6Q2pmbkZzUkF1MnlaUlRNNHFK?=
 =?utf-8?B?aURCd1lxT09UNU83bC9yaGlNNDRnTDZZUVhrVktweEJxcXdLSUc5MTM0TDFn?=
 =?utf-8?B?Ym9kU0VLLzc4UnI4YVFEUUU0QUVIemVnSzA4ZkNPdWFMME11YUpjOGtsbndE?=
 =?utf-8?B?MGkrN1ZHNFRaZDhoS21ER1U1U0RTNnhWNVBzVUdkOUljOWk3ZnJBSWFNRjFq?=
 =?utf-8?Q?clzIDg9uv2o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUlPQ3Q2bW1obUhaZnE4MTdVVlpBcVlKSkc3OWdGMHE2N2prNk1JQjRwTVMy?=
 =?utf-8?B?M0RZd1VqN1RIK1VLMVN2emZaRzNkSk9iSjZ0bUZYcU8wczFkRGtKeTRqNmJ4?=
 =?utf-8?B?Sjg5OUZVanMzM0o1U1RkVysvcWFVSTRwV2d3UDUwVUhGaGhoYmNjT1BwWThm?=
 =?utf-8?B?VXlsMGlidi8wZmc4MDQ1T21FYWwxa2dpbHlESEM1SGhIM1JFeDNFQ1NZL2JC?=
 =?utf-8?B?cGhFekdyTnlZdlpCVUhwOTdhYVI5WHJKVm9SaURENHlWNUVxSzlRL1V0Y2tr?=
 =?utf-8?B?cHhsY2lHSFN2WFgzSjlUVXo3T1g1cWlocEFZMG9maDBSS1ZuckVrVXVySDJn?=
 =?utf-8?B?NFpnZnZycnY5dU1ra3RNd0g0Q0JKY2hNVWRrRTFaMDh2b29zdGlneE9DOTdi?=
 =?utf-8?B?WlNjK1pHbFppekFqSWR4M3p1dGxwbGwvalU4aS81Sm1VdkVwSmR3RlVOcjFF?=
 =?utf-8?B?RUhjYm1WNVlxaCs0dThjOVRnZk9mOXdxWWk1S3M5eTVVcWphQ294VnFaNDF1?=
 =?utf-8?B?T01OYktuQzR3QWlnQlFoRG90dkJpbFB4K05jZnBDUnVBRHMwdURWVi9VRjhZ?=
 =?utf-8?B?OTduOG5Ra3JLeHI0aWMrNExRaWhWK0kxM0pQZDUxam1PMFhSTG9DanFiMTZO?=
 =?utf-8?B?YzhTb3B3d1FQVEd3MzdzUUh3RXFNS2dnMkdrdUUyc3laWjhaQkVDWUFxTUt4?=
 =?utf-8?B?WVIxUkdoUW80NVUwZldDZVIzZXB4TXZ0Q3pjQjhNOHNOK3hBYndrNkZQelNr?=
 =?utf-8?B?NTdkdGpYSzhjMDJMZEw4TjREeFg5cFlsV3pmUTlieU1oYW5ZSzF5MDJGTzlp?=
 =?utf-8?B?SC8vTTBuRTlHTytOQTdvWmNjaHdvYnNsYzN5aGI2Wk9ld3NjN1NGemxjRysx?=
 =?utf-8?B?bEl2NERCQndsTUF0emNaYXVKUHU5TFR3dzAwOXFCczVxYnNxeEVHK2F2Njkr?=
 =?utf-8?B?MlFxSU1FdzB6K3FCeE9Wb3RiZkVUMXhCMHVKMDRIMVZ5ZWhqelZZbWhsY0Nq?=
 =?utf-8?B?TDF4bmV6ckVCSWc2aVZicGZna0ptTFpmVGZ4WWVheGhuZjhxQVFZNnBqdkc3?=
 =?utf-8?B?ci8yWE1RRjhWR1MyMEpHWC84eFZWZmJJa0ZhM0RzR0ZnWVM5SnE4UERZTnRH?=
 =?utf-8?B?WEdDalhKd0JoVW9iU0RqNXRLNlFDZ2NiVTdhcW5PV3VaL2JFNkVCT1pLWlFR?=
 =?utf-8?B?eUxzSW1kcG9CblNOQVRMZWcwdk5jMURrZk51MTFFWXg1ZlBFc0Y3U3MydGo5?=
 =?utf-8?B?b1B6ODJkaDVCVVV0VUgwNlFvbU5WUEQ1b2FvK0F6Y1NweUhnblErWkpmbXcv?=
 =?utf-8?B?UDZYUUVCSzk2RHVzSWx0V3gyZ3RGTDU3cTBIblhEbWJtVVFsRGxCVk0yZEZk?=
 =?utf-8?B?RTFzQjJ2MTNKa3drczcvZGNtNUE0b0lPMmVON0pPL2pIaG14OTdLZExtQzk2?=
 =?utf-8?B?eXFCbWkrNlVIdDM5eEJLWmNtUithY1pqVFVZWGRVeExXMldhNjlVTXBNSzAr?=
 =?utf-8?B?aUVHZDZsaDJSdXo4dzJ4Yk9KOHRyaEJHS0luL01uNG82bllEaWhETmhRNjhQ?=
 =?utf-8?B?OCs2U2dlUWhyeFZGbVd3TElrWnNaR1RLTkRQVEhBb0xvT05IZjJQVWhZSVBx?=
 =?utf-8?B?eU5RNkZFanYvODZEaWNEK1VBdlRRcmRwcitHNGJxbU9UdUo1eHlTempVaVZU?=
 =?utf-8?B?cDFsbnY0QXE2TCtFMlorSVJSWWZaVEl4OEZZUzFnWGV2ZjlQZkxTZy9Nd1R3?=
 =?utf-8?B?cFBHWmRnb2FHZmZZejNKZHlobFhaNTJsV2Jyb2lkK0Rxdzk4SFFabFJjSjFt?=
 =?utf-8?B?MC9OZ2d3dmdrUVBJK1hkZHIwODFPdThwei8rUXJ6NlJCOW9UY1VMOWhjZjN4?=
 =?utf-8?B?QWRZMFJOVkN3YlFPN004U2I2aWI3OWhpUU1CaFUvSmVnOUdEK3Q2cGVRQmh2?=
 =?utf-8?B?djI4Mk5vZDBxbElxMVowc1hXTys0cWgzbjRQK0dEc1duMmhxc3FjM3dXZTlr?=
 =?utf-8?B?WEt2SmQ0Z3prcEdtRjJ2TldKMEowYUN6ZkRNVnZ6azkwdm40U29selB1ZzdX?=
 =?utf-8?B?bGM4MHJUbzdsdW5Kamc0VkJHaDh3d3plRVVOdVFYMmcyMVBpVkZtaXdodnho?=
 =?utf-8?Q?MjQ4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea51f777-dd35-4f45-4aa8-08ddd7498728
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2025 13:34:55.9153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ly2R1iyYEFH7E0g275dSDdE+KiUwr3rSanp+t+S8WiLKTigRjsg+luIZBAobiS3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120

On Fri, Aug 08, 2025 at 08:51:08PM +0200, Marek Szyprowski wrote:
> First - basing the API on the phys_addr_t.
> 
> Page based API had the advantage that it was really hard to abuse it and 
> call for something that is not 'a normal RAM'. 

This is not true anymore. Today we have ZONE_DEVICE as a struct page
type with a whole bunch of non-dram sub-types:

enum memory_type {
	/* 0 is reserved to catch uninitialized type fields */
	MEMORY_DEVICE_PRIVATE = 1,
	MEMORY_DEVICE_COHERENT,
	MEMORY_DEVICE_FS_DAX,
	MEMORY_DEVICE_GENERIC,
	MEMORY_DEVICE_PCI_P2PDMA,
};

Few of which are kmappable/page_to_virtable() in a way that is useful
for the DMA API.

DMA API sort of ignores all of this and relies on the caller to not
pass in an incorrect struct page. eg we rely on things like the block
stack to do the right stuff when a MEMORY_DEVICE_PCI_P2PDMA is present
in a bio_vec.

Which is not really fundamentally different from just using
phys_addr_t in the first place.

Sure, this was a stronger argument when this stuff was originally
written, before ZONE_DEVICE was invented.

> I initially though that phys_addr_t based API will somehow simplify
> arch specific implementation, as some of them indeed rely on
> phys_addr_t internally, but I missed other things pointed by
> Robin. Do we have here any alternative?

I think it is less of a code simplification, more as a reduction in
conceptual load. When we can say directly there is no struct page type
anyhwere in the DMA API layers then we only have to reason about
kmap/phys_to_virt compatibly.

This is also a weaker overall requirement than needing an actual
struct page which allows optimizing other parts of the kernel. Like we
aren't forced to create MEMORY_DEVICE_PCI_P2PDMA stuct pages just to
use the dma api.

Again, any place in the kernel we can get rid of struct page the
smoother the road will be for the MM side struct page restructuring.

For example one of the bigger eventual goes here is to make a bio_vec
store phys_addr_t, not struct page pointers.

DMA API is not alone here, we have been de-struct-paging the kernel
for a long time now:

netdev: https://lore.kernel.org/linux-mm/20250609043225.77229-1-byungchul@sk.com/
slab: https://lore.kernel.org/linux-mm/20211201181510.18784-1-vbabka@suse.cz/
iommmu: https://lore.kernel.org/all/0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com/
page tables: https://lore.kernel.org/linux-mm/20230731170332.69404-1-vishal.moola@gmail.com/
zswap: https://lore.kernel.org/all/20241216150450.1228021-1-42.hyeyoo@gmail.com/

With a long term goal that struct page only exists for legacy code,
and is maybe entirely compiled out of modern server kernels.

> Second - making dma_map_phys() a single API to handle all cases.
> 
> Do we really need such single function to handle all cases? 

If we accept the direction to remove struct page then it makes little
sense to have a dma_map_ram(phys_addr) and dma_map_resource(phys_addr)
and force key callers (like block) to have more ifs - especially if
the conditional could become "free" inside the dma API (see below).

Plus if we keep the callchain split then adding a
"dma_link_resource"/etc are now needed as well.

> DMA_ATTR_MMIO for every typical DMA user? I know that branching is 
> cheap, but this will probably increase code size for most of the typical 
> users for no reason.

Well, having two call chains will increase the code size much more,
and 'resource' can't be compiled out. Arguably this unification should
reduce the .text size since many of the resource only functions go
away.

There are some branches, and I think the push toward re-using
DMA_ATTR_SKIP_CPU_SYNC was directly to try to reduce that branch
cost.

However, I think we should be looking for a design here that is "free"
on the fast no-swiotlb and non-cache-flush path. I think this can be
achieved by checking ATTR_MMIO only after seeing swiotlb is needed
(like today's is p2p check). And we can probably freely fold it into
the existing sync check:

	if ((attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)) == 0)

I saw Leon hasn't done these micro optimizations, but it seems like it
could work out.

Regards,
Jason

