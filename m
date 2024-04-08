Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30189BBA7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 11:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701816.1096440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlIn-0001Me-8E; Mon, 08 Apr 2024 09:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701816.1096440; Mon, 08 Apr 2024 09:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlIn-0001KR-4L; Mon, 08 Apr 2024 09:28:33 +0000
Received: by outflank-mailman (input) for mailman id 701816;
 Mon, 08 Apr 2024 08:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pPud=LN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rtk78-0006cr-IQ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 08:12:26 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b98ea12b-f57f-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 10:12:23 +0200 (CEST)
Received: from BN9PR03CA0955.namprd03.prod.outlook.com (2603:10b6:408:108::30)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 08:12:17 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::33) by BN9PR03CA0955.outlook.office365.com
 (2603:10b6:408:108::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Mon, 8 Apr 2024 08:12:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 08:12:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 03:12:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 01:12:16 -0700
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 03:12:14 -0500
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
X-Inumbo-ID: b98ea12b-f57f-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDWKTzN7r8uerAVttRvtafoSxUyV64NsR39u/CY5UNxv0JvxDFH/5HrRo5oYlsF/mscvyhnkXV3obcS425fGrvukZYKsyOyAUGy2IsAv7FecTyL2r5WwSfwhMnIC0soHJFwZZLe2hVSsC9AYkYQo0ACscmaeozXlqgUN5wh8lFfw6UM1oTi8ij6+CSVo92IMll+ITlJk+sqznx7SGOylv99ZWIMMYYTq4xuN28LD8nLpYg7Rg7Dj9rmQUG7VAn3IPEOrU59hJVl+QCnCGwNflconbBdtsU9+9S2fOiB08Esl5WBNPPCk1Gah6AAPIPOju0XbzlqhQ5vN38F7y4EcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1sonoLhGzw/2bSfHhBfvUL6L2IYcQ/CpT0bzHR994k=;
 b=oV+Q5zAGObngdDhvIqN0UlbTxhBoasL5vWH0qeSphhUEUHGhUohY29SW2HAL2eYuY6ZW54UoNYpD+yaLLaownnDh4Ehy4+LKyJ6TmwJ5GWKJmRYp04K5Y8Q7Gn1Oz/olqJmOheRTWdau6RSTZDP2RfCyCYyL7Yz8ckfNZLoelpTr+dFtroJeUYRfYhVbz+2iyFQcW4RvTbcdDrImDtn69nqLIc+pHHJkmmmCO1I+uMjA+IOl0yIBTxUDY4bydv43E2Y7/6ZsM7BiB7BorioDeZ4jxnM1N2QjbIBPzPPsunbFK85mN30SYolbf0WAShTcbsSVbDciFx+nJA8twaBonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1sonoLhGzw/2bSfHhBfvUL6L2IYcQ/CpT0bzHR994k=;
 b=vGsHwUvFCHCWIYJwhaC38MFekM0PB/ELAMFeMaIrZ019exOfSpHh8xJeIrrCNhe1Qxvb/zMg6Svj2UQFg6ryhhyQVQn0upCSxA3fYOHQMmf+yvsGxosMt+5YCZrqrexqb+oTIrQZHeTr1XCst9nYoWzmgxrtnYYOSCcE6kZkeVM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e5b8e385-6d72-4102-bd0a-47f868535b90@amd.com>
Date: Mon, 8 Apr 2024 16:12:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Alec Kwapis" <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-5-xin.wang2@amd.com>
 <e9167c39-187f-4a66-b9a4-8b3a6ae3000b@suse.com>
 <09cc419a-cdf6-4cda-90f1-c0e1ae83ad47@amd.com>
 <951cc6ba-c971-4b5b-9cfc-bc79245a9549@suse.com>
 <9518c19a-eb97-4d68-97bc-fcae56aa8093@amd.com>
 <0a28ce70-6c71-43da-8aa1-3b9909e2d152@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <0a28ce70-6c71-43da-8aa1-3b9909e2d152@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|PH0PR12MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: ff33f1ed-5467-4347-ec17-08dc57a39b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jTf2H48EPA6a042wAgvSXP5fgyUEB0rYNyocHhHe8VIlEgtFmrXRtKFlxNj+8CI+jsDEPWz9A99sHKS4mms8eVk1N2qwBzzSKWo0Lk2VyW8v+cx7HwCWbnfEB4ED4vyBi1GtzWysXbQ6RvI23uh0wOovl8koBnRerYXVlVRpanjJZSyMx+BlEtfG8Zu/We1sQDyUuJHjI54L9g+8eavmgizMxo8WB50kDm0DsMUIJlub1x6H+ggX6doy4GCAhpe/kjZMw007QvY3//KZH87eyZRaZvuT6gI1dNT2KTOkPwvpM1DSXp+XQ8yk3mcZB2WwKaXFqo4250UD2Ok2W8Plro2oY8OGIhhvjXyG//jsZVFwYeuQbrSGUKetpJLjOA/dctSv08E+gTjUooR1ysHjVPvC6LmhbTFibgQTm6Z9iQePEL0nmcRqDlh2Qw8zt/nULhMHbg8cZ1nT7dZH0ZynQfUE4gwBy2LoOdBPbNIQlsUrhMdWwtkbFsPqHQvyM9UszeCLCLHDBKqoVXh2YP9E0f6EIw3rXjMN416lmYn81UaV0WPuIiT+BPpp9kZZpF1jDmpu4qEhGpw2g/mYRh1wnpskMmemYTFystW7MWg4x+eykaPEiZzVf+7byZ5HnSJr5rvZc3uuzswuSSV0zE05DUvg6bBZyb5ZRbnoY5FCtRzmDY0T1NoPVvCYZWa3NuCdcPgdyXoq4OUKgDK0PRYn95lHjoODv30JjUf+vg4Q8LuSbMx4KtzqOAVCUhFQ9aK6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 08:12:17.2555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff33f1ed-5467-4347-ec17-08dc57a39b16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837

Hi Jan,

On 4/8/2024 3:03 PM, Jan Beulich wrote:
> On 08.04.2024 08:59, Henry Wang wrote:
>> Hi Jan,
>>
>> On 4/8/2024 2:22 PM, Jan Beulich wrote:
>>> On 08.04.2024 05:19, Henry Wang wrote:
>>>> On 4/4/2024 5:38 PM, Jan Beulich wrote:
>>>>> On 03.04.2024 10:16, Henry Wang wrote:
>>>>>> --- a/xen/include/public/memory.h
>>>>>> +++ b/xen/include/public/memory.h
>>>>>> @@ -41,6 +41,11 @@
>>>>>>     #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>>>>>     /* Flag to indicate the node specified is virtual node */
>>>>>>     #define XENMEMF_vnode  (1<<18)
>>>>>> +/*
>>>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>>>> + * or static allocation.
>>>>>> + */
>>>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>>> As before, a separate new sub-op would look to me as being the cleaner
>>>>> approach, avoiding the need to consume a bit position for something not
>>>>> even going to be used on all architectures.
>>>> Like discussed in v2, I doubt that if introducing a new sub-op, the
>>>> helpers added to duplicate mainly populate_physmap() and the toolstack
>>>> helpers would be a good idea.
>>> I'm curious what amount of duplication you still see left. By suitably
>>> adding a new parameter, there should be very little left.
>> The duplication I see so far is basically the exact
>> xc_domain_populate_physmap(), say
>> xc_domain_populate_physmap_heap_alloc(). In init-dom0less.c, We can
>> replace the original call xc_domain_populate_physmap_exact() to call the
>> newly added xc_domain_populate_physmap_heap_alloc() which evokes the new
>> sub-op, then from the hypervisor side we set the alias MEMF flag and
>> share the populate_physmap().
>>
>> Adding a new parameter to xc_domain_populate_physmap() or maybe even
>> xc_domain_populate_physmap_exact() is also a good idea (thanks). I was
>> just worrying there are already too many use cases of these two
>> functions in the existing code: there are 14 for
>> xc_domain_populate_physmap_exact() and 8 for
>> xc_domain_populate_physmap(). Adding a new parameter needs the update of
>> all these and the function declaration. If you really insist this way, I
>> can do this, sure.
> You don't need to change all the callers. You can morph
> xc_domain_populate_physmap() into an internal helper, which a new trivial
> wrapper named xc_domain_populate_physmap() would then call, alongside with
> the new trivial wrapper you want to introduce.

Thanks for the good suggestion. Would below key diff make sense to you 
(naming can be further discussed)? Also by checking the code, if we go 
this way, maybe we can even simplify the 
xc_domain_decrease_reservation() and xc_domain_increase_reservation()? 
(Although there are some hardcoded hypercall name in the error message 
and some small differences between the memflags)

diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 8363657dae..5547841e6a 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1124,12 +1124,13 @@ int xc_domain_claim_pages(xc_interface *xch,
      return err;
  }

-int xc_domain_populate_physmap(xc_interface *xch,
-                               uint32_t domid,
-                               unsigned long nr_extents,
-                               unsigned int extent_order,
-                               unsigned int mem_flags,
-                               xen_pfn_t *extent_start)
+static int xc_populate_physmap_cmd(xc_interface *xch,
+                                   unsigned int cmd;
+                                   uint32_t domid,
+                                   unsigned long nr_extents,
+                                   unsigned int extent_order,
+                                   unsigned int mem_flags,
+                                   xen_pfn_t *extent_start)
  {
      int err;
      DECLARE_HYPERCALL_BOUNCE(extent_start, nr_extents * 
sizeof(*extent_start), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
@@ -1147,12 +1148,50 @@ int xc_domain_populate_physmap(xc_interface *xch,
      }
      set_xen_guest_handle(reservation.extent_start, extent_start);

-    err = xc_memory_op(xch, XENMEM_populate_physmap, &reservation, 
sizeof(reservation));
+    err = xc_memory_op(xch, cmd, &reservation, sizeof(reservation));

      xc_hypercall_bounce_post(xch, extent_start);
      return err;
  }

+int xc_domain_populate_physmap(xc_interface *xch,
+                               uint32_t domid,
+                               unsigned long nr_extents,
+                               unsigned int extent_order,
+                               unsigned int mem_flags,
+                               xen_pfn_t *extent_start)
+{
+    return xc_populate_physmap_cmd(xch, XENMEM_populate_physmap, domid,
+                                   nr_extents, extent_order, mem_flags,
+                                   extent_start);
+}
+
+int xc_domain_populate_physmap_heap_exact(xc_interface *xch,
+                                          uint32_t domid,
+                                          unsigned long nr_extents,
+                                          unsigned int extent_order,
+                                          unsigned int mem_flags,
+                                          xen_pfn_t *extent_start)
+{
+    int err;
+
+    err = xc_populate_physmap_cmd(xch, XENMEM_populate_physmap_heapalloc,
+                                  domid, nr_extents, extent_order, 
mem_flags,
+                                  extent_start);
+    if ( err == nr_extents )
+        return 0;
+
+    if ( err >= 0 )
+    {
+        DPRINTF("Failed allocation for dom %d: %ld extents of order %d\n",
+                domid, nr_extents, extent_order);
+        errno = EBUSY;
+        err = -1;
+    }
+
+    return err;
+}
+


Kind regards,
Henry

> Jan


