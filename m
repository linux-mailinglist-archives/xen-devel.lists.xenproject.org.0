Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A542EAD5F16
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 21:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012121.1390658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPR88-0002mr-RB; Wed, 11 Jun 2025 19:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012121.1390658; Wed, 11 Jun 2025 19:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPR88-0002km-Nr; Wed, 11 Jun 2025 19:29:00 +0000
Received: by outflank-mailman (input) for mailman id 1012121;
 Wed, 11 Jun 2025 19:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTnm=Y2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPR88-0002kg-5d
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 19:29:00 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:2408::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5094a5a8-46fa-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 21:28:56 +0200 (CEST)
Received: from BN9PR03CA0233.namprd03.prod.outlook.com (2603:10b6:408:f8::28)
 by CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Wed, 11 Jun
 2025 19:28:50 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::c7) by BN9PR03CA0233.outlook.office365.com
 (2603:10b6:408:f8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 11 Jun 2025 19:28:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 19:28:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 14:28:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 14:28:48 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 14:28:48 -0500
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
X-Inumbo-ID: 5094a5a8-46fa-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBcoXqJ30zFgG2/6fjC8ss1VQTV38mpa9z8bXH+xuuWd4R/4t7laOvEkFxRFda8Cr3atIfDZE7eDeJUrYPkBW9SQ2CyjdlIJd7LVcNHIjsgPanQiBi4385fNt5+Ejvh+h4ZXh09OjPuRQledZQ2A+p5ztniTyC/jqu4CHrXh3fOZW08YR7Fc+dWckHOsIOS7Muq4cy0VIVfEziJVDkpuBdgFsKGB9NxP2HH19w5fryeGO4Q+SI3tPC9KhSJWmh/FBVrGkyLOnrg+64kcMeEgQoFICrDW9VufK9YDO/86dyybF/VJwflco9VaDk5QQH/95Hup5iaKw1gTZkmaKnqMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDN2m2wAUJcxcCZPJV6Hk6mHX4TefQKJ96kjWgv17JM=;
 b=ptHymneCSPic6a4laK2tG06blo/wKYirMnaXiNIS+sJIEX2Z5UFKsuiKwU6MvU/iueGtVtkdRxo22S4tgeUt6aw0grQI0JtoYiLfWCFG5Piotew8GbcVtxGv+bDzQe8gYSoO3MfxPnLm/xL7B13GXulXXkFZmn+SPe1t942yRo10g/HPdl91Uc/pdgYogAgDdxRDAGlGmWF5y/KGIO332O/82TtKZ5LON0Ax8eCLAk+Kp2J0ytLphXgApIuzHXu8sMenGI7XwlOzqp+7y4LWc9RzGLXIw9EYioaqBHp+VEs1WbwGycyY/6G+uxE5Ev/CoiYZr9z80MV+2N04UvOXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDN2m2wAUJcxcCZPJV6Hk6mHX4TefQKJ96kjWgv17JM=;
 b=YgBynW1IEOIZZULqB62GNf8kpn1tM+6vdoB1zfRPL/NhlPd/6N33Fd9f7cC5xpRRY2Ask5/5iNFiUAlIQ1Q1ypZO+jJkIDS0bT0AjshMuFJpehfSHdWe+M3mklOZgdM75K9609B77cOGNb53uuUCu9gcy78n9o/Hcy4bIkeYn70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ea8d1add-7a53-40eb-b0e6-8bf5c2b83c68@amd.com>
Date: Wed, 11 Jun 2025 15:28:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] vpci: const-ify some pdev instances
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-2-stewart.hildebrand@amd.com>
 <aEFnmVotuGhR4Ti0@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aEFnmVotuGhR4Ti0@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|CY8PR12MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a9b369-c4bf-4108-9be1-08dda91e3123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVp4NFcwczJObUtEUWc1MTBTQUtVVkllL0FRYzRTbGJLYWo5K3NXTWF6M21z?=
 =?utf-8?B?US9ieW9lN0FIcXI4WDJjS2JnVU1xaDM0Y1pTUWVybDN5WlhrOFVKdThBSWlU?=
 =?utf-8?B?ZGdUTHM0ZGZTck50MEtTVkZHK2ZubG9Dd1ViQmlSUk43MGIvN2VvOGhCNWUw?=
 =?utf-8?B?MjJUbzZGUWVDRjgwQ3pVSmNkbXRTVW1hZVBMZUVYS0Y3cnplQ2xnTnJFK1Bn?=
 =?utf-8?B?RUZBaVh0ZzBOaXJmQkpnVHZiTFdKWjRLMGluSElaa0xWaytLcGdRbUQ5R2Za?=
 =?utf-8?B?YUg4Z2NCeXEzZE9VUmx4b2VSVUE5dDQzOFk3d0JOWGxidEZaczlhdWw3b3pM?=
 =?utf-8?B?aGZuU1h2NUFXRUQwdDgxa1l5bUUxaEh3dTFHTHhlMXRoR1R2U3Fwek1MYld2?=
 =?utf-8?B?cmlMeWpLRmFXRkdiQ21VeEJva0Nmbk9EQkpxQzA2aVNUcEx2WjN4UzNMMHZj?=
 =?utf-8?B?NHp4YXVwME0wN1hwY0ppcW9peVY1S1lQS3hxN3o2dmtDS0lFYnZ5aXhTWFh2?=
 =?utf-8?B?WGxVRTVhZ3lFMTRick9nN1lFS2lja0t3azhZUzNKWkhCQkVPQUwvb3VtWmpm?=
 =?utf-8?B?YkdTcndJRTR0YWMwaFB2M0tXVUIyeFVjSjFnaVhuREh0QVlZRnF0TVIyRTJZ?=
 =?utf-8?B?amZPbno1ajYxdThwOXJGSVlSUktMK1o0RDlreXN1Vzd0aFpDaUt2L2RMdnha?=
 =?utf-8?B?cmVhcXBzVGJsZUdwbzlUSkwybEdLLzVVYWF3SHBhTkpXK1kreVdnZFEzWHRN?=
 =?utf-8?B?TUZEczlqZmNWbFdjS0dMYTBjMXkvMWM0UUo3TkhMLzE5RTFLNUF0N005UkMz?=
 =?utf-8?B?OEg2dlJCSW5VN2ttRy8yZmp2ZnUyMW4rRGJZM0YxU0dmT01mb1pJeHdJUmJJ?=
 =?utf-8?B?TlNLV2xOWFhHQ1FiOVNldnkxblJXTmxHSXF1WDNqNXd5bGwzRTdSRjhLQjQ3?=
 =?utf-8?B?cnhqZXNvS0EyMkkwNXplVi91d2pQd242SThwcUU2WU9NeUtpUGR4bjdtVis4?=
 =?utf-8?B?OGI1cnRkVWN3TzBSRDd1cWFBYzdScER6REZxeHkwUlZrc1lneis4VUtoc0N5?=
 =?utf-8?B?Kzc2Y1EySmZaOFFRTlIyL2dVcnMzaCthN0VIZ21VamZVZ2hhZ1VibG1zc1Yr?=
 =?utf-8?B?dVJLa3JhZFkzaGxZTXdDODlrenBxMy9sMjd6ZEhLclFaWEpQNk1OWU5BMDZs?=
 =?utf-8?B?YlFtL1hYbzJ5QTFvN2grSTQrQmFJNlQ0WGxPZEs3OExzd0pYVTF5Zmw3T1Jv?=
 =?utf-8?B?Z3Y3SFVZcEQ1b2hoZGxvNGRkM0MzQ1hMRmxqNXVaYlUxMVdFbE5lK1ArSkhj?=
 =?utf-8?B?eXN6emVUYnIvNVVFVFpzRTN0QlNSd0JlWDdSQXlpYjdTdG9kbXc1NERoTlky?=
 =?utf-8?B?Zk5oemE2aUxZL3pxM2crODhlcy9xRWRtSFFyallVbEdwQmVjR2w2ZlVKQ0Mr?=
 =?utf-8?B?b3dSV2NSS0xQS00zd2k3a0hxN2syNHZBblkvNzhnTWp0ZFJlZlc2MHBkSVhE?=
 =?utf-8?B?M2phRDNKSDg0bnM2VjRVYTRDdE5keEN5RjQ0V0tOdmxRbkFxNTZ6dnowRGNo?=
 =?utf-8?B?SUNVK1AzckRPTDhzV096UldEbVVBeHp6S284RVFObWlYZDFObjlqejdzUmp2?=
 =?utf-8?B?ZXlZbWFVa21ZaUxFa2M2MktaNVpib2FWcjdGSFBjQlBXSXc1VmllVlY1Wkk0?=
 =?utf-8?B?dytHejRkbVlGdEpjd2FIUEhLTzBXY1FFZmVYVlJBMHc0QTFMTnowbURLeEZD?=
 =?utf-8?B?bkxiZThlWWlLUURtRHpjUkFvUysrcHBPT0lPcmlLOExzNFNQcVo0YmthNXcz?=
 =?utf-8?B?Q0ZzMklzN2ZuRCtOalNmYnZLS3AzbC9ROElOYktyZE5idXF1RFY0K3ZqaWVn?=
 =?utf-8?B?aWZHWlc1dUVRNFh0eFJqVjZZUTZCeWhrNHg2Z2UvME1NNjg5dFp5QzZJMHhE?=
 =?utf-8?B?QnFhZXRsY3JEaUJ6bE1oeTFlUTFrZkd3aWxsUmxPbWZrZW1jZHMxNTZqT3pv?=
 =?utf-8?B?blBsWkpDMlZNcHZMclN0Y3lZNG1pRWIxVE00a3l4ZDV4TFRrUVdqaE5GNlFh?=
 =?utf-8?Q?CVbKjY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 19:28:49.4400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a9b369-c4bf-4108-9be1-08dda91e3123
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8300

