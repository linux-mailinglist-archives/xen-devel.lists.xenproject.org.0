Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40E758FAF1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384425.619805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5nK-0007DT-6c; Thu, 11 Aug 2022 10:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384425.619805; Thu, 11 Aug 2022 10:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5nK-0007BZ-16; Thu, 11 Aug 2022 10:52:06 +0000
Received: by outflank-mailman (input) for mailman id 384425;
 Thu, 11 Aug 2022 10:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM5nJ-0007BN-9C
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:52:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a24bb4a4-1963-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 12:52:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 10:52:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 10:52:02 +0000
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
X-Inumbo-ID: a24bb4a4-1963-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0RRcCvdfvd6VFd/r0S4zOYgWZvS+XOtaxrkOJIRh3cGTpKhtIBoWDyi/yTUuwohkLdBA83a5r9ofPk2nA2PZL0hEzYZsz8XqMrlFu+BbI1sviXJFyx5PAXIAjJiH0EX7MXmOvtr7uN7mD/wtJ6h+i6kSKG/HwxuzrdPv2nsn2WYRopaFFS4s5QvZuIk1yz6aHVF9KYKmWpZIY5I9RejAvxPOvU4R84IUrhlKZulOMBX9XA5oAvozVEWRp/neng8wAK2nx0z8AwQRXPJRMFjhLWw+F6Fh7SppJz2tZ+2cSRaKT+Hk9sRnjTOyBmzvHy6TBWK3WbIuRWOBMgMOK4Etg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0zHbxk/QqA7o2g0j0RhbdPf09SeyoqrU+7QNeFeUCo=;
 b=L2BfTn+A0fXkL0X30jRNBUyQXlGWhJAO0qodDSo6rOFIZwok/5JXuJj8Q9REaGH7BqXa0/Lw+10fv111eUt2heVBYv66rNBckV6VjSdglSdzUYnRnKkM8XwlTSJpA+FKbj21Hnwn0wmNANwGgnPdBk4x74y8BuPWXd24N/K9C7Wlnn/jISajWmwB55Pe+Lcwjap9HdNk4ZmZPzJ1Q/awXH6s+emyb06zpWdhxfzzC7wWaGZENpOCLJiMawEPdCMHbsTs9nGA2ELupEEAInaaR33cIkEFSmKPbQLBogNudjuHEJgaAtJXflMi1pgznwAev66+0qu6IMRWzv8o0uKr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0zHbxk/QqA7o2g0j0RhbdPf09SeyoqrU+7QNeFeUCo=;
 b=HKlyU1jvPBX4IsKoI7e0rwedJ/4ey0DjYJhY0Ji6xwp2AKjtvFJ7d8T+l5qweCUqqcuRQ/h4nPhPO3V9V+2BxArKE22pxoxQe50127BQebFLCUJvhthTCTGssIdyuYvqspy6O9KAKtduqqhoChPiT0mmPOwJfWUCIyjVHlG+Wg2hBA6ADnC/0GVUWa9N0OZwBeJEvV60mjQzDL0PULKNsxblRGAauN7osb5Zvmd3lOHu5hrYhxWlZ+p1L5cnSD9VURHC6uLsX1/1CZUc5xFdNgjPmkpJYHtiKJ7VAH3BUoL2IFqeMvyVicc59eZsyaws6+kMDeShRMpCLqwVUWB8wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bdd4f3f-965a-fe39-f7af-d8a40b7a68c6@suse.com>
