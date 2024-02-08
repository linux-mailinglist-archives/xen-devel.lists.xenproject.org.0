Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117A84E4AA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678313.1055443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6tv-0000u2-6B; Thu, 08 Feb 2024 16:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678313.1055443; Thu, 08 Feb 2024 16:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6tv-0000rM-38; Thu, 08 Feb 2024 16:05:23 +0000
Received: by outflank-mailman (input) for mailman id 678313;
 Thu, 08 Feb 2024 16:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY6tu-0000rG-1p
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:05:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db03be06-c69b-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:05:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 733601FCF4;
 Thu,  8 Feb 2024 16:05:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 305931326D;
 Thu,  8 Feb 2024 16:05:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id id0+Cr77xGWzAwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:05:18 +0000
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
X-Inumbo-ID: db03be06-c69b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707408318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GzoKAVtAHMHyYxKj3Jy39XsROB3PeexKhIb/Jv9U/Co=;
	b=isd/087gteg1utA3oqlCzukeuQxrMvA3AFLMem8sffCqZIQz84oWqOEqQaxs+ybM68XRK3
	k9QgBTgP2WwBVdjCWxuC/FUzDo7AZevlFGyrlZ4hC2vz3wmllKgalTpTG4H+Rgw3lgoOCM
	Q7MJEt0O11jwgSa+DQw63lbskXbX56c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707408318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GzoKAVtAHMHyYxKj3Jy39XsROB3PeexKhIb/Jv9U/Co=;
	b=isd/087gteg1utA3oqlCzukeuQxrMvA3AFLMem8sffCqZIQz84oWqOEqQaxs+ybM68XRK3
	k9QgBTgP2WwBVdjCWxuC/FUzDo7AZevlFGyrlZ4hC2vz3wmllKgalTpTG4H+Rgw3lgoOCM
	Q7MJEt0O11jwgSa+DQw63lbskXbX56c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] docs: add a best practices coding guide
