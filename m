Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8803340375A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181613.328836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHm-0001aP-2n; Wed, 08 Sep 2021 09:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181613.328836; Wed, 08 Sep 2021 09:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHl-0001VS-Up; Wed, 08 Sep 2021 09:54:29 +0000
Received: by outflank-mailman (input) for mailman id 181613;
 Wed, 08 Sep 2021 09:54:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FUO+=N6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNuHk-0001EI-5d
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:28 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0d5fdd8-108a-11ec-b148-12813bfff9fa;
 Wed, 08 Sep 2021 09:54:27 +0000 (UTC)
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
X-Inumbo-ID: c0d5fdd8-108a-11ec-b148-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631094867;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PDBj/mA8Lu6e2IhZjHrH6EN0R60DBQb8n23okxDMJvY=;
  b=adEy6LxjdRHGd/wTBJNudWVup26YVrWmBZcWXd6oJiERwIWhdqDGepq7
   /C0YnIrNj7OvhkQ4fDvKD8cA1OxC7xIiUqEf2XNEYOMQE+9b+7Lw4rOQR
   yOuksf02F2I0vlOnOg5RLkN8ZrimwzzdDBwCGDaMdr1t3j0lIp9cICD++
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9hJzvvNN+HDUTSRgGrqP7csVUq9njft5zD/0wcM2reORepBNmRYH54XkhC/IaQPSZO3KjwEKA2
 5kNFrhbq5ILf0VgImqSQ/Obt3cVy+WVtoRoOleKRsAWimzGSgEBsYhkhgrLUb1DTIjjihxpNSt
 6czpK3hgivc+TlAPAc29kRZo43ouizWsK/ILM8OC8Sk3+QAZeqRXIOXWMAYUzajGxChxSv409z
 RS02wwNBDbnz9gH4a3hy/fG1KEyssh65v97oYE9U45Q1MbgQTcR++tAV5oU7mJZO7ehvA6QWvi
 6W4m2GMga8UsZS4QRhjkVjpn
X-SBRS: 5.1
X-MesageID: 53993474
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:opGXYqACNyXpAYXlHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8v
 xG/c5rsiMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAH0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.85,277,1624334400"; 
   d="scan'208";a="53993474"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel De
 Graaf" <dgdegra@tycho.nsa.gov>, George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH 0/2] build: attempt to "fix" GitLab CI job "debian-unstable-gcc-arm64"
Date: Wed, 8 Sep 2021 10:54:20 +0100
Message-ID: <20210908095422.438324-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.fix-flask-policy.mk-v1

Well, that job fails with weird failure:
    make[6]: Entering directory '/builds/xen-project/xen/tools/flask/policy'
    make[6]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
    /builds/xen-project/xen/tools/flask/policy/Makefile.common:115: *** target pattern contains no '%'.  Stop.
    make[6]: Leaving directory '/builds/xen-project/xen/tools/flask/policy'

This is because we do $(shell $(MAKE) xenversion) and that sometime produce
more than just "4.16-unstable", which lead to makefile parsing failure.
Maybe `make -j80` is too much.

But you can have the same kind of failure when running `make --debug=a` or
`remake --trace` with flask policy generation enabled.

This patch series fixes build of "xen" (first patch), but only workaround with
a probably not good enough patch for build of the "tools".

Anthony PERARD (2):
  build: set policy filename on make command line
  build: add --full to version.sh to guess $(XEN_FULLVERSION)

 tools/flask/policy/Makefile.common |  2 +-
 version.sh                         | 15 ++++++++++++++-
 xen/xsm/flask/Makefile             |  2 +-
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
Anthony PERARD


