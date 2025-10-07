Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84993BC1DD2
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138975.1474545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69HN-0003tF-Tl; Tue, 07 Oct 2025 15:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138975.1474545; Tue, 07 Oct 2025 15:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69HN-0003ql-Q7; Tue, 07 Oct 2025 15:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1138975;
 Tue, 07 Oct 2025 15:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixXp=4Q=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1v69HN-0003qf-0b
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:07:05 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4723298a-a38f-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 17:07:02 +0200 (CEST)
Received: from BL6PEPF0001641E.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:e) by CH3PR12MB9283.namprd12.prod.outlook.com
 (2603:10b6:610:1cd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 15:06:58 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2a01:111:f403:f901::8) by BL6PEPF0001641E.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 15:06:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 15:06:58 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 08:06:57 -0700
Received: from [172.21.123.104] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Oct 2025 08:06:56 -0700
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
X-Inumbo-ID: 4723298a-a38f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXXi70D4wqEKApsFnQC8ZTMSMgCmw9huwObfJ72i0jR372lm+CYJLbvfwgCtDSyS2gQLQ9wqQKgN0R4hkwk/j4t52oAUQU6khESoQtvHixn8B4fXAhPbWfpLDzbeG2NnMpn1ckg2bqxjTEnTJlkS/cFQCdlKmnKnaGxih7NGcwzm0ZMG+0mTGksFYNnl/jjAGCJ1hY3TB8uR9bqlyTEqrWXvZl0G5J26FeY71FlDFjqx+kEzLeQwqXsUa0iukXCGnRr3rL/4TqaYzMVv0k0CVPoc/fUvmvJDQjEowNttxABV43EqU+AGaIONw/DTJ8aFMozmUK6LrgURLMmv2tdh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sXg70Q/UxkdV1eGcFwuz1yUz0L6lIA2PnZMvtSSfTk=;
 b=TOVaPcLfCbjcc5YENfzjz6+LD9GPWPbtleIM1IzO1jNYe86GuP+5lX/Sg/XqfuE1jMBLwEeLcNveiwmtPRm/RxiRM66WJy4rKjUwICLPR/9FXGwKO6UPn2GOocKh4O7fEosSUZxKujR6XancGZ5YP+hjkX68Rem/irgME5z2Q/0a/1BOlyO6xmKWedEDSshiaYQtM1kAqRi26jU8V2Wwjqk7b58KtevG2HgloCwyXsbyoWvpfbbNLP8vFteeOwM9M0n2uujFjg7I3irpC6WnLYMOmOZrcLBvEtv73jhH58yRKBPPLso3v3F33WI231TYsCKRHRCsL61fiyISzloc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sXg70Q/UxkdV1eGcFwuz1yUz0L6lIA2PnZMvtSSfTk=;
 b=WcjIYUBeqRTwq6vG9ljJa98PxZCfzQz8wlLh7KLYoD6BfOblixwKa2fx+J5WINYc9N+yLvcpV0lc9EDPTwoWTOWYjhe/53uBGPzcZHSZDzCL1keMFXJcLw5Vh7Fiv6nvDjgotnVA8xjfTNI30NB0cMyTS0iyVxCspxXt3Q4WV/M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b3ef3442-574e-41b2-9381-deba0f61dd60@amd.com>
