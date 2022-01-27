Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD949E721
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261603.453107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7LQ-0000Iz-Sy; Thu, 27 Jan 2022 16:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261603.453107; Thu, 27 Jan 2022 16:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7LQ-0000Fx-Pl; Thu, 27 Jan 2022 16:09:56 +0000
Received: by outflank-mailman (input) for mailman id 261603;
 Thu, 27 Jan 2022 16:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5DO=SL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nD7LP-0000Fm-7U
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:09:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f715695-7f8b-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 17:09:54 +0100 (CET)
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
X-Inumbo-ID: 8f715695-7f8b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643299794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K2xsJnp3zQK3VEYzJLhPGSNdCwaw8xe+brV1B1jBPsk=;
  b=c6lPwo+wkLPp8aUM74xeguj1blshSkUYt246TaIEM1MKkMF+Gw/QEnnJ
   DWzMhf23JktSZW8IobthTdhi9Zjb25vpyFZ2oIIL9u/yFf3Mwq8RDxoxs
   KU5VyiPkhpJ+sahWHZ3lDX2aKxxlrBiGJbkrgfomp4HdGa7haIaCkDLUM
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ldjjz8wtLgAs+I3lj8LjWbfLxk5kXdD9XWqvTJZpwJCENeh3pIgPhty98JQFBRKQk5r5yEUsmh
 u4GCeQ8po6siWNSndBoPoxU+ph/DSpTten8Z3bu17CCwKFeN0CvFrRxRghlQaZIVr1XwzNdEsy
 LjRvr48ZjLYhd5Ly7CphmEGY7b2JygTyUbMCC6KKXJuRpOpL2xQzGST6kc58sOnieWEpn93JSP
 sQIUdvJpUxuJ2hZE00XjC3OH41YDx8t+/bng4Ho+que1SvJurTriHRQQ2WWcukPs7RaOBpbwHT
 y+Ba10iMYKAa/pPDSQ519t8+
X-SBRS: 5.2
X-MesageID: 62827763
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zVRsEquyjvIULaSaGxwxk217g+fnVGFZMUV32f8akzHdYApBsoF/q
 tZmKW+OafqIa2anfdsgb4W+phsEuZXXz4NrQANqqXwzRXkS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24fhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliIaZRxgSBoz3m6cQawR3SzpvE6Nh9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 ZpDNmUxN3wsZTVWNVMNLZ8DnN2HjybiKA91tQLNqYAetj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWZsh2J
 VMvwgsVrus/zFGEFsLscROfryvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWj81XHnid2lpAQ6QlqCZvu207uUr+tmtEiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUHrlWRurxvKjYaGCN6bKKI3XH327zk5JEVdsIiAyS2W8zappUEdMXS
 BG7VfxtCG97YyLxMP4fj3OZAMU216nwfekJpdiPBueilqNZLVfdlAk3PBb49zm0zCAEzP9jU
 b/GL5fEJStKWMxPkWvtL89AgOBD+8zL7T6JLXwN5075geP2ib/8YeptDWZimchgvPrb+12Eq
 ogGXyZIoj0GONDDjuDs2dZ7BTg3wbITXPgacuRbKbyOJBRIAmYkB6ODyL8tYdU9za9Uiv3J7
 je2XUoBkAjzgnjOKAOrbHF/aeywAcYj/CxjZSF8b0y133UDYJq06PtNfZUAYrR6pvdoyuR5T
 qdZdpzYUOhPUDnO5x8UcYL58N55bB2uiA/XZ3ilbTEzcoROXQvM/tO4LALj+DNXVni8tNcko
 q3m3QTeGMJRSwNnBcfQSfSu01Lu4iRNxLMsBxPFe4ABdl/t/Y5mLz3KosU2e8xcew/ewja61
 hqNBUtKr+f6vIJoosLCgrqJrtn1HrImTFZaBWTS8Z2/KTLeoji42YZFXeuFIWLdWWfz9Pnwb
 OlZ1aihYvgOnVIMuItgCbd7i6k54oK39bNdyw1lGlTNbkiqVew8ciXXg5EXu/0f3KJdtCu3R
 lmLq4tTNri+Mc/4FEIceVg+ZeOZ2PBIwjTf4JzZ+qkhCPObKFZfbXhvAg==
IronPort-HdrOrdr: A9a23:dK8cjK6NYUDHWobjcAPXwMbXdLJyesId70hD6qhwISY1TiX+rb
 HJoB17726StN9/YgBCpTntAsa9qBDnhPpICOsqTNWftWDd0QPCRuwP0WKL+UyYJ8SUzI5gPM
 lbHZSWcOeAaGRHsQ==
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62827763"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] x86/cpuid: Disntangle, and PPIN
Date: Thu, 27 Jan 2022 16:09:37 +0000
Message-ID: <20220127160940.19469-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Work to disentangle new feature addition, using PPIN as an example.

Andrew Cooper (1):
  x86/cpuid: Disentangle logic for new feature leaves

Jan Beulich (2):
  x86/cpuid: Infrastructure for leaf 0x00000007:1.ebx
  x86/Intel: use CPUID bit to determine PPIN availability

 tools/misc/xen-cpuid.c                      |  6 +++
 xen/arch/x86/cpu/common.c                   | 57 +++++++++++++++--------------
 xen/arch/x86/cpu/mcheck/mce_intel.c         | 10 ++++-
 xen/include/public/arch-x86/cpufeatureset.h |  3 ++
 xen/include/xen/lib/x86/cpuid.h             |  7 ++++
 xen/tools/gen-cpuid.py                      |  2 +
 6 files changed, 56 insertions(+), 29 deletions(-)

-- 
2.11.0


