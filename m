Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD5B388EA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 19:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096640.1451279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKIa-0000rd-G7; Wed, 27 Aug 2025 17:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096640.1451279; Wed, 27 Aug 2025 17:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKIa-0000ou-DG; Wed, 27 Aug 2025 17:51:04 +0000
Received: by outflank-mailman (input) for mailman id 1096640;
 Wed, 27 Aug 2025 17:51:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urKIY-0000om-L4
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 17:51:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2418::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63c6e8d5-836e-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 19:51:00 +0200 (CEST)
Received: from MN2PR01CA0052.prod.exchangelabs.com (2603:10b6:208:23f::21) by
 LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.19; Wed, 27 Aug 2025 17:50:56 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::c7) by MN2PR01CA0052.outlook.office365.com
 (2603:10b6:208:23f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Wed,
 27 Aug 2025 17:51:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 17:50:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:50:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:50:53 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 12:50:52 -0500
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
X-Inumbo-ID: 63c6e8d5-836e-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJyu1M/TZ95mwRjFJlwnz/tGDir5tByXWtqge7hAMpIzFjgxZfbdm+9it0eDuJO36MkF+pFPanIeAS2tnhNxRh57+Y338CA9nA1bo0lQssTBDzsoIC3D518GJlTG9nt4i3mX9dQlCAkfF5l5Zq6qXk3IGh2Y18waoCzn9SDrlQt6MsN4+j2QsGXPSkP7WUP2BXTieZuO51Z09UHQ/rp3kpM5BEblaTTlKyDrqgn9q3n0hgoZZHisyl7BqGXyRENlKXBOy/nK5QFTRAdvgazMcyZpCokhnvdXeiqnSL9jricA3Ge0q9f/EA/xtJ8ZXh5Xr4xx7NpReQL+5rGZNAKzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stB7/Muskj3g62ltWLB8R0YUq3th1wmrseeiuYbxT2E=;
 b=sE54pUpmw0i64ia2nfkEcnio7q4aXY9T8zZrVYa4QOCUOVCCh69KF3Db42ewVvbihsetRjfjHPrB71CMLrj4oL4oJad63pIrQaegTFBrM48MUYWozhhCY+EollBg4qQE0MHNaGWgJNS4RBHb6a1CeQszKGZSrA3o4Yk2m1CQj7Os8jhCN4Py4gC/TLByeSNjil5knEix0EPjJNY+dIcCoucbQ4sCbE1Jy3d8T7Jwo0GFJPBNdY9LSGezEW3mLeWfKGbJ8+6N6sSQtnb5kkULxM31b2DaqHTjSqUndGD69rNClWd+leZ3WuaaKQ58V6ECWdpcF+Ziiiiaze5HQ2CHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stB7/Muskj3g62ltWLB8R0YUq3th1wmrseeiuYbxT2E=;
 b=Yfz0gCGMx5ZmBoM6sBgn0L6itJ7mb58AA8mi9QVYK0Biac8fWmD2IH9sXUPjr4wBx0TWYi/EitcG/JDphNAa3i/xvBhb1zc4xrD/Xe6byoO/RidNoX/szQa0TFcMF7XSMg5rUMhutsja3f9ywfrvwDUCmBmEag6Vgn1H55kYJ6M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <05c49cee-d783-40e3-a4ce-da724c308a21@amd.com>
Date: Wed, 27 Aug 2025 13:51:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/11] libxl: libxl__object_to_json() to json-c
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-8-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-8-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|LV2PR12MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 94530674-1b51-44c9-adfe-08dde592450e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGtqdUNxMjFZM2pwMkVEUjUya0tCQ0hneEhXNG5ONExhSG9ldyt4SWljd0pR?=
 =?utf-8?B?Ym93VVMyaFh6TVhlaGR0YWpQU1FWOGtra0p0Z2d3MjRCRUFHQmRmTzdHWGVL?=
 =?utf-8?B?Z20wUnBtWkVOSzErbk0zclYrREhjaDRpTWkzMzhDUlpwZHE5Uk9ZSGJjd0JQ?=
 =?utf-8?B?S1ZyUWFRR1FSVm9leFVqdEMrbDlZRllxNTBYbHVRN2QxY25FSFM4ajhOYVdw?=
 =?utf-8?B?MDk0RnVSdTliczFjMythdjVBbGZ5VXFjZWpkUVRuMTJodklLZU41N2J3eUNa?=
 =?utf-8?B?QzNobmlpemVUMFI0Qk9ZRzY2VHhhZCs3a2pScDZUbGo2Nk5hU1Ywdk9rQjAy?=
 =?utf-8?B?eUk3ZE9zOUIwd2I3SXRzWG1pTGtCM1pCRi9VbHdzaWlhOXF3bEtaZXhJdzV1?=
 =?utf-8?B?eUZ5RFA3NDh0M0MrN2xiR1RzU2ZIeWRnZWVsT2Q4Sk9XTjByaG91ZXFuRXRS?=
 =?utf-8?B?cWw1R1hWMmRDRHlNNDQ5ODkwa1N2QjlRNlVweWxOZGdKZEFSWFdkbWVaSVVq?=
 =?utf-8?B?eG9PUlJHTnFQaVBLZTZHVWp4aEtTcitGcHZYbFB4QkRIK1oyU2ViaGJBZ094?=
 =?utf-8?B?eVNsZGs2N1ZjbnZ1aHBHY0tpK3ByTk92ZE0zbEp6aWlHeEhsOFRMYTQ2ZlZT?=
 =?utf-8?B?bHE4M0JDVmFadm5adnllTVlWMVNEM1J5bmU5WC92YXpOc21jR0w4UCtxWk0w?=
 =?utf-8?B?NGxIUGo5bkhzUEpJSTVybTFlZ0UvdHJZeU5xaVVVaFBjc21XZGx5THR2c2JF?=
 =?utf-8?B?cFMrdkhRcXh3YkI2M0FDVzFVWXc2ZGZjMTJ2T0dwdkZ3ZFdDUDlBaXFNUEo5?=
 =?utf-8?B?TkNNK2VJQXNTZlNmc2NwVHE0dEtYamNsMUJDcnZzWDlKL3hibFprK2ttWlRN?=
 =?utf-8?B?VnpUd3pGYUVCd0NSM3ZVYWt6akthM1N2NHd0dHZ6R3pKOXlhVUV3WmZSTHlE?=
 =?utf-8?B?TnRWbUlXUEF2ZmsvaS81eStsOXdrayt2NUZ2aE9EVFAzK0Y0WjlXZTMrQzBs?=
 =?utf-8?B?dTcyYnIzaEJoTFVvdjZYNGJJeTBCQ3hSL21tU1RCUkhVL0VSVHdDczc0Z3Jh?=
 =?utf-8?B?YWFjMWZZZmlCbXIvdG1xS0c4NHFjb2pXRkNuOFM3L1FwR2hHSDJDY0R0emdF?=
 =?utf-8?B?dkhEZHBmaXh3ODh4cDVnQWVzeXVpMEVBN0kxYlVOb05jZDkxZzlibGJTR3U5?=
 =?utf-8?B?OGwvY0Y4cWhZTWpwaUVaUk81TDE3c09wUDhUQU5oVDZCS2VGNEc1SHRuTEJr?=
 =?utf-8?B?UE14Z0c2V2pNbUNpbGpYV3RCY0FzcGpSeG9Ha29yVmR3WFNCYTJlaGhaMk5L?=
 =?utf-8?B?VTNhcnkwcEYzY1Z3OFhaZnRZTTNxejd5alN4VzhaRlR6aVpockYxTjBucEhX?=
 =?utf-8?B?dE5BbXFBS3NiNzdXYzYrVitvM2d0VndSKzNWUENJdWhXY2tYdjc1U0h4ak04?=
 =?utf-8?B?WUZqNFVlNnVZaGUvTHpFR0RNSGJyZUlJYVFCR0JUWHB0V0JkSjZoU3orTllP?=
 =?utf-8?B?NlJMRFZWZ1EvL3dKL0VHaHZHZXZqaVZNSm5xc2x6bmFmdmV2Q0EwYUg4NFBG?=
 =?utf-8?B?UGZWUGZ4YnprRmlnYlRMSE0xZnRHT3UzSWFYNEkxcHVtQjBmYUdhcWlNK0J2?=
 =?utf-8?B?S0FPZTBNUEx1aEhmV3NKUTNLQnB5YkNIT2NLWVRlaXJacmVTdG5Vc0NkeUJq?=
 =?utf-8?B?V0J0REE1WmJOZXplNkJpVS9rQ1ptemErQ3gvSFJnUldnK3preHdrM2ppbVhs?=
 =?utf-8?B?NmcyNkdzYjFMWmVRdnpoZnBlZm5yY3h1UkVtUGpsOUtOOWlQOXhTb1kwTi84?=
 =?utf-8?B?TTV0V0FlUmE1K09PaFZXRDk5bnpQakhmRHBLZHFNcVdRdnR2TXRRTXNFZVd0?=
 =?utf-8?B?bHBrVVFsdlgxeHFTQzNjNHQvY2paNkxOWmUrbnVONG8wcHNDWks1SmozRzJN?=
 =?utf-8?B?aHVJUFBqamJway9MbHBKU0RVV2lYbW5xempWS1BZdGRueVJ1OTVVLzR1TE9v?=
 =?utf-8?B?MXpJcVlreWVLd0g5WWJOR01uaDBvS3J1aXUva2Q4QUtnMEtYcko2VVdnV2dU?=
 =?utf-8?Q?FxrvTv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:50:54.2610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94530674-1b51-44c9-adfe-08dde592450e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750

