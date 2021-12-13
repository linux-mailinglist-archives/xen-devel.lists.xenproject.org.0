Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA248473345
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 18:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246241.424680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwpZJ-0006Aq-2P; Mon, 13 Dec 2021 17:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246241.424680; Mon, 13 Dec 2021 17:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwpZI-00067h-Ui; Mon, 13 Dec 2021 17:56:56 +0000
Received: by outflank-mailman (input) for mailman id 246241;
 Mon, 13 Dec 2021 17:56:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEuh=Q6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mwpZH-00067b-GH
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 17:56:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c763f82-5c3e-11ec-9e60-abaf8a552007;
 Mon, 13 Dec 2021 18:56:53 +0100 (CET)
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
X-Inumbo-ID: 0c763f82-5c3e-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639418213;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=uPB7YpPoPl4u2EoLy0oDY1Iff5PRc3LeqyzUtxnE1mU=;
  b=Daj0k4bM3/FTQZ0ecSkIDAMlGCqYPEPazddcJmR3ovf51MN0T2aFfQ72
   MqKecQyN2zJYx4PK7FBYot6D52cfgo/orw5+Zog58xY3t8NXAA7zMEwGH
   G198SA0FA/w4UjGXh0g906cK26FJqjEJ4ebi5JGe2qqT5sKTjbPPsHgtT
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KGRUdP2v0oH7P4nMQgfwdFA1S41sBIWHVxMj8DjAfCtxfJRjYlSZOs1sC7awnzdN7DOrH5SEk+
 59U8/kDXRZBa6c/SobQloqS31B60j/xS7Pr4e/gyiEytSO/DnWGtzgjt8cJki3VOYK3YWFAypS
 0ivPodGIlw3w4xwOxrEexzmAjI/dE+IuMGuJMQKAgYuHqv0Y/3CCBReqAdlBHjxyU/X/rgBo2f
 GTm2nqNjFVF3M8l+DOClebYWSwX3+dH9ubqwu0AZJJ1E//sEGjM7yWyKueoqOxnNxNRrbMJaGw
 fsVZX+5IU7DBZfgzzRIRhOfm
X-SBRS: 5.1
X-MesageID: 59855129
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DQdMjqzh9Q2VndxUYot6t+cIwSrEfRIJ4+MujC+fZmUNrF6WrkVWm
 jEfDD2APa6MamrweN4kOoTg8kwDucfVn9NkHAdspSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbdi2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9Nck
 8dxpJqPcyQwLqHAh+cvDAtbDT4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25EeQKuHP
 ZtxhTxHNVPKORwQHAktGakizNuHmmvEUQwAkQfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKg4eHMySz3yC6H3Erv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsvTNHSeZBFdIAyxidxqbL4DTGFGsaUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdfNi2+AswGzARN8wGGxFAbpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmr2qiX4IdANvWElfS+F1/ronhezP
 yfuVf55vscPbBNGk4cpC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk2lFKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4vY+liIq
 IgGaJPRo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7r8aPfVhrHn8PEfjUze9zcoBphf0NxOzJ4
 mu8SglTz1+m3S/LLgCDa3ZCbrLzXMkg8SJnbHJ0ZVv4iWI+ZYuP7bsEc8dld7cQ6+E+n+V/S
 OMIepvcD60XGCjH4TkUcbL0sJdmKEawnQuLMif8OGo/cpdsShbn4NjhegezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeIRy+/pJrJir9iu4MD/sNcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD3QCDH09aGla
 bkHxv3wKqRazlNDso46GLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeaOeAN87SGVIMIBYoM7aY3vYOlziOtfk4LS0WPsOsEGZrhamKAySxtQ==
IronPort-HdrOrdr: A9a23:l8dnBahCtI81lCBzDZ5d8cM80nBQXswji2hC6mlwRA09TySZ//
 rBoB17726StN9/YhEdcLy7VJVoIkmskaKdg7NhXotKNTOO0ADDQb2KhbGSpgEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.88,203,1635220800"; 
   d="scan'208";a="59855129"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libfsimage: Bump SONAME to 4.17
Date: Mon, 13 Dec 2021 17:56:33 +0000
Message-ID: <20211213175633.30448-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Fixes: a5706b80f42e ("Set version to 4.17: rerun autogen.sh")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>

This gets forgotten each release.  Any chance we can move libfsimage and/or
libacpi into libs/, where this issue would go away.
---
 tools/libfsimage/common/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libfsimage/common/Makefile b/tools/libfsimage/common/Makefile
index 24bc90e73e71..54049ebaae86 100644
--- a/tools/libfsimage/common/Makefile
+++ b/tools/libfsimage/common/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
 
-MAJOR = 4.16
+MAJOR = 4.17
 MINOR = 0
 
 LDFLAGS-$(CONFIG_SunOS) = -Wl,-M -Wl,mapfile-SunOS
-- 
2.11.0


