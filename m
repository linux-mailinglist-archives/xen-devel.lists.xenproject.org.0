Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B38843D9B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673918.1048498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8N3-0001SV-OK; Wed, 31 Jan 2024 11:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673918.1048498; Wed, 31 Jan 2024 11:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8N3-0001QO-IT; Wed, 31 Jan 2024 11:03:09 +0000
Received: by outflank-mailman (input) for mailman id 673918;
 Wed, 31 Jan 2024 11:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rV8N2-0001NO-BK
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:03:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4ff0d39e-c028-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 12:03:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5AE71477;
 Wed, 31 Jan 2024 03:03:49 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E71183F762;
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
X-Inumbo-ID: 4ff0d39e-c028-11ee-8a43-1f161083a0e0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/3] xen-analysis.py: Substitute only the comment instead of the line
Date: Wed, 31 Jan 2024 11:02:40 +0000
Message-Id: <20240131110241.3951995-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131110241.3951995-1-luca.fancellu@arm.com>
References: <20240131110241.3951995-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the code in tag_database.py to substitute only the SAF-*
comment instead of replacing the line.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/tag_database.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/scripts/xen_analysis/tag_database.py b/xen/scripts/xen_analysis/tag_database.py
index abba163aec71..dc0558a46ed6 100644
--- a/xen/scripts/xen_analysis/tag_database.py
+++ b/xen/scripts/xen_analysis/tag_database.py
@@ -16,14 +16,18 @@ tool_syntax = {
     "eclair":"-E> hide VID 1 \"\""
 }
 
+def get_xen_tag_regex(tool):
+    return rf'(?P<tag>SAF-(?P<id>\d+)-(?P<type>safe|false-positive-{tool}))'
+
 
 def get_xen_tag_index_type_regex(tool):
-    return rf'^SAF-(?P<id>\d+)-(?P<type>safe|false-positive-{tool})$'
+    return rf'^{get_xen_tag_regex(tool)}$'
 
 
 def get_xen_tag_comment_regex(tool):
-    tag=rf'(?P<tag>SAF-\d+-(?:safe|false-positive-{tool}))'
-    return rf'^[ \t]*/\* +{tag}.*\*/$'
+    before_comment = r'(?P<before>[ \t]*)'
+    comment = rf'(?P<comment>/\* +{get_xen_tag_regex(tool)}.*\*/)'
+    return rf'^(?P<full_line>{before_comment}{comment})$'
 
 
 # Returns a data structure containing dictionaries for safe and false-positive-*
@@ -66,7 +70,7 @@ def load_tag_database(tool, input_files, data_struct = None, schema = "safe"):
                 # Save in safe or false-positive-* the key {#id: "comment"}
                 id_number = int(xen_tag.group('id'))
                 key = xen_tag.group('type')
-                ret[key][id_number] = "/* {} */\n".format(comment)
+                ret[key][id_number] = "/* {} */".format(comment)
             else:
                 raise TagDatabaseError(
                         "Error in database file, entry {} has unexpected "
@@ -101,7 +105,11 @@ def substitute_tags(tool, input_file, grep_struct, subs_rules):
                 id_number = int(xen_tag_regex_obj.group('id'))
                 key = xen_tag_regex_obj.group('type')
                 if id_number in subs_rules[key]:
-                    parsed_content[line_number-1] = subs_rules[key][id_number]
+                    comment_in = grep_struct["matches"][line_number]['comment']
+                    comment_out = subs_rules[key][id_number]
+                    parsed_content[line_number-1] = re.sub(
+                        re.escape(comment_in), comment_out,
+                        parsed_content[line_number-1])
 
             outfile.writelines(parsed_content)
     except Exception as e:
-- 
2.34.1


