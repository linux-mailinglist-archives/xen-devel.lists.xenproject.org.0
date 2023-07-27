Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DE27648E4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570809.892991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvaP-0001VY-OW; Thu, 27 Jul 2023 07:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570809.892991; Thu, 27 Jul 2023 07:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvaP-0001Tl-LZ; Thu, 27 Jul 2023 07:39:01 +0000
Received: by outflank-mailman (input) for mailman id 570809;
 Thu, 27 Jul 2023 07:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvaO-0000oV-BL
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:39:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a65a739e-2c50-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 09:38:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8026.eurprd04.prod.outlook.com (2603:10a6:10:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:38:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:38:58 +0000
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
X-Inumbo-ID: a65a739e-2c50-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwjPV5rzFikFiImdAsVzsAfrUIrIiieX6RTXK2Z7CmM2zNU+5wc/7sZ4kOrKx0QrtCDNLH1Fo+Da+4Rh517guPk3vi8CXgVzdnQq82dVfve96vF1oyABseynDVOmJ8IaWBq0TzDpWgURENshRpjKy6vfoIUWDT5Nd8q5G7oY+m9vdVGx5dVQnxf2j1kMvhhRsyma2KuAztn8xPlA42rcb2hTqBVc4WkaDG1UgNK/6d0U8uNrcfyROJ0kgHpfddgv+nAKpxg5x9VpjRqdgSkRePjxXDo5Ixf0W+bs/h0hJFgcJqoOOv68M1hn3+J5VqQE3Hd4Ef5w3gXj5tSjMSQuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcI5ZJzazpf4rWCLgNaHF2wR1tw4mKVTroN0tDPQMsM=;
 b=U5dZHRlscsMqLLIRSNZWHgpMpz4xrpal9KLc28xPSJ2VffYoO/G+O6BlPmVhj5/kZJ7GB+RkQElm2QX3L/C6lJiyDa/4oZe1oZZX8zyq+7wFFBp2tfUOvEeXCxAdjc9K37wwgh0u6maWVx2N+qSTnDfIwkTdG9AGosKCYKnjoTXmclxKLArIJ5pUq6u7BvvqVFMOBtCYKCRqLBbyaE/nqCEsTKYVdAAP9Apqjsiefx5qD9+SAZgzrKpxd0n7tUNrQjCgy10x5co69BJw/z/md2/2j9F303DGLPhWY8PkCrjao8cYhn85dp1pR91oHO9GSVw8QcmIZbM8rZZuM1DPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcI5ZJzazpf4rWCLgNaHF2wR1tw4mKVTroN0tDPQMsM=;
 b=Aj9Yno/MvACaO1g0NEFklF3LLItAvZSh8FpqY0/jNUCt8ihsDAQ/zB98M00X7RUqxZBFbBEJ+/DNR8qlGdHFXYMXDR0NJ4Abnox9kSIbCOh+a/VkY1HZ5tAsUsVUvl6tuXfR72k39MENP9YsTvDGvVmZpB1zvKRkPgHat3ULliIn7hBigVPcM7QiNIdYfh6u2cQqOOxnWFbCvQk7wtOyjlvN9t4mWI2+mISkvid+L4LHyAX/YGnprkaLasShl7CYPEe/uiNBL02z5OIM4ePeHNouVD5MZey72b5gRoeqNk6DyWwDAHbGAO4ruOTm9gSoCm8MoIi9ITBS2LHdXqy6Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com>
Date: Thu, 27 Jul 2023 09:38:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 3/3] cmdline: document and enforce "extra_guest_irqs" upper
 bounds
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
In-Reply-To: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: e357e203-fb80-4bb8-3ddd-08db8e74898f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tddKRQH9BPT2hKmHa75uwHZdQw5ByTpVpyxtjSi84jDQ4cdb/omKBMBfPNy7oX5CnZNzJc7khVtJHd+fm7HgODXfgvb8YScdBEBkIkdzbJuUQPcSal4s2WPsCh9srUuu6UlC6pGicK6/MnUZFoyJ9b2b/KcLxgUImikSMpp5hjaluCR7UVkoHKndNCevo0kPL3ocaWoAzofTlDVyyKANnzYCFqoEgUrG5sq4fCFRlNutVY1gLpY3mOHl9U7oASbtkM3oWVqlbI95D++eY0yozC2lTCZ4HVFFKIJRhotH/XMIZNKdH33M5cRjw6hDWCAptDjTPCIMxq1UVHjb06ztyeDZpeyeM2if1T1X0iIkFH3HJ9E2SdBgqi9OIGdTHRQadNdOTyOLhbPIn/kkJaJkBmo4cLqlwLznkgWaiEIw6AwP0sTFKTj+c914TQ809TkDRaUSlVwlADDb+eFQaNSfb9tmVEb2Qa96UR8UV3ccd+GtU111xy71Dx0b/3NzEQ6jWutTHs6aWN21hC5O6XqqhHDFxQpUP7wRbI58Wbvk4xeloeCMP4E56J+8pziogGCxkIn2gttMrKjndTtvr1gGvGIdhAbvAk00YgZKYjEGSGAIbby2U77uKYm64HI9ezN4oShUeKUDXA6+z+pFxHh8Xw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(6506007)(26005)(6512007)(6916009)(4326008)(54906003)(66556008)(66476007)(66946007)(186003)(2616005)(38100700002)(31686004)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2R6bTJEV2h4U0ZhMTBjYW5MTytCb0FuZXJNVVZhQlZHeGdtUXVaSkxVSzJ3?=
 =?utf-8?B?MENPVi9HeTJ0OWE4NW4rRWxKL0FGWDBJMzdQSmdOZ0JPcURNVUpnbjV0WDhM?=
 =?utf-8?B?VDZjREpPbEhRd0FOS2ExMEk3Sk1NZ3d1U1FpYjE0MkpPejc1UjFZUHVxL09T?=
 =?utf-8?B?NGRRTVVhaWNDKzVCV1NuaUJ3OVZRL2ZhNENydllxK1pOMllBMEsyUTNpUTJh?=
 =?utf-8?B?eUIxYUhacEJ5SUVpV3ZVdnRpa09MK05WSmhVeWpQZGJzUEVQSHBWSzg1VlFk?=
 =?utf-8?B?Z2hmc0hTczYyM3VtemhNRStDcC9OZVZlTVRmS051K01Na1Q2eFhyWnVMVlBS?=
 =?utf-8?B?YVh3eUF3Zk5aUTg0akpNU2N4ZlNnWUZSOTA1eHZFNFhkclUvVFZtSjhJRGtn?=
 =?utf-8?B?Z1JPc09pYTZGSFhRWE9ibVpVMENkQnpHazFoYjFneGpsdGJ2eTJuMFlwaXVK?=
 =?utf-8?B?YWdDQlFnR3EySUE5TWlyYVh3MStPVWpFVHNNdXBRWGhOWUluaXkzQSsweE9W?=
 =?utf-8?B?NUtFUTVIU0VONFVxd0dybHRNVTExRWl3cjZSSFgvM0NWTUFyamhGV01PZHJI?=
 =?utf-8?B?UVo2VzdOaUpmc1Rzd1NJNkt2TFpYTmZFMmdramxrWTF3RmRkc0ppcEp5RE44?=
 =?utf-8?B?TW9IbjRrcSswMkRYMGNBTzFPUS95ZjN1eGk5UU9mQUVzUHZoMlBqcklOYmxY?=
 =?utf-8?B?Vm5peWpaU0JFL3RuL3ByWE5FYjZFOEt4Uyt1NmdnUTROUEFXK2k1U2NWbDBD?=
 =?utf-8?B?YVJLamtPNW00eXNic3pYYlFtVUh4cmo1dlZRR3NSeGNxdk1TMy9iUC9hTmdn?=
 =?utf-8?B?WVV4eEtGemNTaDZzK09td1lDNHBKbFlBZHpnWWJhYW1NL1Y4UWpiak8xMTgx?=
 =?utf-8?B?MHhQTFFScVdyUHM5V1NENmZrRjM2bUY0Qzd5bzlLV2NYcWF2RERNOENCYk1P?=
 =?utf-8?B?WWtEc0F5S1VZbnJWOE1OaUVCMUlkQXl6ZFYvS2dVNHQ0RHZPNlhEQ0R5eC84?=
 =?utf-8?B?TmpqTXI4bnhNb0FOL1Q5Y0VVZGt0Yzh0RTVSMWpOcERHQjFlVE1vTjNRMjVO?=
 =?utf-8?B?T1AyeEc2bDdUUWFaQXZZRlY3OFRzUjVVY1Vmb2pvcWhPYUZaS01MUEpGMVc4?=
 =?utf-8?B?dm90dmVoblhJbnVLUzk1MXFtbG9zeElaRzJrQW1tVHY4M3J4bFd6R05pdHBG?=
 =?utf-8?B?ZUY2MUFzNTdaT2hmdHJnSVdDS2I4bElBV2dlMS9VSGRsNVdUbVl4RzljL3dw?=
 =?utf-8?B?Q25Ia3ZWdm9qMFB3Z1crN2R5LzBXTDUvdjdGWmZUbi96aDR4WmxjYXRpL0pj?=
 =?utf-8?B?TXRBb1VDaVUwcFN3L2JxUFlDSHBGb3dXa05NbWFpTlRkN2dTbnVLejNxNG1X?=
 =?utf-8?B?TGFmdXNpbUhWMW1pS3lmS1VidzJZd0p3ZElWU01BTXQzckR0Qm91NVgxSmZ2?=
 =?utf-8?B?YXBoYUF2L1poTU5VOHVnd1ByZ1p5ZVhRNWRuVHRsY1Z2WGFONGpUak5GdmRR?=
 =?utf-8?B?VE52Q3VBd2FVYmhEVCtMS2UrSldRdlRrM0RhVUl3d1ZGajlwSEpCL1F3dkxF?=
 =?utf-8?B?aWk5bmpOYkI3bWZHSjBDTUFZcUczMU5rQ1hZb3Rsb2NDV2gwYXZveGtaMHp4?=
 =?utf-8?B?NTVjcFJEOThpVXFTM3NjeWI5MGRYQmhWVExGdzZHOS9ITktMcm42N0VVVFdy?=
 =?utf-8?B?VmNWWjVSbjdQRUJYcDhKZ2x0aGNVKzV4eFE1emxubWs3bWV2Tkw0NlNhL2xr?=
 =?utf-8?B?TmRDcTBENm13MnRGWW14MFFVV0kvQlZSZEd3d0taUldwVytFYkdaakg4L0F2?=
 =?utf-8?B?TEhKbFhBci9jeWtvSU1PM0xwRHgxTWV6ZUhRMkg5M3ZoVXExZ2JlL0V0Skxh?=
 =?utf-8?B?Y0VTQzh2WTBreUcrQXUzZy9wUnAwYzQxamNET0JISkNwcStjaFNiY1d4ZG9B?=
 =?utf-8?B?Z25oOUJmVVlrbENXUHNab0xoTzZ2SzA3bkkwckNQSUtZemc0VTJSbGxDaWxY?=
 =?utf-8?B?MUdtc1kxVi9QS0VSVGY5cGdLcVArN0RjUC9TdjYxZW1KYjkrTDQ5c3RIb3Jn?=
 =?utf-8?B?ZUNDOXNBTDZKNEViajNYaDBqSE84Y3RFT2s4dCt0N0hpZE1UTlIwdW9hVDYw?=
 =?utf-8?Q?XHAbYzBZx/lf5jFfm9n2GeXGm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e357e203-fb80-4bb8-3ddd-08db8e74898f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:38:58.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0zbVvRQOV3DmCAIw7+qnOc+Eovgqu1z68HmgyMm5pw31KL68/KIYfQVeA9YiWE72HUc9lO2PjNoe++uMfv1KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026

PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
more than 32k pIRQ-s can be used by a domain on x86. Document this upper
bound.

To also enforce the limit, (ab)use both arch_hwdom_irqs() (changing its
parameter type) and setup_system_domains(). This is primarily to avoid
exposing the two static variables or introducing yet further arch hooks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of passing dom_xen into arch_hwdom_irqs(), NULL could also be
used. That would make the connection to setup_system_domains() yet more
weak, though.

Passing the domain pointer instead of the domain ID would also allow
to return a possibly different value if sensible for PVH Dom0 (which
presently has no access to PHYSDEVOP_pirq_eoi_gmfn_v<N> in the first
place).
---
v2: Also enforce these bounds. Adjust doc to constrain the bound to x86
    only. Re-base over new earlier patch.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1146,7 +1146,8 @@ common for all domUs, while the optional
 is for dom0.  Changing the setting for domU has no impact on dom0 and vice
 versa.  For example to change dom0 without changing domU, use
 `extra_guest_irqs=,512`.  The default value for Dom0 and an eventual separate
-hardware domain is architecture dependent.
+hardware domain is architecture dependent.  The upper limit for both values on
+x86 is such that the resulting total number of IRQs can't be higher than 32768.
 Note that specifying zero as domU value means zero, while for dom0 it means
 to use the default.
 
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2663,18 +2663,21 @@ void __init ioapic_init(void)
            nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
 }
 
