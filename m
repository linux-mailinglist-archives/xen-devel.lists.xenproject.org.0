Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806A6F8371
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530326.825876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puv84-00043N-1V; Fri, 05 May 2023 13:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530326.825876; Fri, 05 May 2023 13:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puv83-0003zZ-Ue; Fri, 05 May 2023 13:05:43 +0000
Received: by outflank-mailman (input) for mailman id 530326;
 Fri, 05 May 2023 13:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puv82-0003zO-Fn
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 13:05:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87db2096-eb45-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 15:05:40 +0200 (CEST)
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
X-Inumbo-ID: 87db2096-eb45-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683291940;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9MVcvLqzUK6qhH7+uSpDyPfF2OpcLaXOQ00IpCjwAPE=;
  b=K9xihGbGjbbYcA1Apd0CkxWjml2vKNd/UxPHvaZSBu7RU/s0uPLCrwNv
   HzbDm1m4xW4zl8G2kolMjjLFbOqdRw3CJZRUwXFc7aN7fELwjunhRbEsy
   nmzo4svr6ouA2scenvOk0VG4gxOotqdQ5AAB5/beTq2KdIJHsVC5tBdh5
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108401385
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0LvNqK7bmN5yQw1c4je0twxRtCHHchMFZxGqfqrLsTDasY5as4F+v
 mNOWGmBPvqNMDb8fdh2Ydu+px9XvJ6ByoVqSwI/qSA9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0T4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 Mc2EWFRZxO5wMGH+JiLRtV8pekmI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7I+
 jqfpDSkav0cHPKV6RPe31fvus7SsjOqdaY9Pae8xNc/1TV/wURMUUZLBDNXu8KRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQv3qsrhMaHd1KHIUS6hyJy6fSyxaUAC4DVDEpQP4MudIyRDcq/
 kSUhN6vDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nFk3N3/kPLnyY2Cxn7+0m6lpaKObT8NzDXbYnKGwwZ2MdvNi5OT1bTL0RpRBN/HHgLb4
 Sldwpf2APMmVs/UynHUKAkZNPTwvqvebmWB6bJ6N8N5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjJ5fK6fTgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj8VixAV/g+nWLtGI/xNIMWKt0WnzuPFfgXMTz+uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75iCid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6e94J9A+xfsKy7egE
 7PUchYw9WcTTEbvcW2iAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:T4gJWqCV9fFsutTlHemr55DYdb4zR+YMi2TDtnoBLyC9F/bz+v
 xG88576faZslYssQgb9+xoW5PwJk80l6QFhLX5VI3KNGLbUQ2TXeJfBOPZrwEIcBeOktK1u5
 0QEZSX17XLYmST6q7BkXCFL+o=
X-Talos-CUID: 9a23:wQwmsWHH/ouQitEyqmJez2AtS5wscUea70boCX+0NXZKZbiaHAo=
X-Talos-MUID: 9a23:BcY9uQQpwcNp3u90RXTCjhFLb+pNoJiPFW8dwLgilOCeMR5ZbmI=
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="108401385"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH 0/2] LICENSES improvements/corrections
Date: Fri, 5 May 2023 14:05:31 +0100
Message-ID: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Noticed in light of the recent LGPL changes to libacpi, but sadly only after
the fact.

Andrew Cooper (2):
  LICENSES: Improve the legibility of these files
  LICENSES: Remove the use of deprecated LGPL SPDX tags

 LICENSES/BSD-2-Clause               |  4 ++++
 LICENSES/BSD-3-Clause               |  4 ++++
 LICENSES/BSD-3-Clause-Clear         |  4 ++++
 LICENSES/CC-BY-4.0                  |  5 +++++
 LICENSES/GPL-2.0                    | 17 +++++++++++------
 LICENSES/LGPL-2.0                   | 14 ++++++++++----
 LICENSES/LGPL-2.1                   | 14 ++++++++++----
 LICENSES/MIT                        |  4 ++++
 tools/libacpi/Makefile              |  2 +-
 tools/libacpi/acpi2_0.h             |  2 +-
 tools/libacpi/build.c               |  2 +-
 tools/libacpi/dsdt.asl              |  2 +-
 tools/libacpi/dsdt_acpi_info.asl    |  2 +-
 tools/libacpi/libacpi.h             |  2 +-
 tools/libacpi/mk_dsdt.c             |  2 +-
 tools/libacpi/ssdt_laptop_slate.asl |  2 +-
 tools/libacpi/ssdt_pm.asl           |  2 +-
 tools/libacpi/ssdt_s3.asl           |  2 +-
 tools/libacpi/ssdt_s4.asl           |  2 +-
 tools/libacpi/ssdt_tpm.asl          |  2 +-
 tools/libacpi/static_tables.c       |  2 +-
 21 files changed, 65 insertions(+), 27 deletions(-)

-- 
2.30.2


