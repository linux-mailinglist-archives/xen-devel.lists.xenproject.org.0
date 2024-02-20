Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE085BE29
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 15:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683538.1063105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcQmo-0006Yo-PX; Tue, 20 Feb 2024 14:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683538.1063105; Tue, 20 Feb 2024 14:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcQmo-0006Wi-Mw; Tue, 20 Feb 2024 14:07:54 +0000
Received: by outflank-mailman (input) for mailman id 683538;
 Tue, 20 Feb 2024 14:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vNk=J5=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rcQmn-0006Wc-Vu
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 14:07:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6febc2bd-cff9-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 15:07:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41270d3ce26so2754835e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 06:07:52 -0800 (PST)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c511400b00410395dc7d1sm15205352wms.7.2024.02.20.06.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:07:44 -0800 (PST)
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
X-Inumbo-ID: 6febc2bd-cff9-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708438071; x=1709042871; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIiQPRJmSLHUwUlRUg6vt/WncPrgde1GXyHzWNmW+bk=;
        b=LraDZUIc7owc0KpaXtn4Nahjqb63i71p4Gy2CVwEkw+B34qpaeoArsEt6ny/DhYhAZ
         CI3+gxAxIY5Zp410obK0RgpcIKzMp0bFb7OyiJldROLfiRgIcvlaC6WxE7tuf0tmF7A6
         xFTyj5BXiB3VfeUU3VTtM3MWKm8XPbccv0xOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708438071; x=1709042871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIiQPRJmSLHUwUlRUg6vt/WncPrgde1GXyHzWNmW+bk=;
        b=gRhUXQsCma0SQwRKR9jynB5JiluFHafPBffMoXyCvjPeY/h8BLvF8D/1bxCsicQDYo
         tYqxkVqgx6qEouWfPa1XN6E2Z+vIoEJvE4fIOJC4ORfxjEY/M2DRLp/a08gyPj0kuutY
         9OLWI83IfVSA6SISqprRi09RLGJwyAkqPHGirvJgq54+E7iM0D7gyy8/9FIsYbgISJ6O
         pEd9qxUTAZ25Ofjyi50B+CYlCHBpRVX4gNl5IR4VaW1FSeJ607zPDja4SYFoXomxcgUj
         yhNRMu5KC4kLRhz858P0sYpqSJYM9uV8Ef4bMqCbXzlsVvL4lacUIlQrYhwSWto9fFh5
         caeA==
X-Gm-Message-State: AOJu0Yyx6s5yRD9pkrQydYxYBFPYiMagZb4Uup4+Gf4JO3DgLydnGfNW
	f++sBKwc0S4SlynnxY+iA3rhwt5ZJUJtoh9yK/cq9/hE7HRremIFhhDqqmeSnPX3rVk+R8RTNx/
	i
X-Google-Smtp-Source: AGHT+IHLEcLmUluugJILFyb4RL78DPOomw6Ma0CjQm6198f9gS5okqvmuHZX/eA/+utfFmN90LRFUw==
X-Received: by 2002:a05:600c:a39d:b0:410:ed31:9e96 with SMTP id hn29-20020a05600ca39d00b00410ed319e96mr11210113wmb.11.1708438071389;
        Tue, 20 Feb 2024 06:07:51 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation: Rework "build-each-commit-gcc" test
Date: Tue, 20 Feb 2024 14:07:33 +0000
Message-Id: <20240220140733.40980-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Current issues with this test are:
- when the job timeout, the log file is lost as there is no chance to
  run the `mv` command.
- GitLab job log is limited in size, so one usually have to download
  the artifacts, which may be missing.

Use $GITLAB_CI to detect when the script is run as part of a GitLab
pipeline. GitLab will add "GITLAB_CI=3Dtrue" in the environment
variables.

When run as part of $GITLAB_CI, ignore "dirty" worktree to allow to
write "build-each-commit-gcc.log", which can then be grabbed as
artifacts, even when the job timeout. The `git clean` command is
changed to keep those build logs.

When run as part of $GITLAB_CI, we will also store the build output in
a log file instead of writing it to stdout, because GitLab's job log
is limited. But we will write the log to stdout in case of error, so
we can find out more quickly why there's been an error.

This patch also make use of a GitLab feature, "log sections", which we
will collapse by default. One section per commit been built.

There's a bit of colour added to the logs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Examples:
    - on success:
      https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/6212972041
    - on failure:
      https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/6212993231

 automation/gitlab-ci/build-each-commit.sh |  2 +-
 automation/gitlab-ci/test.yaml            |  4 +-
 automation/scripts/build-test.sh          | 55 ++++++++++++++++++++---
 3 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/automation/gitlab-ci/build-each-commit.sh b/automation/gitlab-=