Date: Thu, 11 Aug 2022 12:52:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
In-Reply-To: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d89892b6-efaa-47ca-812b-08da7b878599
X-MS-TrafficTypeDiagnostic: AM7PR04MB6807:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TuwCDGWbDv3qmgvfAUxT0U8AkXKUomipfb4LUlccE6wO6JgMfCQ6e6wWQQNxkRWPN0A1cDYgRvIHqVBwIzojxIetWsfpIEWZwkeV1hDkOfBZSviOjzEdokVSQjwO1jHrOPflsfW8CUrlJOWHv3JxUDDBvzNODwWYTMyBzFQfYsGUt82IvC2skM7Ftqru+hd1oVZQ1+4474CjpcghBxltRqkdscEHGhsm1t38w1uUOZj3sMrEVh12AxiW8DMnt1NTR9NsCs4meYE/sJJv0OipIKJkiKmtf609m9JUN/8j33LXh0G2HSVEJV0hcRM546nGOiEhODpnPWgLy6TB8Fu6Tv8yj54dTkmEU931TGOmzPDOsfjckY6xTd5tCLnY0RLqpXjQscwLQ10TzXoXheeTkrKztZvg7kyVksPtrFCiQRlxh82yx5Vyq/WSaQYZXXLnh49Jenym97HxoO7YXvepamMrgHHxZZeEIelcvf4SZwdBE2robBBOIPYRCjpqzQmjwY0U1eo6eP7COYwNQpXOeKGMfbXH5Wda21/5O6CYYqm/nQRmXHC0DEaN5CTqe8xY0dxc5ySYJzwr48m6nAjy0VW0Q0Oivw89LmoUwvaFx46YLc5uC0dDfBwkMrD6etVKa8nrUKrMNbSCwKrxZrGkfnkph6F5bolzbckDYhgy+VGmV1NQipZvTZXDAlDtgVSdnhPUdsVx2ThIJoOX7tauNe3EBjLIQVFrvM7ZfpPHJos5SLgx6RuBYmjMvYXO3CFaVEbva56J/9bAuz0PWgKr2cdhxiz3JLZ19a7fAz+xFCdUh3xFpggl6Z+sdYwp5MBndkMQFHDL118ss4f9jpK5V7RknP8ysg4f24OoFrynHTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(376002)(39860400002)(366004)(26005)(6916009)(6486002)(316002)(41300700001)(54906003)(478600001)(4326008)(2906002)(66556008)(8676002)(66946007)(66476007)(8936002)(38100700002)(5660300002)(31686004)(36756003)(31696002)(86362001)(2616005)(186003)(6506007)(6512007)(83380400001)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak4zaXB1azFBaklyWHB6Znh5aUZxMmhxUk1hVlVzWnZ2dGdhOFRYT2hMT3ll?=
 =?utf-8?B?OC9OYjMxNG04QmljTlV2ZEdYb1l2VzZBc2VqUHRkTXBRb2RFZi9RcFpJOStl?=
 =?utf-8?B?MlN3NnpiWldnN3NKbm8xRitUcUZkRWJwd0psRVdVSnJVaW9xN3JVSmNPY0xY?=
 =?utf-8?B?cmlwT1JwWGVyZjRLUms4Q21sc3FEYjJIQWpuV1NobUFkeEcvQjI2ZGs0ZjF2?=
 =?utf-8?B?ejBXc1JpV250THZYNlhtQmh2UERkVnpOR3hyQkJiQS8wTzlGWHAwKzhMeUZF?=
 =?utf-8?B?MUZaenZ4WCs4d2JJL2NwOTgwdCtyUVZXWTRlWncreHZNMFhVM3NQV0svQzE1?=
 =?utf-8?B?Mzh3NlVTb3NVdTVPalNCenRRSUwxR0VPWW0vdEkvc1RuaUpkc1JqbTI4aWJt?=
 =?utf-8?B?cjV0TXhrWGMyUnNaUVErMUNFVVBmZUNTcHR4aHNwTHgwd1ROT1UzU0xTUndW?=
 =?utf-8?B?akh6TTlKQ3hXNCtvWGswaTh3NmZoQjlmWHRHY0tWZHNkSWpTSU9Hd2UrQTg5?=
 =?utf-8?B?ejlIY3Y5YmhLSStaOUU2OU0rdjRkcVdzN1o5L2lBVmZTUnU2SjJHYmFvejZV?=
 =?utf-8?B?RUJBME5WWUxvbnZ2K1BMY3k3Sk0vUkhaYUdWaGUxTlR4T0wxNXZGWDVIRHFI?=
 =?utf-8?B?dFg4eXVlbDRDRVdkbmVCR3NhYVoxam5XV20xYXBleGdCRW9xSDI0aWJNZVd3?=
 =?utf-8?B?QmRaSTR6czNOdGxHRUErSFpFTDY2OUpTL2ZJU2RQazB5NytSSE1vVWdDZzY4?=
 =?utf-8?B?SFA3TXBMdm1kZXlvNENqOFJ5dnNwVGVRV2FHRzZlVlJQK3J4REhQQXJjeUIy?=
 =?utf-8?B?YUlHWTlMVHBSVEJxbGovYUdkRXY4U2pJMW1DTDhHSWozMVh4ZjNnRHI5cFlv?=
 =?utf-8?B?R2hMRnRjT09EYk5tZmk4THBHT3RpSEdwM2d6NlVSV1BlN1BhY1g0TkFneG9z?=
 =?utf-8?B?SkY4N2lwOTREMzQ0ZnZwL1FPemF3dEhoWTFnOUdVWWd5NGZOK29KRUlDUmR3?=
 =?utf-8?B?Rk1zN1FsbFZ2L2pRK1hiZkxjRGdxR1ZPQ0QxaEsxZTdON3hPY01NN2ZzK0oz?=
 =?utf-8?B?Vk9DaWE5QTR3Ni91d3djZXY2KzdNSk1vZ1dPLzVXS3FMU29ZQno3TDV3V1pn?=
 =?utf-8?B?UTJUNGtWNjA4TDk2L2JxMlNQVFB2NDZ4MUVxZ2xZNGlhcjZRa3RzZFZ6WU04?=
 =?utf-8?B?QUEvYnBXZHd5c3J1VmQwc3ZiUW9QUWg3R093Tm1sNzgxN2huVGpEc253Rit5?=
 =?utf-8?B?UGtmNEZEdW96YWx4Mit6YTFNcVREbHlQM1Qyck1RelJQMnNRRzdqU1ZpYjhy?=
 =?utf-8?B?MFRjcjZpQlBYOGNIU0gzMFVJMU9GTFR3SFloSnkxbE9JS1ZvNlppdHowUWhQ?=
 =?utf-8?B?eVA0akhvN01XRHY0NXN2WFFXU05KbXVIWC9GQ2t4bXVHOFFvbjZJVEZMN1ZY?=
 =?utf-8?B?NGtqRTkvNVd1WFJGR3JHWVZuQWhkQWQzQkVUdXlpWjNyWUdRRGpPUVdaWEx5?=
 =?utf-8?B?amkvbVhCWXJsNGRPUG0zOVZDN3BLR1ZVUDhXVjEzSUE2eWZ3NjhNS3VXYTFq?=
 =?utf-8?B?a0I4V2dWbXJJUkxEL1I2VzNPeXZqdVozUU5vTWdDa2V5enJacVFiUlJXZ0Zh?=
 =?utf-8?B?M1ZDNTViUjIwVFpMOEdFa20yNzBVWDJDQ2lpYkhHeTBIRDVIVGpiZjhJK1dt?=
 =?utf-8?B?UTFYTlRSOVpPanlEQXJycWgzY3A1YjlSZnVZQ0tYenJtSU94dy81bGhlS3RE?=
 =?utf-8?B?OWV6aVd5WWxER1dPK0tqdCt0ajI3b0d3bDdaZ0lGUkIzN09IZXIrcm91UHVC?=
 =?utf-8?B?UDdvbkhObVdEMlk3YWErdWRRR1l5NnViVnBNTkt3UlJDV0N3V1pubE1NWUFl?=
 =?utf-8?B?aThPOThwSjJIVUQ1bXpCc3RvRERIYWFpWkpBWmNUcU1ua0F2eUZ1cnE2TlNX?=
 =?utf-8?B?SjRTd1N6L21NUWlVTjd0L1Q5d3g4ZU9lVlhPc3lWNnUxRksvYmgrV3VWbGtY?=
 =?utf-8?B?Q08rbEJsVkViQ2Y1bi93Uk53OUt3dG8rL1dxYlhXZDRIUy9tWVJWM0FaeG5u?=
 =?utf-8?B?NEJGeEhKMFBVSmlQQUY5VGdyOU9XWjFnMlg1eWJhZnpuK0pIelFsbndoeG14?=
 =?utf-8?Q?wi5vjFUIyWalUIvtyhITjfJGC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89892b6-efaa-47ca-812b-08da7b878599
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 10:52:01.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Go+vUQed3sVjUfNQWRKsdJyM/ymnWf53h4v7lzOcdsO01PVlur9oaf1OXlSnNRh3B1S1w4q7BOpNm/lHbNaw1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807

