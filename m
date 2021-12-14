Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852D473E32
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 09:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246429.424977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx36m-0003eB-EY; Tue, 14 Dec 2021 08:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246429.424977; Tue, 14 Dec 2021 08:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx36m-0003cA-AW; Tue, 14 Dec 2021 08:24:24 +0000
Received: by outflank-mailman (input) for mailman id 246429;
 Tue, 14 Dec 2021 08:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx36k-0003c4-I9
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 08:24:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c94ebbb-5cb7-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 09:24:21 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-ONdkV3cQO2CqBo63pGLUvw-1; Tue, 14 Dec 2021 09:24:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 08:24:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 08:24:17 +0000
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
X-Inumbo-ID: 3c94ebbb-5cb7-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639470260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tA3Ca+cdZ9g0cAmUaYfoMdLfNdpcUffa6dmArIzDPXg=;
	b=lnA/p7um4RraAlwObm09U0wb8P5pvSFS0jJ+Hx+E0yQXV/kXp/OvGDZ4tpk+QuE9gZCLkB
	CK2z69z7h7iiCHaVXpqjAe2KCV/aNZx43Ses9A1pXzEgdlvEQD3kvGrX14rxxZi6X//w6h
	n41EuwIYjVx84xl2AAKL4j5YPljW3GQ=
X-MC-Unique: ONdkV3cQO2CqBo63pGLUvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtEcz9NLhlZwNDqk/88G8OM+jAucnOU3EN9kW7JpAYiujiRANgRGE92ZUIe6hjvBmHk2hrYVuF8yN/0DBKQynT/j3bNnoSRstDdn1uz/ZSBKrixq5rDuwMQJc8zglY5e/5X4w4gOsALlMomd3EazLRxzbAB5uMAZQA56QBh+OviJVdA8Hq0ojRPdklPWbd/Hnf2Saor/9zEmfJ5MnrjRnvUFnMmn5uQMeWNDofhRbNIURmZFNmRSTirSRauh4bT5Vqos7FWwaonXra+cE1wV2swquwsvXdJvUI4Nj3JyvBF+lpwWZ/GWK455O0OE4+bI4xgaAaL6ftajl4KOQgnZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA3Ca+cdZ9g0cAmUaYfoMdLfNdpcUffa6dmArIzDPXg=;
 b=YpJ2uW03BygqdNQbcjM7tSFP1RWlx8ygQORlncGoi4/jtaSWcMmsxSkRKqGLZhuqqzalyGNwOoAwC2rKhw8x4Rn0tx3bkY1nw1TEUXKZiiasjFTx6IgUQ23IZqzUWwVXQtBmTf4bmk+F4lnroEVlZAxdZT9ceoyHpFrl0WJmsZLVInXkPJGjswxJxSjRoCOGr2sT1qVioptDsaNzEZh+d9VACTrBXPq71tre5At9SEbQa7OrvEdOdZf4bUAoKkPTOyjF9m49M17s8KHeDF+bSkLgaZb1DKqmC7tNoAnQ7g4cm0jCzLe263JvjkYIKNwr1nXXQoOf8whtakarJwTlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35cc5395-f88e-f08a-cbaf-5938a508ff29@suse.com>
