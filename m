Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D996DFF2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 18:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791300.1201183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFVC-0000x9-HZ; Thu, 05 Sep 2024 16:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791300.1201183; Thu, 05 Sep 2024 16:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFVC-0000vI-El; Thu, 05 Sep 2024 16:38:34 +0000
Received: by outflank-mailman (input) for mailman id 791300;
 Thu, 05 Sep 2024 16:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbas=QD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1smFVA-0000v8-NV
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 16:38:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 484024ac-6ba5-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 18:38:29 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 970DA4EE07CF;
 Thu,  5 Sep 2024 18:38:27 +0200 (CEST)
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
X-Inumbo-ID: 484024ac-6ba5-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725554309; bh=/5WhGxobj+xMwraQpAWuieE0VxYdLkCjiymEqlknPGI=;
	h=From:To:Cc:Subject:Date:From;
	b=FJRyeXu0XlYsxbyhhJHt6bdJ89IIT5QdcvZb9voavO3yUO1p5t/F0xnVMjcvRomC9
	 tS5KlrgoxBDiSYz0ugEAJrDXQOz7HQ4RbeUyn6fVmcaNAQyBnZIhBuyc3fve9hMeNu
	 cPPnKHuOV/aATdhSPtJtvbELyRa/yzYOgDikGq8dtbq0qCuyvKc7gqUQ6kGN0JQPKH
	 RAiSedGlAz/4/8folTBAhuV8uOjiOkyetFA/pUQq8dgvLEowcaAhd7XJ5t+LBAwY1C
	 48tE60mjTROraxhBNbIqOazenbeGyUegLCrrv2V9FEqtw1qKaiDCab8AP8ovNae5hT
	 ARf9qhJXx+v/Q==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] automation/eclair_analysis: address violations of Rule 18.2
Date: Thu,  5 Sep 2024 18:37:57 +0200
Message-ID: <e36f121a91d229ca5edfc8102c4513c2e0530230.1725554126.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 18.2 states: "Subtraction between pointers shall
only be applied to pointers that address elements of the same array".

Subtractions between pointer where at least one symbol is a
symbol defined by the linker are safe and thus deviated, because
the compiler cannot exploit the undefined behaviour that would
arise from violating the rules in this case.

To create an ECLAIR configuration that contains the list of
linker-defined symbols, the script "linker-symbols.sh" is used
after a build of xen (without static analysis) is performed.
The generated file "linker_symbols.ecl" is then used as part of the
static analysis configuration.

Additional changes to the ECLAIR integration are:
- perform a build of xen without static analysis during prepare.sh
- run the scripts to generated ECL configuration during the prepare.sh,
  rather than analysis.sh
- export ECLAIR_PROJECT_ROOT earlier, to allow such generation

Additionally, the macro page_to_mfn performs a subtraction that is safe,
so its uses are deviated.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Macro page_to_pdx is also the cause of some caution reports:
perhaps that should be deviated as well, since its definition is very
similar to page_to_mfn.

Relevant CI runs:

- arm64: https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/ARM64/7754928624/PROJECT.ecd;/by_service/MC3R1.R18.2.html