Rename the latter, subsuming the functionality of the former when passed
NULL as first argument.

Since this requires touching all call sites anyway, take the opportunity
and fold the remaining three parameters into a single pci_sbdf_t one.

No functional change intended. In particular the locking related
assertion needs to continue to be kept silent when a non-NULL domain
pointer is passed - both vpci_read() and vpci_write() call the function
without holding the lock (adding respective locking to vPCI [or finding
an alternative to doing so] is the topic of a separate series).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2162,7 +2162,7 @@ int map_domain_pirq(
         if ( !cpu_has_apic )
             goto done;
 
-        pdev = pci_get_pdev_by_domain(d, msi->seg, msi->bus, msi->devfn);
+        pdev = pci_get_pdev(d, PCI_SBDF(msi->seg, msi->bus, msi->devfn));
         if ( !pdev )
             goto done;
 
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -683,7 +683,8 @@ static u64 read_pci_mem_bar(u16 seg, u8
 
     if ( vf >= 0 )
     {
-        struct pci_dev *pdev = pci_get_pdev(seg, bus, PCI_DEVFN(slot, func));
+        struct pci_dev *pdev = pci_get_pdev(NULL,
+                                            PCI_SBDF(seg, bus, slot, func));
         unsigned int pos = pci_find_ext_capability(seg, bus,
                                                    PCI_DEVFN(slot, func),
                                                    PCI_EXT_CAP_ID_SRIOV);
@@ -1000,7 +1001,7 @@ static int __pci_enable_msi(struct msi_i
     struct msi_desc *old_desc;
 
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(msi->seg, msi->bus, msi->devfn);
+    pdev = pci_get_pdev(NULL, PCI_SBDF(msi->seg, msi->bus, msi->devfn));
     if ( !pdev )
         return -ENODEV;
 
@@ -1055,7 +1056,7 @@ static int __pci_enable_msix(struct msi_
     struct msi_desc *old_desc;
 
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(msi->seg, msi->bus, msi->devfn);
+    pdev = pci_get_pdev(NULL, PCI_SBDF(msi->seg, msi->bus, msi->devfn));
     if ( !pdev || !pdev->msix )
         return -ENODEV;
 
@@ -1146,7 +1147,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8
         return 0;
 
     pcidevs_lock();
-    pdev = pci_get_pdev(seg, bus, devfn);
+    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
     if ( !pdev )
         rc = -ENODEV;
     else if ( pdev->msix->used_entries != !!off )
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -90,7 +90,7 @@ int pci_conf_write_intercept(unsigned in
 
     pcidevs_lock();
 
-    pdev = pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN(bdf));
+    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
     if ( pdev )
         rc = pci_msi_conf_write_intercept(pdev, reg, size, data);
 
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -531,7 +531,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
             break;
 
         pcidevs_lock();
-        pdev = pci_get_pdev(0, restore_msi.bus, restore_msi.devfn);
+        pdev = pci_get_pdev(NULL,
+                            PCI_SBDF(0, restore_msi.bus, restore_msi.devfn));
         ret = pdev ? pci_restore_msi_state(pdev) : -ENODEV;
         pcidevs_unlock();
         break;
@@ -546,7 +547,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
             break;
 
         pcidevs_lock();
-        pdev = pci_get_pdev(dev.seg, dev.bus, dev.devfn);
+        pdev = pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
         ret = pdev ? pci_restore_msi_state(pdev) : -ENODEV;
         pcidevs_unlock();
         break;
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -447,7 +447,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xe
             }
 
             pcidevs_lock();
-            pdev = pci_get_pdev(dev.seg, dev.bus, dev.devfn);
+            pdev = pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
             if ( !pdev )
                 node = XEN_INVALID_DEV;
             else if ( pdev->node == NUMA_NO_NODE )
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -748,8 +748,7 @@ static bool_t __init set_iommu_interrupt
     }
 
     pcidevs_lock();
-    iommu->msi.dev = pci_get_pdev(iommu->seg, PCI_BUS(iommu->bdf),
-                                  PCI_DEVFN(iommu->bdf));
+    iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));
     pcidevs_unlock();
     if ( !iommu->msi.dev )
     {
@@ -1286,7 +1285,7 @@ static int __init cf_check amd_iommu_set
                 if ( !pci_init )
                     continue;
                 pcidevs_lock();
-                pdev = pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN(bdf));
+                pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
                 pcidevs_unlock();
             }
 
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -727,7 +727,7 @@ int cf_check amd_iommu_get_reserved_devi
             const struct pci_dev *pdev;
 
             pcidevs_lock();
