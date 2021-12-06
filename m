Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00B46A1F2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239427.415036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOY-0000CA-Gj; Mon, 06 Dec 2021 17:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239427.415036; Mon, 06 Dec 2021 17:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOY-0008WA-9n; Mon, 06 Dec 2021 17:03:18 +0000
Received: by outflank-mailman (input) for mailman id 239427;
 Mon, 06 Dec 2021 17:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOW-0005ti-8n
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6588a4fd-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:14 +0100 (CET)
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
X-Inumbo-ID: 6588a4fd-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h0c7AVYNaXZXmkfcs0ZxJdS6Ur35AwxyJVtAoKnfTKc=;
  b=LWFF16ct4xVIY6fDCj6QcwdMTo9oDR7dP/MH/+RRviEa7qdK2zDqGtKm
   Bp8soBIxMFRy8FA/53O9ERtDjEzJjk4ErUMIa8vhdCf20XoV1ktluqA1k
   v3pv+WESYs5Xrft8PZXQE5qkHJZZ8zTTKrutKz2ASLc0L5wmVDqDf3wIt
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CUPI3Te5pu8yikiSgt36ZmvPy4SXldVYUlepazbb7qdU9b+0gLED1RSYTYEaCcbZeInv6nsXpl
 L5/QHf3iFQlcO1g/QSx3wyHCUws3X79RfytV5ZAwKXfs8DWaxBwMkhaa+HT1l9200NsoOJE3ky
 GXry/CCnS9s++b+6ESnU3cSQ9qV3OiBa9LtvTbbGkVzSc4Lpb5uge5cvVPI2X9BebpHxI2t5P8
 D+z5fT5eOEY/pMfTM7m+8qegH8TYMgSFEvZ/n2ZfViNqfMH37DT7RaCsLgpxu5RS/KZSDIDO9L
 16ynw3bfaExbj7QBjsxybNmc
X-SBRS: 5.1
X-MesageID: 59323973
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AM8JzagBsNLPyXWlzKBE0n2tX161kRcKZh0ujC45NGQN5FlHY01je
 htvD2qBOqncM2X1KNF3ao7npE8B68LSyNI1SlRsrS8yQykb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1zi56gbh87EpT2u6MYYgsDOTFaEJR/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauPP
 JBCOGU0BPjGSz9sKEU9J5Fvps3ytiXQVxxXmBW1iINitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAB4AM8eE4SGY6X/qjejK9Qv6R4A6BLC+7uRtglCY2ioUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastxgAW91WAqsi5RuE0Kb87AOQB2xCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+qkzGiHjAHAVY4RmgBfBleycnHjbgK20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPtTwsTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF8rlxBGFb5JOi8BQ2Swm8zaK7onhezP
 yfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlTXo3s/OBTKgT+9+KTJrU3ZE
 c3BGSpLJSxFYZmLMRLsH7tNuVPV7n5WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchMClQek2ySYcV7ih7IKQOqHYKuTZEkTZUQEVWtEEVB5CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:Ff8hiK19/q6VXWir7HklWwqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59323973"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 09/57] libs/light: Remove -I.
Date: Mon, 6 Dec 2021 17:01:52 +0000
Message-ID: <20211206170241.13165-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need to include current directory.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 975413ade8..bfd58226ce 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -44,7 +44,6 @@ SRCS-$(CONFIG_X86) += $(ACPI_OBJS:.o=.c)
 
 CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
 	-Wno-declaration-after-statement -Wformat-nonliteral
-CFLAGS += -I.
 
 CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ
 
-- 
Anthony PERARD


