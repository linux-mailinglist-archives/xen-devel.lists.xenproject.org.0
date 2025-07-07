Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E56AFB897
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 18:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035722.1408082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYogi-0006dH-Hd; Mon, 07 Jul 2025 16:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035722.1408082; Mon, 07 Jul 2025 16:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYogi-0006as-Ex; Mon, 07 Jul 2025 16:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1035722;
 Mon, 07 Jul 2025 16:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cN17=ZU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uYogg-0006am-Mn
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 16:27:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2415::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41dae741-5b4f-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 18:27:22 +0200 (CEST)
Received: from MW2PR16CA0066.namprd16.prod.outlook.com (2603:10b6:907:1::43)
 by IA0PR12MB8981.namprd12.prod.outlook.com (2603:10b6:208:484::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 7 Jul
 2025 16:27:17 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:907:1:cafe::ad) by MW2PR16CA0066.outlook.office365.com
 (2603:10b6:907:1::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 16:27:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Mon, 7 Jul 2025 16:27:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 11:27:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 11:27:10 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 11:27:10 -0500
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
X-Inumbo-ID: 41dae741-5b4f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7Ez34wsXaUcISb8gdMGJ7hUDwUIoO5yVc1Rjr2yfOa7786+kUHVA6xWQvKbKDE5upgOpVR0eGwu2/Fuah/uCok0eZGJtIF2fM28qvRlMFXaAjQKDnH1t9OizGPe8jee0MR8tZi2WmyVUKMfxcgNyeEo9wU0f73rt6D6oxTicpCe8/N8J7dB/DabZKoSaszy47OrpztEoLennzNmSLeBpZ3odR5H2GuacKKJMZyWqGGq2SQyvT+df5hj/BSKh6Ys6VOPF3xdY/wuXKeaVcIBc0p4SJ9v7iRPeKWIsxaS/HD2u6ZEcMEjQpI7Ueab8kP6l6OsatHzOTyEmME9RwKqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfdxjKWataCIs8GkUEaj0NJciQX/oRmXp2PhNGWNH5o=;
 b=e6Ql9GMh7YksgUc99UngFi2W31E6PGqNCqE6pqZLi6Rdn3tY2MRPID0L1uo7u7qkllNhAm/gBsDROdecKU1hIXhB+vD53tqYqQJmdQrVFLJ7ED33pDi277JgoRwofOCLixTBgjfxyi7m/nlfVwo1JAnAaFQ/bFHNanNPrW1oIuA/PNQ8acsMKKeKn3X6DAd9yHB7n6thsRfH+GzBbXcZpRQzsFNWhWQHqRRi1XIjac29nOGyozHC2DlOFlBmhqslt++tHhcDXWhS2gk7Lglf5v9HyXuar/GcBs40Isods6GwZPlA/tmbCsO1i/c2WD+UZJnJzCkvRveVrT2rJ+Om2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfdxjKWataCIs8GkUEaj0NJciQX/oRmXp2PhNGWNH5o=;
 b=ZymR5kjZu0QaFs8P2KDv6AVP3QbnGQ2nydUxvyYYl8GnWZM28MA+o3PpHPdxVrmrKMJLzxMf22fI4H3jBqIURX3E+l7S84e2bWIjqOMa1V5A3vrbbOdS+MvAH2VLMdoSYQKkyA3J2/wdoGF9ysRqsxq07fX3sS9riDCyEF98yIk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dbd4b08c-55d8-4a0a-b467-2ded3eb4e70a@amd.com>
Date: Mon, 7 Jul 2025 12:27:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] vpci: const-ify some pdev instances
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-2-stewart.hildebrand@amd.com>
 <aEFnmVotuGhR4Ti0@macbook.local>
 <ea8d1add-7a53-40eb-b0e6-8bf5c2b83c68@amd.com>
