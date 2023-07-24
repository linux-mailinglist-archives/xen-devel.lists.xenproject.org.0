Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AEA75FDA0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 19:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569183.889490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzKW-0006GY-Vn; Mon, 24 Jul 2023 17:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569183.889490; Mon, 24 Jul 2023 17:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzKW-0006Ew-SC; Mon, 24 Jul 2023 17:26:44 +0000
Received: by outflank-mailman (input) for mailman id 569183;
 Mon, 24 Jul 2023 17:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4gb1=DK=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qNzKU-0006Eq-K8
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 17:26:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df5ea68-2a47-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 19:26:10 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.162.132.135])
 by support.bugseng.com (Postfix) with ESMTPSA id 8E3594EE073E;
 Mon, 24 Jul 2023 19:26:36 +0200 (CEST)
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
X-Inumbo-ID: 2df5ea68-2a47-11ee-8612-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v2] automation: add ECLAIR pipeline
Date: Mon, 24 Jul 2023 19:25:34 +0200
Message-Id: <c3a0495afe01cca1b0caf6e1caa2d0a3451ecc00.1690219502.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add two pipelines that analyze an ARM64 and a X86_64 build with the
ECLAIR static analyzer on the guidelines contained in Set1.

The analysis configuration is stored in automation/eclair_analysis.

All commits on the xen-project/xen:staging branch will be analyzed
and their artifacts will be stored indefinitely; the integration will
report differential information with respect to the previous analysis.

All commits on other branches or repositories will be analyzed and
only the last ten artifacts will be kept; the integration will report
differential information with respect to the analysis done on the common
ancestor with xen-project/xen:staging (if available).

Currently the pipeline variable ENABLE_ECLAIR_BOT is set to "n".
Doing so disables the generation of comments with the analysis summary
on the commit threads. The variable can be set to "y" if the a masked
variable named ECLAIR_BOT_TOKEN is set with the impersonation token of
an account with enough privileges to write on all repositories.

Additionaly any repository should be able to read a masked variable
named WTOKEN with the token provided by BUGSENG.

The analysis fails if it contains violations of guidelines tagged as
clean:added. The list of clean guidelines are maintained in
automation/eclair_analysis/ECLAIR/tagging.ecl.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

--

Changes in v2:
- add ECLAIR configuration files (before they were fetched from a separate
  repository);
- now the pipeline fails if there are new violations of guidelines tagged
  with clean:added.
---
 .gitlab-ci.yml                                |   2 +
 MAINTAINERS                                   |   6 +
 automation/eclair_analysis/ECLAIR/Set1.ecl    |  59 ++++
 automation/eclair_analysis/ECLAIR/Set2.ecl    |  25 ++
 automation/eclair_analysis/ECLAIR/Set3.ecl    |  67 ++++
 .../eclair_analysis/ECLAIR/action.helpers     | 193 ++++++++++++
 .../eclair_analysis/ECLAIR/action.settings    | 172 ++++++++++
 .../ECLAIR/action_clean_added.sh              |  36 +++
 .../eclair_analysis/ECLAIR/action_log.sh      |  15 +
 .../ECLAIR/action_pull_request.sh             |  57 ++++
 .../eclair_analysis/ECLAIR/action_push.sh     |  95 ++++++
 .../ECLAIR/action_upload_sarif.sh             |  31 ++
 .../eclair_analysis/ECLAIR/analysis.ecl       |  25 ++
 automation/eclair_analysis/ECLAIR/analyze.sh  | 106 +++++++
 .../ECLAIR/call_properties.ecl                | 106 +++++++
 .../eclair_analysis/ECLAIR/deviations.ecl     | 298 ++++++++++++++++++
 .../eclair_analysis/ECLAIR/out_of_scope.ecl   | 127 ++++++++
 .../ECLAIR/print_analyzed_files.sh            |  66 ++++
 .../eclair_analysis/ECLAIR/public_APIs.ecl    |   6 +
 automation/eclair_analysis/ECLAIR/report.ecl  |   4 +
 automation/eclair_analysis/ECLAIR/tagging.ecl |  34 ++
 .../eclair_analysis/ECLAIR/toolchain.ecl      | 275 ++++++++++++++++
 automation/eclair_analysis/Makefile.prepare   |   6 +
 automation/eclair_analysis/build.sh           |  44 +++
 automation/eclair_analysis/prepare.sh         |  42 +++
 automation/eclair_analysis/xen_arm_config     | 147 +++++++++
 automation/eclair_analysis/xen_x86_config     | 152 +++++++++
 automation/gitlab-ci/analyze.yaml             |  37 +++
 automation/gitlab-ci/build.yaml               |   1 +
 automation/scripts/eclair                     |  32 ++
 30 files changed, 2266 insertions(+)
 create mode 100644 automation/eclair_analysis/ECLAIR/Set1.ecl
 create mode 100644 automation/eclair_analysis/ECLAIR/Set2.ecl
 create mode 100644 automation/eclair_analysis/ECLAIR/Set3.ecl
 create mode 100644 automation/eclair_analysis/ECLAIR/action.helpers
 create mode 100644 automation/eclair_analysis/ECLAIR/action.settings
 create mode 100755 automation/eclair_analysis/ECLAIR/action_clean_added.sh
 create mode 100755 automation/eclair_analysis/ECLAIR/action_log.sh
 create mode 100644 automation/eclair_analysis/ECLAIR/action_pull_request.sh
 create mode 100755 automation/eclair_analysis/ECLAIR/action_push.sh
 create mode 100755 automation/eclair_analysis/ECLAIR/action_upload_sarif.sh
 create mode 100644 automation/eclair_analysis/ECLAIR/analysis.ecl
 create mode 100755 automation/eclair_analysis/ECLAIR/analyze.sh
 create mode 100644 automation/eclair_analysis/ECLAIR/call_properties.ecl
 create mode 100644 automation/eclair_analysis/ECLAIR/deviations.ecl
 create mode 100644 automation/eclair_analysis/ECLAIR/out_of_scope.ecl
 create mode 100755 automation/eclair_analysis/ECLAIR/print_analyzed_files.=
sh
 create mode 100644 automation/eclair_analysis/ECLAIR/public_APIs.ecl
 create mode 100644 automation/eclair_analysis/ECLAIR/report.ecl
 create mode 100644 automation/eclair_analysis/ECLAIR/tagging.ecl
 create mode 100644 automation/eclair_analysis/ECLAIR/toolchain.ecl
 create mode 100644 automation/eclair_analysis/Makefile.prepare
 create mode 100755 automation/eclair_analysis/build.sh
 create mode 100755 automation/eclair_analysis/prepare.sh
 create mode 100644 automation/eclair_analysis/xen_arm_config
 create mode 100644 automation/eclair_analysis/xen_x86_config
 create mode 100644 automation/gitlab-ci/analyze.yaml
 create mode 100755 automation/scripts/eclair

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c8bd7519d5..ee5430b8b7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,9 @@
 stages:
+  - analyze
   - build
   - test
=20
 include:
+  - 'automation/gitlab-ci/analyze.yaml'
   - 'automation/gitlab-ci/build.yaml'
   - 'automation/gitlab-ci/test.yaml'
diff --git a/MAINTAINERS b/MAINTAINERS
index 180e57dac4..c3b99e8560 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -305,6 +305,12 @@ F:	xen/include/xen/libfdt/
 F:	xen/include/xen/device_tree.h
 F:	xen/drivers/passthrough/device_tree.c
=20
+ECLAIR
+M: Simone Ballarin <simone.ballarin@bugseng.com>
+S: Supported
+F: xen/automation/eclair_analysis/
+F: xen/automation/scripts/eclair
+
 EFI
 M:	Jan Beulich <jbeulich@suse.com>
 S:	Supported
diff --git a/automation/eclair_analysis/ECLAIR/Set1.ecl b/automation/eclair=
_analysis/ECLAIR/Set1.ecl
new file mode 100644
index 0000000000..b5ca499037
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/Set1.ecl
@@ -0,0 +1,59 @@
+-doc_begin=3D"Set 1 as defined in Xen MISRA C Task (a): Xen Coding Guideli=
nes v1.0, May 31, 2023"
+-enable=3DMC3R1.R9.1
+-enable=3DMC3R1.R12.5
+-enable=3DMC3R1.R17.3
+-enable=3DMC3R1.R17.4
+-enable=3DMC3R1.R17.6
+-enable=3DMC3R1.R19.1
+-enable=3DMC3R1.R21.13
+-enable=3DMC3R1.R21.17
+-enable=3DMC3R1.R21.18
+-enable=3DMC3R1.R21.19
+-enable=3DMC3R1.R21.20
+-enable=3DMC3R1.R21.21
+-enable=3DMC3R1.R22.2
+-enable=3DMC3R1.R22.4
+-enable=3DMC3R1.R22.5
+-enable=3DMC3R1.R22.6
+-enable=3DMC3R1.D1.1
+-enable=3DMC3R1.D2.1
+-enable=3DMC3R1.D4.1
+-enable=3DMC3R1.D4.3
+-enable=3DMC3R1.D4.7
+-enable=3DMC3R1.D4.10
+-enable=3DMC3R1.D4.11
+-enable=3DMC3R1.D4.14
+-enable=3DMC3R1.R1.1
+-enable=3DMC3R1.R1.3
+-enable=3DMC3R1.R1.4
+-enable=3DMC3R1.R2.1
+-enable=3DMC3R1.R2.2
+-enable=3DMC3R1.R3.1
+-enable=3DMC3R1.R3.2
+-enable=3DMC3R1.R4.1
+-enable=3DMC3R1.R5.1
+-enable=3DMC3R1.R5.2
+-enable=3DMC3R1.R5.3
+-enable=3DMC3R1.R5.4
+-enable=3DMC3R1.R5.6
+-enable=3DMC3R1.R6.1
+-enable=3DMC3R1.R6.2
+-enable=3DMC3R1.R7.1
+-enable=3DMC3R1.R7.2
+-enable=3DMC3R1.R7.3
+-enable=3DMC3R1.R7.4
+-enable=3DMC3R1.R8.1
+-enable=3DMC3R1.R8.2
+-enable=3DMC3R1.R8.3
+-enable=3DMC3R1.R8.4
+-enable=3DMC3R1.R8.5
+-enable=3DMC3R1.R8.6
+-enable=3DMC3R1.R8.8
+-enable=3DMC3R1.R8.10
+-enable=3DMC3R1.R8.12
+-enable=3DMC3R1.R8.14
+-enable=3DMC3R1.R9.2
+-enable=3DMC3R1.R9.3
+-enable=3DMC3R1.R9.4
+-enable=3DMC3R1.R9.5
+-doc_end
diff --git a/automation/eclair_analysis/ECLAIR/Set2.ecl b/automation/eclair=
_analysis/ECLAIR/Set2.ecl
new file mode 100644
index 0000000000..741fe4d470
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/Set2.ecl
@@ -0,0 +1,25 @@
+-doc_begin=3D"Set 2 as defined in Xen MISRA C Task (a): Xen Coding Guideli=
nes v1.0, May 31, 2023"
+-enable=3DMC3R1.R10.1
+-enable=3DMC3R1.R10.2
+-enable=3DMC3R1.R10.3
+-enable=3DMC3R1.R10.4
+-enable=3DMC3R1.R10.6
+-enable=3DMC3R1.R10.7
+-enable=3DMC3R1.R10.8
+-enable=3DMC3R1.R11.1
+-enable=3DMC3R1.R11.2
+-enable=3DMC3R1.R11.3
+-enable=3DMC3R1.R11.6
+-enable=3DMC3R1.R11.7
+-enable=3DMC3R1.R11.8
+-enable=3DMC3R1.R11.9
+-enable=3DMC3R1.R12.2
+-enable=3DMC3R1.R13.1
+-enable=3DMC3R1.R13.2
+-enable=3DMC3R1.R13.5
+-enable=3DMC3R1.R13.6
+-enable=3DMC3R1.R14.1
+-enable=3DMC3R1.R14.2
+-enable=3DMC3R1.R14.3
+-enable=3DMC3R1.R14.4
+-doc_end
diff --git a/automation/eclair_analysis/ECLAIR/Set3.ecl b/automation/eclair=
_analysis/ECLAIR/Set3.ecl
new file mode 100644
index 0000000000..1b1afe4f3b
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/Set3.ecl
@@ -0,0 +1,67 @@
+-doc_begin=3D"Set 3 as defined in Xen MISRA C Task (a): Xen Coding Guideli=
nes v1.0, May 31, 2023"
+-enable=3DMC3R1.D4.12
+-enable=3DMC3R1.R5.5
+-enable=3DMC3R1.R5.7
+-enable=3DMC3R1.R5.8
+-enable=3DMC3R1.R15.2
+-enable=3DMC3R1.R15.3
+-enable=3DMC3R1.R15.6
+-enable=3DMC3R1.R15.7
+-enable=3DMC3R1.R16.1
+-enable=3DMC3R1.R16.2
+-enable=3DMC3R1.R16.3
+-enable=3DMC3R1.R16.4
+-enable=3DMC3R1.R16.5
+-enable=3DMC3R1.R16.6
+-enable=3DMC3R1.R16.7
+-enable=3DMC3R1.R17.1
+-enable=3DMC3R1.R17.2
+-enable=3DMC3R1.R17.5
+-enable=3DMC3R1.R17.7
+-enable=3DMC3R1.R18.1
+-enable=3DMC3R1.R18.2
+-enable=3DMC3R1.R18.3
+-enable=3DMC3R1.R18.6
+-enable=3DMC3R1.R18.7
+-enable=3DMC3R1.R18.8
+-enable=3DMC3R1.R20.2
+-enable=3DMC3R1.R20.3
+-enable=3DMC3R1.R20.4
+-enable=3DMC3R1.R20.6
+-enable=3DMC3R1.R20.7
+-enable=3DMC3R1.R20.8
+-enable=3DMC3R1.R20.9
+-enable=3DMC3R1.R20.11
+-enable=3DMC3R1.R20.12
+-enable=3DMC3R1.R20.13
+-enable=3DMC3R1.R20.14
+-enable=3DMC3R1.R21.1
+-enable=3DMC3R1.R21.2
+-enable=3DMC3R1.R21.3
+-enable=3DMC3R1.R21.4
+-enable=3DMC3R1.R21.5
+-enable=3DMC3R1.R21.6
+-enable=3DMC3R1.R21.7
+-enable=3DMC3R1.R21.8
+-enable=3DMC3R1.R21.9
+-enable=3DMC3R1.R21.10
+-enable=3DMC3R1.R21.12
+-enable=3DMC3R1.R21.14
+-enable=3DMC3R1.R21.15
+-enable=3DMC3R1.R21.16
+-enable=3DMC3R1.R22.1
+-enable=3DMC3R1.R22.3
+-enable=3DMC3R1.R22.7
+-enable=3DMC3R1.R22.8
+-enable=3DMC3R1.R22.9
+-enable=3DMC3R1.R22.10
+-enable=3DMC3R1.R2.6
+-enable=3DMC3R1.R4.2
+-doc_end
+
+-doc_begin=3D"Guidelines added with Xen MISRA C Task (a): Xen Coding Guide=
lines v1.1, June 1, 2023"
+-enable=3DMC3R1.R21.11
+-enable=3DMC3R1.D4.4
+-enable=3DMC3R1.R8.9
+-enable=3DMC3R1.R12.4
+-doc_end
diff --git a/automation/eclair_analysis/ECLAIR/action.helpers b/automation/=
eclair_analysis/ECLAIR/action.helpers
new file mode 100644
index 0000000000..2ad6428eaa
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/action.helpers
@@ -0,0 +1,193 @@
+if [ -n "${GITLAB_CI:-}" ]; then
+    ci=3Dgitlab
+elif [ -n "${GITHUB_ACTION:-}" ]; then
+    ci=3Dgithub
+elif [ -n "${JENKINS_HOME:-}" ]; then
+    ci=3Djenkins
+else
+    echo "Unexpected CI/CD context" >&2
+    exit 1
+fi
+
+esc=3D$(printf '\e')
+cr=3D$(printf '\r')
+
+open_section() {
+    id=3D$1
+    title=3D$2
+    collapsed=3D$3
+    echo "${esc}[0Ksection_start:$(date +%s):${id}${collapsed}${cr}${esc}[=
0K${esc}[1m${esc}[36m${title}${esc}[m"
+}
+
+close_section() {
+    id=3D$1
+    echo "${esc}[0Ksection_end:$(date +%s):${id}${cr}${esc}[0K"
+}
+
+summary() {
+    fixedReports=3D
+    newReports=3D
+    unfixedReports=3D
+    while read -r line; do
+        var=3D${line%%: *}
+        val=3D${line#*: }
+        eval "${var}=3D${val}"
+    done <"${updateLog}"
+
+    case "${ci}" in
+    github)
+        nl=3D"\\"
+        ;;
+    gitlab)
+        nl=3D
+        ;;
+    jenkins)
+        nl=3D"<br/>"
+        ;;
+    *)
+        nl=3D
+        ;;
+    esac
+
+    if [ -z "${newReports}" ]; then
+        fixedMsg=3D
+        unfixedMsg=3D"Unfixed reports: ${unfixedReports}"
+        countsMsg=3D"${unfixedMsg}"
+    else
+        fixedMsg=3D"Fixed reports: ${fixedReports}"
+        unfixedMsg=3D"Unfixed reports: ${unfixedReports} [new: ${newReport=
s}]"
+        countsMsg=3D"${fixedMsg}${nl}
+${unfixedMsg}"
+    fi
+    case "${ci}" in
+    jenkins)
+        cat <<EOF >"${summaryTxt}"
+${countsMsg}                                                              =
                ${nl}