-            pdev = pci_get_pdev(seg, sbdf.bus, sbdf.devfn);
+            pdev = pci_get_pdev(NULL, sbdf);
             pcidevs_unlock();
 
             if ( pdev )
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -576,23 +576,6 @@ int __init pci_ro_device(int seg, int bu
     return 0;
 }
 
-struct pci_dev *pci_get_pdev(uint16_t seg, uint8_t bus, uint8_t devfn)
-{
-    const struct pci_seg *pseg = get_pseg(seg);
-    struct pci_dev *pdev;
-
-    ASSERT(pcidevs_locked());
-
-    if ( !pseg )
-        return NULL;
-
-    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
-        if ( pdev->bus == bus && pdev->devfn == devfn )
-            return pdev;
-
-    return NULL;
-}
-
 struct pci_dev *pci_get_real_pdev(int seg, int bus, int devfn)
 {
     struct pci_dev *pdev;
@@ -601,12 +584,12 @@ struct pci_dev *pci_get_real_pdev(int se
     if ( seg < 0 || bus < 0 || devfn < 0 )
         return NULL;
 
-    for ( pdev = pci_get_pdev(seg, bus, devfn), stride = 4;
+    for ( pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn)), stride = 4;
           !pdev && stride; stride >>= 1 )
     {
         if ( !(devfn & (8 - stride)) )
             continue;
-        pdev = pci_get_pdev(seg, bus, devfn & ~(8 - stride));
+        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn & ~(8 - stride)));
         if ( pdev && stride != pdev->phantom_stride )
             pdev = NULL;
     }