Content-Language: en-US
In-Reply-To: <ea8d1add-7a53-40eb-b0e6-8bf5c2b83c68@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|IA0PR12MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0816af-5f3f-4173-501f-08ddbd732367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjRMNWhhVG00eVBXSWNkOE4xc01RdzFVNEsydUxsZzFHSGZEWWh4dG5vK0pn?=
 =?utf-8?B?MDFsUmRKZytEWWlTODBOb0pnZ1p5NU1FUzBvL1FFZndQekNmUzNJa1FWeDZ4?=
 =?utf-8?B?UHR0bUkwUENlOEpuTTIvQ2FqdlJWRkN3ZnhLOGxDUWJyVFBwZTFmREJTRlRo?=
 =?utf-8?B?WmdxSmVLYWhmWWp0SUJUdGNXRGJ5bWFPWWZ4RElNTUl5V241YXMzUVJYSEpH?=
 =?utf-8?B?Nmg4ZXFHeTdZUExFdlBMc1h2Q2dXeU1rTTNZTHVMMExaYXltWmlZeG1QaHoy?=
 =?utf-8?B?a2FTOVFwV1ByV1NRWGpTTU5PcHcwdHI0TGtha01CbU5ONjJudmVJSGRTRzVs?=
 =?utf-8?B?d0ozZFpPMkNMSjBEMFlEaXdQd0dyVlVVOGVqc3RidzYxOFBtUFlTOXJreXps?=
 =?utf-8?B?TEdIMktFcnQrQ1JiY3VUTEh1K0ZWSVA1Nm01eE5FNElJa3hNWU9FVk9COXFI?=
 =?utf-8?B?OVh2WHBJZFBQUGpwY0xFRm52OWZsUkR6ejJVQzI4L3JnUU55SGpwMEUzL1hr?=
 =?utf-8?B?LytUTVBsMWxlUkFrWmp3YU5Lc3RlUnYvSUVJWHRqWjVnMzEzeERmU05HY3Jo?=
 =?utf-8?B?MHBEWnFxazBrSTVXRTRuMW9rKzE1SCtFZnRoZlZCd1FYZHF2cEY0cDJWaklU?=
 =?utf-8?B?UTl0VXZkWk9RODh3aElCSE9OV3lCVlM3ZDZVTHkyWkJHcUpKbVRqbURCMUZC?=
 =?utf-8?B?a2RqYzZLcWtEYkxQakZjYkcxUEdxdXpPMjNvT1lPMFNWWWxTUVNDVnpKR2FT?=
 =?utf-8?B?ZnQrRHdCbXFXQnlKeFVBREk0TjlGTDVDdkk2TXhEbVdSY2daaHllMGRGbHBl?=
 =?utf-8?B?aHIxcWFOSG9PcnZEWVF4Z1FoV3EwcFBNT0JYVjVGUWg2WkhKdEx6YlVMRE5k?=
 =?utf-8?B?YkpHazVqRWd2TVcrNnRuVCtYdjd1SFdpVEF4ajBlYVBNaTNhanEzQzEvTDVt?=
 =?utf-8?B?bU1neXJZWnQyRzFzb0F5YmZqbUtaYitOK0wrSUw5NTd6M05kbG81NXJoYm10?=
 =?utf-8?B?UlJkTGRLeTloK3kyRFZDa21EcVRacjBXMHhzNFJpMnpMYjYzQThxNEJIWUVx?=
 =?utf-8?B?TGwvS3RHdlVxYitMOHBSelRWdUR6b3Q5VmdRNjRNZnhoKzYwQlp2UTByOGpS?=
 =?utf-8?B?N2xyekQvdURrRmRIY3FSOG9lMysySGd3Y203NmFWbGNnY3hxQ0UzUEJTWmU5?=
 =?utf-8?B?QXpNWFRjUUtxa09PanZka0svMS82T053MHhiRzNncXBNeXFiTGR3WXdxU3lF?=
 =?utf-8?B?YVFTNlF1aENLQ1JqVnQxczhRRlpNMXQrTUVtd0YyQWhWRFRwTStFVEtETi9I?=
 =?utf-8?B?c1VYS2FoUDEvZ2hHQW1qdVhTc21WanRveHVYTVZDbDJZODMrWXJxQ3VxME5i?=
 =?utf-8?B?K0tsVm1uYkI1UUZvcTF4MHM0VFR0T1AwNmpnWGw2Y1puS2o0Y1Y5RmFLd2Zm?=
 =?utf-8?B?VU1qaHhpWTY2VllLdXdXZVdNSkw1b0JPZEtyY1FZRFEyWGk5a3ZrWTRWMTZG?=
 =?utf-8?B?VDlmaEExWWE2Y2Eza250bXhnNXp2SE5hMWk3dlNqWFljdVcyaFhGcWltR3px?=
 =?utf-8?B?SUZpeFdKTTNHakJKbUliWVVpa2dESGhVSlRMWUZjZFRUS2x2Q0VaV3YvWVQ3?=
 =?utf-8?B?ZjBHT1oxdFZoNk9OY1hFYUdtVm9JQ204dk84YjQ1NkdMNkNrS29hQlVhM3hW?=
 =?utf-8?B?eUlpaUg0WkpVWFU1bVZsQTkzNXhBd1h5OXNkVFVVcmN4ZTdSRVJxMDlzVXdu?=
 =?utf-8?B?Z3lldDBIM2ZwUFR4WlVaOE14WHQyWGdEM0xlWS84Qm5xNHM2Mnd4RmVuY2pW?=
 =?utf-8?B?TGlSTlNCSkxpdm1FTTV2R0hLSEJGNVdBR1NTcnNjK1lSQ0VRT2ZxUE54MS9X?=
 =?utf-8?B?Wk43OGJteVZiaUk4dXJWdmQ0bWtXQjI5L0V4bFlOVTFyTFI0NHNoY3lmMVZL?=
 =?utf-8?B?NkRWemRNNVVDa080TEo3Z0x4cWdhL3VObVA3amdQMXR5NXZTeDF2cE5ML2Fv?=
 =?utf-8?B?NlBCQzAwdnZMZGlEN29rQlZiMDZISmNaK1IxMVVVdHJISE5FS096MFQrc1c2?=
 =?utf-8?Q?GA/Y6N?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:27:16.7993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0816af-5f3f-4173-501f-08ddbd732367
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8981

