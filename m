Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838DB9937E2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812399.1225134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxty7-00060a-QE; Mon, 07 Oct 2024 20:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812399.1225134; Mon, 07 Oct 2024 20:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxty7-0005z5-Ms; Mon, 07 Oct 2024 20:04:35 +0000
Received: by outflank-mailman (input) for mailman id 812399;
 Mon, 07 Oct 2024 20:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxty5-0005yx-LB
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:04:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d721cff-84e7-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 22:04:32 +0200 (CEST)
Received: from SA0PR11CA0035.namprd11.prod.outlook.com (2603:10b6:806:d0::10)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 20:04:28 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::44) by SA0PR11CA0035.outlook.office365.com
 (2603:10b6:806:d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.21 via Frontend
 Transport; Mon, 7 Oct 2024 20:04:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 20:04:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 15:04:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 15:04:23 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 15:04:22 -0500
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
X-Inumbo-ID: 5d721cff-84e7-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgOouPM9HmN95bQj22Tj+DC8+wPXcxR1mGzhfFP47DkZIKVu6bGExnFQvbC6viXE6YVUCsjL5pUqRuIu9XwfLhK+robo7cEknKOs+exZOL8rqpXEELhaLsg0leF6svkqBfIMjJemHMbcSN1G7PjYYDcbjJKGoDQLGxPU/KC0NB1M2SaI4a+7Roz+euyna747bGZBm4k11PM7WcuLF4susnJm9j+2JVkvsSyKZThD8nrMElb7HU1AYBN4xjTXJG1cINJVkqcNhBxPrWG0WqBHLx/SNOhepAMdW5mz+XylKbHmOo1rZQl1GwR2v+45TY6uks/+5ltH5kVog9+k4L8+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOPG92eorYTmfbe61E1Wdo4sHKbT7AKPHtX0ScPWvm4=;
 b=boqYoWNrihT75W9I7MJ/Q1INWKZyS6+YNxZu7Rlx/j5YAW4cFAq1Inlvpfhmb9hCBT+LA+BRwGfj3g09sqipQSiRKHGstLusi8Yu01R5zNzPPlnJMwR2Kn04A44zmbrB0bJw6Xk9Br3BTkFCzjnc43QyYIYu4pV58vyvDFbo4/98gbDDo3H7m/Np9IfnyOBe/SfIkyHXqDFCF2GHwO/u8pzCRQxKIdzxaAVNHRjnco9wKmdl8wtAbZsDabCS8x50hoOCkjWs8HziZGpddVcv6OTBo8eWWFbiHzOvLFw8zFG6g60JypvkNZzINY8FPWF8gwM8UQlGVLsZqN/h3FnbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOPG92eorYTmfbe61E1Wdo4sHKbT7AKPHtX0ScPWvm4=;
 b=1lAmfPz/z9s2Wukl9T6p6OKFQpR3HUIUnx3KrgYjaOMztGUWdI31hLGAoelAIdmi3b5bQ9K4iF5Yg4saC8G0Au2l/AzBU2dbrC1cm2ayMvuE9cyTtY/MKHAtZ2vjCMObQ8JMbR9Ur36+KRnZQR/T8px4QrSgvUSQ9dUgSG9Soh0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <89c73590-cd9b-4796-9359-3b37fd55a5ae@amd.com>
Date: Mon, 7 Oct 2024 16:04:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/44] x86/boot: split bootstrap_map_addr() out of
 bootstrap_map()
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-12-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-12-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c3e0d7-fb49-4009-c598-08dce70b3eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXRCMVFOMGVPN000RWhYR0tnTlo3SllPN200K0lTd0xNL1RXN2ZIU2VWSmtT?=
 =?utf-8?B?b1RxU3RubXhzTTQ2T01GQzFOQ0IwNUpsQkhNQWZsa1dqa0p6dlJ1Y3J3eDcz?=
 =?utf-8?B?RVp6bnVyTU9CS0tqcDIwR21CQkl3c3RoRXVNU05GeFU2RnExQ0ZHT2FYWnh6?=
 =?utf-8?B?ZVNVSHUxLzh5alNSWjFVbERYcFJNMlpNbU5Ta2R4dGNuRmp1RUNjM0NQcTJp?=
 =?utf-8?B?TVhEakZEQ2d0aENkeUdiN2xxRmJTU1lPR05UeklyajBnbnZQaVp5WE5QQ0JI?=
 =?utf-8?B?ZU02eGUyOCtzYW5vc2V2Ym5tRW5QQUhvZ0ZOSW5ZdFRHZDJOSFhTU3NBWHpy?=
 =?utf-8?B?RTcrLzhiN0hkZHBzK0R2dnBZRVFPK05qTVNsZWRiQzdpVisyVzFHbEswSC9z?=
 =?utf-8?B?bjc1WW5BTnZNWjZIb05naTNCSFJqak5VRzR6cGpNQTJOR0JuSzVXTlhnM1A4?=
 =?utf-8?B?a2prZDEvVCt6bVY0dTZUc3l5bytYU3hGc1B1a0JkK0E3M1ZWK3ZGOHptWTI5?=
 =?utf-8?B?NXozeVJQVnFTVFhRWVhNTDBKZ2NzS1FhYmlnelQzZUdrNnRNbFhvVm1QRGxi?=
 =?utf-8?B?WkYvejJBTkRVMG9JWmI2OGcvNkNaN1NiejBPZmNGYXlvMGFuTFJLc1YxUSty?=
 =?utf-8?B?RUMrb205QlRjVFVrWDhEeVQyWmpZZGlIdUI2VXQyVEZSc0FqVnNwb3ZRSG83?=
 =?utf-8?B?Y2VTYUt6bi93dGltRlQwaUJOSCthZm9laENRMGMyeHpRMnBrbHNydmlwcWor?=
 =?utf-8?B?amhhcjVzL0RUTjZjeU1icVgvdW9ON2VXUURDZUNSMXRjL256aEdKS3NMa2xu?=
 =?utf-8?B?NjNqeVhqQWxwZXVHY3I3YlI3a0FicjJnOEVRWFIyTmRZMjZURDRmL3lRc3FQ?=
 =?utf-8?B?ZzBHMElxWXh0cmRONGNQK0lFaktMZHplcnVjT1dFb3dzSXJQN2VHTytZc1VJ?=
 =?utf-8?B?Vnc5ZFZvdlpFNE1nSnNFTkVrSXA5QnBJQXhhRS83SVVML0NpbWtKd1Y5YXVW?=
 =?utf-8?B?RklhV2xKdFNQdkRZUUl3VHNIb25uR3ZpQUtweEUrVFpxK1BnL2d5QXFic2t0?=
 =?utf-8?B?aUFjcEFFMmdrMjZ5Y2JPbGVIZFhGQ3Y3VlcwdHRhdnN3bkJCVEJnN2hrQVFl?=
 =?utf-8?B?R3ZGNUU0MDh1SW9zaXMvdlVvSWQ5WHJqVHpIektXVlFuYnloNVB2a0k1dVFy?=
 =?utf-8?B?eDFoaWRoT1Y0MDI4Mzk1cDE3TWV3aSsvZHd6WXkvdDA4TDRMcllvS0R2dUcx?=
 =?utf-8?B?Rm5PMDJJaFBIakszTU44ZHZXSXZ3NDVEZG0vcEVNekphYTJLUFFrUG1aT0ZM?=
 =?utf-8?B?SnNyV3hFZm1RNUZhSVlJcmdCcC9UTE1td2V1RzNqUlNkYnU2QXFDN0cxRXhp?=
 =?utf-8?B?SVVBMERRcnp1V0ticGljZTlEQ0xxWS9GZ2dIK0x3cGlaeDgzdkp2VENsTDRi?=
 =?utf-8?B?T3VaZ1Q3M1hrb0Y4VmFnalkwbFQ1Y0U2dTJ2T2ZoaVo5RjNZOW4xVnFKdndD?=
 =?utf-8?B?QTFyaUNMcnJGNzdyMGMrOGpwYmZVaHkwZWU0NzdrbUhCTWtsdmZHa3prN1Jt?=
 =?utf-8?B?eUQzVndCQnR4a1huRUpQbEJXQWZtdDEvTnlJeHFyM3ZHMUpRWitxNzlMOW1q?=
 =?utf-8?B?b0dWWjBKYVNZK042aTJzMXdxVDNFTU93VlhtbnJRMnA4TE1GbDI2NkVIZVZK?=
 =?utf-8?B?SUVvZjlRMEtoSmhxZUVRc1R3YW5VTGlEelRtb3JnRktaanNSUXhlU000eDVi?=
 =?utf-8?B?QStjVVJ4TWV6UzJ3VmhKenlpYXdWamtjMm8yUUUvVXA4SWh2alJYUXVqcUtS?=
 =?utf-8?B?cnlFMFRhUFp6amp4OXQ3VjlYNDkydWlTYkRreEdDQi9Ib1lVRkdjV09wLzly?=
 =?utf-8?Q?ZJQZmRpJoIgXA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 20:04:26.5258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c3e0d7-fb49-4009-c598-08dce70b3eed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835

On 2024-10-06 17:49, Daniel P. Smith wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Using an interface based on addresses directly, not modules.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

