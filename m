Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5AA242ED
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 19:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879986.1290169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdw34-0003om-RZ; Fri, 31 Jan 2025 18:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879986.1290169; Fri, 31 Jan 2025 18:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdw34-0003lt-Om; Fri, 31 Jan 2025 18:47:26 +0000
Received: by outflank-mailman (input) for mailman id 879986;
 Fri, 31 Jan 2025 18:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkmC=UX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tdw33-0003fO-1W
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 18:47:25 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:200a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce433335-e003-11ef-a0e6-8be0dac302b0;
 Fri, 31 Jan 2025 19:47:23 +0100 (CET)
Received: from PH0PR07CA0041.namprd07.prod.outlook.com (2603:10b6:510:e::16)
 by IA0PR12MB8647.namprd12.prod.outlook.com (2603:10b6:208:480::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 18:47:17 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::63) by PH0PR07CA0041.outlook.office365.com
 (2603:10b6:510:e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Fri,
 31 Jan 2025 18:47:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 18:47:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 12:47:15 -0600
Received: from [192.168.195.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 31 Jan 2025 12:47:14 -0600
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
X-Inumbo-ID: ce433335-e003-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH/6HXrp8MZigRIBImkEq3boo9c1T14t9fsXIo5QVFvpX+E7MJvRdCPslXj5kdwbNFtmUj9VazMej46KqflLX4fdR9uigTBkfKPD/ECQiqJF6gkv7W90Y5ZC1G1XsFgPURC9EUquDXAsPn7G1cvs3oPTy2Li5PSlXdN3jUgblRdbWYVyB3H1iwC2WtC4dQNu05csANOsljsc8TPUjykidXqaI9lZQ0Onzc2rtaB+8q4vDMBteteUw9XlXmz485jzspSM55OlGrBrGydSWlCndscvT0nTDZzIjIUodH25ZXhuvvkSpPdgZ7Ymr571abfivhdf9lJ0CKApipGu39xeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTFrcf6uapok3OVJO2hb0V0lbMc6AmfUzcGf5bxoiRE=;
 b=THDNjRlqKvZyzqvkF/UZfeK3WgWBduWYSWb5bneJyYdOq33Hr8uqVHWl2RTpO62K/64fEZatwSqzW0L1sHK/217GIpQRHFK/kgaFH03sf62PCGwBVoO+iOVASJaSa7NvVwXje5AcGBTXxBSan3alaXPo3OwbRfy1Sbw6tZNeBiz/h81/ounsC0Tf37qCdTB15goI3/uG7cJ9FyyJjUifbbKWYB5zcy4uLHqJBdFVjmn0rofTwe90hvU2W4Bc3iD1E+N/iMhVKfLmVz3hwLWskdRuCdW/VV+bdDEO1XwTwTga4Z0LkfHGVSPYXSsZ/RPGjtgJSGMeJKbzDGzaJYmjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTFrcf6uapok3OVJO2hb0V0lbMc6AmfUzcGf5bxoiRE=;
 b=fIsYPAesCDUDGJQp0vAgP3svMPhp8ob1oAPovXLxvz5Cg3+LCKB+p0MUe/8KTBICziNdqGlx27SsT6jWOvFwPfdx8ia7SkKu5xvM+u1CnVGWEyxZcsMQV8/9JRnTZ9kfQtklXzB8no55zsnh8l0+4zWU7L8/5GgY1p2BXQljqMw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <490192cd-958d-4592-b827-e1fff7b2067a@amd.com>
Date: Fri, 31 Jan 2025 13:47:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|IA0PR12MB8647:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8cb90d-ecc8-4a8d-52b8-08dd4227af56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVBpR0NGZURxQ2ozeU1XZis1UWozL2tMcjBqSVNVdjh3aXZ2cHhzcUc2SlV6?=
 =?utf-8?B?L3NxSUtNeFNRY09iVjA3WWtBVDVUbzhwNkswSHY1Q3FVWkFMY05mdnV3bklR?=
 =?utf-8?B?OHBER25aM3RIamR2Qy9TcnFPeFN6dTJyZUg4QVcrTklxNEdvVnlNajZIa2JC?=
 =?utf-8?B?NHN4ME9PS0c3dWNWSU5yMWJRZWFOcUIzTFUwOUdWVW9UWHVxQ0lyZG5EVVA0?=
 =?utf-8?B?T2ZSSE5QVm1VWVdick02dmh1eDR0N1R4NXNWQ2t3eG83RkFKRmJlVC9hYlJC?=
 =?utf-8?B?WHpFaFFGdDY5eWNxd0FvYUpyT01aN0x2OWNyVU91UVZjdDltbmM5c1lzbDE0?=
 =?utf-8?B?L3d2TjVWa3RseE5qSlpvL1B1YWRBWXlrY3I4U3BodkUyZmtxK2VMYnpOWktD?=
 =?utf-8?B?Y1lyMGxMR2NhMm0veUxTcHlHZGZ3ekVoTUxTd2Eya0JOTS9Hbk5XYUE5NFRr?=
 =?utf-8?B?c2UrTGkxUTRTbEMySU9INGxkQkNkSWhjbldGN3NFeEdHUWsyVWpQOTZBVmQ1?=
 =?utf-8?B?NU5Da0VablR0OS8vaXBMWTkxMlp3ek54b2VLL3E3NTltcHM3c24vNElaOVU1?=
 =?utf-8?B?UUdqWHlZR0xBWjFCYkVVVGVBUC9DSlIyYmpFQkMzbW1JamZ2SVViYzlub3p0?=
 =?utf-8?B?ZmJia1dxN2hSbjJxa1FHVCtHeEpCMDlOT25iOXRCRFo3Zy9EcXhMYVFleWph?=
 =?utf-8?B?cnQ3K1NsMEVXTlcvbHFYSExxV3BkV0pFWkRWNUNxM2NlVWFwOFZpcTlVSmhw?=
 =?utf-8?B?Qk55S1h0a0g4VmttZUF4R3FXb08xeHNtTGZiRTZua1hhNkxoYlVvRkI3UEpj?=
 =?utf-8?B?SnJvUExhYVo2SUVDdDBYS2VhSU9KcFFWeGQ3aWVlNlZubVJXNzlqWFFKQWRu?=
 =?utf-8?B?a2dGcDc2QnUvWkJwQjBkUXU4eHQxblp4eE4vOWl2Z1kwMXRYUWdYeFdhN2h5?=
 =?utf-8?B?UnVPWjZQVkU4YktVSVJmVk9IVHROOGJmc2NQU0MwVXUzeXBxZGd0RFYxcDRC?=
 =?utf-8?B?dnRqVXU2WmJuT1JTMitJMlRPNndNRDJtck9zb2VsUWR1N1M4M1crWklxZ3JW?=
 =?utf-8?B?bkpOWnMyUkRKUzhPRWZqTzR3THZ6T1hsVXlFcUZ0R0E1UnR6b0Jub0wvREJU?=
 =?utf-8?B?NmlHUVV2VmpYOUhRTXN1UjUyRkdCNVFkTndRVWg5eWpEMnVNWWwwSFo5bW9t?=
 =?utf-8?B?TjZweFUyaTNPSGkzVnBsK2ZpYXRWeGtDaWNzYXFLVjc0aFFVMTZnK0JEZWFI?=
 =?utf-8?B?cFNQSWZxMUtmamJlMUU0SkRrUjRuUDlhMTQ1S1NYejFHZlpUZzQ4NU5WT3BH?=
 =?utf-8?B?T1lOZEpxWExkSTJUeFp4alNxZngyMk9UcElvb1BBN2VsQUh0UTZqQSt1eWhw?=
 =?utf-8?B?V29SbTBZdmJQeWd3ZXhLbEpMRkRCNDlWUklsNXpZMisxbGlpU1hrR0REU1Nl?=
 =?utf-8?B?bmVpdzFXZzZkaUFEU3RyZ2ZneVd3TG9EYXlDbHJUc0l5aDB2RDN4bzRyaEFM?=
 =?utf-8?B?WjdmdEt4dWNnUm5lZGh4eGNrN0VTUlBRTHR1bjhPUEI4aVlGVWsrS3B5TnFz?=
 =?utf-8?B?em5TRE5mblZQZDNkaFdsdlV2dVkvV3JlN3NqbVZYYXk1M25JeXhTZU82QjR6?=
 =?utf-8?B?aVJUcUR3bEpCUzNvdnJ3clJOY05md2RCR2hZellBd2c1bDBGVnp4RXhwRmNB?=
 =?utf-8?B?NFF0a2Jva0N4SnY5dEE5MzRpS1ZIbVlvdjlKU2xMTzZwaCtjb0RvUk1NVm1V?=
 =?utf-8?B?ZThudXlCMG9ZMkVKMlNVTTlQT0g0UDI1TkgrMWovYmUzRVVUbHVzT0FMZEx0?=
 =?utf-8?B?NldwWGY2TlFhVEw5RFlEK0pCd0dZemJQSHA0aUNDazM5dVpwY21nQkNIa2lp?=
 =?utf-8?B?alZCOGVFQzNmQUFKZE83ZklKaloydjluOUJUU2NKTFllUEIzZEp3S2x0d0pV?=
 =?utf-8?B?OW5YRkZ4V2QrcEZ3T1VqZGNGVWM0bzFySnQ0ZnRCSXV1am0wbzhtVnA1N1FB?=
 =?utf-8?Q?29qZIBPn0SbODFWsPJozn5EIHhPghQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:47:16.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8cb90d-ecc8-4a8d-52b8-08dd4227af56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8647

On 2025-01-30 06:12, Jan Beulich wrote:
> In order for amd_iommu_detect_one_acpi()'s call to pci_ro_device() to
> have permanent effect, pci_segments_init() needs to be called ahead of
> making it there. Without this we're losing segment 0's r/o map, and thus
> we're losing write-protection of the PCI devices representing IOMMUs.
> Which in turn means that half-way recent Linux Dom0 will, as it boots,
> turn off MSI on these devices, thus preventing any IOMMU events (faults
> in particular) from being reported on pre-x2APIC hardware.
> 
> As the acpi_iommu_init() invocation was moved ahead of
> acpi_mmcfg_init()'s by the offending commit, move the call to
> pci_segments_init() accordingly.
> 
> Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

