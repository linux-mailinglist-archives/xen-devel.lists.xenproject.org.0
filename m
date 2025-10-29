Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A84C1D6F2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 22:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153132.1483599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEDgh-0000N6-MP; Wed, 29 Oct 2025 21:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153132.1483599; Wed, 29 Oct 2025 21:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEDgh-0000KJ-Io; Wed, 29 Oct 2025 21:26:35 +0000
Received: by outflank-mailman (input) for mailman id 1153132;
 Wed, 29 Oct 2025 21:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l3Pf=5G=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vEDgg-0000KD-7t
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 21:26:34 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef637810-b50d-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 22:26:32 +0100 (CET)
Received: from BN9PR03CA0195.namprd03.prod.outlook.com (2603:10b6:408:f9::20)
 by SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 21:26:27 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:f9:cafe::7a) by BN9PR03CA0195.outlook.office365.com
 (2603:10b6:408:f9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Wed,
 29 Oct 2025 21:26:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 21:26:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Oct
 2025 14:26:25 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Oct
 2025 16:26:25 -0500
Received: from [172.29.122.169] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 14:26:23 -0700
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
X-Inumbo-ID: ef637810-b50d-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meS/0EbKrRT3gWrIzILjEgc0QDQc61K4QzLmFzTIRJFUZfRidMECzFNb3NMkhRu0lz5g/MWtIO4ke9T/6YcWPeU4WBxN6TWg9bSEt+knvoeTCeq15Vmisp6kG1gds4VgvN5h6Jlk+1N0iUGLlehqWMHEIT0bCYMd8zWhw8X1RVIYPBn19b3bQzsV5K4wc3PASqMz2yzr9y9Kc4UXTDFbzlup2X7aATQv7s/VNj8SBzaZObOeoiuKlFrOAWthvtFBr+hEIze3BcuKZh9qSGUztkJFEV5RRgg23cZi8kjVpcK3p9PCGnnjLDzUAfrNv2JXtopYKvxNmQtebOVmCuRGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXJqVMdx3kC+89aEqLsephWYxk+okUqrqZ6X1fPfM7Y=;
 b=SibccyNeR7ppxVPg4h0AZ1j4ZyHNv4u5+f/a1YXdyw9FYvMbl1FrWPk2ULqODF6CkX0tKzAdFa8oeno4wh1TLIUUtqefZG3Q2wCrfuvJJ0p0bBoSP5eHdiAf7eJUHEpoMPKjtC2RWsjbxRhRAxxNM5YbMbcnxUl9C39dIvvYeZDZWr28b/7knqV17bThps04Tadlxmi+wEup59IP+bIYJJN39E9m7Kdq2aOaUmqz2fac5tcgPtbO+1lvKigPdNxBZWZZsTu4K6k7AoUjlxqsuskcJNOiUWP3xYv/cBpd/GiCqg547AuUTaIQc6TgJJPA40nQFT6IbhOc48DGY8xZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXJqVMdx3kC+89aEqLsephWYxk+okUqrqZ6X1fPfM7Y=;
 b=kgvKRtiZBl3pIHH8mAmxGzK9TOyUJ/+bogB9fP2NFk6EGsbG2zUN0ABxS4ZszvaaqE4wUU60ieFhT9rSETwv9N2iWkA1neVIFP/FzTgiTWX61MODcQOGSqBoxTljwQtvVluzdyAFhhSfdQr28TvCQWXUJIyBOt5C0cESkDzIaBg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fee691ec-6bb9-429e-aaed-4fd007cbc0b1@amd.com>
Date: Wed, 29 Oct 2025 17:26:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/28] xen/sysctl: replace CONFIG_SYSCTL with
 CONFIG_MGMT_DOMCTL
