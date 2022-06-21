Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06437552F7A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 12:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353158.580068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3arV-0001go-73; Tue, 21 Jun 2022 10:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353158.580068; Tue, 21 Jun 2022 10:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3arV-0001dm-3j; Tue, 21 Jun 2022 10:11:57 +0000
Received: by outflank-mailman (input) for mailman id 353158;
 Tue, 21 Jun 2022 10:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/KMk=W4=citrix.com=prvs=16408edfd=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o3arT-0001dg-8N
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 10:11:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9158e4a7-f14a-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 12:11:52 +0200 (CEST)
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
X-Inumbo-ID: 9158e4a7-f14a-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655806312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7MDJa/m5qjvzvr9hb3TI3e/TXp0vIhk0EimgAI5h7z8=;
  b=ETp6PaeArAqyl4x2MnlgpnGyN5b1a0Kf5RfwETpd2wyMNwY/esh2DsLR
   MYSxyqIixRX7e5LVPzBIA0XcdF1SzsQB6HbMMzWCC9YnR++TNGH+mNnEN
   6Q5MZP0y+22F6c/uCR6ZU+5zJoGm+p8TVQ7iKZ5By57X+2YUEzOYrSw0w
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74055919
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:y0fO/6mIC9K4DnBqOedlZcHo5gyTJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWTqCPPuCNmvwfYt+Pt63/R4PvMXVzYQwTFM5/ylnQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DnWVrV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYWV4rZv3+gv8haj4bITBEG/BA4I2bCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGNWIyMUWZMnWjPH8uN5URh+2OtkW4fhJ7twiVmq8czTXcmVkZPL/Fb4OOJ43iqd9utkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O8c38h2Xw6zYpSOQHHEZTyVpYcYj8sQxQFQC1
 FWEgtfoDjxHq6CORDSW8bL8kN+pEXFLdylYP3ZCFFZbpYm4yG0usv7RZsY6EvblvMfuJQjXg
 AKblg5jga0h0edegs1X4mv7byKQSonhF1Bou1qIAzL7sWuVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2aBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMUsK1LfpH40PB/Pt4wIrKTLufhnU
 ap3jO72VSpKYUiZ5GHeqxghPU8DmXllmDK7qWHTxBW7y7uODEOopUM+GALWNIgRtfrcyC2Mq
 oY3H5bbkH13DbyhChQ7BKZOdDjm21BgXcCowyGWH8beSjdb9JYJUaSOmul+IdI7wsy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:sXKYbK7YFtBS4KbPawPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.92,209,1650945600"; 
   d="scan'208";a="74055919"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v2.1 1/4] build,include: rework shell script for headers++.chk
Date: Tue, 21 Jun 2022 11:11:28 +0100
Message-ID: <20220621101128.50543-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614162248.40278-1-anthony.perard@citrix.com>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The command line generated for headers++.chk by make is quite long,
and in some environment it is too long. This issue have been seen in
Yocto build environment.

Error messages:
    make[9]: execvp: /bin/sh: Argument list too long
    make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127

Rework so that we do the foreach loop in shell rather that make to
reduce the command line size by a lot. We also need a way to get
headers prerequisite for some public headers so we use a switch "case"
in shell to be able to do some simple pattern matching. Variables
alone in POSIX shell don't allow to work with associative array or
variables with "/".

Also rework headers99.chk as it has a similar implementation, even if
with only two headers to check the command line isn't too long at the
moment.

Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---

Notes:
    v3:
    - add one more pattern to avoid a possible empty body for "case"
    - use $() instead of `` to execute get_prereq()
    - also convert headers99_chk
    - convert some 'tab' to 'space', have only 1 tab at start of line
    
    v2:
    - fix typo in commit message
    - fix out-of-tree build
    
    v1:
    - was sent as a reply to v1 of the series

 xen/include/Makefile | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 617599df7e..510f65c92a 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -141,13 +141,24 @@ cmd_header_chk = \
 quiet_cmd_headers99_chk = CHK     $@
 define cmd_headers99_chk
 	rm -f $@.new; \
-	$(foreach i, $(filter %.h,$^),                                        \
-	    echo "#include "\"$(i)\"                                          \
+	get_prereq() {                                                        \
+	    case $$1 in                                                       \
+	    $(foreach i, $(filter %.h,$^),                                    \
+	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
+	        $(i)$(close)                                                  \
+	        echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
+	                -include $(j).h)";;))                                 \
+	    *) ;;                                                             \
+	    esac;                                                             \
+	};                                                                    \
+	for i in $(filter %.h,$^); do                                         \
+	    echo "#include "\"$$i\"                                           \
 	    | $(CC) -x c -std=c99 -Wall -Werror                               \
 	      -include stdint.h                                               \
-	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include $(j).h) \
+	      $$(get_prereq $$i)                                              \
 	      -S -o /dev/null -                                               \
-	    || exit $$?; echo $(i) >> $@.new;) \
+	    || exit $$?; echo $$i >> $@.new;                                  \
+	done;                                                                 \
 	mv $@.new $@
 endef
 
@@ -158,13 +169,23 @@ define cmd_headerscxx_chk
 	    touch $@.new;                                                     \
 	    exit 0;                                                           \
 	fi;                                                                   \
-	$(foreach i, $(filter %.h,$^),                                        \
-	    echo "#include "\"$(i)\"                                          \
+	get_prereq() {                                                        \
+	    case $$1 in                                                       \
+	    $(foreach i, $(filter %.h,$^),                                    \
+	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
+	        $(i)$(close)                                                  \
+	        echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
+	                -include c$(j))";;))                                  \
+	    *) ;;                                                             \
+	    esac;                                                             \
+	};                                                                    \
+	for i in $(filter %.h,$^); do                                         \
+	    echo "#include "\"$$i\"                                           \
 	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
 	      -include stdint.h -include $(srcdir)/public/xen.h               \
-	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) \
+	      $$(get_prereq $$i)                                              \
 	      -S -o /dev/null -                                               \
-	    || exit $$?; echo $(i) >> $@.new;) \
+	    || exit $$?; echo $$i >> $@.new; done;                            \
 	mv $@.new $@
 endef
 
-- 
Anthony PERARD


