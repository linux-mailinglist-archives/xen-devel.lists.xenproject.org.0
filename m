Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3745611D86A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 22:18:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifVou-0006hb-Bg; Thu, 12 Dec 2019 21:16:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6iYZ=2C=xenproject.org=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ifVot-0006gv-B5
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 21:16:23 +0000
X-Inumbo-ID: 755319a0-1d24-11ea-8e25-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 755319a0-1d24-11ea-8e25-12813bfff9fa;
 Thu, 12 Dec 2019 21:15:01 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1ifVnV-00015l-OJ; Thu, 12 Dec 2019 21:14:57 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1ifVnV-0000Bm-E1; Thu, 12 Dec 2019 21:14:57 +0000
From: Lars Kurth <lars.kurth@xenproject.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Dec 2019 21:14:32 +0000
Message-Id: <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <cover.1576184325.git.lars.kurth@citrix.com>
References: <cover.1576184325.git.lars.kurth@citrix.com>
MIME-Version: 1.0
In-Reply-To: <cover.1576184325.git.lars.kurth@citrix.com>
References: <cover.1576184325.git.lars.kurth@citrix.com>
Subject: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============6540980277825011620=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6540980277825011620==
Content-Type: text/plain; charset=Y
Content-Transfer-Encoding: 8bit

From: Lars Kurth <lars.kurth@citrix.com>

This document highlights what reviewers such as maintainers and committers look
for when reviewing code. It sets expectations for code authors and provides
a framework for code reviewers.

Changes since v2 (introduced in v2)
* Extend introduction
* Add "Code Review Workflow" covering
  - "Workflow from a Reviewer's Perspective"
  - "Workflow from an Author's Perspective"
  - "Problematic Patch Reviews"
* Wrap to 80 characters
* Replace inline links with reference links to make
  wrapping easier

TODO: find suitable examples on how to structure/describe good patch series

Signed-off-by: Lars Kurth <lars.kurth@citrix.com>
---
Cc: minios-devel@lists.xenproject.org
Cc: xen-api@lists.xenproject.org
Cc: win-pv-devel@lists.xenproject.org
Cc: mirageos-devel@lists.xenproject.org
Cc: committers@xenproject.org
---
 code-review-guide.md | 309 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 309 insertions(+)
 create mode 100644 code-review-guide.md

