Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F08C53392
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160230.1488433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDDy-00017u-4J; Wed, 12 Nov 2025 15:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160230.1488433; Wed, 12 Nov 2025 15:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDDy-00015M-14; Wed, 12 Nov 2025 15:57:34 +0000
Received: by outflank-mailman (input) for mailman id 1160230;
 Wed, 12 Nov 2025 15:57:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozL9=5U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vJDDw-00015E-RI
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:57:32 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49baf557-bfe0-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 16:57:30 +0100 (CET)
Received: from SN7PR18CA0001.namprd18.prod.outlook.com (2603:10b6:806:f3::15)
 by DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:57:25 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::d4) by SN7PR18CA0001.outlook.office365.com
 (2603:10b6:806:f3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 15:57:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:57:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 07:57:22 -0800
Received: from [10.71.195.192] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 12 Nov 2025 07:57:22 -0800
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
X-Inumbo-ID: 49baf557-bfe0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHV/3YWsRTHQX7c1syNWri2OAbTSAZ4cVv43tdWXet/eKdCYfMwHgAyOieyYUPgDGMvFvLsG8Hh7y8aUEo02BpTtrgvAm1NAt1XlUSSzAmft2kSl+GMhr2fhYiBvm4SwnvJ895P8dsiNhsrqrs7oG9VqeXRQT9yDrx6i5Y9qeMNdJFPV6+W6euoya76sLV6+rRVM7YhcoXvTe2p7P3xGfN04TFO1g7p01l4BWsOjMEwScfiswfRVJcmK9/cuy3g+wT/B1qA+BGhP8/DKzotv1TsyBX708H9tdxYl74tKInFTOwdcAcm/JWdJK4BQ0O6UZqL046Yvy7Whrik+7MZaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YII8INiDe7golv5ZdoCQ3iels1T22o9SkYEhUD7lEAQ=;
 b=Z5mU4j87dlgAjP4Lhyuld4T6w2/qqcH8m+upbyZR/y98Fdt4PA1M4qdC8FszsIyPV3Y38jzHd66Zsn5LqobaQdJCcoZVXeipK5knwI9EVzZlnwq9vziSsAYXSyx9a5OvDvXH0qFv3r+GBEORQ+LrV6cTrXlYtR60GJXOoI5OeLlXxt7E3KRJsJrkB/6yFARN497srdapDqU+ADXxECaS32Qokg30Ct6VJK2LtSavZWu32CaRhdACro7n/qUMoKKK9qgRsailjRiqljXvQHFdQf23ZYa5uAXO1SzA3VEHpu8A67yBtUFE/vjs1wkrgWJarkk8jIif6dSqRCVwXrZxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YII8INiDe7golv5ZdoCQ3iels1T22o9SkYEhUD7lEAQ=;
 b=vScsSLWI/CemGAkQ5tErWvC4LRuOYudjxYi3w1r+gmm8fjDSN+skm//7aa7ZCs7LWwSfoQxlI2KnXywLim9rgboD9s/0QeEGmH6TiHWHOoucWvQkbCvlC0fuVG6R1NLANt1Su0pWynaJVcTkokCmRTeVI9K0tmrXPC/g4Cbz4S4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <62f7c571-9c55-4a29-b8b5-1912c3aa3ab5@amd.com>
Date: Wed, 12 Nov 2025 15:57:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder][PATCH] Add DOMU_TRAP_UNMAP parameter to control
 unmapped access behavior
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
References: <20251111220541.2531935-1-oleksandr_tyshchenko@epam.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20251111220541.2531935-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|DS0PR12MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc0e500-779e-4991-a0a4-08de22042c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0U2N0llbDVUdW5zQ0NIT2Y3YkF3OVFYUTJPZ2dmdFdNZVhWL3lCMUlvNm9W?=
 =?utf-8?B?T3kyd0FVYXpYNWlUbjBFZVNWR2NDcHZ3dHN3SjNBQ0RYVnpISUhyZHU1TURh?=
 =?utf-8?B?WWJDNzdOZjFKY3Y3c2FWWHEwT3RmbDlXcHRmMUgyZC9GV09vc2ljRUVsdkVJ?=
 =?utf-8?B?T2JjVWxPY3VtSUVCNEpPVFRVamFxelBWMlFpQ0g3dGZvSm0rVHp3WEV5R0FW?=
 =?utf-8?B?aW5DSDFHUGY3cUREMEZZVGlFLzRpa010b2lUeUhtc3RlZjZ4ZFRBUC84R21B?=
 =?utf-8?B?SGMxcVM3TWJNMDJwdjEydWl0L21jNXNPSlpzaEVPSkJHallRaSthTFNhMWkx?=
 =?utf-8?B?MlVIbHpZeGN3K05HRjhocG95WCticitNNkQwVEpIc3hEZVRpVEk1cGJyd3pQ?=
 =?utf-8?B?NGFYaTBJYW5BNmRwQW82ZGhIWVRKYnVqYzlacHY3eWI2ZEx4TVNUcmJpQ1pH?=
 =?utf-8?B?Q2VHeWRNMnpYU3VZUFNIWFBId2tOWDhNckJtcDJJRGk3MWVoZzZuWEdNSXdm?=
 =?utf-8?B?K0RZS2k4MTh6MDZPUnZKWjZleGhHMzcvUFpwVG94dWkxQ1dQU2xmdk0wdkhF?=
 =?utf-8?B?OUNFUUEySDhHc2RhZzd1U05mdjBZQzQ2Y01WSlJ0WWYveFdCZ1hoOVorNHB2?=
 =?utf-8?B?WHFLNk9KQWZBSEFFdFZ4bWtodk4xeUhqTDczK2ZhZTNIZGJORWIzVkFjZHhj?=
 =?utf-8?B?Tnk4LzhFakxlUCthUzlDOEZzZGtSNDBNQ1pxQ2UxdFpvOXp6dS9nWUcybVBk?=
 =?utf-8?B?S2xtTms0eXl4bEtDSldQWllrdnJzY0ZlOWdYY0NiMGxrQ3BMTlppb1VSWUN2?=
 =?utf-8?B?OEsvMTkvZ2QrbGxJL0xMWWZtNjRaTjNiZFlya011azV5clFBenkybjFQazRt?=
 =?utf-8?B?SERUOEFkMVFUSWgwWTFEblJ4ZUI2bDIxS2Q1bkJTZkRaLzRTR2xYM1VHTGcz?=
 =?utf-8?B?RzR1cmNQeXRFbXBFcnBkUVZUN1dJcUpXbUJCKytmRFArRnBqMWxFZmZpNEpx?=
 =?utf-8?B?bUNWMUxjWG1XSEpkZ2VobWp3TTk5YktuZXNwK3VjZWl0aE5rK3FmMzIwUlYr?=
 =?utf-8?B?bWF6SVRJRG1qcnBLcThaMUFpVHdrSHJwdUE0U1l2T0hTaEF2bEl6TU5NaTBO?=
 =?utf-8?B?TDJJR0kyWFZ6N0QzTlZ2NDgzUHJUOURUeWpmK0M0VThSVmM3S0txS0xNUUFj?=
 =?utf-8?B?bnpEMmdESHB6Q1doYkp2S0lzbUFsaFdiekkrT3M5QUdWUFN6b0Zjb29PMVFa?=
 =?utf-8?B?V3RoTGFBdzdxL0sybmw0VGdiRXFUUmZsejVLODM3Q0xvQ0RJdHNJR2Q4TnFj?=
 =?utf-8?B?Q0poeGhYM0FQSTlXU0V3elR0NElCNVdiQ0VVTDU3cThNSkxwSGZhTGgyZDNV?=
 =?utf-8?B?RWFhdkVwR2xlVHFqUXFobWJSUVhGRGViOTNVcisxM3F3bzBVS2tuU0dzY3RT?=
 =?utf-8?B?K1VaWXAyQkhkaGhjTUJLZHpDeXpIZ2VWWVBuNjJKVTJ0K0NzdnJ2dVUzYTFO?=
 =?utf-8?B?d0k5bHcrZEtuSmpkandqc3hGWkdTaDl6MG5oei9FeUxBUE1TRUJBbzV2Mm43?=
 =?utf-8?B?S0xuOElRY2NNOFJEdnBZd1NtVTlNTkZvWXZSeEpQeWR0bEliK2daQ0VORVly?=
 =?utf-8?B?NUtlays2MERjNUxvUWJxL0dYYW9Pb0ZPUit4SmNIL01CZ1pDZWpnRjNzQ1RG?=
 =?utf-8?B?WFNoYWsra2ZoSVNOcHVYTFhVOGtwbXpzR3h5UXNVV0RuN0Z1RWpJTzVtZzI5?=
 =?utf-8?B?bDlzd3dGUFJvYXdLWHpBbFB5elF3NGlzQnlnbldXSlNUVU9ndExRSEFJTDB5?=
 =?utf-8?B?VG9Vb0d1SVB3TUNHWXMwUWlsS1RJV0hRTnlHeXN0bUtpc3U2cHRoa3F3eXJD?=
 =?utf-8?B?dzlYYnJzWjUrMGZ5MFV5UlFXMERCYVZkUkZtY2YxNklOOHIxNlpDNFljS0Vl?=
 =?utf-8?B?a2paMzRoMGhmak40a3JtTE9Gb0R2bis0U3hORkdXbllyUUV6akpKeEtHeVRM?=
 =?utf-8?B?UVBjT1NBMmtOcVpEUVpKazVxNk9YN2hnRWRyNXFtamk3TGxadUtqYkt2VStP?=
 =?utf-8?B?ZW1MV1YyRFJkSHJuUEtzbzJhVnJmZ2o1Mng4NjRObEVUYXdwbFlBb2hoSVZy?=
 =?utf-8?Q?fPf8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:57:25.1213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc0e500-779e-4991-a0a4-08de22042c4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038

Hi,

On 11/11/2025 22:05, Oleksandr Tyshchenko wrote:
> Introduce a new Arm-specific DOMU_TRAP_UNMAP parameter that allows
> configuring how Xen handles domain accesses to unmapped address ranges.
> This parameter corresponds to the "trap-unmapped-accesses" device tree
> property.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

- Ayan


