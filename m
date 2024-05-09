Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778538C1208
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 17:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719296.1121963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s55kb-0005yU-Cs; Thu, 09 May 2024 15:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719296.1121963; Thu, 09 May 2024 15:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s55kb-0005wy-AF; Thu, 09 May 2024 15:32:05 +0000
Received: by outflank-mailman (input) for mailman id 719296;
 Thu, 09 May 2024 15:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fDZs=MM=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s55kZ-0005ws-2h
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 15:32:03 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 465fe7db-0e19-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 17:32:00 +0200 (CEST)
Received: from MN2PR18CA0017.namprd18.prod.outlook.com (2603:10b6:208:23c::22)
 by CYXPR12MB9317.namprd12.prod.outlook.com (2603:10b6:930:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 15:31:55 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::94) by MN2PR18CA0017.outlook.office365.com
 (2603:10b6:208:23c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Thu, 9 May 2024 15:31:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Thu, 9 May 2024 15:31:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 9 May
 2024 10:31:54 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 9 May 2024 10:31:52 -0500
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
X-Inumbo-ID: 465fe7db-0e19-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqSlTqQJhWSTeBw7QJsoO6jJH8hKkMiRYkwT0Xg2ExS6iqGYNvMq1BD2JPMsC1t2vE/c4QFTRDbjPnZirTeC/po+h4mdjO1QCy2etNJmCQH/Bq23wcdkQ0UNKpigmQrx/9lWk7xETOcfJLc4b1bdQGdzmIftRg6RLThS6ANDuV+Y8gjXiDUbFBLYfFPjF327u5nttn28oCoht/uoBnyPhth0XOLBMN10XjorLMn0D+2SOi7kDavCOuXDDFQzVDcnWWginjpUIhFuI7hJN0XVuKTZ5vu95JQgvbQ6IYaSckeUa1O0q8lxyVA+zshivTMIxL5p5MZl3bIZTs/lM3lRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcU+yZxf3EXhz/qPnftjxilBRj0xGQiRpjMhQXqU3TI=;
 b=HDrA7w7HWysUdHBlN+z2c4Sbf4a7wGn/5AG4OyQN6i17dD0rlzDPj/uZuC6GTYwriIfuO40IJZ7Wa+R04ayeT4qX3RQJA5A2UBaMQOCvQxHRIPO9Iv0UDd+GrSpKXjw/BgheWFy8DdRj+JvhbyYPe+8QFWqg7jALQcyvJs9lCWF7HGnbBgpClPxSn6MQ3bmGB2K4ORazrzVKnN8c+wwb2zpU/zE/vtVfcYIKJ6DYcj3rHezw49eC0qEfBilNfsMI0+6dm+dUODrAwdCdCSHh5IW/UJkfn9BAkN4sv5b1nXRZfk8/k8hRFmZytpeepqIQRZLq32tFYOj9k1bpnUU9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcU+yZxf3EXhz/qPnftjxilBRj0xGQiRpjMhQXqU3TI=;
 b=1J79elJrvgl6DqgxtaEi431ii8FmkX34ohm+9iREOyivnTDUjd4WLnBcn/Hy1N0HCTG7ZRzMg4aP/BMa0Rr4iuAeuWhlwwYh+n2BxbS+gV0WB5iZ3Wix2JA1Y03iuHPKrWfgKrmmWbf4t9cSV3mV0LJLgqRKzjP9L1DH+vOx5H8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ff5e2477-ed5a-40cd-a592-5ceb3bc8f1f1@amd.com>
Date: Thu, 9 May 2024 23:31:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running
 VM
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-3-xin.wang2@amd.com>
 <670d1033-2443-4245-8ff1-cb7099a7c793@xen.org>
 <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
 <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
 <1a29ae76-a902-4a24-8fd1-ac26ef228971@amd.com>
 <365e1b12-6b20-40ed-8ca9-beb643c907ab@xen.org>
 <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
 <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
 <8957ab21-796f-4e15-a89e-d040e6f7b5ca@amd.com>
 <995ce39d-6a04-4bdc-bfe8-bcef3da24cc2@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <995ce39d-6a04-4bdc-bfe8-bcef3da24cc2@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CYXPR12MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbe64f3-168a-48eb-42b1-08dc703d2863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXI1TGZrSC85VklyOU9tbVc2cGZxaEo5TkMzMk5ybVh4SmVPVEJjYUVuYmIy?=
 =?utf-8?B?cmRHUnplaG1RcXpMbXNHcEs3c1o2Qi9KZjhCZ2xSNEF6VW1mRmhmT0ZGUUt3?=
 =?utf-8?B?Smt1ZUlacXJ2Y2ttQVA2ZTJGclE3Y1Zsd01ZMHNFUzAzSUg2VnJpWkhIV3Vy?=
 =?utf-8?B?QTJIY0gvaTliTTNJdGZaUHh3Q2RucGJTQVhVUnpMZVkzZ2VaK2FmQkpnL0tR?=
 =?utf-8?B?ZStQVlAzMHIvT3lHbjRTOExFOW5RWjJUNEQ4VnhQMWhWSEVnRC9qUDFWTTBT?=
 =?utf-8?B?RlU5WnIvVnAwUU5ITjZrbVpkUW55T2dLamttdUhET3UxWlE4czJ6WkRpOGFr?=
 =?utf-8?B?dmVTVHJ0R04zMWhHczBrRHlzVGM2Q1duVFI4VktQbFRnaVV5T0NCU2VCSmlG?=
 =?utf-8?B?MzFuNDhwK0JuTG9qS2owbVBuWXB1a2FrVHJTK3duRDNDaVQ5OVFPL0laWWpH?=
 =?utf-8?B?ZTc3dkN1ZEpwaGRKeXpYYm5BSkh4SHJqalNNZm1VMWxtaEZHSUdFUHpoQTBj?=
 =?utf-8?B?U1NaMVhER1M5VEZMQmF2Z0M5OVhBRTJaVXJuVEJOdis2SURtcU1yd2hoZFJi?=
 =?utf-8?B?YndpTzBoanZZZFBHV3ZsaDFsemdvTmdRNjQzSXplaHNpdmFMT0tlbCtCRVQx?=
 =?utf-8?B?SUgzYnIybDMwTUJSY1hUaUNwQXQxMG9CZG9RYnpxQWFDbzRadDNiWUdlL2V2?=
 =?utf-8?B?NmhaRk9ENXROTkhqWjZiYnVLVVV6TldZUGpWbnkzWjUxWHpNakxscFBYWU8v?=
 =?utf-8?B?Y041Rjg3NUR1ZktCZ3ppTU1pYmd4MVE0ZmduVC9CRmtJNEs1djQ1ZEZGVVh3?=
 =?utf-8?B?NG5KSWJ0emJrQXk2dTA0ZGFoRjBmVEVEYlFwa1hvMWVWWE5BNUpLRDBHWG0v?=
 =?utf-8?B?VVFEZGNnRnA1cmNoMkc5dkppK09RYnZxTS9qSUhqQ05oZGV6TUNOZG1vZWZP?=
 =?utf-8?B?c2tBNkNqQWRycmpDYmEwdFRBaVNVNGpyNVVQTE52SXNaNlNFWlBIRitKeTd1?=
 =?utf-8?B?STM3VEJ3Q2poUlpZaS9DV1drd3MvRWNSQ3N0UlBDSDZoVjVtNys1NDJuYnFO?=
 =?utf-8?B?RWVWbWFDdlNVUVJZZ1ovUU5wcXhjUm9jdm1IY1h0Z1ZyMEw5LzRZYVlRUGRv?=
 =?utf-8?B?WitVeDU4QUEvQ1M4d0tHRGNxQmxZN1huVmM5VHJlK1lHRFdzWk0wMDVMamJn?=
 =?utf-8?B?N2w5WGtKL2hPWjNvQ2YrT0VhNWZ1aWJZRXFWUU83aXJyclJ2ZUJWdW5CNlNn?=
 =?utf-8?B?eklhREFod1RReDVoblQ3dEdSNnpCWkhTTU45eFQ0WVlScG53elBobTF3M1ZE?=
 =?utf-8?B?amxXY1VuZ1VKSzcyVm84SXlEdmpuc1ZQR0tuTEVWM0MzckV0cmViOE9CN2RM?=
 =?utf-8?B?d0hKY2NyS2xHNmJGM1BZSlhsNmd5K0l4NDg2TWNFRDE2M2VNelFHOVM0clcy?=
 =?utf-8?B?WS9TU0ZPNHRsTVRsWmlBZUtzWmlIbDR0dFNkZjQrcUY2OEoyeUNvUWhJVzFV?=
 =?utf-8?B?UTVsckNNNm5NY2xrR1BKVUZvVUdTeXRGeU1kcVoyZ3lDRnBmVzhuUFpzeDJZ?=
 =?utf-8?B?a3RzNWFwSWIwOUk5VndlalJOb1lYeE5oS005RHBxVHRlbEZETHFlRXpPWHJk?=
 =?utf-8?B?YmRROHlRSlBZMC9jMTV2TTliR1RHVjBqVXVrblkxeXBwUFpYNlF1Ym8wemcr?=
 =?utf-8?B?TktQMzB4cHZVQU9EU3dqTDJYdHM3K2lZSTdYVlBmZ3FrU2JDandPMExlMDZo?=
 =?utf-8?B?UXUvbGZpUzB6ZEtlNTJabUl3aTVJRDYvN0lxM2kzYVJ6SC90a2VleHRVYnNY?=
 =?utf-8?B?VzA4TlVtNDlQWkxOMjJ4WFBSL0JpeHhwenZEQWwvSWRWTm5NUWNDM1VJZEpt?=
 =?utf-8?Q?M8dzwU6Krfb3u?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 15:31:55.2208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbe64f3-168a-48eb-42b1-08dc703d2863
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9317

Hi Julien,

On 5/9/2024 4:46 AM, Julien Grall wrote:
> Hi Henry,
> [...]
>
>>>> we have 3 possible states which can be read from LR for this case : 
>>>> active, pending, pending and active.
>>>> - I don't think we can do anything about the active state, so we 
>>>> should return -EBUSY and reject the whole operation of removing the 
>>>> IRQ from running guest, and user can always retry this operation.
>>>
>>> This would mean a malicious/buggy guest would be able to prevent a 
>>> device to be de-assigned. This is not a good idea in particular when 
>>> the domain is dying.
>>>
>>> That said, I think you can handle this case. The LR has a bit to 
>>> indicate whether the pIRQ needs to be EOIed. You can clear it and 
>>> this would prevent the guest to touch the pIRQ. There might be other 
>>> clean-up to do in the vGIC datastructure.
>>
>> I probably misunderstood this sentence, do you mean the EOI bit in 
>> the pINTID field? I think this bit is only available when the HW bit 
>> of LR is 0, but in our case the HW is supposed to be 1 (as indicated 
>> as your previous comment). Would you mind clarifying a bit more? Thanks!
>
> You are right, ICH_LR.HW will be 1 for physical IRQ routed to a guest. 
> What I was trying to explain is this bit could be cleared (with 
> ICH_LR.pINTD adjusted).

Thank you for all the discussions. Based on that, would below diff make 
sense to you? I did a test of the dynamic dtbo adding/removing with a 
ethernet device with this patch applied. Test steps are:
(1) Use xl dt-overlay to add the ethernet device to Xen device tree and 
assign it to dom0.
(2) Create a domU.
(3) Use xl dt-overlay to de-assign the device from dom0 and assign it to 
domU.
(4) Destroy the domU.

The ethernet device is functional in the domain respectively when it is 
attached to a domain and I don't see errors when I destroy domU. But 
honestly I think the case we talked about is a quite unusual case so I 
am not sure if it was hit during my test.

```
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index a775f886ed..d3f9cd2299 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -135,16 +135,6 @@ int gic_route_irq_to_guest(struct domain *d, 
unsigned int virq,
      ASSERT(virq < vgic_num_irqs(d));
      ASSERT(!is_lpi(virq));

-    /*
-     * When routing an IRQ to guest, the virtual state is not synced
-     * back to the physical IRQ. To prevent get unsync, restrict the
-     * routing to when the Domain is been created.
-     */
-#ifndef CONFIG_OVERLAY_DTB
-    if ( d->creation_finished )
-        return -EBUSY;
-#endif
-
      ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);
      if ( ret )
          return ret;
@@ -169,20 +159,40 @@ int gic_remove_irq_from_guest(struct domain *d, 
unsigned int virq,
      ASSERT(test_bit(_IRQ_GUEST, &desc->status));
      ASSERT(!is_lpi(virq));

-    /*
-     * Removing an interrupt while the domain is running may have
-     * undesirable effect on the vGIC emulation.
-     */
-#ifndef CONFIG_OVERLAY_DTB
-    if ( !d->is_dying )
-        return -EBUSY;
-#endif
-
      desc->handler->shutdown(desc);

      /* EOI the IRQ if it has not been done by the guest */
      if ( test_bit(_IRQ_INPROGRESS, &desc->status) )
+    {
+        /*
+         * Handle the LR where the physical interrupt is de-assigned 
from the
+         * guest before it was EOIed
+         */
+        struct vcpu *v_target = vgic_get_target_vcpu(d->vcpu[0], virq);
+        struct vgic_irq_rank *rank = vgic_rank_irq(v_target, virq);
+        struct pending_irq *p = irq_to_pending(v_target, virq);
+        unsigned long flags;
+
+        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
+        /* LR allocated for the IRQ */
+        if ( test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) &&
+             test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) )
+        {
+            gic_hw_ops->clear_lr(p->lr);
+            clear_bit(p->lr, &v_target->arch.lr_mask);
+
+            clear_bit(GIC_IRQ_GUEST_VISIBLE, &p->status);
+            clear_bit(GIC_IRQ_GUEST_ACTIVE, &p->status);
+            p->lr = GIC_INVALID_LR;
+        }
+        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
+
+        vgic_lock_rank(v_target, rank, flags);
+        vgic_disable_irqs(v_target, (~rank->ienable) & rank->ienable, 
rank->index);
+        vgic_unlock_rank(v_target, rank, flags);
+
          gic_hw_ops->deactivate_irq(desc);
+    }
      clear_bit(_IRQ_INPROGRESS, &desc->status);

      ret = vgic_connect_hw_irq(d, NULL, virq, desc, false);
```

Kind regards,
Henry

>
> Cheers,
>


