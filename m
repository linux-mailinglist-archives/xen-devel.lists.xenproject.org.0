Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN0AGTfG3GmcWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 12:32:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A23EAB12
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 12:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281039.1564103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCEaU-0007iG-4d; Mon, 13 Apr 2026 10:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281039.1564103; Mon, 13 Apr 2026 10:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCEaU-0007fC-1d; Mon, 13 Apr 2026 10:32:14 +0000
Received: by outflank-mailman (input) for mailman id 1281039;
 Mon, 13 Apr 2026 10:32:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCEaT-0007f6-1L
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 10:32:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCEaS-001spm-DN
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 12:32:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69dcc628-bab6-0a2a0a5309dd-0a2a450cc1e8-14
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 12:32:11 +0200
Received: from [52.101.43.22]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69dcc538-f40c-0a2a450c0019-34652b165d4c-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 12:28:09 +0200
Received: from BN9PR03CA0877.namprd03.prod.outlook.com (2603:10b6:408:13c::12)
 by LV3PR12MB9187.namprd12.prod.outlook.com (2603:10b6:408:194::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 10:28:04 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::cc) by BN9PR03CA0877.outlook.office365.com
 (2603:10b6:408:13c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 10:28:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 10:28:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 13 Apr
 2026 05:28:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Apr
 2026 05:28:03 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 13 Apr 2026 05:28:01 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcIjd+Y1DP7bIOiUtF06Rg39zvHdl0Vyxzz5yXyOoWh/t+7S/fF7BT+1W3QUOkPJ1MifZ6IrY1eqsDiq+qe1elrr8Tlj5GwKg9+dQ8T2iLEBnpa5Na+8xX4je25InlQh/oXkAJE9M0xqyfvx3KI02lkUaKXoIb6kOLjNKN0d9hlJ6sGfdSJCtJIU2STkj3T9TAdXZf/hzxHRg5Vd36LXrxDRuQ42FFx0O6rc1v5KnyhjxNHgezct7jfJgt50ciXckrBOaqDLafDeSyQZqK17H5zoIe9nsS8qbip6qwo2HrpKc9u1lXdS5SeuX9MVqOCV1Bax/gG6wn/FeC6z0PFRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/z2OmdoXPcAEd3PIyGujSBvqgVOqgg6qrZm7JIsj0E=;
 b=AhbPHkeKzF8nnnJbx3BJK8pa9GlAgs5gUUdN0zPH106E4uHTAXkvK7x4MTslbRrL3z7PPumqHUddA0wlUoAdrtaFApi8HJBgWiUe5I96Z+kKzJzDA4z/5s8/jy9FutXqj5jUMfo0KqdHPR40CXVZyEfF1RmmIeVEhxJe0UUwubB8h4fkzv8nDYWNQdp2GL0s/d5QN5BxUSG+8TMZwH3W4lygODRjZh05LE4Vx5ZZy1YnsQEk1I55CAvSTHgmmBW0b8H/dngg4Mi8Y/MeXC+X1uxkB/Vadw41a+hzocU6TGuUs/M/btwxKH6Gkd7ioCSWbaOTPUYAvux2Fw2JlYldOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/z2OmdoXPcAEd3PIyGujSBvqgVOqgg6qrZm7JIsj0E=;
 b=tSNc/xigEVDuyZnk9qAh2BpmHAApfHRbPGXz38A8wCkY97VbFdHM8WT7XYNOr/1dnR9kO3MJUoYKH1GlJmi/H8IL3uNGTSEK/AqozoUz2N74G3WOdrmwXcEz0mU7LVU1GjegOHHM6fQvwQdFxNL0GomCAeFRvBryrX5bhjFwnLk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <81b7e58f-f004-4632-bc07-00f136d15029@amd.com>
Date: Mon, 13 Apr 2026 12:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm/mpu: implement setup_virt_paging for MPU
 system
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Penny
 Zheng" <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>,
	Hari Limaye <Hari.Limaye@arm.com>, Harry Ramsey <Harry.Ramsey@arm.com>
References: <20260408135531.1744388-1-luca.fancellu@arm.com>
 <20260408135531.1744388-2-luca.fancellu@arm.com>
 <43fd7fd7-43dc-4c17-8ff6-b58800fd5f46@amd.com>
 <92DD0227-9023-4824-BB39-56E7F20F2F27@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <92DD0227-9023-4824-BB39-56E7F20F2F27@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|LV3PR12MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 726a2388-7237-4b91-0290-08de99475890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	042sKaGb1PS3wKgqNMPOiHMfmfKZEVXDLFL9jgqLU/C5gfEACxL0r8SF6lJZV6NGh1ETB15dHafSQmrsNakUAo0qmcZQ2cQacmBKtQZlRr2w3fAvFFB3R24zpvMN5Hr8VcCNtchXWu+w61BXTx0+zcYiBvEvjFOXW+GKvzhzkrsLsdM8alJkngQCKgqvIfgW6c4hsqfi4onSzHhU7s2GJebFdB7VM215ldhBPZFxeNIPHEFvtbzOI2nlaT6Nd7CfxRBQ+QUCyrJAUBS/i0U967zqHjmHDpwKgvwP1qssSTzbMFvmfrdwT81I5iR9TZ7hZZP8gbKNFxycUrU3eCzk/8hl8/RgEfJ6NU9OV6n7Z33Rw3dkryS+fF/JdneHNiogTPitB+uHVnhtnAXXFLNdLemy9OyKUCoay0RX94HW/Yfu5t5dTqwqUTKJLlxKW5p8Rhr929VYHdU7VkfWFCR5it2FW70axJHSrvVAAOY61YgwjfwfwlipfW+M4ogLcC1Gx5D3hDPp5BGdV8nGyWURwC+nyXIkeYmbieFbZNZ1lRDF6DWzt+E59ftAq6scd9WAaLquMCeovTlgA1X6Edxh/+rSa/VkPxa79DvZwrURFPwNHn/m1753dM+dsX6Hz58Lz2amEXOJ6y36j5OtIYm2nGYqScDyzVmN8CkReRudb5CwspRcn7PnBLJzwQKugzmVWCiw8NZKYHfRxcLVed+VeFbQtsZyDJcxJ91CoCO00s4loG5ITwkclXTfWiylO04Qj5diZNkNazlaZodx47vfTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+c2ksASmmxpBU2Q7eO2SfqKyCEor9Z6MEr7AYWe4ILw1pRXeZxJhUQujf7Ud5TKpydmnCEI6usZfI0g+VAD7TodrPLHzkS5Vcp5hTsGdx2JmL6/UrpnYReOwv2L+X/9ZlSFsGx2Ktm7n7cmyXuHHrJuqJWlyzAvUp2Vu2etrq8mVdF0pYiLDh9v12yNZ3oGxWPdQrhR5pMIufYTWAI9VGwVFS+tQCvtqTXp9CF78UVROGeq/m//wDqAMe66KndMGmwxp3loX2s7HGC3pFk+JerrBtw4PO4xaN91iRKw65ybVVR8uFbtdS/FQcl40IB55/ghv/5D1pEziQkGroUSClAwTXLkznJYcZxPkTHwOrTQWBAHBsAujT8+5R1tuG6ZUMZnrbLqZr6G714tsa9QLFBk/aMsbdKV0OI99ZfEB3pWkByiuj64oZnF/QLd8kBi7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 10:28:04.0353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 726a2388-7237-4b91-0290-08de99475890
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187
X-purgate-ID: tlsNG-d25034/1776076091-80B5CA3D-3503C446/0/0
X-purgate-type: clean
X-purgate-size: 3682
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Wei.Chen@arm.com,m:Hari.Limaye@arm.com,m:Harry.Ramsey@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: C79A23EAB12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 13/04/2026 11:54, Luca Fancellu wrote:
> Hi Michal,
> 
>>>
>>> void __init setup_virt_paging(void)
>>> {
>>> -    BUG_ON("unimplemented");
>>> +    register_t vtcr_el2 = READ_SYSREG(VTCR_EL2);
>>> +    register_t vstcr_el2 = READ_SYSREG(VSTCR_EL2);
>>> +
>>> +    /* PA size */
>>> +    const unsigned int pa_range_info[] = {32, 36, 40, 42, 44, 48, 52, 0,
>>> +                                          /* Invalid */};
>>> +
>>> +    /*
>>> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
>>> +     * with IPA bits == PA bits, compare against "pabits".
>>> +     */
>>> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
>>> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
>>> +
>>> +    /*
>>> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
>>> +     * memory system configurations supported. In Armv8-R AArch64, the
>>> +     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
>>> +     */
>>> +    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
>>> +        goto fault;
>>> +
>>> +    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
>>> +    if ( (system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_PMSA_SUPPORT) &&
>>> +         (system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT) )
>>> +        goto fault;
>>> +
>>> +    /* Stage 1 EL1&0 translation regime uses PMSAv8 by default */
>>> +    vtcr_el2 &= ~VTCR_MSA;
>>> +
>>> +    /*
>>> +     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
>>> +     * address space to access the Secure PA space as Armv8r only implements
>>> +     * secure state.
>>> +     */
>>> +    vtcr_el2 &= ~VTCR_NSA;
>>> +
>>> +    /*
>>> +     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
>>> +     * are supporting it.
>>> +     *
>>> +     * Set the VS bit only if 16 bit VIMD is supported.
>>> +     */
>>> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>>> +    {
>>> +        vtcr_el2 |= VTCR_VS;
>>> +        max_vmid = MAX_VMID_16_BIT;
>>> +    }
>>> +    else
>>> +        vtcr_el2 &= ~VTCR_VS;
>> This is the last change to vtcr_el2. Why do you put p2m_vmid_allocator_init()
>> in-between this and write to vtcr_el2 register? It looks odd.
> 
> ok I can have the write to the register before calling p2m_vmid_allocator_init, in the
> end what matters is only to call p2m_vmid_allocator_init() after setting max_vmid.
> 
>>
>>> +
>>> +    p2m_vmid_allocator_init();
>>> +
>>> +    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
>>> +
>>> +    /*
>>> +     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
>>> +     * To make sure that all stage 2 translations for the Secure PA space access
>>> +     * the Secure PA space, we keep SA bit as 0.
>>> +     *
>>> +     * VSTCR_EL2.SC is NS check enable bit. To make sure that Stage 2 NS
>>> +     * configuration is checked against stage 1 NS configuration in EL1&0
>>> +     * translation regime for the given address, and generates a fault if they
>>> +     * are different, we set SC bit 1.
>>> +     */
>>> +    vstcr_el2 &= ~VSTCR_EL2_SA;
>>> +    vstcr_el2 |= VSTCR_EL2_SC;
>>> +    WRITE_SYSREG(vstcr_el2, VSTCR_EL2);
>>> +
>>> +    printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n",
>> All these are unsigned, so %u.
> 
> Oops, blindly copying from MMU code, I realise we have the issue also there
There are many other places in Xen using incorrect printk identifiers but for
the new code we should use the correct ones.

~Michal


