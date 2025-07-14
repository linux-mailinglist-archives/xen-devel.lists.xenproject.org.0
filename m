Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B501B0498F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 23:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043060.1413168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQnV-0005Rq-B1; Mon, 14 Jul 2025 21:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043060.1413168; Mon, 14 Jul 2025 21:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQnV-0005PY-72; Mon, 14 Jul 2025 21:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1043060;
 Mon, 14 Jul 2025 21:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubQnT-0005Nd-GS
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 21:33:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 233c69f5-60fa-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 23:33:13 +0200 (CEST)
Received: from BN8PR15CA0020.namprd15.prod.outlook.com (2603:10b6:408:c0::33)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 21:33:07 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:408:c0:cafe::3c) by BN8PR15CA0020.outlook.office365.com
 (2603:10b6:408:c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 21:33:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 21:33:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:33:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:33:04 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 16:33:04 -0500
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
X-Inumbo-ID: 233c69f5-60fa-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXakhrimfEv85iOW+YzeWLM9Ahc7ZGgaBYp+joP4DpkkEotEAJp9WQKv1EEZ+sWhuY2qu+GINKV/yKeLAZLpP+bwsyvpoPkucYYn5/NN1LdL2wmZ1jHU6GLmBQHqg2zJyfFk4LAuvd5w7EP9/eFks1KtqVBkMj7sMBMe/5b46qYsWZxHLlN44m3pw5pK7+GpKx9bTngE+bWZ0twuJMZ+YxMuRjw7vHv4xTRr2b+10unYop8CfL1Lga7ECelqnoh6UQS82arifLfc/A1gFOPloTvnEak1KXqXLjOJlsDlzH0ys6RnJirOtl1vixKX32M/wMpIaTmv40gLCRrzJnzVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTWkn6CBsnuAuhBy9uApDhjzDSIdMXWDUk9Fi4+i1nU=;
 b=MWCwQz5CzQcGRu6KOp6h/7dcP8AUIarnuqFVdggK6C57SzvlFhbUgWpniIJnQS8YbFNUQNsGqhcwe30FXjtvT9WrLIR/AKGiwBGcXn8mQoogdiQXXSCoSRHhXMlhoRff+rP25a25cFhic+M5SM+aPJ8DlgwsKUhsSkoCOFJRvs27C43JrFUXOXSgI9xW5hRPwaVnL5j8d7CjN5VopJfBba9s4ezl1hrYZvIvPczh6usRqj9mJrTpgky6LIviMAMNncw4Uxf45DqPlnFkAe6TyNuyWpF/legyZmPMcPO0ri7ZFqwk1zUnsZBfsUw8LShNvPhvIQRv+blp1i47Mm8r0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTWkn6CBsnuAuhBy9uApDhjzDSIdMXWDUk9Fi4+i1nU=;
 b=0bTEa5qTsyg5bLam0fchgq42G1hdtxVELmC/FLaaOrgYTUS2NneCZQS370O5ktfi/sqRTbWfqwbiy13DhRxvce8nwdSMz9hx6tGVgNSE59FJv6P8rBCuxxHY+SZG2WFprN3heRBcWCzOY6YpKGOjs3F/Y8Hmg+UiLkHFTX7FdDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <000bcec6-09ad-4784-9c1c-a5acd2ee52bb@amd.com>
Date: Mon, 14 Jul 2025 17:22:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH 12/19] mini-os: kexec: add support for handing
 over some memory across kexec
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<minios-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-13-jgross@suse.com>
 <cbb2c96d-c4da-4360-9f74-0dbfe3448747@amd.com>
 <82e521d2-9886-4540-8e8c-7096fd34451e@suse.com>
