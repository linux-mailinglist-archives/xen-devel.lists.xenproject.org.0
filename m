Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81565D138
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 12:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471109.730833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD1gl-00065K-1f; Wed, 04 Jan 2023 11:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471109.730833; Wed, 04 Jan 2023 11:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD1gk-00061v-Tg; Wed, 04 Jan 2023 11:12:06 +0000
Received: by outflank-mailman (input) for mailman id 471109;
 Wed, 04 Jan 2023 11:12:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD1gj-0005kw-AA
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 11:12:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d30ff2d-8c20-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 12:12:04 +0100 (CET)
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
X-Inumbo-ID: 9d30ff2d-8c20-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672830724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RmOdWMA5OLBNSSGKpmQKaV/mcBDHQ91bElXomYvQBTI=;
  b=S8kC3II/vWhQ5gA8MGDMfSsJPos/Wx2DQndl0BpjmYxJ/U1g7HYisteu
   QTrPvDk7K536kI0J3lTdYy4svV+SX/80ega9G6WTJGECgKe2vN0lW4Nyn
   1ArVPhGNYZFsqEN91vpvDlKKB4k6mIUt6xCtYOYE5fmJy5MJYD9rcR9s2
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93590517
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IdDSV65w2jytOMymdgW9DgxRtDbHchMFZxGqfqrLsTDasY5as4F+v
 mQWXDiHbvyJZWH3Ldp/PtvjpBwOsJeHzIBgGwJr/H1nHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakT4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 /gACw81fxe5tcmKh7ORS7dJhsktM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0ExRvJ/
 j+foAwVBDk0Nv/C0GHa/0ihg//9mTnRW541KuSRo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wSyUG2wFRT5pc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBUEGfQw7dRoC2evInMYypBORa9ZuHrHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Jui8Axkkfi+F1/ronhe3C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvK1XYo3k+NRbJgzCFfK0QfUYXY
 M7zTCpRJSxCVfQPIMSeHY/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8riv8ZQGLrTafVM2cIzjYteIqY4cl0Vet/w9vo/1E
 ruVACe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:h9quJKkiKRjEVKyHmo5p6XuzTVzpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.96,299,1665460800"; 
   d="scan'208";a="93590517"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] x86: Work around Shstk fracturing
Date: Wed, 4 Jan 2023 11:11:44 +0000
Message-ID: <20230104111146.2094-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See patch 2 for details.

Andrew Cooper (2):
  x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
  x86/shskt: Disable CET-SS on parts susceptible to fractured updates

 docs/misc/xen-command-line.pandoc           |  7 ++++-
 tools/libs/light/libxl_cpuid.c              |  2 ++
 tools/misc/xen-cpuid.c                      | 11 +++++++
 xen/arch/x86/cpu/common.c                   | 14 +++++++--
 xen/arch/x86/setup.c                        | 46 ++++++++++++++++++++++++-----
 xen/include/public/arch-x86/cpufeatureset.h |  4 +++
 xen/include/xen/lib/x86/cpuid.h             | 15 +++++++++-
 7 files changed, 86 insertions(+), 13 deletions(-)

-- 
2.11.0


