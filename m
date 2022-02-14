Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12DC4B5121
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271778.466506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb46-0007Ce-Dr; Mon, 14 Feb 2022 13:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271778.466506; Mon, 14 Feb 2022 13:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb45-00073a-Jj; Mon, 14 Feb 2022 13:06:49 +0000
Received: by outflank-mailman (input) for mailman id 271778;
 Mon, 14 Feb 2022 13:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2m-00023t-1B
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c68bdee8-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:26 +0100 (CET)
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
X-Inumbo-ID: c68bdee8-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lbPgCP8QoZ01MqJuej5y09QKl0+j0oj0HAV2tSG7L3Y=;
  b=B85S8KRwksAn8Txd/WPly7ZCG5YItRUYEyuEDyrYT4APvJttNcS2Puev
   Ru3qJETC+7kYim03NOmOhr6bUI2UJioA5p4xbaeE5SPwdoR1ewM1pZxtu
   KC4ASGFU60GtShG2PLUBpLBxNkU38P7mizqNxmhlmcHt/te4t826TSq6d
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C5OFwtAmVeQx/l/W1+zxTCPYzAL33kpFmtq11yYcexwEXk3WumaJv4/kPNy+y+vXMcehNRqhSI
 vNMYItHP8XV5HCyQtSPXghpiniZ9SdWrrh9HotU79Ab/WM7GjsklA3LFPiuCvgZuIc6eUlNo1t
 SbRA4o6837H8grJxLmLRD8XWvGp8TChY+EvJC8nRMD33q0ljspBdAeUTZGcWNPNm+/SYvIhZPT
 1u22/KG3Mgi29pjznTtBGzB/oHkCDWg53epH9OthCbXNCXhTM3oTTv2KWqW/mXVpeyq6nt0LtS
 senlb8Z1rOZQZg5/l6bNP2CJ
X-SBRS: 5.1
X-MesageID: 64149405
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:I3aBJawKCesvIw+J3Px6t+cIwSrEfRIJ4+MujC+fZmUNrF6WrkVVz
 WsbXm3XMvnbYjP9ftt3Pd6zpElUsMLXm4A3SAtuqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt41Wz
 49jsre8dScOHerLtPszCUBUKAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JwXQaeCP
 5dxhTxHUA/7Yz51fUksDZswgqCRu0PWaCRcpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZBfN0KPeoR5D2t7YmT5CqGKDJdQgVoPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP/D2BLwQKChRqlEGp+ZgPf1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyL8LdANvWknfx0B3iM4ldjBO
 hG7hO+szMULYCvCgVFfP+pd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs/lmEr
 YYHb5HSo/idOcWnChTqHUcoBQhiBRAG6Vre8aS7r8aPfVhrHn8PEfjUze9zcoBphf0NxOzJ4
 mu8SglTz1+m3S/LLgCDa3ZCbrLzXMkg8SJnbHJ0ZVv4iWI+ZYuP7bsEc8dld7cQ6+E+n+V/S
 OMIepvcD60XGCjH4TkUcbL0sJdmKEawnQuLMif8OGo/cpdsShbn4NjhegezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeIRy+/pJrJir9iu4MD/sNcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD3QCDH09aGla
 bkHxv3wKqRazlNDso46GLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeaOeAN87SGVIMIBYoM7aY3vYOlziOtfk4LS0WPsOsEGZrhamKAySxtQ==
IronPort-HdrOrdr: A9a23:yWBmNqMTrwcGn8BcTsWjsMiBIKoaSvp037Eqv3oRdfU1SL3hqy
 nApoV56faZslkssTQb6LS90cq7MArhHPxOkOss1N6ZNWGM0gbFEGgh1/qE/9SJIVyZygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149405"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 60/70] x86: Use control flow typechecking where possible
Date: Mon, 14 Feb 2022 12:51:17 +0000
Message-ID: <20220214125127.17985-61-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Now all callees have been annotated, turn on typechecking to catch issues in
the future.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

RFC.  This is still an experimental compiler extention
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102953

However, it is also the entire basis of being able to sanely use
-mmanual-endbr in the first place, so is very important.
---
 xen/arch/x86/arch.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 8b88f0240e85..1710d056af3f 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -49,6 +49,7 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
 
 ifdef CONFIG_XEN_IBT
 CFLAGS += -fcf-protection=branch -mmanual-endbr
+$(call cc-option-add,CFLAGS,CC,-fcf-check-attribute=no)
 else
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
 endif
-- 
2.11.0


