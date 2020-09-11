Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B97265FAA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:40:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiM6-0006iR-BW; Fri, 11 Sep 2020 12:40:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiM5-0006hW-1j
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:40:41 +0000
X-Inumbo-ID: fc1f6b95-e160-48c0-b8b1-071ee2d75ff6
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc1f6b95-e160-48c0-b8b1-071ee2d75ff6;
 Fri, 11 Sep 2020 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q1aCTFoFO9abujLiq4ebibIbZx1ARS5BNFG2U++NH3w=;
 b=c5V9nSMZ9RfhuaejLzuaaW2CeUKfAMNabtyTQO7aSSATkXWTxKXYwPbK
 Ym8Y5Dbvrmm3vtW8pSCMcOO4EQf5zpkyGbwOiqssou+Y18iPDhbuPsLeU
 dSUMatIArefqSor2QIEiQX2BUZTd+WpEVX8tEI0b/1M7HUOckTQg+zk3e Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RL1PNVOr2asCZbkylcYaoSdjJfV1KmvBJTFx28YXKL5zYmWum4OzgYD8uwHMbfQQP+uQ0Xxukx
 es2OdgNh9Hsm5obHOM7S/asKHlUW+XgSOT2A28RG3xpR6T/UCmikpiNKGqhiJshjbITgA7axZ0
 wz52mxPfRHhF3MV18cs3L/q5g/N8EH0qXaffj2qSfHXknZvfbzilM1x+8YOYS7V+rrWPVjZcbZ
 xynN8FeLEjvTZpq+/oMVUnGkp1ikIKDXdnax3165Ooj6G9yFVCTFcNSS0AahdJ1z/LI+Gdgl41
 fg4=
X-SBRS: 2.7
X-MesageID: 26789698
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26789698"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 1/8] Add basic sphinx structure
Date: Fri, 11 Sep 2020 13:40:02 +0100
Message-ID: <20200911124009.3760032-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911124009.3760032-1-george.dunlap@citrix.com>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

---
 Makefile         | 20 +++++++++++++++++++
 source/conf.py   | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 source/index.rst | 20 +++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 Makefile
 create mode 100644 source/conf.py
 create mode 100644 source/index.rst

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..d0c3cbf
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,20 @@
+# Minimal makefile for Sphinx documentation
+#
+
+# You can set these variables from the command line, and also
+# from the environment for the first two.
+SPHINXOPTS    ?=
+SPHINXBUILD   ?= sphinx-build
+SOURCEDIR     = source
+BUILDDIR      = build
+
+# Put it first so that "make" without argument is like "make help".
+help:
+	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+
+.PHONY: help Makefile
+
+# Catch-all target: route all unknown targets to Sphinx using the new
+# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
+%: Makefile
+	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
diff --git a/source/conf.py b/source/conf.py
new file mode 100644
index 0000000..7b99910
--- /dev/null
+++ b/source/conf.py
@@ -0,0 +1,52 @@
+# Configuration file for the Sphinx documentation builder.
+#
+# This file only contains a selection of the most common options. For a full
+# list see the documentation:
+# https://www.sphinx-doc.org/en/master/usage/configuration.html
+
+# -- Path setup --------------------------------------------------------------
+
+# If extensions (or modules to document with autodoc) are in another directory,
+# add these directories to sys.path here. If the directory is relative to the
+# documentation root, use os.path.abspath to make it absolute, like shown here.
+#
+# import os
+# import sys
+# sys.path.insert(0, os.path.abspath('.'))
+
+
+# -- Project information -----------------------------------------------------
+
+project = 'XenProject Governance'
+copyright = '2020, The XenProject Team'
+author = 'The XenProject Team'
+
+
+# -- General configuration ---------------------------------------------------
+
+# Add any Sphinx extension module names here, as strings. They can be
+# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
+# ones.
+extensions = [
+]
+
+# Add any paths that contain templates here, relative to this directory.
+templates_path = ['_templates']
+
+# List of patterns, relative to source directory, that match files and
+# directories to ignore when looking for source files.
+# This pattern also affects html_static_path and html_extra_path.
+exclude_patterns = []
+
+
+# -- Options for HTML output -------------------------------------------------
+
+# The theme to use for HTML and HTML Help pages.  See the documentation for
+# a list of builtin themes.
+#
+html_theme = 'alabaster'
+
+# Add any paths that contain custom static files (such as style sheets) here,
+# relative to this directory. They are copied after the builtin static files,
+# so a file named "default.css" will overwrite the builtin "default.css".
+html_static_path = ['_static']
\ No newline at end of file
diff --git a/source/index.rst b/source/index.rst
new file mode 100644
index 0000000..63f76f0
--- /dev/null
+++ b/source/index.rst
@@ -0,0 +1,20 @@
+.. XenProject Governance documentation master file, created by
+   sphinx-quickstart on Tue Sep  8 12:10:02 2020.
+   You can adapt this file completely to your liking, but it should at least
+   contain the root `toctree` directive.
+
+Welcome to XenProject Governance's documentation!
+=================================================
+
+.. toctree::
+   :maxdepth: 2
+   :caption: Contents:
+
+
+
+Indices and tables
+==================
+
+* :ref:`genindex`
+* :ref:`modindex`
+* :ref:`search`
-- 
2.24.3 (Apple Git-128)


