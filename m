Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33564D61AB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 13:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289021.490303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSeWx-0001YS-7c; Fri, 11 Mar 2022 12:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289021.490303; Fri, 11 Mar 2022 12:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSeWx-0001VS-40; Fri, 11 Mar 2022 12:38:03 +0000
Received: by outflank-mailman (input) for mailman id 289021;
 Fri, 11 Mar 2022 12:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSeWv-0001VM-Iv
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 12:38:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15d53f51-a138-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 13:38:00 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-pNi0s382NuK90YUykX2Sjw-1; Fri, 11 Mar 2022 13:37:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 12:37:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 12:37:56 +0000
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
X-Inumbo-ID: 15d53f51-a138-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647002279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lzNu+bRrUNWSJ/j3o3FwQ3DbRXe2DBMKx3ah6WH7m+I=;
	b=QKrt1p0ayymisGaKAqXVCgvCKcQG8EIBAwTRSLCNkBVvMbHua1EkIpMu+GpypOKDs+iTV+
	pbghl3mI3b5rBeVhTgareFvPmsOGFRfalg+qSwAhy2k8iw7GPaU2sEusdS7GppLYkSVxr9
	XahzbF592WzceoZliXsUNcNz1Lqwb1I=
X-MC-Unique: pNi0s382NuK90YUykX2Sjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePIlFrKfa0KkJ7NsVu8zlu/E87h3pvNct/moFJtmYpRrnqcipbKqTkMnicz2gwD7xbuauwCSWcRtqm4o+P5HFO0E7s3LgLIK2xQXER97gutajN0uVGuft6U6bdFexwz6Uc74fkfswN1lHNxywtwB6kQhAWD0Yg5MfM8ibF3UOuxtOq1+yL+sVKV2FtoEeyNwf0pkiQMrurKQ3+UCM4kQoiAQfFeC26gJRnXkDypbHpwosVVbCbVNxrcbMJSxijdDaJ9PoxwQb/Rj5ThXP/p5pGGT5AloevYnlYl+7nH5qFOa1QCsVj0iDWBAEtl6gBR+CK3jeYJ/LHqHnPchumaI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osJgQ04+5b1DULiWJsGepETs843ARAuaf1ZfKY+1yj0=;
 b=AEJJM/ifOIe6aABc/t2wae+RqtGgCIPDImmFqKEdyg4Sq7KkzCc0DtdF0AvNDT7i2pR0LVgnpep5pOGje+W2V+Zy0acuGhu7HjMHw7bgKrqYSGTXRRwKraDkTD56sRP2mcv7Ta1UZiYd9ZnA9cMtWVVqYQDJaap9iuY8QvPur7jKgxtqXguvLyCNZyV5r4osm4dE+ZeTJZiCksQx8SslhiyHOTndQLcJCjrrFDrkCY8nkUnb3rzZPg4OcnV22yBk1ehMhzSLt3YBOurbo7aBCas1M8GG7s94+SPo6Osp504oZqcx5y8X+Ey+YNmVUhBjtxT3g+ZTKCF3LV0MycAfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44a6db86-e49c-b820-b397-09769c198959@suse.com>
