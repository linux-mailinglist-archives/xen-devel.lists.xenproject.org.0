Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D54CA7D4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282267.480911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPpR-0007E1-7C; Wed, 02 Mar 2022 14:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282267.480911; Wed, 02 Mar 2022 14:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPpR-0007BB-3z; Wed, 02 Mar 2022 14:19:45 +0000
Received: by outflank-mailman (input) for mailman id 282267;
 Wed, 02 Mar 2022 14:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPPpO-0007Az-SN
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:19:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc37cc6f-9a33-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 15:19:40 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-oPQJonF3NW-Iuaxebzt89Q-1; Wed, 02 Mar 2022 15:19:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 14:19:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 14:19:36 +0000
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
X-Inumbo-ID: cc37cc6f-9a33-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646230780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kelBkq07elBsYoool1T4WiBB6X/D8ea/mBgL1h/Su9k=;
	b=g3g/zGhVgO9rYDhyDS6UbOIHkDULNetPcO9cwYgPrklHljO/Oke24LXvSB+EPlvlIn8Bgv
	xqBMTq8eWqxbCjA4+PBH5TiWZH8znoa6r8ZC6V5l0DQPFzDNwgokNdVaxv+vX1M+zaZoMq
	COZUTibnPXPSVMff7GyAQN+lL4ACm30=
X-MC-Unique: oPQJonF3NW-Iuaxebzt89Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9wzWLkUF+zHlg2L8XHA86sUirSPvl1VYHJfFn18ivZ3XgOJnON0Axk5VZJeiwkQOWNuBWYHfZtwhn33xrptTr+QSgcaxefWrocvox0RHnKqQHrKempjmFxAX4gNrf+jjNn14CgV8vNe+3JgLdwMSanygCA908eyYgZSzd4sId+0IzqnLQJPa8t068xbyljnc6Iw3sSzGesPSl67oCMJ0b3Lhj6mfYhMvmL2QvxuIYDRqzhiOawH/X19/u5YQOqOMVaIckLZTJT2WEoKNSjtYCpEL5XCAyuoUY3f5bG/oXjlCSxs7zZzsBdEk0sxsnYu57fHn1mjq7CAovLd3iIF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chofcp21Zt4lwYIAQLwleWr03SoVKieQ1Dr41FdW3rY=;
 b=IRKPwUcHuzm9MfLJ7PCXlGsjqxT8jGAxmycoexCaGxaSQkMPGu5Ge4PgQIZOIAAtnbEC8CmxkLnI3C0TunpeirsT3blcnD5ZSCRKkpXagsQLY4bl6hXOpQn7D99jyHHaBhjwXzX/hTZI9R2+UphgKhcr+CKdHKGm0hThBA8DAYWU6X2TW8a5co2FSDX/suBoKvYzlUWgMdiB7krXBh8XVjqGQsHOQ2e7Hd1A5Cq4t2opYEao6Ns3SoHo7h+VVLxZHIyQtVi2JFdfu7OpDToIjKlY+5fLZXXqOWgxAM6vgnU2vB274NyefiYOz9Ny3K5TIlRf07njkR224LaIkwMvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
