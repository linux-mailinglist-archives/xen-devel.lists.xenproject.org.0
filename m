Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE3CBE327
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187044.1508467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9Gx-0001ue-HR; Mon, 15 Dec 2025 14:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187044.1508467; Mon, 15 Dec 2025 14:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9Gx-0001tD-Ee; Mon, 15 Dec 2025 14:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1187044;
 Mon, 15 Dec 2025 14:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pjwr=6V=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vV9Gw-0001t7-Ca
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:09:58 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb7ca1b2-d9bf-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 15:09:56 +0100 (CET)
Received: from BN1PR13CA0004.namprd13.prod.outlook.com (2603:10b6:408:e2::9)
 by MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:09:50 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:e2:cafe::58) by BN1PR13CA0004.outlook.office365.com
 (2603:10b6:408:e2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Mon,
 15 Dec 2025 14:09:39 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 14:09:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 08:09:49 -0600
Received: from [172.24.22.120] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 06:09:48 -0800
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
X-Inumbo-ID: bb7ca1b2-d9bf-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRVdAHsnFuOPy5DZKpGyPLpLXmLfd2GC0iENr9Utj2K1guss+X+7t75KxvDvqp2hXcn16tgy5rAENRteK9+dbE8QvJPig18mQrTrsRMAUy0pGe6VvHMGEZWwQZonDLI/0KnXQNVP2Bg/i0HydqUi0Cz8WrYDTPGRl0SU1tZVTifFVq/bd17wb3TEbMQlU/7+AWwhjR55Wrf+rTuE53+soWpKiHhwDzlU+JHODUq3X80cgpEqOVg5IxeyBgWBhtNk7L+gDDOXS0/8JvxVp4AOMCyh5D01rP4+I612Q3Ga93aQhnL2Zm1uNOKnwhjESq8F/hEMdHGd+EsdK3AAlBXOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5Ngp4Cw/KVUFwKUdgTxgebpD/pZuZwpDbwRoLX/T8c=;
 b=qOKvbrlojbGOeqz7GfQaqHtVJiyzKV1siHONy3Tb8f9Mp1sW9sa5H5P/e1Gtd/7rKVcu5TpA/7CMl1aOqemULTma241QNW6lAfmGVmuL28LvZDcYRBFPoH4rEfVQKL1lB+a4JX8EyQZWjlHkehQlZyvBPpHdqbctZ/IminNW97HaAwQvkOLnCNlTCej9ka6DEw388TfeMrYchYzK6klx/wtaRg8yvasE+nN7c98iLQjsyODEmt/v7y+TCcpojTboAoTqJJmQg1zpag/alzU+F1UIWiISEoDIHwQ5KXxlMU3SYdLwMnbg0XJpV8FDivGII5nsD9Lla1EaCQ0nbQT7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5Ngp4Cw/KVUFwKUdgTxgebpD/pZuZwpDbwRoLX/T8c=;
 b=d2O3DS1E6Njo6M7BfgFIhJFfskOiajkKibIfjLG2e8UPgKQ0Silxujaw+HkzkKMRkrpHXhmBayQvfyZx6vrhumVsUXuWEF8Ur9AKF2aj8MvOOC0FKvqSa2pjzQdUIcJ7hHIJrTiEzgmJtpdgFUlZk+EvQFki60XjlIVPe5n5fm0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fee2760b-e49b-4025-9e97-040de2b28372@amd.com>
Date: Mon, 15 Dec 2025 09:09:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Pass TPM ACPI table to PVH dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
	"krystian.hebel@3mdeb.com" <krystian.hebel@3mdeb.com>, Sergii Dmytruk
	<sergii.dmytruk@3mdeb.com>, Ross Philipson <ross.philipson@oracle.com>
References: <20251212222949.626539-1-jason.andryuk@amd.com>
 <4c548455-ea55-430d-9fe7-6a6cf21eec38@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4c548455-ea55-430d-9fe7-6a6cf21eec38@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|MW6PR12MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 008976ca-a902-4ee7-d397-08de3be39c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VStzaGN0VEJuUTZicm1LNk1tYXBBSFU5dFRLUDZ0dG44VWM1WitTZHVLRkdU?=
 =?utf-8?B?d01nU2lmdVJnUGdXVmJXcVp1UStGeGxOUEw1dHBTOEVWd0s3OHZFNVU4Q0xU?=
 =?utf-8?B?N05RQ3Q3Yy84WDhldzNrb2ZCcG1tOU5iVk1RN1g3VjV0bTFiS1FyUXFTMWU2?=
 =?utf-8?B?NHhzUndGU2cvQ2Z6RVZSaVN0TnlsNVRRb1FRMWxSMWExWjNaQkxpWnI5ZHpn?=
 =?utf-8?B?b2FEdVRlUThBVWdJOWI4NkVRSW9YU2JhOCtWTlJqdTIyb014QWRyQy84UEdr?=
 =?utf-8?B?a2E1Q1NLZ29wS2t0U2Q4RS9Ebk4yVEV6WjdNaks4ZHp0LzhMMGxMaS9ZZ1Zv?=
 =?utf-8?B?NGlkSVRZUkRWMEZYVXNQYjd3WXUydlo3VitwNUJLbENlTzV1SmRCRXNKc0h5?=
 =?utf-8?B?YUt3RkxRc2J1UGZhMDUzWEFCdURqZWJCZGdjVzFkbEF0NjFlRmJCRGVVejha?=
 =?utf-8?B?SFZ2dXB5ZWpXUnpGSGtDakdqZWJPV01NbUFTdDYvTGJQaDlTemxjWVd5cHVs?=
 =?utf-8?B?K3Z1cDQ4QTdaNEJCR0hZNnZOK29ReU9Iblg3MitWVjlQU0lZaVVvVEt0SkRw?=
 =?utf-8?B?NHE3Ukg5ODRXcEMxVkYzNmJDWEJNRUhBcHlnN2k3OHpjckRiYWFiWXY4WE9n?=
 =?utf-8?B?YXdzd25sR3pteDdQZ1Bud3BURWxSRkNwczBkcXBwUXpPUHBEbnFsN29WR3lY?=
 =?utf-8?B?ZmozRStFV3dmckF3VE9wRWU3cEdDQWpzSEM5b0JQRDFjbUxHUm8vblNGNUZS?=
 =?utf-8?B?aUpONnhSOHFoREFpNW9pNFdEcFpYeFhYMHB3NlNGeUJLVW9NTjNvd0p6bVJp?=
 =?utf-8?B?d3QxZU1ITk9WQ2ovWU5hVDUzaFNsUVdxR29pYWd2NDNKQ05MdnI0M205ME9N?=
 =?utf-8?B?QzUwM3MvdXVUQnVIcE5PSFBVUWFiYmQwTmM4eG1JanRpa3BLTGwvQ1QxK2w4?=
 =?utf-8?B?MUxwUzVaN1N1blVLb0Vsa1NPOWZhSWlUdUdLZFdZS1MrWVp5WWhRN2pWZm9Z?=
 =?utf-8?B?dmFhd0FCVkVrN1kxTXFQMDBvZEhWMW1NSXRNbGUxL3E2ekdwOG80QzVzdlQv?=
 =?utf-8?B?NUdvTHJoSGpOYzFPTlplUEpKMlM3cmxJV0ZvOVArKytJOVRxRkhXenRIMndr?=
 =?utf-8?B?Z0Jxd0JFZFhDQzU4a1hGQThsTGVqM1VySERXZTRzb1RPb0RCblRpeVNUK01V?=
 =?utf-8?B?ajlacFNXQ0o1TXl2ZWhSQ1pTTCtrbFhIRUtTaXZkK0s4dnorWXFhdmlzMHRF?=
 =?utf-8?B?NlhsZDlzMWNxeG9palBjbTdCM0FOdUMxcFFLSmdPN3VLNUJxNENuSzN5d3RQ?=
 =?utf-8?B?b3NWUjFtZVh6WEszK1M4UTF3MXh2L3BlVGhvZVlPb0YvVXoxVU5uRGV6SndN?=
 =?utf-8?B?OWxoOCt2dEcwVjA2MVJBM3pjWDl4dHZ4SUY3UUpmU0E3U2NkaEYySXFMWnpm?=
 =?utf-8?B?OGVGcWpsSHQrLzNpY1JXcnRGQlhCUnhIdjFFS2R3NFhuL3lSM1E3SXVUS2Fx?=
 =?utf-8?B?VVVOTTJsaVJOeThwMEJoSXE5WXR4TDBKTVlycXZINXlCSzMrVENON1UwN3RH?=
 =?utf-8?B?NDFkM1l6Z3lkUUpFajhMajdtZGZJUEpZTXpicGlOZzUrdDFYOHNVcnNDWWxl?=
 =?utf-8?B?bXhIWkhEV2hNM3VaYlMvQWZ4TlI1NXl3WmhadVkyd3BuZG96MGpLQ0hMK1VD?=
 =?utf-8?B?WDlvOE85YzIzRXlsNFBCVTBFYmRMa3ZJYzFhbHg3MHNldm1IUDF6Q3lHVlVL?=
 =?utf-8?B?cHBXbGtMRHFHRTk1b055bUVQbWw5Z2EvTUVYR3dacEVqNExIRDloYVk1eCsr?=
 =?utf-8?B?VmJGblM3dnFKaktVV0RpWEkxVHhhclhmMEU3eVFQTU84K092Wk40RWtYdUs3?=
 =?utf-8?B?TXNPS3pIeWhFamFLbFVwMFBGeFFJRW9ZaTFLNnpjNXNYckp3YkZ6MmVaR0U3?=
 =?utf-8?B?dW9DYVp3aitPUWl5UzhtM3hvUWVKZm1QUVJzZk92eXBVdGVXZE9rZWgrVFBC?=
 =?utf-8?B?K3EyR0dkRWo4WE5Va2lXSGhYdjlpQkNlYzZDY01JVTVGOGhKQndrbE8wWExQ?=
 =?utf-8?B?UEJhN01DMTN1YmpqQmt4UGJLa0hTYTU1YWNDZWRZcURqWWI3OC9YOUFsOHZR?=
 =?utf-8?Q?eO2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:09:50.0815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 008976ca-a902-4ee7-d397-08de3be39c6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8663

On 2025-12-12 17:38, Andrew Cooper wrote:
> On 12/12/2025 10:29 pm, Jason Andryuk wrote:
>> Pass the TPM2 ACPI table so that the device can be found by a PVH dom0.
>>
>> Otherwise dom0 shows:
>> tpm_tis MSFT0101:00: [Firmware Bug]: failed to get TPM2 ACPI table
>> tpm_tis MSFT0101:00: probe with driver tpm_tis failed with error -22
>>
>> TCPA is "Trusted Computing Platform Alliance table", but it is really
>> the table for a TPM 1.2.  Use that as the comment as it's more
>> identifiable for readers.
>>
>> While doing this, move ACPI_SIG_WPBT to alpabetize the entries.
> 
> It's probably worth stating that this brings PVH dom0 more in line with
> PV dom0.

"This exposes TPM event log tables on PVH dom0, bring it in line with a 
PV dom0."

>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks!

>> ---
>> Only TPM2 has been tested.
>>
>> AIUI, a TPM 1.2 is probed without the ACPI entry, so it is usable.
>> But since I know the table exists, I added it.
> 
> Yeah - I'd have asked you to do this if you hadn't already.
> 
> That said, it highlights that the Trenchboot series needs to grow the
> ability to hide the TPM from dom0, both the APCI tables and blind probing.
> 
> I presume that tboot already does this, because I'm sure it's been
> tested, right...?

Tested which way?  This has *not* been tested with tboot, but I think 
it's orthogonal.

After tboot launches Xen, tboot is dormant until Xen calls back into 
tboot for shutdown.  Control of the TPM passes to Xen/Dom0.  This is 
expected with DRTM and TPMs.  The TPM locality differentiates TPM 
accesses inside and outside the measured launch environment.

The TPM ACPI table specifies the location of the TPM Event Log - a 
reserved RAM region.  There are other ACPI PNP devices to specify the 
TPM device itself.  Those are in DSDT or SSDT (I think), so distinct 
from the event log table - the subject of this patch.

Regards,
Jason

