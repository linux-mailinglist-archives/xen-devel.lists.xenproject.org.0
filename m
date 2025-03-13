Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D258A5FE72
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 18:43:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913230.1319335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmay-0007rv-9X; Thu, 13 Mar 2025 17:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913230.1319335; Thu, 13 Mar 2025 17:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmay-0007qG-6H; Thu, 13 Mar 2025 17:43:48 +0000
Received: by outflank-mailman (input) for mailman id 913230;
 Thu, 13 Mar 2025 17:43:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ER9z=WA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tsmaw-0007qA-AX
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 17:43:46 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2413::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b434afeb-0032-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 18:43:43 +0100 (CET)
Received: from DM6PR11CA0055.namprd11.prod.outlook.com (2603:10b6:5:14c::32)
 by BL3PR12MB6521.namprd12.prod.outlook.com (2603:10b6:208:3bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 17:43:37 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:14c:cafe::e3) by DM6PR11CA0055.outlook.office365.com
 (2603:10b6:5:14c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 17:43:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 17:43:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 12:43:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 12:43:36 -0500
Received: from [172.19.192.96] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Mar 2025 12:43:35 -0500
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
X-Inumbo-ID: b434afeb-0032-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5dOldkogwywQtDTPyhkXieoyFAXRTkbRRGrhvWRIiw4fn2NYdGKWvZPKSfvDpfXeooHt3IGWmbjogP81N9dLyhTkJ6ATxYo4fO7y1ZlR8qON9AZoKDbt2pjG1rAioLUaMwRdoKZFE37D4QbbUHQlo6lfCbbGKp1DOTo3Z+kz7Y+I1+AY5T/Qfl50Mn8V39HLZmuwkObHT0kBKOZR/WtZL96jB989TpPSQv/A4ah2Wxkw30pPLgg7kSDTgH+hSROSglNTMOT5A3HKVJlEGb/G12M4EfxhO3jauMb0b34JQwmrb8KdopHGAH9OO+DWJ8si3+KNEKWbCnXQxY025zgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rrw4bQR0RMB2doxXm46K/sLPPbyJ0Lsvu8ulzz0b5+M=;
 b=wVL2oYDxAMHnLh4Mo+FbqU+O+McYuI0h35Rki/WjMZ9vGVByETbhogvW2J5ZhxJKINKeON7h/Y4ebPWwwzO+Tp7OXKE+3vTZFB53McfvEpfDdNKQ+qqCG2i4iO8q6mzcu7yrOgJ18PaA0uI0DJiNzm91v7uRLmQWeK3aljFILStJyAGSAeuvynCiRum59IFT0C9gBgxUC/A0bKjE+2Q06PoF3cFQBiWt0Lp4E8AADUDveTqSrp2xDHMZ76G4R4E7wp36p3ddCKzI9wepy6GseZEoKaLr5YUPib/029hZ3xfI+CVbLIFg8NZ1JtXWgon0y1u46mDTxnNbrhR4jZ9wkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rrw4bQR0RMB2doxXm46K/sLPPbyJ0Lsvu8ulzz0b5+M=;
 b=E5u2Ct4LMN3p2z9VyL0lMGepc8n2MiqlWJ2npxxa6FKpQ4DMD/Chfaim1mIxCnRT4PhHMBmuP5h7/NmyLhkLCjL7udv4bBFLpvcD9PZFXKpNhbASwFmBwrbWlWV++TenYQuoqKnNVfJ2MJ1RAQHV8RpDDpLXSQFyR0nr6wrG5yk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7b4f47c2-ce03-44e9-907a-acd56e56a9ff@amd.com>
Date: Thu, 13 Mar 2025 13:43:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <D8F8IW559J11.2G40MDQH23I44@cloud.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <D8F8IW559J11.2G40MDQH23I44@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|BL3PR12MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 670d623d-570f-4e9a-e33b-08dd62569585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUxWYUNQa2hiVllTbUw2QTB3c0tZMU9NNW1MYzhUTFhCbStRbnhZcm96ZzVR?=
 =?utf-8?B?RkFKRnBURitCcHFVWk5mbVhJOTRPWWxBeElDaWxiU1Q5Y1Q2NVBhT24zUDVj?=
 =?utf-8?B?OERneG5OL2NSTkFGem9STGRYYUtVNzkxM3htVHRUQUp1MDhLUFN1M3BaeHpz?=
 =?utf-8?B?c1pHbFp3T0Y2T0hTRFFRSEh5RFNvZWdJUjB4Z1QrbkxpbWtVa3ZGeElWMHpn?=
 =?utf-8?B?MjE3b1lxMmp2YU8yOGF3ZVZPNWdiVlFyZmExMnNqc1duSlZLMTFMaDV0Mkk5?=
 =?utf-8?B?clJReHhQRElRcG93QzNKcVRndUtEVWY4MHpUYWlZYWpaeVMwMmMwKy9DRHRn?=
 =?utf-8?B?bVNyTndYREpYcVh1MmlaSEVrZEt2TStjS3R2cWpjK0FlaG1KMnpXRDdEaUR0?=
 =?utf-8?B?SkVBZ0JBTkpacm53YUxWVUZaSHBUNDIvSmtYTFJEcFJzUjhWckRKdmJwb1FY?=
 =?utf-8?B?ekhNOXFRbVJZeWxJNmJLR3Y2QVFqbnBkZUQ1RkNzREZUNTdWZGgzNVMwNUta?=
 =?utf-8?B?c3I0NngrWXpjNG1NRy9MR1FuWmNIK2lxWEc2MVBpVTMxd0hTRFZYZmoxdGhO?=
 =?utf-8?B?V0trdUVEbkpSUjMwTis1NlM1ZGgyb2JNZGhISEx3cC9abmJRamFYa2VEV2Jl?=
 =?utf-8?B?cmZQT3FCY21JcUlEeEhDVzJ0RSs4NlgzekN5RU8yMmxOWjRmbC9yQ3dMSEtT?=
 =?utf-8?B?Q3htS21iTkR5aEJCUmk0Z2pLOWVUQ2xnbkdlM2VFbUhIcEpuZUxBMDBUeDIy?=
 =?utf-8?B?Sjh2YnZ4MFRsL241MDJjMmlEdHgyWHE0SGlYeHUrYTVhVlkyb0NQN0djb01i?=
 =?utf-8?B?MEE3VHZ1QjM1eTdPaUZVa0FJZ2RuVmRiNVF0RnpJekZ2OCtJcW9BUTNmdWds?=
 =?utf-8?B?QmFNUml6Y3NHZk5XbloxNS9yKzMyZk5xQTVaYXpGM3k2alYyTVBMNHN0OXg0?=
 =?utf-8?B?UmoyL2g2Vk8wZDd4Z3VoSkJZcC90OGJxUjlVajdhaVNLUEh4akxZajhPbmJ6?=
 =?utf-8?B?cDlud0M5c0hQWlpKNER4MXNSMEs1TmhYZ01zQmJDN3dVZ3c2SDV4cnJyMjFC?=
 =?utf-8?B?YWZsYXlDM2dnNksvRnBTTitwVEtjMGZNalhnQUloRnlJTUdDdGpOMGR2cXNT?=
 =?utf-8?B?TUJFWXNWTVNWWXdsNFhIVURGSTM3dnhMQ3JXc045ZmFXNE5nbElXYThISGdx?=
 =?utf-8?B?L3ZFV0tLUnZVb0VROGpIN0lsdW40ZUJnUnhaaFkwZGVEOE5HSUVBNXpUVVd0?=
 =?utf-8?B?UFAvVWhuZ3pjWTFlZ1lvZWJGdGtkVmRRelVjVHpjd3pHV2c5bEdrY2thNE9i?=
 =?utf-8?B?Mm5tT0huOVJNUHNhQ1ZEYURZOU9lNDF4U1NEYi9IakdJdHkwT29BVlpLaSsz?=
 =?utf-8?B?UXpYOStlUWw5U0c2MXZFd05iZzNLZ3Vpekl1NjQxWVVJR0Q0YzB3VmptelJY?=
 =?utf-8?B?c0k3NTJSYUc1dFRyaFJIZkQ0dEFWelV0RnIwUUFudEZkRDc5RTRjbzhtYXhY?=
 =?utf-8?B?dURDbTVOdXBiYXhFa1NveFg3dzV5bS9DR1VuSjdxcVAvYWtrbFVBWllteDVY?=
 =?utf-8?B?QnovMlFTMHdtTno4Qi90emRUa0xnL05CSVJFd2ZZQytZclVENWdtOG1hOWhy?=
 =?utf-8?B?cldBZURsNXE2dVZRV1ZUaWlES0pZbDVKcXpXNm5qMElZRkpWTDJFUDdYTGM4?=
 =?utf-8?B?alY2SzFQZzdxZEwyWHU4QzdDeXgrb1o3UjVpbkRoNTdVZ25JdWFITWJvWndr?=
 =?utf-8?B?ZitRRjNlbXRGZFdYYVl0L1VUSW5TUU1TV1JyVUVxYUdoQk1tY2dXVkxpdGZw?=
 =?utf-8?B?L3BYUlhNeE9jTnc3TEpuTnl5SFhBUTNJQ3V2bkhheDZHMlJ4SEVRS2hEUTAv?=
 =?utf-8?B?TmFFWCtqbVQ0VGFtMFRFUVVzMi8remFrclNVY3VwazdhY000Ky9SMWtqM05F?=
 =?utf-8?B?LzZrSjUxSHJ0MWFHc1dOMTlLcllJeVkzOUhpK1FDWElZSzVvUFJqQWcrOWx0?=
 =?utf-8?Q?XaQD3tLKnH69hzTuf11o6HQ31i0q34=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 17:43:37.0830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 670d623d-570f-4e9a-e33b-08dd62569585
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6521

On 3/13/25 11:14, Alejandro Vallejo wrote:
> On Wed Mar 12, 2025 at 7:50 PM GMT, Stewart Hildebrand wrote:
>> Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If firmware
>> initialized the BAR to a bad address, Linux will try to write a new
>> address to the BAR without disabling memory decoding. Allow the write
>> by updating p2m right away in the vPCI BAR write handler.
>>
>> Resolves: https://gitlab.com/xen-project/xen/-/issues/197
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> RFC: Currently the deferred mapping machinery supports only map or
>>      unmap, not both. It might be better to rework the mapping machinery
>>      to support unmap-then-map operations, but please let me know your
>>      thoughts.
>> RFC: This patch has not yet made an attempt to distinguish between
>>      32-bit and 64-bit writes. It probably should.
>> ---
>>  xen/drivers/vpci/header.c | 65 +++++++++++++++++++++++++++++++--------
>>  1 file changed, 53 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index ef6c965c081c..66adb2183cfe 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -173,7 +173,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>          ASSERT_UNREACHABLE();
>>  }
>>  
>> -bool vpci_process_pending(struct vcpu *v)
>> +static bool process_pending(struct vcpu *v, bool need_lock)
>>  {
>>      struct pci_dev *pdev = v->vpci.pdev;
>>      struct vpci_header *header = NULL;
>> @@ -182,12 +182,14 @@ bool vpci_process_pending(struct vcpu *v)
>>      if ( !pdev )
>>          return false;
>>  
>> -    read_lock(&v->domain->pci_lock);
>> +    if ( need_lock )
>> +        read_lock(&v->domain->pci_lock);
>>  
>>      if ( !pdev->vpci || (v->domain != pdev->domain) )
>>      {
>>          v->vpci.pdev = NULL;
>> -        read_unlock(&v->domain->pci_lock);
>> +        if ( need_lock )
>> +            read_unlock(&v->domain->pci_lock);
>>          return false;
>>      }
>>  
>> @@ -209,17 +211,20 @@ bool vpci_process_pending(struct vcpu *v)
>>  
>>          if ( rc == -ERESTART )
>>          {
>> -            read_unlock(&v->domain->pci_lock);
>> +            if ( need_lock )
>> +                read_unlock(&v->domain->pci_lock);
>>              return true;
>>          }
>>  
>>          if ( rc )
>>          {
>> -            spin_lock(&pdev->vpci->lock);
>> +            if ( need_lock )
>> +                spin_lock(&pdev->vpci->lock);
>>              /* Disable memory decoding unconditionally on failure. */
>>              modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
>>                              false);
>> -            spin_unlock(&pdev->vpci->lock);
>> +            if ( need_lock )
>> +                spin_unlock(&pdev->vpci->lock);
>>  
>>              /* Clean all the rangesets */
>>              for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>> @@ -228,7 +233,8 @@ bool vpci_process_pending(struct vcpu *v)
>>  
>>              v->vpci.pdev = NULL;
>>  
>> -            read_unlock(&v->domain->pci_lock);
>> +            if ( need_lock )
>> +                read_unlock(&v->domain->pci_lock);
>>  
>>              if ( !is_hardware_domain(v->domain) )
>>                  domain_crash(v->domain);
>> @@ -238,15 +244,23 @@ bool vpci_process_pending(struct vcpu *v)
>>      }
>>      v->vpci.pdev = NULL;
>>  
>> -    spin_lock(&pdev->vpci->lock);
>> +    if ( need_lock )
>> +        spin_lock(&pdev->vpci->lock);
>>      modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
>> -    spin_unlock(&pdev->vpci->lock);
>> +    if ( need_lock )
>> +        spin_unlock(&pdev->vpci->lock);
>>  
>> -    read_unlock(&v->domain->pci_lock);
>> +    if ( need_lock )
>> +        read_unlock(&v->domain->pci_lock);
>>  
>>      return false;
>>  }
>>  
>> +bool vpci_process_pending(struct vcpu *v)
>> +{
>> +    return process_pending(v, true);
>> +}
>> +
>>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>                              uint16_t cmd)
>>  {
>> @@ -565,6 +579,8 @@ static void cf_check bar_write(
>>  {
>>      struct vpci_bar *bar = data;
>>      bool hi = false;
>> +    bool reenable = false;
>> +    uint32_t cmd = 0;
>>  
>>      ASSERT(is_hardware_domain(pdev->domain));
>>  
>> @@ -585,10 +601,31 @@ static void cf_check bar_write(
>>      {
>>          /* If the value written is the current one avoid printing a warning. */
>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>> +        {
>>              gprintk(XENLOG_WARNING,
>> -                    "%pp: ignored BAR %zu write while mapped\n",
>> +                    "%pp: allowing BAR %zu write while mapped\n",
>>                      &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>> -        return;
>> +            ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>> +            ASSERT(spin_is_locked(&pdev->vpci->lock));
>> +            reenable = true;
>> +            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>> +            /*
>> +             * Write-while-mapped: unmap the old BAR in p2m. We want this to
>> +             * finish right away since the deferral machinery only supports
>> +             * unmap OR map, not unmap-then-remap. Ultimately, it probably would
>> +             * be better to defer the write-while-mapped case just like regular
>> +             * BAR writes (but still only allow it for 32-bit BAR writes).
>> +             */
>> +            /* Disable memory decoding */
>> +            modify_bars(pdev, cmd & ~PCI_COMMAND_MEMORY, false);
>> +            /* Call process pending here to ensure P2M operations are done */
>> +            while ( process_pending(current, false) )
>> +            {
>> +                /* Pre-empted, try again */
> 
> This seems a tad dangerous. There may be a non-negligible amount of work queued
> up. I also wonder whether the guest can induce spinning by increasing
> contention on the p2m (e.g: via ballooning) or by induces work being queued up.
> 
> I don't quite understand the logic, but I suspect you could
> raise_softirq(SCHEDULE_SOFTIRQ), decrease the IP so the instruction is
> replayed, release the locks, and simply exit the hypervisor. The system ought
> to naturally split the operation in several continuations each of which does
> either unmapping or mapping if it couldn't be done in a single one. Replaying
> the instruction after decoding is disabled ought to be benign.
> 
> I haven't tried any of what I just wrote, so take it with with several tons of
> salt though.

The idea was that the unmap-then-map operation would appear atomic from
the guest's point of view. I've only queued up the unmap operation at
this point in the new logic. Due to the mentioned limitation in the BAR
mapping deferral machinery, I wanted to make sure *this BAR* was
unmapped before queuing up the map operation (see below). Waiting for
*all* pending operations to finish here is likely not appropriate.

I think this just reinforces the need to rework the BAR mapping
machinery.

> Do you know if Linux intentionally skips disabling decode? Or is it a bug?

I think it's intentional. See https://gitlab.com/xen-project/xen/-/issues/197

>> +            }
>> +        }
>> +        else
>> +            return;
>>      }
>>  
>>  
>> @@ -610,6 +647,10 @@ static void cf_check bar_write(
>>      }
>>  
>>      pci_conf_write32(pdev->sbdf, reg, val);
>> +
>> +    if ( reenable )
>> +        /* Write-while-mapped: map the new BAR in p2m. OK to defer. */
>> +        modify_bars(pdev, cmd, false);

This call to modify_bars() will raise a softirq for the map operation.

>>  }
>>  
>>  static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>>
>> base-commit: 8e60d47cf0112c145b6b0e454d102b04c857db8c
> 
> Cheers,
> Alejandro


