Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D9CCB38F2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 18:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183114.1505895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNfm-0000sg-TL; Wed, 10 Dec 2025 17:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183114.1505895; Wed, 10 Dec 2025 17:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNfm-0000qx-P4; Wed, 10 Dec 2025 17:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1183114;
 Wed, 10 Dec 2025 17:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11gW=6Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vTNfl-0000qr-Na
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 17:08:17 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d00e840c-d5ea-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 18:08:15 +0100 (CET)
Received: from PH7P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::9)
 by BY5PR12MB4148.namprd12.prod.outlook.com (2603:10b6:a03:208::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 17:08:10 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::5) by PH7P221CA0013.outlook.office365.com
 (2603:10b6:510:32a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 17:08:09 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 10 Dec 2025 17:08:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 11:08:08 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 09:08:08 -0800
Received: from [172.17.249.106] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 09:08:07 -0800
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
X-Inumbo-ID: d00e840c-d5ea-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNH379ABrs9JcV0sveeVcWK+VPxueXRjH9iytQTm4yCRd0Lcm9vESpUple6eDzck35GGB9NX1GNJlMtJ5z0pAXrCdbLgdsDG6QfySz0mxTxY6bxe3X3cWtPfb/17kU5lxsg3HrXgWiIhzs/CMgLJB45YQfwE9HVx14Il0B9eFZcABHfYb2OJANPaWD1do1cq0T8jqMOi+FZ+VxGJBTPda9nj0unVZIAOPlKGozE7CaUssmXT3bjFEOZ/yHMineNIr/0JpL31EZdKXJXQno3O/ATMvaSFyG2bdoWMGFSpPhl8EW0ilb8nsjURRFiSbBVctXRwDqd36d0U/OCcJJDAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLeVL7ayWcVTMb4z9L6irY86uDxmPJ66naDSp/8q4Iw=;
 b=iq23b022SLKGdZpsJG9SuIFoysY6ZxnIylj86t9RyfeNkqUEcDIP27LdR2rFvrc7u/7hnUstSjtnPC9wDoLnZcOQ56VO7guBrQZl7YzIGHXuSeUPfW2OUPTqrHmSrrq+hK8CFC2JmRbOJrTOU6wPyAHl4WfBTzNtqHq94gSwzY7okJd1KD1jwG4lt17QOy8IOLM4Q43W8Io2b45zZcF+RZVyuQwt60P5oscxhkju1nMlEqnG1h6UeuGSFvOuOZAbWNClncVE5KeAUR0GUHduPmUA7XqKBECja5FA7psdFFNU7v4+gxnQcDNumMXahTme+GWUtORO/zkxf/OiV2qUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLeVL7ayWcVTMb4z9L6irY86uDxmPJ66naDSp/8q4Iw=;
 b=QOCvBxALdeenKl1ISe98EzzryIWu7J0v2lO/FYLFzNaoDi7889uDrTusbO+P8K78OOYbPqojgwnF5yxd3gBaVWptS5/5IVCNc8Badn/PfwqjDJgnYLIk6ObQjVowXASvBISh1uMiUpRbaL23vg6S0lOWIbaWEe4SRsZNWM7aWLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a6d3737f-19e0-4a52-a5d9-70bbfe7630a8@amd.com>
Date: Wed, 10 Dec 2025 12:08:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Anthony PERARD <anthony@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Victor Lira <victorm.lira@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com> <aTmGTWIO2ZKWuQeu@l14>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aTmGTWIO2ZKWuQeu@l14>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|BY5PR12MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: 019f125b-1517-4b2c-5480-08de380eb183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkVIQ2R3dG5qbzh4S2dQQzA1R0k3SWNBK1pPRHRCalBNOE83dGF6b2FzZk5N?=
 =?utf-8?B?WDZ6M1QwR2owQ0NvaDhPU1pYS2x0MDdKOWdXM3pFOVB6U25COFlnOHROL0I5?=
 =?utf-8?B?eStQWGN6S3JmMzl5L2ppbDJ5akU3TzBhcjFhd2g5cForb0ZtUStSZ2FXV254?=
 =?utf-8?B?eTVhOFNRcTR5YVk0YXZvVlJramVUanVOTUZuZk9hSXNIRHRKN1crNHI0NzB3?=
 =?utf-8?B?ZjVTd0RoMUw3U0Z2eTl6aktFYUZ4RmpXTUgwOEdkd1BYaTZFWkNpQTVZTWZv?=
 =?utf-8?B?SnR2eHl5d0xzU1ZIUDlvT2JrdlpYWXpNZmRaNTI4Szl6RWlJanhEcFppOGtR?=
 =?utf-8?B?Mkh0UW1NNzlwekhNZ0FGcUhpQmgrWFk4eGptMHo1KzRTYkh2d1pmZHRmUmtQ?=
 =?utf-8?B?eS9kSkJNNVVyZ1dHZnV2clpHYlBOZFVIVlErd3pnRVo1MXczZDJIZ0NKMlJt?=
 =?utf-8?B?aExSQjlmRHE3cFlZM0xMTVdKMXVJOGVEK0k5cHJpM0ZsV0xGRzRGeHRSN08x?=
 =?utf-8?B?bGtNc2xQOUNISlloMGFXVmQxNWJRTlAyM0RwY3Q4SXA2Tk5UUXUydE5UOFJw?=
 =?utf-8?B?aXljNWFKd3N4d3NzekVlUnI1S1BkdWxlWTM2ZU5jcmFya21NU0JKOGVhWlZS?=
 =?utf-8?B?K1h2MVo1VWgrUkZrUllvT2wvbHZJQUdvbHA1T1RzUkFHa2ovaEtKSE45bGVl?=
 =?utf-8?B?WjIrWENZeW5wbW5YK1RMWk5HZVBDRWRFME1LUFI4cTNXODBSS2J1QXhsYTYw?=
 =?utf-8?B?cy93MFZZZ0J2TU1lV3V4QXpXU1J6Unc4T0xwRGpKdWNVMXRNK1ZvYTJRbmF4?=
 =?utf-8?B?NGUxRnU3MXh3NFJyWTFqMElnbDRVQ2dPd3NXeXU0clkrTG8wakhQMkVGVExG?=
 =?utf-8?B?Q04rc1A5TmZqVE9RYjRnKyt3KzZ1RS9QQlY0Y1hnMFkrQURiZ29Pa1ZrcTZS?=
 =?utf-8?B?Rk1HUFYxOVpvRmRJcHJ0TDhqc2tNQ2VmRUlNdUlhWTVhdjhYZGo2U0pjMkR5?=
 =?utf-8?B?bHNQSG4xcDVGajhjYXpxRnBUV29FbmJ5Q2sva29vKzYrNS8yenNpOWhPZ2lv?=
 =?utf-8?B?WFBaWmd1N2dpUzBRSnVtemtYbGtab28xWlRGSkRaWk9sM1p1bUltNmp5cVNK?=
 =?utf-8?B?YVd3czFraU5TN21TYjZZeFlvQXNBTFpVTWFsNk5sb3NxTzB4QWU2dWRZZjF6?=
 =?utf-8?B?SUVDZVhaV2xhdE1helE0YzVQbHEzaVVlR3JFL1hoR3NGcWhJVHB0bUEwNkZ6?=
 =?utf-8?B?Y0hwWDVsSHo4d1lrYi9QVGJIK05yRkhkSUkyTmx3VmZhR2dwYVBXTzdCbzNh?=
 =?utf-8?B?ZFp1WGJVTGxJa1ZGSmh0dE9aODRwK0ZWOWx3TUdkeGFJdEV6S2EwUE9vejRu?=
 =?utf-8?B?K1pld2gzK2dwV3BkalVoSUdYMXBkaGVzTDhleTZ4ZGtYaWVMVEl0TlRQKytq?=
 =?utf-8?B?UisyeG5ZS3lBQWZSa2FGMnNtTVJxWVNKd3RCSE1TNEdHK1c0ME9BQnZQdnkz?=
 =?utf-8?B?Mk5HQkZQRnZ1L2tnZXZyU095R0xidVpjbU9SbDZBZ2xWY254VEFWN1BTejFF?=
 =?utf-8?B?bGRJL0dlcy9ON2lKVm5xNXgwZ3c3K2pKR3pZWGZZcHVsUEhMS0pqdWh4bXN5?=
 =?utf-8?B?cmhVWTZySjI5SnBLbTM4bzVVOUp1ZzcxUEc2aWUzZUFXRjBmdTdROU53OWd6?=
 =?utf-8?B?YXR2OCtJTldNcUsydGI2OVVSSklTQlBjS1ZFemhFa1dlOEh5VC9kK25MMDR6?=
 =?utf-8?B?cWhMM1daTEtHVGNxVjB3ZEk1Vk1uandWWVVxOGxmMkp5TEVuSnFka1BtRFZR?=
 =?utf-8?B?dmFIOVM0bmtBR08xY0lPSS8veGk5UWhjSGltNXVRc2ErMDV2QnRBS0x6YXQ5?=
 =?utf-8?B?U1B0c1kzVkg5bmJqeHl0L21WQ2R6UzlNTXpKMU1FVWRvOGhwcmhoZVpUclpR?=
 =?utf-8?B?dVllSkxaeXY5MzZBYUt0ZzV0Q1UxOVBNV083c0NUcW9ieXpTSlRVYUMrK3o0?=
 =?utf-8?B?UzJOOHdxNVEvbE93ZkN6OUFORTlHM0pMZnhtM2pJNDk1cmhBejVuT0NuMEdC?=
 =?utf-8?B?dmVQby81anZwaStreFBIWDdYaW9Sa25sZ2pFb28wMkVXU3JXZzZCeXIveGpq?=
 =?utf-8?Q?yRSE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:08:09.1182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 019f125b-1517-4b2c-5480-08de380eb183
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4148

On 2025-12-10 09:40, Anthony PERARD wrote:
> On Tue, Dec 09, 2025 at 04:47:28PM -0500, Jason Andryuk wrote:
>> diff --git a/xen/Makefile b/xen/Makefile
>> index e6cf287425..aeb5dcf2ee 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -469,10 +469,13 @@ all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
>>   
>>   include $(srctree)/arch/$(SRCARCH)/arch.mk
>>   
>> +XEN_FINAL_LDFLAGS-$(CONFIG_GC_SECTIONS) := --gc-sections
> 
> Is there a good reason to add this flags after the arch-specific
> makefiles? If not, could you move that just before, and right after the
> definition of "$(all-symbols)" as it's a variable that is used in the
> same phase of the build. (With Jan's other feedback)

No, there is no reason for its location.  I can move it.

>>   # define new variables to avoid the ones defined in Config.mk
>>   export XEN_CFLAGS := $(CFLAGS)
>>   export XEN_AFLAGS := $(AFLAGS)
>>   export XEN_LDFLAGS := $(LDFLAGS)
>> +export XEN_FINAL_LDFLAGS := $(LDFLAGS) $(XEN_FINAL_LDFLAGS-y)
> 
> "FINAL" isn't very descriptive. A completely wrong interpretation might
> be that we should use the "final" variable instead of "XEN_LDFLAGS". How
> about a name that describe where this set of flags is going to be used,
> like "XEN_LDFLAGS_xen_syms" (which unfortunately doesn't exactly fit
> with x86 xen.efi target), or maybe suffix it with "_target" or just
> "_xen"? (In Linux build system, they use "LDFLAGS_vmlinux", but I don't
> know what would be the equivalent of "vmlinux" in our build system.)

I plan to use "_xen" unless anyone objects.  "_xen_lds" could be another 
option, but again that doesn't match efi.lds.

Hmmm - maybe my earlier xen.efi link failure was from efi.lds needing to 
be updated.

> 
> The prefix "XEN_" is used as namespace, with one reason described in the
> comment.

I'm not sure what you mean here.  Are you just pointing out that XEN_ is 
the prefix and not the target?

> Also, could you use $(XEN_LDFLAGS) instead of $(LDFLAGS) ?

Yes.

Thanks,
Jason

