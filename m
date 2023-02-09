Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCDB690516
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492294.761774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4LL-0001PZ-Vy; Thu, 09 Feb 2023 10:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492294.761774; Thu, 09 Feb 2023 10:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4LL-0001N0-Sv; Thu, 09 Feb 2023 10:39:55 +0000
Received: by outflank-mailman (input) for mailman id 492294;
 Thu, 09 Feb 2023 10:39:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ4LJ-0000EU-Qd
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:39:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 160a4f14-a866-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 11:39:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9387.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Thu, 9 Feb
 2023 10:39:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:39:50 +0000
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
X-Inumbo-ID: 160a4f14-a866-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUF/5wg0yAoQ5BnNkl3+d8S1Z49SeY+Vq6ogeiMo6lweg7aUOHx8mgMNunFIvpRz4r2LugQ5LoK/79sRUBQc/y+muqZiCTJPNUI1wN/jEwsshJerPeitPgye+4QOtqBA9QlDXCl3Qed39dUlnvOPb1MLexkA9qnGfOBqpZUmVCIVZKeuIAaYvq1rmpDkfTI+c/SmafQexSXe4uwpSFWQEk8QwI+E0SVYNJFjo3qPmCv1HBQawDWIuC5mBqDGeUrnvIbT0x0ngHCObYwAZLroqLot7v7thfMXt9zc8PQYNJiyAqJI3M4/0rMlORAwHQZ4CCMEBSFMO5iO39aYn02TKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsV8xTifBcj/y3tgKvVpVcGSALX044cesQDYK+Fr4Ek=;
 b=QR2u6+HCW2e/dhqtz+gEW629Zb3W0R9VPCj+j4tkqltGJ67bNnhHyPz5MEAFyZuHsytaN9+GpAHbcD0v2ALSHer8la79VoVR2LAa91j5qfM+EQxEzIgpsKk4H6IOETfiWq97O2sYMKY9CALqaK7toGp1NUJwmB2KPQ10u7SjDMhfNPyTf+//gxXK7FrpvDeiO0DJYBKvBCn/aCDSudVvQsx9ReY6cGdof5wfC+id4kgAbRAnjNUyPEIORnITGtHvhfYsUb6qsOCyJO291uj6X4qPd+wMqEWYj82OnCi7vyS9h1q9cRrCqYGyRC3dNjgxCzpYWu2584RJS+XXk264Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsV8xTifBcj/y3tgKvVpVcGSALX044cesQDYK+Fr4Ek=;
 b=AnqoOJYGekNWGqT455/63I735z95vafYL1j8sp8/dVnvMMMZFUkBBP+LiTK6Qyl+e2ByOhC14PbNoFVEPwIRnhgdFIBv1tGcEJsPh+6TJCWnNEIZiIFq/1D0md5lMWcVKrE4QAYiBa0rp+1LMz9R5FXM5jkGOadmZL5GRDo7pxHe+BoW5XQZSvVo4M5jgNFdG4OB83Ku71titSb9a2W7zzsas56b+jkeySZOtxsGiQyIYfMzjlIs6uuYTeOh1s4lyPLOm88UVLbX9EfBx3UKF8hyBQ5juiKB4+nCia4vPTSokmdPH2FUbN7CYC/PRo/2EDWyElQIVSXAmvnz9KEOJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f375055-eff2-010b-c904-e4122b834777@suse.com>
