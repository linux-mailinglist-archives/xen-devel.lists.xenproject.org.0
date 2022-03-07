Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7084D007D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 14:53:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286057.485392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDnr-0003eO-VM; Mon, 07 Mar 2022 13:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286057.485392; Mon, 07 Mar 2022 13:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDnr-0003bg-SM; Mon, 07 Mar 2022 13:53:35 +0000
Received: by outflank-mailman (input) for mailman id 286057;
 Mon, 07 Mar 2022 13:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRDnq-0003ba-Sp
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 13:53:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa66c990-9e1d-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 14:53:33 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-U7bGXXVOO_OncyNSPfsJyA-1; Mon, 07 Mar 2022 14:53:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:53:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 13:53:30 +0000
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
X-Inumbo-ID: fa66c990-9e1d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646661213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=846rwHpjor88qTLP2jLcjP5OzqWT2glBKNGKgJU9u2A=;
	b=cVJ12dBNbpNO6anGFxcavw3TjC5iJGF2HWjThzECmEUj5LWQkfHbye+A/lpQdwN09bFF/i
	KjpOWLwrO0Y9cC0Kdyr2C7s6aICFYiTOQaSStBqKX16UveW8IqBs587ALQJcT/5XSuLofH
	ldUGE/qypEs92DnRQ5OgaR5uTjDadKQ=
X-MC-Unique: U7bGXXVOO_OncyNSPfsJyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BChyIaFWkCuISoraQVQH70VyPHmk4BRO4Or8ndidgF+FsA1rtBE/HXNb17Mr7OSyAomMfGyPkHBoXwNUPEw3UEOsJ7xr/AqlgL2oUEmO8vC67/+APQxHwdPFfOOdA5y1/I38AmeEI0lHSj8hdJXhkjhywFtiFZZiMxoGcZo1e+0VseHBCAU8nPX76ptObh3CMbxE/K7DaQBwk396p9l/E7VOIlkcRfSuAq4d4T+4LQ/aU1chjKnsckeg4g0zTG15JETBvwb3EA32axot048EH60zMDZFmIxEsQcBxm6QXQRzHLdCwfGgFDl6BWMt1BnpM58FH9FaFS8kgyN0wouFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMhknlz9yh8+1iD4fWNtd2tdMygpNNidZmv+OoaqSZ4=;
 b=OHsze2I6aAdtvsO3PObCGJKKirx6/uEilTN6cRoUb+YvZw9Otj5i3U1aFMB97ODZfUTRKEAlh2MONVy//luyAqhXJo747lTXw5qTT2U8Da/haocgt9xXEnX9OC1K5VViI7Ig9jU7XjVYKOHrAoKGOLxcvH4A3vKFQC6PRiwlT0HkQpo8NBXBWJWPFVZLn7M6wwS2GyFV3aDpDeMGlJk+3Ux9FnOX4gIdpbGKm+/MqrcwKQqbS9rN9m7u3C0HOa6YHHxO+gn/heY8zZyx6kzaLmkleu1HqtIzYqhr3ah3TMCpB0x5CczmE3IUYymbPTGxnJow6tpezXSycYEwbgP4uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <289684f6-fa73-bf02-137c-680ad8891640@suse.com>
