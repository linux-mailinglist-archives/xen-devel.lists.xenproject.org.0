Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1D7648DB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570805.892972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvZg-0000St-88; Thu, 27 Jul 2023 07:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570805.892972; Thu, 27 Jul 2023 07:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvZg-0000Qs-52; Thu, 27 Jul 2023 07:38:16 +0000
Received: by outflank-mailman (input) for mailman id 570805;
 Thu, 27 Jul 2023 07:38:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvZe-0000FZ-9d
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:38:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a26532c-2c50-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 09:38:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8026.eurprd04.prod.outlook.com (2603:10a6:10:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:38:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:38:09 +0000
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
X-Inumbo-ID: 8a26532c-2c50-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpLkLxMeWipIXfdCY25mI1kARJQhsvnEy2Q3VqRrpnYjlndNkp6MPIzuQQ/wQtKT9fh/P8cldfvRmZ6WcpunK5Q/pE0BGAisJYv2ARPa2KazTwgRLq2BuKYOI6oxVIR/mXoOgHuJQFMuFx+6LVgRblOpkWvoVI/LYs79Xvy4FwZmSrLT0eS3CgGWitOYEwetGoj0XJmBCog83v9IEMUVUVLfgRMDDai5t2JhZiAu2DeT0yY4Y84OktXQUMFtJ7rcNS+DYBf7bGnWiYvxiI2xZWSshPq2SxrzxjFrT+5d8W3UqjagiADmuh+4duXq9U2MBxxJpj1u3tmgH7eE+Jz1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taHtIzeBIdPQZ8hfsCK1k6WHI3O8TZ4BTx1jK1HZDlM=;
 b=CL1Pm90bMihvxK3goMiwpNxApJdm3mPBengCooGA43ZkMx9XUwKx/Pay+B31c9IPOpB6uYxCBLuMvFsjhl1anWbmKm+OJx26+Am3r+OTg4WQZvEDUPrJw62WdyRFvHlHLB7yj684vrOmaLPlSaAZx1GBjzdOt3LMbdUUQxVHUluiPHQwevBosuuqffL/IBQVc1J3tkZwyynf/F+nhGjgZXzcbEsSQrapmENB2MfRJtUQFAzXx1FeVUmOQ6pBZ0aJBGgScqAsVB6dHVvKIMl76rhrV51E8MHx75ZpphiCUl1ITJHMMHSO5jMh2am5jLi1Ba4aFeWzLJNjp0wSIN6QYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taHtIzeBIdPQZ8hfsCK1k6WHI3O8TZ4BTx1jK1HZDlM=;
 b=nPYKliH+B/aR+3Iq+2lMIu+iHa3iWDBQKHrkEEmwi2L1+1YWSGtuA9arV45lVHbhXtTWxydGaRbmrFRkpfBPXSgdPMQsGFxWDC3ZIQCktWPQuZk6hbv9Xi4w8KzISThDQnNn75vAPvhDzaDpflRCRbICDGXSYKzXv7S269aJC9wRk639OGbPy9GA8yW2ULG/4w/5wBK6e5tHqZk3M5+riFcxeU3sNKDQ7aFJ4FxjNF67LVSRv7vge05keJ/7sGcF4Qlt0BpK9wanJsQy9mtnGMLZGnMInfrikaDCR2+tFdAB5H39PZTD6QnrW3FoFn9Hy7+20aXJD0YcmNnvaDvLFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e58f365c-13bf-3ad7-cf37-ca1ea043750b@suse.com>
Date: Thu, 27 Jul 2023 09:38:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 1/3] restrict concept of pIRQ to x86
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
In-Reply-To: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c16a22-ddc8-483e-4177-08db8e746cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6pslMkiDn1JtJT0lHkUYCjfK0yjDPRJE4YZPiKIzv8z/hy/rAiaJWiA9KylgHEbImyNQyHlVkCO7DFRVmV+n7RoOgy5+cybxHOsdjpyKQpnn5WCYrvTf7WCxGMz//R0nxeVJhmx5LFSi9JfxUUXgtC15rbROjlP+P0/7laDYtrnxa/ubrb8S2MztjFAWJ4Sjp5kGsIAQii2o6AsANTDLHnDyPrO7HZAAYUkTSZFAWbhZpvKcTSSnFOdlDch+WzDHGwIpIyVMiXOiEbbgI2w4XnhmCbD+nC6mmeNv41yqvUUqg9ALRAIMvSNtomE1Jh9lxNmQyQNgBY7qzZVeQ5o/+5V++nMg+RjqfXyvHKF90B4eTj5gP0TqtMImZmGmT0PQAATPiIq7GTrBFFVygUMLFxGA69Ukol1aQk4mHNI00fak1YSeFGu52P0LjPPSOI3f+vwKNV/9xD5pJoYK8fCaiv4r3lfQKadkhGmDVhVRPT1cYMsxJ8mFY4/u22DAPfNl6OMxhxgmblNAdE15znMvXrR7egnCdhqFiHNcJ5nBk/16rB8ki8CKj/Et2H+L6MK04jBaJfAsbDFf01g+CE+53aKLoIDiEkns/eEI1GvSg7Ha01uIyusbwSBk1TqgIuU+hCNoSVIj3DUDvuKfm6A3PQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(6486002)(478600001)(83380400001)(6506007)(26005)(6512007)(6916009)(4326008)(54906003)(66556008)(66476007)(66946007)(186003)(2616005)(38100700002)(31686004)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDEyK1pXbU5wNWduM1RyZTl4Z2xrNTloK1dmbWJPTlhoV1dZNnYvQTF6dTcz?=
 =?utf-8?B?a1VTQkNnWlh4a3d2WFZOWk95TFhUTTdkZDlWMTRGOEs5SW1Fb2gyR0tOSkxw?=
 =?utf-8?B?YlZUY3VBcVo2K1dvaUZ6cWFPdXZSVkFXbnA0VnpRS1hKa0czV3lxM2g0YkxG?=
 =?utf-8?B?ZWRiaFA2TkZibUVpZ2dxYWN5bkpYS3JoVFdLb2Z5bXVmNytWQ0o0cGxlUktH?=
 =?utf-8?B?R3dDZzEwc3VpUFdUNnV0QzBZdnpGNXZSb245cHZGWjFrcTA3M0xLa01QSmo4?=
 =?utf-8?B?YlB5d2YwdllrMmIyb1ZJbkZCU3VpWFB1aFJFWDhpd3lCS04xWDdGRlZCZ090?=
 =?utf-8?B?bnJBbEdxcFgzTkh5ZXd0RHMycTRHeVZ1WDI0RkVIMzZickw0TEV5UVNXTis1?=
 =?utf-8?B?UUpBd01FUWxZZzRaaldDcTRORmM2WHFMVFhodTJPVUVadnlCZGJ0TE9KMjF1?=
 =?utf-8?B?VWdTdmVqc1RCYUZJWFJ2R0xmRGZEMHhkUGJEQ0FWTFZQL2ZXUGQ5dDN0K2h5?=
 =?utf-8?B?dlVTWk1oWC9XUm4rL3RuME9UMi9VS283R05CUFgzaGJxNzdlMUd1bHVobnFx?=
 =?utf-8?B?KzhyR3FlcnM3cGZVcTNtQ24vQU93YkRhdFpoRUdxcHlvU05tYUZ1azZrMmgz?=
 =?utf-8?B?a091NnkxajUvbXUwektaeGZnRVErdERHNjlKbGRWMWYzZmtGcWNDZGlsWENZ?=
 =?utf-8?B?ZE9BN1FON3ZPMnphTXdtSEc3OHhneEU1QTNhZHMydlh2Ui9JbXhKODVUODlt?=
 =?utf-8?B?SWRubU5PNStqcVlEcFpVQmJGRzBCb0JBZVpIdW1abDBVMS9ZTHJ4TVZZaFcz?=
 =?utf-8?B?M3VLSzljWFptcWFIdUttaGNLTTBPTE04cGZCN1JXdG5BRFpSZUwrRjdJa2RG?=
 =?utf-8?B?eW8yZXN5cGdULzhhYW16S1FWRmpJeG1QQW1zeEVlMHU2SXA5MWpqUTZJVHND?=
 =?utf-8?B?N3duSFlldGJ4djMyck55ZUZXWlFuUlp4dUkvVlBsSWRSa2lrNWlGTzVYOUxB?=
 =?utf-8?B?V2tKN2x4dFoyZW5zVk8ydUo5c3h6a081UVR6TWNsbDFCck1HUzdKTVB1MFN2?=
 =?utf-8?B?VDlaTEJtSlF1TVBEeUdvRFJOZHFFR0xCbUtpZDBaNGlxZUFqMG9SVzFNb1hh?=
 =?utf-8?B?SjNnU3N2VGQ4b1RaK0hGSThuUUJSbW1hTWV3amphUjlqUDJseTkzcWw5L2RW?=
 =?utf-8?B?SEFrTDQ0Ymk2c1AzVnNaQWtuOXpYVDZldEthV1YvWjhjWnMza1A2NjBhSzFa?=
 =?utf-8?B?YnU4OVI5NXl2TzFKcGtTUDVDcHVZYUV3T3ZXaTVkSFBlc1M1ZDJlMENYZGhF?=
 =?utf-8?B?RHZaSzJBRFRCRVV1em80Z1Z6TWpJU2RTRVpaQzczMk9aRjQ3SkxqNDhwdVpR?=
 =?utf-8?B?TFI1Q3M3QnNCblh1SWl6U0E4UDQzZVBoUHp6UUtva293dFNCQ3k0TDdxZkR4?=
 =?utf-8?B?S3Vqc2lzSHFkYVlWeTdRMVo5MHU3dlN3TWFOTVZ3TlpxZk1EU0dCTU9ZUXF1?=
 =?utf-8?B?ODNhM1N1ZlpOSXV5WEozQ1pSUkpxczQvTHB4clNscTMyeTM4V0RvRlVuc1Zt?=
 =?utf-8?B?enJiQmdTRU1xMXNOUGIrbnVxSG41VzBqM0hmQ0xJN3dBcTgralFnWVZ6K2xD?=
 =?utf-8?B?VzJ3S0EyRk5HbGo2SEtUamQvZ0JvcDFpeTM5dFpZS2swczBtMGpiSkRseXhB?=
 =?utf-8?B?Y0JvbWt4a204cGh3bHk2ZEIzZHpmQTNieW1SSmNQQmlIVC9CVnMxcmJPM3Ar?=
 =?utf-8?B?bFc5WkF4S0NKRU84Q2dJYktTT3lhQ25DaGNPYnYydnZ1Qm9RK29IQ3ZyRmtN?=
 =?utf-8?B?SENtN3dvM0NjaE1RcnhLUndlazQxc3pHa1QwcGdpbCtoVkFHZWIwUUVnTjU0?=
 =?utf-8?B?UEVhTFdtRHNZczdrSHFUa2JHMzBrdVQ3c083Ym56MjM4RDcrZkJGSHNjMmJW?=
 =?utf-8?B?QjJialpxdytrM1gxSjdHY09IcVdBL2FKTmNGeXdTZnFSNUVabjhTMUczd20w?=
 =?utf-8?B?THc0b3FLU0E0NUxKMDFjeFFWMUdjUEhrbVJsSll4MFMrR3BZNEk4bFdCYkRj?=
 =?utf-8?B?dFh3Y2l4eVZzVmVLNHA1WFNIQnpiTzNZM2Z1N0MxZmdTeWxxQlB6KzRwTGlD?=
 =?utf-8?Q?xVbxbqrPWDWepOfDgjEWxQtrr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c16a22-ddc8-483e-4177-08db8e746cce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:38:09.7606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpjO4hO3cF0JxkUdOJEXxijokyqF4+mTgfJ+kVK8nfetsHO3bHHLAz8hC3UiUIG+IK51ObhzgLsjRenBEC3ocQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026

