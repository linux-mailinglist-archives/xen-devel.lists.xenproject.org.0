Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70396AD3EA7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 18:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011107.1389435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1ej-0002fc-PZ; Tue, 10 Jun 2025 16:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011107.1389435; Tue, 10 Jun 2025 16:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1ej-0002do-MA; Tue, 10 Jun 2025 16:16:57 +0000
Received: by outflank-mailman (input) for mailman id 1011107;
 Tue, 10 Jun 2025 16:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghGr=YZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uP1eh-0002dg-Ru
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 16:16:55 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51219e36-4616-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 18:16:52 +0200 (CEST)
Received: from DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) by
 PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 10 Jun
 2025 16:16:48 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::c) by DM5PR07CA0093.outlook.office365.com
 (2603:10b6:4:ae::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 10 Jun 2025 16:16:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 16:16:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 11:16:46 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 11:16:45 -0500
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
X-Inumbo-ID: 51219e36-4616-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4zb6Gi2kVhMc5DfRyerfLfCiX4704V4WgEu6e3864YNgCUXCrvaSB9oBxDmeUbbt2gAFyeY9gkK8VJGZ9CNJ41NDQRhRI8BytATJfg2XYCzsy/b/96rYPKUTViKd63kN7oRmZsOucM+X0qzLihP7uq7VU7vGJEf2ho9udXXVqh9o6iPvfiPGPBnly7xKhoIy9yr91Djalkzz5EQb3knF0Rr/nRahSlIkF17K83nmNPG1LLSYY7Dc2fnMu5z67wmmgapznCbiQpYYmAuUWZNgdVcv7CfXfmHpz8KERxvkNRX0g5VoCM3pOapahLO2/5m/3dgcc8V9gncC0rPofSgcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HtK1z3nKFtaZip35ISlSHt5D7JyiGZrIhHJlPCdsO4=;
 b=BSkPbLC8aWU8uERp307otEc4V2DFC7vXZsd6Eg04Wc1D02vvtMJEgwy9SliamId6EO6b3W2Ux/qYBflzJgAwp35vCK06/B9SL9YXoTd0GNgyeNJAiOe98wFOoVk4V1MVt+dVc8GVkmWoFI8ABtUaG7BJT5COFyRwXseXrg0gQ5hOJ69NyjRP/mNc1XGm7tYdPo6sHEHevOrAFbwHmpvm7bPOXtGoLXYgZ7Ec/zmI4fIt7zCn550m19n69xfn/xpPOe9/CxeeN24TeG7JxRhJ1MWIzzcmBRPcHRR815ol5p4ilD9588wTcxhtXRDbGBLeqZRo8Qx47AEJB27cuVKLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HtK1z3nKFtaZip35ISlSHt5D7JyiGZrIhHJlPCdsO4=;
 b=WPz5mqoKsquo2Flmj3KtLkdsPcZ6TSzripg5NhkTFl5X3cmpdMTXe8jm4hmlH1lQN1fllLAPSniB2rxQ1xI7jcsGfcwDtooSAwFaTa5xsNCAsjXkuEkmr1ik5+b25nTPfCkm2q6yxTjuuj4g5zife+XTIAsbKtrqYltk0su4vn8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <aceed733-37d5-4a34-9645-33d7bf27642f@amd.com>
Date: Tue, 10 Jun 2025 12:16:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix build with HAS_PCI
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250610142300.197599-1-stewart.hildebrand@amd.com>
 <aEhUe30Hojo8CoeP@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aEhUe30Hojo8CoeP@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|PH8PR12MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 517ec392-58c5-4518-842c-08dda83a332c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0xYTVh1V0ZkTkcxTUQ0K1FRMERzcFJUeVZGTVB5T2lZODRQNXhSYklhL0N3?=
 =?utf-8?B?ZkdkNHJZN2NLYkpWanRTU2dJMmhnQ0pTUlFkazBUai85RUNhVjRzMlhLK2py?=
 =?utf-8?B?YzhqSEF1SldxdmR0djRXYjkxVDNHdWovbmpIMFdZMC96WStRUFBZdTB5R1k5?=
 =?utf-8?B?NmRBVmRzem9KNHlvZXkwbzI0eVg4bDdQRDBrWEJOOFlFbEVLTjErMjRGalpi?=
 =?utf-8?B?Q3BnYktVUldBZE9wRDFqbHFnNjI4WXovaTdZWWdWOFBqWGptaHpPOXJkNjh0?=
 =?utf-8?B?TjNNN3NNRlFBOFdyR2xKWmZXaHBwR2lVLzF5dEkzY1dnMlNIcUQ5cE9rUDhI?=
 =?utf-8?B?anRuTlU4WGNIVFZRQUYwdjVSR0xuYStRY0hrNkI2Y0VOMnh0dVhtaHp0c0p5?=
 =?utf-8?B?TFljZHIyc1dCRGlHOVQ4bmw3S3BYdUx2L1EzNTgxUUpEb0YwMVRCTlBEUGxR?=
 =?utf-8?B?SDVoU3huMDFrQkJRYkl6M3J4bno0VnhncjVuUHZGU2M0NkxnSGxUT2xlOFFZ?=
 =?utf-8?B?R3Y0RjJ1V1VaWWplcWdLYmRZbUFZR1NuNSt4dk1MVDVLaldFUmM3SkhxU0Y3?=
 =?utf-8?B?WVNuMHVVSGNETTk3RURQMFlkTlhhUmdwRVNKWlA3RnVuWjRWSHJoRTRWTXdr?=
 =?utf-8?B?TWhER2l3QzlvS2toQ0xBQ0tXQmZaVG9hN0YzNUduUUplTEdFMXZyNW9WQ3ht?=
 =?utf-8?B?ankzTDNBdVVHajZSdGlIaUdXcndDOTBuRktvTG5obW5Fa1Z3STZwbUtUbVZ2?=
 =?utf-8?B?eU9QbVJDVS94WXhtZVROM0FqUlJvdW0vdjJPcmt2NDBORVYxREwybktacnox?=
 =?utf-8?B?NWZWYm9scTJ0R1RITC9Oc3RBdHRXemxqQ05RZkFxVFdEZFFkcXU4MUl4RzQy?=
 =?utf-8?B?cjdBZlRjWjZGT1E0WnVibUJZWHVwTEMyK1pEZDAzSGY5UFdtbWxNYTlOamZJ?=
 =?utf-8?B?M3crRkJ0eU9DRjlRVXlad1FjZkw5aWkzRys3aTNmWkZlVWNXM1FRNUFQdzUy?=
 =?utf-8?B?a281aFd4Zzd0dmh0Syt1RUR0amxZZjFIOENLQXdVaWpTZDVIZzFzWDZBUEJL?=
 =?utf-8?B?alcxNHBoSTcvb1BKd2h6YnJHSFhWanp1TXlHbEFoS1dlZWxxSVdyWHpYMzg2?=
 =?utf-8?B?WUJkcnpPbGFRK0ZCNWVKcVFpcTVRcUFaVlZFZlVzd1dWZGJLaWhhbHk5RURx?=
 =?utf-8?B?SUEwTFY3aWNkdmRFUXJGWVc1dXluM29lNkNKLzVFN2hrREZGOC9DSmVjbVJS?=
 =?utf-8?B?Syt0TlBPeEFNZzRHQ2IvMW50aHZUTHZVeFFFZkY3MDFSTEc5REUwRWN5bkpo?=
 =?utf-8?B?UW1HY1M4WVlnbEpLcWRVa3R5S1dIREF0VzBya1VCQkVURHZOa0dzb1JkZzda?=
 =?utf-8?B?aFNVLzVmTHgvOFRjb01rNEJhQndtWndMemVjemtJbjFyOXNmZnpuRmxZb3dq?=
 =?utf-8?B?MEJnbTJ4ODF6eXBrdklIUS9GR3JYdlkxenVjMStOMG5ON2F4UDI2LyttT3Vn?=
 =?utf-8?B?ZVBtYTQ5K0QvVUhhTlhlek1TNkVqV21qbFJiM0xSOTBGTVhZcDhvbW9lTGZn?=
 =?utf-8?B?cFZxcFlnZHJYeWxTYnFTbkFNc3hzRGtNK2ZmZkNxZkhKOHFzdUFtbE9BTzBI?=
 =?utf-8?B?WWhtQ3pJYnJrME9RUytMb2lEdHliU0dHdHdzSlhDZkZHNlljWFlTSCtLdVlq?=
 =?utf-8?B?VGhROWVVTUNtajBFenoxT2haaCs4aiszeVdYQXFaZHhuWFRIbFRDbnR6bDBn?=
 =?utf-8?B?L3hCOGVHSmhnUms4djUzRThubXd4eWRONmZ2L2xVNUhRZG5jWVB2cm9aYzdt?=
 =?utf-8?B?ZnB6UjgyNExVYUE4azlLcjFlUFQ4QjFOMTg5Z0JoVlIvZjk4bUVXelJpU0pm?=
 =?utf-8?B?Ulo3VXgzdVZDVU1MTEJobFJiZ0x2eVIxYnBOemREdWtDZGhpTC8vWDBkc2k4?=
 =?utf-8?B?a1gyemZjSDJHbVpDY3VQNjBXYmlKVkFTZUZNL05tUjJmbXhrMTBtOWtGQTlJ?=
 =?utf-8?B?dnhrWnhmTURnNStJTXVXa2hoRkRCakZ4bjJrRnJMdkdsalVVdUI1TWJ5cG9m?=
 =?utf-8?B?OEIvaXhKVHZXTHNmUVFhR0dMTml6ZkdRbGd3dz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 16:16:47.5553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 517ec392-58c5-4518-842c-08dda83a332c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351

On 6/10/25 11:51, Roger Pau Monné wrote:
> On Tue, Jun 10, 2025 at 10:22:57AM -0400, Stewart Hildebrand wrote:
>> In file included from ./include/xen/pci.h:72,
>>                  from drivers/pci/pci.c:8:
>> ./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
>>       |                                                  ^~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Sorry, it was my fault.

No worries, it's pretty hard to catch when it can't be built without
extra patches.

> Would it make sense to introduce a Gitlab build that has HAS_PCI
> enabled?  Or it won't build either without extra patches?

It requires one extra patch ("xen/arm: pci: introduce PCI_PASSTHROUGH
Kconfig option"):

https://lore.kernel.org/xen-devel/20231113222118.825758-1-stewart.hildebrand@amd.com/T/#t

It has an ack, although it needs a rebase and we would probably want to
add HAS_VPCI_GUEST_SUPPORT now that upstream has that config too.

