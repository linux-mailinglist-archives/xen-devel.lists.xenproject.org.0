Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A5F6F5B3D
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529307.823579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puETg-0006as-KQ; Wed, 03 May 2023 15:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529307.823579; Wed, 03 May 2023 15:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puETg-0006YE-H0; Wed, 03 May 2023 15:33:12 +0000
Received: by outflank-mailman (input) for mailman id 529307;
 Wed, 03 May 2023 15:33:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puETe-0006Y6-WC
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:33:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce137e99-e9c7-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 17:33:08 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7498.eurprd04.prod.outlook.com (2603:10a6:10:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 15:33:07 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:33:07 +0000
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
X-Inumbo-ID: ce137e99-e9c7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSgB/yFikd9A65BGSSGIKIyQygm92cG+/3011FVurmipxC58uOkyY7W4m6Yvd8xMheY1Ao4f22SZA5IZyEBC/2ccaXsV+2VuL9RfaMUXbSzTY/yQR8W6TI7AdGmCWyVnfyjzfSXD4dN9fYULBzNrgsE/7LurvowxL7uw6+CCpQU/oRhiCY/kPVsWKO/5I3YnDr46uWKSEfWPJKd5YZ827V3KQYDGGsE4kHES9/ytnke97ur3xfplzbzC9z10qqhX9JmalwPAEQB0lOrh1m3fgFJZDED25YcbTy2jrnq0EqAbI6qFl2eQu9Vb5gKLjgWbhDquWgwQhQyCy9eGNSOHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3wz92lQ5KDUxdt8BmZClL8NBUi7+IdNuZks2UaRJyU=;
 b=gXtfyiiP1q1b9Q+Ftsb7t7PhMZE/zsJ+JcGhXU8ZSxD1A3CFYwjRhAyj8Q0K2HZr3c9lj+822nboWrJEvq9Kv+PT9DX6AbP0mFpChXyAYUcAawM6BtMlh9EwTf4IWlTj0uANRF/g7mfnGjSlG0aAvq10VZAB2edFTwCD1YtK/OA/Kvlh4OELwxVnlGmt+CKvrjSmEKdpIU4G12UWWHxbwC8b9KyLh7lAkvrMw6gy5rbPMlg91lXvM/zJz3jmkChzU0u2VOzvzIIOlrL/axu9IST8n+yPeC+ZQYZxIsVRN3vbTIazM/i4dF97eV6tFc1UuZ/7Sh9iRg/6K6GLObf+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3wz92lQ5KDUxdt8BmZClL8NBUi7+IdNuZks2UaRJyU=;
 b=wWZJWEo2csCq+ts+WmBivzAf7dj+q15/dhb8hM6lCZzGF7dEYJf6GpodWSdyXJ48Eh/3oFUrt4WhAYcJiKLXY4l7UQX6qAHXHf7eKhK70uy1jft1p0mGqZamsBuL3ds17stW/NaaNK2YU6zS49GliCxirAKzhpA4t4wubmvNLoS3vVHurUhATqKXLFAQtDKbzr+AUGS2SHG+2NL+pDiF2eiHD+D+k6c54H7rEfroEPPrMs1YVr/YjailEXntJvMG7CVQqWDMUUg8fFU+izziIwsyth5WIUZTMxdkwCA73MRuHangD9aLlboMtWwPVj4u+XB1kfc6OM2vsOXPPZ6Arw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
Date: Wed, 3 May 2023 17:33:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 1/2] restrict concept of pIRQ to x86
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
In-Reply-To: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DBBPR04MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a73f6e4-c252-4979-c19b-08db4bebb195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X8N1uBMFM/CQ2lRA4tF99/KGO78WBR/GOmU7pEy+b5Zw9dGDVVlCmAtWoXpK9tIDvFA8bbV+fa9l2PJa1YYwp9rCG6BD9lK396w6UiLWtp68qhQBu5V+YfJ2czPkkprwd0h43qXyJXpWH2ybDGAUFrQ1Xr1Jv+5UqOc0YrNRN4oOHCj8bHnEwuUPv5vTEe35nPyA0tkCA7E8vhq+Hf9Fa3RefUcAV1TbD57w9QUucxq+juHHqczCSnH+nfMAmfXDcjWsox8btc/l71neZfkacDUJijKhAjEg8SQMltIzG3zAxNw3d+uBoCCqG/d4vv/fOC9Jqr4tHqjOSo/kkstxUkn985C63JZFyaWZK8XGz0UFTBNWL6t4GS/kGvTZVLvTRbk+QXbgw6CjmXqwwafp0ekrBxNsMkVAi7dOuZx3Vlp8fN6zbt7ufrcAlwRFJp6Gt7IMYmwCFc9vEfrmI1pRCqzBeZZuLV22hInMwXUewtol1/UQsXIJKKkNJGDUMMhWULM2pTZxr23Zb42knaETBhsnC+bvcp+usEpX6Tza0v1n/+J1HoAbb6kzR8U7b5sAeHjQD+sR5XQqV1oHiaD9rgDTdzTfftooFdhwWClORixFyMsXfcFgC2J1kzxYSiRUr8h+sixoglMZLa/ISA8MEezjjiy5j9rjrowIMZitahCZlokFAAOYbBZF3lOmZa/O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(2906002)(38100700002)(83380400001)(2616005)(26005)(6512007)(6506007)(186003)(6486002)(36756003)(8676002)(8936002)(5660300002)(86362001)(31696002)(478600001)(4326008)(6916009)(54906003)(316002)(41300700001)(66476007)(66946007)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEk3WVR3Tk85TWsxcEF2SlZxcnpaK1FCNXRZRENlcHVtUkZTWi8rSGtYYjFs?=
 =?utf-8?B?aUMyMjEyQ0ZaUHhlNE9XU3VuWHl0Wk43TU1QVEZSOW9EcXpYQkFIYTh4QjlZ?=
 =?utf-8?B?MXhnMzd0YnBKV3YxR1M3YWFOSzZZcmxZN1JET3A5MFZqQmZVelppRVg4RE13?=
 =?utf-8?B?TTBPYjRwYm9YeUUya2J5MVA2eHhkUFNXVUNINzdock9YSnh3M3g4dTAwak9N?=
 =?utf-8?B?blhRdjVDS0x1YjB5WHdhUnJKTDRPeHNLc1hkVVdFSkl5ODRyMHlQWldpWHJa?=
 =?utf-8?B?NUJoUXRrQ09KUXMzMG01dEQ0SXhJejAyejRMS3pZYmZFTHFyUUQyTGoyZ291?=
 =?utf-8?B?YzhSd21HQko0R1lHMmExZXlBQjRuVTFydUtEczZKcUV6MlQ3V0d6Zm15MGRP?=
 =?utf-8?B?MkFINWt0MmRMSGhzK29yN3pUVDNrWE1iRmRSeWhDSnNxYkk4M0R5b0JNRktH?=
 =?utf-8?B?VmxvRU0wREJROEVrT0wrZWoxSXYxSzUwSTdNY2w5bmdrSXMzUnFGTUNvREJx?=
 =?utf-8?B?cVNkOS9KM1NzM3ZHSmNDNmhpM2RZR0hmbS9tU0JEbXVrWHJ6QTNBeDAwZnJC?=
 =?utf-8?B?TEQ5S3I4L1lJN1JrdmFGa0tFalFRTFVJSDBQWE1iQlVaM0ptS2FhaFM0S2Jw?=
 =?utf-8?B?RGFXVzRCMVRnWGNwQ0hza1p3VXFzKzF4WkJVSE1hTlh4SnNuOFJqVEhuUGdE?=
 =?utf-8?B?dEw4ZmRtUkZhdXRUOUlMQnpLQnlQbjkyTFNER0s0elJGZXQ0Zjd1UnNPRmox?=
 =?utf-8?B?ZHVPSk1aU1VxeTEwTmJRQkZZN0lhc0g2VnVra2lna01xcVpheWNXM3Q2cm81?=
 =?utf-8?B?UlhWcjlsT3VZd2ZrQkVOM09RbXBuN0I2UWx0bVg5WGZqOElaa0FRMDZLcU9a?=
 =?utf-8?B?Z2s0bW4xT3ZPRFFzRlMxTWFvZlVPM2V6NkhJWkxpU2l3aFNpWWE2cFVrZVVh?=
 =?utf-8?B?Y2I1c0JQVnhMSHNnbFBKa1FneExpZWx3YlBhTEJUei9LRGFlM0pXZWJSK3V4?=
 =?utf-8?B?WGpWd3NRbFNmMHpad0p5NWJlUmxVZzNoc0RJMzZZMzBocStLbkdNTmdMN0JN?=
 =?utf-8?B?clAvbmhDcnN4VkFuNE9ab20xdXNhd3JvU2tsUVIvRHpOb05LMHU1dW9rVzVV?=
 =?utf-8?B?Zjk1RXQvWkJNK1JzWkpMZzQ4cWMyQUh1eGJpb2FlZzFUL3dwelYzQ2hDK1M3?=
 =?utf-8?B?MldLVys0NWlobEhjY2ZQVTBST29uY3hrenF3NlpaVXN5WXVkV0tDT0VDNzRI?=
 =?utf-8?B?c09uRmRwVzZnU0VHRmE0K3lMM0d1NDg3N1JxbDA3V1ViRy9qOXNmU3RlamM4?=
 =?utf-8?B?N2swdEpYZkNMcXVNRDM0U2RCY2tJOEdmSndUcDBEOUNVTUdlOTBmREp6S2RH?=
 =?utf-8?B?dW5QWWtNdUJKdlJjbGMyL0R6QlIyak1kdGkzVHJnazlYa01rc29YMlBwUEJn?=
 =?utf-8?B?TXlzVzBGVTBEdXVxVncvMjZkYXhPWUZES1JQY1ExMDNhRVJQaE9OVzFpVWlH?=
 =?utf-8?B?WXpKWThjbWVzVEhOVklhSEZiaE9yK2lVVTVra3lEbFdVU2w1bmdVQXJXbE0z?=
 =?utf-8?B?a0M1MmNScnNuOGduOXAwM1FXUkxyamJKT0NXSWMwMmVCNjZUeS9GaGh1VGs1?=
 =?utf-8?B?cUtHelhIRGFKQk1zczk4Z1RrMnEwZkYrT1ZqNjhob3hmRGI5MnZZZjB2cGk5?=
 =?utf-8?B?VUpCU1ZHUTBkQ3BoQTBUNUc5eHR4a3lJSmJMNTQxbnkrc2I2cnpsV2x4ank4?=
 =?utf-8?B?SVpkelZRZ2xnVHlqTkZEWXNQcGs1Zms4czJiZW9PM3JjSklGc2VGeHVFbXFF?=
 =?utf-8?B?RXltaXNYSGxBLzVpcHNobWZOSUxYTG93aEh3eVR2cTB2UWU4MEgxVjBIZjJH?=
 =?utf-8?B?RzROVzJ6MkU3TUJGUmFpQVQ2RHk2MkZXVzVDcDVrSWd6Wk00Z3RtVEZDZEZZ?=
 =?utf-8?B?WitoU2hDMzl0aW43WDNBR2tFUnhkTWliZ0h3ckhZb0hKUitod3B4NGtMOURZ?=
 =?utf-8?B?NzRjYTFlbU1FTFc3MzdWY2pFVkhPT05RZnNDaXVPK050SmYwSEIxNE14OHgw?=
 =?utf-8?B?YWxDUXNkZ1BhQktxZHV4dTYveUdwTHRhWHRNYTVMOVdLVzZ3MWMyaEdxYUla?=
 =?utf-8?Q?ivwht6oUnMOXiNx3tAKvhgc3o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a73f6e4-c252-4979-c19b-08db4bebb195
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:33:07.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJwHarARIxSm0JrOqugUK70nhkVOKmSA66weHMWK3Nk8Ohw889mtHQV8TJOn4v999HAheH0LeUzzowLi1t5h/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7498

