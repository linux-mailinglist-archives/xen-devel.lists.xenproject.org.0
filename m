Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B374EEBC7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 12:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297322.506443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEod-0004F6-Ip; Fri, 01 Apr 2022 10:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297322.506443; Fri, 01 Apr 2022 10:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEod-0004C4-DN; Fri, 01 Apr 2022 10:47:39 +0000
Received: by outflank-mailman (input) for mailman id 297322;
 Fri, 01 Apr 2022 10:47:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bus8=UL=citrix.com=prvs=083938fea=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1naEob-00047q-79
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 10:47:37 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 234457a6-b1a9-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 12:47:35 +0200 (CEST)
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
X-Inumbo-ID: 234457a6-b1a9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648810055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lqhAYgH4gAJlMNkPJYi2gTZVGoHazDa+FAuusKfEXzU=;
  b=Ub2vah5eQlScxG2Nkf0Mzi17w+NDJfxOWXmTY3Qn4m1E3jXfWywCHngJ
   0B+tlEqmxjZubPrBj1LNs51vFhsmt7LhJHbXGbtnju7eQy8nKjuyjsHE8
   Yo50qFYyLCt1fyqw+p1f1MEJpr6FiVfUTp6O+ld3KZ0rtkZ2cMwOR5Csd
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68157099
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LKaSDapb7xR6bbkPvUp5wXEg2XdeBmJ9ZRIvgKrLsJaIsI4StFCzt
 garIBmPbP2Oa2v8L9pyOtzj/UoFu5HQzNRlHAJs/y5jEiMa8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Yqq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBHJfWork0ax1hDgZSEbdh25vAL0b4mJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI7zjfALADSJTKR6zM6PdT3Ssqh9AIFvHbD
 yYcQWQ/NUmfO0weUrsRIIk8oeCyvHO4SgZV+EKLpIgs00bDwDUkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3nsOGm3XKmDZVUkdPEwLm/7/p0SZSRu6zN
 WQ2wDAU8IEK8HW2afXRRTqbhHmKgFk1Do84//IB1CmBza/d4gC8D2cCTyJcZNFOiPLaVQDGx
 XfSwYq3WGUHXKm9DCvEq+zK9W/a1T09dzdqWMMScecSDzAPSqkXhwmHcNtsGbXdYjbdSWCpm
 GDiQMTTatwuYS83O0eToAivb9GE/MGhousJCuP/BD3NAuRRPtLNWmBQwQKHhcus1a7AJrV7g
 FAKmtKF8McFBoyXmSqGTY0lRe/1t6nYameE0A8yQvHNEghBHVb5Iui8BxkkeS9U3jssI2e1M
 Cc/RysPjHOsAJdaRfAuON/gYyjb5aPhCc7kRpjpgilmOfBMmPu81Hg2Pya4hjm1+GB1yP1XE
 crLIK6EUCdBYYw6nWXeegvo+eJyrszI7TiIHs6TItXO+ef2WUN5vp9ebgPUN7ppvf7cyOgXm
 v4GX/a3J9xkeLWWSkHqHUQ7dzjm8VBT6UjKlvFq
IronPort-HdrOrdr: A9a23:gpqRY63+DcCMaYwy7zceYgqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="68157099"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v9 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Fri, 1 Apr 2022 11:47:11 +0100
Message-ID: <20220401104713.22291-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  xen+tools: Report Interrupt Controller Virtualization capabilities on
    x86
  x86/xen: Allow per-domain usage of hardware virtualized APIC

 docs/man/xl.cfg.5.pod.in              | 15 ++++++++++++++
 docs/man/xl.conf.5.pod.in             | 12 +++++++++++
 tools/golang/xenlight/helpers.gen.go  | 16 ++++++++++++++
 tools/golang/xenlight/types.gen.go    |  4 ++++
 tools/include/libxl.h                 | 14 +++++++++++++
 tools/libs/light/libxl.c              |  3 +++
 tools/libs/light/libxl_arch.h         |  9 ++++++--
 tools/libs/light/libxl_arm.c          | 14 ++++++++++---
 tools/libs/light/libxl_create.c       | 22 ++++++++++++--------
 tools/libs/light/libxl_types.idl      |  4 ++++
 tools/libs/light/libxl_x86.c          | 39 +++++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++++
 tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c   | 17 ++++++++++++---
 tools/xl/xl.c                         |  8 +++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_info.c                    |  6 ++++--
 tools/xl/xl_parse.c                   | 19 +++++++++++++++++
 xen/arch/x86/domain.c                 | 29 +++++++++++++++++++++++++-
 xen/arch/x86/hvm/hvm.c                |  3 +++
 xen/arch/x86/hvm/vmx/vmcs.c           | 10 +++++++++
 xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++--------
 xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h    | 10 +++++++++
 xen/arch/x86/sysctl.c                 |  4 ++++
 xen/arch/x86/traps.c                  |  5 +++--
 xen/include/public/arch-x86/xen.h     |  5 +++++
 xen/include/public/sysctl.h           | 11 +++++++++-
 28 files changed, 280 insertions(+), 34 deletions(-)

-- 
2.11.0


