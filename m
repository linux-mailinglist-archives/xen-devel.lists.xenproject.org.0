Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350F16D5BB8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517698.803423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjcqP-0000Pa-Ht; Tue, 04 Apr 2023 09:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517698.803423; Tue, 04 Apr 2023 09:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjcqP-0000Ng-EC; Tue, 04 Apr 2023 09:20:49 +0000
Received: by outflank-mailman (input) for mailman id 517698;
 Tue, 04 Apr 2023 09:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjcqO-0000Na-Ht
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:20:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fae3a15c-d2c9-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 11:20:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8422.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 09:20:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:20:44 +0000
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
X-Inumbo-ID: fae3a15c-d2c9-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZgDFb4IqiwfLkjEEmwkZ+1ljIk4DDuHVz3oIuLuTMqfbpBYTuRORqo87+SSzSrFmshEsQr6S/+V1siJ0GWhOWJrpv3uZ+JbfEPh8yX1RSVqSOzmeILDLK8gZDKJ9Yvap7MwtF6l6djAmWwmCnF+6vHKrCJ3QySBex7nY9iAK2QaqoZyBz6ERgoRYswfCVdCmRraEWap5C6fhJmnDCOsfE3DBj+cb1Ya9Fq6UHYhV4A3gIU53AQ+iegHf/+0OtAAvb5/zXbDcj9NOnZEIo1Fiz6RawfieAzS/bu9/ZKmvk/ZJOjjm3unV2HvwMvS6Qr6BqVWYXe7V2X6Zm5zO3/Q0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbtH2o36X0z7MtAmMJTg+4apLZdjst0d0KZ8EsroDUQ=;
 b=MsKkMCZI4y6TPZj02Zdv6lLEBKO4Ewt+9tL2CJv5exJK9qL+GZlP8OeyfYeUDk99R33XBowojuRPs4AnvjuKzILOr1iiJfQ0OS2fCaVSpzBvTDIojqYTCXR8RyVt/o449PVY0Zf4fs0fOJhWNieMw165DJxPoD1pQ5ACCBVGMnNId8GNzCDzaq8SopYovrb+/jKTCbkjnXkYMmrl634Yv404Ub4xdulXc3yfv58SAuDRq44sXhUfQTmQNBWw05C0ZOYh1CIt6/5Nd8u95PyuBOwmg6GjrGxSW91AZvTBKtu0Vsf+KALUXel4WIHwK0Ovj/YfZYs2NVlGP4197rXSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbtH2o36X0z7MtAmMJTg+4apLZdjst0d0KZ8EsroDUQ=;
 b=v0cSlHWMihQ2ahcbgOv1/1zcFACldyujn7pVwC5UPApOF3AvzywRR1Xl7e8jHsADnc3QZ4mgW2E1RdO0jXBGsvJZo7t1l3xJPmLXR3ToZsg9n12lx/D9ZbX8p+tMgIAHW2vmcDqCqnyFOUBc0OLav9J8alFZ1b5gq0epzGlYsF0UmM+FrDDWL1pdKibXb8wSB1702i7sB/DJMkDluHx3Y0qBpJHp2YgNGzhDRA8K1xnDNYGecb0tDT7gUK2GkiXaTosUylgHl+kwQGGNuYFrboDLzClUB432aaHajzsdETvDtYorenruGHh2sS7DvurLNx6DZijbtD8RqPIxOGFzLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54e126fc-484b-92fa-ce66-f901f92ec19c@suse.com>
