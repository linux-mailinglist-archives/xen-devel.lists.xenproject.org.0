Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6EAD7907
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 19:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013354.1391839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPllq-00081v-DT; Thu, 12 Jun 2025 17:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013354.1391839; Thu, 12 Jun 2025 17:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPllq-0007zb-AY; Thu, 12 Jun 2025 17:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1013354;
 Thu, 12 Jun 2025 17:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQ89=Y3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPllo-0007zV-JC
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 17:31:20 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2413::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ba1d15f-47b3-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 19:31:18 +0200 (CEST)
Received: from CH0PR07CA0006.namprd07.prod.outlook.com (2603:10b6:610:32::11)
 by SJ0PR12MB6685.namprd12.prod.outlook.com (2603:10b6:a03:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 17:31:11 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::d2) by CH0PR07CA0006.outlook.office365.com
 (2603:10b6:610:32::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Thu,
 12 Jun 2025 17:31:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 17:31:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 12:31:10 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Jun 2025 12:31:09 -0500
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
X-Inumbo-ID: 0ba1d15f-47b3-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvA9xOjHSD4Ln8q6xd1dWX1yrTL+e+kPTVEs4hpZqZvXr9+PpIH9zcbYLgEKOMODEbaZzJgzCLsHqchQlHxJwCQCRMykdKKlSfwVI5qiO809nRXNqjB4EJHde+eaM3tLLzNe95Cchu7s7cHLwQBWpp86NBInC+SC2mvE8GEjeNRyI/H/FzQpd0be9R6KdG3ZDjTViA+B2LuIBgT/rhHLI9KJAGu7Or12BRik/2sTku2HIM1ksPfXad0w345wR+2WlAjOblP7kw+LPUl+8Y8jnhJKnxRWraA+CNTEEkFiMmvMd5TwnICNu1yf+gpjK8BbZx4PEJnE8mhOZVEFsMSgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPrLHnvatmBdPewhuh0Ilah1Jx05z6rtCk5m6G1mJTk=;
 b=GWIZq1A1jzVplh/8wkgXpLayRQ9wRDcSvPfIqvnhrVT/llUX7TexIJv3Pct/oVDWuxwvsjSWFIC5KksqTfkLc9OxG3jipUkNDxjKy776s6vojUFGUSklU3KDdww4JkWqpiwsFy+jFjEipaBqjpUDsuTRa11o1+YOfYyO2/oyfYZASk+OCNvXWTaWwNbsCs6+FE9d5dTHub2LyPNCko1+lX5T83PJTwz5G3OQaW+0RwjDl593qTA96gA1y/K2is0RANn2aRjbQtVwVU8ZDGKIdyTUt926IpLOoGHmRFgGV14WfRdyjiIcpxS8zDqUxIvr45q6OaBg9mxeHDLLdbWMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPrLHnvatmBdPewhuh0Ilah1Jx05z6rtCk5m6G1mJTk=;
 b=auaeiqxlJ3T40pLLeMQwXrtA7z97oe7O7cy2dgtWJXSTn/m6W95A2XDq9TDawv5fhiMFj6CTTIZAouEO8CUq+f3kiPNBz/8JbwoBTyUtw3o8DLMIxdcb8pGvXJxFkNGziaXYCnyV/28NISf8GnaXQlmtA34Z/kRUIZ4Ot3dXAFs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1681221f-bc78-4c70-bc1a-708766ba896c@amd.com>
Date: Thu, 12 Jun 2025 13:31:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/xsm: Add XSM_HW_PRIV
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-2-jason.andryuk@amd.com>
 <43725e7d-cb4c-44b7-a3e5-59d8d597c805@suse.com>
 <12700a8a-a969-42ed-aba8-753ff9da9a44@amd.com>
 <789e1d1d-bfd0-434f-b697-678ab5e6f912@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <789e1d1d-bfd0-434f-b697-678ab5e6f912@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 781f910d-c326-466f-b32f-08dda9d6ec91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGowdVhPREJwdXFZcDFpWWFmSkJxY3l5U2ZQQWQwTjZFNGp1azczQkV1VUFy?=
 =?utf-8?B?K0RBeUhPMUxiVmt5N21hRWUyL3VMdEpYY2RCRi9nMDBKNjdONHd5Q3psNGhL?=
 =?utf-8?B?dE5mSHhEQjVUTnlWMkhtVy9zMllSaWRZblJVdkpuT0tPb0RxMWtQdHZySThH?=
 =?utf-8?B?aDRHbDM1SHd1MFRWYjNKT1hYQmNHUHduKzhXdXV4elJESzNOSUZ5ZWxlcFNx?=
 =?utf-8?B?RDNkckZjR2JXK1FiT212QzlUZmFrcEN6MitsN2FyallCbyt3dnhLeVhxelpi?=
 =?utf-8?B?Q3NydjZnb0kwandtUDZsYi9pZndqN21rbmFSSHpkb24rSW9TWGZSVDFpMXNO?=
 =?utf-8?B?aG5BcXAxbFdLNWtoQ21rR2hST1Q1cVpUWXVwRVhZeU1kWjdlQmRTVVdWbWwz?=
 =?utf-8?B?bHFSakhrenRlZGV4anZYRW9JRTZORU5BbEwrc3F2RUlFMXZiQUVpQU5VT0No?=
 =?utf-8?B?UjBUNXJDSVg4ZEFxUG9pcDdOek5YQmc0cnFKanloWG9YblY1NWoweG5yOHdp?=
 =?utf-8?B?SXVjTThMUHhCMnluMHZVTXZ1YWcvRHJPb3BtNVVSYnZPMXViZ2pWRmdBOHZz?=
 =?utf-8?B?dUxqa1R1VDFyMkt2VFd4ZXZ5MkJpYXAwdFRCYWoreTJIMG53cXdiNWFuRzBu?=
 =?utf-8?B?VnRyQUJnQjdQSUN1dzUvVzBlRGkrODhIUkhjTGM0bi8vMHI2Z1liY0VtbGQx?=
 =?utf-8?B?SDBQSUpLTzA2a2FydWsxYjdQL0dmRGJvWVorVDlQWXRSV1VUODFXaTdvRi9D?=
 =?utf-8?B?T0k3VHcxeG45MFI3YzJseWZlaEY4ajVrWmRmbk8rd3NLMk50QUdvUnI5SHJF?=
 =?utf-8?B?Y2hFSkppSzU5cmxrM29uUnorMTRBSzY1eEZMUUUxaDdtRnJVRGtURkc3Zk51?=
 =?utf-8?B?eDRSNHd5bXZSRU5wRzBYWEJLeUpHUUVPRG1LU0JVekZUdCtpbGQ5dndjazEx?=
 =?utf-8?B?RmtNZGpYRHUrQ3ptaGVIcE9ja3BiWThSM2Y0ZGl4b011RWxSM1NJeEFEWGtF?=
 =?utf-8?B?N2lseFIyZkJ4em83NDJRSy9oN2Z5ZDdPeE5POHI2eWI5RXB5ZUtTRXN1cGR2?=
 =?utf-8?B?VXU1Um1MZ3RYNTRiOS90Q3pVTmdlYlQrNE1BOE40UHNXL1BxTmZBYkhQQzNP?=
 =?utf-8?B?aU1zM2dDT3dQVXNaZnhTNFlaR0NiTVdXU3pTSmJPTVFoMzNoUXBqaXdrMm1u?=
 =?utf-8?B?ZW9VNHE1Y0lCNlZONUZBZ3p1bURnV2pCc1pPaitzay8xbGJQVU4xR1N3OHp6?=
 =?utf-8?B?UmlwT3JNZXQ5T2t1QmhZMG1rWEprVE9GUytXZmEybVZHUnNsR09GQk5KRHRl?=
 =?utf-8?B?dG14VDUzS0dqQVBuOGNFWHpSOGxzL2x3R3Q1Vi83eFlIcE9oWG1hSTVndlZv?=
 =?utf-8?B?WTVBNXVCUGZUck43Um01ckRhTFByMzc3Y0g2OHdVeXRVL2JkcEhrN3ZzVUk2?=
 =?utf-8?B?RWRtWVdlWXhPc3c3WTRGWjhMaU9TYVo3K3MwWGFIQzZVQVFtd2ozdXk0ek1T?=
 =?utf-8?B?OXZ6WXc0NytzUkNGOXpJbHlDSmQ1eC9VbXRuVHEyYzVQZVhibC9odVRVOFNl?=
 =?utf-8?B?d1IyRStPMjhITEFPRU5DY25DMStSWEt0Vk9nN2NzdjJHWnFMbFZKOHRodlNy?=
 =?utf-8?B?djRwcHdybmFGM1E5MTBxQmVSTzVhY2tLcjE1YUJjRk10ZnRQcGI1L00vUzcy?=
 =?utf-8?B?V00xbzFxMzVBclMzbHpIYXJtN2s0ZG82dTVDczNoTkhJcVFXZHk3cUlLc0tT?=
 =?utf-8?B?djVsL1AvNjM5T3VWd0lINTN5MUFrK1VQc2FxZTBBaHFKYXgyMWtPRCsvOFZG?=
 =?utf-8?B?ME0zNHF5dUdCRnE3WFRkL2FXNnI4bmdnYjVqODNtRzBaR09rMm1CcXBlL0Yx?=
 =?utf-8?B?dkhORFhRWHZmaDFTckNkR1REcUJBUHVZM2hBdlQ2ck05V2x1TnpvRVgrRnh0?=
 =?utf-8?B?Q0hqcjN5TUhqVFBqZU5JR1ZoSkI0TFdteG1hMGxxVjZKVUkveXIzTkZZQmF1?=
 =?utf-8?B?SFJsYS9HMitVL3BDd1R0SjZUT2Q0ZjY5Q2hiV21NTU5PSWF1Sk1NZ0EzWW5v?=
 =?utf-8?Q?7nWSrs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:31:11.2734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 781f910d-c326-466f-b32f-08dda9d6ec91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685

On 2025-06-12 03:36, Jan Beulich wrote:
> On 11.06.2025 05:13, Jason Andryuk wrote:
>> On 2025-06-11 09:02, Jan Beulich wrote:
>>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>>> Xen includes disctinct concepts of a control domain (privileged) and a
>>>> hardware domain, but there is only a single XSM_PRIV check.  For dom0
>>>> this is not an issue as they are one and the same.
>>>>
>>>> With hyperlaunch and its build capabilities, a non-privileged hwdom and a
>>>> privileged control domain should be possible.  Today the hwdom fails the
>>>> XSM_PRIV checks for hardware-related hooks which it should be allowed
>>>> access to.
>>>>
>>>> Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
>>>> platform_op.  The hwdom is allowed access for XSM_HW_PRIV.
>>>>
>>>> Make XSM_HW_PRIV a new privilege level that is given to the hardware
>>>> domain, but is not exclusive.  The control domain can still execute
>>>> XSM_HW_PRIV commands.  This is a little questionable since it's unclear
>>>> how the control domain can meaningfully execute them.  But this approach
>>>> is chosen to maintain the increasing privileges and keep control domain
>>>> fully privileged.
>>>
>>> I consider this conceptually wrong. "Control" aiui refers to software
>>> (e.g. VMs or system-wide settings), but there ought to be a (pretty?)
>>> clear boundary between control and hardware domains, imo. As to
>>> "pretty" - should any overlap be necessary (xms_machine_memory_map()
>>> comes to mind), such would need handling specially then, I think. At
>>> the same time: The more of an overlap there is, the less clear it is
>>> why the two want/need separating in the first place.
>>
>> So you are in favor of splitting control and hardware into distinct
>> sets?  I am okay with this.  I implemented that originally, but I
>> started doubting it.  Mainly, should control be denied any permission?
> 
> Yes, imo: Fundamentally for anything the hardware domain is supposed to
> be doing. 

Ok.

> Yet as indicated in other replies to this series - boundaries
> aren't always as clear as they ought to be for a clean separation.

Agreed.

>> We aren't using the toolstack to build domains - dom0less or Hyperlaunch
>> handles that.  This avoids issues that might arise from running the
>> toolstack.
> 
> IOW you don't have a control domain there in the first place?

I have a domain with d->is_privileged == true.  We don't create more 
domains with it though, which was your other email's definition of the 
control domain.  But it can pause and unpause domains.

Regards,
Jason

