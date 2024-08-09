Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41E94C913
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 06:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774554.1185022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scGxc-0005zB-TH; Fri, 09 Aug 2024 04:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774554.1185022; Fri, 09 Aug 2024 04:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scGxc-0005wU-Q5; Fri, 09 Aug 2024 04:10:40 +0000
Received: by outflank-mailman (input) for mailman id 774554;
 Fri, 09 Aug 2024 04:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0+Y=PI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1scGxb-0005wO-QF
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 04:10:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 542938f3-5605-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 06:10:37 +0200 (CEST)
Received: from SJ0PR13CA0043.namprd13.prod.outlook.com (2603:10b6:a03:2c2::18)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:10:33 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::17) by SJ0PR13CA0043.outlook.office365.com
 (2603:10b6:a03:2c2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13 via Frontend
 Transport; Fri, 9 Aug 2024 04:10:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 04:10:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 23:10:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 23:09:38 -0500
Received: from [172.23.60.101] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 Aug 2024 23:09:37 -0500
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
X-Inumbo-ID: 542938f3-5605-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWM/ajW7Op6/mWweS5kVpMSrhtu1WXPBTnbW10PcorXcr0VVcVmqYCmeGH5j7Oz0etvxXQssHRKBKjZP02Gtc8p5U2oqpnJ8u/pYwZsuPz2pl0D+GkAgw/IRHBCT0nyKJmj2L8tt0D1/ChotK+BxPf9KhnUnqYqg4jFlwGiCabu3CdCl8sySOWUGDY6keEvnvN6syVrMQcBVLr0jR+8p1hOKuPlhyyYCzf/LKsHERs5DFqiS3mC+wz+js2dVWYGPACWrFPjCwhFUeEDjaiER7zRX4Si2Oaj6iszm1QDNlquT6165rl8I8MdtQhQR5wOuECr7TMUFvYcfLuHaqVHeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23ey+hy1quDZO9gtdq1bw4Z7pyw4Gk+iRPKGnPVKghY=;
 b=BprUAd8m8eDhRx49dKn2ltTQs99joCzihSETFiSZuoL3LI7Tf2S8Ghs6zdGtPQXGO8zSlxxoiYxAY9O2J1wFd6c7013jq19S4moenGvlMsPKiQk79cagz8XMKzwScuOmFOp08Bf5U/3CywR+aKz73rjGdjzebnp5vbKE4sqj7sIKODmaQl/9UfnlfWguAmS90CLLET8C8uTEaKfyYFTRvBegPntfiaeRKncjGWPk4WDw8hvsMlwb86x7BQ+NZif6qaTyH/GuNqFMxH80bqVCqrCVTy+SIZC50NUb153Y80qoKoX7MGk5XFIjdlA7x21/dEwIIcT5Mhs0Iw2gM9wAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23ey+hy1quDZO9gtdq1bw4Z7pyw4Gk+iRPKGnPVKghY=;
 b=leDaYoYqVUqMJ32zEJ4hwBesrnWqfQYDNrisRvu9WwCybjVG0MyJW62RI+F+Kx/7fExlMrkk2K9/wJaOdBCNPPQg5UI7KCtXzG8iSx7C2fxySbHmt5Jm/rQbFmyeD2Jjqsnk7qxBBWOfrKOvuuxNN854LT8qLxHl1vB37sf5B1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <62523c87-9c93-4b71-a71b-e852fce3136d@amd.com>
Date: Fri, 9 Aug 2024 00:09:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/msi: fix locking for SR-IOV devices
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20240807052011.582099-1-stewart.hildebrand@amd.com>
 <1b0475fe-4371-4bf7-a469-aa580648f210@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <1b0475fe-4371-4bf7-a469-aa580648f210@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|MW5PR12MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cd1f91-927a-48ec-eb58-08dcb829366c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bk5jZEYrMURsMExaT2lnUTRSWU9YMm9jZkVyVFNIditBazY3UFZPai8vQ1JD?=
 =?utf-8?B?TGx3K1BWME4zZE9MSDFoQnN5bFd2OUUzSS9zY3dqaFA1RXE5V0ZqL1FJU0hW?=
 =?utf-8?B?eGxTU0o4OXJudWVSVnNkUTM3YUFNa2FER09jMWNyakxhSS9SZlMyOVJ6MWJL?=
 =?utf-8?B?MGpaTEZDK3hDdFAzOVI3OGdCc2dnNzV6MnlNUklzOXZxYzRaTzZHUTNoSW1q?=
 =?utf-8?B?ZWpXSnN3QVlXQVJmVjYzd21YSjlsTi9mZTZMM2xrMWJLUCtUK0xHM2hvckRL?=
 =?utf-8?B?dUdyQzNRV0NNZUlDam13NkpPRk5ma2lEVXRuZFd0TGRGbkVTay81eHllbDE4?=
 =?utf-8?B?TnQzdC95SjZCSTkwR3llQlRhWnprYjA2WnZNakVNeWdOdm1YMmdaZDVrU0Fr?=
 =?utf-8?B?MXdEODlGOEdWMjZuZ0s5OG1EQzRLUDZKc0ZrenQ0aWNuT25FbUl0RWtXekd1?=
 =?utf-8?B?ckc1bWJBcStZRk9Rb05WMmd5UFhWZHhwSExocGZWaDE2UjR6dmF2ZHhmNG9a?=
 =?utf-8?B?cVlldEpXajJXd3JqL0NrMUtwRU1PM1RrVk9BLzAzcWRQR1pjNjlNb0lJOGYw?=
 =?utf-8?B?UWo1WmNBTTJrT3hyUG5mRmlockpGOFlNclB2Q0JOaEIvZEgycUtqZTRUcVRk?=
 =?utf-8?B?T0xNd1g3UXV3NkJ4RVRSWHBoM1Vqd0xFWktkaEVsTzFCcDNnNEVwYnpYc3Zl?=
 =?utf-8?B?R0RzODVxaE51dU1ZUUgrclBCQUI1NnpPVEpIZGNSOHdNeUtTZml3REd1MmEv?=
 =?utf-8?B?eWIvL2FQUWFjK2JCR1MrbU9ZMFdFQ3ovR3h0cVFsOFp4U3VYdWt1a2d5OVJp?=
 =?utf-8?B?clNhKzRwYmVzQmxHLzZEVXJoOC9rckpJeENxb2R3MUwrbUtuMVYvdkRRMTdK?=
 =?utf-8?B?dHFvMkpiZ3dFamVpQjRIVnJNQ3E4MW10cnNqQjEvZ3JNMWJidFEzZzVZdVZK?=
 =?utf-8?B?eGFqRVBGRVpxUWJTNVF0UW5kTm00R3BKakM4eEMrZmRHSDJKWXNhZVhVcUZI?=
 =?utf-8?B?N3prRHd4ZG5WVUtYVkc3RXZzNVV6V0tMSnRKMEg2bGluZ3FUd1ZHZElkUVlW?=
 =?utf-8?B?M2NLdEpSNCsvZXJ5ZUV4ZWJPUWlVQ1ZoZW1MMlFyelRSb1hvRzNQcjUrZUZY?=
 =?utf-8?B?dWhkTzRYUEVVMUpoSnVkNksrdUxxc0lxN0JkdkRZWWxWT3B2bzA5ODNpbGs0?=
 =?utf-8?B?THBORzdqMWZCakhJM0NWQXNmbHI5RFMyMCtIOWdtMVZwTVB5Tis2QXIzKzZQ?=
 =?utf-8?B?MjU3K1p5RlpGRVNoS2wvZ1gwRzhVMVRVOWhWa0FubW82OStyTStHNE5aZUNQ?=
 =?utf-8?B?a1pLUU9iOVdZOUhnRGUwaTREbzBXVVFFS2toSllVYlpacEViK3U0Rm9vTWYy?=
 =?utf-8?B?SG5CWGlKanMvTVdhcUVRenk3cEQ0WTVJc2syL09QSjEwMHlUeFRlU0dVWXM5?=
 =?utf-8?B?anRWZVF1YjFrWTA1OHlmSEE0RjhDNHc0Q0ZwMW1sKzJBblBhNE5kdjNuZWlQ?=
 =?utf-8?B?V1dmbmVTK1BwNnIzTXpOVFRmZXAvaXBsQ0ZPSmY0bzZxUGFYMEdPOE1kQnds?=
 =?utf-8?B?NnpqL0x5cHp5TzgxUEJXMCt2T0MzdmUya0hQWjI3Rjg2NmRqcHhFemJ1RTNz?=
 =?utf-8?B?Z3g5Z3pySzhwRENEZGhmZ05BZENmdnEzRG5QckJvQWp5R2ZRVmZsaHZ1Vll0?=
 =?utf-8?B?eHArK080amR5Rm5Na0taT0lDMGl5MmVqOVlVOUJhUEVWT1NBbWt2OVAyKzhX?=
 =?utf-8?B?NzhyNjIxTTRmdTBjWTJMeUpHSGh4dXp4MzBEdmRHVnZ3V0pNMGl1Tk5JSHp6?=
 =?utf-8?B?MjVxb3FtSWo5N1VReVB2VDJkOG9nemtHcFhMVlhRcnI5VnYvdEUza3dqck0v?=
 =?utf-8?B?NGFzY3ZJTWlJRUZtOEtIcGtTcWJBdDZPVjByTzQ4T3ZzditZNTZQRExsNHVq?=
 =?utf-8?Q?BWWB8UM0g7C4cIfiS9s5jDOWY95lWS+g?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:10:32.4639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cd1f91-927a-48ec-eb58-08dcb829366c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652

Hi Jan,

Thanks for the feedback.

On 8/7/24 11:21, Jan Beulich wrote:
> On 07.08.2024 07:20, Stewart Hildebrand wrote:
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -662,7 +662,8 @@ static int msi_capability_init(struct pci_dev *dev,
>>      return 0;
>>  }
>>  
>> -static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>> +static u64 read_pci_mem_bar(struct pci_dev *pdev, u16 seg, u8 bus, u8 slot,
>> +                            u8 func, u8 bir, int vf)
>>  {
> 
> First I thought this was a leftover from the earlier version. But you need
> it for accessing the vf_rlen[] field. Yet that's properly misleading,
> especially when considering that the fix also wants backporting. What pdev
> represents here changes. I think you want to pass in just vf_rlen (if we
> really want to go this route; I'm a little wary of this repurposing of the
> field, albeit I see no real technical issue).

I like your idea below of using a struct, so I'll pass a pointer to the
new struct.

> Of course there's a BUILD_BUG_ON() which we need to get creative with, in
> order to now outright drop it (see also below).

I suppose this BUILD_BUG_ON() is redundant with the one in
pci_add_device()...

>> @@ -670,19 +671,15 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>>  
>>      if ( vf >= 0 )
>>      {
>> -        struct pci_dev *pdev = pci_get_pdev(NULL,
>> -                                            PCI_SBDF(seg, bus, slot, func));
>> +        pci_sbdf_t pf_sbdf = PCI_SBDF(seg, bus, slot, func);
> 
> I think this wants naming just "sbdf" and moving to function scope. There
> are more places in the function which, in a subsequent change, could also
> benefit from this new local variable.

Will do.

>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -654,6 +654,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>      const char *type;
>>      int ret;
>>      bool pf_is_extfn = false;
>> +    uint64_t vf_rlen[6] = { 0 };
> 
> The type of this variable needs to be tied to that of the struct field
> you copy to/from. Otherwise, if the struct field changes type ...
> 
>> @@ -664,7 +665,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>                              PCI_SBDF(seg, info->physfn.bus,
>>                                       info->physfn.devfn));
>>          if ( pdev )
>> +        {
>>              pf_is_extfn = pdev->info.is_extfn;
>> +            memcpy(vf_rlen, pdev->vf_rlen, sizeof(pdev->vf_rlen));
> 
> ... there'll be nothing for the compiler to tell us. Taken together with
> the BUILD_BUG_ON() related remark further up, I think you want to
> introduce a typedef and/or struct here to make things properly typesafe
> (as then you can avoid the use of memcpy()).

Here's what I'm thinking:

struct vf_info {
    uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
    unsigned int refcnt;
};

struct pci_dev {
    ...
    struct vf_info *vf_info;
    ...
};

> Seeing the conditional we're in, what if we take ...
> 
>> +        }
>>          pcidevs_unlock();
>>          if ( !pdev )
>>              pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> 
> ... this fallback path?

It seems we need another call to pci_get_pdev() here to obtain a
reference to the newly allocated vf_info from the PF's pdev.

>> @@ -700,7 +704,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>           * extended function.
>>           */
>>          if ( pdev->info.is_virtfn )
>> +        {
>>              pdev->info.is_extfn = pf_is_extfn;
>> +            memcpy(pdev->vf_rlen, vf_rlen, sizeof(pdev->vf_rlen));
>> +        }
>>      }
> 
> Similarly here - what if the enclosing if()'s condition is false? Even
> if these cases couldn't be properly taken care of, they'd at least need
> discussing in the description. In this context note how in a subsequent
> invocation of pci_add_device() for the PF the missing data in vf_rlen[]
> would actually be populated into the placeholder struct that the
> fallback invocation of pci_add_device() would have created. Yet the
> previously created VF's struct wouldn't be updated (afaict). This was,
> iirc, the main reason to always consult the PF's ->vf_rlen[].

Right. If info is NULL, either it's a PF in the fallback case, or the
toolstack invoked PHYSDEVOP_manage_pci_add, in which case we treat it as
a PF or non-SR-IOV device. Using PHYSDEVOP_manage_pci_add for a VF is
not a case we handle. We only know if it's a VF if the toolstack has
told us so.

> An alternative approach might be to add a link from VF to PF, while
> making sure that the PF struct won't be de-allocated until all its VFs
> have gone away. That would then also allow to eliminate the problematic
> pci_get_pdev().

I think I can add a link to a new reference-counted struct with just the
info needed (see the proposed struct above).

