Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE3CC0518
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 01:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187590.1508947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVIfN-0001cv-6S; Tue, 16 Dec 2025 00:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187590.1508947; Tue, 16 Dec 2025 00:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVIfN-0001aO-31; Tue, 16 Dec 2025 00:11:49 +0000
Received: by outflank-mailman (input) for mailman id 1187590;
 Tue, 16 Dec 2025 00:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZqM=6W=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vVIfK-0001ZT-9N
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 00:11:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb387576-da13-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 01:11:39 +0100 (CET)
Received: from nico.tail79467d.ts.net (93-44-185-214.ip98.fastwebnet.it
 [93.44.185.214]) (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 3AA8E4EE7F04;
 Tue, 16 Dec 2025 01:11:35 +0100 (CET)
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
X-Inumbo-ID: cb387576-da13-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.44.185.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765843898;
	b=jFOprYsa4t6Yr1bge1vwFGIjjFV6q+SMisTuFubh+YEf6xFtZtRgsggfwLQbbLqt0nvz
	 TaERSrLSnx3Oj2CRBq6xiFkR6w8jxAngBxmLNomPVZ4g8IFMRGlxCQ7siDz9wqHYCWytA
	 gU/zavhefXG+05BJQ8ZXLVDh2lAxJRjyJbiV/3gApyJzqm6Y72dtFqJhMkne1fLhrJWcG
	 u3ZzW3b+NonVbCg5wFIEPIPOwjc2Gfco2vow+lnlVIujQRprVXXLew/TWtaGiQiJvXIcl
	 Tbf6+oBwH5/5yDhO2rNdu0uNSfouDL7mfRMzWbkGbvi/juX9XkJoJR4C77Zj9PuuU3gAI
	 AlxKCk5qSjD2ZWU3q+2DbYm0SFI8lFoDSyZGn4OQ3cGlyxDWXYsConYu4vx1PDScZtUZ6
	 GuQue9TFR7EKLW7Jq4PD54Iza+m1f4RmJZR3zAAYJd/apSfKigwNrXZEYid+2Qb19daeG
	 wVXHzFjDImGDX4H0hAcHeEL928HYHrzanI7p/lkpc/kO25mUnSD3e3QfBnR4B8Nkjk0fN
	 Btz6Cgivm7dyWzK9QmvFKwofxc44JzECbKZ1sC/CMV9A2Wk8Rn+GM+zlmbPKRajCaS5rH
	 Md0KhkShqKGckflByruBE/AplXEDTaNoPoYFHZHeHqoqCofFcUID6IhcmwYuQvo=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765843898;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0wvIjzYU8DB2Ky+MSUIQO68qxDoQ24PdTMnMJPEjtu4=;
	b=MMd+Y0/Lse0S3beJlRb7zw6gxooMGCB/+jJhmEcJcTDxF5k8iy70czCfKB9Lwoiwd1RN
	 3760l8b4EKQh4uyJgNeXqPWlPuO8GllypYeGIS0jN0bmpP9CT/o8WlQbbhpl2C3uN5WLs
	 sqJFAJt4FzqFlvQc2iv8S6yWxt4ificOePwJcKHyMXMDBFWSY0HtQ9YKXntHAt7XXreCx
	 UfgmyIUklbMjWvKweTwuXDMUDBvOS1oR7dwhZCCjR6o2Gb4u+zJ6et46Qojcl1YcMmuE3
	 NJE3QEb6TqOCFTyWZv/qAZjuYU2/Jb/8MgFGfxdUKsZw9ubCqZCemeRLlRbOkSWoEOLNI
	 nNxHoro9jQvehlJZqbLRolFhqQQw1Y+gfQCIkuHDT1gibv+KjE5qZeZDtHWoP4k7+iAey
	 zCwkLbEMEl9CeHFS2eWzKfViQ8xjJx24DTQ4UgTFWGDH8fBHaxy4JTh5Ha2Txz72gH3RU
	 5hS9eU8oTyH9kSPTX5hIkpTy3kuZF9BbFu2rOFLQzjV24bDjSIY+zbGeMreC+zS3tSgdY
	 vevFEgYza7cf/epsIP18RraZIigpxISf29VFIlZN+XrdKWgFWmCoWXadTl7YPldTzxm1a
	 M0cpH7xumMEcOwSpsJIL/rxJC03ntMmsUtfSt+AYRUVUs1TrtXVDAm0Cu34G240=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.44.185.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765843898; bh=+zYNMMj0QZZurjKyyiRrhQ4bPdUSpZuE+qDfLVgXSsE=;
	h=From:To:Cc:Subject:Date:From;
	b=hdLtm8b6Hm/hUpbnS+TvP3ISFL0ZU/i0Mf6Nod+/UoK5OV1/E+p5VD8ZVFSGgYfN5
	 aPjCEmXXVGfDnXIXviPHIjPhC0+C40SYbnvdEgSRR1MoodBB6957zZMwwsGJoq5ZlD
	 VYWC1TUhbB5CXK4mW6hozB/EbfqywaTA4cViQOvAdO4Pv0yfjOa80zHhjSYIraM624
	 VhaEorOM5A/owzZ3O6dxOe8Dq7/5BUdzjA44Vui7Ary6s4Cnvw7n1PFI+49jMjErw0
	 SFN23n5NRVmhi71aTfZQBAPGQOV/LjJ7NqIA7pm/IBpVDvQKfGPZzq6BczWD5r1+VR
	 bXRLL51IS7Y9g==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] misra: add deviation of Rule 5.6 for shadow paging code
Date: Tue, 16 Dec 2025 01:11:29 +0100
Message-ID: <e408b8bb6e64e7fbe709ae8a26efa7c247a3f999.1765843801.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rule headline states: "A typedef name shall be a unique identifier".

in x86/mm/shadow/multi.c the typedef names for `guest_va_t` and `guest_pa_t`
are deliberately reused multiple times due to the file being included with
different GUEST_PAGING_LEVELS. As a result, a deviation for the rule is
introduced.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
CI pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2216437709
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
 docs/misra/deviations.rst                        | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 219ba6993b90..86e782da3f12 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -143,6 +143,11 @@ number of guest paging levels."
 -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/include/asm/guest_pt\\.h$)))&&any_area(any_loc(text(^.*(guest_intpte_t|guest_l[12]e_t).*$)))"}
 -doc_end
 
+-doc_begin="On X86 shadow paging code, the types \"guest_(va|pa)_t\" are deliberately
+defined multiple times, depending on the number of guest paging levels."
+-config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/mm/shadow/multi\\.c$)))&&any_area(any_loc(text(^typedef.*guest_(va|pa)_t.*$)))"}
+-doc_end
+
 -doc_begin="The following files are imported from the gnu-efi package."
 -file_tag+={adopted_r5_6,"^xen/include/efi/.*$"}
 -file_tag+={adopted_r5_6,"^xen/arch/.*/include/asm/.*/efibind\\.h$"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b3431ef24e26..7f877142109d 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -187,6 +187,8 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `deliberate` for ECLAIR. Such types are:
          - guest_intpte_t
          - guest_l[12]e_t
+         - guest_va_t
+         - guest_pa_t
 
    * - R5.6
      - Some files are not subject to respect MISRA rules at
-- 
2.43.0


