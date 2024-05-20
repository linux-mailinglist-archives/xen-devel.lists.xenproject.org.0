Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56838CA2D4
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 21:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726349.1130624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s98t3-0005vx-3C; Mon, 20 May 2024 19:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726349.1130624; Mon, 20 May 2024 19:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s98t3-0005ty-0P; Mon, 20 May 2024 19:41:33 +0000
Received: by outflank-mailman (input) for mailman id 726349;
 Mon, 20 May 2024 19:41:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l4Ei=MX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s98t1-0005ts-6E
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 19:41:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f71861-16e0-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 21:41:28 +0200 (CEST)
Received: from BN9PR03CA0298.namprd03.prod.outlook.com (2603:10b6:408:f5::33)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 19:41:24 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::5) by BN9PR03CA0298.outlook.office365.com
 (2603:10b6:408:f5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 19:41:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 19:41:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 14:41:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 14:41:23 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 14:41:23 -0500
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
X-Inumbo-ID: f2f71861-16e0-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KO9xZjlJUUrGjV65aWvIEgQhVmPDSW9u69t0phjRLDUl4M8JZxvapQUNC8NK4w2p5DXl1tCaDInvz8QwGaS79E3+BllY7/LlwWq67Oa6D5hOQjrSLqQgqNIqm5VEb2STDdm5/GEA1I+Uw3+vVW6oFu6CnJNd2YVu8MgIeV2gC0keQezTVD4O4907IrLUamB8bCApgGq6j8swy4WQM+qgBwLeCs9re80lCAlBw+JGszZ/lRhWtvYovMAOsm4gy8P83jafaxO44jQHATzi1klNuCtNOm9ETLwXlTOdhOETp5rWVo3ivBnk+kQAHPcTMKfEshcas6R9g1Q3akNt78N0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpVi/t7xur6IAV/kp/Bqzy90KKAo4YAaYUnQfTVA5d4=;
 b=h+lREDkXJDghQVRkoULhJCzjM6ExmugOBfT5mJJgMjNTD0GRNjqEpZ4ZSmJIH52sZ4GG9gSeNYKB9Nt2LYIw2UZXm4kjG3my/PpeQQPt44YVdh+laV8xUqvIWZjZd46e1DZ/MCVMPiJq2oXFW36rEJTo43PtUB9oIe3J5ONQoXf4iVNeYqM4EYAQBi4g+0ISFqSdvXt4Oq0qpBz0CPpgOZ8j8T3v8N757ZdtnB7qW4k/DRDgFUm0x2uKuQA3febXiegc2Dg52f7IUYUkEPOiQ5E8ivb4cEXB5aMr49wHESLVGJhUJgEe1XJJhULb31wwGo0FTCVEZk+WrbknFqn8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpVi/t7xur6IAV/kp/Bqzy90KKAo4YAaYUnQfTVA5d4=;
 b=RfQ1fDhR+4yg0YMkfffhatYUny0jIZW1sVG0nywN62Zx9nz8miZ8l7aPdoIw5vyhKTV91eF5TUQkCdpg0iEHmC2s3qQJp5VRtf2sERhqYzqCTYle1PXOTGqEJ9ROuXUWpf6zzFL6C46hnpU9oElpZ5CfcQOkhoQscF9Cen4x+EQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6a04ef17-2580-4f62-b377-aad2ebbcdb5b@amd.com>
Date: Mon, 20 May 2024 15:41:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] tools: Introduce the "xl dt-overlay
 {attach,detach}" commands
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-8-xin.wang2@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240516100330.1433265-8-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: b3409caa-32cd-4db4-db97-08dc7904d505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFdZdmJsUmtVS3dDNFA2ajJYamF3LzFmTmtiamp3M3hBMUhNTndJSGpkOGdL?=
 =?utf-8?B?UWxFemIzVzdjYk10dFNTM2pmSmJsRmI0cmcrWkFHNTJhVmpya0JxOFp5R1hH?=
 =?utf-8?B?UHphL2x6eHg4R0dkeUFCT2NtQ1JLM0d5d2w4VjJQdEpGdExpU0FRWGt5YmY0?=
 =?utf-8?B?eTl0U09kTncyODlOTElscEFEZzNZUHVhR3NOWTc5NWFYS0JITWoxdnpIbzcw?=
 =?utf-8?B?RWh3YzB2bkJkVkg2WEIydTVTcTJOd2xlZkE2VkYxK2huWndTNi9HSlVETWZ5?=
 =?utf-8?B?VFpQZ2Q0aHNIQ00wV2h4N1NkUjNZekNSaC8rN29RelRnbGJoc2VpY3pIWmpI?=
 =?utf-8?B?dTB5SlYzdkwybGtvVk1qTmFBcUNEU3N1aGI3ZWtlV1RDWlJFdGZoa3dGelpT?=
 =?utf-8?B?d0tHNUI3aUhkcFpJbk5SdXpXVktiNEJueGxvWXBtcU50VlRLM2FSZm9tNjR3?=
 =?utf-8?B?aDg1VlJZajUwdTRibzZCZlhzakEvUVBQSjROTUFEMmVCOTBoNXlQQmdycDdm?=
 =?utf-8?B?c2lsTXI0SnFGbUptSjlVMjRvb25LTXJwRnloaGZZVGg3cE9KTEsySTYzeWZE?=
 =?utf-8?B?ZUV4RmF6SStORnNwZXJiTzZxTEMrdS9kV2pIbWFjTDBzQUpwdkl5eWsxSjda?=
 =?utf-8?B?Qm02SE5HdG8xb3hCREphVW1PWm1pL29UQlFFeFU1UjBPcFFza0x6alVEaEZR?=
 =?utf-8?B?S2ovZlB1enREeTNBTlc0L0FnRFZpRE1Ta052cUxCNDZoNjg1ZXVBdXdsdmdF?=
 =?utf-8?B?RDVtbC80QmZCU0daWHNlWnJuNC9CZ3F5c3NNaW5jdmFoQWtCK1VwTmRGVlFX?=
 =?utf-8?B?L0Jvb0hRZTlQYnZwUll2bXBveFk1aFdiZWhSWFBEaXZHN1AyRlMvY0YyWUt4?=
 =?utf-8?B?bGMwakNpakc4NXVscW9kcVNmTVpJY1ZFdzRpakUyOXVQK3JTenNZYWpXOXRk?=
 =?utf-8?B?UE9SRURnM0ZoYmIwZGhGOGhOaTc4ZWlpdUllYWs0aUhTTCtQVTFiK1M5SVQz?=
 =?utf-8?B?aGNWMDdJQlltdkJyTThOeDhBVVhOaXMyeWJqeU1LMHFxTXJ1Y1lhYlNOVGRX?=
 =?utf-8?B?MWJ3V29xcVh1TU5LN05MK3dFNmhiK2tYb1BEcTNxQmdnTTBWNnZ2TG0xQnRO?=
 =?utf-8?B?OTRwLzVkb0xneWR6RFhJT2JSUXhjeSsxYzNNSXFidVJjdXBsR1ZlbkNDd285?=
 =?utf-8?B?c2k5Nkhwc0wrcVh5UExQN2xGVlBOanNxSmowM3F0cHpMZFUyQlhFbFZEUld1?=
 =?utf-8?B?R0lIRURZZTl6TllIWGVWYWRSR0N5KytNMXRWc0xLTFZYcFN2UHhrVEZpQmNm?=
 =?utf-8?B?Vm9YOGFDaXViakpQTmxvd3RYalhaTUlmQkhuUG0vZlNOWkoxY2pJSEgwTlZ2?=
 =?utf-8?B?bm8yckZEY3dZdmpPZDVzRWV3YjN6SFB1elhxMVJKQnVENVpUdkZCMndMekV0?=
 =?utf-8?B?YUpRT0QrY1orcXMyVENnZ0duZDhVQ0krMDJBZUtEVHd3dUhzbmFSczhwNjk2?=
 =?utf-8?B?cS9DT3l0emVwRFBWVWhpS2tTL3hkQi8xd29heDRnYzR5azVWTU5NMWZIRlVW?=
 =?utf-8?B?WU1EQzZnVW5sd2hrMmN0Q2w3SHorelh0N3R0eWJObldwbTQ2OTJYYUFWWEZ3?=
 =?utf-8?B?bEhweEtTMnhVOXd6TFJZeFA4QVBIeVVQeEJRNHFYL1hVNkNLZkZmZFUrdGV3?=
 =?utf-8?B?dTR5RDA2R3hFRXBiMktaM054K0NXQmVHemhaZEhCdjI0T3RqNGk4REY4T0w1?=
 =?utf-8?B?L29SdVlYd2tJcHJhU0s1a3J1Z3cyQVIvUk0wWW9XUXVJSk5QT0g4bS9lMVRI?=
 =?utf-8?B?VTg0YkZXc1ZUVE5tZUNmRnVTSElIeG9hd2JZQzRxdkRiN3gzVVNhN1dMWlk5?=
 =?utf-8?Q?qMEyP5jLbD8yP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:41:24.0216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3409caa-32cd-4db4-db97-08dc7904d505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800