Date: Tue, 14 Dec 2021 09:24:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] hvmloader: tidy pci_mem_{start,end}
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0050.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3805d185-5212-4e6b-ff3b-08d9bedb1f00
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31182AA18C8F711B04BF6A1CB3759@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o2T33qaVhW5s2Ee7fJ2o23U/G/XPXKjicDFki24wAl6nr+8BgK0Gyvayzc+EBYbHSXopAovAF7zALoqmCCcY4JsTdm7SRjUs6fI1aqblfTxdP48+Ehc13G5RhAaXZqwlywcogOqcaAf3IkZxTc08+Mm56Rgd34paC7Sxwrsnxr1xLWj//FHwmQ7CCu3hbQI/RflZVVzMoxv8cnHlvbDHLleBrZ9zS6chBEOex9EhG10sW/nlwP5prKXRurnpDgE7DZBzRD2cb5AOS/KQid/8jrt5s6xaMe9Kbw0jLIsvnTK+i896ycqTgwGpxCHvgRHCuKsk8wELdHmGGUiyKxN7C13qQLT754Z6B7pugBUcNJIuvjcNGYdAKR/DSq8mN9A72KeOgCy4sGsQ9y+TllxtUhKiMqukgg56yVXJRTyKDre2hUGghUr7733VoTuXCVOcR+JTsSyxfGqcp4H6w68icZlDDHXxXyU/Vt49nbjicrP83/QV6G92MUHHk0tL6/4QShlzK2LoGIBcphj6qjEHTfmcW/91e+mSQN/RjkuHiMix8Er+cA/B2v3m4nqeqATqefr1zjr3ps6PbH90PSn01HFGOsug2izM3vkxQnQVq2h4kFXNAfJLCWux7Hbtmqh7lnkIK8WyAHncHf8FQsRuKuMVXINL+G3wNopoFP1YKfKZkvPF5qNWRFK59lp5LsXS9kbtZedfh/iYtVevtgpYJDjQgXMKQGbSH73QsZSaBrmhvoTdFpLF7QADNdB7dUvs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(54906003)(66556008)(26005)(31686004)(66476007)(186003)(66946007)(5660300002)(8936002)(4326008)(6916009)(8676002)(508600001)(6486002)(38100700002)(2616005)(36756003)(6506007)(2906002)(86362001)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFliRkZ6RnFjL05CSnlveDNBelpoa1g0VHpRK2E2czVST0NGMjF2YmRoSnRn?=
 =?utf-8?B?anZnVUtzZTdaWTk1Q3ZhVUozdU9pTW1EM2tjVTV5VVcxejFvL0RySmRsM1JD?=
 =?utf-8?B?VllMbU1hd3NOUWhNUHVRYnR5V3E1SDRLekVHemZFUlB1b0poQmVrQUozM0dX?=
 =?utf-8?B?SjFzc1AwQk9iVm1wbFhBOFpTdThrT0o3WlA4S1NtNHpLSU5FdUFCU3hZN29w?=
 =?utf-8?B?T0swVUtCT00wK3F0YnVQd3p2WXhIajBQMzBwMGduWDkzWVpnamxhVDVYVzBs?=
 =?utf-8?B?T2tNNnN4QVFDVEoxZWVUdStxdWJQNDQwb09tbjZyM1BQSkVjeEJhYnZGemtU?=
 =?utf-8?B?MUpQLytZUkt4Tk9qYW1uRzY4bExkY2NaYUorTjFaYnRRdVFud2NnWHM1SHB1?=
 =?utf-8?B?TFdLRm9wVnAyZEJJMHZvd0RuUmtycHpHZVhRRHJlWE1UVmtqOGt4ZEtQSXFS?=
 =?utf-8?B?SlNYUUp4a0Z6L2JGdzl0YlpNYkdyamNnN2tmWjIvVEt4QUdkdE1XNlo5VlY3?=
 =?utf-8?B?WGRiY1NpWVBXVzRsY2JKYXEyN3NrZ3Q0cHRVZ2oxNzJ1MmJLenZwdmNYRGZG?=
 =?utf-8?B?MEtKaDNTRno4K3V2RldZbnR1YXoyK3JLemMzOXRRdGFvditMeFhvZCtnWDNu?=
 =?utf-8?B?d3JnWmVaNFMrTVhUL0FEb2h4Z0R4cTBBZktSVWZBRXZRL2FlcTZ1amVOb21D?=
 =?utf-8?B?ajVjU3JOZVdBbEZFaUduNmdBR1lDRXhZTEUwb2pPamluY0V4UllyTE9MZUh5?=
 =?utf-8?B?bUROVWx1WjF4d2RpR2tuM0YxVVlQQTNqem1EaVhPdklEQmRZNmJjeXkxdm9U?=
 =?utf-8?B?RW9KMS9BNGNpUE9iNEZPa3p1MER4VDNHNU9ZMVNwdklDZkVYSWRJMlFmVUdZ?=
 =?utf-8?B?U0RFYTBhR2h5U3pxQmZWMTlwMmNHS0dCYU1IWVRjRll4Y252VS93cEx1QUVm?=
 =?utf-8?B?N0dkOUZ2eCtvUlBrNkRqRWI5cmJSWnFneTdLUDNtMm04WTJzOGRwd0FyTXQ4?=
 =?utf-8?B?c1ZwOHM3ZTRyaTJhWUlkbkVEL0VpUDB3dFFGOGhsa0tvcVh1d3pqZDZ6dHI0?=
 =?utf-8?B?bFhkUFM3K3BEOUtQTjB4SHh1U1dlWWpRcm85RDlOOFI1SThQMG12aGxOS29C?=
 =?utf-8?B?MmtYV2sycTlGbjJXNmMyZFovYTR2RVlBR0NuaWorUXppZGY2QXZlcUhJWi9v?=
 =?utf-8?B?Wm9kRFRlQVlKVWM2Q09ISDJjZkQ1SWpJanVSYXhGa0toNmhZMzBWYnFEMkR5?=
 =?utf-8?B?d3Z2STlIdTNtQjJCOVR6UlhiS3NQcy8ydXAyMklkWkozbnNxc2R0emlVd2gz?=
 =?utf-8?B?Q3V3TldBRDFZZGM1NkFINXVHRm5XSE1iY3dpR2J4SEo0RkdYbW5qV2x0Y2Ja?=
 =?utf-8?B?czg2YnFhV3lseEtJc3g2c01SbUZYL1MxNFRPVThEaCtTayt3bCtMaTR1ZmN5?=
 =?utf-8?B?YUdSZHRxT21tQUNVQisxS3QrOUtFZGIrc2crQ0MwemRuQ05LUUZCcW5zem9B?=
 =?utf-8?B?T2ZIdlNaQWZMT29ua2hicE4yQ2xLWFppVjNLaHRYdWlPVzNvTHJQYUFISHlZ?=
 =?utf-8?B?aWNuQ3JCbnVybmRid29LeGV0aC94T0VoRkNJRjEvYituT0M4T2NCOXU3aks5?=
 =?utf-8?B?M1R5Tm9RdlVWa0NKODFlT0tudmZoQXkzU1MwSXF5MURLeUtnVXZ0RllCQ2Jh?=
 =?utf-8?B?VkMzODdNQVA0VC8xZkZHUml5WjJ4dUtrR3RVUnNqVXlSMmlYNlFnaVVRYk5i?=
 =?utf-8?B?WmVVWk1LTlkxMTNmVEdQK09xckZGN2NtY2syWHVRRm5NcjF3ZDQxbmJYZ1Mx?=
 =?utf-8?B?eWJnNGRCUHNrbnN3MW1iS0FoZ05TdzFrR0VBK0RVaUJNSW5WYU5hT2xFSmtG?=
 =?utf-8?B?SFFyRGxvcjRJYXdNTWN2dFdubVppYU1mZllkTkEyNmNYMzRpeFRVOU8xRCtx?=
 =?utf-8?B?RFovS21uQkhGVFEwZ2xoR0kzUUNYR3M2K0l4ejNheFBIZ2tjQWpZbHplNVZh?=
 =?utf-8?B?bVNBUWhPSkxCZk1ZWlh3UzNJdkZjZ0M4Mlp1NjNWNkpmb0xJeVB3YVFOMDhL?=
 =?utf-8?B?WHRDaEFUUldMOXVqdHBxKzZSaGpYN2ZmcitaQ05Pa1hsaEtZWnlBVThySzky?=
 =?utf-8?B?RVdscXJXbnloS1FONDV1VGt0NkJZcFRneUlmdURxQmU1WS8rY0MybHVyTE9L?=
 =?utf-8?Q?4FPtFzuXAT0I2TYenns0+YI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3805d185-5212-4e6b-ff3b-08d9bedb1f00
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 08:24:17.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNJbJ80OI1iF8HiEQvCuzx0QSZYu3D4P0BIfzDSTKPFeKyxKHJCu01/pK9o/EBbf+vg0qjAaHCQgvSH3jaWl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

