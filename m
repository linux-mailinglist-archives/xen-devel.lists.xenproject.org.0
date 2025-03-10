Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FCAA59721
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906496.1313917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trdqY-0000Xx-KL; Mon, 10 Mar 2025 14:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906496.1313917; Mon, 10 Mar 2025 14:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trdqY-0000VK-HZ; Mon, 10 Mar 2025 14:11:10 +0000
Received: by outflank-mailman (input) for mailman id 906496;
 Mon, 10 Mar 2025 14:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjn7=V5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1trdqX-0000VE-4R
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:11:09 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2406::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 820d5dfd-fdb9-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 15:11:07 +0100 (CET)
Received: from SA1P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::9)
 by CY8PR12MB7537.namprd12.prod.outlook.com (2603:10b6:930:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 14:11:00 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::23) by SA1P222CA0002.outlook.office365.com
 (2603:10b6:806:22c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Mon,
 10 Mar 2025 14:11:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 14:10:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 09:10:58 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 09:10:57 -0500
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
X-Inumbo-ID: 820d5dfd-fdb9-11ef-9ab8-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8VjdW2l8DfkiO1zMYM0QaRrd1yx6otZ5SrxOu7KDJTMwgmFJTaXmal3mREBWyvqLekq5aYU8UTXKkzS1dlS1aACXBYudg0Ufi8hdoBqgLyWM7iG47MZnry+6IJnNq7TLZurQ5oA/cku3IdIqb3ehXtkaMqy+G9jhC4NG3yeoha0q0ucrOq5mPni6vbdP6K4guxzJToqmhqhZ+lReQhP4QAHng/1TWzCZ5G8fPLF6Hjjd0tUa4eyw0R7bkrNjsvT8RtfpkG63KNkOgHoT1F32OkKlKqgir84p/hvG7hwhXAfkupoCFsuYWSGBNaN0nQJSufpsNiOKnIwM6coTKTsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+deBzuMaTSaOu0/9chk3pmPoKMsis3czdyUZnYOZO0=;
 b=w2B9Uy6Kwg/K9XSVX5c91DUAF6m3lMbUc6eNV+mBZY4VNy3kUIGPo/jXUSsuCE0hUvH4dANWYdSmHs2a0iu2IW9a/M+S2MwOojgrxBZwUSQB22CnNiPYs6XejYGTziPH6fXDvzlUEaMnBTsOwgfBelFzwFi+neZiqBqc/sfGk56xHHm6aoftmTHeUhOxHykfGepeCc6jbu/UxU+H5uToXQ8Vch0szso8Z1XAHdUfJ275XFkH9GwCx/d6aT1vbjR+poBz0yVeYo0LFv8TFKhK6kkb78/+KMLpXxrQHhrJ3iYZhU0GzcjsylDeCR+A7osLMEivz9mF79SPHdw/v99fOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+deBzuMaTSaOu0/9chk3pmPoKMsis3czdyUZnYOZO0=;
 b=S23ko/CgOP7OKIF3L61Kebo3EkG7rltjz/fOsnouPBf4qp32YB6ffAIQm06QyzOAey6Oo1V30urkcsLQjhifU9zd2wclp8WJZWCJ3IocoEy6jFIUZE8wgdxgZirrGBW5OMWvmgI2AuD/CydXP+6kYwTcJQ0t74BPxHOND3XNOXM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fbf002d2-c38e-43f9-8bcc-e810c10d6859@amd.com>
Date: Mon, 10 Mar 2025 10:11:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/23] xen/domctl: Expose privileged and hardware
 capabilities
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-7-jason.andryuk@amd.com>
 <813569bb-a1f7-42b0-a872-f6ecf4033880@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <813569bb-a1f7-42b0-a872-f6ecf4033880@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CY8PR12MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe84afd-aa84-44bc-1e6c-08dd5fdd6229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3VHSWtSWlVBRjNpTUJkejBveEVtbmI5M2srWVVKM0xueDBSVnRwbGlWM1ZE?=
 =?utf-8?B?MjVvT3BsaGZIVWxIZTJNRTF2SlFlVVhBaXNtcmJLaW5TeFQzUGJoY05TaVFy?=
 =?utf-8?B?Uk5DNjNCVS9hbTdGRHFLM0hYVGtiT2FIdGMxQ2czcGREc2dvSWsvS0poa3ZK?=
 =?utf-8?B?ZGFjZGRONnV0ZG5LK3hlOU1leEc3TXB4NjF4bTlvcTNaZHA1cWNqMzQ0TUZB?=
 =?utf-8?B?bEgwdUVQVG5ZenhuYS9uVjV5dzg3ajQ2eVFKQTRSVm4yQnhhWitTa0MxQmhZ?=
 =?utf-8?B?N1cwdEFDcGNqY2c2Mll6K09GVWI0RVJ2dVNQeUw0SkVRc2RVbG44KzdEbmMv?=
 =?utf-8?B?SUJ4am5Dem9iOWpsdGloMEl4RmlTTmxJOTJHaUtWc1FqSUw4cnZLZE90UDJO?=
 =?utf-8?B?SU9pQjNHNGR3dkdrUXAyWE9jc204RTVKYUEzeWxDN1ovMmFpd05lMXoxMlVH?=
 =?utf-8?B?Uk1mc2RCS2tJTitjRXR3bGVuV2VPeUxOcEI2OUFHLzNDcEhZd21qdmlrVlZJ?=
 =?utf-8?B?SG05RjB3a3c5R3JNUVpYNVcwRDNmTVdIZU5JSkV0NGplN1NxUlFMSGFZbkhN?=
 =?utf-8?B?MnByQUpaYjZVUUFEUUVuRkhSTTRnT3RCNzRGVUJyUFp1UVNiQTZFd205QUtU?=
 =?utf-8?B?YmFreS82MUF1SlFObmZ3TlBSWS8yNTZNVWtOUnBLTENZWWw0RDNXbW5SY2or?=
 =?utf-8?B?STRLU1pwM29zaklXbnJnMGhjRU9rd2FGeThXdzkyOHZNdjNGSkRCWFhGNHhZ?=
 =?utf-8?B?c3hKMFIxUUdpOWJUK3FkNnF3SHJ3VXhFTzJXcThxL1c3S0k0YTlyWkpSL3Nz?=
 =?utf-8?B?a1BZUVM0UXVZditWVEE2KzhlcFo4Y3hsUnZMQzluNFIrandhclVVSzFRbUlr?=
 =?utf-8?B?c3V4NjRsKzdKNUlSWlJjV0k5TzBPdENWdkNMdU1JSTAzV3htS3FDYjU2S0ZQ?=
 =?utf-8?B?SzJDSVExTHdlTjBIUXZyWlZjR0xUYUZKbGs2SGRWdHdPUXlBT3BjRHg1NlpH?=
 =?utf-8?B?ZXZleS84ODBmYmJFZmVLRnJiVitySER3SFFIOGIzeFJpcVN1TzgyT2VFek5L?=
 =?utf-8?B?V0ZwRm5Jb1JZSFNTcVI2NUtkRGkzT1dmTk9ycWhHeVRoZzl6dkw0NlJKY1Rv?=
 =?utf-8?B?RlFFZzdJVnBIOUMxanNaWTQ3Z3hVckQxdVVjYzlVY1lSZGFDanlkZlZBN1pj?=
 =?utf-8?B?eEJmWGpmY1dOYWhIRHdlb3pYclRFdGhia3lYRXZKT1NvaGhLOXhhbEJFaDBn?=
 =?utf-8?B?QmY4Z2xFYkUrUnY1WHFibGpjODkwR2JZZE5ycGhyVVN1VnJUajRCNE01N2I0?=
 =?utf-8?B?VEJyVEF5cUJxL0cyWWZWRVVscTlVdWhDVE16TE10WjZ1TDFUVk1MQ295Z0RB?=
 =?utf-8?B?QmVzRzAzRjhFck96d1VMdWt3ckJGNy9CNFJqSnhaUEFkdmFWTkFTdk5PVDhD?=
 =?utf-8?B?YXBNc1VhSlNXMFhsVmx5MzNoV0FsUFlOL0pPOEZZUkhDSk5aSlBvRitsek5X?=
 =?utf-8?B?VzgwMWFWVE1BMm9kTnlKVUR2SFJ4NHEyMTg0WnQ1alRZZEVFWTVxNlpsUHNa?=
 =?utf-8?B?VjIram5tanBGcW1PaGttVFBBZndIeUJ5dzBzSWt5R1NvWE5Wc0dOUEVJYk9z?=
 =?utf-8?B?Vzh4MXJQMVI5NjlxbmpVYjRSeEZlN2gzaWNXdGxqazRmR3JZZDlCYWZpZmZi?=
 =?utf-8?B?L0FIQ3JvRFVQamxxZ3NtcFVrazAxRUNJQTAvMzBwZzZZU2dSTkxBYVRpWDJW?=
 =?utf-8?B?cHlMSVFoN2lCbzJEWnFKRWswbGF3bHN3RnptblBGSDE5Y0JBUWFhd0liYUFx?=
 =?utf-8?B?QlJZNHlmd08wK1V1aE5xc3p0SUFWM3VBOEVuVHZ0Yk1pSEEwSEMvZThKMFBh?=
 =?utf-8?B?QXRjUE9sSHRDVVdGVStaK05GRFJsWFN4c2lwZkk5SUMzblBybGZ5TmlsY21V?=
 =?utf-8?B?d1FKUmsxN2dBYjNyc2ZVSTcrbVMxKzRua2VhZ29lVU8weTZTb3hzSTNLN1pi?=
 =?utf-8?B?d3pWblA4dWxnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:10:59.4814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe84afd-aa84-44bc-1e6c-08dd5fdd6229
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7537

On 2025-03-10 05:03, Jan Beulich wrote:
> On 06.03.2025 23:03, Jason Andryuk wrote:
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -155,6 +155,12 @@ struct xen_domctl_getdomaininfo {
>>   /* domain has hardware assisted paging */
>>   #define _XEN_DOMINF_hap       8
>>   #define XEN_DOMINF_hap        (1U<<_XEN_DOMINF_hap)
>> +/* domain is hardware domain */
>> +#define _XEN_DOMINF_hardware  9
>> +#define XEN_DOMINF_hardware   (1U<<_XEN_DOMINF_hardware)
>> +/* domain is privileged */
>> +#define _XEN_DOMINF_priv      10
>> +#define XEN_DOMINF_priv       (1U<<_XEN_DOMINF_priv)
> 
> Oh, and: If we really need both constants (I doubt we do), the latter wants
> to follow style even if all of its siblings don't (i.e. blanks around binary
> operators).

Ok on this and the rename.

Why do you think they are not necessary?  I did not see a way to expose 
the capabilities for other domains.

Or do you mean if they are added to XEN_DOMCTL_get_domain_state that 
won't be necessary?

Thanks,
Jason