-unsigned int arch_hwdom_irqs(domid_t domid)
+unsigned int arch_hwdom_irqs(const struct domain *d)
 {
     unsigned int n = fls(num_present_cpus());
 
-    if ( !domid )
+    if ( is_system_domain(d) )
+        return PAGE_SIZE * BITS_PER_BYTE;
+
+    if ( !d->domain_id )
         n = min(n, dom0_max_vcpus());
     n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
 
     /* Bounded by the domain pirq eoi bitmap gfn. */
     n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
 
-    printk("Dom%d has maximum %u PIRQs\n", domid, n);
+    printk("%pd has maximum %u PIRQs\n", d, n);
 
     return n;
 }
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -693,7 +693,7 @@ struct domain *domain_create(domid_t dom
             d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
         else
             d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
-                                           : arch_hwdom_irqs(domid);
+                                           : arch_hwdom_irqs(d);
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
@@ -819,6 +819,24 @@ void __init setup_system_domains(void)
     if ( IS_ERR(dom_xen) )
         panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
 
+#ifdef CONFIG_HAS_PIRQ
+    /* Bound-check values passed via "extra_guest_irqs=". */
+    {
+        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
+
+        if ( extra_hwdom_irqs > n - nr_static_irqs )
+        {
+            extra_hwdom_irqs = n - nr_static_irqs;
+            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
+        }
+        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
+        {
+            extra_domU_irqs = n - nr_static_irqs;
+            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
+        }
+    }
+#endif
+
     /*
      * Initialise our DOMID_IO domain.
      * This domain owns I/O pages that are within the range of the page_info
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -173,8 +173,9 @@ extern irq_desc_t *pirq_spin_lock_irq_de
 
 unsigned int set_desc_affinity(struct irq_desc *, const cpumask_t *);
 
+/* When passed a system domain, this returns the maximum permissible value. */
 #ifndef arch_hwdom_irqs
-unsigned int arch_hwdom_irqs(domid_t);
+unsigned int arch_hwdom_irqs(const struct domain *);
 #endif
 
 #ifndef arch_evtchn_bind_pirq


