Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD6D9B0690
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 17:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.826069.1240418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Ln7-0005rq-BT; Fri, 25 Oct 2024 14:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826069.1240418; Fri, 25 Oct 2024 14:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Ln7-0005pt-7i; Fri, 25 Oct 2024 14:59:53 +0000
Received: by outflank-mailman (input) for mailman id 826069;
 Fri, 25 Oct 2024 14:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jrJ=RV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t4Ln6-0005pn-4K
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 14:59:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c80a682f-92e1-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 16:59:50 +0200 (CEST)
Received: from SA1P222CA0034.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::7)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 14:59:45 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::1b) by SA1P222CA0034.outlook.office365.com
 (2603:10b6:806:2d0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Fri, 25 Oct 2024 14:59:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 14:59:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 09:59:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 09:59:44 -0500
Received: from [172.26.85.121] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Oct 2024 09:59:44 -0500
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
X-Inumbo-ID: c80a682f-92e1-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc9AMZswKC/0xI4DYbxpyfV+CrCy3YA6bH8/q/+tA0i4IITqtPVyfSOL8EIyBAopbuFxQBMFy2/AdVcFY82DHslI6P22j8cWYoQkxI9WMRTkWUwGkSfEUA9A67DmX1GrpzNTGNNvE1cC8f6G4aA9v0WoB8Vr5yR6s+HnZWY+E9nq7IxalBo+yhLiSBQAl2JH4Kca0dM/570J1FVjhVE5eLu6JY8lN+JfYihtLqFnRoFE/tFZmSZKAOgCglZ1aySYHiiGigaYVCQZQY1JCib8yjbMXzdQD9SIofd/5N4gLb7DSYbTcg186XeFKIMTF1+PtCsr21OA/O81UfidPP3MuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkW7RjpfxX5d8OG22TtQWMmPxassFPu4FefwylxsMwg=;
 b=G8u15mZ3O/HOeACab/YG0hjyifIOQzoBr/Xg49AsETeDoZeGc4L8SvBJ0C7dYSY34z5yITaB4GUMZf8yARRuSZKSobpoPtvisyd5M4y62x3IaxN90R3LHds+JM5C67Po204fisSpUBIG1OTJHPrDrEiUd2NtXO1RwxOWFKS5DLOA8TKAV003WTPl5S6TY+zTrn9CAi3RhqgmxPYi6K1p/AvIEb55gsZfRIU/AOrOxFs5dxHQXjrNuvceROsOlVcyJamqsTshPhZBgKo8iTynTCw+lCGqujafX3MRd4hPVDNypN4Iy+Dg6XLgauSPmMtOEV4U05hI5WhTWybpaf4R0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkW7RjpfxX5d8OG22TtQWMmPxassFPu4FefwylxsMwg=;
 b=mTNZ//3jRyjuh8Oj4dsqN2jqUJc1tHiBS++gRYdDwOwtGVCAKTvJ/Db9wI4yWGU9sOpJCNl+h1vhdQCLpoVM6JrwJ39rCrWy9MfRQRDkbZaa6nkq+aMBqVnulXeinWNOq5DtwWsEHOjg6F3CS8AYs8FEehRtKPmtWZQ8NQ1EcAE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <48cb921f-8079-42c3-8e4f-244482f500e6@amd.com>
Date: Fri, 25 Oct 2024 10:59:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/ucode: Drop the parse_blob() wrapper
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
 <20241024132205.987042-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241024132205.987042-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: c11fd50d-e0ab-4237-b971-08dcf505a9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3hVM2pVZDV4aUZybDFjL3AwNGZGQlVJNGZtbk02WFMxMVo3YXUyZDV6WTJl?=
 =?utf-8?B?azF5bFJKazVHNVYwL2JlSVRkUTIxeW12elJmaEpaYnBwR05BK2ZqSzFHR1BR?=
 =?utf-8?B?WUpiU3lBVURuMG5rY3BrTGpoWk81OFRiZktKdk5rdjQwMkNUTjJ4Ky9ZWXo3?=
 =?utf-8?B?elVIWWxUL1Jvd3h4UHBQa1pVeEZDSUkxUG5Md0lneHJuNUVwRkh3SE04R1E5?=
 =?utf-8?B?R1RuS2ZHTXNGWXZQa2YzU3NyQ0I2WWtHNkFudTljcnZhYStKK1IwTzZWdHJu?=
 =?utf-8?B?QSsybWIwbnZaSnZaUEkzTGdNN1diWlVocmo0MzU5a3VyeFFuc2FvaHpxS0t6?=
 =?utf-8?B?U1RRSlUyTlU0eGxvYmZEK1NZWnZqZXZUQ05hQ250Y0V1TC9hT1FTVHBUL0FW?=
 =?utf-8?B?TExYcXp4TlJqWnFxU25sb2lRNXNlMzhzcEwyWmJyN2EwLzhCcFFoNTZ6QUdo?=
 =?utf-8?B?ZE8zdHBuRzVPUXFhRXYxWktKUnZ1OEpweXowQ1k4WEVBSXlNMVFVZzZlSlNJ?=
 =?utf-8?B?em9JbFlZRjZmWXpHbXhTQkhheXBhTXR0TDM2QmxTVUJxOUdtZ04vekUxSHo1?=
 =?utf-8?B?aUM3KzdKYUZqYnN4dzZnVVdFRko3ZTJGQzlGYWgxS1F5Z29KSUNJdEJEY3U0?=
 =?utf-8?B?M3BxeGhQUHc2SVo5WjkrMkNhWGt1a1U2SWdnYU8razF4Wk1ieWtEeWhZNWFN?=
 =?utf-8?B?dkRVcmlWNkNKblNCVXhhaGhVOHFZTE10a0ZvYXUxZzRzUkdNTTI5U3pjazFC?=
 =?utf-8?B?eWlVNXBlUUtPdkdqdDl5ckdrZTFrRjZENHBsdnZRZUFNS1VqOFNhZDFocS9i?=
 =?utf-8?B?TUI5ZTYvMDArOXBKTTJQeWlCS3U0dkdhUGUreHNZRWR0VDk5T0hUdm9HQTFh?=
 =?utf-8?B?dktESVBnbDV6VHk4OFFTblAyekMya3g3VTkvdVk1NFU5T0xZeVhVbEtJV3V0?=
 =?utf-8?B?bmdhOFhMY2xBUFREUXFvZkxjbVBLejk2Z1hhZ1pUVXNidU1vZ08xVU53Zk1t?=
 =?utf-8?B?TkZoS3NrNDBxbnhQNUtZd251bUtuWFdPelowTWozTDNLb1htV0tmWGV5dWdG?=
 =?utf-8?B?dTNWYzZVcGFQeEVpZGlZcENtS1pwdVQ5dVFSdjVQOE1NVndCeTRla2Y1UGkv?=
 =?utf-8?B?cEFzdHNmTnFuU1dlcytBSUdrMzdZUU1qcllzL0FBT2VlVDlrZGtmK1BYUTF3?=
 =?utf-8?B?RnZEd3BZUXRzejI0dThuYVpIcHY2aWtHVkptZFM4VHdVMEJOVGpVaUQ1K3NO?=
 =?utf-8?B?S00vMlQ1bFlpZWxGdEM0OGk5bTRsN0d2OFE1SGZMcEZDWEFQZ0pWbk1JeUZF?=
 =?utf-8?B?WEpOV0xvWVZRYXFEbDRFM08xcW5IMmhUT2QvSzhKNmNVUmhYVnEwODNYNTRG?=
 =?utf-8?B?bjc5Wjh4RGQ5djhXNzB5R3dtOWRwcXNGbHhZL1BKck1RN3dEamVMaGZocEln?=
 =?utf-8?B?clRPc0NVV2RpWS9RaWVZWllHOTNoWEIvMmVRUGlDQWxxeFJmcmVVWkxPUEdQ?=
 =?utf-8?B?V2VuUmZ0SnUrWmgvMkpaa1kyREZxVFhycVhTN2t6bXlPOW9SWEplbFBjRG9Z?=
 =?utf-8?B?dlIwdzc3VmNpRndKL0hQZlE0UXJZVDI4V1VGSWpPN2NSd2gxVHFwSkdQY29O?=
 =?utf-8?B?NWFRMVJKWExpNkpCM3V6TmhJdW81VXZGY1ZvZ3dybm1md2hYMDh1eFNtdndC?=
 =?utf-8?B?TlFFSWRqMTNnVFU2TnpiRjdrbWdJYXpDUWwzSVRJVC8rcFdMdHZRL3ZUaVps?=
 =?utf-8?B?b2xlNUpHZHRwNXJhakpRMWg0bkRxL3N4TWZyVi9Dc3JXVFRJc1d4Y1RPaWp2?=
 =?utf-8?B?cmJkL0poQjdxRGxvaHp2enZGR2tCRzdiQTNhQUNoSXdRbUlIMUU3eVc1T2lW?=
 =?utf-8?B?cmRrUzJrNWZVVkpZM3RVWHJWeEtza2htTHNkRm9uVDd2b3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:59:44.9625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c11fd50d-e0ab-4237-b971-08dcf505a9b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751

On 2024-10-24 09:22, Andrew Cooper wrote:
> This separates the collect_cpu_info() and cpu_request_microcode() calls for
> later cleanup, and frees up the name to be reused a little differently.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

