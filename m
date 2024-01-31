Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E698843D9C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673919.1048512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8N5-0001sr-1A; Wed, 31 Jan 2024 11:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673919.1048512; Wed, 31 Jan 2024 11:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8N4-0001qN-UA; Wed, 31 Jan 2024 11:03:10 +0000
Received: by outflank-mailman (input) for mailman id 673919;
 Wed, 31 Jan 2024 11:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rV8N2-0001NU-KK
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:03:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4f869515-c028-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 12:03:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3894311FB;
 Wed, 31 Jan 2024 03:03:49 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A2883F762;
 Wed, 31 Jan 2024 03:03:05 -0800 (PST)
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
X-Inumbo-ID: 4f869515-c028-11ee-98f5-efadbce2ee36
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/3] xen-analysis.py: Use named group for tag regex
Date: Wed, 31 Jan 2024 11:02:39 +0000
Message-Id: <20240131110241.3951995-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131110241.3951995-1-luca.fancellu@arm.com>
References: <20240131110241.3951995-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use named group for the regex matching a tag identifier, this
is done to ease retrieving the matching group instead of using
an index.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/cppcheck_analysis.py |  4 ++--
 xen/scripts/xen_analysis/tag_database.py      | 24 +++++++++----------
 xen/scripts/xen_analysis/utils.py             |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index e54848aa5339..919eb153ce9c 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -41,7 +41,7 @@ def __generate_suppression_list(out_file):
     # The following lambda function will return a file if it contains lines with
     # a comment containing "cppcheck-suppress[*]" on a single line.
     grep_action = lambda x: utils.grep(x,
-                    r'^[ \t]*/\* cppcheck-suppress\[(.*)\] \*/$')
+                    r'^[ \t]*/\* cppcheck-suppress\[(?P<id>.*)\] \*/$')
     # Look for a list of .h files that matches the condition above
     headers = utils.recursive_find_file(settings.xen_dir, r'.*\.h$',
                                         grep_action)
@@ -97,7 +97,7 @@ def __generate_suppression_list(out_file):
                         if (not comment_section) and comment_line_starts:
                             comment_section = True
                         if (len(line.strip()) != 0) and (not comment_section):
-                            cppcheck_violation_id = entry["matches"][line_num][0]
+                            cppcheck_violation_id = entry["matches"][line_num]['id']
                             break
                         if comment_section and comment_line_stops:
                             comment_section = False
diff --git a/xen/scripts/xen_analysis/tag_database.py b/xen/scripts/xen_analysis/tag_database.py
index ca374bbb62dd..abba163aec71 100644
--- a/xen/scripts/xen_analysis/tag_database.py
+++ b/xen/scripts/xen_analysis/tag_database.py
@@ -18,11 +18,12 @@ tool_syntax = {
 
 
 def get_xen_tag_index_type_regex(tool):
-    return r'^SAF-(\d+)-(safe|false-positive-' + tool + ')$'
+    return rf'^SAF-(?P<id>\d+)-(?P<type>safe|false-positive-{tool})$'
 
 
 def get_xen_tag_comment_regex(tool):
-    return r'^[ \t]*/\* +(SAF-\d+-(?:safe|false-positive-' + tool + ')).*\*/$'
+    tag=rf'(?P<tag>SAF-\d+-(?:safe|false-positive-{tool}))'
+    return rf'^[ \t]*/\* +{tag}.*\*/$'
 
 
 # Returns a data structure containing dictionaries for safe and false-positive-*
@@ -60,12 +61,11 @@ def load_tag_database(tool, input_files, data_struct = None, schema = "safe"):
         if proprietary_id != "":
             comment=tool_syntax[tool].replace("VID",proprietary_id)
             # Regex to capture the index of the Xen tag and the schema
-            xen_tag = re.compile(get_xen_tag_index_type_regex(tool))\
-                            .match(entry["id"])
-            if xen_tag and xen_tag.group(1) and xen_tag.group(2):
+            xen_tag = re.match(get_xen_tag_index_type_regex(tool), entry["id"])
+            if xen_tag and xen_tag.group('id') and xen_tag.group('type'):
                 # Save in safe or false-positive-* the key {#id: "comment"}
-                id_number = int(xen_tag.group(1))
-                key = xen_tag.group(2)
+                id_number = int(xen_tag.group('id'))
+                key = xen_tag.group('type')
                 ret[key][id_number] = "/* {} */\n".format(comment)
             else:
                 raise TagDatabaseError(
@@ -95,11 +95,11 @@ def substitute_tags(tool, input_file, grep_struct, subs_rules):
             # information access the subs_rules dictionary to see if there is
             # a match
             for line_number in grep_struct["matches"]:
-                xen_tag = grep_struct["matches"][line_number][0]
-                xen_tag_regex_obj = re.compile(
-                            get_xen_tag_index_type_regex(tool)).match(xen_tag)
-                id_number = int(xen_tag_regex_obj.group(1))
-                key = xen_tag_regex_obj.group(2)
+                xen_tag = grep_struct["matches"][line_number]['tag']
+                xen_tag_regex_obj = re.match(get_xen_tag_index_type_regex(tool),
+                                             xen_tag)
+                id_number = int(xen_tag_regex_obj.group('id'))
+                key = xen_tag_regex_obj.group('type')
                 if id_number in subs_rules[key]:
                     parsed_content[line_number-1] = subs_rules[key][id_number]
 
diff --git a/xen/scripts/xen_analysis/utils.py b/xen/scripts/xen_analysis/utils.py
index 1193e3f4631e..eef48eeb7e87 100644
--- a/xen/scripts/xen_analysis/utils.py
+++ b/xen/scripts/xen_analysis/utils.py
@@ -12,7 +12,7 @@ def grep(filepath, regex):
             for line in f:
                 match = regObj.match(line)
                 if match:
-                    res["matches"][line_number] = match.groups()
+                    res["matches"][line_number] = match
                 line_number = line_number + 1
     except Exception as e:
         print("WARNING: Can't open {}: {}".format(filepath, e))
-- 
2.34.1


