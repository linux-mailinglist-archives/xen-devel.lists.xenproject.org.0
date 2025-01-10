Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB54A09C19
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 20:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869993.1281439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWL7U-0004dS-Cw; Fri, 10 Jan 2025 19:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869993.1281439; Fri, 10 Jan 2025 19:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWL7U-0004bE-9S; Fri, 10 Jan 2025 19:56:36 +0000
Received: by outflank-mailman (input) for mailman id 869993;
 Fri, 10 Jan 2025 19:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l7mG=UC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tWL7S-0004b8-EM
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 19:56:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc897fe7-cf8c-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 20:56:32 +0100 (CET)
Received: from SJ0PR03CA0234.namprd03.prod.outlook.com (2603:10b6:a03:39f::29)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 19:56:28 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::27) by SJ0PR03CA0234.outlook.office365.com
 (2603:10b6:a03:39f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 19:56:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 19:56:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 13:56:27 -0600
Received: from [172.31.88.124] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 13:56:26 -0600
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
X-Inumbo-ID: fc897fe7-cf8c-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBxNjsJIugZot6FyS8CMyh57VvKCPLDDRze4wHoBSSLIevIYrLQNuCFhMTvsPLYYFmDplbaZaDPzg1ug5rlDgDfH+ndGSnUv6iJ4NwfGxkr62HzZuYmjiNNVArK2cJ3HMUxFm0p9UTt3J0dCtq8Lndka8pf4vyvUNjUbODJf6RiJZVbdNZ9rM6XppGuERLNQSA6Sk8IBEG37JcM0yPNdBNujHAddqkM2GP88qFVPbfkrXIR1dKbr8T2vKyd99NaWUuN/qFvmpGFakc0xYQ94wiat8Kr0pHJlOkYCGiYUwkBJ9Kz6XJPFcKr/KpOuo/J9xl7Vx7vWgol+SUP8oSJu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8ECKsKedir1lyaapobKCltmTVKHm4uNnyTRp+QtJmY=;
 b=I9NFA5fnkOX8S/52nsnjK1UPaKUaprSAov4/H4+fxrK9Mc8yZJA83+24VqPnR++Cg6zgb/DBEa13QeqqdPeQ5ji6/L/9Xz1hGZT0I8G708792CRVWhyHNQd51WdT9TI+BMyO8kA/h1eSCpGQW77VzbIp4jnfD+GCjYCVApJhZkIUV/KOJpF1n2O2dhbtvle1ANpoGkzMuKl9pjfrADaPQhSFs5ay2Lc/B4whqs6I2FSugzVTrfFUku4QZ4CpX1Lolnyf3FJOfRk5udDO/wmxkzZ0CYmX+sDfP+KNLKM4xIM0tkR0HD5nUDxURamDWtprN4wR64xNwdJzG7Cq3VEkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8ECKsKedir1lyaapobKCltmTVKHm4uNnyTRp+QtJmY=;
 b=dm670yaz7iaiTBjzrlUuxGChd8tvOoDuaPpnXYoOAgki1p4dgxJn+OYlYLUfevvA5yfPx1u6ISOxytkEGKB5u2BgvDVGWgdFBNB1111NGA8tR8+d9BBMN6zTgU1O0fBuuqXPoqp02bpOYy67fkH+DchqcX409Ge376wrOKc0UzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <43c0ce53-4b3c-47b6-8b4d-c5278f52d7fe@amd.com>
Date: Fri, 10 Jan 2025 14:55:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] kconfig: introduce domain builder config option
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-6-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|DM6PR12MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b11ea1-fe09-45a8-d653-08dd31b0df15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3VIUU40M2NrZ3kzS2ZqU3VWQ0RXRWFVNzN3SW9JajJBbDJJTmc1UWV2VkE2?=
 =?utf-8?B?V1JVeGZ2WGw3aDRRalhoMFFFbGlrenIvbWRwQWlnRElkV3hPWEdJSTJTSnZO?=
 =?utf-8?B?eDEyVWJBQ2VtbFdKUTkvTVpkVlZiVHo2aUlISlZDZGlWNmRSNUZuZzdSNDdt?=
 =?utf-8?B?eWFlczhlcGNldlhYOFZMbWduNThjVjhIbnNSTzlHWHhBRThJRXFET2JGQm9S?=
 =?utf-8?B?Z0tWd2RDYkxhVytNRUJqcmhZUXZWTy94Qnl6RVRITGk3UE55NW5mRTRPYUc2?=
 =?utf-8?B?NDNUbGdhQ1Nma2c3QkpnK01nRnZRV3loRjNWbG4zSHRMbnAxZVNKSXdYMm04?=
 =?utf-8?B?RWNHQUtudEZhUXRkZk0rRjRDZFV4MUh1OVUzYWNFTHN2UXd3T2cycVZzNmNq?=
 =?utf-8?B?RzNYWXJZSUdnTXpHV3JabVdHUkxUSC9rWERJQ0VXY040WHdNUDhxNCtXbXFN?=
 =?utf-8?B?U0ZaRlRBVGJrbzFzTWh2YUJHSFlPeGVRckNRQXdJMHZDZ3Q3QmExZ3BZTHA5?=
 =?utf-8?B?REp4RzMvcFpkNkVHRlduTDY2dWk5OVNENHp1aXptOWswSXNpcFhvamNZdXlt?=
 =?utf-8?B?ektSSkpudFVUVG9EdVlLUnhtVUp5MDRobU53ZnVRRzJtcUFPUld2KzNNeXJB?=
 =?utf-8?B?anUzMFZNTEFvcXpqbGdqUGoxN3hIWEJ3UllmSHdaaVdNR0x0a01WTXBRdDFq?=
 =?utf-8?B?VXQ0OHZiSi80c2x3Z09zbE1TenFwY3RYVnlZbUtYakoxRmx0d2FiYVZBSm13?=
 =?utf-8?B?LzdFbDIweXBtUk1BVSszOWIzMzlibktJZWUvcmwvT1VsVFhNRkVNemJKeEl1?=
 =?utf-8?B?SVlPcnpUTVVsR3BDeHYyTUJQSHJMRC9GdVRuaitrK2RUR2dSZjF2ZkQ4dWZv?=
 =?utf-8?B?L21nU1Q4blVRU3EzNzdNZUdOZWpXVzdjOUxGaVROVFdlUnlSMzBoTjREMEdi?=
 =?utf-8?B?MU0rSzN4Z1oxZ0h2Z0gzOTEwNjlkbmcxeUYxdzl4bXNEL3BmQTAzcUpiM3cw?=
 =?utf-8?B?L3VEcWpaNDRnU0RaTHZFN3ZIL3g0SXpXOU1hdS91Nk1rcEhxdk9OcDU2QkRK?=
 =?utf-8?B?ajA1N2dlRWtOWjFHM0E0VHB5eXhtdmpObm5OTWtCaTdub2QyNzg4djFvZ0sw?=
 =?utf-8?B?Y0x6cGFzN2wrSDBLVXEwbHBwN0UyWDh4Mkp1ekhSYWg3R2tXYjBReTVrd0Nl?=
 =?utf-8?B?VEtrMjFTWjEyMXNnOWduNnorc3NJRTBVYjFuU2twbW04aFJ4UThGdjdma0hz?=
 =?utf-8?B?ZFpWOGhwWEU5S3NsYkFPSFY5V0VQbDRMbENMck80Z1NmSzRlVURYODdJbGc2?=
 =?utf-8?B?ZjdnZEUrelVFc2s2NUY1R2ZlM1hqRG5rN1g5RkNIZHorVVRkQ0JnSGlSYWhQ?=
 =?utf-8?B?QVgrNzNWV2hGUXpXTFZISkxnZE1JUDFjem9sWVRtemVxWmU2OW9ka3laSWhX?=
 =?utf-8?B?VUswcFVqdUlIVW5PNTZoL0ZxTDBJR0lxSFJnOC96SWMray9tMWtMcXJ6UERz?=
 =?utf-8?B?Tm1qa0FaQU1GRG9oOXA4VENIUHlUM2V0UmQ5RytKVE1kNEJNRThYaThWdU0x?=
 =?utf-8?B?VldnQTZvalE3Uy9mMy9rWXhFNDZmTENZclFWNmtvQXJBYmV0cWpPWTc1cGpT?=
 =?utf-8?B?a3ZuL3JveWJJNTZ5VEx0djdHUU5ZYVRmbVpseHl0aDBmSFlvR3gxR3gwbzQ1?=
 =?utf-8?B?bVhEQ1phQmNWejA5dkJUWlBUUFNBUjRYSy9BUjlUazNWMG45bXhvU0FsUGZi?=
 =?utf-8?B?a1FERElyek5vb1B1MnJlcWUrZitmTGJ5ZlNkeEhybkFoNERzTU1CMGF6cG9M?=
 =?utf-8?B?cDdHWmV4QzA2V0VSMkl3YmpnTHpjVXlabW9jY2NjZzl3MWZ3SDFpZ1dua2Ur?=
 =?utf-8?B?a1Ntekp6TjU2WHRsVjBNUTM5VXg3cU95WC9qMDIxYzA1Tld6R1lEM3M3a1l2?=
 =?utf-8?B?bjVzd2xUTm5EN09kdmI1NGlUV2pHWi9zQm9nbk9qcUs1dG9ESzJrTFNtaUd0?=
 =?utf-8?Q?FSpMRuODxXr4TxMyuPknW1a6s/h0m0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 19:56:28.1671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b11ea1-fe09-45a8-d653-08dd31b0df15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Hyperlaunch domain builder will be the consolidated boot time domain building
> logic framework. Introduces the config option to enable this domain builder to
> and turn on the ability to load the domain configuration via a flattened device
> tree.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 9cdd04721afa..25b9b75423c5 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -383,6 +383,8 @@ config ALTP2M
>   
>   	  If unsure, stay with defaults.
>   
> +source "arch/x86/domain_builder/Kconfig"

s/_/-/ ?

With that,

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

