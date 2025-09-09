Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5DB4A7DE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116022.1462456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvufm-0007NM-Kx; Tue, 09 Sep 2025 09:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116022.1462456; Tue, 09 Sep 2025 09:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvufm-0007KC-I4; Tue, 09 Sep 2025 09:29:58 +0000
Received: by outflank-mailman (input) for mailman id 1116022;
 Tue, 09 Sep 2025 09:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KX1k=3U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uvufk-0007K5-6y
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:29:56 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2408::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89e0c727-8d5f-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 11:29:53 +0200 (CEST)
Received: from BYAPR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:40::40)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:29:47 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:40:cafe::b2) by BYAPR04CA0027.outlook.office365.com
 (2603:10b6:a03:40::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 09:29:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 09:29:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 9 Sep
 2025 02:29:46 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Sep
 2025 04:29:46 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Sep 2025 02:29:45 -0700
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
X-Inumbo-ID: 89e0c727-8d5f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAz+JszSFLosjqWukHn4QfgaG1kOwNVOGN/PZDY8Pn6L0fZvNxVYVcKljnL+qzlNvc430f5s1IURApNOeUFUDnAq9XtWlXgAfST2i2NbU+eE9+KGx5AnfujIoXSDauxZ3DxNjhCT6MjGT04JJ4eE2Gn2kUt259k9mk+rvEo6WHO7tjQJ1zxvUXBYMjkQ81b6VekBQmcsUhUOhXFhmtVyIdS/sQ08oQ33mALqhXd+OdJum883WBqljuAZG01JcbvEuC/sWn63kG/vTj1ND6R8pkH3yNgMHDthtYyDVhaUyPeN8FWZWz1o3koeEq5Brd9cMTGD6aTRWK8UrPqLJhYcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiWPo5rjWNA/PBVIm8tPUmXe+XE3l74Vgdg0+9VU4WA=;
 b=WJjXrFpJX+X+Z5BLRMBKViM238swwC27hcmol6YdqTsMATRq7uhgngja+jUiL9W9m6ZosTHZPnMYHpfJcDuCRfCJC83uGFhZZ7b/s4ZccDSq5bKQIwgqGDEWdM+F0C52f/de5gIt56v0tHMCMt/yK1m16HoyebX1csSlfbDOo311YIFDyU84j4EtivEmjjxj0HZjCxuDeUtUh7dfGlb80QP1QsnpHzmha21viPOSw+JYlYzRk6BuoSAd/KboOvlENXQQYlOtiyKxBm43BZqDXJgKKVAfDBmchLUybDwgVxuh34SUQNjUHBHMYoTvp5rU6xgTFqj0aheLBXa0fgwevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiWPo5rjWNA/PBVIm8tPUmXe+XE3l74Vgdg0+9VU4WA=;
 b=XSJN6Va+NRRGsW4JYMmY77bFTZsUz7Nv89YT7RbAWgdppjRrfFeiOPPXmZF+W1X2zA8qvaQ0+JvtGqiJC5QQT0+ZNXQ/gF15PdTpfPFnGXbzJ1hj20psK8Qgiiqhl3Wq7Jjo785LBZUY8QwajKTOnti8o+x/Q6M4L6vYT9Gz86o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0330174b-bda4-44fc-825b-6a680070b9dd@amd.com>
Date: Tue, 9 Sep 2025 11:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] Use LOAD_CMD by default if not specified in
 load_file()
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>
References: <20250909074141.7356-1-michal.orzel@amd.com>
 <CAGeoDV8zpHc0Rqmo4Vra5sZSh-mOjsTVPvursqZ42S=4HcRRYg@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV8zpHc0Rqmo4Vra5sZSh-mOjsTVPvursqZ42S=4HcRRYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|BY5PR12MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: 385fd41a-cfbd-4b67-52b0-08ddef836b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXluOEZyMENNZ3VLRHovaW1iMG5vYWIwa2kwVnAva1BsbjFvZVM2blkzb3JP?=
 =?utf-8?B?blJ0MGRSRGN3MXEvYTZ2N0lpaTRnWm9uajJkSnQzdzZMSDAwdDVsbkRkV2xl?=
 =?utf-8?B?TzRaalNOK0ZJa0Qvd2F5M3FXSEcwL2VZMzJQcmFBNDBrajl0dUxLT045a0hN?=
 =?utf-8?B?elFubmUycWpVbnVLMm5qT1Z4M0FNMFFxWTZzcmRIZWxyQVlaQkEvM0tQWjdP?=
 =?utf-8?B?alJ5TGNjUlN2Y2pvN2xlNzZlNDB5aVcyZGhwVmJ2TzdUMzBXSDdZOUlXZ0RJ?=
 =?utf-8?B?WGd5ZjV2aG11OWxYcmtVcDdKaUtBT25sVXJGbXFCR3M0MmpNNlV0TlVHWEtE?=
 =?utf-8?B?UkJlMlFqZ1hTbHBKcGdWM2dPK1FseUpLR211SlNreXdEZ29aNGt2R0gvYURz?=
 =?utf-8?B?SE1xdWdUWG9NNGhsUEtWSTgyZ0NaSGdQQTRrdjhZYUJCQ2NiK2FDRnNkTDVP?=
 =?utf-8?B?bEJ6YnZhNEowOFJDZGpDSE1XcmZLRnU5eUluNmh6bGYwSlVEMnBiRVl1REY2?=
 =?utf-8?B?TlErMjJjWGlNWldFYk8raTFzUERYRXpaNE05Wk41aTRqZlkyNEtmZ0NUOUF3?=
 =?utf-8?B?Vk9PcjhvM1duK0tCckxqOXE5bytZVUN5NExIMi9oV2xMSm1uRFJoU2wxNW04?=
 =?utf-8?B?QVExU0JYbFgyanluMW82V0hIbDh0TG9VUnlmYTg0QnRkbnV3U1dTNWhKVmI2?=
 =?utf-8?B?emU2K2txWm1zRlorZEZWQXRRVWxtN3dXa2hjanduYlVZcGd3SmdvOTdyOGpG?=
 =?utf-8?B?VmpyNysraFJkZU54V3RlTEpJRERPRmg5c3RzSlpYV1p2M09Ta2ZETTdWYkNU?=
 =?utf-8?B?UFZwT3k4dVJsUEJYc1psalp1MXM2STdQWXYxQUVTWk9TSjl2WFZKMmVuZXRH?=
 =?utf-8?B?alI5MENqTFI0anduUVBRSzArS3U5aWZGK2NkSTJHZW5rUlFBNE1jVkpiVDFm?=
 =?utf-8?B?Q2dKSmltQU5uMWZQZGRXa21EUysyaTdBRGNtTWlNdE0yeXduNTRDekMrMGg0?=
 =?utf-8?B?MDJoZGdKSWtYUVlTbFFBM3AwaElzdXdPOC9XRVl5UkJDVjdUTWhLTmVYMTdu?=
 =?utf-8?B?VUc5alJIdVpzSHdramFhOEw2OGNXdmpaK2pCTnZhQ0NTNHJUWTcxRDhoaTBV?=
 =?utf-8?B?MkNEZEQwWVREMzJXMDlzb2NFUG9sdXE2YVpuZmlESTFCakpOZWl3TzVzUnFE?=
 =?utf-8?B?bEtUODFmemVyS1lUcjJMaTNGZzlkRG5DVlA0TTAreGovb2dHVGFyZ2h5YlJD?=
 =?utf-8?B?WFFaZ25OZHBqcWVyelcvdDVvVTRiR0RnQUhFcllxZWhFMVRUSkFlV2lqNmNq?=
 =?utf-8?B?eFRNRUpWWVZWMUV4ckFUT0dUdXRUbHdwcFRhcDhyLzJVOEdWbDROYzhGeTFo?=
 =?utf-8?B?ZUlMcnkxNEVnajAzY0lqdVJhVmN6SjIwMm0rcDFWZGx3K2VFWDU5QzFhL3pX?=
 =?utf-8?B?VzViQi9hTmxVcE1wVEk4eUVrSjRjaWFGc2Jvb0FGM2hNQjlPaDdaQmtUeXlP?=
 =?utf-8?B?VjE1K054d2s5WHExYkZvNGdVQ1VKVmRDcnp0SWw3ZDlDeURtQXdFdGxmU3V1?=
 =?utf-8?B?M1dxMUpFM3N6V1U4cUxhOXlPMy9WbzREdmxBOFBRd3lpZzhOMUtOYW83V1Vw?=
 =?utf-8?B?VDhtVVUvSFJOZHN1LzRzOFRkVEhSYlNQK1VHT1YrQnM3UkNQSDFreE1BeStL?=
 =?utf-8?B?aFpGK3hQdmZzREh2K2JqcXF4M2R4NnVPZTdINTQ3Y0pLSHpKUUVOaWRUamhx?=
 =?utf-8?B?VW9IUUVQVElDckRiSS9Fc2JqbHhidkhLOU45SDBadkxOYWpjMEZwYjVaNS9x?=
 =?utf-8?B?UC9ITFFOTkVDNHpSUVNqZjZaaW5Ec29HNGNDT2JMQzY5RUo1QnpiRStxbkJr?=
 =?utf-8?B?Yjg2UkdLbTljZ3VRVjZZdGh4ZmpUWjF2dHJKSWxXYTlER2lEQnJPbDNuV3Rs?=
 =?utf-8?B?U2NtVmZJUnZPYWtON3JtNlFFTG52emh5WFhHYnd6UW5Pbys4bDlnSnpwZ1Q2?=
 =?utf-8?B?eXc4blMzbFEzZnhVVnkxQ3dXZWx2ZHkxNVdrdFE1aTlFRUZmb1orT2hGcDdz?=
 =?utf-8?Q?KNkXet?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:29:47.5266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 385fd41a-cfbd-4b67-52b0-08ddef836b4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161



