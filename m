Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399B1D20CD7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 19:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203659.1518732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5aK-0005Jp-Hu; Wed, 14 Jan 2026 18:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203659.1518732; Wed, 14 Jan 2026 18:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5aK-0005I1-E8; Wed, 14 Jan 2026 18:27:12 +0000
Received: by outflank-mailman (input) for mailman id 1203659;
 Wed, 14 Jan 2026 18:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z9Xr=7T=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vg5aJ-0005Gf-Oq
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 18:27:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a36e449f-f176-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 19:27:10 +0100 (CET)
Received: from nico.tail79467d.ts.net (93-44-185-98.ip98.fastwebnet.it
 [93.44.185.98]) (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 4BB994EE3C1D;
 Wed, 14 Jan 2026 19:27:07 +0100 (CET)
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
X-Inumbo-ID: a36e449f-f176-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.44.185.98
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1768415228;
	b=lowYskxunXHL8atTnbMNCtL2jJGYGnZxwH3co/5qseUL/t6HXb/msLdxJ3CBpLcBgwTn
	 GXqqy7oykGt9tpVKER4Jw5x91anZHnsNbhDBLl+zqSNu74w1Hef380IT+Rf5q5EHOU9u4
	 pCIL7SUO6yqkiOrWkuoNUMKeUEkQFizyUejbB3hjYjDOacmvP78fNxMaRpieIUY52rz2L
	 LBPbrrF1H6dGIzH/2Cz3wJguIBeBcNJsrfhozEWSJ7y7KbHhY9kct35O3fyctdnEvlILB
	 XOwXyDzVartbmVuz7vKoIWyqYeFAL5g55To0moEMlplQ3inlZrriFNUNBZyaZgtBShtql
	 EZEJQn1lbFjiK4tZIcsER9bNqMOtUuBxe4faImv+Qr9/5JKD70LBCNV4mxzxv4kgtl8Dv
	 2Cfiff8dw285AvTCLsQX0cbmfqU/PidJtTXI/MqgY2VbGm+rpShgPErjYzm5G9rnzLYK0
	 3k1Ep5u6WiJeyIOt0e0QSUQr0xJEZvr0U2IcKNir4dpVv84AKz65+UMA5wxZG6IP9L+iS
	 hxI0BnTtRfhlqne9sCAH1fYmSo7JNK5bOkCJj7XrhYpA1T58FJG8K3MMlcCG4tT5A49SD
	 bIQP0V/P79P42wf0eVqtGGRHBJO7uzZ5syaZzJyC0Mh2N+XnWgKXdd/uix6CbMI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1768415228;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DDvUkwhNpt4+B5Le4owhqbqzLz2eZLjRMbuVMhMsg1s=;
	b=j8+T4ZVC8v65TGQTO8IJwhi3kTo3DNY7cfAD76aRs57ps1OzzrhlzUtUZRFFReUDD74v
	 gzxP9yss6HrC9vRKgKrt2B0xNS2KBeNrQeKx0WzoxnJVVeUfKAjeUYtSRxHQ2E9nL9PQQ
	 teYSIuekDsQiQMVB2APqkVS1oYuPbiBJC90A/NBI9UI4gpT7zXddTtFdqNXOYSsQzsXSe
	 R3n/VwTG/Uj69Wm2IFfOvvcJ1SGj8fl7XvMDGLnO1re4bobZPvzMG0EAOH/6fTpOUhzGg
	 LyA6oFFr75FH0RPzfJDS6EkJcJKmaeueK/waRTjSEzDPTzVHJFFP8YFEM8HxwnChe/Ekj
	 d/Tu10SzqJmfqm30hBP/h+eblvXmACzq9XSs1oMG6/8XV53ENltxmMNdwDKZ8eL2S9E6D
	 ztnEUiF21Xk6/0igFgtQFExMrClJdc0mqYwcc+/DP+JFsvQmA5VHtO80HIUT/pjSBcI5e
	 G0SzSDlEwwjrYgItzEVHMwXctYpi/vkWUvHVu0zSApGnlLBViOLniOPg9X70JUFUm8t33
	 WVf+Myy7GChFpT+pXz3hwLUuLK7waanORLZoQhBwy1QFWXYWLBJEV0GGEqEruEa6lrbjG
	 AG/Fvc1uEa22Qf4hhTTtRRSEa2Frxov16+UVeJMfI01jdBZZZCfPJ5JzYwj3KH8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.44.185.98
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] x86/mce: use offsetof to determine section offset
Date: Wed, 14 Jan 2026 19:27:03 +0100
Message-ID: <350bd19ec4b0b190911d748df6ec92c626e7151a.1768415160.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no reason to use pointer difference.
A violation of MISRA C Rule 18.2 ("Subtraction between pointers
shall only be applied to pointers that address elements of the
same array") is also resolved because the object to the subtraction
is applied is not an array.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Found while randomly browsing violations of the rule on the allcode-x86_64 scan.
---
 xen/arch/x86/cpu/mcheck/mce-apei.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce-apei.c b/xen/arch/x86/cpu/mcheck/mce-apei.c
index b89502088243..21aabe2027d0 100644
--- a/xen/arch/x86/cpu/mcheck/mce-apei.c
+++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
@@ -74,7 +74,8 @@ int apei_write_mce(struct mce *m)
 	rcd.hdr.record_id = cper_next_record_id();
 	rcd.hdr.flags = CPER_HW_ERROR_FLAGS_PREVERR;
 
-	rcd.sec_hdr.section_offset = (void *)&rcd.mce - (void *)&rcd;
+	rcd.sec_hdr.section_offset = offsetof(struct cper_mce_record, mce) -
+		                     offsetof(struct cper_mce_record, hdr);
 	rcd.sec_hdr.section_length = sizeof(rcd.mce);
 	rcd.sec_hdr.revision = CPER_SEC_REV;
 	/* fru_id and fru_text is invalid */
-- 
2.43.0