Content-Language: en-US
In-Reply-To: <82e521d2-9886-4540-8e8c-7096fd34451e@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 81fb7e99-7ed9-49f8-1210-08ddc31e04ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXJnNy9FWldGZlNBRFltdXRWY25GVHgrVkxmSlQrczBJZ05GUUpzbkhDRFVr?=
 =?utf-8?B?Z3lhMlZ6R2I1Tk1PVmQ2UjFxZlJvclVLTmpIOG5hTkdvTGZLVHAydFlXWHMy?=
 =?utf-8?B?Sk1VdnZ4NEYvY0l4VkZJbDlmL0M2dVZ2NTJMTFAwWi9mYUQ4clNhRzduV3ZB?=
 =?utf-8?B?VmVJQ21xSVB2elZUSHcrakVQNlA3anZmUVhGUWNQZG9Ha2pqMVJNUlRTYjRt?=
 =?utf-8?B?QTdoc2pJMEsrRW5MYnFGWFIxNWRwaEhCd29aaHZYRWQrOWFpZ1J6czJqdXdT?=
 =?utf-8?B?WDhxYWI5anhlOE50RWgzdFU4Tll6TFp1ODFkeFc3bHBDRHhMRkg0anFWa1N0?=
 =?utf-8?B?RGR2bGtPdktSVHNJTFB6WWxYZTBHb3hYbEI0czdVM1EzRDZadS9hREQ0SFNo?=
 =?utf-8?B?Z1V5dUR5bjZ5TXZjN2hyMzREN0dCZFhVa3lXb0NsSUhpa01UeDZNRDRJQnVS?=
 =?utf-8?B?OXJXTzNaRG9seGdTNGhKYURyUGlBenBTT1A3MFduL2MwZmtabWVkYmdGOXZi?=
 =?utf-8?B?azkzelc3WVdTTHhKVStVNTNLcmc1SlFTUnhvZ010TzJ6ZVRHWTQyQnlTZXZE?=
 =?utf-8?B?ZlBrMUVWTUxoV2lFUDk4QlpvODFNMWlsYjl3eTY2KytRZ0xsbmVFUkFQLzZK?=
 =?utf-8?B?S0VVdElDaUcwRkpSMDVWQ0hyYjJ0Y3ZLdUdQYldKWFIvSXMrUWVxZ0d6RkpQ?=
 =?utf-8?B?QnRoTUJqRU1HNlhwUE1GdEh2cHc1Wk5CNitwb0t0dmw4aXZFNUV4Y0ROVFNU?=
 =?utf-8?B?OHc5M1dzSkcydFZkRVFBN3RnUmV4b1ZsNytxV3M2MnIxYlk4Nm1qZS9oT1R5?=
 =?utf-8?B?ZjV3dldEV0FyVXhiOENkTUJIbVJPQUlpaWF3ZW81dllSMGdEellkSWNhWjRX?=
 =?utf-8?B?RGdLSXQxdmdxVlFmRmdVY0R5OG81d2lqUnM3OXhIVTV6NzBWOWF6QzIwR2V0?=
 =?utf-8?B?Y3ZLRlJDc00wQ0lEQjJQc2pZWWNzMUtnQ24xNGhUc1Ywb1Y0eXRWL3VIbkxo?=
 =?utf-8?B?bEx2eEFxVHlZSGhDMmpxaWpGZUZPRGRqSUJYbmNHOFB6NG9EbU5FdUVvTG9S?=
 =?utf-8?B?RXM1b3VaU2NjOThsWHQ5elJxSHZTTFF5SHlNYmcraVh0R0NGblB1d0I1R3FE?=
 =?utf-8?B?cXh6NlJwZk5QOC9ybitYcnR0YXM5cHphcFZPTlZ6QjBnTWVUSGxwa01qT05O?=
 =?utf-8?B?dmlIQng5c2dpZmhESkFBUjd0b0lXeFBVZGREcXJiUVE3ZGV4UmFtc3A1Q242?=
 =?utf-8?B?NkF0RXRkS2xGTXEzN1hkWDV0eE9KclVCNm5Pc3c4VnVsVFBXVUJmT0tMUDNa?=
 =?utf-8?B?cC9VRndmT2tIc3FzNTgwRWxTWVJLbm1CbjZObm54SWdRQ0tMNkN4VVlQRG5B?=
 =?utf-8?B?elZPSStEM05mY2U3aFhMNDRaM2RNdHJtYkYvNWNCS3BNUXFyUC9vMDU5Q0dy?=
 =?utf-8?B?SWZGV05NZHJ3SjZUL2pZNCtNc0pselkrbExkVngyTU1ORnl0dGF2b1oycWNL?=
 =?utf-8?B?NUNSUm1IVEUxQ3phcFpSODJPTEhrR2JrZnd3ekJZamRINTRnRWJJQzYvRXZl?=
 =?utf-8?B?QWVuNE1jSnBQSk5XVHo0NFZYS1I1UGlkRmdtaEpOTGhYcjZNL0IwUzgvNFFP?=
 =?utf-8?B?MjVOZmlJNitYdW1IVlBpQzVRQU5lbWRCQnpuRjNRSzgwSG9XRk1zQ25jUEEw?=
 =?utf-8?B?OWhhemowWXZ6N1BaSmwzZGFsR0ZaR082MzZZa2tDN1hWTGFKUDE3K2U3ZGlZ?=
 =?utf-8?B?d0UxbnZKUTdXUkdZODJXMHByYWhUbTJmTGRhcEJrWUNQK0RySEFIVHRkRW4r?=
 =?utf-8?B?VllOQjBXUmZobFcxcjErdy9UZlVNZjcvQUkxLzFVR3VDclNxdFJLQk1JY2Zx?=
 =?utf-8?B?M0o4Z2V3RXZpcjJERmtmRXpsb3ovWjFvTGNYTytoaEMwTUphTGJrdWM5aFNp?=
 =?utf-8?B?dWxiaE5zbHpobnFiQWpLSTlJZFB2OVR3alBSQi9zK2lxU1VxRiszNWRkZ3pZ?=
 =?utf-8?B?S0VHWlR2R0E1d0l4Q0p4d3F0TU5pSlBDM1ZCWDB0aHhJRjByK0lIQzdjdXha?=
 =?utf-8?Q?oEceC0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:33:05.5256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fb7e99-7ed9-49f8-1210-08ddc31e04ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500

