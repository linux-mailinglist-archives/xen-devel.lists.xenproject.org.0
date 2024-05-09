Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597AA8C126B
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 18:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719314.1121992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s56IL-00045e-Dx; Thu, 09 May 2024 16:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719314.1121992; Thu, 09 May 2024 16:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s56IL-000435-BM; Thu, 09 May 2024 16:06:57 +0000
Received: by outflank-mailman (input) for mailman id 719314;
 Thu, 09 May 2024 16:06:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFQq=MM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s56IK-00042p-8o
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 16:06:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2681e829-0e1e-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 18:06:53 +0200 (CEST)
Received: from PH8PR05CA0015.namprd05.prod.outlook.com (2603:10b6:510:2cc::16)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 16:06:47 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::6f) by PH8PR05CA0015.outlook.office365.com
 (2603:10b6:510:2cc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46 via Frontend
 Transport; Thu, 9 May 2024 16:06:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Thu, 9 May 2024 16:06:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 9 May
 2024 11:06:45 -0500
Received: from [172.30.155.127] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 9 May 2024 11:06:45 -0500
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
X-Inumbo-ID: 2681e829-0e1e-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb2hlkTxefASncpU0TUBK6DYhPZbsvfJI7B/C19vAW+T0+RqofiuwipXXc73HR9FPmZcSN+Jwg9kSPI3Jp56uC3nJWGDnLk3VT9+hvMJZEy0Aj/aSrGPgdHupKAu5KPpqRV6mDItCWgZXxutlJUTgnsaBXfzNYsDE3rzVQ6GoGqpCKDN78Vx978djq2UObZVexD7qqb+q4VYq15vY9r0ddCVZZWV4jaiL1GzBOAtpC1EzQBhfXohfFdWzluIXfW6Q+MsIad3L9PWvYUMuZwiREA/WOnvaQ5B/aaL28DuTwydN+u2/C8mmWmNHCJ+lq6CJXIAY8ICzzXut91xSgC+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTmKuPIJV+UNMuSZ/dUUUWQVTWGzNtqp+DZ+XxePY04=;
 b=C2CQWStWXzeoTFLPvObV3U81M9NZL5LfSvigIN2rvU1KINrCcdrIwqwyLF85uZQVEdAIHBq17eV5lW1pqtAhkWk2Uf7QRS/Cfg+iJhwk2JSEi7SR69EzKjSlpkP4vOf/ZwhRXbK7zPMzvf3Ef303KULftXZt8yb3VcE+pa7jLXZ41IpiY8lt3/nlVT2ctJb5mLBCZk3xZf4Y4mEPVCnLnc4dd8PSdom1RFIGNeO9GxmWUSA4V3yIbAdk6ea+N0hti90IkMvs5QPMiBaOiX6XxROpkn6kMtfA4h6cPkljBgeHOWhAbbdwdEwOdCui3h0enmU2EC4LT1hkIH8XGeto4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTmKuPIJV+UNMuSZ/dUUUWQVTWGzNtqp+DZ+XxePY04=;
 b=CSmfBOo0qpgARRTxgYzkZPTHRnilCEqeAGt682lqTp5CWuynSosdfRftGnhrnO/i41+uT/NLAiaACoSRVQP25jdOInlkwiulNkI1IxO3SnQ0sJsvY6byZJtuviB9U5YZS9sU/3VftmWX1h+CDyq2WnLF/cUT+1Qe614AoQ1nu0s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c53b9134-4127-4c3c-a7a8-1630df7c3eb1@amd.com>
Date: Thu, 9 May 2024 12:06:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86: detect PIC aliasing on ports other than
 0x[2A][01]
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
 <c29ced52-6e1e-4997-81ab-8882df2d38a7@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c29ced52-6e1e-4997-81ab-8882df2d38a7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 88dca06f-20cd-49a3-bbd4-08dc704206ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzBxU09Bc2EzU2tEVkljNXRUSTZ1NWs1ZkdROGpFbmh4SVBSUGJFRW02WXZW?=
 =?utf-8?B?UUZ6aUhxVU1RcjFrYncyRGRJM3c1NWhCYi9PSE9oSU1SL1Q4YlBtVkdMUURJ?=
 =?utf-8?B?c3Z0dUFVeFYrd240dVBza21ESzZNUW1VS0tBeHQ4YUE5L1FtU09YVUdPalVK?=
 =?utf-8?B?TVM4YndybnRVZGhRSmtSUnFrTVpENUJGU0ZobnRNeUZwbm81VXFJNDF5US9O?=
 =?utf-8?B?Y2ZMTUwxdjRTRCtpL3FvMnRSdmcvUG1IeTBGYldRVUFCTzFNUC96T1JEUGZl?=
 =?utf-8?B?cGpJdFVGUXlzamJkVDRVWUYrNG11aHc1WGR0L3c1ZlhmYUc5cFhqUkxiUGl3?=
 =?utf-8?B?S0NpTi9MQ1FvdDZ3QnhmN1hiQVdXY244RFlIeEFuSXh0SDUwSlZRN0NxT2dF?=
 =?utf-8?B?eGdtNldOT2M2L3NoZmxSaE9WcnozcmVwWGdEMXpxTzcvTzRyL2w3SzBsWkNo?=
 =?utf-8?B?KzAvK0dDNDlWZUVUbzV2TXFGcFpIdmZRL2s2b1djMW0zSHVhcm10ZWgvMVlF?=
 =?utf-8?B?dGVIRFBrc0Q0UjJTd0U4S1U2UUNYYis5S2dIN2IrUVp5cXNqQXFZTDJIcEZ0?=
 =?utf-8?B?empPSSsrNFoxeW0zdWJSUE5SU1l1RXFRbXl0MUhBTjNsTXNrZ2ZERTJHZlZY?=
 =?utf-8?B?N2RoT2Z0NXB0WjdvZnJwSUxtY29rRUhyNUVMSFNKczAxbm91NjRxY0N2OWto?=
 =?utf-8?B?V3EwK3JMbWh6V0dKWjRmTkx5cG5zYklBTStNd1I1Vk4xcHJhV1JpQWN6SDlm?=
 =?utf-8?B?SFBRNkZzeFlEbmVDT1k1RmlraVQ3MGU1T1RPRE0vUnNlSlpzditXNVNDSDF3?=
 =?utf-8?B?U2xyc3hpajB5WXhhS09ZUmNVRGJuYTlNSkg5Q3hQeTByR2t1TWgxNERabXFm?=
 =?utf-8?B?bTRySE54QTQyYUVkaGpiZzc0OWplMHlScC9nYmRwclJzWXlTZStvajE4VWNC?=
 =?utf-8?B?ejVyQ2tvek1qc0xUeUg4U3NiMmoxSzMwVnJHVUVpSy8wbXVEaDk1TC9PZ2pM?=
 =?utf-8?B?YjY2RHA3d2tHdXJUZ1hqN0F4UkJwMjBXRTJZVnRLWVFVMU9YTHIwaTFYN25l?=
 =?utf-8?B?eVdDakpGRm9LQkZxR25xcVRKVlh6Umg1ZjQ4UzAxYXZmQTRmSkNSOGlpbCto?=
 =?utf-8?B?dlBVUVRyWXJhbGI2MkVHbk81Uk53MmZwQzh6ZVhFSzV3b28vd3NtZ3hkVTAx?=
 =?utf-8?B?NjUvVjZ4M3lkMFl0M3FaNGpGRzJjWEhJWm8wSUxocklrWCtJTUZSenloN3Jz?=
 =?utf-8?B?Mnc0ZUxna1JmcENDZUpGdHhEZkU2ekxOb1R1bjFrUHVsWk03UFlLTnVnd2Zh?=
 =?utf-8?B?WDFqRWgrV0QydkpoZTlBR2d0MEkrQndXN1M2Z0dKQjBhcjlKYVZQd3NmVVU1?=
 =?utf-8?B?cVB0Q1dpTENlY05Qckw1ZlFBdW1PcGVzRlRGVkowRFRDdDcxR3NsRXR4bXpG?=
 =?utf-8?B?dUJBTnJQaUZDSjcvMloxZEpkdHpHUGhMY0puNUZFMU1DakJTcFloWWNhRGgw?=
 =?utf-8?B?cUtjVlV0eHRGc1hqa2dKc0k5a2kyQjRObGtRemtteU9OdVJmdEt2R0I0QllL?=
 =?utf-8?B?c01JaHdlYVVSVVNvbGw0SW1HTFRERWx2WkdjS1VJSFFjZTNXczFLN1BiN0RM?=
 =?utf-8?B?Tk4veTAzTTdSQlJBT0F6U1VJeUpHRnhYdzlucHNJZFJITGZlL0FDeXpkR3dP?=
 =?utf-8?B?cWlEU2ZVQ2NidUpNc3Z0V3JvUVlnZngweE5ENUNKUDcvV2JmME9KMm1jOEZY?=
 =?utf-8?B?aCtYVnpUbWFFbGJTRUtGS3ROSFpXbzM3TnBvQ2llQXNKb1BYeWJ0MmYwVGpT?=
 =?utf-8?B?U0hYK1lIOStsNi9nRkp4ZENCL25ybTllbDY2SUEvYmxnakFIdEZlVzhoNkxC?=
 =?utf-8?Q?bsPGFHjIVXzAt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 16:06:46.5004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dca06f-20cd-49a3-bbd4-08dc704206ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598

On 2023-12-18 09:48, Jan Beulich wrote:
> ... in order to also deny Dom0 access through the alias ports. Without
> this it is only giving the impression of denying access to both PICs.
> Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
> operation later on.
> 
> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> from the probed alias port won't have side effects in case it does not
> alias the respective PIC's one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Code-wise
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

I appreciate what Jan is trying to achieve.  I also share Roger's 
concern about reading IO ports since we don't know what is there.

I also don't have a good alternative to suggest...

Regards,
Jason