Date: Thu, 9 Feb 2023 11:39:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 4/6] x86/MSI: use standard C types in structures/unions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
In-Reply-To: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: 52788b22-d743-4a63-6823-08db0a89f8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mu35lepH7Ed1r5RZ0TjaXbzpzyhfsKABQiMpnZ4HUHxPBEhCEduQdsqI1PH8kl7iGtgXasskD+u0DeMh384cxB5BRjC0R6Fr+cAappZbptdg49Bgd4lO9OTW6tAoCQanNL7RqSEgDXKkfZZI3iDbwtJ2tntQlVsEV14fKprZHpK/OPL8ZxejIfNwZaU4wlMuxC7manYl/FEu1oE/UXXriMxUy9JlJlTPcdy1+pZ/oTXSgKxpZz3za6nG7VJ6uMSTvmG/8k+545I9Hu6L+cPPFUvJZClwPCSzZD+SoLVm1QcZxpoTXKvZlkn5i91stpJ/3TnH9yPxTPYmhGWC3qEupSqe1+h2MFO7yZmjDyBjGoBGCRRIM8Djeb8P6mbA0jdAdJE0SEBnQcoINCC1IDX8NkwgiRDfLIShDsJ2bLuBsEcFQijbZWgR2SqjWAtKqUYHPZlxJI7wFbKArsgQ8sObIw7+lzh8/QPVp8YuRhWYhxo9T1NOBtB5+gd9No/zQnpTZ9cGctdjOSrvJVt3/6x04kyokOQHSB2ln0DNehxGqTjutfrEXRmoJOLuyAS6+SOLClMa9mOlIGb0ZYNDV7urhbKRAIJHr+ZWqa8c38hEANANjod/q7z/hFTCW+/iDo1fxgonW0lUhZs94tsQOSOQusW7z7zjgWJu/1xkac1XftokDTURokRZRmKyLD90meDPWSFLDO2pn/noMkpnFZOpiMVJjE9WmFOJsPk3Td/8KDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(26005)(5660300002)(31696002)(86362001)(8936002)(186003)(41300700001)(83380400001)(4326008)(2616005)(6512007)(38100700002)(54906003)(8676002)(66946007)(316002)(6916009)(66556008)(66476007)(6506007)(478600001)(36756003)(6486002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTlhVUJTbDU2Z3N5Si9FVnZtdTZ0WWkwbmJXazgzZlJiVDNCdHUyS2dSNVBs?=
 =?utf-8?B?TDRTbk9kRE1zRFRYdWtkWThlUlcxa3FwTUUzaXRyaWRoRVJyM3hsYTVzVEM2?=
 =?utf-8?B?dmplNjBjN24walBjckNYejV6Q0ZReG9sN1hyN0xrUTVJWFpaNlJlZlprb1FL?=
 =?utf-8?B?Q1BkZy9veDlHR0ExaWJtRklRRDJJcG16bFJDMHhsaTA2MUFiQk83U3lyU1Fx?=
 =?utf-8?B?S2pQZGQ1Z2pWWVR2VWJaUzVqaHR4ZVlvSWZ6U3lheGhDRktMcVJjdGJwcm9m?=
 =?utf-8?B?cEc0T0VoOG5HcTQ2eTUvaktxTUM3QXpoNG5ienU5aWt4Q2Z2cWtRT3BYSm5k?=
 =?utf-8?B?c0MyQU9BbTU3c2NmUExORDJtSzBFY3JiS1NLaDVmeFo2QmVvUkttdWc0S24y?=
 =?utf-8?B?aUp5T0ZGSWExajhQSkgweXFHRDlVblRMREpJRHE5SGYxT0lkSnN6aEhhM3Aw?=
 =?utf-8?B?RU5hRFJ0dVIwZitNeEYySDdsZkxHVWtRQ0xnMG1wRGZLd2JWYkhJMUtENEdJ?=
 =?utf-8?B?blBwVVAyQmw2U2dpZm1CUUNSODRhbEYwZ0dXQjh0SnVVS0p3akdZVXZoallN?=
 =?utf-8?B?c0FZZkxKQnIzcDZsSHlrRkROWUIwanJsVG4yczdjOFY0dHNzYW1xc3N3cHlu?=
 =?utf-8?B?bkhRdTN3V0VpaU1Gejh4eENBYUdYQzQ3aDhnL0wydU5ZRkJHT0NSWHUwK3Aw?=
 =?utf-8?B?NjF4c25JTks2eEFiYjFDTEFZUWdONERFTEg3dGJmRTZaemlMUnp5UWM0R0xm?=
 =?utf-8?B?T2ViV1VpdDFNNkZmRGZoMXRqZ0NCekp0eElnYTd5ajBmU20wVTNZTUZWdnhk?=
 =?utf-8?B?TXFtS09sWXhTNVI4UWZ6Q3dJVWd1VHIyMUlOTkdBakFkcXc0S2U4cDB3NGJH?=
 =?utf-8?B?L2RlQ05QKzVkNWNmZzlaMWxmV2lVL3lGYzRKaDNvMmJnV3hqNnRheEpJRnN1?=
 =?utf-8?B?WUo2L1FMRW9MZGZMNTJCUEJlcU4vOUJQVmtUSWVUY1k3ZU1hSWZBY215ZnhV?=
 =?utf-8?B?ekJLcWdHZXk4Q2lKRkwyd2VHRUxGMERGV1ZVVU1vMWEwMXB6R0g5R2tkaFkw?=
 =?utf-8?B?NU9HazhXcmZmeXllS2tjWWZyQzN2RnFBa2xxb1NWWTJTbjA4Y09jbXVSV0ZE?=
 =?utf-8?B?RWJ5QmZkWERzYXhHcWpua2NWamlNVWtIWWxJRitDRTc1bVEzSnAwNFAzaUtS?=
 =?utf-8?B?TzhqbjRMelBiQ3RvWFBTR20xMGVYWmNrWlozRGRUaDVrZTF5bVJjald6ejIy?=
 =?utf-8?B?VTExL1NVZlpROCs5eWI5TjJpUThvUWFFTm4xaFdaU2ZyL0k2TSs5U2tJbUR6?=
 =?utf-8?B?VnlXUGZLOW9pRTlHSjZDNHhDaUJiTGxkejRPZUczUDNXK0doS2dwanJiYVh6?=
 =?utf-8?B?OHpJQjlrSEJYNCtkS2UyZ0RBN2hhbVA4WHdVTWlaRWlFS0dzUlQ1U0t4amVQ?=
 =?utf-8?B?MTF2bWxXUFgwM0c0bHkxbTJTbHRWWlN5Ylg0RWZVTXpuTEpKYXY5RlhHL1M4?=
 =?utf-8?B?L0VYSVJDM1U4YW5sc2VaMkgzclJ1UnhrSmdLcTlJOEtKTDRJUmJkN3p2K010?=
 =?utf-8?B?VWhueGczazJKYndpSERTYXV6SVo2U0lUczVlSS9icjQvRXhNalRyRk5jdVNT?=
 =?utf-8?B?Z2lCb3UwOVRWSHdGVjloUEMrOHhzK3d1YnF5ZUdRUTVXalo4Q1kxTVQrblJ2?=
 =?utf-8?B?Si9qNWpIYkZFMEdMR1NraENYZXdRMExsK1ZaTEkwMG14VkwyMTdoYVNuOUYy?=
 =?utf-8?B?K2VKZ1hINGNESDR3UWdabTZoc2Fnc0hoZXlHL016Z2FzajUxMEw4T21CT2x6?=
 =?utf-8?B?aUtFbHFOakZxTVlNZ2dGeVZWdkpzTGxqZjZ6dC8xQlVGL2toNGNkd2s3L201?=
 =?utf-8?B?bkxTbXRJczhueFFZL1ZiTUZIRHRCb3c2R2ZKeEFBRm1ERTZ5aXoxcG5MN0NR?=
 =?utf-8?B?V2JTTzZZcDF4YUJ0cnlxYWxVUWIvRFc5L1RnclAwVmYveTd0ZytuSGxZSU53?=
 =?utf-8?B?MWl5b1pNQWxXMGYzbU5kOEZ1MXlJRHd5Sk11MkQvZER3NVNZb2Y5a05LbDc0?=
 =?utf-8?B?WU1qSGtMY1FTMUdrQmdsVDFmdkVQMVVzVC82cko5dmxIVWIxMVJ4Yzk3Z3By?=
 =?utf-8?Q?cMpLTQudyHTzDeYgL0CKPZhBP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52788b22-d743-4a63-6823-08db0a89f8b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:39:50.4458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRReWV91OHYdd6o799k+9OBuIvuYe5ogMzmGUr7zsyGHNnEr+tJmR4KfrwrTbWQNsiQC+HlWFfUBRe1D7LKzjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9387

Consolidate this to use exclusively standard types, and change
indentation style to Xen's there at the same time (the file already had
a mix of styles).

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For most (all?) of the single bit I was on the edge of switching them to
bool - thoughts?

