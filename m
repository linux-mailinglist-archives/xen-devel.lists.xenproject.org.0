Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D758FA5904E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906348.1313784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZoF-0007QS-Az; Mon, 10 Mar 2025 09:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906348.1313784; Mon, 10 Mar 2025 09:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZoF-0007O8-7g; Mon, 10 Mar 2025 09:52:31 +0000
Received: by outflank-mailman (input) for mailman id 906348;
 Mon, 10 Mar 2025 09:52:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMAf=V5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1trZoC-0007Nh-Rq
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:52:29 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2009::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 592e8cb2-fd95-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 10:52:17 +0100 (CET)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Mon, 10 Mar 2025 09:52:13 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%6]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 09:52:13 +0000
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
X-Inumbo-ID: 592e8cb2-fd95-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2m99uWrOqWoHOsmjnG3aBCwDK8tkrQDNZzgI7we62dIG09TJaGkGnuOzPuGWWBjt9NC/RKShXHceb4j6OL7k3M755oR6pX89r5PSYWPsFq2jmkhrd+SYVcN6WCdjcSYg0lZm/udYrYAG1GcFXQQ0TsJ8oEtz1LQo+vn+KEtn2WvjIDGiJ8PKfn5qdTG4V5LNB5nZAk0beYZsD5KKhpoC2r3ywEFMlPB9U9yiATJn3MNyL5ueZANDuDV+YxPEzPb/Z37JcAg9mP1tyWi2WTmCH3XpBHMXmHM1KYxAT2a/azfmA+2kBcGvSGS8CkGNxzaEn//QnmxTzzF/qN7haTR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNgMswDVbwx8s+GmFezU1MKqguimdhZksWISKUejil4=;
 b=EfTRTEZ51UM+iz2wq5FzfocnONU+ZVp/zHVp4IlR6IzT01Daswq9fekSRRvWUczJAuv04zeSYolSEKIBShjJemW+s0vaQVVpgQC4rvLXl0cBDd1fs/8RbpW7vOjmGRbX+cUsQs7eJ0krs39uD1A1SEdbx7rSrmlHrUFPI9JSRoR4dV/soDYmsF+TLaoW5uM1AA+aGqSj6vKIYbTBSzD7qg2K1ouW9H0imz5WIxo7RSt9AFa8CNHy4x5RMMWUp9hUqHq1ZtfoYrUSQcdUaqN489ScwwesMZ3UgLcJhOiGA0ZMo16GG95dhYYnwhKQOH4fT9IXvQ4zvAveRZxGw2gYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNgMswDVbwx8s+GmFezU1MKqguimdhZksWISKUejil4=;
 b=Mc0EsxkCPx7lQgfygJC3MlJPSWtox3xzPiGAkPJtuPQhr2n+LfqxKM9eBPtcqW0KD/NvvRW7wfbc/CUKrdqqD9W9mKSLuIVWmobJ+E4opKK0q/MaS4fARFvPS3XJNm3MhBwociWAsAQgNaBh3Ab4CyWMxRfy5aWjz69lRI+zADQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e91b4782-4fbb-4a60-bb6a-e5d054647489@amd.com>
