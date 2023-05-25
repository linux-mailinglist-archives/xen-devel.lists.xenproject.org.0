Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4DF710784
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539373.840172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26QI-00057r-Ky; Thu, 25 May 2023 08:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539373.840172; Thu, 25 May 2023 08:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26QI-00054V-F6; Thu, 25 May 2023 08:34:14 +0000
Received: by outflank-mailman (input) for mailman id 539373;
 Thu, 25 May 2023 08:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q26QG-00054I-SV
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:34:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ec00ff07-fad6-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 10:34:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C5AF1042;
 Thu, 25 May 2023 01:34:55 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4041B3F67D;
 Thu, 25 May 2023 01:34:09 -0700 (PDT)
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
X-Inumbo-ID: ec00ff07-fad6-11ed-b230-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/3] diff-report.py tool
Date: Thu, 25 May 2023 09:33:58 +0100
Message-Id: <20230525083401.3838462-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

--------------------------------------------------------------------------------
This serie is dependent on this patch, in case cppcheck report are generated
using xen-analysis.py that calls the makefile with in-tree build, because
this tool (in particular the patching feature) needs the path from the
repository instead of the path from /xen/xen:
https://patchwork.kernel.org/project/xen-devel/patch/20230519093019.2131896-4-luca.fancellu@arm.com/
--------------------------------------------------------------------------------

Now that we have a tool (xen-analysis.py) that wraps cppcheck to generates
reports, we have a generic overview of how many static analysis issues and non
compliances to MISRA C we have for a certain revision of the codebase.

This is great and eventually the work to be done should be just having less and
less findings in the report until we reach zero.

This is just an ideal trend, because in practice we might have issues that
comes from existing code (macro for example) that are not going to be fixed
soon for any reason, but we would like to check and see how many issues are
introduced by the commits added (ideally zero, but if any is added and the fault
resides outside the changed code, maintainers might decide to include it
anyway).

So the idea is to check the difference between the reports of the codebase: one
called "baseline" which is basically the current codebase, the other one called
"new report" that is the codebase after the changes.
To check if any new finding is added, we need to have a look on every finding in
the "new report" that is not listed in the "baseline".

It seems very simple, but what can happen to existing findings in the code after
a commit is applied?
Basically existing findings can be shifted in position due to changes to
unrelated lines, or they can be also deleted or fixed for changes involving the
findings line (Michal was the first one to point that out).

So comparing the two report now seems quite difficult, because if we compare
them we will have all the new findings plus all the findings that changed
position due to the changes applied.

To overcome this, the diff-tool.py is created and it allows to "patch" the
"baseline" report, looking into the changes applied to the baseline codebase,
described by git diff.

This serie is organised in two patch, I've tried to split the amount of code and
to leave a meaning, so in the first patch you have everything you need to
import cppcheck reports and do a "raw" diff between reports, this gives you
an hint about new findings + old findings that has changed place.

The second patch is adding the "patching" system, having a class that parses
the git diff output and later "patching" the baseline before doing the
comparison. This last option is activated only when passing the git diff changes
to the tool, but everything is described (I hope) in the help.

Some consideration needs to be made, this tool can translate in coordinates
(file, line) the findings from the "baseline" to the "new report" using the git
diff output as, let me say, a translation matrix.
This doesn't mean it can understand the meaning of the findings and recognise
them in the new codebase, so for example, a finding related to a line that is
moved to another part of the file won't be recognised as "old finding" and will
be just removed from the "baseline patched report", however we will find it
in the new report unless it contains a fix for the reported issue.

This means that the tool is not really suited to be a gatekeeper for the merge
action, it is more suitable to help the maintainer to understand when a change
is introducing new issues without having to check and compare manually two
reports of (nowadays) hundreds of finding.
Eventually we could run it in the CI and make the CI reply to the patchwork
thread with its output!

The tool has also a debug argument that when applied, generates extra files
that can be checked against the original files, for example the reports are
imported in the tool, and afterwards the debug code will generate them back from
the imported data and they should be the same (if everything works).
Another debug check is to export the representation of the parsed git diff
output, so that the developer can check how and if the parser interpreted
correctly the data.

Future works for this tool might be to parse also Coverity reports and
eventually (don't know if it is possible) also eclair text report.

Luca Fancellu (3):
  xen/misra: add diff-report.py tool
  xen/misra: diff-report.py: add report patching feature
  maintainers: Add Xen MISRA Analysis Tools section

 MAINTAINERS                                   |  10 +
 xen/scripts/diff-report.py                    | 130 ++++++++++
 .../xen_analysis/diff_tool/__init__.py        |   0
 .../xen_analysis/diff_tool/cppcheck_report.py |  44 ++++
 xen/scripts/xen_analysis/diff_tool/debug.py   |  61 +++++
 xen/scripts/xen_analysis/diff_tool/report.py  | 187 ++++++++++++++
 .../diff_tool/unified_format_parser.py        | 232 ++++++++++++++++++
 7 files changed, 664 insertions(+)
 create mode 100755 xen/scripts/diff-report.py
 create mode 100644 xen/scripts/xen_analysis/diff_tool/__init__.py
 create mode 100644 xen/scripts/xen_analysis/diff_tool/cppcheck_report.py
 create mode 100644 xen/scripts/xen_analysis/diff_tool/debug.py
 create mode 100644 xen/scripts/xen_analysis/diff_tool/report.py
 create mode 100644 xen/scripts/xen_analysis/diff_tool/unified_format_parser.py

-- 
2.34.1


