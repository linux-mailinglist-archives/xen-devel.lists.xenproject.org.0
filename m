Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB8kNv1gcmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:40:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE46B83E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211703.1523209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyf8-0008RY-7Q; Thu, 22 Jan 2026 17:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211703.1523209; Thu, 22 Jan 2026 17:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyf8-0008Mq-3H; Thu, 22 Jan 2026 17:40:06 +0000
Received: by outflank-mailman (input) for mailman id 1211703;
 Thu, 22 Jan 2026 17:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viyf6-0007E8-KJ
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:40:04 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617fd2c6-f7b9-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:40:02 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 17:39:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:39:59 +0000
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
X-Inumbo-ID: 617fd2c6-f7b9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeWFhc52meRoRg1D2aLqUKqFwBeaEZXwnnwSy6Qvf4KrMuG6p51HP/svT/t7Z8M60+06A6fYrsVoCJ21elhu3ZFsh3MHbY5fKvIIxkgIanOsf9YU0fA2reDaUKW4/sa02QQ5DViMoN/8kh71HcvGEKiEYhhgxEJzwkx3fiDhzrw7uotbAcMh1KtC/JiGsYhbcce6Yf9ezbLg8uL6ZAMLx5Clb3Fig76szhj+Vap3XOfCY3wTwSDpTM5NvFvLBphTdqKMMiW51JkldLxGJ0KlMnYDp7ETfSRZX1dgyGpZ3MKJva5XZpHyVZHLJna5BYwsPMfUSw5+T00Ovb/N76/8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhAxvSGLCPIxM89fs0EWPD/KIqiQa92YQBwQ5kHiAk8=;
 b=M3xsnY+9tZMWMxHcs7tbKfPP3TUgpcmaEfIaJhda8gInXVDIXywM5rArTLAiSLkb2VrmbEN7BDFeusEtAORlhxbz8ry4vcHaFP9KlJPQKjEXFgkl+VetDQJF/YJ165i32kvhWKgU0+jyvKmjHDfURFhLAeUkPzwvf7E5fiFVjWQ6JHHTYSUtxd63XAQozIpfGRk3lJXwW9iLgpzmPr2X6pxrjfUpHmCJ6KTBJAiwDZwVIntExZXYy1QSTSuHJsyyG2HlL1EqypTOm7yvPefWkhNYLrS0Dtf90EczQdYNRQzi/8XfwH1p1j2QuPzBAmiJOOZps1pDLSJLGt3n46lfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhAxvSGLCPIxM89fs0EWPD/KIqiQa92YQBwQ5kHiAk8=;
 b=H9oNFhcldJXRkZc6cmV8DDthiAnKSjd/r3wmwh/QUF+qicqrSa8q7Gqmif7pQDuMnapzzqfShubyiDBpxshookcbYTbV7MQJLtFrwW2P0m8cDddFvFkg2Ko+AtBKBhrVbNiBy4jaYM2Wnd+w7cqzGVnKW8kdcTMPGN3XG1d5cvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/3] xen/mm: allow deferred scrub of physmap populate allocated pages
