Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFD36CAC1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118789.225049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0r-00028Y-6m; Tue, 27 Apr 2021 18:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118789.225049; Tue, 27 Apr 2021 18:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0r-00027s-0I; Tue, 27 Apr 2021 18:00:45 +0000
Received: by outflank-mailman (input) for mailman id 118789;
 Tue, 27 Apr 2021 18:00:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0p-00027E-QX
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0p-0004pf-NX
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0p-0001lX-MX
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:43 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lbS0n-0003ln-MJ; Tue, 27 Apr 2021 19:00:42 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=RKj3y4pvDAFofYle6tGS37iZPPboeDEgBiU4eIgQ5Oo=; b=Iv9qXyWlqrkF1561qEKKRTlVgV
	Qe0/MVYjEZkbbkYSRd4Bfo7qQg9vFhScsvBHH7Qojk9sV4pB8/tHk7Y014UxWvKs3Rm8fmKwnnoC/
	UCJU4XIRjALRaumWidOn1G2w0Vc4Ks6/Dh5Q+55EoGSxVNOQwI4/Kp8deBNs6VZ7bQN4=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/7] mg-schema-test-database: posgtres compat: psql transactions
Date: Tue, 27 Apr 2021 19:00:27 +0100
Message-Id: <20210427180033.9439-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427180033.9439-1-iwj@xenproject.org>
References: <20210427180033.9439-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now (postgresql 11):

 * psql transaction behaviour has changed so that now we want to
   use the -1 option.  This obviates a few BEGIN and COMMITs.

 * SET implicitly starts a transaction and DROP and CREATE DATABASE
   aren't transactional and now complain if they are run in a
   transaction.  So we must add COMMIT after SET.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-create        |  2 +-
 mg-schema-test-database | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/mg-schema-create b/mg-schema-create
index 9bb3040a..3a344db4 100755
--- a/mg-schema-create
+++ b/mg-schema-create
@@ -89,7 +89,7 @@ fi
 
 $progress "Populating database..."
 
-$(get_psql_cmd) $quietopt -f schema/initial.sql
+$(get_psql_cmd) $quietopt -1 -f schema/initial.sql
 
 if $do_updates; then
     ./mg-schema-update $quietopt apply-all "${updates[@]}"
diff --git a/mg-schema-test-database b/mg-schema-test-database
index dab536c5..e69b9881 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -132,7 +132,7 @@ psql_query () {
 }
 
 psql_do_cmd () {
-	echo "$(get_psql_cmd) ${OSSTEST_DEBUG:+-e -a}" 
+	echo "$(get_psql_cmd) ${OSSTEST_DEBUG:+-e -a}" -1
 }
 
 psql_do () {
@@ -411,7 +411,9 @@ END
 	#---------- create test db ----------
 
 	psql_do <<END
+		COMMIT;
 		CREATE DATABASE $dbname;
+		BEGIN;
 END
 	withtest ./mg-schema-create -q --no-updates
 
@@ -449,12 +451,10 @@ END
 
 	for task in $tasks; do
 		psql_do <<END
-			BEGIN;
 			$(make_xdbref_task $dbname 'borrowed for test db' \
 				$task "$username@$nodename")
 			UPDATE resources SET owntaskid = $(borrowtaskid $task)
 				WHERE owntaskid=$task;
-			COMMIT;
 END
 	done
 
@@ -466,7 +466,6 @@ END
 
 	cat >>$t.import <<END
 		\o $t.import-output
-		BEGIN;
 		SET CONSTRAINTS ALL DEFERRED;
 END
 
@@ -500,7 +499,6 @@ END
 			WHERE owntaskid != $(borrowtaskid $task)
 			  AND owntaskid != $(taskid magic shared)
 			  AND owntaskid != $(taskid magic preparing);
-		COMMIT;
 END
 
 	printf "Copy..."
@@ -519,11 +517,9 @@ END
 
 	for task in $tasks; do
 		(withtest psql_do <<END
-			BEGIN;
 			UPDATE resources
 				SET owntaskid = $(taskid magic idle)
 				WHERE owntaskid = $(borrowtaskid $task);
-			COMMIT;
 END
                 )
 	done
@@ -551,7 +547,9 @@ drop)
 
 	psql_do <<END
                 SET client_min_messages = WARNING;
+		COMMIT;
 		DROP DATABASE IF EXISTS $dbname;
+		BEGIN;
 		UPDATE resources
 			SET owntaskid = CAST(tasks.refinfo AS INTEGER)
 			FROM tasks
-- 
2.20.1