+<a href=3D"https://www.bugseng.com/eclair">
+  <img src=3D"${eclairReportUrlPrefix}/rsrc/eclair.svg" width=3D"100" />
+</a>
+<h3>${jobHeadline}</h3>
+<a href=3D"${indexHtmlUrl}">Browse analysis results</a>
+EOF
+        ;;
+    *)
+        cat <<EOF >"${summaryTxt}"
+<a href=3D"https://www.bugseng.com/eclair">
+  <img src=3D"${eclairReportUrlPrefix}/rsrc/eclair.svg" width=3D"100" />
+</a>
+Analysis Summary
+
+${jobHeadline}${nl}
+${countsMsg}${nl}
+[Browse analysis](${indexHtmlUrl})
+EOF
+        ;;
+    esac
+
+    case ${ci} in
+    github)
+        cat "${summaryTxt}" >"${GITHUB_STEP_SUMMARY}"
+        ;;
+    gitlab)
+        open_section ECLAIR_summary "ECLAIR analysis summary" ""
+        # Generate summary and print it (GitLab-specific)
+        cat <<EOF
+${jobHeadline}
+${countsMsg}
+Browse analysis: ${esc}[33m${indexHtmlUrl}${esc}[m
+EOF
+        close_section ECLAIR_summary
+        ;;
+    jenkins)
+        cat <<EOF
+${jobHeadline}
+${fixedMsg}
+${unfixedMsg}
+Browse analysis: ${indexHtmlUrl}
+EOF
+        ;;
+    *)
+        echo "Unexpected CI/CD context" >&2
+        exit 1
+        ;;
+    esac
+}
+
+log_file() {
+    section_id=3D$1
+    section_name=3D$2
+    file=3D$3
+    exit_code=3D$4
+    if [ "${exit_code}" =3D 0 ]; then
+        collapsed=3D[collapsed=3Dtrue]
+    else
+        collapsed=3D
+    fi
+
+    case ${ci} in
+    github | jenkins)
+        echo "${section_name}"
+        ;;
+    gitlab)
+        open_section "${section_id}" "${section_name}" "${collapsed}"
+        ;;
+    *)
+        echo "Unexpected CI/CD context" >&2
+        exit 1
+        ;;
+    esac
+
+    cat "${file}"
+
+    case ${ci} in
+    github | jenkins) ;;
+    gitlab)
+        close_section "${section_id}"
+        ;;
+    *) ;;
+    esac
+}
+
+maybe_log_file_exit() {
+    section_id=3D$1
+    section_name=3D$2
+    file=3D$3
+    exit_code=3D$4
+
+    case ${ci} in
+    github | jenkins)
+        echo "${section_name}"
+        ;;
+    gitlab)
+        open_section "${section_id}" "${section_name}" ""
+        ;;
+    *)
+        echo "Unexpected CI/CD context" >&2
+        exit 1
+        ;;
+    esac
+
+    if [ "${exit_code}" !=3D 0 ]; then
+        cat "${file}"
+    fi
+
+    case ${ci} in
+    github | jenkins) ;;
+    gitlab)
+        close_section "${section_id}"
+        ;;
+    *) ;;
+    esac
+    return "${exit_code}"
+}
+
+is_enabled() {
+    case "$1" in
+    true | TRUE | y | Y | yes | YES | 1)
+        return 0
+        ;;
+    *)
+        return 1
+        ;;
+    esac
+}
diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation=
/eclair_analysis/ECLAIR/action.settings
new file mode 100644
index 0000000000..0f7950f5ab
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -0,0 +1,172 @@
+variantSubDir=3D
+variantHeadline=3D
+if [ -n "${VARIANT:-}" ]; then
+    variantSubDir=3D"/${VARIANT}"
+    variantHeadline=3D" [${VARIANT}]"
+fi
+
+# AUTO PR Feature
+# If the following variables are defined, then all pipelines
+# of other branches will be considered pull-requests to
+# autoPRBranch.
+# Customized
+autoPRRepository=3D"${AUTO_PR_REPOSITORY:-}"
+# Customized
+autoPRBranch=3D"${AUTO_PR_BRANCH:-}"
+
+# Customized
+artifactsRoot=3D/var/local/eclair
+
+case "${ci}" in
+github)
+    # To be customized
+    repository=3D"${GITHUB_REPOSITORY}"
+    jobId=3D"${GITHUB_RUN_NUMBER}"
+
+    autoPRRemoteUrl=3D"${GITHUB_SERVER_URL}/${autoPRRepository:-}"
+
+    case "${GITHUB_EVENT_NAME}" in
+    pull_request*)
+        event=3Dpull_request
+        pullRequestId=3D"${GITHUB_EVENT_PULL_REQUEST_NUMBER}"
+        pullRequestHeadRepo=3D"${PR_HEAD_REPO}"
+        pullRequestHeadRef=3D"${PR_HEAD_REF}"
+        pullRequestBaseRef=3D"${PR_BASE_REF}"
+        pullRequestUser=3D"${PR_USER}"
+        # baseCommitId and headCommitId are the most recent merge points w=
ithout conflicts
+        git fetch -q --deepen=3D2
+        baseCommitId=3D$(git show -s --pretty=3D%H HEAD^1)
+        headCommitId=3D$(git show -s --pretty=3D%H HEAD^2)
+        ;;
+    push | workflow_dispatch)
+        event=3Dpush
+        # Extract the branch name from "refs/heads/<branch>"
+        branch=3D"${GITHUB_REF#refs/heads/}"
+        headCommitId=3D"${GITHUB_SHA}"
+        pushUser=3D"${GITHUB_ACTOR}"
+        ;;
+    *)
+        echo "Unexpected GITHUB_REF ${GITHUB_REF}" >&2
+        exit 1
+        ;;
+    esac
+    ;;
+gitlab)
+    # Customized
+    repository=3D"${CI_PROJECT_PATH}"
+    jobId=3D"${CI_JOB_ID}"
+
+    gitlabApiUrl=3D"${CI_SERVER_PROTOCOL}://${CI_SERVER_HOST}:${CI_SERVER_=
PORT}/api/v4"
+    autoPRRemoteUrl=3D"${CI_SERVER_PROTOCOL}://${CI_SERVER_HOST}:${CI_SERV=
ER_PORT}/${autoPRRepository:-}"
+
+    # Customized
+    gitlabBotToken=3D"${ECLAIR_BOT_TOKEN:-}"
+
+    case "${CI_PIPELINE_SOURCE}" in
+    merge_request_event)
+        event=3Dpull_request
+        pullRequestId=3D"${CI_MERGE_REQUEST_IID}"
+        pullRequestHeadRef=3D"${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}"
+        pullRequestHeadRepo=3D"${CI_MERGE_REQUEST_SOURCE_PROJECT_PATH}"
+        pullRequestBaseRef=3D"${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}"
+        pullRequestUser=3D"${GITLAB_USER_LOGIN}"
+        headCommitId=3D"${CI_COMMIT_SHA}"
+        baseCommitId=3D"${CI_MERGE_REQUEST_DIFF_BASE_SHA}"
+        ;;
+    push | pipeline | web)
+        event=3Dpush
+        branch=3D"${CI_COMMIT_BRANCH}"
+        headCommitId=3D"${CI_COMMIT_SHA}"
+        pushUser=3D"${GITLAB_USER_NAME}"
+        ;;
+    *)
+        echo "Unexpected event ${CI_PIPELINE_SOURCE}" >&2
+        exit 1
+        ;;
+    esac
+    ;;
+jenkins)
+    # To be customized
+    repository=3D"${JOB_BASE_NAME}"
+    project=3D"${JOB_NAME}"
+    jobId=3D"${BUILD_NUMBER}"
+
+    jenkinsApiUrl=3D"${JENKINS_URL}"
+    autoPRRemoteUrl=3D"${JENKINS_URL}/${autoPRRepository:-}"
+
+    # To be customized
+    jenkinsBotUsername=3D"${ECLAIR_BOT_USERNAME:-}"
+    jenkinsBotToken=3D"${ECLAIR_BOT_TOKEN:-}"
+
+    event=3Dpush
+    branch=3D"${GIT_BRANCH}"
+    headCommitId=3D"${GIT_COMMIT}"
+    pushUser=3D$(git show --pretty=3D'format:%aN' -s)
+    ;;
+*)
+    echo "Unexpected CI/CD context" >&2
+    exit 1
+    ;;
+esac
+
+if [ "${event}" =3D "push" ] && [ -n "${autoPRBranch:-}" ]; then
+    # AUTO PR Feature enabled
+    if ! [ "${branch}" =3D "${autoPRBranch}" ] ||
+        ! [ "${repository}" =3D "${autoPRRepository}" ]; then
+        event=3Dauto_pull_request
+    fi
+fi
+
+case "${event}" in
+pull_request)
+    subDir=3D"${pullRequestHeadRepo}.ecdf/${pullRequestBaseRef}"
+    jobHeadline=3D"ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${=
pullRequestUser} wants to merge ${pullRequestHeadRepo}:${pullRequestHeadRef=
} (${headCommitId}) into ${pullRequestBaseRef} (${baseCommitId})"
+    ;;
+push)
+    subDir=3D"${branch}"
+    jobHeadline=3D"ECLAIR ${ANALYSIS_KIND} on repository ${repository}: br=
anch ${branch} (${headCommitId})"
+    badgeLabel=3D"ECLAIR ${ANALYSIS_KIND} ${branch}${variantHeadline} #${j=
obId}"
+    ;;
+auto_pull_request)
+    git remote remove autoPRRemote || true
+    git remote add autoPRRemote "${autoPRRemoteUrl}"
+    git fetch autoPRRemote
+    subDir=3D"${branch}"
+    baseCommitId=3D$(git merge-base "autoPRRemote/${autoPRBranch}" HEAD)
+    jobHeadline=3D"ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${=
pushUser} wants to merge ${repository}:${branch} (${headCommitId}) into ${a=
utoPRRepository}/${autoPRBranch} (${baseCommitId})"
+    ;;
+*)
+    echo "Unexpected event ${event}" >&2
+    exit 1
+    ;;
+esac
+
+case "${repository}" in
+xen-project/xen)
+    # Customized
+    keepOldAnalyses=3D0
+    ;;
+xen-project/*)
+    # Customized
+    keepOldAnalyses=3D10
+    ;;
+*)
+    echo "Unexpected repository" >&2
+    exit 1
+    ;;
+esac
+
+ECLAIR_BIN_DIR=3D/opt/bugseng/eclair/bin/
+
+artifactsDir=3D"${artifactsRoot}/xen-project.ecdf/${repository}/ECLAIR_${A=
NALYSIS_KIND}"
+subDir=3D"${subDir}${variantSubDir}"
+jobHeadline=3D"${jobHeadline}${variantHeadline}"
+
+# Customized
+eclairReportUrlPrefix=3Dhttps://saas.eclairit.com:3787
+
+jobDir=3D"${artifactsDir}/${subDir}/${jobId}"
+updateLog=3D"${analysisOutputDir}/update.log"
+commentLog=3D"${analysisOutputDir}/comment.json"
+indexHtmlUrl=3D"${eclairReportUrlPrefix}/fs${jobDir}/index.html"
+summaryTxt=3D"${analysisOutputDir}/summary.txt"
diff --git a/automation/eclair_analysis/ECLAIR/action_clean_added.sh b/auto=
mation/eclair_analysis/ECLAIR/action_clean_added.sh
new file mode 100755
index 0000000000..59bc35fd13
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/action_clean_added.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+set -eu
+
+usage() {
+    echo "Usage: $0 ANALYSIS_OUTPUT_DIR" >&2
+    exit 2
+}
+
+[ $# -eq 1 ] || usage
+
+analysisOutputDir=3D$1
+
+cleanAddedTxt=3D"${analysisOutputDir}/clean_added.log"
+
+# Load settings and helpers
+. "$(dirname "$0")/action.helpers"
+. "$(dirname "$0")/action.settings"
+
+unexpectedReports=3D$("${ECLAIR_BIN_DIR}eclair_report" \
+    "-db=3D'${analysisOutputDir}/PROJECT.ecd'" \
+    "-sel_unfixed=3Dunfixed" \
+    "-sel_tag_glob=3Dclean_added,clean,added" \
+    "-print=3D'',reports_count()")
+
+if [ "${unexpectedReports}" -gt 0 ]; then
+    cat <<EOF >"${cleanAddedTxt}"
+Failure: ${unexpectedReports} unexpected reports found.
+Unexpected reports are tagged 'clean:added'.
+EOF
+    exit 1
+else
+    cat <<EOF >"${cleanAddedTxt}"
+Success: No unexpected reports.
+EOF
+fi
diff --git a/automation/eclair_analysis/ECLAIR/action_log.sh b/automation/e=
clair_analysis/ECLAIR/action_log.sh
new file mode 100755
index 0000000000..67125b08f3
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/action_log.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+set -eu
+
+usage() {
+    echo "Usage: $0 SECTION_ID SECTION_NAME FILE EXIT_CODE" >&2
+    exit 2
+}
+
+[ $# -eq 4 ] || usage
+
+# Load settings and helpers
+. "$(dirname "$0")/action.helpers"
+
+log_file "$@"
diff --git a/automation/eclair_analysis/ECLAIR/action_pull_request.sh b/aut=
omation/eclair_analysis/ECLAIR/action_pull_request.sh
new file mode 100644
index 0000000000..68f7e6282e
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
@@ -0,0 +1,57 @@
+#!/bin/sh
+
+set -eu
+
+usage() {
+    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR COMMIT_ID" >&2
+    exit 2
+}
+
+[ $# -eq 2 ] || usage
+
+wtoken=3D$1
+analysisOutputDir=3D$2
+
+# Load settings and helpers
+. "$(dirname "$0")/action.helpers"
+. "$(dirname "$0")/action.settings"
+
+curl -sS "${eclairReportUrlPrefix}/ext/update_pull_request" \
+    -F "wtoken=3D${wtoken}" \
+    -F "artifactsDir=3D${artifactsDir}" \
+    -F "subDir=3D${subDir}" \
+    -F "jobId=3D${jobId}" \
+    -F "jobHeadline=3D${jobHeadline}" \
+    -F "baseCommitId=3D${baseCommitId}" \
+    -F "keepOldAnalyses=3D${keepOldAnalyses}" \
+    -F "db=3D@${analysisOutputDir}/PROJECT.ecd" \
+    >"${updateLog}"
+ex=3D0
+grep -Fq "unfixedReports: " "${updateLog}" || ex=3D$?
+maybe_log_file_exit PUBLISH_RESULT "Publishing results" "${updateLog}" "${=
ex}"
+
+summary
+
+if is_enabled "${ENABLE_ECLAIR_BOT:-}"; then
+    case ${ci} in
+    github)
+        ex=3D0
+        gh api \
+            --method POST \
+            "/repos/${repository}/issues/${pullRequestId}/comments" \
+            -F "body=3D@${summaryTxt}" \
+            --silent >"${commentLog}" 2>&1 || ex=3D$?
+        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "=
${ex}"
+        ;;
+    gitlab)
+        curl -sS --request POST \
+            "${gitlabApiUrl}/projects/${CI_PROJECT_ID}/merge_requests/${pu=
llRequestId}/notes" \
+            -H "PRIVATE-TOKEN: ${gitlabBotToken}" \
+            -F "body=3D<${summaryTxt}" >"${commentLog}"
+        ex=3D0
+        grep -Fq "Unfixed reports: " "${commentLog}" || ex=3D$?
+        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "=
${ex}"
+        ;;
+    *) ;;
+    esac
+fi
diff --git a/automation/eclair_analysis/ECLAIR/action_push.sh b/automation/=
eclair_analysis/ECLAIR/action_push.sh
new file mode 100755
index 0000000000..45215fbf00
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/action_push.sh
@@ -0,0 +1,95 @@
+#!/bin/sh
+
+set -eu
+
+usage() {
+    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR" >&2
+    exit 2
+}
+
+[ $# -eq 2 ] || usage
+
+wtoken=3D$1
+analysisOutputDir=3D$2
+
+# Load settings and helpers
+. "$(dirname "$0")/action.helpers"
+. "$(dirname "$0")/action.settings"
+
+case "${event}" in
+push)
+    curl -sS "${eclairReportUrlPrefix}/ext/update_push" \
+        -F "wtoken=3D${wtoken}" \
+        -F "artifactsDir=3D${artifactsDir}" \
+        -F "subDir=3D${subDir}" \
+        -F "jobId=3D${jobId}" \
+        -F "jobHeadline=3D${jobHeadline}" \
+        -F "commitId=3D${headCommitId}" \
+        -F "badgeLabel=3D${badgeLabel}" \
+        -F "keepOldAnalyses=3D${keepOldAnalyses}" \
+        -F "db=3D@${analysisOutputDir}/PROJECT.ecd" \
+        >"${updateLog}"
+    ;;
+auto_pull_request)
+    curl -sS "${eclairReportUrlPrefix}/ext/update_pull_request" \
+        -F "wtoken=3D${wtoken}" \
+        -F "artifactsDir=3D${artifactsDir}" \
+        -F "subDir=3D${subDir}" \
+        -F "jobId=3D${jobId}" \
+        -F "jobHeadline=3D${jobHeadline}" \
+        -F "baseCommitId=3D${baseCommitId}" \
+        -F "keepOldAnalyses=3D${keepOldAnalyses}" \
+        -F "db=3D@${analysisOutputDir}/PROJECT.ecd" \
+        >"${updateLog}"
+    ;;
+*)
+    echo "Unexpected event ${event}" >&2
+    exit 1
+    ;;
+esac
+
+ex=3D0
+grep -Fq "unfixedReports: " "${updateLog}" || ex=3D$?
+maybe_log_file_exit PUBLISH_RESULT "Publishing results" "${updateLog}" "${=
ex}"
+
+summary
+
+if is_enabled "${ENABLE_ECLAIR_BOT:-}"; then
+    case ${ci} in
+    github)
+        ex=3D0
+        gh api \
+            --method POST \
+            "/repos/${repository}/commits/${headCommitId}/comments" \
+            -F "body=3D@${summaryTxt}" \
+            --silent >"${commentLog}" 2>&1 || ex=3D$?
+        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "=
${ex}"
+        ;;
+    gitlab)
+        curl -sS --request POST \
+            "${gitlabApiUrl}/projects/${CI_PROJECT_ID}/repository/commits/=
${CI_COMMIT_SHA}/comments" \
+            -H "PRIVATE-TOKEN: ${gitlabBotToken}" \
+            -F "note=3D<${summaryTxt}" >"${commentLog}"
+        ex=3D0
+        grep -Fq "Unfixed reports: " "${commentLog}" || ex=3D$?
+        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "=
${ex}"
+        ;;
+    jenkins)
+        ex=3D0
+        curl \
+            --user "${jenkinsBotUsername}:${jenkinsBotToken}" \
+            --data-urlencode "description=3D$(cat "${summaryTxt}")" \
+            --data-urlencode "Submit=3DSubmit" \
+            "${jenkinsApiUrl}job/${project}/${jobId}/submitDescription" \
+            >"${commentLog}" 2>&1 || ex=3D$?
+        curl \
+            --user "${jenkinsBotUsername}:${jenkinsBotToken}" \
+            --data-urlencode "description=3D$(cat "${summaryTxt}")" \
+            --data-urlencode "Submit=3DSubmit" \
+            "${jenkinsApiUrl}job/${project}/submitDescription" \
+            >"${commentLog}" 2>&1 || ex=3D$?
+        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "=
${ex}"
+        ;;
+    *) ;;
+    esac
+fi
diff --git a/automation/eclair_analysis/ECLAIR/action_upload_sarif.sh b/aut=
omation/eclair_analysis/ECLAIR/action_upload_sarif.sh
new file mode 100755
index 0000000000..60b8034fcc
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/action_upload_sarif.sh
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+set -eu
+
+usage() {
+    echo "Usage: $0 SARIF_FILE" >&2
+    exit 2
+}
+
+[ $# -eq 1 ] || usage
+
+HERE=3D$( (
+    cd "$(dirname "$0")"
+    echo "${PWD}"
+))
+
+. "${HERE}/action.helpers"
+
+sarifFile=3D$1
+sarifPayload=3D${HERE}/sarif.gz.b64
+uploadLog=3D${HERE}/upload_sarif.log
+
+gzip -c "${sarifFile}" | base64 -w0 >"${sarifPayload}"
+
+ex=3D0
+gh api --method POST -H "Accept: application/vnd.github+json" \
+    "/repos/${GITHUB_REPOSITORY}/code-scanning/sarifs" \
+    -f "commit_sha=3D${GITHUB_SHA}" -f "ref=3D${GITHUB_REF}" \
+    -F "sarif=3D@${sarifPayload}" \
+    --silent >"${uploadLog}" 2>&1 || ex=3D$?
+maybe_log_file_exit ADD_COMMENT "Uploading SARIF" "${uploadLog}" "${ex}"
diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/ec=
lair_analysis/ECLAIR/analysis.ecl
new file mode 100644
index 0000000000..fe418d6da1
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -0,0 +1,25 @@
+-setq=3Dset,getenv("SET")
+-project_name=3Dgetenv("ECLAIR_PROJECT_NAME")
+-project_root=3Dgetenv("ECLAIR_PROJECT_ROOT")
+
+-setq=3Ddata_dir,getenv("ECLAIR_DATA_DIR")
+
+-verbose
+
+-enable=3DB.REPORT.ECB
+-config=3DB.REPORT.ECB,output=3Djoin_paths(data_dir,"FRAME.@FRAME@.ecb")
+-config=3DB.REPORT.ECB,preprocessed=3Dshow
+-config=3DB.REPORT.ECB,macros=3D10
+
+-enable=3DB.EXPLAIN
+
+-eval_file=3Dtoolchain.ecl
+-eval_file=3Dpublic_APIs.ecl
+-eval_file=3Dout_of_scope.ecl
+-eval_file=3Ddeviations.ecl
+-eval_file=3Dcall_properties.ecl
+-eval_file=3Dtagging.ecl
+-eval_file=3Dconcat(set,".ecl")
+
+-doc=3D"Hide reports in external code."
+-reports+=3D{hide,all_exp_external}
diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/ecla=
ir_analysis/ECLAIR/analyze.sh
new file mode 100755
index 0000000000..47cdbb03ce
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/analyze.sh
@@ -0,0 +1,106 @@
+#!/bin/bash
+# Stop immediately if any executed command has exit status different from =
0.
+set -e
+set -o pipefail
+
+script_name=3D"$(basename "$0")"
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+usage() {
+  fatal "Usage: ${script_name} <ARM64|X86_64> <Set0|Set1|Set2|Set3>"
+}
+
+if [[ $# -ne 2 ]]; then
+  usage
+fi
+
+# Absolute path of the ECLAIR bin directory.
+export ECLAIR_BIN_DIR=3D/opt/bugseng/eclair/bin/
+
+# Directory where this script resides: usually in a directory named "ECLAI=
R".
+SCRIPT_DIR=3D"$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+# Directory where to put all ECLAIR output and temporary files.
+if [[ -z "${ECLAIR_OUTPUT_DIR:-}" ]]; then
+  ECLAIR_OUTPUT_DIR=3D"${PWD}/ECLAIR/out"
+fi
+
+export ECLAIR_DIAGNOSTICS_OUTPUT=3D"${ECLAIR_OUTPUT_DIR}/ANALYSIS.log"
+# Set the variable for the build log file.
+ECLAIR_BUILD_LOG=3D${ECLAIR_OUTPUT_DIR}/BUILD.log
+# Set the variable for the report log file.
+ECLAIR_REPORT_LOG=3D${ECLAIR_OUTPUT_DIR}/REPORT.log
+
+if [[ "$1" =3D "X86_64" ]]; then
+  export CROSS_COMPILE=3D
+  export XEN_TARGET_ARCH=3Dx86_64
+  EXTRA_ECLAIR_ENV_OPTIONS=3D-disable=3DMC3R1.R20.7
+elif [[ "$1" =3D "ARM64" ]]; then
+  export CROSS_COMPILE=3Daarch64-linux-gnu-
+  export XEN_TARGET_ARCH=3Darm64
+else
+  fatal "Unknown configuration: $1"
+fi
+
+VARIANT=3D"${XEN_TARGET_ARCH}"
+
+# Used in analysis.ecl
+case "$2" in
+Set0|Set1|Set2|Set3)
+  export SET=3D"$2"
+  ;;
+*)
+  fatal "Unknown configuration: $2"
+  ;;
+esac
+
+export CC_ALIASES=3D"${CROSS_COMPILE}gcc-12"
+export CXX_ALIASES=3D"${CROSS_COMPILE}g++-12"
+export LD_ALIASES=3D"${CROSS_COMPILE}ld"
+export AR_ALIASES=3D"${CROSS_COMPILE}ar"
+export AS_ALIASES=3D"${CROSS_COMPILE}as"
+export FILEMANIP_ALIASES=3D"cp mv ${CROSS_COMPILE}objcopy"
+
+# ECLAIR binary data directory and workspace.
+export ECLAIR_DATA_DIR=3D"${ECLAIR_OUTPUT_DIR}/.data"
+# ECLAIR workspace.
+export ECLAIR_WORKSPACE=3D"${ECLAIR_DATA_DIR}/eclair_workspace"
+
+# Identifies the particular build of the project.
+export ECLAIR_PROJECT_NAME=3D"XEN_${VARIANT}-${SET}"
+# All paths mentioned in ECLAIR reports that are below this directory
+# will be presented as relative to ECLAIR_PROJECT_ROOT.
+export ECLAIR_PROJECT_ROOT=3D"${PWD}"
+
+# Erase and recreate the output directory and the data directory.
+rm -rf "${ECLAIR_OUTPUT_DIR:?}/*"
+mkdir -p "${ECLAIR_DATA_DIR}"
+
+# Perform the build (from scratch) in an ECLAIR environment.
+"${ECLAIR_BIN_DIR}eclair_env" \
+    "-config_file=3D'${SCRIPT_DIR}/analysis.ecl'" \
+    "${EXTRA_ECLAIR_ENV_OPTIONS}" \
+  -- "${SCRIPT_DIR}/../build.sh" "$1" | tee "${ECLAIR_BUILD_LOG}"
+
+
+# Create the project database.
+PROJECT_ECD=3D"${ECLAIR_OUTPUT_DIR}/PROJECT.ecd"
+find "${ECLAIR_DATA_DIR}" -maxdepth 1 -name "FRAME.*.ecb" |
+  sort | xargs cat |
+  "${ECLAIR_BIN_DIR}eclair_report" \
+    "-create_db=3D'${PROJECT_ECD}'" \
+    -load=3D/dev/stdin > "${ECLAIR_REPORT_LOG}" 2>&1
+
+# Create the Jenkins reports file.
+"${ECLAIR_BIN_DIR}eclair_report" \
+  "-db=3D'${PROJECT_ECD}'" \
+  "-eval_file=3D'${SCRIPT_DIR}/report.ecl'" \
+  >> "${ECLAIR_REPORT_LOG}" 2>&1
+
+"${SCRIPT_DIR}/print_analyzed_files.sh" "${PROJECT_ECD}" "${ECLAIR_OUTPUT_=
DIR}"
diff --git a/automation/eclair_analysis/ECLAIR/call_properties.ecl b/automa=
tion/eclair_analysis/ECLAIR/call_properties.ecl
new file mode 100644
index 0000000000..3f7794bf8b
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/call_properties.ecl
@@ -0,0 +1,106 @@
+
+-call_properties+=3D{"name(printk)", {"pointee_write(1..=3Dnever)", "taken=
()"}}
+-call_properties+=3D{"name(debugtrace_printk)", {"pointee_write(1..=3Dneve=
r)", "taken()"}}
+-call_properties+=3D{"name(panic)", {"pointee_write(1..=3Dnever)", "taken(=
)"}}
+-call_properties+=3D{"macro(^domain_crash$)", {"pointee_write(2..=3Dnever)=
", "taken()"}}
+-call_properties+=3D{"macro(^(g?d|mm_)?printk$)", {"pointee_write(2..=3Dne=
ver)", "taken()"}}
+-call_properties+=3D{"macro(^guest_bug_on_failed$)", {"pointee_write(1=3Dn=
ever)", "taken()"}}
+-call_properties+=3D{"macro(^spin_lock_init_prof$)", {"pointee_write(2=3Dn=
ever)", "taken()"}}
+-call_properties+=3D{"macro(^sched_test_func$)", {"pointee_write(1..=3Dnev=
er)", "taken()"}}
+-call_properties+=3D{"macro(^dev_(info|warn)$)", {"pointee_write(1..=3Dnev=
er)", "taken()"}}
+-call_properties+=3D{"macro(^PAGING_DEBUG$)", {"pointee_write(1..=3Dnever)=
", "taken()"}}
+-call_properties+=3D{"macro(^ACPI_(WARNING|ERROR|INFO)$)", {"pointee_write=
(1..=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(fdt_get_property_by_offset_)", {"pointee_write(=
3=3Dalways)", "pointee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(read_atomic_size)", {"pointee_write(2=3Dalways)=
", "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(device_tree_get_reg)", {"pointee_write(4..=3Dal=
ways)", "pointee_read(4..=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(dt_get_range)", {"pointee_write(3..=3Dalways)",=
 "pointee_read(3..=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(parse_static_mem_prop)", {"pointee_write(2..=3D=
always)", "pointee_read(2..=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(get_ttbr_and_gran_64bit)", {"pointee_write(1..2=
=3Dalways)", "pointee_read(1..2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(hvm_emulate_init_once)", {"pointee_write(1=3Dal=
ways)", "pointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(__vmread)", {"pointee_write(2=3Dalways)", "poin=
tee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(hvm_pci_decode_addr)", {"pointee_write(3=3Dalwa=
ys)", "pointee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(vpci_mmcfg_decode_addr)", {"pointee_write(3=3Da=
lways)", "pointee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(x86emul_decode)", {"pointee_write(1=3Dalways)",=
 "pointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(unmap_grant_ref)", {"pointee_write(2=3Dalways)"=
, "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(arm_smmu_cmdq_build_cmd)", {"pointee_write(1=3D=
always)", "pointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(pci_size_mem_bar)", {"pointee_write(4=3Dalways)=
", "pointee_read(4=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(_hvm_read_entry)", {"pointee_write(2=3Dalways)"=
, "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(hvm_map_guest_frame_rw)", {"pointee_write(3=3Da=
lways)", "pointee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(guest_cpuid)", {"pointee_write(4=3Dalways)", "p=
ointee_read(4=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(epte_get_entry_emt)", {"pointee_write(5=3Dalway=
s)", "pointee_read(5=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(mcheck_mca_logout)", {"pointee_write(3=3Dalways=
)", "pointee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(set_field_in_reg_u32)", {"pointee_write(5=3Dalw=
ays)", "pointee_read(5=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(alloc_affinity_masks)", {"pointee_write(1=3Dalw=
ays)", "pointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(xasprintf)", {"pointee_write(1=3Dalways)", "poi=
ntee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(find_non_smt)", {"pointee_write(2=3Dalways)", "=
pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(call_rcu)", {"pointee_write(1=3Dalways)", "poin=
tee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(getdomaininfo)", {"pointee_write(2=3Dalways)", =
"pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"^MAPPING_(INSERT|SEARCH)\\(.*$", {"pointee_write(2..=
=3Dalways)", "pointee_read(2..=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(FormatDec)", {"pointee_write(2=3Dalways)", "poi=
ntee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(FormatHex)", {"pointee_write(3=3Dalways)", "poi=
ntee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(p2m_get_ioreq_server)", {"pointee_write(2=3Dalw=
ays)", "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(elf_memset_unchecked)", {"pointee_write(1=3Dalw=
ays)", "pointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(set_iommu_pte_present)", {"pointee_write(7=3Dal=
ways)", "pointee_read(7=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(clear_iommu_pte_present)", {"pointee_write(4=3D=
always)", "pointee_read(4=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(vcpu_runstate_get)", {"pointee_write(2=3Dalways=
)", "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(va_start)", {"pointee_write(1=3Dalways)", "poin=
tee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(sgi_target_init)", {"pointee_write(1=3Dalways)"=
, "pointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(get_hw_residencies)", {"pointee_write(2=3Dalway=
s)", "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(x86_cpu_policy_to_featureset)", {"pointee_write=
(2=3Dalways)", "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"^simple_strtou?ll?\\(.*$", {"pointee_write(2=3Dalway=
s)", "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(msi_compose_msg)", {"pointee_write(3=3Dalways)"=
, "pointee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(print_tainted)", {"pointee_write(1=3Dalways)", =
"pointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(get_hvm_registers)", {"pointee_write(3=3Dalways=
)", "pointee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(x86_insn_modrm)", {"pointee_write(2..3=3Dalways=
)", "pointee_read(2..3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(cpuid_count_leaf)", {"pointee_write(3=3Dalways)=
", "pointee_read(3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(rcu_lock_remote_domain_by_id)", {"pointee_write=
(2=3Dalways)", "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(cpuid_count)", {"pointee_write(3..=3Dalways)", =
"pointee_read(3..=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(efi_boot_mem_unused)", {"pointee_write(1..=3Dal=
ways)", "pointee_read(1..=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(collect_time_info)", {"pointee_write(2=3Dalways=
)", "pointee_read(2=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(setup_xstate_comp)", {"pointee_write(1=3Dalways=
)", "pointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(map_domain_gfn)", {"pointee_read(5=3Dnever)", "=
taken()"}}
+-call_properties+=3D{"name(fdt_getprop)", {"pointee_read(4=3Dnever)", "tak=
en()"}}
+-call_properties+=3D{"name(fdt_get_name)", {"pointee_read(3=3Dnever)", "ta=
ken()"}}
+-call_properties+=3D{"name(fdt_get_property)", {"pointee_read(4=3Dnever)",=
 "taken()"}}
+-call_properties+=3D{"name(pci_get_host_bridge_segment)", {"pointee_read(2=
=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(dt_get_property)", {"pointee_read(3=3Dnever)", =
"taken()"}}
+-call_properties+=3D{"name(dt_property_read_u32)", {"pointee_read(3=3Dneve=
r)", "taken()"}}
+-call_properties+=3D{"name(dt_device_get_paddr)", {"pointee_read(3..4=3Dne=
ver)", "taken()"}}
+-call_properties+=3D{"name(get_evtchn_dt_property)", {"pointee_write(2..3=
=3Dmaybe)", "pointee_read(2..3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(setup_chosen_node)", {"pointee_write(2..3=3Dmay=
be)", "pointee_read(2..3=3Dnever)", "taken()"}}
+-call_properties+=3D{"name(queue_remove_raw)", {"pointee_read(2=3Dnever)",=
 "taken()"}}
+-call_properties+=3D{"macro(^memset$)", {"pointee_write(1=3Dalways)", "poi=
ntee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"macro(^va_start$)", {"pointee_write(1=3Dalways)", "p=
ointee_read(1=3Dnever)", "taken()"}}
+-call_properties+=3D{"macro(^memcmp$)", {"pointee_write(1..2=3Dnever)", "t=
aken()"}}
+-call_properties+=3D{"macro(^memcpy$)", {"pointee_write(1=3Dalways&&2..=3D=
never)", "pointee_read(1=3Dnever&&2..=3Dalways)", "taken()"}}
+
+-doc_begin=3D"Property inferred as a consequence of the semantics of devic=
e_tree_get_reg"
+-call_properties+=3D{"name(acquire_static_memory_bank)", {"pointee_write(4=
..=3Dalways)", "pointee_read(4..=3Dnever)", "taken()"}}
+-doc_end
+
+-doc_begin=3D"Property inferred as a consequence of the semantics of dt_se=
t_cell"
+-call_properties+=3D{"name(set_interrupt)", {"pointee_write(1=3Dalways)", =
"pointee_read(1=3Dnever)", "taken()"}}
+-doc_end
+
+-doc_begin=3D"Property inferred as a consequence of the semantics of __p2m=
_get_mem_access"
+-call_properties+=3D{"name(p2m_get_mem_access)", {"pointee_write(3=3Dalway=
s)", "pointee_read(3=3Dnever)", "taken()"}}
+-doc_end
+
+-doc_begin=3D"This function has alternative definitions with props {write=
=3Dalways,read=3Dnever} and {write=3Dnever,read=3Dnever}"
+-call_properties+=3D{"name(alloc_cpumask_var)", {"pointee_write(1=3Dmaybe)=
", "pointee_read(1=3Dnever)", "taken()"}}
+-doc_end
+
+-doc_begin=3D"Property inferred as a consequence of the semantics of alloc=
_cpumask_var"
+-call_properties+=3D{"name(xenctl_bitmap_to_cpumask)", {"pointee_write(1=
=3Dalways)", "pointee_read(1=3Dnever)", "taken()"}}
+-doc_end
+
+-doc_begin=3D"The call to bitmap_and causes the pointee of dstp to be alwa=
ys written"
+-call_properties+=3D{"^cpumask_(and|andnot|clear|copy|complement).*$", {"p=
ointee_write(1=3Dalways)", "pointee_read(1=3Dnever)" "taken()"}}
+-call_properties+=3D{"^bitmap_(andnot|complement|fill).*$", {"pointee_writ=
e(1=3Dalways)", "pointee_read(1=3Dnever)", "taken()"}}
+-doc_end
+
+-doc_begin=3D"The .*copy_(to|from).* helpers all have a memcpy-like expect=
ation that the destination is a copy of the source.
+Furthermore, their uses do initialize the involved variables as needed by =
futher uses in the caller."
+-call_properties+=3D{"macro(^(__)?(raw_)?copy_from_(paddr|guest|compat)(_o=
ffset)?$)", {"pointee_write(1=3Dalways)", "pointee_read(1=3Dnever)", "taken=
()"}}
+-call_properties+=3D{"macro(^(__)?copy_to_(guest|compat)(_offset)?$)", {"p=
ointee_write(2=3Dalways)", "pointee_read(2=3Dnever)", "taken()"}}
+-doc_end
diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
new file mode 100644
index 0000000000..e1a06daf2f
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -0,0 +1,298 @@
+### Set 1 ###
+
+#
+# Series 2.
+#
+
+-doc_begin=3D"The compiler implementation guarantees that the unreachable =
code is removed.
+Constant expressions and unreachable branches of if and switch statements =
are expected."
+-config=3DMC3R1.R2.1,+reports=3D{safe,"first_area(^.*has an invariantly.*$=
)"}
+-config=3DMC3R1.R2.1,+reports=3D{safe,"first_area(^.*incompatible with lab=
eled statement$)"}
+-doc_end
+
+-doc_begin=3D"Some functions are intended to be not referenced."
+-config=3DMC3R1.R2.1,+reports=3D{deliberate,"first_area(^.*is never refere=
nced$)"}
+-doc_end
+
+-doc_begin=3D"Unreachability in the following macros are expected and safe=
."
+-config=3DMC3R1.R2.1,statements+=3D{safe,"macro(name(BUG||assert_failed||E=
RROR_EXIT||ERROR_EXIT_DOM||PIN_FAIL))"}
+-doc_end
+
+-doc_begin=3D"Proving compliance with respect to Rule 2.2 is generally imp=
ossible:
+see https://arxiv.org/abs/2212.13933 for details. Moreover, peer review gi=
ves us
+confidence that no evidence of errors in the program's logic has been miss=
ed due
+to undetected violations of Rule 2.2, if any. Testing on time behavior giv=
es us
+confidence on the fact that, should the program contain dead code that is =
not
+removed by the compiler, the resulting slowdown is negligible."
+-config=3DMC3R1.R2.2,reports+=3D{disapplied,"any()"}
+-doc_end
+
+#
+# Series 3.
+#
+
+-doc_begin=3D"Comments starting with '/*' and containing hyperlinks are sa=
fe as
+they are not instances of commented-out code."
+-config=3DMC3R1.R3.1,reports+=3D{safe, "first_area(text(^.*https?://.*$))"}
+-doc_end
+
+#
+# Series 4.
+#
+
+-doc_begin=3D"The directive has been accepted only for the ARM codebase."
+-config=3DMC3R1.D4.3,reports+=3D{disapplied,"!(any_area(any_loc(file(^xen/=
arch/arm/arm64/.*$))))"}
+-doc_end
+
+-doc_begin=3D"Depending on the compiler, rewriting the following function-=
like
+macros as inline functions is not guaranteed to have the same effect."
+-config=3DMC3R1.D4.9,macros+=3D{deliberate,"name(likely)"}
+-config=3DMC3R1.D4.9,macros+=3D{deliberate,"name(unlikely)"}
+-config=3DMC3R1.D4.9,macros+=3D{deliberate,"name(unreachable)"}
+-doc_end
+
+-doc_begin=3D"These macros can be used on both pointers and unsigned long =
type values."
+-config=3DMC3R1.D4.9,macros+=3D{safe,"name(virt_to_maddr)"}
+-config=3DMC3R1.D4.9,macros+=3D{safe,"name(virt_to_mfn)"}
+-doc_end
+
+-doc_begin=3D"Rewriting variadic macros as variadic functions might have a=
 negative impact on safety."
+-config=3DMC3R1.D4.9,macros+=3D{deliberate,"variadic()"}
+-doc_end
+
+-doc_begin=3D"Rewriting macros with arguments that are, in turn, arguments=
 of
+__builtin_constant_p() can change the behavior depending on the optimizati=
on
+level."
+-config=3DMC3R1.D4.9,macro_argument_context+=3D"skip_to(class(type||expr||=
decl,any),
+                                            call(name(__builtin_constant_p=
)))"
+-doc_end
+
+-doc_begin=3D"Function-like macros defined in public headers are meant to =
be
+usable in C89 mode without any extensions. Hence they cannot be replaced by
+inline functions."
+-config=3DMC3R1.D4.9,macros+=3D{deliberate, "loc(file(api:public))"}
+-doc_end
+
+-doc_begin=3D"This header file is autogenerated or empty, therefore it pos=
es no
+risk if included more than once."
+-file_tag+=3D{empty_header, "^xen/arch/arm/efi/runtime\\.h$"}
+-file_tag+=3D{autogen_headers, "^xen/include/xen/compile\\.h$||^xen/includ=
e/generated/autoconf.h$||^xen/include/xen/hypercall-defs.h$"}
+-config=3DMC3R1.D4.10,reports+=3D{safe, "all_area(all_loc(file(empty_heade=
r||autogen_headers)))"}
+-doc_end
+
+-doc_begin=3D"Files that are intended to be included more than once do not=
 need to
+conform to the directive."
+-config=3DMC3R1.D4.10,reports+=3D{safe, "first_area(text(^/\\* This file i=
s legitimately included multiple times\\. \\*/$, begin-4))"}
+-config=3DMC3R1.D4.10,reports+=3D{safe, "first_area(text(^/\\* Generated f=
ile, do not edit! \\*/$, begin-3))"}
+-doc_end
+
+#
+# Series 5.
+#
+
+-doc_begin=3D"The project adopted the rule with an exception listed in
+'docs/misra/rules.rst'"
+-config=3DMC3R1.R5.3,reports+=3D{safe, "any_area(any_loc(any_exp(macro(^RE=
AD_SYSREG$))&&any_exp(macro(^WRITE_SYSREG$))))"}
+-config=3DMC3R1.R5.3,reports+=3D{safe, "any_area(any_loc(any_exp(macro(^ma=
x_t$))&&any_exp(macro(^min_t$))))"}
+-config=3DMC3R1.R5.3,reports+=3D{safe, "any_area(any_loc(any_exp(macro(^re=
ad[bwlq]$))&&any_exp(macro(^read[bwlq]_relaxed$))))"}
+-config=3DMC3R1.R5.3,reports+=3D{safe, "any_area(any_loc(any_exp(macro(^pe=
r_cpu$))&&any_exp(macro(^this_cpu$))))"}
+-doc_end
+
+-doc_begin=3D"The identifier 'fdt' is a widely-used name, for which no sui=
table
+substitute can be found. It is understood in 'xen/arch/arm/efi-boot.h' tha=
t the
+static variable 'fdt' cannot be confused with parameter names of the funct=
ion
+declarations that are present in the file."
+-file_tag+=3D{efi_boot_h, "^xen/arch/arm/efi/efi-boot\\.h$"}
+-config=3DMC3R1.R5.3,reports+=3D{deliberate, "any_area(decl(kind(var)&&sta=
tic_storage()&&^fdt$)&&any_loc(file(efi_boot_h)))"}
+-doc_end
+
+-doc_begin=3D"The identifier 'start' is a widely-used name, for which no s=
uitable
+substitute can be found. It is understood in 'xen/include/xen/kernel.h' th=
at the
+extern variable 'start' cannot be confused with omonymous parameter names =
of the
+function declarations where that variable is visible."
+-file_tag+=3D{kernel_h, "^xen/include/xen/kernel\\.h$"}
+-config=3DMC3R1.R5.3,reports+=3D{deliberate, "any_area(decl(kind(var)&&lin=
kage(external)&&^start$)&&any_loc(file(kernel_h)))"}
+-doc_end
+
+-doc_begin=3D"Function-like macros cannot be confused with identifiers tha=
t are
+neither functions nor pointers to functions."
+-config=3DMC3R1.R5.5,reports=3D{safe,"all_area(decl(node(enum_decl||record=
_decl||field_decl||param_decl||var_decl)&&!type(canonical(address((node(fun=
ction||function_no_proto))))))||macro(function_like()))"}
+-doc_end
+
+-doc_begin=3D"The use of these identifiers for both macro names and other =
entities
+is deliberate and does not generate developer confusion."
+-config=3DMC3R1.R5.5,reports+=3D{safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-=
9]+-safe\\s+MC3R1\\.R5\\.5.*$, begin-1))"}
+-doc_end
+
+-doc_begin=3D"The definition of macros and functions ending in '_bit' that=
 use the
