Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B3A4D9AA7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 12:50:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290759.493226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU5gM-0006xn-7U; Tue, 15 Mar 2022 11:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290759.493226; Tue, 15 Mar 2022 11:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU5gM-0006vC-4J; Tue, 15 Mar 2022 11:49:42 +0000
Received: by outflank-mailman (input) for mailman id 290759;
 Tue, 15 Mar 2022 11:49:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GQWC=T2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nU5gL-0006v6-92
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 11:49:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe9755fc-a455-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 12:49:39 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-OBMdrwm4NWWvrlwLbU35QQ-1; Tue, 15 Mar 2022 12:49:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4565.eurprd04.prod.outlook.com (2603:10a6:20b:25::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Tue, 15 Mar
 2022 11:49:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 11:49:36 +0000
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
X-Inumbo-ID: fe9755fc-a455-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647344979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KhYhhaPJca2TdZrfrFQl2b9CBf3Fl8SouBs5ymmkyuI=;
	b=AWAAneUmYUWt6lsOqrwbv46Q5XZjNjYjM45vmmByOaXAGhZOc61znstZi5Zcs/bh2jRoZX
	hwTuPlkoFhrF0e1H5bt+rBvXz7r3rMt0MlH2m4abonC3HICCZZdvj0pOkdWYAoXFgkTTQr
	ankKCLklKk0TRad3i0WagMYj3zLIbs4=
X-MC-Unique: OBMdrwm4NWWvrlwLbU35QQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOUJRV/fUPcj3nc5pQQ8NN/e1lFNN9vd5Tng6ULbamAEMzvonh8OD8R8EUMX4V4V/trpwV8sM5sGj0SoGxIhX0fLYe8I2Es7ezSQunURhz4VBnij8i5gT2l5dKQOx0CJKrSF5qoLuweRXKciknz9NNavznSdPB/E6/5kdORF5Fd9vX4NuuIX8Y/crvuNsSBxEL3sfBYZWduN1TUY/5xG2G8aw59Wqoslr3Zd7HYGatg2Y/OEE2A0xHFN4fEIfITIKGFI2NU4FvYXRyd7nMaMiNkzraG23MvyHQBmN7sV40Wz7eqXSGNtwjJ4HIRztCzet92g9u74HHUVM09w0SgwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhYhhaPJca2TdZrfrFQl2b9CBf3Fl8SouBs5ymmkyuI=;
 b=iKM6MMX/oVHzDYyYM+LLj2g3CiBoWNlnDMaDSuN1TYlAOapmQ5EB/JTcVQHNgKRoxUDXNnE6o9RlDhMzvCzrk49dPPDNxL2vOsabr8jBzFue6KHSixS1VUiD2NGzNHBgfCmpRnctrcsnEtzN6dP35OXad0vfcxBLP7qfvPzCKHe4FBeNmBkWD/iEOw26hPoYPomrlkKm828fDQsgkq41KSomGuVlu7Km2UqEGbzFpKLfwk8MhAeYte5SCx0Dywh7dj7gCjWDrV9rztQmmcmIllOWuQsY6J7kqcgH3mtrmZvVn7LRGQO6SkKrGblOqB9Ba7PXyE7alLXOL0i7Q+jH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2943ff5-50ff-1eec-e322-6acc1879e7af@suse.com>
Date: Tue, 15 Mar 2022 12:49:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: re-inline indirect CALL/JMP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0007.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3129320-7a6c-442d-5f4c-08da0679e127
X-MS-TrafficTypeDiagnostic: AM6PR04MB4565:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB45655C4F1C9BC2A972A9546EB3109@AM6PR04MB4565.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u3AizRuF1UZC2pv9kzGf+FzRuLEvrPfM2+hwkHnlqcpl/t1+0Px5pWWhvJDZDFsOmErx19HnIXELNqOvqdDJAnfzx+kC2VJUga5Dk1XOKbxXH3B4APW6N55nx350+bAnRITJatf1KtaSXvUJeBZVAgopXJEUQCd/SyCb4Gs22V87Zw+0N98gbZueX8L1Hio7x6TJbZAoCNMwVfkCFskeDDYl8zYPmCw+z+VYjFWQHA2gluCy/k+QQswKNT30VLFrSl8RlS3tRtVWRHtk1Xa/9qMfU16yY46oDelZsmXBQTdA1CrqGlA3VjPdlux1DqwzA9GlOJmAWu69Tuhrh2xZgFARax6AJ2+ccf9FheYAEevMpZBQS3WEgdXEhgGD8W7QD9Dvzfr8KbaxBRFF+isuuDb2eYzl3XtrCqrVXIIyzzAwZAj9p+9qAlvAtS5u/r3relHHpRm4ZBFR3/iOugmW6LedCfxHc6GJPuDG+DiSu/Pext6EQhjK6qv5LQw5wC+lg9vfdJGgYDb1Q0ruK6Mn92OLfzuJpb9f8VYnhzTFKvZl/0KM0OUiasnQ8G0Mx1ni/S67XW7n3zQMWHnc5KYgsvPeDUPHIDhDXygpONb3FW5U6gZz3Of6UF5D5RWvO1qa4pSzZxX0AwTHMCe9PZ6aYLimdA6tIo53EnCzM9NP5kmPbJ5epkKAc1Qf0COP4Zi7lsfBafxAQsGQ06KSyLDv4rY7OCD0oAdJUS0hcOK9Xh2ryCPvI8Gv1FKORQMtuBe0J8NCTbl0kJbHNhssvVovhTvTDCP4GFwG9Xl2eGihPUOIWsuTcpERmN9ra01lAJ6CWFxOFjrykFZ+l6z+1xmv/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(5660300002)(38100700002)(31696002)(66946007)(66476007)(8936002)(66556008)(86362001)(8676002)(6486002)(966005)(508600001)(316002)(6916009)(54906003)(36756003)(83380400001)(26005)(2616005)(186003)(31686004)(2906002)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0lsT3FxZ2VIWGwrZDVxYTlESlFLc2VNbDZzSlh6SndTMm54SlB4SGZtdC8r?=
 =?utf-8?B?Q2czQnh4VU1rbWVHcEkvdkkyaUFHb2V3cDcvUVN3di8wOXczYjRJeW1pUnM0?=
 =?utf-8?B?N3hsODNpNWFBSEFuR2J0YmJMQjJybkpoYmE0eVhkSEp2eGZiZFVRcnk4d0Jl?=
 =?utf-8?B?WHlHVERCWStTbldjcVR3MW5tMFNBdll1SjdlcWp0VkljamZPdk5DeDRnUTFB?=
 =?utf-8?B?OEtZRGVEeE50RW4xM0tkL0hSNnB1bXpqQjQwWHJoQVM5eEt6N1NGdlAvTVJw?=
 =?utf-8?B?UFkwTGhpUSt3ZUJvb3JpWW9GNFJOLzR6MFVJNEpIZXVvdUJxVmlTRlFpVzJV?=
 =?utf-8?B?KzU0N0lReGJLN0FBc1hhWmRRYXFUYXhXVFZycEhpM2w1Q0Yxd3JBNFlaWmlI?=
 =?utf-8?B?Z3AyTUZlaFpjN09HeDhhNXNMV2hIUVpuVkErNWtGU2N6K0JZbDFNR2c0RGVY?=
 =?utf-8?B?bllyRUpIMHFHOG5SRHkvcno4TlhZVXovUFU5M0J2LzVITnVYZ2tqZytqbFBr?=
 =?utf-8?B?REFnVGl5aEhMTVdxK0NLclZ0NUtPZERhT29CcU9XNGFKZlp0UlRaWFdwQWlZ?=
 =?utf-8?B?TjJsWndSa0diblQ4cGx2TVk2NUJkTFNnbktNd0dvZGVCdmk1d29LNTFxbVZU?=
 =?utf-8?B?TzBrejYxa3RWQmhWeGV1V0w2V0c0TGpqYWhyQjVleCtXNWZxUkY2V1RVelpR?=
 =?utf-8?B?R0lwU3lWcWgvNlpTREQ0WEtyeTJmTE41Z2ZPNE15blRITjBHcDVQNUptSDlW?=
 =?utf-8?B?WWUxMlQrZ2NEY0h1TGV5RnV4M2dOT2JpNjUwbTB1RFlPM21mZ1VVQU9nTXhH?=
 =?utf-8?B?OFRrZFd4OHJvS212bHdTWHVQc3NLbnM3c1daM3JHZFZmb1dvWXNrMWlYeFl4?=
 =?utf-8?B?VEI5UFZlOXVFN2hTdVh5eSsyWTFoemNDY29tbmJOV3ZqR2NyQUhqZWh6SjYv?=
 =?utf-8?B?UWYrc3RpMUFwbTNxM3hOZFVOWW5RRDIxY0RQb29mMmNUUEJlcHhtaWhsNnVx?=
 =?utf-8?B?WDFVa1pXL1EzOUkrZS9BM3hMZ0pMYVUwY3RpMEZZdTFHVTJsczdKWlo3azZj?=
 =?utf-8?B?c3ZYR0VuZXQ2OGR2MDVuTXdCR1RURnRsY0NoaktlOE9IK1JGWWJrdFpGZGRB?=
 =?utf-8?B?djIwbkk3MksrcFVuTEFVNkJDQUJjV0lUSmFFeE1vNUNuRDAvOFUva1E5ZGFr?=
 =?utf-8?B?MDV5ZHhWWjVPeGJVQm44SktvQXg3UnIwZ050eXU2d3pEMVJiZyt3UVdVKzVM?=
 =?utf-8?B?WE13LzVhNW56cGtjQVk3ZS9Zamh1V0g2RTIwMmRiSHJRTkpJdThtaGc3cDM3?=
 =?utf-8?B?eEVXdjdQVTBiSTdRcWlpZ0lCNFUrTDlObURlcEtGQ3NxRXJyREtjRmJYSmdp?=
 =?utf-8?B?bGNGdkJkcWpCRjNTMmxTNHgyUGNQVmdPdVY1bUxkcStUTUFVOXFzb29uRUwz?=
 =?utf-8?B?Y2Fac0h3ZzQ1MUFWQUZaQzlKMWVlSDZZVjJtUmlJWTdiN1dneXFwc3Q3NjA5?=
 =?utf-8?B?ZGdkc2Qxc3pWUTdwY1JHS1VwMW5ycVJYNVBYY2Q3ZG5vK3pKWmRJWWZhOWF1?=
 =?utf-8?B?dlRUYnNRNWk0a2ZlaDBYaXg1aVNMdFE0bkZUWlJsNnpwcGozOTVxTEhGbzF0?=
 =?utf-8?B?NWU5QmdPc3lWc1RRNnhmVi9nSzg2emdTam5RTVhwWkJ3aXdZN21OMkFOaWQx?=
 =?utf-8?B?SXEwZ0FNTTlaUEl0ME9pMTFCeEh1bzhmbTlVazcvd0xHbmtHUUF2VER0Vmhw?=
 =?utf-8?B?MGNNNS9HWVdQYXpkVndtNHcxVXpnaHlrTDdRSFlFbngrZUR3ajVYV0I0WnlU?=
 =?utf-8?B?ZWthTmZTTml5eDRPdGZvR2F3a0oxSVJ2VlMydkt2K3FMSlRBZUJuRVJHeTlS?=
 =?utf-8?B?YWhZN0dmT1AwMDdZaCsydzdsWGVzQXorU2k4T0lqaXM1b1I4QkVTcTJzeHZw?=
 =?utf-8?Q?/AIGSw5EZgdUHgc5EqNoZzTdmGqAzHb6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3129320-7a6c-442d-5f4c-08da0679e127
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 11:49:36.5547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4WydoumyxMI8ra0vOVpn/xTzLbpmRaBDVS+TqGLmltPctH5qonObEwhwytZbd8ZUVxcuZSaILHVQdPatxFJkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4565

Using the same thunk for heterogeneous calls (i.e. ones to functions
with entirely different parameter types) is a problem: Speculation may
e.g. result in use as pointers for arguments which are are actually
integers. This is a result of target prediction information being tied
to the address of the RET instruction in each thunk (of which we've got
only 15, and of which in turn a fair share of the call sites use the
single one where %rax is holding the target address).

Except when actually using the full retpoline, arrange for alternatives
patching to put the JMP and LFENCE forms of the thunk back inline.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm sure I didn't get the reasoning right / complete; I'd appreciate
clear enough indication of what needs adding/changing.

Some of the changes to may not strictly be necessary:
- INDIRECT_BRANCH: We don't have any uses left in assembly code.
- GEN_INDIRECT_THUNK: Continuing to patch the thunks when they're not
  used is merely pointless. The change, however, is more in anticipation
  that X86_FEATURE_IND_THUNK_{LFENCE,JMP} may not be fully suitable
  names anymore when the code gets inlined (at least I probably wouldn't
  call such "thunk" anymore).

While perhaps not a big problem, I'd like to point out that this more
than doubles the size of the .altinstr_replacement section (with an
accordingly large increase of .altinstructions), unless we were to make
use of "x86/alternatives: allow replacement code snippets to be merged"
(which of course affects only .altinstr_replacement).

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -195,7 +195,7 @@ t2 = $(call as-insn,$(CC) -I$(BASEDIR)/a
 # https://bugs.llvm.org/show_bug.cgi?id=36110
 t3 = $(call as-insn,$(CC),".macro FOO;.endm"$(close); asm volatile $(open)".macro FOO;.endm",-no-integrated-as)
 
-CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
+CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3),-DCLANG_INTEGRATED_AS)
 endif
 
 CLANG_FLAGS += -Werror=unknown-warning-option
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -240,7 +240,7 @@ $(obj)/efi/buildid.o $(obj)/efi/relocs-d
 .PHONY: include
 include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
 
