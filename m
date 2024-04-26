Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A698B2E68
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 03:46:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712344.1112976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Aew-0006vi-28; Fri, 26 Apr 2024 01:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712344.1112976; Fri, 26 Apr 2024 01:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Aev-0006tu-Uk; Fri, 26 Apr 2024 01:45:53 +0000
Received: by outflank-mailman (input) for mailman id 712344;
 Fri, 26 Apr 2024 01:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/P6z=L7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s0Aeu-0006tl-Ca
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 01:45:52 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4eb4f1d-036e-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 03:45:49 +0200 (CEST)
Received: from BYAPR07CA0027.namprd07.prod.outlook.com (2603:10b6:a02:bc::40)
 by PH7PR12MB7356.namprd12.prod.outlook.com (2603:10b6:510:20f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 01:45:44 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::55) by BYAPR07CA0027.outlook.office365.com
 (2603:10b6:a02:bc::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Fri, 26 Apr 2024 01:45:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 01:45:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 20:45:43 -0500
Received: from [192.168.16.121] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 20:45:27 -0500
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
X-Inumbo-ID: b4eb4f1d-036e-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtVLeBZ9qHMyZd7w7q3Jk7cD5jCDPw6KIO16jpi9JoYoZ7wuNzS/nzDsOD3rEINQzJK2nPswDia2+8EoOejRErNqBh/1bH1L0tY4e557GNrh3SIKEfhFmP8Xd5Q3QFhpZtVNgCa3wQ4aXrQDF7NtDarwfAe06IyE1mby9b6tJa3FzrJ40Q8+ytbZ+ntHqsUQdIKJCb04Uj6YuqfKfTHdAscPYHC9XER2As8nPU8RBKbStOlwADi8CzcR3SwKnlpF1czOiF5utoVIy4uQTsstGcmMa4qgYrXwSHbgsfMrde6RVCHPfCOZovfMxOsGJmfIKforuTBjDKUSHAgdW+UaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+cQLp3qp5YfaVkKjl0cJVlqqYinBt+XFkIuFYXuvug=;
 b=bIi84y3qBdDt1ufemeu/QugjdIX7qfsj1KfI6NwRieWIeGXG7+w67L5kLU3buHH77jHAIqLYmXnLCzgkykoQM2uaYTOHE1MXctQxqnmd9lM5oLk+j46moPn+EzR6yLYPjerOrebXr4VFm6q5JIHeFq16bbeCphEEy0/b9Muel+XK7yRrNitzY9nEhEnOUv0oCxXUZjAYezXB7cXuVgn8YgRVMwaUZjJdgYcEP5HbATGVbHyG/dC5xoeKNuhx7OMF4DTrivN5NxfCb3bdIb7+St04AJHdBF1I419akoM5gK4fY1dk2xZrYRAm6eunQeQMjb0boPAlU7jHVW7ScOnmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+cQLp3qp5YfaVkKjl0cJVlqqYinBt+XFkIuFYXuvug=;
 b=AQhIu1re4TUEuKrSlT26vA4e9ONvxYNRL7vBZfbhz7Ojizmt5miAe6Wab5H2b6nhbLdRImA4Kzmcse8mjFp0eOySV0YHPCAf8+hXVjjuflyS0kEsPHyUjqU+0MIkBI4dYtxslcGkaZaI5QZZgzU7m1jqfW6VxlaqdBcwC6+RIwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4f9d9182-6db7-436a-a38e-21afed89e41f@amd.com>
Date: Thu, 25 Apr 2024 21:45:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] tools/helpers: Add get_overlay
To: Henry Wang <xin.wang2@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony@xenproject.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-12-xin.wang2@amd.com>
 <c8228db9-6bb6-4115-9cc4-bcd8f49319e5@suse.com>
 <0d94b108-63f5-454d-8204-7a01ba8bcb7f@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0d94b108-63f5-454d-8204-7a01ba8bcb7f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|PH7PR12MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e27b972-ceee-4e86-ef01-08dc65929689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400014|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3E4WnhrUXpFZGRRb2lPQUtsZENZYnF5ellKNERucS9Remx5RzdFK3lsRU1I?=
 =?utf-8?B?NG9pWmtpdW56cEhKdDV2NzdqQi9VMDl6NEp0M3Njdmt0WFNLTVFleGRYNHk5?=
 =?utf-8?B?cE1mWi9yaFh0a3JzVWhOdXJBb3FHQ0d6eDFQelhwVUFhU05YanNOZyttSHlP?=
 =?utf-8?B?T0U2TmZyTHpKeEtETWtwcjh6S3hTb2puZS9OdUJVVXI4ZjhYak1YK04wemQ1?=
 =?utf-8?B?TzZiZzBLaE1NZDB5Z0Z1aENFNnpyUzdGT3FiR3p1dW1Hd28xaHFrWGx4Q1ZK?=
 =?utf-8?B?T3FkbTJ1UHdxRlk5cVoySzhyMmdTd01qby9ZWm5yY1JtQ2FDamZwQ1FabVEw?=
 =?utf-8?B?RGoxMDVxbFM3cUI1V0VFNUJNVU1nWXJQZUpRYm1reDdpU21KTW8yaGdBeUVO?=
 =?utf-8?B?VmNBU3FueWlNeEt1SUFlV1FQcndnZnVzRUcvZ3FWekRreW5VMXlESitqMDFi?=
 =?utf-8?B?MDNBQitEMnNWbXlvZnpkcC9zNE1BaXNrcWNOcyszMXlObGJvYTNxNUFyWjc0?=
 =?utf-8?B?UFZoYm5nWE9HenRaQ2JCSG51cjFEMExodURkeHlPZEF2N1FZRFBhallwSUJ4?=
 =?utf-8?B?Y2RMbHQvUjhnV1RaVTA2RFY3U0pIWFNxUTNteTVkZWNFd0VROXpiemhTUUlM?=
 =?utf-8?B?ODl6clQ2QXRGeFdUamkzME5rbmhXMEtCc2g0blNBS1hjN3B2c0p3S0lEa3VZ?=
 =?utf-8?B?b2czQS80bmhEWm05VmhOT05TK0ptWDd3bENhRXN3cGJUcTNXZ1JIcHZGMXU1?=
 =?utf-8?B?MGJaK3E4eWJvV2VWOUxHekNodVBXSzFsTTRHY3puVFNGd1JJdkpwd2Y4Uzg5?=
 =?utf-8?B?QVJJaTY0T0tUa2swZXREK20xTk16K1ZnQXF0VGg3MjRpQzJsenRPTGFKUXV4?=
 =?utf-8?B?YjJTMFpSdHVVcnRITUYzVjUxK29wRENMQ1YxZlMzeVFsMzg5NVpXVDNRZG1v?=
 =?utf-8?B?c0JLdTQ1ZTE4QlVKS3cySjFveDJ4alMvcnAxUEw2ZFQrdU1kRExQeTdvREVu?=
 =?utf-8?B?a1YxQ2lucGRIYmc0Wk5mZTBEWndLMVdBaSt6TzMxVnpyTjNManF0SFIvYk1v?=
 =?utf-8?B?Y3hkOS9XbmV3b3VIbjh4eEVTUzNDYStYV2pvREo4Vy9SSjBaYWRjV01uKzVv?=
 =?utf-8?B?aXVCbFh2VWFZejc0eHNORG9IcEV5Unhvb1Z0NzFtZkdDRUlJQUVpQ2RSMzlm?=
 =?utf-8?B?MytEQ3VHWndoZGJWMUxQSWFxMzJnZmJHd3lCR3FPR2R2M2ExNEhId0FIY1Nz?=
 =?utf-8?B?dnRuaUp1ckFQL3luRmJwN0lKcHE0dC9sUGxUSld4bzMxZWVGNTgrL3VLV1I3?=
 =?utf-8?B?NHJ5WmpZQU1EQVFNaW5Ca0dCRU11WEZFNURiKzhqTUhPdHNLNUpuZWlsWVhu?=
 =?utf-8?B?aVdTNitoeW13ZHJOVnRqNTdOczl4KzBLbkxPU1VlV3dDOG5EQVUxYVEyOEVw?=
 =?utf-8?B?S3N2ZXJsWGRJQ3IxYmVmTGoweXNVWllmQVdLbVg5MFNxU1IxbWtSREF2K215?=
 =?utf-8?B?eG5vdzQ5MndILzEwNk9PRlpROHV1U3ZpYnZRSFZ3aFhySERUR2dWQ3RIUjRi?=
 =?utf-8?B?TlFlMEEvcTVHc0FOdTQ5NjFLWmNFY01VSWFhaDFwdUNqdlVnbTcyTmYrZitO?=
 =?utf-8?B?OUNYczlCRnN1aE8yM3FUcUJZOWJEYU05eFYzd1Z3Mm1MUSsweGtaL05iODha?=
 =?utf-8?B?VlRjU3Fwb2hpVEJPV2RmSmlmSjIrZlZUdXQ5cHA3R2JoWkVMWndZd2I2TmR5?=
 =?utf-8?B?SThlVEZzTmZSVWl2cFZlV2JJY0lqaWsyUGxWNmU3bE1remVIdURTTEJRM1Zo?=
 =?utf-8?B?SW1nbVRFUzhuUkpVSFpoNEZVaFlLK1Q4T2xxS1BuU0U4QjUvdS9DQkdnZStr?=
 =?utf-8?Q?xqScUnLPdLigM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 01:45:44.3145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e27b972-ceee-4e86-ef01-08dc65929689
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7356