Date: Mon, 7 Mar 2022 14:53:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/build: use --orphan-handling linker option if
 available
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0053.eurprd06.prod.outlook.com
 (2603:10a6:206::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed4a8db6-9c98-422f-8f92-08da0041dcfc
X-MS-TrafficTypeDiagnostic: PAXPR04MB8318:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8318E2989C22E573512E5601B3089@PAXPR04MB8318.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nL6m5/j4TCL2UmEHRx+WFxTLrqHKWin4zXjR++42QI8ey3gwWfR9hihUJDOzeUPTyJzLkP/JqnwZgUlIEgHSIdFFJxvnZSpDWguLjQ1x+mDMgLEKquclWxke+A5ue1EJ3uhCSQLcZ/JkPtCkWfV2nfKJ2uLf2Jea34ErmQvdi1Gwx30iow2hPaHujcFPB8znlLWs2gudMd81CGk8NxGcVdl+UReEwzGAzMg+413KxObIfxnWfmTyvyjUMgssURNdnV2MDwT/D72kzJioZMZIa6m4XTWQYBsWIIheg/v+ArYlIlagnDqsdkNt+QjHfXGCBujLJ8tWI2mYSAg4UyDJQ+BTdAv/pUIl0odgO89jpH/Ej9P7Ne4ju/FP/+d1j2hO6DVTrcmYpZWfznuhIZNry1u/DpSavzbPte70bRBXQk7fYtpt3qusEXqkcCagtias4n1moqywrxHAnoUOHu2w5rBbrcJPv6AjkXeJ2jZHE56Yy+EaqZ084EqA0eN5POXiadnA84Xe3GUugWQIOns7cSR2un51sUX7qQAngXvOCzLLkCTt8udyzYLeE8AJmoMeUwYiGtNtGvEAws3Mj76W4acn0Can9z/sGwJKgIpWGAB+aNnHa9IE2eTy9m5P0tAb3OR4TBRkDVhPslY2/Pagr3Sl6dUjQnVI2zEjZVjHGOiap1Bb4yc20d96J5iyktHKGqfID3bIw3lGDt/CWU+1R/pFbf9J9Fbf3BpkVfkImUAjeTFRDM5zQikNn2BlcfM+wszGpDMfoT7aVdSJdhC4im4XZmFcrRPw9OQw63ij+/DBd0JDHk8jprBAR3kyrpTLMMLEny8GHVPmdbXeRLXa+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(31696002)(86362001)(83380400001)(4326008)(8676002)(66556008)(66946007)(66476007)(54906003)(6916009)(316002)(5660300002)(36756003)(8936002)(2906002)(186003)(26005)(6506007)(2616005)(6512007)(6486002)(966005)(31686004)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vweFIvHDhBTq/jg+ZAKPiqUKlT9eQYmRhBKDDfStrTk6Srljt2X8WF4WKIUJ?=
 =?us-ascii?Q?hwd7E+UBwJd9DfLs+FrhkfC+gu1Iu5qseU1/ewYAJMnwypp+x3mOYnIEcnvJ?=
 =?us-ascii?Q?bPKcdvUMO+66XODXaV/P5WQXSb/eMVVOWx7SLssKC5YXgbvgIfIECYfy1qsD?=
 =?us-ascii?Q?A4zVYMnOvtTStoHK/DBJJO3o7mv9YP9mDoTrWnnnQbeNC7WQrY1VSYO2cSBJ?=
 =?us-ascii?Q?yAFbZghq35RODpfpTISFBu2ZXPKyG6zL0AX7IfhIY3wRYB2t+FkcXLMVhv1C?=
 =?us-ascii?Q?yD98cCw6h2QM08Iz+fqda1EeHNgeQY7ZudZTWJ1GGrlDNeks7hQbgDdip1BI?=
 =?us-ascii?Q?ZIHHACLT2+eq51+T/0KxHnX9ltMUtZivv7as6IaV/hqvvPolMFu77f4pli27?=
 =?us-ascii?Q?zbLCBEkNZZur2LVtUhchzY1MDu+s6Ti+Rr2GBmRtnd0x44wLKJLEk10gdHWO?=
 =?us-ascii?Q?ZRi2zWi9aHvuCn/NnDcO0wPCKrY5KLONnwCtQnsZLioQVbA6MJKtKnFuCS+y?=
 =?us-ascii?Q?sWiK4abh9x1d7pd6ocqhI7Vvfjz22mW8Hm8mWQyN/e6d2r/K2LnZ0fV57Mlv?=
 =?us-ascii?Q?Fn0TqNcR28FAGYAQyFd7w/4hcICc9XFG+Qavzz6UMY8reKoCgsxfDDhDLY/D?=
 =?us-ascii?Q?ks+o0J3LaB1u8hXIMmfnLoApkzlY+l2UnsT2sI18HPqUlZGY0/dqvi2XEgVn?=
 =?us-ascii?Q?6K/PkHebFVeUan2ImKU/38kXar//r8FQagK5v0bexQu6MQNB3OmZvfImzaa4?=
 =?us-ascii?Q?3XZPdUTE9ZZwJ168CBpTmgOgKKPWFP1NY6mrK1DhPUOF2m9mcbCWddyQkatR?=
 =?us-ascii?Q?zMiuDE/F0+W4IwZGiq5LeE+TKw3fZGdM9KnIVPmXTxY51fiSff2+3SWfo02L?=
 =?us-ascii?Q?0hH4dmTc0FjFUDvUWz+EEU1VvBMs/M2WhoVvPdziKBGYYcbYb3VtMMBo8YKJ?=
 =?us-ascii?Q?fPjVLsNGaSbpcBYpRMeLhdTxN2StaumbVLBYe2KMKMdCok8krHtZ4/3tUMWX?=
 =?us-ascii?Q?2/OG1ValCsmuSg6rjaS1EFDIj05LCmOKqczHKOsYvNTDDDtuKBx+Vd7ekNSI?=
 =?us-ascii?Q?lMxjIL0q+CTKu6g9Ygv9w5FJ8O7uE9tyEX5lWe7m6sykkLnYVrUwCIVGHEwr?=
 =?us-ascii?Q?YavUUZ75K4CqASEwbr74Dn1OiW9IWNNBIe8bEkl+eyDVxWbBYgdTkoPbrCXP?=
 =?us-ascii?Q?CVkUVPhG8pKyfjQjsnd6AhxFBm7P9aqY1PmaK5dO6BMJfYr9iOneoLLuhgNB?=
 =?us-ascii?Q?TocMwbHtrWOxVLeC2POwGHqYtIg+BZeQVHVEQD1c1t42FH5jcRbOQlf+55/b?=
 =?us-ascii?Q?IiZuYvcBDt7yAuRLKh6AZN4TjltJnv1i0q7qWCi7Ga2dZHf/FcSIvxGi4d2T?=
 =?us-ascii?Q?kW0p7TC9tKzhJ028sXL4En03G1c9OhQU9n4Fyp6sCqiYhuvr0ZzJRTRZFbyq?=
 =?us-ascii?Q?+HpD+FGPsQ8AoAmnMNXV/ynbIjeTPAPTyKmybla2dpven550T5LXqM/l1Fwd?=
 =?us-ascii?Q?DgyI4UVodSENJnQuoi62/VcXsMO1pFvMbyhmQ2rkNs8VEv9iyXhJtYCjo8ma?=
 =?us-ascii?Q?IQV/S2+7ukyavp5oX6hFNF3DwIZ5WySigstsz2Vd++jfqP5vi6EU76gtdBK5?=
 =?us-ascii?Q?HOBDc7zMZtoSbXu11zL6aJM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4a8db6-9c98-422f-8f92-08da0041dcfc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:53:30.8322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PckkepXfiHezO9cYPM3LK/Qz01BMKbWR26I68ok+MltJFosHAvUQpWG8a3B9cSech+kX6MUlKdS/QlO7K3oMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318

As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
binaries"), arbitrary sections appearing without our linker script
placing them explicitly can be a problem. Have the linker make us aware
of such sections, so we would know that the script needs adjusting.

To deal with the resulting warnings:
- Retain .note.* explicitly for ELF, and discard all of them (except the
  earlier consumed .note.gnu.build-id) for PE/COFF.
- Have explicit statements for .got, .plt, and alike and add assertions
  that they're empty. No output sections will be created for these as
  long as they remain empty (or else the assertions would cause early
  failure anyway).
- Collect all .rela.* into a single section, with again an assertion
  added for the resulting section to be empty.
- Extend the enumerating of .debug_* to ELF. Note that for Clang adding
  of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
  .debug_macro, then as well (albeit more may need adding for full
  coverage).

Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Don't use (NOLOAD) for ELF; it has undocumented (and unhelpful)
    behavior with GNU ld there. Also place .{sym,str,shstr}tab for LLVM
    ld.
---
I would have wanted to make this generic (by putting it in
xen/Makefile), but the option cannot be added to LDFLAGS, or else
there'll be a flood of warnings with $(LD) -r. (Besides, adding to
LDFLAGS would mean use of the option on every linker pass rather than
just the last one.)

