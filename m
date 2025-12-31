Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8887CEBDB3
	for <lists+xen-devel@lfdr.de>; Wed, 31 Dec 2025 12:24:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194535.1512917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vauIU-0005P4-Tk; Wed, 31 Dec 2025 11:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194535.1512917; Wed, 31 Dec 2025 11:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vauIU-0005Nc-Qv; Wed, 31 Dec 2025 11:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1194535;
 Wed, 31 Dec 2025 11:23:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KlCN=7F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vauIS-0005NU-0Z
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 11:23:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a062afa-e63b-11f0-b15d-2bf370ae4941;
 Wed, 31 Dec 2025 12:23:16 +0100 (CET)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id F22564EE0745;
 Wed, 31 Dec 2025 12:23:11 +0100 (CET)
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
X-Inumbo-ID: 1a062afa-e63b-11f0-b15d-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767180195;
	b=1Go5Mp+oNpR3wTCaoEn6TLkMX7BdPQvhFJeXXOpcyL0gmBRje/A8FsyvhEb8t81j/Q3l
	 05NIezIs1/QWUT/FQ74mnWP8SEpIL1qZiQyBhMWpYvxiylZf852ZYlOvZ9AgsYMjKulqp
	 8K+5578J0S+fK/Zkf0LgrpPjr8CrVx5HiZHO6QhlOvUGgL8nyg0H62g6C3ACaWxWj76a3
	 K/MK5JZwg56A/9Sw+L57dZpwvdlHjZfeYMgqTpUzHoNkqg9iuH4uJmWsHkLUtlStnAIti
	 P25LrKSp+OoKChm0hYRi0+eoL1kMgKROM6800kIOrjuLMznR67rw2HnC0Eyz/S/q3Jay/
	 q3Q1wwhUZb2k5jNLJathqrsgfTFFXfa0HeRVrckPo1y0/xIlNqa7Ai+YlQKzAfGSoK1BI
	 hjEeIuV/2z8+vs0xYJfzOxwIul3YbrwOt8y9ux/dzy57zWGT/Yam7L/tB5HeSD8hQJAbM
	 ARpvWGY537255JqIvAjDVQY9TJvm7ZN/801E4Rs634AKfVZCK0uedns+TBoXZIdyNXw4B
	 C0KfoYqmZZ38ZCuJKzTKSBWJ+cjtDx41PpfSextA8qmY08y7Y2owBz0FZ9w4pkdoJhgU8
	 BT0oe3n0xzHj4Wyh2FaxzTJDKxs2o5RCDFhV9NSFVGgSrg2V3czb0ghdi/oeP4g=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767180195;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h8T//oEFRoqKd83Hn5Dtc+/fNA6sTXVBavX9GYkdTfA=;
	b=t+2ru1SwbdKapPD5ZdInuJs1cq2Tp+f0Cy6+nVQ/lrwqWmEbf6j+od0ijZILkth1m7s1
	 1YhOcKk1dTKpyxc9QqT9ELJfo3FNtj2MK5uXTZhPIdq4q2jo/tBA3iClIKqS7J6qSehf3
	 Ixuc1eDGM3tOw5DehKqMtaVjAUtcGbXGmJxC6ouStaxUXDLgmYPzcAEmzmu+Z4S87Ybxz
	 e3J7OquRJMQWSbJtCbpDO/0iIK3Tuu8e7nrDt4AXkmPm/lijB/C+iKoEesGPacVl35leb
	 ivcHaJ17cA/iQTPQ/2jkrDb2j4qWowNo1P1uCQGyga72Hi2O1mFz6BW3nga2SBuET8dTh
	 lZEXN0lFYPIho+sdxS3L0aJfvMf8Qo9OJoYLS+7qM2H51vapHeTYuleeIHtHkKO/guvoE
	 52R3ir0jvdKF8Q02x/pxXgr/zzMDBJkRLsl+lCsXGhH+ufRgtPa0/1FMnnVa0fFchAgLs
	 4HfkvDXpsDFYO75wUZRm3xFdfVqIPZKPW0IkSzEFsodX2H16uBmkb2IaCHti68q4rkPhu
	 cBFgbZIIVPvSODOfkC37DS/yLnmyifCkIRqZHhYad5HHZ41EjkU86WuQaUhNrSN4o5Q36
	 69Pun6p1z5mvm5XZPuOlPZbTEprUPtwt+nJSoraOLVtK6gKWP71aYA6sdY5bcBw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1767180195; bh=LiusyckpAnrHrIbBjcv7AvQQOHCxMvLko16lHg5FGqg=;
	h=From:To:Cc:Subject:Date:From;
	b=l8EScjgLd185Ck1znZsKyFMavtun2OwLd+q1kwUXIFEwUmDjnQIWewU3Yq6DdCURK
	 n5bGbyBxCgHe10IeDDFCTE122qWlHkm5bjfzRZKb7JCvPRuXtgCdhmlPsQjwcgTiqB
	 9cU8Ymz7a8xjp+ChZf+FcqSoLmFBXoL6dZWdm7gUH+OUiKpl4j9JasuuY7Ae0kHX2m
	 OScVY0c0mCRsxZwFo02ybHjBareCXac2gNSEVsDTT/ulbGp+lmJH3h2nPNjIEhkSfn
	 LjCPKizfB3cO9q6j+qfbbngiuhB78gPky9t9W6AYKIaxE6CNTl4DTkGjOh6F5jilAm
	 JMSLskl3SfKMA==
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
Subject: [XEN PATCH] xen: rework deviation to address varargs MISRA violations
Date: Wed, 31 Dec 2025 12:22:52 +0100
Message-ID: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 17.1 prohibits the use of the features that support
variadic functions. Make the deviation already in place for controlled
use of such features more general, relying on the presence of the
`format' attribute on the function declaration.

Add attributes where missing in order to avoid special-casing
certain functions that use variadic arguments.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
CI pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2239414827
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 12 +++++-------
 docs/misra/deviations.rst                        |  4 ++--
 xen/common/libelf/libelf-private.h               |  4 +++-
 xen/drivers/char/console.c                       |  4 +++-
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 219ba6993b90..7dee4a488d45 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -570,13 +570,11 @@ safe."
 # Series 17.
 #
 
--doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
--config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
--config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
--config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
--config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
--config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
--config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
+-doc_begin="printf()-like or scanf()-like functions are allowed to use the variadic features provided by stdarg.h,
+provided that they are declared using the `format' attribute."
+-decl_selector+={format_attr, "property(format)"}
+-config=MC3A2.R17.1,reports+={deliberate, "any_area(^.*va_list.*$&&context(ancestor_or_self(format_attr)))"}
+-config=MC3A2.R17.1,macros+={deliberate , "^va_(arg|start|copy|end)$"}
 -doc_end
 
 -doc_begin="Not using the return value of a function does not endanger safety if it coincides with an actual argument."
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b3431ef24e26..584907b048ec 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -570,8 +570,8 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `deliberate` for ECLAIR.
 
    * - R17.1