-$(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
+$(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -D__ASM_MACROS__ -P
 
 $(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
 	$(call filechk,asm-macros.h)
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -244,11 +244,19 @@ static void init_or_livepatch _apply_alt
 
             a->priv = 1;
 
-            /* Nothing useful to do? */
-            if ( toolchain_nops_are_ideal || a->pad_len <= 1 )
+            /* No padding at all? */
+            if ( !a->pad_len )
                 continue;
 
-            add_nops(buf, a->pad_len);
+            /* For a JMP to an indirect thunk, replace NOP by INT3. */
+            if ( IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) &&
+                 a->cpuid == X86_FEATURE_IND_THUNK_JMP && orig[0] == 0xe9 )
+                memset(buf, 0xcc, a->pad_len);
+            /* Nothing useful to do? */
+            else if ( toolchain_nops_are_ideal || a->pad_len <= 1 )
+                continue;
+            else
+                add_nops(buf, a->pad_len);
             text_poke(orig + a->orig_len, buf, a->pad_len);
             continue;
         }
@@ -330,7 +338,12 @@ static void init_or_livepatch _apply_alt
 
         a->priv = 1;
 
-        add_nops(buf + a->repl_len, total_len - a->repl_len);
+        /* When re-inlining an indirect JMP, pad it by INT3, not NOPs. */
+        if ( IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) &&
+             a->cpuid == X86_FEATURE_IND_THUNK_JMP && orig[0] == 0xe9 )
+            memset(buf + a->repl_len, 0xcc, total_len - a->repl_len);
+        else
+            add_nops(buf + a->repl_len, total_len - a->repl_len);
         text_poke(orig, buf, total_len);
     }
 
