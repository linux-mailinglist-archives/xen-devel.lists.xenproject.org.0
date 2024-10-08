Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FA399594B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 23:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813637.1226638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHot-0008OR-WC; Tue, 08 Oct 2024 21:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813637.1226638; Tue, 08 Oct 2024 21:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHot-0008LG-T4; Tue, 08 Oct 2024 21:32:39 +0000
Received: by outflank-mailman (input) for mailman id 813637;
 Tue, 08 Oct 2024 21:32:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7aYj=RE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1syHos-0008LA-CT
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 21:32:38 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d569bb92-85bc-11ef-a0bd-8be0dac302b0;
 Tue, 08 Oct 2024 23:32:36 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id B3FF813802A5;
 Tue,  8 Oct 2024 17:32:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Tue, 08 Oct 2024 17:32:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 17:32:33 -0400 (EDT)
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
X-Inumbo-ID: d569bb92-85bc-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1728423154; x=1728509554; bh=cExzukkzxkZ0MlC75VQr8KanQPwdweR+
	oZAZw8RFEas=; b=UlR4tLt8z/VkxnD3i4vM5BIhs5S8n9bHRTt8aEogc07yTxa5
	zp0nOXajBVbd4IHbqprXgoeX1F91QoQ2ATqftfxTJtDmI0bxW5nvrKTfEviaoLY5
	QgqYtBnBS98z23/2yhtbx1xkytFqQL6pqhVnzBri/Gg/+XbRjkKjP6PljvxDwIDU
	J5zbw6HbLKFr9Ur5s4TkjUTKF/30g+x3Xoa4+sZHI5P6gjholW+FE6fxrJJUJ85h
	lLfCnnaLs7G4K4OfU41w2wIr0qhT6tRnXKPHgOgMyP6ry7u9z7LQDt35bqa6jlGN
	gNZ4GifScRIEbeRZTmvezuJCpjlV1ph0jgUu9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1728423154; x=1728509554; bh=cExzukkzxkZ0M
	lC75VQr8KanQPwdweR+oZAZw8RFEas=; b=G1LV/Xd/BYKtXpOA9i5p78ODU0Uvp
	xQMQR0H9+5bkr4Tb8vr6PGBaDKmPjgd+F/vUSI82ILoHPlz2vzzvxqrzZCWosaMD
	2Ke3y50YB8V+Ejuts3P6iGgqw94r+gr1/fY+CU0PI/XtIJfUdYpCBQ6LhOg3FOT4
	1DNQjTgy8D3ysBibE2JlPWiLkmgxTDFN+nVtgDBjGOaYuMO+FtNZiYbMd0yyzoIV
	HpwvuVCJApFAj3gSCQoXovxGzTpS5P6fgEk2XW2C1PmtMzyyEBluxq5Vng1pGwL6
	BIAROWy2v3KvocNUxllltqjFGipqVouW+uJHDl3Dmafe8y/0kDpCTK9VA==
X-ME-Sender: <xms:8qQFZ9GH6YJiKyRpqbNT09IVxPcYXRUeiwQ1ZBBoGu7InRpm9GalaQ>
    <xme:8qQFZyW2Fkj7FBM8oPDHecZ9JYbP6PEdtm1j8OiMqUncAFFVWKQGn-NlDlKLckjqE
    9kSojPQTOopFQ>
X-ME-Received: <xmr:8qQFZ_IjzRAozJ7LyjWu0yO9aSw0_5_7_rjd3BZgkJbwxtHGBvkKwpeS5feXYk_WYpZ1YR2rd1oLN_pkGsQcyKyshN13cakssWT7rasGPa9-ewXQVq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgudeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheelgfegkeelge
    ehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdq
    uggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphht
    thhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtoh
    epjhhgrhhoshhssehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:8qQFZzEmn7kNxn4UotMR6vodQR9dbp80XfGDDzXNvAkgh5ICeCnQZg>
    <xmx:8qQFZzUNg_Ri1CrF1uFsvy-vDD4vBEEVLSNTscnjwBBlwCK97XU-ew>
    <xmx:8qQFZ-PZbH22GEweLIIqqRMQXlWx7zHxXlHWyoUdpeOnlBCi4COWTA>
    <xmx:8qQFZy1J_FxbtT1pnN4N07ICIpoL7gMUv5gwSvGNzPm7ttjLpkqTXQ>
    <xmx:8qQFZ-R40ybDwKupunxk1z7v55h1D1tAQC5FQY_URodzhY9zobUbY0Fe>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the kernel
Date: Tue,  8 Oct 2024 23:32:23 +0200
Message-ID: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux 6.12-rc2 fails to decompress with the current 128MiB, contrary to
the code comment. It results in a failure like this:

    domainbuilder: detail: xc_dom_kernel_file: filename="/var/lib/qubes/vm-kernels/6.12-rc2-1.1.fc37/vmlinuz"
    domainbuilder: detail: xc_dom_malloc_filemap    : 12104 kB
    domainbuilder: detail: xc_dom_module_file: filename="/var/lib/qubes/vm-kernels/6.12-rc2-1.1.fc37/initramfs"
    domainbuilder: detail: xc_dom_malloc_filemap    : 7711 kB
    domainbuilder: detail: xc_dom_boot_xen_init: ver 4.19, caps xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
    domainbuilder: detail: xc_dom_parse_image: called
    domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader ...
    domainbuilder: detail: loader probe failed
    domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ...
    domainbuilder: detail: loader probe failed
    domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ...
    domainbuilder: detail: _xc_try_lzma_decode: XZ decompression error: Memory usage limit reached
    xc: error: panic: xg_dom_bzimageloader.c:761: xc_dom_probe_bzimage_kernel unable to XZ decompress kernel: Invalid kernel
    domainbuilder: detail: loader probe failed
    domainbuilder: detail: xc_dom_find_loader: trying ELF-generic loader ...
    domainbuilder: detail: loader probe failed
    xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: Invalid kernel
    libxl: error: libxl_dom.c:566:libxl__build_dom: xc_dom_parse_image failed

The important part: XZ decompression error: Memory usage limit reached

This looks to be related to the following change in Linux:
8653c909922743bceb4800e5cc26087208c9e0e6 ("xz: use 128 MiB dictionary and force single-threaded mode")

Fix this by increasing the block size to 256MiB. And remove the
misleading comment (from lack of better ideas).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/guest/xg_dom_bzimageloader.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_dom_bzimageloader.c b/tools/libs/guest/xg_dom_bzimageloader.c
index c6ee6d83e7c6..1fb4e5a1f728 100644
--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -272,8 +272,7 @@ static int _xc_try_lzma_decode(
     return retval;
 }
 
-/* 128 Mb is the minimum size (half-way) documented to work for all inputs. */
-#define LZMA_BLOCK_SIZE (128*1024*1024)
+#define LZMA_BLOCK_SIZE (256*1024*1024)
 
 static int xc_try_xz_decode(
     struct xc_dom_image *dom, void **blob, size_t *size)
-- 
2.46.0


