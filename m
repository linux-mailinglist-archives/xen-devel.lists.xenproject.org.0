Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40CAAD3B3
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 05:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978129.1364984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCV69-0008N2-DM; Wed, 07 May 2025 03:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978129.1364984; Wed, 07 May 2025 03:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCV69-0008KU-9t; Wed, 07 May 2025 03:05:29 +0000
Received: by outflank-mailman (input) for mailman id 978129;
 Wed, 07 May 2025 03:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqG7=XX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCV67-0008KO-Hh
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 03:05:27 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2412::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f7be73c-2af0-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 05:05:26 +0200 (CEST)
Received: from DS7PR05CA0027.namprd05.prod.outlook.com (2603:10b6:5:3b9::32)
 by DS0PR12MB8576.namprd12.prod.outlook.com (2603:10b6:8:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 7 May
 2025 03:05:15 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::18) by DS7PR05CA0027.outlook.office365.com
 (2603:10b6:5:3b9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Wed,
 7 May 2025 03:05:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 03:05:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 22:05:14 -0500
Received: from [172.31.225.170] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 May 2025 22:05:13 -0500
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
X-Inumbo-ID: 1f7be73c-2af0-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7i+HHccn0r67Kg83M1lWF16AKzB409EQR/gIV/1yBZZFTjl8uFz/s2P7cclKbAJN13PHAc8AB1N9UQjqMNYQxNnia83OHYGc1x/xz5Pvj2U1d/47wn6AMnRP2ymiTAJqnbdP3Woadxb3N3lGU+blVSlltiXYgdUYBd2+5ZHI54RQ5WlcNpCsDhkndsHRE/tuSS1oAhg8p45Di06qGZkv6sFAOR4lV9ZLD3FE4M9Hux4JpjE/ZJJN2Wq6SJDq4qOryW/x1NRe4v9zf7wyabyea7qHNR+YgnH48pth8RZ6qzBNUJtSfcPDjZPpQHPU44djOlVdXRfYYaHiKjCZmRmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwyhJFY4vesrDhBtFfHi8Dqt7X4llzuSAR5ElpLhNME=;
 b=EpXxGA5CVaO/4j4w0bk4SJ4HUi+iFsJ1VbSW1o9OIB+JDDBek9O9K3UhqTf1WazPRMr9zUhNnXtAsp9LVJYiB3TBvOaf6BuFDGQzJxjcuUFdB7i7GJLhslpt7Wv3pKWKbCHl13HbwQKjAHxtRrWkf1rYpgYcwtGeFybJ4DvpjmN0nrGk/iT64tvd2vV7sXg8UMkaPE7180EQqUWLQnEiq96L8k0Fzqdx2TNnR2Ppp+Ld/5kBkojxigkDYhM4RQXa3lw1CRj9zDANBNhGzYd/IlB8V8PloZG2ptS00MmG+fRLrsfaALxV6OCoclOLlyMxeGT6lcdd+g93YcCgk23pMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwyhJFY4vesrDhBtFfHi8Dqt7X4llzuSAR5ElpLhNME=;
 b=4eCrQsGdkRTqjGS/QqXV360vESxY2QU1Zs60BlSwPx6r4EMrXqoiD9LO03ekNyxU8oGno24Q9zzM05h9R2aIpWqxAEE864464cTgaSg/ZwukPybKQDSrad8hSo9ORtmPSBoaz8pDR6wdoOfIdcPAGkfGYu9DUH5ZK/Go0CPWz3E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3693f1ef-e305-4a6b-bb4e-3b842418387f@amd.com>
Date: Tue, 6 May 2025 23:05:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Mykyta
 Poturai" <Mykyta_Poturai@epam.com>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
 <aBnvlY3Dfc_Wpljw@macbook.lan>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aBnvlY3Dfc_Wpljw@macbook.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|DS0PR12MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: e5dcb755-8d0a-414a-f89d-08dd8d13fdb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWQvS0J4TERWYjZLbVEvSEJPTnA5VzE4UWlGQTFmb3hBNHBQRmxKV3d5NlBD?=
 =?utf-8?B?WC83ZHVQVlRzUG95bGFZTFNMYUlVbkhxWHRza1V6VzZEd041Q1YxM0NLMVk2?=
 =?utf-8?B?Ukt3cFhNR3RCNWdJVDVCNitrVzJINnZxOW9VU1lSZHQrRC9JVGt1akJhVjcv?=
 =?utf-8?B?VDRRRjdxdjJ2YXRFVTAzSC92MFFDZ1hvTmRHYVBOR3ZRbkl6c3pQR0RaVWFZ?=
 =?utf-8?B?c2ZRTUVEYUtEZ1B1bVNGZGlmSFRSTWlpRFFZYnExa0dUYXhES1U5LzFFUVkw?=
 =?utf-8?B?M0QxVjBzNHh1UFpDcEIzM3kvOEYxMytMQXVXRThpNG05MTZXc0RYeEJzcFA2?=
 =?utf-8?B?c3V4WU11SWlHQURhNTR6VkovVTFXdVJxeUxKUFBsM3E4c2RQWWpoeG5LUTU5?=
 =?utf-8?B?ZmZTSU9TaTRoWFFnSEFzRWp2b1RxZEtLbWViSWQyd1d3bWxsR2cvVE1kLzJN?=
 =?utf-8?B?ak0wVTk5djhqV2l5NWh3ckxrQ1JEdmltdUNtUjZUc0VWYjdtQkt5QzkySVR0?=
 =?utf-8?B?MzRLT2J5VXozbDFOZ0pFTU42TXo4bnJjaVlCVG1LcjRIRkJpQkVsTzVHaWU3?=
 =?utf-8?B?YnNCY0k3WERiZzhSMHArMzdpMzJ3dVhPZVYzakQ1d2RDQ2ttK28vcXo4S09J?=
 =?utf-8?B?NFNhV2xoMlpsdlFMNy9VV2lqcnhtbjNyaEc5UmhtL1BtRnRTbVVZUnJSQ1pH?=
 =?utf-8?B?a3FCTkxVRW5qOE9hNzdvRjRJZVBwOVY3NVd3U0g2WFRlNnhTNmxZZE9MdXdX?=
 =?utf-8?B?L0liemZrRzhqbGR5Mit6K2V3SEZvbmNSbmNBYUQ1VzYwT2Y4K0ZSa3dBd3dN?=
 =?utf-8?B?V2tpUkIwSHhJbkRQR3U5djRjVmF5UmQxT3RFNU1Helg3dmJkWkl1eVVGRXNC?=
 =?utf-8?B?ejJqVXZJWHhKL05JRXI0eHFSYlJsVFJBaS9mQ3F5QkNSejd0c1JGRVpjUEto?=
 =?utf-8?B?VjI1YWhFS3pIRU5yZE8xRjFQdDNMczFmM05DNGtUL0NVY3pCZDl0aExpWU5i?=
 =?utf-8?B?TzNyeXdSZTFHMkJXSnBpaXpDdzNBaWFpQWdWK3J6djkvdGJ0U1VpN2RzWWFu?=
 =?utf-8?B?QnZFZys2RHRtWEs4eDQzL3FtMnpLTzBIZmVEeENlK2htanhnQ2c2dk5CRWZh?=
 =?utf-8?B?OVhKWXZtcnBQT2htL2swQjZZRXF1eVBKQlYvZG4ycmt4aWd4MUxWWEJZR3Vh?=
 =?utf-8?B?U0gxYmZWakRqd1VJWmQ4UWxNNURXOXZXcmJQblpRSCsycHBZbWVxeFFnTHN1?=
 =?utf-8?B?U2crcGJsblEvTU05clo4MXlTSTlFOHRpc2J4MVZqNVBsam02WXVkVXhud0VT?=
 =?utf-8?B?YkE2Snc2TDN6Tk9qWlNFSG40a1JjVFVGUjE3c3Q2TGUxQ3lyZlpRd0Q3dUR2?=
 =?utf-8?B?S254c2F1dEhFNzB0ZStqRDUrRWcyY2pFRDBaSjFLeUU1cHpSUXgyYjN4dGQ4?=
 =?utf-8?B?Vm9LUnJ2YTVwTnJJZUVibUVEL3FNcWl4d0hadVB1M1NlUXZpK1hRd04wL1Zx?=
 =?utf-8?B?dS9GRDJBTU9Md1FwbkYweXU0M1hNUGFmY2g2Rm1YYjZneG42cnJJUmZndEYz?=
 =?utf-8?B?MDRoWGJqRjJpSnZsaysySVRPUjJGaExnWnRNNlo5ckNGYWNSNXdpb3lRRGRN?=
 =?utf-8?B?S1NZVXc0djhjb2NWRUI5MDM2QjhNVkY0VkF5bGRjVUwwYjNHV2dFZmJOeG5t?=
 =?utf-8?B?Z25qOXFuSEl1RytBUmlMbnppVzZ0eTFmZlJRL21Yb2Z4Y0ZqUFpXNE4rUGs2?=
 =?utf-8?B?NkZSMDE2SVNvdHB2UCttRGE4Kyt5U0hGYXVLRDUxU1VraEMwMUl5ci9DcTlq?=
 =?utf-8?B?NDNpbXpCdm8yd25mY2F6a2ZwTjd1VG92S1c2Mmd3REphVVhEUmIwNGw2R0ZS?=
 =?utf-8?B?bm1lUzRpckhYWWw3dmYyZ0o3MVZnUVhobks4UFJHMHAzN0FVSkpuNlgvYnhG?=
 =?utf-8?B?bmtGaVp5NmEwaGlGckNQWTI1N2psY0JISThMNndmOUQ3dkFKdEVLWWVxWlB5?=
 =?utf-8?B?QXFYMlQySlhvRDVWdW1DMGN0QVNOTHhPN0l2MzBzcC8yR284YSsvTDNLRkFo?=
 =?utf-8?B?MWYvQlVEbjBweVZQcjRqdWpHRFZ2MVY1R0FFZz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 03:05:15.5799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dcb755-8d0a-414a-f89d-08dd8d13fdb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8576

On 5/6/25 07:16, Roger Pau Monné wrote:
> Hello,
> 
> Sorry I haven't looked at this before, I was confused with the cover
> letter having ARM in the subject and somehow assumed all the code was
> ARM related.

No worries, thanks for taking a look.

> On Fri, Apr 18, 2025 at 02:58:37PM -0400, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> There are two originators for the PCI configuration space access:
>> 1. The domain that owns physical host bridge: MMIO handlers are
>> there so we can update vPCI register handlers with the values
>> written by the hardware domain, e.g. physical view of the registers
>> vs guest's view on the configuration space.
>> 2. Guest access to the passed through PCI devices: we need to properly
>> map virtual bus topology to the physical one, e.g. pass the configuration
>> space access to the corresponding physical devices.
>>
>> In vpci_read(), use the access size to create a mask so as to not set
>> any bits above the access size when returning an error.
> 
> I see this here, and the code below, yet I'm not following why this is
> a requirement for the code added here.  It seems like an unrelated
> change?

See below

>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> In v20:
>> * call translate_virtual_device() from within locked context of
>>   vpci_{read,write}
>> * update commit message
>> In v19:
>> * move locking to pre-patch
>> In v18:
>> * address warning in vpci test suite
>> In v17:
>> * move lock to inside vpci_translate_virtual_device()
>> * acks were previously given for Arm [0] and vPCI [1], but since it was
>>   two releases ago and the patch has changed, I didn't pick them up
>>
>> [0] https://lore.kernel.org/xen-devel/4afe33f2-72e6-4755-98ce-d7f9da374e90@xen.org/
>> [1] https://lore.kernel.org/xen-devel/Zk70udmiriruMt0r@macbook/
>>
>> In v15:
>> - base on top of ("arm/vpci: honor access size when returning an error")
>> In v11:
>> - Fixed format issues
>> - Added ASSERT_UNREACHABLE() to the dummy implementation of
>> vpci_translate_virtual_device()
>> - Moved variable in vpci_sbdf_from_gpa(), now it is easier to follow
>> the logic in the function
>> Since v9:
>> - Commend about required lock replaced with ASSERT()
>> - Style fixes
>> - call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
>> Since v8:
>> - locks moved out of vpci_translate_virtual_device()
>> Since v6:
>> - add pcidevs locking to vpci_translate_virtual_device
>> - update wrt to the new locking scheme
>> Since v5:
>> - add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>   case to simplify ifdefery
>> - add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
>> - reset output register on failed virtual SBDF translation
>> Since v4:
>> - indentation fixes
>> - constify struct domain
>> - updated commit message
>> - updates to the new locking scheme (pdev->vpci_lock)
>> Since v3:
>> - revisit locking
>> - move code to vpci.c
>> Since v2:
>>  - pass struct domain instead of struct vcpu
>>  - constify arguments where possible
>>  - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
>> New in v2
>> ---
>>  tools/tests/vpci/emul.h |  2 +-
>>  xen/arch/arm/vpci.c     |  4 +++
>>  xen/drivers/vpci/vpci.c | 73 +++++++++++++++++++++++++++++++++++++----
>>  3 files changed, 71 insertions(+), 8 deletions(-)
>>
>> diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
>> index da446bba86b4..dd048cffbf9d 100644
>> --- a/tools/tests/vpci/emul.h
>> +++ b/tools/tests/vpci/emul.h
>> @@ -89,7 +89,7 @@ typedef union {
>>  
>>  #define __hwdom_init
>>  
>> -#define is_hardware_domain(d) ((void)(d), false)
>> +#define is_hardware_domain(d) ((void)(d), true)
>>  
>>  #define has_vpci(d) true
>>  
>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>> index b63a356bb4a8..618ddb7f6547 100644
>> --- a/xen/arch/arm/vpci.c
>> +++ b/xen/arch/arm/vpci.c
>> @@ -34,6 +34,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>      /* data is needed to prevent a pointer cast on 32bit */
>>      unsigned long data;
>>  
>> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
>> +
>>      if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>>                          1U << info->dabt.size, &data) )
>>      {
>> @@ -52,6 +54,8 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>>      struct pci_host_bridge *bridge = p;
>>      pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>>  
>> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
>> +
>>      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>>                             1U << info->dabt.size, r);
>>  }
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 1e6aa5d799b9..fc409f3fc346 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -174,6 +174,41 @@ int vpci_assign_device(struct pci_dev *pdev)
>>  }
>>  #endif /* __XEN__ */
>>  
>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +/*
>> + * Find the physical device which is mapped to the virtual device
>> + * and translate virtual SBDF to the physical one.
>> + */
>> +static const struct pci_dev *translate_virtual_device(const struct domain *d,
>> +                                                      pci_sbdf_t *sbdf)
>> +{
>> +    const struct pci_dev *pdev;
>> +
>> +    ASSERT(!is_hardware_domain(d));
>> +    ASSERT(rw_is_locked(&d->pci_lock));
>> +
>> +    for_each_pdev ( d, pdev )
>> +    {
>> +        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
>> +        {
>> +            /* Replace guest SBDF with the physical one. */
>> +            *sbdf = pdev->sbdf;
>> +            return pdev;
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +#else
>> +static const struct pci_dev *translate_virtual_device(const struct domain *d,
>> +                                                      pci_sbdf_t *sbdf)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +
>> +    return NULL;
>> +}
>> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> 
> Jan's suggestion avoids having duplicate headers, and results in less
> code overall:
> 
> static const struct pci_dev *translate_virtual_device(const struct domain *d,
>                                                       pci_sbdf_t *sbdf)
> {
> #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>     const struct pci_dev *pdev;
>     ...
> #else /* !CONFIG_HAS_VPCI_GUEST_SUPPORT */
>     ASSERT_UNREACHABLE()
> #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> 
>     return NULL;
> }
> 
> I've not overly fuzzed either way, but if changes are required you
> might as well change to this form.

Will do

>>  static int vpci_register_cmp(const struct vpci_register *r1,
>>                               const struct vpci_register *r2)
>>  {
>> @@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>      const struct pci_dev *pdev;
>>      const struct vpci_register *r;
>>      unsigned int data_offset = 0;
>> -    uint32_t data = ~(uint32_t)0;
>> +    uint32_t data = 0xffffffffU >> (32 - 8 * size);
> 
> This seems kind of unrelated to the rest of the code in the patch,
> why is this needed?  Isn't it always fine to return all ones, and let
> the caller truncate to the required size?
> 
> Otherwise the code in vpci_read_hw() also needs to be adjusted.

On Arm, since 9a5e22b64266 ("xen/arm: check read handler behavior") we
assert that the read handlers don't set any bits above the access size.
I had adjusted data here due to returning it directly from vpci_read()
in the current form of the patch. With your suggestion below we would
only need to adjust vpci_read_hw() (and then data here would not
strictly need adjusting).

> And
> you can likely use GENMASK(size * 8, 0) as it's easier to read.

OK. I'll then also provide a definition for GENMASK in
tools/tests/vpci/emul.h.

>>  
>>      if ( !size )
>>      {
>> @@ -453,9 +488,21 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>       * pci_lock is sufficient.
>>       */
>>      read_lock(&d->pci_lock);
>> -    pdev = pci_get_pdev(d, sbdf);
>> -    if ( !pdev && is_hardware_domain(d) )
>> -        pdev = pci_get_pdev(dom_xen, sbdf);
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        pdev = pci_get_pdev(d, sbdf);
>> +        if ( !pdev )
>> +            pdev = pci_get_pdev(dom_xen, sbdf);
>> +    }
>> +    else
>> +    {
>> +        pdev = translate_virtual_device(d, &sbdf);
>> +        if ( !pdev )
>> +        {
>> +            read_unlock(&d->pci_lock);
>> +            return data;
>> +        }
> 
> You don't need this checking here, as the check below will already be
> enough AFAICT, iow:
> 
>     if ( is_hardware_domain(d) )
>     {
>         pdev = pci_get_pdev(d, sbdf);
>         if ( !pdev )
>             pdev = pci_get_pdev(dom_xen, sbdf);
>     }
>     else
>         pdev = translate_virtual_device(d, &sbdf);
> 
>     if ( !pdev || !pdev->vpci )
>     {
>         read_unlock(&d->pci_lock);
>         return vpci_read_hw(sbdf, reg, size);
>     }
> 
> Achieves the same and is more compact by having a single return for
> all the possible cases?  Same for the write case below.

Seeing as there is a is_hardware_domain check inside vpci_read_hw(),
that is okay. I'll make the adjustment here and in vpci_write.

