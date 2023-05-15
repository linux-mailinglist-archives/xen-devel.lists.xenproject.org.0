Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA2370304F
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534780.832158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZQ9-0001kd-El; Mon, 15 May 2023 14:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534780.832158; Mon, 15 May 2023 14:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZQ9-0001gg-84; Mon, 15 May 2023 14:43:29 +0000
Received: by outflank-mailman (input) for mailman id 534780;
 Mon, 15 May 2023 14:43:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdz=BE=citrix.com=prvs=492993889=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyZQ8-0000CT-8M
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:43:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d97bc3d2-f32e-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 16:43:27 +0200 (CEST)
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
X-Inumbo-ID: d97bc3d2-f32e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684161807;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Et7lO32iFTeTcBuxF+aOHF19+4pOz9StdzKvbkzwkgA=;
  b=boiO6rGVhvHSiBWhpv3UkQ+HG1UZlrW+kFW4CgMTegIQaNZWxDmbMSZl
   d8bac/piW7cMjPNUIAqRQx4OcjQLz1QejeYoxr9VXNtU4+cvgx4VIQcaw
   V20y5bji4Zshi77S13okAVmjaHe3XxpnOiIlrwzE1KnGZVXhd183k+w+I
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111537997
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Atd2O64DhIOwVmg94CPbvwxRtDPHchMFZxGqfqrLsTDasY5as4F+v
 jZNDW6PPP+PYGqge94gbdmw9RgA6MSHn9dqSQdlr3g9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 6QydSwTdQG6lvuR+6iGbeRpu+18I5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/B+
 zmZrjWmav0cHPyk5zzeqWqVurDSxHPCYbkWOqWK2tc/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy67LGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTSlcZ1YZ/cLymZAqqSnVc/FuFZOc0dKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKulmSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrH02NR/KgDu9yxBEfUQD1
 XCzIK6R4YsyU/w7nFJauc9HuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5YKJ7/efFA3RDlJ5j246epJRrGJVp99zo/gl
 kxRkGcHkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:BtMzv6BgLGoQsYTlHelc55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uICJIOb+EZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3AjB92CWvAv4eK4/LHFrcnKynO6IsjKleA0GnLMna?=
 =?us-ascii?q?pEEFSUoCyRFqt0fxrxp8=3D?=
X-Talos-MUID: 9a23:wYigsQmiGrWx2xyDHZ4WdnpCD+luuP+2MXxSjMxWgvC/MQJoCRu02WE=
X-IronPort-AV: E=Sophos;i="5.99,277,1677560400"; 
   d="scan'208";a="111537997"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/6] x86: Introduce MSR_ARCH_CAPS into featuresets
Date: Mon, 15 May 2023 15:42:53 +0100
Message-ID: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also cleanup of the various special cases we've already got.  No practical
change to a system, but this is the trimmed view of the featuresets on a
Cascade Lake CPU with the series in place.

                        KEY ... 10Al     10Ah
  Static sets:
  Known                     ... 01beffff:00000000
  Special                   ... 00080004:00000000
  PV Max                    ... 011ae17f:00000000
  PV Default                ... 011ae17f:00000000
  HVM Shadow Max            ... 011ae17f:00000000
  HVM Shadow Default        ... 011ae17f:00000000
  HVM Hap Max               ... 011ae17f:00000000
  HVM Hap Default           ... 011ae17f:00000000

  Dynamic sets:
  Raw                       ... 000aacab:00000000
  Host                      ... 000aacab:00000000
  PV Default                ... 00000000:00000000
  HVM Default               ... 00000000:00000000
  PV Max                    ... 000aa02b:00000000
  HVM Max                   ... 000aa02b:00000000

Andrew Cooper (6):
  x86/boot: Rework dom0 feature configuration
  x86/boot: Adjust MSR_ARCH_CAPS handling for the Host policy
  x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
  x86/cpu-policy: MSR_ARCH_CAPS feature names
  x86/boot: Record MSR_ARCH_CAPS for the Raw and Host CPU policy
  x86/boot: Expose MSR_ARCH_CAPS data in guest max policies

 tools/misc/xen-cpuid.c                      | 23 ++++++
 xen/arch/x86/cpu-policy.c                   | 83 ++++++++++-----------
 xen/arch/x86/cpu/common.c                   |  5 ++
 xen/include/public/arch-x86/cpufeatureset.h | 27 +++++++
 xen/include/xen/lib/x86/cpu-policy.h        | 18 ++---
 xen/lib/x86/cpuid.c                         | 11 ++-
 xen/tools/gen-cpuid.py                      |  3 +
 7 files changed, 117 insertions(+), 53 deletions(-)

-- 
2.30.2


