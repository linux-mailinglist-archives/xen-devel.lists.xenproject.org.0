Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03A8C5C54
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721770.1125435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yoW-0003e7-VY; Tue, 14 May 2024 20:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721770.1125435; Tue, 14 May 2024 20:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yoW-0003bQ-S4; Tue, 14 May 2024 20:31:56 +0000
Received: by outflank-mailman (input) for mailman id 721770;
 Tue, 14 May 2024 20:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loUn=MR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s6yoV-0003bK-Mp
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:31:55 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fefc3ca4-1230-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 22:31:53 +0200 (CEST)
Received: from DS7PR03CA0328.namprd03.prod.outlook.com (2603:10b6:8:2b::30) by
 SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.26; Tue, 14 May 2024 20:31:49 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::62) by DS7PR03CA0328.outlook.office365.com
 (2603:10b6:8:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Tue, 14 May 2024 20:31:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 20:31:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 15:31:47 -0500
Received: from [172.18.62.51] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 15:31:46 -0500
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
X-Inumbo-ID: fefc3ca4-1230-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efN4vsHwe/2TptbgIJrEQMzPEhMLOPd02xgPk1DzU/KmjCIfLGPMheFvTiIN/QNeHGt+3iXeN3jsNnzhCQlKu+bYMp2R/pTPa69Yl+r8UI5otHuso2cFWVum0qrgf8s44PKWbdRlOKNZ1TOR2GFLpsLnQ3ZEAamg8nvL60FPtvbqI/VoRPFWmDTiiBgEn2XT1nfGkei2cqOVSjYI5O64VfitqqV1NO9IAKTAmX3t33s+VJ2LYTwUuH1ovW45DEPHAqNMuO+0Zkcw5QdqT5P+0k+WCGk6R+Stn0zmk/RkMRGgpekFSRue1WbemcldW4NnK1n9Omdii3ZMZxHSMjk4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Tuv8uKyEOoj5fQkM8rpAb2/35C33Bxtn8x+6/yXHeU=;
 b=BhachzRcc5JMEe95RlerPxqZ+PxyO1ZJOXs19lWHnVxbZYVEi2NkeiA7Yo3hwpxHgTedjxfRwFG4Kcw2yEJF1/E9btXAoldq1mNxeZL7YNkie9mTZn7G6s3Rsn8kcHuWVRQuRgluKrM70oPvzb9bdbY0dy6IAw+CSXzlejLLpHvd8r+0AIhhuM7ToyTxy+X8x3Ql+HWtC/PIfYVn+2cqkkftTZitijD/on+geZs9oLQRGv5eG2srkt9c78HEk4owvigt4tduGsfkHQ3TGFoz+may6vjQkNfFwUhTXmdWdBJHc8x9g0uDJf5lNT+8Lxn6Fznbf3ij+jjhh5qCWQcjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Tuv8uKyEOoj5fQkM8rpAb2/35C33Bxtn8x+6/yXHeU=;
 b=fBw+yYVJWb8Ys4OGEuHLq3eRzQiy/6tvQQJF08uEZFcSI3xB+lflqesDhvEC8hUuwMflr0c3KQAotGemIG/Ue5B9YVZIFa8PDXsXA6JbydlfBwdEujf6sv9rmKxoqZTOb4Fn3giy6lkAM5M24K+EqtJAI/uf2sX4c14dZurxScw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <735c3e3c-d70a-40f5-aca7-f134bc5b98b1@amd.com>
Date: Tue, 14 May 2024 16:31:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/5] arm/vpci: honor access size when returning an
 error
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
 <20240514143400.152280-6-stewart.hildebrand@amd.com>
 <cf646df7-0e92-4138-8b54-471c72f44cb8@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <cf646df7-0e92-4138-8b54-471c72f44cb8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: e9df6e55-bdca-4159-737e-08dc7454e151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400017|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3pKckVQOTFPNTdJSWloUmY4QWN2blBhNGN3YjJ4aGN5UEIrNEdvaWZrZFdM?=
 =?utf-8?B?VzdZRVB6UUpRZFJkZ252ZXhQam5sNmNKREJ2Z09iVUUzM1pOeFZjb3U0OUdW?=
 =?utf-8?B?N0lLT1ZOTm9lU3BTZXpraWJQS1k0YUJQZGpNT0M0bjlRL3ZBY0pmNEdhcGw5?=
 =?utf-8?B?Zm00K0k5TVZNcE1STFJmQWh1RncyYUZuaEdIWW5OT3A2cStWeCticUVkTXVR?=
 =?utf-8?B?NTlaTERVSmZmM01vZmNDTlhnS0QzY0g3RXN3ZVdlUktjdkxwbDlBNHIzSUZy?=
 =?utf-8?B?RnVVVFR3bEZaMWdwazhQaFd1SWNJOEJZQW5pUmFxRHhaSU1iRThXc1FpRGI1?=
 =?utf-8?B?VHdFNng3TllxNm91RDVqNTVrZDBubzVPaHVnU2NOUkFKSXU2bi8vUS82TC9t?=
 =?utf-8?B?QkE2c2pMcEFDdjBQZlJrYTliNFVLQlpFME1aemRNVXVHc0hNeXpocEdFU0Iz?=
 =?utf-8?B?eDVDQ256c1VDOXFUZHBpOHFwYVUvdGcwUEVJNW54WkVzS2pqcGFlZjVZem8v?=
 =?utf-8?B?MmF6ZkhUNzVDd1A2ak1ZWHMzREd1UDJ3U29GNTQvRDRrU2UyWS9RZ0d5SFV5?=
 =?utf-8?B?ZWp6a21yaWdIK1djUGtuMTM4dTU2TWorN0dxRjVnQk8zdllZUjE1SE9TQko0?=
 =?utf-8?B?cjBLeDhWOUwrUUpENkY3SUQxRDRsZDkvRW9PaWl0dEp4RFErWVlXaEsvOFRL?=
 =?utf-8?B?a1QybEdXSkRZMXExTDJCU2t1c0lHbXdRdHoyN3N4WlFiM3dEcnByY3lBTHZ5?=
 =?utf-8?B?ZTE4eTJPVGRBc0Q3SDhYZGVCMkdVaEJ5aWZsZURLSkhpOFh5M3N6QjJ2SUc2?=
 =?utf-8?B?aHNXbC9pTmVkOTFZK0VWMG5aZmRwS3psMXUvWCszUmdaYk41L21ibVhvVTRN?=
 =?utf-8?B?YjNjK29HWHNVQXJ3bFFTSTNVaHRsTHV1Y2hBN2ZGcGZOcjJreEhldWRiYzFO?=
 =?utf-8?B?TnpNUGVoSVRsK21jVi8wcTdVMlNZSUZEUWVWbHpxUjdKVWJ1OHpPeERNLy9R?=
 =?utf-8?B?Mm5ac1NpL3oxRWt0Wm5vbEdwM2hZdlRqNnpxQnJERlVtdG1KeWpCYzNSQ2FE?=
 =?utf-8?B?c0U1b2tyR0NzWVQ4d1ViYlVpb2h2bGQ1dVcybUgzSDFBNUJZMmhDWCtZam5N?=
 =?utf-8?B?czVGWmFUcThWanRhbE5aWFJoOUlnbFZLUE5PajY0NlAreVpuZGFsMVlXNysx?=
 =?utf-8?B?R1F6bTd1dVF0RUVHTC9qVzIvK3FwTklobGZBSW9TTnN1Sk85bG4xUlNMSnFZ?=
 =?utf-8?B?QmUxMWRCdlNYU252WjVaNkV6U0xEQ3RaRDNiRVY4MFBxc2R5UXZFUlh3OTR5?=
 =?utf-8?B?SGhLNVRrK1NkN2hJaTJEZmZqK1JhSEdHQWMrUDlNZ2M3aWhoUEZQc0Y3VGl2?=
 =?utf-8?B?WUovaFZOdUJlZ2x4QThVVE9PNnBuNWk0c0t1ejU5Z2NnL1Y2QVZXd3VzZHJ1?=
 =?utf-8?B?RTdTTWFtaEVlN2J1ZWcxZ3J4Y0VoWWFsYXJuNGlNVkxwR3czRUxXV2ZyZjk4?=
 =?utf-8?B?VjFXOERpL1E5TnE4ZWt0UFYxSjJpbmd6S1lhUXFGMVJpR0hRaG9NL0JrN3hZ?=
 =?utf-8?B?RTFBT21hdDhHampETzE4SXFHUjM0SytPZjFsYWVpN3dSRlh3YkwreS9UbUpU?=
 =?utf-8?B?Qmc1TFJOQ1ZmNWJVNGVmUGxxOGZKM0FIY240M0t3Y29BSE5Ea1g4L2diWkdK?=
 =?utf-8?B?UXl5OWt2VWUrdExmaEFIT3JzSFphU3Baa0tkd0ppQ0FFR3oxcDRjL2MyWVpr?=
 =?utf-8?B?RzQvN2lxd243U0hpdVR5ajRZa3FkbmZqNVMzdCtjRVNEUC9PQktra2IxQXNy?=
 =?utf-8?B?NTNVTllTWTM1K2duTHRwTWNyQ3p6eHhnSVJlTDc1K1hRTFVKVXlOZC9uYjJZ?=
 =?utf-8?Q?hC/3slrsOmUR+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400017)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 20:31:48.5429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9df6e55-bdca-4159-737e-08dc7454e151
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430