Retaining of .note in xen-syms is under question. Plus if we want to
retain all notes, the question is whether they wouldn't better go into
.init.rodata. But .note.gnu.build-id shouldn't move there, and when
notes are discontiguous all intermediate space will also be assigned to
the NOTE segment, thus making the contents useless for tools going just
by program headers.

Newer Clang may require yet more .debug_* to be added. I've only played
with versions 5 and 7 so far.

Unless we would finally drop all mentioning of Stabs sections, we may
want to extend to there what is done for Dwarf here (allowing the EFI
conditional around the section to also go away).

See also https://sourceware.org/pipermail/binutils/2022-March/119922.html.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -120,6 +120,8 @@ syms-warn-dup-y :=3D --warn-dup
 syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=3D
 syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) :=3D --error-dup
=20
+orphan-handling-$(call ld-option,--orphan-handling=3Dwarn) +=3D --orphan-h=
andling=3Dwarn
+
 $(TARGET): TMP =3D $(@D)/.$(@F).elf32
 $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET=
) \
@@ -146,7 +148,7 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(o
 		>$(@D)/.$(@F).1.S
 	$(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(@D)/.$(@F).1.o -o $@
+	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=3Dsysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
@@ -220,7 +222,7 @@ endif
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s=
.S
 	$(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
-	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -=
o $@
+	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_fil=
e_option) -o $@
 	$(NM) -pa --format=3Dsysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/=
$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -12,6 +12,13 @@
 #undef __XEN_VIRT_START
 #define __XEN_VIRT_START __image_base__
 #define DECL_SECTION(x) x :
+/*
+ * Use the NOLOAD directive, despite currently ignored by (at least) GNU l=
d
+ * for PE output, in order to record that we'd prefer these sections to no=
t
+ * be loaded into memory.
+ */
+#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
+#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
=20
 ENTRY(efi_start)
=20
@@ -19,6 +26,8 @@ ENTRY(efi_start)
=20
 #define FORMAT "elf64-x86-64"
 #define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
+#define DECL_DEBUG(x, a) #x 0 : { *(x) }
+#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
=20
 ENTRY(start_pa)
=20
@@ -179,6 +188,13 @@ SECTIONS
 #endif
 #endif
=20
+#ifndef EFI
+  /* Retain these just for the purpose of possible analysis tools. */
+  DECL_SECTION(.note) {
+       *(.note.*)
+  } PHDR(note) PHDR(text)
+#endif
+
   _erodata =3D .;
=20
   . =3D ALIGN(SECTION_ALIGN);
@@ -266,6 +282,32 @@ SECTIONS
        __ctors_end =3D .;
   } PHDR(text)
=20
+#ifndef EFI
+  /*
+   * With --orphan-sections=3Dwarn (or =3Derror) we need to handle certain=
 linker
+   * generated sections. These are all expected to be empty; respective
+   * ASSERT()s can be found towards the end of this file.
+   */
+  DECL_SECTION(.got) {
+       *(.got)
+  } PHDR(text)
+  DECL_SECTION(.got.plt) {
+       *(.got.plt)
+  } PHDR(text)
+  DECL_SECTION(.igot.plt) {
+       *(.igot.plt)
+  } PHDR(text)
+  DECL_SECTION(.iplt) {
+       *(.iplt)
+  } PHDR(text)
+  DECL_SECTION(.plt) {
+       *(.plt)
+  } PHDR(text)
+  DECL_SECTION(.rela) {
+       *(.rela.*)
+  } PHDR(text)
+#endif
+
   . =3D ALIGN(SECTION_ALIGN);
   __init_end =3D .;
   __2M_init_end =3D .;
@@ -320,71 +362,6 @@ SECTIONS
     *(.reloc)
     __base_relocs_end =3D .;
   }
