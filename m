Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E821488C77C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 16:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698128.1089506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp8vO-0001z9-Hs; Tue, 26 Mar 2024 15:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698128.1089506; Tue, 26 Mar 2024 15:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp8vO-0001wO-FB; Tue, 26 Mar 2024 15:41:18 +0000
Received: by outflank-mailman (input) for mailman id 698128;
 Tue, 26 Mar 2024 15:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfY0=LA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rp8vN-0001wI-Q0
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 15:41:17 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4797ff49-eb87-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 16:41:16 +0100 (CET)
Received: from SJ0PR13CA0042.namprd13.prod.outlook.com (2603:10b6:a03:2c2::17)
 by MW6PR12MB8866.namprd12.prod.outlook.com (2603:10b6:303:24c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 15:41:12 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::dd) by SJ0PR13CA0042.outlook.office365.com
 (2603:10b6:a03:2c2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11 via Frontend
 Transport; Tue, 26 Mar 2024 15:41:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 15:41:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 10:41:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 10:41:10 -0500
Received: from [172.17.142.167] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 10:41:10 -0500
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
X-Inumbo-ID: 4797ff49-eb87-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moWLFd+BjmNxHTYpMw0pY/TjDxQ/H4V//nzShskvaD3In9qiFhkkEStq4BvtvMPMhLBxSszo1bPjRl4GSX9xCKpPCqutQPwi4A7DYoY0tp2LgtCsEv6VGRmFXga4x7wpuQdtNjP5/WBBF3UYM/hsagSKG6cpY3DESy0cUHnmQ1xo4pQXJMm1K5Eqp973dva/bCHwf9lP7T2CRIjdpqPv6KfOwnfLoFFPzirt+Y3hoj8t+lLmMqEziQ2DR8uLlBlklPtwTA1nSSVs0f6Fu5eU8/2Mmyf4sYHCWpufG4SoT1yp7k8+EekXW6OTWGDpbGbJ4vVYnK9fj2YSma9cATOH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqz6WtpC2WFvumPUlI5Rith8nY3wEMhcg4UYq9Kao2I=;
 b=dY/d/IlgeucSsiowhn77f2IWaM7P3eG3DeXXED68U6cWz6P+c+Sm2QZHAI2bHbKSC4OsuAAa3wVpwdpY/SiAw82S/4A9W6KTXBJQt2O0P7eu8IIqsrRPePyWe9IVN66XDZadvPCYZhty3PoKcKEIBJ0zzpdxiWd6XVz8Me1TZTBoSV4mSbev+nljqf+98grlfbNsJnvkDergWZWIdzpHF6r+3FClu+g+9GvFbMwws10ER0U4bmlnV+zeJkDpRMpy7VzzZFb8X7BBWdIyZAEiZaAItDFfTk8efU77QFnZ5XC3SMoZeRtjo7ELL6bNZnOAumL45k3OHEtis+bDLxGGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqz6WtpC2WFvumPUlI5Rith8nY3wEMhcg4UYq9Kao2I=;
 b=hka2hU6ER2efxb73gjQd6RHTLlm6m5mPBk8MtP1bJh9T5mE2QS+oe6C3XHnSjbKn3/FPOCWQfaI3QUqCz3gSmKZUMR7+Ff+Gnbx/1W/Ico67CHb3JLdmr7+rqN/qtD/3lOPt3jAvSUB2g0GOyYRsF0PbzUsMocfRpMzCD5MFzTI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c9fb4179-17bb-4918-8826-afa02c2e8cae@amd.com>
Date: Tue, 26 Mar 2024 11:41:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20240325204515.250203-1-jason.andryuk@amd.com>
 <20240325204515.250203-6-jason.andryuk@amd.com>
 <770d3292-34cf-4e21-acb6-bd1f9caf5fef@suse.com>
 <efc5ea8f-d087-4fe0-a5f3-6d1b0a8b48dc@amd.com>
 <b2090ccf-c920-4f71-bbb3-bfca15f76a83@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b2090ccf-c920-4f71-bbb3-bfca15f76a83@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|MW6PR12MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a048ec0-5915-4f13-c57b-08dc4dab2a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hK0uu9+G+T2Xj3qYun1m0kBYspqMjIEAg3eFg1nLDIOaMTznFiShGxzZwGgt7ILD1QOZo5/A2k3dP3wfXhQV3zwf7XfgsSsaQsHsGoz66WJJVVWmFVWC3TJycCIgy4t4ULF6Jnc87rP7MiZO4PBsKk5oiAPCUPfKVQJgo7Mo1D2Qe3w1IMV0afXxO1Ynl9/J6zbPgJTEXClLGkEbUb+2DqXYaQ3nVY0mQlwu666NaHlpVK16KdRxMb7+txin/OlLur1seNr8bbEFfActMD2+se+JwWkoCZ1pa5NJmvlurgCFfW94zFIJxW13NOCj5eb7D63/6RHXqoMjmIohY+BajHImcES0ZkVxJoLUBUPNQz+buv+vArH1oNXz45eefiimXzTJjCV7ZLJbjWVcS/rCZ8KyN3Kv3H6/IDSvBmwWig1bUoPJjdnYOXb5SeXDvaluwf50iKK10+7gaR21WH9ZcGxTl2zWMqjzEhTbT8HpO4MtY3gU/X6yXBOY6cYEqj14YejccG/0p4J1PnoMLsUR1LAqYBTAVOyp2rdHqRvYnjj09376Mj0wFgO5oDKEL/l0vRRCo3XJHXHfs0SeyRJOMNrHyRUejsf3MZwfvC0srMzbC3Uj3c/oEACbu9qcDGe0AnoUvdHhqLbIe1NDpTejEkaT3DHvJCPIWMzKltp2Jsrhijtzs6/n5OjXA5Yk+nxjPOHp6KFJnTdgxnxKZoltnCML9JRN3ergIOeeGno6TisYJzlu2+F8EC2he74LBqJu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 15:41:11.8608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a048ec0-5915-4f13-c57b-08dc4dab2a1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8866

On 2024-03-26 09:40, Jan Beulich wrote:
> On 26.03.2024 14:24, Jason Andryuk wrote:
>> On 2024-03-26 03:50, Jan Beulich wrote:
>>> On 25.03.2024 21:45, Jason Andryuk wrote:
>>>> @@ -227,6 +239,27 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,

>>>> +        }
>>>> +        if ( descsz >= 8 )
>>>> +        {
>>>> +            parms->phys_min = elf_note_numeric_array(elf, note, 4, 1);
>>>> +            elf_msg(elf, " min: %#"PRIx32, parms->phys_min);
>>>> +        }
>>>> +        if ( descsz >= 12 )
>>>> +        {
>>>> +            parms->phys_align = elf_note_numeric_array(elf, note, 4, 2);
>>>> +            elf_msg(elf, " align: %#"PRIx32, parms->phys_align);
>>>> +        }
>>>
>>> I'd like us to reconsider this ordering: I'm inclined to say that MAX isn't
>>> the most likely one a guest may find a need to use. Instead I'd expect both
>>> MIN and ALIGN wanting to be given higher priority; what I'm less certain
>>> about is the ordering between the two. To keep MIN and MAX adjacent, how
>>> about ALIGN, MIN, MAX?
>>
>> ALIGN, MIN, MAX works for me.
>>
>> On the Linux side, I'm expecting them all to be set:
>> ALIGN = CONFIG_PHYSICAL_ALIGN
>> MIN = LOAD_PHYSICAL_ADDR
>> MAX = KERNEL_IMAGE_SIZE
>>
>> You need enough identity page tables to cover up to MAX.
>> LOAD_PHYSICAL_ADDR is used as a minimum, so requesting placement above
>> MIN makes sense to me.
> 
> Hmm, setting MIN like this means moving down is precluded. Why would it
> not be possible to move a kernel to lower than the default of 16M, when
> CONFIG_PHYSICAL_START can be as low as 0? (In fact, I doubt 0 would work
> if chosen, but 2M surely does work, as I build some of my Dom0 kernels
> that way.)

I successfully booted at a lower address when testing, so it's possible. 
  The bzImage early boot code uses LOAD_PHYSICAL_ADDR as a minimum for 
extracting vmlinux, so I matched that.  It's not clear to me exactly why 
that is used, though it avoids using the 16MB ISA DMA region.

Kconfig RELOCATABLE has this:
Note: If CONFIG_RELOCATABLE=y, then the kernel runs from the address
it has been loaded at and the compile time physical address
(CONFIG_PHYSICAL_START) is used as the minimum location.

Which is again why I thought to use it as MIN.

> MAX, otoh, I guess really wants setting as you say, for KERNEL_IMAGE_SIZE
> actually being commented upon as mis-named. Just that it now really wants
> to be KERNEL_IMAGE_SIZE-1.

Yes.

If placement changes to favor higher addresses, then ALIGN, MAX, MIN 
becomes a little more important since that should be consulted first.

Thanks,
Jason