Date: Tue, 4 Apr 2023 11:20:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] cmdline: document and enforce "extra_guest_irqs" upper bounds
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: b91f59e7-56c9-467e-0c21-08db34edde56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xjoLBMIkTSAHNvG456J/d59nZ6a+nevWUuvchG3yBeqRc0TGrXi5mDm7fqYtddG6FejbdCpLg8Nv9mPa9fOIJmyYqem8z802VYELLJR1O1mwPDty+tfgcsDzkEXELn+pmcSfb2kVw4Ggl2QGnVAMH76G4jT38aCRUVr1se8Hd9T/PI0AEZbSZOQ0FwBCwvAapzAxD7pd+FyHDCgX4w4b9GNXAhdvkoowqlHQFdK1HbYTpq54wyt7uMQ3QJ/vXUQnKDl+O6UpEF5ejRHEvl1iXLUbL45cDtJtxZUezuVqEHJFBpNAXrtRXQM+fU6fn2uP1xKG/rY57MCK63rz4/9jU2C7Hm9VpDIesY43XKrcVGfcuKwmBE8es08hwZuoyQrFrEEkF4zUxCBiIe48yzUKh3PN58aR74QNMWvaRbPfe3YV66VThkvQszVrYS66XbISyXF0Xkv6HWJeNQXzjzVAeCgITJdtcfO5jVuLbyLtyPTI0HFriZFxoJ4FkmE0UoCqHSXtg5AfRDkrQeN2HFmnSTq3VftAPJwkwofwRyQiiZoUKI1x5xvkGxdLjQTcrHYUQXuCtF8Rr2NY38bVeq1+kvOY2D0Ag0srVrmLlXpzpOIlv2IC62Ugoueji6BSX6WY5BjtyWgTFBf6rKtgC5ifsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(31696002)(36756003)(2906002)(31686004)(2616005)(6486002)(83380400001)(186003)(26005)(6506007)(6512007)(8676002)(4326008)(316002)(478600001)(66556008)(66946007)(66476007)(6916009)(41300700001)(38100700002)(5660300002)(54906003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2FWeGM4THJKdmZPbjFYU1IzTmNZN3lFek5OaXZaMFl0UnBqemFCTzhPUEc5?=
 =?utf-8?B?bit1eWZ2czg4d0UrVUVFbStQMXJhUWREL0k3cis1d0lCTkZUM1AxbWJLZ0tn?=
 =?utf-8?B?N0gwNUErWXlaU1JNZTFmaFRwN3JtblVhRDVseFBBTUdRNzBCV2xSUGVDcDlD?=
 =?utf-8?B?Ny9keE9VcUF0b2VzeDJPSWV2SU5SNXBUQ3RSb3JJTjdOekVxdHE3R3pRZnFj?=
 =?utf-8?B?Zm8vZ01rNFZmak9tamk3WmNnOUZpSWRjK1pmUjNLZlVVRXI5RXJqQ21TZGpM?=
 =?utf-8?B?bkN2anZrcFpBaTZBSWtRbm1td3UwVXFiUGxPNmt0SkY4LzhHNlNiaTVublZR?=
 =?utf-8?B?c1l0a3Q5eEFYY3Ryai9aYzR4UW5ab0Uza1V0RkxYOURVLzlWcW04cFlhOW5J?=
 =?utf-8?B?b1VTeVVOcDBGNHhVUGlpenp3ZnFSSWg0Sm9JcG5VYUw2VjlBcnhmUEJiZWFV?=
 =?utf-8?B?ZmxIOVhVRnZOQjRlNjNtMzdIcnQ0UkNadmlUeTl3RzJqYldpWFlYeGZINEtn?=
 =?utf-8?B?OGlJSW5Sb3IyZTJDMlp5LzlhQjNzdlNLd1ppYnh1WGg1MnhIOFd2dnZsVzdu?=
 =?utf-8?B?Z040N0Y3U2VZdnhaSVZXT3hGOWdpRVZESXB0czd2TEhrMlBoUHVnM0dFYkRY?=
 =?utf-8?B?bHBOYXlnM0ZCeHIzdzJOODZ6M3l1dGE0aTdpazc4Z05KMkJkWVM0UmtkSVI4?=
 =?utf-8?B?RFdPS0ZDRHhQSmh5SWFLUTJmbThsam1JeFFvVFdsbHN2Rk0wRWtRNjhrS3pX?=
 =?utf-8?B?NmtqUmppRklRR1RmZitNWjZyZjNaRWlaUmthWFdEaE9LK05rUFMvb1h6cjMw?=
 =?utf-8?B?VUNJWnZJUkZ3aDlHZDlWcmpHdHc5MEVjWm9ydnE2dm04TS9LaWdDbHhmZVZN?=
 =?utf-8?B?Umt4TDlwaXlDQ2svS0VXdWRsdjdYRHN1OCtqeXVTdU1lbStHTmEwK1FGaS96?=
 =?utf-8?B?UG5MNTZFZUd3V1pZYy8wWWVSTVVxVnNweFVZK1RndUV4SjZaQ1pxcEJpbEVp?=
 =?utf-8?B?WXd1UE5neUFWQmxXR2ZwOGswUThvV3JQaSt6ZDNEUE9yQlBDb2dCaU8wL2h3?=
 =?utf-8?B?MWF4WmVpNUw5SE9DeUE4SmRsM1JEVVUwZzFqcmVqZFd3R1dBbkkxNnl2R0ZQ?=
 =?utf-8?B?YnI5WTBXYVpkeUduWHE0M3ZoMUgxZVRSWFJ1RTV0Um1Bd0cxZDFnM0xUMUV1?=
 =?utf-8?B?WWxUM2RWVUlZdzRwYjVJSFp5dEQ1aEpzZnQ3ak9mcTlxTS92enRhQXBOR0o3?=
 =?utf-8?B?VWQ4aUxxMklTQk9lcHJyc0t0R2tja0dPWnRDaHVWSmNlUnF2QnR1TmRBVkUy?=
 =?utf-8?B?Ky9ra3ZzUFNsRW9zM2NHUys4VVBad2YxbE40VHc4dU1xbUZiMExGdG1xNTV5?=
 =?utf-8?B?bmxwTmxSN3dtd1p3cnVaRU9CMFRVNFBwWmUrZ0ZkWXBSMXJ2bFA3UEF1TkJU?=
 =?utf-8?B?eVgzZlhGN3hxT2FyREVmaCttRU9rNm50RXBzTXkwUWJFZ0k3SmRxZTF0SW5B?=
 =?utf-8?B?RWpzMkV1bk1XcXNKOThwd3lCSmdJNktXVjdHVVREc01ZOSttYXFBc04zQXRW?=
 =?utf-8?B?MFZwQm0vMGdFMWRJcG5ETnBKNFljdXFHam1oNHVYSW5aNElRWHpHRWRaNXpW?=
 =?utf-8?B?bGxxOWkxYTdSSWZKKzF2Z0x6aDd4MUVXNE9BSk9jaThlSE5rbDB0SDNYZ0lE?=
 =?utf-8?B?enBja294U1Q4L1huVExtMDNPeEc4U3lSSTlTNncweTBlTE1ya291UFpkMll0?=
 =?utf-8?B?bHc2eEZmck5mNXFLOWF5MVZ5QWJGb1BHNnovNTRqOUt2aG1zaTlBaTlhaWp5?=
 =?utf-8?B?eWFRbEhXdlUrUU1ycklyTU9QQ3lGSUx3RUFqSUU2NFZ0d0R4V0VPcnFOekQ4?=
 =?utf-8?B?VzhnekdDQUYxUG45RjhYcHRQbzVKTnlYWktwbWNRU1FZRUUxaFhVekhwZzNa?=
 =?utf-8?B?dnZUMDlvclkvaS9IVy9CSjJ1ZEhJV0grL3pGeEt0WHJCUVJkbUw4V0oraUMw?=
 =?utf-8?B?blJKWlhvb1VOQ2ZFSzVWbzJRWEZaWlc3Wm1YdUhzSzlvcE5XRjZwZ2ZSN3g0?=
 =?utf-8?B?L1Jxc05PQlVQTzlka2ZCUTNMYTNJaFVMWnN5QUtZRUt2Z2lXYndTMUVpSkxY?=
 =?utf-8?Q?sO3TFk1c50LmlZwe2tBfn1Ior?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91f59e7-56c9-467e-0c21-08db34edde56
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 09:20:44.6882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9qH83bYv/CAcTpMap9oTVfpNRDRO4ovFGwcImjmw7BSntIKnzR4nW551GsntFag8CHNUT1G7YgodBNzJDe1Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422

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

On Arm the upper limit right now effectively is zero, albeit with -
afaict - no impact if a higher value was used (and hence permitting up
to the default of 32 is okay albeit useless). The question though is
whether the command line option as a whole shouldn't be x86-only.

Passing the domain pointer instead of the domain ID would also allow
to return a possibly different value if sensible for PVH Dom0 (which
presently has no access to PHYSDEVOP_pirq_eoi_gmfn_v<N> in the first
place).
---
v2: Also enforce these bounds. Adjust doc to constrain the bound to x86
    only.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1130,7 +1130,8 @@ common for all domUs, while the optional
 is for dom0.  Changing the setting for domU has no impact on dom0 and vice
 versa.  For example to change dom0 without changing domU, use
 `extra_guest_irqs=,512`.  The default value for Dom0 and an eventual separate
-hardware domain is architecture dependent.
+hardware domain is architecture dependent.  The upper limit for both values on
+x86 is such that the resulting total number of IRQs can't be higher than 32768.
 Note that specifying zero as domU value means zero, while for dom0 it means
 to use the default.
 
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -52,7 +52,7 @@ struct arch_irq_desc {
 
 extern const unsigned int nr_irqs;
 #define nr_static_irqs NR_IRQS
-#define arch_hwdom_irqs(domid) NR_IRQS
+#define arch_hwdom_irqs(d) NR_IRQS
 
 struct irq_desc;
 struct irqaction;
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2665,18 +2665,21 @@ void __init ioapic_init(void)
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
@@ -659,7 +659,7 @@ struct domain *domain_create(domid_t dom
             d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
         else
             d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
-                                           : arch_hwdom_irqs(domid);
+                                           : arch_hwdom_irqs(d);
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
@@ -771,6 +771,8 @@ struct domain *domain_create(domid_t dom
 
 void __init setup_system_domains(void)
 {
+    unsigned int n;
+
     /*
      * Initialise our DOMID_XEN domain.
      * Any Xen-heap pages that we will allow to be mapped will have
@@ -782,6 +784,19 @@ void __init setup_system_domains(void)
     if ( IS_ERR(dom_xen) )
         panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
 
+    /* Bound-check values passed via "extra_guest_irqs=". */
+    n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
+    if ( extra_hwdom_irqs > n - nr_static_irqs )
+    {
+        extra_hwdom_irqs = n - nr_static_irqs;
+        printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
+    }
+    if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
+    {
+        extra_domU_irqs = n - nr_static_irqs;
+        printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
+    }
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

