Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1226AE2421
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 23:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021281.1397284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjRZ-0003hf-7U; Fri, 20 Jun 2025 21:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021281.1397284; Fri, 20 Jun 2025 21:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjRZ-0003ey-4j; Fri, 20 Jun 2025 21:38:41 +0000
Received: by outflank-mailman (input) for mailman id 1021281;
 Fri, 20 Jun 2025 21:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZSV=ZD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uSjRX-0003cm-MT
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 21:38:39 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:200a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc11b05-4e1e-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 23:38:37 +0200 (CEST)
Received: from SJ0PR05CA0086.namprd05.prod.outlook.com (2603:10b6:a03:332::31)
 by CY1PR12MB9626.namprd12.prod.outlook.com (2603:10b6:930:106::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 21:38:29 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::12) by SJ0PR05CA0086.outlook.office365.com
 (2603:10b6:a03:332::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 20 Jun 2025 21:38:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 21:38:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:38:28 -0500
Received: from [172.17.97.97] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 16:38:27 -0500
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
X-Inumbo-ID: ebc11b05-4e1e-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2LeMd2MotBGCqgjddSFOrKtAPggS3uhr0Bn2+J+skfyxIBWQoH3FOddAkne3eGuW+w5b6RWiYpQ2AJ0i6NqLCHkOgBVRJJvrP+kp4QgNs4bWt7hxMS5iwJ/7t7pmPsCl+QknQ+louK31CXufWnRjLmnrSH3n7yzXOy434PqVpjRjkF/ObXuYIHmgpALK7amAyDTOVB2LTXQA2u2BBXGzN3sE23ENITCYBDnDYNnNxsQ4Y4mMPPK2Ja1TpggS8jvcboaN1Rjwp7eEfTyPa/nsnjN1FXhYkbm0TDXuU0gt2WhrSC698N8RKyAIjPD+PqXFCKgn9mYRH2tWm2phkMUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmXWvIjVpphAD0tyUXrdGPKbfnf9wBxPfP67f4xpYTE=;
 b=xC+mErukiBtX+EcFzr9PsJtCaEuK8lR2KUl+Gsp6TWxLLEPOmZMpmA59Q71S5qtrRCqGF8G994c+HhVhxmSibON9YaMTJm0bgC1W38tGBhDD8MtK73fPd29kTicx3JpTDHLuYzsZigksUd/KBhDuik3mUaLdWRuhLgTftx4kFjZG3Msc3dWmgZWK2N2GAYcf3xqeVB8NrK1kFR2Mf1ZQuIHbBhPNRVgMT+NOwQtQSYjgez5Jdzx3hOftHOh1jlIHMDdcGGyftAcwT+wGo0GCyy6l7YqX1YWI7bWcrK39xP8ydh681Negk5FbT9m/I1Q/XRlrFSomZTSwlG+XX+uHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmXWvIjVpphAD0tyUXrdGPKbfnf9wBxPfP67f4xpYTE=;
 b=hE6L7NJ68Rgagjxcck58qbpH16k06CovDEFGeDTudpCrydQUpUMW3r/gy9ClwDbbollN2FkZUApkcS2ytZA+EN2XV4DEQ5DwKUADfvRksCRngtnQvU7vRv/K2Y8pvOCqRX2HCmffWVWRi2Z58WpHCthVob6hum42Kb/DeQWRzik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f1b56be5-c856-4d0d-909d-7520e7b4c91f@amd.com>
Date: Fri, 20 Jun 2025 17:38:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 2/6] setup: drop parameter from map_shared_info()
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250619113804.32694-1-jgross@suse.com>
 <20250619113804.32694-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250619113804.32694-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CY1PR12MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 36775c8f-fc67-4824-ca3e-08ddb042cbea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1NDRkNlSjBtQU5SbE1Kd29HcElTazVsMHhCTVZ2WFpvRTl4Y3lYOGtNQ0Fw?=
 =?utf-8?B?S0tBbkp6bEIyV3kzc2Q4LzNnQkl5Y3FFOWJMRUV2Mkl3K2gxMkJtTmJHZVhx?=
 =?utf-8?B?YkpYbU1uQVgycVlOS09zZFU4NXBvQzBTL0pZaGhkdmNzTHhYcEx3RE12elpH?=
 =?utf-8?B?dCtDU3dENjNJTDBEVzhYdHFkdGlVSkNtbmxzSjJxdzY3anZ6VFVTSzRMUnZ6?=
 =?utf-8?B?RTVENUpoaTNYVmcxc1dTbUtZL3RHZDNWeEFuQnZaZVJxdi94cVVacGc2VGFH?=
 =?utf-8?B?QkpHWG8wVDRyaUcwVjVib2tsZnh5ZWdsdGlBUFNmUGVCTjc1UE1TVEc2dEhJ?=
 =?utf-8?B?TDYzRlhndFNZdzl4YWpwUWw3akREWTFqTG93K3g4OG9vWGhOcDl4T2FNZkI0?=
 =?utf-8?B?R0FJQXEza2pVL0VUblhRRUxPZ3llQitlUHllU3ZHOFdyTXNyQzJxb1FLaUpJ?=
 =?utf-8?B?L0lVNS9DNlF0aTg3N1RQcjNPUkM3RHl0cU5FaGJVMDBIZXJkMGlhSC9pSE1X?=
 =?utf-8?B?SlJCaXdLNVRsUE9CWXl4OW42MVpwWXpuaXVsbHZEanl0UWRvb3IvcTJNdnNr?=
 =?utf-8?B?QUJOU20yL2FTZWhWQzByaWc4cGIvdytpOEJ4dHJkdXRnRExCRmNnL1kwbnZI?=
 =?utf-8?B?NmsxSUJXQmtHMy9lcWZINUMvQytrcklDSStpb3VsNmlTQitTOUU3ZDVPQjEz?=
 =?utf-8?B?VittZjJtdkxzSU1OVHUxOGV3MUZ3bUZyQmYydVczdjYxdFFZUmZrNitYU3VG?=
 =?utf-8?B?cENhS3dPRG1FbGt3R3N5dG00Nit5VUZPM2UzQ1g0alVabERMYWJFMjh4QW9T?=
 =?utf-8?B?QzdpaU1JNGtNNHh0UTZONTJHeGZZY2JtNDdsdDhjdGR3M1dJSWZocU10WWFI?=
 =?utf-8?B?R0U1UlpMbDN5K3VYdkJXSDI3YWY3dURYRHlST0ErYlpuVThEcVF3RHlkZElE?=
 =?utf-8?B?UjRIMnU1V0FQSzRRZ1AvTXBPOVplUFNta3h4NFpOR0RrQnlsaVA3RXl3MlZE?=
 =?utf-8?B?anArTFlKRXV3MVNLTDZBVDBwSW5yM2xZN3FuN2ZvZ2lCcDRud21aRWNIM0ZJ?=
 =?utf-8?B?S2NPNnNram10bUV0amRTd1RZUmwzWURGKzdEejZ3V0s2c1IzcUk3R2Z0SGFC?=
 =?utf-8?B?VnprRXRBN2hQWHNRUE5lVnZOQVJJNTdFRXRtWVc1bC9mSkhkTTQxV1E4WE8z?=
 =?utf-8?B?emFFaUtTWVY3bXpWTlVmOTFKWEFjZGlNVnlmRGZjTVhCQlBmcHJaSFRsK0dO?=
 =?utf-8?B?N0lmRFZXV2xnYVRtL3hhNWk5K1lLQld2VmsrcXJqb1VhK3AzKzVJM3NEdUp0?=
 =?utf-8?B?YzhrVkRpNGdTT0lxb3ZkbWVQVUF0R05XUm5SbGlrN0twemFZUEUwNUhHcVFP?=
 =?utf-8?B?eS9TQVo1N00xOFhCbDRBMGtjQ1IvUU8xL203T1I3Qm80VFFDUkdSNHdSMnY4?=
 =?utf-8?B?YjRHREx1NXF4VkkyWGdSU05Rem94RUFqeko1aUkxSEZob0Z1VEowUWl6MVU3?=
 =?utf-8?B?STJZUEJYdWxEdGsreE93aDg1TzFrcXVjRzBnQ2hVY1YwclFLR3ZXci8zZWR1?=
 =?utf-8?B?YkZTdE1UTnhuUW5CNnlTaFJ1QzdiblFSWlV4eDZqS01vdVI4d2gyMDJNT3d6?=
 =?utf-8?B?cGJnWUFJanNTd3hudFZ5NGhaVVdnSW9RcFg1K0xlOFBPcjBzU0FrRk5xMndJ?=
 =?utf-8?B?cC80dUk1dnM0Q3hZSXBvSWVXUmJkellqNmNNRWhQdngwOFJSL2d0ejdzSW1o?=
 =?utf-8?B?RE0zQXRQd1FRcnNEYjRPUXJHSWVTTXdsTUVVQlFJZnVtYXF1SlZqUUwvQUNU?=
 =?utf-8?B?ZHJwNjh3bjlqbWdwSXRzdGd3R2xrV3FxUzBXZEY3NnV1SmN5c3d2czFUZWJo?=
 =?utf-8?B?Nm0vT2N3WUg1L0p2MW5QTWVac1NrSDdkWUdrV3BRNEtUUmh3NU1kYUwveGJS?=
 =?utf-8?B?V2tQbGRyWXdGZjhjOEcrZHM2aFpkOUpoSWxyZ2JNZ2VsZTB1bytyUlMwd3BZ?=
 =?utf-8?B?RSsyeUxMOTcxSlJ0cHFRRVloWHJ4NjlBRDlnMm90dlZhcVlXSGJZMjYrNXUv?=
 =?utf-8?Q?MoniTb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:38:29.0631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36775c8f-fc67-4824-ca3e-08ddb042cbea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9626

On 2025-06-19 07:38, Juergen Gross wrote:
> The parameter of map_shared_info() is evaluated in PV mode only, and it
> is always the pointer to the initial struct start_info from boot time.
> 
> By setting start_info_ptr a little bit earlier the PV variant of
> map_shared_info() can just use start_info_ptr instead of a parameter.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

> diff --git a/arch/x86/setup.c b/arch/x86/setup.c
> index e30eb065..1bdf9509 100644
> --- a/arch/x86/setup.c
> +++ b/arch/x86/setup.c

> @@ -185,6 +184,8 @@ arch_init(void *par)
>   {
>   	static char hello[] = "Bootstrapping...\n";
>   
> +	start_info_ptr = par;

Should start_info_ptr only be set for CONFIG_PARAVIRT?

Oh, patch 6 does that.  Strangely, patch 3 and 6 are not in my inbox.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

> +
>   	hpc_init();
>   	(void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(hello), hello);
>   

