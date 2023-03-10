Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328016B5209
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 21:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508583.783380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajUe-0007IU-6Z; Fri, 10 Mar 2023 20:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508583.783380; Fri, 10 Mar 2023 20:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajUe-0007GD-1x; Fri, 10 Mar 2023 20:37:36 +0000
Received: by outflank-mailman (input) for mailman id 508583;
 Fri, 10 Mar 2023 20:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIN=7C=citrix.com=prvs=426914f36=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pajUc-0007G2-Ch
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 20:37:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f7b3934-bf83-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 21:37:30 +0100 (CET)
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
X-Inumbo-ID: 5f7b3934-bf83-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678480650;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jFzBoDKTtuF+GO/ELlQsUz1UPEnhhesb0CRGuBAV2lU=;
  b=JHxj/eW84l/+jTXJ/JdUMXArDen/um4IIvwpqh6lWlxnH8TzQ9QzgcpL
   e7J85RzwBFb4ei0RwcsRvuv8rUYAdBKoZFZPfYs4m/Lm/7dkPbBHMtAoh
   9myaBFh389N7edqeCXsuXmzR6u3mttERBaEHfLS0cuf/HUHaGcxjs3Dkw
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100282287
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:q+DLdKnHtzddvNaT5t4WsK/o5gyhJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcXz3VPanfZDehLtt/bIy38EIO7cOHzdBlGQVq/Hw2EiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QeGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cJJcRwGbB2ivM+vzqqDTbZlo+oCc/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A/
 jiWpT6pXXn2MvSzyB+96l2rl9bWvjv3CaMDTp+09vRl1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDht9/gGzFHqrCeTnOZsLCOoluP1TM9dDFYI3VeFE1cvoel+dto5v7Scjp9OJDk1/H+GzzR+
 B2TojAGgOoaqOAqiJzuqDgrnAmQjpTOSwc04CDeUWSk8h51aeaZWmC41bTIxa0eddjEFzFtq
 FBBwpHDt75WUflhgQTXGI0w8KeVC+Fp2dE2qXpmBNEf+juk4BZPlqgAsWgldC+F3ivpEAIFg
 XM/WysLuPe/31PwN8ebhr5d7Ox7pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLpbwUi1AWPo6kGPeqwIhPVgDnHxW+I8ubcqjk0TPPUS2PhZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8UjyqZKdQpiBSFiVfjLRzl/KrbrzvxORDtwVJc8ANoJJ+RYokiivryTp
 y3jBBcGlAKXaL+uAVziV02PoYjHBf5XxU/X9wR2Zj5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:4Mk1I61SemKrb7DD4LFhKwqjBfdyeYIsimQD101hICG9E/bo4v
 xG+c5xuyMc5wxwZJheo6H9BEDtexLhHP1OkPos1MmZLWvbUQKTRekJ0WKI+UyCJ8SRzJ856U
 9qG5IOd+EZZTJB4foTi2ODfOrJD7O8nZyAtKPm6zNIcCkvUqdn6m5Ce3Sm+o8dfng5OXL8fq
 DslvauYlCbCAUqh7+Adx04dtmGncTPiJXlJTYeHnccmXCzpALt0qf+Dx+bmjwDUzZDqI1SjF
 TtokjC/6C+tPP+7RfZ2wbonvNrseqk8MJHGMuPzu4KLTn24zzYArhJavm5pTUop+Pq0nYG+e
 O82ysIDoBI8nbMeWPwmxf3xAX69z4r5xbZuCSlqEqmm9X9WDU5T/VMnphYdByx0TtbgO1B
X-IronPort-AV: E=Sophos;i="5.98,250,1673931600"; 
   d="scan'208";a="100282287"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edwin.torok@cloud.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH 0/3] x86: Minor improvements to xen-cpuid
Date: Fri, 10 Mar 2023 20:37:09 +0000
Message-ID: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All to make it easier to do CPUID development work (which is fairness is
mostly me).

Andrew Cooper (3):
  tools/xen-cpuid: Support dash as a bitmap delimiter
  tools/xen-cpuid: Rework the handling of dynamic featuresets
  x86/sysctl: Retrofit XEN_SYSCTL_cpu_featureset_{pv,hvm}_max

 tools/misc/xen-cpuid.c          | 60 +++++++++++++++------------------
 tools/ocaml/libs/xc/xenctrl.ml  |  8 ++++-
 tools/ocaml/libs/xc/xenctrl.mli |  8 ++++-
 xen/arch/x86/sysctl.c           |  4 ++-
 xen/include/public/sysctl.h     |  2 ++
 5 files changed, 46 insertions(+), 36 deletions(-)

-- 
2.30.2


