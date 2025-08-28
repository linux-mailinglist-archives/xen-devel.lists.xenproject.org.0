Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A47B390D3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 03:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097326.1451719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urRCI-0002VD-Pv; Thu, 28 Aug 2025 01:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097326.1451719; Thu, 28 Aug 2025 01:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urRCI-0002Tf-Mt; Thu, 28 Aug 2025 01:13:02 +0000
Received: by outflank-mailman (input) for mailman id 1097326;
 Thu, 28 Aug 2025 01:13:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urRCH-0002TZ-4q
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 01:13:01 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2412::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 227f0cd4-83ac-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 03:12:59 +0200 (CEST)
Received: from BYAPR07CA0089.namprd07.prod.outlook.com (2603:10b6:a03:12b::30)
 by SJ0PR12MB8138.namprd12.prod.outlook.com (2603:10b6:a03:4e0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 28 Aug
 2025 01:12:54 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::ad) by BYAPR07CA0089.outlook.office365.com
 (2603:10b6:a03:12b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Thu,
 28 Aug 2025 01:12:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 01:12:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:12:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:12:51 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 20:12:50 -0500
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
X-Inumbo-ID: 227f0cd4-83ac-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0xjUS8eveNKkceKVgUl04PTh24OPfVtIvTW/ST7T4GqVpfgRlReiRyKPvNvprethTQsb7gXmXDpfn+hxFcm0yPgDCBhSuPmzB/NkpkxlbzfOy1lLaodMDfFDMA/sfPHmL08dSEq7xHGp6X5uot3xc/EmIFCkq8TfQY1e97ArOh0mSFOMOICGcuuRbEf+H+lIIco7/Ns0WW9W2fU6gNNp2BC+zaMPxnl6U+9CmwgYM1iIDuS+hdMQfKn52L9xC1FcHddEEhX2GenM8LDcVsJ0Qla5eYO1fFOSC7HXjWg9ju7ou1bzs70+DiZD5rUdkV7+muSTVC0Zo7egEIiY2k2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeWl4L1ejDYaQX9EACJn7a7RUgsq2qYn/ZrHYswGs54=;
 b=n4TRHhw7EpAb1M1CmST20euyhqK2toPTaae9wKos84iK7DptDwwr8NZ0wRnBhZbbFOPK+nnidGQNEXqUHmF8v/BdKQPhcBNHgIH/SFuLn59JiIDHlae+0HhvVjCpkswDNQ6f+ipTADrL1d1euut7kmjqBR4AEPZuZaLSNgC5cOw+9KpqlWDxhgz3X7tsmzV9blA5je6D1S6H4q7o+O+USsuJwuV1W1D7M64j8zcKDir2M7QJst2Z5Q3FDWK59CZ08Agk4244cvXx+n2bheN1bcdCZ/DJAZzRlft2KtuyIO7djKwwQ/BW2P9FzbPseSECO2d6i1RdJtBGJsxvGOx0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeWl4L1ejDYaQX9EACJn7a7RUgsq2qYn/ZrHYswGs54=;
 b=Q++c1rRLv6eW+TTZ5meiH9D6rI0YcTLq5TFg3TAvVgZ83ApIv7R+6ThYefBVsX3DY2u0cMQXRR9vnvIZJjWP+be0UN7mPQ4PjpHLoyIzxX5xrIAIuJphbV4FswGNnvGEa0ZSbfa9QwmsNA64nOEiMtrkSvg9NikBoEy/CHH1H0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <01f134a0-46fb-40d8-924d-79ab864352e9@amd.com>
Date: Wed, 27 Aug 2025 21:12:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: respect unset video_memkb for Dom0
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <719c456b-927d-41c3-b28d-135a895958dd@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <719c456b-927d-41c3-b28d-135a895958dd@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|SJ0PR12MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1152dc-4ed7-4f04-4cdb-08dde5d0043f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHZlOVhJNWR4SHJqNGw4Q21PS2xLSUpvN2MyVmdtcEdNa0pVZzJudUdHZG5w?=
 =?utf-8?B?VkFDc1UxVFdEcTVGd0prcG5MNDFodVlDWlhGNm9nR28rY1E4RDRUNnVId1lh?=
 =?utf-8?B?Uk05N2NCSDlmZmpyczRoK0hoMHFBdW1nbDlQeit4cVlhRW5URG1abGZpSGtH?=
 =?utf-8?B?RDRGbUNLN3ZhbzA2L09NZUxpbEpyd2k3d3pyWTFDYlBwYmJpNTVYeUpSSHZt?=
 =?utf-8?B?TVcwRnc0cUlBcHNmT3lNSktVaTlVNElqbGt3QlRzd1BYMVBBTkU1d2oyOVdy?=
 =?utf-8?B?ay82SmFMVXgvdTQwWnd3N0J6OUplWGprVlpUbFNWUWJ1S1RkYjF0SUFmWWov?=
 =?utf-8?B?SDlYVTE5Sks5RGNMOEZMdTJsbGJ2SXBmU01IWTA1amR4djJEenNWM25LWTB6?=
 =?utf-8?B?SlRPdWx2T3pWbWpnSVoycVFReFIrN1lNK2owZXNCTTI4MFhNWFVCWGhqOHBN?=
 =?utf-8?B?RndJWXd5TEtLdDExdE9GUGFlV3BIcy9qUFhuRWJuRGtLMzBORmJJSFJQOUll?=
 =?utf-8?B?QUhDTUQ4L0VZSWptclBxMXdwb0t2Zy9RRUxiN2psdU56N0ZGV0NKOENtUmtG?=
 =?utf-8?B?aU1aRWMvSVdmRHd6NWFFbFNOellSSmRHTk1PUFNNVU5SSHcyN3VpQjFMUkI1?=
 =?utf-8?B?eFRYU1FNRjJiSGRvcm10ZjVJOFhTQjJ3NUZiV2wyVmNXWUlGdWlDbTdWRjNB?=
 =?utf-8?B?L1dieUlBdHUrZDRnbmhZZWI3Q3NHcnJqTGFMRWxpUld5eEg1WTFRejRsZ0Ju?=
 =?utf-8?B?ZmlkdkhKb0o1OWlHRUx4MzFoWjlubVRXTlYxY3FlM3ZMd0dvcDBGcGNpdEJL?=
 =?utf-8?B?QnZUV0p5ZngzS2RTOHN4WlVKQmJWK2QrS2dUSEdpRm5xcGhrRXNLQ1VkSU44?=
 =?utf-8?B?YURjNytBLytqcTBCWGNTMU1teEw2VnlaemVIMXU2VDBvdmIzU1NvRXpPdDY1?=
 =?utf-8?B?OEx2Z2FBTVpkZEowaE9LdlA0UTdselBGbXNteFM2eHFNN2phZlhyVXFOeFNT?=
 =?utf-8?B?Wk9adExEWURPRWdxUi9hWjJ0UmNTTG5yOG4xRlRMWmxXU3g4Q0E1MGllUVhK?=
 =?utf-8?B?SzByOFUwQzZhemFQMmlPN1Fxb3pPWk9rNTZHOG9yOThpM3ViVS9EZ0lJMWsw?=
 =?utf-8?B?WVRLMVdGR1JEMjlqRHR6NkhsVkUzTGRUTkowMnVzVGxSYlNnRm93blVhQnZR?=
 =?utf-8?B?Y2pmS3JlNEI3MUFJOUJLb1l3eEVPMHhxaVd6SWFGQjFMeEE2Y3F4WW5hdlR2?=
 =?utf-8?B?b09PWW9OOEI3SlZHNithRUpLRGpFTW94WWVFSWd5R3I0NVN4TFVYODBUQk1F?=
 =?utf-8?B?WVRJd3pxM0FwWGhRVjNadmhxSXdJd05UTUQ0MkZRaTZ5VnhBaE1mT2JYK1RT?=
 =?utf-8?B?WG9ZLzRRKzhuMXZJdnIxbkt6MGRTWldVbnF4N3B4cDdWVVJPMC9EbVhVeDdW?=
 =?utf-8?B?ZDBOYzhKRy9VNGFxbVYxd2FwMFJRM3Q2NFJKNnd1bzJpTVR4NFZDYmlibkdP?=
 =?utf-8?B?TFNQMnJkdWFIaHE1NXIrZkk1SHFMM2paQ1preStSaG5sa0N2czI2ZW5IaGp1?=
 =?utf-8?B?dml6cFJCTzhQR21GMGJ3bEp6STlRck5TdXdoMnhyQ20vNk5pYnliWTAzb0ln?=
 =?utf-8?B?bVljdzJyTlVWOENWREpQMkx1U0g5M1VXcjhXcG9scXhST0I4d2QxZXFDUm9u?=
 =?utf-8?B?WXFKUkN6UnJjVGtPdVlhc0YrSWlXc1hPQ09TYi9MdlVBd3dsR1NzVFJvSjZT?=
 =?utf-8?B?b3dEOFdBMUtZRTlTQllrM3ZhcjZBK1g2bEFOMkFsMXhqbTFla2p4dXZVYnpI?=
 =?utf-8?B?K2Zwd3dLMWtxRllSSGxnNjRsMVc3elJZSGtBV2FTL1pBYkNTLzZJWXNtWHVs?=
 =?utf-8?B?ekFkWWtZSnRGcFR6T0hxYVkyVEtHbGJDZm9nMm1tTXh3UHM3NEdZZTFGa3VM?=
 =?utf-8?B?QmprS0tyRTRhQlBMUThZYVRWMUpTZ2M4K0R6TWJrMmxoanpFRThsSzBoRzNx?=
 =?utf-8?B?OFppMDRIVWdUTkpUU1VRRDdHc054RmhIdkNHSnl2elJOV3hlNFRCd0pDOWg1?=
 =?utf-8?Q?8g7Y99?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 01:12:54.2325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1152dc-4ed7-4f04-4cdb-08dde5d0043f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8138

On 2025-08-27 01:56, Jan Beulich wrote:
> Without this, Dom0 will have have a curiously off-by-1 target_memkb
> value displayed by "xl list -l".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

In theory, b_info->video_memkb should have been defaulted to 0.  In 
practice you found it isn't.  xen-init-dom0 could probably use some fixing.

> ---
> In retrieve_domain_configuration_end(), isn't it the wrong way round to
> set both ->b_info.target_memkb and ->b_info.max_memkb only after calling
> libxl__get_targetmem_fudge(), when that uses the two fields? This way we
> could as well use ->b_info->video_memkb directly there.

I think it's attempting to read the current values from xenstore, in 
case they changed via xl mem-set, and then putting them into the d_config.

Regards,
Jason

> Of course this may point at a bigger problem, as other fields may
> similarly never be set for Dom0.

