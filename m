Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C9FBC91DA
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 14:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140610.1475450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6q5O-0004Xy-Sv; Thu, 09 Oct 2025 12:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140610.1475450; Thu, 09 Oct 2025 12:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6q5O-0004WY-P1; Thu, 09 Oct 2025 12:49:34 +0000
Received: by outflank-mailman (input) for mailman id 1140610;
 Thu, 09 Oct 2025 12:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LuT=4S=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1v6q5N-0003yB-QH
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 12:49:33 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65e8fa88-a50e-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 14:49:31 +0200 (CEST)
Received: from SJ0PR13CA0007.namprd13.prod.outlook.com (2603:10b6:a03:2c0::12)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 12:49:22 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::bd) by SJ0PR13CA0007.outlook.office365.com
 (2603:10b6:a03:2c0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.6 via Frontend Transport; Thu, 9
 Oct 2025 12:49:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 12:49:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Oct
 2025 05:49:20 -0700
Received: from [172.21.123.104] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Oct 2025 05:49:19 -0700
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
X-Inumbo-ID: 65e8fa88-a50e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQxEwEfCLF4Jc7zNj/CobdqW7sLui09MnJz23oE8drd3tCwTjuM9x53sleGlib/lMuaV0Zs0FtXeQyFS1BAOKGdGAHc+I8pe4NyjgZd2L51i6RVCLTMQ5i3EX40+uo8SvkEacoDFkoTLfpLAp9A7tuhXRnO5ffxFFFhrHy8UyjEuJw+QiUfWg1OIJ7wbA/1UVxP4oWU/DidHYdnVnpHG7aBcyTo1N+rKQ7kcAxgZ6omFS/hnCrxJGgKR7uZt18cgFWgFmZwLuNsk4fj5EshW7NbL2Y8kQeT1l8+M537nAmHxg0AbtbG24XaTLmBGMiDffe2uT54Mk3ek/5VcKNb3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCDQz/nZi4FqCCRkMciMEWCbUxjOW2X4vWOR12UcSyw=;
 b=Vn1nxjhVftb9QypMjHIe4rhAAZSQR4W8JnusD0FwnH8Y3fe8i3QzRaCz6r7KoPl5t4jcdwm3pxIH09xRvSDEd2fYkxRKnOWq+FNjF2iiS194qRCuLyzcvABACiCfo/G5f8auk29jdKn7sGIewFyjGl9/fMpwWpkSS4NsBOL5drtbLvDMv5uPaJal36o1Kwciec6+m1g3LmAKkpwipB63OK38D7TdNoRm7CRR4Ahl5M8XiT7lASPb4lgjHxk0Zi8PZWgVuBN9wuN6qxpXltrlU5TmG8rpinwcqqKT4i2ZqyZA8o4c04ueoqF6mtdDoWlsYt2Wv33o2qNq7BUzhHUSBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCDQz/nZi4FqCCRkMciMEWCbUxjOW2X4vWOR12UcSyw=;
 b=VxNh0umB7n7gZ+0+2KVhsG4SXkXSlqMU631lSk3POmCALEPFA+t8a5yFWrEZ906618XW2m6xeHTjCHZBh2Y9aCsUHZpn3Ad62NZAIz+ex2ZyTnkh6jlR4eBIKKdGY9GgJgsdWRdg3YmRsZeUIvPP6/Wl5BaAp2zFrP3/qtcd+CM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c8aedea2-7708-48c0-9cf4-e5f05501d9e3@amd.com>
Date: Thu, 9 Oct 2025 08:49:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v2] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20251008143923.2557-1-roger.pau@citrix.com>
 <aOZ8W_--kyn6Kjol@Mac.lan>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aOZ8W_--kyn6Kjol@Mac.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: e65c0a2c-38cf-4691-4f46-08de0732451f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1h0NnFmQmdlRXQ2OUZiL29qNHl5SjBENG8rd2dRRkxsYW5hUzAyMWIxbGMr?=
 =?utf-8?B?dVlNalVBUWxpampJT0UrbWlWSTZVUGhLYXI1TnJSN1ozbWJUbHU2MGVyQXdH?=
 =?utf-8?B?U2l1SGFwYkxHNlhEZHFWa05YK0lLcHlrS0VFSEx4UTVXN1Vhc0o0VkhUaVBF?=
 =?utf-8?B?QUJPMlZ2d1h4aWxBSUNJSkpGSHhXY3UzM0w3L3JmRnAvT3ExdGNHZEpUenhy?=
 =?utf-8?B?K0FubWlWRHE0cUN2S2Q1YlJ3ZWRybDFnTkwvMGNuUW8vS29vTVREVkJ2RWVE?=
 =?utf-8?B?UmMwOWJlMVY2TVdIbGlEYTVTRUZBN2gwMTFYNnNTTDVyNWFRY1ZTZWtFNEVS?=
 =?utf-8?B?eEZ3M3FnU1VBM0drUXY3MGV1Q1Vjd05NYmN5RVlDNnllcHhhWjRxT01nVzdv?=
 =?utf-8?B?aHJKbEtJMVM0dkhPbktYcUs4dFZGOEh6TG8yNStQSlBwNlJKRklCWU5ONnp5?=
 =?utf-8?B?a2o4Unl1cG9VbDI4K0FoMjkweU4wdTkzZGd2RnRqMmJWSXZxRTF1cjBmeis3?=
 =?utf-8?B?SGFtZGJvZmNMQ0thUUZMZW9lL3g1VFM3M1F0TmUzbEF2UW41R2JLemIrZDlV?=
 =?utf-8?B?SW5nbEUvODJNYUNzR3RJc29kdWZQbXEzSCtzYUJYeVRGU1dhS05KdlF5aWxJ?=
 =?utf-8?B?T0pLeGVOZUZFb1A4UDNXWEJNeHZjVFUzUzBWcVdZcnB6a1pXWnhaZGhnZ0dH?=
 =?utf-8?B?elFsZndLTTQrZVgvajV1S0RYTmptNjk4YWdEcUd0clpOQ1FNSjRKVkJQYlUy?=
 =?utf-8?B?YzhxclN2V2lXZEdmVm1tKzk0dld2dFlFWHJ4S1NBaXduSzVnNnJ5NmpUMDl2?=
 =?utf-8?B?N1M4a1RaTFdFTVpjeXNSQWk4alNWbGk5djd4UlcvdlVTV2MvWEkvak1mZ0Qr?=
 =?utf-8?B?ZWtZYmtaZ2xZTXZ6c2R2dFNWOVREWGJpd2s0VnVFMHBjcXBCRzBxN1oydFBL?=
 =?utf-8?B?aXZVaTVrVXRyRm94dkVzaTc4Ti9VSU10R1BvL210eHBOTm8veWQyQzhTZTlz?=
 =?utf-8?B?dGQzSTVuZW1ycTFCSko0U1pCL1RWajNxemdxRmJuRVlvOUhIZ2NhRW92NVJF?=
 =?utf-8?B?MFFGS1JLYkpOL1UyZnRVWU5iZ0pGVkJNWm15NjFDdmR2LzhOdUx5OXFMYU9z?=
 =?utf-8?B?MUlLQ2l3S3ZqZ3hVdFRkWlhhQS96YktvcStmaURIRW5TbHF0YllVR2dDMHo4?=
 =?utf-8?B?WUFMNkt3RTVVL2pPdXhDNzJtM2UrYjRMU1RjcGRnZmZvWk4rdTA5MGtPL214?=
 =?utf-8?B?SytycGhCQzlQME1QN3ZvUWRhalhzTlc4cHFmWDAvNXJSLzQxT2JSeDg4QVVh?=
 =?utf-8?B?U2JLM1BZaUNaWHRTNis3OU02QWYzYm5xZkI0bTBtU1drRTA3V2p3VmNnQzFL?=
 =?utf-8?B?c0xIZ1NNdzNGN3BFMTVrMnN5ekQzSXJRRERadGZiNXNyUmxWdW5RQWdsNUtU?=
 =?utf-8?B?cS96NC9zSStoQkR0OW0xbTE2ZUtOTjlISG9RZnFCMFhEMTE3OUFtcS8wQ0F0?=
 =?utf-8?B?ZHdZR1pSTDdNZzFZZ0hoaVlYYnVIOVFrSTl4Z1RxdWxoaDJVa3R6L3BQUXZC?=
 =?utf-8?B?K2VxZWJqdjV1TW95cjJsT2pYajhzL1cwTlc2bGFsbmJIRnRQdmdhUlpXRWxZ?=
 =?utf-8?B?d2IyWE1jcXhHSzRtTDJhOHRJNWk5cjdNTi9uamZyODA4djFFUXk0YmxBMlo0?=
 =?utf-8?B?TVBkVDB4OE00Q2poRGt3UDNPanlTcXhhSTl5eEM0QmhrODhWY3lPa0VuYUNj?=
 =?utf-8?B?Z3dyeFFyWXNSSHVEMzBGaitmUnZMQzNLODlHOURSUVBOUXNmc1R0ZHJHWnh5?=
 =?utf-8?B?NlMxMnBYdTlvN0tPUDVCY1hvZ3U2cFU2aUdBVDJMamhFTVJ0TWRRWE1tcWNZ?=
 =?utf-8?B?ODR1T1ZtN29wSlBNbllwekhzcjU5ck16VFh4VTlBZUVhWW9lcFhhaTVPUWVB?=
 =?utf-8?B?VTBHTjZtVVQ5LzF4dWJQUEtaeG1HU3JXcEVWSWI3RThpNmhwRHFjZCtyazcz?=
 =?utf-8?B?bCs3ZFBlMW1GQXA5d2ZzbzB1OUVsNldQWElRTndKcllVcjZzYVJsdFBjZVpt?=
 =?utf-8?B?eGsrT01CNUJJZlRWNDNaLzlndUdiZ00zN3RPWFJKQVNDSXRISmxNZDNLa1Np?=
 =?utf-8?Q?4TA0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:49:22.1271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65c0a2c-38cf-4691-4f46-08de0732451f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366