diff --git a/code-review-guide.md b/code-review-guide.md
new file mode 100644
index 0000000..5ffbbac
--- /dev/null
+++ b/code-review-guide.md
@@ -0,0 +1,309 @@
+# Code Review Guide
+
+This document highlights what reviewers such as maintainers and committers look
+for when reviewing your code. It sets expectations for code authors and provides
+a framework for code reviewers.
+
+Before we start, it is important to remember that the primary purpose of a
+a code review is to indentify any bugs or potential bugs in the code. Most code
+reviews are relatively straight-forward and do not require re-writing the
+submitted code substantially.
+
+The document provides advice on how to structure larger patch series and
+provides  pointers on code author's and reviewer's workflows.
+
+Sometimes it happens that a submitted patch series made wrong assumptions or has
+a flawed design or architecture. This can be frustrating for contributors and
+code  reviewers. Note that this document does contain [a section](#problems)
+that provides  suggestions on how to minimize the impact for most stake-holders
+and also on how to avoid such situations.
+
+This document does **not cover** the following topics:
+* [Communication Best Practice][1]
+* [Resolving Disagreement][2]
+* [Patch Submission Workflow][3]
+* [Managing Patch Submission with Git][4]
+
+## What we look for in Code Reviews
+
+When performing a code review, reviewers typically look for the following things
+
+### Is the change necessary to accomplish the goals?
+
+* Is it clear what the goals are?
+* Do we need to make a change, or can the goals be met with existing
+  functionality?
+
+### Architecture / Interface
+
+* Is this the best way to solve the problem?
+* Is this the right part of the code to modify?
+* Is this the right level of abstraction?
+* Is the interface general enough? Too general? Forward compatible?
+
+### Functionality
+
+* Does it do what it’s trying to do?
+* Is it doing it in the most efﬁcient way?
+* Does it handle all the corner / error cases correctly?
+
+### Maintainability / Robustness
+
+* Is the code clear? Appropriately commented?
+* Does it duplicate another piece of code?
+* Does the code make hidden assumptions?
+* Does it introduce sections which need to be kept **in sync** with other
+  sections?
+* Are there other **traps** someone modifying this code might fall into?
+
+**Note:** Sometimes you will work in areas which have identified maintainability
+and/or robustness issues. In such cases, maintainers may ask you to make
+additional changes, such that your submitted code does not make things worse or
+point you to other patches are already being worked on.
+
+### System properties
+
+In some areas of the code, system properties such as
+* Code size
+* Performance
+* Scalability
+* Latency
+* Complexity
+* &c
+are also important during code reviews.
+
+### Style
+
+* Comments, carriage returns, **snuggly braces**, &c
+* See [CODING_STYLE][5] and [tools/libxl/CODING_STYLE][6]
+* No extraneous whitespace changes
+
+### Documentation and testing
+
+* If there is pre-existing documentation in the tree, such as man pages, design
+  documents, etc. a contributor may be asked to update the documentation
+  alongside the change. Documentation is typically present in the [docs][7]
+  folder.
+* When adding new features that have an impact on the end-user,
+  a contributor should include an update to the [SUPPORT.md][8] file.
+  Typically, more complex features require several patch series before it is
+  ready to be advertised in SUPPORT.md
+* When adding new features, a contributor may be asked to provide tests or
+  ensure that existing tests pass
+
+#### Testing for the Xen Project Hypervisor
+
+Tests are typically located in one of the following directories
+* **Unit tests**: [tools/tests][9] or [xen/test][A]<br>
+  Unit testing is hard for a system like Xen and typically requires building a
+  subsystem of your tree. If your change can be easily unit tested, you should
+  consider submitting tests with your patch.
+* **Build and smoke test**: see [Xen GitLab CI][B]<br>
+  Runs build tests for a combination of various distros and compilers against
+  changes committed to staging. Developers can join as members and test their
+  development branches **before** submitting a patch.
+* **XTF tests** (microkernel-based tests): see [XTF][C]<br>
+  XTF has been designed to test interactions between your software and hardware.
+  It is a very useful tool for testing low level functionality and is executed
+  as part of the project's CI system. XTF can be easily executed locally on
+  xen.git trees.
+* **osstest**: see [README][D]<br>
+  Osstest is the Xen Projects automated test system, which tests basic Xen use
+  cases on a variety of different hardware. Before changes are committed, but
+  **after** they have been reviewed. A contributor’s changes **cannot be
+  applied to master** unless the tests pass this test suite. Note that XTF and
+  other tests are also executed as part of osstest.
+
+### Patch / Patch series information
+
+* Informative one-line changelog
+* Full changelog
+* Motivation described
+* All important technical changes mentioned
+* Changes since previous revision listed
+* Reviewed-by’s and Acked-by’s dropped if appropriate
+
+More information related to these items can be found in our
+[Patch submission Guide][E].
+
+## Code Review Workflow
+
+This section is important for code authors and reviewers. We recomment that in
+particular new code authors carefully read this section.
+
+### Workflow from a Reviewer's Perspective
+
+Patch series typically contain multiple changes to the codebase, some
+transforming the same section of the codebase multiple times. It is quite common
+for patches in a patch series to rely on the previous ones. This means that code
+reviewers review  patches and patch series **sequentially** and **the structure
+of a patch series guides the code review process**. Sometimes in a long series,
+patches {1,2}/10 will be clean-ups, {3-6}/10 will be general reorganisations
+which don't really seem to do anything and then {7-10}/10 will be the substance
+of the serties, which helps the code reviewer understand what {3-6}/10 were
+about.
+
+Generally there are no hard rules on how to structure a series, as the structure
+of a series is very code specific and it is hard to give specific advice. There
+are some general tips which  help and some general patterns.
+
+**Tips:**
+
+* Outline the thinking behind the structure of the patch series. This can make
+  a huge difference and helps ensure that the code reviewer understands what the
+  series is trying to achieve and which portions are addressing which problems.
+* Try and keep changes that belong to a subsystem together
+* Expect that the structure of a patch series sometimes may need to change
+  between different versions of a patch series
+* **Most importantly**: Start small. Don't submit a large and complex patch
+  series as the first interaction with the community. Try and pick a smaller
+  task first (e.g. a bug-fix, a clean-up task, etc.) such that you don't have
+  to learn the tools, code and deal with a large patch series all together for
+  the first time.
+
+**General Patterns:**
+
+If there are multiple subsystems involved in your series, then these are best
+separated out into **sets of patches**, which roughly follow the following
+seven categories. In other words: you would end up with **7 categories x N
+subsystems**. In some cases, there is a **global set of patches** that affect
+all subsytems (e.g. headers, macros, documentation) impacting all changed
+subsystems which ideally comes **before** subsystem specific changes.
+
+The seven categories typically making up a logical set of patches
+1. Cleanups and/or new Independent Helper Functions
+2. Reorganisations
+3. Headers, APIs, Documentation and anything which helps understand the
+   substance of a series
+4. The substance of the change
+5. Cleaninups of any infelicities introduced temporarily
+6. Deleting old code
+7. Test code
+
+Note that in many cases, some of the listed categories are not always present
+in each set, as they are not needed. Of course, sometimes there are several
+patches describing **changes of substance**, which could be ordered in different
+ways: in such cases it may be necessary to put reorganisations in between these
+patches.
+
+If a series is structured this way, it is often possible to agree early on,
+that a significant portion of the changes are fine and to check these in
+independently of the rest of the patch series. This means that there is
+* Less work for authors to rebase
+* Less cognitive overhead for reviewers to review successive versions of a
+  series
+* The possibility for different code reviewers to review portions of such
+  large changes indepentendtly
+
+**Trade-Offs:**
+
+* In some cases, following the general pattern above may create extra patches
+  and may make a series more complex and harder to understand.
+* Crafting a more extensive cover letter will be extra effort: in most cases,
+  the extra time investment will be saving time during the code review process.
+  Verbosity is not the goal, but clarity is. Before you send a larger series
+  in particular: try and put yourself into the position of a code reviewer and
+  try to identify information that helps a code reviewer follow the patch
+  series.
+* In cases where changes need to be back-ported to older releases, moving
+  general cleanups last is often preferable: in such cases the **substance of
+  the change** is back-ported, whereas general cleanups and improvements are
+  not.
+
+**Examples:**
+
+TODO:
+* We should have some examples of a well structured cover letter for a complex
+  series.
+
+A candidate may be:
+https://lore.kernel.org/xen-devel/20190928151305.127380-1-wipawel@amazon.de/T/#t
+(or earlier versions)
+
+* We should have an example which shows a patch with a good logical structure
+
+### Workflow from an Author's Perspective
+
+When code authors receive feedback on their patches, they typically first try
+to clarify feedback they do not understand. For smaller patches or patch series
+it makes sense to wait until receiving feedback on the entire series before
+sending out a new version addressing the changes. For larger series, it may
+make sense to send out a new revision earlier.
+
+As a reviewer, you need some system that he;ps ensure that you address all
+review comments. This can be tedious when trying to map a hierarchical e-mail
+thread onto a code-base. Different people use different techniques from using
+* In-code TODO statements with comment snippets copied into the code
+* To keeping a separate TODO list
+* To printing out the review conversation tree and ticking off what has been
+  addressed
+* A combination of the above
+
+### <a name="problems"></a>Problematic Patch Reviews
+
+A typical waterfall software development process is sequential with the
+following steps: define requirements, analyse, design, code, test and deploy.
+Problems uncovered by code review or testing at such a late stage can cause
+costly redesign and delays. The principle of **[Shift Left][D]** is to take a
+task that is traditionally performed at a late stage in the process and perform
+that task at earlier stages. The goal is to save time by avoiding refactoring.
+
+Typically, problematic patch reviews uncover issues such as wrong or missed
+assumptions, a problematic architecture or design, or other bugs that require
+significant re-implementation of a patch series to fix the issue.
+
+The principle of **Shift Left** also applies in code reviews. Let's assume a
+series has a major flaw: ideally, this flaw would be picked up in the **first
+or second iteration** of the code review. As significant parts of the code may
+have to be re-written, it does not make sense for reviewers to highlight minor
+issues (such as style issues) until major flaws have been addressed of the
+affected part of a patch series. In such cases, providing feedback on minor
+issues reviewers cause the code author and themselves extra work by asking for
+changes to code, which ultimately may be changed later.
+
+To make it possible for code reviewers to identify major issues early, it is
+important for code-authors to highlight possible issues in a cover letter and
+to structure a patch series in such a way that makes it easy for reviewers to
+separate diffifcult and easy portions of a patch series. This will enable
+reviewers to progress uncontroversial portions of a patch independently from
+controversial ones.
+
+### Reviewing for Patch Authors
+
+The following presentation by George Dunlap, provides an excellent overview on
+howwe do code reviews, specifically targeting non-maintainers.
+
+As a community, we would love to have more help reviewing, including from **new
+community members**. But many people
+* do not know where to start, or
+* believe that their review would not contribute much, or
+* may feel intimidated reviewing the code of more established community members
+
+The presentation demonstrates that you do not need to worry about any of these
+concerns. In addition, reviewing other people's patches helps you
+* write better patches and experience the code review process from the other
+  side
+* and build more influence within the community over time
+
+Thus, we recommend strongly that **patch authors** read the watch the recording or
+read the slides:
+* [Patch Review for Non-Maintainers slides][F]
+* [Patch Review for Non-Maintainers recording - 20"][G]
+
+[1]: communication-practice.md
+[2]: resolving-disagreement.md
+[3]: https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches
+[4]: https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git
+[5]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=CODING_STYLE
+[6]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=tools/libxl/CODING_STYLE
+[7]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=docs
+[8]: http:s//xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=SUPPORT.md
+[9]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=tools/tests
+[A]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=xen/test
+[B]: https://gitlab.com/xen-project/xen/pipelines
+[C]: https://xenbits.xenproject.org/docs/xtf/
+[D]: https://xenbits.xenproject.org/gitweb/?p=osstest.git;a=blob;f=README
+[E]: https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches
+[D]: https://devopedia.org/shift-left
+[F]: https://www.slideshare.net/xen_com_mgr/xpdds19-keynote-patch-review-for-nonmaintainers-george-dunlap-citrix-systems-uk-ltd
+[G]: https://www.youtube.com/watch?v=ehZvBmrLRwg
-- 
2.13.0



--===============6540980277825011620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6540980277825011620==--
