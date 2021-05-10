Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E48377E62
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124963.235285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1To-0001O7-D8; Mon, 10 May 2021 08:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124963.235285; Mon, 10 May 2021 08:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1To-0001KJ-98; Mon, 10 May 2021 08:41:32 +0000
Received: by outflank-mailman (input) for mailman id 124963;
 Mon, 10 May 2021 08:41:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jR2S=KF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lg1Tm-0008L0-Ng
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:41:30 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 87a44038-5c7a-4c6f-b7c9-4df9ade5601f;
 Mon, 10 May 2021 08:41:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93AD7106F;
 Mon, 10 May 2021 01:41:14 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C6F23F719;
 Mon, 10 May 2021 01:41:13 -0700 (PDT)
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
X-Inumbo-ID: 87a44038-5c7a-4c6f-b7c9-4df9ade5601f
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 0/9] Use Doxygen and sphinx for html documentation
Date: Mon, 10 May 2021 09:40:56 +0100
Message-Id: <20210510084105.17108-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduce doxygen in the sphinx html docs generation.
One benefit is to keep most of the documentation in the source
files of xen so that it's more maintainable, on the other hand
there are some limitation of doxygen that should be addressed
modifying the current codebase (for example doxygen can't parse
anonymous structure/union).

To reproduce the documentation xen must be compiled because
most of the headers are generated on compilation time from
the makefiles.

Here follows the steps to generate the sphinx html docs, some
package may be required on your machine, everything is suggested
by the autoconf script.
Here I'm building the arm64 docs (the only introduced for now by
this serie):

./configure
make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-" menuconfig
make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-"
make -C docs XEN_TARGET_ARCH="arm64" sphinx-html

now in docs/sphinx/html/ we have the generated docs starting
from the index.html page.

Luca Fancellu (9):
  docs: add doxygen configuration file
  docs: add Xen png logo for the doxygen documentation
  docs: add doxygen templates
  m4/python: add function to docs_tool.m4 and new m4 module
  docs: add checks to configure for sphinx and doxygen
  docs: add doxygen preprocessor and related files
  docs: Change Makefile and sphinx configuration for doxygen
  docs: hypercalls sphinx skeleton for generated html
  docs/doxygen: doxygen documentation for grant_table.h

 .gitignore                                    |    7 +
 config/Docs.mk.in                             |    2 +
 docs/Makefile                                 |   46 +-
 docs/conf.py                                  |   48 +-
 docs/configure                                |  258 ++
 docs/configure.ac                             |   15 +
 docs/hypercall-interfaces/arm32.rst           |   32 +
 docs/hypercall-interfaces/arm64.rst           |   33 +
 .../common/grant_tables.rst                   |    9 +
 docs/hypercall-interfaces/index.rst.in        |    7 +
 docs/hypercall-interfaces/x86_64.rst          |   32 +
 docs/index.rst                                |    8 +
 docs/xen-doxygen/customdoxygen.css            |   36 +
 docs/xen-doxygen/doxy-preprocessor.py         |  110 +
 docs/xen-doxygen/doxy_input.list              |    1 +
 docs/xen-doxygen/doxygen_include.h.in         |   32 +
 docs/xen-doxygen/footer.html                  |   21 +
 docs/xen-doxygen/header.html                  |   56 +
 docs/xen-doxygen/mainpage.md                  |    5 +
 docs/xen-doxygen/xen_project_logo_165x67.png  |  Bin 0 -> 18223 bytes
 docs/xen.doxyfile.in                          | 2316 +++++++++++++++++
 m4/ax_python_module.m4                        |   56 +
 m4/docs_tool.m4                               |    9 +
 xen/include/public/grant_table.h              |  387 +--
 24 files changed, 3367 insertions(+), 159 deletions(-)
 create mode 100644 docs/hypercall-interfaces/arm32.rst
 create mode 100644 docs/hypercall-interfaces/arm64.rst
 create mode 100644 docs/hypercall-interfaces/common/grant_tables.rst
 create mode 100644 docs/hypercall-interfaces/index.rst.in
 create mode 100644 docs/hypercall-interfaces/x86_64.rst
 create mode 100644 docs/xen-doxygen/customdoxygen.css
 create mode 100755 docs/xen-doxygen/doxy-preprocessor.py
 create mode 100644 docs/xen-doxygen/doxy_input.list
 create mode 100644 docs/xen-doxygen/doxygen_include.h.in
 create mode 100644 docs/xen-doxygen/footer.html
 create mode 100644 docs/xen-doxygen/header.html
 create mode 100644 docs/xen-doxygen/mainpage.md
 create mode 100644 docs/xen-doxygen/xen_project_logo_165x67.png
 create mode 100644 docs/xen.doxyfile.in
 create mode 100644 m4/ax_python_module.m4

-- 
2.17.1


