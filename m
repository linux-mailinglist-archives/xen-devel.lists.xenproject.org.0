Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5D582A11
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 17:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376309.608992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjOw-0006wv-OP; Wed, 27 Jul 2022 15:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376309.608992; Wed, 27 Jul 2022 15:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjOw-0006tq-KO; Wed, 27 Jul 2022 15:56:46 +0000
Received: by outflank-mailman (input) for mailman id 376309;
 Wed, 27 Jul 2022 15:56:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGjOv-0006tk-5x
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 15:56:45 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20084.outbound.protection.outlook.com [40.107.2.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4fff7f2-0dc4-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 17:56:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7694.eurprd04.prod.outlook.com (2603:10a6:102:e7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 15:56:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 15:56:38 +0000
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
X-Inumbo-ID: b4fff7f2-0dc4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxIkiPFrRM4a2DLLPHmk/ZeaqJEEt0IF8p5+Juod3Ye0+DqcGppvuEodBAKJ+XwTCHEh1cyEOOQLu2mpZe2P0IWD8SnDTmpIYLIwZB2hlH1car779MuiGSCleLrdEiwcSqNtHeQrfrb499ffbKI37rOZ4iVatK4yHeKeQWdqXw236HiOv5mGQag13mt212FeklgTPL9Aheg9DCbm6+MM7sbEZZfdJYmQRTKlDnaJIGR8rAl6C2015dVErSr+BPr4F9WUAf6ryRAEITMYMtRAtdd/X54xtQobr/BZ+4f+QdXTUdF7sxEE34+fezOJjjrXEBpDrmdkd6I9VC/JctWIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2bdapOjrM0mh21LtRsdRRgEqDq8ZlHL5BzanCOVJ5Y=;
 b=lNwqYXqe8fG15IUNRIBPyhm+W/8+yauIwP+FWds5UZ73Eapb4x/8Pvs3kH8QrGXzLHZb18EuHTKlFSmVzKC8qF7/QkA2Ik6Q0BNt/FEz9UBp3cYwyQXtTYhNtTaxxSgCktrtGN5vpMYLu6syb38mRmd0RId3s0EGfKd3KLTonAi8/9bNCYS4k2co9vzSMM610X1pUSwWe610rDDWjSOwjhJngrJcEjHkbSmuzbpu6zGkSzYTsSxg+WNHqPHu25hUv1/WkId6ARJ1LBcBG6SbYB/OoDzKGRlyUor88npOh9UBUu/wmFTk6QdwKmU1iY0tna9dB1mDqYwi3ZwevtdSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2bdapOjrM0mh21LtRsdRRgEqDq8ZlHL5BzanCOVJ5Y=;
 b=cE++8ZcKt1iCPyd69AjVva/qLjUxoeUxw4BA3I8JpZZLN5YG7+aL+I/bg2F1djYns50dQLWT3sNqvNQCjBzCN1cei5cKriPPECqDhwW99ZPQjIfwHNDExhSlpNVM734YlBmas01b+Ahlc+tFcJjWeYaeM4jWb111dDm72sdA2Og8iDt4+Pg42g/euN1pbHySi/6RBI4Y02uM/wD5AmudVFRDfulRBcHs10OHjQefxlLOHvghwBlu0p0I8hjN2G07NubZ42Okxl7fu9ulvRvGZKS//lK49kmNpUGTZbGWkXx6Gznd1AmpQ3Pvug497R2IplV2s0J6aHI2/26wlG489A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6a04eb7-bea7-0757-38da-526ee5d5448b@suse.com>
Date: Wed, 27 Jul 2022 17:56:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7] evtchn: convert domain event lock to an r/w one
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0045.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 176dcc51-2613-4a6f-bae0-08da6fe89735
X-MS-TrafficTypeDiagnostic: PA4PR04MB7694:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zJxPArtwwsBc4+LAaYbzuVhsPsgkb6Q3XnDelrpN18n9jr4ADj3NYUzTJzzFNAmduZ9rJpOTcdtWtg6YnXdZWzr/P3fAniUbR++nYl4Ik8elXyUfta+ffgSienw5evDj15xVnPqHQZfM6fwXRmrqAY/qrOcPMYiMKH7G/xv+xU7PixlSIZjAQvj8lcMw9PDiCInLocjaWwoGz4Nixyl3fMNKjhBxDkJ8RSsapc9cXqAoFUb3f8jnSVq2V/mq9njADyDBqKv6Zex9OtdWv+7gszTaT578VtsqccwY8hTMEZv1lJ+oiLkRpbCzSXxETnRO6Dt1IRhl1TaTM8IMoGWZKIKX4oCQPq6vrELlZSYjrKZWYdgEXgwVCQN4rHu0GAQGFUm18AEbBWbDkmJv77MME+tm7CC+gxrmxO9MdlksDU2Rx4yV/m0xnUTnaabvQv36+fvM6SXywrqwquB6uNojIT7IXzlriqOTMgJ+b90C9l1s6ZT+/uudQzh0u8CoRAyRvfNU6PjkZZwcK1ri/A0nMgjrr+pYp+OEqv/WJ9LSjUVU5fNrn7Bpiku8UAakODhF2gw+JM+Ixjs7vdusP0VNMDjv0dK7uLo5gM9/mppTgRq2oie7Uq/A2/cHV7eEbvxeXFoJ7mgM3UR8Z8k/n602jABx5ZxUPnJ1UnH7Tc95uotyzxPhfywAyMo1f0wdBSdIPuZBa8kgNlxl7cIvIP8nu/U+vYu5/3IT4jxqDIvE4Y/h0FKaKxkOnWqir2c3gtghnCuegdRuj5WT2rXgKDhoQWEHILHbnp0vMXK3GZZwSFrT8NGuG7/Sek2TegzeWsTpQxcX5QeoGyI+aw0gW3Wt2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(376002)(136003)(366004)(186003)(83380400001)(38100700002)(2616005)(31686004)(6916009)(316002)(36756003)(54906003)(8676002)(4326008)(45080400002)(66476007)(66556008)(66946007)(26005)(6486002)(6512007)(6506007)(86362001)(8936002)(31696002)(478600001)(5660300002)(41300700001)(2906002)(30864003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajFueHFRTWx1cTNKQ09XT3RhcVI0bEQ5ZVF2d25aOUcwdkVRZmpOWkx1Skx5?=
 =?utf-8?B?MVNtQkZtN2xHdFM4TTlXdXZrN2plOXJpM1FDTHlYRnVGWDZEM3NZcGpUdk5r?=
 =?utf-8?B?VEwxL2lVR0hQd1p0dWhjMXNFL3dpQ29UcDdBalZoYTFrUkd6MDJTVVBkMklX?=
 =?utf-8?B?M0I1Ri83VWtiUHBkUUptdmV0SnhuNVlzQlJRa1pLd2dvTkt0ZkVOZTBxcHI1?=
 =?utf-8?B?RUY2UDQ3Z2x1T1JyaXdYcnU5bVR1UEJHK3k3YitZbVdHWmR0NDVoUlNhbFBO?=
 =?utf-8?B?aUhZNnR6WnBxWjJHMWx2WXhzR1g4UFR1QUw4NWQyZkdidkZvNDFRZ3hnVmI4?=
 =?utf-8?B?N0ZCZFQ4dHE3V1c2NzVneXhrUWsxZ1BENTVsWmYyY09ucGtvYnZkSGFwMnNi?=
 =?utf-8?B?VWdDN0ZBaE96WkUvWXhwVjlxZEx2TlV2dEF3UGZjSC8rcG9yUWhyWjVMTytx?=
 =?utf-8?B?WVZML2RuV2ZFbTlZQUt2MndENCtYZW1hYVFHU0I4VTZqdkpJMlBGSm9JcWRN?=
 =?utf-8?B?ZEFOOGtwVHV0aWJJd2VSUTdpczMxVytQZUg1VW5tSzRwMVpuWldrQlpsRkVx?=
 =?utf-8?B?MXJQRzFxUzRPTnpueGlOZEpnMDFJR3A5OXFsdG9PK3B5TmJTNzVPVHRRS1Aw?=
 =?utf-8?B?YTA2cHdsTWdnU2J0WFMzbGd5ZVR3MEVOeXpBWFl6TnpmWHJQV3pLWDdMaGpl?=
 =?utf-8?B?dEhERE1DVVpOd1B1RFFHWXNmNmRzbFo3Q1R4NnlXVUdwSCtmV1hZTDd1Yjhs?=
 =?utf-8?B?THRUelE1SUZQY0IwNG9PVnZSUnFFZFZYRVZLbW9TUG1YaktuOXdMUXNIQ29h?=
 =?utf-8?B?SFJXNjZUaDNxK01nY2QrekZCZ0FVWjJ4c0drMXo2UnZRSjBzSkkrNXJFWWg2?=
 =?utf-8?B?WlJPQlova0lHaXV6UGFFN3R2dExtQjZramZFVkhvdlZyejVya1V3akpiWm00?=
 =?utf-8?B?YTJZdXFRRjVqQmtTUlVpSmxFZkpRVTVYOTRIZXA3NS9kUUNMelU2cFpnR0pl?=
 =?utf-8?B?ZW9yWHFMbEI1WjN3YlplaFZhRVpSWG9sRVE4Q05hc1JFSW5DSVlRaElSc2tP?=
 =?utf-8?B?aXkrazBhd0srSUxVVW9rZ3hjRFEyOUNrWXBORzFnRWdYRWllTHh2U3FuUGZT?=
 =?utf-8?B?b0Z1SHlrY09ibTQ2ZDNwK3pOQ2JmWEQ0eGtXdFlBdjZaWElEREpDUzU2aTRz?=
 =?utf-8?B?aytHeDNZZmR4Nk9KbG96UGwwYVV4K0JhanZRSktQclpoajdLallBSnhJTFMv?=
 =?utf-8?B?WExhM0czYU5vR2w2Q3lXdnRYNkt1NnZsVFhIZ2I2OUhOb2tITmJrVXo4Tm1u?=
 =?utf-8?B?a1oxaitBbUoxRW4wV1lzZVhFbHUzdGFnVGdoNlpydWNMYzAzSi9OUWdWNTZS?=
 =?utf-8?B?RG56UmZBRFh6SkpHTDZ4V3RRMlBMdCtPN3RQeW8vZUp4N2I2Y2I3NmZXY21x?=
 =?utf-8?B?bXFDYmJwSGZFTnpHVDdiQkhSVXkrTUNVM2g4NEtoL0FPMXR4ODFyODRNNTU1?=
 =?utf-8?B?VnZlZzE5dmtaZUFIWGJWdUdLNWhOaTZwOUxrbHlaYjlOa0pYYlNJUlBIcFpQ?=
 =?utf-8?B?MGlMV1dMMjlqM3NwNFNiMUMxa3ZOWVRjQ0V5cWJMTUJSa3FSaDQ5UEoxTDRy?=
 =?utf-8?B?UXVSYmhVQ2tpTFNVUE05VzNWNEVKSER6V0F1VVpqRkZmcHA3MzlydVFFbjJC?=
 =?utf-8?B?V2JHbVBGc3BWKzQ0S0hlcTc1ZkxPYVB2T2NXSXlKK1gwSGhvbGltaTVmRXBW?=
 =?utf-8?B?MXBLTFNzZEtHUnNMN1NsUjY1R0R3d2ppTGlwMkdjcDhVTHNUTHdqc3NZK1Zy?=
 =?utf-8?B?MkVUWGc5M0VQZnk3cWQycGFqKzVyVjhwL2p3UTY0NElWOVlWcGV1STBQa1BJ?=
 =?utf-8?B?TS9XMDN3NEh2Qm1heTJyZDQ3UWZtSzRxVUlaNDlRTVphTXpFbnVKSEV4MkZy?=
 =?utf-8?B?ajZuSXZWRms4ekJIdzY5dHdvbXUvMWxWQ0ljeGYwcFoxVWs2TjIvaTViUkg3?=
 =?utf-8?B?dlZ5OXlLL0M5anhJcTRrYmZXQUE3aWROT1ZsNjR5TXlzZGNKWjN3OEUrL0hl?=
 =?utf-8?B?MVYzUlV1N2dtcE9nanFVeTV6RHQ0Z2NGcVNFMmdTUi9KeTJRQkdod09uRER1?=
 =?utf-8?Q?/wWInCOxIwQdrdU3irmkwTER1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176dcc51-2613-4a6f-bae0-08da6fe89735
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:56:38.7729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50woD/oxpJA86Pnz6bORdyQQNXGNsUKSlj/3p6AYrfs6wQcJT4k/hOrkfXahgtlQRe+/0HP1/K7mFNgIa7MTaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7694

Especially for the use in evtchn_move_pirqs() (called when moving a vCPU
across pCPU-s) and the ones in EOI handling in PCI pass-through code,
serializing perhaps an entire domain isn't helpful when no state (which
isn't e.g. further protected by the per-channel lock) changes.

Unfortunately this implies dropping of lock profiling for this lock,
until r/w locks may get enabled for such functionality.

While ->notify_vcpu_id is now meant to be consistently updated with the
per-channel lock held, an extension applies to ECS_PIRQ: The field is
also guaranteed to not change with the per-domain event lock held for
writing. Therefore the link_pirq_port() call from evtchn_bind_pirq()
could in principle be moved out of the per-channel locked regions, but
this further code churn didn't seem worth it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: Re-vive and re-base.
v5: Re-base, also over dropped earlier patch.
v4: Re-base, in particular over new earlier patches. Acquire both
    per-domain locks for writing in evtchn_close(). Adjust
    spin_barrier() related comments.
v3: Re-base.
v2: Consistently lock for writing in evtchn_reset(). Fix error path in
    pci_clean_dpci_irqs(). Lock for writing in pt_irq_time_out(),
    hvm_dirq_assist(), hvm_dpci_eoi(), and hvm_dpci_isairq_eoi(). Move
    rw_barrier() introduction here. Re-base over changes earlier in the
    series.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -967,7 +967,7 @@ int arch_domain_soft_reset(struct domain
     if ( !is_hvm_domain(d) )
         return -EINVAL;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     for ( i = 0; i < d->nr_pirqs ; i++ )
     {
         if ( domain_pirq_to_emuirq(d, i) != IRQ_UNBOUND )
@@ -977,7 +977,7 @@ int arch_domain_soft_reset(struct domain
                 break;
         }
     }
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     if ( ret )
         return ret;
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -492,9 +492,9 @@ void hvm_migrate_pirqs(struct vcpu *v)
     if ( !is_iommu_enabled(d) || !hvm_domain_irq(d)->dpci )
        return;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
     pt_pirq_iterate(d, migrate_pirq, v);
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
 }
 
 static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -404,9 +404,9 @@ int hvm_inject_msi(struct domain *d, uin
             {
                 int rc;
 
-                spin_lock(&d->event_lock);
+                write_lock(&d->event_lock);
                 rc = map_domain_emuirq_pirq(d, pirq, IRQ_MSI_EMU);
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 if ( rc )
                     return rc;
                 info = pirq_info(d, pirq);
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -203,9 +203,9 @@ static int vioapic_hwdom_map_gsi(unsigne
     {
         gprintk(XENLOG_WARNING, "vioapic: error binding GSI %u: %d\n",
                 gsi, ret);
-        spin_lock(&currd->event_lock);
+        write_lock(&currd->event_lock);
         unmap_domain_pirq(currd, pirq);
-        spin_unlock(&currd->event_lock);
+        write_unlock(&currd->event_lock);
     }
     pcidevs_unlock();
 
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -467,7 +467,7 @@ int msixtbl_pt_register(struct domain *d
     int r = -EINVAL;
 
     ASSERT(pcidevs_locked());
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
         return -ENODEV;
@@ -537,7 +537,7 @@ void msixtbl_pt_unregister(struct domain
     struct msixtbl_entry *entry;
 
     ASSERT(pcidevs_locked());
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
         return;
@@ -591,13 +591,13 @@ void msixtbl_pt_cleanup(struct domain *d
     if ( !msixtbl_initialised(d) )
         return;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     list_for_each_entry_safe( entry, temp,
                               &d->arch.hvm.msixtbl_list, list )
         del_msixtbl_entry(entry);
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 }
 
 void msix_write_completion(struct vcpu *v)
@@ -811,9 +811,9 @@ static void vpci_msi_disable(const struc
         ASSERT(!rc);
     }
 
-    spin_lock(&pdev->domain->event_lock);
+    write_lock(&pdev->domain->event_lock);
     unmap_domain_pirq(pdev->domain, pirq);
-    spin_unlock(&pdev->domain->event_lock);
+    write_unlock(&pdev->domain->event_lock);
     pcidevs_unlock();
 }
 
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2457,10 +2457,10 @@ int ioapic_guest_write(unsigned long phy
     }
     if ( pirq >= 0 )
     {
-        spin_lock(&hardware_domain->event_lock);
+        write_lock(&hardware_domain->event_lock);
         ret = map_domain_pirq(hardware_domain, pirq, irq,
                               MAP_PIRQ_TYPE_GSI, NULL);
-        spin_unlock(&hardware_domain->event_lock);
+        write_unlock(&hardware_domain->event_lock);
         if ( ret < 0 )
             return ret;
     }
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1550,7 +1550,7 @@ int pirq_guest_bind(struct vcpu *v, stru
     unsigned int        max_nr_guests = will_share ? irq_max_guests : 1;
     int                 rc = 0;
 
-    WARN_ON(!spin_is_locked(&v->domain->event_lock));
+    WARN_ON(!rw_is_write_locked(&v->domain->event_lock));
     BUG_ON(!local_irq_is_enabled());
 
  retry:
@@ -1764,7 +1764,7 @@ void pirq_guest_unbind(struct domain *d,
     struct irq_desc *desc;
     int irq = 0;
 
-    WARN_ON(!spin_is_locked(&d->event_lock));
+    WARN_ON(!rw_is_write_locked(&d->event_lock));
 
     BUG_ON(!local_irq_is_enabled());
     desc = pirq_spin_lock_irq_desc(pirq, NULL);
@@ -1801,7 +1801,7 @@ static bool pirq_guest_force_unbind(stru
     unsigned int i;
     bool bound = false;
 
-    WARN_ON(!spin_is_locked(&d->event_lock));
+    WARN_ON(!rw_is_write_locked(&d->event_lock));
 
     BUG_ON(!local_irq_is_enabled());
     desc = pirq_spin_lock_irq_desc(pirq, NULL);
@@ -2043,7 +2043,7 @@ int get_free_pirq(struct domain *d, int
 {
     int i;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( type == MAP_PIRQ_TYPE_GSI )
     {
@@ -2068,7 +2068,7 @@ int get_free_pirqs(struct domain *d, uns
 {
     unsigned int i, found = 0;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     for ( i = d->nr_pirqs - 1; i >= nr_irqs_gsi; --i )
         if ( is_free_pirq(d, pirq_info(d, i)) )
@@ -2096,7 +2096,7 @@ int map_domain_pirq(
     DECLARE_BITMAP(prepared, MAX_MSI_IRQS) = {};
     DECLARE_BITMAP(granted, MAX_MSI_IRQS) = {};
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !irq_access_permitted(current->domain, irq))
         return -EPERM;
@@ -2314,7 +2314,7 @@ int unmap_domain_pirq(struct domain *d,
         return -EINVAL;
 
     ASSERT(pcidevs_locked());
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     info = pirq_info(d, pirq);
     if ( !info || (irq = info->arch.irq) <= 0 )
@@ -2420,13 +2420,13 @@ void free_domain_pirqs(struct domain *d)
     int i;
 
     pcidevs_lock();
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     for ( i = 0; i < d->nr_pirqs; i++ )
         if ( domain_pirq_to_irq(d, i) > 0 )
             unmap_domain_pirq(d, i);
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     pcidevs_unlock();
 }
 
@@ -2669,7 +2669,7 @@ int map_domain_emuirq_pirq(struct domain
     int old_emuirq = IRQ_UNBOUND, old_pirq = IRQ_UNBOUND;
     struct pirq *info;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !is_hvm_domain(d) )
         return -EINVAL;
@@ -2735,7 +2735,7 @@ int unmap_domain_pirq_emuirq(struct doma
     if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
         return -EINVAL;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     emuirq = domain_pirq_to_emuirq(d, pirq);
     if ( emuirq == IRQ_UNBOUND )
@@ -2783,7 +2783,7 @@ static int allocate_pirq(struct domain *
 {
     int current_pirq;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
     current_pirq = domain_irq_to_pirq(d, irq);
     if ( pirq < 0 )
     {
@@ -2855,7 +2855,7 @@ int allocate_and_map_gsi_pirq(struct dom
     }
 
     /* Verify or get pirq. */
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     pirq = allocate_pirq(d, index, *pirq_p, irq, MAP_PIRQ_TYPE_GSI, NULL);
     if ( pirq < 0 )
     {
@@ -2868,7 +2868,7 @@ int allocate_and_map_gsi_pirq(struct dom
         *pirq_p = pirq;
 
  done:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return ret;
 }
@@ -2909,7 +2909,7 @@ int allocate_and_map_msi_pirq(struct dom
 
     pcidevs_lock();
     /* Verify or get pirq. */
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
     if ( pirq < 0 )
     {
@@ -2922,7 +2922,7 @@ int allocate_and_map_msi_pirq(struct dom
         *pirq_p = pirq;
 
  done:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     pcidevs_unlock();
     if ( ret )
     {
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -34,7 +34,7 @@ static int physdev_hvm_map_pirq(
 
     ASSERT(!is_hardware_domain(d));
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     switch ( type )
     {
     case MAP_PIRQ_TYPE_GSI: {
@@ -84,7 +84,7 @@ static int physdev_hvm_map_pirq(
         break;
     }
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     return ret;
 }
 
@@ -154,18 +154,18 @@ int physdev_unmap_pirq(domid_t domid, in
 
     if ( is_hvm_domain(d) && has_pirq(d) )
     {
-        spin_lock(&d->event_lock);
+        write_lock(&d->event_lock);
         if ( domain_pirq_to_emuirq(d, pirq) != IRQ_UNBOUND )
             ret = unmap_domain_pirq_emuirq(d, pirq);
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         if ( domid == DOMID_SELF || ret )
             goto free_domain;
     }
 
     pcidevs_lock();
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     ret = unmap_domain_pirq(d, pirq);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     pcidevs_unlock();
 
  free_domain:
@@ -192,10 +192,10 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         ret = -EINVAL;
         if ( eoi.irq >= currd->nr_pirqs )
             break;
-        spin_lock(&currd->event_lock);
+        read_lock(&currd->event_lock);
         pirq = pirq_info(currd, eoi.irq);
         if ( !pirq ) {
-            spin_unlock(&currd->event_lock);
+            read_unlock(&currd->event_lock);
             break;
         }
         if ( currd->arch.auto_unmask )
@@ -214,7 +214,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
                     && hvm_irq->gsi_assert_count[gsi] )
                 send_guest_pirq(currd, pirq);
         }
-        spin_unlock(&currd->event_lock);
+        read_unlock(&currd->event_lock);
         ret = 0;
         break;
     }
@@ -578,7 +578,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         if ( copy_from_guest(&out, arg, 1) != 0 )
             break;
 
-        spin_lock(&currd->event_lock);
+        write_lock(&currd->event_lock);
 
         ret = get_free_pirq(currd, out.type);
         if ( ret >= 0 )
@@ -591,7 +591,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
                 ret = -ENOMEM;
         }
 
-        spin_unlock(&currd->event_lock);
+        write_unlock(&currd->event_lock);
 
         if ( ret >= 0 )
         {
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -431,7 +431,7 @@ long pv_shim_event_channel_op(int cmd, X
         if ( rc )                                                           \
             break;                                                          \
                                                                             \
-        spin_lock(&d->event_lock);                                          \
+        write_lock(&d->event_lock);                                         \
         rc = evtchn_allocate_port(d, op.port_field);                        \
         if ( rc )                                                           \
         {                                                                   \
@@ -440,7 +440,7 @@ long pv_shim_event_channel_op(int cmd, X
         }                                                                   \
         else                                                                \
             evtchn_reserve(d, op.port_field);                               \
-        spin_unlock(&d->event_lock);                                        \
+        write_unlock(&d->event_lock);                                       \
                                                                             \
         if ( !rc && __copy_to_guest(arg, &op, 1) )                          \
             rc = -EFAULT;                                                   \
@@ -568,11 +568,11 @@ long pv_shim_event_channel_op(int cmd, X
         if ( rc )
             break;
 
-        spin_lock(&d->event_lock);
+        write_lock(&d->event_lock);
         rc = evtchn_allocate_port(d, ipi.port);
         if ( rc )
         {
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
 
             close.port = ipi.port;
             BUG_ON(xen_hypercall_event_channel_op(EVTCHNOP_close, &close));
@@ -581,7 +581,7 @@ long pv_shim_event_channel_op(int cmd, X
 
         evtchn_assign_vcpu(d, ipi.port, ipi.vcpu);
         evtchn_reserve(d, ipi.port);
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
 
         if ( __copy_to_guest(arg, &ipi, 1) )
             rc = -EFAULT;
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -301,7 +301,7 @@ int evtchn_alloc_unbound(evtchn_alloc_un
     if ( d == NULL )
         return -ESRCH;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( (port = get_free_port(d)) < 0 )
         ERROR_EXIT_DOM(port, d);
@@ -324,7 +324,7 @@ int evtchn_alloc_unbound(evtchn_alloc_un
 
  out:
     check_free_port(d, port);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     rcu_unlock_domain(d);
 
     return rc;
@@ -361,14 +361,14 @@ static int evtchn_bind_interdomain(evtch
     /* Avoid deadlock by first acquiring lock of domain with smaller id. */
     if ( ld < rd )
     {
-        spin_lock(&ld->event_lock);
-        spin_lock(&rd->event_lock);
+        write_lock(&ld->event_lock);
+        write_lock(&rd->event_lock);
     }
     else
     {
         if ( ld != rd )
-            spin_lock(&rd->event_lock);
-        spin_lock(&ld->event_lock);
+            write_lock(&rd->event_lock);
+        write_lock(&ld->event_lock);
     }
 
     if ( (lport = get_free_port(ld)) < 0 )
@@ -409,9 +409,9 @@ static int evtchn_bind_interdomain(evtch
 
  out:
     check_free_port(ld, lport);
-    spin_unlock(&ld->event_lock);
+    write_unlock(&ld->event_lock);
     if ( ld != rd )
-        spin_unlock(&rd->event_lock);
+        write_unlock(&rd->event_lock);
     
     rcu_unlock_domain(rd);
 
@@ -442,7 +442,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t
     if ( (v = domain_vcpu(d, vcpu)) == NULL )
         return -ENOENT;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( read_atomic(&v->virq_to_evtchn[virq]) )
         ERROR_EXIT(-EEXIST);
@@ -483,7 +483,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t
     write_atomic(&v->virq_to_evtchn[virq], port);
 
  out:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -499,7 +499,7 @@ static int evtchn_bind_ipi(evtchn_bind_i
     if ( domain_vcpu(d, vcpu) == NULL )
         return -ENOENT;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( (port = get_free_port(d)) < 0 )
         ERROR_EXIT(port);
@@ -517,7 +517,7 @@ static int evtchn_bind_ipi(evtchn_bind_i
     bind->port = port;
 
  out:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -563,7 +563,7 @@ static int evtchn_bind_pirq(evtchn_bind_
     if ( !is_hvm_domain(d) && !pirq_access_permitted(d, pirq) )
         return -EPERM;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( pirq_to_evtchn(d, pirq) != 0 )
         ERROR_EXIT(-EEXIST);
@@ -603,7 +603,7 @@ static int evtchn_bind_pirq(evtchn_bind_
 
  out:
     check_free_port(d, port);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -619,7 +619,7 @@ int evtchn_close(struct domain *d1, int
         return -EINVAL;
 
  again:
-    spin_lock(&d1->event_lock);
+    write_lock(&d1->event_lock);
 
     /* Guest cannot close a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn1)) && guest )
@@ -682,13 +682,11 @@ int evtchn_close(struct domain *d1, int
             rcu_lock_domain(d2);
 
             if ( d1 < d2 )
-            {
-                spin_lock(&d2->event_lock);
-            }
+                write_lock(&d2->event_lock);
             else if ( d1 != d2 )
             {
-                spin_unlock(&d1->event_lock);
-                spin_lock(&d2->event_lock);
+                write_unlock(&d1->event_lock);
+                write_lock(&d2->event_lock);
                 goto again;
             }
         }
@@ -733,11 +731,11 @@ int evtchn_close(struct domain *d1, int
     if ( d2 != NULL )
     {
         if ( d1 != d2 )
-            spin_unlock(&d2->event_lock);
+            write_unlock(&d2->event_lock);
         rcu_unlock_domain(d2);
     }
 
-    spin_unlock(&d1->event_lock);
+    write_unlock(&d1->event_lock);
 
     return rc;
 }
@@ -977,7 +975,7 @@ int evtchn_status(evtchn_status_t *statu
         return -EINVAL;
     }
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
 
     if ( consumer_is_xen(chn) )
     {
@@ -1023,7 +1021,7 @@ int evtchn_status(evtchn_status_t *statu
     status->vcpu = chn->notify_vcpu_id;
 
  out:
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
     rcu_unlock_domain(d);
 
     return rc;
@@ -1045,7 +1043,7 @@ int evtchn_bind_vcpu(evtchn_port_t port,
     if ( !chn )
         return -EINVAL;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     /* Guest cannot re-bind a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn)) )
@@ -1081,7 +1079,7 @@ int evtchn_bind_vcpu(evtchn_port_t port,
     }
 
  out:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -1125,7 +1123,7 @@ int evtchn_reset(struct domain *d, bool
     if ( d != current->domain && !d->controller_pause_count )
         return -EINVAL;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     /*
      * If we are resuming, then start where we stopped. Otherwise, check
@@ -1136,7 +1134,7 @@ int evtchn_reset(struct domain *d, bool
     if ( i > d->next_evtchn )
         d->next_evtchn = i;
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     if ( !i )
         return -EBUSY;
@@ -1148,14 +1146,14 @@ int evtchn_reset(struct domain *d, bool
         /* NB: Choice of frequency is arbitrary. */
         if ( !(i & 0x3f) && hypercall_preempt_check() )
         {
-            spin_lock(&d->event_lock);
+            write_lock(&d->event_lock);
             d->next_evtchn = i;
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
             return -ERESTART;
         }
     }
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     d->next_evtchn = 0;
 
@@ -1168,7 +1166,7 @@ int evtchn_reset(struct domain *d, bool
         evtchn_2l_init(d);
     }
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -1360,7 +1358,7 @@ int alloc_unbound_xen_event_channel(
     struct evtchn *chn;
     int            port, rc;
 
-    spin_lock(&ld->event_lock);
+    write_lock(&ld->event_lock);
 
     port = rc = get_free_port(ld);
     if ( rc < 0 )
@@ -1388,7 +1386,7 @@ int alloc_unbound_xen_event_channel(
 
  out:
     check_free_port(ld, port);
-    spin_unlock(&ld->event_lock);
+    write_unlock(&ld->event_lock);
 
     return rc < 0 ? rc : port;
 }
@@ -1399,7 +1397,7 @@ void free_xen_event_channel(struct domai
     {
         /*
          * Make sure ->is_dying is read /after/ ->valid_evtchns, pairing
-         * with the spin_barrier() and BUG_ON() in evtchn_destroy().
+         * with the kind-of-barrier and BUG_ON() in evtchn_destroy().
          */
         smp_rmb();
         BUG_ON(!d->is_dying);
@@ -1419,7 +1417,7 @@ void notify_via_xen_event_channel(struct
     {
         /*
          * Make sure ->is_dying is read /after/ ->valid_evtchns, pairing
-         * with the spin_barrier() and BUG_ON() in evtchn_destroy().
+         * with the kind-of-barrier and BUG_ON() in evtchn_destroy().
          */
         smp_rmb();
         ASSERT(ld->is_dying);
@@ -1474,7 +1472,8 @@ int evtchn_init(struct domain *d, unsign
         return -ENOMEM;
     d->valid_evtchns = EVTCHNS_PER_BUCKET;
 
-    spin_lock_init_prof(d, event_lock);
+    rwlock_init(&d->event_lock);
+
     if ( get_free_port(d) != 0 )
     {
         free_evtchn_bucket(d, d->evtchn);
@@ -1499,9 +1498,10 @@ int evtchn_destroy(struct domain *d)
 {
     unsigned int i;
 
-    /* After this barrier no new event-channel allocations can occur. */
+    /* After this kind-of-barrier no new event-channel allocations can occur. */
     BUG_ON(!d->is_dying);
-    spin_barrier(&d->event_lock);
+    read_lock(&d->event_lock);
+    read_unlock(&d->event_lock);
 
     /* Close all existing event channels. */
     for ( i = d->valid_evtchns; --i; )
@@ -1559,13 +1559,13 @@ void evtchn_move_pirqs(struct vcpu *v)
     unsigned int port;
     struct evtchn *chn;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
     for ( port = v->pirq_evtchn_head; port; port = chn->u.pirq.next_port )
     {
         chn = evtchn_from_port(d, port);
         pirq_set_affinity(d, chn->u.pirq.irq, mask);
     }
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
 }
 
 
@@ -1578,7 +1578,7 @@ static void domain_dump_evtchn_info(stru
            "Polling vCPUs: {%*pbl}\n"
            "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
 
     for ( port = 1; ; ++port )
     {
@@ -1627,7 +1627,7 @@ static void domain_dump_evtchn_info(stru
         }
     }
 
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
 }
 
 static void cf_check dump_evtchn_info(unsigned char key)
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -602,7 +602,7 @@ int evtchn_fifo_init_control(struct evtc
     if ( offset & (8 - 1) )
         return -EINVAL;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     /*
      * If this is the first control block, setup an empty event array
@@ -638,13 +638,13 @@ int evtchn_fifo_init_control(struct evtc
     else
         rc = map_control_block(v, gfn, offset);
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 
  error:
     evtchn_fifo_destroy(d);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     return rc;
 }
 
@@ -697,9 +697,9 @@ int evtchn_fifo_expand_array(const struc
     if ( !d->evtchn_fifo )
         return -EOPNOTSUPP;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     rc = add_page_to_event_array(d, expand_array->array_gfn);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
--- a/xen/drivers/passthrough/vtd/x86/hvm.c
+++ b/xen/drivers/passthrough/vtd/x86/hvm.c
@@ -51,7 +51,7 @@ void hvm_dpci_isairq_eoi(struct domain *
     if ( !is_iommu_enabled(d) )
         return;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     dpci = domain_get_irq_dpci(d);
 
@@ -60,5 +60,5 @@ void hvm_dpci_isairq_eoi(struct domain *
         /* Multiple mirq may be mapped to one isa irq */
         pt_pirq_iterate(d, _hvm_dpci_isairq_eoi, (void *)(long)isairq);
     }
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 }
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -117,7 +117,7 @@ static void pt_pirq_softirq_reset(struct
 {
     struct domain *d = pirq_dpci->dom;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     switch ( cmpxchg(&pirq_dpci->state, 1 << STATE_SCHED, 0) )
     {
@@ -229,7 +229,7 @@ int pt_irq_create_bind(
         return -EINVAL;
 
  restart:
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     hvm_irq_dpci = domain_get_irq_dpci(d);
     if ( !hvm_irq_dpci && !is_hardware_domain(d) )
@@ -245,7 +245,7 @@ int pt_irq_create_bind(
         hvm_irq_dpci = xzalloc(struct hvm_irq_dpci);
         if ( hvm_irq_dpci == NULL )
         {
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
             return -ENOMEM;
         }
         for ( i = 0; i < NR_HVM_DOMU_IRQS; i++ )
@@ -257,7 +257,7 @@ int pt_irq_create_bind(
     info = pirq_get_info(d, pirq);
     if ( !info )
     {
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         return -ENOMEM;
     }
     pirq_dpci = pirq_dpci(info);
@@ -272,7 +272,7 @@ int pt_irq_create_bind(
      */
     if ( pt_pirq_softirq_active(pirq_dpci) )
     {
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         cpu_relax();
         goto restart;
     }
@@ -330,7 +330,7 @@ int pt_irq_create_bind(
                 pirq_dpci->dom = NULL;
                 pirq_dpci->flags = 0;
                 pirq_cleanup_check(info, d);
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 return rc;
             }
         }
@@ -340,7 +340,7 @@ int pt_irq_create_bind(
 
             if ( (pirq_dpci->flags & mask) != mask )
             {
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 return -EBUSY;
             }
 
@@ -364,7 +364,7 @@ int pt_irq_create_bind(
 
         dest_vcpu_id = hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
         pirq_dpci->gmsi.dest_vcpu_id = dest_vcpu_id;
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
 
         pirq_dpci->gmsi.posted = false;
         vcpu = (dest_vcpu_id >= 0) ? d->vcpu[dest_vcpu_id] : NULL;
@@ -424,7 +424,7 @@ int pt_irq_create_bind(
 
             if ( !digl || !girq )
             {
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
                 return -ENOMEM;
@@ -451,7 +451,7 @@ int pt_irq_create_bind(
             if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
                  pirq >= hvm_domain_irq(d)->nr_gsis )
             {
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
 
                 return -EINVAL;
             }
@@ -487,7 +487,7 @@ int pt_irq_create_bind(
 
                     if ( mask < 0 || trigger_mode < 0 )
                     {
-                        spin_unlock(&d->event_lock);
+                        write_unlock(&d->event_lock);
 
                         ASSERT_UNREACHABLE();
                         return -EINVAL;
@@ -530,14 +530,14 @@ int pt_irq_create_bind(
                 }
                 pirq_dpci->flags = 0;
                 pirq_cleanup_check(info, d);
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
                 return rc;
             }
         }
 
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
 
         if ( iommu_verbose )
         {
@@ -555,7 +555,7 @@ int pt_irq_create_bind(
     }
 
     default:
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         return -EOPNOTSUPP;
     }
 
@@ -608,13 +608,13 @@ int pt_irq_destroy_bind(
         return -EOPNOTSUPP;
     }
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     hvm_irq_dpci = domain_get_irq_dpci(d);
 
     if ( !hvm_irq_dpci && !is_hardware_domain(d) )
     {
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         return -EINVAL;
     }
 
@@ -647,7 +647,7 @@ int pt_irq_destroy_bind(
 
         if ( girq )
         {
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
             return -EINVAL;
         }
 
@@ -689,7 +689,7 @@ int pt_irq_destroy_bind(
         pirq_cleanup_check(pirq, d);
     }
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     if ( what && iommu_verbose )
     {
@@ -733,7 +733,7 @@ int pt_pirq_iterate(struct domain *d,
     unsigned int pirq = 0, n, i;
     struct pirq *pirqs[8];
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_locked(&d->event_lock));
 
     do {
         n = radix_tree_gang_lookup(&d->pirq_tree, (void **)pirqs, pirq,
@@ -818,9 +818,9 @@ void hvm_dpci_msi_eoi(struct domain *d,
          (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
        return;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
     pt_pirq_iterate(d, _hvm_dpci_msi_eoi, (void *)(long)vector);
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
 }
 
 static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
@@ -831,7 +831,7 @@ static void hvm_dirq_assist(struct domai
         return;
     }
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     if ( test_and_clear_bool(pirq_dpci->masked) )
     {
         struct pirq *pirq = dpci_pirq(pirq_dpci);
@@ -875,7 +875,7 @@ static void hvm_dirq_assist(struct domai
     }
 
  out:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 }
 
 static void hvm_pirq_eoi(struct pirq *pirq)
@@ -935,7 +935,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
 
     if ( is_hardware_domain(d) )
     {
-        spin_lock(&d->event_lock);
+        write_lock(&d->event_lock);
         hvm_gsi_eoi(d, guest_gsi);
         goto unlock;
     }
@@ -946,7 +946,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
         return;
     }
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     hvm_irq_dpci = domain_get_irq_dpci(d);
 
     if ( !hvm_irq_dpci )
@@ -956,7 +956,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
         __hvm_dpci_eoi(d, girq);
 
 unlock:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 }
 
 static int cf_check pci_clean_dpci_irq(
@@ -991,7 +991,7 @@ int arch_pci_clean_pirqs(struct domain *
     if ( !is_hvm_domain(d) )
         return 0;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     hvm_irq_dpci = domain_get_irq_dpci(d);
     if ( hvm_irq_dpci != NULL )
     {
@@ -999,14 +999,14 @@ int arch_pci_clean_pirqs(struct domain *
 
         if ( ret )
         {
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
             return ret;
         }
 
         hvm_domain_irq(d)->dpci = NULL;
         free_hvm_irq_dpci(hvm_irq_dpci);
     }
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return 0;
 }
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -429,7 +429,7 @@ struct domain
     unsigned int     xen_evtchns;
     /* Port to resume from in evtchn_reset(), when in a continuation. */
     unsigned int     next_evtchn;
-    spinlock_t       event_lock;
+    rwlock_t         event_lock;
     const struct evtchn_port_ops *evtchn_port_ops;
     struct evtchn_fifo_domain *evtchn_fifo;
 
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -530,7 +530,7 @@ static int flask_get_peer_sid(struct xen
     struct evtchn *chn;
     struct domain_security_struct *dsec;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
 
     if ( !port_is_valid(d, arg->evtchn) )
         goto out;
@@ -548,7 +548,7 @@ static int flask_get_peer_sid(struct xen
     rv = 0;
 
  out:
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
     return rv;
 }
 

