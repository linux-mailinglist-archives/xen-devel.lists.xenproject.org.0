Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EAB2EB2A0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 19:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62155.109895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwr7e-0002oY-Hz; Tue, 05 Jan 2021 18:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62155.109895; Tue, 05 Jan 2021 18:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwr7e-0002o9-EZ; Tue, 05 Jan 2021 18:31:58 +0000
Received: by outflank-mailman (input) for mailman id 62155;
 Tue, 05 Jan 2021 18:31:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onuC=GI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwr7d-0002o4-0M
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 18:31:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c0c2e5c-7379-456d-880c-5d52ea4f8a0d;
 Tue, 05 Jan 2021 18:31:55 +0000 (UTC)
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
X-Inumbo-ID: 8c0c2e5c-7379-456d-880c-5d52ea4f8a0d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609871515;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=3/JwtcNJKz/PpTsIYBbTkjh8Ohkphe/ShnTPF4YhdWQ=;
  b=cVmWZTmKbDWAjJIrrC1q1JPUP7kNwCmbp/8X6DmXo+VvjxSWzBtjvsIf
   DTE3kCNbsp1avak/7+9MnGgxLlibpJUlVkOp0CCYnOnfrs/ydAnM9jZCF
   yWvbvvEyYNHydgOE4VgaLPif9rp9b2RY/lYqAoDeH4vK9sftNBECTnwJh
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: roztjlgBBJ0w6PMRoVjF+Pqi7H6WyAMIJidnyJgU22jcNN1NxJ8tlCJMh24HH1thsCbB+cRCuE
 LfOfdu31FknRA5Lo/wmlpvR23H2Wq5cXDS3GDHc48gKLyHU9u/1EiOT7nnf439USKIGBfenL/V
 RO6wngPMe7Mn8H3/hVMcpBkZyoMr3SpMys+ry3CgKEaGhHMoYiWjET8pKpwsuuBy97RirXKGpf
 XMu6qyUJL1PGB6oDFYouWn4G/BAZykrU8mnuaOXuecisWd7AuTdDFaaI0HGIfpJzPaJz+6/Xgz
 K+E=
X-SBRS: 5.2
X-MesageID: 34442218
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,477,1599537600"; 
   d="scan'208";a="34442218"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiitC5D2o50gD+oCDydou3LllJeUA3iA3clVvgx5swKyYGNjPmRxvySbLV9HhThn85fdf6OKXoXoM0aLZVSn9HpMOp/d/+l0v2vI1wj9IbO2dxm5hI7TPGnJ7e+orZX72BJhz0wkV+YIjdyWDqKHwVqQRTyhPvpWqxWC7IC5cywmLoubc9UH0tp+75T7IMf2caQqzo4jOacpiC31EdPS56DrB1826NLqFei4FTnWhs9MUMu3GYjjWZgMqvzW9VmC39W6aKUtJojZXwMsyHgDBAwsU0g8/Q9dYUGSH5F4wltJVUGlzrv4YDV+8jyDpQ8r3rKlDII28uUGOi6REAx+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjHgdWgPnLPu/MxYHbPlytIJkzEAREeuae78TUct0gE=;
 b=LTHNIl4JBMnHyeOlffAeBnMyjYhjpshCttOKSktQCKoZLdF6hgNoX/XYUzkrCLlnSkEnm9OlJfzwbz4IaxCD+dDRO9k5vNUz6tvWzOZKUTTYcsyDsjOB2vrlB5772aHMXq4Sb1qVpQh9EBVyNS2+OmAul2KlJ7QhufvFaNkG6QihxpT/hSsceFgM5wHswa79yKgs7HHiAe8LZmXY/D2jw++1+r/d11uW41SFWei/dlZZXFOWhqLBPdAMKtiuyXeIMxNJDM8EW32z3C0j9BBJ2vqe5e2hy4ihMzQSW0LpOrAfNswdT7dfUrDATjtG7uXktLIoDTFXU06ImhKGJurBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjHgdWgPnLPu/MxYHbPlytIJkzEAREeuae78TUct0gE=;
 b=xWFtgqiUmM0Bq78D+4xGPiqMGnb+a1g5DcVHOmT0tJzDejStP9YgYmROd5Oh95C+ME3DQSmHnXFuv8f1T3/MfJzi0nbdXmL/luMzsYzkGKmw92krYuV8zBhFJrwZz3mZfCk+HzrIJ5xNfc1XSTzzUI3hWto4GpCmd8El4ejF7nE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH] x86/dpci: EOI interrupt regardless of it's masking status