+same identifier in 'bitops.h' is deliberate and safe."
+-file_tag+=3D{bitops_h, "^xen/arch/x86/include/asm/bitops\\.h$"}
+-config=3DMC3R1.R5.5,reports+=3D{safe, "all_area((decl(^.*_bit\\(.*$)||mac=
ro(^.*_bit$))&&all_loc(file(bitops_h)))"}
+-doc_end
+
+-doc_begin=3D"The definition of macros and functions beginning in 'str' or=
 'mem'
+that use the same identifier in 'xen/include/xen/string.h' is deliberate a=
nd
+safe."
+-file_tag+=3D{string_h, "^xen/include/xen/string\\.h$"}
+-config=3DMC3R1.R5.5,reports+=3D{safe, "any_area((decl(^(mem|str).*$)||mac=
ro(^(mem|str).*$))&&all_loc(file(string_h)))"}
+-doc_end
+
+#
+# Series 7.
+#
+
+-doc_begin=3D"Usage of the following constants is safe, since they are giv=
en as-is
+in the inflate algorithm specification and there is therefore no risk of t=
hem
+being interpreted as decimal constants."
+-config=3DMC3R1.R7.1,literals=3D{safe, "^0(007|37|070|213|236|300|321|330|=
331|332|333|334|335|337|371)$"}
+-doc_end
+
+-doc_begin=3D"Violations in files that maintainers have asked to not modif=
y in the
+context of R7.2."
+-file_tag+=3D{adopted_r7_2,"^xen/include/xen/libfdt/.*$"}
+-file_tag+=3D{adopted_r7_2,"^xen/arch/x86/include/asm/x86_64/efibind.h$"}
+-file_tag+=3D{adopted_r7_2,"^xen/include/efi/efiapi\\.h$"}
+-file_tag+=3D{adopted_r7_2,"^xen/include/efi/efidef\\.h$"}
+-file_tag+=3D{adopted_r7_2,"^xen/include/efi/efiprot\\.h$"}
+-file_tag+=3D{adopted_r7_2,"^xen/arch/x86/cpu/intel\\.c$"}
+-file_tag+=3D{adopted_r7_2,"^xen/arch/x86/cpu/amd\\.c$"}
+-file_tag+=3D{adopted_r7_2,"^xen/arch/x86/cpu/common\\.c$"}
+-config=3DMC3R1.R7.2,reports+=3D{deliberate,"any_area(any_loc(file(adopted=
_r7_2)))"}
+-doc_end
+
+-doc_begin=3D"Violations caused by __HYPERVISOR_VIRT_START are related to =
the
+particular use of it done in xen_mk_ulong."
+-config=3DMC3R1.R7.2,reports+=3D{deliberate,"any_area(any_loc(macro(name(B=
UILD_BUG_ON))))"}
+-doc_end
+
+-doc_begin=3D"The following string literals are assigned to pointers to non
+const-qualified char."
+-config=3DMC3R1.R7.4,reports+=3D{safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-=
9]+-safe\\s+MC3R1\\.R7\\.4.*$, begin-1))"}
+-doc_end
+
+-doc_begin=3D"Allow pointers of non-character type as long as the pointee =
is
+const-qualified."
+-config=3DMC3R1.R7.4,same_pointee=3Dfalse
+-doc_end
+
+#
+# Series 8.
+#
+
+-doc_begin=3D"The following variables are compiled in multiple translation=
 units
