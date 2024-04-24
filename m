Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC1A8B0BE0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 16:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711473.1111461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdDc-0001Id-P0; Wed, 24 Apr 2024 14:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711473.1111461; Wed, 24 Apr 2024 14:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdDc-0001Gg-Lp; Wed, 24 Apr 2024 14:03:28 +0000
Received: by outflank-mailman (input) for mailman id 711473;
 Wed, 24 Apr 2024 14:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kzFK=L5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rzdDb-0001GY-0C
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 14:03:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a74094e-0243-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 16:03:25 +0200 (CEST)
Received: from BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 14:03:19 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::69) by BY5PR04CA0025.outlook.office365.com
 (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23 via Frontend
 Transport; Wed, 24 Apr 2024 14:03:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 14:03:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 09:03:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 09:03:08 -0500
Received: from [192.168.213.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 24 Apr 2024 09:03:08 -0500
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
X-Inumbo-ID: 6a74094e-0243-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUR0sBRoOeZP4A8g2uoY56VmUV62ovjeTvemHBhGe491DC/gy4vY9sfUfDiUmOHkjiP2tkO4D6lOgPO9fSyG3VRSs4hHqEU444ETeb3374vBw4Kq7+ZYSmMpWCFownaZryBW2FcHOukJAyxUByAPXEm1GtSxXXKGn2d7KES6xYE5likoBOp/SaWIVdBGor4Cyj6wuUxmUoInmwKEZ3D6IQsHpu1qUgQ/jnVJqvzcGddcsSOSkro0YOP7XauDv5Z6TZRJrzXfl0ICAT4vtlanhYiL1hy+ZW77nnnAsz088NFDlxal1J9DRQ7QPi3xYzsFCPaqCi9H5XoBfEM/k8h+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avRbYMz1cA3ScoHCNHSNugO3g1pNhOD3+1TQutSLqX8=;
 b=eZeBpNbAnd4nO5B7oPXWNM7NBy29iLO2YwXEPvSE5KKmv2HY9YXctVGVEQhgpxZS/HyCSv9fEP9yjgUXkCFh/rd4fYFcfPiJXie8IwJAUNMSn4mgUSu/D4kLWojTXtHNifhw/QN+vuGqUPOHh0pEfn4ArNjnxC45BvV0tpu/DJgdCB7epFy3ry+JaDT0z3TBgO/CE1iYKLQzgB4iAwwPtyYdksDCGNBngEDUrAAM454FCBcAINwYaf5zi+o0j8Nxsdn7OTA71L07e1dRmDjW+fCSORfsJ4f4m+kKDntvG83FaO9tBlSyILgnhosMCup7+EwtW2VxYP9HRvs8Kum67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=rabbit.lu smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avRbYMz1cA3ScoHCNHSNugO3g1pNhOD3+1TQutSLqX8=;
 b=S3GkA148Pv5ylBXOI9y9F30JuAPPcDdzk7mTsDZlfmusrqp9ybyXHjoBJkWlobu1OEjes4AFc0gHS3z+pCw704+RV5eTjgvJxyudtUHnTn7wxFwDd6g2DTNaDA9UnCHuyitz8aLHyZghQ+NL4ULZpG/CCUN8P7DVDcfHh+J8F/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d3c9ea82-ff33-4211-9e76-f2e599f21a8b@amd.com>
Date: Wed, 24 Apr 2024 10:03:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] tools/xl: add suspend-to-ram and resume subcommands
To: =?UTF-8?Q?zithro_/_Cyril_R=C3=A9bert?= <slack@rabbit.lu>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <4e9f3590be9f19edb87e05c7b7c2efeae8863109.1709190010.git.slack@rabbit.lu>
Content-Language: en-US
In-Reply-To: <4e9f3590be9f19edb87e05c7b7c2efeae8863109.1709190010.git.slack@rabbit.lu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 22333bd1-bcd3-4e0d-347e-08dc646747c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmRLMllabUVxaGdQTFNPVEc5d2pTTGhsV0NEZG1UUHJiVVpUTjZKUGJUd0Nn?=
 =?utf-8?B?ajFtb2JRdTVaVGlBT250dFpTNFJSK1orcjhQQ1huTUwwdVpQNHdkTitJRmVa?=
 =?utf-8?B?Y1F1WlAzUjh1bW9lZnMxL3I0K3cxZ3E3SnFtZEZRd1JxVzRSQUdiamdid3pR?=
 =?utf-8?B?QU1LbUNvRzhLV1FiWnJuOHBSdkk3cFp5MTRLcWdtNUcwUDkxZVVIZjdkMCtP?=
 =?utf-8?B?akpGNGtaNGk4MVRGeWN3enNEUDkxb094SG5ZK0UzVnEvQmNQWnd6MVNIYWpq?=
 =?utf-8?B?TUI2OHJaRlBacDhWb1JsTFBZYUhSR09KTzlSS3B3WCs0VlBveHRPd2x5Tm5O?=
 =?utf-8?B?RjBqSlQ3aTVCdTdwODZWT1FnMEFIZ0ptSHNrNENiMnUyS3BjcmlKUjE0VHJZ?=
 =?utf-8?B?L2VGNW9kaXMyV2J1QngvRnpnRndPOFFCbGtvUFlUZUxEWTNtM3hYOVU2cTBK?=
 =?utf-8?B?MmJtV3ZPVXRKMkd5Vi9JeGVVWXN5OThXRzBpbVhRYnhVQzBrY2kzL3VpTGRy?=
 =?utf-8?B?VGxUN3VuZTZsTDJzRlU2R3l0RjhEbnd4eGEweVBUWDhQdjBJODVxK2tKRHZY?=
 =?utf-8?B?aVVXQTlNNElVbTc0VU5nWUJERjZWV1d4UzZlam54VlpCTHV1VWQyNGgrdVd6?=
 =?utf-8?B?cy9SazBkUnlYQWFwMG5rTThjM1BuTURQVnVlbENwbkJlRnl3UkIwQ2JCWG5t?=
 =?utf-8?B?K3dKcmxMTzdDSHlCT3JDc1dlQzVBSkZISDFYMmxGTFVVb2Y2U1BtMlA4RFdh?=
 =?utf-8?B?UHJFdzdiRVJZSlFaL2tzRDFWR3p6QVVaaGNYV0NNeUFrdDZ6WEhsUFpoVWpF?=
 =?utf-8?B?THNzaGVhN3drditHbXgxMEFDOCtnVThPTjNudXpOc1dNNjJYbW9wbUxBeEdL?=
 =?utf-8?B?RzZCVjdUYmJJcXZCOW90N2tiSHFBVDdyWEJOZXVGQ3NvNFdTZWlhV0ZuZ0h4?=
 =?utf-8?B?TWdvUFNLVmtSdVp5bXNORDRDWmcxdFVTRnhNOUt0c3k0c2t0ajg3VWp6ODhI?=
 =?utf-8?B?RStXbXh4Z1hzMm1RZGhXYmNzTFRuMWJCc29hTVlseUJDNlBMSG5JR2NZVm9T?=
 =?utf-8?B?TXRvay92ak0zdzZ6dVhDZzZoMEpmU1BqQXRQNVIzcENvVWdmc2ZodlN3WERD?=
 =?utf-8?B?dXVVQnRUOENMalhlVTJTZ2xJN3lWYmg4SWw5bGJXMG1VTkE1MGMxR0dNN1R1?=
 =?utf-8?B?MUJVanZUWTZxNW42eDVERXpDVXBJNGkrMDJ4MEhZL1ZWNkpmK0JlL2VQQ1Yv?=
 =?utf-8?B?ZldGOHU4YjFWK0VTUCtmVHMydkIzMVJSc05ZREZoclFhaEdJQUxZeXprM0pD?=
 =?utf-8?B?K3d4UWE1K3M0RGlFSnNqbUZpSW9hZFhnZnJ5SnBGMnpvVCtqNzd3czQ2VHJw?=
 =?utf-8?B?dnpPWWdXM2Y1YVNEWFFtWENsdDl1bkd3TDFOY3llZ0owYjU5ckpCLzRlSVFS?=
 =?utf-8?B?Q2tVSnk2Y0FDdU1DeW81b1h3WW1ZaUI0WTZLZGsrQlg0Y2JEdmdPYTZHMzF2?=
 =?utf-8?B?TTUzNnJiMXNYRWdSSUFvcWRHRE1YR25mNk5EMUU4YWg1Q0RCVXlIY2k1QXN2?=
 =?utf-8?B?STY3MjRDbTBjektyNFQ1RWN1aXVGRXZZRDdPZFpvYUt0UnFIMmNrUTFJeWc1?=
 =?utf-8?B?UHVLL1NrK2x4RUdWWnNXMUYyVnhKakhKeWUzK3VvWkRrRU1nbmtsbVR2MGNv?=
 =?utf-8?B?cmlUNlI0TlQ4K3JtL2RYcWpGVGpNb0drQzRvNGI4OGNVc3ZKcWpldDExSDBr?=
 =?utf-8?B?Z3hDM3A2d05NbmtHWlk1MGZvRGlDSFgrdGg3RmxTMkh3VHhwd2doWlZRUDdm?=
 =?utf-8?B?Q3ZyRmJBa1VYMnlpTmhqWERLWlYxcGg3Y1A0ajlQaUIyU3RMS0pJYld3WmRo?=
 =?utf-8?Q?+AnwtykNrUNA+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 14:03:12.6357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22333bd1-bcd3-4e0d-347e-08dc646747c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

On 2024-02-29 02:00, zithro / Cyril Rébert wrote:
> The xl command doesn't provide suspend/resume, so add them :
>    xl suspend-to-ram <Domain>
>    xl resume <Domain>
> 
> This patch follows a discussion on XenDevel: when you want the
> virtualized equivalent of "sleep"-ing a host, it's better to
> suspend/resume than to pause/unpause a domain.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

You should include you S-o-B here to certify your patch under the 
Developer's Certificate of Origin.  You can read what that means in 
CONTRIBUTING.  tl;dr: You are stating you can make the open source 
contribution.

I tested this with a PVH and HVM guest.  suspend-to-ram and resume seem 
to function properly.  The VCPUs stop, but the domain & qemu remain. 
Resume works - the VCPUs start running again.

However, the domain destruction seems to hang on poweroff.  The VM 
transitions to powered off - state shutdown - but the domain and QEMU 
instance are not cleaned up.

If I power off without a suspend-to-ram, everything is cleaned up properly.

Have you seen this?  It's not your code, but I guess something with 
libxl or qemu.

> ---
> - Tested on v4.17, x86
> - the function "libxl_domain_resume" is called like libvirt does, so
>    using a "co-operative resume", but I don't know what it means (:
> - there may be a problem with the words resume <-> restore, like
>    for "LIBXL_HAVE_NO_SUSPEND_RESUME"
> - for the docs, I only slightly adapted a copy/paste from xl pause ...
> ---

> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 98f6bd2e76..ba45f89c5a 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -42,6 +42,16 @@ static void unpause_domain(uint32_t domid)
>       libxl_domain_unpause(ctx, domid, NULL);
>   }
>   
> +static void suspend_domain_toram(uint32_t domid)
> +{
> +    libxl_domain_suspend_only(ctx, domid, NULL);
> +}
> +
> +static void resume_domain(uint32_t domid)
> +{
> +    libxl_domain_resume(ctx, domid, 1, NULL);
> +}
> +

I would just inline these functions below.

>   static void destroy_domain(uint32_t domid, int force)
>   {
>       int rc;
> @@ -82,6 +92,32 @@ int main_unpause(int argc, char **argv)
>       return EXIT_SUCCESS;
>   }
>   
> +int main_suspendtoram(int argc, char **argv)

Maybe main_suspend_to_ram to be closer to the command line suspend-to-ram.

Thanks,
Jason

