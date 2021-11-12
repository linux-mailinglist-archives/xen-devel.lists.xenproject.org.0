Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85C44EC9B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 19:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225361.389195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbIA-0002OG-Mh; Fri, 12 Nov 2021 18:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225361.389195; Fri, 12 Nov 2021 18:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbIA-0002Ld-H6; Fri, 12 Nov 2021 18:28:50 +0000
Received: by outflank-mailman (input) for mailman id 225361;
 Fri, 12 Nov 2021 18:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=26E1=P7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlbI8-0002K6-B3
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 18:28:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dfb2ef3-43e6-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 19:28:46 +0100 (CET)
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
X-Inumbo-ID: 5dfb2ef3-43e6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636741726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9zYw7rReyP9RjuQKDHghwB2zvT5nmEDHc950x0Abeno=;
  b=SGWf9ro6jZ9VlWvlS3JLgEE5tHZHURGmAjzmw4ZUaEq5L4RtbaWSHDVM
   mAc8qaVIHbRsVEfsJEHaJLegwNWXaH4+o26nuwmwKkfIbKtyhHWZAiFXr
   TvCHgjyjSFM4nR/g91dSwIl6HYcxQv8XVXjBDWzlc7eltqooGWkpYXjbe
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: u1mAY5fZdXb3fUOUpuMbktyJnmCdX9+lbiZD9OVvfA1OohrZXeBqesjjIxCm+V+XrErh4nHYKE
 ljiGTTLwVlAAzcsQNGPaor0xmzeJjF5Du+ASsK150Ty7Vffg40mea3iTb29nBvnUmKLZOh12Fu
 uBuPqztuBWiEbpFN+VqCMHeoxQKq/aLZ2vpXVWJNCXV1T896woce4UckJs8iJUVKFrf4d6GrMN
 mylGLwYkP+Iie1pPUFK0TMAMyutWvFC7M0oYwcbc0iD/KjNOuyBkZ0oqKvhiGaGN08cgmsmC2o
 TB3zH33q6KfF8SD3cVIaPjfl
X-SBRS: 5.1
X-MesageID: 57675762
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vQbUVaKGfZad9mPGFE+RBZIlxSXFcZb7ZxGr2PjKsXjdYENShWEBn
 GRLXDqDMq6JZWH9c9B1bd7ioB9U75fdnNYyHgBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6wbZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Hh5dqx
 Y1MvKCgFzoqI6mcufYXXQBxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpv2J8TQqiED
 yYfQWRkaUjmYU1qAAcOD6wfheiEm1KicDIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCssAZbQNcIEuQG+F+wybfQsyeLDGYdZ2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRONHNi2+AswGzARN8wGCxFATpU
 J8swZj20Qz2JcvR/BFhutklErCz/OqiOzbBm1NpFJRJ323zoCD9IN4Ku2oveR0B3iM4ldnBO
 hK7VeR5vs87AZdXRfUvP9LZ5zoCkcAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRa9U6keClKSY4gRteXcyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdw1XdiZiWsitwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:Fn1e1qwRBV20zpwuhJl6KrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,230,1631592000"; 
   d="scan'208";a="57675762"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] x86/cpufreq: Various bits of cleanup
Date: Fri, 12 Nov 2021 18:28:15 +0000
Message-ID: <20211112182818.30223-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Varios bits of cleanup uncovered while looking in to the Intel Turbo issues.

Andrew Cooper (3):
  x86/cpufreq: Clean up powernow registration
  x86/cpufreq: Rework APERF/MPERF handling
  x86/cpufreq: Drop opencoded CPUID handling from powernow

 tools/misc/xen-cpuid.c                      |  3 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c         | 28 +++++++-------
 xen/arch/x86/acpi/cpufreq/powernow.c        | 58 +++++------------------------
 xen/drivers/cpufreq/utility.c               |  9 ++---
 xen/include/acpi/cpufreq/cpufreq.h          |  2 -
 xen/include/asm-x86/cpufeature.h            |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  2 +
 7 files changed, 31 insertions(+), 72 deletions(-)

-- 
2.11.0