ci/build-each-commit.sh
index 19e337b468..08fddecbbe 100755
--- a/automation/gitlab-ci/build-each-commit.sh
+++ b/automation/gitlab-ci/build-each-commit.sh
@@ -15,4 +15,4 @@ fi
 echo "Building ${BASE}..${TIP}"
=20
 NON_SYMBOLIC_REF=3D1 ./automation/scripts/build-test.sh ${BASE} ${TIP} \
-    bash -c "git clean -ffdx && ./automation/scripts/build"
+    bash -c "git clean -ffdx -e '/build-*.log' && ./automation/scripts/bui=
ld"
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 3b27cc9f41..50056c1372 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -136,9 +136,7 @@ build-each-commit-gcc:
     XEN_TARGET_ARCH: x86_64
     CC: gcc
   script:
-    - BASE=3D${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=3D${TIP_SHA:-${CI_CO=
MMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-=
each-commit-gcc.log
-  after_script:
-    - mv ../build-each-commit-gcc.log .
+    - BASE=3D${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=3D${TIP_SHA:-${CI_CO=
MMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee build-eac=
h-commit-gcc.log
   artifacts:
     paths:
       - '*.log'
diff --git a/automation/scripts/build-test.sh b/automation/scripts/build-te=
st.sh
index da643adc01..355d4bf7f6 100755
--- a/automation/scripts/build-test.sh
+++ b/automation/scripts/build-test.sh
@@ -9,6 +9,37 @@
 # Set NON_SYMBOLIC_REF=3D1 if you want to use this script in detached HEAD=
 state.
 # This is currently used by automated test system.
=20
+# Colors with ANSI escape sequences
+txt_info=3D'=1B[32m'
+txt_err=3D'=1B[31m'
+txt_clr=3D'=1B[0m'
+
+# $GITLAB_CI should be "true" or "false".
+if [ "$GITLAB_CI" !=3D true ]; then
+    GITLAB_CI=3Dfalse
+fi
+
+gitlab_log_section() {
+    if $GITLAB_CI; then
+        echo -n "=1B[0Ksection_$1:$(date +%s):$2=0D=1B[0K"
+    fi
+    if [ $# -ge 3 ]; then
+        echo "$3"
+    fi
+}
+log_section_last=3D
+log_section_start() {
+    log_section_last=3D"${1%\[collapsed=3Dtrue\]}"
+    gitlab_log_section 'start' "$1" "${txt_info}$2${txt_clr}"
+}
+log_section_end() {
+    if [ "$log_section_last" ]; then
+        gitlab_log_section 'end' "$log_section_last"
+        log_section_last=3D
+    fi
+}
+
+
 if test $# -lt 2 ; then
     echo "Usage:"
     echo " $0 <BASE> <TIP> [CMD]"
@@ -19,10 +50,12 @@ fi
=20
 pushd `git rev-parse --show-toplevel`
=20
-status=3D`git status -s`
-if test -n "$status"; then
-    echo "Tree is dirty, aborted"
-    exit 1
+if ! $GITLAB_CI; then
+    status=3D`git status -s`
+    if test -n "$status"; then
+        echo "Tree is dirty, aborted"
+        exit 1
+    fi
 fi
=20
 BASE=3D$1; shift
@@ -40,26 +73,34 @@ fi
=20
 ret=3D1
 while read num rev; do
-    echo "Testing $num $rev"
+    log_section_start "commit_$rev[collapsed=3Dtrue]" "Testing #$num $(git=
 log -1 --abbrev=3D12 --format=3Dtformat:'%h ("%s")' $rev)"
=20
     git checkout $rev
     ret=3D$?
     if test $ret -ne 0; then
-        echo "Failed to checkout $num $rev with $ret"
+        log_section_end
+        echo "${txt_err}Failed to checkout $num $rev with $ret${txt_clr}"
         break
     fi
=20
     if test $# -eq 0 ; then
         git clean -fdx && ./configure && make -j4
+    elif $GITLAB_CI; then
+        "$@" > "build-$num.log" 2>&1
     else
         "$@"
     fi
     ret=3D$?
     if test $ret -ne 0; then
-        echo "Failed at $num $rev with $ret"
+        if $GITLAB_CI; then
+            cat "build-$num.log"
+        fi
+        log_section_end
+        echo "${txt_err}Failed at $num $rev with $ret${txt_clr}"
         break
     fi
     echo
+    log_section_end
 done < <(git rev-list $BASE..$TIP | nl -ba | tac)
=20
 echo "Restoring original HEAD"
--=20
Anthony PERARD