-  /*
-   * Explicitly list debug section for the PE output so that they don't en=
d
-   * up at VA 0 which is below image base and thus invalid. Also use the
-   * NOLOAD directive, despite currently ignored by ld for PE output, in
-   * order to record that we'd prefer these sections to not be loaded into
-   * memory.
-   *
-   * Note that we're past _end here, so if these sections get loaded they'=
ll
-   * be discarded at runtime anyway.
-   */
-  .debug_abbrev ALIGN(1) (NOLOAD) : {
-     *(.debug_abbrev)
-  }
-  .debug_info ALIGN(1) (NOLOAD) : {
-    *(.debug_info)
-    *(.gnu.linkonce.wi.*)
-  }
-  .debug_types ALIGN(1) (NOLOAD) : {
-    *(.debug_types)
-  }
-  .debug_str ALIGN(1) (NOLOAD) : {
-    *(.debug_str)
-  }
-  .debug_line ALIGN(1) (NOLOAD) : {
-    *(.debug_line)
-    *(.debug_line.*)
-  }
-  .debug_line_str ALIGN(1) (NOLOAD) : {
-    *(.debug_line_str)
-  }
-  .debug_names ALIGN(4) (NOLOAD) : {
-    *(.debug_names)
-  }
-  .debug_frame ALIGN(4) (NOLOAD) : {
-    *(.debug_frame)
-  }
-  .debug_loc ALIGN(1) (NOLOAD) : {
-    *(.debug_loc)
-  }
-  .debug_loclists ALIGN(4) (NOLOAD) : {
-    *(.debug_loclists)
-  }
-  .debug_ranges ALIGN(8) (NOLOAD) : {
-    *(.debug_ranges)
-  }
-  .debug_rnglists ALIGN(4) (NOLOAD) : {
-    *(.debug_rnglists)
-  }
-  .debug_addr ALIGN(8) (NOLOAD) : {
-    *(.debug_addr)
-  }
-  .debug_aranges ALIGN(1) (NOLOAD) : {
-    *(.debug_aranges)
-  }
-  .debug_pubnames ALIGN(1) (NOLOAD) : {
-    *(.debug_pubnames)
-  }
-  .debug_pubtypes ALIGN(1) (NOLOAD) : {
-    *(.debug_pubtypes)
-  }
-  /* Trick the linker into setting the image size to no less than 16Mb. */
-  __image_end__ =3D .;
-  .pad ALIGN(__section_alignment__) : {
-    . =3D __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
-  }
 #elif defined(XEN_BUILD_EFI)
   /*
    * Due to the way EFI support is currently implemented, these two symbol=
s
@@ -399,6 +376,42 @@ SECTIONS
   efi =3D .;
 #endif
=20
+  /*
+   * Explicitly list debug sections, first of all to avoid these sections =
being
+   * viewed as "orphan" by the linker.
+   *
+   * For the PE output this is further necessary so that they don't end up=
 at
+   * VA 0, which is below image base and thus invalid. Note that we're pas=
t
+   * _end here, so if these sections get loaded they'll be discarded at ru=
ntime
+   * anyway.
+   */
+  DECL_DEBUG(.debug_abbrev, 1)
+  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1)
+  DECL_DEBUG(.debug_types, 1)
+  DECL_DEBUG(.debug_str, 1)
+  DECL_DEBUG2(.debug_line, .debug_line.*, 1)
+  DECL_DEBUG(.debug_line_str, 1)
+  DECL_DEBUG(.debug_names, 4)
+  DECL_DEBUG(.debug_frame, 4)
+  DECL_DEBUG(.debug_loc, 1)
+  DECL_DEBUG(.debug_loclists, 4)
+  DECL_DEBUG(.debug_macinfo, 1)
+  DECL_DEBUG(.debug_macro, 1)
+  DECL_DEBUG(.debug_ranges, 8)
+  DECL_DEBUG(.debug_rnglists, 4)
+  DECL_DEBUG(.debug_addr, 8)
+  DECL_DEBUG(.debug_aranges, 1)
+  DECL_DEBUG(.debug_pubnames, 1)
+  DECL_DEBUG(.debug_pubtypes, 1)
+
+#ifdef EFI
+  /* Trick the linker into setting the image size to no less than 16Mb. */
+  __image_end__ =3D .;
+  .pad ALIGN(__section_alignment__) : {
+    . =3D __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
+  }
+#endif
+
 #ifdef CONFIG_HYPERV_GUEST
   hv_hcall_page =3D ABSOLUTE(HV_HCALL_PAGE - XEN_VIRT_START + __XEN_VIRT_S=
TART);
 #endif