--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -66,15 +66,15 @@ struct msi_info {
 };
 
 struct msi_msg {
-	union {
-		u64	address; /* message address */
-		struct {
-			u32	address_lo; /* message address low 32 bits */
-			u32	address_hi; /* message address high 32 bits */
-		};
-	};
-	u32	data;		/* 16 bits of msi message data */
-	u32	dest32;		/* used when Interrupt Remapping with EIM is enabled */
+    union {
+        uint64_t address; /* message address */
+        struct {
+            uint32_t address_lo; /* message address low 32 bits */
+            uint32_t address_hi; /* message address high 32 bits */
+        };
+    };
+    uint32_t data;        /* 16 bits of msi message data */
+    uint32_t dest32;      /* used when Interrupt Remapping with EIM is enabled */
 };
 
 struct irq_desc;
@@ -94,35 +94,35 @@ extern int pci_restore_msi_state(struct
 extern int pci_reset_msix_state(struct pci_dev *pdev);
 
 struct msi_desc {
-	struct msi_attrib {
-		__u8	type;		/* {0: unused, 5h:MSI, 11h:MSI-X} */
-		__u8	pos;		/* Location of the MSI capability */
-		__u8	maskbit	: 1;	/* mask/pending bit supported ?   */
-		__u8	is_64	: 1;	/* Address size: 0=32bit 1=64bit  */
-		__u8	host_masked : 1;
-		__u8	guest_masked : 1;
-		__u16	entry_nr;	/* specific enabled entry 	  */
-	} msi_attrib;
-
-	bool irte_initialized;
-	uint8_t gvec;			/* guest vector. valid when pi_desc isn't NULL */
-	const struct pi_desc *pi_desc;	/* pointer to posted descriptor */
-
-	struct list_head list;
-
-	union {
-		void __iomem *mask_base;/* va for the entry in mask table */
-		struct {
-			unsigned int nvec;/* number of vectors            */
-			unsigned int mpos;/* location of mask register    */
-		} msi;
-		unsigned int hpet_id;   /* HPET (dev is NULL)             */
-	};
-	struct pci_dev *dev;
-	int irq;
-	int remap_index;		/* index in interrupt remapping table */
+    struct msi_attrib {
+        uint8_t type;        /* {0: unused, 5h:MSI, 11h:MSI-X} */
+        uint8_t pos;         /* Location of the MSI capability */
+        uint8_t maskbit      : 1; /* mask/pending bit supported ?   */
+        uint8_t is_64        : 1; /* Address size: 0=32bit 1=64bit  */
+        uint8_t host_masked  : 1;
+        uint8_t guest_masked : 1;
+        uint16_t entry_nr;   /* specific enabled entry */
+    } msi_attrib;
+
+    bool irte_initialized;
+    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL */
+    const struct pi_desc *pi_desc; /* pointer to posted descriptor */
+
+    struct list_head list;
+
+    union {
+        void __iomem *mask_base; /* va for the entry in mask table */
+        struct {
+            unsigned int nvec; /* number of vectors */
+            unsigned int mpos; /* location of mask register */
+        } msi;
+        unsigned int hpet_id; /* HPET (dev is NULL) */
+    };
+    struct pci_dev *dev;
+    int irq;
+    int remap_index;         /* index in interrupt remapping table */
 
-	struct msi_msg msg;		/* Last set MSI message */
+    struct msi_msg msg;      /* Last set MSI message */
 };
 
 /*
@@ -180,48 +180,48 @@ int msi_free_irq(struct msi_desc *entry)
 
 struct __packed msg_data {
 #if defined(__LITTLE_ENDIAN_BITFIELD)
-	__u32	vector		:  8;
-	__u32	delivery_mode	:  3;	/* 000b: FIXED | 001b: lowest prior */
-	__u32	reserved_1	:  3;
-	__u32	level		:  1;	/* 0: deassert | 1: assert */
-	__u32	trigger		:  1;	/* 0: edge | 1: level */
-	__u32	reserved_2	: 16;
+    uint32_t vector        :  8;
+    uint32_t delivery_mode :  3;    /* 000b: FIXED | 001b: lowest prior */
+    uint32_t reserved_1    :  3;
+    uint32_t level         :  1;    /* 0: deassert | 1: assert */
+    uint32_t trigger       :  1;    /* 0: edge | 1: level */
+    uint32_t reserved_2    : 16;
 #elif defined(__BIG_ENDIAN_BITFIELD)
-	__u32	reserved_2	: 16;
-	__u32	trigger		:  1;	/* 0: edge | 1: level */
-	__u32	level		:  1;	/* 0: deassert | 1: assert */
-	__u32	reserved_1	:  3;
-	__u32	delivery_mode	:  3;	/* 000b: FIXED | 001b: lowest prior */
-	__u32	vector		:  8;
+    uint32_t reserved_2    : 16;
+    uint32_t trigger       :  1;    /* 0: edge | 1: level */
+    uint32_t level         :  1;    /* 0: deassert | 1: assert */
+    uint32_t reserved_1    :  3;
+    uint32_t delivery_mode :  3;    /* 000b: FIXED | 001b: lowest prior */
+    uint32_t vector        :  8;
 #else
 #error "Bitfield endianness not defined! Check your byteorder.h"
 #endif
 };
 
 struct __packed msg_address {
-	union {
-		struct {
+    union {
+        struct {
 #if defined(__LITTLE_ENDIAN_BITFIELD)
-			__u32	reserved_1	:  2;
-			__u32	dest_mode	:  1;	/*0:physic | 1:logic */
-			__u32	redirection_hint:  1;  	/*0: dedicated CPU
-							  1: lowest priority */
-			__u32	reserved_2	:  4;
- 			__u32	dest_id		: 24;	/* Destination ID */
+            uint32_t reserved_1       :  2;
+            uint32_t dest_mode        :  1; /* 0:phys | 1:logic */
+            uint32_t redirection_hint :  1; /* 0: dedicated CPU
+                                               1: lowest priority */
+            uint32_t reserved_2       :  4;
+            uint32_t dest_id          : 24; /* Destination ID */
 #elif defined(__BIG_ENDIAN_BITFIELD)
- 			__u32	dest_id		: 24;	/* Destination ID */
-			__u32	reserved_2	:  4;
-			__u32	redirection_hint:  1;  	/*0: dedicated CPU
-							  1: lowest priority */
-			__u32	dest_mode	:  1;	/*0:physic | 1:logic */
-			__u32	reserved_1	:  2;
+            uint32_t dest_id          : 24; /* Destination ID */
+            uint32_t reserved_2       :  4;
+            uint32_t redirection_hint : 1;  /* 0: dedicated CPU
+                                               1: lowest priority */
+            uint32_t dest_mode        :  1; /* 0:phys | 1:logic */
+            uint32_t reserved_1       :  2;
 #else
 #error "Bitfield endianness not defined! Check your byteorder.h"
 #endif
-      		}u;
-       		__u32  value;
-	}lo_address;
-	__u32 	hi_address;
+        } u;
+        uint32_t value;
+    } lo_address;
+    uint32_t hi_address;
 };
 
 #define MAX_MSIX_TABLE_ENTRIES  (PCI_MSIX_FLAGS_QSIZE + 1)