+belonging to different executables and therefore are safe."
+-config=3DMC3R1.R8.6,declarations+=3D{safe, "name(current_stack_pointer||b=
search||sort)"}
+-doc_end
+
+-doc_begin=3D"Declarations without definitions are allowed (specifically w=
hen the
+definition is compiled-out or optimized-out by the compiler)"
+-config=3DMC3R1.R8.6,reports+=3D{deliberate, "first_area(^.*has no definit=
ion$)"}
+-doc_end
+
+-doc_begin=3D"The gnu_inline attribute without static is deliberately allo=
wed."
+-config=3DMC3R1.R8.10,declarations+=3D{deliberate,"property(gnu_inline)"}
+-doc_end
+
+#
+# Series 9.
+#
+
+-doc_begin=3D"The following variables are written before being set, theref=
ore no
+access to uninitialized memory locations happens, as explained in the devi=
ation
+comment."
+-config=3DMC3R1.R9.1,reports+=3D{safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-=
9]+-safe\\s+MC3R1\\.R9\\.1.*$, begin-1))"}
+-doc_end
+
+-doc_begin=3D"Violations in files that maintainers have asked to not modif=
y in the
+context of R9.1."
+-file_tag+=3D{adopted_r9_1,"^xen/arch/arm/arm64/lib/find_next_bit\\.c$"}
+-config=3DMC3R1.R9.1,reports+=3D{deliberate,"any_area(any_loc(file(adopted=
_r9_1)))"}
+-doc_end
+
+-doc_begin=3D"The possibility of committing mistakes by specifying an expl=
icit
+dimension is higher than omitting the dimension."
+-config=3DMC3R1.R9.5,reports+=3D{deliberate, "any()"}
+-doc_end
+
+### Set 2 ###
+
+#
+# Series 10.
+#
+
+-doc_begin=3D"The value-preserving conversions of integer constants are sa=
fe"
+-config=3DMC3R1.R10.1,etypes=3D{safe,"any()","preserved_integer_constant()=
"}
+-config=3DMC3R1.R10.3,etypes=3D{safe,"any()","preserved_integer_constant()=
"}
+-config=3DMC3R1.R10.4,etypes=3D{safe,"any()","preserved_integer_constant()=
||sibling(rhs,preserved_integer_constant())"}
+-doc_end
+
+-doc_begin=3D"Shifting non-negative integers to the right is safe."
+-config=3DMC3R1.R10.1,etypes+=3D{safe,
+  "stmt(node(binary_operator)&&operator(shr))",
+  "src_expr(definitely_in(0..))"}
+-doc_end
+
+-doc_begin=3D"Shifting non-negative integers to the left is safe if the re=
sult is
+still non-negative."
+-config=3DMC3R1.R10.1,etypes+=3D{safe,
+  "stmt(node(binary_operator)&&operator(shl)&&definitely_in(0..))",
+  "src_expr(definitely_in(0..))"}
+-doc_end
+
+-doc_begin=3D"Bitwise logical operations on non-negative integers are safe=
."
+-config=3DMC3R1.R10.1,etypes+=3D{safe,
+  "stmt(node(binary_operator)&&operator(and||or||xor))",
+  "src_expr(definitely_in(0..))"}
+-doc_end
+
+-doc_begin=3D"The implicit conversion to Boolean for logical operator argu=
ments is well known to all Xen developers to be a comparison with 0"
+-config=3DMC3R1.R10.1,etypes+=3D{safe, "stmt(operator(logical)||node(condi=
tional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
+-doc_end
+
+### Set 3 ###
+
+#
+# Series 18.
+#
+
+-doc_begin=3D"FIXME: explain why pointer differences involving this macro =
are safe."
+-config=3DMC3R1.R18.2,reports+=3D{safe,"all_area(all_loc(any_exp(macro(^AC=
PI_PTR_DIFF$))))"}
+-doc_end
+
+-doc_begin=3D"FIXME: explain why pointer differences involving this macro =
are safe."
+-config=3DMC3R1.R18.2,reports+=3D{safe,"all_area(all_loc(any_exp(macro(^pa=
ge_to_mfn$))))"}
+-doc_end
+
+-doc_begin=3D"FIXME: explain why pointer differences involving this macro =
are safe."
+-config=3DMC3R1.R18.2,reports+=3D{safe,"all_area(all_loc(any_exp(macro(^pa=
ge_to_pdx$))))"}
+-doc_end
+
+#
+# Series 20.
+#
+
+-doc_begin=3D"Code violating Rule 20.7 is safe when macro parameters are u=
sed: (1)
+as function arguments; (2) as macro arguments; (3) as array indices; (4) a=
s lhs
+in assignments."
+-config=3DMC3R1.R20.7,expansion_context=3D
+{safe, "context(__call_expr_arg_contexts)"},
+{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(arr=
ay_subscript_expr), subscript)))"},
+{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(operator=
(assign), lhs)))"},
+{safe, "left_right(^[(,\\[]$,^[),\\]]$)"}
+-doc_end
+
+#
+# Developer confusion
+#
+
+-doc=3D"Selection for reports that are fully contained in adopted code."
+-report_selector+=3D{adopted_report,"all_area(!kind(culprit||evidence)||al=
l_loc(all_exp(adopted||pseudo)))"}
+
+-doc_begin=3D"Adopted code is not meant to be read, reviewed or modified b=
y human
+programmers:no developers' confusion is not possible. In addition, adopted=
 code