Date: Tue, 7 Oct 2025 11:06:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <2d1737a7-58e3-48e3-ac16-1bda3947c929@amd.com> <aON72Sq6ZJ6y95DI@Mac.lan>
 <b5cdb1e8-0543-4025-b95a-eb57ac51caa8@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <b5cdb1e8-0543-4025-b95a-eb57ac51caa8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba90796-4432-4985-357e-08de05b32923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVJ2SlNyV1BqUHRoelc1R2laYUI0cDZtVTZ5Y0laYUE5NmdoR2Vad29FM3cr?=
 =?utf-8?B?Vk50ejRJeFhLMjNHYzgwV2RwVk5IMFVtNzZOOEdTblF6emJIa1hWS0Z1WXJR?=
 =?utf-8?B?T01TWlR6bmtQZk1nQXdlaHRDSVRLb0c3UjVxZFE2Q3orN2NiZmVZT20ycGpV?=
 =?utf-8?B?RFdpdU81Zkl6SlNOaGUrQ093eksvYzJKL2M2dEMvak5CTmxML1RqK1RNRm9E?=
 =?utf-8?B?cGEzUlFoZDJtaEdVSDFvbEdGbmFhV1RCK2tTSUFlSVpJWFlZTHE2ckdWaTll?=
 =?utf-8?B?THpQeklCMGdDYmVNaC9Gc0p6cXV1aFN4YVdONG1FUlpDL2owdGVMWm1RWEtt?=
 =?utf-8?B?NUVvYnF4cjFaUWFncDBrYVJseHpNaVpCNlowSEYxdlVOR0dPUHpOYUZ1ek1M?=
 =?utf-8?B?SVRLWksrS2E2a2t6UndqczlpOXNlaFo1TW5WVDBvUWhBdTZQcjFoSU9GeTl3?=
 =?utf-8?B?N2tBSTgyNWE1RE93blhGZW92emx1ZnJhR2JTUEFUN3lPdXZVaTZZbVdSMHRL?=
 =?utf-8?B?YkdGbnFoWDdKeVJ1eGEzTTluajJpSDJibUpLSTl0cU1RRlhxeGR1VDFzaVcv?=
 =?utf-8?B?bTNGNXNYTlVEdlR6dFhRbVhXYWRUMEJvZWg5VXJXOUoxOUdzSWlIYm9ScEor?=
 =?utf-8?B?YlUzdVdnTGx5ZXUxcWpsYnErWXJlUlBad0VBRVJlODkzODU3VG4wNkNQcUkv?=
 =?utf-8?B?d012eENqTTl0bnlBTDZvV3RXWXA3RmYzZE02WVFDOUxKZGYyU3V2TzlyVzlw?=
 =?utf-8?B?VFVRTjhyeHRDbzMwa2hvMERTVjdtYkRWRm1XMjhvM2o4dDFzbUxpb25OR3p2?=
 =?utf-8?B?b3lsUVRoUkdVWDF3VThoeWNoWXc4a0tTYnlKS3ZyN2JqNlNNcmUwVzhIa0Mr?=
 =?utf-8?B?U0pmelRGUkptN3QxaG83eE4zQjAvNHhWUWloTVJoUm9aQ3BMQWp6dml4aWo0?=
 =?utf-8?B?VWFOWG9Ba3N4akhCZEg5cUhBNjdlYmZpS2lxQnlPVTdZUS9OV3V4bXZqanRw?=
 =?utf-8?B?T2JuYWRtNjcwOXB3dllTTHRUTUVMRnBHcWh4d0RiVm5sNEVSb3IrTDdrL0Mz?=
 =?utf-8?B?QjAzOVkzTEdrb1pzUUVaZjd1SVgveFVxOHd0YTAzMzhTV2UyelF6QlpCUFRD?=
 =?utf-8?B?QU9xSGxibjlzYWN3NU8xWW9rbEYySS9STkpNczhzZno5c2dnWTgvTi9rYXV2?=
 =?utf-8?B?YUhvd21DamViWlZvYzlUem1FWGs2a24ydkJIMmxHSXhsbjlrVHdqSDlObGhF?=
 =?utf-8?B?ZW52TmhtOVMvZEZUK0ZXdVh3Umt1L1Y5aTYrK0N3WWp1TlZHN3ZMemRyMklV?=
 =?utf-8?B?cGs5ZTBnZ1ZRamJUaVo1QXBpZDFJa0ZERlN6RFdFREhSN2Iyc0h1bDJQSWdv?=
 =?utf-8?B?N3BvTG43SDYvSGdsek5NZkhWcFFaSG9tYjRJWDdvRjNCTFlUdUxtMkFlbmZ3?=
 =?utf-8?B?RmdkUjN6aDhMRS9ZK3oyMkpBYzlzODJ3ekF3ZElCSGpFeEw1Q21OdEh3NHJk?=
 =?utf-8?B?c3orUWs3UmNTQ05VdEZ4UFZDdFhEbXJjZHcwalRXT3NDcTJ0SHBKVXBnMnlo?=
 =?utf-8?B?Nm5sRlRKOUZBM0k1Q1hqUVlZNG5HV21PdVlUWkxDK1NHa2lISnp1b3dFRHV5?=
 =?utf-8?B?RFBpand2RDVRTnJ5eHB1cjFPZ2h2MnNNcGZaUll5ZmU3ak5iOWJPb3JBWkRU?=
 =?utf-8?B?TnB0bFcvYjRWK2g1MEw0RXZYaWlCL2hjM3JBTFE0OWthczFVM3NwcnVGUlhG?=
 =?utf-8?B?SWlaMkRPZlZXUUVaWnU1cnc2THZMTktVbmY3UjdvNGV3R2JRWk82elJKU0dw?=
 =?utf-8?B?NkRNdzVhY0pUN2puNXdTR0FrSU50N0ltdFhmVDkxU3dqMEFIOEc5Um50TFFP?=
 =?utf-8?B?dVcrRWdyaVJpWWJDbU52K1hrUytQYklrVFlTUnUwc1dVVUNRa3BOZ2ZqMWV2?=
 =?utf-8?B?RjdQT01WaHBNb203cXJpTmVVQVB3eDRLTXNxLytnTHlYaVh2VEtGOHIzQk4r?=
 =?utf-8?B?UUtVRUFGZXlWSjJOUkNSaGFTRkVkMHFhTlZDUWRkQXd5M0NibzhZYVpnSDgw?=
 =?utf-8?B?MlBhUTVxRkJWbDd3dVl3SjZ2Y0FmNyszMUR1WU5UbFprK0dIejJ6TDMwcDVR?=
 =?utf-8?Q?0ezc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:06:58.0200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba90796-4432-4985-357e-08de05b32923
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283

