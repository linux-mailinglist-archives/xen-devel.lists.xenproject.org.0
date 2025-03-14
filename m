Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE26A611D9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 13:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914557.1320281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt4cO-0002XT-0D; Fri, 14 Mar 2025 12:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914557.1320281; Fri, 14 Mar 2025 12:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt4cN-0002Vu-Ta; Fri, 14 Mar 2025 12:58:27 +0000
Received: by outflank-mailman (input) for mailman id 914557;
 Fri, 14 Mar 2025 12:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3qFj=WB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tt4cL-0002Vo-T8
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 12:58:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02fb0d4a-00d4-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 13:58:23 +0100 (CET)
Received: from MW3PR06CA0002.namprd06.prod.outlook.com (2603:10b6:303:2a::7)
 by DS0PR12MB8270.namprd12.prod.outlook.com (2603:10b6:8:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 12:58:15 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::8) by MW3PR06CA0002.outlook.office365.com
 (2603:10b6:303:2a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.26 via Frontend Transport; Fri,
 14 Mar 2025 12:58:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 14 Mar 2025 12:58:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 07:58:14 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Mar 2025 07:58:13 -0500
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
X-Inumbo-ID: 02fb0d4a-00d4-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU/qvvMCzouYqW1AXYVih1Kc+xlxEct5WCo+ZGbVAWtAX5QqbGDooX4OlAWOFDyBHsf5q4LWL6lWgy1Z8uSX1HZcL2+ngW/UHcrA+FUM+xLAIOCxO44dT7LA1hdpoNgvPLptJI/6GNWjLAS5/2nyRbOLCFO5qnPaMlC1sXCAd+b8phUKaT1ds3MWjH+nXlHBwgAtoK8nX33LiL9xP7qxWQoVjChNrV9PWByznzr2xQsv1o0yuOyDVTT56E8zaxmTLpU78/TfHb3l8e6sD2b30rqhXKQQ3hKtaH8mQBfnZZndcacODt8okUnMjEnLN/mN0uCRZUpEDgmMagXpvIXC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFOLi0UTvjw25NFi2GoIi3wrylRvqqhM+2dOk51oVZs=;
 b=M0rSPzfOBl24+OwlcKgHxVA+uCPOTyIHmcLg9pY98hK3sqm06cOB46dhFIyC+XNZCQBqwIwZcFN7FD0FgoAGhOOz3X3BgNK0/isHRMJzeCJ4Q8JqeIPj+eYZ81J7whOfbY0xOt4QA6ITVWi2oZgPXJRr/t8Apy2gjE7b7Gc6w3dO1vVwMWOYLe1mAS1baLzzPZ+5o0RU7pQ6Rwdzjc6c4wew5hQRICwPDOUXCQ3h++TdwqAF3Dqx2P2lBHrIhQ9xXMNoyRhxHJr3lx1ib3FC6x6vQMwLMdKsmUv44p8WFB96oXp5xZpa7X+A03x77Uf9PP1z59apyrjviJck0uDdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFOLi0UTvjw25NFi2GoIi3wrylRvqqhM+2dOk51oVZs=;
 b=1n42Sw7zFBePENjwesRkEkpoWhxrgewcLcUuXa7e3iDcGLnZlVCWKIZIySCh7inLVDJkTzKNj0jX0dE3gFvUX5LaLE5oXkjRMTRnuqmDRVRMOshbCUT923oLhRTfhrdM5oAyK18Ft3ErUgHRyetHZyVdj6WAUEqu28d/jQYUjII=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ad4dc21c-c674-4e17-adac-b44aafff6149@amd.com>
Date: Fri, 14 Mar 2025 08:58:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] tools/xenstored: use unique_id to identify new
 domain with same domid
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250314121835.1879-1-jgross@suse.com>
 <20250314121835.1879-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250314121835.1879-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DS0PR12MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c1f1b8-4b0d-4932-9046-08dd62f7e24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzhFN2NQK1gxelZiblRoa1A4cXcwQjQwVkc5TlVzSmNqbFd5R2dLTXZpZXR3?=
 =?utf-8?B?Rld5c3BocWJwem5LMXJXbEVHMU1KV3BEMjRtKytJUHUxUTl6ejRVZUQ3ZmJq?=
 =?utf-8?B?bHUxVGdHM0lHM3l6OWlTLzhZMENWSjFXQitsSktYSEJPTHN5UUU3b05BNFJz?=
 =?utf-8?B?dVB1VE1rMUdPSGFzbWNQNTZ2VWl4d1FtQ3ZZMDYrTXBCbWpFcEFJVXFJZzRB?=
 =?utf-8?B?Tjd3SXczOTVVbkQrZ1RyQmxXeEFjNkkvS1ZtRlcxY2pWZTJRaDBsVHhhL1pJ?=
 =?utf-8?B?SVA3dXJwblRNS0FJcjdDY2NVTW9WQW9FbWFGQ2dSeDlPRlBIK0thMVBSVm5z?=
 =?utf-8?B?SEowbFpOSHQ0MVovMS9zOTdNMTNnMUlMZmNIbkU3Qzk2d29TK1htK1VLSDVI?=
 =?utf-8?B?S3JXVmlhR05HOWxTNnNSUkR2K0pLWU8rU2FmY1U0ME52TllIU1ZaNlo2QVFO?=
 =?utf-8?B?K1lZRXRiWkZ2VllySGJzZjFoYXl0cWxXM1JhOUtvMGwvVHBzeWVsbzZVczlt?=
 =?utf-8?B?N3lIWnFnT2FUbjhmdmtYcmVESldlS3ZreFBGbVY0MWFqZWRNTGttK3NDUVRt?=
 =?utf-8?B?S3ExUkxrYXpZWm5PczdacFJNbm0zTThXT3l0VGMxeEJFakZFeGJLK3Z4bEZQ?=
 =?utf-8?B?RTBJRFZ4M1J6WWpNV3VEajA3akNZdkVGOUk2empsN3A1bzk2VlB0cW5Oc3dp?=
 =?utf-8?B?M2g3S1ZJdHk5SjgxRTFvaHBGVTd2SDlUR1AwcFFsblNBSVdLTGRva1BOalRv?=
 =?utf-8?B?dUdYdWUyTDFUMG5FanBuSHZHTThaSWVHN0hXYlp1M0NPK3Y3b20xM3VyMGpn?=
 =?utf-8?B?QTY0alJ5SXBFTE1DaU84YmlRL0J0YTU3U1Z2TEk1WTVkS0wwS0xnODFxaHRS?=
 =?utf-8?B?eElnNEtIUHB2eEZqRENUS2dXd0dWcFpiZDZCWXZYQTBEWWZjbGhsNDN0Y1h4?=
 =?utf-8?B?Tmo1dkl4ai9FQTRkUjlrcmFpZkhGMG5zbE96K3JRSWpFR0JmVVFIbWhmWTRr?=
 =?utf-8?B?UkVTRVBENm1nRVhLbGJ3UE1vQUdiWlhsRmNqaVFldVNLUWQ1M1JySDJ4YTBo?=
 =?utf-8?B?b3B5bEdqK09iTUUvaDZkYldCeEY2V1JvL1hiWDJadVprZUZjL3ZoUWRQZVhp?=
 =?utf-8?B?UkxLcU9OMGNjQ3hBcG1jNEFoU21pUDFIcUVhSmJOMG0vcWpzQ291RTJoNUtY?=
 =?utf-8?B?OU9FZG91R3o5R0p2TStKWlpieVhhYzFpRjVFR1VqSGZ2QnRIdUl3VGZsQnVP?=
 =?utf-8?B?ZzNydFB1Sk0yclQ4dkxOZlRKcDFtaE5PNHhmdFIzTVlnaEE3WGdRbzQ0UFZk?=
 =?utf-8?B?anR1c25CQzQvRDRsMk1Jbm1QWFpibm9TWEE1ZjJoVnoxSzI4TFFscnZOWE4r?=
 =?utf-8?B?VTdjRFo0NmYzOEp6Ri9FaDZiSWdlRW15S2RjcXdJT0Fza2FiUHk5aEt4dHp5?=
 =?utf-8?B?Y0pqWk9hUUlPZFExVStEYWpHeUs4N1NGMXRLZWFsK3V4SUdYejhCYlVPRUZH?=
 =?utf-8?B?RmdHMDg5Um5YTFZTR1lpRDgvNFZFRHh2eG1LMXA5ZC9EbUdsQUM3MkwxSk5G?=
 =?utf-8?B?anpabVpjNFI3cEhzMVJGVFIrSW1kZG4vUkQ0SEZBSG50NWoyTHZ3MWdnZSts?=
 =?utf-8?B?NnNETEVpQll4dkNnSm1uVVliNzNvUDdFSmgwL01UcGFhY3RyUXZabkNwUTRN?=
 =?utf-8?B?eDVqL1o2Vmc0MzM4REY4NzZ5V0RKVnJEb0R3VnE0dURCWkdEbjhPdnhTT0Ny?=
 =?utf-8?B?VkZZWUNodjMvWUZscFBYRWdUbE4yaXZBejJ2NHJRWm1zU1J6VU5VTWpQY1dW?=
 =?utf-8?B?R3R1V2gzVDBET21vOXZFQkhVdzZac092NzVORG1SNHlHbjNPY3Njb3B3eVV4?=
 =?utf-8?B?eUNhVDFJcHJpa3U4bERFQjRpZzYwcVdNdXdvM1FCWFk4WHVSc0pxam1zaHls?=
 =?utf-8?B?eWQ2MFlER1VtNnI4UFhaTDN1L0JLMkNxbUQ5Rmd4VDlZTnlsbnNOc3VibjA5?=
 =?utf-8?Q?uFHPLHDasng0rJ0rrzVYyAIjt4MtJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 12:58:14.8341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c1f1b8-4b0d-4932-9046-08dd62f7e24c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270

