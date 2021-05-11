Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CA37ADCF
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125892.236967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWlz-0000Ch-Ok; Tue, 11 May 2021 18:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125892.236967; Tue, 11 May 2021 18:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWlz-00009Q-Kw; Tue, 11 May 2021 18:06:23 +0000
Received: by outflank-mailman (input) for mailman id 125892;
 Tue, 11 May 2021 18:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWlx-00009J-Vf
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:06:22 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55f34bf5-a458-496e-ad07-354cfd91063e;
 Tue, 11 May 2021 18:06:18 +0000 (UTC)
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
X-Inumbo-ID: 55f34bf5-a458-496e-ad07-354cfd91063e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uJd4x9Vaptn0QmvchrvWDGpAcSY3yfuBcsn4eM0qSh0=;
  b=VHhQvcoTcD6iglWFLz2BS39dd4T5/avM/FL6hyowanSDJN2BhrajmPsq
   t1vv0wV7Q36r7X7/CyWeiTXjbVuSGvyv9L+HIeZSi5dhim9PsPeyPXZOo
   S77F56o9yoO77eHe0b6RYWYPRZ5k50zaqqgB9GM3KuJNKGBD67vdi4Ktd
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YFUYZh+m3L1S8X5zYi6aGBQh6NuXo18mJkuRCCTbNIFUFSX9vSRZb8pcDSDX2HouicW8NkQOKO
 MQespezWxp2kTMV0Q+MuwAbbZOqsZp771vzREGT6X89HzxW6Z3uVsNfaRbllqDYHhLIbJ+P9MP
 QG6KjgvggHCx4BdRTiipVmNncqcgIcJQPMYob88+RMScXpho45U4POPa1GP8YqULD0LyGjDLBq
 6tdVCd4lA64Dcq3xZJBGvwGek5dyHGlpsHuO6XlSGVPsDXKdb74U9JiQC/44U11g49LjQ9Wdjh
 +fs=
X-SBRS: 5.1
X-MesageID: 43579190
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QgHJ0aPseGlvT8BcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43579190"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v2 00/17] live update and gnttab patches
Date: Tue, 11 May 2021 19:05:13 +0100
Message-ID: <cover.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These patches have been posted previously.
The gnttab patches (tools/ocaml/libs/mmap) were not applied at the time
to avoid conflicts with an in-progress XSA.
The binary format live-update and fuzzing patches were not applied
because it was too close to the next Xen release freeze.

The patches depend on each-other: live-update only works correctly when the gnttab
patches are taken too (MFN is not part of the binary live-update stream),
so they are included here as a single series.
The gnttab patches replaces one use of libxenctrl with stable interfaces, leaving one unstable
libxenctrl interface used by oxenstored.

The 'vendor external dependencies' may be optional, it is useful to be part
of a patchqueue in a specfile so that you can build everything without external dependencies,
but might as well commit it so everyone has it easily available not just XenServer.

Note that the live-update fuzz test doesn't yet pass, it is still able to find bugs.
However the reduced version with a fixed seed used as a unit test does pass,
so it is useful to have it committed, and further improvements can be made later
as more bugs are discovered and fixed.