... by way of a new arch-selectable Kconfig control.

Note that some smaller pieces of code are left without #ifdef, to keep
things better readable. Hence items like ECS_PIRQ, nr_static_irqs, or
domain_pirq_to_irq() remain uniformly.

As to XEN_DOMCTL_irq_permission - this, despite having a uniformly
available wrapper in libxc, is unused on Arm: libxl bypasses those
calls, and the Python and OCamL bindings have no users at all.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Move #ifdef in xen/common/domctl.c around the entire sub-op.
    Re-base.
v2: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1136,7 +1136,7 @@ introduced with the Nehalem architecture
       intended as an emergency option for people who first chose fast, then
       change their minds to secure, and wish not to reboot.**
 
-### extra_guest_irqs
+### extra_guest_irqs (x86)
 > `= [<domU number>][,<dom0 number>]`
 
 > Default: `32,<variable>`
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -52,7 +52,6 @@ struct arch_irq_desc {
 
 extern const unsigned int nr_irqs;
 #define nr_static_irqs NR_IRQS
-#define arch_hwdom_irqs(domid) NR_IRQS
 
 struct irq_desc;
 struct irqaction;
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -25,6 +25,7 @@ config X86
 	select HAS_PCI
 	select HAS_PCI_MSI
 	select HAS_PDX
+	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -56,6 +56,9 @@ config HAS_KEXEC
 config HAS_PDX
 	bool
 
+config HAS_PIRQ
+	bool
+
 config HAS_PMAP
 	bool
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -350,6 +350,8 @@ static int late_hwdom_init(struct domain
 #endif
 }
 
+#ifdef CONFIG_HAS_PIRQ
+
 static unsigned int __read_mostly extra_hwdom_irqs;
 static unsigned int __read_mostly extra_domU_irqs = 32;
 
@@ -364,6 +366,8 @@ static int __init cf_check parse_extra_g
 }
 custom_param("extra_guest_irqs", parse_extra_guest_irqs);
 
