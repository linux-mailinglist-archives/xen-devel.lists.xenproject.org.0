Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF9072F690
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548533.856501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L8o-0001d3-5A; Wed, 14 Jun 2023 07:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548533.856501; Wed, 14 Jun 2023 07:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L8o-0001bM-25; Wed, 14 Jun 2023 07:42:06 +0000
Received: by outflank-mailman (input) for mailman id 548533;
 Wed, 14 Jun 2023 07:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXBM=CC=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1q9L8m-0001bG-W5
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 07:42:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f233bc94-0a86-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 09:42:00 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F29671FB;
 Wed, 14 Jun 2023 00:42:43 -0700 (PDT)
Received: from e125920.cambridge.arm.com (e125920.cambridge.arm.com
 [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92AB13F663;
 Wed, 14 Jun 2023 00:41:58 -0700 (PDT)
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
X-Inumbo-ID: f233bc94-0a86-11ee-8611-37d641c3527e
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/2] tools/console: Add escape argument to configure escape character
Date: Wed, 14 Jun 2023 08:41:43 +0100
Message-Id: <20230614074144.3505250-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Hoyes <Peter.Hoyes@arm.com>

Dom0 may be accessed via telnet, meaning the default escape character
(which is the same as telnet's) cannot be directly used to exit the
console. It would be helpful to make the escape character customizable
in such use cases.

Add --escape argument to console tool for this purpose.

Create parse_escape_character static function to convert a character
string (which may include a '^' modifier) into an ANSI integer.

Add argument to getopt options, parse escape character and pass value
to console_loop.

If --escape is not specified, it falls back to the existing behavior
using DEFAULT_ESCAPE_SEQUENCE.

Issue-Id: SCM-4958
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I3795e654b382e78144d8210f303e3ebccec457ed
---
 tools/console/client/main.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/console/client/main.c b/tools/console/client/main.c
index 6775006488..fb7cfb04b5 100644
--- a/tools/console/client/main.c
+++ b/tools/console/client/main.c
@@ -42,7 +42,7 @@
 #include <xenstore.h>
 #include "xenctrl.h"
 
-#define ESCAPE_CHARACTER 0x1d
+#define DEFAULT_ESCAPE_CHARACTER 0x1d
 
 static volatile sig_atomic_t received_signal = 0;
 static char lockfile[sizeof (XEN_LOCK_DIR "/xenconsole.") + 8] = { 0 };
@@ -77,6 +77,7 @@ static void usage(const char *program) {
 	       "  -n, --num N      use console number N\n"
 	       "  --type TYPE      console type. must be 'pv', 'serial' or 'vuart'\n"
 	       "  --start-notify-fd N file descriptor used to notify parent\n"
+	       "  --escape E       escape sequence to exit console\n"
 	       , program);
 }
 
@@ -174,7 +175,7 @@ static void restore_term(int fd, struct termios *old)
 }
 
 static int console_loop(int fd, struct xs_handle *xs, char *pty_path,
-		        bool interactive)
+			bool interactive, char escape_character)
 {
 	int ret, xs_fd = xs_fileno(xs), max_fd = -1;
 
@@ -215,7 +216,7 @@ static int console_loop(int fd, struct xs_handle *xs, char *pty_path,
 			char msg[60];
 
 			len = read(STDIN_FILENO, msg, sizeof(msg));
-			if (len == 1 && msg[0] == ESCAPE_CHARACTER) {
+			if (len == 1 && msg[0] == escape_character) {
 				return 0;
 			} 
 
@@ -335,6 +336,7 @@ int main(int argc, char **argv)
 		{ "help",    0, 0, 'h' },
 		{ "start-notify-fd", 1, 0, 's' },
 		{ "interactive", 0, 0, 'i' },
+		{ "escape",  1, 0, 'e' },
 		{ 0 },
 
 	};
@@ -345,6 +347,7 @@ int main(int argc, char **argv)
 	console_type type = CONSOLE_INVAL;
 	bool interactive = 0;
 	const char *console_names = "serial, pv, vuart";
+	char escape_character = DEFAULT_ESCAPE_CHARACTER;
 
 	while((ch = getopt_long(argc, argv, sopt, lopt, &opt_ind)) != -1) {
 		switch(ch) {
@@ -375,6 +378,12 @@ int main(int argc, char **argv)
 		case 'i':
 			interactive = 1;
 			break;
+		case 'e':
+			if (optarg[0] == '^')
+				escape_character = optarg[1] & 0x1f;
+			else
+				escape_character = optarg[0];
+			break;
 		default:
 			fprintf(stderr, "Invalid argument\n");
 			fprintf(stderr, "Try `%s --help' for more information.\n", 
@@ -493,7 +502,7 @@ int main(int argc, char **argv)
 		close(start_notify_fd);
 	}
 
-	console_loop(spty, xs, path, interactive);
+	console_loop(spty, xs, path, interactive, escape_character);
 
 	free(path);
 	free(dom_path);
-- 
2.34.1


