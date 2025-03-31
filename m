Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F553A7704F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933046.1335119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMxn-0000Mz-VC; Mon, 31 Mar 2025 21:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933046.1335119; Mon, 31 Mar 2025 21:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMxn-0000LJ-SD; Mon, 31 Mar 2025 21:46:35 +0000
Received: by outflank-mailman (input) for mailman id 933046;
 Mon, 31 Mar 2025 21:46:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzMxm-0008WJ-R4
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:46:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b33cf38-0e79-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 23:46:32 +0200 (CEST)
Received: from MN2PR18CA0008.namprd18.prod.outlook.com (2603:10b6:208:23c::13)
 by SN7PR12MB7105.namprd12.prod.outlook.com (2603:10b6:806:2a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 21:46:26 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::ec) by MN2PR18CA0008.outlook.office365.com
 (2603:10b6:208:23c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Mon,
 31 Mar 2025 21:46:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 21:46:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:46:25 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 16:46:25 -0500
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
X-Inumbo-ID: 9b33cf38-0e79-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baItxbg5OGF01UI4otwk0TX3ekCdYxnO6k2q6oR4TP2G70rYAlvevtqPsDec3vl/7J+UOrBUXhwBCHXytg8PvlkCODRYqxlHpna1To9fyuBB6WSDdBYdEnGnBbnTIYMP2Kx+I/pxelp0ShDDGinBnVNeLzrp6jFDLh8pZAB0l85l/XmpFEyvh5CCmZ2+HlITmrBE1UjAd4sbQLhUpxqjwkURClWVnsCgQ5eIB9WW2QOZV9CDZncQAXfEJeCgPwy2NqhHeV9Zb+iNk1sWkC3cyyHKma0M97cAi6xp0REvmJ/h9B/q3/LLlc7oHbLtqW6+z95i+m21WfXd4J2yfwVb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Tvm67qEyl7UzdfTkywajKn7OYP+cZgunlRR4104i8g=;
 b=e6SCt+KABKntLblnSg99VLXPqzvpjvTMnIp6H+qX3Bgj9TcIjl+0yYD2v1bFO0q9QbBv41MBstiAQdz2DI1/UQHkVZDVpkUF2hMQ71liJuT4fA8P1clgwgsira54Y3k/YwEHY27GhJEv/IyLzr9n2g+8saWFHlhlcBm6ch4OooA5EGx+99sB9c+41kUDmAnn4ao7pmiX1zrC7LE4u45rbVlefH+j+UCHaMClrRYYTNJ4xDCdLa0RQmtiGifFqFGlCEh/kUdLxnalaSnz0RfPa4VpW1xdI2tufLQ2ixr6wTz0mXZmmJ3Z3KjBBhocyiHSkmmHiQghmRbUfZV8J41MwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Tvm67qEyl7UzdfTkywajKn7OYP+cZgunlRR4104i8g=;
 b=O1DsZquqfe/nyrfMFpTllsS8q8c53WitaEVPgXORChT1DvB2VRvGAMNn1b5S3k6pJH17kF0ikKwck/xnS0qzgqJ+N0qHim6fSS8SFxsfBwLT0XyCZOcJk0AhpPDNN3UtJxA7RptDwHyT0nJFttVgphh0rrJXNtFf23UB/OeAy94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0dd25ebd-34f2-4391-aa08-3d873ec72347@amd.com>
Date: Mon, 31 Mar 2025 17:46:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Domain IDs and Capabilities
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SN7PR12MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a3b136-69d4-43a8-ce99-08dd709d7c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|34020700016|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUNwMW5GVnkzMFd3T0ZPOGNSbHZGSDZ6eUFBVnZabkhTRU51RStSQnFCNXRP?=
 =?utf-8?B?bjVDdTJnYmczQTBubmNqZkJiQWFJNEFaVHhsajVGUXl5QnNBdXBYVGc0OUlT?=
 =?utf-8?B?dkI4eEdmdG55Z3B3RzJ0a2pPaEZISUcrRENtTWlRR3RFeVk2WDAzcjlvVXow?=
 =?utf-8?B?cDcvd09pZDZsdW9nTmFWNVZrdVRGNzlpbldXKzFORGMrYWtSaXBoK3pPTi8w?=
 =?utf-8?B?QnRMdnhWSHFmQ2Zad1RlWmV6NEhsZ0owaVBvYUxLeXpnY1R2RHByK2UyNHpy?=
 =?utf-8?B?d0t0eXRhbDU1cGpJbnBac1B0dHJjbzJaZE1uZjNkSlVoQ29OWGZoKzdTSkhw?=
 =?utf-8?B?eEd4OVJUNDJCN1Y1QXZvaGhRYThvSFhjUmpIL0xqR3RtYlFDMFBlb1A3WmQw?=
 =?utf-8?B?OGhieStjMjAwWFplc2hxREVlRjNva25tRnpyVkZNanNKZTFuemhmNkRYRVI5?=
 =?utf-8?B?VnlxWGgvVW93WlFaQjlzYlJwL1dzVEFJeFdlZWcvSWlsYWpHWlRMZmFLdVQr?=
 =?utf-8?B?RWtlblloMTZGSVdpa3VOb2RGdXhXaUtMVHBMUVhDVllHSGhZN2lac3Y2VDV5?=
 =?utf-8?B?TFBwbVJ0Nm1yQzZWd3ZXdkd5UitRanFrcTB4dWhiV090eVBGVUd6Yk1zNWx2?=
 =?utf-8?B?RFdBOW9OOXpPUi9rNjlrWXdiaEhueUFPQ25NZWF4K1BmK29mZE9vVzRFK3RG?=
 =?utf-8?B?YnZhS08wbGZUaTF5Z1VZZ3lYU3BvL05lZHNPNlplZkpXdzREWjFGcmhRUHUz?=
 =?utf-8?B?TUZvL1hXVHdwTUt6T0dCMUFINkgxSEt3UkZEbkF0cHNLSUpxWGdwZnFzdEp3?=
 =?utf-8?B?YzRqckhDdXd2RWpRaWNBSm90cUdWNjdRWGR4V0RIVkZucmhjZWxhZks0NzIr?=
 =?utf-8?B?QzdnVkg2TFNBOGpTOUpyUUFtd1E4SWs1MW0xejhFY3hJRUM5VWJZOEIrSHky?=
 =?utf-8?B?WUZqZXRRenUxZExuSlpiTDZEd29rUGphQzhIQ1ZLN3Y2T2Q0RHlSa0oxRFdF?=
 =?utf-8?B?NFAxTWlCSWY1c09JSUhRdEh0bFhtdmphdXNWVGpsbEdJYkN6dWtoYThhcGpp?=
 =?utf-8?B?eGdUNzlYUjNOamtTOFdBYm1RbkFLK2xOZERDN2M4YzFUcVVFSXNUOVVSOUQx?=
 =?utf-8?B?QUQySUZTQUlYWnlITkl3ZnhWWVlyRnhVVDE5cmhrWWRpWk5tWllna21JYnZp?=
 =?utf-8?B?aGovS0RsSXVuajN2MUZncVNiL29aUjMwRmZiQ1hKUXRLQlZ0STNyZVF1M0xp?=
 =?utf-8?B?WU54dFh3Y3NZTVo5dTV4V3d6blZQRjRzK0VCUFVVaGJiV2tKcnJwbDJwY2xC?=
 =?utf-8?B?STdzMHljbEtMZ1NMOUxJM2xXTGRFQ0NMSnk1Ti9FZVMvSnRaZ3l5MTE1SFdt?=
 =?utf-8?B?V0E4bE5jWUVKNDlmUUhLVlZhOTRrcks3R2FhYzZMdHdTK0hwdWswUDFoNE51?=
 =?utf-8?B?UWhOYWJvdWxLMGxETXp5cm1TZXRHOVk5SXVDN01YSWdNN2pPSW81ZHN1TkV2?=
 =?utf-8?B?RVJJQUtpUDBodDE2dGhTNHVFUkczSVFGV2NzZzRvR3hIc0I2aDFFNVM2WWFE?=
 =?utf-8?B?OTBObmpOT1R4bjlRckUwRlU4OFZBNXN1amxOalZLT0dTRC9ram5nR1p2SlNS?=
 =?utf-8?B?anNhVkM2a00wekJSeFQvREltWFFkc0VIR0NaY2FFK3J3TGtUSG05eGlLN3NZ?=
 =?utf-8?B?MllYbDBTbXErYzJVWnJyS2hIcVhrVGFZc0VLb3B4dFJEanhWT1NuV1IzVnls?=
 =?utf-8?B?c2FRSTJWOFJxV3R6MStlUWFDVlBTR2YybHk3UHUxNW9TdWRHNVJIRjlETENC?=
 =?utf-8?B?WTdPb2NVWElyUURCUHRpRnFMRXVHMU9JbW9HaFRzeWx5VUFkSmZ2YXNicFRK?=
 =?utf-8?B?Rk1IeTRGRTBDN3lObThQUE1kVGtqRnprbVpGTWZhTEtyY3BNSVJ6ckU0U3h4?=
 =?utf-8?B?eGJTWUlNdFJOMmFjTlNSWEd5R0M4L2RQNEZLeC9OYUtqMytqMHZWU2dmekRs?=
 =?utf-8?Q?HPcGdlLw7twHfvufReYszXuwJ59TlA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(34020700016)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:46:25.7486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a3b136-69d4-43a8-ce99-08dd709d7c85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7105

Hi,

I'm finding it necessary to expose a domain's domid and capabilities to 
the domain itself.

On x86, SIF_privileged and SIF_hardware allow a domain to know its 
privileges through start_info.  ARM does not have start_info, and 
xenstore domain status is not exposed.

Xen sets XENFEAT_dom0 for is_hardware_domain(), and then ARM Linux 
creates local xen_start_flags with both SIF_PRIVILEGED (control) and 
SIF_INITDOMAIN (hardware) set.  This is inaccurate with a split hardware 
and control domains.

(This looks like a mis-use of XENFEAT_dom0.  It's present in ELF Notes 
seems more like a flag for a binary to indicate to Xen's ELF loader that 
it is capable of running as dom0.)

xen_start_flags influences Linux kernel behavior and userspace. 
/proc/xen/capabilities control_d is only set for SIF_INITDOMAIN. 
Similarly, the /proc/xen/xsd_{kva,port} keys needed to run xenstored 
locally depend on xen_initial_domain(), which can be incorrect.

It is useful for a domain to know its own domid.  Xenstored has command 
line flags to set --master-domid (the local domid) and --priv-domid, but 
it would be better to autodetect those.  Also, domids are necessary to 
set xenstore permissions - DOMID_SELF is not supported today.

Juergen already implemented a get_domid() function for Mini-OS for a 
xenstore stubdom to query its own domid indirectly through event channel 
games.  That can be re-imlemented in Linux userspace, but it needs the 
unstable xenctrl library to query event channel status.

x86 HVM exposes the domid through a CPUID leaf, so it isn't actually hidden.

Should I add a hypercall to query a domid?  An alternative, for ARM at 
least, is to expose the domid and capabilities in the domain's DT in 
/hypervisor/domid and /hypervisor/caps.  I've tried this out as just 
dumping the domid and caps as uint32_ts.

Reviewing 
https://lore.kernel.org/xen-devel/20231110113435.22609-1-jgross@suse.com/ 
it seems like both a hypercall and an arch specific means might be possible.

XENFEAT could be extended to exposed finer grain capabilities: 
XENFEAT_{control,hwdom,xenstore}.  This is easy.  Seems a little bit 
like a mis-use of XENFEAT to me, but it works.

If generally exposing domids is not desirable, they could be exposed 
only to domains with capabilities since those are not migratable, AFAICT.

I'm open to suggestions.

Regards,
Jason

