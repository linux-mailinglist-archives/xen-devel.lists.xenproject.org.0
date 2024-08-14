Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A18951BF4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 15:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777292.1187495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seE9p-0007Bb-K6; Wed, 14 Aug 2024 13:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777292.1187495; Wed, 14 Aug 2024 13:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seE9p-00078c-Gl; Wed, 14 Aug 2024 13:35:21 +0000
Received: by outflank-mailman (input) for mailman id 777292;
 Wed, 14 Aug 2024 13:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSq6=PN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1seE9o-00078W-8R
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 13:35:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2414::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0af9f933-5a42-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 15:35:18 +0200 (CEST)
Received: from CH0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:610:e7::25)
 by CYXPR12MB9387.namprd12.prod.outlook.com (2603:10b6:930:e6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 13:35:13 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::aa) by CH0PR03CA0230.outlook.office365.com
 (2603:10b6:610:e7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Wed, 14 Aug 2024 13:35:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 13:35:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 08:35:11 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 08:35:10 -0500
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
X-Inumbo-ID: 0af9f933-5a42-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tr5hZkEyuLJOHKabb5IYU6yLGkrFEmQuMyLxDPK6G3reE3O5r3UazwDD818GLoTt2ZD15/MXKpoN9HoSunVvTn4d9+/fWXfTawtgr3q6AcMmARhq2po3O2ZmxBmUdwMb5kTJaUhvp34T52XDRCcDjdVWNrUflNblYb1slWB1P7jpqNG4pKh8LwZjK42Z54Z49uVXKM348oTbd24gCGG2bNzYhoLPcAbFuZVGq0gpn7c2vSMGECWvbJb0ceNhi1IxNQVbmTdBrIRtKXEjry3XcAfINT8NR5bwyxKyLHrsk4sxusvN9Fjx6y0xzKxJhFXqmtMAP88Fj5GkGRZ11vrhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNkXIvgK4aoQrNLQB2bNRdH50rKwGgafH7apV9x0rNw=;
 b=J89PU4sai9LhQnx3D4e4MgDQ8ulXgiZxQDihNGDYJ+BVKl2AqVFEVrYd65Smg8P9VdJHH5+Eem+fAg2Cpdf/w/VUhm8+myXvjTRAmXJ/KWy6ZYQBPPwPSjmgS3mstiW0YhozR9NHEj8F6Wzyr7jVfIHPExdxJhb/W+yS1BnJ69dv6aqLvj/vbn/77z8wyh9+VTePJi2YBp4I/jXcqbh5Zb+uZnJmQdn7uvdaK8GDJgOsUozzeRZcxKxfzf4yaC+aup8LGs50fcajnb2XLBEhaEjvp0SGgcdEqHFkMC07oRvUHEul1CwV3flGry93H/011RgnTIyRNY7/+1z9hRWVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNkXIvgK4aoQrNLQB2bNRdH50rKwGgafH7apV9x0rNw=;
 b=vSbh1agSG9ZyH8xHsDkQ1le1sjsjV+8I84u/ciIZHSm/rpdyoKjRuTjFkKrR2OoTazEVysWSK50LnH6+MKBlmsMH2VCiC4vJ7I7nqtX6JPsh4cNoANb3dDGOy3nSJELZgPBdQS6eGYOu5IPsQVO0olPuDXF0OylY87CEXfwN2/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4302bda1-2441-4cc7-9bd4-9810ee62a497@amd.com>
Date: Wed, 14 Aug 2024 15:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xvmalloc: please Misra C:2012 Rule 8.2
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <02755b04-844b-464c-966f-d4fa6068315e@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <02755b04-844b-464c-966f-d4fa6068315e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|CYXPR12MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4b5720-90ce-4df1-6fce-08dcbc65ecc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVdLSnV1c2tEY3FTSEVtK3NjRVdVQ3FLcmxSOTNuM3pDOXp3UjQ2UHZQeXBT?=
 =?utf-8?B?OWkxOGUwZFp3YnZ0Z0syZXdwTHdjd29lQUpMVSs2dndTN3FCWURaMHlncE9W?=
 =?utf-8?B?cFNpMzhucHQ2cVJLaks1T015SkM2ZVFXWW9MZUMva01HRDB6QkJERFVvZ01Z?=
 =?utf-8?B?bUxvZjJCczN5NnFnbTB4d3ovU3pYU2hhZ3V3MG1Sa2RqOHpWZEJ2TEY2L0Jx?=
 =?utf-8?B?RDFwMTduSzJkRVZEOCs2anhaMjZacGFmZ0ZmNlBkbnVqRWZscXllaiszZEQz?=
 =?utf-8?B?ZVNyaE5ReGtDTnB3QWQydFdKWGRrdTV2eDFQQTVIY090ck5xenZCaHFyK25S?=
 =?utf-8?B?d1FZTDVJYmp0TjBHYm01alFNd2pSQUYyZVB5dmdHd3RidVpRQ2QzWDZJcU5J?=
 =?utf-8?B?UkYxWmVMZGtaek56YisybllqN1o4aDBldTMvT0VGeTJhMjUvSVdMdGlqZUJ5?=
 =?utf-8?B?N3E1QzZGZjgxd2U2QjB6V29wcEw4VnZxeCs4VVpkbTN5U3NmNlNsWlZDRjh0?=
 =?utf-8?B?UmxrelN6K1ZTaHNNMCtmUHdFeERSQ1VDQzFjK05rcDF5bHhPYkpkb2NFeVBw?=
 =?utf-8?B?dXhDZlVGek42MmdiZU5RSWJWdEk1NHpjOVJFRkRVVWluQm10T2Y5bzBJblhS?=
 =?utf-8?B?ZDBLdi8vcTFzNTA2c0JwV01SZzFMd3RlREZPWnI4UFdrdVNDSGZEMmVDZW5J?=
 =?utf-8?B?V0R5ekVhRnhUZlE5bWw3d3FKeENJQ3hOTTB5OE9iVHRIMTFuMEV0OTMzWENN?=
 =?utf-8?B?K1dTMjI3a28vNUd2U1Y0Zm1kYUFkeFhadFdCZ29IWnFNUkNTaWFvbFZVeEQz?=
 =?utf-8?B?TTlGVW82WUY1VXlRRzl1STNjeDEzUFU1elBHTXJyUmlzOGFweTB5Q2FQanRR?=
 =?utf-8?B?d3BJaW5Vd3kyRmMzc3J3Vy9lT2FBRHdoQmszOWdhSFdWVlkwWEtibzRVdUpJ?=
 =?utf-8?B?cE9CTStsNUhNWi8vT0l1ZVNLd1ZXWXdLbDVZRjU1clZnU2JZMktRZmRPM0Fs?=
 =?utf-8?B?RWxDWFdhczZ0Zi8zZmh0bnRxbk5EQXdTa3lRS1J5bjdSREs4SjZvTjFlY2c0?=
 =?utf-8?B?TTdLK25NRWRmWlY4MC9iOUFWeE5XTjJoUkdBd1krNUFuYnl5NVE2TlZVNnht?=
 =?utf-8?B?MDBldzNhU0w0L1FqcXVQQnVCOVFETmF3SUJudTZKYVN5Nk14akxPREQvaWpt?=
 =?utf-8?B?YlFzUHpOVk9meng0MkJ2QVJOVmthM0l5djJRbVBPQUdsVmJIRmYwNG83SExH?=
 =?utf-8?B?VDFEZ1A4aytMY2paRW05UGhPL2h5SkpFaTNodkMwblBCV2h3R3pnajRFVkpG?=
 =?utf-8?B?REJ2ckdFSDdJcU5oa0sxeE8vd0lIMm1OMkQwSmNHOWgzQXdyOVRacGFpdDI3?=
 =?utf-8?B?YVNFbUFXMnZOZnpsUkxHeUthRHp1d0pFcGNmOEsrMExmbVllcjhqUUoxTFhK?=
 =?utf-8?B?RHhkOXREZFVES2FQYytvREhBRHNvNlp1a3J4RTBNamwwNEhIYVdBL3hBUzQz?=
 =?utf-8?B?cXZ6TkJsZis1b0pINlhUV0Iyc1RvRDFTemxLSWpBNURRKzg4R0RMZlJubmNE?=
 =?utf-8?B?TW5BRjdUd1VlUmVKeW41SldQZW92YklqZnJHUmlWU2lqL3M3WCtJY2owZ2RE?=
 =?utf-8?B?WnVrazJHRHp1YlFxRG5LWUpLSTJLeVZQUkE3bXp2cFhublN2bi9GK3NVOUZm?=
 =?utf-8?B?Vk43NnN2Y0JvWG9qeWhVQzF1eGp3U3dkbFlyb0tBN3p0a2llSzM1VUtjSHdY?=
 =?utf-8?B?UHl1MmdTQkFlUTZGdFdwNUZDY1Jya2ltTzluSGI1ekJ3TW5tNEFBWnE0T1Ux?=
 =?utf-8?B?ZEtWdUdPbk1PQ0R4Z2VqQklQbXA4U09vU0dvUmlhclhHVzRDN3NJZmFjdjdv?=
 =?utf-8?B?Zml4SFNqSmEzdnBXSjJGanQvejQrbVpiOHE4M1hpdk85YzR1YSsvZTUwd2lC?=
 =?utf-8?Q?fRKFOP2IHmm6RkFB8QLA8Etk0r5TtRCq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 13:35:12.7686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4b5720-90ce-4df1-6fce-08dcbc65ecc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9387



On 14/08/2024 10:06, Jan Beulich wrote:
> 
> 
> The cloning from xmalloc.h happened long before Misra work started in
> earnest, leading to the missing parameter name having been overlooked
> later on.
> 
> Fixes: 9102fcd9579f ("mm: introduce xvmalloc() et al and use for grant table allocations")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


