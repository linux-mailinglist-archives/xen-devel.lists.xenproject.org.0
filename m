Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1197763C4A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 18:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570592.892514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOhGE-0004ww-8p; Wed, 26 Jul 2023 16:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570592.892514; Wed, 26 Jul 2023 16:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOhGE-0004uR-61; Wed, 26 Jul 2023 16:21:14 +0000
Received: by outflank-mailman (input) for mailman id 570592;
 Wed, 26 Jul 2023 16:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0A2=DM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOhGC-0004uL-IA
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 16:21:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ec485e9-2bd0-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 18:21:10 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.26.92])
 by support.bugseng.com (Postfix) with ESMTPSA id 790DC4EE0738;
 Wed, 26 Jul 2023 18:21:09 +0200 (CEST)
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
X-Inumbo-ID: 6ec485e9-2bd0-11ee-b242-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 0/4] automation: Add ECLAIR pipelines
Date: Wed, 26 Jul 2023 18:20:46 +0200
Message-Id: <cover.1690387393.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds two pipelines that analyze an ARM64 and a X86_64
build with the ECLAIR static analyzer on the guidelines contained in Set1.
The builds analyzed are the ones triggered by automation/eclair_analysis/build.sh.

automation/eclair_analysis/ECLAIR contains the ECLAIR configuration files
(.ecl files) and scripts that implement the integration (action* scripts).

All commits on the xen-project/xen:staging branch will be analyzed
and their artifacts will be stored indefinitely; the integration will
report differential information with respect to the previous analysis.

All commits on other branches or repositories will be analyzed and
only the last ten artifacts will be kept; the integration will report
differential information with respect to the analysis done on the common
ancestor with xen-project/xen:staging (if available).

Additionaly any repository should be able to read a masked variable
named WTOKEN with the token provided by BUGSENG, otherwise the pipeline
will fail.

The analysis fails if it contains violations of guidelines tagged as
clean:added. The list of clean guidelines are maintained in
automation/eclair_analysis/ECLAIR/tagging.ecl.

--
Changes in v4:
- move link to the analysis results at the end of the console log
- avoid git warning
- avoid undesired git logs
- remove undesired blanks in MAINTAINERS

Simone Ballarin (4):
  automation: Add ECLAIR utilities and settings
  automation: Add xen builds for the ECLAIR analyses
  automation: Add ECLAIR pipelines
  maintainers: Add ECLAIR reviewer

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
 automation/gitlab-ci/analyze.yaml             |  38 +++
 automation/gitlab-ci/build.yaml               |   1 +
 automation/scripts/eclair                     |  34 ++
 30 files changed, 2269 insertions(+)
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
 create mode 100755 automation/eclair_analysis/ECLAIR/print_analyzed_files.sh
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

-- 
2.34.1


