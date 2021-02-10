Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3E316205
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 10:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83503.155564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9lhc-0005P6-6V; Wed, 10 Feb 2021 09:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83503.155564; Wed, 10 Feb 2021 09:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9lhc-0005Oh-3E; Wed, 10 Feb 2021 09:22:28 +0000
Received: by outflank-mailman (input) for mailman id 83503;
 Wed, 10 Feb 2021 09:22:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/zh=HM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9lha-0005Oc-NN
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 09:22:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0d8016d-1c23-4613-b599-610932a88d6e;
 Wed, 10 Feb 2021 09:22:25 +0000 (UTC)
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
X-Inumbo-ID: d0d8016d-1c23-4613-b599-610932a88d6e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612948945;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=AgmAcQzToFYaA8/EEyPtwH+emMkgUTeWkVOA7LA2jMw=;
  b=S4/hQKxBbFs/c+6U3aeUibFEaUig++kI0NV5FWi4A04CgovvjKQ4pEg3
   RkeyHGF498M4q//S75NqpKd9svKJMEfayyW2a6cjlbMF82sSARB6xud79
   j3+FwseD9kdq0/uGixu2ok5xkVIxPIJosC+Numrb2KQypPS6J6KXlIhAF
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Latd8G8zmysZV05HQOWBk5PU+Nggjef96NbFtl/NKZ2RwRtglodI+my9WoNndiPWILSnSOBv93
 ZVuVEsfRmz1Vb4IFSPVdk7kl4WeR8U72pmFQOhzXI7MkCWIJrNNmAg6OYvq9BGsSoT1g6ZhDCp
 Jo4nDEBfmBKxdNyFn0+hMO1ulI80CiYqZGKFL6jimcXIjnnTionfiHiTQMCjXO6C4/LAzfXo4U
 8naYdJj7WYd+ncyqmnxQR8HyT/bF9Fbjq2BxHgeT+uBqPgvZPomho9pYi53CdK7CM4BmewOjbU
 BPw=
X-SBRS: 5.2
X-MesageID: 36877287
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,167,1610427600"; 
   d="scan'208";a="36877287"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNIntsBgDH4EKwhfyZpjenesfEy5hPl6ko+m3TSJzLe9xudWeul1ApfHkQQEBIG1f8eFlzJiYZ5FyigSoNkOiQp3xMKY/AZfdfkvVgikLlU+DZtqcF8LPviXngIAZHEgNH83XiscTVuuXL6tMLFMACFSNiVjwcmds7lSnZDEC0ZFsAKn1zZVvDrbfHPyt0WpANflp17/pBkzuzeePLDIWVWo1tGn9Z4NwixLcnJ/j8rrqfXSIYcYzk4ARBRe741CiyslomqkQbIIgIMeUXBy2PRNvxXZr/w7E+LA7h5giXH5q1U9+VbfvJMdSmGVYypvEkgs6UmIxIfNHe8t0J1XJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wJjk0FnZ0exCCqNZwfmwO0V8jY0khE99BEKiypY9VA=;
 b=hRd5vdqDMnSr6gM/QmC+e+UsCnQ9h5CeB4oy+Fk/ycE7Wk7wZtOopO57tCYI6mX7rEShOfrnwrm/o4RTb5rAGN9NFsuZQEJyyBXZ9bp7pQ2IIwf5EX5Bj566IeBjc8bSEj85/7KKjxH9g/oetqEyU7IQcNxeRjcPdjBalUIBFf9AUgHYne8dpMjJY0i1c5HH0XJtge1IlUXaXA9Vol5fKRHkp3Aay65CxaCTHRsy0JxhW/xPlMMuujDj1q1R5wKy6Q4GdUWPkrRpvUOLrhlMkkm487IBLlZVGOCJjulFXxNKyTsZ2iECFhPb+so6WjOQeG7/1p051LD6+LpRE22img==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wJjk0FnZ0exCCqNZwfmwO0V8jY0khE99BEKiypY9VA=;
 b=hrQ5hIkiga69kcDkR4XtN707/DkLo6rZN/VFidb6HLi8ZMliasY73s8SEibZm0msh+f8b1p0mByIPzJs1FAQhs04uVvbZsKsJRiakyqj15VyM1oqNkf0vYIi0/rfXwYv+m/kljqMvOFFb6pq/2J0X9DS99DPYBsm1XdQ2elaSes=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/irq: simplify loop in unmap_domain_pirq