Date: Thu, 22 Jan 2026 18:38:56 +0100
Message-ID: <20260122173857.83860-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122173857.83860-1-roger.pau@citrix.com>
References: <20260122173857.83860-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0006.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 7217666c-9021-41ac-255a-08de59dd4377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzJKZ0FySjQxMG5hVjhRd0JkMVpBNTRjbmRObWs4d1RaL3FKU1BVem9pY3E0?=
 =?utf-8?B?MzA4RmNtVnczM0xMUkFwWXJzWThZbS92cFQxMVRVVTl6cWdiaXUya0V1S0FC?=
 =?utf-8?B?OVQ5NDV3SW90c2RPUlJ0NWp3aWorZDBqeXZSSSs5UU83bXF6MWE1SWpNL1gz?=
 =?utf-8?B?UkFsQU1SZXVCNENUcTB4QWFoZVBjVDFVZGwxY1A5cGdrOUROYlJZckFWN0xh?=
 =?utf-8?B?czlzbEVqS0J6MDNuTjdIMDBsSWw3ZlpwQ1A2cmw1b05LcmtMbTcxWVRZMjNs?=
 =?utf-8?B?Tm5zeXFoM2tEd3RaeFVrMDRNVVR3SVJpaFBINExJNVllTW9vR0s2dzI1cXJu?=
 =?utf-8?B?UjhIaGhOOGp0ZG02amEzQ2pVeUtyWnZGcEpZMjRTQ0FNK3BlWllnYStnS0w0?=
 =?utf-8?B?K3l6d2IyY1RqMlMyTTlQSUtVVnNMaUpsQVNvU3U0UW9Qbko0WjJ5d09reUZG?=
 =?utf-8?B?S1ZqS2YrMWtDazd6WDRMdUU5L1hIT2tMLzBSZHRSM0pTSkg3WFVWeUJ5WVQw?=
 =?utf-8?B?TUl2SnJ5ajhHdVdWbGVQWjBwWTJlcWc1SHJNZU4zZE54amdTcEFjSHpScGJk?=
 =?utf-8?B?QW5xSW5ZRmdlNkNYZWxuYkV6dFR6amszcVZpb0ZJOEp5ajlkNzNGTkxTMmVl?=
 =?utf-8?B?clJ4NG9seUg1SVUyRzQzcEpnU1U3aUFaSmVTdlltT212a3pUdjd0dEk1em5h?=
 =?utf-8?B?KzlIZFJaK1dhUjV2cUtmS2dqSUtXeTVTVDdGRzJDMVlCaTBwdENaZ1VpN2Jl?=
 =?utf-8?B?QzFldVRrUnd5aUFYNmFTWFBrR01SenJmby9jUzFyMjVtZFZwQitZMHJYeTY3?=
 =?utf-8?B?WkxYeDhaWm1lTjJZUFBvTDBJUHFLOEFmalNWVExPUkJ6MXRCUm91Q3V0YWM1?=
 =?utf-8?B?djV1NjJhZ0hBbUdSbmJDbzY2YlFIbDY3anV3am1kNWE5cjYrYkd1T2hjdWw4?=
 =?utf-8?B?S0VaSjdLSTI1MHl0c3lyRFRQWUo0NHUxV0ZWOGpUOXovK1hhUEFQVVdrdUFB?=
 =?utf-8?B?eEMvcjAvREt1YUY0S3RhU3FOV3lDcUI5c002Q2NoaE15OUc3b3Nxc3NxRWJv?=
 =?utf-8?B?Y0EzWDRBa1lsM25VSFJXcXJmTFRXSVFsbklaVWVOekhnT2JXNFpOMGYyY3NI?=
 =?utf-8?B?UW5QK0dZUW1aa2VNNmhsTlBNN1I4TS91SmlFY1NrNy9mL21TdXJ5azk5STI4?=
 =?utf-8?B?QjBGcEFmVTBKM1J6Ym1jZFg2UHBQajVsU3JFQTZaU1lkVnlGbXNiSkZoak9s?=
 =?utf-8?B?dVRYenNRa2l3WkdFVWtkcVNEU1NvdlpqL0lBVHM3L2R4RUNnaDdKVUNQNURW?=
 =?utf-8?B?a1lPM3VoL2M2d21LaUJPa3B5NlJlbjJsb1JUUDhtZWpMUlZHMXJYeGNtYmQw?=
 =?utf-8?B?OXQ5V2p6Y1RKdXJ6Z2RUdTBoYS9aY3pHdWU3dU5kbkhhS3d4MDVvMjdnZyti?=
 =?utf-8?B?NENSaVFaT2lJeVFMdUFqRGNLeWdmWXI1ZjYwY0dxOENUZjNrekJJMHJwMlF6?=
 =?utf-8?B?UTBNNXpuMlF6VUcvV2xpMlZyem92aUFkVWI1VzJkNjNnTThiSFA4dG4wM1Uv?=
 =?utf-8?B?aVpta01BeDY4MHNUUUFnTkNSOU82UWliMVNvcE5kSTB1Lzd3V01YN2p4bktW?=
 =?utf-8?B?SVMwa3dwSVJtUm8yWW0wVE95dTNpOEVNekZlcVA2QlJBLytYNUJmMllOc3Jk?=
 =?utf-8?B?dTRnaXV3UEVLeloxelhhYi9rekdOdEt1N2xneG9YSllLczllamhDUEJtRlVK?=
 =?utf-8?B?Q3VFMlVRM3VsakFPOWY0bmd0aWttVlh3ZERMcTliYlA1NWpvQlk1dWh3Y1gv?=
 =?utf-8?B?M2x3dnM2ZWNHOFZLRnhOQ3BoUnJndCtaWExtMDFpRzdRMzFaY01oWWQyZmNv?=
 =?utf-8?B?V3NzS0V1cUEvYjM0RGlwV2RjUlRRRkRPVWs5MFlzMTVCdlBmODNKTll6d1Zw?=
 =?utf-8?B?ajB3a1lZa2JhZXFNcU9sNlNHQzVSVm1CVVRJV3BtWFp6aE9xVXF3WklpdWll?=
 =?utf-8?B?ck90Ri9HNE55RzV5MWM3WEFQQ1BjNnFacHhQR2JQNXdHTUVoQmJIYVAra01P?=
 =?utf-8?B?eXpFQy9uUzRlR3I5WnZmMmRTeXNaeEZqdS9WSThjdXVZbEY1bFNFcjljVmw2?=
 =?utf-8?Q?5GXc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlkrSElGUzBDMlBMZnJrb3VvcEpFcDZ0R0tDbHdrbFVleXFvNHdIV0V0UUZQ?=
 =?utf-8?B?Z1AwbXcxanZtTnM5QVFmVDJwS201c3BUSHo5aE5yN3Zud1FNeG1JbVdTbmhW?=
 =?utf-8?B?Vlp4Tmg4M3E4dnh0WUVBanI5Z0hDZFh4WjNkVTc4SUtZS0FpMU5sdHJnY1Zl?=
 =?utf-8?B?RUdjYWlVRFlPVTNHYlk2aXYxekFBQVIvaGkwVDhPeERFU0h4UVFvZG42b3VO?=
 =?utf-8?B?YTY4SU14eHN3ZkFRS0hHNmVhVUlCdVh6RkVHdUQ4dHB1QWo2bVAxMVptazFT?=
 =?utf-8?B?elVOcVNJUWZaRFc5SWRnb0xIU00vUVpZbVdQR01xdU1XcURJYWVJc20rK2dI?=
 =?utf-8?B?bDJ0RDVVVHpWQk11OEFhdGNXekp0QUo1OEtDTzFOMGJuWFdZeDduQld4cGdw?=
 =?utf-8?B?bzUyNlpBSWZlcFY0VzFIRlRiRlpqNjF1NVpVNEhzd1hBSXVkU1BBUkRVWHVn?=
 =?utf-8?B?ZktjZHRoUG8rU0VXSUN5QjJleFRkd241QWQ1Vm4rc0FoSWlJbXFZT0tZMjhM?=
 =?utf-8?B?YVM5TUFodDFORDN2WFJQeGtxVDBkbnZsbWZyOHVzOTlMWUh1cFNrOG9YazRI?=
 =?utf-8?B?L0JVc29sY1pTMzZsWFNHeWNZMGhXMG1JN0lmY3BGOVlwdDZHNTdWK3h0L2ZI?=
 =?utf-8?B?L3FqT3I4OUxKeWJoVzRXdFVLQzFmc040L3ppUjZ3Znp0Mi90R1FHUXNNUEo4?=
 =?utf-8?B?cHVsUDVTbEJ3d3I2eE4vQlhYWkdFMnlRMFRHMVpiRFJaK05mZHJSbzd3bGsy?=
 =?utf-8?B?RDNlelkxa2VHbHJwWHJJM1FPdzUra3hhT01IOFZtVWdxZWc4NUExU2ZTdHY1?=
 =?utf-8?B?bGJkYzRyeWlCQW9ZMmIySWR1TjlLd3VLSXZQNFhQd25jSmxyc1Rsd0FlNUJm?=
 =?utf-8?B?MFFyYndDMGhkMUZTZ202Yzl3MUhjSnhNdGQwNVZOSkFPZU1hLzlneDlVYUhT?=
 =?utf-8?B?UnhJYjFxMVF3b1dzWWc1SUIrZHRyd3NuZGhEVW5tQTFma1NXS1oyNnhMQk9n?=
 =?utf-8?B?L3NQUkhHZGFBM0NWUXJIZmFzcHIzTU93OU5UZm9RS1NRb0RaSlVoaXI4eUZr?=
 =?utf-8?B?aXVucXEwKzBvTUpCUTJZZXRORGU0RjlBb0VlcHVIbFo5Z3hzTVJrOUpRSm9G?=
 =?utf-8?B?d0dGaElscGIrbGoyajdjL2VwV2g4Y0ZqWHZaSTcyS2NzZmZEdnVZVk1GODBU?=
 =?utf-8?B?akUyUVR4ZE1IRnh6d2JveGdadWtYQUViN1JOcTZZL21tNE9sWXkzeWc3bFJC?=
 =?utf-8?B?bDl6QW1FNGNYZEtSeGIyMTFYZThBVWN1U3VTdi96SVBEaytCTHJ6Tmd1ZlJR?=
 =?utf-8?B?QUg3UEdaR09Wd3ZRYzMvUFpTbHJNblFJa084aGdXdkFCWFlLR2x4NjJwcW1K?=
 =?utf-8?B?MkVVVHg4Umdqc2g5cFV4aFhpQzNsZFdLZ3FhMVdmWlNDYmRHQmM4dFV6NnFu?=
 =?utf-8?B?dTdxTjJZeS95NGlBRzEwNTFBZmhCYUYwMndXbzZNTjZwMjhTazNoSVFGZ1hJ?=
 =?utf-8?B?U0JqV0VTQ0R0UFg3WDZsUmh5a3ZpK2hKMDcvL1VPVGVOckk0MHhyZHVFclBy?=
 =?utf-8?B?QXdaL1J0M2Z0Rm9aRmhHK0pRTmVCemY1RXlSYzVHTUtUZm1GenRNR0RkWDdt?=
 =?utf-8?B?OVF4RVNKdW84eEo2bk1PdGpGcHZjRkNnVExIaHVaWmtTQnE5aVduU3RhaDZk?=
 =?utf-8?B?VFI3T1E2emF3T0M3ZWJuV09YMEdYeXB3S1ZLNm14UzJTd1FYdXNhdzlVaDZV?=
 =?utf-8?B?LzBHVTRJNE5FY1hMWXkrL3YwUnR3NTdiRU1kdVREWkgydXpvQ2dYbGoxNUU4?=
 =?utf-8?B?NW0ycHJnYnlia3Q2QVRVZnpDcmQyMnBLTzB3WXRlK3FmcWFFTnpFSDZLdXNw?=
 =?utf-8?B?bzJyTHhkOGVMdHVlNFFxVnM5ZGRHT204ajRpclErczljNDd1U3NCQkZRbktV?=
 =?utf-8?B?SXVUU2k2VFIvOFJzQys0K2RNUDc5VDBnMU14T0hrbmVhNVF0NmFsTzFLMFZN?=
 =?utf-8?B?R1NpTE0zOFNrQnNxcUNRazQ0aFExM0dJenJiYlo0UGhSMDlsY1NHcTc4U1Vp?=
 =?utf-8?B?VmlWejNudGZmSk5XSDkvTFQyejBEVXNWVkhNT1dobDlGWmJKTXN6YW5JYWk2?=
 =?utf-8?B?MURWeTQ0S3RzVG81Rjl4ejdmMzdtS1pZZFZZajAyRkV4ZVpMRlNXZEQrRm5q?=
 =?utf-8?B?dGE2NUxQNlRUSUFqaWZBS1RmQVF5MjVkZmdHZW5MZ05zVTNNWXRweHdvbW9a?=
 =?utf-8?B?M1R1K1diL3IreExRT2pYSGUvUnlDRHM3VzlBRUoxL1pQMTI2cWhqQmYycHhB?=
 =?utf-8?B?aGtEVStTZmdZQWFSbDZOU1hLZWF5R0lWamE3MURwMUo0bWF4OE9zUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7217666c-9021-41ac-255a-08de59dd4377
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:39:58.9850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCrb7GgsG+1l3M3g+4jMEHgwGobH21h7H4rJY5/LNpprwj40d504pIEp0YGoj6Vp+uKD+e0sEsShvas9tYl/vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6512
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.951];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5ACE46B83E
X-Rspamd-Action: no action

