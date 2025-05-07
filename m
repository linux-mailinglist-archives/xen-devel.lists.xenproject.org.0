Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D002AAAE0DD
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 15:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978573.1365326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCezN-0008TG-II; Wed, 07 May 2025 13:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978573.1365326; Wed, 07 May 2025 13:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCezN-0008QW-Eu; Wed, 07 May 2025 13:39:09 +0000
Received: by outflank-mailman (input) for mailman id 978573;
 Wed, 07 May 2025 13:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqG7=XX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCezM-0008QQ-DZ
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 13:39:08 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2409::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a201aa43-2b48-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 15:39:00 +0200 (CEST)
Received: from SJ0PR03CA0256.namprd03.prod.outlook.com (2603:10b6:a03:3a0::21)
 by CY5PR12MB6228.namprd12.prod.outlook.com (2603:10b6:930:20::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 13:38:53 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::36) by SJ0PR03CA0256.outlook.office365.com
 (2603:10b6:a03:3a0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Wed,
 7 May 2025 13:38:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 13:38:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 08:38:52 -0500
Received: from [172.31.225.170] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 08:38:51 -0500
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
X-Inumbo-ID: a201aa43-2b48-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyjDWiZH860BBiOmELfuX47Dtos3uKKODPEhs9HRRMfQGpEsGCxUqwPwheMnfMKlTR4PU+fRX+RLQtgeCtt8jN+ovz1KiEAsFsOGFrMKgJd20hsFxBeL+OcE1BltABKwmoXoBehG9O5YNAzOD2xL1idYTafgbQ7ZjOjzbVRAFwduNf8a5T+14CPAVnNk1TCZ2TC7HWOBFaFcaVka+307/c+y4fMKWt+QpyYAQiN1dEGix/9j/KAtnL43tkZ8vSnSvvAvar/d8qBeZcfN2Pj0OoOFaipkyRVmu0I/EjwhUy9VzS5oV9sYOtfE5Fkzsil3lVO/KDbk9lBOJOm/wQ+Ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv6AQ4QXC8dCddli8pQTVhC+lsx3Xe6H6OA6nUMfc/I=;
 b=pLNi/lv8dJvta5x3mkGUp/sXYhsTv4iFKMYR6W+dAkGZzrSEpHvzIVgRSsCHcmH1vDCvIkLjiqkScyN4LfWscVMNAaVoRAZGcA3o+yK+Y6IYt9lwMNKeScbiExs1KIEbSDCtsdJF329Ml5VU/ufPpyMwlvIv26i7NHZ/9Fj708KwSbCIYwfRN2gHPmKPFC5zg6qvTYRp3PmEW4dsfYsHqY/LcqL2JgDn849dmZEODOMQyZxH7Bk2VNipaCzl+xAre08zqnwXmI7GOnCCBKaVXQeZ9g96et19qwdQrrJJAiDi8cHy1v1at4VcBP6w85fgBUfsykV9mvfCQPbtpfl3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv6AQ4QXC8dCddli8pQTVhC+lsx3Xe6H6OA6nUMfc/I=;
 b=FzdRiY6Tg7Wy1lrgdpEI2teSIanLym0QJFIsUW0u3ftkhfmZHg1gQAAo9xwDiyf7PbHmPaLn8clLUgzLtFSwWjUvjlxPMJ2jah/qLyvHsY2J71wAZLbgWVrgucqwyyFY6URicWpS5QXzlXwy41GAJAX8AnYmNnRUS5X306y2vaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <eee6811b-36da-41be-83b0-21ec99d3b829@amd.com>
Date: Wed, 7 May 2025 09:38:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
 <aBnvlY3Dfc_Wpljw@macbook.lan> <3693f1ef-e305-4a6b-bb4e-3b842418387f@amd.com>
 <aBsPbyqL0XpjEdeo@macbook.lan>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aBsPbyqL0XpjEdeo@macbook.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|CY5PR12MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: c6259779-2786-408c-fad5-08dd8d6c824e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2dtWStOeDVrT2hWRjNGT1c5R2dGSjJJWGVqc08wN0dFT0NwcTRKaTF0eHly?=
 =?utf-8?B?ZllRd0x0OGoyM3p1S08ranhsTzVZZ3dGWHovMlBxekhhUlU3K3RRNk5SWjVU?=
 =?utf-8?B?aGM2cmFVWVRmWW1aVEIrekpJdnF4clh0dXFxYWM2U1Roa1JJZklhb0cyeXMw?=
 =?utf-8?B?dlNVZFdBMURqQWp3QVBPSDJTTzFuMVRnMHo3ZndsZ2FwUFhEOG8rVDNpQ2Ew?=
 =?utf-8?B?MXZ0dzdwUVMydjU3SVoyU25BQktiYjBUejV3R2ZuWjVqUmhYcnpST1hqMVpK?=
 =?utf-8?B?S0xEU1VnSkZqR3RBTXBWQS90ZmJDR0xxckJQOUNsbHhkd3d1UzRBeGxVUDRN?=
 =?utf-8?B?Y3NxQlZuK0FIelFZTytkbG5GVWZ4UFVLaVFzbHVzc3V1bkdLNDQ5cGdxQitN?=
 =?utf-8?B?NjJwaGI0citRSGVqcUkwVE9RcXhzZ2tNUkFaclNrUVNrdzR4T0h6alRDVVVJ?=
 =?utf-8?B?NUVaeUZmK3pJa1ZRV1gxVzFvQysrbCtUNCswYm5SQXZlSS9yak9XTG41REs2?=
 =?utf-8?B?QWczUlJNWjdkUzNoYVM1bVcwT29WUzZ6UWgrejl3OERwZit5QUs4cWpBc01a?=
 =?utf-8?B?Y0R3ZzY5WGxCY05za3RWdUIzSnRSZ251SGpCSUpTRHRyZGRYUEcrOGlOT3hG?=
 =?utf-8?B?YXhJVXg5UStMdkZMdW5KMU83YUpqVUl3S3dYQm9pMzVMaEw3b0lXS0d2R014?=
 =?utf-8?B?U1krRldlOUxyOVozcDhNYVVldHFCYm9zRm1UZWEzOTRBVW1VUmY4eUNhM0Vo?=
 =?utf-8?B?TGF6bVRIaWRWWFBYdkI2ZGhnbXRzVGprako1UER3cmtRV2FVWXp4OGxBVXJs?=
 =?utf-8?B?QjVkaGxkUUwxajRNYTBhTXZIaCtLd0o3RXlZWjdhUmwwL1E0T2l1RDh4NHgr?=
 =?utf-8?B?Y1ltUWU3d1U2QndFMTBXRlJldy9DZlpLbUh0L1dOS0lsT1Bibng3STArMERN?=
 =?utf-8?B?OTRLdkI4ZFY0ZUdya0c0OFl6SFVhRUMwRXhhLzRhcGFwWFFlMWhSKzloNGZs?=
 =?utf-8?B?dmJMYWprS2h2S245OCs1RWdLK3RQWGR0U2JLVkdHWm5LU2xaYXMwdXRmSmhG?=
 =?utf-8?B?ZlRCNSt2cjNjSXQwMTl5ZkZLc1NydzVqOG0xdHJwc0JQWTZVa3hVZ2l6K3ov?=
 =?utf-8?B?c3NQL1liRjgwL1AyUTJVZGZUdm1BR3FEb1FSc09YbTNFL0swNDFva29yeW1z?=
 =?utf-8?B?VnBrQjZtZGM1eVZlaHVDTzN1Yi9laEVFa00wUXJqQmpudzVPV2xNQW5QZWtX?=
 =?utf-8?B?dVNJRzRvYmVtR3AwWSt4V01SUzFnK1NXMzlWS1ZDWmVyR1FtcVplMW9GYlhz?=
 =?utf-8?B?ZUsweFE4WDVoeTMxYk9OSmlRN0lOc0xKZldxZmFQUnZteVFZRC8vS1YvbW9R?=
 =?utf-8?B?aEpMMGJFU0x5djBnM0w1UTB0bHgySDdpaG9XM2xmckhaeGFvdERVbTY2T1Ni?=
 =?utf-8?B?dHhjekZKT25KVUtGUjJUMWNPdlBsNEZOQ1ZTQ1RMSklLKy8vMnZmM2t4aXRw?=
 =?utf-8?B?S1Aydm1EYnpMYjYzVWhZTFIvU1VYdXZrZXlRb1A2VkxoNlBKcDA1VlRxZkxP?=
 =?utf-8?B?L1FzU053QktYMWFsajFLZnNIa0hkQXdYQkNvWkdXN0VYYUJZNnhyVnltZnZY?=
 =?utf-8?B?TDZPU2Qrc3dpRVhSRUxpWkdnNHNUMGZobm41aUNuV1VKd2FNa1VUa2ZSejY2?=
 =?utf-8?B?Mit4cndKaGk4NXBEYW9SUks2UVpNQzJ4RUpmbWhSTEJUYTBaaXpKNlc0d1Rt?=
 =?utf-8?B?d29aQW0wTjdOQndXdHc0SE1ETUV1OGlIT05kQWdWb2pxR0oxN09FQnlpSG11?=
 =?utf-8?B?d3R1RGRrWDdVZTZxSkZ0d1ZTdit4ckJZMDBuNWl2YVo0SDlVZCtONXdqU3Rh?=
 =?utf-8?B?QlFoVk9CV2QrcWxkZ1JRS3NSWE5mNnMramNHbDVqTCtYd25FWGRWQzRxdDBr?=
 =?utf-8?B?azFBb0o3U2JsRFJNTGdBblpqUXlQczcvalFWV09FSG9uVDREM0RtUmlzOUd0?=
 =?utf-8?Q?Xs/WQiOi07zbrep1ImugdYxMZcvvXM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:38:53.7273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6259779-2786-408c-fad5-08dd8d6c824e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6228

On 5/7/25 03:44, Roger Pau Monné wrote:
> On Tue, May 06, 2025 at 11:05:13PM -0400, Stewart Hildebrand wrote:
>> On 5/6/25 07:16, Roger Pau Monné wrote:
>>> On Fri, Apr 18, 2025 at 02:58:37PM -0400, Stewart Hildebrand wrote:
>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>  static int vpci_register_cmp(const struct vpci_register *r1,
>>>>                               const struct vpci_register *r2)
>>>>  {
>>>> @@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>>>      const struct pci_dev *pdev;
>>>>      const struct vpci_register *r;
>>>>      unsigned int data_offset = 0;
>>>> -    uint32_t data = ~(uint32_t)0;
>>>> +    uint32_t data = 0xffffffffU >> (32 - 8 * size);
>>>
>>> This seems kind of unrelated to the rest of the code in the patch,
>>> why is this needed?  Isn't it always fine to return all ones, and let
>>> the caller truncate to the required size?
>>>
>>> Otherwise the code in vpci_read_hw() also needs to be adjusted.
>>
>> On Arm, since 9a5e22b64266 ("xen/arm: check read handler behavior") we
>> assert that the read handlers don't set any bits above the access size.
> 
> I see.  That kind of diverges from x86 behavior, that AFAICT (see
> memcpy() at tail of hvmemul_do_io()) instead truncates the memcpy to
> the size of the access.
> 
> Maybe it would be better to instead of asserting just truncate the
> returned value to the given size, as that would allow to just return
> ~0 from handlers without having to care about the specific access
> size.

The impression I get from [0] is that that on Arm, there's no benefit to
performing truncation in xen/arch/arm/io.c. Doing so would needlessly
affect other Arm internal read handlers (e.g. vGIC). For vPCI
specifically, however, we could potentially perform truncation in
xen/arch/arm/vpci.c. So I guess it's a question of whether we want to
give special treatment to vPCI compared to all other read handlers on
Arm?

>> I had adjusted data here due to returning it directly from vpci_read()
>> in the current form of the patch. With your suggestion below we would
>> only need to adjust vpci_read_hw() (and then data here would not
>> strictly need adjusting).
> 
> Both returns would need adjusting IMO,

OK

> and it should have been part of
> 9a5e22b64266 I think, since that's the commit that introduced the
> checking.

If we proceed with adjusting vpci_read() and vpci_read_hw(): are you OK
with these adjustments included in this patch, or would you prefer them
being split into a pre-patch?

[0] https://lore.kernel.org/xen-devel/20240522225927.77398-1-stewart.hildebrand@amd.com/T/#t

