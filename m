Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1144A73312
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 14:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929264.1331882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txn0K-00073I-Lm; Thu, 27 Mar 2025 13:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929264.1331882; Thu, 27 Mar 2025 13:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txn0K-00071H-Ip; Thu, 27 Mar 2025 13:10:40 +0000
Received: by outflank-mailman (input) for mailman id 929264;
 Thu, 27 Mar 2025 13:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92XN=WO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1txn0K-00071B-3w
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 13:10:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2415::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddb7fbb2-0b0c-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 14:10:34 +0100 (CET)
Received: from MW4PR03CA0057.namprd03.prod.outlook.com (2603:10b6:303:8e::32)
 by CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 13:10:30 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::af) by MW4PR03CA0057.outlook.office365.com
 (2603:10b6:303:8e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 13:10:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 13:10:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 08:10:28 -0500
Received: from [172.17.183.194] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 08:10:27 -0500
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
X-Inumbo-ID: ddb7fbb2-0b0c-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRGVzRpZS/qoj5uuBiQdYv8OdUPOlhzkacw+AZK+h8H5ST90VYUCeTicf+SzDDoMzINvys5NEWASRKKjE2xphBMOYHfBIUn/v7kSq+hggnbuOtjc9fDzASSeheMBsIYFVf+884HUYY/R/tvEmQeOSwdML1jNmW3YwYeUbc3LgkM9/sDI2UBsIUNh8I8eGiXrTIlkGyhPzVFaOfjy8VOLo0uSPhBDGSbRFAWk2YF0MK9z1uX70KjRyUVDIMBsydcLIs15LSUgZ31/OhPGfWjDxFmiv5JURRGCazGZg70CGJ3jqO+Aab+uaGuWLU3QYDhOCNqopWc3xGGFdJ+pjVj5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5bIlOECIDuXi7tNjnzbQXAmEnw/LIcLpPOIU/e1LKI=;
 b=qRzxJ9sKB99ogXg0vJD03zd3ClPdi/zwstSOdA9XkaujH2zR0qbS5F3QXu4V1aCShbJRF8UUZyqw4WzGjaidmfLEjVexGI81tvvKxtp24yv5RI1vrwXmtCGKbdPmP1KCD6vyAcqlFV3OKpbc4HQOXXSqJXYlt4yqpJJ9uHxOhErv2M97j/woXkx9rcNgeqjOfMLISwmD+ybjqmDuZ7uST5zAbvE4ZImDKDDFo8EUPNBaQ+Phir67xt0fcCnK3QODI9TmBNGilc40lIxgVgQqrEkr7yGmLfvghrkwGE4Y4sOy4DjxB8omTabjMsHGfEWZrb0wrpj/JM7MiDUDiMa0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5bIlOECIDuXi7tNjnzbQXAmEnw/LIcLpPOIU/e1LKI=;
 b=iYFzo9tnX1JAM1+kolBRQZgLFSXJOSM9QENDcnUCPXysr+EVrooVgP4kKB3Pz/KxfvZ5c/gKzQct5LuOV1HcuIuzuzmunpqtWE7GnjhQkXxeDFlPbk3KNNH6DMB7hGWJ9/ZEn6xlxeFzhOf5VqVYxgaSjaZSBeEgIsUxroTvrxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <66c8b421-fa74-4a8e-9ec6-ffdfd5082b72@amd.com>
Date: Thu, 27 Mar 2025 09:10:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen: x86: irq: initialize irq desc in create_irq()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, <consulting@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
 <20250327004044.2014048-3-volodymyr_babchuk@epam.com>
 <84903e47-038c-46f5-862a-a0c9623c8125@suse.com>
 <bab91924eb87a56260d62faee028d5af@bugseng.com>
 <2836f7977d3a7061f481c1e83d0b2820@bugseng.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <2836f7977d3a7061f481c1e83d0b2820@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e9323d-54fa-4cd0-27c9-08dd6d30bf8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUFWb1M0cTFuaWdnd1lXZyttY2wwVkV3ZkVPUTR6czkvdlAwVk9hMUNhdTV1?=
 =?utf-8?B?bEZyczJEY0xQYzkxd1RGRmRHbVI1azdaRmo3UEtmb1E1QTBma1lETVhRdXV1?=
 =?utf-8?B?blNTY0o2RDgyRXljRzFNVU9RZXBnbkVOM2Z4QTV4WStINkJpT1FXWE9TZGpN?=
 =?utf-8?B?TURlSU81MVd3aEU5TXd4U1p6NnIxRDZLeHRoM0I3cnppOTI5RGp5NVNtN0hj?=
 =?utf-8?B?UDhHREFoSDlEclJ5UWlQTzJ6VnQvenJRTU5FWjUxQTh4OThSY0lDVmF3M2Zs?=
 =?utf-8?B?ZGtCNng1KzhTUUhGdnNWTjlNV1hjTmZxUURtR2pmbmlYbnVXMmI2RUJ2bnBz?=
 =?utf-8?B?N2NqcldZMnhEWkZGaUpkT0VaOGorbEFLL1BETUF6ekJDWXpxVUloUG8zZ2pp?=
 =?utf-8?B?RTh4WStxQjlBanNUM3JxQXdnZEgzVSt4NkVXMjZWUzRXTjd4TzBuR3Y2UFh2?=
 =?utf-8?B?cVpoQUZkbHZHZTg3OG9JVndKYXErYkxyU0RGay95SENBbmlTdW5nUTYxbm1i?=
 =?utf-8?B?dTBRRVlXc0hGWVo1Wk5LWS8wdkVyTkVWWmZBKzJQSHI2bnpzMVJ5dnBtZitX?=
 =?utf-8?B?T3dsNGlKNzlOQkVWT1I1M1RuNzZWM0lKV2ZQN0dESzJBemFtemVGQW45dSt3?=
 =?utf-8?B?UGVLTkp6WHVFcEMrbEVQcW1XcmloZDRYeGJtR01sL04vSktFRzJPWDBQbXZS?=
 =?utf-8?B?emptWnlRZzBvcUkzTDc4ZmRMNURhS3ptZFc4N3lzUTdzWkdLUkllaC9yUGxM?=
 =?utf-8?B?eVN3c01wMXd2R1hkV1FnSmNpaWk4SzRna0dEcmFnZ2tPT1Y3UURMamxURmJt?=
 =?utf-8?B?bnFFNk96djMvTXZjUno5cHJyYjkyMXhKYkYxQkp2N0dwbzJXcnZhaGZLaXpR?=
 =?utf-8?B?WUVBa0g5NGQwSC9MVkRkczkzN1Q5U1FBMnpmbk4wR1pOVDc2UWhzL1Ard2lh?=
 =?utf-8?B?U2I2UFllZkhKdi9wbXNpWjN4TFBxV3FyOEgwWVEzVW5DWW1DZEdHZ3VKNnc2?=
 =?utf-8?B?SVVzc2oyQThMRk5YTC9zK0hhc0ZNNXU4Q01HWEVHc3dIUHc4RjdKTXgxSlox?=
 =?utf-8?B?NGdHS0VmQ29HK3Z1TWY0elNvRXR3VFdKcVpLRVZla1pxUkFZR1Q1R2IyM3Bs?=
 =?utf-8?B?Y1poMFNqNDRYVXNGcXQ0SnJyNTZNaEtIZXpKYjBHSXJZYzRBbEQ3RW0rcW52?=
 =?utf-8?B?bjVQemFZZGpPVzVkY1ZXSG90dnViTUZNMmFmL1JhZExxTXJTMW9KRG5tbENx?=
 =?utf-8?B?U0MzSlY2TzVYamdWekF1NU5PZU1ZeXdGcHFnU2NWd2pKTFREd3VtNHdUKzg2?=
 =?utf-8?B?dzJQUmtQdEJlYndjS3c0WGVWNW1tSGErVVJzQldDclpabmViOTZYeVRSM21W?=
 =?utf-8?B?L3VYTVFLcXJaWUU3MStYU1hGSFZpbGdscyt4Nm40U0cwTjJRckVBbjZCOWsz?=
 =?utf-8?B?bWh3VWFMZWVwWDdlTU9aWVpwU3hIcmtDeWdaaFNEZlZON1p3d3VIWGFTdThY?=
 =?utf-8?B?K09lNFdiSVpaZmtuZHdZWkI5d0pHZVRjcGpaMG11QU1VTGU2ODFBMWdsZkNm?=
 =?utf-8?B?ajh2OVYweUtSZ3dBekp5N3EvSFptdzRSamFDNUg3a1Jib25mMHVSYkIwdGxw?=
 =?utf-8?B?c3RObTRRUjl4NUpQbkVsd1dKL25LUWcycittMU4yU2kzSCt5aC9KQTAvTmtR?=
 =?utf-8?B?UmJ4TCtQVnBNOXFjVTlaRVZGZjZDem1kTXlnODBxZS9mVDVLdHoycFJFU3FN?=
 =?utf-8?B?NUVPL21MRWMzUHBOOS9DS2VUd0t2NGJxb2h3WXBCSUlKSENqemFtMkFmRllZ?=
 =?utf-8?B?TUpVWXdqWnJ5MHI2ZDlQZ3FWLzBJZE1YNDF3UUZGNjlWOGlwaS9mRFpYZytZ?=
 =?utf-8?B?d2xpUEM0VWMreVR3RnQ3cmMxODZiRUVWRll2eVc3ZFdmdTRGc0lJTFhtZnQ2?=
 =?utf-8?B?Z0g3akFBRFlFRDNYVDg5Z3pQajh2ZkJvZUR4NFdaenA4MVBhV2o1TXNvb0lI?=
 =?utf-8?Q?Sx+dSe9Q7Ai+w6RUSEFwAfYrW+YV60=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 13:10:29.4160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e9323d-54fa-4cd0-27c9-08dd6d30bf8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395

On 3/27/25 05:00, Nicola Vetrini wrote:
> On 2025-03-27 09:37, Nicola Vetrini wrote:
>> On 2025-03-27 09:03, Jan Beulich wrote:
>>> On 27.03.2025 01:40, Volodymyr Babchuk wrote:
>>>> While building xen with GCC 14.2.1 with "-fcondition-coverage" option,
>>>> the compiler produces a false positive warning:
>>>>
>>>>   arch/x86/irq.c: In function ‘create_irq’:
>>>>   arch/x86/irq.c:281:11: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
>>>>     281 |     ret = init_one_irq_desc(desc);
>>>>         |           ^~~~~~~~~~~~~~~~~~~~~~~
>>>>   arch/x86/irq.c:269:22: note: ‘desc’ was declared here
>>>>     269 |     struct irq_desc *desc;
>>>>         |                      ^~~~
>>>>   cc1: all warnings being treated as errors
>>>>   make[2]: *** [Rules.mk:252: arch/x86/irq.o] Error 1
>>>>
>>>> While we have signed/unsigned comparison both in "for" loop and in
>>>> "if" statement, this still can't lead to use of uninitialized "desc",
>>>> as either loop will be executed at least once, or the function will
>>>> return early. So this is a clearly false positive warning. Anyways,
>>>> initialize "desc" with NULL to make GCC happy.
>>>>
>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>
>>> Hmm, this puts us in an interesting conflict, I think. Misra, aiui, will ...
>>>
>>>> --- a/xen/arch/x86/irq.c
>>>> +++ b/xen/arch/x86/irq.c
>>>> @@ -265,7 +265,7 @@ void __init clear_irq_vector(int irq)
>>>>  int create_irq(nodeid_t node, bool grant_access)
>>>>  {
>>>>      int irq, ret;
>>>> -    struct irq_desc *desc;
>>>> +    struct irq_desc *desc = NULL;
>>>
>>> ... consider such an assignment useless (and hence potentially confusing)
>>> code. I'm curious what BugsEng folks are going to say here.
>>>
> 
> Just to mention it: having a "do { } while" loop instead of a for (just out of context) probably avoid tripping gcc's false positive and also help with MISRA Rule 9.1 without needing an explicit initializer.
> 
>>
>> It is quite odd to see this only in coverage builds, but the side effects of coverage options might trigger some of gcc's internal analyzer thresholds. Anyway, since there are no concerns about dead code (see https://gitlab.com/xen-project/xen/-/blob/staging/docs/misra/deviations.rst: R2.2, "There shall be no dead code", is globally deviated) and that this might actually be beneficial to remove some caution reports for R9.1 ("The value of an object with automatic storage duration shall not be read before it has been set") I think the overall effect is positive.

I tried running an "-Og default for debug builds" change through CI, and
I ran into *almost* the same error with -Og and certain version(s) of
GCC:

arch/x86/irq.c: In function 'create_irq':
arch/x86/irq.c:298:25: error: 'desc' may be used uninitialized [-Werror=maybe-uninitialized]
  298 |         desc->arch.used = IRQ_UNUSED;
arch/x86/irq.c:268:22: note: 'desc' was declared here
  268 |     struct irq_desc *desc;
      |                      ^~~~

The do { } while loop Nicola suggested indeed fixes it in the case of
-Og:

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index dd8d921f18f6..812f9eb91453 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -267,12 +267,18 @@ int create_irq(nodeid_t node, bool grant_access)
     int irq, ret;
     struct irq_desc *desc;
 
-    for (irq = nr_irqs_gsi; irq < nr_irqs; irq++)
+    irq = nr_irqs_gsi;
+
+    if ( irq >= nr_irqs )
+        return -1;
+
+    do
     {
         desc = irq_to_desc(irq);
         if (cmpxchg(&desc->arch.used, IRQ_UNUSED, IRQ_RESERVED) == IRQ_UNUSED)
            break;
-    }
+        irq++;
+    } while ( irq < nr_irqs );
 
     if (irq >= nr_irqs)
          return -ENOSPC;