@@ -419,8 +432,7 @@ SECTIONS
 #ifdef EFI
        *(.comment)
        *(.comment.*)
-       *(.note.Xen)
-       *(.note.gnu.*)
+       *(.note.*)
 #endif
   }
=20
@@ -433,6 +445,13 @@ SECTIONS
   .stab.index 0 : { *(.stab.index) }
   .stab.indexstr 0 : { *(.stab.indexstr) }
   .comment 0 : { *(.comment) }
+  /*
+   * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look=
 to
+   * be benign to GNU ld, so we can have them here unconditionally.
+   */
+  .symtab 0 : { *(.symtab) }
+  .strtab 0 : { *(.strtab) }
+  .shstrtab 0 : { *(.shstrtab) }
 #endif
 }
=20
@@ -466,6 +485,15 @@ ASSERT(IS_ALIGNED(trampoline_end,   4),
 ASSERT(IS_ALIGNED(__bss_start,      8), "__bss_start misaligned")
 ASSERT(IS_ALIGNED(__bss_end,        8), "__bss_end misaligned")
=20
+#ifndef EFI
+ASSERT(!SIZEOF(.got),      ".got non-empty")
+ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
+ASSERT(!SIZEOF(.igot.plt), ".igot.plt non-empty")
+ASSERT(!SIZEOF(.iplt),     ".iplt non-empty")
+ASSERT(!SIZEOF(.plt),      ".plt non-empty")
+ASSERT(!SIZEOF(.rela),     "leftover relocations")
+#endif
+
 ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SPACE_=
MIN,
     "not enough room for trampoline and mbi data")
 ASSERT((wakeup_stack - wakeup_stack_start) >=3D WAKEUP_STACK_MIN,


