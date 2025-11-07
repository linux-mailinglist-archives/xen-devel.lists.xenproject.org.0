Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBAC3E21B
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 02:30:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157310.1486131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHBIb-0004Cm-HT; Fri, 07 Nov 2025 01:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157310.1486131; Fri, 07 Nov 2025 01:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHBIb-0004AZ-EZ; Fri, 07 Nov 2025 01:29:57 +0000
Received: by outflank-mailman (input) for mailman id 1157310;
 Fri, 07 Nov 2025 01:29:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkPj=5P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vHBIa-0004AT-6i
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 01:29:56 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42436c8a-bb79-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 02:29:53 +0100 (CET)
Received: from BY3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:254::21)
 by DM4PR12MB7574.namprd12.prod.outlook.com (2603:10b6:8:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 01:29:45 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::5c) by BY3PR05CA0016.outlook.office365.com
 (2603:10b6:a03:254::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.5 via Frontend Transport; Fri, 7
 Nov 2025 01:29:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 01:29:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 6 Nov
 2025 17:29:44 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 6 Nov
 2025 17:29:44 -0800
Received: from [172.27.250.45] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 6 Nov 2025 17:29:42 -0800
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
X-Inumbo-ID: 42436c8a-bb79-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMSCHVrtgSe3p1L9U7zFHyvZnz2PJw4biQqAEv9360Cju+85/PZuNcoh594pqWh5MqW3OIIXl2IGP64obP3OCBp/mMoF5IxFR0b2I+XzrCNsUsCDJVW7yKk1TxXL9AgvcEckV1gxK09+dLEM+Y3gbWJWKhrcW4y4rLjnA8/DDLL7q26kwCsDLQ/sB25vuuDn2VXxhidJf5AmYndDG3KDcsXOWVHaZkJ9boZkq0yFqWoVXbwcDYovHj+3kxzX6sIU9fraSMVS4Bfw5vSQNWrAleDPWufip++x1Ty0FVWgurvMRyEiilBBkLrzcJ19XFw6QLCRf6mA5bRQFelh/cghBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuh4sxKWQFDiWFxX46tfLP+2lLhw/p3lnd+brqJN5H8=;
 b=H7irp7HR45QXazSQ8BBRExVBwRqPv/vsSjrC8qauccup7PTb5S7QTlefNUPlyF4zIGj9qS2Q7RKvDl8zYMeVbBMSD22p9RwPCrZB3AcdPRbu+EBKPGLJ4NFZuMb4Fd98crdjcvqNnW8HIm9TKO85QEG0F60dT8fPmsFAJg9iCX7C+QYOwdN3hBYdTqq4cZyGaANrq/GcEMGYED7631TNyZm+0t3NSMEeD249jykYq9Z2xw9c3J5EPm6BPH+lbgcTNbNZgMw5xaC1CpfCwXRhPTpLEKffdmXDr5DWSXO3rR4p6gNDHFziy3Ozx5LF3CzkRowNXazx469wuH6H3cqxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuh4sxKWQFDiWFxX46tfLP+2lLhw/p3lnd+brqJN5H8=;
 b=IktsufFTfK9p4u1akL0xrlNiUwznfkd62yfdYwfsN1Ct3m1zfU9uWhv7K2sDRFVhQGvr0pQKQLqs616TpgrAhTfXLxUcJjL4QRDebKIySWyMnOP+S92G4pTljtGvEokY9pdIg8uH5f+G9H9REnyquS531dzSHgkaY7xwstoY6co=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2e298f37-78b2-4870-89a0-07dc4501372c@amd.com>
Date: Thu, 6 Nov 2025 20:29:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20251031212058.1338332-1-grygorii_strashko@epam.com>
 <434d9ce4-e5e1-453d-84b7-e21e66d0c5a3@vates.tech>
 <b012c6c3-fb8d-4336-922f-f40bc43eb2b5@epam.com>
 <0217b1ff-2c33-43ae-adbc-d665c881473d@amd.com>
 <ffb2ad53-c150-44e3-a0b8-7ed3473886f6@vates.tech>
 <01ad9a85-ff61-445c-97d4-076f9a81b649@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <01ad9a85-ff61-445c-97d4-076f9a81b649@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: ea17690a-751f-47e6-0cee-08de1d9d2213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEpYUkZMYVkyTTBlNG5jeCtiNkR6YjlhK1F0TmRlOU1TWjhJVTBNcjY5R25o?=
 =?utf-8?B?cjVMVTRYeG9MU1I3Mm04dU5RUXpQYzRlUi81RFE3a0xXSXZtZERqcTkwQmN4?=
 =?utf-8?B?Zml2RDhqNEZnWXMwam1KQWlnajU4K0FhMC93c0FGU0RFdEt0UnNsYUd5NDBv?=
 =?utf-8?B?V2dUaXJuRzFxYXNnaWNnYldlaDBvMnM1SEtnWFAwUmEwemFpMnpKbkdUQW1F?=
 =?utf-8?B?MFg4dVNSV3FXYWZYUWFuQkwrYnkxMHlXWnhKZWQ2bnE4aExGM050TG5ZYlhN?=
 =?utf-8?B?QmZWUDMzYXlpLzAxeUdockNzcy8rSFAxSWcxSTFkWWNNMElLM1dDRlUzbyt6?=
 =?utf-8?B?TUFaVWhJMEVCcUNnUXYwZ0ZESnZaM0t6ajcyRWFrekUzcE84aFRIMWZacTE3?=
 =?utf-8?B?bWpaRURuVlo0c1NBc1NTWEdoK3NXU2hOZ0w1SzhqVnhxak9PRGxtMGpyZk85?=
 =?utf-8?B?UjBlaUN5WFMwY2x5YmgwR0doVmVzVndDVjJoSDY3WkZOKzh0Z0NvVHZ6VVZv?=
 =?utf-8?B?R2FVSnVCVFdpZVdMVmUvcWp5N3ZBQm05MllmYzJWMldMaGtNSzNvSXhmTTlS?=
 =?utf-8?B?MGhldmd3UGVZUERJMStSK1lzRE0vWm4xbVBlc09TdkpYU3M4WTdrWWdHUEI5?=
 =?utf-8?B?R1BjUHpydkUrallXZjdyNnkvVXM1TUdNUU5FTVFnYWhFOWpKeVFkVEZCN3Ju?=
 =?utf-8?B?c2wza3dld0hYNlV6MjVKVi9Sdk9SVWk5K1U1VzRxZ1lpWUZZeERGQWprSTZC?=
 =?utf-8?B?VUtSd3dLclBBckI4VDRDYkRqN1JkSi9WcFhmSFZZNjFKeVVBbFRVTDVHTi81?=
 =?utf-8?B?d0VvQk9qTEFRdVdrVmNKL29VU0NDY0dzeEg0OXdMNm9FNzFYNzM1bkFvczI1?=
 =?utf-8?B?ellzaXovUDFVYllHRGdrU2NmT0hQSXNNelpMMWZpQjEzc2oxVWxlbDJnK1hM?=
 =?utf-8?B?d2xQVUVybW5GaVBMSUV2VzRCZ0VCR1M0UXhZNkxVbloySHFLL1dSSnNCb2hj?=
 =?utf-8?B?ejRGa3FJWFBYajNWL2dMMjFpc3ErUy9YQnI2czFoWHhtMi80RU5OWDVoWTVF?=
 =?utf-8?B?UFY0Rm94aHNiU1BBZnFyUUR1b2NNUHdURVdPMXp0VlRrcGh5ZGFacEdFQ0FD?=
 =?utf-8?B?dmdYbkYzaUtpRXV1am5pbmZCaDg0NFNjcUx1SjY4RGNpYzhET3YvbXp1YU1F?=
 =?utf-8?B?d2Y5Q2VtZmRINmw2UzFXdFdnSXE0RlpKei9KZ1RWMi95dzN0VFBERWRNOWY2?=
 =?utf-8?B?amNLeDcrT3l2b0xBbDI3S0tjcG9FdVVIYWdwWmMyaExydktMaHh6a1dYMXFa?=
 =?utf-8?B?Mkx6ZWw0TWtMSVhVallaTzVVNEVEeVJ3K3BWa292eGc2ajJJWlVHZWdtb1Z6?=
 =?utf-8?B?eGY2b1FKVHlwZk1DL2N6QnlFNTlGWUlDc2p6QWVvbXArYmFCdENFYlVodFpS?=
 =?utf-8?B?UmdkV2cwaG1rL2xJRllKM0ROK1ZnekxsVWpqOS9Nc3p4MHdUK2xzUzRnaFdw?=
 =?utf-8?B?M3N5dHVZS3V1TS9DaGlkcmhzUEJXbWk3ditsN2xUenV2U1FXLzU4UXhIbG14?=
 =?utf-8?B?eG9EdExXQ2RLYXgzWE5rZHkyclhTM2hqblFPZXNjNmlpMzFpdE16aDJIV2VH?=
 =?utf-8?B?dGdYbFB4Q3NMUkE3d2NRVXJqSjVGTU5NdW5XSVZmd01GM2NRWTZld2ZTeTZD?=
 =?utf-8?B?SWl6OHFxZGE1UWd2cTdFYitxc0NGSGVkVVhsU0MwR0V6SFNPS0hiL01SQVc1?=
 =?utf-8?B?N2QwbTdVSmhkcS8rc1h4alE2Vm1WbUUzdUloRU1GMVdCUUVoMUJmOWFaRnNO?=
 =?utf-8?B?cWhrVEJRUm05c1ZUZ1dkbjZibVNEdUZDdWJtamc1N3lhcENrU1BXOGsvWjZ2?=
 =?utf-8?B?OWNkSkpzb2cvWStSNWFuMXNTWjRjQ29FVlduQTNuYnowQjI3SE8xQmF6T3o4?=
 =?utf-8?B?c3VYd0ROQ0VhZ2VGSWhuZE5tMGNVa3FYSEk0SnNtS21EajJaVEhrbU1vMnR6?=
 =?utf-8?B?cDZDUnFobnZNcks5Z2NXMkwyVTgzekNEbTdQamRSUWhJUFM4d0VTbTJDRk5w?=
 =?utf-8?B?eGdBM29VenVkd2M4MDYyR1MrOHU0L3MzNVpPR3dNM1E3ajRvRUIrZktXWG5S?=
 =?utf-8?Q?o0U4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 01:29:45.0596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea17690a-751f-47e6-0cee-08de1d9d2213
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574

On 2025-11-06 12:40, Grygorii Strashko wrote:
> 
> 
> On 06.11.25 19:27, Teddy Astie wrote:
>> Le 06/11/2025 à 18:00, Jason Andryuk a écrit :
>>> On 2025-11-06 11:33, Grygorii Strashko wrote:
>>>> Hi Teddy, Jan,
>>>>
>>>> On 06.11.25 17:57, Teddy Astie wrote:
>>>>> Le 31/10/2025 à 22:25, Grygorii Strashko a écrit :
>>>> Can try.
>>>
>>> Yes, I was thinking something like Teddy suggested:
>>>
>>> #define raw_copy_to_guest(dst, src, len)        \
>>>           (is_hvm_vcpu(current) ? copy_to_user_hvm(dst, src, len) :
>>>            is_pv_vcpu(current) ? copy_to_guest_pv(dst, src, len) :
>>>            fail_copy(dst, src, len))
>>>
>>> But that made the think the is_{hvm,pv}_{vcpu,domain}() could be
>>> optimized for when only 1 of HVM or PV is enabled.
>>>
>>> Regards,
>>> Jason
>>>
>>> xen: Optimize is_hvm/pv_domain() for single domain type
>>>
>>> is_hvm_domain() and is_pv_domain() hardcode the false conditions for
>>> HVM=n and PV=n, but they still leave the XEN_DOMCTL_CDF_hvm flag
>>> checking.  When only one of PV or HVM is set, the result can be hard
>>> coded since the other is impossible.  Notably, this removes the
>>> evaluate_nospec() lfences.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> Untested.
>>>
>>> HVM=y PV=n bloat-o-meter:
>>>
>>> add/remove: 3/6 grow/shrink: 19/212 up/down: 3060/-60349 (-57289)
>>>
>>> Full bloat-o-meter below.
>>> ---
>>>    xen/include/xen/sched.h | 18 ++++++++++++++----
>>>    1 file changed, 14 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>> index f680fb4fa1..12f10d9cc8 100644
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -1176,8 +1176,13 @@ static always_inline bool
>>> is_hypercall_target(const struct domain *d)
>>>
>>>    static always_inline bool is_pv_domain(const struct domain *d)
>>>    {
>>> -    return IS_ENABLED(CONFIG_PV) &&
>>> -        evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>>> +    if ( !IS_ENABLED(CONFIG_PV) )
>>> +        return false;
>>> +
>>> +    if ( IS_ENABLED(CONFIG_HVM) )
>>> +        return evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>>> +
>>> +    return true;
>>>    }
>>>
>>>    static always_inline bool is_pv_vcpu(const struct vcpu *v)
>>> @@ -1218,8 +1223,13 @@ static always_inline bool is_pv_64bit_vcpu(const
>>> struct vcpu *v)
>>>
>>>    static always_inline bool is_hvm_domain(const struct domain *d)
>>>    {
>>> -    return IS_ENABLED(CONFIG_HVM) &&
>>> -        evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
>>> +    if ( !IS_ENABLED(CONFIG_HVM) )
>>> +        return false;
>>> +
>>> +    if ( IS_ENABLED(CONFIG_PV) )
>>> +        return evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
>>> +
>>> +    return true;
>>>    }
>>>
>>>    static always_inline bool is_hvm_vcpu(const struct vcpu *v)
>>
>> While I like the idea, it may slightly impact some logic as special
>> domains (dom_xen and dom_io) are now considered HVM domains (when !PV &&
>> HVM) instead of "neither PV nor HVM".
>> We want at least to make sure we're not silently breaking something
>> elsewhere.
> 
> first of all idle domain - I've tried to constify is_hvm_domain() and 
> even made it work,
> but diff is very fragile.

Interesting.  Yeah, I did not consider system domains.  It seems fragile 
today if sometimes !is_hvm_domain implies idle_domain.  :/

> Diff below - just FYI.
> 
> -- 
> Best regards,
> -grygorii
> 
> Author: Grygorii Strashko <grygorii_strashko@epam.com>
> Date:   Fri Oct 17 17:21:29 2025 +0300
> 
>      HACK: hvm only
>      Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index d65c2bd3661f..2ea3d81670de 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -567,17 +567,17 @@ int arch_vcpu_create(struct vcpu *v)
> 
>       spin_lock_init(&v->arch.vpmu.vpmu_lock);
> 
> -    if ( is_hvm_domain(d) )
> -        rc = hvm_vcpu_initialise(v);
> -    else if ( !is_idle_domain(d) )
> -        rc = pv_vcpu_initialise(v);
> -    else
> +    if ( is_idle_domain(d) )
>       {
>           /* Idle domain */
>           v->arch.cr3 = __pa(idle_pg_table);
>           rc = 0;
>           v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
>       }
> +    else if ( is_hvm_domain(d) )
> +        rc = hvm_vcpu_initialise(v);
> +    else
> +        rc = pv_vcpu_initialise(v);

This looks like an improvement as it makes the idle domain case explicit.

> 
>       if ( rc )
>           goto fail;
> @@ -2123,7 +2123,7 @@ void context_switch(struct vcpu *prev, struct vcpu 
> *next)
>       vpmu_switch_from(prev);
>       np2m_schedule(NP2M_SCHEDLE_OUT);
> 
> -    if ( is_hvm_domain(prevd) && !list_empty(&prev->arch.hvm.tm_list) )
> +    if ( !is_idle_domain(prevd) && is_hvm_domain(prevd) && ! 
> list_empty(&prev->arch.hvm.tm_list) )

The idle domain's tm_list could be initialized.  It should remain empty 
and be equivalent without modifying this line.  Though maybe your way is 
better.

>           pt_save_timer(prev);
> 
>       local_irq_disable();


> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index 839d3ff91b5a..e3c9b4ffba52 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -236,7 +236,7 @@ static void cf_check vmcb_dump(unsigned char ch)
> 
>       for_each_domain ( d )
>       {
> -        if ( !is_hvm_domain(d) )
> +        if ( is_idle_domain(d) || !is_hvm_domain(d) )

I don't think this should be needed as idle domain, and system domains 
in general, are not added to domlist.  So for_each_domain() will only 
iterate over user domains.

domain_create() has an early exit for system domains:
....
     /* DOMID_{XEN,IO,IDLE,etc} are sufficiently constructed. */
     if ( is_system_domain(d) )
         return d;

     arch_domain_create()
         paging_domain_init()
             p2m_init()

     domlist_insert()

>               continue;
>           printk("\n>>> Domain %d <<<\n", d->domain_id);
>           for_each_vcpu ( d, v )
> diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
> index e126fda26760..c53269b3c06d 100644
> --- a/xen/arch/x86/mm/p2m-basic.c
> +++ b/xen/arch/x86/mm/p2m-basic.c
> @@ -34,7 +34,7 @@ static int p2m_initialise(struct domain *d, struct 
> p2m_domain *p2m)
>       p2m->default_access = p2m_access_rwx;
>       p2m->p2m_class = p2m_host;
> 
> -    if ( !is_hvm_domain(d) )
> +    if ( is_idle_domain(d) || !is_hvm_domain(d) )
>           return 0;
> 
>       p2m_pod_init(p2m);
> @@ -113,7 +113,7 @@ int p2m_init(struct domain *d)
>       int rc;
> 
>       rc = p2m_init_hostp2m(d);
> -    if ( rc || !is_hvm_domain(d) )
> +    if ( rc || is_idle_domain(d) || !is_hvm_domain(d) )

Given the snippet above, I think p2m functions can't be reached for 
system domains.

>           return rc;
> 
>       /*
> diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
> index 05633fe2ac88..4e62d98861fe 100644
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1425,7 +1425,7 @@ bool p2m_pod_active(const struct domain *d)
>       struct p2m_domain *p2m;
>       bool res;
> 
> -    if ( !is_hvm_domain(d) )
> +    if ( is_idle_domain(d) || !is_hvm_domain(d) )

accessed via:
     do_domctl()
	vm_event_domctl()
             p2m_pod_active()

The passed in d needs to be from domlist, so again a system domain 
cannot reach here.

>           return false;
> 
>       p2m = p2m_get_hostp2m(d);
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index ccf8563e5a64..e1862c5085f5 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2158,7 +2158,7 @@ static int __hwdom_init cf_check io_bitmap_cb(
> 
>   void __hwdom_init setup_io_bitmap(struct domain *d)
>   {
> -    if ( !is_hvm_domain(d) )
> +    if ( is_idle_domain(d) || !is_hvm_domain(d) )

This looks like it is called for dom0 or late_hwdom, so only real domains.
Regards,
Jason