Date: Thu,  8 Feb 2024 17:05:15 +0100
Message-Id: <20240208160515.9949-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="isd/087g"
X-Spamd-Result: default: False [-3.81 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 733601FCF4
X-Spam-Level: 
X-Spam-Score: -3.81
X-Spam-Flag: NO

Today the CODING_STYLE contains a section "Handling unexpected
conditions" specific to the hypervisor. This section is kind of
misplaced for a coding style. It should rather be part of a "Coding
best practices" guide.

Add such a guide as docs/process/coding-best-practices.pandoc and
move the mentioned section from CODING_STYLE to the new file, while
converting the format to pandoc.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 CODING_STYLE                              | 102 ----------------------
 docs/process/coding-best-practices.pandoc |  92 +++++++++++++++++++
 2 files changed, 92 insertions(+), 102 deletions(-)
 create mode 100644 docs/process/coding-best-practices.pandoc

diff --git a/CODING_STYLE b/CODING_STYLE
index ed13ee2b66..7f6e9ad065 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -167,105 +167,3 @@ the end of files.  It should be:
  * indent-tabs-mode: nil
  * End:
  */
-
-Handling unexpected conditions
-------------------------------
-
-GUIDELINES:
-
-Passing errors up the stack should be used when the caller is already
-expecting to handle errors, and the state when the error was
-discovered isn’t broken, or isn't too hard to fix.
-
-domain_crash() should be used when passing errors up the stack is too
-difficult, and/or when fixing up state of a guest is impractical, but
-where fixing up the state of Xen will allow Xen to continue running.
-This is particularly appropriate when the guest is exhibiting behavior
-well-behaved guests shouldn't.
-
-BUG_ON() should be used when you can’t pass errors up the stack, and
-either continuing or crashing the guest would likely cause an
-information leak or privilege escalation vulnerability.
-
-ASSERT() IS NOT AN ERROR HANDLING MECHANISM.  ASSERT is a way to move
-detection of a bug earlier in the programming cycle; it is a
-more-noticeable printk.  It should only be added after one of the
-other three error-handling mechanisms has been evaluated for
-reliability and security.
-
-RATIONALE:
-
-It's frequently the case that code is written with the assumption that
-certain conditions can never happen.  There are several possible
-actions programmers can take in these situations:
-
-* Programmers can simply not handle those cases in any way, other than
-perhaps to write a comment documenting what the assumption is.
-
-* Programmers can try to handle the case gracefully -- fixing up
-in-progress state and returning an error to the user.
-
-* Programmers can crash the guest.
-
-* Programmers can use ASSERT(), which will cause the check to be
-executed in DEBUG builds, and cause the hypervisor to crash if it's
-violated
-
-* Programmers can use BUG_ON(), which will cause the check to be
-executed in both DEBUG and non-DEBUG builds, and cause the hypervisor
-to crash if it's violated.
-
-In selecting which response to use, we want to achieve several goals:
-
-- To minimize risk of introducing security vulnerabilities,
-  particularly as the code evolves over time
-
-- To efficiently spend programmer time
-
-- To detect violations of assumptions as early as possible
-
-- To minimize the impact of bugs on production use cases
-
-The guidelines above attempt to balance these:
-
-- When the caller is expecting to handle errors, and there is no
-broken state at the time the unexpected condition is discovered, or
-when fixing the state is straightforward, then fixing up the state and
-returning an error is the most robust thing to do.  However, if the
-caller isn't expecting to handle errors, or if the state is difficult
-to fix, then returning an error may require extensive refactoring,
-which is not a good use of programmer time when they're certain that
-this condition cannot occur.
-
-- BUG_ON() will stop all hypervisor action immediately.  In situations
-where continuing might allow an attacker to escalate privilege, a
-BUG_ON() can change a privilege escalation or information leak into a
-denial-of-service (an improvement).  But in situations where
-continuing (say, returning an error) might be safe, then BUG_ON() can
-change a benign failure into denial-of-service (a degradation).
-
-- domain_crash() is similar to BUG_ON(), but with a more limited
-effect: it stops that domain immediately.  In situations where
-continuing might cause guest or hypervisor corruption, but destroying
-the guest allows the hypervisor to continue, this can change a more
-serious bug into a guest denial-of-service.  But in situations where
-returning an error might be safe, then domain_crash() can change a
-benign failure into a guest denial-of-service.
-
-- ASSERT() will stop the hypervisor during development, but allow
-hypervisor action to continue during production.  In situations where
-continuing will at worst result in a denial-of-service, and at best
-may have little effect other than perhaps quirky behavior, using an
-ASSERT() will allow violation of assumptions to be detected as soon as
-possible, while not causing undue degradation in production
-hypervisors.  However, in situations where continuing could cause
-privilege escalation or information leaks, using an ASSERT() can
-introduce security vulnerabilities.
-
-Note however that domain_crash() has its own traps: callers far up the
-call stack may not realize that the domain is now dying as a result of
-an innocuous-looking operation, particularly if somewhere on the
-callstack between the initial function call and the failure, no error
-is returned.  Using domain_crash() requires careful inspection and
-documentation of the code to make sure all callers at the stack handle
-a newly-dead domain gracefully.
diff --git a/docs/process/coding-best-practices.pandoc b/docs/process/coding-best-practices.pandoc
new file mode 100644
index 0000000000..f611aa9a55
--- /dev/null
+++ b/docs/process/coding-best-practices.pandoc
@@ -0,0 +1,92 @@
+# Best Practices in the Hypervisor
+
+## Handling unexpected conditions
+
+### Guidelines
+
+Passing errors up the stack should be used when the caller is already
+expecting to handle errors, and the state when the error was
+discovered isn’t broken, or isn't too hard to fix.
+
+domain_crash() should be used when passing errors up the stack is too
+difficult, and/or when fixing up state of a guest is impractical, but
+where fixing up the state of Xen will allow Xen to continue running.
+This is particularly appropriate when the guest is exhibiting behavior
+well-behaved guests shouldn't.
+
+BUG_ON() should be used when you can’t pass errors up the stack, and
+either continuing or crashing the guest would likely cause an
+information leak or privilege escalation vulnerability.
+
+ASSERT() IS NOT AN ERROR HANDLING MECHANISM.  ASSERT is a way to move
+detection of a bug earlier in the programming cycle; it is a
+more-noticeable printk.  It should only be added after one of the
+other three error-handling mechanisms has been evaluated for
+reliability and security.
+
+### Rationale
+
+It's frequently the case that code is written with the assumption that
+certain conditions can never happen.  There are several possible
+actions programmers can take in these situations:
+
+ * Programmers can simply not handle those cases in any way, other than
+   perhaps to write a comment documenting what the assumption is.
+ * Programmers can try to handle the case gracefully -- fixing up
+   in-progress state and returning an error to the user.
+ * Programmers can crash the guest.
+ * Programmers can use ASSERT(), which will cause the check to be
+   executed in DEBUG builds, and cause the hypervisor to crash if it's
+   violated
+ * Programmers can use BUG_ON(), which will cause the check to be
+   executed in both DEBUG and non-DEBUG builds, and cause the hypervisor
+   to crash if it's violated.
+
+In selecting which response to use, we want to achieve several goals:
+
+ * To minimize risk of introducing security vulnerabilities,
+   particularly as the code evolves over time
+ * To efficiently spend programmer time
+ * To detect violations of assumptions as early as possible
+ * To minimize the impact of bugs on production use cases
+
+The guidelines above attempt to balance these:
+
+ * When the caller is expecting to handle errors, and there is no
+   broken state at the time the unexpected condition is discovered, or
+   when fixing the state is straightforward, then fixing up the state and
+   returning an error is the most robust thing to do.  However, if the
+   caller isn't expecting to handle errors, or if the state is difficult
+   to fix, then returning an error may require extensive refactoring,
+   which is not a good use of programmer time when they're certain that
+   this condition cannot occur.
+ * BUG_ON() will stop all hypervisor action immediately.  In situations
+   where continuing might allow an attacker to escalate privilege, a
+   BUG_ON() can change a privilege escalation or information leak into a
+   denial-of-service (an improvement).  But in situations where
+   continuing (say, returning an error) might be safe, then BUG_ON() can
+   change a benign failure into denial-of-service (a degradation).
+ * domain_crash() is similar to BUG_ON(), but with a more limited
+   effect: it stops that domain immediately.  In situations where
+   continuing might cause guest or hypervisor corruption, but destroying
+   the guest allows the hypervisor to continue, this can change a more
+   serious bug into a guest denial-of-service.  But in situations where
+   returning an error might be safe, then domain_crash() can change a
+   benign failure into a guest denial-of-service.
+ * ASSERT() will stop the hypervisor during development, but allow
+   hypervisor action to continue during production.  In situations where
+   continuing will at worst result in a denial-of-service, and at best
+   may have little effect other than perhaps quirky behavior, using an
+   ASSERT() will allow violation of assumptions to be detected as soon as
+   possible, while not causing undue degradation in production
+   hypervisors.  However, in situations where continuing could cause
+   privilege escalation or information leaks, using an ASSERT() can
+   introduce security vulnerabilities.
+
+Note however that domain_crash() has its own traps: callers far up the
+call stack may not realize that the domain is now dying as a result of
+an innocuous-looking operation, particularly if somewhere on the
+callstack between the initial function call and the failure, no error
+is returned.  Using domain_crash() requires careful inspection and
+documentation of the code to make sure all callers at the stack handle
+a newly-dead domain gracefully.
-- 
2.35.3


