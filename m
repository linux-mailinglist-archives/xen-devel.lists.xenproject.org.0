Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CF046A23F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239450.415126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSI-0005xP-SM; Mon, 06 Dec 2021 17:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239450.415126; Mon, 06 Dec 2021 17:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSI-0005rg-En; Mon, 06 Dec 2021 17:07:10 +0000
Received: by outflank-mailman (input) for mailman id 239450;
 Mon, 06 Dec 2021 17:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOh-0005ta-MC
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d4fd33b-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:26 +0100 (CET)
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
X-Inumbo-ID: 6d4fd33b-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6zpFISsadUpEdibZxGtzCtaH4deu+VADURLBhws2jBc=;
  b=SeHQwDa0XVc4UsQOU/i5z1+hx6LezT6sbrmFJESuc6gQk4IAyNAN53bo
   LFV6ywxXOo7NCAoGYDTSkw13SHDe+Z3wsQw9ge0NHJATs3HdYE+1tvgH+
   RAiJrVfHeMdMfqAyx2CFv49KoFQDUlHmE6yBnVg4LCkfTFu/lZgl5Ctu7
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PcBNEWStTXnPQRTOStgLiSO+Hkw4w2ZGUiqgPSko1EwZGkhTwxQe6XtTMNgvx0tP/m7s8MwshY
 OiV9P7E8pjM3FCO/7WdzjhbSFuvkaIiFeeFe6JGZ16oiQjg/0LBxxKwV0/7q/LV+CTwkYe8XLb
 +I9W9kbIwWKQ31JY540+AFef3ZLiYhiBzHlgMuXlqXM5EcHnF9b7XxtXiGUcs0mx8r/HLyvTh8
 wnILDiLU1+2LDufcFD04FBMNVcPdO1XnDdgvpolmerxkyW4sCGlVWhR7GeW0gXf4VAhAhBoE3I
 nhIWzsygH60kyi8WIwaWM4QL
X-SBRS: 5.1
X-MesageID: 59766356
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gSNHa6kv82GQ8P1r6eCQ3Svo5gxxIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWmCEOPeKZ2WmfowlboXi/EoOvJXTx9JgTQJqqStmFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2NY22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IsWupagcBUIAor3srQ6Ux9UQhtcGpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKeBO
 ZRCNGQHgBLoODdRZwwmDcIEgeK6oFClSxJV63e7uv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7DQsdL8e30iee/zSngeqntSLkWqoCGbug7PlojVaPgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaNuAIcXNxBVfU38giXxoLb5g+YAi4PSTspVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3unPojmiADo0EUg5T38jTQ0JsuPBh7hm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab8P9TwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8R4n9hO0yT6FWy13N2YDB0zWirjUWW2C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvL1/YpnAzPxTOgDCFfK0QfUcXY
 83znSGEVylyNEia5GDuG7d1PUEDmEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVBhUFlQGh3CKfcm1nqBlLMdvSYHq2llpjVQREALpi8yNzCWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:9Lw3I62aXwsciwjlYF5alwqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766356"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 08/57] libs/light: Remove non-existing CFLAGS_libxl.o var
Date: Mon, 6 Dec 2021 17:01:51 +0000
Message-ID: <20211206170241.13165-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This var was originally $(CFLAGS_$*.o), and probably was copied from
the generic %.o:%.c rules.

Nothing sets CFLAGS_libxl.o, so remove it.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 194bc5f268..975413ade8 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -200,7 +200,7 @@ libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
 	touch $@
 
 _libxl.api-for-check: $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
-	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_libxl.o) -c -E $< $(APPEND_CFLAGS) \
+	$(CC) $(CPPFLAGS) $(CFLAGS) -c -E $< $(APPEND_CFLAGS) \
 		-DLIBXL_EXTERNAL_CALLERS_ONLY=LIBXL_EXTERNAL_CALLERS_ONLY \
 		>$@.new
 	mv -f $@.new $@
-- 
Anthony PERARD