Date: Wed, 2 Mar 2022 15:19:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/build: use --orphan-handling linker option if available
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a84bb868-6893-4d55-c649-08d9fc57ae34
X-MS-TrafficTypeDiagnostic: DBAPR04MB7317:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB731719CFBE0A01A0845F3FC1B3039@DBAPR04MB7317.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WkglUsYHAj4shxRskNVC68KxLB8Ge3qgW2pAPUXabVgsY8skjQTdrS8HyLujEv3QEBfFcKhSbqeSBulLIe00dy4VFlCKubAZEBjUX3DpH+KjaC3/lEozwV7Uj1lOX7SgFioCQiMGMsxxboFi9uGKh95TAlLz+Kzry6kthYsy1f1n5KwfYuhM/tUZKqM3HHZup9LUnkDcz5D1y+Dx4EOOHVUDoluCW/n4F6RqOu/RQf1TsxKcKidOroDDahcrNrIqFrEHY6+XsK7w8uaV9hzwJMftQ8PEzdE/twZ/DbTYqcwmbkLHOwSCyUDHHujdqE5qlZkDtB65xad0ybir7pXKcpd0+yDMOQuABLT83lSeyTt84tQKZkNxZsA7shXpcdGiwmaKBX8SLLLxmh8y9WVq2cq90houG4uFeh5Pcld6d6EinBShfZ9k2EqPgibb6niWVji9lOD6GBTGTTNB5n+L0bkSiHXKZIlt6YB6AriNJjRHGRPOh62R2TSDtH2SCm9PZDnn9CayqKMwkcR8rbZmUqa11Y2wFXKFDXIbNlAi2tlq65z6VcgtvuSQK/tk83ObyBtp1Ggsvt79+Z7fOAyy88E9+MRu/TxNYiNatAEx+3Ps5LslysfI+PwprjLh+4jgYmMbF68b4cyFJRQ/d2v4vGc+dWJPcsC3R5EHI5TVyvztS/6ZyCyDxhvp1lmv6/7NlurlZGI+XFZ6Tfzc89NRQAksdCntEUsgiOIyhIJdUbByvyAxV6Pu7RdlE8/ibRCLPEVaxJgPtbVmysKC+mRIbtavh6BTy60aIV0j+1LBDY/0LMryS+m21nmu+SgfQSJJEdKsE+zkiubV9qOmYestUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(54906003)(8676002)(66476007)(66946007)(316002)(2616005)(966005)(66556008)(8936002)(31696002)(508600001)(4326008)(31686004)(6486002)(2906002)(6506007)(5660300002)(6916009)(38100700002)(6512007)(83380400001)(86362001)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?To4REdV5EGtXAKvVaymZ05dRjeDyJNpM2BIpoi/0G+6aAzC1TwKNx5TuH7sg?=
 =?us-ascii?Q?9XH5C9p7Qf8CtuKIBQPdcMyqC1jEpbvf+0Jv2sxTba2DSdSel0TnKA7xJ9i1?=
 =?us-ascii?Q?Se82wnf+jPYx/AVK3DTmJG5cU7ztiYEuJYVPZXMOi4j5NIPzIHu4Fpn7wDss?=
 =?us-ascii?Q?GJLP4FR84MZOyTmHOIHyrI4DzWk4bRGQJKxPLmmL5Oabwr7ZP06APy7CPraH?=
 =?us-ascii?Q?1xrwt4BfeQmQXLc01VlFSUS0DTTnQWbz7Wx+Nt9qjqQc2EMXPuhzi+Kv1oBo?=
 =?us-ascii?Q?oZUn172SsbZOqIUFwU9Q2Z8x3WHgICyy1j4WqyWP5BPAP/WHNoPj7F3u7c41?=
 =?us-ascii?Q?KbV6y0BqR8CT+Eul0TtgHzPFokn+dYZwFDQ2rgyn6KAvzD3Y87PZFmOgXcYb?=
 =?us-ascii?Q?QMiw5ksWmsX4+72lgI1lLdaDSb71Nh8k2lGkY6/qMCOy1goRy+lTiZrRC7hI?=
 =?us-ascii?Q?aoFi5ncJyMyaVFsirNuDWNdQ1I/VEjP9+6KGPhBMD51OaOldZeuQImboFFwK?=
 =?us-ascii?Q?qzYoWBJzLrvhVQ/YSZshIgHcm1OQep4NE2J3T8AYalfQ4Nsy7goWSg+SYbJ7?=
 =?us-ascii?Q?6e5QPDWMxevrmhk0G3XQmQ2Q0H8HnZpcaQk+jaDQHIAQfMmzXTkm12hi8F8z?=
 =?us-ascii?Q?cIX2tOiAMuhSLLpFDXG1puZpSrAf0T+gjMYpboZPw4TrqA7kletYMR0cV83r?=
 =?us-ascii?Q?3131H0UQkfZ8iL4hZc9qNcCrgM+BAJDj4Uxl8zNaG2Z/oIIFGxVIBGu+AS9i?=
 =?us-ascii?Q?940BgfWIWp/Xe8zVQu76pwrxyT+0nW3mbRri/xQXvHUWAZaSbS4nVHo1DADR?=
 =?us-ascii?Q?uzn9KXvqq1nmAwt4aGUhT5nmMs9trE9Gw0xYEqDbUvlM+Ddwe3Dwgkf/Ez5e?=
 =?us-ascii?Q?tAL/rQ0SyAFHrre0TV/+KlN/Z1hkkG0wkYIHEiPZ41VP2oX/t1RVaO2vLjeF?=
 =?us-ascii?Q?iZF3oBqdBgSpPyotefi9uqMMfDZGZW8YLUXC6UcQTuyX9tUxSkuNe0PsslA/?=
 =?us-ascii?Q?9quw3SzH+w/ZzUIVlcl7jLyOI6U4y4IUk1pN1zPTRUpfBcI3xS7uS6Hjym5y?=
 =?us-ascii?Q?rZaywNHi7ogoGLXvdrD0BuLlYySGxh95fhpTBzWjZggEJhOSfqDPx1aOS3/D?=
 =?us-ascii?Q?HJaQgKRjxdIxdHcFw9Nm8z7Uw42+hPa+AsA0vDY98Jf9yX2WiYclPN29q1Ht?=
 =?us-ascii?Q?schwLo321o93nd8j1QHej49XfTND8NQPsykSbT7XQBk/+WS9LCQhQky/+PYc?=
 =?us-ascii?Q?JaKrdq6nnWLQRUnPTR+75oJnlCJbqrLgsZerVCq+bVfkaLOJEhvmcbOkvTeW?=
 =?us-ascii?Q?e8h73UnEajRWfzI1SiA+gAdbWcZWewjzSC0RaFqP3CQrzxIb4FXXs+NYwIww?=
 =?us-ascii?Q?DeeNn3Ir6Xp1k6GqrNXk+pfoYOpXxUrhNKxILMOPNYEtGsTaspBTAT0wHLOb?=
 =?us-ascii?Q?p8E8rWMGRGPtltM1UDqrtpdjTxbRK7EXt3Z37sg7FfRWZqLru10jdwynAdvy?=
 =?us-ascii?Q?6NSJyL1dKAsIa0x1ePOm2gZIwGKrhF+4IlU5nIw/yilQQCnSj4zyQ08CEwse?=
 =?us-ascii?Q?Vky/GQFnC5Z7djGE/7z9GfZ0w0k8WPihznNu4zws3bmv3rbPe/bPsrFz+dxy?=
 =?us-ascii?Q?MPFvs9JQ7DVWl0U/5iFnlh8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84bb868-6893-4d55-c649-08d9fc57ae34
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:19:36.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nzK4bHKYmd1cqt/6d0NEKq5BfZrLEJJu+E5O1c4KExPcZ9M1i6VbTJcyzhechZ3SAmSIKW9mO/SLmkLJr5Ygg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317

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
@@ -12,6 +12,12 @@
 #undef __XEN_VIRT_START
 #define __XEN_VIRT_START __image_base__
 #define DECL_SECTION(x) x :
+/*
+ * Use the NOLOAD directive, despite currently ignored by ld for PE output=
, in
+ * order to record that we'd prefer these sections to not be loaded into m=
emory.
+ */
+#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
+#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
=20
 ENTRY(efi_start)
=20
@@ -19,6 +25,8 @@ ENTRY(efi_start)
=20
 #define FORMAT "elf64-x86-64"
 #define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
+#define DECL_DEBUG(x, a) #x 0 (NOLOAD) : { *(x) }
+#define DECL_DEBUG2(x, y, a) #x 0 (NOLOAD) : { *(x) *(y) }
=20
 ENTRY(start_pa)
=20
@@ -179,6 +187,13 @@ SECTIONS
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
@@ -266,6 +281,32 @@ SECTIONS
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
@@ -321,71 +362,6 @@ SECTIONS
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
@@ -400,6 +376,42 @@ SECTIONS
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
@@ -418,8 +430,7 @@ SECTIONS
 #ifdef EFI
        *(.comment)
        *(.comment.*)
-       *(.note.Xen)
-       *(.note.gnu.*)
+       *(.note.*)
 #endif
   }
=20
@@ -465,6 +476,15 @@ ASSERT(IS_ALIGNED(trampoline_end,   4),
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