On 10/8/25 10:59, Roger Pau Monné wrote:
> On Wed, Oct 08, 2025 at 04:39:23PM +0200, Roger Pau Monne wrote:
>> I've had the luck to come across a PCI card that exposes a MSI-X capability
>> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
>>
>> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
>> still use the address of such empty BAR (0) and attempt to carve a hole in
>> the p2m.  This leads to errors like the one below being reported by Xen:
>>
>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
>>
>> And the device left unable to enable memory decoding due to the failure
>> reported by vpci_make_msix_hole().
>>
>> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
>> tables are usable.  This requires checking that the BIR points to a
>> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
>> target BAR.
>>
>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
>> EPYC 9965 processors.  The broken device is:
>>
>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
>>
>> There are multiple of those integrated controllers in the system, all
>> broken in the same way.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Released-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes since v1:
>>  - Introduce a DEVICE BUG prefix.
>>  - Remove extra newline.
>>  - Fix typo in commit message.
>> ---
>>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>>  xen/include/xen/lib.h   |  3 +++
>>  2 files changed, 48 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>> index 54a5070733aa..4ddcefbcb274 100644
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>>      if ( !msix )
>>          return -ENOMEM;
>>  
>> +    msix->tables[VPCI_MSIX_TABLE] =
>> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
>> +    msix->tables[VPCI_MSIX_PBA] =
>> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
>> +
>> +    /* Check that the provided BAR is valid. */
> 
> I had the following local change that I forgot to update the patch
> with before sending:
> 
> /* Check that the referenced BAR(s) regions are valid. */
> 
> I think this is a better wording.

+1

