Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A569F45DB76
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231242.400121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5a-0007M7-1z; Thu, 25 Nov 2021 13:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231242.400121; Thu, 25 Nov 2021 13:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5Z-0007Fu-S1; Thu, 25 Nov 2021 13:47:01 +0000
Received: by outflank-mailman (input) for mailman id 231242;
 Thu, 25 Nov 2021 13:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzq-00076i-9U
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 549d3f94-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:02 +0100 (CET)
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
X-Inumbo-ID: 549d3f94-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEelbM4UoXbBjdC2Us5bYDimWRQuQticI4pfz6oeico=;
  b=T+gLet/Qmb3dSIIMXRoqQnwYJ5qPh3jKnU4oy7Y9BxZVIRZyxVrHKFEG
   PM5IOl2nzWHelI1uKfyNwTsq78ZvkWGk2VRd0FOS4NISHXbkGl21ELcXw
   AsBNm4h9PU3ERE8rBUjG3hoGoyW9ZqGP3hf1265Nw9uaQD4GaiQqVdnL9
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kiNYlP6ps+EhTS7GpsVFJXAhuryKfxsX4qSmy4o2pLY3E555wgD8SFDp8WNABx430lVnCKm2Zg
 hNvfmhxdcrUSD0kUL6oGwA+xaSStKapOATaDPhj5Z68BeG5ap3OCkTv4JU/cTVAEJ3ySE8H3Vu
 7LncXJ1nhRbX1XxgnF6W6ABAy/0Cv3pngpDrdzpXDSxf3y59z94mEe7L5q+aNGB1pFUKkCkPkI
 HkHsJoWHyEqNOdw/wG5shQQHbqZ1SCZD1WqOcR/eYdqkESxJNaIZlTKvUzjK5Plu3uCTkzw0d4
 RhQOsxltAsYO+MkwqlYUp9aA
X-SBRS: 5.1
X-MesageID: 59006010
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:k+OSXqDvaCnuuxVW/xzkw5YqxClBgxIJ4kV8jS/XYbTApDMkg2ZRx
 mYcXW+GPfjcamqkco0iaNy18kkP7ZbXyt5mQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540087wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/zBWGoIBx5
 dR3rb+CQywIMIfKl+Y4ekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjW9o2JgXRZ4yY
 eIhNBFgawT6ICdAPwYxCLZns76XhUvWJmgwRFW9+vNsvjm7IBZK+LPkKtbSd/SBTN9ZmUver
 WXDl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL7+4AIIERIDx3h+6D/0xPgHYIEQ
 6AJxsYwhe8S+3P7TvT8ZQWbknSvnxA2XdVSNsRvvWlh1ZHoywqeA2EFSBtIZ9onqNI6SFQW6
 7OZoz/6LWcx6ePIEBpx4p/R9GrvYnZNcQfucAddFVNdi+QPtr3fmf4mojxLNKeuxuP4Fjjrq
 9xhhHhv3u5D5SLnOkjSwLwmv95OjsSWJuLWzl+ONo5A0u+eTNT4D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3vKnab2yM0Q81QchJG9GRF5mLJ9443d2DDB0xbpZslcHBP
 Cc/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKDgWfqu8Uza6WbAoLFXv1Hg3PSa4hjmx+GBxwfBXE
 crKKq6EUCdFYZmLORLrHo/xJ5dwnXtgrY4SLLimpymaPU22OCTIFOxbaQTWNYjULsqs+W3oz
 jqWDOPSoz03bQE0SnC/HVc7IQ9YIH4lK4rxrsALJOePLhA/QDMqCuPLwKNncItgxvwHmuDN9
 3C7e0lZ1Fug2iGXdVTUMihuOOH1QJJyjXMnJihwb1ym7GcuPNS056AFepppIbR+rL5/zeR5R
 uUuctmbBqgdUSzO/jkQNMGvrIFreBmxqxiJOi6pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgro73YHme90U0/ZGfVpeR3hoNpwNij8rv4rOMVQex/N8SSXi
 lSNChACqOiT/4JsqIvVhbqJppuCGvdlGhYIBHHS6Lu7OHWI/menxoMcAu+EcSqECTHx8aSmI
 +5U0+v9ILsMm1MT69hwFLNizKQf4drzpuAFklQ4TSuTN1n7WKl9JnSm3NVUsvwfz7BUjgK6R
 0aT94QIIr6OIs7kTAYcKQdNgj5vDh3Idu0+NcgIHXg=
IronPort-HdrOrdr: A9a23:+P3+8q+rq/NMphSs3SRuk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="59006010"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v8 16/47] xen/tools/kconfig: fix build with -Wdeclaration-after-statement
Date: Thu, 25 Nov 2021 13:39:35 +0000
Message-ID: <20211125134006.1076646-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to start building kconfig with HOSTCFLAGS from Config.mk,
it has the flag "-Wdeclaration-after-statement".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/kconfig/confdata.c b/xen/tools/kconfig/confdata.c
index 3569d2dec37c..a69250c91355 100644
--- a/xen/tools/kconfig/confdata.c
+++ b/xen/tools/kconfig/confdata.c
@@ -1237,6 +1237,7 @@ void set_all_choice_values(struct symbol *csym)
 
 bool conf_set_all_new_symbols(enum conf_def_mode mode)
 {
+	bool has_changed = false;
 	struct symbol *sym, *csym;
 	int i, cnt, pby, pty, ptm;	/* pby: probability of bool     = y
 					 * pty: probability of tristate = y
@@ -1283,7 +1284,6 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 			exit( 1 );
 		}
 	}
-	bool has_changed = false;
 
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym) || (sym->flags & SYMBOL_VALID))
-- 
Anthony PERARD


