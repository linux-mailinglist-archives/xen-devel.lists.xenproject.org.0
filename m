Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DD46A276
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239535.415520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHU5-0000Pi-RT; Mon, 06 Dec 2021 17:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239535.415520; Mon, 06 Dec 2021 17:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHU4-00009C-HG; Mon, 06 Dec 2021 17:09:00 +0000
Received: by outflank-mailman (input) for mailman id 239535;
 Mon, 06 Dec 2021 17:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPp-0005ti-GG
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96699ceb-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:36 +0100 (CET)
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
X-Inumbo-ID: 96699ceb-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zPznA+ybTAJl3D8zcQnhTs5UDGVeYxfDltfmGygnLGQ=;
  b=STIgGQTNlh9jB0/IGPm8JuavQoMZ/tfLLm998++yJRPOYM5rsWUUqf3k
   m/MOplJNeY0OGxD9GZTCnatGeOwfE3RhSg9Sjj0laJX0RuTH4QZgQasNp
   poLuEFAf2juiEYddGz6xHvdwV4+Eh/jY56nclM2cN4cr9HYII0sPcsSiX
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gZwrIIIs3fLrpeQ+GGmDbXU+P58vuCi5Hayev4yJSne9H5ciXanMGjY0fP3svhoj80aZfncUS2
 WCBeQCInyhrPO8+SJKNNSG0P0FIhMMxYHyXzjocvEyOpvqbV9Mgin3kKEhhoZZf9gHUNNBXlpO
 /TYODsuZhpcdc3Bq3h27Zt6FM7+f48BW2C8g9TLFteRjHfOCvX9XmpIhkloprMQK21Y6YuPTqU
 z4SdBaN6pURXCI1svNLy4X6oPeHR200PIvc19ZBQmcRgCyl+h2Dh/62EWcBmWz4Tvxh4JgNIR5
 3dep41H4LxF6zQ+SvphuvSX+
X-SBRS: 5.1
X-MesageID: 59388028
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dn+4VqLhcPaplsttFE+RN5IlxSXFcZb7ZxGr2PjKsXjdYENS12MGz
 zAdDGHQaaqJamHyeN92Odiy9EIAv5eGy9NiTAJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eg7xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3OsOtew
 9IWj6aiEyUtFK+Px9QRDStXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gph3ZAeRayOD
 yYfQSpUaUuZWx9LBls0MpYavNuGhnXteSIN/Tp5ooJoujOOnWSdyoPFMcXXUsyHQ91PmUSVr
 X6A+H72ajkFMPSPxDzD9Wij7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9tZN
 0wT/DtotaUo/VanZtb4Vhy85nWDu3Yht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIO8+ANajctj
 WWzjYnLARZt8+KlRSyv+eLBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Qmf22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUMjleM+lGrxl8FSVCxCtame0bblHRcZJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEsM93rWplwl/a/RbwJs8w4iPIUOPCdkyfdo0lTibO4hTixwCDAb4lhU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI6Qjx8UKGInut6E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:UVriIqyDW1TiTI9jG0rwKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59388028"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 50/57] tools/Rules.mk: Cleanup %.pc rules
Date: Mon, 6 Dec 2021 17:02:33 +0000
Message-ID: <20211206170241.13165-51-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

PKG_CONFIG_VARS isn't used anymore.
For "local" pkg-config file, we only have one headers directory now,
"tools/include", so there is no need to specify it twice. So remove
$(CFLAGS_xeninclude) from "Cflags:".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Rules.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 0d3febfbb6..47424935ba 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -184,12 +184,11 @@ $(PKG_CONFIG_DIR)/%.pc: Makefile $(XEN_ROOT)/tools/Rules.mk $(PKG_CONFIG_DIR)
 	echo "prefix=$(PKG_CONFIG_PREFIX)"; \
 	echo "includedir=$(PKG_CONFIG_INCDIR)"; \
 	echo "libdir=$(PKG_CONFIG_LIBDIR)"; \
-	$(foreach var,$(PKG_CONFIG_VARS),echo $(var);) \
 	echo ""; \
 	echo "Name: $(PKG_CONFIG_NAME)"; \
 	echo "Description: $(PKG_CONFIG_DESC)"; \
 	echo "Version: $(PKG_CONFIG_VERSION)"; \
-	echo "Cflags: -I\$${includedir} $(CFLAGS_xeninclude)"; \
+	echo "Cflags: -I\$${includedir}"; \
 	echo "Libs: -L\$${libdir} $(PKG_CONFIG_USELIBS) -l$(PKG_CONFIG_LIB)"; \
 	echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)"; \
 	echo "Requires.private: $(PKG_CONFIG_REQPRIV)"; \
@@ -200,7 +199,6 @@ $(PKG_CONFIG_DIR)/%.pc: Makefile $(XEN_ROOT)/tools/Rules.mk $(PKG_CONFIG_DIR)
 	echo "prefix=$(PKG_CONFIG_PREFIX)"; \
 	echo "includedir=$(PKG_CONFIG_INCDIR)"; \
 	echo "libdir=$(PKG_CONFIG_LIBDIR)"; \
-	$(foreach var,$(PKG_CONFIG_VARS),echo $(var);) \
 	echo ""; \
 	echo "Name: $(PKG_CONFIG_NAME)"; \
 	echo "Description: $(PKG_CONFIG_DESC)"; \
-- 
Anthony PERARD


