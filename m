Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D509F1FDD
	for <lists+xen-devel@lfdr.de>; Sat, 14 Dec 2024 17:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857387.1269700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMUn0-0006CK-Nq; Sat, 14 Dec 2024 16:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857387.1269700; Sat, 14 Dec 2024 16:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMUn0-0006AT-KB; Sat, 14 Dec 2024 16:14:46 +0000
Received: by outflank-mailman (input) for mailman id 857387;
 Sat, 14 Dec 2024 16:14:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dh7k=TH=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tMUmz-0006AH-RT
 for xen-devel@lists.xenproject.org; Sat, 14 Dec 2024 16:14:45 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876dfd29-ba36-11ef-99a3-01e77a169b0f;
 Sat, 14 Dec 2024 17:14:43 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 14 Dec 2024 17:14:43 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 272AA2C55;
 Sat, 14 Dec 2024 17:14:43 +0100 (CET)
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
X-Inumbo-ID: 876dfd29-ba36-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734192884; x=1765728884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OPZcqoYnos1qDgrzyTEHlZczqYru4m8U1RTFC0EoMks=;
  b=CTcYYxe43Yq4CkNFgi5O+AAzyTFLZdjvZ1jZkElaChMU4fGIwLxkrJq1
   Xr0n7UWjTqjoT1aw4gG6bK2hEBDXewO309V6m+8Z5zyqVh+cIwiZrFOxp
   ne0uql/n1HN5KinjUbhoXgT4jdOakAFbUFsbJPkTvn4sgADtMLTNabLMi
   A=;
X-CSE-ConnectionGUID: K0GWcpOhRWaD/5qqjLPwjg==
X-CSE-MsgGUID: mR7jXJG6TGuWOnWQFTyL9g==
X-IronPort-AV: E=Sophos;i="6.12,234,1728943200"; 
   d="scan'208";a="28182307"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	nthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH 1/1] tools, xen/scripts: clear out Python syntax warnings
Date: Sat, 14 Dec 2024 17:09:51 +0100
Message-ID: <20241214161350.70515-3-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* since 3.12 invalid escape sequences generate SyntaxWarning
* in the future, these invalid sequences will generate SyntaxError
* therefore changed syntax to raw string notation.

Link: https://docs.python.org/3/whatsnew/3.12.html#other-language-changes
Fixes: e45e8f69047 ("bitkeeper revision 1.803 (4056f51d2UjBnn9uwzC9Vu3LspnUCg)")
Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has new commands in menuentry")
Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default entry in string format")
Fixes: 622e368758b ("Add ZFS libfsimage support patch")
Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppcheck version check")

Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
---
 tools/misc/xensymoops                         | 4 ++--
 tools/pygrub/src/GrubConf.py                  | 4 ++--
 tools/pygrub/src/pygrub                       | 6 +++---
 xen/scripts/xen_analysis/cppcheck_analysis.py | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/misc/xensymoops b/tools/misc/xensymoops
index 835d187e90..bec75cae93 100755
--- a/tools/misc/xensymoops
+++ b/tools/misc/xensymoops
@@ -17,7 +17,7 @@ def read_oops():
     stack_addrs is a dictionary mapping potential code addresses in the stack
       to their order in the stack trace.
     """
-    stackaddr_ptn = "\[([a-z,0-9]*)\]"
+    stackaddr_ptn = r"\[([a-z,0-9]*)\]"
     stackaddr_re  = re.compile(stackaddr_ptn)
 
     eip_ptn = ".*EIP:.*<([a-z,0-9]*)>.*"
@@ -67,7 +67,7 @@ addr_ptn = "([a-z,0-9]*):"
 addr_re  = re.compile(addr_ptn)
 
 # regexp to match the start of functions in the objdump
-func_ptn = "(.*<[\S]*>):"
+func_ptn = r"(.*<[\S]*>):"
 func_re  = re.compile(func_ptn)
 
 func = "<No function>" # holds the name of the current function being scanned
diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubConf.py
index 580c9628ca..7cd2bc9aeb 100644
--- a/tools/pygrub/src/GrubConf.py
+++ b/tools/pygrub/src/GrubConf.py
@@ -320,7 +320,7 @@ class GrubConfigFile(_GrubConfigFile):
 def grub2_handle_set(arg):
     (com,arg) = grub_split(arg,2)
     com="set:" + com
-    m = re.match("([\"\'])(.*)\\1", arg)
+    m = re.match(r"([\"\'])(.*)\\1", arg)
     if m is not None:
         arg=m.group(2)
     return (com,arg)
@@ -402,7 +402,7 @@ class Grub2ConfigFile(_GrubConfigFile):
                 continue
 
             # new image
-            title_match = re.match('^menuentry ["\'](.*?)["\'] (.*){', l)
+            title_match = re.match(r'^menuentry ["\'](.*?)["\'] (.*){', l)
             if title_match:
                 if img is not None:
                     raise RuntimeError("syntax error: cannot nest menuentry (%d %s)" % (len(img),img))
diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index 9d51f96070..58b088d285 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -614,7 +614,7 @@ class Grub:
             title = self.cf.default
             while 1:
                 try:
-                    title = re.search('(\S)>(\S.+$)',title).group(2)
+                    title = re.search(r'(\S)>(\S.+$)',title).group(2)
                 except AttributeError:
                     break
 
@@ -1039,7 +1039,7 @@ if __name__ == "__main__":
 
     # if boot filesystem is set then pass to fsimage.open
     bootfsargs = '"%s"' % incfg["args"]
-    bootfsgroup = re.findall('zfs-bootfs=(.*?)[\s\,\"]', bootfsargs)
+    bootfsgroup = re.findall(r'zfs-bootfs=(.*?)[\s\,\"]', bootfsargs)
     if bootfsgroup:
         bootfsoptions = bootfsgroup[0]
     else:
@@ -1104,7 +1104,7 @@ if __name__ == "__main__":
     if chosencfg["args"]:
         zfsinfo = xenfsimage.getbootstring(fs)
         if zfsinfo is not None:
-            e = re.compile("zfs-bootfs=[\w\-\.\:@/]+" )
+            e = re.compile(r"zfs-bootfs=[\w\-\.\:@/]+" )
             (chosencfg["args"],count) = e.subn(zfsinfo, chosencfg["args"])
             if count == 0:
                chosencfg["args"] += " -B %s" % zfsinfo
diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index 850335c998..ce7bda91b6 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -93,7 +93,7 @@ def __generate_suppression_list(out_file):
                         # start of a comment '/*'
                         comment_line_starts = re.match('^[ \t]*/\*.*$', line)
                         # Matches a line with text and the end of a comment '*/'
-                        comment_line_stops = re.match('^.*\*/$', line)
+                        comment_line_stops = re.match(r'^.*\*/$', line)
                         if (not comment_section) and comment_line_starts:
                             comment_section = True
                         if (len(line.strip()) != 0) and (not comment_section):
@@ -157,7 +157,7 @@ def generate_cppcheck_deps():
             "Error occured retrieving cppcheck version:\n{}\n\n{}"
         )
 
-    version_regex = re.search('^Cppcheck (\d+)\.(\d+)(?:\.\d+)?$',
+    version_regex = re.search(r'^Cppcheck (\d+)\.(\d+)(?:\.\d+)?$',
                               invoke_cppcheck, flags=re.M)
     # Currently, only cppcheck version >= 2.7 is supported, but version 2.8 is
     # known to be broken, please refer to docs/misra/cppcheck.txt
-- 
2.47.1


