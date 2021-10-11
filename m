Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944EB429677
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 20:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206450.362031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzgz-0005uu-23; Mon, 11 Oct 2021 18:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206450.362031; Mon, 11 Oct 2021 18:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzgy-0005sz-UC; Mon, 11 Oct 2021 18:06:28 +0000
Received: by outflank-mailman (input) for mailman id 206450;
 Mon, 11 Oct 2021 18:06:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BpBC=O7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mZzgx-0005qd-Le
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 18:06:27 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f35f8330-2abd-11ec-80ee-12813bfff9fa;
 Mon, 11 Oct 2021 18:06:26 +0000 (UTC)
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
X-Inumbo-ID: f35f8330-2abd-11ec-80ee-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633975586;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=6l4sucSPMUqJsOfp/047IHE/7+bYZodn28EqnpvUcYo=;
  b=PnSN8GrCF//ZXQW8AHFYrI6FTdT6VFBhLRXzG4FxZB8YtlSfgpYGmLxk
   hPAt1Ve8rYf0Hh4US3CHFe4zLPnNQ+UMUM9WbDBUdYfIyQgqNo3K7Wts2
   0iuoJ5L7NapDHJO4L72Z5spFsrqtDMIGgA8b3mOKbrsr4w9liKpmWR3LS
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +ogEBk8GCsDXjYLs6PWZGIh+8G2yISCEm2dHnVn3ySIQ3uXhEAGv+JiEPyzXv924mf3EnoyQ8q
 Ero9A1bbJM/yhs9Ab5ffKj92Snmn3v+bEU38k2cJubItZo29cj6f0R2b2Ot8p0mKKrAn1dBGj6
 +X3WEz0QRsqxKs5dWTUAvwHdGR8SfZk4Etx5QX6ot83fRYs0DDTQ2oLAHUvvnadtracV3g0BhK
 3yBwqv4N5d/7B9ozw50h3WHRoXGUwqDRInOGrpemf+9qkLWQslxin6ug6GplNwLRpvYxZgCr03
 5Z2Qu7OVSZUkb11BKRPN9O/Z
X-SBRS: 5.1
X-MesageID: 55311564
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v4/QG6Na1L5tGBzvrR2NkMFynXyQoLVcMsEvi/4bfWQNrUpz3z0Fn
 DEdCz3SOPvfMzTwLdgkYIjioB9QvsLUnIAyQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Us6w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozmmkd8sk
 PR1iYW5ZCE1JI7np84seCANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWpr35kTQ6q2i
 8wxMyZRLxvkWkRzKg1KUMsUxOWqv3jlbGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3EuwPUtXqlAsRITuT+r6M0xg3IroAONPEIfVeUr/bk0m+GZ8tWB
 moI4AkFkoID33X+G7ERQCaEiHKDuxcdXf9ZHOs79ByBx8Lo3uqJOoQXZmUeMIJ+5afaURRvj
 wXTx4q4WlSDpZXMESrFnop4uw9eLsT8wYUqXiQDURceq+fqpIU+n3ojpf4yTfbr0LUZ9dz2q
 g1mTRTSZZ1P3abnNI3hpDgrZg5AQLCTE2bZAS2NDwqYAvtRPtLNWmBRwQGzAQx8BIiYVEKdm
 3MPhtKT6usDZbnUynfWELRVQ+jwu6jeWNE5vbKJN8J7n9hK0yTyFb28HRkkfBs5Wir6UW6Bj
 LDvVfN5u8YIYSrCgV5faIOtEcU6pZUM5vy+Ps04muFmO8ArHCfepXkGTRfJgwjFzRh9+Ylia
 MzzWZv9Uh4n5VFPkWPeqxE1iuRwmEjTBAr7GPjG8vhQ+ePGPiDKEu1ZbALmgyJQxPrsnTg5O
 u13b6OioyizmsWkCsUO2YJMf10MM1YhApX6955eeuKZe1I0E2A9Ef7Bh7gmftU9zahSk+7J+
 FC7W1NZlwWj1SGWd13SZyAxcq7rULZ+sWk/YX4mM2G31iVxeo2o9qoeKcc6JOF16Ox5wPdoZ
 PAZYMHcUO9XQzHK9m1FP5nwpYBvbjqxggeKM3b3aTQzZcc4FQfI5sXlbk3k8yxXVni7ss43o
 ruB0ALHQMVcG1Q+XZiOMP/2lgG/p3kQnu52TnDkGNgLdRW+6pVuJgzwkuQzf5MGJyLcy2bIz
 A2RGxoZ+7XA+tdn7NnTiKmYhI61CO8iTFFCFmzW4LvqZynX+m2vnd1JXOqSJG2PUWr1/OOpZ
 PlPzuG6O/oCxQ4Yv415Grdt7KQ/+9qw+OMKklU6RC3GPwaxF7dtAniaxs0e5KRCy4hQtRayR
 k/SqMJRPq+EOZ+9HVMcTOb/gj9vCR3AduHu0MkI
IronPort-HdrOrdr: A9a23:EToQC6EGnTFVO4TCpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.85,365,1624334400"; 
   d="scan'208";a="55311564"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/1] x86/pv: Split pv_hypercall() in two
