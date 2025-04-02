Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9CA79615
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 21:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936032.1337377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u041I-0006uZ-Na; Wed, 02 Apr 2025 19:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936032.1337377; Wed, 02 Apr 2025 19:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u041I-0006rg-IW; Wed, 02 Apr 2025 19:45:04 +0000
Received: by outflank-mailman (input) for mailman id 936032;
 Wed, 02 Apr 2025 19:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MBi7=WU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u041H-0006rI-F8
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 19:45:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2416::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f592b708-0ffa-11f0-9eaa-5ba50f476ded;
 Wed, 02 Apr 2025 21:45:00 +0200 (CEST)
Received: from SA1PR05CA0021.namprd05.prod.outlook.com (2603:10b6:806:2d2::21)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Wed, 2 Apr
 2025 19:44:54 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::ed) by SA1PR05CA0021.outlook.office365.com
 (2603:10b6:806:2d2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Wed,
 2 Apr 2025 19:44:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 19:44:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 14:44:53 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Apr 2025 14:44:52 -0500
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
X-Inumbo-ID: f592b708-0ffa-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3bK63PPiplHHbsZ//LGfO10SodNB8zdxl2wRHont/VuA/MALtToKenYK8z3PxDEI5twyI31vOC2OsUV/775JbMS2qT2OGLZ3yG7FjG/ft06BLsYklZ9lvoGLmQ+7mNvFeUpD7RHeNUTPOdDEr68fNsSEsG5fMQKJBzhKjO5flhkA21tJ6dKCGDa/5shDbFJ9nh4cnU8yLlXZPaLf/QaUdqghn3NH55dM67yI/8VKpbTrm0hFO7XcEaG608JEYShPhMJto73q1a/OAgHcKALoK8auLCQQwh5zQFGyOtWND3zsttfBFRt+dczpTUbhh1n24gpWRYSBvGjG1D5Ve0zpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVUDgxZwZhbEor8eFex4pwB2zoHtjJee5WY22BW857s=;
 b=V+tVFnA7RaoJY4Z/p56BnM/VsQljuSDkIMMuw8P+u42QMmWc8doTCeF69W/j30iRNgS6sSDWXfWsV61we+DIVEHxsPSIcjT4qKIr93J06W8ikAa+lAuQeT9LLOkrm0Q/KjNKiRHifIg00xbXgArqfttG3q77bDd6Z9JFvqaHs+fFpW6qTSE8zYayhNSjESaQqUm6QOhSDGyO5Q+gbrHRjX4UsPYf2NGDOR0jYyxlKcHYvqnJdR49CH9OxaATXgnnyrOdUGJZqCCIjk0LDkBec+yjF41xlyTu0O/wYENSCDR49SuJq+RJVYkb8VtR8GzCe3TWRsD/lfHf49v3TaJ8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVUDgxZwZhbEor8eFex4pwB2zoHtjJee5WY22BW857s=;
 b=vVTTdWNr53Vz5HWysWO7tQ8yInMeVqftM2INVAJao1PEqOfBg5EUYSG5whaaeZa6FOEYVWogiOc0u8b8bqZno+MhMbKjxEaGLg2XYvZRNTCKmQ7XXzbon3o4BJ30hXiQNTltDFl2OMsG7mObVxe8SR+JLduj/foL+1ZoB8Wqzpo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8afae3ba-c804-4867-a699-1ecf8f262cbd@amd.com>
Date: Wed, 2 Apr 2025 15:44:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] x86/hyperlaunch: introduce the domain builder
To: Jan Beulich <jbeulich@suse.com>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
	<Alejandro.GarciaVallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-7-dpsmith@apertussolutions.com>
 <004b066a-b26f-44bd-994f-5c573f6511e6@suse.com>
 <847a0afa-05bd-4f33-b07c-d9d69b9198ae@amd.com>
 <9e3f962a-a45b-4dba-b204-b9f6acae30ec@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <9e3f962a-a45b-4dba-b204-b9f6acae30ec@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: 7971bac2-a61e-4f6f-7b97-08dd721ed703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVlHVVFaVVF2bDVac2tjOERXSjMwbWpOaU84QUV0dEJyTmtoOFBUdzVETWds?=
 =?utf-8?B?em5zd3FUMlpBYXRQeC9MYnQxRWJjcmZVRi9HVVJkQ29yczFhQTltVGN3bWs4?=
 =?utf-8?B?NzlwTUU1T2Q1dWQ3T3ZtbjRRWTV3Tm1hWDJwSzdCYldXTFBBTzdpWVI5QW1u?=
 =?utf-8?B?bXFHV0MxWVUzWlZoWGxRTjU3bzRjcVpOM3lDNUZiWENpemR0RWV6dWUzV1NK?=
 =?utf-8?B?WUJGbGtLT2VxQTBNT1VSRDRCTThMNlU3cXFwekpUamhGeCtZRkI1MTdndnYr?=
 =?utf-8?B?bDEwVHhqNGg2VXB5dndzNHJvTWtFUzArdE9yOFU5TmtCQ0F1S0hQVGVnbFRP?=
 =?utf-8?B?YkNWTENFZ0l4blBuQWhHUEVyK1JKMGhkMnNrL0tNR0dZNWJkSXlCMFZyV1pY?=
 =?utf-8?B?QUZnbzRkK0hSaGhZUVJQMFp0R2ZBNTl0bmNzZVpwNUNmK1MzdGI3blBCaCsw?=
 =?utf-8?B?RGtNbXJTcWp2Y29uZHhERk96YnNwaStacllFVVI1TjN1RnhONHR0Y2hYaDIv?=
 =?utf-8?B?V0NnV0orZTA2cCttT3N6a0syUXphTGpWemFBZ0FscUZERnZaa2EyaHR0cU9E?=
 =?utf-8?B?K3BSS2NOLzhUTjB4NzRBbEt5cyt0bG41cnpCRjM5eklaaUZYZXIyQmFpTHpy?=
 =?utf-8?B?UlkyOWM2R0hNWmlSV3BVUkV0M0UwbzZsOWZtRytVWWl2QzNWTVFKeEhFQ1dM?=
 =?utf-8?B?T1pkaVZ6OWg0YzJRODZQeUJicExqaUxiMjZkSVpuTThDQk15UU94ZmlKTGJj?=
 =?utf-8?B?VFpacHJPY3VoajJUR3IrZU1OT1BLYXUxT2VFTXJzRTZCQWQ5SVpZdzZKNDEz?=
 =?utf-8?B?UGpsQ041UW5mcDZjYjdMalRzOFY5QXpycWZZUlBOdmdkSUFIVTVoRE5FeXFj?=
 =?utf-8?B?REVnVVFGcGhoNmUveG9UbjlGTk1jbUdVaXl0VzVlZVlKWFZkb1IwSFAvS2wr?=
 =?utf-8?B?V1RlZ1FyUFhGc00yUmc3VFZ4RXF3Y1dXQ1ZtUG5idzhrcG1EN2J4a1UyVHBD?=
 =?utf-8?B?S2YxMUZaM0sya3hJdi9EeUNoMHQ3N2hRalRPdjAzUmVXQTZuaXlPSEdkUmpw?=
 =?utf-8?B?VHk1eS82YXFlOEx3dlBGdWZPUDdrRWRNZmw2RHZLZjZmdlJCRWF5eTh1TW01?=
 =?utf-8?B?cjZraTRralA5K3JwdW5TbnBXMGpxYmZ6bXlhVGZqMlF0Q0lIWjNMMzQ3QnRI?=
 =?utf-8?B?VEhlNUpVWklkZmJtdzVLK25QZ1M5bGU1b09oYUxENzF0ZEFweWdZdk4xQ0VE?=
 =?utf-8?B?aVcxK2JVZ1ZFdjRlUXN0by9JT3lEY2I2NUpyNHVkaWQ0VFZpTlBXdVZ4VW9a?=
 =?utf-8?B?L0ovNHE1OEJ3b1dKRkUvTEQ0Ynljd00yYm1HbzJ6dTlzZ29FaVY1aTVGbnVN?=
 =?utf-8?B?V1hIQXVhU1hQQlNDS0J6V3NpZEU2aWZFQVdDcW1LKzNhcUMyalloYnlGR2Fs?=
 =?utf-8?B?MHllNUJzVFd2dlF3NFdFVnpPbFc3dlljRW4wKzVWbDl2a0lrVmpWNEp2cnV5?=
 =?utf-8?B?T0F2cUppQnp0RXJIM0lkL1Q1enFJRmtTbEpUekNBUExEam5EakZWYjVzZHFq?=
 =?utf-8?B?OFM0ajR5M3J1a0ZOY0dLdE1KTUFxWlFaTXNrSmhqdHNvRlpoZnoxT2pyeDhK?=
 =?utf-8?B?SGNjSTZaemJqUVNGdXpOUFdJb29ycUhPMVNPMFRCWWxNcjNCd3pXMUxvUEo4?=
 =?utf-8?B?anhldWJYNzJlV2dEM3pVcDU1RWpzN3MyemhjUnpqV0gya0JNamVhYjhoekhl?=
 =?utf-8?B?Mnp3eXNzeCtmeXJ3dnpVYktNQ1FxVDhlKzNLODNXTi90SGY3M1dxRXFLUkll?=
 =?utf-8?B?cVFjQXVmejZQVitXeVVQdUVNMjR1RXFub1Q4SDhJeGtjSGtTa2I1QUZEUHBp?=
 =?utf-8?B?cVJ5a25kZW1CdWEwdTJoc2pYa1RTRFJxc0FDMGhEYmZrYVUvMkxLdEJnT3Vp?=
 =?utf-8?B?NW01ZWlkRmkrMzl4UXJxL3oyVlZrYUtPaS9sZ0RnODBhUERFV082MXlKTis0?=
 =?utf-8?Q?VLLRlsSdt9YcbQMIoYdrUsRKfMRA1o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 19:44:53.7768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7971bac2-a61e-4f6f-7b97-08dd721ed703
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216

On 2025-04-02 05:25, Jan Beulich wrote:
> On 01.04.2025 20:01, Jason Andryuk wrote:
>> On 2025-01-30 09:52, Jan Beulich wrote:
>>> On 26.12.2024 17:57, Daniel P. Smith wrote:
>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -81,6 +81,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>>>>    obj-y += sysctl.o
>>>>    endif
>>>>    
>>>> +obj-y += domain-builder/
>>>
>>> The set of subdirs needed in $(obj-y) is specified at the top of the file.
>>> Also shouldn't this be obj-$(CONFIG_DOMAIN_BUILDER)?
>>
>> Later, all boot-time domain building is handled by
>> domain-builder/core.c.  So some of domain-builder/ is always built, and
>> Kconfig disables multidomain support.
> 
> Then CONFIG_DOMAIN_BUILDER is a misnomer?

Dan also adds CONFIG_MULTIDOMAIN_BUILDER later... which is used only for:
-    BUG_ON(!pv_shim && d->domain_id != 0);
+    if ( ! IS_ENABLED(CONFIG_MULTIDOMAIN_BUILDER) )
+        BUG_ON(!pv_shim && d->domain_id != 0);

:(

I thought it at least restricted the size of the boot domains array.

-Jason