On 2024-05-16 06:03, Henry Wang wrote:
> With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
> attach/detach devices from the provided DT overlay to domains.
> Support this by introducing a new set of "xl dt-overlay" commands and
> related documentation, i.e. "xl dt-overlay {attach,detach}". Slightly
> rework the command option parsing logic.
> 
> Since the addition of these two commands modifies the existing libxl
> API libxl_dt_overlay(), also provide the backward compatible for it.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - New patch.

Mostly looks good.  One small thing below.

> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 02575d5d36..53d1fa3655 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -1268,32 +1268,43 @@ int main_create(int argc, char **argv)
>   #ifdef LIBXL_HAVE_DT_OVERLAY
>   int main_dt_overlay(int argc, char **argv)
>   {
> -    const char *overlay_ops = NULL;
>       const char *overlay_config_file = NULL;
>       void *overlay_dtb = NULL;
>       int rc;
>       uint8_t op;
>       int overlay_dtb_size = 0;
> -    const int overlay_add_op = 1;
> -    const int overlay_remove_op = 2;
> +    uint32_t domain_id = 0;
>   
>       if (argc < 2) {
>           help("dt-overlay");
>           return EXIT_FAILURE;
>       }
>   
> -    overlay_ops = argv[1];
> -    overlay_config_file = argv[2];
> -
> -    if (strcmp(overlay_ops, "add") == 0)
> -        op = overlay_add_op;
> -    else if (strcmp(overlay_ops, "remove") == 0)
> -        op = overlay_remove_op;
> +    if (strcmp(argv[optind], "add") == 0)
> +        op = LIBXL_DT_OVERLAY_ADD;
> +    else if (strcmp(argv[optind], "remove") == 0)
> +        op = LIBXL_DT_OVERLAY_REMOVE;
> +    else if (strcmp(argv[optind], "attach") == 0)
> +        op = LIBXL_DT_OVERLAY_ATTACH;
> +    else if (strcmp(argv[optind], "detach") == 0)
> +        op = LIBXL_DT_OVERLAY_DETACH;
>       else {
>           fprintf(stderr, "Invalid dt overlay operation\n");
>           return EXIT_FAILURE;
>       }
>   
> +    overlay_config_file = argv[optind+1];
> +
> +    if (op == LIBXL_DT_OVERLAY_ATTACH || op == LIBXL_DT_OVERLAY_DETACH) {
> +        if (argc <= optind + 2) {
> +            fprintf(stderr, "Missing domain ID\n");
> +            help("dt-overlay");
> +            return EXIT_FAILURE;
> +        } else {
> +            domain_id = strtol(argv[optind+2], NULL, 10);

domain_id = find_domain(argv[optind+2]);

And you'll get name resolution, too.

Thanks,
Jason

