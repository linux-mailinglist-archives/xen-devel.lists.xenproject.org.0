Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E718F9958DA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813574.1226573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHGu-0006Pb-VW; Tue, 08 Oct 2024 20:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813574.1226573; Tue, 08 Oct 2024 20:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHGu-0006Ll-SG; Tue, 08 Oct 2024 20:57:32 +0000
Received: by outflank-mailman (input) for mailman id 813574;
 Tue, 08 Oct 2024 20:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syHGs-0006FY-V8
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:57:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2412::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edde391e-85b7-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 22:57:30 +0200 (CEST)
Received: from MW4PR04CA0126.namprd04.prod.outlook.com (2603:10b6:303:84::11)
 by DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Tue, 8 Oct 2024 20:57:22 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::6a) by MW4PR04CA0126.outlook.office365.com
 (2603:10b6:303:84::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24 via Frontend
 Transport; Tue, 8 Oct 2024 20:57:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.0 via Frontend Transport; Tue, 8 Oct 2024 20:57:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:57:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:57:20 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:57:19 -0500
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
X-Inumbo-ID: edde391e-85b7-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTbbbvji3c6B8RK2b6upbhJ79xkYaYv8Vzyx0J/dOt5YGaPEcUaniAODc6WelDuIliQvv7+jBbD2qOYCAAcJO3hr7gNlebDjaWhT5NI38cKxc+Wi/zo6dA8aRhiV8dtedGRjI+HRNoLw8s5Mf1olbGVY6K4m4h3pTc/3GwJOqXCoHMhVycNRJobSbEz1C1R2JlL7UYrRMYvSbmKzghePLG+ZrwcZQcSzboESE5nufBzfFbuFg7aWf/M/oNqo5Ko9M3Z75iXHMTyup6G/20LcfvF2HrL90Zo/kSM6Bd5vqeQ/Dud5Utiwq5/P0iId7zUEn/7UV8vyaUongLN7K61J5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5h5S6DOHDJCzzNCyyo0bCfCbK8FjeqxMoSEmOLCDoiE=;
 b=kCTocmqgjVDNMD5owgZC2c/x8bWp5YSnn7fLafNyBs6A/EZSQwC6LrNUIMxSKteLN/EnW4CCwTlCQRdbB2bTl+mFBWYZUIA5OFYTwiWiUbwpIpJ756F1AB/zcY4BCNKjrN2M/js9dSCn0w4xntX+bjt+lghPZX8rRyu1ExlNC23XGenxtXiE27Tw+oK++QvlWOnlcvez+6aujQddvSNeNDZDAvvsY+lrDqny3yvkj+NUV5TsdjCtHBJ4v1I3kIltvrm4c9BdAxPJ2jZZFyyiGvUmodGfAkEyrFLgW6Ftzwz2ujOSGS6LqqtgoBISMpvBZPh+uV2P7UZuLNQwcCcWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5h5S6DOHDJCzzNCyyo0bCfCbK8FjeqxMoSEmOLCDoiE=;
 b=bVssLvdJZcKFBpN/mwSb4lo4z7Hd5a3ODqFQkz4d/5eYHxnNGC0q0ATldJHkLrIqOYQhOqYb581eX7LEf6kmRUweRb0+wmbLi61DS+HwY+x1O3X9GH/8zEtTmYX7AtNKmWo7TmpDZoFlTrjmitMs1pRFf4ECFM33K3lhQEO4g50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <22c2165b-c2cc-4091-b808-b903fc954757@amd.com>
Date: Tue, 8 Oct 2024 15:56:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 44/44] x86/boot: convert dom0_construct_pvh to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-45-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-45-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|DM4PR12MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: f861ee02-9da6-49d7-c136-08dce7dbcdf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlVkQVU3eDN2Wk1qNklIaVlzTlUzRHBTd0E5SUdzMkdJZE8zdFo2ako4SUNY?=
 =?utf-8?B?ODVNc2FETW43WTJhWVExcmJoMko4SXVRTnZGcWxsS0VHTWcrT3ZGb1l4NVFj?=
 =?utf-8?B?MEpRVVdLRHQyQk5EcVUrRGlaZ2d2OWgwKy82M2F6SGNNNkFCV0laSlh1WGgw?=
 =?utf-8?B?dVRsVVJWM3ZDbWd1T3dMaTkrZ3pRRVlwNDJ6SFdjWklOaS9LNjhCdFB4WWhH?=
 =?utf-8?B?YUtZUzIySnErenREekVBcncxQldPVWtvZkYzMGZQQS9IR20vTURBTFpEMlFq?=
 =?utf-8?B?eHRMRkh3S2tSV254aEtOb3BiNnAvY1dCQ1FDYithRmpOd2llVG5tbDllMGRY?=
 =?utf-8?B?Q01WbDlSK2lJSllhS3pQWFVmVk1KNjV0TlY4cXkzYmNnOVBxNThqVm5WeG9U?=
 =?utf-8?B?MUZ0Y2hBbFFUUm1CU1NRZGEyNWs1WENnUDJwdFgvbEVKNEY5bTBET1Qwc3FJ?=
 =?utf-8?B?WEcwY3dlNXk0anA4QnIxTU9IL3EzajVNS3RXeGUxaWpvc3JldVlNL2VXcW80?=
 =?utf-8?B?S0dISW1jU2hTMDd0UTR3TXQ5NTlTR0ZmNVNRbzAzQ2lxeWN1b3dXQVFLNHBS?=
 =?utf-8?B?bStGeHNQREQ1NXpPT2paVG5yd2o3bWhaMy9LejYwMDhwOW8xQnZ6Vzg1MkZS?=
 =?utf-8?B?K3dtZzJITXVlb2V3VlhwWWZDNFJqVit0N3V1bDRqQ0ljY242a29VdHdBSHpn?=
 =?utf-8?B?RmcrK0Y4WWM4ZU1jeWNXSWltZ2xaMTZndktnVlhMdFhSemVBL2d1VnU3ekNR?=
 =?utf-8?B?S1A4eTkycFNzS2xtcXAyN0RWSGxFYmZubnhOb2lJNmFxQjNUak5KL2xBTUU0?=
 =?utf-8?B?dHN6bTUxVUI1RlRSRlhjL3RRNEo5OHU4ZGZaTVkwY2dQU3RnWEdwTXRKVWpQ?=
 =?utf-8?B?eUdCY1lIbTFkcXFERGVLNnppa2pHM1dnRW5VRjlTTEpLVGpXSXNjWnBDRDFv?=
 =?utf-8?B?Rnc5V0NGVkpHWFFtcjBPclJyQXp4Z1h2YVhMMDFBUTNMaWgwNUZVcTViOWY1?=
 =?utf-8?B?ODh4a0w0VGRxUXJQVms5ZjdtT2RHY3JyV1o0eUNQc1NDSmxnd2Y2cU1sc1o1?=
 =?utf-8?B?Z1A2MERCWUdVOFhOaTJUNVBnMWMzSmEwZW5SNjkyWjdQRmdnY1pDUkZjL2s4?=
 =?utf-8?B?TE15VHlqclphMTFpdTUzUmFJaFJtWlNwT29GVXR5ejhVTWpHVGN1YTdjcXdj?=
 =?utf-8?B?Ykh0U3g0TzNDMTNra08xNjV4S2s1bVh2ZzdSSnk0M00zRE9YdGxCU2lPZk5B?=
 =?utf-8?B?SDlkTWJ5bUlBRmJRcE5mTUMzcHJBYTdLVUJEUzEwbXBhNEppSXlJUEM0VzhY?=
 =?utf-8?B?OGsvVmFYeWxXc2ZjKzVGL3RFV3k3WXFKZHoxMk9kclNqUml5TkhBOFlpck5S?=
 =?utf-8?B?RW9oMU9rcmdOd0loK3UreGNFZEJHUXhHNnFMWHVXM2hrREplYVJUNXpDN2JX?=
 =?utf-8?B?UUNLK3ZIU0FBQnR4VitNZEF5azdCT09GbGpDejU4VmpCL0ZNLytTS2czVXFX?=
 =?utf-8?B?Q2kyZzdtM2xsWGxOeHdQMFVuaGx0aTJiSkkrWmpDWFF5Q3hqK2RxKzhBTkgv?=
 =?utf-8?B?YTkwaTdOVnZVR0dxNkgrSUowR1dSK1ZFT2cwUEN3VFUvOGxjeE9jN0t1djVs?=
 =?utf-8?B?Ri9GTzBsWmUzajVtQmJGdGpHdVJkZDBkRVQ4amFEZkRwcXlidFhYZU80VUly?=
 =?utf-8?B?RmZYR3l4WHpSY0llWXZySmtJOXhLbm5QdXhSenZDaUtaRS9Oajk4eFA2Vzli?=
 =?utf-8?B?STJNemY2UmVhS1FPdEFtTWxBQmU5alVsYjBqSVk0UFdDek9qQ3Q1STIvS3dR?=
 =?utf-8?B?Ync5SWlQUWR3RXRWWUlTUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:57:21.7247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f861ee02-9da6-49d7-c136-08dce7dbcdf6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5769

On 2024-10-06 17:49, Daniel P. Smith wrote:
> With construct_dom0 consuming struct boot_domain, continue passing the
> structure down to dom0_construct_pvh.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index a3fd5e762dc4..755e257cdf30 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -1299,25 +1299,23 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>       }
>   }
>   
> -int __init dom0_construct_pvh(
> -    struct domain *d, const struct boot_module *image,
> -    struct boot_module *initrd, const char *cmdline)
> +int __init dom0_construct_pvh(const struct boot_domain *bd)
>   {
>       paddr_t entry, start_info;
>       int rc;

Again, I recommend using a local struct domain *d to cut down on the churn.

Regards,
Jason

>   
> -    printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
> +    printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", bd->domid);
>   
> -    if ( is_hardware_domain(d) )
> +    if ( is_hardware_domain(bd->d) )