Date: Wed, 10 Feb 2021 10:22:11 +0100
Message-ID: <20210210092211.53359-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0244.eurprd04.prod.outlook.com
 (2603:10a6:20b:330::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28c020f7-2ac0-426f-2b26-08d8cda55d19
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB337139505AA353D3D4AEC54D8F8D9@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2aG9HDrUm7a1/03LCUduiJlcPh5nzSeCPIToVzRFAlOZozohcRrYNMjL5vXGXRbhHjr1x6062eTTqHGkQuNqMkgK4kRYNXYIyxYd8ucCBlxrkRjh9c+s/r1Ng5Thk8w1cNfq7qkWv2a9t0sOM0U0HeZISdQyBv32m2evh/tWdpQoUc+9PAOiXhLTa/+1bkL2V3q0NVZQEINbGibcBbQPi4BkceTCJba/BRoVeGxshtyPARYDkWyrh+yVhYiqQ7ka/JEzvbv5cN5BIIfXJLSee2ODAdOe40oZQkRjMkrpOWvpNjbvdTqLFD4aRLTc38e/8C+P4PU1TgoqgyO3XNV+egYEHVXOFZCYwMMSk89wLZvYVP1oGEutvxbUXT7Owpa7viNfLEsXC0Jy8foNrPyzOPo+6yxRRCU1hjv6ZX1YT9Pfy+wdWEXsiun5qTq9F02g7Hw554pdXdmXkbtE46/MtFWt3TWveVtFVl68r6jOAPYJSDxxMSPFDRAhV1NeRiEmwjQ5ICNhwioQHGdZtyXig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(366004)(26005)(4326008)(478600001)(2616005)(956004)(6916009)(6486002)(83380400001)(186003)(66556008)(16526019)(8676002)(66946007)(66476007)(1076003)(2906002)(6496006)(54906003)(86362001)(6666004)(316002)(8936002)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTMxWm1aQXcrR0hmUVJQN3hHWHVrZjBrNmtUZ2FIdVZaMDhBOFptQWQyOTBJ?=
 =?utf-8?B?YzUyaWNNemVydFRGbEVYbGJsa3ZWVXd5Z2toSVNlcXU0dmtrYWxJYkNUeE8r?=
 =?utf-8?B?bDkwclNTaGs5T3RRdzBORGxiS293Z0cyODAxUkI2NVdHZjhDZGhqaUpPVFJF?=
 =?utf-8?B?ZWdrUDdUYk9COU5ReVd2VjZlZWhoa1VJOXdNMC96aTd2ODNYbnc1aVo2am05?=
 =?utf-8?B?QlIySHlCcnkycC8rWktPWEg5d2ltN1NHNWlyeEVuNk9qZ3AydGU2ZStIemMy?=
 =?utf-8?B?NXJNY2ZPK1FNSUZHbFB0VHRRVmNsQStlczRtMmRETHhHVE9OZ0kvUjhvWVdN?=
 =?utf-8?B?UXRHdUYwTW9vN05KWUN3YjE5R3B0c0FHSmRMR2NLWUFRZXZBTzF1YTA3bTdw?=
 =?utf-8?B?WmRsT3Q0eTF3MGRVOE1Yek53RlhWUlVKWlJnQW1qaytCdHVhQ0poSHNvZ0ZS?=
 =?utf-8?B?RWtJWkpyTy9EdU5MSEM2MXFvK0Zsd2tsOFM1bWpZUEowdGVtNVByMGxTOVZw?=
 =?utf-8?B?bXNSMmxjNmFJUDI0WkZoMktkclBBNlIzRFZLdGNxMkJJY3ZBdE1zRElLYzNC?=
 =?utf-8?B?WXYwVU9MOFhDSm5NSGZzV0NBWCtQMmpnRjk3blo5TFdJWUtjUFdPWDBvYmtp?=
 =?utf-8?B?YVhkUFIrOUVHRXE5RnU1N1FRVC9VZFBvWGtKRVhLQ0Q5a1puNjlpTEZYSEpS?=
 =?utf-8?B?VDhweVdpM0crYUtFNFFCN2VMUXNyZmt1L2p3cTNiSWxwZzZUK0pQSFdPYzgy?=
 =?utf-8?B?dTUyR3c5SmF4SWxjMzc1YzNZdXNyaFlwNlhrNy9yUjIrdXIvMjlUV2FjNEkx?=
 =?utf-8?B?ZkxwNlV1bVlFMERRUHVlOTN5ZXlaT3ZKekZ0L1Jkb25LVnQycjFMNVRlbklO?=
 =?utf-8?B?UHduM3ZkZlVHaE1YNmpWRk15M2IySTZlbHRsbjVoNWFNQnZBWENwK3RhZ01j?=
 =?utf-8?B?Z3JDVmNiTHlYU1NETzVwbWNJRnhWeEdlN0tWME1kZ2NPSzJ6MXg5cWtSckFG?=
 =?utf-8?B?bTl1Y3hzNUhQa0ptL2NhZjBDL2hBaEFMWkdaR0FWUms2UW1GaXdRZEhJMTBt?=
 =?utf-8?B?ZGM2dHdEWHJva0sxd1lwMGE3OWNBd1lVc256N3hjOFFRNTZsUUNkdnM3OFo4?=
 =?utf-8?B?N1VjUHowaWQvNSt0RG5WWEU1YmtmZHdoVjJTb2JSYkZXNnpSS2JjN3lDenpI?=
 =?utf-8?B?ZnYva0NPRXFtR3JMMkQxM2FTTmpxUStMU3FKM21oVHNaNzlPcWVxZVBPcytK?=
 =?utf-8?B?SGxMNGxURXZLdTlidFVyZU9QKzNiT21YRTltZlFuQWRRRU82L1JOYXg2Sy9t?=
 =?utf-8?B?dVZTQldIaUJVUmg4bThza3l4dTRtTFpZcWlObFdTM3QrekVOZTBORGJaNVUx?=
 =?utf-8?B?TWE5NFFsbWh6bzFWWVNpRGExQnhjOGttbGk1WjhlaTFGMEVWVDhuZTZQWWxY?=
 =?utf-8?B?WUMxVVlVSmFEK3ZqUDVZditvMWdqRGpPZ2hKNnBicnJEZFFwWDR3QzdEOTVr?=
 =?utf-8?B?ckdHT283ZWdqeEFGcjlMRFR1QWxHbkpwOGU4dFYvRnk1YWtaeVk1Wi84amVV?=
 =?utf-8?B?OFAvRDdJS3Qzb0RwZlRrYVh3ZGVpZWZqTFZQUXBueU1qUE5tWVl2L2xtUTRJ?=
 =?utf-8?B?OGx4K0V0dXRja3JoU2Zud050MHhaVkR1UWFlSHRxUkNEMk9abmxBckFtWXQr?=
 =?utf-8?B?WnNDV3RJMy9BcEFuSUxGWllieUdOaXlVWFU2TXJOd2dKR01xdmtIYVhwMGtI?=
 =?utf-8?Q?grQ9RnCaIDUprRl3OxyaWoyKKRHQxTlrFN7FcI1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c020f7-2ac0-426f-2b26-08d8cda55d19
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 09:22:19.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5SMuLsjF5skozyWUS+4Mb7xmuxHPk2F+UWEIABJfhqzAEpF1mgDkPJ3wVzhJqTBKpqqPwi2RxukdWc5WDYUlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

The for loop in unmap_domain_pirq is unnecessary complicated, with
several places where the index is incremented, and also different
exit conditions spread between the loop body.

Simplify it by looping over each possible PIRQ using the for loop
syntax, and remove all possible in-loop exit points.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 60 +++++++++++++---------------------------------
 1 file changed, 16 insertions(+), 44 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 032fe82167..856714b5bf 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2305,7 +2305,6 @@ done:
 /* The pirq should have been unbound before this call. */
 int unmap_domain_pirq(struct domain *d, int pirq)
 {
-    unsigned long flags;
     struct irq_desc *desc;
     int irq, ret = 0, rc;
     unsigned int i, nr = 1;
@@ -2356,11 +2355,23 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     if ( msi_desc != NULL )
         pci_disable_msi(msi_desc);
 
-    spin_lock_irqsave(&desc->lock, flags);
-
-    for ( i = 0; ; )
+    for ( i = 0; i < nr; i++, info = pirq_info(d, pirq + i) )
     {
+        unsigned long flags;
+
+        if ( !info || info->arch.irq <= 0 )
+        {
+            printk(XENLOG_G_ERR "dom%d: MSI pirq %d not mapped\n",
+                   d->domain_id, pirq + i);
+            continue;
+        }
+        irq = info->arch.irq;
+        desc = irq_to_desc(irq);
+
+        spin_lock_irqsave(&desc->lock, flags);
+
         BUG_ON(irq != domain_pirq_to_irq(d, pirq + i));
+        BUG_ON(desc->msi_desc != msi_desc + i);
 
         if ( !forced_unbind )
             clear_domain_irq_pirq(d, irq, info);
@@ -2378,45 +2389,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
             desc->msi_desc = NULL;
         }
 
-        if ( ++i == nr )
-            break;
-
-        spin_unlock_irqrestore(&desc->lock, flags);
-
-        if ( !forced_unbind )
-           cleanup_domain_irq_pirq(d, irq, info);
-
-        rc = irq_deny_access(d, irq);
-        if ( rc )
-        {
-            printk(XENLOG_G_ERR
-                   "dom%d: could not deny access to IRQ%d (pirq %d)\n",
-                   d->domain_id, irq, pirq + i);
-            ret = rc;
-        }
-
-        do {
-            info = pirq_info(d, pirq + i);
-            if ( info && (irq = info->arch.irq) > 0 )
-                break;
-            printk(XENLOG_G_ERR "dom%d: MSI pirq %d not mapped\n",
-                   d->domain_id, pirq + i);
-        } while ( ++i < nr );
-
-        if ( i == nr )
-        {
-            desc = NULL;
-            break;
-        }
-
-        desc = irq_to_desc(irq);
-        BUG_ON(desc->msi_desc != msi_desc + i);
-
-        spin_lock_irqsave(&desc->lock, flags);
-    }
-
-    if ( desc )
-    {
         spin_unlock_irqrestore(&desc->lock, flags);
 
         if ( !forced_unbind )
@@ -2427,7 +2399,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
         {
             printk(XENLOG_G_ERR
                    "dom%d: could not deny access to IRQ%d (pirq %d)\n",
-                   d->domain_id, irq, pirq + nr - 1);
+                   d->domain_id, irq, pirq + i);
             ret = rc;
         }
     }
-- 
2.29.2