Date: Tue,  5 Jan 2021 19:31:43 +0100
Message-ID: <20210105183143.94547-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd2a0616-04d4-4817-2893-08d8b1a82c04
X-MS-TrafficTypeDiagnostic: DS7PR03MB5607:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5607E7C7C0816B3594C2B1198FD10@DS7PR03MB5607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BCm/kMDsEFRZIji2gIcWcksrm823OIjGuaLTpK4PcBeF4JB7P402iRqMrFXthku0dULXYYf/iMCv3eOlsUXIkW24u/Wuef0chYYpEvFRtGrr0heDUyC5ByL2fYZg9wGJFBmfCCjunM8EnnVVu6ysshW0DUXwVl4n9jT7zTkL1kqDqm7X20y5yeW6Uce2pQcGucBnvFKOc7JC23bXOqigkE60ue/BZom09W1mCHVtD+JzoLFGyO/GjPObIDvklXMeQo28mxA+3oMw5SBBpgf+w9IJ8dG4aHaiyGrntyyZ3YmkbUVHmaPaqMgNULeIZ8TvqZaEqIr8pkutD6RqB+WNXAv5+eroAU/IFR0LUVy+DBJBltslkFvJZLzqROMLAJ8ZbFcEBsIumB/cv63hE8W0YOPFp4EOj22BBo7Zw1Rka31+DZmuWQF8iDRxu5Yhf0/S
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(8676002)(2906002)(36756003)(956004)(26005)(83380400001)(6496006)(186003)(478600001)(66946007)(316002)(16526019)(66556008)(6666004)(6486002)(8936002)(5660300002)(66476007)(6916009)(1076003)(86362001)(54906003)(2616005)(4326008)(26953001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHUwT1ZlcjVUUDVjcVlwWXNvV2JNUXV1QTE2ODBvRXdnbVF0MTZ4U21pOTVl?=
 =?utf-8?B?M2JGZ1drQlpGc3U0K3BTZC9vSmZsQXdteGprUTZmRC9qaGxKT2NqZG1ha21I?=
 =?utf-8?B?aGF1QnlVQ0hScEFERnFuRDhhcGhCTkdlcW8vWCtNV0tkMjhmQVBLWlFudy9j?=
 =?utf-8?B?OXdIZEltMHNYUVNKcTdndXZkV1pmMklFY252cWVMQ2daYzdFdkRwN2ZHcHNH?=
 =?utf-8?B?MHVhRXNOYVhITzJ4MXVsb3Jsc3RQbVhhUGprNVVuMU94anNIT1lISGcxNEJy?=
 =?utf-8?B?OE8rNU1OSHdDQ1c5d1kzNC9SMlc1eU5mU1M1TkRYR2FOcXU2dFdvekRCVWNN?=
 =?utf-8?B?cUNOUkhWS0RDZE5lUGtXdDJ1ZElsWHdPeEpHaHdRdGdWT2RmbzN0aGFoSlZR?=
 =?utf-8?B?cFRiaDFhckMwVjlmRHZTQ2VodnZPRWh3Q3ZKTWJ5RjBNTHdkaTNjMzF6b0hV?=
 =?utf-8?B?TjY0TUlDUDNtODZTc2pBUHdlTGpDdW9PdHJkTjZQRU5MSjAxT3dTU01QNVA2?=
 =?utf-8?B?VGg0ZzIzQ3NOWG04MzJQdE1qUWZaQXhzNnVPQ08yUEJ1N0RYL3kzZ2tmRFhl?=
 =?utf-8?B?di81bGVaOXZBd2dyREl4Z1MzVGxtR2RLZXVWZ2YyK081SjlJcXNPT09JV01o?=
 =?utf-8?B?cUpsWHZINlpaeDRzMGxxOVZCN0lIc01QUlpRWDRwa2MzU0Zqak96cVhjWDAy?=
 =?utf-8?B?ZUZNK0xrQzROdEpzcktpTDh2ZVZRZkh1d1dyZ09PcE1xNVBkV3JZVzNNeUZ1?=
 =?utf-8?B?R25RMHRGdVd3OThEWkV6ajB0ZGh5VHVUQ2srVXlMbHNGR25ZVzBhV3cxeFFP?=
 =?utf-8?B?UWJka3BoQXNoeENIb2tYWHF0MEk3WnlMZ1ViWTRtY2dpNlZIK3RTY2lwNjNE?=
 =?utf-8?B?T3RINXR6WllFSkN4anVCc2ovbGFkL1FQbnphVWxRVTlMbEh4QjM2cVcxdE50?=
 =?utf-8?B?ZFdBMGRaQVhVK0hJUUlZeFB4ZEVnc3RpeE8xOHlYTHFnT09YQ0lucEJITUR1?=
 =?utf-8?B?OFBLYTZudGRRVkN0YitOODRMb2V6NW14U29jRVFoZzdFRTlBUXhOMnlKeGZH?=
 =?utf-8?B?a013NEdxb1Q3enZIK3R2YTBkNHRsZmc5NkdhRlA3NHdVRGNTYjFFNGh3UW5l?=
 =?utf-8?B?SXVvYmJuZUtkeHc4MlJZeDhyMXBqemhvcjJaL0dORWZkWjJ3bFBBVnh3ZVZ5?=
 =?utf-8?B?ck1pK2dkczJ0Y0dtNnVmWFBoa0Zac0FHakltcXFCVngzNXlwdlNaTHdRdElk?=
 =?utf-8?B?anF2TWMvZmNuZWphYkhsaU03SkdkbzBTRlNOS21sWWx1RXRzTG5OdTR0L2Vp?=
 =?utf-8?Q?EC2kwGhMaskCr7dsjNS09WSPMH2Cq275+Q?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 18:31:52.2912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2a0616-04d4-4817-2893-08d8b1a82c04
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMDrbXN9VkM7lbppiJeGEdQnK/ZQ2qOQavn/S7IJa9OKqJSUaC6MTFJvjzj7heQovgdTmtJGDEN4RltBL1bPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-OriginatorOrg: citrix.com

Modify hvm_pirq_eoi to always EOI the interrupt if required, instead
of not doing such EOI if the interrupt is routed through the vIO-APIC
and the entry is masked at the time the EOI is performed.

Further unmask of the vIO-APIC pin won't EOI the interrupt, and thus
the guest OS has to wait for the timeout to expire and the automatic
EOI to be performed.

This allows to simplify the helpers and drop the vioapic_redir_entry
parameter from all of them.

Fixes: ccfe4e08455 ('Intel vt-d specific changes in arch/x86/hvm/vmx/vtd.')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Kind of RFC, I've been trying to figure out how this was supposed to
work, and couldn't find any reason why the EOI is not performed if the
interrupt is masked on the emulated IO-APIC. I might be missing
something, but relying on the EOI timeout in that case seems wrong.
---
 xen/arch/x86/hvm/vioapic.c        |  2 +-
 xen/arch/x86/hvm/vpic.c           |  3 +--
 xen/drivers/passthrough/x86/hvm.c | 21 ++++++++-------------
 xen/include/asm-x86/hvm/io.h      |  3 +--
 4 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 7c462a44d4..eb6c143f74 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -521,7 +521,7 @@ void vioapic_update_EOI(struct domain *d, u8 vector)
             if ( is_iommu_enabled(d) )
             {
                 spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(d, vioapic->base_gsi + pin, ent);
+                hvm_dpci_eoi(d, vioapic->base_gsi + pin);
                 spin_lock(&d->arch.hvm.irq_lock);
             }
 
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 3cf12581e9..c1c1de7fd0 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -263,8 +263,7 @@ static void vpic_ioport_write(
                 vpic_update_int_output(vpic);
                 vpic_unlock(vpic);
                 hvm_dpci_eoi(current->domain,
-                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin),
-                             NULL);
+                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 return; /* bail immediately */
             case 6: /* Set Priority                */
                 vpic->priority_add = (val + 1) & 7;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 41cfa2e200..edc8059518 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -950,8 +950,7 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
     spin_unlock(&d->event_lock);
 }
 