Edwin Török (17):
  docs/designs/xenstore-migration.md: clarify that deletes are recursive
  tools/ocaml: add unit test skeleton with Dune build system
  tools/ocaml: vendor external dependencies for convenience
  tools/ocaml/xenstored: implement the live migration binary format
  tools/ocaml/xenstored: add binary dump format support
  tools/ocaml/xenstored: add support for binary format
  tools/ocaml/xenstored: validate config file before live update
  Add structured fuzzing unit test
  tools/ocaml: use common macros for manipulating mmap_interface
  tools/ocaml/libs/mmap: allocate correct number of bytes
  tools/ocaml/libs/mmap: Expose stub_mmap_alloc
  tools/ocaml/libs/mmap: mark mmap/munmap as blocking
  tools/ocaml/libs/xb: import gnttab stubs from mirage
  tools/ocaml: safer Xenmmap interface
  tools/ocaml/xenstored: use gnttab instead of xenctrl's
    foreign_map_range
  tools/ocaml/xenstored: don't store domU's mfn of ring page
  tools/ocaml/libs/mmap: Clean up unused read/write

 docs/designs/xenstore-migration.md            |    3 +-
 tools/ocaml/.gitignore                        |    2 +
 tools/ocaml/Makefile                          |   53 +
 tools/ocaml/dune-project                      |    5 +
 tools/ocaml/duniverse/cmdliner/.gitignore     |   10 +
 tools/ocaml/duniverse/cmdliner/.ocp-indent    |    1 +
 tools/ocaml/duniverse/cmdliner/B0.ml          |    9 +
 tools/ocaml/duniverse/cmdliner/CHANGES.md     |  255 +++
 tools/ocaml/duniverse/cmdliner/LICENSE.md     |   13 +
 tools/ocaml/duniverse/cmdliner/Makefile       |   77 +
 tools/ocaml/duniverse/cmdliner/README.md      |   51 +
 tools/ocaml/duniverse/cmdliner/_tags          |    3 +
 tools/ocaml/duniverse/cmdliner/build.ml       |  155 ++
 tools/ocaml/duniverse/cmdliner/cmdliner.opam  |   32 +
 tools/ocaml/duniverse/cmdliner/doc/api.odocl  |    1 +
 tools/ocaml/duniverse/cmdliner/dune-project   |    2 +
 tools/ocaml/duniverse/cmdliner/pkg/META       |    7 +
 tools/ocaml/duniverse/cmdliner/pkg/pkg.ml     |   33 +
 .../ocaml/duniverse/cmdliner/src/cmdliner.ml  |  309 ++++
 .../ocaml/duniverse/cmdliner/src/cmdliner.mli | 1624 +++++++++++++++++
 .../duniverse/cmdliner/src/cmdliner.mllib     |   11 +
 .../duniverse/cmdliner/src/cmdliner_arg.ml    |  356 ++++
 .../duniverse/cmdliner/src/cmdliner_arg.mli   |  111 ++
 .../duniverse/cmdliner/src/cmdliner_base.ml   |  302 +++
 .../duniverse/cmdliner/src/cmdliner_base.mli  |   68 +
 .../duniverse/cmdliner/src/cmdliner_cline.ml  |  199 ++
 .../duniverse/cmdliner/src/cmdliner_cline.mli |   34 +
 .../duniverse/cmdliner/src/cmdliner_docgen.ml |  352 ++++
 .../cmdliner/src/cmdliner_docgen.mli          |   30 +
 .../duniverse/cmdliner/src/cmdliner_info.ml   |  233 +++
 .../duniverse/cmdliner/src/cmdliner_info.mli  |  140 ++
 .../cmdliner/src/cmdliner_manpage.ml          |  502 +++++
 .../cmdliner/src/cmdliner_manpage.mli         |  100 +
 .../duniverse/cmdliner/src/cmdliner_msg.ml    |  116 ++
 .../duniverse/cmdliner/src/cmdliner_msg.mli   |   56 +
 .../cmdliner/src/cmdliner_suggest.ml          |   54 +
 .../cmdliner/src/cmdliner_suggest.mli         |   25 +
 .../duniverse/cmdliner/src/cmdliner_term.ml   |   41 +
 .../duniverse/cmdliner/src/cmdliner_term.mli  |   40 +
 .../duniverse/cmdliner/src/cmdliner_trie.ml   |   97 +
 .../duniverse/cmdliner/src/cmdliner_trie.mli  |   35 +
 tools/ocaml/duniverse/cmdliner/src/dune       |    4 +
 tools/ocaml/duniverse/cmdliner/test/chorus.ml |   31 +
 tools/ocaml/duniverse/cmdliner/test/cp_ex.ml  |   54 +
 .../ocaml/duniverse/cmdliner/test/darcs_ex.ml |  149 ++
 tools/ocaml/duniverse/cmdliner/test/dune      |   12 +
 tools/ocaml/duniverse/cmdliner/test/revolt.ml |    9 +
 tools/ocaml/duniverse/cmdliner/test/rm_ex.ml  |   53 +
 .../ocaml/duniverse/cmdliner/test/tail_ex.ml  |   73 +
 .../ocaml/duniverse/cmdliner/test/test_man.ml |  100 +
 .../duniverse/cmdliner/test/test_man_utf8.ml  |   11 +
 .../duniverse/cmdliner/test/test_opt_req.ml   |   13 +
 .../ocaml/duniverse/cmdliner/test/test_pos.ml |   13 +
 .../duniverse/cmdliner/test/test_pos_all.ml   |   11 +
 .../duniverse/cmdliner/test/test_pos_left.ml  |   11 +
 .../duniverse/cmdliner/test/test_pos_req.ml   |   15 +
 .../duniverse/cmdliner/test/test_pos_rev.ml   |   14 +
 .../duniverse/cmdliner/test/test_term_dups.ml |   19 +
 .../cmdliner/test/test_with_used_args.ml      |   18 +
 tools/ocaml/duniverse/cppo/.gitignore         |    5 +
 tools/ocaml/duniverse/cppo/.ocp-indent        |   22 +
 tools/ocaml/duniverse/cppo/.travis.yml        |   16 +
 tools/ocaml/duniverse/cppo/CODEOWNERS         |    8 +
 tools/ocaml/duniverse/cppo/Changes            |   85 +
 tools/ocaml/duniverse/cppo/INSTALL.md         |   17 +
 tools/ocaml/duniverse/cppo/LICENSE.md         |   24 +
 tools/ocaml/duniverse/cppo/Makefile           |   18 +
 tools/ocaml/duniverse/cppo/README.md          |  521 ++++++
 tools/ocaml/duniverse/cppo/VERSION            |    1 +
 tools/ocaml/duniverse/cppo/appveyor.yml       |   14 +
 tools/ocaml/duniverse/cppo/cppo.opam          |   31 +
 .../ocaml/duniverse/cppo/cppo_ocamlbuild.opam |   27 +
 tools/ocaml/duniverse/cppo/dune-project       |    3 +
 tools/ocaml/duniverse/cppo/examples/Makefile  |    8 +
 tools/ocaml/duniverse/cppo/examples/debug.ml  |    7 +
 tools/ocaml/duniverse/cppo/examples/dune      |   32 +
 tools/ocaml/duniverse/cppo/examples/french.ml |   34 +
 tools/ocaml/duniverse/cppo/examples/lexer.mll |    9 +
 .../duniverse/cppo/ocamlbuild_plugin/_tags    |    1 +
 .../duniverse/cppo/ocamlbuild_plugin/dune     |    6 +
 .../cppo/ocamlbuild_plugin/ocamlbuild_cppo.ml |   35 +
 .../ocamlbuild_plugin/ocamlbuild_cppo.mli     |    9 +
 tools/ocaml/duniverse/cppo/src/compat.ml      |    7 +
 .../ocaml/duniverse/cppo/src/cppo_command.ml  |   63 +
 .../ocaml/duniverse/cppo/src/cppo_command.mli |   11 +
 tools/ocaml/duniverse/cppo/src/cppo_eval.ml   |  697 +++++++
 tools/ocaml/duniverse/cppo/src/cppo_eval.mli  |   29 +
 tools/ocaml/duniverse/cppo/src/cppo_lexer.mll |  721 ++++++++
 tools/ocaml/duniverse/cppo/src/cppo_main.ml   |  230 +++
 .../ocaml/duniverse/cppo/src/cppo_parser.mly  |  266 +++
 tools/ocaml/duniverse/cppo/src/cppo_types.ml  |   98 +
 tools/ocaml/duniverse/cppo/src/cppo_types.mli |   70 +
 .../ocaml/duniverse/cppo/src/cppo_version.mli |    1 +
 tools/ocaml/duniverse/cppo/src/dune           |   21 +
 tools/ocaml/duniverse/cppo/test/capital.cppo  |    6 +
 tools/ocaml/duniverse/cppo/test/capital.ref   |    6 +
 tools/ocaml/duniverse/cppo/test/comments.cppo |    7 +
 tools/ocaml/duniverse/cppo/test/comments.ref  |    8 +
 tools/ocaml/duniverse/cppo/test/cond.cppo     |   47 +
 tools/ocaml/duniverse/cppo/test/cond.ref      |   17 +
 tools/ocaml/duniverse/cppo/test/dune          |  130 ++
 tools/ocaml/duniverse/cppo/test/ext.cppo      |   10 +
 tools/ocaml/duniverse/cppo/test/ext.ref       |   28 +
 tools/ocaml/duniverse/cppo/test/incl.cppo     |    3 +
 tools/ocaml/duniverse/cppo/test/incl2.cppo    |    1 +
 tools/ocaml/duniverse/cppo/test/loc.cppo      |    8 +
 tools/ocaml/duniverse/cppo/test/loc.ref       |   21 +
 .../ocaml/duniverse/cppo/test/paren_arg.cppo  |    3 +
 tools/ocaml/duniverse/cppo/test/paren_arg.ref |    4 +
 tools/ocaml/duniverse/cppo/test/source.sh     |   13 +
 tools/ocaml/duniverse/cppo/test/test.cppo     |  144 ++
 tools/ocaml/duniverse/cppo/test/tuple.cppo    |   38 +
 tools/ocaml/duniverse/cppo/test/tuple.ref     |   20 +
 .../ocaml/duniverse/cppo/test/unmatched.cppo  |   14 +
 tools/ocaml/duniverse/cppo/test/unmatched.ref |   15 +
 tools/ocaml/duniverse/cppo/test/version.cppo  |   30 +
 tools/ocaml/duniverse/crowbar/.gitignore      |    5 +
 tools/ocaml/duniverse/crowbar/CHANGES.md      |    9 +
 tools/ocaml/duniverse/crowbar/LICENSE.md      |    8 +
 tools/ocaml/duniverse/crowbar/README.md       |   82 +
 tools/ocaml/duniverse/crowbar/crowbar.opam    |   33 +
 tools/ocaml/duniverse/crowbar/dune            |    1 +
 tools/ocaml/duniverse/crowbar/dune-project    |    2 +
 .../duniverse/crowbar/examples/.gitignore     |    1 +
 .../duniverse/crowbar/examples/calendar/dune  |    3 +
 .../examples/calendar/test_calendar.ml        |   29 +
 .../duniverse/crowbar/examples/fpath/dune     |    4 +
 .../crowbar/examples/fpath/test_fpath.ml      |   18 +
 .../duniverse/crowbar/examples/input/testcase |    1 +
 .../ocaml/duniverse/crowbar/examples/map/dune |    3 +
 .../crowbar/examples/map/test_map.ml          |   47 +
 .../duniverse/crowbar/examples/pprint/dune    |    3 +
 .../crowbar/examples/pprint/test_pprint.ml    |   39 +
 .../crowbar/examples/serializer/dune          |    3 +
 .../crowbar/examples/serializer/serializer.ml |   34 +
 .../examples/serializer/test_serializer.ml    |   47 +
 .../duniverse/crowbar/examples/uunf/dune      |    3 +
 .../crowbar/examples/uunf/test_uunf.ml        |   75 +
 .../duniverse/crowbar/examples/xmldiff/dune   |    3 +
 .../crowbar/examples/xmldiff/test_xmldiff.ml  |   42 +
 tools/ocaml/duniverse/crowbar/src/crowbar.ml  |  582 ++++++
 tools/ocaml/duniverse/crowbar/src/crowbar.mli |  251 +++
 tools/ocaml/duniverse/crowbar/src/dune        |    3 +
 tools/ocaml/duniverse/crowbar/src/todo        |   16 +
 tools/ocaml/duniverse/csexp/CHANGES.md        |   45 +
 tools/ocaml/duniverse/csexp/LICENSE.md        |   21 +
 tools/ocaml/duniverse/csexp/Makefile          |   23 +
 tools/ocaml/duniverse/csexp/README.md         |   33 +
 .../duniverse/csexp/bench/csexp_bench.ml      |   22 +
 tools/ocaml/duniverse/csexp/bench/dune        |   11 +
 tools/ocaml/duniverse/csexp/bench/main.ml     |    1 +
 tools/ocaml/duniverse/csexp/bench/runner.sh   |    4 +
 tools/ocaml/duniverse/csexp/csexp.opam        |   51 +
 .../ocaml/duniverse/csexp/csexp.opam.template |   14 +
 tools/ocaml/duniverse/csexp/dune-project      |   42 +
 .../ocaml/duniverse/csexp/dune-workspace.dev  |    6 +
 tools/ocaml/duniverse/csexp/src/csexp.ml      |  333 ++++
 tools/ocaml/duniverse/csexp/src/csexp.mli     |  369 ++++
 tools/ocaml/duniverse/csexp/src/dune          |    3 +
 tools/ocaml/duniverse/csexp/test/dune         |    6 +
 tools/ocaml/duniverse/csexp/test/test.ml      |  142 ++
 tools/ocaml/duniverse/dune                    |    4 +
 tools/ocaml/duniverse/fmt/.gitignore          |    8 +
 tools/ocaml/duniverse/fmt/.ocp-indent         |    1 +
 tools/ocaml/duniverse/fmt/CHANGES.md          |   98 +
 tools/ocaml/duniverse/fmt/LICENSE.md          |   13 +
 tools/ocaml/duniverse/fmt/README.md           |   35 +
 tools/ocaml/duniverse/fmt/_tags               |    7 +
 tools/ocaml/duniverse/fmt/doc/api.odocl       |    3 +
 tools/ocaml/duniverse/fmt/doc/index.mld       |   11 +
 tools/ocaml/duniverse/fmt/dune-project        |    2 +
 tools/ocaml/duniverse/fmt/fmt.opam            |   35 +
 tools/ocaml/duniverse/fmt/pkg/META            |   40 +
 tools/ocaml/duniverse/fmt/pkg/pkg.ml          |   18 +
 tools/ocaml/duniverse/fmt/src/dune            |   30 +
 tools/ocaml/duniverse/fmt/src/fmt.ml          |  787 ++++++++
 tools/ocaml/duniverse/fmt/src/fmt.mli         |  689 +++++++
 tools/ocaml/duniverse/fmt/src/fmt.mllib       |    1 +
 tools/ocaml/duniverse/fmt/src/fmt_cli.ml      |   32 +
 tools/ocaml/duniverse/fmt/src/fmt_cli.mli     |   45 +
 tools/ocaml/duniverse/fmt/src/fmt_cli.mllib   |    1 +
 tools/ocaml/duniverse/fmt/src/fmt_top.ml      |   23 +
 tools/ocaml/duniverse/fmt/src/fmt_top.mllib   |    1 +
 tools/ocaml/duniverse/fmt/src/fmt_tty.ml      |   78 +
 tools/ocaml/duniverse/fmt/src/fmt_tty.mli     |   50 +
 tools/ocaml/duniverse/fmt/src/fmt_tty.mllib   |    1 +
 .../duniverse/fmt/src/fmt_tty_top_init.ml     |   23 +
 tools/ocaml/duniverse/fmt/test/test.ml        |  322 ++++
 .../duniverse/ocaml-afl-persistent/.gitignore |    2 +
 .../duniverse/ocaml-afl-persistent/CHANGES.md |   22 +
 .../duniverse/ocaml-afl-persistent/LICENSE.md |    8 +
 .../duniverse/ocaml-afl-persistent/README.md  |   17 +
 .../ocaml-afl-persistent/afl-persistent.opam  |   49 +
 .../afl-persistent.opam.template              |   16 +
 .../aflPersistent.available.ml                |   21 +
 .../ocaml-afl-persistent/aflPersistent.mli    |    1 +
 .../aflPersistent.stub.ml                     |    1 +
 .../duniverse/ocaml-afl-persistent/detect.sh  |   43 +
 .../ocaml/duniverse/ocaml-afl-persistent/dune |   20 +
 .../ocaml-afl-persistent/dune-project         |   23 +
 .../duniverse/ocaml-afl-persistent/test.ml    |    3 +
 .../ocaml-afl-persistent/test/harness.ml      |   22 +
 .../ocaml-afl-persistent/test/test.ml         |   73 +
 .../ocaml-afl-persistent/test/test.sh         |   33 +
 .../ocaml/duniverse/ocplib-endian/.gitignore  |    3 +
 .../ocaml/duniverse/ocplib-endian/.travis.yml |   19 +
 .../ocaml/duniverse/ocplib-endian/CHANGES.md  |   55 +
 .../ocaml/duniverse/ocplib-endian/COPYING.txt |  521 ++++++
 tools/ocaml/duniverse/ocplib-endian/Makefile  |   13 +
 tools/ocaml/duniverse/ocplib-endian/README.md |   16 +
 .../duniverse/ocplib-endian/dune-project      |    2 +
 .../ocplib-endian/ocplib-endian.opam          |   30 +
 .../ocplib-endian/src/be_ocaml_401.ml         |   32 +
 .../duniverse/ocplib-endian/src/common.ml     |   24 +
 .../ocplib-endian/src/common_401.cppo.ml      |  100 +
 .../ocplib-endian/src/common_float.ml         |    5 +
 tools/ocaml/duniverse/ocplib-endian/src/dune  |   75 +
 .../ocplib-endian/src/endianBigstring.cppo.ml |  112 ++
 .../src/endianBigstring.cppo.mli              |  128 ++
 .../ocplib-endian/src/endianBytes.cppo.ml     |  130 ++
 .../ocplib-endian/src/endianBytes.cppo.mli    |  124 ++
 .../ocplib-endian/src/endianString.cppo.ml    |  118 ++
 .../ocplib-endian/src/endianString.cppo.mli   |  121 ++
 .../ocplib-endian/src/le_ocaml_401.ml         |   32 +
 .../ocplib-endian/src/ne_ocaml_401.ml         |   20 +
 .../duniverse/ocplib-endian/tests/bench.ml    |  436 +++++
 .../ocaml/duniverse/ocplib-endian/tests/dune  |   35 +
 .../duniverse/ocplib-endian/tests/test.ml     |   39 +
 .../tests/test_bigstring.cppo.ml              |  191 ++
 .../ocplib-endian/tests/test_bytes.cppo.ml    |  185 ++
 .../ocplib-endian/tests/test_string.cppo.ml   |  185 ++
 tools/ocaml/duniverse/result/CHANGES.md       |   15 +
 tools/ocaml/duniverse/result/LICENSE.md       |   24 +
 tools/ocaml/duniverse/result/Makefile         |   17 +
 tools/ocaml/duniverse/result/README.md        |    5 +
 tools/ocaml/duniverse/result/dune             |   12 +
 tools/ocaml/duniverse/result/dune-project     |    3 +
 .../duniverse/result/result-as-alias-4.08.ml  |    2 +
 .../ocaml/duniverse/result/result-as-alias.ml |    2 +
 .../duniverse/result/result-as-newtype.ml     |    2 +
 tools/ocaml/duniverse/result/result.opam      |   18 +
 tools/ocaml/duniverse/result/which_result.ml  |   14 +
 tools/ocaml/duniverse/stdlib-shims/CHANGES.md |    5 +
 tools/ocaml/duniverse/stdlib-shims/LICENSE    |  203 +++
 tools/ocaml/duniverse/stdlib-shims/README.md  |    2 +
 .../ocaml/duniverse/stdlib-shims/dune-project |    1 +
 .../duniverse/stdlib-shims/dune-workspace.dev |   14 +
 tools/ocaml/duniverse/stdlib-shims/src/dune   |   97 +
 .../duniverse/stdlib-shims/stdlib-shims.opam  |   24 +
 tools/ocaml/duniverse/stdlib-shims/test/dune  |    3 +
 .../ocaml/duniverse/stdlib-shims/test/test.ml |    2 +
 tools/ocaml/libs/eventchn/dune                |    8 +
 tools/ocaml/libs/mmap/Makefile                |   19 +-
 tools/ocaml/libs/mmap/dune                    |   18 +
 tools/ocaml/libs/mmap/gnt.ml                  |   62 +
 tools/ocaml/libs/mmap/gnt.mli                 |   87 +
 tools/ocaml/libs/mmap/gnttab_stubs.c          |  106 ++
 tools/ocaml/libs/mmap/mmap_stubs.h            |   11 +-
 tools/ocaml/libs/mmap/xenmmap.ml              |   17 +-
 tools/ocaml/libs/mmap/xenmmap.mli             |   13 +-
 tools/ocaml/libs/mmap/xenmmap_stubs.c         |   86 +-
 tools/ocaml/libs/xb/dune                      |    7 +
 tools/ocaml/libs/xb/xb.ml                     |   10 +-
 tools/ocaml/libs/xb/xb.mli                    |    4 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c           |   14 +-
 tools/ocaml/libs/xc/dune                      |    9 +
 tools/ocaml/libs/xc/xenctrl.ml                |    6 +-
 tools/ocaml/libs/xc/xenctrl.mli               |    5 +-
 tools/ocaml/libs/xs/dune                      |    4 +
 tools/ocaml/xen.opam                          |    1 +
 tools/ocaml/xen.opam.locked                   |  119 ++
 tools/ocaml/xenstore.opam                     |    1 +
 tools/ocaml/xenstored.opam                    |   21 +
 tools/ocaml/xenstored/Makefile                |    4 +-
 tools/ocaml/xenstored/connection.ml           |   63 +-
 tools/ocaml/xenstored/disk.ml                 |  319 ++++
 tools/ocaml/xenstored/domain.ml               |    9 +-
 tools/ocaml/xenstored/domains.ml              |   13 +-
 tools/ocaml/xenstored/dune                    |   19 +
 tools/ocaml/xenstored/parse_arg.ml            |    6 +-
 tools/ocaml/xenstored/perms.ml                |    2 +
 tools/ocaml/xenstored/poll.ml                 |    3 +-
 tools/ocaml/xenstored/process.ml              |   30 +-
 tools/ocaml/xenstored/store.ml                |    1 +
 tools/ocaml/xenstored/test/dune               |   23 +
 tools/ocaml/xenstored/test/generator.ml       |  189 ++
 tools/ocaml/xenstored/test/gnt.ml             |   52 +
 tools/ocaml/xenstored/test/model.ml           |  253 +++
 tools/ocaml/xenstored/test/old/arbitrary.ml   |  261 +++
 tools/ocaml/xenstored/test/old/gen_paths.ml   |   66 +
 .../xenstored/test/old/xenstored_test.ml      |  527 ++++++
 tools/ocaml/xenstored/test/pathtree.ml        |   40 +
 tools/ocaml/xenstored/test/testable.ml        |  380 ++++
 tools/ocaml/xenstored/test/types.ml           |  437 +++++
 .../xenmmap.mli => xenstored/test/xenctrl.ml} |   40 +-
 tools/ocaml/xenstored/test/xeneventchn.ml     |   50 +
 tools/ocaml/xenstored/test/xenstored_test.ml  |  147 ++
 tools/ocaml/xenstored/test/xs_protocol.ml     |  733 ++++++++
 tools/ocaml/xenstored/transaction.ml          |  119 +-
 tools/ocaml/xenstored/xenstored.ml            |  224 ++-
 tools/ocaml/xenstored/xenstored_main.ml       |    1 +
 301 files changed, 22724 insertions(+), 193 deletions(-)
 create mode 100644 tools/ocaml/.gitignore
 create mode 100644 tools/ocaml/dune-project
 create mode 100644 tools/ocaml/duniverse/cmdliner/.gitignore
 create mode 100644 tools/ocaml/duniverse/cmdliner/.ocp-indent
 create mode 100644 tools/ocaml/duniverse/cmdliner/B0.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/CHANGES.md
 create mode 100644 tools/ocaml/duniverse/cmdliner/LICENSE.md
 create mode 100644 tools/ocaml/duniverse/cmdliner/Makefile
 create mode 100644 tools/ocaml/duniverse/cmdliner/README.md
 create mode 100644 tools/ocaml/duniverse/cmdliner/_tags
 create mode 100755 tools/ocaml/duniverse/cmdliner/build.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/cmdliner.opam
 create mode 100644 tools/ocaml/duniverse/cmdliner/doc/api.odocl
 create mode 100644 tools/ocaml/duniverse/cmdliner/dune-project
 create mode 100644 tools/ocaml/duniverse/cmdliner/pkg/META
 create mode 100755 tools/ocaml/duniverse/cmdliner/pkg/pkg.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner.mllib
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_arg.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_arg.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_base.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_base.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_cline.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_cline.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_docgen.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_docgen.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_info.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_info.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_manpage.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_manpage.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_msg.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_msg.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_suggest.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_suggest.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_term.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_term.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_trie.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/cmdliner_trie.mli
 create mode 100644 tools/ocaml/duniverse/cmdliner/src/dune
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/chorus.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/cp_ex.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/darcs_ex.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/dune
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/revolt.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/rm_ex.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/tail_ex.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_man.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_man_utf8.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_opt_req.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_pos.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_pos_all.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_pos_left.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_pos_req.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_pos_rev.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_term_dups.ml
 create mode 100644 tools/ocaml/duniverse/cmdliner/test/test_with_used_args.ml
 create mode 100644 tools/ocaml/duniverse/cppo/.gitignore
 create mode 100644 tools/ocaml/duniverse/cppo/.ocp-indent
 create mode 100644 tools/ocaml/duniverse/cppo/.travis.yml
 create mode 100644 tools/ocaml/duniverse/cppo/CODEOWNERS
 create mode 100644 tools/ocaml/duniverse/cppo/Changes
 create mode 100644 tools/ocaml/duniverse/cppo/INSTALL.md
 create mode 100644 tools/ocaml/duniverse/cppo/LICENSE.md
 create mode 100644 tools/ocaml/duniverse/cppo/Makefile
 create mode 100644 tools/ocaml/duniverse/cppo/README.md
 create mode 100644 tools/ocaml/duniverse/cppo/VERSION
 create mode 100644 tools/ocaml/duniverse/cppo/appveyor.yml
 create mode 100644 tools/ocaml/duniverse/cppo/cppo.opam
 create mode 100644 tools/ocaml/duniverse/cppo/cppo_ocamlbuild.opam
 create mode 100644 tools/ocaml/duniverse/cppo/dune-project
 create mode 100644 tools/ocaml/duniverse/cppo/examples/Makefile
 create mode 100644 tools/ocaml/duniverse/cppo/examples/debug.ml
 create mode 100644 tools/ocaml/duniverse/cppo/examples/dune
 create mode 100644 tools/ocaml/duniverse/cppo/examples/french.ml
 create mode 100644 tools/ocaml/duniverse/cppo/examples/lexer.mll
 create mode 100644 tools/ocaml/duniverse/cppo/ocamlbuild_plugin/_tags
 create mode 100644 tools/ocaml/duniverse/cppo/ocamlbuild_plugin/dune
 create mode 100644 tools/ocaml/duniverse/cppo/ocamlbuild_plugin/ocamlbuild_cppo.ml
 create mode 100644 tools/ocaml/duniverse/cppo/ocamlbuild_plugin/ocamlbuild_cppo.mli
 create mode 100644 tools/ocaml/duniverse/cppo/src/compat.ml
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_command.ml
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_command.mli
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_eval.ml
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_eval.mli
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_lexer.mll
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_main.ml
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_parser.mly
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_types.ml
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_types.mli
 create mode 100644 tools/ocaml/duniverse/cppo/src/cppo_version.mli
 create mode 100644 tools/ocaml/duniverse/cppo/src/dune
 create mode 100644 tools/ocaml/duniverse/cppo/test/capital.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/capital.ref
 create mode 100644 tools/ocaml/duniverse/cppo/test/comments.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/comments.ref
 create mode 100644 tools/ocaml/duniverse/cppo/test/cond.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/cond.ref
 create mode 100644 tools/ocaml/duniverse/cppo/test/dune
 create mode 100644 tools/ocaml/duniverse/cppo/test/ext.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/ext.ref
 create mode 100644 tools/ocaml/duniverse/cppo/test/incl.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/incl2.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/loc.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/loc.ref
 create mode 100644 tools/ocaml/duniverse/cppo/test/paren_arg.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/paren_arg.ref
 create mode 100755 tools/ocaml/duniverse/cppo/test/source.sh
 create mode 100644 tools/ocaml/duniverse/cppo/test/test.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/tuple.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/tuple.ref
 create mode 100644 tools/ocaml/duniverse/cppo/test/unmatched.cppo
 create mode 100644 tools/ocaml/duniverse/cppo/test/unmatched.ref
 create mode 100644 tools/ocaml/duniverse/cppo/test/version.cppo
 create mode 100644 tools/ocaml/duniverse/crowbar/.gitignore
 create mode 100644 tools/ocaml/duniverse/crowbar/CHANGES.md
 create mode 100644 tools/ocaml/duniverse/crowbar/LICENSE.md
 create mode 100644 tools/ocaml/duniverse/crowbar/README.md
 create mode 100644 tools/ocaml/duniverse/crowbar/crowbar.opam
 create mode 100644 tools/ocaml/duniverse/crowbar/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/dune-project
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/.gitignore
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/calendar/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/calendar/test_calendar.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/fpath/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/fpath/test_fpath.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/input/testcase
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/map/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/map/test_map.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/pprint/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/pprint/test_pprint.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/serializer/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/serializer/serializer.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/serializer/test_serializer.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/uunf/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/uunf/test_uunf.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/xmldiff/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/examples/xmldiff/test_xmldiff.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/src/crowbar.ml
 create mode 100644 tools/ocaml/duniverse/crowbar/src/crowbar.mli
 create mode 100644 tools/ocaml/duniverse/crowbar/src/dune
 create mode 100644 tools/ocaml/duniverse/crowbar/src/todo
 create mode 100644 tools/ocaml/duniverse/csexp/CHANGES.md
 create mode 100644 tools/ocaml/duniverse/csexp/LICENSE.md
 create mode 100644 tools/ocaml/duniverse/csexp/Makefile
 create mode 100644 tools/ocaml/duniverse/csexp/README.md
 create mode 100644 tools/ocaml/duniverse/csexp/bench/csexp_bench.ml
 create mode 100644 tools/ocaml/duniverse/csexp/bench/dune
 create mode 100644 tools/ocaml/duniverse/csexp/bench/main.ml
 create mode 100755 tools/ocaml/duniverse/csexp/bench/runner.sh
 create mode 100644 tools/ocaml/duniverse/csexp/csexp.opam
 create mode 100644 tools/ocaml/duniverse/csexp/csexp.opam.template
 create mode 100644 tools/ocaml/duniverse/csexp/dune-project
 create mode 100644 tools/ocaml/duniverse/csexp/dune-workspace.dev
 create mode 100644 tools/ocaml/duniverse/csexp/src/csexp.ml
 create mode 100644 tools/ocaml/duniverse/csexp/src/csexp.mli
 create mode 100644 tools/ocaml/duniverse/csexp/src/dune
 create mode 100644 tools/ocaml/duniverse/csexp/test/dune
 create mode 100644 tools/ocaml/duniverse/csexp/test/test.ml
 create mode 100644 tools/ocaml/duniverse/dune
 create mode 100644 tools/ocaml/duniverse/fmt/.gitignore
 create mode 100644 tools/ocaml/duniverse/fmt/.ocp-indent
 create mode 100644 tools/ocaml/duniverse/fmt/CHANGES.md
 create mode 100644 tools/ocaml/duniverse/fmt/LICENSE.md
 create mode 100644 tools/ocaml/duniverse/fmt/README.md
 create mode 100644 tools/ocaml/duniverse/fmt/_tags
 create mode 100644 tools/ocaml/duniverse/fmt/doc/api.odocl
 create mode 100644 tools/ocaml/duniverse/fmt/doc/index.mld
 create mode 100644 tools/ocaml/duniverse/fmt/dune-project
 create mode 100644 tools/ocaml/duniverse/fmt/fmt.opam
 create mode 100644 tools/ocaml/duniverse/fmt/pkg/META
 create mode 100755 tools/ocaml/duniverse/fmt/pkg/pkg.ml
 create mode 100644 tools/ocaml/duniverse/fmt/src/dune
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt.ml
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt.mli
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt.mllib
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_cli.ml
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_cli.mli
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_cli.mllib
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_top.ml
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_top.mllib
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_tty.ml
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_tty.mli
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_tty.mllib
 create mode 100644 tools/ocaml/duniverse/fmt/src/fmt_tty_top_init.ml
 create mode 100644 tools/ocaml/duniverse/fmt/test/test.ml
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/.gitignore
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/CHANGES.md
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/LICENSE.md
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/README.md
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/afl-persistent.opam
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/afl-persistent.opam.template
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/aflPersistent.available.ml
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/aflPersistent.mli
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/aflPersistent.stub.ml
 create mode 100755 tools/ocaml/duniverse/ocaml-afl-persistent/detect.sh
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/dune
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/dune-project
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/test.ml
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/test/harness.ml
 create mode 100644 tools/ocaml/duniverse/ocaml-afl-persistent/test/test.ml
 create mode 100755 tools/ocaml/duniverse/ocaml-afl-persistent/test/test.sh
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/.gitignore
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/.travis.yml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/CHANGES.md
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/COPYING.txt
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/Makefile
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/README.md
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/dune-project
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/ocplib-endian.opam
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/be_ocaml_401.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/common.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/common_401.cppo.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/common_float.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/dune
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/endianBigstring.cppo.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/endianBigstring.cppo.mli
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/endianBytes.cppo.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/endianBytes.cppo.mli
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/endianString.cppo.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/endianString.cppo.mli
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/le_ocaml_401.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/src/ne_ocaml_401.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/tests/bench.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/tests/dune
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/tests/test.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/tests/test_bigstring.cppo.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/tests/test_bytes.cppo.ml
 create mode 100644 tools/ocaml/duniverse/ocplib-endian/tests/test_string.cppo.ml
 create mode 100755 tools/ocaml/duniverse/result/CHANGES.md
 create mode 100755 tools/ocaml/duniverse/result/LICENSE.md
 create mode 100755 tools/ocaml/duniverse/result/Makefile
 create mode 100755 tools/ocaml/duniverse/result/README.md
 create mode 100755 tools/ocaml/duniverse/result/dune
 create mode 100755 tools/ocaml/duniverse/result/dune-project
 create mode 100755 tools/ocaml/duniverse/result/result-as-alias-4.08.ml
 create mode 100755 tools/ocaml/duniverse/result/result-as-alias.ml
 create mode 100755 tools/ocaml/duniverse/result/result-as-newtype.ml
 create mode 100755 tools/ocaml/duniverse/result/result.opam
 create mode 100755 tools/ocaml/duniverse/result/which_result.ml
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/CHANGES.md
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/LICENSE
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/README.md
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/dune-project
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/dune-workspace.dev
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/src/dune
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/stdlib-shims.opam
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/test/dune
 create mode 100644 tools/ocaml/duniverse/stdlib-shims/test/test.ml
 create mode 100644 tools/ocaml/libs/eventchn/dune
 create mode 100644 tools/ocaml/libs/mmap/dune
 create mode 100644 tools/ocaml/libs/mmap/gnt.ml
 create mode 100644 tools/ocaml/libs/mmap/gnt.mli
 create mode 100644 tools/ocaml/libs/mmap/gnttab_stubs.c
 create mode 100644 tools/ocaml/libs/xb/dune
 create mode 100644 tools/ocaml/libs/xc/dune
 create mode 100644 tools/ocaml/libs/xs/dune
 create mode 100644 tools/ocaml/xen.opam
 create mode 100644 tools/ocaml/xen.opam.locked
 create mode 100644 tools/ocaml/xenstore.opam
 create mode 100644 tools/ocaml/xenstored.opam
 create mode 100644 tools/ocaml/xenstored/dune
 create mode 100644 tools/ocaml/xenstored/test/dune
 create mode 100644 tools/ocaml/xenstored/test/generator.ml
 create mode 100644 tools/ocaml/xenstored/test/gnt.ml
 create mode 100644 tools/ocaml/xenstored/test/model.ml
 create mode 100644 tools/ocaml/xenstored/test/old/arbitrary.ml
 create mode 100644 tools/ocaml/xenstored/test/old/gen_paths.ml
 create mode 100644 tools/ocaml/xenstored/test/old/xenstored_test.ml
 create mode 100644 tools/ocaml/xenstored/test/pathtree.ml
 create mode 100644 tools/ocaml/xenstored/test/testable.ml
 create mode 100644 tools/ocaml/xenstored/test/types.ml
 copy tools/ocaml/{libs/mmap/xenmmap.mli => xenstored/test/xenctrl.ml} (54%)
 create mode 100644 tools/ocaml/xenstored/test/xeneventchn.ml
 create mode 100644 tools/ocaml/xenstored/test/xenstored_test.ml
 create mode 100644 tools/ocaml/xenstored/test/xs_protocol.ml
 create mode 100644 tools/ocaml/xenstored/xenstored_main.ml

-- 
2.25.1