-     - printf()-like functions  are allowed to use the variadic features provided
-       by `stdarg.h`.
+     - printf()-like or scanf()-like functions are allowed to use the variadic
+       features provided by `stdarg.h`.
      - Tagged as `deliberate` for ECLAIR.
 
    * - R17.7
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index e5c9cc109972..239d000f49d1 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -84,7 +84,9 @@
 #define elf_err(elf, fmt, args ... )                    \
     elf_call_log_callback(elf, 1, fmt , ## args );
 
-void elf_call_log_callback(struct elf_binary*, bool iserr, const char *fmt,...);
+void
+__attribute__ ((format (printf, 3, 4)))
+elf_call_log_callback(struct elf_binary*, bool iserr, const char *fmt, ...);
 
 #define safe_strcpy(d,s)                        \
 do { strncpy((d),(s),sizeof((d))-1);            \
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a99605103552..2bdb4d5fb417 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -969,7 +969,9 @@ static void printk_start_of_line(const char *prefix)
     __putstr(tstr);
 }
 
-static void vprintk_common(const char *fmt, va_list args, const char *prefix)
+static void
+__attribute__ ((format (printf, 1, 0)))
+vprintk_common(const char *fmt, va_list args, const char *prefix)
 {
     struct vps {
         bool continued, do_print;
-- 
2.43.0