On 6/5/25 05:47, Roger Pau Monné wrote:
> On Sat, May 31, 2025 at 08:53:59AM -0400, Stewart Hildebrand wrote:
>> Since 622bdd962822 ("vpci/header: handle p2m range sets per BAR"), a
>> non-const pdev is no longer needed for error handling in
>> vpci_process_pending(). Const-ify pdev in vpci_process_pending(),
>> defer_map(), and struct vpci_vcpu.
>>
>> Get rid of const-removal workaround in modify_bars().
>>
>> Take the opportunity to remove an unused parameter in defer_map().
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

> One further simplification below.
> 
>> ---
>> This is prerequisite for ("vpci: use separate rangeset for BAR
>> unmapping") in order to call defer_map() with a const pdev.
>> ---
>>  xen/drivers/vpci/header.c | 16 ++++------------
>>  xen/include/xen/vpci.h    |  2 +-
>>  2 files changed, 5 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 1f48f2aac64e..e42c8efa2302 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -175,7 +175,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>  
>>  bool vpci_process_pending(struct vcpu *v)
>>  {
>> -    struct pci_dev *pdev = v->vpci.pdev;
>> +    const struct pci_dev *pdev = v->vpci.pdev;
>>      struct vpci_header *header = NULL;
>>      unsigned int i;
>>  
>> @@ -283,8 +283,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>      return rc;
>>  }
>>  
>> -static void defer_map(struct domain *d, struct pci_dev *pdev,
>> -                      uint16_t cmd, bool rom_only)
>> +static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>  {
>>      struct vcpu *curr = current;
>>  
>> @@ -308,7 +307,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>  {
>>      struct vpci_header *header = &pdev->vpci->header;
>> -    struct pci_dev *tmp, *dev = NULL;
>> +    struct pci_dev *tmp;
>>      const struct domain *d;
>>      const struct vpci_msix *msix = pdev->vpci->msix;
>>      unsigned int i, j;
>> @@ -450,11 +449,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>  
>>              if ( tmp == pdev )
>>              {
>> -                /*
>> -                 * Need to store the device so it's not constified and defer_map
>> -                 * can modify it in case of error.
>> -                 */
>> -                dev = tmp;
>>                  if ( !rom_only )
> 
> You can now join this with the previous if, and reduce one level of
> indentation:
> 
> if ( tmp == pdev && !rom_only )
>     /* comment text */
>     continue;

Will do. I'll plan to keep your R-b tag for v2 since this is a trivial
change.