... by way of a new arch-selectable Kconfig control.

Note that some smaller pieces of code are left without #ifdef, to keep
things better readable. Hence items like ECS_PIRQ, nr_static_irqs, or
domain_pirq_to_irq() remain uniformly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not really certain about XEN_DOMCTL_irq_permission: With pIRQ-s not
used, the prior pIRQ -> IRQ translation cannot have succeeded on Arm, so
quite possibly the entire domctl is unused there? Yet then how is access
to particular device IRQs being granted/revoked?
---
v2: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1120,7 +1120,7 @@ introduced with the Nehalem architecture
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
 /*
  * Release resources held by a domain.  There may or may not be live
  * references to the domain, and it may or may not be fully constructed.
@@ -653,6 +657,7 @@ struct domain *domain_create(domid_t dom
     if ( is_system_domain(d) && !is_idle_domain(d) )
         return d;
 
+#ifdef CONFIG_HAS_PIRQ
     if ( !is_idle_domain(d) )
     {
         if ( !is_hardware_domain(d) )
@@ -664,6 +669,7 @@ struct domain *domain_create(domid_t dom
 
         radix_tree_init(&d->pirq_tree);
     }
+#endif
 
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
@@ -755,7 +761,9 @@ struct domain *domain_create(domid_t dom
     {
         evtchn_destroy(d);
         evtchn_destroy_final(d);
+#ifdef CONFIG_HAS_PIRQ
         radix_tree_destroy(&d->pirq_tree, free_pirq_struct);
+#endif
     }
     if ( init_status & INIT_watchdog )
         watchdog_domain_destroy(d);
@@ -1151,7 +1159,9 @@ static void cf_check complete_domain_des
 
     evtchn_destroy_final(d);
 
+#ifdef CONFIG_HAS_PIRQ
     radix_tree_destroy(&d->pirq_tree, free_pirq_struct);
+#endif
 
     xfree(d->vcpu);
 
@@ -1864,6 +1874,8 @@ long do_vm_assist(unsigned int cmd, unsi
 }
 #endif
 
+#ifdef CONFIG_HAS_PIRQ
+
 struct pirq *pirq_get_info(struct domain *d, int pirq)
 {
     struct pirq *info = pirq_info(d, pirq);
@@ -1893,6 +1905,8 @@ void cf_check free_pirq_struct(void *ptr
     call_rcu(&pirq->rcu_head, _free_pirq_struct);
 }
 
+#endif /* CONFIG_HAS_PIRQ */
+
 struct migrate_info {
     long (*func)(void *data);
     void *data;
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -683,11 +683,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         unsigned int pirq = op->u.irq_permission.pirq, irq;
         int allow = op->u.irq_permission.allow_access;
 
+#ifdef CONFIG_HAS_PIRQ
         if ( pirq >= current->domain->nr_pirqs )
         {
             ret = -EINVAL;
             break;
         }
+#endif
         irq = pirq_access_permitted(current->domain, pirq);
         if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
             ret = -EPERM;
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -555,6 +555,7 @@ static int evtchn_bind_ipi(evtchn_bind_i
     return rc;
 }
 
+#ifdef CONFIG_HAS_PIRQ
 
 static void link_pirq_port(int port, struct evtchn *chn, struct vcpu *v)
 {
@@ -580,9 +581,11 @@ static void unlink_pirq_port(struct evtc
             chn->u.pirq.prev_port;
 }
 
+#endif /* CONFIG_HAS_PIRQ */
 
 static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
 {
+#ifdef CONFIG_HAS_PIRQ
     struct evtchn *chn;
     struct domain *d = current->domain;
     struct vcpu   *v = d->vcpu[0];
@@ -639,6 +642,9 @@ static int evtchn_bind_pirq(evtchn_bind_
     write_unlock(&d->event_lock);
 
     return rc;
+#else /* !CONFIG_HAS_PIRQ */
+    return -EOPNOTSUPP;
+#endif
 }
 
 
@@ -671,6 +677,7 @@ int evtchn_close(struct domain *d1, int
     case ECS_UNBOUND:
         break;
 
+#ifdef CONFIG_HAS_PIRQ
     case ECS_PIRQ: {
         struct pirq *pirq = pirq_info(d1, chn1->u.pirq.irq);
 
@@ -680,14 +687,13 @@ int evtchn_close(struct domain *d1, int
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
@@ -1097,6 +1103,8 @@ int evtchn_bind_vcpu(evtchn_port_t port,
     case ECS_INTERDOMAIN:
         chn->notify_vcpu_id = v->vcpu_id;
         break;
+
+#ifdef CONFIG_HAS_PIRQ
     case ECS_PIRQ:
         if ( chn->notify_vcpu_id == v->vcpu_id )
             break;
@@ -1106,6 +1114,8 @@ int evtchn_bind_vcpu(evtchn_port_t port,
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
 


