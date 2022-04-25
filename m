Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958050E7CB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 20:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313226.530720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj38L-0000nC-3X; Mon, 25 Apr 2022 18:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313226.530720; Mon, 25 Apr 2022 18:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj38L-0000l3-0A; Mon, 25 Apr 2022 18:08:25 +0000
Received: by outflank-mailman (input) for mailman id 313226;
 Mon, 25 Apr 2022 18:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eo9G=VD=citrix.com=prvs=107e1699f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nj38J-0000kx-Uy
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 18:08:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0afe9ad-c4c2-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 20:08:22 +0200 (CEST)
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
X-Inumbo-ID: b0afe9ad-c4c2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650910101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tbWrgfjjL76MDqACwCF7hzNlTtB6RXM7lo0C1GDYeNM=;
  b=EdNUhXykgiazlmQEfNwIDzSpxBzi4W8leZujx+LmkkKeuNoYCOgAvL7h
   FN44zmDx3NDID914koycCeJJ4yIymUiVvUujTfx87dHICmvzXCiRj3WOh
   af6YqHs4I0KucadIVG03IjklncAHI/4Eg9keuq3RioBtgf0ifZkjW/Up0
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69761879
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W4Lu5aln1A9UgjP5ZA5VsNHo5gxSJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWX2HSM/fZZmDzeI8lYd7j901SuJWBx4I2TlE6+Sg2RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYdhslboDigvwnCxxSEy9FAKlN4aeEGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHOGUxNUSfMnWjPH8pIrNkxbqwhEC4egdopUy5mLoJuC/cmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntTz/cJIfEvu/7PECqF+Owm0eDjUGWF39puO24maccd9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQqu8M7SiYj/
 kOYlNPuQzp0ufuaTmz13ruMtjazJSg9JHcPfzMZVhAC58T/oYY1lVTESdMLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1W/bj2KBiILRdFYw7AXZZV+h5RphJ7fwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJNLKigbArLWdrGR2CgmbKggjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG82jkEn+ieDPOSTLIVvgDLdoRrpghE9jiF+Lm
 +uzyuPQk0kPOAEASnS/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBmDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3LE9naMsE
 6lZKq1twJ1nE1z6xtjUVrGlxKQKSfhhrVvm0/aNCNTnQ6Ndeg==
IronPort-HdrOrdr: A9a23:Q60ka65cJJIcj/OCSgPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.90,289,1643691600"; 
   d="scan'208";a="69761879"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, "George
 Dunlap" <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH] xsm/flask: Fix build with Clang 13
Date: Mon, 25 Apr 2022 19:07:56 +0100
Message-ID: <20220425180756.29738-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Clang 13 chokes with:

  In file included from xsm/flask/flask_op.c:780:
  xsm/flask/flask_op.c:698:33: error: passing 4-byte aligned argument to
  8-byte aligned parameter 1 of 'flask_ocontext_add' may result in an
  unaligned pointer access [-Werror,-Walign-mismatch]
          rv = flask_ocontext_add(&op.u.ocontext);
                                  ^

and the same for flask_ocontext_del().  It isn't a problem in practice,
because the union always starts 8 bytes into {xen,compat}_flask_op_t, but the
diagnostic is based on type alignment alone.

struct xen_flask_ocontext has the same layout between native and compat, but
does change alignment because of uint64_t, and there is only a native
implementation of flask_ocontext_add().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

Slightly RFC because there don't appear to be any good options here.
---
 xen/include/public/xsm/flask_op.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/xsm/flask_op.h b/xen/include/public/xsm/flask_op.h
index b41dd6dac894..80dc35122320 100644
--- a/xen/include/public/xsm/flask_op.h
+++ b/xen/include/public/xsm/flask_op.h
@@ -146,7 +146,7 @@ struct xen_flask_ocontext {
     uint32_t ocon;
     uint32_t sid;
     uint64_t low, high;
-};
+} __attribute__((__aligned__(8)));
 typedef struct xen_flask_ocontext xen_flask_ocontext_t;
 
 struct xen_flask_peersid {
-- 
2.11.0


