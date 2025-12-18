Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F9CCD490
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 19:56:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190181.1510788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWJAr-0002Or-O6; Thu, 18 Dec 2025 18:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190181.1510788; Thu, 18 Dec 2025 18:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWJAr-0002MJ-L5; Thu, 18 Dec 2025 18:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1190181;
 Thu, 18 Dec 2025 18:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XN7D=6Y=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vWJAp-0002MD-J2
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 18:56:27 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3fe0f4-dc43-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 19:56:21 +0100 (CET)
Received: from BLAP220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::34)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:56:17 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:32c:cafe::1) by BLAP220CA0029.outlook.office365.com
 (2603:10b6:208:32c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 18:56:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 18:56:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 12:56:16 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 10:56:16 -0800
Received: from [172.29.241.99] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 12:56:15 -0600
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
X-Inumbo-ID: 3e3fe0f4-dc43-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCCszjQ0sEp8iB3Gb9T60APAwOu7KuJxMT/B1OGcz25+eUPCVY6+/KeE1Snbuie9xq+zyKztDCbIz5Mc5AOvpTzirmEybc5xJxKedOl6mcUjD5a21zdgGTuK1g8w3v09YwFEfLP2S4xQdOdu2Uo7dv5gSncoawiegZcpQozQQsfQV04u9+fNyIk6nlwyHm4JKSgTxuEdJ6O3MW9KTVEsAitxYOSsWULFoU8kwg1LRVRLDRkbxrAceBd92Tp/Z1kKI9pjDK5SLJyuotIQYLo9GGA4fzwQpyCvCLaikquADeED8gSZHuWnw7CYITFzEUisQm/C6Sh50YQroj8XXfjEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NES1cW0obEOxFQUmxvTTOUgcIHb7RVhFQcusDAKBGg=;
 b=Q1/HiXODeTs360uy8RfM2iq4g5ftEcpO0kPXOOi8nWUix8tFq3QQMcP6T/yeaIoFyDAaZFdZmfIiZT2Im0eCXnFj3guVad4zmRsZrbmwm58GSjaG0YGYA7OySQPFLDvAJHlcBLlWMpbM1Z0CAj8WL0/8Qr7zK45H7x1UWn7bs5zBmSZIva7GygvHfwxyLKYXpSxlZ1Nce4pF62CoytfWi6O6iGMR4Diq+O+ya5k6mFDsVl7eBCPVrq8osi0TrWs2f9s4VfhIt35l47tpVDcrXo0532OL6yxBlCHdJFNJGhvH3BvTma3bd22hckxegs3XTMSYx/WiQSLtyZy3yH3ESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NES1cW0obEOxFQUmxvTTOUgcIHb7RVhFQcusDAKBGg=;
 b=BZBYV8aMp1v2BSyyfiNHa8YdGhnqyAfUkvGY3W7ucHD7lIiqkOf5vp5daIFM3bP1FVLvPF710NBJn6PIN2md6IxIHOBXpro7i1QIDzIlFxgIo9S9qTp+0224JJjYuS3pcEd0zZvp6ah4mzl7DV1CWjHEinBhax82fEqkR6O822k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b3e23e9d-e18a-4412-88c9-3fc34de4f11b@amd.com>
Date: Thu, 18 Dec 2025 13:56:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: avoid bogus "overlap in extended cap list" warnings
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Chen Jiqian
	<Jiqian.Chen@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
 <e1fe4599-02e2-487d-a2c5-bc912fe8646e@amd.com>
 <c5f210b5-f321-4153-a508-1abf5fc43644@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c5f210b5-f321-4153-a508-1abf5fc43644@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 20564625-ce83-4e4a-a879-08de3e672000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU5jRGc3SFpzR2tNd25wbWczYUJEWmFSVVlpSWg1aSt1SENsTThJaDFlMHR5?=
 =?utf-8?B?M0RBa1hCZXV0L3pWb3F3bGlsbTJuSytKdy9EaG1rVjgxYzYzVGp6TE5hRlh6?=
 =?utf-8?B?Y0FZNTBqUnMvbUdPeXVMdXIzckt1SGlEYWxRdkpyQUp3MCtCeDVCU0ZvbFRX?=
 =?utf-8?B?OWtVYVFrQ2prdWU2TmtCSzVNZ29VdlhRbml1REtnaGxGYXNDQ2RGMWloTzlz?=
 =?utf-8?B?SktQa0xNbGRwNFBGcEdQU1RQTm5WYjVFallnVk51YlZ4MVZYTDRGLzUrOFhU?=
 =?utf-8?B?T3RqWlJFYjh0N0M3M0pGMlJ1V3llWDBzeVVNcXBLdGFSa2NwYlYxWDZvM1pG?=
 =?utf-8?B?ajFLMVNNYlZneXhpZVJkZzBNeXM3Y3YzRHE3U0t6T1BVUlFTS0Y2cmwzcTFn?=
 =?utf-8?B?NzFHamFFeUthT3pjQnBpaCtBOXBzSkFNUW1zb2podlFESmVNbzg5Z1JWRldh?=
 =?utf-8?B?Y2xwejhvVFdwNGFpdHI0U2xkNkEyNEhXKytOazJKaFgvaHlqTmZwcnFEckpz?=
 =?utf-8?B?QVlDNE8yQy9jQjdSeU1RRGZzMXZldXhvQ0lVVWMxUThKZmhKRHRIU3BtdGZu?=
 =?utf-8?B?YVQxV2M2eFZpNjhGaE54d1k5cUp2emxJSzFIbVRaYlB4cGREK1ZBaTFtTWhW?=
 =?utf-8?B?YlJ1ZEFKZ0lLenVsaHkwRlZvVnk2NFM4VkZYWnZsbkhkTkFPTDVoTHdpZlZM?=
 =?utf-8?B?eGgyMnN3YkVzVUJPZmdUQms5NjRZai9MMmZUTXZFRlRjUm5FQkNGbDZ3N3hj?=
 =?utf-8?B?aW4zcFkyd09VNVNYWkV6R0I4NlVBUmdsTld2bDV5dlRyTXVhc24yK2VzS0Fv?=
 =?utf-8?B?Zy9RQzZtQklaZ252MjUyNnRBRVJjSkpjQTZXT28xRDA2YkJkWnA5N2YvR2Fr?=
 =?utf-8?B?S2ljYjJ5bGxIQlNHTzAxbVh4V0dIaWZBZllLU05GSXE2WGJ0MkJmd1dCVDVD?=
 =?utf-8?B?M21nQVdvVWlVU3M3VW83b2tMSmhmTkRxTzZvdGt4MGkyV1laRWVJSjZCV3VB?=
 =?utf-8?B?RTNFUEM2TUdTRnlLM2tKL3pUdUR1dVJKSmRZbk1NV3doNmMySHJ0NEk4REFO?=
 =?utf-8?B?eGQydU5rT29DTm9FOEMzeDFUcTJUUzVqVGc0VFBVVm1mYnNPZ3RTc1FyTENF?=
 =?utf-8?B?bmZOQWw5TUZFRkQ3TG1zc2JpVEtxQTlIWXBhTk9vbDEwb21kT1VCOFFJc0Zk?=
 =?utf-8?B?b0RMVUxTOGpqaE14cTNxYWdSTW40RXV5RDVqRXhFbVFtWUlQeFBjb1ovdHpz?=
 =?utf-8?B?eCtuZWxYeENTY0ZIbW1hYjVDcFlDS0QwZHJXb3VZQ1JhUFRvWkdVR0NQK0pK?=
 =?utf-8?B?MjBzWGQ0bTVoaThUTjR3NXQxcjg5d0pDbXNlVVM2U3ZxZGNMOWl3am9HMmxQ?=
 =?utf-8?B?R3FJdWxUbjBjU0xSZ0crUlIza2tWNTRDQUUvUEFudXZ5UTFZZFJMOHpHM0RM?=
 =?utf-8?B?VGNwd2psM3RwWWNwYUl1RXdnNDJYL3VzdzZjOFlyK0FvYkdEMDZNMWpmTDAz?=
 =?utf-8?B?Wm5NaXd4bG5kWTRkVjB0NitueXpkTmg4WE5TL0tXMG54WXhwMldJOUlaNjd2?=
 =?utf-8?B?OVR0ZVpqalhuNGROSGxaVEE4bnhxY1NEMEY3VUppUysvTFRpTmZNa2Z3K3Ni?=
 =?utf-8?B?ZktCZ24vb1NQUllOS3l1TFBXQ0xldjRDT2I4bmhjSTQ1U3dXNjJYeEVNaFVX?=
 =?utf-8?B?a0hMbnVLS0RNUHlubDd5ME5MNHcxZ0tJYXZsQm9jU1R3aTA0dk8wQml2WUpZ?=
 =?utf-8?B?d1lma2p1bjNIR0t1aE9LS2twSElDQ3I5TmVJenA0bFJXVTNVaFgzNGlPQldZ?=
 =?utf-8?B?WDNTR3NtU2RjUCtxeUJqdkx5R0tZSnRsY2ZEWnd3bGs4OVdZSjN6Qlc4bGsx?=
 =?utf-8?B?dU53UHhCcHpCQVBoUzZXbGhYTE0vbGZML0ZqbnV3YzhqbTZZN3F1RDV2ZG1L?=
 =?utf-8?B?SEVwSVo4bVl1VVVROWIvZTdWSFdubzhzV0k4c0RaalcxVjB4RHdaQllEZG9P?=
 =?utf-8?B?VlBXeHZ6b0hHMXV0UWlVb2grTE5rcmMxN1VFWEVuV2RVeHgzaGUrTUs2RGhQ?=
 =?utf-8?B?b2R2eE5lZVVPZjVDbDRVV1B5N1RGSjY3K2RxN0Q2RVNGT0psZE5rbXo5Y0J6?=
 =?utf-8?Q?K5bY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:56:17.2232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20564625-ce83-4e4a-a879-08de3e672000
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087

On 12/18/25 11:14, Jan Beulich wrote:
> On 18.12.2025 16:37, Stewart Hildebrand wrote:
>> On 12/18/25 02:56, Jan Beulich wrote:
>>> Legacy PCI devices don't have any extended config space. Reading any part
>>> thereof may very well return all ones. That then necessarily means we
>>> would think we found a "loop", when there simply is nothing.
>>>
>>> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> This is the minimalistic change to get rid of "overlap in extended cap
>>> list" warnings I'm observing. We may want to avoid any attempt to access
>>> extended config space when there is none
>>
>> Agreed.
> 
> First - I realize only now that I should have Cc-ed you on both vPCI patches;
> sorry.
> 
>>> - see Linux'es
>>> pci_cfg_space_size() and it helper pci_cfg_space_size_ext(). This would
>>> then also avoid us interpreting as an extended cap list what isn't one at
>>> all (some legacy PCI devices don't decode register address bits 9-11, some
>>> return other non-0, non-all-ones data). Including the risk of reading a
>>> register with read side effects. Thoughts?
>>
>> I couldn't find any mention in the PCIe spec how reads of extended config space
>> should behave for legacy PCI devices. So, you're right, reading all 1s may not
>> be a guarantee. The PCIe spec seems to imply that a PCI Express Capability is
>> required for devices that have extended config space. How about adding something
>> like this at the top of vpci_init_ext_capability_list() (untested)?
>>
>> if ( !pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP) )
>>     return 0;
>>
>> This would seem to me like a reasonable effort to handle the situation
>> (according to spec), without the complexities/quirks/cruft that Linux has.
> 
> But it wouldn't be sufficient. Host bridges are special, and PCI-X also
> needs handling.

