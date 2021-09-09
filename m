Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B950E405926
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 16:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183307.331403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOL9j-0007oK-QB; Thu, 09 Sep 2021 14:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183307.331403; Thu, 09 Sep 2021 14:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOL9j-0007mJ-Lx; Thu, 09 Sep 2021 14:35:59 +0000
Received: by outflank-mailman (input) for mailman id 183307;
 Thu, 09 Sep 2021 14:35:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOL9h-0007mB-PX
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 14:35:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3db65096-117b-11ec-b1bc-12813bfff9fa;
 Thu, 09 Sep 2021 14:35:56 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-79raWJstPiumGt3O_JwzJQ-1; Thu, 09 Sep 2021 16:35:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 14:35:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 14:35:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0018.eurprd09.prod.outlook.com (2603:10a6:101:16::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 14:35:51 +0000
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
X-Inumbo-ID: 3db65096-117b-11ec-b1bc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631198155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fOUx97FiXhN5eIKucfl+62XT9uRezxxwSDnxXO8LNd8=;
	b=R1ybchOqN7R1Dxclv+DQwC7VN7/8yPbitLvm7bYTK5prnIbhu8CKFBUHaPGMa4yLbiwSqH
	NaXLftVGNUstpz2bFXT6UTAtZbC4SaocmoKCrHn9pfmjIyjWnhQEACAQc+PNqq/JJ9QgwO
	DYkf4u1Fr6VaKaf+mYNJrZ5VPEpPKEc=
X-MC-Unique: 79raWJstPiumGt3O_JwzJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdZNvtgxFI4fIdsRS2/wX+cISGwbBogtShwRqR04VcDK6p8Qtk6ipcNnbVTu5YCA5CadvSUvaH8Qkjo3Mb/Ay0G8VsoRhRuhjklwks+LGlLaVtkTw+CMbMxlZWfczXcjWpbwUdcv2rrmPmEDAa1uP6t5XBPMIyNHIB148P0bpX8ZOGZWFVeGDaybz9Baq8ohFDbV6U6moyEi6VoG/83cIZOS4+e0y9jzI8GQpnjbyGcAmi8MoU+LFmSCAFo38BziN0qa+t7awO9RDfi7a6e3Z3TtpoIXknL0/ISFFeX40xgsypotRxn1ExuZ7gwXtuFNnDlVsGK0pNC4AH6ZopsasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fOUx97FiXhN5eIKucfl+62XT9uRezxxwSDnxXO8LNd8=;
 b=JebL5qhYiStRF/sboN+KVW4pxu7mQxumZ9jg7za15T9gDsAVDM+PbdG8ayCZqUw0eR0Nr758uFWjl2AU+QIX1+zyLlrbyB3IJgdvZAI7L6Q4/LZU/DG5sLrTtWJ5DDVjRWpXAaK4DzqUU1hAp//nXZ1Ibp2WZ7n6xoUT6XiwGNY4TIIu1dcwpIICkwCXaBTBrRXClcKGEKAB0kk9XxiJur6QblKLcWucmRwviBrCLm845JcuV5/azGv/AutEq/Y1QozjygBlVyWyByI0xYzDQLLlxVOZVeAdH2qJnun7AwQHhV21QaiYqW/zUWCWPn7BQP+VlQ8TOL9JqJcsoazLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: conditionalize workaround for build issue with GNU ld
 2.37
Message-ID: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
Date: Thu, 9 Sep 2021 16:35:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0018.eurprd09.prod.outlook.com
 (2603:10a6:101:16::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31ac3c4-5d69-4443-2abf-08d9739f1ff0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5597805D5EFF38EB7F0A47C3B3D59@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aBbfSbO7cQpCOGu4yzY5Nl+tuZ+2aNaUqTl+r9wDxGcjUPf4si3AMA+Nv/51cqWd7RpvmrboAVHU9eleULgkN8u/bWbYpEr7o04U6qgABT4e2+8UcZvNJy6nBr47/8pG1jUQw3ER4Wlpxmzh9egQKx8mqdkizCrG7ZMuASn8PTpaH7Obt6CuiNa6QTGnmPV5m+Usz+iBUIxKyLWPieBu7H09VnT/Xnl+fObMLxVS9pPWJs3GrOkxrrkqwXT2LC83Tv4ApoIhsIE7MKdpQCiyQplp56X25o/Zd3w4dzu5HIaMJUWu90efOdorukoTPdNgG/ic+vxATf6+VrX1n+DvnBcJXrpsUYPt9tih7IlWmVt2kzXtPGSKgrq0rtF7FP1HjaDu1rj/zOx9eibGcvbYMdop75T7ZvflHW86/xrT5i55ZKGNYI5D/DrF4/p5AmenLXiHjsapidBvUG9NdUw4wPLbqrjy5ceyVC538XdAbfvwNerlnvknH8ZWQOXa29sXqkcEVTvxYcqUc5zFQpLuuVb/08oWYoFm2hVtcAJMLz3pshUJVSHDsIPFUVhe8eElmXhvA30XcHxCOz/sV+eEekzrC8XA41mIkhWLMHg7Vo+28juv63zApmuzUwdJ34/IfuZEWJf84gvO4XfII/d8LpbNWIJPGTMZCh4pBsIr4xrEjKeekrQGYKQnFjzEeEmjxMUypTVdYtx7jDXUTyE9kJq6j8NZ6i2xjKAD40zSV4zfHY8EwlHzGkwS69K221nbBoMebWTModXcNdog9H+nyOpkqDqc8eIE1i82b/DVqHX7jcE8SWisSZJWSgWNs0IX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(366004)(136003)(396003)(6486002)(66476007)(478600001)(8676002)(66946007)(66556008)(16576012)(186003)(26005)(5660300002)(2906002)(86362001)(966005)(6916009)(36756003)(956004)(2616005)(54906003)(31696002)(31686004)(4326008)(38100700002)(316002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmVhaGU4aXNEenBwdXRueEFVbWdnbVpPYUtJdmhXU0Jpb0paeHhjYTE4bWlE?=
 =?utf-8?B?ZGF1VEdTbEJoT2Y2YWNUYUlhZjlUdUZJcXQyMUwwaEh1LzIyWElLemV2d1VT?=
 =?utf-8?B?RFk0MVcwSU8zM1JaSEMyMlRvaHJDeU9kWHNLVmtrM2lvUG9DWVNLVWUwN0or?=
 =?utf-8?B?OURKT1J3Z3prb2ZmaTRQc2xnSzJDNkp0eGxXMmViV2h1TlpueUZZcXlCUW9Q?=
 =?utf-8?B?L3c0L01DVTFpalI3WjB5RDhMZExOTnJUT1FqMXBBYnJ2UlpHL0ZvODF5VytU?=
 =?utf-8?B?aVA4Vm84YTRsRVpWVU5OMlozVGNOZlBrU2dFQ1BHZ0grWG5reCs3bGttSG9E?=
 =?utf-8?B?Z2V6OVBsbVkxdTZGUG5qdnFjNW9CTE9McEZ6L2EwVGU4clZyN3p2d3VDZmdO?=
 =?utf-8?B?VEFnUWVlWGs0c0NiRHFrVHRSdWFCRGgrUHltOVI4SWJlNXNNWUt6YjdLR0Qy?=
 =?utf-8?B?UjBlS05yTDc2a3RJSzJ1UlRoNzRpZXB1UmVQa05EL3BrdGdJM2Frc1ZkVThi?=
 =?utf-8?B?TGgvbnRBM2NmNmxQT1VsNHRVNzBjUjF0emVsenpNaXcxK3dBVkp0M2MzNUNv?=
 =?utf-8?B?YUl1NVlUZW9QS0JkSkZ3N2lqTkROSVNhaWZsWWhZbHd1cVlXY2NLdCs0WG40?=
 =?utf-8?B?b2E0L2Z2ams3SlZjVXZmbThON05vQXJpZy9WUm8yeEI3aHR3WUVCWWVzaGJr?=
 =?utf-8?B?MEU3eEdWOGFiZ1FsM3M5VTZWcDY5OG5VOGkzeDJRL1o5NFhwRi9rbk9pUDdo?=
 =?utf-8?B?enJDNUY2RmUrMHpsUk94UTkwYzRIWGt6SjRiaHhINUd4YnkwVkNuYkkySDJm?=
 =?utf-8?B?ZGQwbERUdnJuVit2c0pEblJKdGlORU9OQmYwYVk5d29MalV6dnQwV2ZJZzc4?=
 =?utf-8?B?c3RKRTRBVTNaTkVmZG00bWk2L0pWbTNLeXNFWEhaQjZnbU1DL3JQOWlvOEIw?=
 =?utf-8?B?ajg3OCtyVUNvR2FHd2JWdVFCY0VjQ1huZ3gxK2xnRlBPQlh5NWFidWg5QmtO?=
 =?utf-8?B?S0hneithcjNaUm1pUGRmbkhBTUxqV1kyUGE4YjliRE9EUHBSNVB1WDQ2OXdK?=
 =?utf-8?B?YU9TOXNoQ1lQTzJDN1JMMlBTd3dCOFdVbDJ5YjBUdlFaS040dWM5ZWRJYm9p?=
 =?utf-8?B?dkpsTzRLZW96V1dLNGMrODNLLzVpT1dmb1JtQzlqTXJmR3NHTFlwNUE2Vkxm?=
 =?utf-8?B?VUJvY3ROd1dsZGEvcDMwcGd0bzdVK2IxMWRZOTlMaVZxemxudXRHRm1tUDR3?=
 =?utf-8?B?amhaZGNkQVdLcDlEaDREd3RNM25tYUpKQUZtR0I4clRtVHRhQ1hra1JBaGow?=
 =?utf-8?B?Y1NXSEF1VndLZFBmZzM3ZUR2cDQzOWovRVBqSlBYL01PYmdTNWZ6MmExZ3Y0?=
 =?utf-8?B?eUNOcDlsUTZkL3gxamdBWE9UZlpVVFdpMkQrejFtazh3Sy9tMG85d1lReGJn?=
 =?utf-8?B?ZzlmeWlmTGpNQ25rZnVaRTA5bHJ5THpMbVNLNDBGZmN4amszNy82ZTh1RGdt?=
 =?utf-8?B?aEJER3lKYk5YbzB2dmJRRW9TeEE0SHRJNVYyV3BoMWlQcjkvZUo2UWJQZ2hy?=
 =?utf-8?B?Ykp4cEw3RnFZelRhUDJjNlpha3lqZldJaVpTaHJld2ZvanorYXhobEV5SDhw?=
 =?utf-8?B?QjMyM29mZzhFdHpoTXlaN0NmUHNON3BWTE8xNHYySEo1MzY3UzU0RVZJczdw?=
 =?utf-8?B?YjFlOTdZeG5UbTdCK0JrUXR3S29LVk1QcGtRd2FENVlPSWhlN1ZFZUhncG8v?=
 =?utf-8?Q?WbrPWZ6VoSNZt0UFqpF3I9bDJLvStg1muGaKhej?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31ac3c4-5d69-4443-2abf-08d9739f1ff0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 14:35:52.3622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5A2sUbEu4OWc8q5mK+IGE5dWZMlnU+L5w10jE+XlE980RQtrUbo7r+f8Ya32zWZ/eGUrTx7g/mVK2Yv3RUD7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

While LLVM's lld is supposed to be a drop-in replacement for GNU ld [1],
it appears to not understand quoted section names as operands to e.g.
ADDR(). Therefore the original workaround broke the build in
environments where ld is actually LLVM's, like on FreeBSD.

Fixes: 58ad654ebce7 ("x86: work around build issue with GNU ld 2.37")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://lld.llvm.org/
---
I haven't been able to find an environment where I could actually try
with lld (ld.lld); all testing was with GNU ld (ld.bfd).

--- a/.gitignore
+++ b/.gitignore
@@ -306,6 +306,7 @@
 xen/.config.old
 xen/.xen.elf32
 xen/System.map
+xen/arch/x86/.check.*
 xen/arch/x86/asm-macros.i
 xen/arch/x86/boot/mkelf32
 xen/arch/x86/boot/cmdline.S
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -92,10 +92,16 @@ efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
 
 ifneq ($(build_id_linker),)
 notes_phdrs = --notes
+# Determine whether to engage a workaround for GNU ld 2.37.
+build-id-ld-good = $(shell echo 'void test(void) {}' \
+                           | $(CC) $(XEN_CFLAGS) -o .check.o -c -x c - 2>.check.err \
+                           && $(LD) -T check.lds -o .check.elf .check.o 2>>.check.err \
+                           && echo y)
 else
 ifeq ($(CONFIG_PVH_GUEST),y)
 notes_phdrs = --notes
 endif
+build-id-ld-good := y
 endif
 
 ifdef CONFIG_LIVEPATCH
@@ -291,6 +297,10 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
 	$(call move-if-changed,$@.new,$@)
 
 efi.lds: AFLAGS-y += -DEFI
+xen.lds: Makefile
+ifneq ($(build-id-ld-good),y)
+xen.lds: CFLAGS-y += -DQUOTE_SECTION_NAMES
+endif
 xen.lds efi.lds: xen.lds.S
 	$(CPP) -P $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 
@@ -302,7 +312,7 @@ hweight.o: CFLAGS-y += $(foreach reg,cx
 
 .PHONY: clean
 clean::
-	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
+	rm -f ???.lds *.new .check.* boot/*.o boot/*~ boot/core boot/mkelf32
 	rm -f asm-macros.i $(BASEDIR)/include/asm-x86/asm-macros.*
 	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
--- /dev/null
+++ b/xen/arch/x86/check.lds
@@ -0,0 +1,11 @@
+/*
+ * Minimal linker script used to check whether the linker understands section
+ * names containing a dash (like in .note.gnu.build-id) inside ADDR() and alike
+ * without quoting them.
+ */
+OUTPUT_FORMAT("elf64-x86-64")
+OUTPUT_ARCH("i386:x86-64")
+SECTIONS
+{
+ .text-1 : AT(ADDR(.text-1)) { *(.text) }
+}
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -18,7 +18,12 @@ ENTRY(efi_start)
 #else /* !EFI */
 
 #define FORMAT "elf64-x86-64"
+
+#if defined(QUOTE_SECTION_NAMES) /* GNU ld 2.37 workaround */
 #define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
+#else
+#define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
+#endif
 
 ENTRY(start_pa)
 


