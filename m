Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C797B2F5F1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 13:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088514.1446259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up3B9-0000ew-KB; Thu, 21 Aug 2025 11:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088514.1446259; Thu, 21 Aug 2025 11:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up3B9-0000dE-GO; Thu, 21 Aug 2025 11:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1088514;
 Thu, 21 Aug 2025 11:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9ZH=3B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1up3B8-0000d8-9e
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 11:09:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2413::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eb69eb1-7e7f-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 13:09:57 +0200 (CEST)
Received: from SA1P222CA0057.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::6)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 11:09:53 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:2c1:cafe::64) by SA1P222CA0057.outlook.office365.com
 (2603:10b6:806:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Thu,
 21 Aug 2025 11:09:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 11:09:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 06:09:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 21 Aug
 2025 04:09:51 -0700
Received: from [10.71.193.195] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Aug 2025 06:09:50 -0500
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
X-Inumbo-ID: 5eb69eb1-7e7f-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icQXv8ntOcTROFrFdJG0/0l8WfaiB+HrLUhFUX8JemhRfx53Z4lMsEoYit2waC/71tkV5/39LmVY+U9LcU1ZFmJehvI6StLf0lQvovGilnI6kH72c9hn4iLW25cazsRChxdHRFOi1696nu7f5PZ11IKcXN3JLvJgixF3gWVtdWDr7bqfzL6B4k0USk2G+9GcbZEywGMaqpxbLY2hqb+k5or2yRJTeq9Lbecotj5/dTFzkN7jlUWBciCG7IyIep7kqfsE5uF5hyUqthVaaBqX4OjxyNEp5jhVvArrQsR+MNsDFLras0X7es2XoyqUzY2FVs1X1l9VqZdy69NAL60zKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I28EE7g9cPtZfRGkYhQ1dPRFYGVidmmqIHlT9wK41bk=;
 b=NedUQa6fdM9f5gC6Get4ck7LzOijVw9mcUUNKY72s5BqaG0b+ochaqT3/n4JIGIzqb8ajNHcU89uzNsFQyt0rnGjJfvUhKgzDuVh8td+8KnzFD2Y+4R5i1W2YBTdl0mjgrgAqUl9fuIvRr+Av62Eb9akfVOYT6MitEaz9ksafOtlrbDJZUlI3qsKh7DjtbYc/6MhnQ483+DfD+3M4UB3UQiM51omU75cCEsaZfF9M7qwLYsurvWgweR4uAdZuoVdV1J5/dFCTLS0SgU58GYM9mqe9jFbOY59rdymuxsMKw4LPX9mDQpsLMIY6RHTqf8a7paoC3dcu5mBrnrA/nkCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I28EE7g9cPtZfRGkYhQ1dPRFYGVidmmqIHlT9wK41bk=;
 b=3NagO2tzforIb1mFKjgY3ExEKk2TlARMZf7tLseQ9hDWHNuyQ4W/Ijl3eiX9fUBU70KN4un2uQqflIsl4Hz/zxo1cX3xS3HpXUREfWqj8b45sIt4NZFtMJ1uFp3/fhAaT0lgw3Fk6ApldihlhE+AMQLOVYkdY1NPqotc5ogLkDo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4c2293b0-18a4-403d-88f9-47a3a0388a2d@amd.com>
Date: Thu, 21 Aug 2025 13:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm/mpu: Enable is_xen_heap_page and
 is_xen_heap_mfn for ARM_32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
 <20250814081959.3504145-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250814081959.3504145-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|DM6PR12MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: 9265893a-528c-4c66-e1b5-08dde0a340ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2lIOStvcW9VaHY2TnlZZjJqQ0lHVm4xOG5hSjZ1TVVGTlplOGpHQ25uc003?=
 =?utf-8?B?YXRxQld0S1c4NDh4b1YzbkhPY3VyMlNPenZvc3lWWWNkN2hnbjJwNXJWcWNv?=
 =?utf-8?B?dUl3VEFjdEtpRHNrL2F2dHhveW1DcEVxUzVHeFJPZEhqeFN3Qy9zaGw3eTl1?=
 =?utf-8?B?MU95dGlBb3hPQkt2ZjZFazI1S1NRb0ZONTdJQUFhcTFwdHlOUm9QTnRrazhq?=
 =?utf-8?B?MXZqcnRFZjFVcE1KeDdvT3dhaUFqOTEyeXlCVmpidHlFTTgvTEovLy9RTHpD?=
 =?utf-8?B?Z0JkbXZOQW0ya2c4cTlPZjNhT1Y2VzMvTXpZUE9oZ01OVHlmdXdpcjZQVEd1?=
 =?utf-8?B?NWtLaEdBa0RJRUFPREU2UHpUTmErUHo2SWZySmYvUnBwM2prVWF6Y0xsV1Vo?=
 =?utf-8?B?WmJQeXJlQnozUU56M3VPYkUreHhLVlg3YUF0Tk1rb1ZNeDdqa3ppN1phdmdK?=
 =?utf-8?B?RWdHNmVLOVNPVi8vVGFGazRiR092MFZJUHVhSGR0YkxzZDNRdjl6dmJCNDgw?=
 =?utf-8?B?VUVESGJBdFpabUxVV3poMzR0NTlxOHdkRUQ1Y1BlazBIQ1BkdWl3TzNPOFU3?=
 =?utf-8?B?b2JTb1BkVVJDWmY1MzVKcitGRUc3NS8xNTFqYXBFU0loMDVlRDVHUTZWUGdL?=
 =?utf-8?B?R0M4cUdaNXRrOFc2cmptRGtiakMwSTU1WlVRaGNJOTRzQWhxNm5aYWR4OHd2?=
 =?utf-8?B?MW4zdjh5U2IycW56d2YyR0NuVmNlRCt4b2N4Ymw0M3dDUk8vMGtZUU1Da0JS?=
 =?utf-8?B?WlVNR3ZWWEY0N0dwekd4RUxvci9PMDdpeG8wbTUvaU55bmZtdDJnUGtaejA0?=
 =?utf-8?B?TVdxdFpzTGwrNUJkcXdWNDJoSkFGempjeDRRRFBPa3ZhM1VjRnkrTzEvNFoy?=
 =?utf-8?B?WlFVbWw0RnIyVFFUM01LWTZlUmxXdGZ0TnV0MVZ3ODlZVGxrcHU0Q2JpakZX?=
 =?utf-8?B?K0pNZS9qTm5YZmtaMm9Mc2lxVmZGUFZ5YkhOc1ZLVk5FMjdLMTloZEJpZUxH?=
 =?utf-8?B?cGQ3ejJHeC85VWRHbWdOTFVsb3ZFNHR3aVZQN2E4amdnblVjUlRPSFFNZmxM?=
 =?utf-8?B?UWVnek9ETG5DYVkxRU9kU1dpMlRuN3BleDh0NnVCVnRqMnRFNjNiL2h6YzJv?=
 =?utf-8?B?cmJqT3NBcnFDNTlzNU1WNHB6QmFMVkl2aWdJbXluSzc3TjU2UEFTNlVrVUxP?=
 =?utf-8?B?SmlWbW5YUDA4VTN5djQ3T2J5SEN4U240eWcveGhobmtNSkx1aGF0MVBWdHhx?=
 =?utf-8?B?TlY2RmNVTW1jRXZoMXR0NnUwdCtKdWdDU3BmSTY3Q3dyU1F2TGx6ZjQ3Mlho?=
 =?utf-8?B?eGdyc0tmd2N6WDNQSlpmMWdHckJ2NHpIaVBYNnU0VEZLUU5DQVRmeWRlTGx4?=
 =?utf-8?B?UzdWYnBiZUVlWFAxbzdmTUMwNmdmU1I5UXZzTW4vMVhSU1NMdU5KclBYbHdh?=
 =?utf-8?B?a3A2VElHRmh3NDJINk05clFPVHhhdnluTjZObnoxT0VQT3JtR0pNcjFHSGw5?=
 =?utf-8?B?ZTBzVXJpUHFubkFsUEJPcFZHTUw2QlphTWV2eHhJN3M4OE1Xck1YWkY0YjJF?=
 =?utf-8?B?RWpzT1h2UzZjeElKV2ZrcE5peFA3US9HT3MxS1I2aVRkbmNMTmZsT0pYa3l1?=
 =?utf-8?B?TC93YktHbjlSUGdlZ1dKZjVaUksrSzl3WW9yOVZMa3owdlBBeEZieFU3SUZB?=
 =?utf-8?B?UGlhalJUTmhReCtDeXpWM2RBSDVsRW9Nam11U2NwUHpwMG9zYTcyYW5vTDN6?=
 =?utf-8?B?NldLQi9MMURnMnlkbVNhYVVlK3ZJQ3N4UndxTnpuTDI3cmc4Z2MzKzZET0Mz?=
 =?utf-8?B?bWlzTFhKdC90VUc3T0lPblRnK3JmemFRdEJYYThZUWFPbllpYWNpVE83UjVl?=
 =?utf-8?B?ZGJ5dnEzRm9lazNkMldzVjg2Z1dTQmRQeHdWYjF2dDVsM1REeS9xQ3VQd0hQ?=
 =?utf-8?B?TUIzbXdCMGludjIrMGN1UFpzUW1ERHhCcHVOK0dyS3AxcHBBWkFnUWM0TWF6?=
 =?utf-8?B?ZEZqbURUVDVUL1dCY3Bkakdaa1J0WjFXakpoZHdrTmRyb21lbXFuaXZObzB4?=
 =?utf-8?Q?Z2GqJF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 11:09:52.9233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9265893a-528c-4c66-e1b5-08dde0a340ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137



On 14/08/2025 10:19, Ayan Kumar Halder wrote:
> In case of ARM_32, all of the RAM will be covered by a permanent contiguous
> mapping (where VA == PA) and there will be a single heap. Thus, the memory
> allocated from Xen heap uses PGC_xen_heap.
> This is similar to the scenario described for
> "CONFIG_SEPARATE_XENHEAP=n W/ DIRECT MAP OF ALL RAM" in common/page_alloc.c.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


