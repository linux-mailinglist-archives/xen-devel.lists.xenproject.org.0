Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1523355101
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 12:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105768.202287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTj4u-0000xm-AA; Tue, 06 Apr 2021 10:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105768.202287; Tue, 06 Apr 2021 10:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTj4u-0000xN-6x; Tue, 06 Apr 2021 10:37:00 +0000
Received: by outflank-mailman (input) for mailman id 105768;
 Tue, 06 Apr 2021 10:36:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZnD=JD=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lTj4t-0000xI-Ca
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 10:36:59 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2ea966c9-eb16-48ed-b71a-9ef8607421c6;
 Tue, 06 Apr 2021 10:36:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA40031B;
 Tue,  6 Apr 2021 03:36:56 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7816B3F73D;
 Tue,  6 Apr 2021 03:36:55 -0700 (PDT)
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
X-Inumbo-ID: 2ea966c9-eb16-48ed-b71a-9ef8607421c6
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
Subject: [PATCH 0/3] Use Doxygen and sphinx for html documentation
Date: Tue,  6 Apr 2021 11:36:00 +0100
Message-Id: <20210406103603.8530-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduce doxygen in the sphinx html docs generation.
One benefit is to keep most of the documentation in the source
files of xen so that it's more maintainable, on the other hand
there are some limitation of doxygen that must be addressed
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


Luca Fancellu (3):
  docs: add doxygen support for html documentation
  docs: hypercalls sphinx skeleton for generated html
  docs/doxygen: doxygen documentation for grant_table.h

 .gitignore                                    |    7 +
 config/Docs.mk.in                             |    2 +
 docs/Makefile                                 |   51 +-
 docs/conf.py                                  |   48 +-
 docs/configure                                |  258 ++
 docs/configure.ac                             |   15 +
 docs/hypercall-interfaces/arm32.rst           |    4 +
 docs/hypercall-interfaces/arm64.rst           |   33 +
 .../arm64/grant_tables.rst                    |    8 +
 docs/hypercall-interfaces/index.rst.in        |    7 +
 docs/hypercall-interfaces/x86_64.rst          |    4 +
 docs/index.rst                                |    8 +
 docs/xen-doxygen/customdoxygen.css            |   36 +
 docs/xen-doxygen/doxy_input.list              |    1 +
 docs/xen-doxygen/doxy_input_template.in       |   21 +
 docs/xen-doxygen/footer.html                  |   21 +
 docs/xen-doxygen/header.html                  |   56 +
 docs/xen-doxygen/mainpage.md                  |    5 +
 docs/xen-doxygen/xen_project_logo_165x67.png  |  Bin 0 -> 18223 bytes
 docs/xen.doxyfile.in                          | 2314 +++++++++++++++++
 m4/ax_python_module.m4                        |   56 +
 m4/docs_tool.m4                               |    9 +
 xen/include/public/grant_table.h              |   79 +-
 23 files changed, 3007 insertions(+), 36 deletions(-)
 create mode 100644 docs/hypercall-interfaces/arm32.rst
 create mode 100644 docs/hypercall-interfaces/arm64.rst
 create mode 100644 docs/hypercall-interfaces/arm64/grant_tables.rst
 create mode 100644 docs/hypercall-interfaces/index.rst.in
 create mode 100644 docs/hypercall-interfaces/x86_64.rst
 create mode 100644 docs/xen-doxygen/customdoxygen.css
 create mode 100644 docs/xen-doxygen/doxy_input.list
 create mode 100644 docs/xen-doxygen/doxy_input_template.in
 create mode 100644 docs/xen-doxygen/footer.html
 create mode 100644 docs/xen-doxygen/header.html
 create mode 100644 docs/xen-doxygen/mainpage.md
 create mode 100644 docs/xen-doxygen/xen_project_logo_165x67.png
 create mode 100644 docs/xen.doxyfile.in
 create mode 100644 m4/ax_python_module.m4

-- 
2.17.1


