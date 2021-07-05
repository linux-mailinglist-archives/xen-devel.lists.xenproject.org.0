Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770EA3BBB9F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150095.277580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0MG0-0003u0-Pm; Mon, 05 Jul 2021 10:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150095.277580; Mon, 05 Jul 2021 10:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0MG0-0003rQ-L4; Mon, 05 Jul 2021 10:55:20 +0000
Received: by outflank-mailman (input) for mailman id 150095;
 Mon, 05 Jul 2021 10:55:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jU53=L5=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1m0MFz-0003rB-DL
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:55:19 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e51cca4b-a6c1-4dc9-af93-d15b89961689;
 Mon, 05 Jul 2021 10:55:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3B781042;
 Mon,  5 Jul 2021 03:55:17 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90D943F5A1;
 Mon,  5 Jul 2021 03:55:16 -0700 (PDT)
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
X-Inumbo-ID: e51cca4b-a6c1-4dc9-af93-d15b89961689
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
Subject: [PATCH v7 0/9] Use Doxygen and sphinx for html documentation
Date: Mon,  5 Jul 2021 11:50:54 +0100
Message-Id: <20210705105103.14509-1-luca.fancellu@arm.com>
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
make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-" defconfig
make -C docs XEN_TARGET_ARCH="arm64" sphinx-html

now in docs/sphinx/html/ we have the generated docs starting
from the index.html page.

I've created a preview showing the html pages:

https://luca.fancellu.gitlab.io/xen-docs/hypercall-interfaces/arm64.html

The browser will show you a warning about the certificate, that's because
my gitlab username contains a dot, this is a known limitation of gitlab pages
so there is nothing to worry about.

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
 docs/Makefile                                 |   47 +-
 docs/conf.py                                  |   43 +-
 docs/configure                                |  258 ++
 docs/configure.ac                             |   15 +
 docs/hypercall-interfaces/arm32.rst           |   32 +
 docs/hypercall-interfaces/arm64.rst           |   33 +
 .../common/grant_tables.rst                   |    9 +
 docs/hypercall-interfaces/index.rst.in        |    7 +
 docs/hypercall-interfaces/x86_64.rst          |   32 +
 docs/index.rst                                |    8 +
 docs/xen-doxygen/customdoxygen.css            |   36 +
 docs/xen-doxygen/doxy-preprocessor.py         |  116 +
 docs/xen-doxygen/doxy_input.list              |    1 +
 docs/xen-doxygen/doxygen_include.h.in         |   32 +
 docs/xen-doxygen/footer.html                  |   21 +
 docs/xen-doxygen/header.html                  |   56 +
 docs/xen-doxygen/mainpage.md                  |    5 +
 docs/xen-doxygen/xen_project_logo_165x67.png  |  Bin 0 -> 18223 bytes
 docs/xen.doxyfile.in                          | 2316 +++++++++++++++++
 m4/ax_python_module.m4                        |   56 +
 m4/docs_tool.m4                               |    9 +
 xen/include/public/grant_table.h              |  459 ++--
 24 files changed, 3412 insertions(+), 188 deletions(-)
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


