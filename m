Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0220EAAEDCB
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 23:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978827.1365675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCm9e-0007YB-Pq; Wed, 07 May 2025 21:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978827.1365675; Wed, 07 May 2025 21:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCm9e-0007Wb-N0; Wed, 07 May 2025 21:18:14 +0000
Received: by outflank-mailman (input) for mailman id 978827;
 Wed, 07 May 2025 21:18:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqG7=XX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCm9d-0007WV-AK
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 21:18:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2418::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6238b91-2b88-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 23:18:09 +0200 (CEST)
Received: from BYAPR07CA0101.namprd07.prod.outlook.com (2603:10b6:a03:12b::42)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 21:18:00 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::81) by BYAPR07CA0101.outlook.office365.com
 (2603:10b6:a03:12b::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Wed,
 7 May 2025 21:18:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 21:18:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 16:17:59 -0500
Received: from [172.31.225.170] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 16:17:58 -0500
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
X-Inumbo-ID: c6238b91-2b88-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDDHWkTLTrkGc3ektELJ5P/F0mXymp7YAs0q1IQmHgP20WPY6dkaXAW0k+7hSKXvYdJDIg4WTQ6IqvAh0oCzyxT3pF+hGbB8oymc+ikfSAYWpz4pM5E0ZOUZ9ModTHWDoYrTExWUshkb4WlLoGbrB0WSvUQn/cGOwR6Ny8ujjqbn1DRIvoGUAeOduokl+2yq1ys1Wyj+4evlwaLNabG+IoSNnuUEU14YPN9IeVBaXe++Y0jB15fh8YVt7DN3ZflaIf5yzNIF53ZepH4U+iKj/smSSW8L/J8Ka2s3aPlpSNptzHvo58b/ABxnKAfjTNQD5OyuwwSq0zvPzYXkQ2nC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEJJfgVNEXP58Hz375A3LbpVOdQlQpOr8EdhETwuh6g=;
 b=ceEwTTeNhM9gM9G/AHJ4C4L1+E1tvQ7XhPApjKEuKkBmLvg7qxiNmj/d3Ex5wuH+Iq64sJO471/kvGHECgJxqUUNZvA+dN7cEb7GlWDc9KKwlEFp947KTRFrbkrTzaxxDxEPegPTibBde322KUtscaG+BB5Vqod3mzhnkVR3mevOweyOncZda1/r61muevCOm0Oq+EUx/LD9Yy6IlGedcp6ix1279+NQdTk3gD9Yp5tXwpxVy/QkAWKftEmiIdCQYJD6Q9FcEudAfvQ9Fy3yBZRc7raz9U8HS8bKkxpvoI3Xy3zncKuScVPtFMbLQLmzduEun9S2u5ZePDTIuBdtLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEJJfgVNEXP58Hz375A3LbpVOdQlQpOr8EdhETwuh6g=;
 b=QO1oxQWovA6uA7gRBBJ7NFUYVvnNYRLz/EGRHL4XR7d8R8urSuEyHdqy40/0irJ3sSU0doABLqVsRGVU58bn2uqW3jQo+HLKoaELBvFxOdzFgupm611SL+VBeff/LNjJMXL9a4J0t3J/wpZ9CyJwRuQWMfk6Gf7UxCfvrM0BvAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <47ee8b59-7b6a-4248-a4bd-f5be9f00f562@amd.com>
Date: Wed, 7 May 2025 17:17:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>,
	"Oleksandr Andrushchenko" <oleksandr_andrushchenko@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
 <aBnvlY3Dfc_Wpljw@macbook.lan> <3693f1ef-e305-4a6b-bb4e-3b842418387f@amd.com>
 <aBsPbyqL0XpjEdeo@macbook.lan> <eee6811b-36da-41be-83b0-21ec99d3b829@amd.com>
 <aBucENdwFYacsQAX@macbook.lan>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aBucENdwFYacsQAX@macbook.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1c0a03-e399-477b-5b34-08dd8daca53b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mkd4cmtHdElMTSthbHVtK0YzZktCZjRnOHNyYjF0VFpZd3ZiVXp6dVBCQjZ6?=
 =?utf-8?B?d2F2aVB6bTgwQ0F4WmlpNTUweU1qTFhQUUN4QmMzMlBuWkVrOUFUUGJUUVAx?=
 =?utf-8?B?UG5tWEE1SnhIYzBPNktOMDNpR1J3T3Jhd2FHbkZpT3RIcWhBYXpRVjErY0JW?=
 =?utf-8?B?OXcvc3U5YXVGTWhVWktITEtOOE1DK3lyYzdyN2JNczlEV0xrVmtmUjAyK1Rt?=
 =?utf-8?B?VlhMUE1jdUZxaVpjeGRLalhzemtOUS8zNGNXUXlaOGdtMC8rTW1nTU50S05V?=
 =?utf-8?B?OExzNFMvZzlzSEprZUt1MUxGSmtLZUZRYkt4bkNaL3ZGSUpvTjQ1Ly83c2pr?=
 =?utf-8?B?YVEvVkUzZzNFTkY2K2gxMUp3RU0xSFAySkRGOEhUeHU4WWcwUFpWWGp6eVpM?=
 =?utf-8?B?UXliUXkzd2xqSDVkNWpkaXEvUmVjeGNPSmtScUUvVjY5bmdQQ0RqdXVQem1p?=
 =?utf-8?B?bnRlSlJzcFE3QmVSR1dwWkgyYllabEFDU1ltc3N5dm51bTNkK3QrcE1ZV1J4?=
 =?utf-8?B?cjU2cVd2WUpuWWtScTlQVjJja2FNVTZEMXNkVmxVYS9PZXJaN2x2REF3SmN4?=
 =?utf-8?B?cjBEaE91UHYrYU05K2ltaWdhT1hBQUhiSWlOVUNNSEE5SWQ5QTJuVFJDWk5T?=
 =?utf-8?B?Tmd0MG9sdVFqWDNSWnYwcXVVWHRadTNBMnU2WDV6ZXVsTDdGZ0E1c1NNQ1F1?=
 =?utf-8?B?bFh0eUErek1zWnJ5bVpVNWExTXRHMU51dUNaRmxnUHppWDQ2a1c0VmJ3UDNU?=
 =?utf-8?B?cnBhY1pJeC9KSlQ0dGxCeXE2RGdZdE1GTmtFZXBtdTh5akhiNE5pbkQrRURn?=
 =?utf-8?B?RXhOYTlMUEg5cFhMYVdCZkZ2WkI3MVVPNmpSL3o3V1hiSTBwYzBYUmFNOVQw?=
 =?utf-8?B?TTBUbEV3Qm9wUVJQUnFjWlVFd01LbmxpUGUzN0wwbnEwa0tDL1FadU9rTlM4?=
 =?utf-8?B?M1dwRjhodHkrcHhra2l0eEpWaEkvOEF2MlNpbWZUcGI2TUxkaUV5c2RSOGx1?=
 =?utf-8?B?RlVFc1ZwaDdHNzVtOW42cGlob0F2UW1kSDNOdTJsS2ZPcGttMFduUVA4ZnNF?=
 =?utf-8?B?dUNLSVFWbE9QNXArUmRuNmc1NG5ZS2IyL01PS002cEw3MkYzbGJnZTZPQStZ?=
 =?utf-8?B?MEVVaC9HYzdRbjQ5WE0xbTFxd2ZJNTJKbFF4TUs5V3VBQlFOc1h0MlBQRkpq?=
 =?utf-8?B?Vi8xTXd5b2d3bU9WWG1LdUdNdmRZU3BpamZQK1ViQnpzdEIxa0NiOU8wallF?=
 =?utf-8?B?R0l3N3ZrYWY3bHlGQjMvTG1OZmErYmtkNTJRcklTaGhQTlJoZkk5SlJmR1Qw?=
 =?utf-8?B?SXdsMUxoQTNzd2NNYnJKSnY5WFY4VWszaGM3c2FrdEJLY1pMNHJPWGRDT1Js?=
 =?utf-8?B?dTRlY0E4eHREWkVOd3pjVDYyd1hrRzB5Q2VhL3lvUHU0c0FleTV2UHlPTVZ5?=
 =?utf-8?B?eHd6b3pvZEYxVXd3MGlPdzIwT1Q5d0x2cUhGSDVDbWhBRGJ1NXl0bEFVNHl6?=
 =?utf-8?B?UWRGNE9TUW9RSGx2R0c2ckZaYmVBOTQvMFBoNGl5dUY4ZDFwUFVubzUrbkJU?=
 =?utf-8?B?SjFrR2s5ZTM4VlJuOFdZTkF5UDk4VWI2VFVhdE12WGM5MXFCTTVPMWplMG1W?=
 =?utf-8?B?T0hGNHFEZWNyMW1BMENobFo4ZnVNd1hpOEVWZ3JaS2IvV09DdERwbGZ2RlVl?=
 =?utf-8?B?eVk1NWVmcHdwVzd3ZW1UYXpNUXQzRTZHdXc5TzVyVzFQTTl6cXd3SlQ2blFT?=
 =?utf-8?B?RzBDS1dwa1dzOWNTNStkYitNcTBiTlkzZngvZ1JZb3k3a2xuTGw3OVVjbjIv?=
 =?utf-8?B?VVc0VzJWWERiUEZzbHhjWUcrOWNkTWhkbTlYZitVY2FGcjRFYTFmK3V2VENH?=
 =?utf-8?B?OVhQalhadGh0cWc5Q2g2UXpybFNEY1JIWjVjN3hHWXBSQytEblhiVFBaSys1?=
 =?utf-8?B?VEFKSE82aEZ5TUhycXdIVHYyYk4zY0RkaStDSmhjZGZSK05VVEN0RGZVSHZJ?=
 =?utf-8?Q?J1uC3itKQIMiomIQHhnDUUFUR+Of1k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:18:00.1086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1c0a03-e399-477b-5b34-08dd8daca53b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657

On 5/7/25 13:44, Roger Pau Monné wrote:
> On Wed, May 07, 2025 at 09:38:51AM -0400, Stewart Hildebrand wrote:
>> On 5/7/25 03:44, Roger Pau Monné wrote:
>>> On Tue, May 06, 2025 at 11:05:13PM -0400, Stewart Hildebrand wrote:
>>>> On 5/6/25 07:16, Roger Pau Monné wrote:
>>>>> On Fri, Apr 18, 2025 at 02:58:37PM -0400, Stewart Hildebrand wrote:
>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>  static int vpci_register_cmp(const struct vpci_register *r1,
>>>>>>                               const struct vpci_register *r2)
>>>>>>  {
>>>>>> @@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>>>>>      const struct pci_dev *pdev;
>>>>>>      const struct vpci_register *r;
>>>>>>      unsigned int data_offset = 0;
>>>>>> -    uint32_t data = ~(uint32_t)0;
>>>>>> +    uint32_t data = 0xffffffffU >> (32 - 8 * size);
>>>>>
>>>>> This seems kind of unrelated to the rest of the code in the patch,
>>>>> why is this needed?  Isn't it always fine to return all ones, and let
>>>>> the caller truncate to the required size?
>>>>>
>>>>> Otherwise the code in vpci_read_hw() also needs to be adjusted.
>>>>
>>>> On Arm, since 9a5e22b64266 ("xen/arm: check read handler behavior") we
>>>> assert that the read handlers don't set any bits above the access size.
>>>
>>> I see.  That kind of diverges from x86 behavior, that AFAICT (see
>>> memcpy() at tail of hvmemul_do_io()) instead truncates the memcpy to
>>> the size of the access.
>>>
>>> Maybe it would be better to instead of asserting just truncate the
>>> returned value to the given size, as that would allow to just return
>>> ~0 from handlers without having to care about the specific access
>>> size.
>>
>> The impression I get from [0] is that that on Arm, there's no benefit to
>> performing truncation in xen/arch/arm/io.c. Doing so would needlessly
>> affect other Arm internal read handlers (e.g. vGIC).
> 
> But isn't this truncation desirable in order to avoid possibly setting
> bits outside of the access size?

On Arm we expect the read handlers to have the bits above the access
size zeroed. If a read handler sets bits above the access size, it could
indicate a bug in the read handler. As a reminder, this was already
discussed at [0] and a patch was already committed 9a5e22b64266
("xen/arm: check read handler behavior"). Perhaps we could both keep the
ASSERT (for debug builds) and perform truncation (for release builds) in
xen/arch/arm/io.c:handle_read(), but that's patch for another day.

[0] https://lore.kernel.org/xen-devel/20240522225927.77398-1-stewart.hildebrand@amd.com/T/#t

>> For vPCI
>> specifically, however, we could potentially perform truncation in
>> xen/arch/arm/vpci.c. So I guess it's a question of whether we want to
>> give special treatment to vPCI compared to all other read handlers on
>> Arm?
> 
> I would think doing the truncation uniformly for all reads would be
> better, as we then ensure the value propagated to the registers always
> matches the access size?
> 
> I'm not expert on ARM, but it seems cumbersome to force this to all
> internal handlers, instead of just truncating the value in a single
> place.

To move this forward, I suggest performing this truncation in
xen/arch/arm/vpci.c:vpci_mmio_read(). This will be a single place to
perform truncation for Arm vPCI, and will not affect other Arm internal
mmio handlers.