On 2025-03-14 08:18, Juergen Gross wrote:
> Use the new unique_id of a domain in order to detect that a domain
> has been replaced with another one reusing the doamin-id of the old
> domain.
> 
> While changing the related code, switch from "dom_invalid" to
> "dom_valid" in order to avoid double negation and use "bool" as type
> for it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V8:
> - new patch
> V9:
> - adapt to different LU-record layout
> - "dom_invalid" -> "dom_valid" (Jason Andryuk)

Thanks.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

One thought below.

> ---
>   tools/xenstored/domain.c         | 65 ++++++++++++++++++++++++++------
>   tools/xenstored/xenstore_state.h |  3 +-
>   2 files changed, 55 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index a6506a5bb2..fc0992d3a5 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c

> @@ -1778,6 +1811,14 @@ void read_state_connection(const void *ctx, const void *state)
>   	conn->conn_id = sc->conn_id;
>   
>   	read_state_buffered_data(ctx, conn, sc);
> +
> +	/* Validity of unique_id will be tested by check_domains() later. */
> +	if ((sc->fields & XS_STATE_CONN_FIELDS_UNIQ_ID) && domain) {

Is it worth adding a sanity check for the other bits in sc->fields == 0? 
  And a check domain != NULL when  XS_STATE_CONN_FIELDS_UNIQ_ID is set?

Regards,
Jason

> +		unsigned long off;
> +
> +		off = sizeof(*sc) + sc->data_in_len + sc->data_out_len;
> +		domain->unique_id = *(uint64_t *)(state + ROUNDUP(off, 3));
> +	}
>   }
>   

