Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEBE771D43
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577935.905063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwip-0002Kz-Bh; Mon, 07 Aug 2023 09:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577935.905063; Mon, 07 Aug 2023 09:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwip-0002Ir-94; Mon, 07 Aug 2023 09:40:19 +0000
Received: by outflank-mailman (input) for mailman id 577935;
 Mon, 07 Aug 2023 09:40:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSwin-0002Ij-GS
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:40:17 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 679d72dc-3506-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 11:40:15 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 431FF3200583;
 Mon,  7 Aug 2023 05:40:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Aug 2023 05:40:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 05:40:07 -0400 (EDT)
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
X-Inumbo-ID: 679d72dc-3506-11ee-b27d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691401209; x=1691487609; bh=CQofn4kIIMGyS3oRnZGe7L+ew6Ute4sCDJJ
	Fql2/Wzo=; b=VoQvsoUsTgoYMIcsh1iIBzf9FfYI7JymX5ew1jXBGtJGRkgzp8+
	BzR5ji4sK+cscLabQPEW9W0Bfzsoa8f8TRAExLhnHA0L6z1UCKDhOIl/Xg206cAK
	afofzpilWyFdoDcdaz6XIhLgsDiGH+8icS2uSeehCGgl3y6DN1PQGRhAeGiIGkhH
	N6A4I4cz1e6ScUrXS81ZA+Z48a3AEs9F8ZoXpBs8kZVhiBAk3wm9Kq77pTM2gejm
	0kptXcV+GWxqqJ3efFihK17LeHIfSGHpKPM3rYQ0DSqMXOR+xMajLSvhlg5mPRDD
	J5Nlu9lyjhsi20U1+7MLo1YrLFbuLUEW33Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691401209; x=1691487609; bh=CQofn4kIIMGyS
	3oRnZGe7L+ew6Ute4sCDJJFql2/Wzo=; b=bLP2urWte1cys9qMwAxSC/kFcKFAV
	NlwqlsP+9BROhFDF+k4ZTxEXmrv8GiQma3zZCD9BGraox8+yJ0svJeE8B1NN2J/c
	jgIIyEgEZZAtnNITJgPgoFLwshGQj1Esjf0MzC2UrjjIX+InbS3pv1EpCUESEQQg
	PZ7z8fj2U2iYxdL5P0XJ9aC6LD2rTFj1WlsyjSKI6EIeJfTF3i3LxJorWTJGUsfV
	rx7kGSclO964m0LEFLve+bAfRDK87vGyWjtMiC8YpsAUjXQVsuxpwdo/7joWT7s7
	niK7WnWsFoNgiN35JvU8iYgKVr6jLuEXH3PRol4vz1n6JHfPnXqEZt0Bw==
X-ME-Sender: <xms:-bvQZPKPao04tQiQ95OhYgJQdJpX_V8EmVOOhZ2VLNZd6VJBxzQhmQ>
    <xme:-bvQZDLSwMqqPzuHBqa3C5osSMEfr4qiC-ghc1NkhYG79hC6fUxBAct2Dc7I6oABl
    jbHp_OPUyJrYSU>
X-ME-Received: <xmr:-bvQZHvDaqpwxC8bxqZyET2gkOpv8OcSKH-EzIHKbu50_-MT77l2N_r8_-_9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepueevheegtdefgeefuddvfeduueduffffffejveeugeef
    udefiedugedugeevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:-bvQZIYpXZ8IND_tayfTvOQ40EFGs724YiV_7IQHXZ5M4t2E_ch8EQ>
    <xmx:-bvQZGbWxEX2QwMz6wLyewJZ3y3SZsvUrJsVNgpMtmEKcCpZqahnNg>
    <xmx:-bvQZMCJXSjIPXqhjM9h_daz19s9g1Hq4Tmz2GbgON8nhxa4mVlSBQ>
    <xmx:-bvQZNXJLeBi12si7ffSybkG7jMv5W43edqNDKNGUAlEaUGyIBMlpA>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when parsing MADT
Date: Mon,  7 Aug 2023 11:38:25 +0200
Message-Id: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems some firmwares put dummy entries in the ACPI MADT table for non
existing processors. On my NUC11TNHi5 those have the invalid APIC ID
0xff. Linux already has code to handle those cases both in
acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
same check to Xen.

Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
entries with a valid APIC ID. Linux would still ignore those because
they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
this check is only active for madt_revision >= 5. But since this version
check seems to be intentionally I leave that alone.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---
 xen/arch/x86/acpi/boot.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 54b72d716b..4a62822fa9 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
 	if (BAD_MADT_ENTRY(processor, end))
 		return -EINVAL;
 
+	/* Ignore entries with invalid apicid */
+	if (processor->local_apic_id == 0xffffffff)
+		return 0;
+
 	/* Don't register processors that cannot be onlined. */
 	if (madt_revision >= 5 &&
 	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
 	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
 		return 0;
 
-	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
-	    processor->local_apic_id != 0xffffffff || opt_cpu_info) {
+	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info) {
 		acpi_table_print_madt_entry(header);
 		log = true;
 	}
@@ -143,14 +146,17 @@ acpi_parse_lapic(struct acpi_subtable_header * header, const unsigned long end)
 	if (BAD_MADT_ENTRY(processor, end))
 		return -EINVAL;
 
+	/* Ignore entries with invalid apicid */
+	if (processor->id == 0xff)
+		return 0;
+
 	/* Don't register processors that cannot be onlined. */
 	if (madt_revision >= 5 &&
 	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
 	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
 		return 0;
 
-	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
-	    processor->id != 0xff || opt_cpu_info)
+	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info)
 		acpi_table_print_madt_entry(header);
 
 	/* Record local apic id only when enabled */
-- 
2.40.1


