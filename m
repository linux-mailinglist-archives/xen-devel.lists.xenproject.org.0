Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607FF7E593E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 15:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629310.981421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0jgx-0001MP-UI; Wed, 08 Nov 2023 14:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629310.981421; Wed, 08 Nov 2023 14:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0jgx-0001Kk-Ra; Wed, 08 Nov 2023 14:38:03 +0000
Received: by outflank-mailman (input) for mailman id 629310;
 Wed, 08 Nov 2023 14:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L2E1=GV=citrix.com=prvs=669c226bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r0jgw-0001Ke-L0
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 14:38:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 677cb11f-7e44-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 15:37:56 +0100 (CET)
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
X-Inumbo-ID: 677cb11f-7e44-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1699454276;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+nvgzJHgmmIX8lyHV7D4RHpl25ItZzGMSWCW1vkaDb0=;
  b=J8/fZuh7hyG7TIMzcDnC4TAFQipbALH4HqfTY8b/m2KMIbEc3L3JHYx4
   +9SE6DvfCFJ12UEqUEXRronzsMULUxrm11Trzre9oaEUc6D8eWF+GQTJO
   hfTZrvurQ3P7hwC/x2FIJU4AdO/sKJNbf2pP9BXcrj5gzNQtW3c6ZvaPh
   Q=;
X-CSE-ConnectionGUID: 43k5+xIWQraEzFuO3P3f+w==
X-CSE-MsgGUID: askSbJhhR+611AqiuTSFFQ==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128352222
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23://oRsazvp1EiM4pC2PB6t+cMxirEfRIJ4+MujC+fZmUNrF6WrkUGn
 2RJXD+BbPeCN2agft9/bN/i9E1VupHSyIBhSABp/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVnPaAT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT0V9
 qFbOBEyVwqKqvCY3ZXgcrJixdt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8FxRvC/
 Dicl4j/KhgBN+eV6zqFyDHy37bmhCLmZLk8OoTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9W9Vna15rqS6zSoNkA9L3IGZCICZRsI5Z/kuo5bpjLCSMxyVpG8iNLdECv1h
 TuNqUADa6471JBRkf/hpBae3mPq+cChohMJChv/Ajmms0BpRbGcfYWF+3bGyq14d4jaUQzU1
 JQboPRy/NziHLnUyn3cHLxQRO34jxqWGGeC2wIxRfHN4xzoqyb5I90KiN1rDB4xap5sRNP/X
 KPEVeq9Drd4O2GjaedMe5iwDcsxpUQLPY++Dq+NBjaij4IYSeNmwM2NTRTLt4wVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2CFMurlUz3jufEOxZ5rIvp13PXMYgEAF6s+ViOr
 b6zyePRo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2re2Jb9JUaI6aJm9sJItU195m5Y8+Up
 hlRrGcEkgug7ZAGQC3WAk1ehETHBMwg9CxiY3NxZj5FGRELOO6S0UvWTLNvFZFPyQCp5acco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:XdBKOKGrsV1Oi+FupLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8/
 xG+c5w6faaslkssR0b9+xoW5PwJE80l6QFgrX5VI3KNGXbUQ2TTb2KhbGI/9SKIVydygcy78
 ddmtNFebrN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-Talos-CUID: 9a23:cnEu424j9PDaF5rQjtssqBUXR4M1U0Lk1n79MWGlLj1RE7PWVgrF
X-Talos-MUID: 9a23:LalxmgskA4o6won0wc2njSphD81K46SUSx5UyLwfutS4DgJeAmLI
X-IronPort-AV: E=Sophos;i="6.03,286,1694750400"; 
   d="scan'208";a="128352222"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18] docs: Delete kconfig docs to fix licensing violation
Date: Wed, 8 Nov 2023 14:37:51 +0000
Message-ID: <20231108143751.49309-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

These 3 Kconfig docs were imported from Linux erroneously.  They are
GPL-2.0-only in Linux, but have no SPDX tag and were placed in such a way to
be included by the blanket statement saying that all RST files are CC-BY-4.0.

We should not be carrying a shadow copy of these docs.  They aren't even wired
into our Sphinx docs, and anyone wanting to refer to Kconfig docs is going to
look at the Linux docs anyway.  These, and more docs can be found at:

  https://www.kernel.org/doc/html/latest/kbuild/

which also have corrections vs the snapshot we took.

Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>
---
 docs/misc/kconfig-language.rst       | 701 ---------------------------
 docs/misc/kconfig-macro-language.rst | 247 ----------
 docs/misc/kconfig.rst                | 304 ------------
 3 files changed, 1252 deletions(-)
 delete mode 100644 docs/misc/kconfig-language.rst
 delete mode 100644 docs/misc/kconfig-macro-language.rst
 delete mode 100644 docs/misc/kconfig.rst