Date: Fri, 11 Mar 2022 13:37:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/build: use --orphan-handling linker option if
 available
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0046.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a2424ad-790e-4920-9962-08da035bf7fa
X-MS-TrafficTypeDiagnostic: AM9PR04MB7540:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB75400DE1750E02582CE3112FB30C9@AM9PR04MB7540.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vbuprfmecM9rpVBc6WNlaf8lxma3+xBrvf2FUPtN/k5+f1knGjgwzsoqbnaUR5TcoZIdXCfvro1s0DQMaXTn47SqGqHmhQZcyuJyB1f1FILvHWPc20Oc1BuPct9kh7IcUIvc4pp8qOq5yDbzaZDHa9et+kNkUtumzYMbc9OxuX7d6u/qb5nL+Xrl8nEkfL5I9Zm1d3dyKXqXipIBwmUhKCav8JadytQk4+s1yasUjI+FUNmOp2yFg3n7vN8jsdqJp63xUAfYrQwr8YH+bdeGsRUAUPqZ+l1ImJ39P0fXlP4mALFuHkU5LU87P8f5ElIM5X0YPWDQe0CbUVjF+/Ztjx+CDT21Fz2kEVghmD6czz+h1v+yU6lqDbLTstUwri8PeWorid0TnhFfoPmqVx4l3pR+R34j66QVH+UJYRnj4kcK5X45njLMpLn5g1/gxeCzQfaZ0n1/02hplCjfViaMpJjr7Pf/V7R+8tdN1u3KHv6z03J+3Uy2QVytGUYN8JsoTRupplL43x8zz/zf73BLiioUjvtZ8Z1fxeltERP+LyT3Zwdbk06RALDudhiT7JipQpyqqYQDhl0LwsqQ0YyvZMaBu4hbP3RsjifdQLU6e998efQ5zaYMTqqguahUX5i+lL6M5UlIU8N5zzOheMDfUKQlNC6NQqptZpsY0dwwMw6FIoCL+uxdxwBiBAPKMRUAgKxozmPmhWVTtZbau25TDzYcpkYes3YaXTnllbUtA6+TV8JYSgiKFYCxETgMmAtUM1iPtMd3T9FF4F7eTYu8y99AZ04Hy8swI+5zOO3nAjomH7UBdpv26CJ5m02VNho9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(54906003)(6916009)(66946007)(31696002)(6506007)(316002)(83380400001)(66476007)(38100700002)(66556008)(84970400001)(4326008)(8676002)(6512007)(2906002)(30864003)(36756003)(2616005)(31686004)(6486002)(5660300002)(26005)(966005)(8936002)(186003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6glTOF5VbtJVHiwpiw5cVl6lxsODVg6mJu6M1hBlRs96Uq69HWAFwR0U8WfY?=
 =?us-ascii?Q?w5al2Dhvgp3QHytzRrsx/tmmjDFRXbKgM9XuiAjFTPgUaFDkyxmGzaPf88yF?=
 =?us-ascii?Q?5Bfb/F0+icImlwxtI3yabMPb0S0hA6s7qPbtUP3gggqdnz5sKf4G41XfpIvH?=
 =?us-ascii?Q?10Ih+e9/+UTsQ6s+sr+HgzpTu49+Hif8GFNWNmmu77NlojygG2gW9xRBW4FS?=
 =?us-ascii?Q?v29AEP/kO9ak4w2N5g+5LVdwj7CY1fILi2rwpEx/7pD+Hen0srwj5rfdTZoc?=
 =?us-ascii?Q?4yYJQnIQUG/ZfMpqgc63iDBfw0KL957jqjGoF2EAz7xO05GEpS6cZTR9O2ig?=
 =?us-ascii?Q?xo0HjSz9SoBuh5/tLcyWM7FLnH6K0YP6NXJY8VgRjfL2haU4p7BI4QrNejpr?=
 =?us-ascii?Q?SaErLOcIdRP/8a36sUtFhdJo2fSgqE6Ra23R9AwWzTbSnNeMQ/qirWQXT52y?=
 =?us-ascii?Q?AUWtfvPux1VRV1LcVk2owzsJhmXUIcxcn69pU7hRypMZrIzORCN+apkWAplE?=
 =?us-ascii?Q?PSZmjDk7igIsv2BVW/jWt8v77Ig3aD7OfO+p23kZJuS9PvlXV6kL7B0kDQ+Z?=
 =?us-ascii?Q?EfCU+E7yUj+9DQMAXHjsTfaPNdv/bOwb7Jv9vit+CTVwkBZEAg5nHBFNwP66?=
 =?us-ascii?Q?q+e8wXxPQW/PslbRw1Dffgkgme4vr/77V/IYibrxRyrNG3BkI/uygvv3LUsh?=
 =?us-ascii?Q?j216zIX7VouYK71B3cuXmehwSEd8AYISD/IrJ1dUkImCBCHKcxVRSSMRqRZO?=
 =?us-ascii?Q?PzhhucBUTwKx68x23bBX4tSr1oDLPYz0YN9rVOHa24f1a9prUQ/hEOKOOKH9?=
 =?us-ascii?Q?JuZJLxd3xPJsPEQIIp8/OhWR4Rcp4pl1Hyf668w8DrHfqlZApCMF4frSMy+i?=
 =?us-ascii?Q?d5o0GtHw1TDrgKTFuC5/5Fq76W4qW2UgmrU43d4we6N+s4iipjVG5DTysf36?=
 =?us-ascii?Q?jdp30ADt87Iaj08BUahSEnsxZc6z5WEkam6u0Je8ZtL2ceunVOLgjaQ+m2e4?=
 =?us-ascii?Q?xuz2fF0yQkLPGqauRFc6J+wfVQmNC/ylNlMPDAczGCgU3NLaSPXg3hv01+/5?=
 =?us-ascii?Q?E1lFKwEzHyl29vfZVgFEYAZn5si8YrKJMqA6pqTh0F+r+LE6AEeW+mRUcuMf?=
 =?us-ascii?Q?WbQ2sVjKoLbrhyo80p5tSC1ifnnvIy+IkqSR7R8RqvE6vZ2wHMpK78ORdunE?=
 =?us-ascii?Q?ayilgQFY/4yx2VW3CLD3BWMz/MbOZXqG9YvoEjnV2buM8x5vjDT+UN1pzcjZ?=
 =?us-ascii?Q?y8WKBtBqNqpOiADZrCyV6FyWXxOKTPgFJxTp/tbbIbfzA5chfuuLijiIzlIS?=
 =?us-ascii?Q?zYKh3cawiPMvTMPNX9jPfJHwkaov7eh5NfX2SEw7cQF0BAmi1RnserNfpQFt?=
 =?us-ascii?Q?GYH2yQwMKsh8BvOZuxxyqiKMpLjlUpWcK/JjbIEBu0z+W8h74cu+hYROysCN?=
 =?us-ascii?Q?XlvKIPMEeWfXtSoP0hrrJ0osZ0imeMOJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2424ad-790e-4920-9962-08da035bf7fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 12:37:56.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ufMzJFvN3ZR2vKumr2XBoDk6GPNx53z/ouZQ4BhDRzfABeuz3A8+A+Akca4sBfaSvtk/D4IWEJpr9b6ONcJvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540

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
v3: Extend a comment. Add comment ahead of .note.Xen.
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
@@ -119,6 +119,8 @@ syms-warn-dup-y :=3D --warn-dup
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
@@ -145,7 +147,7 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(o
 		>$(@D)/.$(@F).1.S
 	$(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(@D)/.$(@F).1.o -o $@
+	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=3Dsysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
@@ -219,7 +221,7 @@ endif
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
--- unstable.orig/xen/arch/x86/xen.lds.S	2022-03-04 08:31:54.000000000 +010=
0
+++ unstable/xen/arch/x86/xen.lds.S	2022-03-11 13:34:39.006859853 +0100
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
@@ -158,6 +167,10 @@ SECTIONS
   } PHDR(text)
=20
 #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
+  /*
+   * In principle this should be fine to live in .note (below), but let's =
keep
+   * it separate in case anyone decided to find these notes by section nam=
e.
+   */
   DECL_SECTION(.note.Xen) {
       *(.note.Xen)
   } PHDR(note) PHDR(text)
@@ -185,6 +198,13 @@ SECTIONS
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
@@ -272,6 +292,34 @@ SECTIONS
        __ctors_end =3D .;
   } PHDR(text)
=20
+#ifndef EFI
+  /*
+   * With --orphan-sections=3Dwarn (or =3Derror) we need to handle certain=
 linker
+   * generated sections.  These are all expected to be empty; respective
+   * ASSERT()s can be found towards the end of this file.  Put them in the
+   * text program header, just to be on the safe side against e.g. a linke=
r
+   * otherwise chosing to put them in a separate one.
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
@@ -324,71 +372,6 @@ SECTIONS
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
@@ -403,6 +386,42 @@ SECTIONS
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
+   * VA 0, which is below image base and thus invalid.  Note that we're pa=
st
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
@@ -423,8 +442,7 @@ SECTIONS
 #ifdef EFI
        *(.comment)
        *(.comment.*)
-       *(.note.Xen)
-       *(.note.gnu.*)
+       *(.note.*)
 #endif
   }
=20
@@ -437,6 +455,13 @@ SECTIONS
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
@@ -470,6 +495,15 @@ ASSERT(IS_ALIGNED(trampoline_end,   4),
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