- x86_64: https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/X86_64/7754928613/PROJECT.ecd;/by_service/MC3R1.R18.2.html
- x86_64 (without page_to_pdx reports): https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/X86_64/7754928613/PROJECT.ecd;/by_service/MC3R1.R18.2.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":false,"selector":{"enabled":true,"negated":false,"kind":0,"domain":"message","inputs":[{"enabled":true,"text":"^.*expanded from macro `page_to_pdx'"}]}}}
---
 automation/eclair_analysis/ECLAIR/analyze.sh  |  6 ----
 .../eclair_analysis/ECLAIR/deviations.ecl     | 11 +++++++
 .../eclair_analysis/ECLAIR/generate_ecl.sh    |  3 ++
 .../ECLAIR/generate_linker_symbols.sh         | 31 +++++++++++++++++++
 automation/eclair_analysis/prepare.sh         |  6 +++-
 automation/scripts/eclair                     |  3 ++
 docs/misra/deviations.rst                     | 10 ++++++
 7 files changed, 63 insertions(+), 7 deletions(-)
 create mode 100755 automation/eclair_analysis/ECLAIR/generate_linker_symbols.sh

diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/eclair_analysis/ECLAIR/analyze.sh
index e96456c3c18d..1dc63c1bc2d0 100755
--- a/automation/eclair_analysis/ECLAIR/analyze.sh
+++ b/automation/eclair_analysis/ECLAIR/analyze.sh
@@ -73,17 +73,11 @@ export ECLAIR_WORKSPACE="${ECLAIR_DATA_DIR}/eclair_workspace"

 # Identifies the particular build of the project.
 export ECLAIR_PROJECT_NAME="XEN_${VARIANT}-${SET}"
-# All paths mentioned in ECLAIR reports that are below this directory
-# will be presented as relative to ECLAIR_PROJECT_ROOT.
-export ECLAIR_PROJECT_ROOT="${PWD}"

 # Erase and recreate the output directory and the data directory.
 rm -rf "${ECLAIR_OUTPUT_DIR:?}/*"
 mkdir -p "${ECLAIR_DATA_DIR}"

-# Generate additional configuration files
-"${SCRIPT_DIR}/generate_ecl.sh"
-
 # Perform the build (from scratch) in an ECLAIR environment.
 "${ECLAIR_BIN_DIR}eclair_env" \
     "-config_file='${SCRIPT_DIR}/analysis.ecl'" \
diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9051f4160282..a56805a993cd 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -533,6 +533,17 @@ safe."
 # Series 18.
 #

+-doc_begin="Subtractions between pointers involving at least one of the linker symbols specified by the regex below
+are guaranteed not to be exploited by a compiler that relies on the absence of
+C99 Undefined Behaviour 45: Pointers that do not point into, or just beyond, the same array object are subtracted (6.5.6)."
+-eval_file=linker_symbols.ecl
+-config=MC3R1.R18.2,reports+={safe, "any_area(stmt(operator(sub)&&child(lhs||rhs, skip(__non_syntactic_paren_stmts, ref(linker_symbols)))))"}
+-doc_end
+
+-doc_begin="The following macro performs a subtraction between pointers to obtain the mfn, but does not lead to undefined behaviour."
+-config=MC3R1.R18.2,reports+={safe, "any_area(any_loc(any_exp(macro(^page_to_mfn$))))"}
+-doc_end
+
 -doc_begin="Flexible array members are deliberately used and XEN developers are aware of the dangers related to them:
 unexpected result when the structure is given as argument to a sizeof() operator and the truncation in assignment between structures."
 -config=MC3R1.R18.7,reports+={deliberate, "any()"}
diff --git a/automation/eclair_analysis/ECLAIR/generate_ecl.sh b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
index 66766b23abb7..f421a4a16a6c 100755
--- a/automation/eclair_analysis/ECLAIR/generate_ecl.sh
+++ b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
@@ -17,3 +17,6 @@ accepted_rst="${ECLAIR_PROJECT_ROOT}/docs/misra/rules.rst"

 # Generate accepted guidelines
 "${script_dir}/accepted_guidelines.sh" "${accepted_rst}"
+
+# Generate the list of linker-defined symbols (must be run after a Xen build)
+"${script_dir}/generate_linker_symbols.sh"
diff --git a/automation/eclair_analysis/ECLAIR/generate_linker_symbols.sh b/automation/eclair_analysis/ECLAIR/generate_linker_symbols.sh
new file mode 100755
index 000000000000..19943ba98d46
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/generate_linker_symbols.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+
+set -e
+
+script_name="$(basename "$0")"
+script_dir="$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+arch=""
+if [ "${XEN_TARGET_ARCH}" == "x86_64" ]; then
+  arch=x86
+elif [ "${XEN_TARGET_ARCH}" == "arm64" ]; then
+  arch=arm
+else
+  fatal "Unknown configuration: $1"
+fi
+
+outfile=${script_dir}/linker_symbols.ecl
+
+(
+  echo -n "-decl_selector+={linker_symbols, \"^(" >"${outfile}"
+  "${script_dir}/../linker-symbols.sh" "${arch}" | sort -u | tr '\n' '|' | sed '$ s/|//' >>"${outfile}"
+  echo -n ")$\"}" >>"${outfile}"
+)
diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index 47b2a2f32a84..3a646414a392 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -39,10 +39,14 @@ fi
     cp "${CONFIG_FILE}" xen/.config
     make clean
     find . -type f -name "*.safparse" -print -delete
+    "${script_dir}/build.sh" "$1"
+    # Generate additional configuration files
+    "${script_dir}/ECLAIR/generate_ecl.sh"
+    make clean
     cd xen
     make -f "${script_dir}/Makefile.prepare" prepare
     # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
     scripts/xen-analysis.py --run-eclair --no-build --no-clean
     # Translate function-properties.json into ECLAIR properties
-    python3 ${script_dir}/propertyparser.py
+    python3 "${script_dir}/propertyparser.py"
 )
diff --git a/automation/scripts/eclair b/automation/scripts/eclair
index 3ec760bab8b3..0a2353c20a92 100755
--- a/automation/scripts/eclair
+++ b/automation/scripts/eclair
@@ -3,6 +3,9 @@
 ECLAIR_ANALYSIS_DIR=automation/eclair_analysis
 ECLAIR_DIR="${ECLAIR_ANALYSIS_DIR}/ECLAIR"
 ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
+# All paths mentioned in ECLAIR reports that are below this directory
+# will be presented as relative to ECLAIR_PROJECT_ROOT.
+export ECLAIR_PROJECT_ROOT="${PWD}"

 "${ECLAIR_ANALYSIS_DIR}/prepare.sh" "${VARIANT}"

diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b66c271c4e7c..39cd1de1e5b2 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -501,6 +501,16 @@ Deviations related to MISRA C:2012 Rules:
          - __builtin_memset()
          - cpumask_check()

+   * - R18.2
+     - Subtractions between pointers where at least one of the operand is a
+       pointer to a symbol defined by the linker are safe.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R18.2
+     - Subtraction between pointers encapsulated by macro page_to_mfn
+       are safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R20.4
      - The override of the keyword \"inline\" in xen/compiler.h is present so
        that section contents checks pass when the compiler chooses not to
--
2.43.0

