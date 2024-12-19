Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F449F82F8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 19:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861416.1273371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL2e-0006mf-He; Thu, 19 Dec 2024 18:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861416.1273371; Thu, 19 Dec 2024 18:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL2e-0006k2-F5; Thu, 19 Dec 2024 18:14:32 +0000
Received: by outflank-mailman (input) for mailman id 861416;
 Thu, 19 Dec 2024 18:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ2H=TM=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOL2d-0006VU-BE
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 18:14:31 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1760b684-be35-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 19:14:30 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 19:14:30 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 26FD12350;
 Thu, 19 Dec 2024 19:14:30 +0100 (CET)
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
X-Inumbo-ID: 1760b684-be35-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734632071; x=1766168071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7LQgNvTdzlEhe7rJ7bWpvqG13yqZ7KAZK6TXTmWxmAQ=;
  b=VkHr3TU6raPZmR0tbZ3eLVIEztbOUPONjdbP2sEVvIJrZn+zz2aHuThp
   COSV8tQT/8JqLZmc/ZY4nkZgZzFPD2f9u3A4hAow5Ow6t9Ht1W1+xJVwz
   PdR1vBmylBFr6wgleikRU/jR91w0+jYPoinN+61h7Q85in9vWuHnDAP46
   c=;
X-CSE-ConnectionGUID: CFqTAF0LQ0O1tdTYlyC+ug==
X-CSE-MsgGUID: LsnL8uAoT7+smUHbG5PbaA==
X-IronPort-AV: E=Sophos;i="6.12,248,1728943200"; 
   d="scan'208";a="28259976"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/1] xen/scripts: Fix regex syntax warnings with Python 3.12
Date: Thu, 19 Dec 2024 19:10:43 +0100
Message-ID: <20241219181352.709315-2-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219181352.709315-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241219181352.709315-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Same fix than commit 826a9eb072 (tools: Fix regex syntax warnings with Python 3.12).

It clears out the warning:

```
$ xen/scripts/xen-analysis.py
xen/scripts/xen_analysis/cppcheck_analysis.py:94: SyntaxWarning: invalid escape sequence '\*'
  comment_line_starts = re.match('^[ \t]*/\*.*$', line)
```

The  warning appears only the first time the command is run, then it disappears.

Fixes: 02b26c02c7 (xen/scripts: add cppcheck tool to the xen-analysis.py script)
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
--
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/scripts/xen_analysis/cppcheck_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index ce7bda91b6..532a14b0ad 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -91,7 +91,7 @@ def __generate_suppression_list(out_file):
                         line = header_content[tmp_line]
                         # Matches a line with just optional spaces/tabs and the
                         # start of a comment '/*'
-                        comment_line_starts = re.match('^[ \t]*/\*.*$', line)
+                        comment_line_starts = re.match(r'^[ \t]*/\*.*$', line)
                         # Matches a line with text and the end of a comment '*/'
                         comment_line_stops = re.match(r'^.*\*/$', line)
                         if (not comment_section) and comment_line_starts:
-- 
2.47.1


