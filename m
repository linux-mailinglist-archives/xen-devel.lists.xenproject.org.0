Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660CF63DC0A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450104.707319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qxl-0006eG-FV; Wed, 30 Nov 2022 17:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450104.707319; Wed, 30 Nov 2022 17:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qxl-0006Wx-AS; Wed, 30 Nov 2022 17:33:37 +0000
Received: by outflank-mailman (input) for mailman id 450104;
 Wed, 30 Nov 2022 17:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0Qxj-00053d-OM
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:33:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cf9c908-70d5-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 18:33:33 +0100 (CET)
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
X-Inumbo-ID: 1cf9c908-70d5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669829613;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1DtJVEJDuLs3FUpxmGPE7DJyqdoBc05y8Jvs9j/LnvE=;
  b=fMZ9hJ1QkRo8MZM28UC277p+pvl1EpZI5sz1aAkdhgzP/BJvNz3hAGjM
   ZkqMhYIEAgMe678iuARGqgS3EEX0WcEoruxnmqG2JFifm2ZMJ8VOUS6no
   Gpq9NYc9vZmQpVD+E3OnEkvtMdV4jA48j5aMIyRfAEv8bna4/x0Lo0pH6
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 84930632
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g3UpkaAHq4F/ixVW/+Hjw5YqxClBgxIJ4kV8jS/XYbTApDJ30WEEz
 jYWXD2EPa2DM2X0eI8jPt+39x9TvZ+BxoJmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpD5gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3+NKDDt1y
 80hLHMTNxG7nfyn6r2iY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/BZ4gneHumn7ldD5wo1OJv6snpWPUyWSd1ZC9bIuOIoLRH625mG7Gh
 SHZvE6nWysxNYaB1gqf7W2CxermyHaTtIU6S+Tjq68CbEeo7mAaFhA+T1awpvi9zEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceXic23
 1WEm9foAz1Hs7CPT3+ZsLCOoluaJiw9PWIEIygeQmMt4cTnoYw1pgLCSJBkCqHdszHuMWium
 XbQ9nF43uhNy55Qv0mmwbzZqxepm5WTdTAE3wGUQDuk1hlndaSqfqX9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr3vqjYaVUwlXYqRsB8rGr1pxZPaKgKuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPIUOvCdlyfdpkmCgHJ8OEiz+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlkUX4jeTAOSDJFelt3L6yggYRtvvsTOL9q
 oY3Cid3408HDL2Wjtf/rub/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNhMi6epJRmCRpIwMzr2g1
 ijkCidlJK/X2SWvxfOiNioyN9sCnP9X8RoGAMDbFQ/ziiJ6PtbytP53mlleVeBPydGPBMVcF
 5EtE/hsyNweFFwrJxx1gUHBkbFf
IronPort-HdrOrdr: A9a23:dVHzEa9bABD2WhQuQeluk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="84930632"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v1 0/5] OCaml bindings for hvm_param_get and xc_evtchn_status
Date: Wed, 30 Nov 2022 17:32:32 +0000
Message-ID: <cover.1669829264.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add bindings to xc_evtchn_status and hvm_param_get, useful for xenopsd
and for recovery from failed live updates.

.editorconfig helps me format the source code with the desired Xen
coding style (now that the reindent patch has switched it to spaces as
desired by the Xen project).
If you don't have an editor set up to use editorconfig this is a no-op.

.clang-format is an experiment for the OCaml subtree in slowly moving
its code to be closer to the Xen coding style. There is no Xen coding
style as such in clang-format, this takes GNU as a base and tweaks it to
be as close to CODING_STYLE as possible (there is just one different in
handling of do/while as far as I can tell).
It should be an improvement over the current situation where the OCaml C
bindings do not follow Xen coding style, and further bindings added that
follow the style of the code around them would not follow it either.
It doesn't yet reformat anything with it, just allows someone that
submits patches to use it if desired (e.g. on new code).

Edwin Török (5):
  CODING-STYLE: add .editorconfig to clarify indentation uses spaces
  tools/ocaml/libs/xc: add binding to xc_evtchn_status
  tools/ocaml/libs/xc: add hvm_param_get binding
  tools/ocaml/libs/xb: add missing stdint.h
  CODING_STYLE: add .clang-format

 .editorconfig                       | 20 +++++++
 tools/ocaml/.clang-format           |  9 ++++
 tools/ocaml/libs/xb/xenbus_stubs.c  |  1 +
 tools/ocaml/libs/xc/xenctrl.ml      | 58 +++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 60 +++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 81 +++++++++++++++++++++++++++++
 6 files changed, 229 insertions(+)
 create mode 100644 .editorconfig
 create mode 100644 tools/ocaml/.clang-format

-- 
2.34.1


