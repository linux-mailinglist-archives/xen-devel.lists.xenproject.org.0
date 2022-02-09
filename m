Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E674AEF50
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 11:32:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268931.462849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHkGw-0003lc-5Z; Wed, 09 Feb 2022 10:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268931.462849; Wed, 09 Feb 2022 10:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHkGw-0003jq-25; Wed, 09 Feb 2022 10:32:26 +0000
Received: by outflank-mailman (input) for mailman id 268931;
 Wed, 09 Feb 2022 10:32:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3wK=SY=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nHkGu-0003jk-Vx
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 10:32:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9031b94a-8993-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 11:32:23 +0100 (CET)
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
X-Inumbo-ID: 9031b94a-8993-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644402743;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xe48OLJEzVvDgJU/2gVRWOn4OapFjAORQH921im2/PE=;
  b=LStaC+JelHyd8X7/N9slunKxptV8/q8fWxNXZRyn0ne14K4Fsxl+WIwI
   EOYnz//lsHc3yZPEUGPXnWwdUvL5vPkP8nfIOiCX+ZrV99uMlEfafI5ga
   zTrz9hMGOgmQSFggO9iKrN3exzOuuOluhooHQgdpjO2iJ/fAUTcqkB7wV
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lBHmDgiVB1Ieyi7rxBI7plIRkJTU8z29Hv+b959uLL5oxsdI8G7bSH0Y5Mowk7aQkcNTERaAs1
 TTqIJSu6zCtyooT+Pq7Z8kpxUiT9lbDdfi6WeZWsJY/W5IYrlznYAaCwAbexOXU/Zk7sOtxZkW
 Q4Oiqg4cJ0b3cdYULYUUpOB4eXKOVQeFzjC2LE84vbKemFJTsLrdAZVthCL93Ahet7xYxzVFDZ
 CxcBHHZx0848ZAJUXUieuPfDHrz1WBtM97DD0aYimNRPooOD7rYeF0iUtVyRKbe/b8CLYJJwA9
 GPjMjivRH7zE8obp+DrRaTO/
X-SBRS: 5.1
X-MesageID: 63817220
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aQZ1waBnfhMwdRVW//zkw5YqxClBgxIJ4kV8jS/XYbTApG8h1zUFn
 2YaCm/XaaneamH2ft9/b4i/9k8C7JDQy4dmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970UM7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/iCWonfpt7
 8l0tLeycSguN46Rlv0RekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTaOBqi4IGJc3iOIoZt1lrzC3DDOZgSpfGK0nPzYEDjG5v3JoWdRrYT
 8Y8VwowVQTlWUwRYncNDLEQvumUvnaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19nEyVu
 2bH9GTRGQwBOZqUzj/t2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQo26lvDQAfMZpEsY40C6Kw4mJ7R+VLz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4t2uVh6b/PuREDGQ3C94ace51qXHb4
 xA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL/JtwNvGAndB40WirhRdMPS
 BWO0e+2zMUMVEZGkIctO97hYyjU5fSI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyPj+HEDFbLEuhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGNqdFKdg1RfSFgbX00wuQOHtO+zsNdMDlJI5fsLXkJJeSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:d4ESZqvxafFHrw3I/VajAIMq7skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHjJYVcqKRUdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyZygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,355,1635220800"; 
   d="scan'208";a="63817220"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/dom0: Add log for dom0_nodes and dom0_max_vcpus_max conflict
Date: Wed, 9 Feb 2022 10:31:53 +0000
Message-ID: <20220209103153.11391-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is not a bug. The xen cmdline can request both a NUMA restriction
and a vcpu count restriction for Dom0. The node restriction wil always
be respected which might mean either using dom0_max_vcpus <
opt_dom0_max_vcpus_max or using more vCPUs than pCPUs on a node. In
the case where dom0_max_vcpus gets capped at the maximum number of
pCPUs for the number of nodes chosen, it can be useful particularly
for debugging to print a message in the serial log.

Suggested-by: Edwin Torok <edvin.torok@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/dom0_build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index fe24e11b37..e57cc80ef0 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -240,6 +240,11 @@ unsigned int __init dom0_max_vcpus(void)
     if ( max_vcpus > limit )
         max_vcpus = limit;
 
+    if ( max_vcpus < opt_dom0_max_vcpus_max && max_vcpus > opt_dom0_max_vcpus_min )
+        printk(XENLOG_INFO "Dom0 using %d vCPUs conflicts with request to use"
+               " %d node(s), using up to %d vCPUs\n", opt_dom0_max_vcpus_max,
+               dom0_nr_pxms, max_vcpus);
+
     return max_vcpus;
 }
 
-- 
2.11.0