+#endif /* CONFIG_HAS_PIRQ */
+
 static int __init cf_check parse_dom0_param(const char *s)
 {
     const char *ss;
@@ -682,6 +686,7 @@ struct domain *domain_create(domid_t dom
     if ( is_system_domain(d) && !is_idle_domain(d) )
         return d;
 
+#ifdef CONFIG_HAS_PIRQ
     if ( !is_idle_domain(d) )
     {
         if ( !is_hardware_domain(d) )
@@ -693,6 +698,7 @@ struct domain *domain_create(domid_t dom
 
         radix_tree_init(&d->pirq_tree);
     }
+#endif
 
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
@@ -784,7 +790,9 @@ struct domain *domain_create(domid_t dom
     {
         evtchn_destroy(d);
         evtchn_destroy_final(d);
+#ifdef CONFIG_HAS_PIRQ
         radix_tree_destroy(&d->pirq_tree, free_pirq_struct);
+#endif
     }
     if ( init_status & INIT_watchdog )
         watchdog_domain_destroy(d);
@@ -1180,7 +1188,9 @@ static void cf_check complete_domain_des
 
     evtchn_destroy_final(d);
 
+#ifdef CONFIG_HAS_PIRQ
     radix_tree_destroy(&d->pirq_tree, free_pirq_struct);
+#endif
 
     xfree(d->vcpu);
 
@@ -1893,6 +1903,8 @@ long do_vm_assist(unsigned int cmd, unsi
 }
 #endif
 
+#ifdef CONFIG_HAS_PIRQ
+
 struct pirq *pirq_get_info(struct domain *d, int pirq)
 {
     struct pirq *info = pirq_info(d, pirq);
@@ -1922,6 +1934,8 @@ void cf_check free_pirq_struct(void *ptr
     call_rcu(&pirq->rcu_head, _free_pirq_struct);
 }
 
+#endif /* CONFIG_HAS_PIRQ */
+
 struct migrate_info {
     long (*func)(void *data);
     void *data;
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -648,6 +648,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         }
         break;
 
+#ifdef CONFIG_HAS_PIRQ
     case XEN_DOMCTL_irq_permission:
     {
         unsigned int pirq = op->u.irq_permission.pirq, irq;
@@ -667,6 +668,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
             ret = irq_deny_access(d, irq);
         break;
     }
+#endif
 
     case XEN_DOMCTL_iomem_permission:
     {
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -567,6 +567,7 @@ static int evtchn_bind_ipi(evtchn_bind_i
     return rc;
 }
 
+#ifdef CONFIG_HAS_PIRQ
 
 static void link_pirq_port(int port, struct evtchn *chn, struct vcpu *v)
 {
@@ -592,9 +593,11 @@ static void unlink_pirq_port(struct evtc
             chn->u.pirq.prev_port;
 }
 
+#endif /* CONFIG_HAS_PIRQ */
 
 static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
 {
+#ifdef CONFIG_HAS_PIRQ
     struct evtchn *chn;
     struct domain *d = current->domain;
     struct vcpu   *v = d->vcpu[0];
@@ -664,6 +667,9 @@ static int evtchn_bind_pirq(evtchn_bind_
     write_unlock(&d->event_lock);
 
     return rc;
+#else /* !CONFIG_HAS_PIRQ */
+    return -EOPNOTSUPP;
+#endif
 }
 
 
@@ -696,6 +702,7 @@ int evtchn_close(struct domain *d1, int
     case ECS_UNBOUND:
         break;
 
+#ifdef CONFIG_HAS_PIRQ
     case ECS_PIRQ: {
         struct pirq *pirq = pirq_info(d1, chn1->u.pirq.irq);
 
@@ -705,14 +712,13 @@ int evtchn_close(struct domain *d1, int
                 pirq_guest_unbind(d1, pirq);
             pirq->evtchn = 0;
             pirq_cleanup_check(pirq, d1);
-#ifdef CONFIG_X86
             if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
                 unmap_domain_pirq_emuirq(d1, pirq->pirq);
-#endif
         }
         unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
         break;
     }
+#endif
 
     case ECS_VIRQ: {
         struct vcpu *v;
@@ -1122,6 +1128,8 @@ int evtchn_bind_vcpu(evtchn_port_t port,
     case ECS_INTERDOMAIN:
         chn->notify_vcpu_id = v->vcpu_id;
         break;
+
+#ifdef CONFIG_HAS_PIRQ
     case ECS_PIRQ:
         if ( chn->notify_vcpu_id == v->vcpu_id )
             break;
@@ -1131,6 +1139,8 @@ int evtchn_bind_vcpu(evtchn_port_t port,
                           cpumask_of(v->processor));
         link_pirq_port(port, chn, v);
         break;
+#endif
+
     default:
         rc = -EINVAL;
         break;
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -438,12 +438,14 @@ struct domain
 
     struct grant_table *grant_table;
 
+#ifdef CONFIG_HAS_PIRQ
     /*
      * Interrupt to event-channel mappings and other per-guest-pirq data.
      * Protected by the domain's event-channel spinlock.
      */
     struct radix_tree_root pirq_tree;
     unsigned int     nr_pirqs;
+#endif
 
     unsigned int     options;         /* copy of createdomain flags */
 