On 5/14/24 13:48, Julien Grall wrote:
> Hi Stewart,
> 
> On 14/05/2024 15:33, Stewart Hildebrand wrote:
>> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>
>> Guest can try to read config space using different access sizes: 8,
>> 16, 32, 64 bits. We need to take this into account when we are
>> returning an error back to MMIO handler, otherwise it is possible to
>> provide more data than requested: i.e. guest issues LDRB instruction
>> to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
>> register.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> With one remark below:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks!

> 
>> ---
>> v9->10:
>> * New patch in v10.
>> ---
>>   xen/arch/arm/vpci.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>> index 348ba0fbc860..aaf9d9120c3d 100644
>> --- a/xen/arch/arm/vpci.c
>> +++ b/xen/arch/arm/vpci.c
>> @@ -41,6 +41,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>   {
>>       struct pci_host_bridge *bridge = p;
>>       pci_sbdf_t sbdf;
>> +    const uint8_t access_size = (1 << info->dabt.size) * 8;

I'd like to add a U suffix to the 1 to make it consistent with the
remaining occurrences in this file.

>> +    const uint64_t access_mask = GENMASK_ULL(access_size - 1, 0);
>>       /* data is needed to prevent a pointer cast on 32bit */
>>       unsigned long data;
>>   @@ -48,7 +50,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>         if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
>>       {
>> -        *r = ~0UL;
>> +        *r = access_mask;
> 
> The name 'access_mask' is a bit confusing. I would not expect such value
> for be returned to the guest. What about 'invalid'?

That sounds good, I've made the change in my local tree.

> 
> Also can you confirm whether patches #4 and #5 be committed without
> the rest of the series?

Patch #4: no, it uses a constant defined in patch #2 ("vpci: add initial
support for virtual PCI bus topology").

Patch #5: conceptually, yes, but patch #3 ("xen/arm: translate virtual
PCI bus topology for guests") also modifies vpci_mmio_read(), so there
are rebase conflicts to resolve in both patches #3 and #5. Thinking more
about it, patch #5 falls more into the category of a fix than a feature,
so it probably should have been in the beginning of the series anyway.
Alright, I've reordered it and resolved the rebase conflicts in my local
tree.

Here's what the patch ("arm/vpci: honor access size when returning an
error") now looks like based on staging:

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb55082a..31e9e1d20751 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -29,6 +29,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 {
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    const uint8_t access_size = (1U << info->dabt.size) * 8;
+    const uint64_t invalid = GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
@@ -39,7 +41,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
         return 1;
     }
 
-    *r = ~0ul;
+    *r = invalid;
 
     return 0;
 }

The patch ("xen/arm: translate virtual PCI bus topology for guests")
will then introduce a new use of the "invalid" variable.