On 10/7/25 10:56, Jan Beulich wrote:
> On 06.10.2025 10:20, Roger Pau Monné wrote:
>> On Fri, Oct 03, 2025 at 11:29:40PM -0400, Stewart Hildebrand wrote:
>>> On 9/29/25 04:41, Roger Pau Monne wrote:
>>>> I've had the luck to come across a PCI card that exposes a MSI-X capability
>>>> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
>>>>
>>>> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
>>>> still use the address of such empty BAR (0) and attempt to crave a hole in
>>>
>>> s/crave/carve/
>>>
>>>> the p2m.  This leads to errors like the one below being reported by Xen:
>>>>
>>>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
>>>>
>>>> And the device left unable to enable memory decoding due to the failure
>>>> reported by vpci_make_msix_hole().
>>>>
>>>> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
>>>> tables are usable.  This requires checking that the BIR points to a
>>>> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
>>>> target BAR.
>>>>
>>>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
>>>> EPYC 9965 processors.  The broken device is:
>>>>
>>>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
>>>>
>>>> There are multiple of those integrated controllers in the system, all
>>>> broken in the same way.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> Cc: Jan Beulich <jbeulich@suse.com>
>>>> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> While not strictly a bugfix, I consider this a worthy improvement so that
>>>> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
>>>> capabilities.  Hence I think this change should be considered for inclusion
>>>> into 4.21.  There a risk of regressing on hardware that was already working
>>>> with PVH, but given enough testing that should be minimal.
>>>> ---
>>>>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>>>>  1 file changed, 45 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>>>> index 54a5070733aa..8458955d5bbb 100644
>>>> --- a/xen/drivers/vpci/msix.c
>>>> +++ b/xen/drivers/vpci/msix.c
>>>> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>>>>      if ( !msix )
>>>>          return -ENOMEM;
>>>>  
>>>> +    msix->tables[VPCI_MSIX_TABLE] =
>>>> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
>>>> +    msix->tables[VPCI_MSIX_PBA] =
>>>> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
>>>> +
>>>> +    /* Check that the provided BAR is valid. */
>>>> +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
>>>> +    {
>>>> +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
>>>> +        const struct vpci_bar *bars = pdev->vpci->header.bars;
>>>> +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
>>>> +        unsigned int type;
>>>> +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
>>>> +        unsigned int size =
>>>> +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
>>>> +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
>>>> +
>>>> +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
>>>
>>> This assumes a type 0 header. For type 1 headers, bir values 2 and up are
>>> also reserved.
>>
>> Right, but those BARs will be set as VPCI_BAR_EMPTY for type 1 headers.
>> The check here is to avoid doing an out of bounds array access, the
>> check for validity of the pointed BAR is done below.
>>
>>>
>>>> +        {
>>>> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
>>>> +                   &pdev->sbdf, name, bir);
>>>
>>> Nit: placing the cleanup label at the end of the function and using 'rc' would
>>> make it more amenable to future uses.
>>
>> The issue with that is that we then end up with a structure like:
>>
>>     return vpci_make_msix_hole();
>>
>>  error:
>>     xfree();
>>     return rc;
>>
>> Which I don't like much because of the double usage of return (it's a
>> taste issue TBH).
>>
>> My motivation for using a goto is that they are conceptually the same
>> error path, but we provide different log messages to aid in debugging
>> the issue.  Otherwise all checks will be done in a single condition.
> 
> I agree here, yet I'd like to point out that (iirc) Misra wants us to use
> only forward goto-s (which imo is a mistake, but I don't expect they're
> going to change their minds). So flipping where the label and goto are
> may be desirable.

Aren't we planning to deviate rule 15.2? See [1]

[1] https://lore.kernel.org/xen-devel/7e2993c68fda95d1eda6fd136750fcba@bugseng.com/