Date: Mon, 11 Oct 2021 19:05:40 +0100
Message-ID: <20211011180541.24501-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Full perf anlaysis.  Time is raw TSC cycles for a xen_version() hypercall,
compared across the change in patch 1, with obvious obvious outliers excluded.
i.e. Idealised best case improvement.

Some general notes.  pv64 is `syscall`, while pv32 is `int $0x82` and
therefore has more overhead to begin with.  Consequently, dropping two lfences
is less of an overall change in the path.

First, AMD Milan (Zen3):

  $ ministat -A milan-hcall-pv64-{before,after}
  x milan-hcall-pv64-before
  + milan-hcall-pv64-after
      N           Min           Max        Median           Avg        Stddev
  x  98           420           460           440     438.97959     6.6564899
  +  98           360           440           380     370.81633      12.57337
  Difference at 95.0% confidence
          -68.1633 +/- 2.81674
          -15.5277% +/- 0.641656%
          (Student's t, pooled s = 10.0598)

  $ ministat -A milan-hcall-pv32-{before,after}
  x milan-hcall-pv32-before
  + milan-hcall-pv32-after
      N           Min           Max        Median           Avg        Stddev
  x  98          1900          2100          1980     1984.2857     22.291416
  +  96          1740          1960          1760        1767.5     35.688713
  Difference at 95.0% confidence
          -216.786 +/- 8.35522
          -10.9251% +/- 0.421069%
          (Student's t, pooled s = 29.6859)

Second, AMD Naples (Zen1):

  $ ministat -A naples-hcall-pv64-{before,after}
  x naples-hcall-pv64-before
  + naples-hcall-pv64-after
      N           Min           Max        Median           Avg        Stddev
  x  97           294           336           315     311.75258     10.207259
  +  97           252           273           252     257.41237     9.2328135
  Difference at 95.0% confidence
          -54.3402 +/- 2.73904
          -17.4306% +/- 0.878593%
          (Student's t, pooled s = 9.73224)

  $ ministat -A naples-hcall-pv32-{before,after}
  x naples-hcall-pv32-before
  + naples-hcall-pv32-after
      N           Min           Max        Median           Avg        Stddev
  x  98          1260          1470          1260     1276.2857     42.913483
  +  95          1218          1470          1239     1250.9368     52.491298
  Difference at 95.0% confidence
          -25.3489 +/- 13.5082
          -1.98614% +/- 1.0584%
          (Student's t, pooled s = 47.8673)

Third, Intel Coffeelake-R:

  $ ministat -A cflr-hcall-pv64-{before,after}
  x cflr-hcall-pv64-before
  + cflr-hcall-pv64-after
      N           Min           Max        Median           Avg        Stddev
  x 100           774          1024           792        825.04     73.608563
  +  95           734           966           756     787.74737     70.580114
  Difference at 95.0% confidence
          -37.2926 +/- 20.2602
          -4.5201% +/- 2.45567%
          (Student's t, pooled s = 72.1494)

  $ ministat -A cflr-hcall-pv32-{before,after}
  x cflr-hcall-pv32-before
  + cflr-hcall-pv32-after
      N           Min           Max        Median           Avg        Stddev
  x 100          2176          3816          2198       2288.84     196.18218
  +  99          2180          2434          2198     2232.4646     75.867677
  Difference at 95.0% confidence
          -56.3754 +/- 41.4084
          -2.46305% +/- 1.80914%
          (Student's t, pooled s = 149.013)

Fourth, Intel Skylake Server:

  $ ministat -A skx-hcall-pv64-{before,after}
  x skx-hcall-pv64-before
  + skx-hcall-pv64-after
      N           Min           Max        Median           Avg        Stddev
  x  99          5642          5720          5686      5686.303     17.909896
  +  98          5520          5544          5540     5536.0816       8.20821
  Difference at 95.0% confidence
          -150.221 +/- 3.89729
          -2.64181% +/- 0.0685382%
          (Student's t, pooled s = 13.9542)

  $ ministat -A skx-hcall-pv32-{before,after}
  x skx-hcall-pv32-before
  + skx-hcall-pv32-after
      N           Min           Max        Median           Avg        Stddev
  x  99          9296          9500          9308     9309.3131     20.418402
  +  96          9110          9266          9180     9175.2292     27.860358
  Difference at 95.0% confidence
          -134.084 +/- 6.84111
          -1.44032% +/- 0.0734868%
          (Student's t, pooled s = 24.3673)


I'm honestly not sure why Naples PV32's improvement is so small, but I've
double checked the numbers.  Clearly there's something on the `int $0x82` path
which is radically higher overhead on Naples vs Milan.

For the Intel numbers, both setups are writing to MSR_SPEC_CTRL on entry/exit,
but for Skylake it is the microcode implementation whereas for CLF-R, it is
the hardware implemenation.  Skylake has XPTI adding further overhead to the
paths.

Andrew Cooper (1):
  x86/pv: Split pv_hypercall() in two

 xen/arch/x86/pv/hypercall.c | 24 +++++++++++++++++++-----
 xen/arch/x86/pv/traps.c     | 11 -----------
 2 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.11.0


