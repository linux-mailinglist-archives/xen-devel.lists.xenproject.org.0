Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D0A8AF78
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 07:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954945.1348842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4uxl-0006W9-Ef; Wed, 16 Apr 2025 05:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954945.1348842; Wed, 16 Apr 2025 05:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4uxl-0006SM-BC; Wed, 16 Apr 2025 05:05:29 +0000
Received: by outflank-mailman (input) for mailman id 954945;
 Wed, 16 Apr 2025 05:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1z0E=XC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u4uxj-0006Px-TH
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 05:05:27 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66a2634f-1a80-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 07:05:23 +0200 (CEST)
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
X-Inumbo-ID: 66a2634f-1a80-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744779921; x=1745039121;
	bh=2kntZOk6Me/sxQELVItK6E49Hfz1du9hHAG5aVlU0AI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=UJZ1mAGKTrPRTfqp4vKTJWJELZRY7RCBLFf6Qj9/MqvlSh47djVJ3P8C+IxqQ/55V
	 eotKpa1cQm/hQXHyfQx7XHNsuVyai/Kr6c2POHvPzKDU+Kh9CEV2nTfgs6TQsa2GJd
	 k4n6DWaVRfJfOEAoIstwZaQg6VLosF3KBqim3FZrA/X1LubuXNSB6QXF1S1GSNmE+M
	 McH8gwoGKpdszkaRTUoSdRBwhjbm2JImGPsXKo8CvplViB8Q9NLAhBsQfoy51s8f7m
	 4JOghs/4D6h/a4dvYVwZEw24FZzuIDwEQsIhzpgcYN7AGLrNHPbH/Lo8GxLD4ZSz3h
	 QFZHhy2kRw44Q==
Date: Wed, 16 Apr 2025 05:05:16 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, persaur@gmail.com, dmukhin@ford.com
Subject: [XTF PATCH v1 2/2] tests/argo: fixup for recent xen
Message-ID: <20250416050443.919751-3-dmukhin@ford.com>
In-Reply-To: <20250416050443.919751-1-dmukhin@ford.com>
References: <20250416050443.919751-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b190bcdb1a9f992ac132a975f1e1d9dc04416dbc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add fixup for own_domid under CONFIG_HAS_XENSTORE to make XTF argo test
can pass under x86 QEMU.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Successful argo XTF run:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/9733329882
---
 tests/argo/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/argo/main.c b/tests/argo/main.c
index fa54aed..1e6b92f 100644
--- a/tests/argo/main.c
+++ b/tests/argo/main.c
@@ -301,14 +301,16 @@ static void clear_test_ring(void)
=20
 void test_main(void)
 {
-    int own_domid;
+    int own_domid =3D 0;
     xen_argo_port_t test_aport =3D 1;
     const char simple_text[] =3D "a simple thing to send\n";
     const unsigned int msg_type =3D 0x12345678;
=20
+#if defined(CONFIG_HAS_XENSTORE)
     own_domid =3D xtf_get_domid();
     if ( own_domid < 0 )
         return xtf_error("Error: could not determine domid of the test dom=
ain\n");
+#endif
=20
     /* First test validates for Argo availability to gate further testing =
*/
     if ( probe_for_argo(own_domid) )
--=20
2.34.1



