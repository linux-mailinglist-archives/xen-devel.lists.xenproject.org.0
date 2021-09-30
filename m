Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68141DEB3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 18:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200088.354487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVykg-0000dA-CJ; Thu, 30 Sep 2021 16:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200088.354487; Thu, 30 Sep 2021 16:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVykg-0000ai-82; Thu, 30 Sep 2021 16:17:42 +0000
Received: by outflank-mailman (input) for mailman id 200088;
 Thu, 30 Sep 2021 16:17:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o/Z=OU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mVyke-0000ZS-BF
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 16:17:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42b9bd05-d711-476c-8568-50f406b3dec7;
 Thu, 30 Sep 2021 16:17:39 +0000 (UTC)
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
X-Inumbo-ID: 42b9bd05-d711-476c-8568-50f406b3dec7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633018659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eutcveOxLfIyiRm0KCSSaQX2O4MlKKNJAO3ZP0okZ28=;
  b=NqoCNh4qYnef+e9X5665iNazUfaL1aeXpUj+FKzwJypCSknw9SCJoVD3
   /IaoOjstZClLhk3aWe6Y7gpzRp2X30BoOjbpskDyZO+y2T2h6JcY3WeAw
   xvGBsCQL70+biPlVcfxwoQz4qHcPk1gz4kEwMJgXPohWJ7i9SuWyZI/XH
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: X+cj+Z3bTgHRg7kDsy/+WpD2LrTvAvHDWe4FteYjwFgBL3gP0NYOY4OL9BEXD5OBiqSmCGmqLy
 d3a5BFIm//WXMRHZPeLTj3tVQN75LqPlXuW3JYluMO/FcLnjptqmKIRhp49aGMTZpA3a5W3dzU
 Uz1xAxhVfW7yUgDemqICZjgruRUf3J68qho91LO3cLN5TzZhEdYzr0mk7QYgqVspjYm8mkp2Sf
 XDC7BR08PV92dipxzQOgmch7NU/aVnwWae/IxSdIWRm1M+P5zIwux4/B5ZlkSb4zToHKdpyc+z
 qc+bfA/4oZRGdy8wJ4YpcfRT
X-SBRS: 5.1
X-MesageID: 54035975
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7LviV60iT+wqH/jMdvbD5Q92kn2cJEfYwER7XKvMYLTBsI5bpzRVz
 jceDGDTP/qJNGb2foxzPNjl9R5UsZ7UyIMxTlNrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywLZh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhn8947
 IxmuISJWR4YMLD1vfsTYShcHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t2pgVQKeBO
 qL1bxJkcx/JSRdXOG0ZVsoMo+eypUnzLwNx/Qf9Sa0fvDGIkV0ZPKLWGNHcYNCNSO1el1yUo
 W+A9GP8ajkTMsCfzjyUtGqhnObVkQv0XYsTEPuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT84xmQIjEvQyZ4eMUXutIPYCMk5
 G6NkIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+t9q0UOWJjp3OOvl1oSqRWGYL
 yWi9nBWulkFsSIcO0xXF3jphCiw7rzAUwI4/AneWm/NAuhRP9X+P93ABbQ29599wGelorup4
 CVsdyu2trlm4XSxeMqlG75l8FaBvavtDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0Kvs4PZCr6MfEmPOpd7vjGK4C7TrwJsdiOM7JzjmVZLlfbrEmCm2bKt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8ris8JEIKr7ffFA2cIzjYteIqY4cl0Vet/w9vo/1E
 ruVBie0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:TsnFiaEZqYqCwiE/pLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 eTdZUgpGbJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQts5
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.85,336,1624334400"; 
   d="scan'208";a="54035975"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Doug
 Goldstein" <cardoe@cardoe.com>
Subject: [XEN PATCH 1/2] automation: switch GitLab x86 smoke test to use PV 64bit binary
Date: Thu, 30 Sep 2021 17:17:19 +0100
Message-ID: <20210930161720.825098-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930161720.825098-1-anthony.perard@citrix.com>
References: <20210930161720.825098-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

Xen is now built without CONFIG_PV32 by default and thus test jobs
"qemu-smoke-x86-64-gcc" and "qemu-smoke-x86-64-clang" fails because
they are using XTF's "test-pv32pae-example" which is an hello word
32bit PV guest.

As we are looking for whether Xen boot or not with a quick smoke test,
we will use "test-pv64-example" instead, which is a hello word 64bit
PV guest.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
---
 automation/scripts/qemu-smoke-x86-64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 09152e3e9ca1..4b176c508dec 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -16,7 +16,7 @@ cd xtf && make -j$(nproc) && cd -
 
 case $variant in
     pvh) k=test-hvm32pae-example extra="dom0-iommu=none dom0=pvh" ;;
-    *)   k=test-pv32pae-example  extra= ;;
+    *)   k=test-pv64-example     extra= ;;
 esac
 
 rm -f smoke.serial
-- 
Anthony PERARD


