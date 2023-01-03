Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3014B65C7DB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 21:10:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470705.730321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnc1-00069Z-Lh; Tue, 03 Jan 2023 20:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470705.730321; Tue, 03 Jan 2023 20:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnc1-00067Z-HR; Tue, 03 Jan 2023 20:10:17 +0000
Received: by outflank-mailman (input) for mailman id 470705;
 Tue, 03 Jan 2023 20:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oadl=5A=citrix.com=prvs=36087fe06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCnbz-0004E1-W5
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 20:10:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1e434ae-8ba2-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 21:10:15 +0100 (CET)
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
X-Inumbo-ID: a1e434ae-8ba2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672776615;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=DE3aCaTT2lSMY1mYXXzNfG1b9Pe72/lY/yfRxG9StRQ=;
  b=hxfpMNhg8ygN7klPOiR4sivGIBa8mgys/zGE5JI+DKA7rQ6rYV+fPJCB
   HO4lFi4emAie7Grt1NQoMjB2sr8virlzVakHkOatS0Ne3JyHse12/Z1wi
   1PxExUQ2oR41IqlRa6RNZF4xnrDQ+b8NJATSuB6jlgVTs3WdX0Gnktvcb
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89980395
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Sm87RalYXZe1VtTXKmr0tIHo5gxsJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXDGDUOP7eYmSjLd9zPoy+ph5Xv56AyNVlTws5+CwxEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5ASGyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cIocj1XdS++vey3yeiQdNlc3J16Lda+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zhfJ9
 jqdrjmR7hcyE4GPl3nfzWuXtvLGnTvWZoVKC6+Z+as/6LGU7jNKU0BHPbehmtG7l0q/VtR3O
 0ESvC00osAa60iDXtT7GRqirxassgYHXttME8Uz8AyX1rfP+AGdG3QFSThaLtchsaceSTMm2
 1CTlvv1FDdvt/uTUnvb+bCKxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3EjrrjQxMx5w7Xdnm49Q4/b4mgD7FE8nCCs6wGdtzACADc4
 j5UwKBy8dziE7mzpHaAGv4yIYun5v/fGwPssQQ2Rpg+omHFF2GYQahc5zR3JUFMO8kCeCP0b
 EK7hT699KO/L1PxM/YpPtvZ59ACiPG5SI+7Dqy8gs9mOMAZSeORwM15iad8NUjJmVNkr6wwM
 IzznS2EXSdDUvQPINZbqo4gPV4XKsIWnzi7qXPTlU7PPV+iiJm9F9843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcydhWs+u+5wPL7LTSuaDJI3GI6aIqY7NhqQ/x/gF/gs21
 ivVtrBkJKrX2iScdFTihoFLY7LzR5dvxU8G0dgXFQ/wgRALON//hJrzgrNrJdHLAsQ/l68rJ
 xTEEu3caslypsPvomlENcGk/dEyK3xGR2umZkKYXdT2RLY4LyShxzMuVlGHGPUmZsZvifYDn
 g==
IronPort-HdrOrdr: A9a23:mtaaPqP8jMQ7OcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="89980395"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith
	<dpsmith@apertussolutions.com>
Subject: [PATCH 0/4] Fix truncation of various XENVER_* subops
Date: Tue, 3 Jan 2023 20:09:39 +0000
Message-ID: <20230103200943.5801-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

See patch 4 for details of the problem.  Other patches fix other errors found
while investigating.

This is only the hypervisor side of the change for now, because I want
agreement before starting to untangle the mess which is libxc's helpers for
this.

Also a disaster is Linux's sysfs handling for these.  In several places it
makes a heap allocation for a pointer (or two) sized object.

Andrew Cooper (4):
  public/version: Change xen_feature_info to have a fixed size
  xen/version: Drop compat/kernel.c
  xen/version: Drop bogus return values for XENVER_platform_parameters
  xen/version: Introduce non-truncating XENVER_* subops

 xen/common/Makefile          |   2 +-
 xen/common/compat/kernel.c   |  53 ---------------------
 xen/common/kernel.c          | 108 ++++++++++++++++++++++++++++++++++++++-----
 xen/include/hypercall-defs.c |   2 +-
 xen/include/public/version.h |  78 +++++++++++++++++++++++++++++--
 xen/include/xlat.lst         |   4 ++
 xen/xsm/flask/hooks.c        |   4 ++
 7 files changed, 181 insertions(+), 70 deletions(-)
 delete mode 100644 xen/common/compat/kernel.c

-- 
2.11.0