On 6/11/25 15:28, Stewart Hildebrand wrote:
> On 6/5/25 05:47, Roger Pau Monné wrote:
>> On Sat, May 31, 2025 at 08:53:59AM -0400, Stewart Hildebrand wrote:
>>> Since 622bdd962822 ("vpci/header: handle p2m range sets per BAR"), a
>>> non-const pdev is no longer needed for error handling in
>>> vpci_process_pending(). Const-ify pdev in vpci_process_pending(),
>>> defer_map(), and struct vpci_vcpu.
>>>
>>> Get rid of const-removal workaround in modify_bars().
>>>
>>> Take the opportunity to remove an unused parameter in defer_map().
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks!
> 
>> One further simplification below.
>>
>>> ---
>>> This is prerequisite for ("vpci: use separate rangeset for BAR
>>> unmapping") in order to call defer_map() with a const pdev.

I'm trying a somewhat different approach for the series for v2, and this
patch will no longer strictly be prerequisite. However, this patch seems
to be a desirable cleanup by itself, so I'll send it independently.

>>> ---
>>>  xen/drivers/vpci/header.c | 16 ++++------------
>>>  xen/include/xen/vpci.h    |  2 +-
>>>  2 files changed, 5 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>> index 1f48f2aac64e..e42c8efa2302 100644
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -175,7 +175,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>>  
>>>  bool vpci_process_pending(struct vcpu *v)
>>>  {
>>> -    struct pci_dev *pdev = v->vpci.pdev;
>>> +    const struct pci_dev *pdev = v->vpci.pdev;
>>>      struct vpci_header *header = NULL;
>>>      unsigned int i;
>>>  
>>> @@ -283,8 +283,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>>      return rc;
>>>  }
>>>  
>>> -static void defer_map(struct domain *d, struct pci_dev *pdev,
>>> -                      uint16_t cmd, bool rom_only)
>>> +static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>  {
>>>      struct vcpu *curr = current;
>>>  
>>> @@ -308,7 +307,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>>>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>  {
>>>      struct vpci_header *header = &pdev->vpci->header;
>>> -    struct pci_dev *tmp, *dev = NULL;
>>> +    struct pci_dev *tmp;
>>>      const struct domain *d;
>>>      const struct vpci_msix *msix = pdev->vpci->msix;
>>>      unsigned int i, j;
>>> @@ -450,11 +449,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>  
>>>              if ( tmp == pdev )
>>>              {
>>> -                /*
>>> -                 * Need to store the device so it's not constified and defer_map
>>> -                 * can modify it in case of error.
>>> -                 */
>>> -                dev = tmp;
>>>                  if ( !rom_only )
>>
>> You can now join this with the previous if, and reduce one level of
>> indentation:
>>
>> if ( tmp == pdev && !rom_only )
>>     /* comment text */
>>     continue;
> 
> Will do. I'll plan to keep your R-b tag for v2 since this is a trivial
> change.
> 


