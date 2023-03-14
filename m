Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC42C6B9783
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509631.785754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RC-0004sE-38; Tue, 14 Mar 2023 14:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509631.785754; Tue, 14 Mar 2023 14:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RB-0004pj-WC; Tue, 14 Mar 2023 14:15:38 +0000
Received: by outflank-mailman (input) for mailman id 509631;
 Tue, 14 Mar 2023 14:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5RA-0004aQ-DS
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:15:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae977c0e-c272-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:15:34 +0100 (CET)
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
X-Inumbo-ID: ae977c0e-c272-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678803334;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BWwsWJ8qdUn128KiKSEtuatyXR45lgwE9a8Hi34RC6w=;
  b=TZRSt4BGGzM/PLl3lA05LLUavONHK9eSQDiHOP+p2jkMCQau0mFkZ7fk
   fAKMfjlFbCe71xQWamA4jgCdnVzIMOOwm/v2avi3w/QCtm0BQlxPhP75l
   h6rM5dCUd+GswB4Sf6ihjJqjzZGR964J29OGtzCxzi4A9HTYJyIncPnXI
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101198534
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:l5iQD6m1M3luAA2CFtepqj7o5gxuJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWmuCPK7YZDD0etEgYdzko0sPsMWEn9ZnHQA++301ECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eUSDBkRSUqBvtKV66/rFa5tnMIbPca+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A/
 zuXrzmiXnn2MvSN+ACq9iL2u9XFsi7FcrJMBeyG0/t11Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4FuQg7QiXx6n84gCHB3MFRDpMdNwnssAtQTUgk
 FSOmrvBJxZirbmUQnK17aqPoHW5Pi19BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWr7cOic8G0Y2r8FaBhCijzrDpQwgv90PoV2SqxgpjYciuYInA1LTAxa8edsDDFADH5
 SVa3ZHEt4jiEK1higSUSsEkAJbz5c+1ExbB0QEoHoMnzyWirivLkZ9r3BlyI0JgM8AhcDDvY
 VPOtQ452KK/LEdGfocsPdvvVp1CIbzIUI28C6uKNoYmjo1ZLlfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYH7H82TI/ePi+D2iJuppVAtYTOzghgRtv/sneks2
 4832zG24xteSvbiRSLc7JQeK1sHRVBiW8+m9JcNKbTZf1M/cI3ENxM26eJJRmCYt/4NyregE
 o+VAye0N2YTdVWYcF7XOxiPmZvkXIplrGJTABHAyW2AgiB5Ca72tfd3SnfCVeV/nACV5aIuH
 qZtlgTpKqgndwkrDBxGPcGs9dw/Kkn77e9MVgL8CAUCk1dbb1Sh0rfZksHHq0Hi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:xv9uP6k1d6l+f0wFKrRA2TA+aM7pDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="101198534"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
	Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
Date: Tue, 14 Mar 2023 14:15:13 +0000
Message-ID: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Despite previous statements to the contrary, Xen still does not support Python 3.

Various notes are on https://gitlab.com/xen-project/xen/-/issues/114

The following scripts are installed, and given a python3 shebang, but are not
Py3 compatible:

  xencov_split
  xentrace_format
  xencons
  xenpvnetboot
  verify-stream-v2
  convert-legacy-stream

Most of these want converting, and should be reasonably easy, but I don't have
time right now.

This series deals with xencons (which is a not-invented-here telnet), various
bits of cleanup, and various fixes for shebangs.

The problematic remaining script is xenpvnetboot which, while looking
reasonably useful and also not PV specific, depends on a 3rd party module but
provides no dependency information at all.

Relatedly, and a critical/blocker for Xen 4.18.  Python 3.12, which will be
released ahead of the Xen 4.18 release, is deleteing distutils (recommending
setuputils as the replacement), so someone is going to have to rework all our
setup.py's to be compatible.

Andrew Cooper (7):
  tools/python: Drop pylintrc
  tools/misc: Drop xencons
  tools: Delete trailing whitespace in python scripts
  tools/pygrub: Factor out common setup.py parts
  tools: Use -s for python shebangs
  tools/python: Improve unit test handling
  tools/python: Drop shebangs from library files

 tools/Rules.mk                       |   2 +-
 tools/misc/Makefile                  |   2 -
 tools/misc/xencons                   |  92 --------
 tools/misc/xencov_split              |   1 -
 tools/pygrub/Makefile                |  11 +-
 tools/pygrub/src/ExtLinuxConf.py     |   2 +-
 tools/pygrub/src/GrubConf.py         |  30 +--
 tools/pygrub/src/fsimage/fsimage.c   |   8 +-
 tools/pygrub/src/pygrub              |  44 ++--
 tools/python/Makefile                |   4 +-
 tools/python/pylintrc                | 307 ---------------------------
 tools/python/xen/lowlevel/xc/xc.c    | 200 ++++++++---------
 tools/python/xen/lowlevel/xs/xs.c    |   4 +-
 tools/python/xen/migration/legacy.py |   1 -
 tools/python/xen/migration/libxc.py  |   1 -
 tools/python/xen/migration/libxl.py  |   1 -
 tools/python/xen/migration/public.py |   1 -
 tools/python/xen/migration/tests.py  |  15 +-
 tools/python/xen/migration/verify.py |   1 -
 tools/python/xen/migration/xl.py     |   1 -
 tools/python/xen/util.py             |   1 -
 tools/xenmon/xenmon.py               |  44 ++--
 22 files changed, 177 insertions(+), 596 deletions(-)
 delete mode 100755 tools/misc/xencons
 delete mode 100644 tools/python/pylintrc

-- 
2.30.2


