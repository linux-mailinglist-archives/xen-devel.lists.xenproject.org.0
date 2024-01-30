Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09368427AD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673553.1047934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpjK-0005Ru-JV; Tue, 30 Jan 2024 15:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673553.1047934; Tue, 30 Jan 2024 15:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpjK-0005Pg-GV; Tue, 30 Jan 2024 15:08:54 +0000
Received: by outflank-mailman (input) for mailman id 673553;
 Tue, 30 Jan 2024 15:08:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Trk4=JI=citrix.com=prvs=75271d196=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rUpjI-0005Pa-Aw
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:08:52 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7832b688-bf81-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 16:08:50 +0100 (CET)
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
X-Inumbo-ID: 7832b688-bf81-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706627330;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HLMHriK7qQditz7wIGUQwiX09MROSVEgwt/tnEvoGNs=;
  b=IdYtof/yO/czqYmVeJcDBxVxT94Ou1eTBxVUgvN/qviO1ksL8PINnPgs
   nalBfSS2/AZc0+E2Ofm6ikonC9GBzXNX/V2uXeoqJeOlTEI8SylJfe+2a
   mP5POqLclAuH+GaNDoqed0aO5TqvAUIJaVQ3Fictl8kvLEZ0cEAetuI2m
   s=;
X-CSE-ConnectionGUID: HPWD20hBTe24NlJXhTOTnA==
X-CSE-MsgGUID: 1k5kzd2fS120ImIHKwuh9w==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129761972
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:IjC88Kl9mX/XCVkIIK6SOc3o5gzDJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJODz2GP6reNjehKogkao6/8kIBuZTVzdRrHFdor381QSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KmaVA8w5ARkOagS5g6GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dwgFxxXNhCpu+/snJS/aNlsuuMfKuC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzJ+
 Tyfrjujav0cHIWclDmX/iiivbaVxQL+eaIxC6C4p+E/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+bS8mva1TUpwXEqRRc7YVFd4/PfrdtvqBbtftZfN5Kzp4igcd3v+
 AxmvBTSlp1K0pZVifzqrA+b6w9AsKQlWeLc2+k2Yo5GxlkgDGJdT9b0gWU3FN4ZRGpjcnGPv
 WIfh++V5/0UAJeGmUSlGbpVQuz0vKrYbG2N3zaD+qXNERz3pxZPmqgJvllDyLpBaJ5YKVcFn
 meN0e+u2HOjFCTzNvImC25AI88r0bLhBbzYaxwgVfIXOsIZXFberElTibu4gziFfL4EzftuZ
 v92sK+EUR4nNEiQ5GPsH7dAgeJ1mX5WKKG6bcmT8ilLGIG2PBa9IYrp+nPVBgzlxMtoeDnoz
 us=
IronPort-HdrOrdr: A9a23:48OeaK7Bw+FYnrJu5APXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-Talos-CUID: 9a23:SvHkM2xCyd5Y9pN2MeZmBgU0Iv8JKCXd5kvdeROeDURZSIGydVm5rfY=
X-Talos-MUID: 9a23:9Fa4XgTbIlu+4b0+RXS1h2xhJssy7Z/3UhgslLQmmNaZNX1vbmI=
X-IronPort-AV: E=Sophos;i="6.05,707,1701147600"; 
   d="scan'208";a="129761972"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/traps: Annotate {l,c}star_enter() as nocall
Date: Tue, 30 Jan 2024 15:08:39 +0000
Message-ID: <20240130150839.4130909-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... as with other declarations which aren't legal to call from C.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 668605e5bc67..02fdb3637d09 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -333,8 +333,8 @@ static unsigned int write_stub_trampoline(
 
 DEFINE_PER_CPU(struct stubs, stubs);
 
-void lstar_enter(void);
-void cstar_enter(void);
+void nocall lstar_enter(void);
+void nocall cstar_enter(void);
 
 void subarch_percpu_traps_init(void)
 {

base-commit: 4a7e71aa085170f1a13976507c8e248f8715f116
prerequisite-patch-id: 897f8a9f53b9c95c7961be1793b2685c11dc6e50
-- 
2.30.2