Date: Mon, 10 Mar 2025 10:52:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-6-jason.andryuk@amd.com>
 <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org>
 <92eca43f-1dc8-4eec-a124-e715d118ab03@amd.com>
 <01df1e44-a2cb-4e93-8b9d-99aca914db68@xen.org>
 <09103c2b-a7c0-44d5-8eb5-2d0fcb01c26e@amd.com>
 <cdb05727-fd2f-4b83-9200-d88789ce908e@xen.org>
 <474C7972-2B67-4FD3-B4F7-39B352301A46@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <474C7972-2B67-4FD3-B4F7-39B352301A46@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To BL1PR12MB5272.namprd12.prod.outlook.com
 (2603:10b6:208:319::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SA1PR12MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1d9bc8-dfa4-4f29-87b9-08dd5fb93b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME9lYnNhczRwUktsK3dNcnE0cHdDckFPSkVyQzZSQWwzZDZTTTBvcnFORXF6?=
 =?utf-8?B?U2VldnFGS2JoNnAzZytMWFZRbkVlQ2tuS0t3em8xUDc4NFBRaE5qRzZYNFVN?=
 =?utf-8?B?VHkzMmh0ZVpJOHh5bk1yNjl1VGhXL3J1RXRoakd3SjVGbU5uWFBhOXA1ckdp?=
 =?utf-8?B?bU5sRkNmZWc0T2I4K1BnTjV1RUFDWG5NY3dWbnlPL3UxM1ljZlVkaTV1NSt6?=
 =?utf-8?B?RGw1VThnZEJWVVFYS24xM3lMbFdlQ0dCb1g5NU40enUrOTZZSFNGWWJoUXR1?=
 =?utf-8?B?ZXdZWFBvTUJWOC8xb3NoSE1hN1BGazU0dzlQdWVib2hjTGMwYUxLQS93Ri9u?=
 =?utf-8?B?czRNZDVBY3hCL3BIWThDdGIzZTBWa3NZbDU0TnN1VFdWcjIxMEV3aWlhcEdS?=
 =?utf-8?B?V3QyWGpFODlqM0NNM1p2MWNEay9TckMwNWtSM0RUU25LOEVnU3hSdkcvTEtH?=
 =?utf-8?B?aFR1SXJwbUdXSkxIL2dzVS9NdG16RVFXbDhNVWd1WEh6Z3hpMkF4enVyb0VZ?=
 =?utf-8?B?cG4zM1BKWER5bnZ4cE5rME1DaFRkUW8rTkVWeEtJaXBQajIxcVphcFdNTUoz?=
 =?utf-8?B?akc5UUUrQVh0ZjNiWWJwcWVFMEhqVXV5SXRqTnJndWZoMDducWQzc1lNSTNi?=
 =?utf-8?B?K1g2Rnh3RG16MU1sZ1czUkdYSnhiN0hwMGFGSFhSQWlaKzdkcmlMd0RZRjRo?=
 =?utf-8?B?c3NHK29HV0RrSjJRU09NVEs3bDZucEpVVEVLS3c0VmZBZzI5aThnRHBYYlI2?=
 =?utf-8?B?OUFwSEZUL1NvVXNCWExVNzk4QWFydzBHQzl5TENOM05oamp2QWtJVUJvb0JE?=
 =?utf-8?B?RGVrQStQdnhpZFJOWDJWUE9UQ2V6M2xlQndTOUd6N1NSWm1qQ1RZSWlXMVVz?=
 =?utf-8?B?SHBxL3ZZL3BVc2kySWxSaGJLMTdGc0d3ZktubnlWTmJ0TVhqeUNoMGNWdHVx?=
 =?utf-8?B?K3hVYnpINFBsUmYwZ0ZFTGVxOXdsMGhzQUhBOUtaeG1rdXd4cEcyR0Rydy9L?=
 =?utf-8?B?WENnNjJlbm5OSDdLeVpVanR5V0VaZFpRazRrS0creS9zMFJFNTJTSlIySTN4?=
 =?utf-8?B?STRaL1d2ckYrNVVsUG9LRnNGQ3VxNXR1ZkVJTHRkSGpGbXJoeEZiNjRTRnND?=
 =?utf-8?B?dnYvbGdZWHNUV0FnaDk3SHRyL0lkS1gxMHFvMHptTFMzUVJpa2VCOHFXVW81?=
 =?utf-8?B?OStQL2hES0JKSmdlei9Nb3A2UDNBUSszNVJWcEY0WHpIQXJlVDR4S0lyaEJm?=
 =?utf-8?B?ajBlZTQvTDhlU0JzZHNSckhKQWdKc1gwZzNLN0ZsZENkSkdkZ0ZRT1U2K1ZE?=
 =?utf-8?B?c1NQUkxsakVwTWhQdno5VmxIbmx1OXRYdk13M3BOZERpd2RlT0Y2L0FLQXZj?=
 =?utf-8?B?SDVlSGl2VkllL0pGUGJqenk0NmVjQy9KZENDSytrMkVyK2J2NDFtUDhCM3Fk?=
 =?utf-8?B?Tm5vY3V5dmdDVis5c0RSZmNra0tGa010cUFRVUYzc3dTTjg1eHdMYlp6bk96?=
 =?utf-8?B?eC9Gc0gvZXJURlJkUEQ4WnVOaTNpdSt4RnpYTjFYalp3RjVBRFFCZ0lHZ2dq?=
 =?utf-8?B?REozWXdvNDNkVDVtc1JENjhJbG9EWUZNbHkxcUJQek1Ga3VQQXk5NXpRbGNV?=
 =?utf-8?B?MDl1Szk2VllIcEdlWU5yckdBRldyVGlsR0xKbjRacmxpNWQ2amVVWHppOG1H?=
 =?utf-8?B?Q2tJVnhyckJ4YURrUS82bE45RFdGaldTZkJ6MmtWVDJhOVgzbG5QVzlPMXVC?=
 =?utf-8?B?VndLWU15Nk5Ca1RlK0ZxNGZZU012WTJ0TC9UT2FsQm1UME5pRE1uUTR4QUcv?=
 =?utf-8?B?OHdYSStvWDVYOVY4NHBROE5xV3JjakhtbEV4MHN6L09rRHZPazFaMGVLUEJh?=
 =?utf-8?Q?/czdqdQm+r+oy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnNIMkdlNHNwZnBwL0pSdjFGOThjRnMyNWFjTU4wQjExZDF2LzRvY3FncXdS?=
 =?utf-8?B?c2hpT3BXN2VmM1Z1M1NYRGtDemlSY09UMXhkc3JXNmxGRWczVE00ZHFmOUU0?=
 =?utf-8?B?Ym4zSHlGZXBpWm1RUEtVSTZlVWl0b1hiOU54RTZQV21RSDhuNXhORVRNdnRv?=
 =?utf-8?B?VkRkS2dSNk8zRmV4bE1FdFFCenRaQzNpU1hQQ2JBQ29xcjdZZ1AwNUNGd1hW?=
 =?utf-8?B?TGFEWVdPd2czbGVGRDNEL0liNmxDekFiMUpJQjNxUnlyaktVUmphUVZPUm5L?=
 =?utf-8?B?T2VTaGpVb1Q1RzlNNWtRVzVkQTBlMm1LZTdUT25ZbDd2eWIvd2NMM2grMWdM?=
 =?utf-8?B?SDlzUTZmWnY1WDBpU043eGUvd2lFWWZsOFplSW9uenhBYm5hdjlKRG1TMWJw?=
 =?utf-8?B?VittckxnMFZlWjVTM3FEN0tUUDNXQVdyK2FvU2VRRWsyM1hqcTR5bVZFdVNr?=
 =?utf-8?B?Ulk2SGc2dXVXeVFhZEN0ZkIwZE9tTk5CaFJjVlo5OHR6Z0NZY1hnTCtkcEhp?=
 =?utf-8?B?K3ZXMDZqNk0xS3BDd3hsbzNnZzNaSVNIK1JBRkd6OW8yQ3BGNmRESFBSWTNq?=
 =?utf-8?B?eWRLZndZamVGRTJqVjUxVURid24rSHBtTFhpcjFySm5uODJocm5oN3A0SytC?=
 =?utf-8?B?cDYzR3VaVDhqN2FCQTlEQmJLL1NwdFY3Z1ozZDBqSFVlTlhMUVhGQWtkaGRi?=
 =?utf-8?B?WlB2L0dpQ1pmQXlYQUZXOFBCenExTFIrKzJlRGd4SEY0YjNUOHRyVmRUL3NC?=
 =?utf-8?B?VG5ETS9jYkVnRzRjM3Y0ZkdrdEIxUUx5THVRMVQ0Z2NmM3B2Y2NVSHlqZks5?=
 =?utf-8?B?b0VtWkgrdENGMVQzd0FGRkVIb05IeGp0eGFONkNFMGJlUUU4VDlEak5ZUW95?=
 =?utf-8?B?T1U2NitzZ1gzZS80WnpQa2dpTWMrYkJzN0JPdjA0RDNqZDJzSlVaSFI2d0hn?=
 =?utf-8?B?N0JiN1YvemVkUHR1NWw2eFpzakFvVUNaSUNLUU9ucWVtM0laTDZBck0xSXJy?=
 =?utf-8?B?YWNZdFVvRzMzZHMrb2ttRlNRd0dxd3UyS2NFclF2M2xKQWN0UE1ESHFNZmRQ?=
 =?utf-8?B?RUI1RVNqenNrZE1pdHpxMDBaamV4Q0lyaEpENWcwZmt1VjNNN1hGQWsxSWox?=
 =?utf-8?B?NGNBZXJJMnpLeXc5TGR1MzMvR1h3SVJUREF3WFhwWVoyUnRSaW1wWFFkTUdE?=
 =?utf-8?B?QVlKUTVicGljRjFkRnRGZVc5WmNTVDg3aXc1a2o2ZFg3b09PdWRQWmoveW5w?=
 =?utf-8?B?czBhU1JyQ3dYSmlXQWJGMzlXN3VKeFBDc2sxZC9iMnNQdlpvU3UzVUQzSkZU?=
 =?utf-8?B?bk9oNWs0aFNqNkQrblRHd3ZkUXh5ZGRkakFHYlZGMXhiVUNucklINHdvYUlM?=
 =?utf-8?B?YndLUjYwUnZGOG9KVUZ1V2d2OHUvazFiY09xcTNKeUdUTVdHeGFPQ29odklN?=
 =?utf-8?B?T3ZBOXZsa1NjU0EyeEtHendZeFFaYjZuZmpIejN1c3lpb01LK1kyVDErSnRi?=
 =?utf-8?B?Nk8rWDUxcytGV2JTTkM5SlpPT0tMdjN1S3NzbnhzdWFPM1QxZFJna0U5QVVk?=
 =?utf-8?B?c2llcndYOUM3enVkblR1TEJ1UU41SW84NjVvWElTUUk1UVFVUVY3MTRTRE5M?=
 =?utf-8?B?dzJ4UnM5bkU1aEZ0WVJnOTZUZHd2SmdtaUtrNUE0NkZJOFl4UDVIMHZmY0Yz?=
 =?utf-8?B?TGF0WUVwMkt0MXlBdnBSMzNYL25wK0xiTUpqMlIwS01CNktteDlQeW5iQ1pX?=
 =?utf-8?B?YmJBZ1lhdGRoaHJZa3prS04vVDNrT2kwMFNDTC9SeW9nSEJKcEw0ZTExSndz?=
 =?utf-8?B?NVhWTFRwWVJQOHZDZ0gwT3dTL0s0OWJaSmxiR2hJZWs1Mkk3UUtxWlFidzlj?=
 =?utf-8?B?NVFhTWtZRVR4V0IzQnFORWJrbTQxUTRQcEZCbklxSFIyYVZSWE5KTmQ3V2tH?=
 =?utf-8?B?c2F2VXR5WDhRRzBwTUZIcFBQYWExeDg0VGxITGx6V1ViMU5POG5HbU55N2ly?=
 =?utf-8?B?eWUwdzRUbnZpdnN0NURKUmJmU1Z3MnhaN0NJMlpsZHRJSE5uYUdEZlZCSWJv?=
 =?utf-8?B?WUxGU0pGMWJ6ZWRNRmtiTGtVUVV2WkxkbElJK2NmUnBhY1VhcU1kR3JlWHBT?=
 =?utf-8?Q?otEM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1d9bc8-dfa4-4f29-87b9-08dd5fb93b43
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 09:52:13.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wU9RhYOtiXT7llz0w0/+cXCiyRHIZxXDShEtqa/aSelkgXX3NJekBdbmKSxsADFR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669



On 10/03/2025 09:01, Bertrand Marquis wrote:
> 
> 
> Hi,
> 
>> On 8 Mar 2025, at 13:37, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jason,
>>
>> On 08/03/2025 00:02, Jason Andryuk wrote:
>>> On 2025-03-07 16:21, Julien Grall wrote:
>>>> Hi Jason,
>>>>
>>>> On 07/03/2025 17:58, Jason Andryuk wrote:
>>>>> On 2025-03-07 04:01, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 06/03/2025 22:03, Jason Andryuk wrote:
>>>>>>> Add capabilities property to dom0less to allow building a
>>>>>>> disaggregated system.
>>>>>>>
>>>>>>> Introduce bootfdt.h to contain these constants.
>>>>>>>
>>>>>>> When using the hardware or xenstore capabilities, adjust the grant and
>>>>>>> event channel limits similar to dom0.
>>>>>>  > > Also for the hardware domain, set directmap and iommu.  This brings its
>>>>>>> configuration in line with a dom0.
>>>>>>
>>>>>> Looking the device tree bindings, a user would be allowed to disable "passthrough" or even "directmap". This means, we would never be able to disable "directmap" for the hardware domain in the future with the existing property (this is to avoid break backwards compatibility).
>>>>>>
>>>>>> Instead, I think we should check what the user provided and confirm this is matching our expectation for an hardware domain.
>>>>>  >
>>>>>> That said, I am not entirely sure why we should force directmap for the HW domain. We are starting from a clean slate, so I think it would be better to have by default no directmap and imposing the presence of an IOMMU in the system.
>>>>>
>>>>> Ok, it seems like directmap is not necessary.  It was helpful early on to get things booting, but I think it's no longer necessary after factoring out construct_hwdom().
>>>>>
>>>>> What exactly do you mean by imposing with respect to the iommu? Require one, or mirror the dom0 code and set it for the hwdom?
>>>>>
>>>>>      if ( iommu_enabled )
>>>>>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>>>
>>>> I mean requires one. Without it, you would need to set directmap and I don't think this should be allowed (at least for now) for the HW domain.
>>>>
>>>>>
>>>>>> Lastly, can you provide an example of what the hardware domain DT node would looke like?
>>>>>
>>>>> I've attached a dump of /sys/firmware/fdt from hwdom.  (This is direct mapped).
>>>>
>>>> Sorry if this was not clear, I am asking for the configuration you wrote in the host DT for create the hardware domain. I am interested to know which properties you set...
>>> I've attached the u-boot fdt commands which generate the DT.  Hopefully that works for you.
>>>>>
>>>>>>> --- a/xen/arch/arm/dom0less-build.c
>>>>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>>>>> @@ -12,6 +12,7 @@
>>>>>>>   #include <xen/sizes.h>
>>>>>>>   #include <xen/vmap.h>
>>>>>>> +#include <public/bootfdt.h>
>>>>>>>   #include <public/io/xs_wire.h>
>>>>>>>   #include <asm/arm64/sve.h>
>>>>>>> @@ -994,6 +995,34 @@ void __init create_domUs(void)
>>>>>>>           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>>>>>>>               panic("No more domain IDs available\n");
>>>>>>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>>>>>>> +        {
>>>>>>> +            if ( val & ~DOMAIN_CAPS_MASK )
>>>>>>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>>>>>>> +
>>>>>>> +            if ( val & DOMAIN_CAPS_CONTROL )
>>>>>>> +                flags |= CDF_privileged;
>>>>>>> +
>>>>>>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>>>>>>> +            {
>>>>>>> +                if ( hardware_domain )
>>>>>>> +                    panic("Only 1 hardware domain can be specified! (%pd)\n",
>>>>>>> +                           hardware_domain);
>>>>>>> +
>>>>>>> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
>>>>>>> +                d_cfg.max_evtchn_port = -1;
>>>>>>
>>>>>> What about d_cfg.arch.nr_spis? Are we expecting the user to pass "nr_spis"?
>>>>>
>>>>> Further down, when nr_spis isn't specified in the DT, it defaults to:
>>>>>      d_cfg.arch.nr_spis = gic_number_lines() - 32;
>>>>
>>>> Thanks. One further question, what if the user pass "nr_spis" for the HW domain. Wouldn't this result to more issue further down the line?
>>> I'm not familiar with ARM, so I'll to whatever is best.  I did put the capabilities first, thinking it would set defaults, and then later options could override them.
>>
>> I am not sure it is related to Arm. It is more that the HW domain is going to re-use the memory layout of the host (this is including the mapping for the GIC) and also have all the irqs with pirq == virq.
>>
>> I am a bit concerned that letting the users mistakenly tweaking the defaults could prevent attaching devices (for instance if the IRQ ID is above > nr_spis).
>>
>>>>>
>>>>> Dom0 does:
>>>>>      /*
>>>>>       * Xen vGIC supports a maximum of 992 interrupt lines.
>>>>>       * 32 are substracted to cover local IRQs.
>>>>>       */
>>>>>      dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
>>>>>      if ( gic_number_lines() > 992 )
>>>>>          printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded. \n");
>>>>>
>>>>> So I think it's fine as-is?  I could add the min() and warning if you think it's necessary.
>>>>
>>>> Regardless this discussion, I wonder why we didn't add the min(...) here like for dom0 because we are using the same vGIC emulation. So the max SPIs supported is the same...
>>>>
>>>> What I am trying to understand is whether it is ok to allow the user to select "nr_spis", "vpl011" & co if they are either not honored (like for vpl011) or could introduce further issue (like for nr_spis as the HW domain is supposed to have the same configuration as dom0).
>>>>
>>>> I also don't think it is a good idea to silently ignore what the user requested. So far, on Arm, we mainly decided to reject/panic early if the setup is not correct.
>>> Again, I'll do whatever is best.
>>
>> Bertrand, Michal, Stefano, any opinions?
> 
> I definitely think that any user configuration mistake should end up in a panic, a warning message is definitely not enough.
> Here the user might discover or not at runtime that what he thought was configured is not.
> So a panic here would be better from my point of view.
I think this code handling is a bit messy today.
GIC supports max 1020 lines. That's 1020-32=988 SPIs. In our vGICs we round up
SPIs to 32, so the true vGIC max SPI is 960. Issues:

1) We warn about current lines exceeding max vGIC lines only for hwdom. This
should be made common:

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d4570bc0b4e4..8d97bbcc86c7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2368,8 +2368,6 @@ void __init create_dom0(void)
      * 32 are substracted to cover local IRQs.
      */
     dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
-    if ( gic_number_lines() > 992 )
-        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
     dom0_cfg.arch.tee_type = tee_get_type();
     dom0_cfg.max_vcpus = dom0_max_vcpus();

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c563ba93af22..494210a7337d 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -116,6 +116,9 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
     int i;
     int ret;

+    if ( gic_number_lines() > 992 )
+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n");
+
     d->arch.vgic.ctlr = 0;

     /*
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index f8d7d3a226d0..dd1734a61f57 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -132,6 +132,9 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
     unsigned int i;
     int ret;

+    if ( gic_number_lines() > 992 )
+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n");
+
     /* The number of SPIs must be a multiple of 32 per the GIC spec. */
     nr_spis = ROUNDUP(nr_spis, 32);

2) If user does not specify nr_spis for dom0less domUs, we should take the max
vGIC lines into account as we do for hwdom:

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 31f31c38da3f..019ae2173400 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1018,7 +1018,8 @@ void __init create_domUs(void)
         {
             int vpl011_virq = GUEST_VPL011_SPI;

-            d_cfg.arch.nr_spis = gic_number_lines() - 32;
+            d_cfg.arch.nr_spis = min(gic_number_lines(),
+                                     (unsigned int)992) - 32;

             /*
              * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is

3) Doc for xl cfg nr_spis is utterly wrong. First it mentions 991 as the number
of max SPIs where it should be 960.

4) Handling in libxl silently ignores user provided value if the calculated
number of required SPIs (e.g. vpl011, virtio, etc.) is bigger than user provided
value. We should bail out.

I think we should first fix the above (I can prepare patches) and then continue
adding logic if user specifies nr_spis for hwdom (not possible today).

~Michal


