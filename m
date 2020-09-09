Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B392638B2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:53:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG81b-00006g-3W; Wed, 09 Sep 2020 21:53:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG81Z-00006a-Gm
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:53:05 +0000
X-Inumbo-ID: fd502bcd-50b1-4c4c-ab15-73a386aeab3d
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd502bcd-50b1-4c4c-ab15-73a386aeab3d;
 Wed, 09 Sep 2020 21:53:03 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089LqjQt039172
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:52:50 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089Lqhmn039171;
 Wed, 9 Sep 2020 14:52:43 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092152.089Lqhmn039171@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Tue, 8 Sep 2020 18:28:45 -0700
Subject: [PATCH 00/11] Major rework of top-level .gitignore
X-Spam-Status: No, score=0.8 required=10.0 tests=DATE_IN_PAST_12_24,
 KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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

The top-level .gitignore file for Xen has gotten rather messy.  Looks
like at times a few people may have added some blank lines looking
towards some later cleanup.  Alas no one ever got around to that later
cleanup.

When looking at one portion of the situation I ended up doing some
cleanup and it got out of hand.  Hence I'm not sending in these patches
which hopefully make things better.

Please note these are somewhat better than work-in-progress status.
There are several places I'm unsure of which direction to go in.  Likely
several of these will need more or less information in their commit
messages.

Overall pattern is first some initial cleanup on the top-level
.gitignore.  It is easier to spot targeted file matches which overlapped
general globs before breaking things apart.  This is followed by breaking
all targeted matches off of the global .gitignore file.  Lastly the
global .gitignore file was sorted and I've commented on a few of the
things which remain.

Recent versions of `git` include a "check-ignore" command.  For testing
new patterns `git check-ignore -vn --no-index <pattern>` will tell you
whether a given filename would be ignored without "add -f".

I think patches 01 and 02 are near ready for being committed.  Patches
03-09 need varying degrees of polish before being in an official tree.
Patches 10 and 11 are pretty well initial rough outlines.

Elliott Mitchell (11):
  gitignore: Move ignores from global to subdirectories
  gitignore: Remove entries duplicating global entries
  gitignore: Add/Generalize entries
  gitignore: Create .gitignore file for tools/firmware/
  gitignore: Create .gitignore file for tools/ocaml/
  gitignore: Create .gitignore file for xen/
  gitignore: Create .gitignore file for docs/
  gitignore: Create .gitignore file for stubdom/
  gitignore: Create .gitignore file for config/
  gitignore: Create .gitignore file for tools/
  gitignore: RFC Prelimiary final cleanup of top-level .gitignore

 .gitignore                   | 440 +++--------------------------------
 config/.gitignore            |   5 +
 docs/.gitignore              |   8 +
 stubdom/.gitignore           |  32 +++
 tools/.gitignore             | 145 ++++++++++++
 tools/firmware/.gitignore    |  29 +++
 tools/misc/.gitignore        |  23 +-
 tools/ocaml/.gitignore       |  24 ++
 xen/.gitignore               |  39 ++++
 xen/tools/kconfig/.gitignore |   6 +
 xen/xsm/flask/.gitignore     |   9 +-
 11 files changed, 354 insertions(+), 406 deletions(-)
 create mode 100644 config/.gitignore
 create mode 100644 docs/.gitignore
 create mode 100644 stubdom/.gitignore
 create mode 100644 tools/.gitignore
 create mode 100644 tools/firmware/.gitignore
 create mode 100644 tools/ocaml/.gitignore
 create mode 100644 xen/.gitignore

-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




