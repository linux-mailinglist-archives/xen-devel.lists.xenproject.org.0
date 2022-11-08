Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB0621861
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440120.694194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcd-0001zY-6Y; Tue, 08 Nov 2022 15:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440120.694194; Tue, 08 Nov 2022 15:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcd-0001wo-2z; Tue, 08 Nov 2022 15:34:43 +0000
Received: by outflank-mailman (input) for mailman id 440120;
 Tue, 08 Nov 2022 15:34:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQcb-0001RY-Im
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db8e61fb-5f7a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:34:39 +0100 (CET)
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
X-Inumbo-ID: db8e61fb-5f7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pDZRvWvsQxrzElkdZ92H76eH11jyJymBHtOb1jyOElc=;
  b=AwzhyVmwrh+xJ/s558SZMuTamdfqoH3pR+82m5jC4nGvwqjb0eRP6EYy
   atPRCUxlWLMXmcjMjAkkzOWgK+eYdmMZVkhnSm1G4j2AiA//AkkTmqwuK
   3wqFBS+AxK1Kd4B22/LefVuSztHqoNpxUPccLec4z/SRmO09auQkj/ZiP
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84828530
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N9NzlqhGNLRZr61w5N2t2kM2X161bBAKZh0ujC45NGQN5FlHY01je
 htvWTqFMvyOamX3c91yb97j8U8F68XUytFgQAZrqilhQiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QeOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRDAy8IVQGCwNu147SRV+x2n545d5HkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHyfyNZrhSJorAw4EDYzRBr0airO93QEjCPbZUJzhzI+
 zmel4j/Khc4LvjDyxeHzlCHhbD2szj6Q6wCLqLto5aGh3XMnzdOWXX6T2CTrfCnh2akVtlYK
 khS/TAhxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebRwn0
 EWY2ezgAzNHuaeQD3ma89+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznFf18FZWkj5rMGhL26
 S2PtjFkne5Lgptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWN0e+yzMUJVJdPUUOQS9PZNijS5fK8fekJr9iNBjeOC7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJjyUiZGV/0/lGDoF4/xNIPHIQhnmwvuqW3TlUz7gdJymlbJIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHE96BQ5iEEXX8riv+pEILLXYelo/cIzjYteIqY4cl0Vet/w9vo/1E
 ruVASe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:hPv71KumwRaMD36XMnDJhnwK7skDTNV00zEX/kB9WHVpmszxra
 GTdZMgpGfJYVcqKQgdcL+7Scq9qB/nmqKdpLNhWYtKPzOW3ldATrsSj7cKqgeIc0aVm4JgPO
 VbAs9D4bXLfCNHZK3BgDVQfexP/DD+ytHMudvj
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84828530"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 04/15] tools/ocaml/xenstored/Makefile: use ocamldep -sort for linking order
Date: Tue, 8 Nov 2022 15:33:56 +0000
Message-ID: <2acb17a3046dad442ef0e14c84c7aa5930e69e93.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A better solution is being worked on for master,
but for now use ocamldep -sort instead of a manually established link
order.
The manually established link order will be wrong when (security)
patches introduce new dependencies between files that would require
changing the link order.

If dune was used as a build system this wouldn't be a problem, but we
can't use Dune yet due to OSSTest, which is stuck on Debian oldstable.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:

Avoids having to put this patch as a prerequisite into a security update.
Earlier versions of XSA-326 needed this, and although latest version
didn't we don't know whether it might be needed again in the future or not.

Changes since v2:
- new in v3 (was previously emailed to security team though)
---
 tools/ocaml/xenstored/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 6f7333926e..e8aaecf2e6 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -72,7 +72,11 @@ XENSTOREDLIBS = \
 PROGRAMS = oxenstored
 
 oxenstored_LIBS = $(XENSTOREDLIBS)
-oxenstored_OBJS = $(OBJS)
+# use ocamldep to figure out link order, otherwise the Makefile would have
+# to be continously adjusted for security patches that introduce new
+# dependencies between files
+oxenstored_MLSORTED = $(shell $(OCAMLDEP) -sort $(OBJS:=.ml))
+oxenstored_OBJS = $(oxenstored_MLSORTED:.ml=)
 
 OCAML_PROGRAM = oxenstored
 
-- 
2.34.1


