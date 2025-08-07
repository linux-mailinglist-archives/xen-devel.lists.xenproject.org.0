Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D439EB1DF14
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 23:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073803.1436625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk8Ys-0001Ma-7A; Thu, 07 Aug 2025 21:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073803.1436625; Thu, 07 Aug 2025 21:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk8Ys-0001KE-4R; Thu, 07 Aug 2025 21:54:10 +0000
Received: by outflank-mailman (input) for mailman id 1073803;
 Thu, 07 Aug 2025 21:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qi0u=2T=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uk8Yp-0001K7-Pc
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 21:54:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c9b619-73d9-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 23:54:06 +0200 (CEST)
Received: from localhost.localdomain (93-57-249-207.ip167.fastwebnet.it
 [93.57.249.207]) (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 10EB34EE3C03;
 Thu,  7 Aug 2025 23:54:01 +0200 (CEST)
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
X-Inumbo-ID: 09c9b619-73d9-11f0-a324-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.57.249.207
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754603644;
	b=1B/UGFpqqkt+gSwtRlw/gEHvAeLoqreonljhtdJVpZBrT3IdkbxqcQxxEQJ78pr+D6ls
	 zMSwHBISqVZgD8H9HF2ZEfPGjS83gUij0AJW1ONuNKbLsnbc0yuXksfCIwktKIL7Ht6/x
	 S0uXMCvXXkdm8+yku1xgRDd8uFBvHgu1aDbD40IlE7lblwKF5Mo+2Ur0/DRqoj3eQOP67
	 sZ+pLqzKd/PgXmtTXtT2rQEvZOaf1hhsU1+BtvZ4FlCE/fwGLtWk2bUNLtCKylCh/hK4u
	 VLSyZuggdvUQWCitRjNjyhmMJVwIqCx6ZW+glj9PxM1JR8gGyreXRABMhWCeRQm7RaA0c
	 /9WY7t3vXCN+BlhjG7AzL3TaDuur1SlDqbOkhiyA8dDPS8D0VPeWvjSMSXuTWQ67jfX/G
	 kkV8ZvReXMLLjv/xSB+QwBP60WpiATwY+wWv+acP3ehTI+JcYkCIF38GHaD7IQbEbczAe
	 uO3knh35zZXJ1LX5zHOwifqARaTkcTKqxn/Er5jfCjiskoK16tnyro6eKFrCYyFx2BXd1
	 lH1FZ5odpadL4DP+6izUpYg9t5OZs18n4NRaneZdJwoC7FhzLDCgQVVEAbYIZGduCJ/7V
	 Ih7+ZnW+kiW3Z68Z6sODGcEiv7cmMOv8AwPnHo5hgbnc1HCGvp1Ji78WTG/6hdg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754603644;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qFuvZ+swQQPjceeObM5baItpe6tINcMkCFRA54Gvm44=;
	b=tCLxcpL/F0iCws1GmmkirFQ7eU9Hd9YlkpgiPOITKuKc2sL3PeAHDdZojfg+D3GkbmMi
	 BjTdS8+58sZ0IyURQ7OGYaYlFSnXR3N3iGdF+WLc8T+078JM5RYdsRlo1YWiHge1ZKIRQ
	 lHHllr4VfGQeMX5MiFiimAjDBeB15yY3+Bx3Ypl9jxqns6Pd8GRwYT+bk2CSonPeR9uFw
	 xMhy5auQbRkkgBFCofIFe75UWRxNngM9lfCDmW+ZYCvytDbOR2evxtTxusXgFWs9fJ1Wv
	 1MrE0hpXomdhG/pXBqKWasWidTpVCMiYUd4DZ+oIqo88SSJmM2sLFVrO+8qAN3UJWvLWi
	 PnUR9dDtREdeEoXvzcd1fjZJuYUxA0+QSE9kPcSbW8qKXqPibgwbUMFxJrweDOhB2G1gf
	 /sgCHn1nferEK4IhROHmE/4iOmp7DtQvEnZmkGUI1tTIFshCs5JROAU8mPUBH4gLqy0lK
	 xVXUkASw88rIxCP5FLnOxcwKGkKjcScBGcTZEQWsFhT08ZxmgJZWltBLeHqqAeKGgU+bu
	 LGiOqs6tjAyA0T1nlFiR9A1+F6iNUQIMXeRJ0E2tBpsUi5yG0H0gp7KBCm/hudYPMTzcL
	 w0mD6YC1L/iKzQl/V6yIP9uvQ5EN8Voknu2TFaNaUsj0+ZHqEuCr1CVtOcHg4dU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.57.249.207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754603644; bh=q43OfBL8YD5tbNqVHj8MYPctFYXKfq24FymRSVpqVGg=;
	h=From:To:Cc:Subject:Date:From;
	b=R1K+4+BDFdLybj1m5LxigOaY9c0+bECIcL+cgXv2Dd8y4gDwk1jaj+yxxtt3eM8E5
	 FRjy8Vz73xH7TpUNrbyFjzCKwMsE1DoMhmPoFGrIIgonZHaPsmcxeQ6vXI2QQ2cdIj
	 z58+TjTANtAp1Gle+0uOcw91ioHwAUKRvyPj8z6P6fsDbSh4aVAunb//bkVcC9hZ+W
	 B4pBHYVJYD9miaPdiAI5Fwh3QgNzQf3rPZnxGj3edsPvqo3+Dan9+Eb4Xk+Sq8IwE7
	 J2QnB0i4MBpEv5+IhzQtExzuZXTzClqFEgT7W20tl4mil6HaLU++dEx1qY8c/LIT78
	 dQD+Zx0230qIg==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH] automation/eclair: restrict clean target to xen
Date: Thu,  7 Aug 2025 23:53:56 +0200
Message-ID: <a1127245a45139c3c3fcd05b07c1c1e6dabb66c0.1747387457.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clean target also clears files outside the xen directory,
which is not needed for the purposes of running an analysis.

No functional change.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/prepare.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index 4285ff26de54..e941e6edc4f3 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -39,12 +39,12 @@ fi
     fi
 
     ./configure
-    make clean
+    make -C xen clean
     find . -type f -name "*.safparse" -print -delete
     "${script_dir}/build.sh" "$1"
     # Generate additional configuration files
     "${script_dir}/ECLAIR/generate_ecl.sh"
-    make clean
+    make -C xen clean
     cd xen
     make -f "${script_dir}/Makefile.prepare" prepare
     # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
-- 
2.43.0


