Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1531AE2873
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 11:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021547.1397501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSuzN-00071P-I5; Sat, 21 Jun 2025 09:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021547.1397501; Sat, 21 Jun 2025 09:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSuzN-0006zG-BI; Sat, 21 Jun 2025 09:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1021547;
 Sat, 21 Jun 2025 09:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=56KQ=ZE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uSuzL-0006z7-7E
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 09:58:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fd7e9d8-4e86-11f0-b894-0df219b8e170;
 Sat, 21 Jun 2025 11:58:15 +0200 (CEST)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 5F2294EE7BD6;
 Sat, 21 Jun 2025 11:58:12 +0200 (CEST)
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
X-Inumbo-ID: 3fd7e9d8-4e86-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1750499894;
	b=ptiyWAR0f5LcQyHKM6LGbCcUF2JywoM8ZfUA/66KmAatpvcL2OQeY0H9H8t3qbWnbb2L
	 hKDRgsk5ADephf3Fjv16nIerXLJ0ISXRqwpGCy5zbUqOfhRtCJ5Lqn2rmZ+llSIdlObSe
	 KJEBrNZwPdqcqfeqS4ZeBxukK2ITlr+mGMAF7VgHMMHtDuz6FRJ5rl+invX+pvxD6Zpm0
	 fP5wHdCIqPwjA6IqVpxuI84zP1j/dU2Iaz5z7zVPx+kkDWj3Wq3s/BLzSeadc+RNpNF1F
	 YyEr12HrqyZii4nVPsbXIVg+xKi6hwT4u8p2ZLVl/9B0XTfBSTd+1PiIlouSaeIlqMDVF
	 BvyFkS2hjiordl1F4OxB4pfcwzXBrTMFB3+MbMbaWZMdQ/5XHeekfPQJMN9Wtj9iccWvL
	 4rUkOJ+q3x3dE5rEQMSsgpQMw/a7mZiajlWXdr2ZaYzq23bw8HveXxyVggG4Qig6L4yOK
	 jHxBUvlKtiFTGym8WYF3SDP1+q+Q0vqV70ALSsLuXNXeEpbON5/1uN3Kf6i+r340qTqsY
	 VtOAofKmB8/vcMygqCaWIGOnJ59pqwkxkYt75K1W76zf3cL55QaHtIfrZsMsyCJe+bApC
	 45Tz1JU9eNsSAtuaj9PKtkM355wWY9xp8+UiwbvPTwO5zkQxQ5fhCWXqqd6c+Aw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1750499894;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OFSOmi8snwtzjR1JiY+zoRSsRqb/PHEtC2Dj2pBIVmY=;
	b=qURVONWblprb3cBbFc6x5HirHGCj3/jkozlxVnQiTZOwmMP1uuyIy1vY8hitH77J7MFd
	 48iajO4CgQ+2kKfp02hvbWH5LzdYPU+uSSyV3MNRcW6xIrtgfFPBUC+j6ll14T6ZmtqMX
	 dhnEa5TMHpOxCHKrM2mmwrIlXxyfoTGxCGWOMUPEeVfDJi3Odrap7TqK/fdHXl2HJebcm
	 rdlKxORv5i+Ju18/a/V8NDohhfIp1FjAhswGLAai8Kd2yweD3V6u6J+ucAJbQi/EKFwYP
	 Qi0kREgVgL6SBPrfOztqLmPKrUC8EET+A1hOji9KpaIBtGm8Sz2bJf3+WgMI9GuaNKQ2z
	 AbJMp5NSPnFSahHplRnF740t5boxYFsj89KHff2K8dbX3qQLhEQ5O3SVpFQGk6O099Qm8
	 hNc7LKiG7VXz5atclpMEVojsVDdMpYHqeIioowh8ibxntUyYPpDnehmXzCwxER9tAFvIR
	 Su+Pr6P6rPgAH7BX0vWe7sAhuDb4qb1vs88bjD9sijuAl6RDSBhtzjoHTiAvhcVGX5c9u
	 PqyL6j3b6SJ8UOQf7WxZvCHltfIyhSKrBZ6yxHX7gM49Mi/FF96n8q4Pw+q8A2KgUOiWb
	 uO8bXQNSP33T/DaD8j42uyIymNkUkj3F670BJDSrnqx6V00jDrghVKe+m5Ap5zQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1750499894; bh=Fz1qUwXURQRnqQxAGnDuD4Twc2/+DOttlbQ6xdIUBMk=;
	h=From:To:Cc:Subject:Date:From;
	b=SeQEnea/1dxF3wEw71yr3uC6qGX63VjiFMqsY+UvVCU+3UtFO7hvFr+mBo5Y32lNq
	 qgrlA9s4kpdSiL8KU5OWcVLft20zrmGVsJiUkJHpSSx8+/25PZxzXULnY7T6ia1HqX
	 iBVBxaETnQLvL67Zg1+cSKV5SfAnQymrzfLvDCJ3SuHSbtays8+CtX/x3TARpOVDY+
	 7V7njQ9+q/m7Ljyro8NdbxWcKJxO6GkAQ/o+EKjeUqmL8DKIUJKV4JOi0OnqnLUbb/
	 IYIH6ZwnHM8OnjBrcr77du7j24yfJWsVKeN4+oCWhC4EDHk8PByRcS2X7wHpw8CS0W
	 kV2Gd4Bl1dkwA==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] xen: fix header guard generation for asm-generic headers
Date: Sat, 21 Jun 2025 11:58:08 +0200
Message-ID: <f07133fa226df11624883fafa1cb455a4e7670ba.1750499076.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dashes were wrongly not translated into underscores, thus generating
an unexpected guard identifier.

Fixes: ee79f378311b ("xen: add header guards to generated asm generic headers")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/scripts/Makefile.asm-generic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
index b0828018080d..f6850758c54b 100644
--- a/xen/scripts/Makefile.asm-generic
+++ b/xen/scripts/Makefile.asm-generic
@@ -34,7 +34,7 @@ unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
 quiet_cmd_wrap = WRAP    $@
       cmd_wrap = \
 	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z A-Z); \
-	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
+	upper=$$(echo $*.h | tr a-z A-Z | tr '/.-' '__'); \
 	echo "\#ifndef $${arch}_GENERIC_$${upper}" > $@.new; \
 	echo "\#define $${arch}_GENERIC_$${upper}" >> $@.new; \
 	echo "\#include <asm-generic/$*.h>" >> $@.new; \
-- 
2.43.0


