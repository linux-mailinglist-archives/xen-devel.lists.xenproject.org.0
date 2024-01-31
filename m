Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A999843D9D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673920.1048516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8N5-0001we-7e; Wed, 31 Jan 2024 11:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673920.1048516; Wed, 31 Jan 2024 11:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8N5-0001t9-4i; Wed, 31 Jan 2024 11:03:11 +0000
Received: by outflank-mailman (input) for mailman id 673920;
 Wed, 31 Jan 2024 11:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rV8N4-0001NU-5G
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:03:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 50b4dbc4-c028-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 12:03:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7F61480;
 Wed, 31 Jan 2024 03:03:51 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91AFD3F762;
 Wed, 31 Jan 2024 03:03:06 -0800 (PST)
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
X-Inumbo-ID: 50b4dbc4-c028-11ee-98f5-efadbce2ee36
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] xen-analysis.py: Accept deviation comment at the end of the line
Date: Wed, 31 Jan 2024 11:02:41 +0000
Message-Id: <20240131110241.3951995-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131110241.3951995-1-luca.fancellu@arm.com>
References: <20240131110241.3951995-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the in-code suppression comment at the end of the line.
Now it is possible to add a Xen deviaiton comment with the syntax
described in the docs at the end of the line affected by the
violation, to deviate it.

Eclair natively supports it, so the translation for the tool will
be straighforward, but the other tool needs to translate an
occurrence of the tag into a suppressino comment at the end of the
previous line, this will have a corner case where the line number
1 of the file can't be deviated in this way for such tools.

Updated documentation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/documenting-violations.rst         | 10 ++++++++
 xen/scripts/xen_analysis/cppcheck_analysis.py |  2 +-
 xen/scripts/xen_analysis/generic_analysis.py  | 14 +++++++----
 xen/scripts/xen_analysis/tag_database.py      | 25 ++++++++++++++++++-
 4 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/docs/misra/documenting-violations.rst b/docs/misra/documenting-violations.rst
index 0d02a8e6f905..8f1cbd83b859 100644
--- a/docs/misra/documenting-violations.rst
+++ b/docs/misra/documenting-violations.rst
@@ -210,3 +210,13 @@ will be an entry like the following and the violation id will be in the column
 
 Given the violation id "misra-c2012-20.7", the procedure above can be followed
 to justify this finding.
+
+Another way to justify the above violation is to put the in-code comment tag
+at the end of the affected line::
+
+| extern char _start[], _end[], start[]; /* SAF-1-safe [...] */
+
+This way of deviating violations needs however to be used only when placing the
+tag above the line can't be done. This option suffers from some limitation on
+cppcheck and coverity tool that don't support natively the suppression comment
+at the end of the line.
diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index 919eb153ce9c..850335c998a3 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -41,7 +41,7 @@ def __generate_suppression_list(out_file):
     # The following lambda function will return a file if it contains lines with
     # a comment containing "cppcheck-suppress[*]" on a single line.
     grep_action = lambda x: utils.grep(x,
-                    r'^[ \t]*/\* cppcheck-suppress\[(?P<id>.*)\] \*/$')
+                    r'^.*/\* cppcheck-suppress\[(?P<id>.*)\] \*/$')
     # Look for a list of .h files that matches the condition above
     headers = utils.recursive_find_file(settings.xen_dir, r'.*\.h$',
                                         grep_action)
diff --git a/xen/scripts/xen_analysis/generic_analysis.py b/xen/scripts/xen_analysis/generic_analysis.py
index 94122aebace0..9e0cfc1bbc08 100644
--- a/xen/scripts/xen_analysis/generic_analysis.py
+++ b/xen/scripts/xen_analysis/generic_analysis.py
@@ -52,11 +52,15 @@ def parse_xen_tags():
         os.rename(file, bkp_file)
         time_bkp_file = os.stat(bkp_file)
         # Create <file> from <file>.safparse but with the Xen tag parsed
-        tag_database.substitute_tags(settings.analysis_tool, bkp_file, entry,
-                                     subs_list)
-        # Set timestamp for file equal to bkp_file, so that if the file is
-        # modified during the process by the user, we can catch it
-        os.utime(file, (time_bkp_file.st_atime, time_bkp_file.st_mtime))
+        try:
+            tag_database.substitute_tags(settings.analysis_tool, bkp_file, entry,
+                                         subs_list)
+        except Exception as e:
+            raise ParseTagPhaseError("{}".format(e))
+        finally:
+            # Set timestamp for file equal to bkp_file, so that if the file is
+            # modified during the process by the user, we can catch it
+            os.utime(file, (time_bkp_file.st_atime, time_bkp_file.st_mtime))
 
 
 def build_xen():
diff --git a/xen/scripts/xen_analysis/tag_database.py b/xen/scripts/xen_analysis/tag_database.py
index dc0558a46ed6..57746ca0ddb6 100644
--- a/xen/scripts/xen_analysis/tag_database.py
+++ b/xen/scripts/xen_analysis/tag_database.py
@@ -25,7 +25,7 @@ def get_xen_tag_index_type_regex(tool):
 
 
 def get_xen_tag_comment_regex(tool):
-    before_comment = r'(?P<before>[ \t]*)'
+    before_comment = r'(?P<before>.*)'
     comment = rf'(?P<comment>/\* +{get_xen_tag_regex(tool)}.*\*/)'
     return rf'^(?P<full_line>{before_comment}{comment})$'
 
@@ -106,7 +106,30 @@ def substitute_tags(tool, input_file, grep_struct, subs_rules):
                 key = xen_tag_regex_obj.group('type')
                 if id_number in subs_rules[key]:
                     comment_in = grep_struct["matches"][line_number]['comment']
+                    before = grep_struct["matches"][line_number]['before']
                     comment_out = subs_rules[key][id_number]
+                    if before != '' and not re.match(r'^[ \t]+$', before):
+                        # The comment is at the end of some line with some code
+                        if tool == "eclair":
+                            # Eclair supports comment at the end of the line, so
+                            # the only thing to do is use the right syntax in
+                            # the comment, the default version of it is
+                            # deviating the current line and the next one
+                            comment_out = re.sub(r'\d+ ""', '0 ""', comment_out)
+                        else:
+                            # Other tool does not support deviating the same
+                            # line of the comment, so we use a trick and we use
+                            # the comment at the end of the previous line
+                            if line_number-2 < 0:
+                                raise TagDatabaseError(
+                                    "The comment {} using the tool '{}' can't "
+                                    "stay at the end of the line 1."
+                                    .format(comment_in, tool)
+                                )
+                            parsed_content[line_number-2] = \
+                                parsed_content[line_number-2].replace("\n",
+                                    comment_out + '\n')
+                            comment_out = ''
                     parsed_content[line_number-1] = re.sub(
                         re.escape(comment_in), comment_out,
                         parsed_content[line_number-1])
-- 
2.34.1