For one at least pci_mem_start has to be precisely 32 bits wide, so use
uint32_t for both. Otherwise expressions like "pci_mem_start <<= 1"
won't have the intended effect (in their context).

Further since its introduction pci_mem_end was never written to. Mark it
const to make this explicit.

Finally drop PCI_MEM_END: It is used just once and needlessly
disconnected from the other constant (RESERVED_MEMBASE) it needs to
match. Use RESERVED_MEMBASE as initializer of pci_mem_end instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -55,12 +55,10 @@ extern uint8_t ioapic_version;
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
 
-/* MMIO hole: Hardcoded defaults, which can be dynamically expanded. */
-#define PCI_MEM_END         0xfc000000
-
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
 
-extern unsigned long pci_mem_start, pci_mem_end;
+extern uint32_t pci_mem_start;
+extern const uint32_t pci_mem_end;
 extern uint64_t pci_hi_mem_start, pci_hi_mem_end;
 
 extern bool acpi_enabled;
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -29,8 +29,8 @@
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/e820.h>
 
-unsigned long pci_mem_start = HVM_BELOW_4G_MMIO_START;
-unsigned long pci_mem_end = PCI_MEM_END;
+uint32_t pci_mem_start = HVM_BELOW_4G_MMIO_START;
+const uint32_t pci_mem_end = RESERVED_MEMBASE;
 uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
 
 enum virtual_vga virtual_vga = VGA_none;
@@ -329,7 +329,7 @@ void pci_setup(void)
         else
         {
             pci_mem_start = max_ram_below_4g;
-            printf("pci_mem_start=0x%lx (was 0x%x) for mmio_hole_size=%lu\n",
+            printf("pci_mem_start=0x%x (was 0x%x) for mmio_hole_size=0x%lx\n",
                    pci_mem_start, HVM_BELOW_4G_MMIO_START,
                    (long)mmio_hole_size);
         }