@@ -614,32 +597,33 @@ struct pci_dev *pci_get_real_pdev(int se
     return pdev;
 }
 
-struct pci_dev *pci_get_pdev_by_domain(const struct domain *d, uint16_t seg,
-                                       uint8_t bus, uint8_t devfn)
+struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
 {
     struct pci_dev *pdev;
 
+    ASSERT(d || pcidevs_locked());
+
     /*
      * The hardware domain owns the majority of the devices in the system.
      * When there are multiple segments, traversing the per-segment list is
      * likely going to be faster, whereas for a single segment the difference
      * shouldn't be that large.
      */
-    if ( is_hardware_domain(d) )
+    if ( !d || is_hardware_domain(d) )
     {
-        const struct pci_seg *pseg = get_pseg(seg);
+        const struct pci_seg *pseg = get_pseg(sbdf.seg);
 
         if ( !pseg )
             return NULL;
 
         list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
-            if ( pdev->bus == bus && pdev->devfn == devfn &&
-                 pdev->domain == d )
+            if ( pdev->sbdf.bdf == sbdf.bdf &&
+                 (!d || pdev->domain == d) )
                 return pdev;
     }
     else
         list_for_each_entry ( pdev, &d->pdev_list, domain_list )
-            if ( pdev->bus == bus && pdev->devfn == devfn )
+            if ( pdev->sbdf.bdf == sbdf.bdf )
                 return pdev;
 
     return NULL;
@@ -746,7 +730,9 @@ int pci_add_device(u16 seg, u8 bus, u8 d
     else if ( info->is_virtfn )
     {
         pcidevs_lock();
-        pdev = pci_get_pdev(seg, info->physfn.bus, info->physfn.devfn);
+        pdev = pci_get_pdev(NULL,
+                            PCI_SBDF(seg, info->physfn.bus,
+                                     info->physfn.devfn));
         if ( pdev )
             pf_is_extfn = pdev->info.is_extfn;
         pcidevs_unlock();
@@ -924,7 +910,7 @@ static int deassign_device(struct domain
         return -EINVAL;
 
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev_by_domain(d, seg, bus, devfn);
+    pdev = pci_get_pdev(d, PCI_SBDF(seg, bus, devfn));
     if ( !pdev )
         return -ENODEV;
 
@@ -1201,7 +1187,8 @@ static int __hwdom_init cf_check _setup_
     {
         for ( devfn = 0; devfn < 256; devfn++ )
         {
-            struct pci_dev *pdev = pci_get_pdev(pseg->nr, bus, devfn);
+            struct pci_dev *pdev = pci_get_pdev(NULL,
+                                                PCI_SBDF(pseg->nr, bus, devfn));
 
             if ( !pdev )
                 continue;
@@ -1475,7 +1462,7 @@ static int device_assigned(u16 seg, u8 b
     int rc = 0;
 
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(seg, bus, devfn);
+    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
 
     if ( !pdev )
         rc = -ENODEV;
@@ -1506,7 +1493,7 @@ static int assign_device(struct domain *
 
     /* device_assigned() should already have cleared the device for assignment */
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(seg, bus, devfn);
+    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
     ASSERT(pdev && (pdev->domain == hardware_domain ||
                     pdev->domain == dom_io));
 
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -417,7 +417,7 @@ static int __must_check map_me_phantom_f
     int rc;
 
     /* find ME VT-d engine base on a real ME device */
-    pdev = pci_get_pdev(0, 0, PCI_DEVFN(dev, 0));
+    pdev = pci_get_pdev(NULL, PCI_SBDF(0, 0, dev, 0));
     drhd = acpi_find_matched_drhd_unit(pdev);
 
     /* map or unmap ME phantom function */
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -118,7 +118,7 @@ void __init video_endboot(void)
                 u8 b = bus, df = devfn, sb;
 
                 pcidevs_lock();
-                pdev = pci_get_pdev(0, bus, devfn);
+                pdev = pci_get_pdev(NULL, PCI_SBDF(0, bus, devfn));
                 pcidevs_unlock();
 
                 if ( !pdev ||
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -325,7 +325,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsi
     }
 
     /* Find the PCI dev matching the address. */
-    pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
+    pdev = pci_get_pdev(d, sbdf);
     if ( !pdev )
         return vpci_read_hw(sbdf, reg, size);
 
@@ -435,7 +435,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigne
      * Find the PCI dev matching the address.
      * Passthrough everything that's not trapped.
      */
-    pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
+    pdev = pci_get_pdev(d, sbdf);
     if ( !pdev )
     {
         vpci_write_hw(sbdf, reg, size, data);
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -177,10 +177,8 @@ int pci_add_device(u16 seg, u8 bus, u8 d
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
-struct pci_dev *pci_get_pdev(uint16_t seg, uint8_t bus, uint8_t devfn);
+struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(int seg, int bus, int devfn);
-struct pci_dev *pci_get_pdev_by_domain(const struct domain *, uint16_t seg,
-                                       uint8_t bus, uint8_t devfn);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
 
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);


