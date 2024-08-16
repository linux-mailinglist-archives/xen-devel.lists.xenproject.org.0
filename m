Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AEA954270
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 09:13:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778398.1188435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ser83-00034Z-Et; Fri, 16 Aug 2024 07:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778398.1188435; Fri, 16 Aug 2024 07:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ser83-00031o-Bn; Fri, 16 Aug 2024 07:12:07 +0000
Received: by outflank-mailman (input) for mailman id 778398;
 Fri, 16 Aug 2024 07:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JmuG=PP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ser81-00031i-Qg
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 07:12:05 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2417::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5dbfb09-5b9e-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 09:12:02 +0200 (CEST)
Received: from BL0PR01CA0020.prod.exchangelabs.com (2603:10b6:208:71::33) by
 CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.19; Fri, 16 Aug 2024 07:11:56 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:71:cafe::27) by BL0PR01CA0020.outlook.office365.com
 (2603:10b6:208:71::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Fri, 16 Aug 2024 07:11:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 07:11:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 02:11:38 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 Aug 2024 02:11:37 -0500
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
X-Inumbo-ID: d5dbfb09-5b9e-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dB1WdUaX/yhvTdYLy/1W3A37jCGu2qSZWVhJBeJ+lhIH+2LwVf/aHckVSmL7/NckDg1FyhoSVTDPtGA8LVJW+cWns4ew4CV6VTbjhWxhXV9Ct7BKp2sALbyHhLKe3BvDMpIN5jJh7tG3Fom/Y851TZ4i/XIQdm6TwdeBlykQDQLUw5Xp5MPCas4n/fi7/aKItaimjHMQQM8hu48xf5frNSA9i/IwmQ3Y2dLxVTE0y8v+wMYw4aFDveDhAmtF5aK1jJE5BduFrW9e+daMgyySxr8Z5lNLKCf6xf0i5qnXpzt3EuRkSLSSiR9lwYfHeV3gwV6fktMjKgPDJKuUfY/f/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FEyTELotu+c1MkQ841FkxFnA8pIZ1DEe1XapuEt3bs=;
 b=mFBBX+AslPYLnLhYnMZmQUXVi9uG2KgJeTGjR2GhA1AFBoSa8m9Y5XVKAfycVco86z4z0t2IxIUROlahBWCKgvlTf7aeSz5ihAk2Tq0KRkq9jgtc4jDmBnJx0/RUyIFYH8+H/vIXWF6ETPYu0A+GBHWbM9UE8sKKgGt3rZBfT1VaiKWoYrrG1q/wTjx/aAXV6sG/o9PXYueCCNaBf31MwNFaqxwXE+BnoTlv0s6iPPpaGMx9XJJ6ubyly9YWMX7qVEW+jGAdyLtOfFCn263l9DsIq1vx5b95qxZdc1nQ1clTFNnXAwKUCGyeynXu9iwtLALt7/c7jyycWmLFpKpcwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FEyTELotu+c1MkQ841FkxFnA8pIZ1DEe1XapuEt3bs=;
 b=o/eCtVLiGSYo/OXK/pkI6P51hK9zhNt8k7qzGxPf4+ORpu3XUxgmhEFJozVZkUExDtBkmzHNbtdDGm4Ah/sWwOyuWFoEneIvNoH1GspSUO9uYgUFi6/g4RqXnla1nthLu7DroSoVjU1BGFgEC6n01bpcYFM0rhqAq8Wzp8460FQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <96e6d11c-aec3-4114-9956-011a431b9ad4@amd.com>
Date: Fri, 16 Aug 2024 09:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: add default QEMU_TIMEOUT value if not already
 set
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>
References: <20240816010034.2199142-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240816010034.2199142-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: b278b2f3-25ee-4289-a421-08dcbdc2b4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXZaOHRZRzlLOWJyWTRiWXkrTFZRVUhUUVZveVFKWCtaMjZIaTZQQUY5UGc0?=
 =?utf-8?B?eXRZMWFoTThrZGJ1dHlnRDVvNmh0OTFib2JSSmc4T29NKzBPYkRodDhtMS95?=
 =?utf-8?B?WmNOM2ZTdDhGL1lJbkxwZGpHZFlTV1BwdmhZdUF0SFYzYWNsRnByQloxWngy?=
 =?utf-8?B?b3BHakExdVMyeEJlUFAweTdGb0tDbEM2TXNCTmpENTFFYTg0R2x3c09FUWRu?=
 =?utf-8?B?NWlRcWNJTWRCMklpTDRjTC9GZTl0cGpicXgvTlVnZndVdnVoNHBTRmJXcUhI?=
 =?utf-8?B?TElDbXBGWWE0YUpPcUFxWGovYmxTUDlJekJESi9uNDZYUjdoZkVMM3dReG03?=
 =?utf-8?B?Z2RNamtYS2xMZTh3Q2dPQjdYZSt0ZmtWK25hYzlpK2labjR6aFFOZm5UYmln?=
 =?utf-8?B?TGVFU1FEZnRvM2ZyYVA4MWFLMGJTWkN5eFBUdERjbkNoY0Y5UmNiOFJwakoz?=
 =?utf-8?B?bDMvREtaVlhNRGFrV3YyWHhJZ0VQaXU1MnhwVlpqYXNxKzIxREdPUmtnRVo3?=
 =?utf-8?B?NHBqdmdicDB1WGRyZ1p0UkZaNzR5eTJSWnFQRmcvcktFdHcwRWk2V1pNMmpV?=
 =?utf-8?B?S0FFZlAvK1kwNENXRkdPK09oektzNVhDSGw2bkM4THk2S3BjN2RnbzlIMjBo?=
 =?utf-8?B?NmdBSXkrL3JrM3l5cjhEMjlKMmE5OVJrTmQ5MnhOd3Y4bUdFOE10V09XYXo3?=
 =?utf-8?B?d3d4SCswZlFacDZtcHVYcVcxUUhwSlNOTTlFTm5ZSW9DK2VESWVLaFZUeUt4?=
 =?utf-8?B?ZWs1YmlaQUFLT0IxZG1ST0psRUQraUdmdkk5cFpkWDR3dzVWN21aZFNxZ0RY?=
 =?utf-8?B?WExSeFFJSlM3cHlrQWU0SGhBVUQ4MFdNYjlyYllkT0ZwUStadmlqakFrRzJy?=
 =?utf-8?B?ckN1ZFZqay9LUVlqcVdvOUJvYisvMWdLL0VNcGNlY2hvcXFFZkZrdk5hS09y?=
 =?utf-8?B?QTlqeHR0MGV0V3BzNDNza0VJNU9KaVdLZHMxcXYzZDZwNk1zaFRPWVJ0T25w?=
 =?utf-8?B?cjRad1FacHJLdWVmSWdmQS9WMmU3b29pMDEvaUF2ZFJRTmhmMmdmN216UFNy?=
 =?utf-8?B?ZTJ0RDFXWXRyMk1MaC9RV205OVc3L3NYazN1MGlBRVVHL1VicitwcG5jMkhQ?=
 =?utf-8?B?d2lIRk9XdTVDeWJycXpnNEgyNTJrTzhWZ2hqeXllTVMwdWFKbFg1SU5uandO?=
 =?utf-8?B?YWtQYWdGM3VmWlpKd0U5NXg3T29vREdCVHZlWFJPWWw0TSs3dVp6YWJ5ckV0?=
 =?utf-8?B?cnZ5SHF4bE5kdFdpbUw3YXlHSVB0ckRwdHBTVGRPK09WTGduaFZ0UFN4UWYx?=
 =?utf-8?B?ckV0MnAxK2k2NU83MTdDWktyNGxOTk04VGFTYmx2a1R0ak9OcjB1alpBWEY1?=
 =?utf-8?B?K2dpRmFpNFRhWkp2NWJsb3pldDZTMHJGaTRZc284K0phVDVURWNkeEdKQnRO?=
 =?utf-8?B?blhFYmxqRGtDcGM2TkIxRW0rVnhKallnSzNLNTg3d2k0RE5FcFozVVRYeGhx?=
 =?utf-8?B?M1E5K0QxdGFvbTlQclJ4Q3hkYmZKY0FWT2VvZTZKeDNpcmJFS0gxZjUvcFhm?=
 =?utf-8?B?WCs0R2pGejExUEdraVdPT0JXYnBucG5NcXdtME1neUxFc2dxa2FHWjFVOFZp?=
 =?utf-8?B?c1NOSER4RXY0QndhTlhjTnU0djh5cDI4YW5hUXJKOXJYenlqbkd6V1JEdjB4?=
 =?utf-8?B?aXNvb0svaGZYR3h2TlFhQXlCaXVtTzhlV2h4enRicVEwb0ZlNmN5dEpwSGRZ?=
 =?utf-8?B?b1k4MGpTR1lJZlNxZ2lLMGVDdTZpOG5rQzY0RkVYNkc2NVdPdUlVMUtQY3pT?=
 =?utf-8?B?ZGtpQWI2OWxJUE5TMnUxQTNIYmxUZzk2OWpOOTU4dUhOZXRva3d0Y293Nk1Q?=
 =?utf-8?B?WExWYlVUcDI4R1FueWFxU2I2cUUxeEVyY1hubjlzdXBrZ0lIY0xhaURHQTVi?=
 =?utf-8?Q?5HuX7fCrabEPN/Y89Obd/Kge/1Ju2CvF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 07:11:53.5265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b278b2f3-25ee-4289-a421-08dcbdc2b4e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313



On 16/08/2024 03:00, Stefano Stabellini wrote:
> The expectation is that QEMU_TIMEOUT should be set as a Gitlab CI/CD
> variable but if not we should be able to run the pipeline anyway.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  automation/scripts/qemu-key.exp | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/qemu-key.exp
> index 35eb903a31..787f1f08cb 100755
> --- a/automation/scripts/qemu-key.exp
> +++ b/automation/scripts/qemu-key.exp
> @@ -1,6 +1,10 @@
>  #!/usr/bin/expect -f
>  
> -set timeout $env(QEMU_TIMEOUT)
> +if {[info exists env(QEMU_TIMEOUT)]} {
> +    set timeout $env(QEMU_TIMEOUT)
> +} else {
> +    set timeout 1500
> +}
>  
>  log_file -a $env(QEMU_LOG)
>  

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

