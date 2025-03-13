Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1658A5FF37
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 19:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913292.1319376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnI3-0008Ni-AH; Thu, 13 Mar 2025 18:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913292.1319376; Thu, 13 Mar 2025 18:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnI3-0008Ko-71; Thu, 13 Mar 2025 18:28:19 +0000
Received: by outflank-mailman (input) for mailman id 913292;
 Thu, 13 Mar 2025 18:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ER9z=WA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tsnI1-0008Kg-FX
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 18:28:17 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2412::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec28304b-0038-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 19:28:14 +0100 (CET)
Received: from DS7PR05CA0006.namprd05.prod.outlook.com (2603:10b6:5:3b9::11)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 18:28:08 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:5:3b9:cafe::39) by DS7PR05CA0006.outlook.office365.com
 (2603:10b6:5:3b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 18:28:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 18:28:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:28:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:28:07 -0500
Received: from [172.19.192.96] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Mar 2025 13:28:06 -0500
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
X-Inumbo-ID: ec28304b-0038-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKNBMMhg/aBfWJIG5nPB4xJuuvnERSQta0yDF996TlwgwTZ1CDRADdkqLVHaksIoyoxiAGUALK1ioYYh1wrVYjwhwsLdSqM2h+z2G+TbFzAq8e5I3oHleQ1cR7bYeDXcMcmXSrobqDE2Jt8+X2mzCgkRjbU6ej9q51601q0Y5S9KbthYYcRnoSBoBp4r7YK+T7P0+8GCWchaZo9wK0THNCetxGyWeCaM2+xmTEIEZj4tf0vwk6Hj365+3tIZGLbKgSXmlzHIpW6AIRmJeQLLmhlOwSGe1P8puTd0DdCXR+7hYLGycTAriEARNMD+ayChwjLHNhB/6ElCKbSa/zpTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufv7YYxL1vv+wUtopyB0g6mQIH21Fb5XpzvlnFUKMNA=;
 b=RNdTpe8fTr7uuZ8HwdDzudGzUTJpVVGtbxmHgXVSi1xqS2JiRee85bB9MndRUKhWcWK/KKa4uIqQNS4nUX3elZKTGW1d6jJX4PVaxGXq9RafqEHXbrN2CajIOsyHUxeV7ajZZMdR/M2y/GY80rHiXoMeLrR7gDShiA9mA4TxQVfE2/XNQ474mpvzRMGw2H9hjmpDL9au1c4unhIrO4mIcN0aNXnbUfCX7JBXWDkDEpyNwDlSxcUCXpVJLl+LnqouzD3r2Jx1ymx9a4d3Pyq5W1RWqZdeEbkvW8qJgBxeu30ay2PpHdh7f3iV5bmnGxHVz1VUR5Ix8LztuBjB5MlVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufv7YYxL1vv+wUtopyB0g6mQIH21Fb5XpzvlnFUKMNA=;
 b=kY816ZAzJXUKruwntVl1Dx2cFQHqSlAGS20ryxznrXcPTiPW5HOSAiClCSAFwtyNLUsdz0fniF4ek2BD6e5rbNIB7iXtUCLI2udUPX9k3I+nwTsG9tAKPqB/1LgiaxxRA1PPutteJryifEsvNx7EoGcrTHaR9qzM4kAbzrbnxms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c5f0cae0-4ba9-4a9e-98b9-a30449e5fd49@amd.com>
Date: Thu, 13 Mar 2025 14:28:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <Z9MaZVMtI86eAmDJ@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Z9MaZVMtI86eAmDJ@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c7914b-3259-4150-ee1b-08dd625ccdae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXZROTQ3YU5wRDlnb2FmbXcrK08zcWpXUlNzOEw0ZHpjckdyTTFNaVI3QkUr?=
 =?utf-8?B?TnZCRmVPaVF2c3hmdXovS0kzdkxhdWZQbE5vREtXc1YrMnVLcEFGRjZCeWVv?=
 =?utf-8?B?T0NOdGZ5MGVIWE5YbytmR2M0N3pBTzE4MmhwSFU0NGtCd05jelhuQWVOY09j?=
 =?utf-8?B?Y2gyalI4Ry8ycFUxL045WFdBOE41ek9UMXRQZTA3YnIzb1RyM1BOZXpBek1Q?=
 =?utf-8?B?b1czL1lGRFFZVUFoeVNtNHhHS05yVldwdkY0L2laS3U3enZVT3VkRlZRTFdT?=
 =?utf-8?B?NFNMMWE5S09qdlZyOGZvajljbzlQZVpoaWw3L1BYT1hYTGNKdHVwWWR2ZlpG?=
 =?utf-8?B?dmpPY1JBYWN1UFl0VFZaWTlRKzRvWXBUK0ZDcXAwQmtJSjRidjZaQlQ3aXIz?=
 =?utf-8?B?NHdFM2NBUWdETjY2TFlsTzlhb293Qm14UG1nTUFaelgvZWZrNSs1cTlwU1FB?=
 =?utf-8?B?VmpqSlZKZGhiRUxFQzd1T2pzZWFQdEpvTk0wa2Q4a0hFRGFtcmFqaUdHS0ND?=
 =?utf-8?B?SnlJOThHVVV0NUMwYzRFVzBNWGk3Y2dGMmp2TG5mVFdKRVh2dzQ4TVJPSU5S?=
 =?utf-8?B?OG1mdXo0TXdwUFYxeVZ5bTNDK1QyUk81MndVNVU3UXo5OVIxNXYweG1NK2tN?=
 =?utf-8?B?Ti85RVBYQkQ1cGQ4bWpXc2ZYREt2RXBQMjBIZmtITTdSa2IyVVhmUE4rcGxy?=
 =?utf-8?B?QmRjYVVIWCtJVGRIR3Q2L215QU9GK1U5MUhhdVZ6MGhONFZDMVdpdCswSjJH?=
 =?utf-8?B?WHZXQWRwNEpsSFlEbEZQNHJqUHVSQkdtNDZzOHBmYVdjeWd6ejA5TXZYWFVW?=
 =?utf-8?B?aVMyQXhVRHV4MFIvZ215R3VVa1FteGxoc2xkRXNBU2RzWVdISzJqeWdNbVI3?=
 =?utf-8?B?eHZSQTlOa0pWaWdueXRsTG9VdWtQNjJqblpGWlJ4UkJVUWM4bDZQSHNJdmEv?=
 =?utf-8?B?UDNxTzdFU2IwSnJYK25IRW91c1hBM093RUUxYXJieC9NVFp6QjFheFdrR3Rt?=
 =?utf-8?B?emI3a1B3dE5RUURoS0p2R0UvSmxQQ3d4N21sdWtLeGlNK3gycW1GYVZUVjZ5?=
 =?utf-8?B?c1FtODRXeVl6ZitCdVQzK3lGWFNQSS9sWVRDemgrUU1xdEs3TVdJNEU5b3Jp?=
 =?utf-8?B?M2g0MlE2Wit6TnIvTWY2Z3MwcEZuUG9pdkFZOTlIRFNEUitUaGt5OFRhQUw5?=
 =?utf-8?B?c0t1WHR4NjNYbUNvVnZLYngwUnpWaEc1bXhXRGkvVFBYc0dkZ2sxbDFwQXVl?=
 =?utf-8?B?U1ZlL0ZZQ0Nsd1k4UlJtNXI4TTJHMmxlTGlSTkovNDZ4UFlHWDhaNEQ2L29W?=
 =?utf-8?B?cUoxbVc3VGFrUUovNUUzanQrNjZDZjB2dlBQbFRHUVptYXk1R3pYNWxxOFgy?=
 =?utf-8?B?STlwaHF2Q1A2a0FaUy9iT2xQRVJkelhONm81a1hocGlXcG56akJWK1BzNGt3?=
 =?utf-8?B?cDZKV2dmTUcyTUpzbGhFZUNEek4wWHFRYlhRSndkNTVHU08vcjVyTUR4TmpW?=
 =?utf-8?B?S0s3cnVJWWlYMGFwQ0xtOVlaR1hwanhuN1NQMzRhWlNyUE1WaHViTVVvaE40?=
 =?utf-8?B?cWFLWnRuZ2JZZmtteksyb1pmMkxKbHN2RVA4cDVldlJ0QTBSR2dPaGllNUNh?=
 =?utf-8?B?eXRnYnVJeWRleEJoMjY1bDM3UUpWUmM4OEh2WkMrNlRjNEUxWHdpaGMwaVBT?=
 =?utf-8?B?R05RbzBNZW1zaktmZkw4bnhUUmpWT1ZjMURvOUNMWVZyTEQvaGNZcUx0eWE2?=
 =?utf-8?B?WEs2Zk9IUWRzT2FveE1MY3N3ai8xVDh4QmVjbkU3ZTdvU2oxY1lLR2x3MUdz?=
 =?utf-8?B?ZXdSd1IxUFFlNTZpM3k3ajRMdVR5SmJGQ3ZFWTRUZTd3Q2ZKM082ZG5DbTdO?=
 =?utf-8?B?SlZrWXFMT0taMU1NLzdHNWlaWEpiN05MMHQ3TnFTZEdSd0pFT0NZN0tTaXVG?=
 =?utf-8?B?SVNjaWtXdG1ZVDVHM0NLN1VOZWx5V29BZWlnVmdMalZTL2xEZjVFd2plbXpF?=
 =?utf-8?Q?e7dmDDbGxZL+Ez1tjvmUFOvIjZsJKc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 18:28:08.2378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c7914b-3259-4150-ee1b-08dd625ccdae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497

On 3/13/25 13:48, Roger Pau Monné wrote:
> On Wed, Mar 12, 2025 at 03:50:17PM -0400, Stewart Hildebrand wrote:
>> Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If firmware
>> initialized the BAR to a bad address, Linux will try to write a new
>> address to the BAR without disabling memory decoding. Allow the write
>> by updating p2m right away in the vPCI BAR write handler.
> 
> IIRC it's only 32bit BARs that Linux will attempt to reposition
> without toggling memory decoding off.

This matches my observations as well.

> For 64bit BARs it will in
> general (unless pci_dev->mmio_always_on is set) toggle memory decoding
> off and then update the BAR registers.
> 
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
> 
> The addition of need_lock would better be done in a pre-patch.
> 
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
> 
> If Xen now handles BARs writes with memory decoding enabled the
> message can be removed.  It's only purpose was to signal this missing
> handling.

OK

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
> 
> I think if the guest explicitly avoids toggling memory decoding Xen
> should also to the same, and not touch the bit.

OK

>> +            /* Call process pending here to ensure P2M operations are done */
>> +            while ( process_pending(current, false) )
>> +            {
>> +                /* Pre-empted, try again */
>> +            }
> 
> I'm afraid this is not how I would expect this to be done.  We
> explicitly do the p2m modifications in a deferred context to avoid
> long running operations.  We should continue to do so to perform this
> unmap + map operation.
> 
> I think you need to introduce a way to queue an operation that will do
> a map + unmap in the deferred context processing, or signal that after
> the currently queued operation finishes a new call to modify_bars()
> should be issued.

Yep, this makes sense. Will do.

> 
> It would be nice if we had a more generic way to queue guest vCPU p2m
> (map and unmap) operations, but that's likely to require a much better
> interface than what we currently have.
> 
> Thanks, Roger.


