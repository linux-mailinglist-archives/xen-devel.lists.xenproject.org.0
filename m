Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB7CADBFE
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180950.1504045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSe5e-0006rL-QR; Mon, 08 Dec 2025 16:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180950.1504045; Mon, 08 Dec 2025 16:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSe5e-0006pu-ND; Mon, 08 Dec 2025 16:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1180950;
 Mon, 08 Dec 2025 16:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwXn=6O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vSe5d-0006pm-4U
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:27:57 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8868558-d452-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 17:27:54 +0100 (CET)
Received: from BYAPR06CA0068.namprd06.prod.outlook.com (2603:10b6:a03:14b::45)
 by MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 16:27:47 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::f6) by BYAPR06CA0068.outlook.office365.com
 (2603:10b6:a03:14b::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 16:27:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 16:27:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 10:27:46 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 08:27:46 -0800
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 08:27:44 -0800
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
X-Inumbo-ID: d8868558-d452-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmm0AlIgqyFaQ7KHeVtJSn3JlXTWL8o2nDfpYHOtU3LlpNbf34JF4eLJfREitNvbk8yELtZJkzYCrYGRyhmt8cWNucwo+O8zr/1qbDlhqFk/i4tJe7CwWcHcWLlVoGSKXxlI1SCbr04biFTi18wCSJ9ZWc+P7O4pNqN2nTsEW7sxBygpoVfhLMTXBplXsh7qclRs3z4Vgy55wUJsOtNBX25mw7s+w0nfHDalP/7ciVnyGC9IAzOte6B4yE7SWsvYomJEWe5ZtSVE0o8n3V6Fha7TVw4KoPAFYShADSOCIgCB3Z4aglYeEfO2eupE6WsdXhG/e1uIxIA771R7J0v4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcPPs+PzMW7ROKTHDkQvLOrng84m5xKFNI7a1AFCPl8=;
 b=XpJLTdT+4VVzTPttxhHRunK39NcBAvGUd6dksmQLMhL58ezuIIXDGq1nY6ZG3lwq6Dv/nG1axc5YzHLUSBipsNA1Js/eThzCdtjoIgv5jgPGBs4D563S/UQ1HCtCwGnBB1/gROJqig/5gHR80XNZgtkbxiMWN0v6/ySBY35E4vVTPD/s9y6SI0iJUUPsy4Fw0+ZxvLsPt13KUgNqFSigz/bt2i4cmixCyM+Bnad7VmoWlVi/0/jR3W5w0L/Dq/JJ6phYIAcOnpmEztcs592WDpgy8S2b5TD1A7uxQAK/1J6Jfkb4QkVAyufSUki61zmoHA1c7VN6fX/ub3LnZFIiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcPPs+PzMW7ROKTHDkQvLOrng84m5xKFNI7a1AFCPl8=;
 b=We5uPmig7+ANGH6xtn41m9QjiQ0OiFglLan1kedaQ1oLT18g/7c7WHLCYGVGoPGVJMNuDbuzc1MyWF2bbRksPhMkX0SeHeAA05pzncxD3Oaja/i5VvfVj+sEjeuBxDrz6yQBN3SLXcNr2UIahsUcYOEQ9qsFCSvr1xQgJqgxI+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <47752be3-e6b8-4d48-99a2-e13a31fc3c12@amd.com>
Date: Mon, 8 Dec 2025 17:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: move vcpu_kick() declaration to common header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>
References: <260f0884737c0d99afc392cf5b0eeb1ba7557437.1764586422.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <260f0884737c0d99afc392cf5b0eeb1ba7557437.1764586422.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 4472cf9a-89bd-4c07-b152-08de3676b92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3JnRjFNbGtmd3pyZzh2MVFRTGxVcldmK29NWlZ1c2Z1UVZEZ200eXpFSEp6?=
 =?utf-8?B?VGRFSFkzdHNpQkJ5OEVqYytkdjZ4VzNJTEV3Qlo2d3E5UTRsWGttR00yN2xs?=
 =?utf-8?B?RmRQRmd6Q2JYY3Z5Zk9OUjJZbUMzZzcvZm05RWNFMHV5NFdmeFRsYkhKSDdn?=
 =?utf-8?B?SmJaSDZWM0czMjRldXkrRmplSUtzaDM5WTgwYjFwb3k1c2tSczdrMTRRUEhz?=
 =?utf-8?B?QUlvQ0s4Zkh6Uy9rSEdMYTdsbDkyQ1JFcFY2cFpBZlY0VXpleDFjTXQvL2kr?=
 =?utf-8?B?bmtyWE1BS0dJT1R1dmFiN3NTZlkxeUo0bzBTVFhHNlhiUVF3OS9HbmMrZlRE?=
 =?utf-8?B?a0hVK1Znemh4eURxT3hEanZuQWxYckQ5U3l3d280T2R4WTdIdDBQSjM2VXNM?=
 =?utf-8?B?VS9vbXR1QjJqRWJMTG1pSloranUvYmNlM3Z4VFZPZVZkRk9OaUFWS0d0V1ZU?=
 =?utf-8?B?b3FmcjNNRkNDRnV1RmpZcGVDcW5vTzVxZ0tJenpwRHdJSGZiUUJsYlRYdTRH?=
 =?utf-8?B?VnJ0UHdwWVJObkF6eHJDeitoZjRCVXk5S05LVkhURWlhVEVPOWZFSUhJZWF4?=
 =?utf-8?B?RkRWdlJObk14dzlLOUJCTUlqK1lJaGp4dUZRRjJ6am9iNENhdkFiRlFNZGQv?=
 =?utf-8?B?Q3k2VXMxQUdFbXh4cXBGNCtnTjQ5S3gzand5VnJKeUVOcDVFaWtYenFSU1Jv?=
 =?utf-8?B?RFNIQ1RnS250MkZiK28wYWY0eDNDNys4WkFvUUhKcW4yTU9wTUExc2NxTnRv?=
 =?utf-8?B?cTJKUWdudDBLTkhPbkljSEdWTDZQZU1zMDJVOUVGS2gvVGFFSWtqOXNtQWRa?=
 =?utf-8?B?YXZmNmZ2cVorY29CNFpDM3kyOFhOWldSSUZ3aG1JR0p1RGRVVXBGL09iL0ow?=
 =?utf-8?B?WDNqdTJuOEVQV29BVUFTV0l2THM2ZUFMV2ltcWlJczlXeFVYRTM4V2V6VDZi?=
 =?utf-8?B?RTZmaVIxQmx0aUpUb244QmsvTW1oZHJERmdyaDU3Q2Y2aUtEYXBUWk1aLzgw?=
 =?utf-8?B?dVcwcm1pa094MUxDRlBUcG9JTXAzK3g0Q1ppejV3aGlHeitGREdSYzJZU2NC?=
 =?utf-8?B?TThkU2dlajNacHdPN201eFFGVlNIVmZwMUZnbjZCeUd0Ti9WYVM2RGhsY1pC?=
 =?utf-8?B?S0Y0RlBMdXdJTFl1WEpTK05ZdGRCWU1JaUxYQ3Z1NDl0cnBzTXpyUUNNU3JK?=
 =?utf-8?B?STRaY0hSRUljdUNhT05ueTh0cGpsaUlNc1BNc3pFMGZ4S0htcEw0VHpsa2lZ?=
 =?utf-8?B?UXFoRXF5eVJYSEpuSXhjNnhDOWZwaGhXWHRvQ2swYUIzNWJQdTg2QUVYeCsz?=
 =?utf-8?B?aTdkbEhld21IUEJjc0dQalpHdTZ2WUMxcjc4Q3ROOHhHUy9CRE1KQjkvQ3J0?=
 =?utf-8?B?V0dKaUVWR0ZHck82NDZDYjRtM1EwNDJHSmFvRGw3WmtVZ2hrVE41bHZoODFJ?=
 =?utf-8?B?bEJxRlZXV3VSS3ZDcGhYZS83VGlkM3ptL0ZmVC8zbmo5a0VIdENaZGJTaG9v?=
 =?utf-8?B?MUJuRlNSdTNEVGZHZ2tjbm0zQ1JLNzh5aEdSNkxCTGFzeGJIaE5IU1RmY2Rj?=
 =?utf-8?B?Y1FPNGlVcFRvUzhSaU9zeVY1eS9FYnp5YW1CK2ZRU2xWY2xNSVdmNktjWFov?=
 =?utf-8?B?QTZ5ZHFydmJOVDkraDFETHcrTnZQN241cDRKcmZETldHbldLbUx3SXBCcUtQ?=
 =?utf-8?B?YS9Wc0ZPWVFXRXZ1Q3Q5M0w3SHVRaktMVW1nMmVzR25MNUd5Y240YXVTekdI?=
 =?utf-8?B?YUM1V0FNWHR6ZHkvS0lxblRQKzY5WlFUck5OQnZzR3E1Qk1XbG9LaHc1NSta?=
 =?utf-8?B?WTI2MGdkclhWbjhaYW1yWm1MWXd5N2xQNDhDTExNazhSMFQrY3NKckg4bXJZ?=
 =?utf-8?B?a1A3R0E1ckdCV2VRNk80TExpaEdvMnRIL0kxWEx4dkJJWWhYYjJ1eWhGcTdt?=
 =?utf-8?B?Mk4zM2pYK3A2RlVxc2RabG8wN0FUd1BueS9wZVIvMEV4Z1hXWENDYTAyaFhH?=
 =?utf-8?B?MkpGVFU3akhHVnRNV2pLa2FKSzJLL1N4V2M2VWtud3h0SFNVUGcrazUvbVVl?=
 =?utf-8?B?VWZPTWN4NkdJRlJMYnhSTTJ5eDA5TjhxK3ozYzdrcEpBc3BpNnE5MC9FYjE1?=
 =?utf-8?Q?OC0c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 16:27:47.2608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4472cf9a-89bd-4c07-b152-08de3676b92c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357



On 02/12/2025 10:27, Oleksii Kurochko wrote:
> The vcpu_kick() declaration is duplicated across multiple
> architecture-specific event.h headers (ARM, x86, PPC).
> 
> Remove the redundant declarations and move vcpu_kick() into
> the common xen/include/xen/sched.h header.
> 
> Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
> as it is already provided in ppc/stubs.c.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


