Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB01725AAD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544613.850521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6paW-0003K8-HG; Wed, 07 Jun 2023 09:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544613.850521; Wed, 07 Jun 2023 09:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6paW-0003Gu-EP; Wed, 07 Jun 2023 09:36:20 +0000
Received: by outflank-mailman (input) for mailman id 544613;
 Wed, 07 Jun 2023 09:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6paU-0003Go-Vk
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:36:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfb28676-0516-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:36:17 +0200 (CEST)
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
X-Inumbo-ID: bfb28676-0516-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686130577;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MfqlRSKXjNcHMQl9hIr6JSkINcyXDDRVYu2HzQ0JtB0=;
  b=En3l1iuz9Qs2fybYCuaGQd8lpi+CdgfV44X/tktxd0TuSHVZZKkVjFlS
   iDUVk58oQNL0neztsrLwBNlpiFUYnORXyOuXCrt7kuYLtFQlIRLRwSfo0
   +d7rnBFqccdWPVvVOAUtOTjQFCudrHJG8DmjZGps2NEK62bPPA3E/IZ6f
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111773754
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:MEAaPKLHbTh9+0qBFE+R/JUlxSXFcZb7ZxGr2PjKsXjdYENShWMBy
 2UZUTuCOaqNMWbyc9AgbY/n8RlXusfTz4NgGlRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5RDzpK+
 PwBIgk0Y06DqdmnwKmAE7NF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJwKwR3H+
 z6uE2LRUzsaG87G2T28wnOKnNDFzSKqW64rC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQNknv88/QXotz
 E2Em/vgADApu7qQIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bqByUSttjCaSMt9CrGR/L0
 jCRl3FkruBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWWxC
 KMwkVkLjHO2AJdNRfEfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ8z/lgZ
 83HKpfwVB727JiLKhLsH4/xNpdxn0gDKZ77H8inn3xLL5LADJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3CYXDjt3s2ddLdzgidCFrba0aXuQLLoZv1CI6QjB+YxIQqJt9E7FYc1N9z7yZr
 y/sAhADlTISRxTvcG23V5yqU5u3Nb4XkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:CICXH6vAlFIGZtQxAckkntPI7skCQYAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwSZVpQRvnhOdICPoqTMeftWjdySqVxeRZh/qB/9SOIVyCygcw79
 YGT0E6MqyPMbEYt7e73ODbKadd/DDvysnB6ImuqgYIcegpUdAe0+4QMG2m+yZNNXF77O8CZe
 ChD7181kGdkBosH6KG7o9pZYf+Tw6nruO4XfbOaiRK1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yDp+6m5tPm/6xnEk0ve9Y5fltfNwsZKQJXksLlWFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5zswIshp7HvVX2et5T/gwRPp3joC42LrjXWYnXzgi8rkQy9SMbsDuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0D4fuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjfkVyhUsZqRt0YIb0+7q3s5y5eoOv9t7SpEJn4jtZUid7E7hc8Aotd/lr
 j52+9T5cJzp4ctHNBA7aE6MI6K4yX2MGbx2G7+GyWTKIgXf33KsJL5+7Mz+aWjf4EJ1oI7nN
 DbXEpfrnNaQTOjNSSi5uwAzvn2ehTxYR39jsVFo5RpsLz1Q7TmdSWFVVA1isOl5/ESGNfSVf
 q/MI9fR6aLFxqhJa9ZmwnlH5VCI3gXV8MY/t49RlKVu8rObonnrPbSfvrfLKfkVTwkRmT8CH
 0eWyWbHrQO0mm7HnvjxBTBUXLkfULyuZp2DajB5uAWjJMAM4Vd2zJlwmhRJvv7YQGqnpZGNX
 eWeomX5Z9TjVPGi1r10w==
X-Talos-CUID: 9a23:uBm3RmG5nCQlgtDmqmJB+hUQF8A8eETkwSnQDXSpCX1SEee8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AfRWN/wyknWPvHv1ojSMHZI2S2JWaqPWECG8fyIU?=
 =?us-ascii?q?BgvmFEzZPMWec3Tebe5Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="111773754"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] CI: Fix the github actions Coverity run
Date: Wed, 7 Jun 2023 10:36:12 +0100
Message-ID: <20230607093612.2219286-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The Install step is failing with:

  Package python-dev is not available, but is referred to by another package.
  This may mean that the package is missing, has been obsoleted, or
  E: Package 'python-dev' has no installation candidate
  is only available from another source
  However the following packages replace it:
    python2-dev python2 python-dev-is-python3

which is a side effect of ubuntu-latest having changed from 20.04 to 22.04.

Drop python-dev as python3-dev is already present, and used a fixed runs-on to
avoid such problems in the future.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>

Untested.  This needs to be committed and wait until the next cron on the main
repo (which has the appropriate secret token) for an end-to-end test.
---
 .github/workflows/coverity.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index 427fb86f947f..60ac8dee5570 100644
--- a/.github/workflows/coverity.yml
+++ b/.github/workflows/coverity.yml
@@ -8,7 +8,7 @@ on:
 
 jobs:
   coverity:
-    runs-on: ubuntu-latest
+    runs-on: ubuntu-22.04
     steps:
     - name: Install build dependencies
       run: |
@@ -18,7 +18,7 @@ jobs:
           libbz2-dev e2fslibs-dev uuid-dev ocaml \
           ocaml-findlib libyajl-dev \
           autoconf libtool liblzma-dev \
-          python3-dev golang python-dev libsystemd-dev
+          python3-dev golang libsystemd-dev
 
     - uses: actions/checkout@v2
       with:
-- 
2.30.2