diff --git a/docs/misc/kconfig-language.rst b/docs/misc/kconfig-language.rst
deleted file mode 100644
index 74bef19f69f0..000000000000
--- a/docs/misc/kconfig-language.rst
+++ /dev/null
@@ -1,701 +0,0 @@
-================
-Kconfig Language
-================
-
-Introduction
-------------
-
-The configuration database is a collection of configuration options
-organized in a tree structure::
-
-	+- Code maturity level options
-	|  +- Prompt for development and/or incomplete code/drivers
-	+- General setup
-	|  +- Networking support
-	|  +- System V IPC
-	|  +- BSD Process Accounting
-	|  +- Sysctl support
-	+- Loadable module support
-	|  +- Enable loadable module support
-	|     +- Set version information on all module symbols
-	|     +- Kernel module loader
-	+- ...
-
-Every entry has its own dependencies. These dependencies are used
-to determine the visibility of an entry. Any child entry is only
-visible if its parent entry is also visible.
-
-Menu entries
-------------
-
-Most entries define a config option; all other entries help to organize
-them. A single configuration option is defined like this::
-
-  config MODVERSIONS
-	bool "Set version information on all module symbols"
-	depends on MODULES
-	help
-	  Usually, modules have to be recompiled whenever you switch to a new
-	  kernel.  ...
-
-Every line starts with a key word and can be followed by multiple
-arguments.  "config" starts a new config entry. The following lines
-define attributes for this config option. Attributes can be the type of
-the config option, input prompt, dependencies, help text and default
-values. A config option can be defined multiple times with the same
-name, but every definition can have only a single input prompt and the
-type must not conflict.
-
-Menu attributes
----------------
-
-A menu entry can have a number of attributes. Not all of them are
-applicable everywhere (see syntax).
-
-- type definition: "bool"/"tristate"/"string"/"hex"/"int"
-
-  Every config option must have a type. There are only two basic types:
-  tristate and string; the other types are based on these two. The type
-  definition optionally accepts an input prompt, so these two examples
-  are equivalent::
-
-	bool "Networking support"
-
-  and::
-
-	bool
-	prompt "Networking support"
-
-- input prompt: "prompt" <prompt> ["if" <expr>]
-
-  Every menu entry can have at most one prompt, which is used to display
-  to the user. Optionally dependencies only for this prompt can be added
-  with "if".
-
-- default value: "default" <expr> ["if" <expr>]
-
-  A config option can have any number of default values. If multiple
-  default values are visible, only the first defined one is active.
-  Default values are not limited to the menu entry where they are
-  defined. This means the default can be defined somewhere else or be
-  overridden by an earlier definition.
-  The default value is only assigned to the config symbol if no other
-  value was set by the user (via the input prompt above). If an input
-  prompt is visible the default value is presented to the user and can
-  be overridden by him.
-  Optionally, dependencies only for this default value can be added with
-  "if".
-
- The default value deliberately defaults to 'n' in order to avoid bloating the
- build. With few exceptions, new config options should not change this. The
- intent is for "make oldconfig" to add as little as possible to the config from
- release to release.
-
- Note:
-	Things that merit "default y/m" include:
-
-	a) A new Kconfig option for something that used to always be built
-	   should be "default y".
-
-	b) A new gatekeeping Kconfig option that hides/shows other Kconfig
-	   options (but does not generate any code of its own), should be
-	   "default y" so people will see those other options.
-
-	c) Sub-driver behavior or similar options for a driver that is
-	   "default n". This allows you to provide sane defaults.
-
-	d) Hardware or infrastructure that everybody expects, such as CONFIG_NET
-	   or CONFIG_BLOCK. These are rare exceptions.
-
-- type definition + default value::
-
-	"def_bool"/"def_tristate" <expr> ["if" <expr>]
-
-  This is a shorthand notation for a type definition plus a value.
-  Optionally dependencies for this default value can be added with "if".
-
-- dependencies: "depends on" <expr>
-
-  This defines a dependency for this menu entry. If multiple
-  dependencies are defined, they are connected with '&&'. Dependencies
-  are applied to all other options within this menu entry (which also
-  accept an "if" expression), so these two examples are equivalent::
-
-	bool "foo" if BAR
-	default y if BAR
-
-  and::
-
-	depends on BAR
-	bool "foo"
-	default y
-
-- reverse dependencies: "select" <symbol> ["if" <expr>]
-
-  While normal dependencies reduce the upper limit of a symbol (see
-  below), reverse dependencies can be used to force a lower limit of
-  another symbol. The value of the current menu symbol is used as the
-  minimal value <symbol> can be set to. If <symbol> is selected multiple
-  times, the limit is set to the largest selection.
-  Reverse dependencies can only be used with boolean or tristate
-  symbols.
-
-  Note:
-	select should be used with care. select will force
-	a symbol to a value without visiting the dependencies.
-	By abusing select you are able to select a symbol FOO even
-	if FOO depends on BAR that is not set.
-	In general use select only for non-visible symbols
-	(no prompts anywhere) and for symbols with no dependencies.
-	That will limit the usefulness but on the other hand avoid
-	the illegal configurations all over.
-
-- weak reverse dependencies: "imply" <symbol> ["if" <expr>]
-
-  This is similar to "select" as it enforces a lower limit on another
-  symbol except that the "implied" symbol's value may still be set to n
-  from a direct dependency or with a visible prompt.
-
-  Given the following example::
-
-    config FOO
-	tristate
-	imply BAZ
-
-    config BAZ
-	tristate
-	depends on BAR
-
-  The following values are possible:
-
-	===		===		=============	==============
-	FOO		BAR		BAZ's default	choice for BAZ
-	===		===		=============	==============
-	n		y		n		N/m/y
-	m		y		m		M/y/n
-	y		y		y		Y/n
-	y		n		*		N
-	===		===		=============	==============
-
-  This is useful e.g. with multiple drivers that want to indicate their
-  ability to hook into a secondary subsystem while allowing the user to
-  configure that subsystem out without also having to unset these drivers.
-
-- limiting menu display: "visible if" <expr>
-
-  This attribute is only applicable to menu blocks, if the condition is
-  false, the menu block is not displayed to the user (the symbols
-  contained there can still be selected by other symbols, though). It is
-  similar to a conditional "prompt" attribute for individual menu
-  entries. Default value of "visible" is true.
-
-- numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
-
-  This allows to limit the range of possible input values for int
-  and hex symbols. The user can only input a value which is larger than
-  or equal to the first symbol and smaller than or equal to the second
-  symbol.
-
-- help text: "help" or "---help---"
-
-  This defines a help text. The end of the help text is determined by
-  the indentation level, this means it ends at the first line which has
-  a smaller indentation than the first line of the help text.
-  "---help---" and "help" do not differ in behaviour, "---help---" is
-  used to help visually separate configuration logic from help within
-  the file as an aid to developers.
-
-- misc options: "option" <symbol>[=<value>]
-
-  Various less common options can be defined via this option syntax,
-  which can modify the behaviour of the menu entry and its config
-  symbol. These options are currently possible:
-
-  - "defconfig_list"
-    This declares a list of default entries which can be used when
-    looking for the default configuration (which is used when the main
-    .config doesn't exists yet.)
-
-  - "modules"
-    This declares the symbol to be used as the MODULES symbol, which
-    enables the third modular state for all config symbols.
-    At most one symbol may have the "modules" option set.
-
-  - "allnoconfig_y"
-    This declares the symbol as one that should have the value y when
-    using "allnoconfig". Used for symbols that hide other symbols.
-
-Menu dependencies
------------------
-
-Dependencies define the visibility of a menu entry and can also reduce
-the input range of tristate symbols. The tristate logic used in the
-expressions uses one more state than normal boolean logic to express the
-module state. Dependency expressions have the following syntax::
-
-  <expr> ::= <symbol>                           (1)
-           <symbol> '=' <symbol>                (2)
-           <symbol> '!=' <symbol>               (3)
-           <symbol1> '<' <symbol2>              (4)
-           <symbol1> '>' <symbol2>              (4)
-           <symbol1> '<=' <symbol2>             (4)
-           <symbol1> '>=' <symbol2>             (4)
-           '(' <expr> ')'                       (5)
-           '!' <expr>                           (6)
-           <expr> '&&' <expr>                   (7)
-           <expr> '||' <expr>                   (8)
-
-Expressions are listed in decreasing order of precedence.
-
-(1) Convert the symbol into an expression. Boolean and tristate symbols
-    are simply converted into the respective expression values. All
-    other symbol types result in 'n'.
-(2) If the values of both symbols are equal, it returns 'y',
-    otherwise 'n'.
-(3) If the values of both symbols are equal, it returns 'n',
-    otherwise 'y'.
-(4) If value of <symbol1> is respectively lower, greater, lower-or-equal,
-    or greater-or-equal than value of <symbol2>, it returns 'y',
-    otherwise 'n'.
-(5) Returns the value of the expression. Used to override precedence.
-(6) Returns the result of (2-/expr/).
-(7) Returns the result of min(/expr/, /expr/).
-(8) Returns the result of max(/expr/, /expr/).
-
-An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
-respectively for calculations). A menu entry becomes visible when its
-expression evaluates to 'm' or 'y'.
-
-There are two types of symbols: constant and non-constant symbols.
-Non-constant symbols are the most common ones and are defined with the
-'config' statement. Non-constant symbols consist entirely of alphanumeric
-characters or underscores.
-Constant symbols are only part of expressions. Constant symbols are
-always surrounded by single or double quotes. Within the quote, any
-other character is allowed and the quotes can be escaped using '\'.
-
-Menu structure
---------------
-
-The position of a menu entry in the tree is determined in two ways. First
-it can be specified explicitly::
-
-  menu "Network device support"
-	depends on NET
-
-  config NETDEVICES
-	...
-
-  endmenu
-
-All entries within the "menu" ... "endmenu" block become a submenu of
-"Network device support". All subentries inherit the dependencies from
-the menu entry, e.g. this means the dependency "NET" is added to the
-dependency list of the config option NETDEVICES.
-
-The other way to generate the menu structure is done by analyzing the
-dependencies. If a menu entry somehow depends on the previous entry, it
-can be made a submenu of it. First, the previous (parent) symbol must
-be part of the dependency list and then one of these two conditions
-must be true:
-
-- the child entry must become invisible, if the parent is set to 'n'
-- the child entry must only be visible, if the parent is visible::
-
-    config MODULES
-	bool "Enable loadable module support"
-
-    config MODVERSIONS
-	bool "Set version information on all module symbols"
-	depends on MODULES
-
-    comment "module support disabled"
-	depends on !MODULES
-
-MODVERSIONS directly depends on MODULES, this means it's only visible if
-MODULES is different from 'n'. The comment on the other hand is only
-visible when MODULES is set to 'n'.
-
-
-Kconfig syntax
---------------
-
-The configuration file describes a series of menu entries, where every
-line starts with a keyword (except help texts). The following keywords
-end a menu entry:
-
-- config
-- menuconfig
-- choice/endchoice
-- comment
-- menu/endmenu
-- if/endif
-- source
-
-The first five also start the definition of a menu entry.
-
-config::
-
-	"config" <symbol>
-	<config options>
-
-This defines a config symbol <symbol> and accepts any of above
-attributes as options.
-
-menuconfig::
-
-	"menuconfig" <symbol>
-	<config options>
-
-This is similar to the simple config entry above, but it also gives a
-hint to front ends, that all suboptions should be displayed as a
-separate list of options. To make sure all the suboptions will really
-show up under the menuconfig entry and not outside of it, every item
-from the <config options> list must depend on the menuconfig symbol.
-In practice, this is achieved by using one of the next two constructs::
-
-  (1):
-  menuconfig M
-  if M
-      config C1
-      config C2
-  endif
-
-  (2):
-  menuconfig M
-  config C1
-      depends on M
-  config C2
-      depends on M
-
-In the following examples (3) and (4), C1 and C2 still have the M
-dependency, but will not appear under menuconfig M anymore, because
-of C0, which doesn't depend on M::
-
-  (3):
-  menuconfig M
-      config C0
-  if M
-      config C1
-      config C2
-  endif
-
-  (4):
-  menuconfig M
-  config C0
-  config C1
-      depends on M
-  config C2
-      depends on M
-
-choices::
-
-	"choice" [symbol]
-	<choice options>
-	<choice block>
-	"endchoice"
-
-This defines a choice group and accepts any of the above attributes as
-options. A choice can only be of type bool or tristate.  If no type is
-specified for a choice, its type will be determined by the type of
-the first choice element in the group or remain unknown if none of the
-choice elements have a type specified, as well.
-
-While a boolean choice only allows a single config entry to be
-selected, a tristate choice also allows any number of config entries
-to be set to 'm'. This can be used if multiple drivers for a single
-hardware exists and only a single driver can be compiled/loaded into
-the kernel, but all drivers can be compiled as modules.
-
-A choice accepts another option "optional", which allows to set the
-choice to 'n' and no entry needs to be selected.
-If no [symbol] is associated with a choice, then you can not have multiple
-definitions of that choice. If a [symbol] is associated to the choice,
-then you may define the same choice (i.e. with the same entries) in another
-place.
-
-comment::
-
-	"comment" <prompt>
-	<comment options>
-
-This defines a comment which is displayed to the user during the
-configuration process and is also echoed to the output files. The only
-possible options are dependencies.
-
-menu::
-
-	"menu" <prompt>
-	<menu options>
-	<menu block>
-	"endmenu"
-
-This defines a menu block, see "Menu structure" above for more
-information. The only possible options are dependencies and "visible"
-attributes.
-
-if::
-
-	"if" <expr>
-	<if block>
-	"endif"
-
-This defines an if block. The dependency expression <expr> is appended
-to all enclosed menu entries.
-
-source::
-
-	"source" <prompt>
-
-This reads the specified configuration file. This file is always parsed.
-
-mainmenu::
-
-	"mainmenu" <prompt>
-
-This sets the config program's title bar if the config program chooses
-to use it. It should be placed at the top of the configuration, before any
-other statement.
-
-'#' Kconfig source file comment:
-
-An unquoted '#' character anywhere in a source file line indicates
-the beginning of a source file comment.  The remainder of that line
-is a comment.
-
-
-Kconfig hints
--------------
-This is a collection of Kconfig tips, most of which aren't obvious at
-first glance and most of which have become idioms in several Kconfig
-files.
-
-Adding common features and make the usage configurable
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-It is a common idiom to implement a feature/functionality that are
-relevant for some architectures but not all.
-The recommended way to do so is to use a config variable named HAVE_*
-that is defined in a common Kconfig file and selected by the relevant
-architectures.
-An example is the generic IOMAP functionality.
-
-We would in lib/Kconfig see::
-
-  # Generic IOMAP is used to ...
-  config HAVE_GENERIC_IOMAP
-
-  config GENERIC_IOMAP
-	depends on HAVE_GENERIC_IOMAP && FOO
-
-And in lib/Makefile we would see::
-
-	obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
-
-For each architecture using the generic IOMAP functionality we would see::
-
-  config X86
-	select ...
-	select HAVE_GENERIC_IOMAP
-	select ...
-
-Note: we use the existing config option and avoid creating a new
-config variable to select HAVE_GENERIC_IOMAP.
-
-Note: the use of the internal config variable HAVE_GENERIC_IOMAP, it is
-introduced to overcome the limitation of select which will force a
-config option to 'y' no matter the dependencies.
-The dependencies are moved to the symbol GENERIC_IOMAP and we avoid the
-situation where select forces a symbol equals to 'y'.
-
-Adding features that need compiler support
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-There are several features that need compiler support. The recommended way
-to describe the dependency on the compiler feature is to use "depends on"
-followed by a test macro::
-
-  config STACKPROTECTOR
-	bool "Stack Protector buffer overflow detection"
-	depends on $(cc-option,-fstack-protector)
-	...
-
-If you need to expose a compiler capability to makefiles and/or C source files,
-`CC_HAS_` is the recommended prefix for the config option::
-
-  config CC_HAS_STACKPROTECTOR_NONE
-	def_bool $(cc-option,-fno-stack-protector)
-
-Build as module only
-~~~~~~~~~~~~~~~~~~~~
-To restrict a component build to module-only, qualify its config symbol
-with "depends on m".  E.g.::
-
-  config FOO
-	depends on BAR && m
-
-limits FOO to module (=m) or disabled (=n).
-
-Kconfig recursive dependency limitations
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-If you've hit the Kconfig error: "recursive dependency detected" you've run
-into a recursive dependency issue with Kconfig, a recursive dependency can be
-summarized as a circular dependency. The kconfig tools need to ensure that
-Kconfig files comply with specified configuration requirements. In order to do
-that kconfig must determine the values that are possible for all Kconfig
-symbols, this is currently not possible if there is a circular relation
-between two or more Kconfig symbols. For more details refer to the "Simple
-Kconfig recursive issue" subsection below. Kconfig does not do recursive
-dependency resolution; this has a few implications for Kconfig file writers.
-We'll first explain why this issues exists and then provide an example
-technical limitation which this brings upon Kconfig developers. Eager
-developers wishing to try to address this limitation should read the next
-subsections.
-
-Simple Kconfig recursive issue
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Read: Documentation/kbuild/Kconfig.recursion-issue-01
-
-Test with::
-
-  make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-01 allnoconfig
-
-Cumulative Kconfig recursive issue
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Read: Documentation/kbuild/Kconfig.recursion-issue-02
-
-Test with::
-
-  make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
-
-Practical solutions to kconfig recursive issue
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Developers who run into the recursive Kconfig issue have two options
-at their disposal. We document them below and also provide a list of
-historical issues resolved through these different solutions.
-
-  a) Remove any superfluous "select FOO" or "depends on FOO"
-  b) Match dependency semantics:
-
-	b1) Swap all "select FOO" to "depends on FOO" or,
-
-	b2) Swap all "depends on FOO" to "select FOO"
-
-The resolution to a) can be tested with the sample Kconfig file
-Documentation/kbuild/Kconfig.recursion-issue-01 through the removal
-of the "select CORE" from CORE_BELL_A_ADVANCED as that is implicit already
-since CORE_BELL_A depends on CORE. At times it may not be possible to remove
-some dependency criteria, for such cases you can work with solution b).
-
-The two different resolutions for b) can be tested in the sample Kconfig file
-Documentation/kbuild/Kconfig.recursion-issue-02.
-
-Below is a list of examples of prior fixes for these types of recursive issues;
-all errors appear to involve one or more select's and one or more "depends on".
-
-============    ===================================
-commit          fix
-============    ===================================
-06b718c01208    select A -> depends on A
-c22eacfe82f9    depends on A -> depends on B
-6a91e854442c    select A -> depends on A
-118c565a8f2e    select A -> select B
-f004e5594705    select A -> depends on A
-c7861f37b4c6    depends on A -> (null)
-80c69915e5fb    select A -> (null)              (1)
-c2218e26c0d0    select A -> depends on A        (1)
-d6ae99d04e1c    select A -> depends on A
-95ca19cf8cbf    select A -> depends on A
-8f057d7bca54    depends on A -> (null)
-8f057d7bca54    depends on A -> select A
-a0701f04846e    select A -> depends on A
-0c8b92f7f259    depends on A -> (null)
-e4e9e0540928    select A -> depends on A        (2)
-7453ea886e87    depends on A > (null)           (1)
-7b1fff7e4fdf    select A -> depends on A
-86c747d2a4f0    select A -> depends on A
-d9f9ab51e55e    select A -> depends on A
-0c51a4d8abd6    depends on A -> select A        (3)
-e98062ed6dc4    select A -> depends on A        (3)
-91e5d284a7f1    select A -> (null)
-============    ===================================
-
-(1) Partial (or no) quote of error.
-(2) That seems to be the gist of that fix.
-(3) Same error.
-
-Future kconfig work
-~~~~~~~~~~~~~~~~~~~
-
-Work on kconfig is welcomed on both areas of clarifying semantics and on
-evaluating the use of a full SAT solver for it. A full SAT solver can be
-desirable to enable more complex dependency mappings and / or queries,
-for instance on possible use case for a SAT solver could be that of handling
-the current known recursive dependency issues. It is not known if this would
-address such issues but such evaluation is desirable. If support for a full SAT
-solver proves too complex or that it cannot address recursive dependency issues
-Kconfig should have at least clear and well defined semantics which also
-addresses and documents limitations or requirements such as the ones dealing
-with recursive dependencies.
-
-Further work on both of these areas is welcomed on Kconfig. We elaborate
-on both of these in the next two subsections.
-
-Semantics of Kconfig
-~~~~~~~~~~~~~~~~~~~~
-
-The use of Kconfig is broad, Linux is now only one of Kconfig's users:
-one study has completed a broad analysis of Kconfig use in 12 projects [0]_.
-Despite its widespread use, and although this document does a reasonable job
-in documenting basic Kconfig syntax a more precise definition of Kconfig
-semantics is welcomed. One project deduced Kconfig semantics through
-the use of the xconfig configurator [1]_. Work should be done to confirm if
-the deduced semantics matches our intended Kconfig design goals.
-
-Having well defined semantics can be useful for tools for practical
-evaluation of depenencies, for instance one such use known case was work to
-express in boolean abstraction of the inferred semantics of Kconfig to
-translate Kconfig logic into boolean formulas and run a SAT solver on this to
-find dead code / features (always inactive), 114 dead features were found in
-Linux using this methodology [1]_ (Section 8: Threats to validity).
-
-Confirming this could prove useful as Kconfig stands as one of the the leading
-industrial variability modeling languages [1]_ [2]_. Its study would help
-evaluate practical uses of such languages, their use was only theoretical
-and real world requirements were not well understood. As it stands though
-only reverse engineering techniques have been used to deduce semantics from
-variability modeling languages such as Kconfig [3]_.
-
-.. [0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
-.. [1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
-.. [2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
-.. [3] http://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
-
-Full SAT solver for Kconfig
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Although SAT solvers [4]_ haven't yet been used by Kconfig directly, as noted
-in the previous subsection, work has been done however to express in boolean
-abstraction the inferred semantics of Kconfig to translate Kconfig logic into
-boolean formulas and run a SAT solver on it [5]_. Another known related project
-is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
-has been introduced first with [9]_.  The basic concept of undertaker is to
-exract variability models from Kconfig, and put them together with a
-propositional formula extracted from CPP #ifdefs and build-rules into a SAT
-solver in order to find dead code, dead files, and dead symbols. If using a SAT
-solver is desirable on Kconfig one approach would be to evaluate repurposing
-such efforts somehow on Kconfig. There is enough interest from mentors of
-existing projects to not only help advise how to integrate this work upstream
-but also help maintain it long term. Interested developers should visit:
-
-http://kernelnewbies.org/KernelProjects/kconfig-sat
-
-.. [4] http://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
-.. [5] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
-.. [6] https://cados.cs.fau.de
-.. [7] https://vamos.cs.fau.de
-.. [8] https://undertaker.cs.fau.de
-.. [9] https://www4.cs.fau.de/Publications/2011/tartler_11_eurosys.pdf
diff --git a/docs/misc/kconfig-macro-language.rst b/docs/misc/kconfig-macro-language.rst
deleted file mode 100644
index 35b3263b7e40..000000000000
--- a/docs/misc/kconfig-macro-language.rst
+++ /dev/null
@@ -1,247 +0,0 @@
-======================
-Kconfig macro language
-======================
-
-Concept
--------
-
-The basic idea was inspired by Make. When we look at Make, we notice sort of
-two languages in one. One language describes dependency graphs consisting of
-targets and prerequisites. The other is a macro language for performing textual
-substitution.
-
-There is clear distinction between the two language stages. For example, you
-can write a makefile like follows::
-
-    APP := foo
-    SRC := foo.c
-    CC := gcc
-
-    $(APP): $(SRC)
-            $(CC) -o $(APP) $(SRC)
-
-The macro language replaces the variable references with their expanded form,
-and handles as if the source file were input like follows::
-
-    foo: foo.c
-            gcc -o foo foo.c
-
-Then, Make analyzes the dependency graph and determines the targets to be
-updated.
-
-The idea is quite similar in Kconfig - it is possible to describe a Kconfig
-file like this::
-
-    CC := gcc
-
-    config CC_HAS_FOO
-            def_bool $(shell, $(srctree)/scripts/gcc-check-foo.sh $(CC))
-
-The macro language in Kconfig processes the source file into the following
-intermediate::
-
-    config CC_HAS_FOO
-            def_bool y
-
-Then, Kconfig moves onto the evaluation stage to resolve inter-symbol
-dependency as explained in kconfig-language.txt.
-
-
-Variables
----------
-
-Like in Make, a variable in Kconfig works as a macro variable.  A macro
-variable is expanded "in place" to yield a text string that may then be
-expanded further. To get the value of a variable, enclose the variable name in
-$( ). The parentheses are required even for single-letter variable names; $X is
-a syntax error. The curly brace form as in ${CC} is not supported either.
-
-There are two types of variables: simply expanded variables and recursively
-expanded variables.
-
-A simply expanded variable is defined using the := assignment operator. Its
-righthand side is expanded immediately upon reading the line from the Kconfig
-file.
-
-A recursively expanded variable is defined using the = assignment operator.
-Its righthand side is simply stored as the value of the variable without
-expanding it in any way. Instead, the expansion is performed when the variable
-is used.
-
-There is another type of assignment operator; += is used to append text to a
-variable. The righthand side of += is expanded immediately if the lefthand
-side was originally defined as a simple variable. Otherwise, its evaluation is
-deferred.
-
-The variable reference can take parameters, in the following form::
-
-  $(name,arg1,arg2,arg3)
-
-You can consider the parameterized reference as a function. (more precisely,
-"user-defined function" in contrast to "built-in function" listed below).
-
-Useful functions must be expanded when they are used since the same function is
-expanded differently if different parameters are passed. Hence, a user-defined
-function is defined using the = assignment operator. The parameters are
-referenced within the body definition with $(1), $(2), etc.
-
-In fact, recursively expanded variables and user-defined functions are the same
-internally. (In other words, "variable" is "function with zero argument".)
-When we say "variable" in a broad sense, it includes "user-defined function".
-
-
-Built-in functions
-------------------
-
-Like Make, Kconfig provides several built-in functions. Every function takes a
-particular number of arguments.
-
-In Make, every built-in function takes at least one argument. Kconfig allows
-zero argument for built-in functions, such as $(fileno), $(lineno). You could
-consider those as "built-in variable", but it is just a matter of how we call
-it after all. Let's say "built-in function" here to refer to natively supported
-functionality.
-
-Kconfig currently supports the following built-in functions.
-
- - $(shell,command)
-
-  The "shell" function accepts a single argument that is expanded and passed
-  to a subshell for execution. The standard output of the command is then read
-  and returned as the value of the function. Every newline in the output is
-  replaced with a space. Any trailing newlines are deleted. The standard error
-  is not returned, nor is any program exit status.
-
- - $(info,text)
-
-  The "info" function takes a single argument and prints it to stdout.
-  It evaluates to an empty string.
-
- - $(warning-if,condition,text)
-
-  The "warning-if" function takes two arguments. If the condition part is "y",
-  the text part is sent to stderr. The text is prefixed with the name of the
-  current Kconfig file and the current line number.
-
- - $(error-if,condition,text)
-
-  The "error-if" function is similar to "warning-if", but it terminates the
-  parsing immediately if the condition part is "y".
-
- - $(filename)
-
-  The 'filename' takes no argument, and $(filename) is expanded to the file
-  name being parsed.
-
- - $(lineno)
-
-  The 'lineno' takes no argument, and $(lineno) is expanded to the line number
-  being parsed.
-
-
-Make vs Kconfig
----------------
-
-Kconfig adopts Make-like macro language, but the function call syntax is
-slightly different.
-
-A function call in Make looks like this::
-
-  $(func-name arg1,arg2,arg3)
-
-The function name and the first argument are separated by at least one
-whitespace. Then, leading whitespaces are trimmed from the first argument,
-while whitespaces in the other arguments are kept. You need to use a kind of
-trick to start the first parameter with spaces. For example, if you want
-to make "info" function print "  hello", you can write like follows::
-
-  empty :=
-  space := $(empty) $(empty)
-  $(info $(space)$(space)hello)
-
-Kconfig uses only commas for delimiters, and keeps all whitespaces in the
-function call. Some people prefer putting a space after each comma delimiter::
-
-  $(func-name, arg1, arg2, arg3)
-
-In this case, "func-name" will receive " arg1", " arg2", " arg3". The presence
-of leading spaces may matter depending on the function. The same applies to
-Make - for example, $(subst .c, .o, $(sources)) is a typical mistake; it
-replaces ".c" with " .o".
-
-In Make, a user-defined function is referenced by using a built-in function,
-'call', like this::
-
-    $(call my-func,arg1,arg2,arg3)
-
-Kconfig invokes user-defined functions and built-in functions in the same way.
-The omission of 'call' makes the syntax shorter.
-
-In Make, some functions treat commas verbatim instead of argument separators.
-For example, $(shell echo hello, world) runs the command "echo hello, world".
-Likewise, $(info hello, world) prints "hello, world" to stdout. You could say
-this is _useful_ inconsistency.
-
-In Kconfig, for simpler implementation and grammatical consistency, commas that
-appear in the $( ) context are always delimiters. It means::
-
-  $(shell, echo hello, world)
-
-is an error because it is passing two parameters where the 'shell' function
-accepts only one. To pass commas in arguments, you can use the following trick::
-
-  comma := ,
-  $(shell, echo hello$(comma) world)
-
-
-Caveats
--------
-
-A variable (or function) cannot be expanded across tokens. So, you cannot use
-a variable as a shorthand for an expression that consists of multiple tokens.
-The following works::
-
-    RANGE_MIN := 1
-    RANGE_MAX := 3
-
-    config FOO
-            int "foo"
-            range $(RANGE_MIN) $(RANGE_MAX)
-
-But, the following does not work::
-
-    RANGES := 1 3
-
-    config FOO
-            int "foo"
-            range $(RANGES)
-
-A variable cannot be expanded to any keyword in Kconfig.  The following does
-not work::
-
-    MY_TYPE := tristate
-
-    config FOO
-            $(MY_TYPE) "foo"
-            default y
-
-Obviously from the design, $(shell command) is expanded in the textual
-substitution phase. You cannot pass symbols to the 'shell' function.
-
-The following does not work as expected::
-
-    config ENDIAN_FLAG
-            string
-            default "-mbig-endian" if CPU_BIG_ENDIAN
-            default "-mlittle-endian" if CPU_LITTLE_ENDIAN
-
-    config CC_HAS_ENDIAN_FLAG
-            def_bool $(shell $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
-
-Instead, you can do like follows so that any function call is statically
-expanded::
-
-    config CC_HAS_ENDIAN_FLAG
-            bool
-            default $(shell $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
-            default $(shell $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
diff --git a/docs/misc/kconfig.rst b/docs/misc/kconfig.rst
deleted file mode 100644
index a9a855f894b3..000000000000
--- a/docs/misc/kconfig.rst
+++ /dev/null
@@ -1,304 +0,0 @@
-===================
-Kconfig make config
-===================
-
-This file contains some assistance for using `make *config`.
-
-Use "make help" to list all of the possible configuration targets.
-
-The xconfig ('qconf'), menuconfig ('mconf'), and nconfig ('nconf')
-programs also have embedded help text.  Be sure to check that for
-navigation, search, and other general help text.
-
-General
--------
-
-New kernel releases often introduce new config symbols.  Often more
-important, new kernel releases may rename config symbols.  When
-this happens, using a previously working .config file and running
-"make oldconfig" won't necessarily produce a working new kernel
-for you, so you may find that you need to see what NEW kernel
-symbols have been introduced.
-
-To see a list of new config symbols, use::
-
-	cp user/some/old.config .config
-	make listnewconfig
-
-and the config program will list any new symbols, one per line.
-
-Alternatively, you can use the brute force method::
-
-	make oldconfig
-	scripts/diffconfig .config.old .config | less
-
-----------------------------------------------------------------------
-
-Environment variables for `*config`
-
-KCONFIG_CONFIG
---------------
-This environment variable can be used to specify a default kernel config
-file name to override the default name of ".config".
-
-KCONFIG_OVERWRITECONFIG
------------------------
-If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
-break symlinks when .config is a symlink to somewhere else.
-
-`CONFIG_`
----------
-If you set `CONFIG_` in the environment, Kconfig will prefix all symbols
-with its value when saving the configuration, instead of using the default,
-`CONFIG_`.
-
-----------------------------------------------------------------------
-
-Environment variables for '{allyes/allmod/allno/rand}config'
-
-KCONFIG_ALLCONFIG
------------------
-(partially based on lkml email from/by Rob Landley, re: miniconfig)
-
---------------------------------------------------
-
-The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
-use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
-that contains config symbols that the user requires to be set to a
-specific value.  If KCONFIG_ALLCONFIG is used without a filename where
-KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", `make *config`
-checks for a file named "all{yes/mod/no/def/random}.config"
-(corresponding to the `*config` command that was used) for symbol values
-that are to be forced.  If this file is not found, it checks for a
-file named "all.config" to contain forced values.
-
-This enables you to create "miniature" config (miniconfig) or custom
-config files containing just the config symbols that you are interested
-in.  Then the kernel config system generates the full .config file,
-including symbols of your miniconfig file.
-
-This 'KCONFIG_ALLCONFIG' file is a config file which contains
-(usually a subset of all) preset config symbols.  These variable
-settings are still subject to normal dependency checks.
-
-Examples::
-
-	KCONFIG_ALLCONFIG=custom-notebook.config make allnoconfig
-
-or::
-
-	KCONFIG_ALLCONFIG=mini.config make allnoconfig
-
-or::
-
-	make KCONFIG_ALLCONFIG=mini.config allnoconfig
-
-These examples will disable most options (allnoconfig) but enable or
-disable the options that are explicitly listed in the specified
-mini-config files.
-
-----------------------------------------------------------------------
-
-Environment variables for 'randconfig'
-
-KCONFIG_SEED
-------------
-You can set this to the integer value used to seed the RNG, if you want
-to somehow debug the behaviour of the kconfig parser/frontends.
-If not set, the current time will be used.
-
-KCONFIG_PROBABILITY
--------------------
-This variable can be used to skew the probabilities. This variable can
-be unset or empty, or set to three different formats:
-
-    =======================     ==================  =====================
-	KCONFIG_PROBABILITY     y:n split           y:m:n split
-    =======================     ==================  =====================
-	unset or empty          50  : 50            33  : 33  : 34
-	N                        N  : 100-N         N/2 : N/2 : 100-N
-    [1] N:M                     N+M : 100-(N+M)      N  :  M  : 100-(N+M)
-    [2] N:M:L                    N  : 100-N          M  :  L  : 100-(M+L)
-    =======================     ==================  =====================
-
-where N, M and L are integers (in base 10) in the range [0,100], and so
-that:
-
-    [1] N+M is in the range [0,100]
-
-    [2] M+L is in the range [0,100]
-
-Examples::
-
-	KCONFIG_PROBABILITY=10
-		10% of booleans will be set to 'y', 90% to 'n'
-		5% of tristates will be set to 'y', 5% to 'm', 90% to 'n'
-	KCONFIG_PROBABILITY=15:25
-		40% of booleans will be set to 'y', 60% to 'n'
-		15% of tristates will be set to 'y', 25% to 'm', 60% to 'n'
-	KCONFIG_PROBABILITY=10:15:15
-		10% of booleans will be set to 'y', 90% to 'n'
-		15% of tristates will be set to 'y', 15% to 'm', 70% to 'n'
-
-----------------------------------------------------------------------
-
-Environment variables for 'syncconfig'
-
-KCONFIG_NOSILENTUPDATE
-----------------------
-If this variable has a non-blank value, it prevents silent kernel
-config updates (requires explicit updates).
-
-KCONFIG_AUTOCONFIG
-------------------
-This environment variable can be set to specify the path & name of the
-"auto.conf" file.  Its default value is "include/config/auto.conf".
-
-KCONFIG_TRISTATE
-----------------
-This environment variable can be set to specify the path & name of the
-"tristate.conf" file.  Its default value is "include/config/tristate.conf".
-
-KCONFIG_AUTOHEADER
-------------------
-This environment variable can be set to specify the path & name of the
-"autoconf.h" (header) file.
-Its default value is "include/generated/autoconf.h".
-
-
-----------------------------------------------------------------------
-
-menuconfig
-----------
-
-SEARCHING for CONFIG symbols
-
-Searching in menuconfig:
-
-	The Search function searches for kernel configuration symbol
-	names, so you have to know something close to what you are
-	looking for.
-
-	Example::
-
-		/hotplug
-		This lists all config symbols that contain "hotplug",
-		e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
-
-	For search help, enter / followed by TAB-TAB (to highlight
-	<Help>) and Enter.  This will tell you that you can also use
-	regular expressions (regexes) in the search string, so if you
-	are not interested in MEMORY_HOTPLUG, you could try::
-
-		/^hotplug
-
-	When searching, symbols are sorted thus:
-
-	  - first, exact matches, sorted alphabetically (an exact match
-	    is when the search matches the complete symbol name);
-	  - then, other matches, sorted alphabetically.
-
-	For example: ^ATH.K matches:
-
-	    ATH5K ATH9K ATH5K_AHB ATH5K_DEBUG [...] ATH6KL ATH6KL_DEBUG
-	    [...] ATH9K_AHB ATH9K_BTCOEX_SUPPORT ATH9K_COMMON [...]
-
-	of which only ATH5K and ATH9K match exactly and so are sorted
-	first (and in alphabetical order), then come all other symbols,
-	sorted in alphabetical order.
-
-----------------------------------------------------------------------
-
-User interface options for 'menuconfig'
-
-MENUCONFIG_COLOR
-----------------
-It is possible to select different color themes using the variable
-MENUCONFIG_COLOR.  To select a theme use::
-
-	make MENUCONFIG_COLOR=<theme> menuconfig
-
-Available themes are::
-
-  - mono       => selects colors suitable for monochrome displays
-  - blackbg    => selects a color scheme with black background
-  - classic    => theme with blue background. The classic look
-  - bluetitle  => a LCD friendly version of classic. (default)
-
-MENUCONFIG_MODE
----------------
-This mode shows all sub-menus in one large tree.
-
-Example::
-
-	make MENUCONFIG_MODE=single_menu menuconfig
-
-----------------------------------------------------------------------
-
-nconfig
--------
-
-nconfig is an alternate text-based configurator.  It lists function
-keys across the bottom of the terminal (window) that execute commands.
-You can also just use the corresponding numeric key to execute the
-commands unless you are in a data entry window.  E.g., instead of F6
-for Save, you can just press 6.
-
-Use F1 for Global help or F3 for the Short help menu.
-
-Searching in nconfig:
-
-	You can search either in the menu entry "prompt" strings
-	or in the configuration symbols.
-
-	Use / to begin a search through the menu entries.  This does
-	not support regular expressions.  Use <Down> or <Up> for
-	Next hit and Previous hit, respectively.  Use <Esc> to
-	terminate the search mode.
-
-	F8 (SymSearch) searches the configuration symbols for the
-	given string or regular expression (regex).
-
-NCONFIG_MODE
-------------
-This mode shows all sub-menus in one large tree.
-
-Example::
-
-	make NCONFIG_MODE=single_menu nconfig
-
-----------------------------------------------------------------------
-
-xconfig
--------
-
-Searching in xconfig:
-
-	The Search function searches for kernel configuration symbol
-	names, so you have to know something close to what you are
-	looking for.
-
-	Example::
-
-		Ctrl-F hotplug
-
-	or::
-
-		Menu: File, Search, hotplug
-
-	lists all config symbol entries that contain "hotplug" in
-	the symbol name.  In this Search dialog, you may change the
-	config setting for any of the entries that are not grayed out.
-	You can also enter a different search string without having
-	to return to the main menu.
-
-
-----------------------------------------------------------------------
-
-gconfig
--------
-
-Searching in gconfig:
-
-	There is no search command in gconfig.  However, gconfig does
-	have several different viewing choices, modes, and options.

base-commit: bede1c7e3b790b63f1ff3ea3ee4e476b012fdf2c
prerequisite-patch-id: 65087f848e44cfae78c8d15c68443b09d74c8368
-- 
2.30.2