On 2025-07-11 03:49, Jürgen Groß wrote:
> On 11.07.25 01:21, Jason Andryuk wrote:
>> On 2025-07-02 04:12, Juergen Gross wrote:
>>> Especially for support of Xenstore-stubdom live update some memory must
>>> be handed over to the new kernel without moving it around: as the
>>> 9pfs device used for storing and retrieving the state of Xenstore
>>> needs to be kept operational across kexec (it can't be reopened due to
>>> Xenstore not being available without access to the device), the ring
>>> pages need to be accessible via active grants by the backend all the
>>> time.
>>>
>>> Add the basic support for that by reserving a pre-defined number of
>>> memory pages at the top of the memory. This memory area will be
>>> handed over to the new kernel via specifying it as a module in
>>> struct hvm_start_info.
>>>
>>> The contents of the memory area are described via a generic table of
>>> contents in the last page of the memory.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>

>>> diff --git a/Config.mk b/Config.mk
>>> index b9675e61..0e4e86d8 100644
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -220,6 +220,8 @@ CONFIG-$(lwip) += CONFIG_LWIP
>>>   $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
>>>   $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
>>> +CONFIG-val-$(CONFIG_KEXEC) += CONFIG_KEXEC_MODULE_PAGES
>>> +
>>
>> I don't know Makefiles well enough to review the preceding patch.  
>> This doesn't seem to be used?
> 
> It is.

Oh, so setting CONFIG-val-y, through the Makefile magic, creates
-DCONFIG_KEXEC_MODULE_PAGES=$n

I said I didn't know Makefiles well :)

>>
>>>   $(foreach i,$(CONFIG-val-y),$(eval $(i) ?= 0))
>>>   CONFIG-x += CONFIG_LIBXS