+is assumed to work as is. Reports that are fully contained in adopted code=
 are
+hidden/tagged with the 'adopted' tag."
+-service_selector=3D{developer_confusion_guidelines,"^(MC3R1\\.R2\\.1|MC3R=
1\\.R2\\.2|MC3R1\\.R2\\.3|MC3R1\\.R2\\.4|MC3R1\\.R2\\.5|MC3R1\\.R2\\.6|MC3R=
1\\.R2\\.7|MC3R1\\.R4\\.1|MC3R1\\.R5\\.3|MC3R1\\.R5\\.6|MC3R1\\.R5\\.7|MC3R=
1\\.R5\\.8|MC3R1\\.R5\\.9|MC3R1\\.R7\\.1|MC3R1\\.R7\\.2|MC3R1\\.R7\\.3|MC3R=
1\\.R8\\.7|MC3R1\\.R8\\.8|MC3R1\\.R8\\.9|MC3R1\\.R8\\.11|MC3R1\\.R8\\.12|MC=
3R1\\.R8\\.13|MC3R1\\.R9\\.3|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R10\\.2|=
MC3R1\\.R10\\.5|MC3R1\\.R10\\.6|MC3R1\\.R10\\.7|MC3R1\\.R10\\.8|MC3R1\\.R11=
\\.9|MC3R1\\.R12\\.1|MC3R1\\.R12\\.3|MC3R1\\.R12\\.4|MC3R1\\.R13\\.5|MC3R1\=
\.R14\\.1|MC3R1\\.R14\\.2|MC3R1\\.R14\\.3|MC3R1\\.R15\\.1|MC3R1\\.R15\\.2|M=
C3R1\\.R15\\.3|MC3R1\\.R15\\.4|MC3R1\\.R15\\.5|MC3R1\\.R15\\.6|MC3R1\\.R15\=
\.7|MC3R1\\.R16\\.1|MC3R1\\.R16\\.2|MC3R1\\.R16\\.3|MC3R1\\.R16\\.4|MC3R1\\=
.R16\\.5|MC3R1\\.R16\\.6|MC3R1\\.R16\\.7|MC3R1\\.R17\\.7|MC3R1\\.R17\\.8|MC=
3R1\\.R18\\.4|MC3R1\\.R18\\.5)$"
+}
+-config=3Ddeveloper_confusion_guidelines,reports+=3D{relied,adopted_report}
+-doc_end
diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automatio=
n/eclair_analysis/ECLAIR/out_of_scope.ecl
new file mode 100644
index 0000000000..44db6997b5
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
@@ -0,0 +1,127 @@
+-doc_begin=3D"Imported from Linux: ignore for now."
+-file_tag+=3D{adopted,"^xen/common/libfdt/.*$"}
+-file_tag+=3D{adopted,"^xen/include/xen/libfdt/.*$"}
+-file_tag+=3D{adopted,"^xen/common/xz/.*$"}
+-file_tag+=3D{adopted,"^xen/common/zstd/.*$"}
+-file_tag+=3D{adopted,"^xen/drivers/acpi/apei/.*$"}
+-file_tag+=3D{adopted,"^xen/drivers/acpi/tables/.*$"}
+-file_tag+=3D{adopted,"^xen/drivers/acpi/utilities/.*$"}
+-file_tag+=3D{adopted,"^xen/drivers/video/font_.*$"}
+-file_tag+=3D{adopted,"^xen/arch/arm/arm64/cpufeature\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/arm/arm64/insn\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/arm/arm64/lib/find_next_bit\\.c$"}
+-file_tag+=3D{adopted,"^xen/common/bitmap\\.c$"}
+-file_tag+=3D{adopted,"^xen/common/bunzip2\\.c$"}
+-file_tag+=3D{adopted,"^xen/common/earlycpio\\.c$"}
+-file_tag+=3D{adopted,"^xen/common/inflate\\.c$"}
+-file_tag+=3D{adopted,"^xen/common/lzo\\.c$"}
+-file_tag+=3D{adopted,"^xen/common/lz4/decompress\\.c$"}
+-file_tag+=3D{adopted,"^xen/common/radix-tree\\.c$"}
+-file_tag+=3D{adopted,"^xen/common/ubsan/ubsan\\.c$"}
+-file_tag+=3D{adopted,"^xen/drivers/acpi/hwregs\\.c$"}
+-file_tag+=3D{adopted,"^xen/drivers/acpi/numa\\.c$"}
+-file_tag+=3D{adopted,"^xen/drivers/acpi/osl\\.c$"}
+-file_tag+=3D{adopted,"^xen/drivers/acpi/tables\\.c$"}
+-file_tag+=3D{adopted,"^xen/lib/list-sort\\.c$"}
+-file_tag+=3D{adopted,"^xen/lib/rbtree\\.c$"}
+-file_tag+=3D{adopted,"^xen/lib/xxhash.*\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/acpi/boot\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/acpi/cpu_idle\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/acpi/cpufreq/cpufreq\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/acpi/cpuidle_menu\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/acpi/lib\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/amd\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/centaur\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/common\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/hygon\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/intel\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/intel_cacheinfo\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/mcheck/non-fatal\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/mtrr/.*$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/cpu/mwait-idle\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/delay\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/dmi_scan\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/mpparse\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/srat\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/time\\.c$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/x86_64/mmconf-fam10h\\.c$"}
+-doc_end
+
+-doc_begin=3D"Intel specific source files are out of scope."
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/cpu/intel\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/cpu/intel_cacheinfo\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/cpu/microcode/intel\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/cpu/shanghai\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/hvm/vmx/.*$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/include/asm/hvm/vmx/.*$"}
+-file_tag+=3D{out_of_scope,"^xen/drivers/passthrough/vtd/.*$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/cpu/mcheck/mce_intel\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/cpu/mwait-idle\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/cpu/vpmu_intel\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/tsx\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/mm/altp2m\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/mm/p2m-ept\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/mm/hap/nested_ept\\.c$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/include/asm/altp2m\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/arch/x86/include/asm/intel-family\\.h$"}
+-doc_end
+
+-doc_begin=3D"Not in scope initially as it generates many violations and i=
t is not enabled in safety configurations."
+-file_tag+=3D{adopted,"^xen/xsm/flask/.*$"}
+-doc_end
+
+-doc_begin=3D"unlz4.c implementation by Yann Collet, the others un* are fr=
om Linux, ignore for now."
+-file_tag+=3D{adopted,"^xen/common/un.*\\.c$"}
+-doc_end
+
+-doc_begin=3D"Origin is external and documented in xen/crypto/README.sourc=
e ."
+-file_tag+=3D{adopted,"^xen/crypto/.*$"}
+-doc_end
+
+-doc_begin=3D"Files imported from the gnu-efi package"
+-file_tag+=3D{adopted,"^xen/include/efi/.*$"}
+-file_tag+=3D{adopted,"^xen/arch/x86/include/asm/x86_64/efibind\\.h$"}
+-doc_end
+
+-doc_begin=3D"Build tools are out of scope."
+-file_tag+=3D{out_of_scope_tools,"^xen/tools/.*$"}
+-file_tag+=3D{out_of_scope_tools,"^xen/arch/x86/efi/mkreloc\\.c$"}
+-file_tag+=3D{out_of_scope_tools,"^xen/arch/x86/boot/mkelf32\\.c$"}
+-doc_end
+
+-doc_begin=3D"Out of scope headers."
+-file_tag+=3D{out_of_scope,"^xen/include/xen/bitmap\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/include/xen/earlycpio\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/include/xen/lzo\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/include/xen/lz4\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/common/lz4/defs\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/include/xen/list_sort\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/include/xen/rbtree\\.h$"}
+-file_tag+=3D{out_of_scope,"^xen/include/xen/xxhash\\.h$"}
+-doc_end
+
+-doc_begin=3D"Headers under xen/include/public/ are the description of the=
 public