On 09/09/2025 11:22, Mykola Kvach wrote:
> Hi Michal,
> 
> Thank you for the patch and the detailed explanation.
> 
> On Tue, Sep 9, 2025 at 10:42 AM Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Commit 061d6782756f modified load_file() to take load command as
>> argument but did not change all the invocations (e.g. loading standalone
>> Linux, bitstream, etc.) which broke the output script (load command
>> empty). Fix it by defaulting to LOAD_CMD if not specified.
>>
>> Fixes: 061d6782756f ("Add config option to use separate load commands for Xen, DOM0 and DOMU binaries")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  scripts/uboot-script-gen | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index 849b8f939e81..4f9261035d73 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -736,6 +736,12 @@ function load_file()
>>      local base="$(realpath $PWD)"/
>>      local relative_path=${absolute_path#"$base"}
>>
>> +    # Default to LOAD_CMD if not specified
>> +    if test -z "${load_cmd}"
>> +    then
>> +        load_cmd="${LOAD_CMD}"
>> +    fi
>> +
> 
> I was wondering if we could use a slightly more concise notation here, like:
> : "${load_cmd:=$LOAD_CMD}"
> 
> It does the same thing but is a bit more idiomatic for Bash scripts.
Some time ago, Stefano requested me to use a simpler notation in ImageBuilder,
so that it's immediately clear what the script does. Therefore I followed this
suggestion here as well. I will let him choose what suits the project best.

~Michal


