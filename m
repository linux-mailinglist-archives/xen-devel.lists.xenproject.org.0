Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D74BBE6F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 18:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275588.471543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL75A-0006Os-Td; Fri, 18 Feb 2022 17:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275588.471543; Fri, 18 Feb 2022 17:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL75A-0006Ly-Q1; Fri, 18 Feb 2022 17:30:12 +0000
Received: by outflank-mailman (input) for mailman id 275588;
 Fri, 18 Feb 2022 17:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nO3j=TB=citrix.com=prvs=0411eaaf8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nL759-0006Ln-EJ
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 17:30:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69c467d6-90e0-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 18:30:09 +0100 (CET)
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
X-Inumbo-ID: 69c467d6-90e0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645205409;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v5AvBjRUda1vG0duvK2xZJ6G9uVS/XVqZUB9W75c8Xk=;
  b=GqppBh4XvbCumP2TFlfv0iP0JpSn1KJXXo4o0yi4GWcBVmU+G+1Cg3g6
   wVmC6AjCNBM0LMoDj54aqHaYCmRnGIkcScyiR0SD1WYexRg6pYdrzgiiI
   LBUewqZQWDXeiDvOOzAbsR/dtBaW9cpLVw86z/qszAWl4uAmB458goYK7
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66781801
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xfNoCK4emkqjc9S2JuY+1gxRtF3HchMFZxGqfqrLsTDasY5as4F+v
 mtMCD/Xa/mLMGajed4iYYS2ox4C6pTXzodkGlNk+Ck0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLgU1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSpGD4lJIKWmd4DCSkAMRlBEalKxPjudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs9s3dtixTQCf8iSJbOa67L+cVZzHE7gcUm8fP2O
 ZRGOWM/NE2ojxtnAGkbL51mp86T22jSLzMGl36c+Kkm7D2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16KVGj3qc02hvJnDVVUUBIEwvgyRWktqKgc8sOE
 kAO1XAvl7ZoxBSJdubRWxGE51fR63bwROFsO+E97QiMzI/d7ACYGnUIQ1Z9VTA2iCMlbWd0j
 wHUxrsFERQq6eTIEizFqt94uBvvYXB9EIMUWcMToeLpCfHHqZp7sB/AR80L/EWd3oysQmGYL
 9xnQUEDa1QvYSwji/TTEbPv2WvESn31ougdv1S/soWNtF4RWWJdT9b0gWU3FN4ZRGpjcnGPv
 WIfh++V5/0UAJeGmUSlGbtRQejzu67UbGOF2zaD+qXNERz0qhZPmqgKvVlDyLpBaJ5YKVcFn
 meI0e+u2HOjFCTzNvImC25AI88r0bLhBbzYugP8NbJzjmxKXFbfpklGPBfIt0i0yRREufxva
 P+zLJf3ZV5HWPsP8dZDb7pEuVPd7ntlnj27qFGS50nP7Idyk1bPF+9eaQPWNrpRAWHtiFy9z
 uuz/vCik313ONASqAGMmWLPBTjm9UQGOK0=
IronPort-HdrOrdr: A9a23:5xoZb6hrwpuMp02d1wpNC5kQAHBQXtQji2hC6mlwRA09TySZ//
 rOoB19726TtN9xYgBGpTnuAtjifZqxz/FICOoqTNOftWvdyQmVxehZhOOIqVCNJ8SXzJ8l6U
 4KSchD4bPLY2SS9fyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="66781801"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v3 0/2] xen+tools: Report Interrupt Controller Virtualization capabilities on x86
Date: Fri, 18 Feb 2022 17:29:41 +0000
Message-ID: <20220218172943.12182-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  xen+tools: Report Interrupt Controller Virtualization capabilities on
    x86
  x86/xen: Allow per-domain usage of hardware virtualized APIC

 docs/man/xl.cfg.5.pod.in              | 19 +++++++++++++++++
 docs/man/xl.conf.5.pod.in             | 12 +++++++++++
 tools/golang/xenlight/helpers.gen.go  | 16 ++++++++++++++
 tools/golang/xenlight/types.gen.go    |  4 ++++
 tools/include/libxl.h                 | 14 +++++++++++++
 tools/libs/light/libxl.c              |  3 +++
 tools/libs/light/libxl_arch.h         |  9 ++++++--
 tools/libs/light/libxl_arm.c          | 12 +++++++++--
 tools/libs/light/libxl_create.c       | 22 ++++++++++++--------
 tools/libs/light/libxl_types.idl      |  4 ++++
 tools/libs/light/libxl_x86.c          | 39 +++++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++++
 tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c   | 16 ++++++++++----
 tools/xl/xl.c                         |  8 +++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_info.c                    |  6 ++++--
 tools/xl/xl_parse.c                   | 16 ++++++++++++++
 xen/arch/x86/domain.c                 | 28 ++++++++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmcs.c           | 11 ++++++++++
 xen/arch/x86/hvm/vmx/vmx.c            |  8 +++----
 xen/arch/x86/include/asm/domain.h     |  3 +++
 xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
 xen/arch/x86/sysctl.c                 |  7 +++++++
 xen/arch/x86/traps.c                  |  8 +++----
 xen/include/public/arch-x86/xen.h     |  2 ++
 xen/include/public/sysctl.h           | 11 +++++++++-
 27 files changed, 269 insertions(+), 31 deletions(-)

-- 
2.11.0


