Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91BB8CB763
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 03:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727141.1131543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aSZ-0000JE-9Q; Wed, 22 May 2024 01:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727141.1131543; Wed, 22 May 2024 01:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aSZ-0000GG-6f; Wed, 22 May 2024 01:08:03 +0000
Received: by outflank-mailman (input) for mailman id 727141;
 Wed, 22 May 2024 01:08:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X7YA=MZ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9aSX-0000G5-RG
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 01:08:01 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba88343c-17d7-11ef-909f-e314d9c70b13;
 Wed, 22 May 2024 03:08:00 +0200 (CEST)
Received: from BL1PR13CA0401.namprd13.prod.outlook.com (2603:10b6:208:2c2::16)
 by DM4PR12MB7574.namprd12.prod.outlook.com (2603:10b6:8:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 01:07:55 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::46) by BL1PR13CA0401.outlook.office365.com
 (2603:10b6:208:2c2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18 via Frontend
 Transport; Wed, 22 May 2024 01:07:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 01:07:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 20:07:51 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 21 May 2024 20:07:49 -0500
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
X-Inumbo-ID: ba88343c-17d7-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U82u3ZDtxZzXBsbEzl2ox4DVPupL5M2ixAgpPJgBaiyyMPof2bRCWITVkwwQ6uK2rnjoZQzNusKxgHiPJ94vMVs9+4DHJAXL2NnRjCl4cKRdMn/NBkLfVUPpJjq4dKwJLHy+DVwMxKtw1XBaacm7s/0YQDAIqllzJOvOIjKcTcXEIl2lx3u6V74eXNf0X9kty8WntbdqPns2BlazLzvRuw5w42JBg28dqIjEsiwRJDzYc5V7TnVcNkOdoQsymqXjEMP7D/z6nf0iS08PzDYgH1Y0BSdCZoCKDPkDt64HQ+SBdqi4+6cZwID95uUCbnGgsCN6W98yrwgl++z7qd+KHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlfI7zv2QHpWmE4HOs84OGGn0X8XL8jHHn0FUak/OOE=;
 b=WAkY5En4vMB70pnY6fA4ZT+bRut5FhytJ9pdtgAndTmlMmrRVqGKbKLbgUCYGNPq7KVbe3y4U3/mmGo/Wb0oFntGlnxoq0AQjGEe7ffeQU6MwWvrwq0rKplSwllibX1wT3Fbid+ayRnOXae6XFCleQ9JtJxHMM6s3o4lp96hbRY1pWewmImyLAkJb0iCmUY9n7s2RAekHzvqjxfHVDaRg5CIgGoD9woXAoLOEFyGNvY+N9+UdtAdyL77uYS7FowmKNEsrjuO3+uuwyYmYnzGKxgls5s68UYTKrECadghQxRMqS7kiHdJacMUKKGeXUHlxQv5/okuqaeBTF9Ua0Mgxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlfI7zv2QHpWmE4HOs84OGGn0X8XL8jHHn0FUak/OOE=;
 b=bTPpraY3lrDXrJwgDS43vT4M88S6ihSB6wFkg6wjUQVhebDAhiLZ/G7U1hGQqPoHYJfq8ohh49ishdiwcKZ3Tq6SoiclRGYXLmpyeB7RoiJjLfiH0iXycDW8jnqqAvSwHlVs/KE28dExztG8SPbmUcCERehuEmJ+A4DhiaIsmqY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4f6a24b5-5e7b-41e0-9314-496bbcaa8888@amd.com>
Date: Wed, 22 May 2024 09:07:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
 <20240521043557.1580753-6-xin.wang2@amd.com>
 <3f6fa7e7-c02c-4fa5-b4aa-5e4c2efed65f@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <3f6fa7e7-c02c-4fa5-b4aa-5e4c2efed65f@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: de370f08-3898-4525-4d1c-08dc79fb9b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0Zpa2V5cys1ZXg2ZnJnOWNwN0xSZFE1Y2IwSTdENHZING5DenNLQ3dXeDE3?=
 =?utf-8?B?SHFVL3FxUzlnL2xYekhKWE5zWkhHOXU0OVlNRE9KUlh2RnU5SXdIaTFZYk5J?=
 =?utf-8?B?RWxaeEFtMTlySDZadFRuMGNiQVNEdFdlSk10N0VJL3VlRG1FZWo2M200NUtP?=
 =?utf-8?B?ak9DOWxBOVNPcURuM3c1NmkwdTcwb1J0MTc4VnY1citIcG0wWWVmZFNxVi96?=
 =?utf-8?B?bnQzYkNVaDlOQm5OL3JCeGNOT1JITDkxbnl5N0hnVDhEWlFXQUpMVFIycFpX?=
 =?utf-8?B?VTBrZHN3NDdZUDZ5MEI3c0RHVS9keEQzWml3NW10NEloa0JzZ3NrTHJaTUd3?=
 =?utf-8?B?Y0lpVlVUWE9VNVVUbjgrSFRHeWpxUGFsL2pUblZ4Vk9oYjNnU0lJc2NudDhj?=
 =?utf-8?B?V0hJRFFEdG9MTG5iSUVvTFRMN0liU2x4TjBhNkY3aUdiM0xQWVRrcVhqNEMr?=
 =?utf-8?B?N1ozT3JvV09BNk55c0xDdzYvYzJGdkRiemRTUElxUnVpR1k2eVBCdjhaT0Rh?=
 =?utf-8?B?T1hWNGlxV2RuNkVRV3ZMK3JrS09CbTBCWmdYNXpGcGxYRWlpVzQ5ckJFY0NL?=
 =?utf-8?B?UFNLanJDUmZ6NGRFd3VrUzVReXdQWXpLQUpiK2swOHZWdGpmSElzTmNPdkQv?=
 =?utf-8?B?cnNRWi9pYlVqdHMrV3pFOHl6RjBqbEliMmxEb0hrcGpVa1YzdUNvbzVqNjlC?=
 =?utf-8?B?c1d3bFRnOXdrMk5xTlgxOWdmV2dLSzFSbGIyYW81VlNQcVlKVWx2eTg3dkM1?=
 =?utf-8?B?RXNIRHd0WkZRRHB1Z1FvT3JrZDQ0MVoxaVk5c013dmROYkpGU2hGK0c5Y3V2?=
 =?utf-8?B?cnRmT0pqZ29CdjV2cEpLditMWXJUYnZwUHNqdHdVcVl2NVFDZTVCcHp0bVlG?=
 =?utf-8?B?ZUI3d1RNOWpSd0FsVEtFV2w3L2ZzTjFiOTFIL3NYVTlvR1BueVF3dGdEV2NQ?=
 =?utf-8?B?eWZaRnRuTy9JMGJJUWEwb1VyalZFSXh4Y2h6a25JTTlMZi9FWlhiZkk0cmZw?=
 =?utf-8?B?ZGxMd1VCSmhWclZPRFFOOUVwd1J6dkJhYzVQcVo2M09KQkMwSVlSYVdVY0NR?=
 =?utf-8?B?NHVEZmw5Wlo1SHcrSXRmWUwvODZHTWlKY0xpTjZ3TC93RFA4em5ZdHQzMEto?=
 =?utf-8?B?YTlraVpvVWhOcUI1VEJydy94WkZIaG9Wbm05SnRsZTRYRFN6dHRibXMzb2JP?=
 =?utf-8?B?TXdxS1NPaTFMRTRrTmNQTGNQckFGTXFneVdNVURyRUhlRXB3RGFMMnJHT3dr?=
 =?utf-8?B?bWVZTVVDM0lsVmswRFFBdTlWOW9hS1htQVFnTjVHbHFMcUN4UEUrTXgrczZ6?=
 =?utf-8?B?R2I4MitzZU1jUittMHBnNXZ2REUyYmUwaFdWRkVlcHpFL3krRUNnY0dQN2ph?=
 =?utf-8?B?ekM2S2g3WDRVdWdmQTMrRmpGK1JKQW9GMkwzUzNlZ2txelk5bDNlSTBhM3Bo?=
 =?utf-8?B?MmdUaU5VOFdmUS93cHpUWGdNcGZWTEI1T3FlRXBHVnBSZVp0UmcrZlJBM1Nv?=
 =?utf-8?B?a0lpZ1dNbmRoWGk2dTlBeEdQakNXMTBFc3IrcmxkbDFSdVJpdDBZcFlraG1T?=
 =?utf-8?B?NitYQklCbUVrbnFxM0hxOTJhUjhsbmhZVnB1ejh4VGdzOTV2OWMzWlNEUWtp?=
 =?utf-8?B?eTBaM3IySVJjMWt0WGprZGY3b0R3RTNnTFAwL2VITkZJeXlDdXp5amVYWjJw?=
 =?utf-8?B?VXJ5Y0EvYmdqZTlYTkFjVXVkMzlNM2F2SG1kUGFzQk16a01TeUgvSDR4c3Y5?=
 =?utf-8?B?dE90L3ZRQTZKa1FISytsRGZUb24wU1BvSnIrMnBucGNvQ1ZPSWhLdU5VYksx?=
 =?utf-8?Q?AWG3pbRvqzO3pEXWQ4TREbmt6Z39HBFrBUXb8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 01:07:53.3107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de370f08-3898-4525-4d1c-08dc79fb9b92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574

Hi Julien,

On 5/21/2024 8:30 PM, Julien Grall wrote:
> Hi,
>
> On 21/05/2024 05:35, Henry Wang wrote:
>> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
>> index 56490dbc43..956c11ba13 100644
>> --- a/xen/arch/arm/gic-vgic.c
>> +++ b/xen/arch/arm/gic-vgic.c
>> @@ -439,24 +439,33 @@ int vgic_connect_hw_irq(struct domain *d, 
>> struct vcpu *v, unsigned int virq,
>>         /* We are taking to rank lock to prevent parallel 
>> connections. */
>>       vgic_lock_rank(v_target, rank, flags);
>> +    spin_lock(&v_target->arch.vgic.lock);
>
> I know this is what Stefano suggested, but v_target would point to the 
> current affinity whereas the interrupt may be pending/active on the 
> "previous" vCPU. So it is a little unclear whether v_target is the 
> correct lock. Do you have more pointer to show this is correct?

No I think you are correct, we have discussed this in the initial 
version of this patch. Sorry.

I followed the way from that discussion to note down the vcpu ID and 
retrieve here, below is the diff, would this make sense to you?

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index 956c11ba13..134ed4e107 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -439,7 +439,7 @@ int vgic_connect_hw_irq(struct domain *d, struct 
vcpu *v, unsigned int virq,

      /* We are taking to rank lock to prevent parallel connections. */
      vgic_lock_rank(v_target, rank, flags);
-    spin_lock(&v_target->arch.vgic.lock);
+ spin_lock(&d->vcpu[p->spi_vcpu_id]->arch.vgic.lock);

      if ( connect )
      {
@@ -465,7 +465,7 @@ int vgic_connect_hw_irq(struct domain *d, struct 
vcpu *v, unsigned int virq,
              p->desc = NULL;
      }

-    spin_unlock(&v_target->arch.vgic.lock);
+ spin_unlock(&d->vcpu[p->spi_vcpu_id]->arch.vgic.lock);
      vgic_unlock_rank(v_target, rank, flags);

      return ret;
diff --git a/xen/arch/arm/include/asm/vgic.h 
b/xen/arch/arm/include/asm/vgic.h
index 79b73a0dbb..f4075d3e75 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -85,6 +85,7 @@ struct pending_irq
      uint8_t priority;
      uint8_t lpi_priority;       /* Caches the priority if this is an 
LPI. */
      uint8_t lpi_vcpu_id;        /* The VCPU for an LPI. */
+    uint8_t spi_vcpu_id;        /* The VCPU for an SPI. */
      /* inflight is used to append instances of pending_irq to
       * vgic.inflight_irqs */
      struct list_head inflight;
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c04fc4f83f..e852479f13 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -632,6 +632,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu 
*v, unsigned int virq,
      }
      list_add_tail(&n->inflight, &v->arch.vgic.inflight_irqs);
  out:
+    n->spi_vcpu_id = v->vcpu_id;
      spin_unlock_irqrestore(&v->arch.vgic.lock, flags);

      /* we have a new higher priority irq, inject it into the guest */
      vcpu_kick(v);


> Also, while looking at the locking, I noticed that we are not doing 
> anything with GIC_IRQ_GUEST_MIGRATING. In gic_update_one_lr(), we seem 
> to assume that if the flag is set, then p->desc cannot be NULL.
>
> Can we reach vgic_connect_hw_irq() with the flag set?

I think even from the perspective of making the code extra safe, we 
should also check GIC_IRQ_GUEST_MIGRATING as the LR is allocated for 
this case. I will also add the check of GIC_IRQ_GUEST_MIGRATING here.

> What about the other flags? Is this going to be a concern if we don't 
> reset them?

I don't think so, if I am not mistaken, no LR will be allocated with 
other flags set.

Kind regards,
Henry

>
> Cheers,
>


