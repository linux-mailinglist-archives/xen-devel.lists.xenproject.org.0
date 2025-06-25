Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18136AE8454
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 15:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024860.1400634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQ2h-0000Pf-Su; Wed, 25 Jun 2025 13:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024860.1400634; Wed, 25 Jun 2025 13:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQ2h-0000Na-QG; Wed, 25 Jun 2025 13:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1024860;
 Wed, 25 Jun 2025 13:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrh=ZI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUQ2f-0000NT-TL
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 13:19:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2417::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1424ac6c-51c7-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 15:19:52 +0200 (CEST)
Received: from DS0PR17CA0015.namprd17.prod.outlook.com (2603:10b6:8:191::23)
 by DM6PR12MB4076.namprd12.prod.outlook.com (2603:10b6:5:213::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 13:19:48 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::af) by DS0PR17CA0015.outlook.office365.com
 (2603:10b6:8:191::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 13:19:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 13:19:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 08:19:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 08:19:47 -0500
Received: from [172.28.201.131] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 25 Jun 2025 08:19:46 -0500
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
X-Inumbo-ID: 1424ac6c-51c7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+8qn4k01HRV7gla74GZD4VyrYhS1Qtw0aoWd2LBj6rtledNX2GBE/7r6n1umCf3scwnQd6GBSQckBwRt84NKh8SO7WOz7ISLZs9+5oqsgphIVVPU4sXtYEUbRbvFSHn4hkZbpLIKj8MN0jILxS7Zb6k03sI7wPow6rC7fL2bLZVvJ96svkFrgxpFJB7+IUtFEXcJ5R6FJ+VgyUd2UjUjBR0ekqdtC8pMHCtc1Y31Ky3i+b7ba2096vrT7iPqjg39u5MYbkpqUuMlZpJDz5Egwe85bAu+SXq5tgfdYKF/sDcaGt+rDp6DrOc6GZVrF2Ixtkk+24CHrA0pKEnKz0dNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNtbdsYLSFUeeiPyzWY36IScq6lgYjc2TQMbGxRaukg=;
 b=ee1/OiKN6a+qyaqUEOOyoFqiWmEIx4YheNp5ASWKmeEeQOQXJZBLG7SnHemErp8QqtNms/z/OKVW1SxpqJSXVTQmVqz4oPCp6DpI2as8j6Hl6KTzoXYVTfDRXDLmlk/2P2gJUeopfXgiXECpFgncQqtQ1Ju9MezYhsLL/esxCcJrdj7wcUo++F4P+mY61WG1W9wb0DSdE+M+FTwuN1RL58aAVYgVJYpfx/TIoGFNlB53eoDX0eydqDLsLYMMkL3wiLJyJyTfwOz45ilLxHOb9kVVACQ0ac7fHnGMvAuV+h/+8RVeK05RLL6e7dOmYYvvi/7jMHuQ4m4TXF4TOYp5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNtbdsYLSFUeeiPyzWY36IScq6lgYjc2TQMbGxRaukg=;
 b=gVbG9Udmq+SkR9A2MbaBkhsU3Q3Vl9sJ/uanTecMqGWnzhutLzb/uTwTG25OWWfvJhGFsvueEjLZfbZAgTQUQOP4SXBz08xnU1QrvpCfWkhg1o+0YmKdXm+v7ERi3ytVn2q1uQAnRJ54ZdmW2WnUJfm3/FQ3KnKdHR5XrzOPxLA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9fd514ce-900d-44e0-bc81-d846e711dc1e@amd.com>
Date: Wed, 25 Jun 2025 09:19:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <0d2b44e3-bf6c-40ae-be4f-d0ad2845e925@suse.com>
 <c36a3199-4094-4175-acdf-95da7e050268@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c36a3199-4094-4175-acdf-95da7e050268@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DM6PR12MB4076:EE_
X-MS-Office365-Filtering-Correlation-Id: bb465328-423e-4cf9-9f0e-08ddb3eaf57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bld0V2Q0V2dqVEpFSWk1cnZ3NEY0bDFabExJN1J1dlJDai9MSVpQTERndUZJ?=
 =?utf-8?B?NW9ybnh3S3BIbzJhVTd2WGJxVVp2aHlFM1ptV0MxUTBLbW0yVXYrVDA2ZVln?=
 =?utf-8?B?d1V3UjBUOUdrTUMzb0wzbmIvMXBMTWZLc0JidGlianFkRGc5bEJNeVhjdzBr?=
 =?utf-8?B?R0F6RnFsTGNORHJmY0VtZjNDbFc5dWp6NGlOdjQwM253SU1sSm1Ba0NVeGFT?=
 =?utf-8?B?cTdlUGNSL1Qwc2JUVUdaUi91aHBBMzBEYU5peVk4WDRubEM3Q0dzTE5mYnpS?=
 =?utf-8?B?bkdzSjYwQTBScCtUZGNLMXJZUHdlYXdma0hSSllnY1p3alZPZDJTdzIyTzBq?=
 =?utf-8?B?VUVNVG1VNHpwNWNocXJpdGM5ZjV3TUo5aFFsRWFBTk1rSmZVRzJHSmVZRTJN?=
 =?utf-8?B?VUVreU5ZYmI0WmFRT0RqQmNVNVk2ZHlUSm9JOEZndE5JNkNDR1IrVU41T0Q3?=
 =?utf-8?B?ZGtnL2YwZXhIYzNTL1VPeGExZWpsZ3hXZXFwK3pRdG42eThibWJWTzJVdFh3?=
 =?utf-8?B?SUtOTTR0K24wQnAweHMxVkZudllPV0lSMWxqUlYxRkNZMDFVUVhGRDRBWVAr?=
 =?utf-8?B?N3E3Nks1a2t6Qk9wUTlMSjZxZG1ad2g4VFFwMWpjOVV1eEQzMmM3N2t6R2VX?=
 =?utf-8?B?NUZTck15Tmk2a01abmhJbnNmQmt1dk9lbDlTV1hyRDBoRFBRV21lamgwcm9l?=
 =?utf-8?B?ZiswMmF3dGVmVk1NRWh6K1ZWeXRBTCtTMWJzbHBtM2U2dGZhQXJkeEJrSno1?=
 =?utf-8?B?U0dVL0tjSE9kdjVWNWZvN2RDbkxQSnlJUEZTRGdYUkk4Q0NxZUhvTXpwMklW?=
 =?utf-8?B?ejN1KzNJVU1MUDhoQzFnOTVOMUtVNUpZZzdLdE56aksrMVhsdnlzZ1J3OE1m?=
 =?utf-8?B?Uk83QkUyM3RyS05JbnhQSWdCOVRxRXZwSDNRUjQrV3NHQmpWd2J6b09sa1Fj?=
 =?utf-8?B?djVLNUpuanFJUXcydXdSWVVRc2w3YVkwY3FjMk1EU1phUUhwOVlOb0RmMkdt?=
 =?utf-8?B?ZGw1V0FQdUNaaUNCTTM5dW1yTXNjTVllOTdSL1pUU1owNFVZaGFHTDdocGVi?=
 =?utf-8?B?YnBCa1J0Sm5nOWZKaXJnN3BLMFdCY2MyY0ZzaTRMWG1nUUVkT2JjWUttemVR?=
 =?utf-8?B?NEFKV2pkRFVHSnlCUXBERHdmeitCU3dDL0htVytQa1dWcC9jZjU5K3J2YTZv?=
 =?utf-8?B?V0puMzNPSVVuSFltc09jdUcycEdWdkdtU3lkU3ppSng4bXp1cHBDYjBRMytU?=
 =?utf-8?B?bUJ0U3Bwb0hSczZybEhrOTh0VXp5OCtXa0hPVjFCZkp4RXAxNDZCNXBtanRG?=
 =?utf-8?B?TmkxTkh6QmxFSDB0Mis2eDZET3d4eFdJaEk0a2JEY0NkeFgycjhWSjEzVzhH?=
 =?utf-8?B?QytRcDNWT0J4MFBmUTg3ZVBCelQ4TEkrMFlMQnZlVGJoZUxBZU03eGVSbnRX?=
 =?utf-8?B?YTgwWjBpTW1ncDNiZlhrUU5qMjZlZXIxaXVyUXFFalh1MXNXcFdBVDZYZENY?=
 =?utf-8?B?UUpPK1czWm51QlNvbldBaDhUNHpRVXBiSVYyY0JnclNuSERwUjlGeHU5SXd5?=
 =?utf-8?B?aGtmVGtTc0hLYUN1MkhVWlIyWG5rSVFkdEFtakM2WUtHNHNSZ3FHenRkaTRh?=
 =?utf-8?B?OGlRcDdqdnFyRm16UGgyWlJQVm9CQTNJUGF4QTd1aTNxbW1tQmgzUGhILzMx?=
 =?utf-8?B?QnpFSHM2NFdZRE00SEo1V0NITExJbjc0RXFCRlRjOGc1YTExd3l0MXFWS1Jq?=
 =?utf-8?B?MXdXOHVvRzZpd1dMRkhLSzdtVE9pMy9Ja2hDQU8xUE5iVjJEbWlsRytHUDBE?=
 =?utf-8?B?Qzl1TFNQdnppWmhlMUJnUDBRRXZ6SEN1elA1dlFkVHZYWkgwWnZOYkF0QkUy?=
 =?utf-8?B?NWppUkVaVHBkaERHcGJoTjhUcXlPNGc4cWw4Rk4wQjJlTmVwQzdJMzBacEhn?=
 =?utf-8?B?emltZDZNa2gvbGQ5UWE2a21ZMnR6ZVpsV0c5VG9mR3pSQVdSUE9tQWwrR0JZ?=
 =?utf-8?B?NHRSRWtkbHZkbXczeXVCWDVUL3ljZ0dUK1lEWTlKczBYQ0pwM2dHTmNacW1t?=
 =?utf-8?Q?CTsCBY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:19:47.7902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb465328-423e-4cf9-9f0e-08ddb3eaf57c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4076

On 2025-06-25 06:27, Jan Beulich wrote:
> On 16.06.2025 15:02, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/scrub_page.S
>> @@ -0,0 +1,39 @@
>> +        .file __FILE__
>> +
>> +#include <asm/asm_defns.h>
>> +#include <xen/page-size.h>
>> +#include <xen/scrub.h>
>> +
>> +FUNC(scrub_page_cold)
>> +        mov     $PAGE_SIZE/32, %ecx
>> +        mov     $SCRUB_PATTERN, %rax
>> +
>> +0:      movnti  %rax,   (%rdi)
>> +        movnti  %rax,  8(%rdi)
>> +        movnti  %rax, 16(%rdi)
>> +        movnti  %rax, 24(%rdi)
>> +        add     $32, %rdi
>> +        sub     $1, %ecx
>> +        jnz     0b
>> +
>> +        sfence
>> +        ret
>> +END(scrub_page_cold)
>> +
>> +        .macro scrub_page_stosb
>> +        mov     $PAGE_SIZE, %ecx
>> +        mov     $SCRUB_BYTE_PATTERN, %eax
>> +        rep stosb
>> +        ret
>> +        .endm
>> +
>> +        .macro scrub_page_stosq
>> +        mov     $PAGE_SIZE/8, %ecx
>> +        mov     $SCRUB_PATTERN, %rax
>> +        rep stosq
>> +        ret
>> +        .endm
>> +
>> +FUNC(scrub_page_hot)
>> +        ALTERNATIVE scrub_page_stosq, scrub_page_stosb, X86_FEATURE_ERMS
>> +END(scrub_page_hot)
> 
> Bah, I've noticed only now that I failed to do the ret -> RET conversion here
> during the most recent re-basing.

Good job catching that.  My R-b still applies with the RET fixup.

Regards,
Jason

