Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435F84D2F2D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 13:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287815.488049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvbq-0006dl-K2; Wed, 09 Mar 2022 12:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287815.488049; Wed, 09 Mar 2022 12:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvbq-0006bB-FF; Wed, 09 Mar 2022 12:40:06 +0000
Received: by outflank-mailman (input) for mailman id 287815;
 Wed, 09 Mar 2022 12:40:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6dl=TU=citrix.com=prvs=060aafcb7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRvbo-0005Bn-NV
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:40:04 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 098d7ac6-9fa6-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:40:03 +0100 (CET)
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
X-Inumbo-ID: 098d7ac6-9fa6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646829603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eg/ifCx2kE6sAtZ1kPwmImh59SmF+XQTuUTtEX5um+U=;
  b=FBIwznuJJzEI2laV2mso3cY5DWyRcx2q2NGRNLvZqsyr5rVOGvkjQwfH
   VZsPHI5zF2b5lk9M6Spc1KoC9cS7o3dqEndxTttG8SLAh7i4Hdx6IDwgu
   SaCByw+OwKH/ARz3UJJq9h13Z0XldTCuBpask+tJagSPKwEUppH1L1InW
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65285147
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p9N2jKvYBkC5g71x9odXgq5tmufnVFFeMUV32f8akzHdYApBsoF/q
 tZmKTjVP/jcajHwL9x2OYXgoU0OvZWHzNJqHVdqqClmEH4Q+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV6
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8xHoSWm88PCyJ/EhNdZYF46K/mHHOW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQyNkSdOkEQUrsRIM8RmN6vlnfvT2RVsGqX+akYwlXuzjUkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S36xCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l0or9uQWyFDA/aT9zS4QKit8mZAEh/
 wrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 23S9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3D94ddO51rXHb5
 RDofvRyCshUU/lhcwTXHI0w8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ2O3P
 xGP41MNuMMNVJdPUUORS9jhYyjN5fK8fekJq9iONoYeCnSPXFTvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQtTfCZhWsyu9ZA/myzqClMOJVzNwsT5mdsJE7GJVYwJyY8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:5vsT0a+8jJIFOwkZr7duk+FRdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNZICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8X6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOqXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6R64aT1eUYpDLS8KoDOCW+sLlUFtwqsHfqWG1VYczNgNnympDs1L9lqq
 iIn/5qBbUI15qYRBDJnfKq4Xir7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPvi3N7N2K0oM3G3am9a/iqrDvFnVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWCb38pouHu
 ViBNzVoK8+SyLSU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7e
 LZNbkArsA5cuYGKaZmQOsRS8q+DWLABRrKLWKJOFziULoKPnrcwqSHkondJNvaC6Dg4KFC5q
 gpCmkoylLaU3ieePGz4A==
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65285147"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/CET: Remove XEN_SHSTK's dependency on EXPERT
Date: Wed, 9 Mar 2022 12:39:35 +0000
Message-ID: <20220309123936.16991-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220309123936.16991-1-andrew.cooper3@citrix.com>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

CET-SS hardware is now available from multiple vendors, and the feature has
downstream users.  Enable it by default.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 83d0f317ecf9..06d6fbc86478 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -117,8 +117,8 @@ config HVM
 	  If unsure, say Y.
 
 config XEN_SHSTK
-	bool "Supervisor Shadow Stacks (EXPERT)"
-	depends on HAS_AS_CET_SS && EXPERT
+	bool "Supervisor Shadow Stacks"
+	depends on HAS_AS_CET_SS
 	default y
 	---help---
 	  Control-flow Enforcement Technology (CET) is a set of features in
-- 
2.11.0


