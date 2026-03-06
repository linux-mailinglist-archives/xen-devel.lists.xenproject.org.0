Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGTwMe6nqmlTVAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:09:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE921E78E
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:09:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247553.1546127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyS7g-00080V-G7; Fri, 06 Mar 2026 10:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247553.1546127; Fri, 06 Mar 2026 10:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyS7g-0007yu-BZ; Fri, 06 Mar 2026 10:09:32 +0000
Received: by outflank-mailman (input) for mailman id 1247553;
 Fri, 06 Mar 2026 10:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfUi=BG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vyS7e-0007yo-Q4
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 10:09:30 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f73b3a2-1944-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 11:09:28 +0100 (CET)
Received: from SJ0PR03CA0150.namprd03.prod.outlook.com (2603:10b6:a03:33c::35)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 10:09:25 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::37) by SJ0PR03CA0150.outlook.office365.com
 (2603:10b6:a03:33c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 10:09:24 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 10:09:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 04:09:24 -0600
Received: from [10.71.193.38] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Mar 2026 04:09:23 -0600
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
X-Inumbo-ID: 8f73b3a2-1944-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2ANtsmAhGm5saNCVHZhxaIZAha0vB0Iza8vb455VHPsvnQw0vupi0tJp3fkRMmiikjcIayxErN2PQTH2tG/DPik4xG9XPVJKJmZHDl42sSKA1skYdi4e2JnCKm8NWyVwHH50c+yoMcugB8kbFmPt6F1rAOdeCs6KCympEEZvXetlAbrrLzZgldQc26HKyRkCpqc0vPDgPOCvA5Tas4sq0FGPPKE7Z2EO1OvuK8v/4ZBFjAUu5dFkUr1M58EQQUOmRQ4zTVr091EVtkHKFs4yXxwCEUL74/jFoavD+muuzvNHgtkXXo41ANQGWYsHJKkrSyQDuUIGQnoHnQxcX8vnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTl/AVZ79RDhARblpBSb1gPaxCHhIt1OecVzUzfMbPY=;
 b=gBlRBtmkMnwMLMA3BcrvrlzDWZlb3ofSZtwXSCS56cjiRjrPvuhHGQJH4kujXFOcBQjwLwN826NE++oQJKCfGLyrvyJm/BRoxgv+SOwrZYUx5eXcBWLuxSHIc9CsHx/IiINp1fUDhOmz8PQpCspExlqSPTUPnTm7FiqA4cZwlCI+UNj8h0oRJaJF+9jc1+9CsmP+C7CnsMGUofJAAjMemPFvu5tDoLK875HYKJA+yf9HBJxI8A1hBW1OtrksNPWE6PSJe7Kf1BwpkWNp3/T7JmHmYmilRMCO2Xi0mDQ2Yi4uh/OdroK8ySdYVIipMDPuWxj17sZ5iVkq0r2b1Om7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTl/AVZ79RDhARblpBSb1gPaxCHhIt1OecVzUzfMbPY=;
 b=B7wvYOki1jkH0FFBkCmK3idhygdwzME+0YEQc/P4/Wni1GSQApgXT3VbgmnKV86jYnPzPHjC4IvdQ/sH5SR4sK/W7wZ5rh5Ywm8sihBQssjkJQQLjcQAYJ6h3jGj9AoNLqTPauoFn88mYLsEOKw9kYYsPgi51/v4XLIy3qmkT/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0f775788-2637-4cfa-8ab0-a1e60d4d470b@amd.com>
Date: Fri, 6 Mar 2026 10:09:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
To: Jan Beulich <jbeulich@suse.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
 <9e222b10-f63a-4a5a-981c-36c438e3071c@suse.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <9e222b10-f63a-4a5a-981c-36c438e3071c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4d6043-b437-40b8-7879-08de7b6871a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info:
	DS+jI1d7Ji7u6WqtxCicV/VRsvlXPBte6TlhInjE97FCFlWUzWjZXP6BGyJz/4965fMK/MwVNJjsvaifZH86Fgc1qbPGXc2Yn1gEURODOClR87MJq4L/3ki20yk/MbbqbjV02IcAoz7WZXAjHmXO+/Rs4avxTwsGICVFgV5xXblXEt76d++oouTcsVMrbWjC2qUjzw9TyW5atBcF0FKMtOBbPkvGeYrBZmHl/pSIAjYGNm2X7Pn8J2J+A1AaM0MKxK42vi/wLIlcqr3sE8FMxd0EDnswtN1W/j3H5zZHq8v/nIuDXo6hhzUV3Oj6ug02pNTIW3JxYz0Xwyk7tg8ws4r793OmEmugS9MJIfi+SKPw/D7QVqeBC6onRD28JuIK3eUhZFKzztQAgz8/wV4A2M432dSCPZ70EUZ2SQbWyJZlq2LaBvqQWRNI6psRZ56V0x2WP/FckpEPX/XgPb/N65XZEKjdeRvazU+b/u2+bYHcT1bXgAp88TJPjzqmzecH4OL75mFWVhiqlkDzUwLA5pgkBM3LHHpXYEOEoIahfKuCqVYwYbI23/P8bxSZihbF1Nj5v88UWU0yT/Wg5LV16M6sZGebZLYe8zjPjMmJ7F6b4Gvq3JA4Rmcs8oR4yzAjyGBTE8bxAQOTfInxajLTIUZ9IxD4FPZUEuE+WsZf3+QDs0tj3H9lN//TZUBBVzzLz3Na5/e7QEKmudLu78I172vA6qL4hy9jw/4LDGNiKIFka0prPORLZft245aJHPZb/56sMSEF7Xyx4OuH5UXt1A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EvgVA6yRrkWj8X1mFE6dQZvWxQ+JgOTlASpKKC/TN6rrkgvYaEmKdD3zNHI+MWwZTb36NeiZZCdwhPAm8ky759BLW1WojZ9Y0RcQLYPATiFJA6b3MXIeX+klhV6Hs+Ni83gASdk2e6KU2yOurhMEl0eJ6NnZ9tacOuSddaVsIn/Cap/M81zRMEsutqHbXXoUjF/lJCOEJgHM1Q3Nj/uOHbHXSRGS7HPEG/xy1j2qeWq/DpWsCI3EkBCJt8/eqlBqZjwhF9NJa1+ieKK9eFbs1ZCdi8YDGSLnmju5+E12j6IybORLCe2J7Bnx+TH5jnrDlQ//XQJDye3cg6nAPTx8AeA1DZ24slU58BVazChtTm5xz+IGfbHkNhKHnF6b4zcBXtXzEfg9AeEy4BlWm8j+SD5jGGceymDF5LBSNqQ7OH/ME3P3D+ksOI4gbthxSGc7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:09:24.5774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4d6043-b437-40b8-7879-08de7b6871a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713
X-Rspamd-Queue-Id: 34AE921E78E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:ayan.kumar.halder@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

Hi Jan,

On 06/03/2026 08:49, Jan Beulich wrote:
> On 05.03.2026 20:57, Ayan Kumar Halder wrote:
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -237,7 +237,15 @@ enum gic_version {
>>       GIC_V3,
>>   };
>>   
>> +/*
>> + * GICv3 supports up to 16 LRs (4 bits in ICH_VTR_EL2), can use uint16_t
>> + * GICv2 supports up to 64 LRs (6 bits in GICH_VTR), requires uint64_t
>> + */
>> +#ifdef CONFIG_GICV3
>> +DECLARE_PER_CPU(uint16_t, lr_mask);
>> +#else
>>   DECLARE_PER_CPU(uint64_t, lr_mask);
>> +#endif
> But GICV2 and GICV3 can be enabled at the same time, at which point you'd still
> need 64 bits, I suppose.

I see. However, a safety certified Xen which is meant to support GICv3 
hardware, will only have GICv3 enabled.

IOW having both GICV2 =y && GICV2 = y is out of scope for the safety use 
cases.

- Ayan