On 2025-08-08 10:55, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> - libxl changes:
> 
> While doing so, we rename all "*_gen_json" function to "*_gen_jso" as
> they have different prototype. All the function pointer are been cast
> to (libxl__gen_json_callback) by "gentypes.py" when generating
> "*_to_json()" functions.
> 
> We also introduce a few more "*_gen_jso" functions for "int" and
> "bool" because we can't use json_object_*() functions from json-c
> directly like it's done with yajl.
> 
> To make the generation of _libxl_types*json.[ch] with both YAJL and
> json-c we add "--libjsonc" to gentypes.py so it can generate
> functions/types for both.
> 
> Also introducing "jsonc_json_gen_fn" in the IDL, to be able to point
> to a different function when using json-c.
> 
> Also, don't export any of the new *_gen_jso() function, at the cost of
> having "_hidden" macro in semi-public headers.
> 
> - xl changes:
> 
> Also, rework the implementation of printf_info() in `xl` to avoid
> using libxl_domain_config_gen_json() which isn't available without
> YAJL. The implementation using "json_object" call
> libxl_domain_config_to_json() which generate a plain string of JSON,
> which we parse to add it to our own json; this avoid a dependency on
> the json library used by libxl.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

> @@ -358,6 +535,36 @@ int libxl__mac_parse_json(libxl__gc *gc, const libxl__json_object *o,
>       return libxl__parse_mac(libxl__json_object_get_string(o), *p);
>   }
>   
> +#ifdef HAVE_LIBJSONC
> +int libxl_hwcap_gen_jso(json_object **jso_r, libxl_hwcap *p)
> +{
> +    json_object *jso;
> +    int i;
> +    int rc = ERROR_FAIL;
> +
> +    jso = json_object_new_array();
> +    if (!jso) goto out;
> +
> +    for(i=0; i<4; i++) {

typedef uint32_t libxl_hwcap[8];

I see this is the same as the yajl implementation, but should this be 8?

The remainder looks good:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

> +        json_object *jso_value = json_object_new_int((*p)[i]);
> +        if (!jso_value)
> +            goto out;
> +        int r = json_object_array_add(jso, jso_value);
> +        if (r) {
> +            json_object_put(jso_value);
> +            goto out;
> +        }
> +    }
> +    *jso_r = jso;
> +    jso = NULL;
> +    rc = 0;
> +out:
> +    json_object_put(jso);
> +    return rc;
> +}
> +#endif
> +
> +#ifdef HAVE_LIBYAJL
>   yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand,
>                                        libxl_hwcap *p)
>   {