-static void hvm_pirq_eoi(struct pirq *pirq,
-                         const union vioapic_redir_entry *ent)
+static void hvm_pirq_eoi(struct pirq *pirq)
 {
     struct hvm_pirq_dpci *pirq_dpci;
 
@@ -968,7 +967,6 @@ static void hvm_pirq_eoi(struct pirq *pirq,
      * since interrupt is still not EOIed
      */
     if ( --pirq_dpci->pending ||
-         (ent && ent->fields.mask) ||
          !pt_irq_need_timer(pirq_dpci->flags) )
         return;
 
@@ -977,19 +975,17 @@ static void hvm_pirq_eoi(struct pirq *pirq,
 }
 
 static void __hvm_dpci_eoi(struct domain *d,
-                           const struct hvm_girq_dpci_mapping *girq,
-                           const union vioapic_redir_entry *ent)
+                           const struct hvm_girq_dpci_mapping *girq)
 {
     struct pirq *pirq = pirq_info(d, girq->machine_gsi);
 
     if ( !hvm_domain_use_pirq(d, pirq) )
         hvm_pci_intx_deassert(d, girq->device, girq->intx);
 
-    hvm_pirq_eoi(pirq, ent);
+    hvm_pirq_eoi(pirq);
 }
 
-static void hvm_gsi_eoi(struct domain *d, unsigned int gsi,
-                        const union vioapic_redir_entry *ent)
+static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
 {
     struct pirq *pirq = pirq_info(d, gsi);
 
@@ -998,11 +994,10 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi,
         return;
 
     hvm_gsi_deassert(d, gsi);
-    hvm_pirq_eoi(pirq, ent);
+    hvm_pirq_eoi(pirq);
 }
 
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
-                  const union vioapic_redir_entry *ent)
+void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
 {
     const struct hvm_irq_dpci *hvm_irq_dpci;
     const struct hvm_girq_dpci_mapping *girq;
@@ -1013,7 +1008,7 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
     if ( is_hardware_domain(d) )
     {
         spin_lock(&d->event_lock);
-        hvm_gsi_eoi(d, guest_gsi, ent);
+        hvm_gsi_eoi(d, guest_gsi);
         goto unlock;
     }
 
@@ -1030,7 +1025,7 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
         goto unlock;
 
     list_for_each_entry ( girq, &hvm_irq_dpci->girq[guest_gsi], list )
-        __hvm_dpci_eoi(d, girq, ent);
+        __hvm_dpci_eoi(d, girq);
 
 unlock:
     spin_unlock(&d->event_lock);
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 558426b772..9453b9b2b7 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -118,8 +118,7 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq,
-                  const union vioapic_redir_entry *ent);
+void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq);
 void msix_write_completion(struct vcpu *);
 
 #ifdef CONFIG_HVM
-- 
2.29.2


