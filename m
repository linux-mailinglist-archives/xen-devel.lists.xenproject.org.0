Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7750E49E6F7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:03:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261590.453085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7FJ-00077n-Q2; Thu, 27 Jan 2022 16:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261590.453085; Thu, 27 Jan 2022 16:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7FJ-00075B-Lw; Thu, 27 Jan 2022 16:03:37 +0000
Received: by outflank-mailman (input) for mailman id 261590;
 Thu, 27 Jan 2022 16:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTCZ=SL=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nD7FH-0006fm-Ck
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:03:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac83f755-7f8a-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 17:03:34 +0100 (CET)
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
X-Inumbo-ID: ac83f755-7f8a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643299413;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1bf6JjPGyis6Uey5ekjwWrZErtd0uOwOSZeLgjdY1Gs=;
  b=gxOXC638Jo1Fa034UrjrMfly9P1jX1gqCRxdjMznr5hTZMSHWcTIgFUx
   a0x5qcEWkpvuHYjJHEPFKMjgnfje1jqAksZkHDELggMQBwVS9/2JuEAMo
   53f0pnOr8OF0yfXBxwvHe2PAN9PrkNXiKUK9CCkxB7BPCKQ4nIytWQsvn
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eRLvSCagbh6y1l7lOooc1LIdhv+2d7sa+xzV/yh3T5bWnmmTMqPMf0nq6BBkU7kqSauYRh0bJa
 dBaKsVm0vhbZFf4oX82h81L181oYrmcrGcD1SbzpbqvMSmkQuEokwCk8RanIJUU88CiRG0w2qE
 mgc8nLQyQ37X8kkWE4Vo08nNJ1xj03Rev2DTtdkUmzzpKl1/jgCxqdtCgsTDIRPAM3By7Efj+r
 qWy+xg/u+02aLHMIlt0bQJXqDCR2h6kBKa+ybhEnR0hGrh04VII2fuenooE9w8hyDVCsg6L3Wx
 4WRZL9eYxGnSa6KBJ6Zygsru
X-SBRS: 5.2
X-MesageID: 62376352
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h+F4hauvpMBvf/qAdBz1EWm/5+fnVGFZMUV32f8akzHdYApBsoF/q
 tZmKTuOO/qKZmCmL9p/Ody+80kG6MSDn9ZnSVA6+Hw2QnsR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24fhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl656RVhciIpH2tsc0egVnAg5aMLdn9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DHooZtzdFxDXQCf8gTLjIQrnQ5M8e1zA17ixLNaiEP
 JVHMmc1BPjGSxRsEEscS80Ups6L1lXmVTQI+FKUopNitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0ML/+D5XhqKQs2gfKgDVOVltGDjNXvMVVlGbgWfNAO
 0cIxhAAjoEb6HO6Yf3wRTy39SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVscgOteODKp+dtG2V0i
 wbhc8fBQGU27ebLES71GqK88GvqURX5O1PucsPtoeEtx9D46L8+gRvUJjqIOP7k14alcd0cL
 t3jkcTfu1nxpZNTv0lY1Qqe695JmnQvZlRojukwdjn9hj6VnKb/O+SVBaHztJ6s1rqxQFibp
 2QjkMOD9u0IBpzlvHXTHL5XR+nyuavdbWy0bbtT838JrWrFF5mLJtg43d2DDB0xbpZslcHBP
 ic/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKDgWfqu8Uza6WbAoLFXv1Hg3PSa4hjmx+GBxz/1XE
 crFIK6EUCZLYYw6nWHeb7pMjtcWKtUWmDm7qWbTlUr3iNJzpRe9FN84Dbd5Rrlptfzf+FSMr
 Y832gnj40w3bdASqxL/qeY7RW3m51BgWvgacuRbKbyOJBRIAmYkB6ODyL8tYdU9za9Uiv3J7
 je2XUoBkAjzgnjOKAOrbHF/aeywAcYj/CxjZSF8b0y133UDYJq06PtNfZUAYrR6pvdoyuR5T
 qdZdpzYUOhPUDnO5x8UcYL58N55bB2uiA/XZ3ilbTEzcoROXQvM/tO4LALj+DNXVni8tNcko
 q3m3QTeGMJRSwNnBcfQSfSu01Lu4iRNxLMsBxPFe4ABdl/t/Y5mLz3KosU2e8xcew/ewja61
 hqNBUtKr+f6vIJoosLCgrqJrtn1HrImTFZaBWTS8Z2/KTLeoji42YZFXeuFIWLdWWfz9Pnwb
 OlZ1aihYvgOnVIMuItgCbd7i6k54oK39bNdyw1lGlTNbkiqVew8ciXXg5EXu/0f3KJdtCu3R
 lmLq4tTNri+Mc/4FEIceVg+ZeOZ2PBIwjTf4JzZ+qkhCPObKFZfbXhvAg==
IronPort-HdrOrdr: A9a23:Uqffyqzeo/hwunWLdFSeKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62376352"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Thu, 27 Jan 2022 16:01:31 +0000
Message-ID: <20220127160133.11608-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  xen+tools: Report Interrupt Controller Virtualization capabilities on
    x86
  x86/xen: Allow per-domain usage of hardware virtualized APIC

 docs/man/xl.cfg.5.pod.in              | 10 +++++++
 docs/man/xl.conf.5.pod.in             | 12 ++++++++
 tools/golang/xenlight/helpers.gen.go  | 16 +++++++++++
 tools/golang/xenlight/types.gen.go    |  6 ++++
 tools/include/libxl.h                 | 14 +++++++++
 tools/libs/light/libxl.c              |  3 ++
 tools/libs/light/libxl_arch.h         |  9 ++++--
 tools/libs/light/libxl_arm.c          |  9 ++++--
 tools/libs/light/libxl_create.c       | 21 ++++++++------
 tools/libs/light/libxl_types.idl      |  4 +++
 tools/libs/light/libxl_x86.c          | 54 +++++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++
 tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++
 tools/xl/xl.c                         |  8 ++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_info.c                    |  6 ++--
 tools/xl/xl_parse.c                   | 14 +++++++++
 xen/arch/x86/domain.c                 | 27 +++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmcs.c           | 10 +++++++
 xen/arch/x86/hvm/vmx/vmx.c            | 13 +++++----
 xen/arch/x86/include/asm/domain.h     |  4 +++
 xen/arch/x86/include/asm/hvm/domain.h |  6 ++++
 xen/arch/x86/sysctl.c                 |  7 +++++
 xen/arch/x86/traps.c                  |  6 ++--
 xen/include/public/arch-x86/xen.h     |  6 ++++
 xen/include/public/sysctl.h           |  1 +
 26 files changed, 258 insertions(+), 24 deletions(-)

-- 
2.11.0


