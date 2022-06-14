Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5754B5E7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 18:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349230.575427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o19Jx-0002ou-93; Tue, 14 Jun 2022 16:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349230.575427; Tue, 14 Jun 2022 16:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o19Jx-0002mj-4D; Tue, 14 Jun 2022 16:23:13 +0000
Received: by outflank-mailman (input) for mailman id 349230;
 Tue, 14 Jun 2022 16:23:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cShD=WV=citrix.com=prvs=157bf7d09=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o19Jv-0002Ro-Ue
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:23:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 474bd579-ebfe-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 18:23:10 +0200 (CEST)
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
X-Inumbo-ID: 474bd579-ebfe-11ec-a26a-b96bd03d9e80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655223790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TqPwIHKluWSn+BpKllnZiPLlU5cGc7TXXVi/MIH8tIg=;
  b=VELFbLG4CJwQcX/iSrn2eH242SE52ZrNVfGX1O3rOKBFeiT1Psljw/zP
   a+A9TmubKE9tF5KPTcoDEYIbrMv+dFF4BCOQ9qreuagx8d+qnFzFYdIRk
   PqdGIhaNzvm5AeNJ0b7PmDU4rpa4XmoaV7rVayt+RV+hGML6mH/eSFu49
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76142775
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:INnBtaqiHdWsiaV2QScEX9XrRT9eBmILZRIvgKrLsJaIsI4StFCzt
 garIBmGb67YZWXye9kka9y3ph4H68fVz4c1SAZl+XsyQShE+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvT4
 I+q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBGJbyvLUkQRNkL2J/eoZG/Zz8L1KhmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIwMk2cOUIQZz/7DrpvzOyPvEDZVwF58kjKiKs25GXO6k9+he2F3N39JYXRGJQ9clyjj
 mDb+2X0BDkKOdrZziCKmlq3nfPGly7/XIMUFZW7++RsjVnVwXYcYDUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwCuA0LbO6gCVQE0NVCdcaccOvdUzAzct0
 zehndnkGDhuu729Um+G+/GfqjbaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OIiOsPmkICP6/
 wzJrW8Vh7AwtsAhyYzuqDgrnAmQSoj1oh8dv1uKAzj8sVknOOZJdKTztwGFsK8owJKxCwDY4
 SNaw5X2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ldzBO
 ha7Vft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlLapX0zPxHNhT+1+KTJrU3YE
 cbzTCpRJSxCVfQPIMSeHI/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+V292
 48Ga6OilkQEOMWjM3a/zGLmBQ1TRZTNLcuu+5I/my/qClcOJVzN/NeKnet9I9U8xPQK/goKl
 1nkMnJlJJPErSWvAW23hrpLNNsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:eqfz2qvCXlfNHosKaMPgXT1E7skDctV00zEX/kB9WHVpm6uj5q
 aTdZUgpHjJYVMqMk3I9urvBEDtexzhHP1OkOss1NWZLW3bUQKTRekP0WKF+UyCJ8SXzIVgPM
 xbEpSWZueRMbErt6vHCEvRKadE/OW6
X-IronPort-AV: E=Sophos;i="5.91,300,1647316800"; 
   d="scan'208";a="76142775"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v2 1/4] build,include: rework shell script for headers++.chk
Date: Tue, 14 Jun 2022 17:22:45 +0100
Message-ID: <20220614162248.40278-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614162248.40278-1-anthony.perard@citrix.com>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The command line generated for headers++.chk by make is quite long,
and in some environment it is too long. This issue have been seen in
Yocto build environment.

Error messages:
    make[9]: execvp: /bin/sh: Argument list too long
    make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127

Rework so that we do the foreach loop in shell rather that make to
reduce the command line size by a lot. We also need a way to get
headers prerequisite for some public headers so we use a switch "case"
in shell to be able to do some simple pattern matching. Variables
alone in POSIX shell don't allow to work with associative array or
variables with "/".

Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---

Notes:
    v2:
    - fix typo in commit message
    - fix out-of-tree build
    
    v1:
    - was sent as a reply to v1 of the series

 xen/include/Makefile | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 6d9bcc19b0..49c75a78f9 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -158,13 +158,22 @@ define cmd_headerscxx_chk
 	    touch $@.new;                                                     \
 	    exit 0;                                                           \
 	fi;                                                                   \
-	$(foreach i, $(filter %.h,$^),                                        \
-	    echo "#include "\"$(i)\"                                          \
+	get_prereq() {                                                        \
+	    case $$1 in                                                       \
+	    $(foreach i, $(filter %.h,$^),                                    \
+	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
+		$(i)$(close)                                                  \
+		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
+			-include c$(j))";;))                                  \
+	    esac;                                                             \
+	};                                                                    \
+	for i in $(filter %.h,$^); do                                         \
+	    echo "#include "\"$$i\"                                           \
 	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
 	      -include stdint.h -include $(srcdir)/public/xen.h               \
-	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) \
+	      `get_prereq $$i`                                                \
 	      -S -o /dev/null -                                               \
-	    || exit $$?; echo $(i) >> $@.new;) \
+	    || exit $$?; echo $$i >> $@.new; done;                            \
 	mv $@.new $@
 endef
 
-- 
Anthony PERARD


