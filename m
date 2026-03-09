Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOQNA5y6rmnOIQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:18:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B172F238AB4
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249370.1546848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZYd-0001bx-A3; Mon, 09 Mar 2026 12:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249370.1546848; Mon, 09 Mar 2026 12:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZYd-0001Zo-5a; Mon, 09 Mar 2026 12:17:59 +0000
Received: by outflank-mailman (input) for mailman id 1249370;
 Mon, 09 Mar 2026 12:17:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akxf=BJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vzZYb-00016k-QY
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:17:57 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 006211b1-1bb2-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:17:55 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id D0090EC04DC;
 Mon,  9 Mar 2026 08:17:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Mon, 09 Mar 2026 08:17:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Mar 2026 08:17:53 -0400 (EDT)
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
X-Inumbo-ID: 006211b1-1bb2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1773058674; x=1773145074; bh=vxQTTI3dqC
	AbknZWRjEqDbjVPMeCodcJdMqbuNqpGws=; b=stkVUOnKviF3cZ0l4UHwr7x8TD
	iQxAuWDpin2T6RvJFpnaPTD5gwimiUMx0k+WR7+ruRUG/cnD+kNbkWrNPw6o8p5E
	nOTkm501LswWKF9AZmCC6mwEQIFaOTzuWdjscdi0stunYP3g6ytAFpGZ/K2eP9rX
	+MWqvvQHhYpOGzZC7lKrGp7kig9sjdMhlSq4DogKW8GXPfbjiu60om2aITYYuEmW
	3PzgHGQ8BpFb7NGaTTpXOTOZmq3Dc1m/ozSUk7mf9odJpqRIbeq40SgPoV9tG2zx
	LbNHIkwPgGoUgMZ7O7NRdZpy869uohejeJoSakkOT9WlpzUVtXritXmqKKCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773058674; x=
	1773145074; bh=vxQTTI3dqCAbknZWRjEqDbjVPMeCodcJdMqbuNqpGws=; b=u
	OhkoL1EE/l9xCqGN4gPTo4U3frn5K1lfoODCx0Tmxhodn43l1oYPT8iqiVSqwcHc
	9XArMpkDY9NXe6ZfhhV0oQvqG8P/Pa7uM3m7zyFOVbi7vWo00jsnsh0liH3d4YXR
	6PwC6S03/TPB020MFP18n1bHxe/Ip9Y/LjIW/1xmroOTzX13t7HBQgm7tO6IGsz8
	RFo93xsHiY5aKdC75/2PyQSuq4Hs0eJoznfce6CsAo3v4VwVaegtJvgHwWyd6/C0
	BoxOZQw3Y9AMBHr3ZZ80K6Y8aUGAKsNhrKQIuAd/chMqEzCqDjFli4bZX8gw43Uo
	o5HiaAUqTErTvi213XCXw==
X-ME-Sender: <xms:crquaUgmgfrIN2Ez7The3_b7rRECLV5viJz-OWFOHAsPQ6lXKuq5eQ>
    <xme:crquaXFcD76IiLie4ykPVLTgyf2mgC-v92TfnXkSwBsCnVrwdz5lqT1kpk-kXMeeI
    rgCQ82abf55ei5ZrTNG_ZHgBLQUuBpU1fnJu2HwWsPQUKZk9w>
X-ME-Received: <xmr:crquab89nmMMZObDq0oioqqyDA84_oeAQTY0pmuhjm4hxx6h-BUVufZ9q3Wu-BwRfeJq-tQiBy-Rt3zLtjj6x7tjgG1E58HayCFF-PYoiN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeektdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefguedu
    hefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeejpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohhumhihrghjhihothhishgrrh
    hkrghrvdefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhi
    shhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegrrhgusges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlihgrshdrrghprghlohguihhmrghsse
    hlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgvfhhisehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:crquaWzfVrJE7TBUMTIlk7LQ8eU9d-ttfS9MwAC2HDAaDEXT1aQyQw>
    <xmx:crquafPm1C4HDzrGo4AgEMchtP29i7dwl8cl-QJ4-zQT3GLyAgxvnQ>
    <xmx:crquaT_FEU8k6QiHto3nqw-5DnQphFph5LQ3gW0e4zcZtyrvw1znlg>
    <xmx:crquaU4kGkI3Bhps-FVElWi9T3EpFIt69mUzJKL7qUpm9jCWwbHCWg>
    <xmx:crquaaGHDGDXYDxMfWXPPvPa-f_AG1fXnBVEM-sExvj8kWFoOH4v53L8>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI))
Subject: [PATCH 2/2] efi: Enable BGRT loading under Xen
Date: Mon,  9 Mar 2026 13:17:23 +0100
Message-ID: <e5b932ab7558d82d5db018fd737da5ef2870aad4.1773058629.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
References: <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B172F238AB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,invisiblethingslab.com,kernel.org,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:linux-efi@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

The BGRT table can be parsed if EFI_PARAVIRT is enabled, even if
EFI_MEMMAP is not. Xen will take care of preserving the image even if
EfiBootServicesData memory is reclaimed already, or invalidate the table
if it didn't preserve it - in both cases accesing the table itself under
virt is safe. Also allow the ESRT to be in reclaimable memory, as that
is where future Xen versions will put it.
This is similar approach as was taken for ESRT table in 01de145dc7fb
"efi: Actually enable the ESRT under Xen".

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/firmware/efi/efi-bgrt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi-bgrt.c
index 6aafdb6..1da4515 100644
--- a/drivers/firmware/efi/efi-bgrt.c
+++ b/drivers/firmware/efi/efi-bgrt.c
@@ -29,11 +29,12 @@ void __init efi_bgrt_init(struct acpi_table_header *table)
 	void *image;
 	struct bmp_header bmp_header;
 	struct acpi_table_bgrt *bgrt = &bgrt_tab;
+	int mem_type;
 
 	if (acpi_disabled)
 		return;
 
-	if (!efi_enabled(EFI_MEMMAP))
+	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
 		return;
 
 	if (table->length < sizeof(bgrt_tab)) {
@@ -62,7 +63,9 @@ void __init efi_bgrt_init(struct acpi_table_header *table)
 		goto out;
 	}
 
-	if (efi_mem_type(bgrt->image_address) != EFI_BOOT_SERVICES_DATA) {
+	mem_type = efi_mem_type(bgrt->image_address);
+	if (mem_type != EFI_BOOT_SERVICES_DATA &&
+	    mem_type != EFI_ACPI_RECLAIM_MEMORY) {
 		pr_notice("Ignoring BGRT: invalid image address\n");
 		goto out;
 	}
-- 
git-series 0.9.1

