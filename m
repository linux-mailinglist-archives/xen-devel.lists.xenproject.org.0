Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FD765910
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 18:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571230.894594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP472-0004Oh-Tx; Thu, 27 Jul 2023 16:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571230.894594; Thu, 27 Jul 2023 16:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP472-0004MA-Qr; Thu, 27 Jul 2023 16:45:16 +0000
Received: by outflank-mailman (input) for mailman id 571230;
 Thu, 27 Jul 2023 16:45:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k29T=DN=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1qP471-00047I-6J
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 16:45:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f4d9edec-2c9c-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 18:45:13 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2C06FEC;
 Thu, 27 Jul 2023 09:45:55 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E62C3F5A1;
 Thu, 27 Jul 2023 09:45:11 -0700 (PDT)
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
X-Inumbo-ID: f4d9edec-2c9c-11ee-8613-37d641c3527e
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	luca.fancellu@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Hongda Deng <hongda.deng@arm.com>
Subject: [PATCH v6 1/2] tools/console: Add escape argument to configure escape character
Date: Thu, 27 Jul 2023 17:44:48 +0100
Message-Id: <20230727164450.77640-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727164450.77640-1-peter.hoyes@arm.com>
References: <20230727164450.77640-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Hoyes <Peter.Hoyes@arm.com>

Dom0 may be accessed via telnet, meaning the default escape character
(which is the same as telnet's) cannot be directly used to exit the
console. It would be helpful to make the escape character customizable
in such use cases.

Add --escape argument to console tool for this purpose.

Add argument to getopt options, parse and validate the escape character
and pass value to console_loop.

If --escape is not specified, it falls back to the existing behavior
using DEFAULT_ESCAPE_SEQUENCE.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Hongda Deng <hongda.deng@arm.com>
---
Changes in v5:
- Add this changelog

Changes in v4:
- Improve validation of the escape_character optarg

Changes in v3:
- Re-add the Reviewed-By tag accidentally removed in v2

Changes in v2:
- Drop the tags intended only for internal use at Arm

 tools/console/client/main.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/console/client/main.c b/tools/console/client/main.c
index 6775006488..d2dcc3ddca 100644
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
@@ -375,6 +378,16 @@ int main(int argc, char **argv)
 		case 'i':
 			interactive = 1;
 			break;
+		case 'e':
+			if (optarg[0] == '^' && optarg[1] && optarg[2] == '\0')
+				escape_character = optarg[1] & 0x1f;
+			else if (optarg[0] && optarg[1] == '\0')
+				escape_character = optarg[0];
+			else {
+				fprintf(stderr, "Invalid escape argument\n");
+				exit(EINVAL);
+			}
+			break;
 		default:
 			fprintf(stderr, "Invalid argument\n");
 			fprintf(stderr, "Try `%s --help' for more information.\n", 
@@ -493,7 +506,7 @@ int main(int argc, char **argv)
 		close(start_notify_fd);
 	}
 
-	console_loop(spty, xs, path, interactive);
+	console_loop(spty, xs, path, interactive, escape_character);
 
 	free(path);
 	free(dom_path);
-- 
2.34.1


