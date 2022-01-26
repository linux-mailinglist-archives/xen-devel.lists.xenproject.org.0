Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86849C576
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260714.450660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvV-0000Al-OB; Wed, 26 Jan 2022 08:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260714.450660; Wed, 26 Jan 2022 08:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvV-00008e-Jn; Wed, 26 Jan 2022 08:45:13 +0000
Received: by outflank-mailman (input) for mailman id 260714;
 Wed, 26 Jan 2022 08:45:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdvT-000083-Lc
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43f66c08-7e84-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 09:45:10 +0100 (CET)
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
X-Inumbo-ID: 43f66c08-7e84-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uX278L4FAVrVZOZsba6ZQ7SCs/+GWJXykaSN0q2hQdQ=;
  b=OjergcLvvwl90gVwhLBhIChnD+ne4X7AzLXTZlOwKk9hqDtrwlebe2gt
   OBmkc5aU3XaeC/8aySxb50vsGjsDDZjKaxWj9XWauD0wPjbR8LQqnPQ8X
   lArsa23pf5HBpO+B35jiOnHbbJSAee1q4PcPtN1pagEIIGFdIhssMECxH
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QWC+k+WygnbngbDBS26n46/vFR3gtE542BktanjWeznBOJh97UztpXgjSG5V4tCiGxLV35Bopz
 2f3JUrMLfUeF7LB7UhKCZTvFJnbc8raPyX6q2IVgGQZFzfpWc9siTnRvQK70m5LjjN+Xf76O4w
 xHZQ5b7kScD5dlwQRPg4v42ouMRVkO5Rx0C64SIUGnPk2Kh1SNSAoFwYzqc+4XcxVBnc2LtOoP
 BV9WnPWlYXY/aI/dLDogn5Y1jdqpD6b6KJc8PIi5r3UQiFA8kwzbwr2/Cca1fptFsXpYihDclO
 9cp3Bt73uev712/L9G/R5Rp1
X-SBRS: 5.2
X-MesageID: 63189673
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:c5WPrKLD63Ip5Fc2FE+RBZIlxSXFcZb7ZxGr2PjKsXjdYENS0DBTy
 GcbXW7Xbq2LamDye9F0Po238EoFvJ+HnYM3GgJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5xbZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3WmMBz6
 +RqjqWBWBwqP7Pvp7RAYRlhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glr35AfQ6mFD
 yYfQT80Zj7aaidyBlk4OsMejOr1hGHwVDIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs4RkMWflhNNYD2RCWyavKwDnJW1oEd2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNeZJhKTysDA3CMqsyq7DHzFtW
 1Bfw6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wLuWojehs1b5ZbEdMMX
 KM1kVkAjHO0FCDyBZKbnqrrU5h6pUQePYmNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm35irUuOG8GT50n3gNK2OS/OIZ9YYQTmUwzMxP7eyOkj2
 4wBZ5LiJtQ2eLCWXxQ7BqZKfQlVdiBqXM6vwyGVH8baSjdb9KgaI6e56dscl0ZNxcy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:hXJd9qmK9tIzrx2aBVDgw1wRTZLpDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="63189673"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/8] x86: MSR_SPEC_CTRL support for SVM guests
Date: Wed, 26 Jan 2022 08:44:44 +0000
Message-ID: <20220126084452.28975-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes/extensions to allow HVM guests to use AMD hardware MSR_SPEC_CTRL
facilities.

No PV support yet - that will require some substantially more careful
unpicking of the PV entry/exit asm.

Andrew Cooper (8):
  x86/msr: Fix migration compatibility issue with MSR_SPEC_CTRL
  x86/boot: Collect AMD speculative features earlier during boot
  x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
  x86/spec-ctrl: Drop use_spec_ctrl boolean
  x86/spec-ctrl: Introduce new has_spec_ctrl boolean
  x86/spec-ctrl: Use common MSR_SPEC_CTRL logic for AMD
  x86/msr: AMD MSR_SPEC_CTRL infrastructure
  x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by default

 xen/arch/x86/cpu/amd.c                      |  2 +-
 xen/arch/x86/cpu/common.c                   | 15 +++++---
 xen/arch/x86/cpuid.c                        | 16 ++++++---
 xen/arch/x86/hvm/hvm.c                      | 25 +++++++++++--
 xen/arch/x86/hvm/svm/entry.S                | 10 +++---
 xen/arch/x86/hvm/svm/svm.c                  | 39 ++++++++++++++++++++
 xen/arch/x86/include/asm/current.h          |  2 +-
 xen/arch/x86/include/asm/msr.h              | 11 ++++++
 xen/arch/x86/include/asm/spec_ctrl_asm.h    |  7 ++++
 xen/arch/x86/msr.c                          | 37 ++++++++++++-------
 xen/arch/x86/spec_ctrl.c                    | 56 ++++++++++++++++++++---------
 xen/include/public/arch-x86/cpufeatureset.h | 18 +++++-----
 xen/tools/gen-cpuid.py                      |  5 +++
 13 files changed, 187 insertions(+), 56 deletions(-)

-- 
2.11.0


