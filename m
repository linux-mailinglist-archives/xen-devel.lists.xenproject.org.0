Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1017F54B5E8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 18:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349231.575438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o19Jy-000367-HY; Tue, 14 Jun 2022 16:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349231.575438; Tue, 14 Jun 2022 16:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o19Jy-000335-Dd; Tue, 14 Jun 2022 16:23:14 +0000
Received: by outflank-mailman (input) for mailman id 349231;
 Tue, 14 Jun 2022 16:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cShD=WV=citrix.com=prvs=157bf7d09=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o19Jx-0002Ro-4B
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:23:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48cb3387-ebfe-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 18:23:12 +0200 (CEST)
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
X-Inumbo-ID: 48cb3387-ebfe-11ec-a26a-b96bd03d9e80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655223791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LmV86saEUcknXXo+WrjWMC73fwG5cbzc7dPP7bJAl9Q=;
  b=Lb54RinZUkl2Lbl6irlUNla/gAMonL7CCCvKBO7aTjio3bTe370lyVeE
   T/MTRxtjOZuUhz4Yq0SJrW+92DNmemoAtq2PJJeWAcmmoLIi3XInD1GfJ
   Tujzo6fpfJFfKdpgns+OqhtUjKREEZ7NU5eBGQWjcvevFRTIVG6flOrrb
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76142776
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RBt+aap3Aeehknk9NjD7tlQwn1deBmJhZRIvgKrLsJaIsI4StFCzt
 garIBmFOv+MNmHzL94nao/loRwCuZeEyYQxSwM4/yBhEiNE+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvT4
 I+q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBGJbyvLUkQRNkL2J/eoZG/Zz8L1KhmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIwMk2cOUIQZD/7DrobucOGhVPnTwdkqXivqrsazk2D/gVIhe2F3N39JYXRGJQ9clyjj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcJ0WPK218LhtmlL77m4ODBwbU3OrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwAOHx7fQ4g2ZLnMZVTMHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxuUAhYxfFYQbxM4DgpCyNnmg7o9pAzmG4ML/LGOsjHlJd3h6
 2nU8XVk3upJ05JjO7aTpg6e3W/1znTdZktsv1iMADr4hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE/qQQ2d3XZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX3MPYrPtjuVp51lcAM8OgJsdiFBuein7ArLFPXlM2QTRX4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAeLqxMm+eZznEgWnDqLLbiilkjP+efPPxa9FOZaWGZim8hktctoVi2Oq
 4YBXyZLoj0CONDDjt7/qtJLcQhTdCNrWvgbaaV/L4a+H+avI0l5Y9e5/F/rU9ANc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:4MnwQKAUt1QEoqnlHemo55DYdb4zR+YMi2TDsHoBLyC9E/bo8P
 xG+c5w6faaslgssR0b9uxoW5PwI080l6QFhbX5VI3KNGXbUQ2TXeJfBOPZqAEIcBeeygcy78
 ddmvhFZeEZTzBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.91,300,1647316800"; 
   d="scan'208";a="76142776"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/4] build: remove auto.conf prerequisite from compat/xlat.h target
Date: Tue, 14 Jun 2022 17:22:46 +0100
Message-ID: <20220614162248.40278-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614162248.40278-1-anthony.perard@citrix.com>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Now that the command line generating "xlat.h" is check on rebuild, the
header will be regenerated whenever the list of xlat headers changes
due to change in ".config". We don't need to force a regeneration for
every changes in ".config".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 49c75a78f9..0d3e3d66e0 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -101,7 +101,7 @@ cmd_xlat_h = \
 	cat $(filter %.h,$^) >$@.new; \
 	mv -f $@.new $@
 
-$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf FORCE
+$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) FORCE
 	$(call if_changed,xlat_h)
 
 ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
-- 
Anthony PERARD