+hypercall ABI so the community is extremely conservative in making changes
+there, because the interface is maintained for backward compatibility: ign=
ore
+for now."
+-file_tag+=3D{hypercall_ABI, "^xen/include/public/.*$"}
+-source_files+=3D{hide, hypercall_ABI}
+-doc_end
+
+-doc_begin=3D"Consider out-of-scope files external to the project."
+-file_tag+=3D{external, out_of_scope}
+-doc_end
+
+-doc_begin=3D"Consider adopted files external to the project."
+-file_tag+=3D{external, adopted}
+-doc_end
+
+-doc_begin=3D"Disregard out-of-scope tools."
+-frames+=3D{hide,"main(out_of_scope_tools)"}
+-doc_end
+
+-doc_begin=3D"The build performs speculative calls with target /dev/null: =
this
+frames should be ignored."
+-frames+=3D{hide,"target(^/dev/null$)"}
+-doc_end
diff --git a/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh b/au=
tomation/eclair_analysis/ECLAIR/print_analyzed_files.sh
new file mode 100755
index 0000000000..163228ea96
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh
@@ -0,0 +1,66 @@
+#!/bin/bash
+# Stop immediately if any executed command has exit status different from =
0.
+set -eux
+
+script_name=3D"$(basename "$0")"
+script_dir=3D"$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null =
&& pwd )"
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+usage() {
+  fatal "Usage: ${script_name} DATABASE OUT_DIR"
+}
+
+extrapolate_regex() {
+  lookbehind=3D$1
+  file=3D$2
+  grep -Po "(?<=3D${lookbehind}\"\\^).*(?=3D\\$\")" "${file}" | sed 's/\\\=
\/\\/'
+}
+
+if [ $# -lt 2 ]; then
+  usage
+fi
+
+DB=3D$1
+OUT_DIR=3D$2
+
+files_txt=3D"${OUT_DIR}/files.txt"
+files_c_txt=3D"${OUT_DIR}/files_c.txt"
+files_h_txt=3D"${OUT_DIR}/files_h.txt"
+exclusions_txt=3D"${OUT_DIR}/exclusions.txt"
+
+
+if [[ ! -d "${OUT_DIR}" ]]; then
+  mkdir -p "${OUT_DIR}"
+else
+  rm -f "${files_txt}"
+  rm -f "${files_c_txt}"
+  rm -f "${files_h_txt}"
+  rm -f "${exclusions_txt}"
+fi
+
+# Generating txt report with files
+"${ECLAIR_BIN_DIR}eclair_report" -db=3D"${DB}" -files_txt=3D"${files_txt}"
+
+{
+  # Extracting out of scope code
+  out_of_scope_ecl=3D"${script_dir}/out_of_scope.ecl"
+  extrapolate_regex adopted,             "${out_of_scope_ecl}"
+  extrapolate_regex out_of_scope_tools,  "${out_of_scope_ecl}"
+  extrapolate_regex out_of_scope,        "${out_of_scope_ecl}"
+  extrapolate_regex hypercall_ABI,       "${out_of_scope_ecl}"
+  extrapolate_regex "hide, "             "${out_of_scope_ecl}"
+} >"${exclusions_txt}"
+sort -o "${exclusions_txt}" -u "${exclusions_txt}"
+
+# Removing exclusions from files_txt
+grep -E -v "(object: |/dev/pipe)" "${files_txt}" > "${files_txt}.tmp"
+grep -vf "${exclusions_txt}" "${files_txt}.tmp" > "${files_txt}"
+rm "${files_txt}.tmp"
+# Creating files with only headers
+grep -Ev "(xen.*\.(h\w+|[^h]\w*) |.*ecl)" "${files_txt}" > "${files_h_txt}"
+# Creating files with only c files
+grep -Ev "(xen.*\.(c\w+|[^c]\w*) |.*ecl)" "${files_txt}" > "${files_c_txt}"
diff --git a/automation/eclair_analysis/ECLAIR/public_APIs.ecl b/automation=
/eclair_analysis/ECLAIR/public_APIs.ecl
new file mode 100644
index 0000000000..9701a295e6
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/public_APIs.ecl
@@ -0,0 +1,6 @@
+# Definition of the public APIs.
+
+-doc=3D"All Xen public headers."
+-file_tag+=3D{api:public,"^xen/include/public/.*\\.h$"}
+
+-public_files+=3Dapi:public
diff --git a/automation/eclair_analysis/ECLAIR/report.ecl b/automation/ecla=
ir_analysis/ECLAIR/report.ecl
new file mode 100644
index 0000000000..6ee324746c
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/report.ecl
@@ -0,0 +1,4 @@
+# eclair_report
+
+reports_codeclimate("gl-code-quality-report.json")
+
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/ecl=
air_analysis/ECLAIR/tagging.ecl
new file mode 100644
index 0000000000..ef2e56e186
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -0,0 +1,34 @@
+-doc=3D"Hide reports marked as compliant."
+-remap_rtag=3D{compliant,hide}
+
+-doc=3D"Hide reports marked as safe."
+-remap_rtag=3D{safe,hide}
+
+-doc=3D"Hide reports marked as relied."
+-remap_rtag=3D{relied,hide}
+
+-doc=3D"Hide reports marked as deliberate."
+-remap_rtag=3D{deliberate,hide}
+
+-doc=3D"Hide reports marked as disapplied."
+-remap_rtag=3D{disapplied,hide}
+
+#######################
+# Accepted guidelines #
+#######################
+
+-doc=3D"Accepted guidelines as reported in XEN/docs/misra/rules.rst"
+-service_selector=3D{accepted_guidelines,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|=
MC3R1\\.D4\\.3|MC3R1\\.D4\\.7|MC3R1\\.D4\\.10|MC3R1\\.D4\\.11|MC3R1\\.D4\\.=
14|MC3R1\\.R1\\.1|MC3R1\\.R1\\.3|MC3R1\\.R1\\.4|MC3R1\\.R2\\.1|MC3R1\\.R2\\=
.6|MC3R1\\.R2\\.2|MC3R1\\.R3\\.1|MC3R1\\.R3\\.2|MC3R1\\.R4\\.1|MC3R1\\.R4\\=
.2|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.3|MC3R1\\.R5\\.4|MC3R1\\.R5\\=
.6|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R7\\.2|MC3R1\\.R7\\=
.3|MC3R1\\.R7\\.4|MC3R1\\.R8\\.1|MC3R1\\.R8\\.2|MC3R1\\.R8\\.3|MC3R1\\.R8\\=
.4|MC3R1\\.R8\\.5|MC3R1\\.R8\\.6|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\=
\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.1|MC3R1\\.R9\\.2|MC3R1\\.R9\\.3|MC3R1\\.R=
9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R13\\.6|MC3R1\\.R13\\.1|MC3R1\=
\.R14\\.1|MC3R1\\.R16\\.7|MC3R1\\.R17\\.3|MC3R1\\.R17\\.4|MC3R1\\.R17\\.6|M=
C3R1\\.R18\\.3|MC3R1\\.R19\\.1|MC3R1\\.R20\\.7|MC3R1\\.R20\\.13|MC3R1\\.R20=
\\.14|MC3R1\\.R21\\.13|MC3R1\\.R21\\.17|MC3R1\\.R21\\.18|MC3R1\\.R21\\.19|M=
C3R1\\.R21\\.20|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R2=
2\\.5|MC3R1\\.R22\\.6)$"
+}
+-doc=3D"All reports of accepted guidelines are tagged as accepted."
+-reports+=3D{status:accepted,"service(accepted_guidelines)"}
+
+####################
+# Clean guidelines #
+####################
+
+-doc_begin=3D"Clean guidelines: new violations for these guidelines are no=
t accepted."
+-service_selector=3D{clean_guidelines,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3=
R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.4|MC3R1\\.R2\\.2|MC3R1\\.R3\\.2|M=
C3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.4|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|M=
C3R1\\.R7\\.1|MC3R1\\.R8\\.1|MC3R1\\.R8\\.5|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|=
MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.2|MC3R1\\.R9\\.4|MC3R1\\.R9\\.=
5|MC3R1\\.R12\\.5|MC3R1\\.R17\\.3|MC3R1\\.R17\\.6|MC3R1\\.R21\\.13|MC3R1\\.=
R21\\.19|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5)$"
+}
+-reports+=3D{clean:added,"service(clean_guidelines)"}
+-doc_end
diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/e=
clair_analysis/ECLAIR/toolchain.ecl
new file mode 100644
index 0000000000..e6cd289b5e
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -0,0 +1,275 @@
+# Compilers.
+-file_tag+=3D{GCC_ARM64,"^/usr/bin/aarch64-linux-gnu-gcc-12$"}
+-file_tag+=3D{GCC_X86_64,"^/usr/bin/x86_64-linux-gnu-gcc-12$"}
+
+# Manuals.
+-setq=3DGCC_MANUAL,"https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gcc.pdf"
+-setq=3DCPP_MANUAL,"https://gcc.gnu.org/onlinedocs/gcc-12.1.0/cpp.pdf"
+-setq=3DARM64_ABI_MANUAL,"https://github.com/ARM-software/abi-aa/blob/60a8=
eb8c55e999d74dac5e368fc9d7e36e38dda4/aapcs64/aapcs64.rst"
+-setq=3DX86_64_ABI_MANUAL,"https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs=
/artifacts/master/raw/x86-64-ABI/abi.pdf?job=3Dbuild"
+-setq=3DARM64_LIBC_MANUAL,"https://www.gnu.org/software/libc/manual/pdf/li=
bc.pdf"
+-setq=3DX86_64_LIBC_MANUAL,"https://www.gnu.org/software/libc/manual/pdf/l=
ibc.pdf"
+-setq=3DC99_STD,"ISO/IEC 9899:1999"
+
+-doc_begin=3D"
+    _Static_assert: see Section \"2.1 C Language\" of "GCC_MANUAL".
+    asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 How =
to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
+    __volatile__: see Sections \"6.48 Alternate Keywords\" and \"6.47.2.1 =
Volatile\" of "GCC_MANUAL".
+    __const__, __inline__, __inline: see Section \"6.48 Alternate Keywords=
\" of "GCC_MANUAL".
+    typeof, __typeof__: see Section \"6.7 Referring to a Type with typeof\=
" of "GCC_MANUAL".
+    __alignof__, __alignof: see Sections \"6.48 Alternate Keywords\" and \=
"6.44 Determining the Alignment of Functions, Types or Variables\" of "GCC_=
MANUAL".
+    __attribute__: see Section \"6.39 Attribute Syntax\" of "GCC_MANUAL".
+    __builtin_types_compatible_p: see Section \"6.59 Other Built-in Functi=
ons Provided by GCC\" of "GCC_MANUAL".
+    __builtin_va_arg: non-documented GCC extension.
+    __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GCC_=
MANUAL".
+"
+-config=3DSTD.tokenext,behavior+=3D{c99, GCC_ARM64, "^(_Static_assert|asm|=
__asm__|__volatile__|__const__|__inline__|typeof|__typeof__|__alignof__|__a=
ttribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof=
)$"}
+-config=3DSTD.tokenext,behavior+=3D{c99, GCC_X86_64, "^(_Static_assert|asm=
|__asm__|__volatile__|__const__|__inline__|__inline|typeof|__typeof__|__ali=
gnof__|__alignof|__attribute__|__builtin_types_compatible_p|__builtin_va_ar=
g|__builtin_offsetof)$"}
+-doc_end
+
+-doc_begin=3D"Non-documented GCC extension."
+-config=3DSTD.emptinit,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.emptinit,behavior+=3D{c99,GCC_X86_64,specified}
+#-config=3DSTD.emptinit,behavior+=3D{c18,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"See Section \"6.24 Arithmetic on void- and Function-Pointers=
\" of "GCC_MANUAL"."
+-config=3DSTD.vptrarth,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.vptrarth,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"See Section \"6.1 Statements and Declarations in Expressions=
\" of "GCC_MANUAL"."
+-config=3DSTD.stmtexpr,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.stmtexpr,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"See Section \"6.19 Structures with No Members\" of "GCC_MANU=
AL"."
+-config=3DSTD.emptrecd,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.emptrecd,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"See Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL"."
+-config=3DSTD.arayzero,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.arayzero,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"See Section \"6.8 Conditionals with Omitted Operands\" of "G=
CC_MANUAL"."
+-config=3DSTD.bincondl,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.bincondl,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"See Section \"6.30 Case Ranges\" of "GCC_MANUAL"."
+-config=3DSTD.caseuplw,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.caseuplw,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"See Section \"6.63 Unnamed Structure and Union Fields\" of "=
GCC_MANUAL"."
+-config=3DSTD.anonfild,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.anonfild,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"Non-documented GCC extension."
+-config=3DSTD.emptdecl,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.emptdecl,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"Non-documented GCC extension."
+-config=3DSTD.emptenum,behavior+=3D{c99,GCC_ARM64,specified}
+-doc_end
+
+-doc_begin=3D"Non-documented GCC extension."
+-config=3DSTD.pteincmp,behavior+=3D{c99,GCC_ARM64,specified}
+-config=3DSTD.pteincmp,behavior+=3D{c99,GCC_X86_64,specified}
+#-config=3DSTD.pteincmp,behavior+=3D{c18,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"Non-documented GCC extension."
+-config=3DSTD.funojptr,behavior+=3D{c99,GCC_X86_64,specified}
+-doc_end
+
+-doc_begin=3D"
+    ext_paste_comma: see Section \"6.21 Macros with a Variable Number of A=
rguments\" of "GCC_MANUAL".
+    ext_missing_varargs_arg: see Section \"6.21 Macros with a Variable Num=
ber of Arguments\" of "GCC_MANUAL".
+    ext_named_variadic_macro: see Section \"6.21 Macros with a Variable Nu=
mber of Arguments\" of "GCC_MANUAL".
+    ext_return_has_void_expr: see the documentation for -Wreturn-type in S=
ection \"3.8 Options to Request or Suppress Warnings\" of "GCC_MANUAL".
+    ext_gnu_statement_expr_macro: see Section \"6.1 Statements and Declara=
tions in Expressions\" of "GCC_MANUAL".
+    ext_sizeof_alignof_void_type: see Section \"6.24 Arithmetic on void- a=
nd Function-Pointers\" of "GCC_MANUAL".
+    ext_forward_ref_enum_def: see Section \"6.49 Incomplete enum Types\" o=
f "GCC_MANUAL".
+    ext_flexible_array_in_struct: see Section \"6.18 Arrays of Length Zero=
\" of "GCC_MANUAL".
+    ext_flexible_array_in_array: see Section \"6.18 Arrays of Length Zero\=
" of "GCC_MANUAL".
+    ext_enum_value_not_int: non-documented GCC extension.
+    ext_gnu_array_range: see Section \"6.29 Designated Initializers\" of "=
GCC_MANUAL".
+"
+-config=3DSTD.diag,behavior+=3D{c99,GCC_ARM64,"^(ext_paste_comma|ext_missi=
ng_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_st=
atement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ex=
t_gnu_array_range)$"}
+-config=3DSTD.diag,behavior+=3D{c99,GCC_X86_64,"^(ext_paste_comma|ext_miss=
ing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_s=
tatement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_stru=
ct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$=
"}
+-doc_end
+
+-doc_begin=3D"The maximum size of an object is defined in the MAX_SIZE mac=
ro, and for a 32 bit architecture is 8MB.
+    The maximum size for an array is defined in the PTRDIFF_MAX and in a 3=
2 bit architecture is 2^30-1.
+    See occurrences of these macros in "GCC_MANUAL"."
+-config=3DSTD.byteobjt,behavior+=3D{c99, GCC_ARM64, 8388608}
+-config=3DSTD.byteobjt,behavior+=3D{c99, GCC_X86_64, 8388608}
+-doc_end
+
+-doc_begin=3D"See Section \"11.2 Implementation limits\" of "CPP_MANUAL"."
+-config=3DSTD.charline,behavior+=3D{c99, GCC_ARM64, 5000}
+-config=3DSTD.charline,behavior+=3D{c99, GCC_X86_64, 12000}
+-doc_end
+
+-doc_begin=3D"See Section \"11.2 Implementation limits\" of "CPP_MANUAL"."
+-config=3DSTD.inclnest,behavior+=3D{c99, GCC_ARM64, 24}
+-config=3DSTD.inclnest,behavior+=3D{c99, GCC_X86_64, 32}
+-doc_end
+
+-doc_begin=3D"FIXME: why is C90 used?"
+-config=3DSTD.ppifnest,behavior+=3D{c90, GCC_X86_64, 32}
+-doc_end
+
+-doc_begin=3D"See Section \"4.12 Statements\" of "GCC_MANUAL"."
+-config=3DSTD.caselimt,behavior+=3D{c99, GCC_X86_64, 1500}
+-doc_end
+
+-doc_begin=3D"See Section \"6.9 128-bit Integers\" of "GCC_MANUAL"."
+-config=3DSTD.stdtypes,behavior+=3D{c99, GCC_X86_64, "__uint128_t"}
+-doc_end
+
+-doc_begin=3D"FIXME: Non-documented GCC extension?"
+-config=3DSTD.charescp,behavior=3D{c99, GCC_X86_64, "^m$"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.9 Structures, Unions, Enumerations, and Bit-=
Fields\" of "GCC_MANUAL"."
+-config=3DSTD.bitfldtp, +behavior=3D{c99, GCC_ARM64, "unsigned char;unsign=
ed short;unsigned long;unsigned long long"}
+-config=3DSTD.bitfldtp, +behavior=3D{c99, GCC_X86_64, "unsigned char;unsig=
ned short;unsigned long;enum"}
+-doc_end
+
+-doc_begin=3D"
+    #pragma pack: see Section \"6.62.11 Structure-Layout Pragmas\" of "GCC=
_MANUAL".
+    #pragma GCC visibility: see Section \"6.62.14 Visibility Pragmas\" of =
"GCC_MANUAL".
+"
+-config=3DSTD.nonstdc,behavior=3D{c99, GCC_ARM64, "^(pack\\(|GCC visibilit=
y (push|pop)).*$"}
+-config=3DSTD.nonstdc,behavior=3D{c99, GCC_X86_64, "^(pack\\(|GCC visibili=
ty (push|pop)).*$"}
+-doc_end
+
+-doc_begin=3D"See Section \"1.1 Character sets\" of "CPP_MANUAL".  We assu=
me the locale is not restricting any UTF-8 characters being part of the sou=
rce character set."
+-config=3DSTD.charset,behavior=3D{c99, GCC_ARM64, "utf8"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.3 Identifiers\" of "GCC_MANUAL"."
+-config=3DSTD.extidsig, behavior+=3D{c99, GCC_ARM64, "63"}
+-config=3DSTD.extidsig, behavior+=3D{c99, GCC_X86_64, "63"}
+-doc_end
+
+#
+# Documentation for relied-upon implementation-defined behaviors (Dir 1.1)
+#
+
+-doc_begin=3D"See Section \"4.4 Characters\" of "GCC_MANUAL" and Section \=
"8.1 Data types\" of "ARM64_ABI_MANUAL"."
+-config=3DSTD.bytebits,behavior=3D{c99, GCC_ARM64, "8"}
+-config=3DSTD.charsobj,behavior=3D{c99, GCC_ARM64, "utf8"}
+-config=3DSTD.charsval,behavior=3D{c99, GCC_ARM64, "utf8"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.4 Characters\" of "GCC_MANUAL" and Section \=
"3.1.2 Data Representation\" of "X86_64_ABI_MANUAL"."
+-config=3DSTD.bytebits,behavior=3D{c99, GCC_X86_64, "8"}
+-config=3DSTD.charsobj,behavior=3D{c99, GCC_X86_64, "utf8"}
+-config=3DSTD.charsval,behavior=3D{c99, GCC_X86_64, "utf8"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.4 Characters\" of "GCC_MANUAL" and the docum=
entation for -finput-charset=3Dcharset in the same manual."
+-config=3DSTD.charsmap,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.charsmap,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.4 Characters\" of "GCC_MANUAL" and the docum=
entation for -fexec-charset=3Dcharset and -finput-charset=3Dcharset in the =
same manual."
+-config=3DSTD.charsmem,behavior=3D{c99, GCC_ARM64, "utf8"}
+-config=3DSTD.charsmem,behavior=3D{c99, GCC_X86_64, "utf8"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.1 Translation\" of "GCC_MANUAL"."
+-config=3DSTD.diagidnt,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.diagidnt,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.4 Characters\" of "GCC_MANUAL" and the docum=
entation for -fexec-charset=3Dcharset in the same manual."
+-config=3DSTD.execvals,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.execvals,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"Given that Xen is compiled in hosted mode, ECLAIR cannot exc=
lude the independency from program termination implementation-defined behav=
ior.  See \"Section 25.7 Program Termination\" of "ARM64_LIBC_MANUAL"."
+-config=3DSTD.exitstat,behavior=3D{c99, GCC_ARM64, "specified"}
+-doc_end
+
+-doc_begin=3D"Given that Xen is compiled in hosted mode, ECLAIR cannot exc=
lude the independency from program termination implementation-defined behav=
ior.  See \"Section 25.7 Program Termination\" of "X86_64_LIBC_MANUAL"."
+-config=3DSTD.exitstat,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Chapter \"2 Header Files\" of "CPP_MANUAL"."
+-config=3DSTD.inclangl,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.inclangl,behavior=3D{c99, GCC_X86_64, "specified"}
+-config=3DSTD.inclfile,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.inclfile,behavior=3D{c99, GCC_X86_64, "specified"}
+-config=3DSTD.inclhead,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.inclhead,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.5 Integers\" of "GCC_MANUAL"."
+-config=3DSTD.signdint,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.signdint,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.15 Architecture\" of "GCC_MANUAL" and Chapte=
r \"5   Data types and alignment\" of "ARM64_ABI_MANUAL"."
+-config=3DSTD.objbytes,behavior=3D{c99, GCC_ARM64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.15 Architecture\" of "GCC_MANUAL" and Sectio=
n \"3.1.2 Data Representation\" of "X86_64_ABI_MANUAL"."
+-config=3DSTD.objbytes,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"3.4 Stringizing\" of "CPP_MANUAL"."
+-config=3DSTD.stringfy,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.stringfy,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.9 Structures, Unions, Enumerations, and Bit-=
Fields\"
+ of "GCC_MANUAL" and Section \"8.1.8 Bit-fields\" of "ARM64_ABI_MANUAL"."
+-config=3DSTD.bitfldby,+behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.bitfldor,+behavior=3D{c99, GCC_ARM64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.9 Structures, Unions, Enumerations, and Bit-=
Fields\"
+ of "GCC_MANUAL" and Section \"3.1.2 Data Representation\" of "X86_64_ABI_=
MANUAL"."
+-config=3DSTD.bitfldby,+behavior=3D{c99, GCC_X86_64, "specified"}
+-config=3DSTD.bitfldor,+behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.10 Qualifiers\" of "GCC_MANUAL"."
+-config=3DSTD.volatltp,+behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.volatltp,+behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.15 Architecture\" of "GCC_MANUAL" and Chapte=
r \"5   Data types and alignment\" of "ARM64_ABI_MANUAL"."
+-config=3DSTD.stdmacro,behavior=3D{c99, GCC_ARM64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.15 Architecture\" of "GCC_MANUAL" and Sectio=
n \"3.1.2 Data Representation\" of "X86_64_ABI_MANUAL"."
+-config=3DSTD.stdmacro,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.4 Characters\" of "GCC_MANUAL" and Section \=
"11.1 Implementation-defined behavior\" of "CPP_MANUAL"."
+-config=3DSTD.widestng,behavior=3D{c99, GCC_ARM64, "specified"}
+-config=3DSTD.widestng,behavior=3D{c99, GCC_X86_64, "specified"}
+-config=3DSTD.multbtsl,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.13 Preprocessing Directives\" of "GCC_MANUAL=
" and Section \"7 Pragmas\" of "CPP_MANUAL"."
+-config=3DSTD.pragmdir,behavior=3D{c99, GCC_ARM64, "^(pack\\(|GCC visibili=
ty (push|pop)).*$"}
+-config=3DSTD.pragmdir,behavior=3D{c99, GCC_X86_64, "^(pack\\(|GCC visibil=
ity (push|pop)).*$"}
+-doc_end
+
+-doc_begin=3D"See Section \"6.9 128-bit Integers\" of "GCC_MANUAL"."
+-config=3DSTD.extinttp,behavior=3D{c99, GCC_X86_64, "__uint128_t"}
+-doc_end
+
+-doc_begin=3D"See Section \"4.13 Preprocessing Directives\" of "GCC_MANUAL=
" and Section \"11.1 Implementation-defined behavior\" of "CPP_MANUAL"."
+-config=3DSTD.inclexpd,behavior=3D{c99, GCC_X86_64, "specified"}
+-doc_end
diff --git a/automation/eclair_analysis/Makefile.prepare b/automation/eclai=
r_analysis/Makefile.prepare
new file mode 100644
index 0000000000..90f4a31172
--- /dev/null
+++ b/automation/eclair_analysis/Makefile.prepare
@@ -0,0 +1,6 @@
+include Makefile
+prepare:
+	$(Q)$(MAKE) $(build)=3Dtools
+	$(Q)$(MAKE) $(build)=3D. include/xen/compile.h
+	$(Q)$(MAKE) $(build)=3Dinclude all
+	$(Q)$(MAKE) $(build)=3Darch/$(SRCARCH) include
diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analys=
is/build.sh
new file mode 100755
index 0000000000..ec087dd822
--- /dev/null
+++ b/automation/eclair_analysis/build.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# Stop immediately if any executed command has exit status different from =
0.
+set -e
+
+script_name=3D"$(basename "$0")"
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+usage() {
+  fatal "Usage: ${script_name} <ARM64|X86_64>"
+}
+
+if [ $# -ne 1 ]; then
+  usage
+fi
+
+if [ "$1" =3D "X86_64" ]; then
+  export CROSS_COMPILE=3D
+  export XEN_TARGET_ARCH=3Dx86_64
+elif [ "$1" =3D "ARM64" ]; then
+  export CROSS_COMPILE=3Daarch64-linux-gnu-
+  export XEN_TARGET_ARCH=3Darm64
+else
+  fatal "Unknown configuration: $1"
+fi
+
+if [[ -f /proc/cpuinfo ]]; then
+  PROCESSORS=3D$(grep -c ^processor /proc/cpuinfo)
+else
+  PROCESSORS=3D6
+fi
+
+(
+  cd xen
+
+  make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
+       "CROSS_COMPILE=3D${CROSS_COMPILE}"         \
+       "CC=3D${CROSS_COMPILE}gcc-12"              \
+       "CXX=3D${CROSS_COMPILE}g++-12"             \
+       "XEN_TARGET_ARCH=3D${XEN_TARGET_ARCH}"
+)
diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_anal=
ysis/prepare.sh
new file mode 100755
index 0000000000..275a1a3f51
--- /dev/null
+++ b/automation/eclair_analysis/prepare.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+# Stop immediately if any executed command has exit status different from =
0.
+set -e
+
+script_name=3D"$(basename "$0")"
+script_dir=3D"$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+usage() {
+  fatal "Usage: ${script_name}"
+}
+
+if [ $# -ne 1 ]; then
+  usage
+  exit 1
+fi
+
+export XEN_TARGET_ARCH
+
+if [ "$1" =3D "X86_64" ]; then
+  CONFIG_FILE=3D"${script_dir}/xen_x86_config"
+  XEN_TARGET_ARCH=3Dx86_64
+elif [ "$1" =3D "ARM64" ]; then
+  CONFIG_FILE=3D"${script_dir}/xen_arm_config"
+  XEN_TARGET_ARCH=3Darm64
+else
+  fatal "Unknown configuration: $1"
+fi
+
+(
+    cd xen
+    cp "${CONFIG_FILE}" .config
+    make clean
+    make -f ${script_dir}/Makefile.prepare prepare
+)
diff --git a/automation/eclair_analysis/xen_arm_config b/automation/eclair_=
analysis/xen_arm_config
new file mode 100644
index 0000000000..82102b889e
--- /dev/null
+++ b/automation/eclair_analysis/xen_arm_config
@@ -0,0 +1,147 @@
+# File provided in=0D
+# Re: Xen MISRA C: Source files in scope and out of scope=0D
+# from:	Stefano Stabellini <stefano.stabellini@amd.com>=0D
+# date:	6 giu 2023, 02:53=0D
+=0D
+#=0D
+# Automatically generated file; DO NOT EDIT.=0D
+# Xen/arm 4.18-unstable Configuration=0D
+#=0D
+CONFIG_CC_IS_GCC=3Dy=0D
+CONFIG_GCC_VERSION=3D90400=0D
+CONFIG_CLANG_VERSION=3D0=0D
+CONFIG_LD_IS_GNU=3Dy=0D
+CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=3Dy=0D
+CONFIG_ARM_64=3Dy=0D
+CONFIG_ARM=3Dy=0D
+CONFIG_ARCH_DEFCONFIG=3D"arch/arm/configs/arm64_defconfig"=0D
+=0D
+# UBSAN=0D
+CONFIG_UBSAN=3Dn=0D
+=0D
+#=0D
+# Architecture Features=0D
+#=0D
+CONFIG_ARM64_SVE=3Dn=0D
+CONFIG_64BIT=3Dy=0D
+CONFIG_NR_CPUS=3D4=0D
+# CONFIG_ACPI is not set=0D
+CONFIG_ARM_EFI=3Dy=0D
+CONFIG_GICV3=3Dy=0D
+CONFIG_HAS_ITS=3Dy=0D
+CONFIG_HVM=3Dy=0D
+# CONFIG_NEW_VGIC is not set=0D
+CONFIG_SBSA_VUART_CONSOLE=3Dy=0D
+CONFIG_ARM_SSBD=3Dy=0D
+CONFIG_HARDEN_BRANCH_PREDICTOR=3Dy=0D
+# CONFIG_TEE is not set=0D
+# CONFIG_STATIC_SHM is not set=0D
+# end of Architecture Features=0D
+=0D
+#=0D
+# ARM errata workaround via the alternative framework=0D
+#=0D
+CONFIG_ARM64_ERRATUM_827319=3Dy=0D
+CONFIG_ARM64_ERRATUM_824069=3Dy=0D
+CONFIG_ARM64_ERRATUM_819472=3Dy=0D
+CONFIG_ARM64_ERRATUM_843419=3Dy=0D
+CONFIG_ARM64_ERRATUM_832075=3Dy=0D
+CONFIG_ARM64_ERRATUM_834220=3Dy=0D
+CONFIG_ARM_ERRATUM_858921=3Dy=0D
+CONFIG_ARM64_WORKAROUND_REPEAT_TLBI=3Dy=0D
+CONFIG_ARM64_ERRATUM_1286807=3Dy=0D
+# end of ARM errata workaround via the alternative framework=0D
+=0D
+CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=3Dy=0D
+# CONFIG_ALL_PLAT is not set=0D
+# CONFIG_QEMU is not set=0D
+# CONFIG_RCAR3 is not set=0D
+CONFIG_MPSOC=3Dy=0D
+# CONFIG_NO_PLAT is not set=0D
+CONFIG_MPSOC_PLATFORM=3Dy=0D
+=0D
+#=0D
+# Common Features=0D
+#=0D
+CONFIG_GRANT_TABLE=3Dy=0D
+CONFIG_HAS_ALTERNATIVE=3Dy=0D
+CONFIG_HAS_DEVICE_TREE=3Dy=0D
+CONFIG_HAS_FAST_MULTIPLY=3Dy=0D
+CONFIG_HAS_PDX=3Dy=0D
+CONFIG_HAS_PMAP=3Dy=0D
+# CONFIG_MEM_ACCESS is not set=0D
+CONFIG_STATIC_MEMORY=3Dy=0D
+=0D
+#=0D
+# Speculative hardening=0D
+#=0D
+CONFIG_SPECULATIVE_HARDEN_ARRAY=3Dy=0D
+# end of Speculative hardening=0D
+=0D
+# CONFIG_HYPFS is not set=0D
+CONFIG_IOREQ_SERVER=3Dy=0D
+# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set=0D
+# CONFIG_XSM is not set=0D
+# CONFIG_ARGO is not set=0D
+=0D
+#=0D
+# Schedulers=0D
+#=0D
+# CONFIG_SCHED_CREDIT is not set=0D
+CONFIG_SCHED_CREDIT2=3Dy=0D
+# CONFIG_SCHED_RTDS is not set=0D
+# CONFIG_SCHED_ARINC653 is not set=0D
+CONFIG_SCHED_NULL=3Dy=0D
+CONFIG_SCHED_CREDIT2_DEFAULT=3Dy=0D
+# CONFIG_SCHED_NULL_DEFAULT is not set=0D
+CONFIG_SCHED_DEFAULT=3D"credit2"=0D
+# end of Schedulers=0D
+=0D
+CONFIG_BOOT_TIME_CPUPOOLS=3Dy=0D
+# CONFIG_LIVEPATCH is not set=0D
+# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set=0D
+CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=3Dy=0D
+CONFIG_CMDLINE=3D""=0D
+CONFIG_DOM0_MEM=3D""=0D
+CONFIG_DTB_FILE=3D""=0D
+# CONFIG_TRACEBUFFER is not set=0D
+# end of Common Features=0D
+=0D
+#=0D
+# Device Drivers=0D
+#=0D
+# CONFIG_HAS_NS16550 is not set=0D
+CONFIG_HAS_CADENCE_UART=3Dy=0D
+# CONFIG_HAS_IMX_LPUART is not set=0D
+# CONFIG_HAS_MVEBU is not set=0D
+# CONFIG_HAS_MESON is not set=0D
+CONFIG_HAS_PL011=3Dy=0D
+# CONFIG_HAS_SCIF is not set=0D
+CONFIG_SERIAL_TX_BUFSIZE=3D16384=0D
+CONFIG_HAS_PASSTHROUGH=3Dy=0D
+CONFIG_ARM_SMMU=3Dy=0D
+CONFIG_ARM_SMMU_V3=3Dy=0D
+# CONFIG_IPMMU_VMSA is not set=0D
+CONFIG_IOMMU_FORCE_PT_SHARE=3Dy=0D
+# end of Device Drivers=0D
+=0D
+CONFIG_EXPERT=3Dy=0D
+CONFIG_UNSUPPORTED=3Dy=0D
+=0D
+#=0D
+# Debugging Options=0D
+#=0D
+CONFIG_DEBUG=3Dy=0D
+CONFIG_FRAME_POINTER=3Dy=0D
+CONFIG_COVERAGE=3Dy=0D
+CONFIG_DEBUG_LOCK_PROFILE=3Dy=0D
+CONFIG_DEBUG_LOCKS=3Dy=0D
+CONFIG_PERF_COUNTERS=3Dy=0D
+CONFIG_PERF_ARRAYS=3Dy=0D
+CONFIG_VERBOSE_DEBUG=3Dy=0D
+CONFIG_DEVICE_TREE_DEBUG=3Dy=0D
+CONFIG_SCRUB_DEBUG=3Dy=0D
+CONFIG_DEBUG_TRACE=3Dy=0D
+CONFIG_XMEM_POOL_POISON=3Dy=0D
+CONFIG_DEBUG_INFO=3Dy=0D
+# end of Debugging Options=0D
diff --git a/automation/eclair_analysis/xen_x86_config b/automation/eclair_=
analysis/xen_x86_config
new file mode 100644
index 0000000000..9b2709bfc8
--- /dev/null
+++ b/automation/eclair_analysis/xen_x86_config
@@ -0,0 +1,152 @@
+# File provided in=0D
+# Re: Xen MISRA C: Source files in scope and out of scope=0D
+# from:	Stefano Stabellini <stefano.stabellini@amd.com> =0D
+# date:	6 giu 2023, 02:53=0D
+=0D
+#=0D
+# Automatically generated file; DO NOT EDIT.=0D
+# Xen/x86 4.18-unstable Configuration=0D
+#=0D
+CONFIG_CC_IS_GCC=3Dy=0D
+CONFIG_GCC_VERSION=3D90400=0D
+CONFIG_CLANG_VERSION=3D0=0D
+CONFIG_LD_IS_GNU=3Dy=0D
+CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=3Dy=0D
+CONFIG_X86_64=3Dy=0D
+CONFIG_X86=3Dy=0D
+CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"=0D
+CONFIG_CC_HAS_INDIRECT_THUNK=3Dy=0D
+CONFIG_HAS_AS_CET_SS=3Dy=0D
+CONFIG_HAS_CC_CET_IBT=3Dy=0D
+=0D
+CONFIG_REQUIRE_NX=3Dn=0D
+=0D
+#=0D
+# Architecture Features=0D
+#=0D
+CONFIG_64BIT=3Dy=0D
+CONFIG_NR_CPUS=3D16=0D
+CONFIG_NR_NUMA_NODES=3D2=0D
+# CONFIG_PV is not set=0D
+CONFIG_HVM=3Dy=0D
+# CONFIG_XEN_SHSTK is not set=0D
+# CONFIG_XEN_IBT is not set=0D
+# CONFIG_SHADOW_PAGING is not set=0D
+# CONFIG_BIGMEM is not set=0D
+# CONFIG_HVM_FEP is not set=0D
+# CONFIG_TBOOT is not set=0D
+CONFIG_XEN_ALIGN_DEFAULT=3Dy=0D
+# CONFIG_XEN_ALIGN_2M is not set=0D
+CONFIG_X2APIC_PHYSICAL=3Dy=0D
+# CONFIG_XEN_GUEST is not set=0D
+# CONFIG_HYPERV_GUEST is not set=0D
+# CONFIG_MEM_PAGING is not set=0D
+# CONFIG_MEM_SHARING is not set=0D
+# end of Architecture Features=0D
+=0D
+#=0D
+# Common Features=0D
+#=0D
+CONFIG_COMPAT=3Dy=0D
+CONFIG_CORE_PARKING=3Dy=0D
+CONFIG_GRANT_TABLE=3Dy=0D
+CONFIG_ALTERNATIVE_CALL=3Dy=0D
+CONFIG_ARCH_MAP_DOMAIN_PAGE=3Dy=0D
+CONFIG_GENERIC_BUG_FRAME=3Dy=0D
+CONFIG_HAS_ALTERNATIVE=3Dy=0D
+CONFIG_HAS_COMPAT=3Dy=0D
+CONFIG_HAS_EX_TABLE=3Dy=0D
+CONFIG_HAS_FAST_MULTIPLY=3Dy=0D
+CONFIG_HAS_IOPORTS=3Dy=0D
+CONFIG_HAS_KEXEC=3Dy=0D
+CONFIG_HAS_PDX=3Dy=0D
+CONFIG_HAS_SCHED_GRANULARITY=3Dy=0D
+CONFIG_HAS_UBSAN=3Dy=0D
+CONFIG_MEM_ACCESS_ALWAYS_ON=3Dy=0D
+CONFIG_MEM_ACCESS=3Dy=0D
+CONFIG_NEEDS_LIBELF=3Dy=0D
+CONFIG_NUMA=3Dy=0D
+=0D
+#=0D
+# Speculative hardening=0D
+#=0D
+CONFIG_INDIRECT_THUNK=3Dy=0D
+CONFIG_SPECULATIVE_HARDEN_ARRAY=3Dy=0D
+CONFIG_SPECULATIVE_HARDEN_BRANCH=3Dy=0D
+# end of Speculative hardening=0D
+=0D
+# CONFIG_HYPFS is not set=0D
+CONFIG_IOREQ_SERVER=3Dy=0D
+# CONFIG_KEXEC is not set=0D
+# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set=0D
+# CONFIG_XENOPROF is not set=0D
+# CONFIG_XSM is not set=0D
+# CONFIG_ARGO is not set=0D
+=0D
+#=0D
+# Schedulers=0D
+#=0D
+# CONFIG_SCHED_CREDIT is not set=0D
+CONFIG_SCHED_CREDIT2=3Dy=0D
+# CONFIG_SCHED_RTDS is not set=0D
+# CONFIG_SCHED_ARINC653 is not set=0D
+CONFIG_SCHED_NULL=3Dy=0D
+CONFIG_SCHED_CREDIT2_DEFAULT=3Dy=0D
+# CONFIG_SCHED_NULL_DEFAULT is not set=0D
+CONFIG_SCHED_DEFAULT=3D"credit2"=0D
+# end of Schedulers=0D
+=0D
+# CONFIG_LIVEPATCH is not set=0D
+# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set=0D
+# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set=0D
+CONFIG_CMDLINE=3D""=0D
+CONFIG_DOM0_MEM=3D""=0D
+# CONFIG_TRACEBUFFER is not set=0D
+# end of Common Features=0D
+=0D
+#=0D
+# Device Drivers=0D
+#=0D
+CONFIG_ACPI=3Dy=0D
+CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy=0D
+CONFIG_ACPI_NUMA=3Dy=0D
+CONFIG_HAS_NS16550=3Dy=0D
+CONFIG_HAS_EHCI=3Dy=0D
+CONFIG_SERIAL_TX_BUFSIZE=3D16384=0D
+# CONFIG_XHCI is not set=0D
+CONFIG_HAS_CPUFREQ=3Dy=0D
+CONFIG_HAS_PASSTHROUGH=3Dy=0D
+CONFIG_AMD_IOMMU=3Dy=0D
+# CONFIG_INTEL_IOMMU is not set=0D
+# CONFIG_IOMMU_QUARANTINE_NONE is not set=0D
+CONFIG_IOMMU_QUARANTINE_BASIC=3Dy=0D
+# CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE is not set=0D
+CONFIG_HAS_PCI=3Dy=0D
+CONFIG_HAS_PCI_MSI=3Dy=0D
+CONFIG_VIDEO=3Dy=0D
+CONFIG_VGA=3Dy=0D
+CONFIG_HAS_VPCI=3Dy=0D
+# end of Device Drivers=0D
+=0D
+CONFIG_EXPERT=3Dy=0D
+CONFIG_UNSUPPORTED=3Dy=0D
+CONFIG_ARCH_SUPPORTS_INT128=3Dy=0D
+=0D
+#=0D
+# Debugging Options=0D
+#=0D
+CONFIG_DEBUG=3Dy=0D
+# CONFIG_CRASH_DEBUG is not set=0D
+CONFIG_GDBSX=3Dy=0D
+CONFIG_FRAME_POINTER=3Dy=0D
+# CONFIG_COVERAGE is not set=0D
+# CONFIG_DEBUG_LOCK_PROFILE is not set=0D
+CONFIG_DEBUG_LOCKS=3Dy=0D
+# CONFIG_PERF_COUNTERS is not set=0D
+CONFIG_VERBOSE_DEBUG=3Dy=0D
+CONFIG_SCRUB_DEBUG=3Dy=0D
+# CONFIG_UBSAN is not set=0D
+# CONFIG_DEBUG_TRACE is not set=0D
+CONFIG_XMEM_POOL_POISON=3Dy=0D
+CONFIG_DEBUG_INFO=3Dy=0D
+# end of Debugging Options=0D
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analy=
ze.yaml
new file mode 100644
index 0000000000..9ce2a287fb
--- /dev/null
+++ b/automation/gitlab-ci/analyze.yaml
@@ -0,0 +1,37 @@
+.eclair-analysis:
+  stage: analyze
+  tags:
+    - eclair-analysis
+  variables:
+    ECLAIR_OUTPUT_DIR: "ECLAIR_out"
+    ANALYSIS_KIND: "normal"
+    ENABLE_ECLAIR_BOT: "n"
+    AUTO_PR_BRANCH: "staging"
+    AUTO_PR_REPOSITORY: "xen-project/xen"
+  artifacts:
+    when: always
+    paths:
+      - "${ECLAIR_OUTPUT_DIR}"
+      - '*.log'
+    reports:
+      codequality: gl-code-quality-report.json
+
+eclair-x86_64:
+  extends: .eclair-analysis
+  variables:
+    LOGFILE: "eclair-x86_64.log"
+    VARIANT: "X86_64"
+    RULESET: "Set1"
+  script:
+    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
+  allow_failure: true
+
+eclair-ARM64:
+  extends: .eclair-analysis
+  variables:
+    LOGFILE: "eclair-ARM64.log"
+    VARIANT: "ARM64"
+    RULESET: "Set1"
+  script:
+    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
+  allow_failure: true
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.y=
aml
index c401f62d61..f01e2c32bb 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -11,6 +11,7 @@
       - '*.log'
       - '*/*.log'
     when: always
+  needs: []
   except:
     - master
     - smoke
diff --git a/automation/scripts/eclair b/automation/scripts/eclair
new file mode 100755
index 0000000000..c4a3bb57d7
--- /dev/null
+++ b/automation/scripts/eclair
@@ -0,0 +1,32 @@
+#!/bin/sh -eu
+
+ECLAIR_ANALYSIS_DIR=3Dautomation/eclair_analysis
+ECLAIR_DIR=3D"${ECLAIR_ANALYSIS_DIR}/ECLAIR"
+ECLAIR_OUTPUT_DIR=3D$(realpath "${ECLAIR_OUTPUT_DIR}")
+
+"${ECLAIR_ANALYSIS_DIR}/prepare.sh" "${VARIANT}"
+
+ex=3D0
+"${ECLAIR_DIR}/analyze.sh" "${VARIANT}" "${RULESET}" || ex=3D$?
+"${ECLAIR_DIR}/action_log.sh" ANALYSIS_LOG \
+                             "ECLAIR analysis log" \
+                             "${ECLAIR_OUTPUT_DIR}/ANALYSIS.log" \
+                             "${ex}"
+"${ECLAIR_DIR}/action_log.sh" REPORT_LOG \
+                             "ECLAIR report log" \
+                             "${ECLAIR_OUTPUT_DIR}/REPORT.log" \
+                             "${ex}"
+[ "${ex}" =3D 0 ] || exit "${ex}"
+"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
+
+# Fail in case of new reports
+"${ECLAIR_DIR}/action_clean_added.sh" "${ECLAIR_OUTPUT_DIR}" || ex=3D$?
+"${ECLAIR_DIR}/action_log.sh" DIFF_CHECK_LOG \
+                             "ECLAIR diff check" \
+                             "${ECLAIR_OUTPUT_DIR}/clean_added.log" \
+                             "${ex}"
+
+rm -rf "${ECLAIR_OUTPUT_DIR}/.data"
+rm -rf "${ECLAIR_OUTPUT_DIR}/PROJECT.ecd"
+
+[ "${ex}" =3D 0 ] || exit "${ex}"
--=20
2.34.1


