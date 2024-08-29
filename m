Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17A5964B19
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 18:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786001.1195571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjhhX-0001DQ-76; Thu, 29 Aug 2024 16:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786001.1195571; Thu, 29 Aug 2024 16:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjhhX-0001Bu-41; Thu, 29 Aug 2024 16:08:47 +0000
Received: by outflank-mailman (input) for mailman id 786001;
 Thu, 29 Aug 2024 16:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMn0=P4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sjhhV-0001Bo-T8
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 16:08:45 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2418::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f647b2b7-6620-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 18:08:44 +0200 (CEST)
Received: from PH7PR02CA0024.namprd02.prod.outlook.com (2603:10b6:510:33d::10)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 16:08:40 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:510:33d:cafe::d4) by PH7PR02CA0024.outlook.office365.com
 (2603:10b6:510:33d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Thu, 29 Aug 2024 16:08:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 16:08:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 11:08:37 -0500
Received: from [172.20.38.216] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 29 Aug 2024 11:08:37 -0500
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
X-Inumbo-ID: f647b2b7-6620-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIEuZ2o3H9InWViKC3ZFVXj5Rbolb5ukckhy9QCE+5un/NsnUj/HF+GfGHUROL7a24HfO7OFJugeYagQXyvKYi5mRFvPLJtIHAUL2Rb5ojfJk7NjOXPY0pwFqEC6FQANv5I357U824LYTdn2yWQm4Q1Zl7dog7E5W4kYiGrCG/jbdktKBStZKqAQgh61pykxZ0NoPZkju5/vZ3lGRCskakcqH5w6J3Pe2Q8R+kHrxdcVo5W1vFIQOBv4EsfBqE0FGZdZUH0DTVCOX8Mw24aK0zsG0kSYgtAXORjt4yOuGxDm5OP/Kg6aYzTJOXuLU4+2KP5LFFdt3gI4XEtq67IseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/4PyCj6qBL0Fod1a3hAL9UsAlOynP4IHqZ7TGFIxxY=;
 b=KM663ZBrJsuaKKLDVA8KtprrTueyKYlazxlye0X/J47yiexZyLXBcbbrAuCDP2YTCoqYsS89xClEbB6oq7JfjMO4+qZC6hy0/p4UGfS5Yhxm62f8vW8zBqRfMFDivQw+VoX1zwXT4P980/UwmGL+XZfiL24uicg4tpoFNxDZiiUwgF3UIbtR8IjQRvaXlG1rTwDMOYULcWfjzieQVoFhqmNwHQFKDbUh6SnV92veSwseCVWnd4dJ44ADXRdHnsUwTUVAlsVkqXxDCiez2phVhzRTAByZ1s55nG8e379S0ojT+wj2ipxejVDUC3JoHr+d/9rxhZB24SlhP2uKI8X53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/4PyCj6qBL0Fod1a3hAL9UsAlOynP4IHqZ7TGFIxxY=;
 b=vVJVfDGP5hszq79eO2KL54Apgko2gYYsDu965dQW4YSjqeQGUrDVhrBkyTr4dVexV1chtW2jkExIdn14JyxW9CYwQWdn5Mp/S5inWLjJ9SIod+WmHAzeZHSWeu8vQ22RmT74w/YX4YFl3eZV38SU85+iPKCBxivrcstyLqp4Drs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f4551fc8-d0c0-492c-8ad3-b045843af381@amd.com>
Date: Thu, 29 Aug 2024 12:08:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: IOREQ completions for MMIO writes
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|CY5PR12MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ca604d-2e11-4744-ee4b-08dcc844d862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzBBZjJ1UThLb2xlUk90UCtkcHo0WnFIc3J0QWZ0Q0ZYWGx3aWhaL3QraERl?=
 =?utf-8?B?cm5HcFpGYUVXeXdSQjNsd3NlemxqL2w3QnlFNUQ5c2lwaEpDbE1FaE1ibGZH?=
 =?utf-8?B?VzZsaUw4d2JaN0FHWC95Tzc4cTRZWE15bGs1ay9aWDFjWGFIWWE5blBuWjZQ?=
 =?utf-8?B?T3BiTGZtZ2ZRMHN3Q2ZqK2tkMVpaMDRmMDJnc05KQVdsZ3FSZzI1RjA3NDlD?=
 =?utf-8?B?aUNuTHJFeEdsY3E4VXpScDhBQ2sraWpaVG5OWXBmRHJ5OE1KYWZqQTZZUnY2?=
 =?utf-8?B?TlQwcllXTUkxdnpTQzNiWWpaRUlnWTc0ZWo1bHE1YzQxWmNWZCt6OUdJM08w?=
 =?utf-8?B?N25Qb0thYzlrV2VmTnNuZjY0eGdFaURwQ0tXQ0wwQjNWbncra01Ldmo4cXh4?=
 =?utf-8?B?Y2ZTNmZGZ1pTVHNnR3JnRDBLLzVoZFdEeUhIUVRMUDNxNkNDYUpRQlBMNHBp?=
 =?utf-8?B?K3FuMFY2KytxMnlZOUswVTdxTjdMNU5Wa1VvTCtVNzVhNXRPT1k1WUhiTUh2?=
 =?utf-8?B?UlZ0ZUg4bUxxdWhBcUtwOUhZMW95UU1hU2RPczhuYzBoaE1uL0paRS94OUQ4?=
 =?utf-8?B?d2ZTRjVnb281TzVXRkI1QnBaM0VPN05nS2J2REdvR2NzZFFKc240U2IxSWJD?=
 =?utf-8?B?NzRReXhWcGJ1cm5JeUJXWHZPZXk3Q2pwZk85UVA0TEVyWWFzeWdzV2V0aXJQ?=
 =?utf-8?B?QW9vR09ud0hWTXlOcHNGZU9NTzcvVWFuRC9ablhwWlNMVWFrYmxHL3VBNUp0?=
 =?utf-8?B?TG9BWm5nZE5Ec0xiQ21FMTM2OUpVSy92UGZnS0QvQmRKWDFDUitwZnIxNmpE?=
 =?utf-8?B?UFQxUlRDN0Zzd2J5bW5YbTU3SWNsUVg1MHRtSWtXUVQ3VVNiNlRVSkNmQ3Jy?=
 =?utf-8?B?WEtyTnRHeEJId3A4T0pDK2twaXV1NmhFSG5kcnFkb2RlRFhQZzJaSUp4ZHNW?=
 =?utf-8?B?ODlJTW1DS1dzRjBjZXl1TkdETVpjVWJoM1ZNdHIyd1h6djI0d1U1b2loUTJx?=
 =?utf-8?B?WFRUSXd4MmVrMndCQURqMDNkNEo3NkdpTnZ4NFlzNU1KUjhyS2VERHJTdzU2?=
 =?utf-8?B?Q0REL2txd2JDbnF3WkVlWXFmWnNTcXdyNTYxL2dnN0lkZVgzQlJ2RDcyTjFD?=
 =?utf-8?B?T3I1WEFsaDhHWU9VTWdWblU2V2Y5NEc5TEQ5cnFFNWlrVmtWL0ZSekFWaGJB?=
 =?utf-8?B?TUdjUDJFUVU3S05PY3J0by85a1pXdG5BMzkwUTJ3WC90WHU3RzlUOEhwUXUy?=
 =?utf-8?B?OElObHlRRGdUSng4bE9ycEgzWkFhcGNFem0rcUlKYVpFLzNDenQ4ZkpYNzZn?=
 =?utf-8?B?a1Z5OWx0ZklLdGx4NWx1RWsvVnphQWFPQWVVRXR2UHU1ZTFvWEtDalZzUUZS?=
 =?utf-8?B?NDVCZExvaERPK0E5cGJYTklWMTBtODUvNnp6eEZxY0tKbFk3cXI2aVBJbVlX?=
 =?utf-8?B?SlVmWEI5VjErb1p1VFVaVm1lQTJwanZTZHpMTHMxRWhwS1ByaXRnUSt2MU5o?=
 =?utf-8?B?bVdmcFdhRUJmSGlFdHpLWTRlYzdnL2o4bHpaZlE2TGZSNW01ZzYwUy9BcGVH?=
 =?utf-8?B?UElTY0k0TFQ4S1o1Y3o1b21LSGgyVEJWQlp1SFRLemtSbEFKcWNtT1l0eWpj?=
 =?utf-8?B?ZzdIc3VJeEN6dDVudlU0V2lJMVcyWk96d2srVndTSVRpL3ZNallxT05qYjZi?=
 =?utf-8?B?VG1RRUo0SFRNRHpYRm9Xa0tyUEswMVE5dEt6SG9Rbm1tSHlLekpLOXZ5WHpy?=
 =?utf-8?B?OU40RmRDRVk1enZiTURuTWF2MFBBdDUzTlNtSWdLbTVyeGRJNDJDMkxTTHlW?=
 =?utf-8?B?QldMZGdtcWxvaEV5NDFxZjNlNzgvN2dtMFJ3VWh1TkpnajgyMlZ2T2RBemh3?=
 =?utf-8?B?eGRwYXBac05LdnFnRkpoOHZuS3JWVDBkVk5EVlp0TGwyMUJjc2swbUwxaEc5?=
 =?utf-8?Q?Fb76AY0o5xN9rRGlI9nPJ5dllj81zxIT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 16:08:39.0023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ca604d-2e11-4744-ee4b-08dcc844d862
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526

Hi Everyone,

I've been looking at ioreq latency and pausing of vCPUs.  Specifically 
for MMIO (IOREQ_TYPE_COPY) writes, they still need completions:

static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
{
     return ioreq->state == STATE_IOREQ_READY &&
            !ioreq->data_is_ptr &&
            (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
}

state == STATE_IOREQ_READY
data_is_ptr == 0
type == IOREQ_TYPE_COPY
dir == IOREQ_WRITE

To a completion is needed.  The vCPU remains paused with 
_VPF_blocked_in_xen set in paused_flags until the ioreq server notifies 
of the completion.

At least for the case I'm looking, a single write to a mmio register, it 
doesn't seem like the vCPU needs to be blocked.  The write has been sent 
and subsequent emulation should not depend on it.

I feel like I am missing something, but I can't think of a specific 
example where a write needs to be blocking.  Maybe it simplifies the 
implementation, so a subsequent instruction will always have a ioreq 
slot available?

Any insights are appreciated.

Thanks,
Jason