--- a/xen/arch/x86/asm-macros.c
+++ b/xen/arch/x86/asm-macros.c
@@ -1,2 +1,3 @@
 #include <asm/asm-defns.h>
 #include <asm/alternative-asm.h>
+#include <asm/spec_ctrl_asm.h>
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -98,12 +98,42 @@ search_exception_table(const struct cpu_
          regs->rsp > (unsigned long)regs &&
          regs->rsp < (unsigned long)get_cpu_info() )
     {
-        unsigned long retptr = *(unsigned long *)regs->rsp;
+        unsigned long retaddr = *(unsigned long *)regs->rsp;
+        unsigned long retptr = 0;
+        unsigned int pad = 0;
 
-        region = find_text_region(retptr);
-        retptr = region && region->ex
-                 ? search_one_extable(region->ex, region->ex_end - 1, retptr)
-                 : 0;
+        region = find_text_region(retaddr);
+        while ( region && region->ex )
+        {
+            retptr = search_one_extable(region->ex, region->ex_end - 1,
+                                        retaddr + pad);
+            if ( !retptr )
+            {
+                /*
+                 * Indirect call thunk patching can lead to NOP padding between
+                 * the CALL and the recovery entry recorded in .fixup.  Skip
+                 * past such NOPs.  See asm/nops.h for the forms possible and
+                 * note that no more than 3 bytes of padding will be present.
+                 */
+                const uint8_t *ptr = (void *)retaddr + pad;
+
+                switch ( ptr[0] )
+                {
+                case 0x66:
+                case 0x90:
+                    if ( ++pad > 3 )
+                        break;
+                    continue;
+
+                case 0x0f:
+                    if ( pad || ptr[1] != 0x1f || ptr[2] != 0x00 )
+                        break;
+                    pad = 3;
+                    continue;
+                }
+            }
+            break;
+        }
         if ( retptr )
         {
             /*
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -33,7 +33,13 @@
         $done = 0
         .irp reg, ax, cx, dx, bx, bp, si, di, 8, 9, 10, 11, 12, 13, 14, 15
         .ifeqs "\arg", "%r\reg"
+#ifdef __ASM_MACROS__
             \insn __x86_indirect_thunk_r\reg
+#else
+            ALTERNATIVE_2 "\insn __x86_indirect_thunk_r\reg", \
+                          "lfence; \insn *\arg", X86_FEATURE_IND_THUNK_LFENCE, \
+                          "\insn *\arg", X86_FEATURE_IND_THUNK_JMP
+#endif
             $done = 1
            .exitm
         .endif
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -20,7 +20,7 @@
 #ifndef __X86_SPEC_CTRL_ASM_H__
 #define __X86_SPEC_CTRL_ASM_H__
 
-#ifdef __ASSEMBLY__
+#if defined(__ASSEMBLY__) && !defined(__ASM_MACROS__)
 #include <asm/msr-index.h>
 #include <asm/spec_ctrl.h>
 
@@ -300,7 +300,50 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
 .L\@_skip:
 .endm
 
-#endif /* __ASSEMBLY__ */
+#elif defined(__ASM_MACROS__) && defined(CONFIG_INDIRECT_THUNK) && \
+      !defined(CLANG_INTEGRATED_AS)
+
+/*
+ * To allow re-inlining of indirect branches, override CALL and JMP insn
+ * mnemonics, to attach alternatives patching data.
+ */
+.macro call operand:vararg
+    branch$ call \operand
+.endm
+.macro callq operand:vararg
+    branch$ callq \operand
+.endm
+.macro jmp operand:vararg
+    branch$ jmp \operand
+.endm
+.macro branch$ insn:req, operand:vararg
+    .purgem \insn
+
+    $done = 0
+    .irp reg, ax, cx, dx, bx, bp, si, di, 8, 9, 10, 11, 12, 13, 14, 15
+        .ifeqs "\operand", "__x86_indirect_thunk_r\reg"
+            ALTERNATIVE_2 "\insn \operand", \
+                          "lfence; \insn *%r\reg", X86_FEATURE_IND_THUNK_LFENCE, \
+                          "\insn *%r\reg", X86_FEATURE_IND_THUNK_JMP
+            $done = 1
+            .exitm
+        .endif
+        .ifeqs "\operand", "__x86_indirect_thunk_r\reg\(@plt)"
+            .error "unexpected: \insn \operand"
+            .exitm
+        .endif
+    .endr
+
+    .if !$done
+        \insn \operand
+    .endif
+
+    .macro \insn operand:vararg
+        branch$ \insn \\(operand)
+    .endm
+.endm
+
+#endif /* __ASSEMBLY__ / __ASM_MACROS__ */
 #endif /* !__X86_SPEC_CTRL_ASM_H__ */
 
 /*
--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -38,9 +38,13 @@
         .section .text.__x86_indirect_thunk_\reg, "ax", @progbits
 
 ENTRY(__x86_indirect_thunk_\reg)
+#ifdef CLANG_INTEGRATED_AS
         ALTERNATIVE_2 __stringify(IND_THUNK_RETPOLINE \reg),              \
         __stringify(IND_THUNK_LFENCE \reg), X86_FEATURE_IND_THUNK_LFENCE, \
         __stringify(IND_THUNK_JMP \reg),    X86_FEATURE_IND_THUNK_JMP
+#else
+        IND_THUNK_RETPOLINE \reg
+#endif
 
         int3 /* Halt straight-line speculation */
 


