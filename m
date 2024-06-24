Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482DA914693
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746453.1153503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLgCV-0001u7-9b; Mon, 24 Jun 2024 09:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746453.1153503; Mon, 24 Jun 2024 09:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLgCV-0001sM-6s; Mon, 24 Jun 2024 09:41:27 +0000
Received: by outflank-mailman (input) for mailman id 746453;
 Mon, 24 Jun 2024 09:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHjb=N2=bounce.vates.tech=bounce-md_30504962.66793f40.v1-0dde5e73b97d4d4db679376060d06ffd@srs-se1.protection.inumbo.net>)
 id 1sLgCU-0001sG-2x
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:41:26 +0000
Received: from mail134-3.atl141.mandrillapp.com
 (mail134-3.atl141.mandrillapp.com [198.2.134.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea694ffe-320d-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 11:41:22 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-3.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4W72z52TjyzDRHxYM
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 09:41:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0dde5e73b97d4d4db679376060d06ffd; Mon, 24 Jun 2024 09:41:20 +0000
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
X-Inumbo-ID: ea694ffe-320d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719222081; x=1719482581;
	bh=nlkz8I0Q2XBmCtG1ce2j8BZifoX2kJRy/Jkn45yr+Zc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=OIPLIzaLzt7XCGsdeQrd3/gtaiR2sJUyENl8j6kKxBl3Fcxxn0wkYIDoz4REuvq5Y
	 Or/T0WNZYKsf4Wqr6+xmhzgnv+xDakiM7bW1tV5EC13JncUKM+z+e/9G1YdSDzMQ1M
	 7NoRi4WIYWz7Z39STc94VgFyYrZgKksKP8Y5ejqaSbOF2QMAY8O9/HKEm/PkMF6tR5
	 M2hQRFXpfiVhYvOqBhD3dwk/hKYMpMH6xKRfT+NuAZidypC0F9l2WlEzokad6RGN8w
	 PuS6XBAZ56UxG0MOiVV6U/7n5ktmsMtk5Uk5NI5VAbqprDSxOuGyZ/SJc1YUywLWJf
	 ++PCQkDrzIrMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719222081; x=1719482581; i=anthony.perard@vates.tech;
	bh=nlkz8I0Q2XBmCtG1ce2j8BZifoX2kJRy/Jkn45yr+Zc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=eEkB49Ud7h8ZrvM2m+bzeYVAvMWnSPAgVlmm7Qmf9g0RG3kLcXyRZZjoUb2dPnSZM
	 /j9v+xgkpkOPnka6dn6Ff60PHNX9XcfbHS8ycAEcMWe6NgQ7Rr2ncUKttWYJu2pgf9
	 dypOKwsb8rxlvHaIup1obD5Q/SaHG/FNE/UYAU1Y5TQ5LLEl4889tQTapkEM31OW/2
	 bptb2fSZ4jt3T/hbHnB9NEFO11kxEmDQTte96NcHcIFcwd5OzWJOh/FTgO8XrO0NVp
	 gsPz7pqLXXUCYOvgH7kfawFgn33Q+2mZI37edTyhMqu4y42y4utLzW6CU/NDGxAyHa
	 vSKZFXyIaNa2A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20MAINTAINERS:=20Update=20my=20email=20address=20again?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719222079548
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <20240624094030.41692-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0dde5e73b97d4d4db679376060d06ffd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240624:md
Date: Mon, 24 Jun 2024 09:41:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e2b30a345..9d66b898ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -208,7 +208,7 @@ Maintainers List (try to look for most precise areas first)
 
 9PFSD
 M:	Juergen Gross <jgross@suse.com>
-M:	Anthony PERARD <anthony@xenproject.org>
+M:	Anthony PERARD <anthony.perard@vates.tech>
 S:	Supported
 F:	tools/9pfsd/
 
@@ -383,7 +383,7 @@ F:	xen/arch/x86/machine_kexec.c
 F:	xen/arch/x86/x86_64/kexec_reloc.S
 
 LIBS
-M:	Anthony PERARD <anthony@xenproject.org>
+M:	Anthony PERARD <anthony.perard@vates.tech>
 R:	Juergen Gross <jgross@suse.com>
 S:	Supported
 F:	tools/include/libxenvchan.h
@@ -429,7 +429,7 @@ S:	Supported
 F:	tools/ocaml/
 
 OVMF UPSTREAM
-M:	Anthony PERARD <anthony@xenproject.org>
+M:	Anthony PERARD <anthony.perard@vates.tech>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/ovmf.git
 
@@ -462,7 +462,7 @@ T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
 
 QEMU UPSTREAM
 M:	Stefano Stabellini <sstabellini@kernel.org>
-M:	Anthony Perard <anthony@xenproject.org>
+M:	Anthony Perard <anthony.perard@vates.tech>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
 
@@ -515,7 +515,7 @@ F:	xen/arch/arm/include/asm/tee
 F:	xen/arch/arm/tee/
 
 TOOLSTACK
-M:	Anthony PERARD <anthony@xenproject.org>
+M:	Anthony PERARD <anthony.perard@vates.tech>
 S:	Supported
 F:	autogen.sh
 F:	config/*.in
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

