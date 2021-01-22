Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F32FFEF9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72606.130777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sfG-0003Bw-Lj; Fri, 22 Jan 2021 09:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72606.130777; Fri, 22 Jan 2021 09:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sfG-0003BQ-Hm; Fri, 22 Jan 2021 09:23:34 +0000
Received: by outflank-mailman (input) for mailman id 72606;
 Fri, 22 Jan 2021 09:23:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2lNi=GZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2sfE-00039U-MM
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:23:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91971c0e-c5f4-4513-a679-c5ded72c5398;
 Fri, 22 Jan 2021 09:23:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F78CB7E8;
 Fri, 22 Jan 2021 09:23:26 +0000 (UTC)
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
X-Inumbo-ID: 91971c0e-c5f4-4513-a679-c5ded72c5398
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611307406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MikItFydNmrteNvewwRFjrYAN9eawECLuYbsZsHdms=;
	b=PQk/ZDnju8jYMuedF1faFvFqjSrlxQz7pwavIqp0nyFMcVnuRLH0+g1WliIMHKBlyLbzhO
	umauqu9Yfzs88x+1ZIDyH19lK+7z+os34b5FrZE8dO7gQspt0K0z2ZuiTUa+38z1TnpIeL
	DIkWidH8vByjp2rbqwXr/8P8DkcYPEE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 2/4] tools/xenstore: claim resources when running as daemon
Date: Fri, 22 Jan 2021 10:23:22 +0100
Message-Id: <20210122092324.7178-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122092324.7178-1-jgross@suse.com>
References: <20210122092324.7178-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenstored is absolutely mandatory for a Xen host and it can't be
restarted, so being killed by OOM-killer in case of memory shortage is
to be avoided.

Set /proc/$pid/oom_score_adj (if available) to -500 in order to allow
xenstored to use large amounts of memory without being killed.

In order to support large numbers of domains the limit for open file
descriptors might need to be raised. Each domain needs 2 file
descriptors (one for the event channel and one for the xl per-domain
daemon to connect to xenstored).

Try to raise ulimit for open files to 65536. First the hard limit if
needed, and then the soft limit.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   |  2 ++
 tools/xenstore/xenstored_core.h   |  3 ++
 tools/xenstore/xenstored_minios.c |  4 +++
 tools/xenstore/xenstored_posix.c  | 46 +++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index c89f5202fe..a957055d87 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2244,6 +2244,8 @@ int main(int argc, char *argv[])
 		xprintf = trace;
 #endif
 
+	claim_resources();
+
 	signal(SIGHUP, trigger_reopen_log);
 	if (tracefile)
 		tracefile = talloc_strdup(NULL, tracefile);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 84b364d82c..052db6a56a 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -258,6 +258,9 @@ void daemonize(void);
 /* Close stdin/stdout/stderr to complete daemonize */
 void finish_daemonize(void);
 
+/* Set OOM-killer score and raise ulimit. */
+void claim_resources(void);
+
 /* Open a pipe for signal handling */
 void init_pipe(int reopen_log_pipe[2]);
 
diff --git a/tools/xenstore/xenstored_minios.c b/tools/xenstore/xenstored_minios.c
index c94493e52a..df8ff580b0 100644
--- a/tools/xenstore/xenstored_minios.c
+++ b/tools/xenstore/xenstored_minios.c
@@ -32,6 +32,10 @@ void finish_daemonize(void)
 {
 }
 
+void claim_resources(void)
+{
+}
+
 void init_pipe(int reopen_log_pipe[2])
 {
 	reopen_log_pipe[0] = -1;
diff --git a/tools/xenstore/xenstored_posix.c b/tools/xenstore/xenstored_posix.c
index 48c37ffe3e..0074fbd8b2 100644
--- a/tools/xenstore/xenstored_posix.c
+++ b/tools/xenstore/xenstored_posix.c
@@ -22,6 +22,7 @@
 #include <fcntl.h>
 #include <stdlib.h>
 #include <sys/mman.h>
+#include <sys/resource.h>
 
 #include "utils.h"
 #include "xenstored_core.h"
@@ -87,6 +88,51 @@ void finish_daemonize(void)
 	close(devnull);
 }
 
+static void avoid_oom_killer(void)
+{
+	char path[32];
+	char val[] = "-500";
+	int fd;
+
+	snprintf(path, sizeof(path), "/proc/%d/oom_score_adj", (int)getpid());
+
+	fd = open(path, O_WRONLY);
+	/* Do nothing if file doesn't exist. */
+	if (fd < 0)
+		return;
+	/* Ignore errors. */
+	write(fd, val, sizeof(val));
+	close(fd);
+}
+
+/* Max. 32752 domains with 2 open files per domain, plus some spare. */
+#define MAX_FILES 65536
+static void raise_ulimit(void)
+{
+	struct rlimit rlim;
+
+	if (getrlimit(RLIMIT_NOFILE, &rlim))
+		return;
+	if (rlim.rlim_max != RLIM_INFINITY && rlim.rlim_max < MAX_FILES)
+	{
+		rlim.rlim_max = MAX_FILES;
+		setrlimit(RLIMIT_NOFILE, &rlim);
+	}
+	if (getrlimit(RLIMIT_NOFILE, &rlim))
+		return;
+	if (rlim.rlim_max == RLIM_INFINITY || rlim.rlim_max > MAX_FILES)
+		rlim.rlim_cur = MAX_FILES;
+	else
+		rlim.rlim_cur = rlim.rlim_max;
+	setrlimit(RLIMIT_NOFILE, &rlim);
+}
+
+void claim_resources(void)
+{
+	avoid_oom_killer();
+	raise_ulimit();
+}
+
 void init_pipe(int reopen_log_pipe[2])
 {
 	int flags;
-- 
2.26.2


