Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15702539ADF
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 03:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340157.565134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwDP7-0000Ut-PD; Wed, 01 Jun 2022 01:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340157.565134; Wed, 01 Jun 2022 01:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwDP7-0000Q8-EU; Wed, 01 Jun 2022 01:44:09 +0000
Received: by outflank-mailman (input) for mailman id 340157;
 Wed, 01 Jun 2022 01:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwDP6-0000M1-GA
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 01:44:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 529f00ac-e14c-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 03:44:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82066614F0;
 Wed,  1 Jun 2022 01:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A72C385A9;
 Wed,  1 Jun 2022 01:44:04 +0000 (UTC)
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
X-Inumbo-ID: 529f00ac-e14c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654047844;
	bh=3LNFb9eaJ6ljtq7k9YOeH/I4pjqCITnxKzvBBuGvkIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uM65ol6KI7QKERi++wgwRfjAUZrM3IZs0C6dDBVZpfO80Is7zlNwU/jTF9A3bmvOm
	 vPDBoIXF2wJiv/ivYry7+RGr2dng5td+EMG0yOJGEs5jDCziEWFLq8KQEAdcSfx05O
	 hwcpFG2I045gwvq//B8ol3JIl7MUuBK2/nLkRX/lCfi6uboERzn/v8XEPkXDf//fWf
	 nzBlryIiN4rFhdUq4LZh2ByfR2sCbyy3J+y/uP3ZMIqbAdRDVLF1jmQGnLjuih0BTm
	 r64vqeBrv21ug9tgX92sAA3qzHYmDxpyDZlt99LUHjOy+xJCrtQDQ6jZVoOt1hAAHZ
	 ZnFEhXva3Peew==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	George.Dunlap@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 1/2] docs/misra: introduce rules.rst
Date: Tue, 31 May 2022 18:44:01 -0700
Message-Id: <20220601014402.2293524-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Introduce a list of MISRA C rules that apply to the Xen hypervisor. The
list is in RST format.

Specify that rules deviations need to be documented. Introduce a
documentation tag for in-code comments to mark them as deviations. Also
mention that other documentation mechanisms are work-in-progress.

Add a mention of the new list to CODING_STYLE.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---

Note that I don't feel strongly about the deviations format. At this
stage anything is OK in my view. We'll need to improve it as we go along
and as we start to integrate better with MISRA C checkers. That said,
certainly an in-code comment with a special tag is a safe bet in terms
of tools integration (easy to parse, easy to convert.) We'll need other
mechanisms too and that's why I kept the sentence about "Other
documentation mechanisms are work-in-progress."

Changes in v2:
- clarify that deviations are permitted
- introduce an in-code tag for deviations
- improve the document format, make it proper reStructuredText
- improve commit message
---
 CODING_STYLE         |   6 +++
 docs/index.rst       |  12 +++++
 docs/misra/rules.rst | 123 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 docs/misra/rules.rst

diff --git a/CODING_STYLE b/CODING_STYLE
index 9f50d9cec4..3386ee1d90 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -14,6 +14,12 @@ explicitly (e.g. tools/libxl/CODING_STYLE) but often implicitly (Linux
 coding style is fairly common). In general you should copy the style
 of the surrounding code. If you are unsure please ask.
 
+MISRA C
+-------
+
+The Xen Hypervisor follows some MISRA C coding rules. See
+docs/misra/rules.rst for details.
+
 Indentation
 -----------
 
diff --git a/docs/index.rst b/docs/index.rst
index b75487a05d..2c47cfa999 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -53,6 +53,18 @@ kind of development environment.
    hypervisor-guide/index
 
 
+MISRA C coding guidelines
+-------------------------
+
+MISRA C rules and directive to be used as coding guidelines when writing
+Xen hypervisor code.
+
+.. toctree::
+   :maxdepth: 2
+
+   misra/rules
+
+
 Miscellanea
 -----------
 
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
new file mode 100644
index 0000000000..7d6a9fe063
--- /dev/null
+++ b/docs/misra/rules.rst
@@ -0,0 +1,123 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+MISRA C rules for Xen
+=====================
+
+.. note::
+
+   **IMPORTANT** All MISRA C rules, text, and examples are copyrighted
+   by the MISRA Consortium Limited and used with permission.
+
+   Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA
+   C, or for licensing options for other use of the rules.
+
+The following is the list of MISRA C rules that apply to the Xen
+hypervisor.
+
+It is possible that in specific circumstances it is best not to follow a
+rule because it is not possible or because the alternative leads to
+better code quality. Those cases are called "deviations". They are
+permissible as long as they are documented as an in-code comment using
+the following format::
+
+    /*
+     * MISRA_DEV: Rule ID
+     * Justification text.
+     */
+
+Other documentation mechanisms are work-in-progress.
+
+The existing codebase is not 100% compliant with the rules. Some of the
+violations are meant to be documented as deviations, while some others
+should be fixed. Both compliance and documenting deviations on the
+existing codebase are work-in-progress.
+
+.. list-table::
+   :header-rows: 1
+
+   * - Dir number
+     - Severity
+     - Summary
+     - Notes
+
+   * - `Dir 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c>`_
+     - Required
+     - All source files shall compile without any compilation errors
+     -
+
+   * - `Dir 4.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c>`_
+     - Required
+     - If a function returns error information then that error
+       information shall be tested
+     -
+
+   * - `Dir 4.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_10.c>`_
+     - Required
+     - Precautions shall be taken in order to prevent the contents of a
+       header file being included more than once
+     -
+
+   * - `Dir 4.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c>`_
+     - Required
+     - The validity of values received from external sources shall be
+       checked
+     -
+
+.. list-table::
+   :header-rows: 1
+
+   * - Rule number
+     - Severity
+     - Summary
+     - Notes
+
+   * - `Rule 1.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_03.c>`_
+     - Required
+     - There shall be no occurrence of undefined or critical unspecified
+       behaviour
+     -
+
+   * - `Rule 3.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c>`_
+     - Required
+     - Line-splicing shall not be used in // comments
+     -
+
+   * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c>`_
+     - Required
+     - Single-bit named bit fields shall not be of a signed type
+     -
+
+   * - `Rule 8.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c>`_
+     - Required
+     - Types shall be explicitly specified
+     -
+
+   * - `Rule 8.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c>`_
+     - Required
+     - A compatible declaration shall be visible when an object or
+       function with external linkage is defined
+     -
+
+   * - `Rule 8.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_05_2.c>`_
+     - Required
+     - An external object or function shall be declared once in one and only one file
+     -
+
+   * - `Rule 8.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_06_2.c>`_
+     - Required
+     - An identifier with external linkage shall have exactly one
+       external definition
+     - Declarations without definitions are allowed (specifically when
+       the definition is compiled-out or optimized-out by the compiler)
+
+   * - `Rule 8.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_08.c>`_
+     - Required
+     - The static storage class specifier shall be used in all
+       declarations of objects and functions that have internal linkage
+     -
+
+   * - `Rule 8.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_12.c>`_
+     - Required
+     - Within an enumerator list the value of an implicitly-specified
+       enumeration constant shall be unique
+     -
-- 
2.25.1