To: Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>,
	<xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-6-Penny.Zheng@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20251013101540.3502842-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SJ2PR12MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ad5eb2-b832-4881-517a-08de1731d0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWJrOFczQm1PMm94K1ZLeHpoSE5Nai9Sb3FaYXlzR2IvTW5HQzJ0Z3U5dkY4?=
 =?utf-8?B?c29XTWpheVlwa0NkY2ZDTEhDaGZsSmwrOURaWkZyWlpoOEZ6c1VIZVdQQmlm?=
 =?utf-8?B?L0FEZnFrNFFZdWpnL2gzbWVidnozUk5lR1hpb205ZHlHNkp5MHZJZ3NkZUN5?=
 =?utf-8?B?RkZrR1lCYk45aTQ5SE9zWmFOK2VFL0RTRmdCZzdabG9zOWVqVG1MVFZjWGxj?=
 =?utf-8?B?ZTRnVURrMUIvdHd3VFRGWCs4RWdQSDZ0SzdUVmt3OGlJMVBVV0UrN05FdmtE?=
 =?utf-8?B?UjZsa2xPYk1iWGxIM2lRNkhqMkh3UVpzTE5seDdxellHTlNSZnVpK3lSWHVW?=
 =?utf-8?B?OC9vbGRnMlQ1emxoWTRZREp4OEZaS3VkREV4UGNFWFFpQnhyVUx5bmhCTldE?=
 =?utf-8?B?Ni9hT2o5NlhHZ2VXejAyRWQ4L3JZSC94UmpESmh1UENWaGpCVzFaMUVBU1My?=
 =?utf-8?B?ZmhwR1VGVFl4ZlJGOFhaMFp3a1h3b2FkYjdldVNlMDIvbzNBZFJod3MxMzVj?=
 =?utf-8?B?M2gwQzhqczNGS0ZEZ29ocllaUzdzalpmaElldkNpN0VyNVo1ejNOSmdPaFBo?=
 =?utf-8?B?b0NTYmFjRVZXS1R5VEV1VFVLdDJ4WHpKQy9hZUlORjFDZnlQNGtHT2RMbUZE?=
 =?utf-8?B?T293V1Fxb1JYSzZoTWdNdjZBRkxnbVpCUE84Wm55d0hvbjFtUkxBYkFwR1Bn?=
 =?utf-8?B?MENrcExhVXhkSGQ4bUx3WERTMWdXZnh3V2dFTTVvczF2RUROWGpaQnBsVFpZ?=
 =?utf-8?B?SDY5OGxEazRzOGthWVNnbmg5VFRIVTV4TGxWY3ZpKzkzVTFURlhiZU1KaERY?=
 =?utf-8?B?WnRYd1lCT0phQ2xQYzNZcUZrL3RBTkJwY0VmNnVVWVJzaGRsazM2WndxYlZE?=
 =?utf-8?B?UjBmWFEvYTJYL2RITGJzT3UzUTFTVmpESU9CU2tnY1M2WjlmbFRBQU9XVDcw?=
 =?utf-8?B?OU9xa0E5UWx6TWJDWEVvWGw5QVEwakxsdUs4bXV6a1JWdEdyNzd6R0FkSHN6?=
 =?utf-8?B?RW1KV1ZMVzFoTFNLbnVrZ09TRjgvRlNlRnhMdVRpL09FcysvQmo4RUFHa3kr?=
 =?utf-8?B?a2dvdG1YdFBjcTR1dzJkUmhJQ3UvZm5xMUFNb2MzQTA2Z1hydjkvaXlhaWVW?=
 =?utf-8?B?bHdjd0lwMERPd1dWZzNpYitFMDZ6ajE1eUVmYUhpTStydGdQWjY0bkpwcmZx?=
 =?utf-8?B?Q3dpcjFoaUVYc0xNb0ZHb29WYUhPb0xRZkJ5Nzd5dDMwbnlDYU5xb2xWbUsr?=
 =?utf-8?B?Wkl3YzFLY3YyUGdUL2hlRktXbVg5eHFTZUEvN2NQYUt2QVBSQSswejc4NjJC?=
 =?utf-8?B?WWdLZGo1UlRkOFN3dFZrRVVRSEtlQnlQMjY1S0VoakVvQTU2Q29MVGVJanp1?=
 =?utf-8?B?dC9IT1RLbTRheDZNcDVHeXdYME5EazB6dG5wQXYvaEpkalVVRzRVQ3Rhb2sr?=
 =?utf-8?B?VG9wSzZHQzJHMHYwQmxVSEdnV3ZzbFJnU051ZUg2ZDBCU2hCUTlsekwvN0xG?=
 =?utf-8?B?T0YrVTdIdHF6Zy9YUkphSTM3dE15N2t0Zzg4WkJjN0JKME12clhiZk5teVlE?=
 =?utf-8?B?N0hMc3hNdWdXUHZwemZtYWNMbkp0dEkra3p4dHFyVFZxbGNFaUhSRncveGVC?=
 =?utf-8?B?dEh6WkdmOG9ramM2dlNkNyt3OEZyUWVVM2pwZi9aUFJHazhiZ2ZvNTJXZUdC?=
 =?utf-8?B?YUIrRWd2akRrQjcrSjBmcFVOQkszK1JYRWIwRHlVeVFuTDIvVkhwQkhBay82?=
 =?utf-8?B?V2RoTzVBOTFGZVdqZzVqRXFjWXJTa3NjajBwbnhoenRyNlNrSjV3VWV5aTV2?=
 =?utf-8?B?WDhhVDFyZGRiRDdza090bjRPNktZQmRRR01KcGo1K1doWU9OcE80UmMvRU4w?=
 =?utf-8?B?MnZzWmpJUEt6RENMc2NzZ3BjelpDK01pS2EvMERkMUw0NU5acFRkSzB5NGx4?=
 =?utf-8?B?SVlJS2prSDlIZVhqcnI4NUJHZTZBZUJlNXE0R2pGZVlwbGxFZDZ2eWhXaVBz?=
 =?utf-8?B?SjU1ci9YT1J2MVdveFBjRHpzNW5FR0dZV1N5aUZBY0JhWXZTZkwzNXAxNWFm?=
 =?utf-8?B?RXd4RUZtWjQ4bS9LLzgwM2o5R2dFcHA2YW9RYVlrRGZ5c3B0QUpNRVRiUEkr?=
 =?utf-8?Q?oBNg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 21:26:25.9937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ad5eb2-b832-4881-517a-08de1731d0fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7943

On 10/13/25 06:15, Penny Zheng wrote:
> Rename all the CONFIG_SYSCTL into CONFIG_MGMT_HYPERCALLS to help provide a
> single option to manage all unnecessary hypercalls, including
> sysctl, domctl, etc, in dom0less system and PV shim mode, which could also
> make it easier to support randconfigs.
> While doing the replacement, we fix some bugs on xsm system:
> - wrap the whole xsm function to avoid bringing unreachable codes when
> MGMT_DOMCTL=n
> - add missing wrapping in include/xsm/dummy.h
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Shouldn't the title of the patch use CONFIG_MGMT_HYPERCALLS, not CONFIG_MGMT_DOMCTL?

Regardless, for ARINC 653:

Acked-by: Stewart Hildebrand <stewart@stew.dk>