On 4/24/24 20:43, Henry Wang wrote:
> Hi Jan,
> 
> On 4/24/2024 2:08 PM, Jan Beulich wrote:
>> On 24.04.2024 05:34, Henry Wang wrote:
>>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>
>>> This user level application copies the overlay dtbo shared by dom0 while doing
>>> overlay node assignment operation. It uses xenstore to communicate with dom0.
>>> More information on the protocol is writtien in docs/misc/overlay.txt file.
>>>
>>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>> ---
>>>   tools/helpers/Makefile      |   8 +
>>>   tools/helpers/get_overlay.c | 393 ++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 401 insertions(+)
>>>   create mode 100644 tools/helpers/get_overlay.c
>> As mentioned before on various occasions - new files preferably use dashes as
>> separators in preference to underscores. You not doing so is particularly
>> puzzling seeing ...
>>
>>> --- a/tools/helpers/Makefile
>>> +++ b/tools/helpers/Makefile
>>> @@ -12,6 +12,7 @@ TARGETS += init-xenstore-domain
>>>   endif
>>>   ifeq ($(CONFIG_ARM),y)
>>>   TARGETS += init-dom0less
>>> +TARGETS += get_overlay
>> ... patch context here (demonstrating a whopping 3 dashes used in similar
>> cases).
> 
> I am not very sure why Vikram used "_" in the original patch. However I agree you are correct. Since I am currently doing the follow up of this series, I will use "-" in v2 as suggested. Thanks.

Please also add tools/helpers/get-overlay to .gitignore

