Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E999F9935B6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 20:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812296.1225024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsAY-0007HR-F1; Mon, 07 Oct 2024 18:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812296.1225024; Mon, 07 Oct 2024 18:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsAY-0007Ee-AD; Mon, 07 Oct 2024 18:09:18 +0000
Received: by outflank-mailman (input) for mailman id 812296;
 Mon, 07 Oct 2024 18:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxsAW-0007DD-Ut
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 18:09:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2417::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42427237-84d7-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 20:09:14 +0200 (CEST)
Received: from CH0PR03CA0264.namprd03.prod.outlook.com (2603:10b6:610:e5::29)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 18:09:10 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::74) by CH0PR03CA0264.outlook.office365.com
 (2603:10b6:610:e5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.21 via Frontend
 Transport; Mon, 7 Oct 2024 18:09:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 18:09:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:09:09 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 13:09:08 -0500
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
X-Inumbo-ID: 42427237-84d7-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnRAXJ+i/iG9axzbSJiTUFxDy0YSPE53V6yS8hX7uCnjoam84Zy+umxu6mhdDdHzyl4x7i03Zoqdcl/LAydcuo76gBuUGfKG4x/aJK5zLnC1PbdQAq1+TeS0jXL/QyU6C4mgySX2NDkJy4i/v4fvN6pecr7W3zq0tsGeV3U4IwX1cidIvT3+fL25uCaGGeJrpd8bMvz2Vsfht2OyKBIg/3d1SJdd8lU4WLrPzvVnYSPeSCF8DmuWUm0JyVLDgkOZlPn29qrXyLK2d8TA6wfp6BdYUE+hc2tNrfWzTNCBpKhfitxyQQH+DX2sJTGW2UTdyfTjnCk1RcDnCtkPhXiSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHQUuRuCSKQUILuLwdP1XnGT51mR8amYHJG7lPGd90I=;
 b=Y7FLm0ZgfjwV9P+OJufMl08XekaRWYn5mkT4mOd3GHNUDU6J/U2DQvW3gZTvfzmrWnXBSj0ZuoK2m3YngY7Sbt9B9HWA7JY9Rot8wYabDJ5X+HHFEf2I0/AxZW5UKDw8rPgzU/nq5SFydTsBd5j9TChrT90ODSI+ELUEyskqU4rkRK/LpgNPjVBWhtWuOt7oK6+FNbnFlU0oMhEF7qcrvypbMvnBg13NEMsekqroJrW7wJ5dwXPoriaxIZvCQ6mOQbiWjGblQBON7TsXH2UlSjcf/3hun8/mYsiLOCigwRHWEcQ21D83jsmFdlL4IKpiuAmNUuP0d2DtAdzgQv/KOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHQUuRuCSKQUILuLwdP1XnGT51mR8amYHJG7lPGd90I=;
 b=uCTDgXkg+rlVxbIR2F1GyCphodhmUgck+ptDuAZf850KrxLf+L491rTB0I9vJho3yS/tApA5AEHItl+fRLBePFu1lV5HmDJx+i0+yjzmBo8UCJmWJHeQmtcTK4BlW8+YfZlPhDHaMACr8rtaWOitkzg+sSbRk72zY9lxc3p7bO8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <304c8c42-cfb7-4b0b-aaa7-8c673f9f2fa6@amd.com>
Date: Mon, 7 Oct 2024 14:09:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/44] x86/boot: move cmdline to boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-4-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: f9bd53ae-b61a-41dc-f33e-08dce6fb2467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjVKTStESUlCd1B6Rlo2T09oL1U4NmJCUmVVR0tKUGpDSmp3WTJlYzEyZVNV?=
 =?utf-8?B?aHBxdnh3N0V1MG0wVnd1ekR4bSsrUzhOa0VZTUJ2UTlFT2FVSGFYN2c2cnhq?=
 =?utf-8?B?TkY4cWxGdTB5MlBLdVJ6Z280WFh2bWlnVGFaMm5XUThLRFFpdkptdm9ablpm?=
 =?utf-8?B?bFdBdkUyQVBXUXNsUjV3NG9rcmM0akpucUREVmk0RjdmekQxUGVQMGNNNTg4?=
 =?utf-8?B?SjRvRGdCRXR1V3ZmWEd0TG1zSzFFL1laK2pPNmZtT3FReVNkdTRKWW81bE4y?=
 =?utf-8?B?MG1oY2xLN2ZiVFU5Q3FBZkxQazlEdTZ1ZEdSMFpiOSt1YWNOb0x4ejlRLzJz?=
 =?utf-8?B?S0lnaDQwdGhxZW1vZXdKL0lYTHBORWpuY0JnRlpxVklHVUVtWkVwWkxMbWxm?=
 =?utf-8?B?ZDJmbitKMUQ0VlBBT3pUdWVnUW8vTVB4TUxjUWtCVWh2d1Q5ZkxydGQ2SUYr?=
 =?utf-8?B?N01oVWd6UDZVM0YvMjk1d0l5TFlXZGdsZW1BTmpObDZxUEh5MkxsRFVRYkpZ?=
 =?utf-8?B?OFFMbUREMUkzcHFmSVYrWVpQWWU5aE1VNXpXZnJDaU1nUndhbzlYSUh4S0hl?=
 =?utf-8?B?UTNSQVRyMk5rRi9Ccjh4ektabGZMdnY2cjlKRXgvVEUrZmQ2Mm5HR3ZwN052?=
 =?utf-8?B?UllDUUM3Z1BnQ3YvSHU2TnEvME1XUnFlZSs3YklzR3lEUStsTnMxMUFqVXNP?=
 =?utf-8?B?TVhiM1NhU0w5LzZTQXBJUTh2bVVNTTFKc3RQcXgzSk1GTUFjQXdzYk5pQXpU?=
 =?utf-8?B?YURGKzl2azExek9ORzdEMEVVRm0wZVR6T3RpNmdlZmhwMUZMZForb1RZS2RR?=
 =?utf-8?B?K0piVUFiYUlObU1GUzgxOFUxbUxKYlRrUzB1c2gzRVFac1VCQVYvdWhzc0Jj?=
 =?utf-8?B?c250SnEzYk5TVFUzMDE4YWRsNWYxN3I1R2pTbmxwVHRtWGE0WU8wZVNUR3Zh?=
 =?utf-8?B?OXduUlVsWTVXc0h5MGo2NE9aZStIQzl4cTIyR21pd1N4U3hxRWtMRFhYVVoz?=
 =?utf-8?B?dnhEYUwwdld5VUxUVUo2V255ZGRFV2FuQ0lCc3NsZ1pSNkNLdTUzMjFSSHVx?=
 =?utf-8?B?UGhlL0Q3dWFsd2ZsR0ZaTHhSNVNzK21VejFQKzFhR3lQUnpZTHo2Ry8rVUND?=
 =?utf-8?B?NWhlbVhMaWg3UjlpbWdNS0N6bWhQRmp3TGdtbFVhSGRZZHBPUHA0NG44VHVR?=
 =?utf-8?B?c3JLMkY0dHlKNkNTdDVSeGU0aGIwckhxZERBdFA3d1BxT1NTdHJ2NkF2K000?=
 =?utf-8?B?N2JJTjBFQWxIZElaeUVWdFNxekNBNGVLeEwrdndSVEJtU3pJOUFGSzNwUU95?=
 =?utf-8?B?NzBmUFpvL0hxRUdvaXFuT1l5OVlBYVpXWVFVYWNTbXRlZjJqWGtqV2VOVEFZ?=
 =?utf-8?B?Vklwd09HZncyZS95Q0loVHc3RUZkZHcvOVdYbDltNkVPMUl6bEhYeHBJR3F3?=
 =?utf-8?B?SjZIUEdIT3pDM2x4aThWUld4em9od1BXdFA2b3R5dW1qMGV0a2xQMWppSkUx?=
 =?utf-8?B?QnJnZW1oM2FLV015czg0NFZTTWlPOUprN2E5K0JVUllEeUlFVncwY0lzaXpv?=
 =?utf-8?B?bVE0WFl5Ui9BTlBaYjRhcko3ZTZKaC9UM3J1RHNxM0Zoc1lGWVM5cVRTRWhV?=
 =?utf-8?B?cFArNERPQXN3dG01QnRlN2lDdVdPQWNSdGp0dm9tVWNQd21NSHh2VkhxVWo0?=
 =?utf-8?B?cnJlWXFpU1lTSy9GZDVNVEltTVM2N2VGSTNWZlNWc1pIbHkzVytQL0ZGQVZy?=
 =?utf-8?B?MkFOU1VQbE96anpod3V3R0RQV1FDdzMrTVZ0U05jRVdNMVpRQmF6aWJabGt2?=
 =?utf-8?B?MWwybVJOOGtLTERiOXlVbVhJZTdYcmZRL1g1a2gxWkx5a29vN3dmS01odDdo?=
 =?utf-8?Q?2OtXQX/5FBBB3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 18:09:10.0958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bd53ae-b61a-41dc-f33e-08dce6fb2467
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Transition Xen's command line to being held in struct boot_info.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

>   #endif /* __XEN_X86_BOOTINFO_H__ */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index aafc098ca268..0921f296075f 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -274,6 +274,8 @@ static int __init cf_check parse_acpi_param(const char *s)
>   }
>   custom_param("acpi", parse_acpi_param);
>   
> +static const char *cmdline_cook(const char *p, const char *loader_name);

Is there a reason not to move cmdline_cook() (and loader_is_grub2()) 
earlier to avoid this forward declaration?

Everything else looks okay.

Regards,
Jason