>>> +    module_ptr = (void *)(mod + mod_size - (unsigned long)PAGE_SIZE);
>>> +
>>> +    /* Check eye catcher. */
>>> +    if ( memcmp(module_ptr->eye_catcher, KEXECMOD_EYECATCHER,
>>> +                sizeof(module_ptr->eye_catcher)) )
>>> +        return NULL;
>>> +    if ( module_ptr->n_pages != (mod_size >> PAGE_SHIFT) - 1 )
>>> +        return NULL;
>>> +
>>> +    return module_ptr;
>>> +}
>>
>>> +#define min(a, b) ((a) < (b) ? (a) : (b))
>>> +void kexec_module(unsigned long start_pfn, unsigned long max_pfn)
>>> +{
>>> +    /* Reuse already existing kexec module. */
>>> +    mod_ptr = kexec_check_module();
>>> +    if ( !mod_ptr && CONFIG_KEXEC_MODULE_PAGES )
>>
>> What if CONFIG_KEXEC_MODULE_PAGES changes between the old and the new 
>> stubdom?
> 
> Right now this wouldn't really matter. The CONFIG value is used
> only for sizing the module if we are not started via kexec().

When I wrote this I was thinking of:
A -- kexec --> B -- kexec --> C

A: CONFIG_KEXEC_MODULE_PAGES=4
B: CONFIG_KEXEC_MODULE_PAGES=6

When B is running, it has the 4 pages from A, but it expects 6 available 
for its use....

>>> diff --git a/include/kexec.h b/include/kexec.h
>>> index b89c3000..0200005f 100644
>>> --- a/include/kexec.h
>>> +++ b/include/kexec.h
>>> @@ -2,6 +2,48 @@
>>>   #define _KEXEC_H
>>>   #include <mini-os/elf.h>
>>> +/*
>>> + * Kexec module used to hand over memory across kexec().
>>> + *
>>> + * This is an ABI which should be modified only in a compatible way.
>>> + * struct kexec_module is located at the start of the last page of 
>>> the module.
>>
>> Why is kexec_module, which seems like a header, placed in the last page?
> 
> In case we ever need to grow the module (e.g. when adding new data
> to it and with that having to handle different CONFIG_KEXEC_MODULE_PAGES
> values between old and new build), it will be easier, as the module will
> normally be located at the end of the usable memory, so we wouldn't have
> to move the struct kexec_module around.

.. and this avoids that issue since the extra pages can be grabbed 
without moving struct kexec_module.

>>
>>> + *
>>> + * The module can contain data/pages of multiple users. Each user 
>>> has an own
>>> + * record which layout is depending on the user. Records are linked 
>>> via a table
>>> + * of record offsets.
>>> + *
>>> + * All admin data (struct kexec_module, record offset table and 
>>> records) must
>>> + * fit into the last page of the module.
>>> + */
>>> +struct kexec_module {
>>> +    uint8_t eye_catcher[8];
>>> +#define KEXECMOD_EYECATCHER "KexecMem"
>>> +    uint16_t n_pages;       /* Number of allocatable pages in the 
>>> module.    */
>>> +    uint16_t n_records;     /* Size of record table (max. 
>>> 255).              */
>>> +#define KEXECMOD_REC_MAX    255
>>> +    uint16_t recs_off;      /* Offset to record table from start of 
>>> page.    */
>>> +                            /* The record table is an array 
>>> of               */
>>> +                            /* struct 
>>> kexec_module_rec.                      */
>>> +    uint8_t pg2rec[];       /* One entry per allocatable module 
>>> page, value  */
>>> +                            /* is record number (starting from 0) 
>>> associated */
>>> +                            /* with it. Free pages have value 
>>> 255.           */
>>
>> This reads like it is 1 page per record...
> 
> No, this means that each used page is associated with a record, but
> there can be [0 ... n_pages] associated with each record.

Maybe:
"Mapping of module pages to associated module record.  Allocated pages 
are indicated by their record number (starting from 0).  Free pages have 
value 255."?

>>
>>> +#define KEXECMOD_PG_FREE    255
>>> +};
>>> +
>>> +struct kexec_module_rec {
>>> +    uint16_t offset;        /* Offset to record from start of 
>>> page.          */
>>
>> ... but then why would you need an offset?  How do you identify which 
>> "page" or do you mean from the start of the module?
> 
> The record itself needs to contain the data for finding the pages
> associated with it. See patch 18 for the details of the 9pfs record
> added there.
> 
> It will use all 17 allocatable pages from the module (1 for the main
> 9pfs shared interface page plus 16 for the shared rings), while the
> record itself will hold the grant reference of the 9pfs interface
> page, which serves as the key for locating the page itself and the
> ring pages.

I was missing the overall view.  I think I have it now from reading 
patch 13.

 From kexec_mod_start, we have:
(CONFIG_KEXEC_MODULE_PAGES - 1) pages (allocated as pages - referenced 
by pg2rec)
struct kexec_module *mod_ptr is the start of the final page.
pg2rec[n_pages]
struct kexec_module_rec mod_recs[n_records]
< extra data for each mod_recs found by .offset and .size >

I didn't realize the mod_recs were separate from their "extra data", and 
extra data took up the end of the.  If that's correct, I think it would 
be helpful to describe the overall layout.

Thanks,
Jason

>>
>>> +    uint8_t type;           /* Type of 
>>> record.                               */
>>> +#define KEXECMOD_REC_NONE   0
>>> +    uint8_t size;           /* Size of 
>>> record.                               */
>>> +};
>>> +
>>> +#ifndef CONFIG_KEXEC_MODULE_PAGES
>>> +#define CONFIG_KEXEC_MODULE_PAGES 0
>>> +#endif
>>> +
>>> +extern unsigned long kexec_mod_start;
>>> +extern struct kexec_module *mod_ptr;
>>> +
>>>   /* One element of kexec actions (last element must have action 
>>> KEXEC_CALL): */
>>>   struct kexec_action {
>>>       enum {
>>