Physmap population has the need to use pages as big as possible to reduce
p2m shattering.  However that triggers issues when big enough pages are not
yet scrubbed, and so scrubbing must be done at allocation time.  On some
scenarios with added contention the watchdog can trigger:

Watchdog timer detects that CPU55 is stuck!
----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
CPU:    55
RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
[...]
Xen call trace:
   [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
   [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
   [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
   [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
   [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
   [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970

Introduce a mechanism to preempt page scrubbing in populate_physmap().  It
relies on stashing the dirty page in the domain struct temporarily to
preempt to guest context, so the scrubbing can resume when the domain
re-enters the hypercall.  The added deferral mechanism will only be used for
domain construction, and is designed to be used with a single threaded
domain builder.  If the toolstack makes concurrent calls to
XENMEM_populate_physmap for the same target domain it will trash stashed
pages, resulting in slow domain physmap population.

Note a similar issue is present in increase reservation.  However that
hypercall is likely to only be used once the domain is already running and
the known implementations use 4K pages. It will be deal with in a separate
patch using a different approach, that will also take care of the
allocation in populate_physmap() once the domain is running.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Introduce FREE_DOMHEAP_PAGE{,S}().
 - Remove j local counter.
 - Free page pending scrub in domain_kill() also.
 - Remove BUG_ON().
 - Reorder get_stashed_allocation() flow.
 - s/dirty/unscrubbed/ in a printk message.

Changes since v1:
 - New in this version, different approach than v1.
---
 xen/common/domain.c     | 28 ++++++++++++
 xen/common/memory.c     | 97 ++++++++++++++++++++++++++++++++++++++++-
 xen/common/page_alloc.c |  2 +-
 xen/include/xen/mm.h    | 10 +++++
 xen/include/xen/sched.h |  5 +++
 5 files changed, 140 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 376351b528c9..bc739571fdd5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -722,6 +722,13 @@ static void _domain_destroy(struct domain *d)
 
     XVFREE(d->console);
 
+    if ( d->pending_scrub )
+    {
+        FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
+        d->pending_scrub_order = 0;
+        d->pending_scrub_index = 0;
+    }
+
     argo_destroy(d);
 
     rangeset_domain_destroy(d);
@@ -1286,6 +1293,19 @@ int domain_kill(struct domain *d)
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
+        /*
+         * Attempt to free any pages pending scrub early.  Toolstack can still
+         * trigger populate_physmap() operations at this point, and hence a
+         * final cleanup must be done in _domain_destroy().
+         */
+        rspin_lock(&d->page_alloc_lock);
+        if ( d->pending_scrub )
+        {
+            FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
+            d->pending_scrub_order = 0;
+            d->pending_scrub_index = 0;
+        }
+        rspin_unlock(&d->page_alloc_lock);
         domain_set_outstanding_pages(d, 0);
         /* fallthrough */
     case DOMDYING_dying:
@@ -1678,6 +1698,14 @@ int domain_unpause_by_systemcontroller(struct domain *d)
      */
     if ( new == 0 && !d->creation_finished )
     {
+        if ( d->pending_scrub )
+        {
+            printk(XENLOG_ERR
+                   "%pd: cannot be started with pending unscrubbed pages, destroying\n",
+                   d);
+            domain_crash(d);
+            return -EBUSY;
+        }
         d->creation_finished = true;
         arch_domain_creation_finished(d);
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 10becf7c1f4c..db20da1bcaaa 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -159,6 +159,66 @@ static void increase_reservation(struct memop_args *a)
     a->nr_done = i;
 }
 
+/*
+ * Temporary storage for a domain assigned page that's not been fully scrubbed.
+ * Stored pages must be domheap ones.
+ *
+ * The stashed page can be freed at any time by Xen, the caller must pass the
+ * order and NUMA node requirement to the fetch function to ensure the
+ * currently stashed page matches it's requirements.
+ */
+static void stash_allocation(struct domain *d, struct page_info *page,
+                             unsigned int order, unsigned int scrub_index)
+{
+    rspin_lock(&d->page_alloc_lock);
+
+    /*
+     * Drop any stashed allocation to accommodated the current one.  This
+     * interface is designed to be used for single-threaded domain creation.
+     */
+    if ( d->pending_scrub )
+        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
+
+    d->pending_scrub_index = scrub_index;
+    d->pending_scrub_order = order;
+    d->pending_scrub = page;
+
+    rspin_unlock(&d->page_alloc_lock);
+}
+
+static struct page_info *get_stashed_allocation(struct domain *d,
+                                                unsigned int order,
+                                                nodeid_t node,
+                                                unsigned int *scrub_index)
+{
+    struct page_info *page = NULL;
+
+    rspin_lock(&d->page_alloc_lock);
+
+    /*
+     * If there's a pending page to scrub check if it satisfies the current
+     * request.  If it doesn't keep it stashed and return NULL.
+     */
+    if ( d->pending_scrub && d->pending_scrub_order == order &&
+         (node == NUMA_NO_NODE || node == page_to_nid(d->pending_scrub)) )
+    {
+        page = d->pending_scrub;
+        *scrub_index = d->pending_scrub_index;
+
+        /*
+         * The caller now owns the page, clear stashed information.  Prevent
+         * concurrent usages of get_stashed_allocation() from returning the same
+         * page to different contexts.
+         */
+        d->pending_scrub_index = 0;
+        d->pending_scrub_order = 0;
+        d->pending_scrub = NULL;
+    }
+
+    rspin_unlock(&d->page_alloc_lock);
+    return page;
+}
+
 static void populate_physmap(struct memop_args *a)
 {
     struct page_info *page;
@@ -275,7 +335,18 @@ static void populate_physmap(struct memop_args *a)
             }
             else
             {
-                page = alloc_domheap_pages(d, a->extent_order, a->memflags);
+                unsigned int scrub_start = 0;
+                nodeid_t node =
+                    (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
+                                                    : NUMA_NO_NODE;
+
+                page = get_stashed_allocation(d, a->extent_order, node,
+                                              &scrub_start);
+
+                if ( !page )
+                    page = alloc_domheap_pages(d, a->extent_order,
+                        a->memflags | (d->creation_finished ? 0
+                                                            : MEMF_no_scrub));
 
                 if ( unlikely(!page) )
                 {
@@ -286,6 +357,30 @@ static void populate_physmap(struct memop_args *a)
                     goto out;
                 }
 
+                if ( !d->creation_finished )
+                {
+                    unsigned int dirty_cnt = 0;
+
+                    /* Check if there's anything to scrub. */
+                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
+                    {
+                        if ( !test_and_clear_bit(_PGC_need_scrub,
+                                                 &page[j].count_info) )
+                            continue;
+
+                        scrub_one_page(&page[j], true);
+
+                        if ( (j + 1) != (1U << a->extent_order) &&
+                             !(++dirty_cnt & 0xff) &&
+                             hypercall_preempt_check() )
+                        {
+                            a->preempted = 1;
+                            stash_allocation(d, page, a->extent_order, ++j);
+                            goto out;
+                        }
+                    }
+                }
+
                 if ( unlikely(a->memflags & MEMF_no_tlbflush) )
                 {
                     for ( j = 0; j < (1U << a->extent_order); j++ )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index de1480316f05..c9e82fd7ab62 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -792,7 +792,7 @@ static void page_list_add_scrub(struct page_info *pg, unsigned int node,
 # define scrub_page_cold clear_page_cold
 #endif
 
-static void scrub_one_page(const struct page_info *pg, bool cold)
+void scrub_one_page(const struct page_info *pg, bool cold)
 {
     void *ptr;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 426362adb2f4..d80bfba6d393 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -145,6 +145,16 @@ unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
 
+/* Free an allocation, and zero the pointer to it. */
+#define FREE_DOMHEAP_PAGES(p, o) do { \
+    void *_ptr_ = (p);                \
+    (p) = NULL;                       \
+    free_domheap_pages(_ptr_, o);     \
+} while ( false )
+#define FREE_DOMHEAP_PAGE(p) FREE_DOMHEAP_PAGES(p, 0)
+
+void scrub_one_page(const struct page_info *pg, bool cold);
+
 int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
 int query_page_offline(mfn_t mfn, uint32_t *status);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 91d6a49daf16..735d5b76b411 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -661,6 +661,11 @@ struct domain
 
     /* Pointer to console settings; NULL for system domains. */
     struct domain_console *console;
+
+    /* Pointer to allocated domheap page that possibly needs scrubbing. */
+    struct page_info *pending_scrub;
+    unsigned int pending_scrub_order;
+    unsigned int pending_scrub_index;
 } __aligned(PAGE_SIZE);
 
 static inline struct page_list_head *page_to_list(
-- 
2.51.0