I see. Perhaps we ought to introduce some form of a pci_cfg_space_size()
function in Xen. pci_find_next_ext_capability() likely could benefit from such a
check, too.

>>> The DomU part of the function worries me as well. Rather than making it
>>> "read 0, write ignore" for just the first 32 bits, shouldn't we make it so
>>> for the entire extended config space, and shouldn't we also make it "read
>>> all ones, write ignore" when there is no extended config space in the
>>> first place (then in particular also for the first 32 bits)?
>>
>> Hm, yes, perhaps. If we simply omit the call to vpci_add_register(), it should
>> default to the "read all ones, write ignore" behavior.
> 
> But it doesn't right now, unless I'm mistaken?

For !is_hardware_domain(d), any access that isn't explicitly handled with
vpci_add_register{,*}() will default to "read all 1s, write ignore". See
vpci_{read,write}_hw().

>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -839,6 +839,15 @@ static int vpci_init_ext_capability_list
>>>          uint32_t header = pci_conf_read32(pdev->sbdf, pos);
>>>          int rc;
>>>  
>>> +        if ( header == 0xffffffff )
>>
>> This constant should have a U suffix.
> 
> Oh, of course - thanks for spotting. If we go the more sophisticated route,
> this would disappear again anyway, though.
> 
> Jan


